Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679C8471D01
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860280; cv=none; b=bY3b53UZdcW6LLJm07XTgCVeVEIXlWAxtYHu++ciLgV1IITOnShPDAyru8QY+Efod0Sb3dMCgZggdog2pNWv5MexU7PKk4w1M3ElQXDkzLAUOrxPqq/d+VsGCTndyd8WcxbMuj/3HUX80zlMxKrfaVTaAxFh1zw9wj07CZmPT0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860280; c=relaxed/simple;
	bh=VSJJkJiLisOd14jzU3NtN+1l4ORk3Rz7Onx0RA8eoDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgqD7AcYclBXPndPmx+a50Kc8rJUodBmX0NJgjqgSOlkgyPUjnOqsRtZMR/nuC6IToPYp8xz8mQ3XrarYE+Rh/eJ9M4bdUw9fu/HfD2J44xvqcfxU/IXJ6sr8Fls9OvClMsQ+2rIrorlDC+Q+nKudYdsVJ+VQESxsyRZrbvk+YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=QKJZ48dz; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="QKJZ48dz"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-16ad92569b5so2362942c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791860278; x=1792465078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AztMa9ZkTcAA+tH8ZRmmfmqDCx4w5BgOfCE+Z46tQA=;
        b=QKJZ48dzlGZWIDcDiqTsVdi8A/TQnffGLLjgpO6Xxrx/eOB3P1Ln8K5qWNDSUAMDme
         1XnaBQbKrA94jqTyPEjUjK5cFKs5do/8j9/zuZTBzIidsGmgtzvMCndTYtE7wuBHLCUK
         DQx9ppZhi7GVEv/Oa/hrERop9k8GL7oedy76DsPMtihCUURP7mloUfaagOQXno7u9BUM
         MalJSSdz/ulXHLpLt/BlYk0eiwdF0DJkrmIAVoG3E2wuh3WSjuxVIWmLhhTdLwEST12y
         6cYL9+2NSjREafk4lEsRlR9TKn97D8JQJPJ41g/tlnI8nlw4AsUduPs4PzaMul7wpw/S
         MQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860278; x=1792465078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AztMa9ZkTcAA+tH8ZRmmfmqDCx4w5BgOfCE+Z46tQA=;
        b=pdb29/ohl/lQ5XBnGkix0J6FJJUq3oOKzN8Y45HVHC4lWYXtWYglkkqIaTLuTSZBTB
         8JDr0mFV7b+VdL/O2kzIET/0wJ3+1UyamOale/UXYTwVNKO0oJLbqHHC30pe4KvUKxTq
         tcPAE5XHflDtzJxrkDdewcwIb/VHZ7qan0Aa1f4sSATjCRXfdDV/HokZdim7bA3DrOD3
         kjLK8U92IZZ6qeW3UcydMLE9pl+10W1W8VIqd7ser4VVkZoa/5dPA0Rj4oZrR59+hQWr
         cT+AIPP5rhFJ8yOpSeAKd0SIs30iPFwRU/Gu1HglA2spCbPJK1C52k/ymgtqQIMY3qna
         /DLw==
X-Forwarded-Encrypted: i=1; AKwUvBxz9BfAktezBTl0psRnTg5lJ58IZamIrU/HdX8DJ465IQQrs9KLChMIiPcIaqEUJageSh88DCUHyGyQOd0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd2QoQ/SNrSKTMe55iI22X/QzvwluHpebM9DmM+zbxJTifDR1r
	iMSyPJ517dl6E8oI5pf0HsneBLFj5BxprZ5BmrwUocT01Rb+/odgUqnSF88CCHwwh2s=
X-Gm-Gg: AYBFou0YVTvaQeNOaax6+CEhxF4eoHnWWKdhTwCj0d5fhPQz2oiOV0pm+NwpmdKwjax
	Jb1upWbFtmbkMw+f+KQ8oO3LbPmQ6iorfmr+bPrr63kP2ttj23cNENUZxYO/q/dSy0QakhCI0KU
	GvtESh8dEX/i0i8KGMVm+O7JOhz9V8SuizwBqPAxjEfvqEDxYCi1bOYjwZdCTNmwfKtwh5t0UPY
	p8Ul1otWWfL+4HLUS4jJfESSJuvOw9E2+8VvadN6UTwxbu3FO1OA7kKUZCuWVy5g044VAnPzi5Z
	LoxgbQ8dAwAudj13xBJnaC+mIkpZcqEHsJb9Dvg+ugFesLKy34u+z9qF7a02leICqjR2uWNPxGr
	HgfYhUfsnQhKMNWE/cGC1/cccSn0olvU3Us/VXcCUU7kw69r9TQXUp29Js3nrV4ETfIn2ycde39
	4RugGVtg4OCPFlhkPuJx8/hctgAJkgr5zAWWPZlfCzuk5PtSne08Zp0VPAtsudCJ+ZMRm7KnHqA
	2biprx4DIAhgWvKc0jHp99wgLivCLmn7++yOSMWQyg2EpaOpNyJOL4ZZ630UO871O/Ec+BnNltJ
	KLTzsdz5uFAKdQ==
