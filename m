Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689374;
	b=LBQjjaMZHoi19pAo6TWgiFkxQVnkz0LN/uVxQy9yJVCiNBrz5YuO/o85bZPr+wPyeMnd
	 owX+0QHAyc8nztAMP67LK7jWDzF+Y2T6cKMI/DjnoaMLy7XaQ+o1SXSEEkCOZMsEy2L4n
	 4Qr/Lwela1P41YqhJpVD7hcj7dBjIjUY2OCRiH5TwubDel8Atz1h+jW5UhtcGgIO6qEiO
	 h+/J+Z/Oc2D7cecoU2EZWmOlXg2VZPpfZ492EbXNNrxocIJ1YeVVoxL3iUWkF9WD2qDiC
	 k9Xkz4xIUf3AhJVJO4EOxCUJ4HWxgsU0QsFbbPqxiT16JERhjFmCO8sXDv7Ac2pHX0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+S+ywes3kNv+A4N1xLXPObOnn3wXaYCT7Uss5A1Oyco=;
	b=26nuujK1vxXb9uz9Lv99p02nqbbvhVB/fVDY4CwzyQecSDnC+BgpomfYKHmGLEU33zzz
	 Zr8MKZdqvNLTSqT6k3JE3BXGCRJ7xXeutWHLZRVJRhCWzn52/su4Wi+Wr4NZW6P6mZQDz
	 mtH2Td2sTj88UPcmMo0vlyFjYFau08Mm99+wX5agiceLTtAALQf8DMU7yUccS5V+rNM4W
	 9r6c6ckN2OwiVlkJlRevH6HeJnc8dB48xsPDESarLzJRIQrXx2SCocxpjZ0OkzJwYFaur
	 T2wJJ3Hos6sqF5WGzqLuKPpwy0+RrdPb7vHnJLFJo4OZQTeqKpAmE5xjXWovNaUG3zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--robertpang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VVcIHBxD;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0498606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0498606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--robertpang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VVcIHBxD
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7183345eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793689373; x=1794294173; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+S+ywes3kNv+A4N1xLXPObOnn3wXaYCT7Uss5A1Oyco=;
        b=VVcIHBxD//nuQdmmieTW1uI1xXR08YG1gV8GEGsa87EHCArCEmwiJWnsVcdwJXNhNR
         k/mmg9VCEz5RSS2jCPNMzVEd6yb8Y0ouNKrs0RetxQmNfuEiRaTNcgspMvqFKRjQYj3V
         k4dMw4bvFxzw0jplQ94jIgJYrDtv7kifaWpJg/SViiJ20Rov3jb6sUhoE5EYsgbBcn5w
         HJA8153VvtimhGQ1Kxywx63tNLjKZQYFInJg+ShszNbAU+bo7LC9hdBKhNdhaj5SP9bp
         93Z6iMf2AsCqh0ZyjNxLn5lLZ0Ojk34ZC9EnntRcvWFpmfYmNzJi5mt1eeCgliLNx1V4
         +igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793689373; x=1794294173;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+S+ywes3kNv+A4N1xLXPObOnn3wXaYCT7Uss5A1Oyco=;
        b=QD8aV7HG6cDsuqxaJwULYob/NzUlqtiXDzyClUVCsLTtTAr9K5/kFrPWgvGELXG9sE
         1CNGoaDnQ9FEPnSnDN4dFSKxUGYAMUNdEgLvXHZFvMEn/ndNcGApR/+zy1GsH6GG/VqS
         /3hX0i8fMrGV2h1yJh/Ikh/ZE9ZbCPiyumY5g9U2rLc60UJ0r7QMrR7UfbZ/DnI16nLX
         3fIkWPkMMiyxGjUpu6/hr8GhM6LKy3GrVJ5K1g63KFcg7kcU/P6hK1VA/s/lbbuIc17R
         tLSboiWUbs/BwSY6No7V+qOYFY0cLNs09JEuPDSs62NFMDuZi1dZBOlpari7ZhAbXRrQ
         KgTA==
