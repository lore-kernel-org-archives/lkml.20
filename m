Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759766;
	b=1LjmrtMt+JNmH/oYwnYzEvwPMtK9ZTG8lkNuhm791rOISquBn3rvEPjHORq6jVsykvc9
	 nwy+sr2sY0JgXOu3VnNIoAd+3Jw66aKfhUhqp1H+qaMJIH/itoY6VRXvC/Si5zXh13vUg
	 ug0NAuWDKyUGCGhi9gcP9BOtEKAwgLg5UmhKm7zVe3BN1OaWzAAp3hMKNuvSEjQ/Chv/k
	 Wg8A21GylwgIbxVmd+XoBj6ENZxBgv5gxxMhDOiHXdHqYTtpIKWZe2iYIvQrIKHsKGIi/
	 eskdabWvcKkcigSujwNghvQovxYtCOPVebucSf88YuhG/63e4i6rfsWYG0kRkyMq3MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rwz1upjxMhUq/LY8/yaJXrxultuUj0G45SVbaoLrqs8=;
	b=3qsa4zO1hHRMos+VvOwHYCFa3Ossl1FhyKqQ0qU7Jf2J+FmjAx2nGm/Ng4uSpBZOfbm+
	 WMgbrKflwR0v29VQA5/nH3oSfVnyw5qd7OmgOaAZy8CKFfEMbbywrgAqAxzAtoSMJitWC
	 HYa7xk7Jgn9Yt86thiQJFsT4gzk2ds6Ojo6BIZdz+79oMKGtP4r13jVGqGBttoAsF+Ar0
	 yl+bmHlo1/ZJBnp1jQgzNrKahG4PqIIYDsumyt6pyN/SIk8hdeq9FzX0I/oMgeDZldS2T
	 SruXw5m4DgNqRUlBxkb2Zf+xirCNJU04mRC9nCznepfmHe9wgQX/vv2PcZ12QLMkI3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KlWcl5Pn;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234E7606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 234E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KlWcl5Pn
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a058f74a54so73021b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793759765; x=1794364565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwz1upjxMhUq/LY8/yaJXrxultuUj0G45SVbaoLrqs8=;
        b=KlWcl5Pnrs01O0Q2jkap9c7vCVHy6+GZQTt3a++azRQ3lftHyPHM2iXNHm7nJCioo/
         s1NTHivET20VmrzWk9hnmc02GrOobEKx3052KKxJ3/QURSjjhff9BUdMEOrT6OtMhAPK
         5JfxlUtmZfuufPNqfVDlir0h5rls8JCbqwQQOn246YqJBN/fOsM3iOTvwocbMqLBVvLC
         SVyK+E7iYmiMdPHLPUCwMMswTqnLKtZY9L7HkyLMG6FiUcJphjsO/T5FeRZ2GSFYbJLy
         ZGeWpTMZo5GHgTeLH4yUm06PeegKTzI4dNozNpAFpZK2564cryjqv7vkkZ9+MKne4lNg
         PwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759765; x=1794364565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwz1upjxMhUq/LY8/yaJXrxultuUj0G45SVbaoLrqs8=;
        b=2o04lzRIXoiWVRlNeGdN65fLcMU+Kpy9QVZB5FPdntVEs8m28veAMN83GvVutzyZJA
         KtrMaIRrghnQxX2iWHB+dyDkF3ka+WDI3/+5/QDSms9EwJx0CnjfSZsNwxklrJUqoIRa
         UYI8AXtOftB4i9yU1B+EkwLdna10OM0w67WZepYeIKrngsA0llvsI5t8coM86IvGgkur
         liQfz0XOZ3Gvf2iduXg5jfoSuukIkTGjXHqM5nwpl1JfHYcGX6oo1XQ4N1rfqdKAzF/x
         kz36UGZ7109Y/epVDiqnNZSK08IJ+jdk7ArgnyWSE3RVOrPydqkmUgmpPT/SPmyPl+co
         uAjA==
