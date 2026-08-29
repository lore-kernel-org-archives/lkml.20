Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659031799F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972336; cv=none; b=Awr+i7u6V/VQH16H0q6KDws668M8XoIe+TNk1Ky/9jkDKwYayhRubu+kQuHUc/F7KqX1Xmd8OE+m41FVQMM0A1rshRgewZHUEq+cWBatKfJVHPkjqA3owFuySW7U6etvPMxLnPAwjE3CRHV921XAqFlX+IoOkJ6l2qR1Q1Nb2R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972336; c=relaxed/simple;
	bh=HDvGfOfeG6jQFfKPu1mbtaioAPDajhVCjI3+HmBefuI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=f+fUF0rygLGzr9lmMtLsJ2XCI53CGHQAhCqEkkr3yle+tXEC3WN0RbqsTaAhUQN5L1dd8bmW4jIYCSvCAfzfOkIbJIHX3Y9D6fODOHRgQApMEQJszaUhY8Sykdkjx0toPbxWSkb4CUvlJWDk3bWwHUDLo87XiD4eB1Ic3Y72NFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0Xl2L7n; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0Xl2L7n"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1670dad7a8so267141966b.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787972332; x=1788577132; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erpIzgXZaIbN7nWQesP+4kuweE5Y/K/C1rP9kfbv+ZY=;
        b=b0Xl2L7n2nca8UoUfdWH7CufHB04gvSKRT5g46uyh+X3qM+pfA6hdisRJBqURVhhqk
         0IGG5bljRQtgQTpWEXqC+kJC3W7dDBYYgh81imoUBptG6ridBhmpIUKYBEaypzeMfTRt
         Nu5+vtp4gZ2jspxIOOUqgiZZeHlUBy2Na7RaMG/JMJB9h65VyU98PPm/hAZqyq92pFLv
         bDQ3jdW4kpqOtNtQSFuRh0kvWQdJvaWc9RcZndr2ewZf0A8aAy+x4RaE5mGc63WzyP3l
         ib5W1JYBD/vEh7MiiKvHl/oLTcPoya9CRA9j8hIy5zqi/lk/lcBr+RzNpUHf9LRymClU
         WsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787972332; x=1788577132;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=erpIzgXZaIbN7nWQesP+4kuweE5Y/K/C1rP9kfbv+ZY=;
        b=c0NEnvrO6xFZM/uXlQbYZ9MN9l+ZZRhEVemqXeMe1sFFI45A/Lz3jYAdCQDwhDJRRx
         oE0i1VxYie3V9YaCZQCerxrmYIclHS5F2hJNQ/LO/vbe20mxt8fARu37YpO3wdapaN4E
         jISLrfOyF1pOPmVzjTGpDHXNZdoQeVa/qnDnkcdrOb/rPl1T9/bVEFm3R9BqpUlvvvqz
         0W7QvjsesLrOV3XhIikRHu8tWSeuIKTiJLxqaXfSLbEAg2B5fOEVFVu4XrwQr1ZWKXlM
         UkSxMlJFI3QzztujYqTfrHzJTz0lxJW9hBmL3h2+RU/cN5ZQAVkSv5OhHhvp01EQhVFh
         R6Gw==
X-Forwarded-Encrypted: i=1; AHgh+RqFfvmBhjp+TNGxgHJjipopem3usq1zNJMM2gg5nrvq3uGwAB4lsvqgWCCCiklmojBHBhmMQJuHFfxjBTk=@vger.kernel.org
X-Gm-Message-State: AFuF++lScnz39i/JmVbtgQ3IW7OXPFeYlXFK6i3aKrBduD5q/q2oRJ9k
	q0zU9BRzukjBe9ZW2S0aeUGZZNYwipcikQzE86iBTKrRT/7syIVI60z5
X-Gm-Gg: AR+sD10IM67kGHcQagrcim489f25A5me82S45T6yJl19JJm0+0Bo5KBOB2CkckR5UZ3
	JTJNlaP4Oqe1akAlctvqvYwLfpET9nYOeFgrBcfiOwoziXIqY2t0P76SN03aVz3Q+nm06JBVy/4
	55d2R8zcI4Vrfu6//AON7wCCtizSuhLTFfidZ6FiRRiBkUyV+PBSkIhr//ApkwyrbHevtODIhgC
	yEKUESrZ7/L//N5Q9fI92swHxVbLUfGNQFTvqqCxtf1YOnDqTzqlFlSA0+rmldzpC2fKXsTmTl2
	4TXHgKhjV0a1nrnSxekCoAFACGLfbqMCnwApz0nTzkWeP3gEIkmwj4Ktixki4+3v5heWREv2AKw
	r+L/guqxkU04pWDF66NAPFNDIqiVasAHr3JomHKiRqEEALlzh4twHNIENFBqSuBWI9LHjmsME8J
	slnKpduD+6VbDfGIt8Ua60LwxPktMC/UGpHTfQcAWe21B5Uq581WzZOdFM5+A=
X-Received: by 2002:a17:907:7a94:b0:c12:83da:7eeb with SMTP id a640c23a62f3a-c25574862admr880775666b.19.1787972332414;
        Fri, 28 Aug 2026 19:58:52 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee0b233sm153800966b.11.2026.08.28.19.58.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2026 19:58:51 -0700 (PDT)
From: Wei Yang <richard.weiyang@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [Patch v2] mm: adjust out-dated document of __GFP_NOFAIL
Date: Sat, 29 Aug 2026 02:58:47 +0000
Message-Id: <20260829025847.26779-1-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Commit ee040cbd6e48 ("mm/page_alloc: don't warn about large allocations
with __GFP_NOFAIL") remove a warning on allocating large folio with
__GFP_NOFAIL, which was placed there by commit 903edea6c53f ("mm: warn
about illegal __GFP_NOFAIL usage in a more appropriate location and
manner").

While in that commit, it also documented this behavior which is
out-dated now.

Adjust the document to align to current code, and adjust the comment
while at it.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>

---
v2:
  * s/is adjusted/was placed there/ in change log
  * instead of removing the document, say "is discouraged"

v1: https://lore.kernel.org/all/20260827030548.16631-1-richard.weiyang@gmail.com/T/#u
---
 include/linux/gfp_types.h | 2 +-
 mm/page_alloc.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index 190191411009..bfd4c43ed777 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -244,7 +244,7 @@ enum {
  * definitely preferable to use the flag rather than opencode endless
  * loop around allocator.
  * Allocating pages from the buddy with __GFP_NOFAIL and order > 1 is
- * not supported. Please consider using kvmalloc() instead.
+ * discouraged. Please consider using kvmalloc() instead if possible.
  */
 #define __GFP_IO	((__force gfp_t)___GFP_IO)
 #define __GFP_FS	((__force gfp_t)___GFP_FS)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ab385bc252cc..146f7e0a9462 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4804,7 +4804,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
 
 	if (unlikely(nofail)) {
 		/*
-		 * Also we don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
+		 * We don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
 		 * otherwise, we may result in lockup.
 		 */
 		WARN_ON_ONCE(!can_direct_reclaim);
-- 
2.34.1

