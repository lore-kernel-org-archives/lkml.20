Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648065;
	b=z1N0NAUIFhW0DszjyYnG4w234KQZrTC2ze9c9mx9Z5Slfcvl2nh1Vl9QVesIqsWEgZVx
	 wzsgwxpsgxF3BGUhcCNhTCOcFJVNwYkl5i7wMDs8HRp/dstx1jKKikJdrdUYXa+mcgOC+
	 TbEhIgRE/s4C6klQJHiH4ipIBRUFSguAqaWI2WvoKseySjNyVVR2qem6vVfIjfkaRltcD
	 X6BgKT1yC22ZEq/9J+ngQQMcf5ASf8534mmYFu5vUimixW3hWimp8trVgkGgIEQgmRhCp
	 aXn9X12drEaB9tG++HNM6OulYu4H/5OjPK/+kLKRKNK4ChP7TXAc2zgrBmQD1MdMe6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=agNDJFmBlWFHJhILToH5SF3NXKWRpvo2zlMNjhJMbMs=;
	b=L+imfBsgmF8hfBD8l6zi6Qfhz43NEJiM7uzHENHVdUs1y/HJA1AdeEhd3SuBKW8Pw9AX
	 eoPCeFn2bC9MS/Edec3D6Qs9qHpMhgkUajHW3UZyZ5t31EmIM5JGyltQnNEfIBGtPF3Ap
	 px8dNWOFodWJr0eEnihW6NMDpl4yd65rLIZD6C15sZI4MS9SWnj1q0SgKlkRnlYnIYML9
	 wckGd1GS8oPqx+r/scv39xGwn5A9VwYYFVAJai4P9mxvUTxAEffC0aIYClk3f1RsCz9Nr
	 clhJIKoFco0METhGw7bWNeQl5eU6BUdc2j+13TfcdH2zqb+rjwOy9WK3/5vGwbVVGVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BqaUjlDM;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43701606D83A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43701606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BqaUjlDM
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-843ea301d60so2433676a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648064; x=1794252864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agNDJFmBlWFHJhILToH5SF3NXKWRpvo2zlMNjhJMbMs=;
        b=BqaUjlDM6OViKO6/VVgcXKROePzaH7UZZ2A3iXotgq8gkMk1Xs657geU2m42LDYKKj
         jYznvZqRbRs8KfvMvOXIuaxIvgnrySAB9TDWSmvM8aMPtXlloxmG6ERM+QDAIQe8RSkl
         Vm7W99mYxaGWYYDMI8WyVC0qHFjlcLYZerXC2fTYbeU8tPqQ9FUQiIfMVt9mpysUs7pI
         PfK+kiMvx2r0sZ7eaORG1pxgCAc6FtGzkvwb0aouCae+htjhne7rl7lOLIlzxsc22QW/
         JC8o1az6hps29R4PERGirQ+eXVCpUWHiV4ljPBQ4U1amGF2qJYzbz5Vk+J3oBj2Rz7GB
         xhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648064; x=1794252864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=agNDJFmBlWFHJhILToH5SF3NXKWRpvo2zlMNjhJMbMs=;
        b=iNFjYBDlrOxEPCZpiqFz/1vtK8/c4irvdqPlyKwBcl0eAZei4aHyp5thG+q/UaFVlQ
         EG3OOsahwdFe2Jx39ZcuWo7A95DEWQyvnq7Eqvw/z4rKshUi6CaPkbjUU2nc39YXdeAl
         /MitpF2kD7Yb4CsaRhxs6NKLHcv4m6aKC3zWhtwauWYVGYJKU6amLT++dTYxEVanWZ7n
         NsdQjbFKJQ2qzWr2h2qtezq3LZ3Cfcqu81Hl21a+zxCaa709Nbb+lPcGA65eOFhOjc/R
         HaaGLN3iP2wKtBclzd8aJ08YmUUrmhfriyqu2wvr/ywUc9Ux2rCbKNthefm4VZjr+oId
         a91w==
