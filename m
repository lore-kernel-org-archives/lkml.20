Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DF23EC827
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782140; cv=none; b=mdYaWRG9BU/kZdZIUthBqO5Z3vRejuJT0vSaOv53p8MqxiOxMN5nkD4nxzF03aTPWWrBrq9AkgU78XESZt8vFelhAtUQsQRaKvnHT39A+0dpFMuxGrxk0ANzf4YpEytyJ+GY7IGQTIHsccuJX/92u/gZh2XTsphJ7ZwA2B/rrgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782140; c=relaxed/simple;
	bh=2Ggxf1QJMVzAn7z3bWwrwpi9VQNSETBx43AfVJ4a5jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBkIDE/7OzfEtGe+BL9oqjj0JX8CEu6oh3nTadKDILTJLIC/r7bXHd4/8o/gCWHb1dt7YGearRC499so+6um7Jf3IPPm//MqUMXi3dvwn2Hw1ySmetXn9gH+A6ugx5DHOSmObEV2HLsV3YsUXbZ2GvVrsogBlm1MEo4Sgz+8Qcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=k41tjchO; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="k41tjchO"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c0b552ccfso888368eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790782124; x=1791386924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cc+9rKSOSGawoxpJ2ipg52Wvw6p1Y1gNn8hY21fAsGA=;
        b=k41tjchOeNuQm/A50C17+3cfj639ABE7thfMk6YhMkICiSG5sdsQ5q7om4BYS+5QWn
         D09YaKyioATHoAaoA3FrW7iYaRPfoX6ME8wx0O9kUTlmhCBpUdB548En+XYverqGsHv2
         CtTrlRSEyCxSx6qo++UikX+8rrIsCgKmR+X/4dZru2D7DFxbBD/IOSQg7M6KgQt7YwhL
         DAdFL68a3X2Qk7wJcJmUCkGwJ9Fr78pCP7plXUvjWsp0W2uuxycbZDppl+ggtRNcto0p
         D9n2mG09dLyW38CBwjv7afMkY717VrE4GOS+j61zx5mNPYeHPQqMKqjI+Det/tVmN3D5
         lcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782124; x=1791386924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cc+9rKSOSGawoxpJ2ipg52Wvw6p1Y1gNn8hY21fAsGA=;
        b=JPLZ9TlJI1tGuOZ10CsMin50FJosezBYoZlttB58JjF7W1msDNCEI00yiNdoxBeDZQ
         WyftAwr0Gkf90BHxN1hs0Mcg9Fw30PQVqRfJk9o92/BWlI62BVIvPlZLr4ktxj+fcwZ+
         w8JSJMOBngeiERD6DtEUWjG9GCePIGaKA7l0fjBt8M8smO1fAooybgrkSCwTAs7bitmp
         +QuszK+O1SVRjNKMkW+DDiACLp2BNyDLefXFWLPPqmWZ3WFIF+aAcqr4OIENF9rtJQ/L
         QmxDb0WVUny0u1Qr2Z5lNkisV/VphORrn9fSQVa2gwclxAkV0V+PgebiOhYYh/mc/UGV
         V1fQ==
X-Forwarded-Encrypted: i=1; AKwUvByyOOk4AdHy7UXm0xv9bON5oGwO++TGMfHeBcXUE3S5iFYOCZsi9ItNCz/NQaWqerN4gGpGJnrcS6P9ZyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqanjZumRUGrmWSQ6+UouaSMPeutLHTwZTb0OGTU3rJ8Gmiz71
	5u6cvbW0E/BdPlRMhGTJyAY2xlVOCmKYdOO2ADpdf9Iz1a2H3to9eWlikprngAaMKwM=
X-Gm-Gg: AYBFou0lEv8fmQBKaT5zBcoZa0Xw0Sy5gdAk0VMGlMdLbYIULp3/K1SnmkeWaQElHWw
	4ixIS7QGAXQxDQ2zpAMtQF8znXn3BqKtb0kym8UwAWcLG8zLMoo7L+SDB6QxSOPrGqVDfK3ugfZ
	pLVQ83vY+sHlVPIu3x2CX2n+fFlWfKZSYIk0zQms4NFlD7giPpXlUfue2bMzFQIAybq8nfuRrAC
	YGgcA8AERn43xagoaXkYTcGP5FZcqbPuC+lDz3TnmZnMpdC08T43+n08JkXoDTRyRhAsKNQvBzE
	GlQGUdH/8nRt9+I66/WlFi9BtQ7vYLwwdwYvXDJHe033Cm919tmdgx0791OzsZxOh6/T4sd4DnA
	iho+21G5euZBZYVleU1TalgUOXOmaY49N3YDJOg+SODmKd9ED00BFKtnLhQlSz+XC1taGcCjOlj
	GyOFQl0vp7E0Xvt7XuYkKqI480GSRwOCBDqrvWSSz2cB994B1nSwREbP12J9Iwmj++tQYLQ9Bb7
	GTPjgSMvFERVLA+Sps=
X-Received: by 2002:a05:7301:fc04:b0:339:85bf:dd89 with SMTP id 5a478bee46e88-34cdd2a42a2mr2004450eec.35.1790782123219;
        Wed, 30 Sep 2026 08:28:43 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5b3ea3csm5750493eec.23.2026.09.30.08.28.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 08:28:42 -0700 (PDT)
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
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH] fixup! powerpc/mm: switch device DAX to shared tail vmemmap pages
Date: Wed, 30 Sep 2026 23:28:26 +0800
Message-ID: <20260930152826.76084-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930140627.57431-10-songmuchun@bytedance.com>
References: <20260930140627.57431-10-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PowerPC radix path takes one reference for every PTE that maps the
shared tail page. Unlike the generic path, get_page() lets the counter
continue after it becomes non-positive and eventually cycle to zero.

Use try_get_page() so vmemmap population fails before the shared page
reference count can cycle, matching the generic implementation.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9ca28e4a610a..a3332f32ffb2 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1042,13 +1042,17 @@ static pte_t * __meminit radix__vmemmap_pte_populate(pmd_t *pmdp, unsigned long
 			/*
 			 * When a PTE/PMD entry is freed from the init_mm
 			 * there's a free_pages() call to this page allocated
-			 * above. Thus this get_page() is paired with the
+			 * above. Thus this try_get_page() is paired with the
 			 * put_page_testzero() on the freeing path.
 			 * This can only called by certain ZONE_DEVICE path,
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
+			 *
+			 * Use try_get_page() to prevent the shared page refcount
+			 * from overflowing.
 			 */
-			get_page(reuse);
+			if (!try_get_page(reuse))
+				return NULL;
 			p = page_to_virt(reuse);
 			pr_debug("Tail page reuse vmemmap mapping\n");
 		}
-- 
2.54.0

