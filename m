Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617070;
	b=dlwqJeEUV4VVwDbnmogP5ZkUd0S3byg++a5DgfP+QXv7DlstUdGODNAvAzGjzPB9XFj4
	 GEWZfH4BRN1YlRiNYwlRtlyL42hlHEbOtaUl611H2derTameq7USJ0UmYUS9I2KvR+2pK
	 QtdQA3NF/ZE+/iPjeymzff8FxQ/QicI0cW4CPZZP/0kOXPmoHsqfGBEUyCnzjZwKHhqyD
	 LIPdtSZe5HF/BVqDOeVYT+yoV1/ZxzHVwPPmpBeAOxttxM+Nj2ETS7seNQEjjdoLaPdXK
	 P/SNJ9b3fXUGSqgdzejZeQ00Aicu9//hhTbt3qYRANQ3WlTvF/+YW6vh50pVTyGEw3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=093JJqrrOxUj2abNMLhbp+4Uc4OaHt2/cWwMxdwN2F8=;
	b=HIllU+ZPhCSNQCwgEZ1LdpHggPUgmPlxvXNAmvZdxfJQkPNk5A0ptnVRB3HGZdRhY72R
	 y1PnKMd6iLOaWaQdihSnIrfR1nEw5Cpf6/XZ382FYP8k3qxNhjqZPvjHNifd6DvxraK5y
	 0SO9EJ+NsbIw1Zk4FyGiJDJiePI0mMgVUilYfUYA7besTlyAdEB+Q/nP67Ps9GuBFDbnE
	 fe9/RR4jJYkLFo7o2DJpsauL/Uqb9qyk8PjWKV4Afbnbf6zFh2mgOGIYHExPNDNCDzRRM
	 Uku3D3fZeDAYXPNvUKVShTSkAwXz0sAOe5GFS0MzK8+EpiaGyZx2zlQmdhjkJLLNtkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gRTLfC7E;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C55606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C55606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gRTLfC7E
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so9886925e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617069; x=1793221869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=093JJqrrOxUj2abNMLhbp+4Uc4OaHt2/cWwMxdwN2F8=;
        b=gRTLfC7E+2xEPK660ztbvQPSTpwDINoztP4jGb+wRk1FLCpyYfundoN7DQyLL1v8dV
         lEkiZkpQz7gypgKMYk9cWkOx/dF6SYYDhz42Vv2KexiZi+XoWJ1Ktsd7OXRRe0d0T2Rc
         TSfWLcVlJjr3OnIeNeIeE3MWU4FwMkPEyMYjI5TISIEVw/850ETA1oSmqdooBm55VW9s
         Evdp4YDX17TWOeitPWXMjMuJEiziqHmOBBHRjh8fHzDJZx995s8Cj6QVTYDWQBYEgOqe
         Af9juM3ZrFnjxDfRiTGcJSGs6QXJmZOUNiERzBCKvC85cyKlxf1tpsgkERBAwF8pDt74
         Kw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617069; x=1793221869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=093JJqrrOxUj2abNMLhbp+4Uc4OaHt2/cWwMxdwN2F8=;
        b=Ypk4Ah7RHVQcXa5ddCQi8Qrypd+H/euOgbUvYUw5leiPNk2YhiS+lmpaLIStL0tmjK
         SpNAxhCj6mqhxzCeE1uEg4VSSeK013WP+mP7kuD2lskmAsOhHJyPkGZXvCMsq6FMiEHo
         +zLXTp2IF9N0ws3TiFu1s1LJNIi+StLBMsnLF07MdPe3fgxTldpmkoBcruHw9PQm46NF
         L0cmoAl+0mTnpx8xhRm14MEobfG92lx5R4wY/g//u4Lm0NL10TgLNFsN6hvwYuAky0vP
         tp+uU1+Q2rUn7Qwo40Zr5vVdJrMGxEZ2jCLw2slkCMr6PBDcBd4FyMSNWivvzDSObHZv
         fAmg==
X-Forwarded-Encrypted: i=1; AKwUvBwa25gnhFvxInDHpWfv2htjKOCbtVZNvy+dNtYoW7V+UCmKaVfFoU0W+zL1Cp6/S/agrOj1/mW8uk+X9hI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZph68fP59uktXPWnMZ3SQy2mZcAT+ucv/8OXzGAdlB/tSZPa5
	bdB31IkenSIIu2lhXnw7Yj7PXX1MiW3lSOiZSNd4HsETj2XyjjUBt6LI
X-Gm-Gg: AYBFou0fK9UOU7d5H1FaPZjS5AQdPDolkNzGmeNwLp8ChewLYMsi6UcuXTpPMBT6b0/
	a/5A+GADLWqxZOpY+Yd/pKTqdG7jpD6U6QjixfyMMgQk41BzJ0Twv2lDSsZ4zyTHjXrvXIV4HZ+
	7iJzcPKXAVe9z6oU1AvvxhvXm9sNXQXu246v96fErNZGIWcKrkYijMWj1YysC7WemfDYrwOqI/Q
	u7aI7Ymu3QRnwdiFVSbAw6CXyFK72tDB2MSCw7snLQ8Be9EacPkbJ6h3/gWQ/PmclbMxh1MNNoK
	L/XmmbmQFNcHqiEJ9CUOxY5+8MygOwVBR8SV1e98FqdkQi2TMVeWYOKqUEqFwdQh4iLllpwPrUB
	gbfNt9uSdLBZC3msP5W4bpf3TNO+CB+vOInegwpWxRYGJBeHuLwlZGhVqdOquETQxJhMD+RMP8l
	OpP0QrJlBtG45jpUFEh5UTlDHGn/bfwD2BQMGc5iGbf+C6yllceBWbblQoog8n0g2zeDUfxg06X
	8FLe4HDw5+RlBgNypw82YLh1MI2HwcWOfDqKPk5
