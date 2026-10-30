Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361216;
	b=3Ur24hSbwfLWT1GvObnIAuTaXVl8M25U6yKYxvKYTIVaZtKZxGBNoUMJi4Wh3tgpqwo4
	 PkCtiDTyTNOt/EW1FyCvUJ+hJUfpOeOU3QDH3Zs/YAzm60Vp/nlaaBLvcydRR1l496xUE
	 aWf1QfFls2uNT6Bj//2JKsq/o6ak1//xLspBMBDq3GSvP7QrcumDxgiI7F6Jz7BmKblwM
	 Gr1gLZXoP97ZExpOh3Ijh7n0YD7LAuXa5+XmvgwIfUS6WkMFdImWWXe8kCC9YhOx31hjY
	 NWrami0J+EphdyC9XGntyJzNwuR2moBtVlGPFTHYaGmP+gtu5xqVR8AJjFcynPhDgLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ruvz+vAepzPKRTBn1LAj+/ZsyRqQngmycGqMeNBfwOQ=;
	b=A3SW/9ZTKvtbypmYSib6zbSxKo2wnqlnkjW24Z1IvA1noxkaWRz+h88b3XnN4352WxAx
	 9ok247L8mzAkY9JpVV5ij7hM4F4kd+bQBNQSqoK+k5s9YNfUbul+cX+W2mUKTbHZnL75j
	 LcsAat3kqegnAW47EUMuxlB9zcLFrPCLr1UUtO+mIzZvjc45vsKUjwsQ/xOGtl/ubZCTm
	 p0i9sjE1msAb3d7QJHt3Hiwa/D6KqrpZt3yNHf1bx2tVtJM5uyjxkZM68utIR7w6VEoY5
	 0vVjO2ETNn23h7MgWTEZzqbWgWeQUsVLaKjB9TNGtKNFbF5qtquV7Q79+gD65ibF+5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MEoYVxn4;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C87B60A2612
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C87B60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MEoYVxn4
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso209430b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793361215; x=1793966015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ruvz+vAepzPKRTBn1LAj+/ZsyRqQngmycGqMeNBfwOQ=;
        b=MEoYVxn4L5CaXO99YH+mCtmyBcNOFLpgYG8yCF/4jcoijyYfA6D2lw7Qj7dC02bl5D
         Nnx0FKoyG4VQQwM6BO6xJLYQ68jh/d/q3fB79HrAENGShZXG3Kr+V9J7YtK40N4iXcEZ
         nM0LRJ5qKNnCDCSdkrtNV3b//7VzBmK9MaEBLU8ohiW2A8vpEPp7CVw8tssW7dcHLAaL
         e2RppU66wgfbf43tU0czgSBqIGf0IWfLU2ahlG6ewWfVxneh61e+ahCoYb8drBbF9dLV
         Z7FZiagmVIBehM6aUaybRgj2ZqMI3tdZ+JWA4AFGfiNJfr5bVuDfGKmVgMytuQCe6OKd
         p2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361215; x=1793966015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ruvz+vAepzPKRTBn1LAj+/ZsyRqQngmycGqMeNBfwOQ=;
        b=Vo0KRE5FjOM0pvDgJCE5t0MpLNd280tMyen4RaLAfxLl5oLUzIqyYTo73ObtJo31QI
         xR1xHcamI0o+4bdBHbxTYji6yJ5pFM+t+kjY20LoJLKGsObVAb+8sCLnJqNx/MWx2SQk
         Mu+swRN2x8silOOUd/HCkL2bmwfpoN7+Ep2ElNScUzQQjNpBxmkEOUFLHeDfEGZ85aAp
         TI6YCZiMOS7jilB/HPCeACJe+jYi7sC6z3zubQIG21lFzCYcmzmh/nSsf6e7cuWhciKv
         9JnqSAJwZpUUaKdVIU8jxwhQsdQGLIbnh3LoDm9pFdJs0DnHXZJVDNl95nSbHf5e6LSW
         4V/Q==
X-Forwarded-Encrypted: i=1; AKwUvBypKXlOCigZ08kA3TclPmWpSudH+rmW1sh+T4WumP+cibI+YD9G1ClJd1H6aOnRHD9rXt47pU/995f1rrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKydn/pXJWmSUnji0rZCw0B8F/s4/es0stMh0B4YVbjJLqGkwH1
	zHsRXw3Y6oRHuye72yi1FDOxdk3edr3QmXMHKxOXifFsJldbvWo6FCValTjnH2wmXsQ=
