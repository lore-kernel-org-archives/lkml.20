Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AAA3ED5DA
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896576; cv=none; b=tYH/Bv3KA7DIeNigaSfbiRSARzrdNJEnUOn8NBSjCnrp1PZ1YnCGncN+9PYgXzCc6Uc2D0fqemOrE/U6iPzsaOJ0DO5ejoXXSbvVSgqTyxiyl6vnhJbW86Iwet33w2d9+UL+kbqCiXiGZzpmT3l7kxRKMJyA0Lm/0uh7Dae64XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896576; c=relaxed/simple;
	bh=Tmu2iOBSum4sCidWBK+rRsYXL+/qGEiGufjpG+9emsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4P8KNYgX37QvII0v6fya8pGy+HLiwu/BNNL5wZIhK7GEDwTK9pL1E8sifwn3dGtR9wuomHXfzsilLyp6QPVVE60gzEwyMQpi/6jP/IAYBIM3URWThrGtT+VuK6W6WIaJPTZh2tHsOHDAflnMqBN2uv/d52BPxph7QaGuqEK35w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3qfrTqA; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3qfrTqA"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-39e37c430bbso985012a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789896574; x=1790501374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sug+4f+tGLe8RFcRq2oeLrmDKsMlqAOb6R6Xgy7yp4w=;
        b=P3qfrTqAG+794yqsghTR0p3gYTcx5X8bV9zAVgONta9mNhauziPVQyYPNtQF/a7c27
         adZnygAFRwQlp53RZpL2kWcTJPp1b/CRlUmCVLAlveRO2v0l3p7TTVvSovb7rYzlCjYr
         jloRKI2PoSsJ2Sh7tfqGAqTcYh524VfVGXnsl3Sc02y8hAIPmeFdgWUoHLEx+i5+sOpp
         R2egmo4OmGTgpITWKLEn/K7/7uyS+rfJJST3nHgUTfzHaXANe5go7PWHZJwl3rvCzzk3
         hrg6n4ES76jgjiM1K2Q1V+6VxVBlckSZ6m9hxFA5At2dzUIeSqTwV/5lidlOXRYi+Bmu
         dq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896574; x=1790501374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sug+4f+tGLe8RFcRq2oeLrmDKsMlqAOb6R6Xgy7yp4w=;
        b=lTt8c6eiv7q3rj9YJwYo2BlYEp5Nxly8oMlZdZGs79hABfDHvKwel6PxTjSzW1VU6G
         oB5FcHG+i/D14kM77pXEN9Uc6BW8jx4T0OFa8csxtTLrVXwT4zE/1ZAEvpm69Yqa5YHA
         S/p059v1pMsmb98mDk85L8+cx7mqLnmA94+EwXHkjOMJ3Js9H5e30BzTPoGUkKhmIndC
         joFzua+wg3PBAmqb+nky444jKBWqB82UocyCTrae6FRmtkeLY8nTjWuct7Hi6XhWd/rN
         /ah0QiazyBl3wLX1kH3Sw1pdsFibGYwYVxddggHEvvr6rvnPE/CNSclXFUD5kkDKd6W3
         r8oA==
X-Forwarded-Encrypted: i=1; AKwUvByBwAn4i+2GQ4wjf26Y66MDkldcTQh0xV5jwMuxEmNJnwNeap5WhWWjhu7vCMfP2FItdsuha3V++1Hd0CI=@vger.kernel.org
X-Gm-Message-State: AFuF++lNavTjHa8dNXxW7c/wT5hyxGiwP85URS1zYZbr8fH/+BWTjay2
	lkOC3ahvxTCbTj+aih3Jcwv/6OwtlZMy0jZi4CcICAuh9prMBoa9m6TI
X-Gm-Gg: AYBFou3YCY5CrFBuskVr6eArISx2b/Kp6dnX+RxuwvKKNrJ6KLB5YlXonEccCjdJ38A
	87DD0XskI/VRlZ2sDxXDaI3wVvjbs8ZcDgYtmAUrTocm8ULiX6J908ExMqKY+mclXoHTO7VYo6A
	wtJU4PWEoVPysQ5OIQlYjBCRhddYMHXM3XfYdFAqeIgD35EXXpB/MPuiiPuROpWSmE4OSYKoTnL
	1xGNGWkxzjI9VjBhD6JAyQ9RE8YccearWZ4CNwEtfRYoDROHEDkMb6SF4LOpXOV0aMegqkvSuR2
	mNcZ35shmsex9khnh48CBMG3tuGjH4MgCv4nKzeNaa12eLU1gDSUilJWwYLlkG0xu5HJ9cIe5Ar
	bFkwFP9MypeCfPNZj/sfkBc+HHWlQZ6CmHrhwFSJsGNkmxb2X8v7luQWleW4jiiAKvwMb2DNoGx
	oyn/HKhSIGug9c7ip3fFjgrxkyHqFjiAztwOtayYO0+PoHefIeLLz5z9cc+lM8NK7CWnBv0KBLE
	uTJTqKHlX0=
X-Received: by 2002:a17:90b:2d44:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39e54ce36fdmr13649499a91.12.1789896573869;
        Sun, 20 Sep 2026 02:29:33 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c64csm8154917a91.10.2026.09.20.02.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:29:31 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v3 5/5] of: reserved_mem: reject static mapped regions overlapping existing reservations
Date: Sun, 20 Sep 2026 17:28:52 +0800
Message-ID: <20260920092852.614973-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920092852.614973-1-chenwandun1@gmail.com>
References: <20260920092852.614973-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

memblock_reserve() permits overlapping reservations, so a statically
placed region whose 'reg' overlaps an existing one is accepted. When
initialization of a statically placed reserved-memory region
overlapping an existing reservation fails, memblock_phys_free()
returns the overlap to the buddy allocator, corrupting that memory.

Reject the overlap up front. Dynamically allocated regions are
unaffected, as they are allocated from free memory and so cannot
overlap an existing reservation.

Sashiko found this issue in [1].

Fixes: d0b8ed47e83a ("of: reserved_mem: fix reserve memory leak")
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org [1]
---
 drivers/of/of_reserved_mem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8d2057f2ac12..2d1e01c0f886 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -141,6 +141,10 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 		return ret;
 	}
 
+	if (memblock_is_region_reserved(base, size) ||
+	    memblock_overlaps_nomap_region(base, size))
+		return -EBUSY;
+
 	ret = memblock_reserve(base, size);
 	if (!ret)
 		memblock_mark_rsrv_rmem(base, size);
@@ -343,7 +347,7 @@ void __init fdt_scan_reserved_mem_late(void)
 			continue;
 
 		nomap = of_get_flat_dt_prop(child, "no-map", NULL) != NULL;
-		if (nomap && rmem_overlaps_check(base, size, static_reserved_start))
+		if (rmem_overlaps_check(base, size, static_reserved_start))
 			continue;
 		if (!memblock_is_region_rsrv_rmem(base, size, nomap))
 			continue;
-- 
2.43.0

