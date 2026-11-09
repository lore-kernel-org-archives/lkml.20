Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197591;
	b=D4apQrPvPv66JFnY9EPGixD23pPZqrDUlm1iJWaMnVemVBM+VWT/Hs4ddxnWA4HgDedB
	 9TC6pfO2z6o1F4MGGwtRGn6um6Q76d3zJ3Cce27oFEs+6e7BxB2SgZCRp82jg2NRzkFl7
	 f0Z8+up3/2Hc3tCxZZu/HemMMkR3s+GSqAuqeqCgaA4m7Urw6FbfsSZc3sA5zBr7+SzcB
	 qG6IX+8aVCwZqe0u9I0aEUGdT7xdJkA6+CvmrngE/7Bpj5VS2v0K+IsPNUQ/WlWen81zV
	 bSXjzfMcONYCH1ebtVcKGT9kkE/FIgMrhmwEmRTMkfjeLtiYAse38EbDvJJEGXYJD2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Iy52RwLGRfKnDH/rFQXD8QCrJ9L9UoFdJbC/a/iOdDk=;
	b=hJzVO9IKEt3yOLzl5RM+4qIOSNcseqB1KDkGPxA5gyf+xPoJtQrhMwwZ9c+HwxxrHs9Y
	 E4YHTMBG7aEN83mdiNWTchGNKKTqi7DcPqZn1sPLS7pEcj7JjKK38VlPjJmdxmzlSYbqh
	 SGZ4zcQevkRtKUZtjjuxxtxIP6EeDf2c2/jA+rF5OIHOLmrrh/6W+DNOp7Ay+AODuqce3
	 qZ5F+3P11OtmUqauFQYBBNTtxteaPTRHLcnyZmYvm84VrZrJisC7hWdyvtp4uKes8vfNv
	 Pg591NrA3dFA8xl9XrX3XIQwfUHixKSAJ0ieN7+8WY0XBkD+S8bLvcSaUAS+Athcwuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9wn+2xv;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C31606A333
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C31606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9wn+2xv
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b2513decc3so448442c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197591; x=1794802391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iy52RwLGRfKnDH/rFQXD8QCrJ9L9UoFdJbC/a/iOdDk=;
        b=x9wn+2xviU7e8H91OFd/S3R1Cd14kBXSkrsxeLAbUbpZKo8x64ZC3U0pAEKXTf71b6
         c49ID4lDe76cq5CaAnkVDxdrCSesApcqjkxaZkHEIvlHL4Yydzpcq3ZhozTQCsK4DmGk
         FeqggG+j1xw/oKVd+gfu1KYEAPPuuk+JzvlRon8u9ypeBE7h4N9YMsZZrkXiV9/PF0DW
         rFwPgiAVs3SB2BFuSzFobiG8ncmJHB7V4rCnCihh2G/0DFyiThkXvRQrS+wPn472CerK
         JyOM96QGSG5Sto3VzlDbGKax5ACAw3sU3CTDm26zu5MlXE6QbxZ4Ntkdtl3APncVndV1
         Y3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197591; x=1794802391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iy52RwLGRfKnDH/rFQXD8QCrJ9L9UoFdJbC/a/iOdDk=;
        b=1OY76QDDs3Msb/zAzgG6RJ0H2drJnkBLx6pCPglJR3+qTccBh5hHhps235hpmz3ibx
         rmf84jIFmgu5ES59PpEMFQ3E+OP8VOzreU6EtG/4EMBs8EFI4vaQqJ5HViey+M19GCTs
         ir3cKIkxZZ0QqZoZ9qRh4uR+MC2AmWsYWbzkM7rokOFpeTDDI6zVzO0Jxty27HaSG99m
         u1rkQF+1p4/6gyjIhBif0F2KfVFpjDwbmhzL9l8ahn/IG0ma0cMwORvxZ2lyKOVRynEK
         swT+FzpQAWND21gIzEqCaD+0N6fFV2/tKzYZMEju/8YADQztySVjLnEU1/SGMi/gWxkv
         O3Yg==
X-Gm-Message-State: APuU4Z+A3R5sF/J+kNI6lh8WnH4Jajg7N8P8paC1aUwbVGr+DvZ0CiI+
	C4ld2PQD5+1TTnQif5ihiCo+m9LXUzBJKihy/03yeT1CuGX4de78PCXJ
X-Gm-Gg: AYBFou1wxnKpGqLErgzv/lPh/OIzyU5qBY5PlzEhgvKv2DKaTu1Lb9i3H+O9oFJ7N/W
	qvVhBn0+NgUyP5Hq1y7Ql2OQLKwC7Ws/ZayoQJ8x7wrK00jgYNHiDjAXJyqF4U3p1gWORpMMaeZ
	4JjPnvhpzDRoFEYynaoV7yhJ8wpVYw22GChfi3ke0maNOaUvyv7SRkHR6OaMzh/GkbI5ABcico/
	t9EwS7/UzONbzOraM/oPBpPbZuI765lxIN7mVnrdUcPMsQQJZjBvLK3PCWIOtBTSbx42Z5xHH9c
	aVLp9IHacAY/vwElmKo7Qsbw5lWUAJNOo/rZQk/SKzrkb1WAYbq8cfzY/Axa5DYsIDB0mCnEhPf
	3mdHIb6eTlRlJWaxm1LdiZHo+tFF6ZpFsb8w0vjMixUNp6eArXxZbsY1nGNsM2DbvUSy5+pa4i6
	GO4R8pf7AojL7GinycJxXYBepHpshmFOa5H9OBlw7IVGwos8eZmVfGdOVJ9rNv7I0DT0PWSmAEg
	ryZ7+5fHIl6HUq4Ckz669wJYszCSG3vzG/DOdBKuuaMpVxBC2F0xy0OM1SdRUt2pBDV+oJdEka6
	b5pnNEYlhUcHrkDgTlQIuzTWQyqc5oUq8WFUeBdUdwlJ6IgU/kUz
X-Received: by 2002:a05:7022:b0cd:b0:1ac:d029:70b5 with SMTP id a92af1059eb24-1b39ff08a4emr4770147c88.33.1794197590502;
        Sun, 08 Nov 2026 20:13:10 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm11506527c88.10.2026.11.08.20.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:13:10 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] debugobjects: Use free_object_list() in the boot error path
Date: Mon,  9 Nov 2026 13:12:11 +0900
Message-ID: <20261109041215.11280-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109041215.11280-1-ekffu200098@gmail.com>
References: <20261109041215.11280-1-ekffu200098@gmail.com>
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

Now that free_object_list() takes a cache argument, use it in the error
path of debug_objects_replace_static_objects() instead of open coding
the loop.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 lib/debugobjects.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 7ab1fd8e0891..b066036ff37e 100644
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -1502,7 +1502,6 @@ void __init debug_objects_early_init(void)
 static bool __init debug_objects_replace_static_objects(struct kmem_cache *cache)
 {
 	struct debug_bucket *db = obj_hash;
-	struct hlist_node *tmp;
 	struct debug_obj *obj;
 	HLIST_HEAD(objects);
 	int i;
@@ -1530,11 +1529,7 @@ static bool __init debug_objects_replace_static_objects(struct kmem_cache *cache
 	}
 	return true;
 free:
-	/* Can't use free_object_list() as the cache is not populated yet */
-	hlist_for_each_entry_safe(obj, tmp, &pool_global.objects, node) {
-		hlist_del(&obj->node);
-		kmem_cache_free(cache, obj);
-	}
+	free_object_list(&pool_global.objects, cache);
 	return false;
 }
 
-- 
2.53.0

