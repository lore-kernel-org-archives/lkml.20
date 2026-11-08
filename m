Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794106856;
	b=Hegvs+ZP+7kYEP0xS2JYBLztU7/LyK18mC85OV9ZH4J3kI4206rtC4zZXEN/xzSoLfQ8
	 iujJ5tAjCTrB05a6jz/ScP0r80LJlcTLLLuRDrjBKLJeDej8y1Ca2qn9IilX+JAdSfDbg
	 1hM+aizyRb+Vm49fATmq6LADTNL7kEjzw4foijzx+SC5ibSCZCb7EheBQ/ZDNNhAxilw0
	 ZTnd6ZXwcvw8nbkBKLx5OTE3Hi1GuNnlMW8VOsmh0s2vkmRC9A3Mka9K3BWE23m93DNzS
	 Ide873ETCs00QKvq7c1LkyQd+Frqd0co4HXRai1BxonhLu1nseQU8yMh4NjukxzWQvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794106856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=oV9FUG6VESiIfJwch77l0Tjfsp36eT+2bRCqqkXn6FY=;
	b=ZidJE1zrouh223hG0+sIv/YRk9OgMkaG5g8HZkY9rJk/y6hZvZS95t/QlAIukXqH6+Nl
	 U9B2pWbEdh5HN+ggBhNuTXil54/lNtOUChq551PTv5rSK3+iSZUZGBR40bikjLKkJBSim
	 GjlS4re0IrleD+ZxjsA+3KINx3gfhvEQOMujCJsj6RxDWD+Km1uzikgtpKtJdNe0TqFDf
	 p9ioEzDMyvA7FjHqmX2jRy3JJ9V64GlkHhs1O0FVeg6MQFZ7g/oaouHK3xO93dEsN6gAX
	 jA4obdhAMO/fYaFKXe5fPm2dU5EzsLkxjqMcWo+ylT70djJdhu/DAMslbSgcGRgjxRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=la42Wdo6;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D40606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 03:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7D40606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=la42Wdo6
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb684859cbso72957a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 19:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794106855; x=1794711655; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oV9FUG6VESiIfJwch77l0Tjfsp36eT+2bRCqqkXn6FY=;
        b=la42Wdo60aEv9noJX4RYkrzhWR92noa/K6+aiBlTYklVvFHpGLAE6uS7o1dbj6NJ4Z
         I//CK2o0Gs3vv8DEuPf7hNJUJFwjW6tUwuoQsMT7j82RJ6dFarJjDfmkIKJFZ1ivOwrk
         01luqCDLXt+SaupEkqGupxKY29BH2wXMYUkyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794106855; x=1794711655;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oV9FUG6VESiIfJwch77l0Tjfsp36eT+2bRCqqkXn6FY=;
        b=dqIAJzjX6oP0a8V3KnkrIFuazKMJBUNuFgGzVWCr8Q0I3sSZNDMtkJ2rUHNkRKnKRh
         0dSi7ErpXJRj/mlKO6nzvLLBlo5NI+k1L/vwVVi/8iATyRuaAHtrI64P+rJo5szH7iIm
         Amg/CymeP6PvLgE3EhMJTZq2NhoXhHBximtLcqdEt9Z2JQWZ4FRebF/bWKAD4mhwaQVR
         VwUKbr539Wppx6lU0q+UmgyexhI85Iks2T4l1X0OPu6anB3txGCGn6XixyhUK1XPAr8j
         SF4riX2UVZd1ATesEHusHzGq7iiw5kpiJ4up7sy/bc/paL9gtSQjzU0BYnjrLcdcvK1Z
         AN9w==
X-Forwarded-Encrypted: i=1; AL+hErG8+8Nvo7Sc1+2kPTBadfCwayCWCD0zC5hCVekM6t3T3X4L0Nt4BjfHOoyT14zn0p3oXJxURWn1uP7rrMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7ox8fVDoSeCSpAMq1GiaNHZf0fkrvoFIngda3idaA6uj0fuA3
	btePyYXldx4kE2qe//xgPk6TzzvxyKg2ngvcqQpT84VDVAHzL77tQg8b1rUA1mWXl5I=
