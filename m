Received: from mail-wr2-f0.google.com (mail-wr2-f0.google.com [74.125.225.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29ED388880
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616947; cv=none; b=vB0ztbMGc1Eh37o/EsWeRbLJwTpfXCv3yWoNUkE4eXKOlCgqPyNdxW1W+kLQSFujou6+QgmfKBb20WulZWbro3RvF5FRxtJ9vJFFNIETLZBz7Ha0xqmXr0K7lUMdcJB9dwT4ZIqow2U/Y8KmEYLOzkzrkS+8hScBp52ZpP52HEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616947; c=relaxed/simple;
	bh=ivNMj0j4sdXK5+XtlbC7L0D6sf/KfptnZi74YjwFkIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lt+theclzmAzbqLyNWbb53sRgJC/tfbhqdvcxpd3CzCF0aG/SPNliqJbkfkmyz+mkpPws8xWKKuSNUiszCPUmgJYMtSQqMkam9SFWY1YVKGuRazlaDiBNINI+jOtSJyqOpiDCA8RbptN0NXMZPwk3xb5M3srxEh3RhTV2z/R9e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDn7XQsU; arc=none smtp.client-ip=74.125.225.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDn7XQsU"
Received: by mail-wr2-f0.google.com with SMTP id ffacd0b85a97d-48437cc1b11so551771f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616934; x=1789221734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1j3T5b2cEL6pgSZfKmDhv9K0ynuzYhpAf3KEcht699E=;
        b=jDn7XQsUb05tq8tPXK2WWfOeS137avwJiN+n24LBMXD1DwYg1Rcpvz4h+Y/Rn7YkzH
         htOgtpVBwGBwJKJ5vRKrZdu+nSaUy12I7Lxx5k+JDeV2uWWHixyNlbAl9V4K940W0cDZ
         kuobth1REkBVVAhbzTkoQyOrcSDPUElRkunhVIJ2/JTVRn2RCoYn2FqTAEesNxv5l8MN
         ee4Pna2/k36FzutBVEUAMLH4IYH1n3Gildv2em0PxyR4Va/ElNZDKKawBQ0HeQnLnSZ+
         SGBpmjKiC2DlHwMu2zT/vp9sI6y30jLv2z6nVSF/Eiv7wBTJa2d7hHlHkT9f0z6hFKRS
         p7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616934; x=1789221734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1j3T5b2cEL6pgSZfKmDhv9K0ynuzYhpAf3KEcht699E=;
        b=bhlbJpgSL/+bNwKswNoRhB3L8xe+seYwtpMWp65fvncUxcZ5OEJ6d/hLTdqwtQzaNE
         WubIpIPIRSexeIXk3bvJGPzHUS32gxvXh4dTi6j0KD0lydZ4aP7jrIZu6foDzizwy761
         fIu9X1kp3KK2yNZQy4IDYN0rVzA0vesHIxFEtvgCv0caMJCZZsXczjciVm5zEqILwvZq
         ZDiqVtnLf+x4+8mtClplv29ZaAXJq8KVPbk99MW+9EW/dT8OrPbjUvw+6Z0+vubrAyq+
         LZO5MnOiHtYup9lS2m9RdUH+frV7OZl+wUvTayf+XJb7J4CRDhHemTGrGe+rrWPmqMC+
         2ZeA==
X-Forwarded-Encrypted: i=1; AKwUvByplF/NWBBG65k8Pu0QijIRRf91Z+6ebwEvoKM0bo6dfoN9UOZW3CeZcwXAqlkM6WlPX5szLJ3sFlLWIV4=@vger.kernel.org
X-Gm-Message-State: AFuF++m/vymvHKUnFQY8lttJT532/8ujdto6ovR6dxicb+rsf5TBtD2S
	mYBJ8CLBiRbuZKpJJ+Yyz5JVn0TSLwjy7BVVc+9KmgIt6kqu4Qni7CLj
X-Gm-Gg: AYBFou0ijBJ3AfsVeVNPJMPKlKQbMH8R8h4dBOKiUOJyd+ceNPcoVKM6xJgCp02c5Vw
	O5/SMjnWc2er+NAxWzUZj9yUk7fSfiQqNpb8EmlILEqdbiSnSHRkB0TPpI3XZFBrLA4jIQzmupD
	+rOhIs+53zRP3WLoFpVFMa+omh6JFaS1yOxzga+CVcTieSX3DGyFR706Ih2QFbtqjB9D34Lb/iU
	RD5rugj+kW8Hkn8bP5kj2pREQltSfZsktdoNGIywymbtoe2ZXrelUQb5WyAJV1lCboK0kx6DhJi
	lyIOtHAH9QlKJpl4POAjsAZ0cQup2soBJ6IBXbNNxmhdYLIQ9G/9yChX+K8hSwuB4qYS7WTx4YX
	vXJCGtj0JBP8aEoLPBlzhrtHzTI0+7HDT7QyJKFh8TNj8FLwJy8zP5/p1iP4cZFbF3CyFx8MBtr
	uq+KT4srGv6o4C9YP7sDFCuzJ2DCZifulSIVMOenvsincQghUL3AzZat2fs8+92FtPuqeFESoqt
	YT+azq94kwqUY/XF7KVfm0yxCTf7w==
X-Received: by 2002:a05:600c:c1d7:20b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49cffe32f58mr50527755e9.3.1788616933800;
        Sat, 05 Sep 2026 07:02:13 -0700 (PDT)
Received: from outlook.com ([2a02:587:6022:4b00:84ac:4417:9f37:a496])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm149866765e9.0.2026.09.05.07.02.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 07:02:13 -0700 (PDT)
From: Christos Skarlos <christosskarlos.kernel@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	ljs@kernel.org,
	hannes@cmpxchg.org
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	mhocko@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Christos Skarlos <christosskarlos.kernel@gmail.com>
Subject: [PATCH 2/3] mm/vamscan: fix various coding style warnings and errors
Date: Sat,  5 Sep 2026 17:01:39 +0300
Message-ID: <20260905140140.60792-4-christosskarlos.kernel@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905140140.60792-1-christosskarlos.kernel@gmail.com>
References: <20260905140140.60792-1-christosskarlos.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve coding style issues flagged by checkpatch.pl script. Specifically:
- Add missing blank lines after variable declarations.
- Replace "unsigned" with "unsigned int".
- Replace spaces with tabs where possible.

No functional changes are introduced.

Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
---
 mm/vmscan.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index f11491ee9ed5..8637cc0910fa 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -535,7 +535,7 @@ void reclaim_throttle(pg_data_t *pgdat, enum vmscan_throttle_state reason)
 	 * writeback to a slow device to excessive referenced folios at the tail
 	 * of the inactive LRU.
 	 */
-	switch(reason) {
+	switch (reason) {
 	case VMSCAN_THROTTLE_WRITEBACK:
 		timeout = HZ/10;
 
@@ -1529,6 +1529,7 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 		VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
 		if (!folio_test_mlocked(folio)) {
 			int type = folio_is_file_lru(folio);
+
 			folio_set_active(folio);
 			stat->nr_activate[type] += nr_pages;
 			count_memcg_folio_events(folio, PGACTIVATE, nr_pages);
@@ -2073,8 +2074,8 @@ static void shrink_active_list(unsigned long nr_to_scan,
 	LIST_HEAD(l_hold);	/* The folios which were snipped off */
 	LIST_HEAD(l_active);
 	LIST_HEAD(l_inactive);
-	unsigned nr_deactivate, nr_activate;
-	unsigned nr_rotated = 0;
+	unsigned int nr_deactivate, nr_activate;
+	unsigned int nr_rotated = 0;
 	bool file = is_file_lru(lru);
 	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
 
@@ -2614,7 +2615,7 @@ static void get_scan_count(struct lruvec *lruvec, struct scan_control *sc,
 	/*
 	 * If there is enough inactive page cache, we do not reclaim
 	 * anything from the anonymous working right now to make sure
-         * a streaming file access pattern doesn't cause swapping.
+	 * a streaming file access pattern doesn't cause swapping.
 	 */
 	if (sc->cache_trim_mode) {
 		scan_balance = SCAN_FILE;
@@ -3416,6 +3417,7 @@ static bool get_next_vma(unsigned long mask, unsigned long size, struct mm_walk
 {
 	unsigned long start = round_up(*vm_end, size);
 	unsigned long end = (start | ~mask) + 1;
+
 	VMA_ITERATOR(vmi, args->mm, start);
 
 	VM_WARN_ON_ONCE(mask & size);
@@ -7748,7 +7750,7 @@ static int __init kswapd_init(void)
 	int nid;
 
 	for_each_node_state(nid, N_MEMORY)
- 		kswapd_run(nid);
+		kswapd_run(nid);
 	register_sysctl_init("vm", vmscan_sysctl_table);
 	return 0;
 }
-- 
2.55.0

