Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015482;
	b=bg1mAF+66HIuhEpUkCR2HstTjRHsBlxodHw3Ewp52bZ4HTUEgxvom6TqzuqYPqp0s8GX
	 BXjRN+Rzviz/xq0fUuQZXGmnor+3lfmL6telKy+1B+YmzeMtSnjfQXGY2g0JvT0HiDC0U
	 otS60umKpt58fPiTXy2ymWcSDl3wUmQnJgbGkLWSuJeJC5rjoUDINW4nhpoIg95UU6bw/
	 TJEH6ayMKKs8Vq9yzoYNeYAQAQDcTxy/JP++zT7Dp3pXDwepqmSjnMMR/Uoa4zI43onla
	 okRW05nAKT8bW3l22ln+FpjUEYfib7dElhckwDqHVmUSMBgviFutaAqLXA/F/ISW4eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E0esgy2urAKBegODgpBIrC0VFP99XhOfXo6f3PoumB4=;
	b=UEvmM6Sv78XcL/oN1UKuA2JEN/jtK3dEbcDPnZn3mzIwXJDtiyrMz/WvRS9V1wk3cM9S
	 l9xUIG3fkye3qD2AF3MXzXmTteGuVs17lEMAZhTrgP2GVMnhW9JHW+u6qdn8wakGJjBja
	 HtfM2ebnP9gYsdakxxxBVW58JDn2E3NL1Vwhn/9AGoiyMgTw13qWKKVysGfFP58xjDMxr
	 LQdjdfLOe2F+J/v2l0ZlwtTPxqU7nR1WEwaI/TjnuyT7V1ah+AO39mEaFe4nTdg27LAga
	 ZUE+ks/cZempJkjMhFkUCPWTf9sNnCo74z/OK6WRBtugLwKtRokRLcPvQaI4ZX3RNkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="MTMfG/zS";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B20606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B20606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MTMfG/zS
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9995ce866so26400495ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793015481; x=1793620281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E0esgy2urAKBegODgpBIrC0VFP99XhOfXo6f3PoumB4=;
        b=MTMfG/zSO17kLWtg0vfDzPd9SeenV6eWXy6nibQcCTOrsg5jSrv/OJ0E9CxXJ/Oaaw
         ElJY41x2nd40gtPnGitdFl7htTsVne+gSi5b3VOZZT00z9DAEBDnWh9ddyw+bWtk6e18
         vqw2LPqTJe3pZoaKzTrq0qtLop5bxyo0WDMvZfcEFZQQqnyTEZbQ7o34YIfZWAnnOU1T
         kJcs7aKgTx1TdMOBeBNpUbMi+side4DyJRTXmujvIQvmlj8/E7nAa56110lERY4w9eJe
         aZA7dV25dcpk6PfEqfKL7pZc2EenyVNZEVntaPOUi8+OH1a2jJI82LfnRRnUqBnvouNC
         LceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015481; x=1793620281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0esgy2urAKBegODgpBIrC0VFP99XhOfXo6f3PoumB4=;
        b=hgKh9ubh1SunZBH4BbjKJ/mlJcBRWbOQZy7Vro+y7o6xoOPYAmUlCUYmhN5t/PkshF
         8qOVKc/v+JUIe2ZXGlLFOcHDngcV2oc72RIDY5oiJGVRQzDW8BG9jhE8GPlhMiv8Bi/6
         Dw13mur9dH/7maJCnXLAm3ljGj3SB8NKfJTGDBXraZZEtlNe/e3bgCUm9gJnxIhCTz+7
         9hkFvj1TgOOEnsWf102MKWtPOIny71k/QVv7zGagJecGvsiqruEqkIwunHUoF6/MYxBb
         JiqKHxFqwK9abMvuMTNpUkwbBoiz5TwYpGrM/bLZRn/0VGuGzSYdnLZ3ycwZ7BIZpgUH
         qeeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOL0WR7PJxKRMLwH5P1YfgGe1SDz8ZM2fhHKq4s6+T9ZB+GHgTNwcosj5wOFrGDtBGolChl6aclKjskiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxHRsWpOenEx5FKfKEt8fV/IFQm3m8cf1lAeyOCyOmSW9NXFod
	r8BLKIE7LnYQTiyINteUJTZx0XW5ismdjLKUWXyJpg9kKpDN81SaRpeC
