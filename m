Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648064;
	b=Fba817T+H4FVl35csegji9W0KEFCWYGc0gi+MRu2Xru1cBE/lg+dwdeLUKd5UODMx0ly
	 goh9XaXGSFXZhKKFNx49ReRI2pmoxLxtE8qB9z8VZF1i3ntxFgvBVuDsHg/KwOXjan9lw
	 aWMlAmUgFuV0+gvWGvi+7HyY1s/mya9f4kmcXoZyoX2o5GwurvmeRtUbrQsDdY9C30cdL
	 m9HxVgrmNOX9OHfGdwI0sd9iwWTwvz/NnCcL8tU0CSOSQQAnBlRH9kRRGAVS1OG0rLreX
	 Lf6FulFbvQh3NBnXjUYUvC65DMRO9iMHhOl8zx5q/1sOgayYzRnlOnJXJbYFCXY61pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DzyeQhcNwNETnkmir5YGLg/TCJo3K7P6T54Vfd2MVK4=;
	b=JKkyOPj+z3Dw8RMIT0j/9hGYxsWPj7qoPg3JfOqI/GMCmODZBuUEBc26mYgUk1qdTVWS
	 8duBUdgEDCYsqMFTIgUOLxapMKa8pqlgJBRvRx6M3pxYQ6sMeIgD78u0CaBbHSFyS7TWw
	 ttIY6725DrHvNj2WWjGcvANyQD2DkMgwYo4Xa5JwkvG9W9l+efJbodiGAesMGGPgk0T0W
	 jQwry5ptm0zs/8STtdfTOqQXThfnw0OMOJyBNF48xoYAnOGX6pUXzOVqGF7B+E5TDF+/0
	 KlaMd0CJ+VY/fFMB5JIfBQg2ajhi/pyyT7Ol6Ig1G1q7+Wt8Z8EFha4yEGNONUSLXfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzDHT2nT;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6F3606D82E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6F3606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzDHT2nT
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a76f63b243so3898177fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648063; x=1794252863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DzyeQhcNwNETnkmir5YGLg/TCJo3K7P6T54Vfd2MVK4=;
        b=tzDHT2nT9L3e91K4uJShuCHF1FzLra85E7U15csPvHypdzE+ZVMxuvELUxTnr5g5Hx
         8rnv9Ji3wlxbp2OjXuTvSt0lx5+wg1kqUesCrneqGaAI315GilIR/jT1bNyhf5ZLrGGa
         ivrJimj8CqXE1/KAQYAYvQNg9HTGU8gWB5rwYQxXKZ53PXTZksTMW0Q/CyAm5Xr16woO
         V0IcOU0xUFBsQLjfc18Zi9rmAsX4Ci5+IgU6cGyDHrmL2xdJEcxACG8hVQ/yKGj0E048
         lZFt/mzkVQGR5g9LSRQjWG8wutDrCN6P0ZwbhZMEm/UO0sxtsTt2LvRrD893X69Akilg
         HD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648063; x=1794252863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DzyeQhcNwNETnkmir5YGLg/TCJo3K7P6T54Vfd2MVK4=;
        b=IM6Y28DwUPZo7hiqdoB/uAyNDvQZ+18v85bqCYE5XKD8i0OYhjYNCQTSg+gfHexkZE
         RYUAv2+liblRgH/QYvSr/xWnBBNI2VZ2sQpCmEIPHshearp0jDGQYymCjwluEbynHuLF
         amHeohVSyG5wdJXyW4XbfyzAe+KhCUYXsbV/tH58uzFGsXCLgZNGofIrGjReBtnf26em
         ZbaBYAeY7SBAt1qaxlqP/5cQnJbNHYP4NLyY5CS+zTIYrmCYeskTJHIdMcrTuIpBthC7
         xbdNZdU2Ota/iM3NwjevoI18Tmf5ON4lK4sSOVISZc+wPbiD152YD/nxxGhqYn8C1Xpf
         GU+w==
X-Forwarded-Encrypted: i=1; AKwUvBwZsJhwDcOgVvbHt7aLyHVtgqjr2G3vaF0OhD2cCGgxPxlQPEMYSxOVgkHzmBWlvhXdwcTqUqI8+dXK13c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG+jQwnA2RviqbOrd/aj4Kh9Iix+uORRB89zYXwfr3150yyO3/
	8SbzRvSN9NZul9P1j6XI8aZ/i/98Hlk7wgxyVCqQH4cOGhHxMcoDvVqX
