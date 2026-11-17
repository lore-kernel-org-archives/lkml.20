Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894107;
	b=EvWVQaU26v7f7EXCYKkP5bftiKACAuJKU7mwGlUWkjkCaJ9Wm/Ka1Xnn+bQNBuoVCf6y
	 WXohD1oIOMkpefluAEMgOtqENR0/gX5cuBPIHMmYmsYlu6wIshIJgFDXMTy4KGKMum3B7
	 sGIg75xuwZkIkaXpJMP12EdavUjNVGjC+gW2GmZrbJBq7i7mrsqjjHufwy95ZP0CMi/OY
	 Z3WQHy2ywc9wGs7EeZMzQz8fbO/+eADpuQ+DIHYUEgdMgjfvH2NhmJkClFXrExyK2LmYS
	 dcCQB4mlUr6YoDW5pwnAq2rKb+hyE+oATM3sRaFOd2eS+2qh/AKllQyenJp6myUnoLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dA9ysPynFG5IhwyWvrai64rvuE6c8TdYQjatwRCwrmI=;
	b=bwu8UxolOxbUMIudDC0rfmoLxJCMa9qbw6sn/laQok7cUUSA9fzgPYQBtk68tSLpkufs
	 t3g8KZ/SuOq/7bQgQ7E6SEN2xQFQazhisChmR0IGoVV9MhJ0NJCYUp+/pZstQ1Rgaa8Qv
	 RFpvuBnIPsDeFPWbgN+HPsEjvvf9B9xbDEUHcAU8aPQwG49UBm1L+1ePEPbRTYu+KpENm
	 4zHVrxDhcz9SC8s/+5BtbjLAR2Q2/sAa4kRASKuUUKJkyXQwppKlVattqYkgw5Vi0sOAc
	 WtAZ4+U7XestbeJ4Zz+J5DbgmkaFpHRQ+XdDPqsnBxtpIsj5xaSJbgmJe98LAw+AOag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwibq2Zx;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D69A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D69A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwibq2Zx
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6199865e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794894106; x=1795498906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dA9ysPynFG5IhwyWvrai64rvuE6c8TdYQjatwRCwrmI=;
        b=rwibq2ZxDI6aSuHJCyP/adwhBjemoMzjXOwZaySMmv1X+GrMsTBpKAVGtA2y4PEq6S
         7uXFV5ZQeZNemVmdZWRQKEiTZOMkLtLIVnkYYHv7ypjmFUracUOroHs16866G+FoRIay
         F+lRNekHDCvtu17I7oonwomAsXc3OMUterkpRgi2al9q017/HtRRk0eTU3eBCF6CfDIH
         DZzuIcznn3Gwk6zLPPDyci/kTx8iOwQC0V0NbCFpXIk1EBNb3M9QI1SF5rVAGxocOBE+
         B5j4oZlYCuhAgqwz84EmkESEwcK18ifZ7QdlpWGT2RTkCsjnbzVQtoWwoCO8yYhazbHF
         B5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794894106; x=1795498906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dA9ysPynFG5IhwyWvrai64rvuE6c8TdYQjatwRCwrmI=;
        b=lKNpVwCcQt74ngmE3qLYRg9JNTRAvO3qOjioFh8ICCgw/NXfBMqdIxbUsIpNd/P4ym
         GAt9spaamIFHtMtIr4GASUx2N0NWAMte7mGRH+DebN3Uq0gG3RcIKQ61d0ZMdoKIBHc5
         oNpNCDI0q9zZOYsFBzEHS7wGrdWMB27NUPd6+Kotj+YLAPAInR2sqcj4+R/d1+uvK+T2
         VRlg1H8OeGFsnN/DvSTKD1MU7gcsfxFMn3obpr1jL0HVBJpjVK8p5PVCdkZsHSWmgArs
         0A1nu0cVCWjZbSAoRAq8mdX7vAPGUSgd532YPg5srFSrKZ8ajGxW4n45nXkZ8fHL/gjg
         7WJg==
X-Forwarded-Encrypted: i=1; AL+hErE9q05kM3n2O1XyZxRinWZXBjM9/kwaB4bhZ1CPtd2FNVDKVq1m1f85/HHua78IAswQr04flpyx7pMK3Lg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+SZraL/kV5ygPCxgncjhv8v0vpAOPhiSK5DT/5A0KgyVz0T0S
	mxrvDBRIcS4q3fCncXQhuAT2R1cR3gm3/z3cS4ykr4lk+ZeIIQrQZVck
