Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792546585;
	b=l4UrT2LFmRbRRIaFb/zL//mdoJmvKHnKbftTEYfLDDfLwXnwZbNigM2qgrn8MCpUYkEl
	 rHqyWq3hQKHVZcYK17tCKaKItvRaemGjOQotaDdHXrxHVtcnWcw3NiQy070cN4/M1Kq7s
	 gDfAI8j8Ep06mdxS887G231VTKTNsO1jzUZF5cQabPnyJWD2ANxnO1XnHj7/XQRDrL1At
	 Cr9ID2MAvdAvChluL9Dr/ddccR1B5u+lELoN2p1OJzXV5NRsypMG4fo5c3/rO09qKiBYD
	 8mDTrh6ozsofGsUz6LvxbevYzwZDtEfC12Okn9OPSRcOf4RBc7xeD3+Ye96oum98BBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792546585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ax/MKBRp76FWn3h/ZPK32Hkl8AkiS00UsCUGIQD4n0E=;
	b=G8Ym4s/pymJZFjo8ytXFI5rasB2k9C9Cssr8qh69wBrIrjC1+irhv8RvjRfmOM5AbWBF
	 Hk07cOtivSTFSZ9Vs/JW03TGjUXCnwoS2k2rh4Te3m6gFhzIgVHugOxOxANIHAszKN32Y
	 SmPy/7sSmgd6WEtXPMdyE8FOYt7N95E+D00S57HZq9clsoVQc89FV5o1pCbIDJB+CffvR
	 eCoJzIFv2ZIgdfKkCi9SM4g6c88A7JT7WfappYmKFYOXHeGUeYH4vjo1IxZOs4wEr+REJ
	 etY9iD63HccAYK+NJEXSJ/66YeHvKjxhXPQNl4SbmygiMhwFVS0wCnTDEX4kyS/4qxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ou9lYyav;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF1606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DFF1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ou9lYyav
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36758ba1f01so66807eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792546584; x=1793151384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ax/MKBRp76FWn3h/ZPK32Hkl8AkiS00UsCUGIQD4n0E=;
        b=Ou9lYyavZBg15vkdakrlmd0FU6/TQ0XKtiphUaKiLjVJYw8DX8HQImOgtJvkvpTOFb
         WrnHn2nCKay6lGUOfRAdPwEAHJWLdLJG10TmCjutc6vj/n2K6rYmYf3gbMDYQL6NkTHj
         tadho/B+QJqjY+k9jtTed01CVh9zhA4pQ2pD4Ho/MFmefusfa7rW/mkoBCVyrf7v8ujI
         snd+7YP2pY2HzTs+NNNVUEhJiTCChcsXo1HsgiAqwgbMv7OlzIM8tZtdE53/jRMFyLE/
         MRiglMdmSTh946wRJh+jcnwyBg+XLDpzVPydwo830LEZsNUt8XIh8wLm8kKXpXPkityE
         4UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792546584; x=1793151384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ax/MKBRp76FWn3h/ZPK32Hkl8AkiS00UsCUGIQD4n0E=;
        b=YPSMfRJs0p+ui8BR+nDp9XYPpYXAsrPLzqSVqlqe4x6vZ4sZodMon1qekOMNpAQV6C
         RJZZ8zuPOUSKOGBwssNJy4aeHKQVtU3dgydwf9vW0CDyXwAYlGlQAHvsMUaGHkryLUnV
         5QhawdNnem98xQB3Ak98FhHbpvJ2lHhL1kt25ffOBalnkBu4Ck2jEjRBWx9wAWYIo9kT
         fdA5+uHMDgnXVEuTNM8+GN8pim5VahcRU3PV0d6uuSjdabHfCUHGghaPlyckL/DxkCs+
         2yEk1f54Wi5X7X+xJvYVVp8a+XZZbi4ViXNQDhhlLXfGkwJfDt7FL0q7gN17t6OD2rYN
         nR1g==
X-Forwarded-Encrypted: i=1; AKwUvBxqJTJ4jNbqp4hreQ+TzBEh8fnhx1WdGDeo09eVvt/9niY5LSYXARh8+Qq+f1+Bsy/1JOIi/Ab1KSoAbg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT47JNLJwxPNk8vGOCgQnXTaRw0a3xg/BNDSMKUL8EZTQ8I4x1
	gHaHnCGA285UKJxLwoo+j/HFXN0Zf4jJemmlyIbahQYXT50+33h3PORENQjcaKhzfaU=