X-Gm-Gg: AYBFou3WY8tLiToc0aYmn5NSTT+ghEH6mtd5+kKK17PNaoJS4i1A4WbmvQU8Acpwru5
	XleJkxtTLh5IuHu7aopSZxGVYdIFIIMfRRw4udPAS18fDUO52WqWKB8n/+t7kgldmarWeOkcE30
	+IErVEcE2sIr1HJWuGwB+t3KxPLoY7R3OFngfgQzREyyxFSLLA+OTgNO/+8mxWlKIiDa0FIBDbO
	CnogXejo2QnaXLIgKjZ4RRDvF1i3AV8jKPrQ1DG17ETkkBs91tuCoXFNRCkz/kM0iEQ1d8Z4pkF
	UDU46sUlgf3vxQ3XMFNUhYKq9Bu/aQZ4rf/j0tILudCHt1LT953Iq07+uMigJSnasw3yilI6mUI
	UW6GO6XBxOV0ctp486xXTaYo5tnZiGdG0CdFzqR8vUa/q8AtdnkwbU3WqKYnH/N686sPrbwkBgo
	4tuQE1n3zLz70HjlCMkXB8uWfoWBeQ59W9WzxhjrgWFORExCU3LLegI7ZqlFMQ+OqzOYWdsbtxg
	Q8ZetzZv9JpyxQ8slLvXEeSQW47TfplUJK2RlnU9hHQCpL74O0y3eWawys0LI5wBFZGt+Fl7lmt
	8RnizxZQ2fZb0KiYHxNLAeL9R3ZAvp+OVt0wPxGDFtNydkJmydSfF1Y3ZGAa3w1iKFLbBxpvx5M
	TU2ah43f2YG89bJ1WGSVQ0EK650SkOceN7vQ1imuZko781odI0FsA+5m8BRDJU5KZ8GlJwO/dAZ
	3gaOLCkW0NdRzZIxe/edw2r7dDQyPJHLoWNrJdGDSEFi5Dch9p4+M=
X-Received: by 2002:a05:6808:1904:b0:4b8:46e3:e223 with SMTP id 5614622812f47-5640debc697mr4798058b6e.15.1793648063113;
        Mon, 02 Nov 2026 11:34:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:16 -0700
Subject: [PATCH v5 04/10] dmaengine: dw: extract hardware-LLP residue
 calculation
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
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-4-d3207758fbf9@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Serge Semin <fancer.lancer@gmail.com>

Move the hardware-LLP residue calculation into
dwc_get_hard_llp_desc_residue() so it can be reused independently of
completion handling.

Keep the scanner's LLP snapshot, descriptor updates and early returns
unchanged. The helper reports whether it found the current descriptor,
including when that descriptor has zero residue, rather than using the
residue value as a completion indication.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: extract the calculation without changing scanner behavior]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---

Changelog RFC:
- Instead of just dropping the dwc_scan_descriptors() method invocation
  calculate the residue in the Tx-status getter.
---
 drivers/dma/dw/core.c | 58 +++++++++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 2d69fab06601..5a1caca7ad68 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -267,6 +267,38 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
+static bool dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
+				       struct dw_desc *desc, dma_addr_t llp)
+{
+	struct dw_desc *child;
+
+	/* Initial residue value */
+	desc->residue = desc->total_len;
+
+	/* Check first descriptors addr */
+	if (desc->txd.phys == DWC_LLP_LOC(llp))
+		return true;
+
+	/* Check first descriptors llp */
+	if (lli_read(desc, llp) == llp) {
+		/* This one is currently in progress */
+		desc->residue -= dwc_get_sent(dwc);
+		return true;
+	}
+
+	desc->residue -= desc->len;
+	list_for_each_entry(child, &desc->tx_list, desc_node) {
+		if (lli_read(child, llp) == llp) {
+			/* Currently in progress */
+			desc->residue -= dwc_get_sent(dwc);
+			return true;
+		}
+		desc->residue -= child->len;
+	}
+
+	return false;
+}
+
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	dma_addr_t llp;
@@ -354,34 +386,10 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	dev_vdbg(dmaengine_chan_dev(&dwc->chan), "%s: llp=%pad\n", __func__, &llp);
 
 	list_for_each_entry_safe(desc, _desc, &dwc->active_list, desc_node) {
-		/* Initial residue value */
-		desc->residue = desc->total_len;
-
-		/* Check first descriptors addr */
-		if (desc->txd.phys == DWC_LLP_LOC(llp)) {
-			spin_unlock_irqrestore(&dwc->lock, flags);
-			return;
-		}
-
-		/* Check first descriptors llp */
-		if (lli_read(desc, llp) == llp) {
-			/* This one is currently in progress */
-			desc->residue -= dwc_get_sent(dwc);
+		if (dwc_get_hard_llp_desc_residue(dwc, desc, llp)) {
 			spin_unlock_irqrestore(&dwc->lock, flags);
 			return;
 		}
-
-		desc->residue -= desc->len;
-		list_for_each_entry(child, &desc->tx_list, desc_node) {
-			if (lli_read(child, llp) == llp) {
-				/* Currently in progress */
-				desc->residue -= dwc_get_sent(dwc);
-				spin_unlock_irqrestore(&dwc->lock, flags);
-				return;
-			}
-			desc->residue -= child->len;
-		}
-
 	}
 
 	/* Residue describes source reads; only RAW.XFER completes a transfer. */

-- 
2.53.0