X-Forwarded-Encrypted: i=1; AKwUvBwXeZC7tRTfFiMX+Gc7qIZgCjhA3q4rJtGu7auZXD0Vf5ld6DGxWk5GsOGw4deT9zSsGeTWqf+5DyzxCsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FrObWgS/LyHkGP3rfIhnX8V0NptYMcu9pVE5DmjHj2DgpCd2p
	Kfno0Wp3FNknHRRQj3gl1k6mEXuJ7o9piQMIgGdma9gWRnLbFfnjZp+SxTaKqS+u+zQ=
X-Gm-Gg: AYBFou3z6PbY2P/9rFoiuWGNvp9Of8NsxDhxcWriTqdzK671X6MpgfZ0y+4ySJ7zIm5
	o4w9YRB6nOVQQJ6VMarobQw4FL2b1N1/y+/Q/GOGLW6EacguYFQ+wDO/HLGPUcsAiqZoC9akZzQ
	84NtUBWYyf+1Q9XGYUoLjkUNtzpy5UBdVav8qWVkjlv/0GpFFGdJUUFHEmJFnxQ42vigY4tRfAc
	urQ9vGVISbo1Mk/qGGLTyN0+vzUUUKjYW5hBQ3cSu++JT2IR5P3oNCd6fMODLVehlv7AoPrB5pu
	jlx4rP2v0VcESqtmliT7zAZN/cKlTOlmjcmjYF2WigSg+1s/+QOiz+z9I1Xnz6f3iJyeN4l1POI
	gZtWVYuSyGhF6My7Jlz7bgfHr12PMoaQD7GdLEHoZZzdj/Iyd+1GOdRtE/4A81vUshlL5oQBt9X
	/40LZsf8l957BKG5RnqVl3pLx7w6tpYy7xRnvRhnH6bZoAyz+6McTg/s9fQT0c+qsiMqXB/p9us
	SIc7pdHIbYey1yZJsItHvjJ0ZU41NbPO+QUZlZ6BwtuhzxDfs8GLDt+R26SIJyhxwHAIRmDeB9s
	erUAfVwCSNqsVBRbGsl33gCPf6DDkTjb+4N7NYBIOmdRapyRGKE=
X-Received: by 2002:aa7:88c6:0:b0:89f:7a1b:2bf4 with SMTP id d2e1a72fcca58-8a9be48babcmr12731066b3a.16.1793759765350;
        Tue, 03 Nov 2026 18:36:05 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc3d1f2sm240815b3a.50.2026.11.03.18.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:36:04 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 06/12] mm: hugetlb_vmemmap: rename vmemmap_remap_pte() to vmemmap_optimize_pte()
Date: Wed,  4 Nov 2026 10:35:04 +0800
Message-ID: <20261104023510.260766-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104023510.260766-1-songmuchun@bytedance.com>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
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

Both optimization and restoration update vmemmap PTEs by remapping them,
so "remap" does not identify the callback's role.  Use "optimize" for the
optimization callback to match "restore" and make the two directions
explicit and consistent.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v3:
- Use two tabs for the renamed helper parameter continuation (suggested by
  Mike Rapoport)
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 531150870aac..90175499b9eb 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -213,8 +213,8 @@ static struct page *vmemmap_dup_page_from_list(const struct page *src,
 	return dst;
 }
 
-static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
-			      struct vmemmap_remap_walk *walk)
+static void vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
+		struct vmemmap_remap_walk *walk)
 {
 	struct page *page = pte_page(ptep_get(pte));
 	pte_t entry;
@@ -302,7 +302,7 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 {
 	int ret;
 	struct vmemmap_remap_walk walk = {
-		.remap_pte	= vmemmap_remap_pte,
+		.remap_pte	= vmemmap_optimize_pte,
 		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= flags,
-- 
2.54.0

