Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8DC3B2D1D;
	Sun,  4 Oct 2026 03:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791085273; cv=none; b=obftim4AtOKAuYO2zAa5JGoalG2mrSNqXzhoRqNK1LwRBhtXA99ckE2igY2E1Go91xwdobAgkMMk+Mff2cpsEBbp3dQj4aSWXVvTPKvo6darkYSNieFNRO5AiMn6962+0NEf3ZBg4RfBX9u2IsRoi1pX2ys4uNKEwa69G55yv1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791085273; c=relaxed/simple;
	bh=inqAs95VIiHJ5WXVRJpphZJxiaRo1FRbN1MrR8O/Qmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mRMTejIzIQfhd1Sg7uEnj3jLa0Argvs0k0Qq8dyBbjSYACS4HE+DZK0lqhjOn3acw3SxXr75g2Hot+oOKYJhHr+RT7+Yf9TBUn1xMRnBS4O9KkS8itCsmN/2eJKW0i7GSe8zHgx+YFmssuYla0wq6QqwiUcyEDaI+TlaR835DxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rt97WhuO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rt97WhuO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A39DC4AF62;
	Sun,  4 Oct 2026 03:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791085273;
	bh=inqAs95VIiHJ5WXVRJpphZJxiaRo1FRbN1MrR8O/Qmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rt97WhuOo92jF7UFQoR/4tOLNeDMaSPLHlNmgRkeZQVVn7PhU1SjzMFGE7nXvf7rJ
	 QZO3aOBAZducwb6ko8hpA8kd27du6tysmCYtUH13tuq8GQKRTWThX8u88q9qqKHv8E
	 GmZP4tNC+DHTVS4jVnWnXO8yiM1XwIP4ShCjpwi6J4XesVjBkOyyizHAGGNWeyiHAJ
	 zqpTxu7aNfkr8wwOhCyyeocK5Y3c5M4/RcP+aoJ6yOrblEOe9pZaNh+VnsU7Q5/NbB
	 g42iTVzhI4EzqCKMjGRIEmzp198dYt0YuypNZToZSr8MvkYn/XXJqtjOszrMUYMuyy
	 Fkobb1+cDOLHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A54CA5FF1;
	Sun,  4 Oct 2026 03:41:13 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sun, 04 Oct 2026 03:41:01 +0000
Subject: [PATCH v2 3/3] usb: typec: tcpci_maxim: implement
 get_current_limit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-max77759-icl-typec-v2-3-866caf9e7d9a@google.com>
References: <20261004-max77759-icl-typec-v2-0-866caf9e7d9a@google.com>
In-Reply-To: <20261004-max77759-icl-typec-v2-0-866caf9e7d9a@google.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791085272; l=2320;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=yMUi/gUZfH42/zMSQVOA/fWV4tfGMcFNCeY/cfMzQYo=;
 b=UGFcTCDafrY65XWH2jvhhFQPU0Lvgum1krcDP5N7we1X1s40tn2q4kqj7W8DWCZvljfx51m1v
 9bcyBVU5xafDcWPjDUtyO6jNkBrdUe8u6uvdw9kFm3ym+oHIBzCvzDS
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com

From: Amit Sunil Dhamne <amitsd@google.com>

Implement tcpci_data::get_current_limit for tcpci_maxim driver to report
a value of 500 mA unconditionally. This is the max current a configured
USB 2.0 device may draw per the USB Type-C Cable and Connector
Specification r2.2, Sec. 4.6.2.1. This helps set a current limit and
thus enable charging for the cases when a port is connected to a non-PD
Type-C port partner advertising Rp-def. This is until a mechanism for
USB core to communicate the current limit to the TCPC driver is
implemented.

Assisted-by: LLM
Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 998693a61839..e6f825931ba0 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -482,6 +482,20 @@ static bool max_tcpci_attempt_vconn_swap_discovery(struct tcpci *tcpci, struct t
 	return true;
 }
 
+/*
+ * This callback is used by the TCPM to determine the current limit to set when
+ * Rp-def is advertised on the CC pins. The actual current limit comes from
+ * other subsystems such as the USB gadget/host stack (USB 2.0/USB 3.2) and
+ * BC1.2. As a workaround, report the USB 2.0 current limit of 500 mA to enable
+ * charging when the device is connected to a non-PD source advertising Rp-def.
+ * This can be removed once a mechanism for the USB core to communicate the
+ * current limit to this driver is implemented.
+ */
+static int max_tcpci_get_current_limit(struct tcpci *tcpci, struct tcpci_data *tdata)
+{
+	return 500;
+}
+
 static void max_tcpci_unregister_tcpci_port(void *tcpci)
 {
 	tcpci_unregister_port(tcpci);
@@ -523,6 +537,7 @@ static int max_tcpci_probe(struct i2c_client *client)
 	chip->data.check_contaminant = max_tcpci_check_contaminant;
 	chip->data.cable_comm_capable = true;
 	chip->data.attempt_vconn_swap_discovery = max_tcpci_attempt_vconn_swap_discovery;
+	chip->data.get_current_limit = max_tcpci_get_current_limit;
 
 	max_tcpci_init_regs(chip);
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


