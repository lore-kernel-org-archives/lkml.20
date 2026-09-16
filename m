Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57A03EDAA8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541086; cv=none; b=XHF2oAR1C/S+AIk9eO+MLlNFU2CGPwKV2LoQvxZfWRxTI+YuIdpZMN3fgRaOxEzGgdf9GwpHA5/li/0OwjdCif5/36Tf1AEtwLz4t0P0SHICFIhiPGCqLVPbj45ZzQfKEzb+b1Us0jp+7eJO4B3kOG6wZzDQCscOAe9u8AuyJ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541086; c=relaxed/simple;
	bh=SzfK6CJnam9Dg4BVTpagUZL4n3gDBm63Y+qtGXTWOqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7ckDSUszB30VmyN/B7BF6rGCQHTPDcpenDIs5RHkH17hgdk5xwO30AymN9xupkHMiZYh8Csdwvn5wF64w0ZrsbOeupS0Q8CVXq3MOCliey3lB4B+nr05QErmNDAHg0/bkrlYoPxB+wAlxpdxyPZt07903u5PlytnSvioYB3fSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=COkqCTcV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="COkqCTcV"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b43b20bso3753905ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541084; x=1790145884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUhtpwjDYsFhZVHLtQ8dC1wt8tqWIMzZ7omgfR51vXw=;
        b=COkqCTcVOE3gTa2CetFt3I6Y1J8mj8yCNrj942/DylYRwBEB1pMhn+tL9Ebs5/O+NB
         XIgnZeM8u/TwFo5TMLqW+G4Tn9Mj2YQdn/rZ2HVaZPOZqSMKy1ZUCdCnZFqPDeRrskxH
         G57muZ6E9WM0lQUvf2/oNwQKPWQKN7MlW9XINf8nTSN4tJo/3dOFNsOgdbxhTns8/spw
         wgqwTc0iD85ETBkg3P4T2vfRWo2TYf9h/Kf/KRT+X7XqJsa+52K0ZfRDDX+qUcUb2IZD
         wrX1cil1nWHajwEVLL5dvFml8OUwSN3P0vAluKqA4/+n+qfR+GhZn6W0QI7U+bqPf8Nv
         vH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541084; x=1790145884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zUhtpwjDYsFhZVHLtQ8dC1wt8tqWIMzZ7omgfR51vXw=;
        b=eudZ9bwIIeMBGiL87MgY6X2emBgGZCd6mh8F5ym92pSQzyCPbofgNw9HVYQYSFOIWi
         ni4sSNEPGpKJZmdX9ey8Z35taDL6RC0kYIPwQyLU2i9OzN7BY86Ux2vwkP+Bueg1qzs4
         0r48BV0i9pUAHNgLrvN0RF2IkzOVpS61SNoiWL2T7v1z3G+lnSrh74p0le+tqSbY5gWV
         Xw45Zlr4DQ2x5bOqHkqEkHVWq1jh08rkCqMiZmtOjdb8BUwCLOGQq/Dzp+AkdFG1tdWG
         g5EX1FNpghnOONtOfAoAjGNr5psmr7QJidW2wkdnrpqd+/sNniyXi2ez6HEJBfvlNOjc
         ooaA==
X-Forwarded-Encrypted: i=1; AKwUvBz5XA6r/nwLB8ke1WtMh7tnBrjYmSoMyEaiD0MUfH9MBxMJAdqIlssmOUmKEjzFhtS472KSqRFdF2B4dFw=@vger.kernel.org
X-Gm-Message-State: AFuF++lGyjPMEjndN+pfzkRBxqBoMWMGQjXWwwRrurkNWHh5czfxO5fO
	3WV2NzSStPcTKUKwPUQBGpLpw1kp9+KVBLkQqmEg3OV6QztTH42Em8Sq8GbPo3KwI3s=
X-Gm-Gg: AYBFou0+p5gVCO6QJRTnKDas2S4tASgUCcrigSvDbZCiVOhTIm3svVvXwbdtFfOxYzB
	v3m6HdaXAjR3akTNKOn3Y6MrHKKi77DdTjzaXeS0uegbI+0CZsI7B6dVM7rd4NsyCxIDwzR/nMh
	8xl4oLGq0Wz6DJ0tMQcpghrdPqJkrhmnJFUPUPDaaHDGNQFv50261r/sZ1fOn/LofanzKprTDTg
	OT91QNpR9kqbROizWT2hTGalM3Y7IwMpMF6VeLsfmxqjJq9BZ3KWlxK3XtlfBMNICgOWuV8vOhJ
	H9g77nJt8PdxlOX1GFcsNBsK9farhDW8Whq+UOYqjcBiU1HCmXha6r5Vyp3xfn7DUtKvFfLZevF
	9L8Um0BVegMQRoyaNosIkgwhBfmskj0JkrSx0vNEQGe8V7sb/pMcxcQfznhquvVFwvaSX/IJ/dY
	DunGz0yU0s0plnl5sgfW33F9vza417s2AY3WYzMFZhT0ErYMF/RBwNRE5UhG2KBxdhlXdIaXR5V
	/L+6S75lA5KJHYsqPQ=
X-Received: by 2002:a17:902:f547:b0:2d8:df44:a5c2 with SMTP id d9443c01a7336-2dd8e766fd2mr29327755ad.20.1789541084051;
        Tue, 15 Sep 2026 23:44:44 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:44:43 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 11/11] Documentation/mm: update DAX vmemmap deduplication docs
