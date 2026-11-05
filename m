Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859173;
	b=EKRZfSgzvmf1vamO27EC2kfWprHeZl9ohkJN94qyHpROfCBaWmHcIXN2W50akV/9w6yY
	 nPg2Zr3AqnhHhThmGAndguU+oZZiRmA0EyAL53FoG9hhsXUAddjczDCbfCueUyvoA94Rv
	 CdXSQJVRYX7t5bbPngN8eaw0ewH/20ttgiHlx42m4PU2K5iA7b1fhkPTe7DgUJ9TyRqAC
	 vXU5iASrtTnOrRdnLTJP48Mnm4pBps6H6w+AtW0BFUWjNYlnkCwR9Jzaew0KbMlF7oAkr
	 EeR/AdQRlJpAEu5w1lvFCNzfuyRZPpY+eLNY5U05Hz2HzKzWLeDzjP8CgrJmWgzoC9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
	b=X5thrsPUHwz0yT6w6IL0OLVrjuzaWIq1CPkR1AlFIGfRDp5YFpt2H5ikohlPg9141JhH
	 L5f7yFzCNPwkel4Zc2fnaZV9FEqg9hXP5TcNdx98XL7VD7SsUQbOsZOAfZlR1ylID3r8L
	 GtXdT8FVSpHQUxV4AymjIb9oCdUYMxCT04cFSKUzs2DEFtS5he4nGfL69eonzwcKm8QM6
	 8UwajgJAE2heCaT68z1D19bf6RMi61yJbvqo8KtXavVsfV/VASswdfb3l494Vcyi8vv5p
	 Z6jsFDSsnxUR2iJLfaLaP/E13axzmQElYvxtSWlbda0+U3j8Rp6QVtAs5zeTDuFGzRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="PaZ/Alq1";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2338606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2338606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PaZ/Alq1
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1320074a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859172; x=1794463972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
        b=PaZ/Alq1kh3xw1ohjhflP9BUJV9i9Uz4rNfF9+87nLm1GWLtWKOc1RcosX4kKyirct
         LHEWvOJDNs1xRgnqKSFUMTGRSZwoo02j1DHw0iCTbflv9z4J/U2VvJOSigAg0imVa52j
         /T7gBHBo8zfU6+MMZIX7xzOG0u4E6C/wjgXwZCzE/508J/sOtX92ensHcG8xk7kFi9jf
         WCLSXc4uP1mGibwZGpkRNL7NbANyY4acCuoNQjySOf5Uvpx0JAknsAjJcCG3L/M7/zue
         5thZ3KHQqUNr9hZp2PHs/FfAVUPYFRp2sRmP7qFmFmW9yiISxys1LZ63c7SykY8QCd+I
         9F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859172; x=1794463972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
        b=wl4gi+o9o8Xb4xP1J2CNF6FOwHHrEU8D1BJtiS4r5XKPtHKTjl9O0sk++ADExDk7pU
         b3F58hK65se1BHr+KeNk3alngkhpIh2NCg2owShMQZEE6Cc+qziS6vGwwTTtQqhpc+gK
         aBqR82KkIiYdcrRhlK62Oigjc135pv7lYm8LFXhPH96HuVgVQFK4QpnT0zO8ZXY6aN0P
         3JcoCaqtaJlmXRa6Tx3r08rVgLiBFkk8dY4kyQPOUqAPodifHZKs2NY8wQ+1aS0BiMwi
         o525ZPPe/223wa3DywTmd8FJckhH/sjdR0e+IlGfqJ9uEriDHHMXjIwrhHJGtTgJun+m
         b4AQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIGNDvQpuOtnFPVTIUCBCNCc9BwQsRghu4aFWFpHWssEEX2smIHze4iu+fKtv+EFx54pf2rj26dy8R39Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TP0Zpxkk3oMPikwMHn2g3W3OgBIifVJdeEDcUjAkMwrWG1CAK
	u7Rtg4/xGzvmCA8x6fbXQ9plTz5trrbrH40psUyRmyjJSPpvkGQ3D5AzqaKGxc03fvJRoIXtrFb
	oqycdIc4=
X-Gm-Gg: AYBFou31tzMzP/rzg9h7FjodGSPVl2uphFNYQVB+zsTr5Lsi5oZv+CoXaVo5KIFRX8X
	99FNI5jALpgFV/7FHoC0pH1pHafd58ctoKWtT+mB0E7Ggmb7MMPMY42pUVlnetmfUz53U1hJ4LK
	VKZnYRn0/MKdVLrwF/xALf9UgzC6jxcoK1fiwX8hjWwMWlMCd/yMct2pgntzVciSgYNUCCzp5ir
	ccfKOgYRZ+MxB3n2WZJV3LgzYeiGvZk71NcorIAP6yy5fW1xXWL+f1m1sg+qdxGRpG1gAsn0UsV
	GgJ9chu2tX3WeO9PdSqllPwetXMf8W4R6ssHcxo5BoetJNRsrmaqO6M+KXoOHTJ0C0EwjXFhnb3
	JpX322qiODePok9KLmCAG/9EVD1awebIOx24CAY5RkH+VEyvtg9skd9giYdqZRB7N1pgaxXUNSb
	1XxUPJEgRxtJ4K3Emq/xK8dggs0d/bqOAa+8Zw89aK4a5I4+1r1JIiaS8IGP4XT1Tv/hk+u7Viy
	zZSGlQcAizp5YDZCaEaK38GuZTpvpesoIgOLBnFHc2lVCJVyXUSaQIFjtqD76no+o+Uy4y0Q01v
	ae/UCSqEs3XjwOIb1IKoB/oskCFbrmtz0uHKrl+oLvG3PROKdyz044Hq7p2Iq8E2pBSPI146buR
	56EVe3hZU82E=
X-Received: by 2002:a17:90b:37d0:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3ae8979d2d3mr14790005a91.43.1793859171930;
        Wed, 04 Nov 2026 22:12:51 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:51 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 3/5] loongarch/mm: disable device DAX vmemmap optimization
Date: Thu,  5 Nov 2026 14:12:15 +0800
Message-ID: <20261105061217.13302-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105061217.13302-1-songmuchun@bytedance.com>
References: <20261105061217.13302-1-songmuchun@bytedance.com>
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

LoongArch selects ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP but not
ARCH_WANT_OPTIMIZE_DAX_VMEMMAP. Its vmemmap_free() implementation is also
empty, so it cannot tear down optimized Device DAX mappings.

A later change removes the generic Device DAX architecture gate and lets
vmemmap_populate() decide whether a section can use optimization. Clear the
section compound order in the LoongArch path so Device DAX keeps using
unoptimized mappings.

This does not affect HugeTLB HVO: LoongArch does not support gigantic
pages, so HugeTLB does not use section-based vmemmap optimization there.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- New patch using section_vmemmap_optimization_disable() to keep Device
  DAX vmemmap optimization disabled on LoongArch (reported by Sashiko)
---
 arch/loongarch/mm/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index f801f7097f03..ea769e479241 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -15,6 +15,7 @@
 #include <linux/memblock.h>
 #include <linux/memremap.h>
 #include <linux/mm.h>
+#include <linux/vmemmap-optimization.h>
 #include <linux/mman.h>
 #include <linux/highmem.h>
 #include <linux/swap.h>
@@ -143,6 +144,7 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 int __meminit vmemmap_populate(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap)
 {
+	section_vmemmap_optimization_disable(start, end);
 #if CONFIG_PGTABLE_LEVELS == 2
 	return vmemmap_populate_basepages(start, end, node, NULL);
 #else
-- 
2.54.0

