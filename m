Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562837;
	b=epHnWSjiO2ZEVxSUcBxtMWvdQO6sKWKelx2GSCGwDZb/7zKYuP9GDl5wbcurPQ1eq0B7
	 odVGbGI46LNqtm10pszC7pG23+qxvSG4aNbKS65ley/A3qXIWx1ouhCxtxnWFOuVqIQaw
	 S1cFALIOIZcAMGoLmBj33HRj2+/SpH59GadUslYQ8lOxa9i1xYOkL0LSFHXDjQ4ZGC0mx
	 d67qdmoEAIpjSGbjqM+9kG786hXqz8sObdVc0nsVzSM21HihwD9NQKuXeDMpKg7ZJvzzd
	 aJlTavuWDURY3Fpmm88Op4IXlwjqEQ1ACi01Z0EkwVn8m25BEkxLtkdCNGSKWNpeaog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fKaDERhzPbkXN7Gq1dg6sjNw7qQA/V1PTTySjHjN2d4=;
	b=eesDmju4BEyOIHedVciF0gcH/AwQLe0wlD9D8N3WrYpl4nbZiFiYirpmnX39OXbkUht6
	 hLhocfSDqAotoGUq6VLBWS9DMgxlzWYEkx4kT7Kd5/4fqGlU60LVOd/+xOJ76yYS+fBQU
	 QUIUFLuiFXMulfIRT8aEv05BQT77K7AO6Rt7CX/2NyLIT5Ps1SPcWLD2ZnGn3YO2n6UWY
	 ZFBNYgv0WsXX8uqNuBcC+EaeNeaEbJAjFLmiUZ8iAKhof/oXpBWlkNL2MzGVX9AjIT6YW
	 L9LpJPzvUm5iJJG+cEFhk4Vsn98Eop9oQfSAH/NlmiLw253uJM6Wu9SG0FP7YvNbgLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gmPsU5A0;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AD460A2613
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06AD460A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gmPsU5A0
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso340838c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562836; x=1793167636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKaDERhzPbkXN7Gq1dg6sjNw7qQA/V1PTTySjHjN2d4=;
        b=gmPsU5A0udQnjW1Kk0RVwWRDw1aGaaWBl5groR9VnSYKEnmFFRbNIZ8vk8OI+w/gFs
         OfHFHESQOQRlKcAd5c12KWmNuTupXgcf3tk0YSkkRfW3QmA3o9PFqKyGXdScEmt4AFa+
         P96V452jEG4+bTEN52okYDYh87RDYuEFt9LpDELgL9Nj36iC39moEROlZh8zVw/aXAHe
         NYD2TAKMMoRtnsFsSzTFvpT0OCvuIjJZrywmDeslm0NS15QS4RnQvPhEK+9A4gsONefN
         W25LiRMSXTSOPj5JiPA0VT7+vWNtT8qBdewth11rD/S/3diFP5RwEMIAxCKhnkbnVTSs
         3OAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562836; x=1793167636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKaDERhzPbkXN7Gq1dg6sjNw7qQA/V1PTTySjHjN2d4=;
        b=mWhemWbPcUE5KHf83zByjinemT0Y56dHmcAlG+mn1Sb0zVzCK81s9WYJbT74xde4a0
         LVeJrk1PTqwnNzcR42Zal0oPRmofnXRAIQ6Pkt5NGshNAHe7rBkCJsZSYP8KlvzJcpc0
         DCu4Om6/oRw+pUQK/1c95xTMgqBQBWPAymmNFa+/nfd0ka1VXhT5iqXU4c1r9kvoOlbK
         RWKVgzdx+MhwAUstb7jj+fbzwGe7YGxawHIRB5bc6rDq7I4emdgiJWl0f89j1UHUiRCa
         yX0nHvIj0wFOrZi8aFqaW6IYRmIEOleH/VaKZQoaN4pijxCZO0fIYwIEsrl8iDcJ9TG5
         opEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsuh4tOl2u7zMdxM1wS0ky+otY986xMeZoJKZ8wHkWCqDVw305GNcfpZsYSDdUBuUAWcBsa+0iQZUFOkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCvE8lpe2S89qCTw6SdZkQvyRuOHoBn75t8caU7vWnj0f2va4v
	idHBZ/8+fvJOhfkgScZdPbVYdeXvciuy4+CgFF6EpapDhhAs6+xgBUN/