Date: Wed, 16 Sep 2026 14:43:41 +0800
Message-ID: <20260916064341.1825793-12-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916064341.1825793-1-songmuchun@bytedance.com>
References: <20260916064341.1825793-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device DAX now uses the common per-zone shared tail page for vmemmap
deduplication. The old documentation still described a DAX-specific
layout with a separately populated tail vmemmap page and half the HugeTLB
savings.

Update the generic and powerpc documentation to describe the shared layout.
In the powerpc document, keep the radix and 64K-specific details, drop the
duplicated 4K PUD arithmetic, and replace the repeated device-dax diagrams
with a single parameterized PMD/PUD diagram.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Collect Acked-by from Qi Zheng

v2:
- Clarify the commit message to state that the 4K PUD arithmetic is
  intentionally dropped reported by Sashiko.
---
 Documentation/arch/powerpc/vmemmap_dedup.rst | 90 ++++----------------
 Documentation/mm/vmemmap_dedup.rst           | 32 +------
 2 files changed, 21 insertions(+), 101 deletions(-)

diff --git a/Documentation/arch/powerpc/vmemmap_dedup.rst b/Documentation/arch/powerpc/vmemmap_dedup.rst
index dc4db59fdf87..8286acbca9bc 100644
--- a/Documentation/arch/powerpc/vmemmap_dedup.rst
+++ b/Documentation/arch/powerpc/vmemmap_dedup.rst
@@ -19,82 +19,28 @@ With 1G PUD level mapping, we require 16384 struct pages and a single 64K
 vmemmap page can contain 1024 struct pages (64K/sizeof(struct page)). Hence we
 require 16 64K pages in vmemmap to map the struct page for 1G PUD level mapping.
 
-Here's how things look like on device-dax after the sections are populated::
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PUD    |                     +-----------+                       | | |
- |   level   |                     |     .     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     .     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |     15    | --------------------------+
- |           |                     +-----------+
- |           |
- |           |
- |           |
- +-----------+
-
-
 With 4K page size, 2M PMD level mapping requires 512 struct pages and a single
 4K vmemmap page contains 64 struct pages(4K/sizeof(struct page)). Hence we
 require 8 4K pages in vmemmap to map the struct page for 2M pmd level mapping.
 
-Here's how things look like on device-dax after the sections are populated::
-
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PMD    |                     +-----------+                       | | |
- |   level   |                     |     5     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     6     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |     7     | --------------------------+
- |           |                     +-----------+
- |           |
- |           |
- |           |
- +-----------+
-
-With 1G PUD level mapping, we require 262144 struct pages and a single 4K
-vmemmap page can contain 64 struct pages (4K/sizeof(struct page)). Hence we
-require 4096 4K pages in vmemmap to map the struct pages for 1G PUD level
-mapping.
-
-Here's how things look like on device-dax after the sections are populated::
-
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PUD    |                     +-----------+                       | | |
- |   level   |                     |     .     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     .     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |   4095    | --------------------------+
- |           |                     +-----------+
+Here's how things look on device-dax after vmemmap-optimized sections are
+populated. ``N`` is the number of vmemmap pages required by the DAX mapping
+above::
+
+  Device DAX                  vmemmap pages (N pages)         backing page frames
+ +-----------+ ---virt_to_page---> +-----------+   mapping to   +-------------+
+ |           |                     |     0     | -------------> |      0      |
+ |           |                     +-----------+                +-------------+
+ |           |                     |     1     | ------+
+ |           |                     +-----------+       |
+ |           |                     |     2     | ------+
+ |           |                     +-----------+       |
+ |           |                     |     .     | ------+        +-------------+
+ |  PMD/PUD  |                     +-----------+       |        | A single,   |
+ |   level   |                     |     .     | ------+------> | per-zone    |
+ |  mapping  |                     +-----------+       |        | shared tail |
+ |           |                     |   N - 1   | ------+        | page        |
+ |           |                     +-----------+                +-------------+
  |           |
  |           |
  |           |
diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index 9fa8642ded48..8c287ae3f86c 100644
--- a/Documentation/mm/vmemmap_dedup.rst
+++ b/Documentation/mm/vmemmap_dedup.rst
@@ -1,4 +1,3 @@
-
 .. SPDX-License-Identifier: GPL-2.0
 
 =========================================
@@ -192,32 +191,7 @@ to 4 on HugeTLB pages.
 
 There's no remapping of vmemmap given that device-dax memory is not part of
 System RAM ranges initialized at boot. Thus the tail page deduplication
-happens at a later stage when we populate the sections. HugeTLB reuses the
-the head vmemmap page representing, whereas device-dax reuses the tail
-vmemmap page. This results in only half of the savings compared to HugeTLB.
-
-Deduplicated tail pages are not mapped read-only.
+happens at a later stage when we populate the sections.
 
-Here's how things look like on device-dax after the sections are populated::
-
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PMD    |                     +-----------+                       | | |
- |   level   |                     |     5     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     6     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |     7     | --------------------------+
- |           |                     +-----------+
- |           |
- |           |
- |           |
- +-----------+
+Deduplicated tail pages are not mapped read-only. The mapping layout is the same
+as HugeTLB.
-- 
2.54.0

