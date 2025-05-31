https://github.com/manish12323423546/influencerflow-automate-campaigns.git
 "supabase": {
      "command": "npx",
      "args": [
        "-y",
        "@supabase/mcp-server-supabase@latest",
        "--access-token",
        "sbp_997e09a8c6c6a31c85c1b915ddf6ad696967ce06"
      ]
    }
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



To integrate a website (built with React) with an n8n workflow so that user input from the website is sent to n8n, processed, and then the results are returned to the website, you can follow these steps:

## 1. **Design the n8n Workflow**

- **Trigger Node:** Use a Webhook or HTTP Request node as the entry point for your workflow. This will allow external systems (like your React app) to send data to n8n[1][3].
- **Processing Nodes:** Add nodes to process the input as needed (e.g., call external APIs, use AI agents, etc.)[4][5].
- **Output Node:** End your workflow with an HTTP Request node (to call back to your website) or another Webhook node if you want to push results, but for most React integrations, you’ll return results as the response to the original webhook call.

## 2. **Expose the n8n Workflow to the Web**

- **Webhook Trigger:** In n8n, set up a Webhook node as the trigger. This will generate a unique URL that your React app can POST to.
- **Self-Hosted or Cloud:** You can self-host n8n or use n8n.cloud. Make sure the webhook URL is accessible from your React app’s domain[3].

## 3. **React App Integration**

- **Frontend Form:** Create a form in React to collect user input.
- **Submit Handler:** When the user submits the form, use the `fetch` API or `axios` to send a POST request to the n8n webhook URL, including the user’s input as the request body.
    ```javascript
    async function handleSubmit(userInput) {
      const response = await fetch('https://your-n8n-instance/webhook/your-workflow', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ query: userInput })
      });
      const result = await response.json();
      // Use the result in your React app
    }
    ```
- **Handle Response:** Use the response from n8n (the processed result) in your React app, for example, by displaying it to the user.

## 4. **n8n Workflow Output**

- **Return Data:** Make sure the last node in your n8n workflow returns a response (e.g., through the Webhook node’s “Respond to Webhook” option). This will be the response your React app receives[6][8].
- **Data Format:** Ensure the output is in a format your React app can parse (usually JSON).

## 5. **Optional: Advanced Integration**

- **Workflow as a Tool:** If you are using n8n’s AI Agent features, you can call another workflow as a tool, but for React integration, the direct webhook approach is simplest[2][5].
- **Passing Variables:** If you need to pass data between workflows or from the agent to a tool, use the “Edit Fields” node or set up the workflow to expect the correct input fields[2][8].

## Summary Table

| Step                | React App Action                 | n8n Workflow Action                  |
|---------------------|----------------------------------|--------------------------------------|
| User Input          | Collect form data                | -                                    |
| Send to n8n         | POST to n8n webhook              | Webhook node receives data           |
| Process Data        | -                                | Process input, call APIs, etc.       |
| Return Result       | Receive JSON response            | Webhook node returns processed data  |
| Display Result      | Use result in UI                 | -                                    |

## Example Flow

1. **User submits form in React app.**
2. **React app sends data to n8n webhook.**
3. **n8n workflow processes data.**
4. **n8n returns result as JSON.**
5. **React app displays result to user.**

This approach is flexible and works for most use cases where you want to automate backend logic with n8n and integrate it seamlessly with your React frontend[3][6].

Citations:
[1] https://docs.n8n.io/advanced-ai/intro-tutorial/
[2] https://www.youtube.com/watch?v=mjiSY3LZggc
[3] https://www.reddit.com/r/n8n/comments/1fjpcp1/how_to_integrate_a_selfhosted_n8n_with_my_current/
[4] https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.agent/react-agent/
[5] https://www.youtube.com/watch?v=lSwMtsm6oDU
[6] https://community.n8n.io/t/get-output-from-execute-workflow/40460
[7] https://www.youtube.com/watch?v=_EdRzDY9nh4
[8] https://www.youtube.com/watch?v=olv5yujTZuk
[9] https://community.n8n.io/t/input-data-from-other-nodes-into-execute-workflow-not-just-the-adjacent-node/30130
[10] https://community.n8n.io/t/how-to-trigger-manually-a-workflow-to-get-sample-data/24108
[11] https://community.n8n.io/t/getting-ai-agent-to-send-data-to-a-workflow-tool/42078

---
Answer from Perplexity: pplx.ai/share
