Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B65293F1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873244; cv=none; b=TFoyxWeahnUW7yJWX5XOvr6i1Cjv8YhLblrMw/ozeUzHmg2qPLDdjHMHTVZjytrmeDnu01A2bqBWXUGctUWSa95+aFrd7zM3itvO3Pj1DuQAd5Hjtu5W3jlqJZHuggja/2+TeiWgfRfGLaPxFe2SGzbzKWNlmJLDjpPPAgL+6X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873244; c=relaxed/simple;
	bh=FYqm+GsASgpEWtygiWMiW+youctcu6LAF2/V64dk65o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EqfwEYdY23dfzuB8lO5RURW5Z3wmhy0Nzr0rcZyLGbm4e5xKMmDT2+xaHE+NG8YTJUgKHSevhF9UnlimrwssghH6m2gfzAW0EaAuqx8iRjlzpi1uXq+r3u4L/jgcQPUuISomRxVvq19271uL9p17accqBUjUGI41k9Oup+b9L3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Px7+P8fU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Px7+P8fU"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c20e70a0962so585555966b.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873232; x=1789478032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45/BFWfpuwLvqqEgE/wDbYZ6sfAlzPF75sDMeqn5VJA=;
        b=Px7+P8fUviPYHmOOYO1Vhvxjj2V2SeBraW3b0/cz5tYxpjaH49Abh1+PL7mAWbV48o
         a7rfgrjEOB+FOdZgbMoocp71zmPWawMIUvpnxI0nXJOfv1PqoCy+VnPCK+ZOARIMiO/O
         z1N/dExphleylTYQVGXidEhnC/c8oa60qHCYtpeXm0/fWRU5WQW5ZVmu+M+4XhzppwUA
         pWc/eZ01lbc9wSiuP6TXmVqehx9/emmgVEOcndnlNRGdriYmwOq1+Ced0BkFqYO63A58
         9kz91Xuu1gG/hJab3Q8Z+XEL1LZjp6/D1wKukad/Xw1x05XU66IjCGahYy+Ef+oLOsBU
         piMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873232; x=1789478032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45/BFWfpuwLvqqEgE/wDbYZ6sfAlzPF75sDMeqn5VJA=;
        b=j8lhcNqs75MMbhSXial27cf3mrk4fg2X2m73lqR3wz/d6JJribNLNlY7Ix4xOhuffH
         rsv9DrAONronumZb/G9h6Xb/y4oOyZ6F0RtQh4I5TIqCQ5sO+L796jzdqkfwobUf3AoT
         8PCrqCcFndMKoVKGDeKpynxwT3Jr1Va/8FZ74Lu2Cr38hS3PCc0m5QwmCYJhNBK+ttCc
         h7TOtDTA2iowboemSa+qfolGWKn50u4BxPP8CkkZkSFlTWWvqVcd3cg+FVJTwHTcmN6j
         W+lajdi9plNd3aWtVDGldsWnFYMrB8j6ewWFNyQTeAuLPKI9V163APlYBLtUBZ4CmqHR
         FAuA==
X-Forwarded-Encrypted: i=1; AKwUvBw4al24XEVUuD0+N0wnL/3bX2r70A6HfISVPfdOMC0+UbFcfC+fH2OQmlqxulbXdogsP139Z3ccadzHcKc=@vger.kernel.org
X-Gm-Message-State: AFuF++kZwVTqYiSHXUQWjuvspTB7Sa3uWP5Y4UFzPngvjHV2KvvM0G5f
	6GFpqG5fZRbntkRsVk4qz+3QWEmzxRCeK9w5v9sCSnlqBvyf01O91gOJ
X-Gm-Gg: AYBFou0x1th1pnjnXhOm7xWcz0HevvqPCrwNdFnV5TBJQDzhYn6QMfXy5dpzSkvsm41
	1oTrW6DbHgmT6uiDMVwQMQ6CZnVwkmLtseXeVNa2gdrKUAHB2wY06LVtfpRPqn55F+tu8BxZNZQ
	VVPQnPQBbIBevoHt8n+CzJRUIfiAiRqEjEwt1sClBlzKaTrqgpol1jVvv92aWfiBmLEPGcso/Uu
	KcrzQ7x6qIbN5sl1eMzMnhz4aFL+SUOuvdjk+G4HZXZLAS2qZ81ZuIl9fpRYx3qwIeihoXHfW9y
	7I3rgo1JQSMe6VQAyhtJeKIb5+cweOpfYDDfmyiKp2jHIGoBDiMPsv9435Sxsb5DMZm3gLl2j4e
	I8NQpvgSu/j2FwUf6QU3SOViUaWr5XVWnt428rtuR1s4yjWW/Ft1uzf+D3bv16hRMnZ39cNzRJo
	+MiYIUNLl9XKvDy50QQ6Np/7TN9t7ie9j1bAHAC+kn/hUvd1I1EIE=
X-Received: by 2002:a17:907:9490:b0:c25:c7a9:7b8a with SMTP id a640c23a62f3a-c260c9dfc11mr2001513766b.12.1788873232277;
        Tue, 08 Sep 2026 06:13:52 -0700 (PDT)
Received: from [127.0.0.1] ([2a09:bac6:37a9:1e5a::306:1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm625170866b.63.2026.09.08.06.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:13:52 -0700 (PDT)
From: Caleb Kan <calebkan1106@gmail.com>
Date: Tue, 08 Sep 2026 14:13:34 +0100
Subject: [PATCH RFC v2 01/11] stackdepot: stop preallocating after the
 final pool
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-stackdepot-trie-v2-1-1996d5cef732@cloudflare.com>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
In-Reply-To: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, Vlastimil Babka <vbabka@kernel.org>, 
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>, 
 kernel-team@cloudflare.com
X-Mailer: b4 0.16.0

From: Caleb Kan <ckan@cloudflare.com>

depot_init_pool() decides whether another pool is needed before it
increments pools_num. When it registers the last allowed pool, pools_num
is still one below stack_max_pools, so the existing comparison clears
new_pool.

With new_pool cleared, stack_depot_save_flags() can allocate another
order-2 pool after a lookup miss. depot_keep_new_pool() retains its pointer
in the global new_pool, so the allocation is not lost. However, pools_num
has already reached stack_max_pools, and depot_init_pool() rejects every
attempt to register the pool. It remains allocated and unusable until
reboot. The non-NULL pointer prevents later saves from allocating more
spare pools.

Account for the pool being registered in the limit check so registering
the final pool installs STACK_DEPOT_POISON and prevents the extra
allocation.

Fixes: 31639fd6cebd ("stackdepot: use variable size records for non-evictable entries")
Signed-off-by: Caleb Kan <ckan@cloudflare.com>
---
 lib/stackdepot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index dd2717ff94bf..90c52f2e0d3f 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -323,7 +323,7 @@ static bool depot_init_pool(void **prealloc)
 	 * NULL; do not reset to NULL if we have reached the maximum number of
 	 * pools.
 	 */
-	if (pools_num < stack_max_pools)
+	if (pools_num + 1 < stack_max_pools)
 		WRITE_ONCE(new_pool, NULL);
 	else
 		WRITE_ONCE(new_pool, STACK_DEPOT_POISON);

-- 
Git-155)

