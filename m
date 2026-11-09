Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197590;
	b=RGnI5rotThb9CoYlq2ruKOoMWq1Vh8yaHURR2gLiP5+rqhRy1COfLfdtfZrDr/gXxFfS
	 R+J5RW0QdVzcfZrdUG4Z2ofox5WH5/GXLUcR2bf3WNwiL05Fj91dKcbxuGS8xLxgV8qCB
	 1CRfX5/hixiok/Ic5LrByvPVjxhdKv6gjSZoeXYornKZvFEVRT8crkROb39bWi34QDNHR
	 VJ0hmeLQTinNBbG33QZ09sGJM1uL0mrSLAe4u5E9cUtOsuVB2WpicfBruRe497Bho0BCu
	 2zaOXLfobCgyaBsQbYQ0ujN/x8Wsk1nYZWWdpeoUJiVwznKT3cH169ZKhicn1lMaY0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GpZVHPRvFdICpmEhISBdsrZ44k2hCO0g1nkjm3tP3aY=;
	b=3oV0/MhRLnRsVSCxqOPixpYvbh2YA7E/U+G4BhKRxjdQON4z14xErV7xhvBPlfV1uLD6
	 8pV+Oq9BNJ9LFXf9xqop6ePVHUNDs7kGxQkvJDgy4SMjCISA5Uaqi5dR+WbukDVA9yTew
	 zxL6E/O1bURC9WxRttU3OoEaEluj96TefzvVF7Z+5uI2H2p4eE+wNoWGovRS6OWCAqBlm
	 WPs0+jISA3W7sY1evysKtSp+IbrEIsnehR254bP14DG1pEmTUVPyyC/3a4HF/rgrTmuKr
	 9tlfb7y3mUH3l67iuWP4Nn5yY4FXXLegKK+1phD5vr+xxJ3JehyV5vEfwt/XoXHUrwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9U7Nqaz;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6958606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6958606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9U7Nqaz
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so508487c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197589; x=1794802389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpZVHPRvFdICpmEhISBdsrZ44k2hCO0g1nkjm3tP3aY=;
        b=F9U7Nqazd6w1BY4UZvsglzjRr8yuY48wXD+9pZ0Jde5WqdaDTRraVM5zD38cbP2n0L
         se16UpgdK41wYMfa8X2kU5kEKV+/Twk+AUvySKfEeW9pdlsOcH9EPWTh0UvFtukxcCpn
         sDZMXnPgqZJ2TN9ZBAGFmVJQ0FtpaX8zam/aT7i+DTE51v7owEBF6qRTTHr4uugmhU2u
         YSP42CsaHDbOETf/XkQXJwlVk7HtoehpiY4LPbEvqK/G/Y0p1KsAGwuDOmk1zbAWWxdP
         LRLJoupygZbCqWEiwnBmXBH7F0nKjaXXliS7BJDmW+jwcf60sQ/HFMu2tkWPTUK/daKF
         7L+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197589; x=1794802389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpZVHPRvFdICpmEhISBdsrZ44k2hCO0g1nkjm3tP3aY=;
        b=snY9dscEHisfdJUaBglQZyOXCQ+fDVxrN3EQD9m6Od62WXPK+BY7GI97JJbgrGqWWr
         Z36BN8jEwUHI0Pt1YlA7P9bC/kAHkzh9Di5Ob3EVlCDoikGXFZV1S04eluoGEcs5yw4d
         EhGpcsXTGiOF9w+QDYTZaG3sq+XRgWQMBGnXqNstL32xRGjrKX1MvYetLrzVP6jmkW6D
         841OYSOksN5RYdHMysrJPCeq7xzzGH8P628kdg24agHfXe3YvSQiic2+0/MjA9iuun/O
         FPqVAgKNXxXqnwwRXEYCpev2fqHWi6vtPqGiip/IxlDyX9RhTnH28YUaF8o6V79dK/8S
         BfWg==
X-Gm-Message-State: APuU4Z84H3CB65JX6NndlxFwjaZS4OSGmWjovS8ceKo34CRCozBkmf9p
	xBx3rwQZIkn7RyQreqdWdZBiGiShmN8GpgZojdqpJlo7tnSDt5UeASET
