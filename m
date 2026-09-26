Received: from mail-dy2-f19.google.com (mail-dy2-f19.google.com [74.125.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF4D344031
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386032; cv=none; b=dhS4nWgylkLXSw70xYbjn4K7+hMoNLDAdnb1efJFemBwrF9PPAEQPC1gEpvqvVCdhlE1MH2uVG2oYsmvJ7z4TjQ4P1r6u//lG6S+o5RBImY5PCTnPwlEOT2czKKgGgKeHl2+92i1f8/F7DJ9Jt0L1ogOkvdntEO+rznayaemtL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386032; c=relaxed/simple;
	bh=5fiQ87bWIVXprI4Kh/HozUZBrodd3CB70xN10UuxLUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZvlKfL8K0WeW3THuefXRUxIHV4tydIkvebjnhuoy5eITgcKIfBv8Qttlyr0Z1RF+67zGrJnT65xfmLRgOBqKN3YFXSQyjglKZifSHBUYiDApf7wWGWVCbDUsM8xjvGzgr46bbflJUWYz2ppVenyO2E7K1F1XhGq5mvA8B31wnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSSYfIvB; arc=none smtp.client-ip=74.125.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSSYfIvB"
Received: by mail-dy2-f19.google.com with SMTP id 5a478bee46e88-3413069aa25so805559eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386030; x=1790990830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uxgk14CjkAZuLJmncj0dZtZlNQwoLWSisf8+2dO+hcU=;
        b=eSSYfIvBVB9pRacSb+p6yHh/TgtlmdwuRZyYqpwSuLL8fHYqixVfj/GiSWxhcZxxdW
         z5O9mVoDRpGfk9lw8xTJL9FIS+9EDeaCDcm6EkjbqbrP3W4zSbRhtiaf9pfR9WtB5Dke
         CqIoWSuA0H70NQbCUZV1rJHRTGqex579gvL/w2ua3+uVsRGs6EdAOBQwLqQmgCuuOKO/
         Yr/Y/41qRSD5Jp/xIO+UhScjFKBP7n/0XjLcxtUrtqAepZcsKosX4HhocC12KkDbgL+c
         ly8uJfgarmvn+GfFjs9+RCAQ4fAdD1A6G0gcMgZdd/S0qnDxu87dHo2Qc/F6AYnw3uoZ
         DgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386030; x=1790990830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uxgk14CjkAZuLJmncj0dZtZlNQwoLWSisf8+2dO+hcU=;
        b=W+NAkzEJP+YA20Ttly4TE0VNWTWEyCphyM//vaopCc4swADBFZuAueJif2Zl17pnXv
         8ipszBu73BXiBh9SdYK2gL5dGSjoSUvjeYl1KL2WlXmHJVQ/JUCq6huvUIYLYGqIVpVy
         11gQ7JrfurOqDgfNMMhSfcPsRvDYdLiW9Z+5eUoF41UoymKWeFt5AtV9cJBkWoQiEDEU
         cyz33woIGy0YxKsXD2q8lcoTS50CbqlL4xI4E8EabMfKG36IMZz85A+xMgI00IMNY2Gr
         dL9gvsi3NEYrkLs6fkIP8ctP9uh7VUVwxGklAHaFWWsZvTgM6RZeUcv0PVOs06htfkI5
         RxTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhjlZhtThJAbiNXjoMT8ZIH/rL6Nl8Cn0eXmsir6W13JuzW2J5xjqJ91C/HgHL0PMolhIgb3c6aTe8kds=@vger.kernel.org
X-Gm-Message-State: AFuF++mKobiKk1X93WMws3x2dliFdjL/DKUx+Zf7Lo8Z+wML2qvZEnBl
	FegdVlezr6NlgU43125cRpUHL5RwfBXhUANB0D3dHYel7UrpbdDsz7qj
X-Gm-Gg: AYBFou2e2lGxNtZHTNG/YL12lnD8i++pfMgp9Pol19HL5WeVE2DU7yreaXyVWU7D3wx
	NX9gnv0ErcVDel10dtxCvJf3r+7IGjoNw/AZwYT2Nr8zOOUQgz55Jr++W0YkpkifI7JVxKq5CtL
	NsSMJhSbhyifLB1/ZBrzwQZVp3GoPgVet0CmJt73oSSSui7U3SGlj8o/LsiG5gqFxL/QkpQoqJJ
	ZoF1XjW+Lnb88CGawU/SIBXsRxX22gjMgvQ2wHfLcmhnQy3485k0hTYKwD2Get7SCrE2wTXqK4l
	8qr4q41EAPmEcohgEeL2l4A1XRy6cGbi4701LNOIGKlY2MKV/WaVAz8uFmiT/N2BBKrgD7JMCJz
	deQFXC1PmQLJcRUjjrZNNCMAakXd3lRGXm3jYrX1oZCAOxlUx91PvweudVXQ50P0NciFJxog9sr
	3KIT2F693z15tz0B5STRbSD3Un/SuIlL+qPbKUArXT4Ag2H3XEpizxzRZw5H3QBWK4+mFgJ3zEM
	NSDoGX5QGdLEND/Ieakqxz7TFxNoa6OqpJEA2MLiSD10RyvxeNUFjqmsg2GgVCcGmbnV7BLX/QQ
	SsONEBk9sDPf7j7zxiKI4eW9xzDwLFFua5tF0pIcRLnAyL9DfBb26gPBx/Cm7eKQzKSOFqCYZA=
	=
X-Received: by 2002:a05:7300:dd48:b0:33b:e47c:f384 with SMTP id 5a478bee46e88-34271c88731mr1433388eec.18.1790386029410;
        Fri, 25 Sep 2026 18:27:09 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341f2b18cbfsm6746171eec.30.2026.09.25.18.27.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 18:27:08 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] bitmap: bitmap_parselist(): don't wrap around on a huge group size
Date: Sat, 26 Sep 2026 06:56:50 +0530
Message-ID: <20260926012651.15524-6-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260926012651.15524-1-jain.sm@gmail.com>
References: <20260926012651.15524-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the "range:used/group" form bitmap_set_region() walks the range with

	for (start = r->start; start <= r->end; start += r->group_len)

where all values are unsigned int.  bitmap_getnum() accepts any group
size up to UINT_MAX, and bitmap_check_region() only requires it to be
non-zero and at least the used size.  If start + group_len exceeds
UINT_MAX, start wraps around to a small value that is still <= end, and
bits below the start of the range get set:

  "1-1:1/4294967295"    -> bits 0,1 (expected bit 1)
  "15-15:1/4294967281"  -> bits 0,15 (expected bit 15)

The loop still terminates, because start keeps decreasing until it
wraps past zero again, but the resulting mask contains bits outside
the requested range.

This needs a group size within 'start' of UINT_MAX, so it is unlikely
to be hit by accident; all bits set stay below the end of the range,
so there is no out-of-bounds write.

A group larger than the range simply means that the range contains a
single group, so stop the walk when the next group would start beyond
UINT_MAX.

Fixes: 0a5ce0831d04 ("lib/bitmap.c: make bitmap_parselist() thread-safe and much faster")
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
 lib/bitmap-str.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/bitmap-str.c b/lib/bitmap-str.c
index b58966864657..cafd6388892f 100644
--- a/lib/bitmap-str.c
+++ b/lib/bitmap-str.c
@@ -8,6 +8,7 @@
 #include <linux/hex.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/overflow.h>
 #include <linux/string.h>
 
 #include "kstrtox.h"
@@ -186,10 +187,12 @@ struct region {
 
 static void bitmap_set_region(const struct region *r, unsigned long *bitmap)
 {
-	unsigned int start;
+	unsigned int start = r->start;
 
-	for (start = r->start; start <= r->end; start += r->group_len)
+	do {
 		bitmap_set(bitmap, start, min(r->end - start + 1, r->off));
+	} while (!check_add_overflow(start, r->group_len, &start) &&
+		 start <= r->end);
 }
 
 static int bitmap_check_region(const struct region *r)
-- 
2.43.0

