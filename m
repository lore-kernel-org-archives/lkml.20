Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727188;
	b=L4+jXLe0+mKYhW65Xas1C5glT5SUCOwA54JK6SNEVNNGXDNMCGDI0Qyjvvc9/vBqFjLg
	 m+x2XqZtzzwfxGCnf4coesZpCasZQM561lfdaNFg/ZM1DQh/VMcy4esIaFF08E66+CodT
	 WdaF+OoFMNPJuy8kQh+tfnYoVfcBGKmBtiZpMI/k9XGn63VOueafGJbNXb8ZHi/jlE+8B
	 J7P7MIp1n/SPPY9cmeDiSAQ4HixQ1iDBUjHyNyoqEqK6b4ztpB0fXn5PsOUp9sLabDhg9
	 RVTfDWB2r934BOYlR2Yp0WqD2H0W4gvj+udfz2+vWuUzjzVn6B0NwulatOo40YfuRog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dTZw+th+8Oe1DXeAcCeWuqBX9XGzYLMqzgYNqTgZsHI=;
	b=yQ2HMXRjQaVDHYHpzh3y7DSfXnS5py421qGBtczZMY1EoAoSCe+hedKNFst9A9xGFyW/
	 U6Fh22vRsZJvFQmbgLa3AS+Fvmj5DUy3yKM9eivCuFAi03peO8T2Gw0IoqPJSlN8ACF6x
	 7AN14pGfMPmWCz0LJFfHgkX2B2x6Yd7BQuOc8jECVZLe7XBA3EMfKHL7h6WnW0I+ZsTgE
	 eNVG+lW+Zh1l3MTMoW53eydJvWvy2dJ3iuNnsjurYVwv6uiz3igqE8n3yzYjN2+jR3R+G
	 DHObtReTUBNDxBdjWQISFAyYcgcj7R9Y1Q++T4Gvlbd0SgpLEEUc0HCt/Uwd60pmcsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ck/EJRgd";
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0944760A2604
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0944760A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ck/EJRgd
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71acdd32a53so412034eaf.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727187; x=1795331987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTZw+th+8Oe1DXeAcCeWuqBX9XGzYLMqzgYNqTgZsHI=;
        b=ck/EJRgdKqGC7cXPITkzdHjaQLHvhByrX3uVCO7/7RrT7F8xvaxJYD868XZ5kzYi0R
         08JM4XEK3L6R2MHR4KsC1onDpWWIvEZ3/NWe/HdOTt/zDeIj1SiVLWY6MXYy+lGHWEL9
         C1Im4dZ0EDQ+SzQRHRUe1Yq44tks9mBZRPawFZOB0oL7PgfwxuGyHFyE0014fHiCpgoj
         DFeUj2I4dmwxjaDLgqgcI8ud1Hh37xNgdKtzUzHvsXLeUkI5TGYt/4TPCVi+aRgep75U
         DrQJRsIwwt3H56Cm9edMcuQUGtL11d3OUoROlJTctxKyeqiUtDSy2JV2Ox612UvYj5R8
         lntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727187; x=1795331987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTZw+th+8Oe1DXeAcCeWuqBX9XGzYLMqzgYNqTgZsHI=;
        b=tTDTMsqPENP7rx/F2bwDGHMndui8LAC0BitpXx3IB9D1MzzdVmadv7PZMZbd7FbU/0
         Kb9dp4xcBYcAivMj8LqBdky5rG6XS2eEtBn7V28C4vItPjX3zAllyq4OVh3NZZJlznL3
         dkGzDVAflrvxwSDJLGYilsmFuSXFY+y0DHA7hTDuFqN4Nk/wt14U/f0KGsRWfy9E2F/W
         h5cj0xHiUulxQsF0AwOs8poJg6jAIVTe6emZO5nh4UckC75S+odYLp/g7QhNO3GNSc0O
         udkO65VynNz4J0jWKOfL72QMAQA+FCE7xlbVsbTd86BZmTIk1KCSR3l91eVB0XNkjTTx
         NGmg==
X-Forwarded-Encrypted: i=1; AL+hErGhOInrhDQk31Y2aWao5fuY5u/y6n5UiACMqqUfASlamI+ETDXjOzVCEeHKDltznS9xzDNp4+bTexM7v60=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qx5azU0CQHvOyvwwb9VtQal14Ss8ptOW+qXz7xVsTKkHpTFu9
	WI/GRzG09LcGd7rjay2WGDdFYDBM43gUlmKfXvIONpjs9ZFpSQWEzl3o