X-Gm-Gg: AYBFou117Q3T/JPlbrz2ggtp/u00XABDyGvJy8+BJ2+ksOT4r3gNOn93YUrnSd59yVm
	43UmFt/tP6lvPdhf+IJHVAkEjIO65VLKRuHV9d3zIMsbeeVHgrg/eR6AHBpTMN1gCABYOMZImPD
	Udkia0Saa2ntDGLBFf2yMJVeeMEPhuwRjN5KTmpSiixFw+zvcxSZKcXL6uD6hpHHzhJIpHAwMa+
	kpq9COTfV7shqjUnH9ZSm0zD45hPSUjqX1u6O0g1Tj5W+5caHNfQPMwMOtz9A2lou/6FTDyt6RP
	vbVwiTf+7p9yRWd0CzwK1gReNCwSH2RpR6GZn/14eRDHPE5KpmQlkkZoHMy5fHH+IfsvE24MVTI
	+ycoBc0CH/jIY/FST64Jo8jv3YmEuTXASfGJKPO4QeVFR7+zNyFnyC2LSteJGgW8RlrSCCZnVch
	1jZi1zlenaJa4WDpCvxTlvTIRRRij6v0KG+jvR4PeEH7YULXqjpDvveVOVrkZOQYSSO1f7DGYhy
	eEQ9TTXQ/vklujXhQu5+oXdLdUiIeQzgqGr4ff2+59pQseS6EwAOuEUlm3vk5sjWxsiHKzUgrY/
	6BGjNglT4N+tFe8vjp/2PpgLFDgfvCWowIcbUqeEliN4
X-Received: by 2002:a05:600c:678a:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb7838dc68mr35404145e9.14.1794894105609;
        Mon, 16 Nov 2026 21:41:45 -0800 (PST)
Received: from localhost.localdomain ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb68c00b10sm125348055e9.0.2026.11.16.21.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:41:45 -0800 (PST)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: dmaengine@vger.kernel.org
Cc: lars@metafoo.de,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] dmaengine: axi-dmac: fix incorrect segment size calculation
Date: Tue, 17 Nov 2026 08:40:54 +0300
Message-ID: <20261117054054.22409-2-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117054054.22409-1-matsievskiysv@gmail.com>
References: <20261117054054.22409-1-matsievskiysv@gmail.com>
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

When chan->max_length has a value of 0xffffffff (which is a possible IP
configuration), DIV_ROUND_UP returns 0, resulting in incorrect number of
segments calculation. Fix this by using DIV_ROUND_UP_ULL division
function.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
---
 drivers/dma/dma-axi-dmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index dbc31b185c4d..30ea905840fe 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -706,7 +706,7 @@ static struct axi_dmac_sg *axi_dmac_fill_linear_sg(struct axi_dmac_chan *chan,
 	unsigned int len;
 
 	/* Split into multiple equally sized segments if necessary */
-	num_segments = DIV_ROUND_UP(period_len, chan->max_length);
+	num_segments = DIV_ROUND_UP_ULL(period_len, chan->max_length);
 	segment_size = DIV_ROUND_UP(period_len, num_segments);
 	/* Take care of alignment */
 	segment_size = ((segment_size - 1) | chan->length_align_mask) + 1;
@@ -752,7 +752,7 @@ axi_dmac_prep_peripheral_dma_vec(struct dma_chan *c, const struct dma_vec *vecs,
 		return NULL;
 
 	for (i = 0; i < nb; i++)
-		num_sgs += DIV_ROUND_UP(vecs[i].len, chan->max_length);
+		num_sgs += DIV_ROUND_UP_ULL(vecs[i].len, chan->max_length);
 
 	desc = axi_dmac_alloc_desc(chan, num_sgs);
 	if (!desc)
@@ -839,7 +839,7 @@ static struct dma_async_tx_descriptor *axi_dmac_prep_dma_cyclic(
 		return NULL;
 
 	num_periods = buf_len / period_len;
-	num_segments = DIV_ROUND_UP(period_len, chan->max_length);
+	num_segments = DIV_ROUND_UP_ULL(period_len, chan->max_length);
 	num_sgs = num_periods * num_segments;
 
 	desc = axi_dmac_alloc_desc(chan, num_sgs);
-- 
2.47.3