X-Gm-Gg: AYBFou1Irk87WDuesKcOLsDS8xkdfTzMAXchCOYcpFqQvzoun9DBXwjsiro1rfg9Rmf
	c+OcVcX11X7FeToH0fqzmwR70Hn6t++E8MQUNMEOcPsqvfM4cjYocGVqEjqh+HoaxeU3OTv/v9P
	ivJNseqBm9Yps9e477IdCxNPW2ytmGqAdQ/EE+XHiPKW4No+PPWt6GgorpThieBYSvlDUZGBit6
	jrU8ke2atzJgjS0oW9LIk2v0P/0BoPzjd7wHj0LFtUFl9OSRlhCoV9mS1FhqtcTS8w9//7e/tli
	9BS8EdcXPBydR7C8gFQPbAggYKaGivREhutia8yFr/Q/ZwQS0NdgGZjIlidliBYiySRV2x7OsUT
	JxSsfgFKI88AWQKTlauccyHa0GUsCRwJzJGYlYRiq0vrooe6IUdDxkbm4tnQFtGNqH7gkedPFRn
	4lHq4D6A+MFo8ym8Mk2BkwGzbcnGMTgVl94ytHCUWLvYNI1CQIHD6b3eIbEhKnT0t7UDKL7XCUd
	zlo1cqyQo7JTWqSGaIwVZTW8bwxYOQv7Al+dSgkFR+bXKtWBbX6l5IeFk+zA/RfjHNlKo6v/zCU
	+5WJHf4VVKqUmzMgWOo6Tv27EtPWINpHjUhx2T3cDCKU4E8sRDQ=
X-Received: by 2002:a05:6a00:3a21:b0:881:7ff5:606f with SMTP id d2e1a72fcca58-8a9bf71bbb0mr1772756b3a.43.1793361214559;
        Fri, 30 Oct 2026 04:53:34 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eff2684csm663223b3a.48.2026.10.30.04.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:53:33 -0700 (PDT)
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
Subject: [PATCH v2] powerpc/mm: fix uninitialized ZONE_DEVICE struct pages with PMDs
Date: Fri, 30 Oct 2026 19:53:25 +0800
Message-ID: <20261030115326.1005755-1-songmuchun@bytedance.com>
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

PowerPC radix vmemmap population can reuse an existing PMD mapping for
a device DAX range marked HVO-enabled. The reused mapping is ordinary:
its tail struct pages are not remapped to the shared tail page.

Leaving the section marked HVO-enabled makes memmap_init_zone_device()
treat the range as optimized and skip initializing real tail struct pages
that remain in use. This first triggers a zone mismatch warning, then
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

Without these diagnostics, the uninitialized metadata remains latent until
userspace accesses the device DAX range and triggers a later panic.

Mark the section non-HVO when reusing a PMD mapping so its state matches
the actual vmemmap layout and core ZONE_DEVICE code initializes all real
struct pages.

The Fixes target predates the section-based vmemmap optimization
infrastructure, so this patch cannot be applied directly to some older
kernels. Older kernels instead need to pass the vmemmap bounds to a
range-aware vmemmap_can_optimize() and reject optimization on PowerPC if
a PMD leaf overlaps the range. This reuses the existing mapping normally
and makes core ZONE_DEVICE code initialize all real tail entries.

Fixes: f2b79c0d7968 ("powerpc/book3s64/radix: add support for vmemmap optimization for radix")
Cc: <stable@vger.kernel.org> # see patch description, needs a different fix for <= 7.3
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reported-by: Pavithra <pavrampu@linux.ibm.com>
Closes: https://lore.kernel.org/r/97f85592bb78a273be8519e6897e7f9b9bd31469.1793070429.git.ritesh.list@gmail.com
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Tested-by: Pavithra Prakash <pavrampu@linux.ibm.com>
---
v2:
- Rewrite the commit message.
- Describe the range-aware vmemmap_can_optimize() fix for older kernels
- Note that kernels through v7.3 require a different stable fix
  (suggested by Ritesh Harjani)
- Collect Tested-by from Pavithra Prakash
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

