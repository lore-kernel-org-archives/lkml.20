Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7268642901F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169760; cv=none; b=IjbbFjH2dADyzYv4OMdCEpTZ/g+4iiZVbWagRPw3B39xP5g1CvMIHbcDMDe3xu2A0DB4D4ZayldVqE0+9eRXDaFBzsjt4YDiQQaSj2K5WR0YvcfhcKOUpl6tIteFgGgZc5u8xuNGVvpxBrkuSD/PeQY+RTXigR/vkLKadCguynA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169760; c=relaxed/simple;
	bh=T48SFl0hfG/hIeHA+WLTxN4W6zR+AqfTEym/r11qGfU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X7ffmu5LVgYoBVQ0rnnLLm80M1OLj03aCrwTnfRORGBaxf0t72+cgf+PwsDMomtt+GuF+H3sv5YDEZBalfVr1MFmjqU/b/2Ku6Jhs39Ap/Eo8KtgFEw7f35tT3Bi/IHVJDrdPo6/wGtJhHEpNbLI7fYKdS6K1qOiAJwBYVDsc44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=N4hHzScj; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="N4hHzScj"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1772879a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169758; x=1789774558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUDYRA+elxh8m3+YuX4zLBX8SlbUvqG/ZGp7B+YZHjQ=;
        b=ERoD8jdmDbqiLmVlSchLxsWq86QUQ1t6Vb9Gu+RtHv5T/+7CRa7Xxw0WtK/yOJBkGl
         3f0U0AKBIX57pyHDJFfHHte1aMorCl7L8XH52HXGDgmEyBHB6ZQHdFBvBmT1jq7DmUvw
         9eycpjviId7kGM47tkvMxFU7Rgld5RLdoQWEIFdTTapvVQe5OVsf/OieQPGWwxrm7Wim
         VGtAK4siyhNAvt7yVTC7iDVjQdufNgDix4zh8LtTsgvgP9ecQTmzHnHZe+8lx67kaJVx
         Y+KU/coE8HbQ6o+mENw8FnQ14WsiljEPw6Qqlf2jRWjCD430NGS0vjYltPCgTmDlQh2j
         REOQ==
X-Forwarded-Encrypted: i=1; AKwUvBykpQhlkbUngNpFWGLvx+rxm3yOD/5NTpIBbLbKJPz50JL8KvbZFqx7f8E1LPdbSBXjyPlaCXta+3c1RNc=@vger.kernel.org
X-Gm-Message-State: AFuF++lL3FiVvev5aPGa/XTXWKD6ARpP3unJafCSMdoWm41VF4HQ5qPS
	xiENCT3Gd0/iJRlBVzlHpJEA7ktd+neQpZVWq9AQFEkUVRnCocKOwGb2Jk8PNbZlJcdEloou+Uu
	tpdaUxHkYpnL9w8anD5LP2ToREsQ7Ik7+vx35zVnPOXUVr8BnNIoK3R0IfhM3r83V6glZRxREVp
	1FLlgl0hiScBr2qsdg5lK0uTVzMY9aA2E/4sAi10rU9v9Oqw+M1IjopUrDvW36wNaEei95+0laQ
	LGVN/suicRQfU6qxuig
X-Gm-Gg: AYBFou3rE42AkTLDkVxzoJrvs294lptBIbgE5GzIdxFGJNnA6HPEiQUUU2KPkpPDSEe
	A+rCpBXcmVrimgeis1eK077CkmJOHWGsJ8J+5d6yl715F9IxcCNivpJXAf1Ju0a9A7EpgAdit05
	WnR7hHc7r8/t6/Aev39cNX5PU7lCX08oPOS72XwqnX2VRk6qlsuLYWDE1SEffpdSOvgIFaesc5n
	0Cax0s6VR/Zp2WxKBSwOsteZ6fuWH+edTAXvRAEiwU4Tpgn1iYSzgi110O3N5ZNhKeMrc5tgGbM
	QYbCl2HM8hF84hUewcjRd6SqnDdIwAAPM7Kp+1IA6gLpORH+J2xmIUavU/q9nVKjsKuM04QHvJp
	JeRJb4UILQzu3qYxH53SGyhbaSjtt9eHD2bT5gYi8kUUNesTDqqUtpLq/mgy+ErBvCqL763zE1s
	hrMAQRzHFgcIlH3/NDBp/UACbsn3NVQbImo9QT
