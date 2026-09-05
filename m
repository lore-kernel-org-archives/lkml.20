Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E5038B7D6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788633126; cv=none; b=PN61VfIJS4ON+w+P5hyC9RgBea240oWxGzM5cqvoXkw+Vfj8S0C6vi9F7gHto54mweA7wbD9YsFT3fHyXy+FYkH05q3yyNXCgpOFWyG+4uTTzLOrwrjVQ8HG9vUdffgu/JFmHBmlbBzHF9qeqhOL2OqcQ0jOJtCFwPM9fqvAiiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788633126; c=relaxed/simple;
	bh=rqODe6l1Cm61+SL+PU9OzzcUcMPpjddwokYbvpjhEt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9OqK+Za+/QwuGhNs9AviSM2IpdZbGRv/iy7vj1WUhy313ue3EYH4dfoxdm7R01+OM81STfjhwql+sJjBqd7qg9vupEx0+gkW0Om4lf+A0BSK5YQG0n7CK+00nEge5qr/ePBDInu0rqxCiTk2p99wiyNiOAdYLNbT+Umzkvq77A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J18z1YOF; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J18z1YOF"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49b963f51f6so4029125e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 11:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788633122; x=1789237922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnvH3YyzaVn11cnbchkUMzbKPWM/Jg4IVEMRRuXlOTI=;
        b=J18z1YOFZGndH/3Ko2iE+LJ5X4IONdwUDbWN3JuTlagvB2qrrMQLv3Ik2Mib6I4rI5
         tBaW+XspsNQyv0WlVAoJ6e3YVCJDszFtPXnAw0hZui6KhwU0fAYRluMvu18ltL6TtbHb
         RLvKEitauKvVH2UrW9d/KpP1KK4TCQg5lZ5ncw8dAQfABYurS6LvSEGgGqA9FoBjH/oe
         ob2HqDvVJsWo+EOW7SB65f0BAF2q57UdI+VL6yjNkdLciejt7F+v+vZ83Fqem9MuPQIb
         U6LmRYTipjMkEBuj3GySATZJdbVEqXMF9FYRPe/qWfezpvrhycQKrBzXAmyIVPlkiJXK
         NbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788633122; x=1789237922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SnvH3YyzaVn11cnbchkUMzbKPWM/Jg4IVEMRRuXlOTI=;
        b=sribBzCQVFpadBKNA2PqYj3TcDwd41KN1eUB79kSDxtDW2Y52JVbMEjJCH9tvdm/zF
         vZPNMHIItGrhy8/ttkKRl2NdBGP46wAw1EmxL3/OdZXgGBqO3KzSvq6qDDxxe0R0TNz8
         3AuHi3T6EYXl4oDPjGKP1Dx8qZ9Zj+hhAoPnsSiQZLIOO3ttqSXeHWfdZREviZc9juJP
         PkY5OXgAwEKJ3TmLddAd3Z9FB+f/JEmHGRGtF2cBtmXd9/qicp98/kMXs7FAUQF6/cEl
         LsJbIgCiyR5EdaGHNLW+Er/UyJMThRlx1x9kRmA3hfBkFlBJHX7cV1HfIi51G7zaGlzP
         wBgA==
X-Forwarded-Encrypted: i=1; AKwUvBy8JlzpZPvudZ/wa1CGJoo93BXhRZHXGbSxHuxLDgs//Ms3wow/oF3/0vbu0TnKxxKobrBV+NQzTkVAwVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++miJoC3WEJkViJgfGhOI/HpTorPJpoY+xlkpKbfc94StgiK6V96
	BghELqziYIte+1CKiVVTE9u2N+7QFI2vHOCGIivomzMGqHP2GSAyPh9s
X-Gm-Gg: AYBFou1feQ7883vcIATTwi6GnlcvZ+uKswTvL84v9x7h4txF420jDJqduuj0Y9zF+eG
	1UZvZSyMtgiLaOE8BcS3Pzz3CfZwGBPJ6p2x3hRvGdKefgvHiwWOM/AV0uGQPrpdvjv6UMzgVA+
	m4rQLDuTX5MDc6CtLX1irLupZTKgYj0PyqDIQpqrFgE+/8wrLuwrsDWeNVEk8op0j/zNRFSmcqI
	5aRYt5oWSD71zw+M4HQbTHvC8JQ8oJyitH6ZB3oM4Vpmqfq8FmYB7BjAKYYDbNxcYksCXUL4Arz
	AMF2+aqPQKo5j37jWzlrCHAkdQTQEgAaqFnQnmVAJLvAHaU3qz6sBQwhnlWUySAmAc2/LTl/JNG
	/u8l64BUXRn5+BnM/YVSARwK1G+1RwJJKDRfvX+/yf/fhfDk7AEiMoVRJC0lilCl18amCeALcKA
	W/AwxhHTQopIpZCuntGnGNQ0JsNfYevuLF1KPNz8SIidHVRVFIyFNkVlqfmD/rO/7RWJ30Vcpiu
	3UHKUqRsws27KPHvCegIeJS5b3Iug==
X-Received: by 2002:a05:600c:190b:b0:49c:fa21:e743 with SMTP id 5b1f17b1804b1-49cfa21e92amr116118745e9.25.1788633122311;
        Sat, 05 Sep 2026 11:32:02 -0700 (PDT)
Received: from outlook.com ([2a02:587:6022:4b00:84ac:4417:9f37:a496])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm13066670f8f.3.2026.09.05.11.31.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 11:32:01 -0700 (PDT)
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
Subject: [PATCH v2 2/3] mm/vmscan: fix various coding style warnings and errors
Date: Sat,  5 Sep 2026 21:31:34 +0300
Message-ID: <20260905183135.20993-3-christosskarlos.kernel@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905183135.20993-1-christosskarlos.kernel@gmail.com>
References: <20260905183135.20993-1-christosskarlos.kernel@gmail.com>
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
 mm/vmscan.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index f11491ee9ed5..e0df7268d989 100644
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
@@ -7748,7 +7749,7 @@ static int __init kswapd_init(void)
 	int nid;
 
 	for_each_node_state(nid, N_MEMORY)
- 		kswapd_run(nid);
+		kswapd_run(nid);
 	register_sysctl_init("vm", vmscan_sysctl_table);
 	return 0;
 }
-- 
2.55.0