X-Gm-Gg: AYBFou2RUXgJL9py8LqldSnsUpTz5ecFJRRLGDq2pfmzvfjxtLyRaF2pIw0NO9yunkW
	VtViJbw73hgwS+FhXNTGgZutUT7fJFKbchwmelFc2IvRXmd47RfyNoColbW1GFeifPkgpKNYfZr
	/IqiAo8iKXaU041CcDDpRgVP0GPI9BOaW9vN6haaE1yMrbw0fT5HiDbJ7sAUT4Y9l1KhxtU3yRb
	0B+9oVtilFyaLEZsEPkupBRHx85+yyDIIMqQdlXtQXvpCQcCnIYz//nEEJMRoSkiclKOsj35aNR
	zVYYeOopw22uVufHMgNQkVGgBiXBEmjFaNgFXwEXtuXtocGqGlrZsbnlnGikTw7aWIsvCuI8IuN
	zmEW1SUK/aKUAKoLkXClPZwGL+hWj5CpfMJx2P5JIRqZLGgxXPFVV9f0B9gQ+b5ErTyQO0gvpJw
	sjasD6LwPa5koWOnAR3LsRH/I5VILG5tv9p2SGcl3dPxs1CR8RHbg0oSxqsxL50auYdZmFFnc+3
	RFz7N2i7ZVu3J7vnUUeJ/68uoGDIcuzXOPg0FQoAqHcSzEU2fJ4fNC9If8KhlURk0zW/yMWKu0k
	+9q/V3V8mEXAMWvQDkwol9h781//ERnb7eFGmCZnT2B7xAA6exbo
X-Received: by 2002:a05:7022:1586:b0:1a8:b566:80c2 with SMTP id a92af1059eb24-1b39fed11a6mr4682908c88.17.1794197588809;
        Sun, 08 Nov 2026 20:13:08 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm11506527c88.10.2026.11.08.20.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:13:08 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] debugobjects: Fix NULL pointer dereference in kmem_alloc_batch()
Date: Mon,  9 Nov 2026 13:12:10 +0900
Message-ID: <20261109041215.11280-2-ekffu200098@gmail.com>
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

During boot, debug_objects_replace_static_objects() calls
kmem_alloc_batch() while obj_cache is still NULL.

If kmem_cache_zalloc() fails, kmem_alloc_batch() tries to free the
allocated objects with free_object_list(). But free_object_list()
always calls kmem_cache_free() with obj_cache, which causes a NULL
pointer dereference.

So use the cache passed to kmem_alloc_batch() instead.

Fixes: aebbfe0779b2 ("debugobjects: Prepare kmem_cache allocations for batching")
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 lib/debugobjects.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 877f7675ba26..7ab1fd8e0891 100644
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -315,7 +315,7 @@ static void pcpu_free(struct debug_obj *obj)
 	WRITE_ONCE(pool_global.stats.cur_used, pool_global.stats.cur_used - ODEBUG_BATCH_SIZE);
 }
 
-static void free_object_list(struct hlist_head *head)
+static void free_object_list(struct hlist_head *head, struct kmem_cache *cache)
 {
 	struct hlist_node *tmp;
 	struct debug_obj *obj;
@@ -323,7 +323,7 @@ static void free_object_list(struct hlist_head *head)
 
 	hlist_for_each_entry_safe(obj, tmp, head, node) {
 		hlist_del(&obj->node);
-		kmem_cache_free(obj_cache, obj);
+		kmem_cache_free(cache, obj);
 		cnt++;
 	}
 	debug_objects_freed += cnt;
@@ -370,7 +370,7 @@ static bool kmem_alloc_batch(struct hlist_head *head, struct kmem_cache *cache,
 	for (int cnt = 0; cnt < ODEBUG_BATCH_SIZE; cnt++) {
 		obj = kmem_cache_zalloc(cache, gfp);
 		if (!obj) {
-			free_object_list(head);
+			free_object_list(head, cache);
 			return false;
 		}
 		debug_objects_allocated++;
@@ -527,7 +527,7 @@ static void free_obj_work(struct work_struct *work)
 				return;
 			}
 		}
-		free_object_list(&tofree);
+		free_object_list(&tofree, obj_cache);
 	}
 }
 
-- 
2.53.0

