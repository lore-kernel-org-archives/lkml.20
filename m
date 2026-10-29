Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255778;
	b=jpgYU1hZS7pd2jdEs2Z6qkcRUJo0CL5pvy2omFVDDCtFXYuu0PL8XkyKar6PvOCwD9TH
	 clUSa4rMvaJ0G/rpP9IwQkXwE9S/mF+h2LTv2FksL/FUZMwwFFhfMZ4uMWpul91RFO3Cq
	 lFjrgpMRfD+HfgRE5DDBI2D+LEm15rlPqcfdcTrbqZQp3PWgPq2n26s8uJADtUce19xG7
	 maAOIDunnYRnxiP/QCdg4n7bdXZG/I5OzXcpp0gVFoOpFBOATqu14ulgKukp0jgvBOBQa
	 EqwD77Mk2AMQr+Dq4d9PIUuG/rGVay+sUjiM4yg0zYqzZNv63Tb7rC33m08zftjbbxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BTXYfxfVOBhpvhPnAVq2lfmYKNgysPKxlm4ckRVwZ/U=;
	b=CiJWmSwWLTsyaK3wOrQsBBzLx4qrVuu6WUf3mqWWeg/3OPxgV80sByBXSrMWEw+T1uA7
	 1DQCnlScO2DmBzKz+/ww9Oolc+FOqYXSSuZQwFO5OZDL6CN5JFCutuAxWmCZL8DThr3N1
	 gxIxum10QvzccL07A7NFjof8TcJwB0vmq769S9qSHR7X59W8xOiosnB8fZbpreB+D24aY
	 mKN4xdqM/0ZM3tJ4uDasiFKIpnTiTBnXgXqwSSXINu5xYyiE2oO3FwcpfyeTzUyAFtdM5
	 rP89YL9hF0j2JHiELtOnU7j+z4tJGxCC4btotmSH9P4lJ8IlN5z9p+KgcYYWioeNMxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DqSnp94D;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B30606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B30606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DqSnp94D
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1027558a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793255777; x=1793860577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BTXYfxfVOBhpvhPnAVq2lfmYKNgysPKxlm4ckRVwZ/U=;
        b=DqSnp94DKFGisKiyfDxktRIL0uOk8pII54N3dJQrdA+C0xNFCpfSAnhpA98Oo91Bxb
         PMFkzFVPNRZMeA6tXyRo3VIQ5ejxwilSijkz6w8oL5Pv6yZsptAGEeopd+hzbSb6l3aM
         6B/LQ63bWAmMJz6ZegouGmXUz3JEqAsIfxApsfDX8llVl9vX4ifac0klZto8XQ/HOAu/
         jPo7ykV2dITBiV7C/MAte4aS7esRjMX8MGlY3xGCtVeZ4CffHlce2cwkWjMaFkk+8cm+
         qvEa4IHQKUtk8CGcfHtqqmTatj/1zb0NwS1winhswZFlS9urMP5/ekl9y4eF9iF8uduL
         zdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793255777; x=1793860577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTXYfxfVOBhpvhPnAVq2lfmYKNgysPKxlm4ckRVwZ/U=;
        b=UzEYD859h8msYSqDjj0QH5YYPWNj6onct07ZlK0FnCkgzzJlt/CGhVw4Ey66OsVyPZ
         PqfPhWLNNXKZFLUBseh/Iq1MrVPynZ3hjJ19ZmFDLiu69stqn/ZyHP4qnMxg/Y0OPdlG
         LK+YcwrgJSqNyZZtsLHIg3Dex9s7T8RluXAGdRIUJqcy8R7hIHiYsC8G3xIK/OxlBXiz
         2ImpKu4Hql5znnlPccDiF2/jmTLKlzoxcs8QAOdpXIT5pXy3fXNOHqdB9gUa022yve9G
         IuKMrBF5TbMKb+0gQBM2xBWA2R0euwRzjkJc3+KdVr9btkq0RVSrlxKmdmgnUnsk7a64
         v0sQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7ZznimzO9RIq4g+rxefP7BnGxhCCQBRpL+kCBnzuzqs2Z5P6va7WQfxKCTArM15yJRudIxp0Ak9sq3a8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsYe14xHJIuYuwfj+s5sWLFv1xJn1s53/cWTrcaKHNv6K11PP+
	PlifkTdpn1zvfmQi5Mv+JW2HrOAWpJ+o8ULskHjQ4pbCo4UO518VLHSfVMzW0y9jW/I=
