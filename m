Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB583C584F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022007; cv=none; b=I0Y/gAEnE9zlDEC3Ymqf5jQ7Xea6mXO5hSdlZpMjo2Tf1npcrYvHe8A0FcZ0D2XyxMiOWT7yXyRYVO2zMhbL1woPlkUPy+luKyHZGg0n/LA+jRf3SUwW5rH/576P5WyF7XZlhT98j3gyc11jjaQYOD4zuzOpmLr+qWuiy4edHF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022007; c=relaxed/simple;
	bh=ScYqkdYU6Y38D/zkR4/+pk20mrHP1/TIZAAKXDcoung=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bU2vdGs19+sl4r8Ys7yZGdSNmxZVNTmQseq0jNwjUljR4H9FZZ1DoApHMq/MpPgJxGgIzbhK1WbHPGrReGhfRb2vEfyGzPjh3/8zFoSA/wDN7Bf7aY/Cer0A7U4PHJAtF109c9Yknj1aUDbGp0ZOF/iAFt3nPVs1bKqH+dwTXLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=O+OJZuiV; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="O+OJZuiV"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso5921109a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022005; x=1789626805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DfREAR7YFflJsvomdeYa+yVOrP6yNKuV6EJKciTVrI=;
        b=O+OJZuiVdTXkzxrUROTxnJb0D02OiwbLGJ934DSEc/+LV+9wGqVjSCMDYQdxja4uIL
         32Z7oswtrLzJxT9gtxRb2zk94MDg3uwK2NuHd4EN+ef9u2mEWW1trQCthJ5yf1FwUEmh
         gSNvnU4bTveQRqnlLSzpp8kQmAS18KbPnqDwjf/G1+BBZJ/4bv3ZgX7pLBrube8Nkd2/
         zbn3O9Prjctrp4fklZ/ba5+2nw+1zzXZCzavO5ofOfQ9rSYxwM8D6PxFTG18yJ3fzcZo
         AGpCdlVnpEXrsbyNgRLPcYz6mQBDr2oP8CmCzXXkD1FqZQdNO9PP6h5wu6r5j/0F7MUl
         1qWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022005; x=1789626805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DfREAR7YFflJsvomdeYa+yVOrP6yNKuV6EJKciTVrI=;
        b=q92kQ/AkEXBwd4sZF8o9lBlCrFiQ8t150LUHyF9makyWMmbULD3IUYsimq+azxZbeh
         6dj+XnPscKpMRDiKKzN5o8U4WWMEFlDzdPhfGAwCZq0qzk5+CsJIcQRMNwsaed38qEe0
         KLXYhKb1ocmhJwewVpjVKe+Cv74Xz8UIM/Wm9/Nzj364RtSnFS2QfJIKDByNxhdypXf7
         gY/y3ulIOzAmSFwGC72W+Q2A2nG7/1wjRFSum5RVo9/gVOmZN7Wlotk49AiH0QFkQSxs
         UyWGcPY9FKGqvbr+9Vx8OFB8hJyZVT7INUKd3O/cMAkSxHwuPH7uLtkNwO4lvSShV1hj
         B7Ow==
X-Forwarded-Encrypted: i=1; AKwUvByh9VwtRoalD5Pgm4CYUGuJe2W5Hd2vj0yiQmfzuC89FKpsomKBYkSAWDszOz1XkBhRM37DRAHgaDL/OLc=@vger.kernel.org
X-Gm-Message-State: AFuF++lJEw8rw+OmQZ3mFlX2a+u8ZeGss54AhbtYv7WGDr8OtuxCrpr9
	7rCk/p0yy0e3mkfNxr2WuaaYw3hSS3s+wNGFozrACJ2AWmpUViUhFTgS76jNDnP+KWI=
X-Gm-Gg: AYBFou0NWCZ2q19Jvq4XMC3F8V/tQy8p1OQnQRuMDXNLWnTdoYOocfwtlBka5yNgH+x
	6ntEyCVncsXRQ0AihnHhnPKPdXlz1CBlFctrGeVTkSq2ukaIlokORwybEqHkrRHAynC3F8XAvxb
	9GjskqmNOB1CKTjCevc9HGy2V6eLXy3H8to/ybKyU/tcTg602xSExKCUoQ4b51DAqpO369MSRjM
	x7fZ2Lb+vgAu5LLeTVuWNbveMGDFUANWRQdi57F8QYNTUhaKYE8vmhjnDZjud7+qHf+EfkRWXuQ
	YUtAIAy7vhJgIrLQK/JeuA5wVjCeYYls4hm9UZbULyKAqqbs/mP2l4o1PkYv3U3H9R8swDGxyhZ
	aVpekcuxWWQiriyCm5C7DqwRV5CT+ebTsilQr1dQJTlr/ugIomE7kId16gAoOk1lBRxehInhUJU
	0btnpBlfxg0t4JkFlPh9YjZLbHjCUpqRE/X7TVxhwxOh59PFmg66Hqst3ALhsuQlbJkkUD5JZXQ
	rJrCFjJcIXcfVMuZid9XdvxmzL0H6j+pDU=
X-Received: by 2002:a17:90b:578c:b0:398:e6b6:acc2 with SMTP id 98e67ed59e1d1-39b261e7649mr63026015a91.12.1789022004648;
        Wed, 09 Sep 2026 23:33:24 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.33.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:33:24 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	David Laight <david.laight.linux@gmail.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH v6 01/17] mm/sparse: relax struct mem_section size constraints
