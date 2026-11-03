Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673522;
	b=bZ9ft/NNXkH+2syyIsJPyA2tre9NY5Mpvk0HVniBYmsOHPyvLDszEwIrecXF4tgvqNjj
	 qcChEKMNoPZB0GY9XC/dtqJVj7d3ZMUqq+Og3I9zkuc+KQcnNtHVw561MeTQ+yhj6ICce
	 MidBUh54ka3Gaw5ppnwXeOFXSWQPRtvG3KTXq7HKFIOKg3yeISLKDeHJSspZkW7iOPs+Y
	 XHgWwHb7L0ViqrM2ld/SLfrIRZ34XTVqnWGlbIZNLNtzKRWRXHOALgLFo4sU0jsfNYGvG
	 LIGBrgPVo+QXfMlA8uAmmz60O0fYTl/S8fuJ+In4NfX8h4cD6P3SnQeig26cKk2MOyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rd65ofZ2aECwr5oPP9wkqS7GgVjXVfKOSh6kNluRLhU=;
	b=tq7DhQhBwws+pmTA0B71rdsuYZYeogquxw4C2b/1sAItWhTCEnvyEAflsbDgGN+vkMgF
	 N2/3eD94VokDYPAaYne1BnknZpPtIzscCSgYxCX86cg8PpNNQoT6UaeKJkPNlcqYEZri/
	 igepfQ+NC+/O41uWXRlT+UQ0jSqQn3X1NLFCC54O55u+D54hpo8S4MEk7J7+ykWmRFX7C
	 sacG+XGf3w2f46NFxhOUrP6yW90n47pQ0ZdzbqzblZOqd7dtyqp8OuOc59omTKOqGRn3/
	 0jdtY8jgpfvrq+wy5QrfLm7CB4xyW8Uag15Beo5QbZFxgeJLdxxBIn16Mp+GSpC5nTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=k0VSJMFF;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBB7606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DBB7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=k0VSJMFF
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ea138a3497so23382195ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793673522; x=1794278322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rd65ofZ2aECwr5oPP9wkqS7GgVjXVfKOSh6kNluRLhU=;
        b=k0VSJMFFWA66BXA9yFMEu/EDlBPgZW+ryoGGR/xlpHbhMuVBHRQyy7Mx7833b8oHYy
         mjqPfFK3TV15CV9oGb8nbTfVrwpSUC2mVf2yE4+Kv4yGpy6NOdTRlyT3CInzahPE/bFN
         kpSTh9thHWx322P12aO3mzbunHzimzBj1RtwI8xBWUDt2h0i3Aw/e1qeyA2gLHjHIwkJ
         xXqkkseg4Zk7s1OZZ7i3w90dS/nld+hQXkyEApep6xBjDM6T3DwHjwpTEiCQAqL/Ah3D
         oE0qDP4KlivhuYuv+PALk8BBCcDAc5sicwptAqy4l5p5abvQqX82DaGkPzFEXBOpENME
         zgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673522; x=1794278322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rd65ofZ2aECwr5oPP9wkqS7GgVjXVfKOSh6kNluRLhU=;
        b=v+4qlK5PPdfSEEcDfTzgG1JK5SuSavcYxogaR3dxiggxBqwzEvMcic/ChVASNwGMlk
         g6ds3/LkBHWvvn+ksAo7K35kIMukIlNNOQxBpLqfYMSU+uuLf83mDN4K9qo1qhj1PqE5
         OMGhQxqG+UWrPdPePy5qUvkrh1xfZgXrU2dr1xMB1KcMCC2OftH5JSiD53vT3+QnTQDN
         TYPufK8+x0024l8UTo5xVRfrRBGKO382eJZd7n3qIJ1j6ecp6cJSiOIZwLBkvhuD+OP/
         QXN/elkEe+5Y5BPyfnqESn4OnPyef1nlIir4mj79wZib5jpJw6ffAhid9q/DA0Z0F2by
         cXtg==
X-Forwarded-Encrypted: i=1; AKwUvByFwcyGFTqsmH6hMXrcG3xU1KITsNSDNVe8nWTIHHY3B5GMgGpKH8w16NVs2xVHAzaKXjpKsGrYsAt/mPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ViLw/DldCMVIo24Yegvwi33R+OkWB++0JcZSAgyXShnn5jKQ/
	diW4rOJCn0AQH/0rG4PDXRMofRCzaC0hntYHII2KpZHH0CfXtHc+aEmP5gk0DwA5Syw=