X-Received: by 2002:a05:600c:46c3:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4a1fd8cd9f5mr69945755e9.2.1792617068708;
        Wed, 21 Oct 2026 14:11:08 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a25fb5sm22891525e9.6.2026.10.21.14.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:11:08 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Changyuan Lyu <changyuanl@google.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	kexec@lists.infradead.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [RFC PATCH 1/2] memblock: factor out the KHO bootmem check from memblock_alloc_hugetlb()
Date: Wed, 21 Oct 2026 23:10:45 +0200
Message-ID: <20261021211058.83483-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021211058.83483-1-azpijr@gmail.com>
References: <20261021211058.83483-1-azpijr@gmail.com>
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

reserve_mem regions are preserved with KHO too, and need the same search
that keeps HugeTLB pages out of KHO bootmem. Move it into a helper.

No functional change intended.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/memblock.c | 70 ++++++++++++++++++++++++++-------------------------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index a450092a80fb..f43659688681 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1744,6 +1744,31 @@ void * __init memblock_alloc_try_nid_raw(
 	return memblock_alloc_internal(size, align, min_addr, max_addr, nid);
 }
 
+/*
+ * Memory that can be preserved with KHO can't be in KHO bootmem, since the
+ * next kernel boots out of it. Bootmem areas are normally not very large, so
+ * this shouldn't take too many retries.
+ */
+static phys_addr_t __init memblock_find_outside_kho_bootmem(phys_addr_t size,
+					phys_addr_t align, int nid,
+					enum memblock_flags flags)
+{
+	phys_addr_t addr, start = 0, end = MEMBLOCK_ALLOC_ACCESSIBLE;
+
+	while ((addr = memblock_find_in_range_node(size, align, start, end,
+						   nid, flags))) {
+		if (!kho_bootmem_overlap(addr, size))
+			break;
+
+		if (memblock_bottom_up())
+			start = addr + size;
+		else
+			end = addr;
+	}
+
+	return addr;
+}
+
 /**
  * memblock_alloc_hugetlb - allocate boot memory for HugeTLB pages
  * @size:      size of the memory to be allocated in bytes
@@ -1761,52 +1786,29 @@ void * __init memblock_alloc_try_nid_raw(
 void * __init memblock_alloc_hugetlb(phys_addr_t size, int nid, bool exact_nid)
 {
 	enum memblock_flags flags = choose_memblock_flags();
-	phys_addr_t addr, start = 0, end = MEMBLOCK_ALLOC_ACCESSIBLE;
+	phys_addr_t addr;
 
 	memblock_dbg("%s: %llu bytes, nid=%d, exact_nid=%d %pS\n", __func__,
 		     (u64)size, nid, exact_nid, (void *)_RET_IP_);
 
 	/* Don't waste mirrored memory on HugeTLB pages. */
 	flags &= ~MEMBLOCK_MIRROR;
-retry:
-	/* HugeTLB pages are always aligned by their size. */
-	addr = memblock_find_in_range_node(size, size, start, end, nid, flags);
-	if (addr)
-		goto found;
+
+	/*
+	 * HugeTLB pages are always aligned by their size, and can be preserved
+	 * with KHO.
+	 */
+	addr = memblock_find_outside_kho_bootmem(size, size, nid, flags);
 
 	/* Try all nodes if allowed. */
-	if (numa_valid_node(nid) && !exact_nid) {
+	if (!addr && numa_valid_node(nid) && !exact_nid) {
 		nid = NUMA_NO_NODE;
-		/*
-		 * If a previous candidate overlapped with KHO bootmem, it would
-		 * update start or end. Now that the search is opening to all
-		 * nodes, reset them.
-		 */
-		start = 0;
-		end = MEMBLOCK_ALLOC_ACCESSIBLE;
-
-		goto retry;
+		addr = memblock_find_outside_kho_bootmem(size, size, nid, flags);
 	}
 
 	/* Found nothing... :-( */
-	return NULL;
-
-found:
-	/*
-	 * HugeTLB pages can be preserved with KHO and no preserved memory can
-	 * be in bootmem. So retry if found address overlaps with bootmem.
-	 *
-	 * Bootmem areas are normally not very large, so this shouldn't take too
-	 * many retries.
-	 */
-	if (kho_bootmem_overlap(addr, size)) {
-		if (memblock_bottom_up())
-			start = addr + size;
-		else
-			end = addr;
-
-		goto retry;
-	}
+	if (!addr)
+		return NULL;
 
 	if (__memblock_reserve(addr, size, nid, MEMBLOCK_RSRV_KERN | MEMBLOCK_RSRV_HUGETLB))
 		return NULL;
-- 
2.55.0