X-Forwarded-Encrypted: i=1; AKwUvBy1TtEKD1ijBjbLm0LLCHyU03+oWFXQYi26EkztmoJrseHzDni3wujqnFcWyf0yAl9FPK5sYmdX5rnKMtQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYILPGwrMJOdN7k/AJvSy1zka+BQeHWchC6DM9+5prtB2bk/UMe9
	hU/54mwJIJ7rgdIIFeFClfBKMWFT8/23vDjnWH7r+aThhhuAexa7Cbo7
X-Gm-Gg: AYBFou2l5N9VCF2A2Bw4ttwyOES26+TqHQcf8pCy9Swhp9wgo9griC1tDYZv2zA03jA
	h+9QjilMxYIsYCYZlsuKAMzVCiM4SPepYtauGFY7+b6hGSDSU1jrKO8sRLOU6SFRKbW26xlhIsv
	yxOS4mu/w1qORmJ9PGwevTaNo+uopZ2jJPGeA8nzIIqFwjkck3Gq2DGrBKro10ApQ1zhtoRRymh
	CafNiKEdedqYQCfJLcLqbij+CXiJPnZpGzqVIgzZhYayQja2fyG/ik+adRYtRdUCsGnGbAILWGq
	0xUwHPnP+zv5lR880Zds5JJYJKpXyZuvFccYkKPwaHrDPsFslCRKgt4RK8DSk1NMz+nfKFE63Uk
	1MK7scizKqxu3uM8XwErKikG+McLz6UWIcW2VJ+mREV9vXIxM/3M5sDdQ1dayecfbS02IvS1g+L
	RA+4KerlxRBaPhuWYTjTVLetDm+vEpLbcHzbV9VhVsdi2ng8R/HnNyl4oUzHqKvWOCXwQuWBsH7
	vBPi9qCPg5raACOZCYxo8cAyqM/DKbnUbPkRR6++b8X5bfgy3cr5EHithiSnhQLZyEZOt5qi8Ae
	jxYJ7zNA8FCDC5vYtun+nvCJbugovZbIAV7eH9M9H/uDcUuS1IREIWOalthenB+EukDyKEVSkXV
	4yERabxMrDO9ol9Cff00J0WamPwAUQ5YnzbroLUJbuWM0H44Pt2OQuak9G811gSS2fwj0C9uC7/
	+AMzFBDexU37ZGhTwLXJXDZcB/ZZ5SW+1YsDHCSUJekVKCK0HUEukPH7hkIeEDE8oS8nQojEKV
X-Received: by 2002:a05:6808:3206:b0:522:1ac7:a573 with SMTP id 5614622812f47-5640dddbb38mr7810512b6e.43.1793648064189;
        Mon, 02 Nov 2026 11:34:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:17 -0700
Subject: [PATCH v5 05/10] dmaengine: dw: calculate residue in the status
 getter
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
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-5-d3207758fbf9@gmail.com>
References: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
In-Reply-To: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

From: Serge Semin <fancer.lancer@gmail.com>

Calculate hardware-LLP residue while looking up the requested cookie under
the channel lock. The scanner and the status getter currently take that
lock separately, allowing a descriptor to start between the scanner's
residue update and the status query.

Have dwc_get_hard_llp_desc_residue() return a local residue value from a
fresh LLP snapshot. Keep the persistent residue field for software-LLP
block accounting, subtracting the current block's progress when reporting
status. The descriptor scanner continues to advance software-LLP blocks
and complete cookies from RAW.XFER, including for polled transfers.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: retain polled completion and software-LLP progress]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---

Changelog RFC:
- Instead of just dropping the dwc_scan_descriptors() method invocation
  calculate the residue in the Tx-status getter.
---
 drivers/dma/dw/core.c | 88 ++++++++++++++++++---------------------------------
 1 file changed, 31 insertions(+), 57 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 5a1caca7ad68..0d6b5bd8ea6b 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -267,41 +267,8 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
