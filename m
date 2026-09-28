Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81FD4C33C4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602272; cv=none; b=hfHyApHcreCDiZyJkmVhLtOSQfPyhV8Z3yUC1icj4aqR0pZiHOgCOREJr7saMeuKsq0QWXfIqxiZ8aESxnRumExOr793OcSM6yRGNtOGiv09xOQXa0dIcB6qWUiF4z2Ro2OB+ls54pxWw/NEvrbrVMTI0zObBiC70aKcPY7gumY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602272; c=relaxed/simple;
	bh=vdJcUNXVf6ubcPaHSEolYRdRyjYP6m16nV9wayNlaR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7/ASs27tI1pjoBhxi3OSUBxEGBijYGuCm20cFufC8S69UHAC5T/l2lnX/EKTnUsu0kDNqAXRB+kGpXRJ6y086GAFT7BWapWRgn/s/SzKM8i+fL5Fsiimo47qvOlML41xCrUHVT5MpZtX+yybP3dNIIFn2mcf/+TxGMlsT3ibpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/LGRvbY; arc=none smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/LGRvbY"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8aa85480ba3so134517b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790602270; x=1791207070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJ4wgpPMfRYUeEZiyDIFI8sI0hTBjDqpCbT7VCB6BkY=;
        b=Z/LGRvbYWphCJcZH8PJWWgy5n2aMB9FiERg27Ux6E3gn7wS/HI/sq519B5+Lmg7Bwu
         nEN0383auEBYM2WigP0B/555ZKe9nbR+YBTIHGU55qeDGMWqgyMNy2d1MhzKiMTacLtW
         sOvNH4L5OWBu41U0NJZpcT5BZKh3DX8I9SxEWahT2kXheDl/wFnAk/m9E0uWqvnEe83i
         VZzp6dR8k4GCUeuVfKTXeCsYCGWQXUxkMZnmjdmdwhEmSx3jIVNjM+hcSBDDGnTX3u9/
         ERtXRBZ+L3YnXCNAP/BM+lhn2XFLF7DPWTAGydoudHH3FprlIiIWQhkIkXkCtXwrcilA
         NnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602270; x=1791207070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJ4wgpPMfRYUeEZiyDIFI8sI0hTBjDqpCbT7VCB6BkY=;
        b=whgjmDYmhK4DeH2zc/4dHHk+TXrSyJMwcXUM22IGpNJedXlGp/sE6NmA46ZUWce18P
         noZgoSe0MTlJDl6ExQLNL338rbpvEWAsctxpNAP1h3/XsvsYXy3NTF1HJdR2FhVBkJuX
         zxfchITfqzXxzvOdL1M5puc6rUo4DJnkpil/1TlfG6Qk2n0UWXCPs479jUeHTlhtX6S+
         aIaT6N6y5H2eyETZ5j4HJPfOltIiVZPE+mvneUtRxECaka32P9+DlpuWMITejFzuI7bL
         Mcf1MjVuM2sipXxItZ8nPs6NgS7MNRxovT8Quz8BRXwJErkdEHEeyjB8GzSpHZSD3wt1
         ZN7A==
X-Forwarded-Encrypted: i=1; AKwUvBwrTsfISkTWnOxXcaPqBSCBgZd6pX7EsHFGpfkDqj5OuUkKmg9JTBHHicb99jRr/IaXxvA/+KgsHzN2A0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1lYpyA//FJ6PFGMBdXzpu/HuDJySPpiBkOS6501DIjGIREE3X
	ofA1aCT3DsQDoTLX7s6dY+p68oZa51UtpZ4go59rGp8IX0D+npWb1uSD
