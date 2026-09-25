Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836AF3B058E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790358260; cv=none; b=q/63tYkG7Gu+LnnaEyH3lPHylD9azu2d9Rf1RbJOsjpaD01pIDwDAig+YvJdQki99+GJ+A/8A9CK9beYvJCJN/yc9NgJO4SK5J4N3y47F4OHFpRRuPX3SSJfqw9lzfpuzjrmyVCrBsjMkOQXykr7WfNhwTu1dMQl9Pu1yB2jW8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790358260; c=relaxed/simple;
	bh=nEGQtNsOqRgVj1stkN28aBwKl650Crgr+AGHAzUbLlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i97umVBaKCYZIzGCc5FyE95UFzNSAPcMPr51vzMzR4pSb6xib58Z4lWGa1yyxj9vOOTPNGlqk9OZuY71OlrG9axo+vAxB/QkMCiSjbofFMn06YpFR0Z0xC1ErkyDdvWxoRsdhVfsswX0Ya4P/HU9gMnKE7quoYHhazhuzruQn2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=r7PFHR1X; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="r7PFHR1X"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fdc579daso8058315ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790358259; x=1790963059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=od1b2NiNF/g5sU9VqKXFtus5k8nOhhjRHoBVgLXdW6g=;
        b=r7PFHR1Xo1Bd9dHniplSLk8dS/WCUpNoZ6pSGee4WifduU3R/a62yhePFE2Jw4ytMl
         hAQ+sQQl6zabjxLdgnLwb0WYuGZ2oQ0RffnIIp9YSkhFeG4vZoaGhqy9FCUzgpYSiQ83
         Z1DFuUJyDAzXFbv9gkWdrAUZyKRkh36zlhYSdvnPGwt7Pz+VeaSEqV5kJN7J4dI9dcHo
         jnPpDKl2zfZq2Q0WzaDm13/rNqBlu3JlCA6djuc7ZAajPLobNoaKVGUTupuTFCsqAJMj
         pxqu6DVJsz2YFZaPuQOKq+kHazDIwgHufqgeJcwyrjTzeKZydfR6qWxzndMdOkiveITz
         ZJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790358259; x=1790963059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=od1b2NiNF/g5sU9VqKXFtus5k8nOhhjRHoBVgLXdW6g=;
        b=fmD3cKVkfGNFh04aDO0eHH3N2nva5hoHBZelAaFrNLzswG8dr+lNsbWVIBuYWLJVY7
         5NAgWlFW/q0TEnP6mM45rVDHVOhAngL0QwwnNHxHBFDfbt0/h2bpILNfTDxXPngsVFHe
         DMPa2/rfz8T4lFglx14Vyy+O4Jby3kbnefVbJB4YjhaF4ZGnS8AKswIM0wVCdTIhbMOY
         v9YyKHFanlWcnCpAVb+KulEaRI7t+2Tw7h/caYc7ZQpLZ9yDjihWYiPWnZhTuGszGz7W
         Y5trg368ExmRtAXnL7NazUEv2gyvD/4aVDY/xdskrcBne7fRiXBoCNNuSYnvE4JHYaYC
         oBIw==
X-Forwarded-Encrypted: i=1; AKwUvBxLdas3VfprjIpqvJsC+3c2xqkQjeIULzAslveCzj02rtOaMHw66TzXHGhBugRJgGGKR88LO2ITm0w08+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m9Ea+eMYqQZnGwpH5z0s3mwiXblYqvB3yYTgbCxWdaA5db2gHp
	c27y2PtKEjmjcnshfgqcXmjPen2wPjN7G+HIzkTk6IjnzhML91Jun8lP3z80da80hbI=
X-Gm-Gg: AYBFou0wLC/g83YKRb2zwqaw6DxqUj5lwnzctxu5fYY9M+8Cee9XbiY5mzag67SXZ5/
	MiWY5UOJtIwvFQQMSRNjBvwPCYNM+WXBXKZl2tCViNFJuEIL72Fp6VmYInMsv6b/owol3df0XyA
	PEZqnBdsEFOUAaFj5Y2c4LY5nlMg4sP3/JaqfPwnqenmtJokZVCH9DRLqZqP7wAUQRJIQGgZGX9
	rWvlVdFJmSownopjJfZRGhBxup8NrTrGRaIoaCKP/92Z9u8NxDE6Wrmpb7WxB6OuT9IiJ/PrqZ9
	A6Mc7Bu9uEZz/qsH3yjgZwRAVnCaVk3sdd8G4OcjN5T/EGy+QXotH+lyEW5hmr31iTiAXjpXVQA
	Mjd3D037fqEHMRxyoDs7AkQ3r9L3sdk+8yThXvLQlv2BXJx+JnOuyaSWIrEVRNGgbke4Bo7eSjl
	p4fNBM4g7oWVrhLcxKprAbAswphcGWSxLlw/cam62m+GTVa3C20bhgDQ6KYoEoX8VQddMmAnlNk
	7i9hRWsayXR
X-Received: by 2002:a17:902:ce82:b0:2df:9a7e:d41f with SMTP id d9443c01a7336-2df9a7edeafmr15014465ad.41.1790358258843;
        Fri, 25 Sep 2026 10:44:18 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:40::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bafesm14329895ad.51.2026.09.25.10.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:44:18 -0700 (PDT)
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
Subject: [RFC net v4 4/4] bnxt_en: refuse to open a device with stopped DMA
Date: Fri, 25 Sep 2026 10:44:01 -0700
Message-ID: <20260925174404.2789072-5-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925174404.2789072-1-joe@dama.to>
References: <20260925174404.2789072-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
index 33e9ce8eb449..21da989e136e 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7814,9 +7814,20 @@ static void bnxt_stop_dma(struct bnxt *bp)
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
@@ -13387,9 +13398,10 @@ static int __bnxt_open_nic(struct bnxt *bp, bool irq_re_init, bool link_re_init)
 
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
@@ -13406,7 +13418,11 @@ int bnxt_open_nic(struct bnxt *bp, bool irq_re_init, bool link_re_init)
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
@@ -13466,6 +13482,10 @@ static int bnxt_open(struct net_device *dev)
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
index c673b2ce4a0d..061f57824c7a 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -2470,6 +2470,7 @@ struct bnxt {
 #define BNXT_STATE_DRV_REGISTERED	7
 #define BNXT_STATE_PCI_CHANNEL_IO_FROZEN	8
 #define BNXT_STATE_NAPI_DISABLED	9
+#define BNXT_STATE_DMA_STOPPED		10
 #define BNXT_STATE_FW_ACTIVATE		11
 #define BNXT_STATE_RECOVER		12
 #define BNXT_STATE_FW_NON_FATAL_COND	13
-- 
2.53.0-Meta