X-Gm-Gg: AYBFou00Vq5ndhWBMbmRluW+iE68uQn4+qFB+JnlcNjpLJWXNgQtoAuOgzG6b1+Ela9
	H6LlEZTgqzEi7kQw1/jG/GABf5/Zk3AyoDWcUtfOeXqcsBd2ogshjDrU60BCUre4IRosnHSIOg7
	R0g09SUuRM4BcaIiOAEX0Mu4ziGiooGAZUsOKxraU60u0IwnmMqsao8QR3SqS8gumKfRYm2BR7+
	zMltNP2QL+j8NX1ibq5FPOylW6TzT3MQULCfegzWu2eXPgjY+LvHiPlmJ2vBrC+YPvIGpggF9PQ
	6O/RtI6SvPxq9I5m9O9s2YCAQmPt0NDeQAOW271fO84GVxrxHrluvjog/PK4hMJz8bS8NzQO4mu
	fX+M45iUhzx3RMnrStH/paJMzT9CQ2TfhNx44GOydLb6cFGQbBRSE+6rIVqPYqGJu0wcoo3HOOW
	frIbYgL4RnWMK2u5pbh2ZRREe13D9B0mcUZtSFzesN1cslFrjby/uPalyX3PwU0uZdxUmgGGIh5
	0czlijBSfbYMb1TMj3qqbztAGAztSJltp30RJNmO9a+egGHUIYQ/6JxxE75P9fMDtf404YSvb4A
	mzKLszzzBUB5A+YK7n/NGHS14Qrp9A7V7taUBOd1a9b+C3hslNjA+/fI8BkN3yCJXWWLkfhfYam
	zo1EaXA1I++dIJk2NwuBOyUUkMcqaESkJZ5HLykGNvy5CMCM6zAhM2zQ+w6+/VcJeBLTR42z8aV
	7MJRGq8wfKFmh2/1QdYbY2XFXCtX2OP2iqOpgwDrILpIt0PU9qrGI=
X-Received: by 2002:a05:6820:a29c:10b0:700:371e:ee02 with SMTP id 006d021491bc7-71ab50bdde3mr3199222eaf.53.1794727186924;
        Sat, 14 Nov 2026 23:19:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm1145321eaf.8.2026.11.14.23.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:19:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:19:38 -0700
Subject: [PATCH v7 05/10] dmaengine: dw: calculate residue in the status
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
Message-Id: <20261115-submit-dw-dma-synchronize-v1-v7-5-8d58f3d49e4d@gmail.com>
References: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
In-Reply-To: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 stable@vger.kernel.org
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: retain polled completion and software-LLP progress]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 64 +++++++++++++++------------------------------------
 1 file changed, 19 insertions(+), 45 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 5a1caca7ad68..d9127337c849 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -267,41 +267,34 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
-static bool dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
-				       struct dw_desc *desc, dma_addr_t llp)
+static u32 dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc, struct dw_desc *desc)
 {
+	u32 residue = desc->total_len;
 	struct dw_desc *child;
+	dma_addr_t llp;
 
-	/* Initial residue value */
-	desc->residue = desc->total_len;
+	llp = channel_readl(dwc, LLP);
 
-	/* Check first descriptors addr */
+	/* The first descriptor may still be waiting to be fetched. */
 	if (desc->txd.phys == DWC_LLP_LOC(llp))
-		return true;
+		return residue;
 
-	/* Check first descriptors llp */
-	if (lli_read(desc, llp) == llp) {
-		/* This one is currently in progress */
-		desc->residue -= dwc_get_sent(dwc);
-		return true;
-	}
+	if (lli_read(desc, llp) == llp)
+		return residue - dwc_get_sent(dwc);
 
-	desc->residue -= desc->len;
+	residue -= desc->len;
 	list_for_each_entry(child, &desc->tx_list, desc_node) {
-		if (lli_read(child, llp) == llp) {
-			/* Currently in progress */
-			desc->residue -= dwc_get_sent(dwc);
-			return true;
-		}
-		desc->residue -= child->len;
+		if (lli_read(child, llp) == llp)
+			return residue - dwc_get_sent(dwc);
+
+		residue -= child->len;
 	}
 
-	return false;
+	return residue;
 }
 
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
-	dma_addr_t llp;
 	struct dw_desc *desc, *_desc;
 	struct dw_desc *child;
 	u32 status_xfer;
@@ -309,7 +302,6 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	llp = channel_readl(dwc, LLP);
 	status_xfer = dma_readl(dw, RAW.XFER);
 
 	if (status_xfer & dwc->mask) {
@@ -372,27 +364,6 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
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