X-Gm-Gg: AYBFou2ANIWBppJ9P6EMAw+LCVgRYBeSh3iFVl+5ragFY9/dPh0z5w8UkS3EtiC9FYc
	bWpE/rZfy8ON2dfMX3ak+Uheg9fI0oAGNJknWvSe9oeYD0rX5g5OJnTNOSCvMmtWmZDj0BLLBQR
	ApuYIpnzu/Q3YiACmI0kSACpkq1OJJyqPPtK86VO8lXS9oFLmYsvhPkQPbGH0ZOlPdTYIl2/1ch
	H9hWha0jjt/JR+tVAfTKKdAQnZ0OsDWfm3kZnUjuhD6R52iXB2VESkVNUWcKn54gUoXaSOPeGbn
	632COVwrpHO77lHxZ0OdP4j4Rq3ANeM+bsGVSiCMnQ5FiUQKQL3Lt++cU3ch0b7pjYq4srJvoxq
	0jXq7G8jUjL0vbAyzT7kAt+YCBH8c5ON5pO9MHnkpg+D21hth6fAhwgBDA2ColWAMue995rGCVq
	eeCT3gVMmLiescS+ICrAwEAYzbZdF9wLMCXfs/O9Bo7RyxRYpULBJBQnO1+5BQihkHd8W1S5nTT
	eWe3NP25SEF6C9EwQm8dxaxc6CSjVFqAZBetNwkJquupVHLISAYmidPwZSpjPve6CprHfIjUUFg
	18u4x34=
X-Received: by 2002:a05:701b:2608:b0:144:c127:dd1b with SMTP id a92af1059eb24-190a7f02797mr1363525c88.39.1792562835846;
        Tue, 20 Oct 2026 23:07:15 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm3504720c88.3.2026.10.20.23.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:07:15 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org,
	jack@suse.cz,
	shr@devkernel.io,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] mm/page-writeback: avoid 32-bit overflow in dirty threshold shares
Date: Wed, 21 Oct 2026 06:06:54 +0000
Message-ID: <20261021060654.27855-1-dennylin0707@gmail.com>
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

Use a u64 threshold for the three ratio multiplications and div_u64()
to retain the existing division order and rounding.

Fixes: ae82291e9ca4 ("mm: use part per 1000000 for bdi ratios")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Use a u64 threshold variable instead of repeated casts, as suggested by
  Andrew Morton.

 mm/page-writeback.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index eeab25d6ce36..1d6aab8781a5 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -883,6 +883,7 @@ static unsigned long __wb_calc_thresh(struct dirty_throttle_control *dtc,
 {
 	struct wb_domain *dom = dtc_dom(dtc);
 	struct bdi_writeback *wb = dtc->wb;
+	u64 threshold = thresh;
 	u64 wb_thresh;
 	u64 wb_max_thresh;
 	unsigned long numerator, denominator;
@@ -894,13 +895,14 @@ static unsigned long __wb_calc_thresh(struct dirty_throttle_control *dtc,
 	fprop_fraction_percpu(&dom->completions, dtc->wb_completions,
 			      &numerator, &denominator);
 
-	wb_thresh = (thresh * (100 * BDI_RATIO_SCALE - bdi_min_ratio)) / (100 * BDI_RATIO_SCALE);
+	wb_thresh = div_u64(threshold * (100 * BDI_RATIO_SCALE - bdi_min_ratio),
+			    100 * BDI_RATIO_SCALE);
 	wb_thresh *= numerator;
 	wb_thresh = div64_ul(wb_thresh, denominator);
 
 	wb_min_max_ratio(wb, &wb_min_ratio, &wb_max_ratio);
 
-	wb_thresh += (thresh * wb_min_ratio) / (100 * BDI_RATIO_SCALE);
+	wb_thresh += div_u64(threshold * wb_min_ratio, 100 * BDI_RATIO_SCALE);
 
 	/*
 	 * It's very possible that wb_thresh is close to 0 not because the
@@ -916,7 +918,7 @@ static unsigned long __wb_calc_thresh(struct dirty_throttle_control *dtc,
 			wb_thresh = max(wb_thresh, (thresh - dtc->dirty) / 8);
 	}
 
-	wb_max_thresh = thresh * wb_max_ratio / (100 * BDI_RATIO_SCALE);
+	wb_max_thresh = div_u64(threshold * wb_max_ratio, 100 * BDI_RATIO_SCALE);
 	if (wb_thresh > wb_max_thresh)
 		wb_thresh = wb_max_thresh;
 
-- 
2.43.0