X-Gm-Gg: AYBFou2e5rMzrSyb7IbVu9+jCOKcC+9xTN7VfCpiLKaeFzUqIbX4uUXK6piOlnni3UN
	APKBc3H1txL4uIizIl962/gj+JHdcbrcbujbj2fX1UAByRdkQOj0vIz61Ty+PgKTpz4qd7Xx8Ia
	3fyLknZcG/69rSLq1Oo3WD8N8zMFCnvGXDrjHczbw+Lc/Y1zhw2mGf/i4eQsxwJpu1s4vzNVzW0
	shr/2W/TrDBUvtPp9dfeGrk7sLd3CJD49FGZK38avRJdAFn2DI/JcTXb3Ulji783WSMlvvlWPn0
	5TdxHitLwhf14WcMAzDIxOvIg7VoXsnMOOkzhlkUIfbqySOaPX1nSch42H5Kf/5r41AI507xwn2
	YK+ZIKuyJ6FKSMXD+z6HgPjnf8mgFl2FO94NOhfgKto8S3ZdZj3aCLcaQAfC8xVHKO84wGLHWmu
	tjnEZIkNtCB1hlfv+mGpfAx+NlXHBYK37OVmT4ZxlP5/bihyGWGio+X3GYA5uh0zO3JeNWGpjII
	AX3zEoG41Iz7IzR7jSQz9PdfDXXu8nzyqVnEKX1+0Y84fF3AIiBBhnr3IoFMWq+pVX+k2xEgfBW
	pfzc/HMg6IzW+TshJRoLE3b3N0IeMDLlsPeHfXDruQhahssv2Q==
X-Received: by 2002:a17:903:1cc:b0:2e5:6158:b9c1 with SMTP id d9443c01a7336-2eb364e0730mr116286165ad.47.1793673521548;
        Mon, 02 Nov 2026 18:38:41 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298329sm33194135ad.61.2026.11.02.18.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:38:40 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Sashiko <sashiko-bot@kernel.org>,
	linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH] mm/hugetlb: fix validation of unsupported HugeTLB orders
Date: Tue,  3 Nov 2026 10:38:31 +0800
Message-ID: <20261103023831.1805473-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
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

Commit 7ce6048d3a7d ("loongarch: drop ranges for definition of
ARCH_FORCE_MAX_ORDER") removed the ARCH_FORCE_MAX_ORDER ranges for
LoongArch. Besides dropping unreasonable upper limits, this allowed
values below the architecture defaults.

With 16KB pages, LoongArch defaults ARCH_FORCE_MAX_ORDER to 11,
matching HUGETLB_PAGE_ORDER. Forcing it to 10 while enabling HugeTLB
permits order-11 HugeTLB folios even though MAX_FOLIO_ORDER is 10.
LoongArch does not select ARCH_HAS_GIGANTIC_PAGE, so this violates the
generic MM assumption that folios cannot exceed MAX_PAGE_ORDER.

This invalid configuration is accepted by Kconfig.
BUILD_BUG_ON_INVALID() does not reject it either because it only checks
whether the expression is valid and never evaluates the comparison.
Detection is left to the runtime warning in hugetlb_add_hstate(), after
earlier boot paths may already have used the invalid configuration.

When an invalid HugeTLB order can be identified at build time, reject it
there. Otherwise, reject it at runtime before the mismatch propagates
further. Use MAYBE_BUILD_BUG_ON() so constant violations fail the build
while dynamically determined orders are checked at runtime.

Fixes: 7ce6048d3a7d ("loongarch: drop ranges for definition of ARCH_FORCE_MAX_ORDER")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/sashiko-outbox-192874@kernel.org/
Suggested-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ff9dbfbc7a96..e21ac667694b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4181,7 +4181,7 @@ static int __init hugetlb_init(void)
 
 	BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
 			__NR_HPAGEFLAGS);
-	BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
+	MAYBE_BUILD_BUG_ON(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
 
 	if (!hugepages_supported()) {
 		if (hugetlb_max_hstate || default_hstate_max_huge_pages)

base-commit: d42dfde37af766d1c272467352c0a56d3169ee58
-- 
2.54.0