Date: Thu, 10 Sep 2026 14:32:40 +0800
Message-ID: <20260910063256.64386-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910063256.64386-1-songmuchun@bytedance.com>
References: <20260910063256.64386-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct mem_section is currently forced to a power-of-2 size so the
section-to-root lookup can use a mask instead of a modulo.

That requirement makes future extensions harder than necessary: adding a
small field can require configuration-dependent padding or layout checks
just to preserve the lookup scheme.  Keep the lookup correct for any
struct mem_section size by using a plain modulo instead.

Do not leave the layout entirely unconstrained, though.  Keep struct
mem_section double-word aligned so modest size changes, such as adding
another word-sized field on 64-bit systems, still keep a compact and
efficient layout.  If future fields grow the structure beyond that sweet
spot, the lookup remains correct; only the exact layout efficiency
changes.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v6:
- Collect Acked-by from David Hildenbrand

v2:
- Align struct mem_section to power-of-2 where possible, but support
  non-power-of-2 lookup (suggested by David Laight)
- Collect Acked-by from Mike Rapoport
---
 include/linux/mmzone.h  | 11 +++--------
 mm/sparse.c             |  2 --
 scripts/gdb/linux/mm.py |  6 ++----
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 94f9c3ff5416..0a2428714108 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2027,13 +2027,9 @@ struct mem_section {
 	 * section. (see page_ext.h about this.)
 	 */
 	struct page_ext *page_ext;
-	unsigned long pad;
 #endif
-	/*
-	 * WARNING: mem_section must be a power-of-2 in size for the
-	 * calculation and use of SECTION_ROOT_MASK to make sense.
-	 */
-};
+/* Sacrifice minor padding space for efficient lookup. */
+} __aligned(2 * sizeof(unsigned long));
 
 #ifdef CONFIG_SPARSEMEM_EXTREME
 #define SECTIONS_PER_ROOT       (PAGE_SIZE / sizeof (struct mem_section))
@@ -2043,7 +2039,6 @@ struct mem_section {
 
 #define SECTION_NR_TO_ROOT(sec)	((sec) / SECTIONS_PER_ROOT)
 #define NR_SECTION_ROOTS	DIV_ROUND_UP(NR_MEM_SECTIONS, SECTIONS_PER_ROOT)
-#define SECTION_ROOT_MASK	(SECTIONS_PER_ROOT - 1)
 
 #ifdef CONFIG_SPARSEMEM_EXTREME
 extern struct mem_section **mem_section;
@@ -2067,7 +2062,7 @@ static inline struct mem_section *__nr_to_section(unsigned long nr)
 	if (!mem_section || !mem_section[root])
 		return NULL;
 #endif
-	return &mem_section[root][nr & SECTION_ROOT_MASK];
+	return &mem_section[root][nr % SECTIONS_PER_ROOT];
 }
 
 /*
diff --git a/mm/sparse.c b/mm/sparse.c
index 7c15406e77f5..c84b4c7b8c70 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -322,8 +322,6 @@ void __init sparse_init(void)
 	unsigned long pnum_end, pnum_begin, map_count = 1;
 	int nid_begin;
 
-	/* see include/linux/mmzone.h 'struct mem_section' definition */
-	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
 	memblocks_present();
 
 	if (compound_info_has_mask()) {
diff --git a/scripts/gdb/linux/mm.py b/scripts/gdb/linux/mm.py
index 28d33624c38b..193a88d763ab 100644
--- a/scripts/gdb/linux/mm.py
+++ b/scripts/gdb/linux/mm.py
@@ -70,7 +70,6 @@ class x86_page_ops():
             self.SECTIONS_PER_ROOT = 1
 
         self.NR_SECTION_ROOTS = DIV_ROUND_UP(self.NR_MEM_SECTIONS, self.SECTIONS_PER_ROOT)
-        self.SECTION_ROOT_MASK = self.SECTIONS_PER_ROOT - 1
 
         try:
             self.SECTION_HAS_MEM_MAP = 1 << int(gdb.parse_and_eval('SECTION_HAS_MEM_MAP_BIT'))
@@ -100,7 +99,7 @@ class x86_page_ops():
     def __nr_to_section(self, nr):
         root = self.SECTION_NR_TO_ROOT(nr)
         mem_section = gdb.parse_and_eval("mem_section")
-        return mem_section[root][nr & self.SECTION_ROOT_MASK]
+        return mem_section[root][nr % self.SECTIONS_PER_ROOT]
 
     def pfn_to_section_nr(self, pfn):
         return pfn >> self.PFN_SECTION_SHIFT
@@ -249,7 +248,6 @@ class aarch64_page_ops():
             self.SECTIONS_PER_ROOT = 1
 
         self.NR_SECTION_ROOTS = DIV_ROUND_UP(self.NR_MEM_SECTIONS, self.SECTIONS_PER_ROOT)
-        self.SECTION_ROOT_MASK = self.SECTIONS_PER_ROOT - 1
         self.SUBSECTION_SHIFT = 21
         self.SEBSECTION_SIZE = 1 << self.SUBSECTION_SHIFT
         self.PFN_SUBSECTION_SHIFT = self.SUBSECTION_SHIFT - self.PAGE_SHIFT
@@ -304,7 +302,7 @@ class aarch64_page_ops():
     def __nr_to_section(self, nr):
         root = self.SECTION_NR_TO_ROOT(nr)
         mem_section = gdb.parse_and_eval("mem_section")
-        return mem_section[root][nr & self.SECTION_ROOT_MASK]
+        return mem_section[root][nr % self.SECTIONS_PER_ROOT]
 
     def pfn_to_section_nr(self, pfn):
         return pfn >> self.PFN_SECTION_SHIFT
-- 
2.54.0