X-Forwarded-Encrypted: i=1; AKwUvBwu6+vAX2bhL/UD05/3sCRdN15NS3wp9oRKCZOEDXIErNKj4idJb4TnPyo78UksNHViHftaYe8DZB2Yvzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kCxEIPFrPmhDhSi26fvLSiNa+yZKfHDkAjMGEW1y8pqn/XStO
	UvsX8RmjtxyBHeqxlHWadTei+DT5eS9LANoAITU2MnZxXFGmBqnsZfEpqA1ZKBMK7vRbZSRr6AQ
	H/nqLWeqrE6+eZaEs3WDtOg==
X-Received: from dycnl1.prod.google.com ([2002:a05:7300:d101:b0:35d:bc5b:d1b7])
 (user=robertpang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:3581:b0:360:b8b4:840a with SMTP id 5a478bee46e88-36a5eee0ee1mr10548686eec.39.1793689372535;
 Mon, 02 Nov 2026 23:02:52 -0800 (PST)
Date: Mon,  2 Nov 2026 23:01:22 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261103070122.1208383-1-robertpang@google.com>
Subject: [PATCH] bcache: allow more bucket reclaims during garbage collection
From: Robert Pang <robertpang@google.com>
To: colyli@fygo.io, kent.overstreet@linux.dev
Cc: linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robertpang@google.com, dongsheng.yang@easystack.cn, mingzhe.zou@easystack.cn
Content-Type: text/plain; charset="UTF-8"

In patch a14a68b76954 ("bcache: allow allocator to invalidate bucket in gc"),
reclaimable buckets are added to the free list for the bucket allocator
at the start of a GC cycle.

However, once these buckets are allocated, they are no longer marked as
reclaimable until the GC cycle finishes. Under heavy loads and frequent cache
updates, all reclaimable buckets can be exhausted before the GC ends, causing
the allocator to wait and stalling incoming I/O.

Address this by allowing reclaimable buckets to be reclaimed during GC up to
the number of generations left before BUCKET_GC_GEN_MAX.

Signed-off-by: Robert Pang <robertpang@google.com>
---
 drivers/md/bcache/alloc.c  | 3 ++-
 drivers/md/bcache/bcache.h | 2 +-
 drivers/md/bcache/btree.c  | 5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/md/bcache/alloc.c b/drivers/md/bcache/alloc.c
index 3ec240ec685d..959d753e7cf6 100644
--- a/drivers/md/bcache/alloc.c
+++ b/drivers/md/bcache/alloc.c
@@ -141,7 +141,8 @@ void __bch_invalidate_one_bucket(struct cache *ca, struct bucket *b)
 	bch_inc_gen(ca, b);
 	b->prio = INITIAL_PRIO;
 	atomic_inc(&b->pin);
-	b->reclaimable_in_gc = 0;
+	if (b->reclaimable_in_gc)
+		b->reclaimable_in_gc--;
 }
 
 static void bch_invalidate_one_bucket(struct cache *ca, struct bucket *b)
diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
index ec9ff9715081..daae5ac5ffbc 100644
--- a/drivers/md/bcache/bcache.h
+++ b/drivers/md/bcache/bcache.h
@@ -200,7 +200,7 @@ struct bucket {
 	uint8_t		gen;
 	uint8_t		last_gc; /* Most out of date gen in the btree */
 	uint16_t	gc_mark; /* Bitfield used by GC. See below for field */
-	uint16_t	reclaimable_in_gc:1;
+	uint8_t		reclaimable_in_gc; /* no. of times reclaimable in GC */
 };
 
 /*
diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
index 27a129d47d0a..fc167868c814 100644
--- a/drivers/md/bcache/btree.c
+++ b/drivers/md/bcache/btree.c
@@ -1742,9 +1742,10 @@ static void btree_gc_start(struct cache_set *c)
 
 	ca = c->cache;
 	for_each_bucket(b, ca) {
-		b->last_gc = b->gen;
 		if (bch_can_invalidate_bucket(ca, b))
-			b->reclaimable_in_gc = 1;
+			b->reclaimable_in_gc =
+				BUCKET_GC_GEN_MAX - bucket_gc_gen(b);
+		b->last_gc = b->gen;
 		if (!atomic_read(&b->pin)) {
 			SET_GC_MARK(b, 0);
 			SET_GC_SECTORS_USED(b, 0);
-- 
2.56.0.398.g882cbad275-goog