X-Received: by 2002:a05:701b:2309:b0:151:f0c5:7a09 with SMTP id a92af1059eb24-16a5f01db04mr18014428c88.43.1791860278186;
        Mon, 12 Oct 2026 19:57:58 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becefdsm34223721c88.7.2026.10.12.19.57.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 19:57:57 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	cuissard@marvell.com,
	sameo@linux.intel.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gio@octane.security,
	Shubham Antil <shubham@octane.security>,
	stable@vger.kernel.org
Subject: [PATCH net v5 1/2] nfc: nfcmrvl: publish UART state before registration
Date: Tue, 13 Oct 2026 08:27:45 +0530
Message-ID: <20261013025746.41292-2-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261013025746.41292-1-shubham@octane.security>
References: <20261013025746.41292-1-shubham@octane.security>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfcmrvl_nci_uart_open() does not publish nu->drv_data and nu->ndev until
nfcmrvl_nci_register_dev() returns.  The registration call exposes the NCI
device first, so an early transmit can reach the UART callbacks while those
back-pointers are not initialized.

Add callbacks which publish the UART back-pointers before
nci_register_device() and withdraw them if registration fails.  Halt the
controller before exposing the device as well.

The ordering issue was found during an LLM-assisted source audit and
reproduced using a pty-backed NCI UART under KASAN.

Fixes: e097dc624f78 ("NFC: nfcmrvl: add UART driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM (OpenAI Codex, gpt-5.6-sol)
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 drivers/nfc/nfcmrvl/main.c    | 11 ++++++++---
 drivers/nfc/nfcmrvl/nfcmrvl.h |  2 ++
 drivers/nfc/nfcmrvl/uart.c    | 24 +++++++++++++++++++-----
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 6efa83219117..3d26a54ef51b 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -154,20 +154,25 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 
 	nci_set_drvdata(priv->ndev, priv);
 
+	/* Ensure that controller is powered off before exposing the device. */
+	nfcmrvl_chip_halt(priv);
+
+	if (priv->if_ops->nci_ready)
+		priv->if_ops->nci_ready(priv);
+
 	rc = nci_register_device(priv->ndev);
 	if (rc) {
 		nfc_err(dev, "nci_register_device failed %d\n", rc);
 		goto error_fw_dnld_deinit;
 	}
 
-	/* Ensure that controller is powered off */
-	nfcmrvl_chip_halt(priv);
-
 	nfc_info(dev, "registered with nci successfully\n");
 	return priv;
 
 error_fw_dnld_deinit:
 	nfcmrvl_fw_dnld_deinit(priv);
+	if (priv->if_ops->nci_unready)
+		priv->if_ops->nci_unready(priv);
 error_free_dev:
 	nci_free_device(priv->ndev);
 error_free:
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index 62fa77d587b2..66f8cc06e2d5 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -112,6 +112,8 @@ struct nfcmrvl_if_ops {
 	int (*nci_open) (struct nfcmrvl_private *priv);
 	int (*nci_close) (struct nfcmrvl_private *priv);
 	int (*nci_send) (struct nfcmrvl_private *priv, struct sk_buff *skb);
+	void (*nci_ready)(struct nfcmrvl_private *priv);
+	void (*nci_unready)(struct nfcmrvl_private *priv);
 	void (*nci_update_config)(struct nfcmrvl_private *priv,
 				  const void *param);
 };
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 9aedd168759c..d688071f4b26 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -44,6 +44,23 @@ static int nfcmrvl_uart_nci_send(struct nfcmrvl_private *priv,
 	return nu->ops.send(nu, skb);
 }
 
+static void nfcmrvl_uart_nci_ready(struct nfcmrvl_private *priv)
+{
+	struct nci_uart *nu = priv->drv_data;
+
+	priv->support_fw_dnld = true;
+	nu->drv_data = priv;
+	nu->ndev = priv->ndev;
+}
+
+static void nfcmrvl_uart_nci_unready(struct nfcmrvl_private *priv)
+{
+	struct nci_uart *nu = priv->drv_data;
+
+	nu->drv_data = NULL;
+	nu->ndev = NULL;
+}
+
 static void nfcmrvl_uart_nci_update_config(struct nfcmrvl_private *priv,
 					   const void *param)
 {
@@ -58,6 +75,8 @@ static const struct nfcmrvl_if_ops uart_ops = {
 	.nci_open = nfcmrvl_uart_nci_open,
 	.nci_close = nfcmrvl_uart_nci_close,
 	.nci_send = nfcmrvl_uart_nci_send,
+	.nci_ready = nfcmrvl_uart_nci_ready,
+	.nci_unready = nfcmrvl_uart_nci_unready,
 	.nci_update_config = nfcmrvl_uart_nci_update_config
 };
 
@@ -136,11 +155,6 @@ static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 	if (IS_ERR(priv))
 		return PTR_ERR(priv);
 
-	priv->support_fw_dnld = true;
-
-	nu->drv_data = priv;
-	nu->ndev = priv->ndev;
-
 	return 0;
 }
 
-- 
2.43.0