X-Gm-Gg: AYBFou1CbfA+GuugqUcheIqXiPexH4YG0RL/CU4b5if4Rgr1CHIWnxnzJozcyk+D3/L
	TBPJikuXC45gw6rrDdRVkxTvUla7iiaWMFpswdHX/CouYQl7+Ie9d5KcX6tYIEbNoGxLfBW4+mn
	+GO8r1w2yLWl/T/pB0O+S9RiF4HE0jT7P7R0ntM0iYjGvrRd6Ak77E4KLekZyjj/MWs8T7MO6qm
	+s39qchx+0Ly/HcvrJf/vq3i6mgnvPRaU/VRZvNKAbAS1SR487U/81q4t0mvkB7fZR3GdY6ND52
	0pXlGFSTZGZRQg9SQptJgxl8y7omNLJnYpjkhAkmS0eFYDCRulweDQS0oaEfKGVe7bAoJC/U7ML
	ab2MXrXIscPLMxPzEhDcW1ZHdQ4TtKDcVsZ2f8tusphgS+bZML7TpZngIXCSpCXGPt1E1oQviSw
	AhCOeaJdAtTrLFp9fbNOF6eyAllsAmJ+z/uHJVcbhr19SajXVTAiqUhDFHlANJRB7mFMWFvt5Qa
	MKkEbAGAFZliHh1EAnXeMlvGPn1d5SNDhLOojlx8w==
X-Received: by 2002:a05:690c:74c9:b0:862:7bf8:287a with SMTP id 00721157ae682-8a84c0c3baamr88271717b3.4.1790602269651;
        Mon, 28 Sep 2026 06:31:09 -0700 (PDT)
Received: from Tifa.lan ([2804:1124:fdf6:bf01:7b7c:d58e:4ee8:14ac])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ab33cb27e1sm3571267b3.34.2026.09.28.06.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:31:09 -0700 (PDT)
From: Carlos Junior <cjuniorfox@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Carlos Junior <cjuniorfox@gmail.com>
Subject: [PATCH v3] ata: sata_mv: enable SoC SATA LED presence indication
Date: Mon, 28 Sep 2026 10:28:18 -0300
Message-ID: <20260928133040.222155-1-cjuniorfox@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925193134.114566-1-cjuniorfox@gmail.com>
References: <20260925193134.114566-1-cjuniorfox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SoC SATA LED controller in mv_soc_enable_leds().

Set the LED controller enable and device presence multiplexing bits
in the SoC SATA host-controller register. This enables SATA device
presence indication on boards using the SoC SATA controller.

Signed-off-by: Carlos Junior <cjuniorfox@gmail.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
Changes in v3:
- Simplify the writel() as suggested by Damien Le Moal.
- Add Reviewed-by tag from Damien Le Moal.

Changes in v2:
- Do not initialize the SoC SATA LED blink bit; leave it to the
  existing NCQ LED blink handling.
---
 drivers/ata/sata_mv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
index d260f04e6..c408d04d9 100644
--- a/drivers/ata/sata_mv.c
+++ b/drivers/ata/sata_mv.c
@@ -252,6 +252,7 @@ enum {
 	SOC_LED_CTRL_BLINK	= (1 << 0),	/* Active LED blink */
 	SOC_LED_CTRL_ACT_PRESENCE = (1 << 2),	/* Multiplex dev presence */
 						/*  with dev activity LED */
+	SOC_LED_CTRL_ENABLE	= (1 << 3),	/* Enable SATA LED control */
 
 	/* Shadow block registers */
 	SHD_BLK			= 0x100,
@@ -3382,12 +3383,15 @@ static void mv6_phy_errata(struct mv_host_priv *hpriv, void __iomem *mmio,
 	writel(m2, port_mmio + PHY_MODE2);
 }
 
-/* TODO: use the generic LED interface to configure the SATA Presence */
-/* & Acitivy LEDs on the board */
+/*
+ * Enable the SoC SATA LED controller and device presence
+ * indication on the board's SATA LEDs.
+ */
 static void mv_soc_enable_leds(struct mv_host_priv *hpriv,
 				      void __iomem *mmio)
 {
-	return;
+	writel(SOC_LED_CTRL_ENABLE | SOC_LED_CTRL_ACT_PRESENCE,
+	       mv_hc_base(mmio, 0) + SOC_LED_CTRL);
 }
 
 static void mv_soc_read_preamp(struct mv_host_priv *hpriv, int idx,
-- 
2.54.0