-static bool dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
-				       struct dw_desc *desc, dma_addr_t llp)
-{
-	struct dw_desc *child;
-
-	/* Initial residue value */
-	desc->residue = desc->total_len;
-
-	/* Check first descriptors addr */
-	if (desc->txd.phys == DWC_LLP_LOC(llp))
-		return true;
-
-	/* Check first descriptors llp */
-	if (lli_read(desc, llp) == llp) {
-		/* This one is currently in progress */
-		desc->residue -= dwc_get_sent(dwc);
-		return true;
-	}
-
-	desc->residue -= desc->len;
-	list_for_each_entry(child, &desc->tx_list, desc_node) {
-		if (lli_read(child, llp) == llp) {
-			/* Currently in progress */
-			desc->residue -= dwc_get_sent(dwc);
-			return true;
-		}
-		desc->residue -= child->len;
-	}
-
-	return false;
-}
-
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
-	dma_addr_t llp;
 	struct dw_desc *desc, *_desc;
 	struct dw_desc *child;
 	u32 status_xfer;
@@ -309,7 +276,6 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	llp = channel_readl(dwc, LLP);
 	status_xfer = dma_readl(dw, RAW.XFER);
 
 	if (status_xfer & dwc->mask) {
@@ -372,27 +338,6 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 		return;
 	}
 
-	if (list_empty(&dwc->active_list)) {
-		spin_unlock_irqrestore(&dwc->lock, flags);
-		return;
-	}
-
-	if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
-		dev_vdbg(dmaengine_chan_dev(&dwc->chan), "%s: soft LLP mode\n", __func__);
-		spin_unlock_irqrestore(&dwc->lock, flags);
-		return;
-	}
-
-	dev_vdbg(dmaengine_chan_dev(&dwc->chan), "%s: llp=%pad\n", __func__, &llp);
-
-	list_for_each_entry_safe(desc, _desc, &dwc->active_list, desc_node) {
-		if (dwc_get_hard_llp_desc_residue(dwc, desc, llp)) {
-			spin_unlock_irqrestore(&dwc->lock, flags);
-			return;
-		}
-	}
-
-	/* Residue describes source reads; only RAW.XFER completes a transfer. */
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
@@ -975,6 +920,32 @@ static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 	return NULL;
 }
 
+static u32 dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc, struct dw_desc *desc)
+{
+	u32 residue = desc->total_len;
+	struct dw_desc *child;
+	dma_addr_t llp;
+
+	llp = channel_readl(dwc, LLP);
+
+	/* The first descriptor may still be waiting to be fetched. */
+	if (desc->txd.phys == DWC_LLP_LOC(llp))
+		return residue;
+
+	if (lli_read(desc, llp) == llp)
+		return residue - dwc_get_sent(dwc);
+
+	residue -= desc->len;
+	list_for_each_entry(child, &desc->tx_list, desc_node) {
+		if (lli_read(child, llp) == llp)
+			return residue - dwc_get_sent(dwc);
+
+		residue -= child->len;
+	}
+
+	return residue;
+}
+
 static u32 dwc_get_residue_and_status(struct dw_dma_chan *dwc, dma_cookie_t cookie,
 				      enum dma_status *status)
 {
@@ -987,9 +958,12 @@ static u32 dwc_get_residue_and_status(struct dw_dma_chan *dwc, dma_cookie_t cook
 	desc = dwc_find_desc(dwc, cookie);
 	if (desc) {
 		if (desc == dwc_first_active(dwc)) {
-			residue = desc->residue;
-			if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags) && residue)
+			if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
+				residue = desc->residue;
 				residue -= dwc_get_sent(dwc);
+			} else {
+				residue = dwc_get_hard_llp_desc_residue(dwc, desc);
+			}
 			if (test_bit(DW_DMA_IS_PAUSED, &dwc->flags))
 				*status = DMA_PAUSED;
 		} else {

-- 
2.53.0

