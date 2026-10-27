Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113108;
	b=kK4MlKcISqmpkpQxLZXoEw6teJctyUbqWWsDDm/7TY04Ch3MqtI9Vss+JgVw1lLvVW58
	 MZed8TFDNoysuRTk7b4xd/eL251e/o0+T5N/LWnENPN0D90xGR8FjCVcYynGBBq4juN7N
	 ifUE++oEkBPPDM/mYJ8OYSzyIQZv3+FkWZgMoOpnRztsd7oxKtLzKQ2DN27MjLyhoTIqy
	 9PrNKJsLqKY8fX5VFMEZQktA+jM3v+s+UWX2tOTLeZ0doZ/nhyWt1L9WCDFCTwSfxPNS2
	 k1Hckn51bGWQ60FMSM5FSp+T3kTsTy4Y/2Feey6gk+FesfmbUH7M3Uh2gtBcfn9NTYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113108;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xUuCOeMQPrHjOqMZIZrhO9qcLrSK4eb9N4CuZ2K9+kY=;
	b=xwGHchPHQ6dyYXRWVKb00kR5NrMcI2hXBsSaj4D/fcA9ggzfbA0midsxp8GQmCco1khD
	 7CU2v5fZSJoyrGu9/gH4nY6UTQaE1PLYPyWWYfgrHFqi0MVhBrNgbDVofUQiIqvwbmSR1
	 nYLOuCD3fTc78p4ycBW7jIIPbSrYSRV3qLIODRbqC5x97MuQ2BugJQr+DfeUITROKlSOq
	 +xjcvA/3NjnMZM7pqh+aoPbdAzjENxfgivCTJUOmTsG0UxYw/kPF7PMc/rnlzV2aea2Sd
	 rPreNW6d1yXYqPRH0zMEuBxH0pz/PnLhr2eQU9h7+c938NIHq8fZqApoi2bFfmOLl0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="H1C/WqjY";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19A360A2601;
	Tue, 27 Oct 2026 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=H1C/WqjY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC9A1F031E5;
	Tue, 27 Oct 2026 14:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113107;
	bh=xUuCOeMQPrHjOqMZIZrhO9qcLrSK4eb9N4CuZ2K9+kY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H1C/WqjYXFo73+hvuBVLJVoUpUs5Ub4n9Z6J7F9vXViTPC8RMP4xqISk5Y3fXRZ9w
	 OynUy+9N90Vf1V5eEsh2e4uIhDR2X76ZZCL+fPIO7OCWG3Cn3xO9QzQOqdxubC29Jq
	 N/xuZ+n5SjyT+vDGBTPavRBYiPovjJi9hJqIHUgs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:52 +0100
Subject: [PATCH 12/19] usb: typec: tcpci: don't act on unread alerts
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-usb-v1-12-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=5778;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=pVeCi9zKHNeLQpT7BKOEXGMnqiuHSpdnh5EZKb6uh7g=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr8/GCVir9ZQyPFB5XNBwuart5smSjQVuL+2ufc35
 qbS6eP+HbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjARx18M84PWS157Pn/XiVNq
 vZs0A3ZN28hyMoRhwYZdEhuWe3fN/DvtlKFF47qlqvN36AMA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

tcpci_irq() ignores the result of nearly all its register reads.

If the first read of TCPC_ALERT fails, "status" is an unwritten variable,
and its bits decide which events are reported to the port manager: among
them a hard reset, which drops VBUS. If the read at the end of the function
fails, "status" keeps the alerts which have just been handled: they are
handled again, for as long as the read fails.

In the receive branch the byte count, the header and the payload are not
checked: a count made of stack content trips the WARN_ON(), and a message
made of stack content is handed to tcpm_pd_receive(). A failed read of the
frame type returns a negative errno as irqreturn_t, with RX_STATUS still
set.

The handler must not simply return in these cases. Nine in-tree boards
connect ALERT# to an edge triggered interrupt: as long as an alert is
pending the line stays low, and there is no further edge. That is what the
read at the end is for.

So read the alert register through a helper which tries three times and
reports "no alert" if that fails: after a failed first read the function
falls through to the read at the end. Drop a message which cannot be read,
but clear RX_STATUS, to release the line. Don't take an unread power status
mask for a reset of the TCPC. Return IRQ_HANDLED if any round has found an
alert, not only the first one.

