Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05C4379C57
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287746; cv=none; b=OYs80MRTvYQNAA8cFdKYRGCK+Y78xjeSKM2hfqNr0VQzP9diftgYTEgMqAn//vo8gssXY9xx7CDGEWSufgze9/R9nu7GVqIFgNQz0OfJFV/FZbaNXd9IJPdlLX7rkt21Ve9ShlkqS6N0GO2GS4RN7SQS+KY+RTyeAqEl7j0esV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287746; c=relaxed/simple;
	bh=PYDA2NsGtvdEO6m48SQvTOJ4Ei1MI+nEE3W/KkMJ/BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yjn/zrHGpg+OJq/pWx2PY36Z77lQYonZ85ZpcZES0PIghEi11vSTg3XrqdQzVWX8u9F/EjjlfZxakjvUFjeXa7n/CRDnllIgEf/FAO0ogJ27qmVJP6m7oQzC0KDKs/OSP8VaDFxHpCLFi2r5cNeUVQDh8G4C60AjQOX5moGzX1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=lpNJxHqG; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="lpNJxHqG"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35154cb9de2so67336eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791287744; x=1791892544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rp9ExwtVwETjuUXyxP6tQzqH186LBUjG5zHp0li/qcw=;
        b=lpNJxHqGDQJlKEDAlNy67dDa2z5hKTs5/vVWystcp46FvnQr4hgqfY2xhfxu7UcVE8
         6dq2I7yJSmhiK8+rNlyKnH99/5wdYPqT/CKyVWKoJUvmguf2JzsILPLnkpFUAMUSQvtO
         9+sMyAndLBGUV09bWvV6jNX7YWBpU2ByEIePPd5awgVVfsN2MKd2OKMM9cbo/6RMrAI0
         P8njOU6/d7YQPy6tWeOg0VBjnz5JkIT4xAsLvvEd3m+I1Z5lwkD2G0NE/0m45t/Ng8dg
         /wZKqK1bXqL5DCCxSMC+kQKLQcJg7uilLVaGH0/rw1mYd8Gxpgb0JAow0Hq0sYwcKswf
         AUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287744; x=1791892544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rp9ExwtVwETjuUXyxP6tQzqH186LBUjG5zHp0li/qcw=;
        b=QgDAngpoPf2JmssEvmIblleeEV+FvS83a9DA+9WSV1KRIyuZGnpR3Wmv7ctvp4Gs7e
         SxLMzcmRcwex42Z9dIf3cCDCzLXwBffw9puaiPIPKpzx12li3uCDYG0dywRtyvHfnJjJ
         CtZyNKI/HkQvD2cXkYs1//h1nRDICML6NOMtPEQgfFFRtH/FTUaTdsh070xzVSnA7wDN
         3w1r0tRaRj+wobXEkGmWm3soxG7vefTMnPdvQAIdDVJprLg2X1koXnrfc9Vf1Mfd2xqs
         vVoTTfSTcmFHR3aPJ3JBKruZh1ii3LeZwZa94I3OFc74GzA+ozn5G4+ivDC3Ff244Vpn
         S+pQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTfv8jqkb6cdlwvPcmD+EdWjqtCoYaTnER2GCGkbKLqJULmu47T1iDYAmx/stk4KLLwyN8yzTj/lM1hBs=@vger.kernel.org
X-Gm-Message-State: AFuF++ntsC2RrGnczFR5A70eITfWo+d6gwRxw2JnKM4TIyRR5Gj6b9f1
	xGt+wxjiLjVhGMmbqYVJRXIhT7vJef4AQB89lAX1q9arc6f2a9o1eQRPsbeG9Ik27hE=
X-Gm-Gg: AYBFou3WWsW1OwAwu++aPqgoeHE/xQqxHGJLhvaWOYtvuc7WIEY+XnHD6nKjfX8APNE
	G4JizSx0aAGPaq3tuYMbYvkb0t53dkGT4dl0AlFoqGnm4tmnZcr+DijzJYpSqUwL6z1ak8APchr
	2TrB1yFL53MFWq26PgLsxXwzgITkiy2ZAm7H37xEvcKA/kLoJ1emMHMzSjVSuWsTj9rmX2ooXdt
	n4qX3guXx4G8b8ES6i03kRLFyQphV3aNRmLyiYlkpmFL04mLO1Uhqtk5x0QaTtVebFASjre356K
	t0Ra3ayRxveUSHZ+XfHFxBZdt98eDE9pQpN3wCMR/YKZuCbWHipZJztKcvCRuukw2ayp5piD8dK
	qDKHsqMm9sgcSCLVz+/24TcO4et1JBP8MnxIOxzs+wDwAEh+7g1ICA+3cUjAwSdXHTZLnK5SeHG
	UPcU16T+ryDAi7O/+yDbZhI3cN8eVNTc/JY+hEmPRqzJpBEe9WOu3eHkVGDngS/hFBtyx/w65Uq
	/znDvUkQeL486nJ4NJh0GRpkkI1+9KNKA/h0Y+MdizCAW23Qd5PKRKNIOG6VLNlX1+pXFyBw55w
	8hE50iUXJ7+e8hAvua4=
