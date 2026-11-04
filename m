Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803687;
	b=uvf4OOygZ2gcodZl43xGA2RGaK7Wn9u7sShHZ3lj64fYk5Y0chHGPEpiF4qL2AwHgeSY
	 UQ21CjjeOv+VUXwttdwRL/1uHYhv0qpEF7+9FANNM8lMJE5Xv/knR5XcOdEqL8pgULrDB
	 LIHwAwQ91vedwYCRh6JbdIBDi+c/3xi7LctnWstPLThVSHSIgGN5wn17xtGZx0BtTnEQn
	 uR7Yw0jO958+YBydEkhLoFw0R08zraSJA1gYQVcOgP0aufKDmo4eVtKaXPxoPrcDS1OTD
	 m9Ff+dgZ3hQSUvceZDQ1drD+v364Hl8Uphk9OusMKUMYJrljBs8VpFw70cngaUW8sog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gjoFlql1j75pc12XdJHKWu97116XlpTwWzrWzwPXnYE=;
	b=F/cD9MRWPQknGCpdsBgJvAv5M0WbZOpRKqQiMjFqChFIjqnLci6alRKqJLm2/8DHLWwO
	 mgxK48VDzqc0eZZO2Sn2eifUv8MhKjbVFDlwIv31HHgZ03LLNtjD9aDbmHge7J+XBzLXj
	 VfON8AeFWbBE/duDnz1q52kS3WVPYltXCY+SVgLyzdZHw962H5S8UZOQ9J0/jo31Kn7t0
	 hff9QxQEnro8Ri2saLg8sHNziADXhdTTccumQizcQsVZV8vCC/soJUo2MQohE69kICYtM
	 ejwAMCQd9Wjt8E90YSLuCxiNZbSEDG+i21VmdbdAU3WS2udlqgS70NcaOzqhn8RjVVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0oPObaW;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389FF606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 389FF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0oPObaW
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36d6765756fso514048eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793803686; x=1794408486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjoFlql1j75pc12XdJHKWu97116XlpTwWzrWzwPXnYE=;
        b=K0oPObaW21G4TEz2TguEoir/Z5hll2jVtWR3UGboqMHONn/pj6UBW6TMwQv1qbMeEB
         ck0VrhOcyf2oQfSUKpW4jO1O/RrLX5b+bmJUyPkqakU/Lrdq3Aa7tVw2QlRT6uQhFyPp
         Zo4g2xjGMFmgln+CvaZarwYR+RxyYQepQzUBqugCw5bd9Y6lYkrjsogv3c8HgEmNYuNz
         0+5KmSuUGadTA3D7HTzTl4P1WcKfhX7i36blSdxId9Me7k/ln+Blu7nP2W3tdczJgXtl
         iSVDM9XSciOJm2cHFNF0n5CzaxoVSAG4ysrMHIguSqV5JgH5BvA6JhzL75R34xgAEVEp
         q8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803686; x=1794408486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjoFlql1j75pc12XdJHKWu97116XlpTwWzrWzwPXnYE=;
        b=STEQ23ZETWUkxAySiYQLWI6+Vn9GerxB7xB8FifVRxCdJxl2UQbXNooXLH2+Oowepk
         k9TRkiWHVct8anmyGt6NbZ8szXhPkqF3/r5ejjnq41KVIchXZJ1LTdSd2KA5A7+mWT4R
         br38vnqZqH1LNkpC7DMU52vHvzZfasayZ+54b+SDulUe1ILj+4tFic38OuET6IV758Hp
         jpaHbgHQIOoBb5xGfpYMskVPgGAzajht+rbne/2pmmctN3mxIgvAmBr52/sQQ3TShGW7
         c6IGE83MPxA426Dl/dAFI4jYzdBTHmkBDqoAadyojkk/fOW3heKSdnW9pjS2MMMpHeyv
         ViHA==
X-Forwarded-Encrypted: i=1; AKwUvBwM+rC+ZOThAHIaHsxUpvQwREzGFw7X49oTJXuwmgPjmlQN9JYcfHpD0x8hu+WeTVc08IEXXQEukFEau7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NfoFcVd708iJxOpdPlARV6YFraPJuKx7SAqXq0Qihu1vUnII2
	XwlGXDl1z54b4+kKlMudmf3uQtQ94gPACW7scCVNDMkbFuqbtKhq3ciw
X-Gm-Gg: AYBFou2hFZalt3VZ8bks5VORm2BeV+Kr4LDH9mS4Ovb01bqqWmhkpz2t3yX9SqKgMIs
	lDYgSSPhDF6XrjDMAffvFASpgC3rgqxQLfkUqjhYSZBoicPlktiLuldqnDt9sPCw+ZLjCGzdQfR
	Dq2qh8bK3FxJ9QadWFqbnaJt+WoWjp9PsR9CQoiLC7rUSH8axFH18VDReddZOVY6wWlYpbxdtfq
	+RHLBXm48J4N4YaYS7M2dRMd4eH8eVGfis7IXl8obJ/A+TCAPZbdrqLUvD9DKd0Ftk4EasJ4ku2
	TkahZoptqB3CCObcxbK7SdP6+Q0zdU9D78nrqjxUnIKe3fhVsO50+fUSUeyJX+7uN9oRHTD3mHC
	YjxGlTLy6uwBm2C0SrATIDnQBynjFAeO+51HIEIEje2cYRFsJt/eQSuYfDlau/5shry5DCtYAVk
	yPilPMhVj4QQJ8LFaQw+n0hooohAQMtkhY34AOCmsMGBDXZKogwYm0r22FBpmwliSfu4uQIcKRk
	4YiB3WFGL0Skmkk/KhXX8wgvy0EnXZoElLN6gjQSbgPCCK2fzDaNgVc1k4fU/tyDZ1zdsX8H9JS
	W3vePnWTXEoCaEnYiWfUu+q84WbkqKPxmVagozjcT6zeHP8lDvSm
X-Received: by 2002:a05:693c:6092:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-36a424609c2mr29635283eec.35.1793803686038;
        Wed, 04 Nov 2026 06:48:06 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm10742548eec.27.2026.11.04.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:48:05 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Hao Li <hao.li@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: [PATCH] mm/slab: remove outdated comment in create_kmalloc_caches()
Date: Wed,  4 Nov 2026 23:47:51 +0900
Message-ID: <20261104144753.2266231-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Since commit 16a1d968358a ("mm/slab: remove mm/slab.c and slab_def.h")
removed SLAB, no kmalloc cache is created before create_kmalloc_caches().

So remove the outdated comment.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 mm/slab_common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index e66c0778ee98..c4a386f0dd90 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1029,9 +1029,7 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
 }
 
 /*
- * Create the kmalloc array. Some of the regular kmalloc arrays
- * may already have been created because they were needed to
- * enable allocations for slab creation.
+ * Create the kmalloc array.
  */
 void __init create_kmalloc_caches(void)
 {

base-commit: d15d7703166daf7bd62c844a3cb1b3a6279adb4c
-- 
2.43.0