X-Received: by 2002:a05:6a21:2989:b0:3db:710:5ca4 with SMTP id adf61e73a8af0-3db07106006mr2291529637.3.1789169757714;
        Fri, 11 Sep 2026 16:35:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc4c62a4114sm1417010a12.1.2026.09.11.16.35.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91054f537f9so36982726d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169756; x=1789774556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUDYRA+elxh8m3+YuX4zLBX8SlbUvqG/ZGp7B+YZHjQ=;
        b=N4hHzScjuki7aapQCdjclzeyqCcdPamMy5TmK5lkZur8ahKA1BnQGyipfFGx38/+cJ
         Hfo9Hkl3vDT1P6TV/zObHZ2jLc1jk1byQk31FG0FcuirVuX3qZebcfPpgGHu6xxp3wB/
         YIIdErnPSJWn8CtB6JGPHFKb4jFESwXPcQXrs=
X-Forwarded-Encrypted: i=1; AKwUvBxY6mH1SOUKyBE1z1/sP96l+3HRJsIptvMtKTZDr0EI/sLxxLnNclUkY/W0xfqW5t/Dmb7/iyYxvrJsvMY=@vger.kernel.org
X-Received: by 2002:a05:6214:2b09:b0:8e9:51b7:2d49 with SMTP id 6a1803df08f44-912028a08bdmr150317586d6.2.1789169756309;
        Fri, 11 Sep 2026 16:35:56 -0700 (PDT)
X-Received: by 2002:a05:6214:2b09:b0:8e9:51b7:2d49 with SMTP id 6a1803df08f44-912028a08bdmr150317256d6.2.1789169755927;
        Fri, 11 Sep 2026 16:35:55 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:54 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/13] PCI: brcmstb: Declare and assign quirk OB_WIN_MAXSZ_128MB
Date: Fri, 11 Sep 2026 19:35:30 -0400
Message-Id: <20260911233541.1650895-6-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Even though only BMIPs chips have this quirk, it is more uniform and
readable to define this specific quirk where each outbound window is must
be <= SZ_128M.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 71ddd8a760af..401898d04d52 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -290,6 +290,8 @@ struct inbound_win {
 #define CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN		BIT(0)
 /* The outbound windows must be within the 0-4GB region */
 #define CFG_QUIRK_OB_WIN_32BIT_ADDR		BIT(1)
+/* Each of the outbound windows size must be <= SZ_128M */
+#define CFG_QUIRK_OB_WIN_MAXSZ_128MB		BIT(2)
 
 /* FLAGS */
 #define BFLAG(pcie, flag)			((pcie)->cfg->flags & CFG_FLG_ ## flag)
@@ -1294,11 +1296,11 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 			return -EINVAL;
 		}
 
-		if (is_bmips(pcie)) {
+		if (BQUIRK(pcie, OB_WIN_MAXSZ_128MB)) {
 			u64 start = res->start;
 			unsigned int j, nwins = resource_size(res) / SZ_128M;
 
-			/* bmips PCIe outbound windows have a 128MB max size */
+			/* PCIe outbound windows have a 128MB max size */
 			if (nwins > BRCM_NUM_PCIE_OUT_WINS)
 				nwins = BRCM_NUM_PCIE_OUT_WINS;
 			for (j = 0; j < nwins; j++, start += SZ_128M)
@@ -1997,7 +1999,8 @@ static const struct pcie_cfg_data bcm7425_cfg = {
 	.perst_set	= brcm_pcie_perst_set_generic,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
-	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR,
+	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
+		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
 };
 
 static const struct pcie_cfg_data bcm7435_cfg = {
@@ -2006,7 +2009,8 @@ static const struct pcie_cfg_data bcm7435_cfg = {
 	.perst_set	= brcm_pcie_perst_set_generic,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
-	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR,
+	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
+		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
 };
 
 static const struct pcie_cfg_data bcm7216_cfg = {
-- 
2.34.1