X-Gm-Gg: AYBFou3f5+4gIlDZGuurhsajU1zbu0pv16bBfzethi0/nj2pTbzRzOE7zRX/reG2iJi
	DgbLI78A66R40SMNzJmPEu3fRmfDeAJ5TYZy/0C39SKoe2NaufphhRHBMH9btd2BwGu2g/OBtU5
	EU+E9BDvz7l4GXPXdZFMIMUUhHfS+ljNwNMZ/Ayp2iKqSo6Nhrvt3RjvR7UO0eROBaLSRSiFhwm
	FpuddCp0Ncr2peVoaqvUs2JBIrbowGcvEWssr9klq1TkqvpPrnUFUkDbr+8cF3B/TnLWSumLPK3
	/5ktAfDKZlch45GNnRcQM8O6Gu5JthBMUPUVO1eks2x89X3XhtKSR1GKbFvfYeDqWNomy8wh1J+
	IZH32Zom7fLDY1PEA2vwJj9RpztAgx0hn86h6Bh7JTSZ8EQOSbzIdXUESv5JEFDoQlMc7HbH9Sj
	d/MKHyxDL0jfSlAook/iCEcNSoKvDHcv8UkSepV8rJlpAPp11L3YE9d7//cn9duwskq2cpO4yJN
	n6phvoy2Km8wd8Og1PlKEXT/nwT1r/YXwe/5YSrTcscYOUjieetg0xu18nmqRPPri9zjm09jZc=
X-Received: by 2002:a17:903:fa8:b0:2e9:740c:371 with SMTP id d9443c01a7336-2ea9c6c4eacmr54260345ad.38.1793015480745;
        Mon, 26 Oct 2026 04:51:20 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af32271sm15443585ad.9.2026.10.26.04.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:51:20 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Keguang Zhang <keguang.zhang@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] dmaengine: loongson1: fix list_first_entry on possibly empty lli_list
Date: Mon, 26 Oct 2026 19:51:13 +0800
Message-Id: <20261026115113.3359939-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

ls1x_dma_issue_pending() calls list_first_entry(&desc->lli_list, ...)
without checking whether the list is empty. list_first_entry() does not
return NULL for an empty list; it returns the container_of() of the list
head pointer, i.e. a wild pointer that points backwards into the
enclosing struct ls1x_dma_desc/virt_dma_desc area. The bogus &lli->phys
is then passed to ls1x_dma_start(), which dereferences it (out-of-bounds
read) and programs the DMA controller with the garbage address.

The list can indeed be empty: dmaengine_prep_slave_sg() forwards an
sg_len of 0 to the driver unmodified, ls1x_dma_prep_slave_sg() does not
reject it, and ls1x_dma_prep_lli() then builds no LLIs (the for_each_sg
loop body never executes) yet still returns success. The resulting
descriptor with an empty lli_list is queued as a valid transfer and the
problem only blows up later in issue_pending. This was found by code
audit; we do not have Loongson1 hardware to reproduce it at runtime.

Fix it in two places, following defense in depth: reject sg_len == 0
requests early in ls1x_dma_prep_slave_sg() (a zero-length transfer is
meaningless anyway), and switch ls1x_dma_issue_pending() to
list_first_entry_or_null() with a NULL check so an empty lli_list can
never reach the hardware programming path. Neither change affects the
normal non-empty path.

One related pre-existing issue is deliberately not addressed here:
ls1x_dma_prep_dma_cyclic() derives sg_len as buf_len / period_len, so a
caller passing buf_len < period_len gets sg_len == 0 and crashes even
earlier (sg_init_table() on a zero-entry table), before issue_pending
is ever reached. That is a separate bug in the cyclic prep path and is
left for a follow-up patch.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/dma/loongson/loongson1-apb-dma.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd2..e7eb40584 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -302,6 +302,9 @@ ls1x_dma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	dev_dbg(chan2dev(dchan), "sg_len=%u flags=0x%lx dir=%s\n",
 		sg_len, flags, dmaengine_get_direction_text(dir));
 
+	if (!sg_len)
+		return NULL;
+
 	desc = ls1x_dma_alloc_desc();
 	if (!desc)
 		return NULL;
@@ -478,8 +481,11 @@ static void ls1x_dma_issue_pending(struct dma_chan *dchan)
 			struct ls1x_dma_desc *desc = to_ls1x_dma_desc(vd);
 			struct ls1x_dma_lli *lli;
 
-			lli = list_first_entry(&desc->lli_list,
-					       struct ls1x_dma_lli, node);
+			lli = list_first_entry_or_null(&desc->lli_list,
+						       struct ls1x_dma_lli, node);
+			if (!lli)
+				return;
+
 			ls1x_dma_start(chan, &lli->phys);
 		}
 	}
-- 
2.30.2