X-Gm-Gg: AYBFou28OWPnQ9yA6zFZc2bkC36FTfmmFp9e05bkfZZo2mFRxApMj1JtPJDZ+0bnhGW
	ROCs8dA6gH0z5ZvdVmijZbeHLCw8sWqNxu7A4+WzjifwyOx8mApTNVvWT28gXalUNx+jkxJpQmb
	OBDq/4q1uhpciWi7LIGQbX3TJRVHUlop/oNTLBkmbd47w4V6DhfjE5MN+RLGLP0USx9/u+HUJm3
	B5z7sHuzDdb1IXYrD6eXatFtqHom3nTttbGV9R7/nbgJDbW5nb/f42qCLmCK+s2eNpbBpJPCDiW
	RCoavS77XizsbWxd1XeUiMkLKA+cIYhKn3aDg3xD+NWO7UcOe+y0gk5XY98IGw8ClAp5uu2EBpL
	ZipLXlDMy+MoMk/4XfdJEXjAUJYgk+4nsUXG4Zwjuagy50pYuxFFMzsW3n+a/auMchRJAStKulr
	0QIsuWdqHU8WBlVdpZEQdSjnwk18267cMcgm0rKQ/U/QQOvDAJ2rgKTXbpiOEc6iG7drm6hTqHb
	nZruvFIM9TirhdlYlrirlYL5Eoz42+rz/PCa0eB2AK8ChZ7RougSR5BOq1qStQVXn0yvp5jpP53
	WGE+Hb6ugY9TKy27s7kGJlW+MMYZQNr1NhzscGR7Uie7tFUtRw==
X-Received: by 2002:a17:90b:4d10:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3ae57f9ae1emr3026634a91.20.1793255777049;
        Wed, 28 Oct 2026 23:36:17 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm2734757a91.0.2026.10.28.23.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:36:16 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Ritesh Harjani <ritesh.list@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Pavithra <pavrampu@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH] powerpc/mm: fix uninitialized ZONE_DEVICE struct pages with PMDs
Date: Thu, 29 Oct 2026 14:36:01 +0800
Message-ID: <20261029063601.1961415-1-songmuchun@bytedance.com>
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

PowerPC radix vmemmap population can reuse an existing PMD mapping while
populating a device DAX range whose section is marked as HVO-enabled. The
reused mapping is an ordinary vmemmap mapping: the redundant tail struct
pages are not remapped to the shared tail page.

Leaving the section marked as HVO-enabled makes later ZONE_DEVICE
initialization treat the range as optimized and initialize only the struct
pages that would be backed by a real HVO mapping. The remaining tail struct
pages can then be left uninitialized even though they are still used as
metadata for the device DAX compound page.

This first triggers a zone mismatch warning in __init_single_page(), then
faults while initializing the pageblock flags:

  WARNING: mm/mm_init.c:600 at __init_single_page+0xd0/0xf4
  Call Trace:
    memmap_init_zone_device+0x164/0x430
    memremap_pages+0x43c/0x93c
    devm_memremap_pages+0x3c/0xa4
    dev_dax_probe+0x264/0x3d0
    dax_bus_probe+0x140/0x1c8

  BUG: Kernel NULL pointer dereference on read at 0x00001400
    __set_pfnblock_flags_mask.constprop.0+0x34/0x160
    memmap_init_zone_device+0x358/0x430

On kernels without these initialization-time diagnostics, the
uninitialized metadata remains latent. When userspace later maps and
accesses the affected device DAX range, the kernel operates on those struct
pages and panics at that point instead of during device initialization.

The Fixes target predates the section-based vmemmap optimization
infrastructure, so older kernels do not have section state that can be
marked non-HVO. Backports to such kernels need to handle the PMD-reuse case
in powerpc radix code directly, for example by initializing the tail struct
pages that core ZONE_DEVICE initialization would otherwise skip.

Mark the section as non-HVO when reusing an existing PMD mapping, so the
section's HVO state matches the actual vmemmap layout and all required
struct pages are initialized.

Fixes: f2b79c0d7968 ("powerpc/book3s64/radix: add support for vmemmap optimization for radix")
Cc: stable@vger.kernel.org
Reported-by: Pavithra <pavrampu@linux.ibm.com>
Closes: https://lore.kernel.org/r/97f85592bb78a273be8519e6897e7f9b9bd31469.1793070429.git.ritesh.list@gmail.com
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 44868b62b14e..4f75f10ed68f 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1261,7 +1261,16 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 			return -ENOMEM;
 
 		if (pmd_leaf(READ_ONCE(*pmd))) {
-			/* existing huge mapping. Skip the range */
+			unsigned long addr_pfn = page_to_pfn((struct page *)addr);
+			struct mem_section *ms = __pfn_to_section(addr_pfn);
+
+			/*
+			 * Existing PMD mappings can cover the edges of a valid
+			 * HVO populate range. They are ordinary vmemmap mappings,
+			 * so the current section must not be treated as HVO-backed
+			 * when its struct pages are initialized later.
+			 */
+			section_set_compound_order(ms, 0);
 			next = pmd_addr_end(addr, end);
 			continue;
 		}

base-commit: d865f2677c44cb2171b833d6775cf692756fa8be
-- 
2.54.0

