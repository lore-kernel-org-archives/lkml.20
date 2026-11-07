Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025944;
	b=0Iyy70sVd43ZSlGXIV4c8ov+Q9L6ZwmQ7ebxEJ+DAYUdBG54G9EwTBQuLBimVb4gj7W3
	 bkfwHxHD+N25bu9zILQ3oO46akJW8qrENzGI/4bL8/n0HU6xM61dprtlHd/5sgOz60Ou1
	 UQZ/g5ZhK4dVV+eiVZVRjYS1nMmpZ7fizYAGuQuRnX6ElKBkveR30uV1ePcgEQW9U2H2C
	 SedLd5s88KhuAWLpKEpEJKzghFKmrxjka3RQ6Ujc3MsUF+XMXKVdqd6rILojJKT2qFNGc
	 +AM5PI0S2hFFb4lSJnuJv9FBUYI4b3Oj7dDTR0NqJ/jP9yG9gcC2wJyEYsR0/xm3KQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
	b=A7eBMvSgUspeV+Fn8K7jMFJZaAEtW8eiXMvSisLwe26ZuqacNkwnqQTi2qvLW5+8kAsR
	 EcO2cAyGRQMjWDNYbzbc4KJIH7v3QL/DRwbhQxuFHVhAvutbH0IVPhg0HwxisqDofNMsZ
	 b+QAbwlXUm5Tn3pwebEtlncnb53OLS76H3q889G71A14YPqLITdPNcm+vig1wrFg+AWP/
	 dQcd8bI8WNvnRkimvajjXshxjsEeaEhT5gm2/PlG/gArMEVldy7egjnTCqQYGRXnqrc26
	 IwMVf+0xdtc2ut+2oD4IbUe16UY3UHgDm5/VuMyQ/Sqiqlwf2WuuX9V1RRvy7kW+bQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=loVf2gVI;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A597606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A597606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=loVf2gVI
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso851892a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025943; x=1794630743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
        b=loVf2gVIFOLlAe/RHEvexPPlHCmveUBZYdCWclU1V7yikOIfY0XBtPbgjJikM+EbnY
         oKEQijHnEEdUhi6Iu6UNRc7mHSVd7iD3uu4O+huZf11+ONHFPo1ohF1fZib0/NXXT3Vx
         roFf/pEH0bOwjyPJoAykXDs7KI3hTS6HXy6v87eoDmZBGpzqHACbZ1ZLvLHcayRA2usC
         BqDI2G/OI00G9eDeQJlmY9kow6p6brs38TvGMu0AwiqAdzR8DsOIg227sYIhTX73WOwQ
         cOCd2GWISVedBqx28YIoyNUgNWSJg4+A3YljMBf8g4hYMc3okwzCZTvvcK7wrNx01B6O
         ZCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025943; x=1794630743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
        b=CF3/vYAqhkcRPSvwV+eHQlkhGsaF88UuG5imvRypHIHpRkqzHCDZcvgPoXXkp9ReGo
         ROtlrHZ1i5WWDvUejT07HrGSPJze4dSlzrDa8zs3nDLV80jItL+tLeeq+KAyDo4f2kPj
         bYyawQe0+GuJcAHNiYrGpDvbx6rY+Xw4/daoFVf+gp4vKsnIr4TKASMqcFhbWFhV7sFg
         zNq9VGtzE4TXbamYNzyiLnDTmMOKOoya//MO1mq3nxKj7uGi9JadrNJTKqVU83rBn0Gf
         DbQLKwHLdgAHSIwkh2I3dbuAQU5NoXtPzg6kwTio3AG6z7mabAdMMUgpqpO69Xh/MkYh
         mvOg==
X-Forwarded-Encrypted: i=1; AL+hErG/m7Z2hwLMB2cbwuEHLK63HkxupDqRTNBGTOaSOQV4V1kgqKUpiNw2kiDFgK7dAx4IUARFdqV+93hkGc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wPE51eYtRh5iHvWyL6g2Kt6y8XEvlYWp3xDD+s1ej7NbXm3+o
	H0CEdi9eoVrV0W9+d88bkrvzekBpZqt8W7lrY0W4mqhNWNe+bfRtrJoqTlJ9UiGhy4w=
X-Gm-Gg: AYBFou0nERgBtog/D+V+ynQJDuSpD+c+IaX2snwssqECDGCqzbASVxscp5puWkyThhm
	Pxto/El1Ss4WBQmBxK24cgq6AhPk62AKxSTw2HQjKSt2QxczS+Ja8xk+0vKyp6rqQ51X53dNMGY
	limhUw4HoMWpFR33MqTFqjVDpkO460s7hat4w8Oy3EMQj4R7GIRofUNF/TXMn+rbGZPzqQS8XmQ
	pQoyT71PhRPAfyB6CbM4PtbGuzNeUQaS5CyzkIBqaBHfFTQeRzL/+gUrU6OTojXduNsj5SYHACj
	4N1SMdhlAS75Gn4J55Rl7nlryzsac+x1k9AJTGZOzXbE2LzLw1/AR1T2U/NJtU8urWhbsDUhcUG
	sES0BZOXeI2loWKHKW7f5SFaPxlBbIEDQqxlaFFCEmeveh2u5S5UqmZ/u7jKE0z5UjDhk3wK+k1
	Vq49stRDbGN61C9ApM+2QAn/p65Krve/e2VO6wGBY1xhtw0HoNg5eJGPmUCR1ShqmYm7mBmh1Ns
	wvtwZHO4XHHk+DrxvZ6GYXimKVrTtXweMLIn/QwjAGoFkHHSgkE90r9p/ut+N3sDeTPRhfb4eAx
	2SZW1jx0eCUFUSGCnejTu0+vQvREiFTSHU+I5t1Pl3d29Z5brgv8+eER2Cqc
X-Received: by 2002:a17:90b:5608:b0:3ac:c024:b275 with SMTP id 98e67ed59e1d1-3b0db605906mr4825186a91.9.1794025942667;
        Fri, 06 Nov 2026 20:32:22 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.32.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:32:22 -0800 (PST)
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
Subject: [PATCH v3 3/5] loongarch/mm: disable device DAX vmemmap optimization
Date: Sat,  7 Nov 2026 12:31:20 +0800
Message-ID: <20261107043122.25650-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107043122.25650-1-songmuchun@bytedance.com>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
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