X-Received: by 2002:a05:7301:4601:b0:351:1f6c:2a85 with SMTP id 5a478bee46e88-3514e2e78edmr1202521eec.14.1791287743780;
        Tue, 06 Oct 2026 04:55:43 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469f75fesm8638511eec.5.2026.10.06.04.55.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 04:55:43 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	Giovanni Vignone <gio@octane.security>
Subject: [PATCH v4 1/2] nfc: nfcmrvl: set drv_data before registering the nci device
Date: Tue,  6 Oct 2026 17:25:30 +0530
Message-ID: <20261006115532.72100-2-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261006115532.72100-1-shubham@octane.security>
References: <20261006115532.72100-1-shubham@octane.security>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfcmrvl_nci_uart_open() stores the per-ldisc back-pointer nu->drv_data
only after nfcmrvl_nci_register_dev() has returned.  That function
registers the nci device, and a transmit started during registration
reaches the UART write path

  nci_uart_write_work() -> nu->ops.tx_start()
  == nfcmrvl_nci_uart_tx_start()

which dereferences nu->drv_data:

  struct nfcmrvl_private *priv = (struct nfcmrvl_private *)nu->drv_data;

  if (priv->ndev->nfc_dev->fw_download_in_progress)

At that point nu->drv_data is still NULL:

  BUG: KASAN: null-ptr-deref in nfcmrvl_nci_uart_tx_start+0x2c/0xc0
  Workqueue: events nci_uart_write_work
  Call Trace:
   nfcmrvl_nci_uart_tx_start
   nci_uart_write_work
   worker_thread

Publish nu->drv_data (and nu->ndev) for the UART phy before
nci_register_device() is called, and clear them again if registration
fails, so that a transmit triggered during registration finds a valid
pointer.  The now-redundant assignment in nfcmrvl_nci_uart_open() is
removed.

Fixes: e097dc624f78 ("NFC: nfcmrvl: add UART driver")
Assisted-by: LLM Claude
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 drivers/nfc/nfcmrvl/main.c | 17 +++++++++++++++++
 drivers/nfc/nfcmrvl/uart.c |  3 ---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 6efa83219..8186e86d7 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -96,6 +96,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 				const struct nfcmrvl_platform_data *pdata)
 {
 	struct nfcmrvl_private *priv;
+	struct nci_uart *nu = NULL;
 	int rc;
 	int headroom;
 	int tailroom;
@@ -110,6 +111,9 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 	priv->dev = dev;
 	priv->phy = phy;
 
+	if (phy == NFCMRVL_PHY_UART)
+		nu = drv_data;
+
 	memcpy(&priv->config, pdata, sizeof(*pdata));
 
 	if (!priv->config.reset_gpio) {
@@ -154,9 +158,22 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 
 	nci_set_drvdata(priv->ndev, priv);
 
+	/* For the UART phy the transmit path reaches the driver through
+	 * nu->drv_data; publish it before nci_register_device() so a transmit
+	 * triggered during registration does not dereference a NULL pointer.
+	 */
+	if (nu) {
+		nu->drv_data = priv;
+		nu->ndev = priv->ndev;
+	}
+
 	rc = nci_register_device(priv->ndev);
 	if (rc) {
 		nfc_err(dev, "nci_register_device failed %d\n", rc);
+		if (nu) {
+			nu->drv_data = NULL;
+			nu->ndev = NULL;
+		}
 		goto error_fw_dnld_deinit;
 	}
 
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 9aedd1687..421e6dc99 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -138,9 +138,6 @@ static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 
 	priv->support_fw_dnld = true;
 
-	nu->drv_data = priv;
-	nu->ndev = priv->ndev;
-
 	return 0;
 }
 
-- 
2.43.0

