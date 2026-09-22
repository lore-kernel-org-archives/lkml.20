Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8AA347FEC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790038967; cv=none; b=q5S+dg8e7xv8aPoy/d28PMA5Dnabt2J/k8OW8j47ZvO8/H2qJtDwbGXvF+ycKHl6YcNrnBqKdOqqlVFe8f49V+6wnR8svNh0nw9n3/d8Db9xhJJw9HSj9oSxSOyTlPttcoC6OWKrhMbXTGhPSOlYpNlDA2t2BpoUATMeXzpInUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790038967; c=relaxed/simple;
	bh=cnw9qZpor/7zZzj0V9JEndp8DkRNdwwQ1PREcQig9B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4S9iG5+MRo6dUXiYoalb7mXdsfVnGS9S9VvfwCWXrUojMG1VO7SWhGVFLTERxict+B5p0bI6b0TbyNgysSdIETjDYjnaspIRABb3hCuIHw+D9FrwvjuC+bG1ed5fzjO3ouwDddnLToI/RabAN1w9Wj+siq6TN6hgUL8KNAxos4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RP3klCGB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RP3klCGB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59524C2BCF6;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790038967;
	bh=cnw9qZpor/7zZzj0V9JEndp8DkRNdwwQ1PREcQig9B8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RP3klCGBuObKKK08w52od4217wpFsbNieucADuk9mqSIcLIYxVXga6a+uwjxwt+Hc
	 jsZCad2hAUgU3M/uVF7IxblG4QXPKhFedmYH8lkOTe8dz+NkUqi9sf7zOejnrq3KES
	 LPzoh8z5nNtL7QIyO0uHDgyKOZK75CKnKSnNyaOKTx4LuGPrIlPLVa1tCNF4Mw18hb
	 t9cszBC1vryGf02yUesggbRGQFetKaisMggzf6m9g2zMYa+/+sN6qzHurhhueNAw0H
	 21HCX6sZMPvaJTMmSYwcdaZLZUgA/WMLz/5IjuVjlmq2BtYwNJ8R2SMSGqyOY86bvd
	 9CqcBcgUrpd3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFF0C982F0;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 21:02:33 -0400
Subject: [PATCH 1/2] soc: xilinx: zynqmp_power: do not use rx_chan before
 probe has stored it
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-zynqmp-power-v1-1-de6f2eee3f23@vt.edu>
References: <20260921-mb-zynqmp-power-v1-0-de6f2eee3f23@vt.edu>
In-Reply-To: <20260921-mb-zynqmp-power-v1-0-de6f2eee3f23@vt.edu>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790038966; l=4268;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=Uq14lWjsscKy07/WiWvu53h0xObDxYzSms9WSrON0K4=;
 b=oYHE40hIKuPZQqZXEOlkwx7RCo9QIaijyVmlcR30Ub57Iv8n+Z9MdwOJKE+GDkQGvDCTrcIVL
 q6JQFO18T2rBajNL8x99Wk/05mFwfyJVNwhXs3dW9jLZ3s1josb1690
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
Reply-To: jaidevshastri@vt.edu

From: Jaidev Shastri <jaidevshastri@vt.edu>

zynqmp_pm_probe() installs the rx callback and then requests the channel:

	client->rx_callback = ipi_receive_callback;
	rx_chan = mbox_request_channel_byname(client, "rx");

mbox_request_channel() starts the channel before it returns and the
ZynqMP IPI controller enables the remote interrupt in its startup
callback. A message the firmware already has pending is delivered at
that point, so ipi_receive_callback() runs before the return value has
been stored. It acks with rx_chan still NULL, mbox_send_message()
returns -EINVAL and the IPI is never acknowledged. The mailbox API gives
the callback no way to reach the channel from its struct mbox_client.

Store the channel under a spinlock shared with the callback and let the
callback record a pending ack when it runs before the channel is
published. Probe sends that ack once rx_chan is visible.

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 drivers/soc/xilinx/zynqmp_power.c | 48 +++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index 54c796afb..a7c1befc5 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -51,6 +51,9 @@ struct zynqmp_pm_event_info {
 
 static struct zynqmp_pm_work_struct *zynqmp_pm_init_suspend_work, *zynqmp_pm_init_restart_work;
 static struct mbox_chan *rx_chan;
+/* Serialises rx_chan and rx_ack_pending between probe and the rx callback. */
+static DEFINE_SPINLOCK(rx_chan_lock);
+static bool rx_ack_pending;
 
 enum pm_suspend_mode {
 	PM_SUSPEND_MODE_FIRST = 0,
@@ -128,6 +131,7 @@ static void ipi_receive_callback(struct mbox_client *cl, void *data)
 {
 	struct zynqmp_ipi_message *msg = (struct zynqmp_ipi_message *)data;
 	u32 payload[CB_PAYLOAD_SIZE];
+	unsigned long flags;
 	int ret;
 
 	memcpy(payload, msg->data, sizeof(msg->len));
@@ -143,10 +147,21 @@ static void ipi_receive_callback(struct mbox_client *cl, void *data)
 		queue_work(system_dfl_wq,
 			   &zynqmp_pm_init_suspend_work->callback_work);
 
-		/* Send NULL message to mbox controller to ack the message */
-		ret = mbox_send_message(rx_chan, NULL);
-		if (ret)
-			pr_err("IPI ack failed. Error %d\n", ret);
+		/*
+		 * Send NULL message to mbox controller to ack the message. The
+		 * mailbox core can deliver as soon as the channel is started,
+		 * before mbox_request_channel_byname() has returned the channel
+		 * to probe; in that case leave the ack to probe.
+		 */
+		spin_lock_irqsave(&rx_chan_lock, flags);
+		if (rx_chan) {
+			ret = mbox_send_message(rx_chan, NULL);
+			if (ret)
+				pr_err("IPI ack failed. Error %d\n", ret);
+		} else {
+			rx_ack_pending = true;
+		}
+		spin_unlock_irqrestore(&rx_chan_lock, flags);
 	}
 }
 
@@ -287,6 +302,8 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 	int ret, irq;
 	u32 pm_api_version, pm_family_code, node_id;
 	struct mbox_client *client;
+	struct mbox_chan *chan;
+	bool ack_pending;
 
 	ret = zynqmp_pm_get_api_version(&pm_api_version);
 	if (ret)
@@ -353,10 +370,27 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 		client->dev = &pdev->dev;
 		client->rx_callback = ipi_receive_callback;
 
-		rx_chan = mbox_request_channel_byname(client, "rx");
-		if (IS_ERR(rx_chan)) {
+		chan = mbox_request_channel_byname(client, "rx");
+		if (IS_ERR(chan)) {
 			dev_err(&pdev->dev, "Failed to request rx channel\n");
-			return PTR_ERR(rx_chan);
+			return PTR_ERR(chan);
+		}
+
+		/*
+		 * The channel is live from the moment the mailbox core started
+		 * it. Publish it to the rx callback and ack any message that
+		 * arrived before this point.
+		 */
+		spin_lock_irq(&rx_chan_lock);
+		rx_chan = chan;
+		ack_pending = rx_ack_pending;
+		rx_ack_pending = false;
+		spin_unlock_irq(&rx_chan_lock);
+
+		if (ack_pending) {
+			ret = mbox_send_message(chan, NULL);
+			if (ret)
+				dev_err(&pdev->dev, "IPI ack failed. Error %d\n", ret);
 		}
 	} else if (of_property_present(pdev->dev.of_node, "interrupts")) {
 		irq = platform_get_irq(pdev, 0);

-- 
2.43.0