X-Gm-Gg: AYBFou3SvM+NpteLG1tjJpmlznnR3OmpSo3uskznzZzLx+L/eWI1eIxS2pRmHOsJMON
	UwT01OcIaR7bFh6XR6WHuttkhKcQZrwS129jQHLeT3UOUz7ruwG209sD9Uy6uXRZ+uPLeAZ0gDb
	23MrQrijIJ+KEfwNZyBHWi0nW42ec+czzdgN8pvqt/kpvzhtiDTusCyEthxpab0Qirqpx0BPR8Q
	94MXGkyQG4zWaOllwfDV1Ouymzf5u0+2S8KnRTsFWhG5owrM7B84dZX7J905z+Fori88dp38W0r
	T+A8qBjqB8Cg/lw1r3VB8vwkfWqP3P+L1TGEcgLWcEx6hNbKwJhJ8l7zRybuDFXOETfzQICWDYG
	x7mIX5lhpMrsH5yAU8HbePh5CnRQfQs504/mHQEsUvchHi8crHENfSuR4Hiq4AviQPZMJ2cdh4X
	yHNif81LsrVYPe8Cwl1tqFnX9kIvJ5CzOKx2xiW+dZWmknCNWdeSWMI0qkHANozTIerCvXeLtZR
	NhGBuoqcT+TtRBI04G3JtHbj9gr4XV/c7kfc0CLsq4XSyK1x0C56cVzi9/Xo7iJqwi7CR41/6pb
	4vaZFCFvISuAeRgaqPmleP46MgAWsTz9t1DYhzBHh/lRSMZhvZns8aeqc3ZCJIXillTuu0SgVJt
	UF0ibAtzaHXJCKDUN6BbbhS9lddNVCqbBLIGf8pQAAPegdobvOPPr7Egz9vFjSdJQCvMeBN0lkC
	WzfrnQQiWnjVEw42xCQR6vqRc2TLZNmWFwCykp/njGLLqhVRkB9seH
X-Received: by 2002:a17:90b:39c4:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3b12d0f9293mr422730a91.5.1794106854935;
        Sat, 07 Nov 2026 19:00:54 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127891fa4sm1216393a91.4.2026.11.07.19.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 19:00:54 -0800 (PST)
Date: Sat, 7 Nov 2026 19:00:52 -0800
From: Chris Down <chris@chrisdown.name>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lance Yang <lance.yang@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] x86/mm: Tear down the direct map when memory hot add fails
Message-ID: <au_l5MRyDbYfsUVe@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

arch_add_memory() sets up the direct map before calling add_pages().
If add_pages() fails, the range stays mapped and any page tables
allocated for it are leaked. A later hot add can reuse the stale
mapping.

Remove the direct mapping on failure.

Fixes: 45e0b78b0532 ("[PATCH] hot-add-mem x86_64: use CONFIG_MEMORY_HOTPLUG_RESERVE")
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 arch/x86/mm/init_64.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 8b6d86fb5a42..846cb34b38dd 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -989,15 +989,23 @@ int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
 	return ret;
 }
 
+static void __meminit kernel_physical_mapping_remove(unsigned long start,
+						     unsigned long end);
+
 int arch_add_memory(int nid, u64 start, u64 size,
 		    struct mhp_params *params)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
+	int ret;
 
 	init_memory_mapping(start, start + size, params->pgprot);
 
-	return add_pages(nid, start_pfn, nr_pages, params);
+	ret = add_pages(nid, start_pfn, nr_pages, params);
+	if (ret)
+		kernel_physical_mapping_remove(start, start + size);
+
+	return ret;
 }
 
 static void __meminit free_pagetable(struct page *page)

base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
