Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A9941D114;
	Thu,  1 Oct 2026 22:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895081; cv=none; b=Sawvzaht+Mp+xohcq451pkrHh72KIARA0zYLj1dpvtO4NU86wsPrz9cTB7Hy59tPgoxMyVYJ2DJx8+/yLGPR8Eceb0/Zg3ZIbrAGXHTefiGUqfLzbGq30Ze3psTIw/qE8tKXyWjjKVB9PefSx+a6DcrvKbY0J0gamxgTvltFGAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895081; c=relaxed/simple;
	bh=mchLrNoWFgVWPBPuOZhm6Rko/RDC2kkNxlyzACQcdEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgExr4LTuI8Tl7RHkQporipjMTWTfWwuVmn9uOFdoyf2ohku0KtvQ4/XrNRYEw3TO2EUlgswvz+H5LqsFJs8PytsGe4AKrF3qRo0trFNGPghQTmoo1l3w80gBpb4vTZ5z2yX5xG0j/bQjHj4u7e7JPnAB7TVNEStxXxZf8RxHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCDULjgv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCDULjgv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 793F1C4AF13;
	Thu,  1 Oct 2026 22:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790895081;
	bh=mchLrNoWFgVWPBPuOZhm6Rko/RDC2kkNxlyzACQcdEU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gCDULjgvkZ9SOQCb640NDl6PjIW2+hzM6tTO9FeMdJkwnl+7VAgU6aEIBS3WKVIL+
	 hD4MTNT9bRUlSRsuSjZIu2ckhSDj1e4ryDxYtgAmaU6Ye3PJ7YuHHFlmEl9/zSPmZS
	 KFcnr+f95RHyPEM8Cp0msDy+jr+JRQICabB/08m6ZbV0v/y9n4Tnk7li51gLOWG3gu
	 rt70I+4B4oJhKTWDcGOnbHo+PtqTksWimGclA/xTZK8/utpO7N2ptzhiaD7sLif6QA
	 kc8OTYVaWIotTC+xHYX9ZLBAsZf4v4wsA1z8mGqF8yFF8FCZwkfK+YQ1bRUeY/S1Hc
	 72AKO6PF3lp1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4CACA5FD9;
	Thu,  1 Oct 2026 22:51:21 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Thu, 01 Oct 2026 22:51:14 +0000
Subject: [PATCH 2/3] usb: typec: tcpci: implement get_current_limit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-max77759-icl-typec-v1-2-99ada1f65ced@google.com>
References: <20261001-max77759-icl-typec-v1-0-99ada1f65ced@google.com>
In-Reply-To: <20261001-max77759-icl-typec-v1-0-99ada1f65ced@google.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790895080; l=2828;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=8gEXKafzYzCAyr8sjZjUE87dWY/Y625Rw6Tffnk7d5U=;
 b=cGUp52cbQR5MlpMG8YfhKhm5C+KxUMIZ5RYa39qzbveUgbdPIxewqFIo9fXRhjiXwOQhYaKCv
 tuswV5u899ZCaw/wFCYoUuHxMzCdpkeViI2j3LKl3RRq8qUvqQRkkSN
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com

From: Amit Sunil Dhamne <amitsd@google.com>

Implement a callback for tcpc_dev::get_current_limit. This acts like a
conduit to relay the current limit information from chip level tcpc
drivers.

This does not introduce any functional changes for chip level drivers
that do not implement tcpci_data::get_current_limit.

Assisted-by: LLM
Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 14 ++++++++++++++
 include/linux/usb/tcpci.h      |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 6717ac914c6a6..f1bc1ac0a5561 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -250,6 +250,19 @@ static int tcpci_get_cc(struct tcpc_dev *tcpc,
 	return 0;
 }
 
+static int tcpci_get_current_limit(struct tcpc_dev *tcpc)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+	int ret;
+
+	if (!tcpci->data->get_current_limit)
+		return 0;
+
+	ret = tcpci->data->get_current_limit(tcpci, tcpci->data);
+
+	return ret < 0 ? 0 : ret;
+}
+
 static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 			      enum typec_cc_polarity polarity)
 {
@@ -861,6 +874,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.set_cc = tcpci_set_cc;
 	tcpci->tcpc.apply_rc = tcpci_apply_rc;
 	tcpci->tcpc.get_cc = tcpci_get_cc;
+	tcpci->tcpc.get_current_limit = tcpci_get_current_limit;
 	tcpci->tcpc.set_polarity = tcpci_set_polarity;
 	tcpci->tcpc.set_vconn = tcpci_set_vconn;
 	tcpci->tcpc.start_toggling = tcpci_start_toggling;
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index 9b46a6bc762cc..580fbdac7ede0 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -205,6 +205,11 @@ struct tcpci;
  *		swap following Discover Identity on SOP' occurs.
  *		Return true when the TCPM is allowed to request a Vconn swap
  *		after Discovery Identity on SOP.
+ * @get_current_limit:
+ *		Optional; Called when the port is a sink and CC=Rp-def to obtain
+ *		the current limit. Chip level drivers can implement their own
+ *		detection and return the limit in mA, or 0 when it cannot be
+ *		determined.
  * @set_orientation:
  *		Optional; Enable setting the connector orientation
  *		CONFIG_STANDARD_OUTPUT (0x18) bit0.
@@ -228,6 +233,7 @@ struct tcpci_data {
 					     bool capable);
 	void (*check_contaminant)(struct tcpci *tcpci, struct tcpci_data *data);
 	bool (*attempt_vconn_swap_discovery)(struct tcpci *tcpci, struct tcpci_data *data);
+	int (*get_current_limit)(struct tcpci *tcpci, struct tcpci_data *data);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


