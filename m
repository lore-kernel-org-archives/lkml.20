Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992488;
	b=bQUJ2YowTF2ZUWmiPrqXOACo7Q8CXgxg5iwmIuupKsfpmB5IMuc00vRB9/zI1SdhA2++
	 aj0G1ehTzVIxFXSQgrNLD6ov3BQCqZ6OFFx6i2LElwcu52HNl4xNKoqNSDmYVSRvop54R
	 erkkX8H0Yvitg32elPDwtvCGZDS8f8XNJpIVGdYVSNUTtP/iRQq64zY7dM6wMRRZRdQEZ
	 mQd6JfTJ7uol3BaSdDyTxSTE9J4PlH4A4pbQFMf4DGuufJ/Mz/PnNgJOZ50HfskqBiIQa
	 Li0NG/f1ce+JeCYthPRTtTPZuP5iLxpdKsN7nm38hmt2cYd9C86bBteMX3kGKwTQvNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RBHpMRzf0eXM8WBZB8WQfweRMvvNhErIo9L3xk/Va88=;
	b=4RuMqTjRbUxH3WYC+obiiY5RIHA/pbpupo+84zKEZpc82nreahWfdLu1u6gFxFPdOTO0
	 9h0NQGnnBazNx0U+hF/xd+pKqsf2cDL5EKWOktl2Q+5C2pk+z+VcmusjBNlBz1uPyocSs
	 7VtSelvOaYev7zMulN70k2Jso04SIRbB0/nO89LFeO2ur9FpDdGyrwMgsknFmOlvWthp8
	 /vEHsOmR1RrsjUcMQ2LrJdIh1wI316UA+Iz5qSlpNB7ktyl0UJncg8bShAfL43SLZ6MTI
	 kbgdyBTgYV5sHTuIXG2ZgdNLheAdu/7jQAqK6QcCXkYwaR+399aCeeHwoT0TRhDjVag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="r7hGXi/Y";
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43693606D809
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43693606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=r7hGXi/Y
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so611595b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793992487; x=1794597287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBHpMRzf0eXM8WBZB8WQfweRMvvNhErIo9L3xk/Va88=;
        b=r7hGXi/Yh42H1YZYvUGa31LpcwK56AU1OyVWfVwF06XqBTMDtElkNvLVSkeAuPqVSb
         jduCAyYlfzyArk7AnS7pv5YX8ILHOSkb/vdbLM05MVQKAiTxQ17yN7nZyXPhpfuCZV9c
         xrw7eQzyAt4cqBtTOsEbsQJDJ4TGxcOvssQhGP0bMELx1smr6iEyFa2cERC6dgNDbeG+
         0nxnwhUtB5DlrMBeHEWq1yMmzNZcBbn1d5pOq3+DE9ZHsOspqfmHmBHjjPOE7BS7ghyJ
         PwgE+H7Ei4SVEIdzn3yQps3Kqm269bbhG9UH1KuBTdBdbZPX2qsE5otiqg6z3UxOWsuz
         dWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992487; x=1794597287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBHpMRzf0eXM8WBZB8WQfweRMvvNhErIo9L3xk/Va88=;
        b=OI8/Ydj4Jhbx8Hrk3zSiibDu8h8Lo2/A5N3bfPyJ5X5/vrq4Akeo8IwU5aWZYxkaMm
         M1UbRn1NFSBtn60cWtta0BHwv2WpntG67/UEx5+pDdC1rLMl9+ICZlD/CPL2JKNkUyPt
         54syrmt10Qo82H4dyLGSKVHdmEBSKGMygo635aEnHj+Zamxy/yC6SyuhY2neSqdzXvdc
         RN4dv1W2LE7zA6aUbFR9Tq2/qlFJzOlz7wun5m/gljgprZLLpNjn1G8Ckpa3R+MwRq9h
         c0hZS5T0yP8LzpMIX+oChHqs/Cybb6rpIITKppAsyGV0uBNwtdPN0WEju2iYg2Rc2QuQ
         veIg==
X-Forwarded-Encrypted: i=1; AKwUvBygFmz7xXkb+FNOQSYCQHxWAd4UvQEY0/d5Xu9sqV3xSm00AkLtK0wJKZ+8XTptKEYwp3tgG6ooNJXXdIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MJft0LCUbwG0e4FyjNw2syc0Go5WabfqTK7uaR1tuj4wejarE
	/7NXDEDgsYUvOpqE+gcLLnAsFgjBQTroaqMHooD97p3J/8vpujAHG7LHcCbPolouUfs=
