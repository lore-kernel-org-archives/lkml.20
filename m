Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744782;
	b=o4Y9sSMss/LIiHPXQxDWZs6N0lmlzeHDUo3J5wwYfBMLPWKidwCahlNN7YVPAtr7za/n
	 abIlzGtPCEWKlCZwQw3QCav/rM4P1EzdH159OUeIgz+1IB5cYBwriaz4GyVkGPfOExfgF
	 W+Tp34AFW2u3cMCXOWZZXxo2Z20ikdCw0S90ar+0qn0tKpOhzL/FUfvxejS0HoM3H/grY
	 Ei/xn6fNI/pJ31WNDBWVwq3rdmvW3+kqQEUF6EeRNemjt4jfdZ35uEMLglYkn5NfoClj4
	 wpZR2vwS/EXE0h5ESKiKV5q0+ivORFMl2ZZCY8Dt9e/oKRpYCjImcAkzSI4ksldWzrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=53Mxv6Sk+QV15vE2tUEyM3M6ZRlSEp1NTwwg3jt+yx4=;
	b=2p3a7r4F0dpty1hne9ydMhpEjG3fMTdOeaXQDjOxVKP3yDCYwA53hDgKOf3jdRMesUmo
	 f+pWnWoF9PTLIAN+9tig4hnk28RU+TMmVlAYuF562cY4CKz9q150x4TOR4BmfsTKVGPci
	 WwZ3LId67lduIyj+tBDvi41WC5OcjtWbduX3rQ6DQOLAwQI4p75V+rdgU5CSXkMpiBDIS
	 hRJSo3/aBJdednGimFWBlUKohNRgiDw2PXJZq+bb6I7ADzbhlJdU8FbTAq309WqfQ6U/l
	 2QgY+D1PuQ/ACKqYatu6Pih14dMGF8CX94QvkzdnIQo4NW/kye8xm9Sror65j2q5YiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jpqcMezn;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48B606D827
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA48B606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jpqcMezn
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4f699fe49b3so87659b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744781; x=1794349581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53Mxv6Sk+QV15vE2tUEyM3M6ZRlSEp1NTwwg3jt+yx4=;
        b=jpqcMeznvYhVooDMyNV9kX9spxN3n0M/xsJWgGWyKsIda13X7kTZbKJHk9gFrEbbi/
         YBNufG3ENVGo0jGoqG6f2nSVZwsalTV23KZ6K7hf8unEjh4hfBm6SHGs8joX6dJCgcLO
         AukjPVONFeug11OR+g7KK4XHH+ElkHT3ah+ec344LEmr8CLi0Sl3TL4pSmPdIegGNVtb
         1JRs74h0UGpkip8UC/9QLYLqSOb95GR0gzuEitUy/lFukTt/qfUY/wvQVRE9WDbilrZY
         RyKypMKnzE9AegSM+yZ6MsdzH59JGEWthRmDGLu3qEfWQXS4op2P8pBZlI4ipM/zrdK+
         aB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744781; x=1794349581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53Mxv6Sk+QV15vE2tUEyM3M6ZRlSEp1NTwwg3jt+yx4=;
        b=hroqW/Smxq4TEno6sYKgnQ7yeOTUcmenxoOJHeCg4Gew6d/sIbSHm7yxKiZvyTaSvH
         hUP0o1b8D8eDCdxnP0DvxoMxxUjAM10pCU+t1lv6M8z9YKgFT+00TQFACgZDGzg5b0cF
         h3MA7a2s6BMgmR9E1rgxQrFdETbcD30vqmi2PAQXanyJzL7ZBl/98M0ppMHIi2vAzPsl
         mmHIuLpw1F7Q77i0Xau1Jq5aM96KsNU8Nnsw9274G3irmaUStkGxZsTjsn2gFqtOUtSQ
         oN418lz3yAIf0vm6gayxLq9shiba+RoMOeWOm8oZKzox/W6UpQhr2VisjhACsdge+ECz
         yTIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT9OyBLFmu5WT3isZ7hkrFfkShiV1ofh7YLTUBlvmm70emiPaAMU0m9tskHxxpePpoNl8W2XPRG6Axv1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OrqwahNua/0tH51vm8raWrrR++fNFnd7AykKAdLt4BeszeObw
	1hFmUrc6Lf1sthBP3QAQbw5odA4SKCLNJOdaXovPnXqXAnoQj8W1tHkH
X-Gm-Gg: AYBFou0OL4KgPQvxxnvulNjLI1wiBq6f4n2ybdUxHdaKbCQXnZLVvzZYQHt80o5KZMO
	s9IgIc3GwponLP9/nYSJdq59w7LTruGsxBhSIGOuvhS4xeCUjND5yq2IP5SG63ooSoXOk0frMD9
	VAQNuI1Ly3Ai5dJM5KXJwVsT2r7/KC2ZQFMe20u5O3t9HXjQCM7f1T8Vq5ukQwM23ogYi0DAGF+
	mjcynN0qNxKtyX//kKINyrmLDmdTP65dOipSoGdBL+jmejASt9R8o/n01hcjjnSaoO4MWz1bnAB
	CdLsfmqAaH90yxGlz7roHtKd8ImYuKy/APRhCGJfi+CuxIhtX0JyoAbCsdfTNJMBZwsiYDzbj7Y
	KMhDtDp/afQCdPPZGgPD3HvDj9bUii2a0bSuY+ZazrqOPVvGYxDqe/K5cDXjDIUUH+re0f1/T+3
	6AVN2IU/6WdGjcRT1XkRdlx7Rh6YagrPDcnc5eN9wMa5o+vHnGeomYr5xeSUAuuSXBAGF9ZO75e
	0ZU5rh1O5b5kg6TqGfL3L9uzi9IYleL+Ik/yeeI/dPOTxqicSv9+vocvsXFmNJbF59qGPP1D1sF
	T2gZtvUd/K3z/NFqk887lYByhBK7bSLgSlBw88I1fK/rTjYZfFqZSLpi5ZzSceClIektCXYANxS
	OypUHt/i+go8g08qGgoBbqOFiKPomF1SLQ+f5uQFPdF0Mgycg+CNtQqfYP5WIiXlwzZV/y705BL
	8EB2sL2PsQ62PyClACpYBQ82O3Q5m8DYVz7HAorezChRpGEU/lyRk=
X-Received: by 2002:a05:6808:5387:b0:4bc:cf33:7024 with SMTP id 5614622812f47-5640dddcbf6mr9361158b6e.42.1793744780622;
        Tue, 03 Nov 2026 14:26:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:06 -0700
Subject: [PATCH v6 04/10] dmaengine: dw: extract hardware-LLP residue
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
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-4-2ee0c348224d@gmail.com>
References: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
In-Reply-To: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
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

