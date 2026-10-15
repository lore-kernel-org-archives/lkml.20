Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A7659C968
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096998; cv=none; b=Tb2QVc0pgXcyUxWcWBLr4RKDC/MqU0EA/OYyWeeQw84geLwubynSRLjinUqsk8ra/UbROj9f/nHZwMAdrVQrvEylSvN8fp18ShCjWE4Utp8+Y9K+9YBmtks6gCyzZ78+s6Rh2VQzJzB8VsxbrWNiliSOUWm/g/LBdMT8J9giQFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096998; c=relaxed/simple;
	bh=8Di9qigXUDyNOrzACu/IjvQS8CZV98qXR9LZAd4EhC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulos4oK9bZiQ9k9y6BNQ5Je3KOMWyn93EcerpFtZiq3BCyhsBAE7hhnOnvhGkiaogRPqRzPnVzBR4ffWDhjufAU+d1UyWn6MqZ2H0qNxCf1jGbDC2lhhycxjFzJt/5KGOvYsOdcAxB+T8C0y/2C4L9J4toPjECjjKiCLsTRW8YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7lXfCoM; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7lXfCoM"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2108388a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792096995; x=1792701795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0wSQN4j3y/wqDxcmHCHdz0iAfBFTqdwL5Kj3XHoYIQ=;
        b=c7lXfCoMbeGIm8bs0ntYN3bJjxrp9NvMgJvnmfCsNcc8NuJhbOq1U6EHJr2yqZ3Dac
         G3B/1rxm9Vkf6Nm1Nd4wxVURCwbYpDR3c5u60Z9l7o4a0ci5WLmJZsKizR8yzGqMlStf
         WquHN2Yf8T+06XHkLnzsipjQTMUNv4MAH5ujOLN/sBsFYz+d+2NnUfnaWct1C69mYQct
         rD4sSxlFj4Z9jgbS37zotZlLvU9CCls0n2slET5s4UR/co4P+DDGNMw98uCKoFOAI9o9
         oHgqs8aEa+nzjPhxy2CRhptyiXQ55ca5K6DqGFhXngTHCRBD1MK40Wo0ABfmxcCKgbEe
         1mRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096995; x=1792701795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0wSQN4j3y/wqDxcmHCHdz0iAfBFTqdwL5Kj3XHoYIQ=;
        b=QdVDRwoyxDT2b9MlCNU6Ty2nyKY22rm6VF3p6NOrLjmCaYruqk6xKS28fBkqbZGCLq
         PQlcraglgyDUQ2EaET7foz7Kd33YpwzwsrmBKcWI1nHn3CFq13rI/XAS9LT2wP8etmaA
         cNqkNmIQZFQTzrgv5MDccqF4ISEwMIu9hSvE0n4GKMeLUIoOlN7oevkTI88HE0Pmp0wR
         LtkMDDWyl5DymtYWgwpKY5u4KMVimFNthsslz8FwBlhsHSBMvqAgjARDe2yRpvN+/8hY
         6honYYwl++LZcVLbXNCgxk1U+h8LtvG9Z8xCU7KIDeHOpdko0ktg/ZVvbP1OKnlhQAyT
         gosw==
X-Forwarded-Encrypted: i=1; AKwUvBxMQEh6WtUceIJjU+Gxe8G09+LMBG3kql9FDES/cEMM/JxEENbEmKtDUlRb2LFN7h63t+u1HqIKrobQN18=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/ehrXTQWMRgpbKp2b9p/YbNCPgVLj4mE6x36ob8vp2zaZY+uX
	L54byn/5Php2jiL4paq6hDtpN/O24jybAAxf3V76PZFFmpQo8GwSiSbqNE1xIg==