X-Gm-Gg: AYBFou3blhkRzLAJDsdu+CkiAZXp9cKd8ybsxlAt7PHFDzNtcqXCc/YLlysCWsBuvFv
	cOp2vNC/vSPXJwfDbqiBwgicpid1gfGpLai9he0LbxMssjMTQFIBw8oM5GX5tIDmzNPiHv2dw51
	NcWjuEohqsYJAUOUCf2faMXafi93xML7JhgbOm7+s/IHehrIowyr9Zik3Y+3bc4m3B+6bisJIyu
	Nsw8ZggTcbi7RHTy9E4QbwlXvSWTKiJDsz/DwNRZuXqLBgC4JJqfPFreXZ19KSEnoKXDnNrwwNp
	vSP8RpViqH1pYEL36VDhrp3oMytaIlqZL3PzKa+ALTg7AfXMFqkc7OQ6uOMzoQ0xHbwznIhNFrV
	1MELESNSz5WWFWgsVPfBcGfcRXH/azIop0wnZ+/mHuqYGmugBLRL9s1LFP6500DG98RyQoXzYKh
	eq0vzx8/A93vHgjtPvl/lil+R3JlT0T1yFF9jQiCuu6Ps+6L2O8jXKhpzkqtyyGpBxhxqClKOci
	mjnoaAKwbEZaDtWfhDRf6ajyAIyxFNWE2q2rE4Y31nAQmtX6v1nah/J0tEH84xSKD0c6cFSNthl
	lBIIZXc1mHyz64FdV+qN6OV4KreJDkf2gEQz4DcfSg2Hc0N2Y/yVRAWd64/Eou3E
X-Received: by 2002:a05:6a00:3a18:b0:880:b709:cefb with SMTP id d2e1a72fcca58-8b37bf4f837mr3321843b3a.45.1793992487685;
        Fri, 06 Nov 2026 11:14:47 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:73::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b356c287a8sm936695b3a.3.2026.11.06.11.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:14:47 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net v5 4/4] bnxt_en: refuse to open a device with stopped DMA
Date: Fri,  6 Nov 2026 11:14:20 -0800
Message-ID: <20261106191423.4194081-5-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106191423.4194081-1-joe@dama.to>
References: <20261106191423.4194081-1-joe@dama.to>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add BNXT_STATE_DMA_STOPPED and set it in bnxt_stop_dma() to signal that
the device had DMA disabled. When opening the device later, check this
bit and exit with an error.

This is a very rare case, but when it happens the device needs manual
intervention by the user to become usable again.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 26 ++++++++++++++++++++---
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  1 +
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index b5ef86bf92bf..eb885fd74064 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7833,9 +7833,20 @@ static void bnxt_stop_dma(struct bnxt *bp)
 {
 	netdev_err(bp->dev,
 		   "Disabling DMA before releasing ring memory, the driver must be rebound to recover\n");
+	set_bit(BNXT_STATE_DMA_STOPPED, &bp->state);
 	pci_clear_master(bp->pdev);
 }
 
+static int bnxt_check_dma_stopped(struct bnxt *bp)
+{
+	if (!test_bit(BNXT_STATE_DMA_STOPPED, &bp->state))
+		return 0;
+
+	netdev_err(bp->dev,
+		   "DMA was disabled after the firmware failed to free rings, rebind the driver to recover\n");
+	return -ENODEV;
+}
+
 static int __bnxt_trim_rings(struct bnxt *bp, int *rx, int *tx, int max,
 			     bool shared);
 static int bnxt_trim_rings(struct bnxt *bp, int *rx, int *tx, int max,
@@ -13426,9 +13437,10 @@ static int __bnxt_open_nic(struct bnxt *bp, bool irq_re_init, bool link_re_init)
 
 int bnxt_open_nic(struct bnxt *bp, bool irq_re_init, bool link_re_init)
 {
-	int rc = 0;
+	int rc;
 
-	if (test_bit(BNXT_STATE_ABORT_ERR, &bp->state))
+	rc = bnxt_check_dma_stopped(bp);
+	if (!rc && test_bit(BNXT_STATE_ABORT_ERR, &bp->state))
 		rc = -EIO;
 	if (!rc)
 		rc = __bnxt_open_nic(bp, irq_re_init, link_re_init);
@@ -13445,7 +13457,11 @@ int bnxt_open_nic(struct bnxt *bp, bool irq_re_init, bool link_re_init)
  */
 int bnxt_half_open_nic(struct bnxt *bp)
 {
-	int rc = 0;
+	int rc;
+
+	rc = bnxt_check_dma_stopped(bp);
+	if (rc)
+		goto half_open_err;
 
 	if (test_bit(BNXT_STATE_ABORT_ERR, &bp->state)) {
 		netdev_err(bp->dev, "A previous firmware reset has not completed, aborting half open\n");
@@ -13505,6 +13521,10 @@ static int bnxt_open(struct net_device *dev)
 	struct bnxt *bp = netdev_priv(dev);
 	int rc;
 
+	rc = bnxt_check_dma_stopped(bp);
+	if (rc)
+		return rc;
+
 	if (test_bit(BNXT_STATE_ABORT_ERR, &bp->state)) {
 		rc = bnxt_reinit_after_abort(bp);
 		if (rc) {
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 41d05efd6307..7e65b61b6bf8 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -2474,6 +2474,7 @@ struct bnxt {
 #define BNXT_STATE_FW_NON_FATAL_COND	13
 #define BNXT_STATE_FW_ACTIVATE_RESET	14
 #define BNXT_STATE_HALF_OPEN		15	/* For offline ethtool tests */
+#define BNXT_STATE_DMA_STOPPED		16
 
 #define BNXT_NO_FW_ACCESS(bp)					\
 	(test_bit(BNXT_STATE_FW_FATAL_COND, &(bp)->state) ||	\
-- 
2.53.0-Meta