X-Gm-Gg: AYBFou2Ld2+v8GlxQOtPfnUaUH76CsTfW44ScPirENExbar4jvdY59nDaWiFqCd5DZS
	CQUIktw39qV4SNvqcUoXFp/u7nB0CthvGIr6UxkO+zO4sAz2RCUM8htNDzPtCJqnZanXIdekd2X
	6b+nQwoX0MfsdWnrHqwzi2CEqHdSQLnZc7D4BeqMQRn44ECd7lHmExhNRadexz6L97WMBoeYfUs
	YH9dOGa6KNuNAi7i01K7ASFlEA+MTrfsWJk7AV2/vEMdu3ktIRoROSzcdQ+IwGPa1cMw3AJni8W
	+FhRtLjdI5kgvrZQi5FG1F45RFM+Ixb60mc7NrsBPa/yHp4cUJL9HbeAOoDmX6zYaqk5IjEOC8r
	xQsO0Ob1bK3+5qVthGyIQ34l5vj70goOOWyrzGVnCycSgaqfU1p+VTVpCZ0TN8PCmFhsofIpzAE
	bMvwUCOga6mIzts/Pfoc3FSzGu+XDFyAzpKDnWWvPfEBbPmR7LjVT/l+5LQRPr4BQVccpjYzdcP
	zUq//gxankoskId9E2cGUkYdUN7Nrr3n4/ixB/S1zeS52nGpQwZSKT2k7ZLUW9Yyfu7Ryo0OkFI
	SyzrSxA=
X-Received: by 2002:a05:7023:a8b:b0:143:72b1:9004 with SMTP id a92af1059eb24-190a87a3b70mr819537c88.45.1792546584157;
        Tue, 20 Oct 2026 18:36:24 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm2991870c88.5.2026.10.20.18.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:36:23 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: willy@infradead.org,
	jack@suse.cz
Cc: akpm@linux-foundation.org,
	shr@devkernel.io,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] mm/page-writeback: avoid 32-bit overflow in dirty threshold shares
Date: Wed, 21 Oct 2026 01:30:46 +0000
Message-ID: <20261021013046.23997-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The ratios used by __wb_calc_thresh() are scaled to parts per million,
but the threshold and ratio operands are unsigned long. On 32-bit
kernels, their multiplication can wrap before the result is assigned
to u64.

For example, with a threshold of 25600 pages and the default maximum
ratio of 1000000, wb_max_thresh becomes 4125 pages instead of 25600.
The shared threshold and minimum share calculations can overflow in
the same way, producing incorrect per-writeback dirty limits.

Promote the threshold before each ratio multiplication and use
div_u64() to retain the existing division order and rounding.

Fixes: ae82291e9ca4 ("mm: use part per 1000000 for bdi ratios")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 mm/page-writeback.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index eeab25d6ce36..451750df8b74 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -894,13 +894,14 @@ static unsigned long __wb_calc_thresh(struct dirty_throttle_control *dtc,
 	fprop_fraction_percpu(&dom->completions, dtc->wb_completions,
 			      &numerator, &denominator);
 
-	wb_thresh = (thresh * (100 * BDI_RATIO_SCALE - bdi_min_ratio)) / (100 * BDI_RATIO_SCALE);
+	wb_thresh = div_u64((u64)thresh * (100 * BDI_RATIO_SCALE - bdi_min_ratio),
+			    100 * BDI_RATIO_SCALE);
 	wb_thresh *= numerator;
 	wb_thresh = div64_ul(wb_thresh, denominator);
 
 	wb_min_max_ratio(wb, &wb_min_ratio, &wb_max_ratio);
 
-	wb_thresh += (thresh * wb_min_ratio) / (100 * BDI_RATIO_SCALE);
+	wb_thresh += div_u64((u64)thresh * wb_min_ratio, 100 * BDI_RATIO_SCALE);
 
 	/*
 	 * It's very possible that wb_thresh is close to 0 not because the
@@ -916,7 +917,7 @@ static unsigned long __wb_calc_thresh(struct dirty_throttle_control *dtc,
 			wb_thresh = max(wb_thresh, (thresh - dtc->dirty) / 8);
 	}
 
-	wb_max_thresh = thresh * wb_max_ratio / (100 * BDI_RATIO_SCALE);
+	wb_max_thresh = div_u64((u64)thresh * wb_max_ratio, 100 * BDI_RATIO_SCALE);
 	if (wb_thresh > wb_max_thresh)
 		wb_thresh = wb_max_thresh;
 
-- 
2.43.0