X-Gm-Gg: AYBFou2ScMVEua+P0RGocZ+NmjjgoDJz7L1mcPaKvCob3GyAzHKC0w+PRgXYPs8MVDo
	/IxCN7XqsoBMuu9Ewg1cKxFKW5RWrE1Hd5ki/NjMG+X4D2h9x+rtiHBJOXvzfhLuZh8LhlzPN7j
	RSVW3oe0kTRra62HjlJF/UHjqClc8nIHfzGvU/UG4F0MdLi8ugYgB+mfrQnQqtQD9z/sr8er53S
	a9Oru5eLLGEd21O4G2oNbssDufSJyOvyMc0MmZfShvC071K7ubhAcdFulo0Mqbs4ha4ZL3nPzxq
	WdbkM881LHgcb5+sDtN9GRiRZ5TFVU/PoRRz6xdqLekihHuiYCyt744NfKhSCZYDnNFXtx0rB3Z
	MXuOMFxHNuYVRA9VGiT1ZNLk/A5jsxe0juCJ9/pI1I8xoSTngbM5pRLKYrsqOgbDrDChNLoIg7E
	ePOaPr9Ws8EMOfjL2hzAl+Y8LX5AN00JvEqlZSvcIXZjiqagLbVb423uPvO1yA8MfrOur3u8YRz
	DZ5A7ZFekHRAOqYp8/syjSNj2+OTMw1pMs45vb7yO9+e7XOFFhx9g==
X-Received: by 2002:a17:90b:2681:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ab3ac578ddmr16320662a91.11.1792096995407;
        Thu, 15 Oct 2026 13:43:15 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::a891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9d266d6sm106429a91.1.2026.10.15.13.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:43:13 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	fvdl@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] mm/cma: do not count skipped ranges in cma_declare_contiguous_multi()
Date: Thu, 15 Oct 2026 14:43:09 -0600
Message-ID: <20261015204309.42630-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792032699.git.skunkolee@gmail.com>
References: <cover.1792032699.git.skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cma_declare_contiguous_multi() adds the size of every candidate range
to sizesum before deciding whether to record it. Once CMA_MAX_RANGES
ranges are recorded, a candidate smaller than the last recorded one is
skipped, but its size stays in sizesum. The replacement path already
subtracts the evicted range, so sizesum is meant to track recorded
ranges only.

When more than CMA_MAX_RANGES ranges exist and one is skipped, sizesum
can reach total_size while the recorded ranges cannot. The sizesum <
total_size check then passes, the reserve loop ends with sizeleft
nonzero, and the function returns 0 with fewer pages reserved than
requested. cma->count, available_count and totalcma_pages still
reflect the full size, and the final message reports it as reserved.

For example, 8 free ranges of 1G followed by one of 512M with a
request of 8G + 256M reserves 8G and returns 0.

Only count a range once it is recorded.

Found by code inspection with the help of an LLM. No kernel-level
reproducer was produced and this was not tested on hardware or in a
booted kernel. The example above comes from a userspace copy of the
selection loop, written from the source.

Fixes: c009da4258f9 ("mm, cma: support multiple contiguous ranges, if requested")
Cc: <stable@vger.kernel.org> # 6.15+
Assisted-by: LLM
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
Resend: the first attempt of this patch was blocked by Gmail and was
not delivered to any recipient.

 mm/cma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/cma.c b/mm/cma.c
index 527b2d894f3e..c2cdef953ee9 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -594,7 +594,6 @@ int __init cma_declare_contiguous_multi(phys_addr_t total_size,
 		size = ALIGN_DOWN(size, (PAGE_SIZE << order_per_bit));
 		if (!size)
 			continue;
-		sizesum += size;
 
 		pr_debug("consider %016llx - %016llx\n", (u64)start, (u64)end);
 
@@ -620,6 +619,7 @@ int __init cma_declare_contiguous_multi(phys_addr_t total_size,
 		}
 		mrp->base = start;
 		mrp->size = size;
+		sizesum += size;
 
 		/*
 		 * Now do a sorted insert.
-- 
2.56.0