Fixes: 74e656d6b055 ("staging: typec: Type-C Port Controller Interface driver (tcpci)")
Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
Fixes: b691a07c5f64 ("usb: typec: tcpci: pass correct rx_type to tcpm_pd_receive()")
Cc: Badhri Jagan Sridharan <badhri@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/tcpm/tcpci.c | 64 +++++++++++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 6717ac914c6a..26c62216a813 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -715,17 +715,34 @@ static int tcpci_init(struct tcpc_dev *tcpc)
 	return 0;
 }
 
+/*
+ * An edge triggered ALERT# does not fire again while an alert is pending, so
+ * don't give up after one failed transfer. No alert if it cannot be read.
+ */
+static u16 tcpci_read_alert(struct tcpci *tcpci)
+{
+	u16 status;
+	int i;
+
+	for (i = 0; i < 3; i++)
+		if (!tcpci_read16(tcpci, TCPC_ALERT, &status))
+			return status;
+
+	return 0;
+}
+
 irqreturn_t tcpci_irq(struct tcpci *tcpci)
 {
 	u16 status;
 	int ret;
-	int irq_ret;
+	int irq_ret = 0;
 	unsigned int raw;
 
-	tcpci_read16(tcpci, TCPC_ALERT, &status);
-	irq_ret = status & tcpci->alert_mask;
+	status = tcpci_read_alert(tcpci);
 
 process_status:
+	irq_ret |= status & tcpci->alert_mask;
+
 	/*
 	 * Clear alert status for everything except RX_STATUS, which shouldn't
 	 * be cleared until we have successfully retrieved message.
@@ -738,12 +755,12 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 		tcpm_cc_change(tcpci->port);
 
 	if (status & TCPC_ALERT_POWER_STATUS) {
-		regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
+		ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
 		/*
 		 * If power status mask has been reset, then the TCPC
 		 * has reset.
 		 */
-		if (raw == 0xff)
+		if (!ret && raw == 0xff)
 			tcpm_tcpc_reset(tcpci->port);
 		else
 			tcpm_vbus_change(tcpci->port);
@@ -755,7 +772,10 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 		enum tcpm_transmit_type rx_type;
 		u16 header;
 
-		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
+		ret = regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
+		if (ret)
+			goto rx_done;
+
 		/*
 		 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
 		 * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and is
@@ -767,26 +787,36 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 		else
 			payload_cnt = 0;
 
-		tcpci_read16(tcpci, TCPC_RX_HDR, &header);
+		ret = tcpci_read16(tcpci, TCPC_RX_HDR, &header);
+		if (ret)
+			goto rx_done;
+
 		msg.header = cpu_to_le16(header);
 
 		if (WARN_ON(payload_cnt > sizeof(msg.payload)))
 			payload_cnt = sizeof(msg.payload);
 
-		if (payload_cnt > 0)
-			regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
-					&msg.payload, payload_cnt);
+		if (payload_cnt > 0) {
+			ret = regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
+					      &msg.payload, payload_cnt);
+			if (ret)
+				goto rx_done;
+		}
 
 		ret = regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE, &rx_type);
-		if (ret)
-			return ret;
 
-		/* Read complete, clear RX status alert bit */
+rx_done:
+		/*
+		 * Read complete, clear RX status alert bit. Also if the message
+		 * could not be read: it is dropped, ALERT# must be released.
+		 */
 		tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
 
-		rx_type &= TCPC_RX_BUF_FRAME_TYPE_MASK;
-		if (tcpci->rx_type_mask & BIT(rx_type))
-			tcpm_pd_receive(tcpci->port, &msg, rx_type);
+		if (!ret) {
+			rx_type &= TCPC_RX_BUF_FRAME_TYPE_MASK;
+			if (tcpci->rx_type_mask & BIT(rx_type))
+				tcpm_pd_receive(tcpci->port, &msg, rx_type);
+		}
 	}
 
 	if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_STATUS)) {
@@ -805,7 +835,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 	else if (status & TCPC_ALERT_TX_FAILED)
 		tcpm_pd_transmit_complete(tcpci->port, TCPC_TX_FAILED);
 
-	tcpci_read16(tcpci, TCPC_ALERT, &status);
+	status = tcpci_read_alert(tcpci);
 
 	if (status & tcpci->alert_mask)
 		goto process_status;

-- 
2.56.0

