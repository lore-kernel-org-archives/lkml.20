Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973129;
	b=fk1NCqVaSp8DS+p4hKlEXbLlpUau4ZA9tCNi9bYSbNWCq++JYPzgAvy2Ms7UzxRxduNk
	 C2fXU2E7VtbN9XmO+7dVqPPZSzuCKMTm8+cPTYIP995IWpsGcPIvI+zkGjR/dMd4WRWku
	 shWcLFWx0/P7Tr4+c4g5Ihvy76C5alhGh0V0c7orYKXyACKveHPUlLq+T8zyczOKPoOD8
	 B+yregssRU9uzlrllosbxNT0Pzu+r8THuWQ7w90tCkFURkoIq1SRLSG9gOXTsRQEEuGy+
	 nzuHQ6K0c3XqGjU4D1G7cdrpMRAGQDOxZ2BzkRTxotbQQl9Epu3xutxdl27967hutoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T1XZ1WfHH7XnOv0sWlDb4paoPJtD91jpUpFHrBDh51s=;
	b=V/WONUXFzwMQByXeGa5vDbvqhjPD+taJTStjKDU/pz+R3nFAWG4KwYd1fDfZpSr1SNCf
	 79K8WlTAbXJkmWVhhFYm4hxa9nml25y+y+nYKAXpTwJCbKTbvcTtu9ZZtwtPR/DJ5PRfK
	 wU9AfPVoyfaCCqwgVU7BgV3M+0u7KNrT7dBAEwmthnyjc2tEAgJbIQJBRZHSiceKT0nLc
	 QXocpo+qxt7u79lKEBaSrwX56pLnc+wHef8V8uNsGGsSml5Kp668KCI8iudg0lji08J2B
	 XMoheL+gqXG0sl/QxwzaS89X8Hw1g/PkzeSALPqDl3yEXzHRVoqIaA8bcihu4YPxDIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NHCbz66H;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AC9606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9AC9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NHCbz66H
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-369f30a96acso720654eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792973128; x=1793577928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T1XZ1WfHH7XnOv0sWlDb4paoPJtD91jpUpFHrBDh51s=;
        b=NHCbz66H380hLDe36iJ3YyizU2wTxHQ+sK8vl+yKeiJN8/DjTGde+YR9MLqjB6kIgZ
         I+IfDdfzG1iQZ+SkJu/jOBCgxll2hH9RyTjZsYh4JoBPpLcrT4h9UyWv79O/fLk5zM65
         GGJ3rhPKPzsJKKhaaYyNBPTyrjBIUZaw2EGP6AgLFK0ocdHs630f99fSl9Pj88ezI2Zv
         6LN70Evdyt+8e81Pgsp2kBKxF4jE7muUAW2FglveSpbHpPzoGNWmDghUGb97R3kyPjZn
         4ppQeuWyLQ4zykkxUCLRKrG2VNuCwo/UqNDL1daLK3CLOO46nOdzLEN0BMPgGVZvGZpD
         7TyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792973128; x=1793577928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1XZ1WfHH7XnOv0sWlDb4paoPJtD91jpUpFHrBDh51s=;
        b=1DDI9LP03KuL+XJD+PUEPF+6DIIHHnXGyu4uyhar0WxmSt/UOsC60oyS+w0NgSe4+E
         VSYTgR8h+28Xn3h8/hkAwDwH9DirxKMMPgDAwssIwUx6RWpLvppYQFB8D7UrrmcLuKnW
         ujQaIlLlsUo3tWsc3pWoPBlBkcQC68ybHNJk7/9v2YLgAahaXHI/rGRXhGlY/ejdL9z2
         49+bgfzp6Z49ErvYhnd6JyQR0y8Pxr373wJmaJA8OUqFLUG9LHUb5DS/GU9JjCNV0GvR
         R9Ie+yNipR87MBq0tN53GWexjxXY86421JMxQHG2BI72+qEPdq2zBwbnZGCqSF9oN9Z1
         LlkQ==
X-Forwarded-Encrypted: i=1; AKwUvByqVimu31XKy+oKO18VWmBxje9L8JiaWBOliLx2a/LiOT9IplHk9aZybaRtdRUqMU8w3cXOmKyBlEPx4PY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvBKz88KI7MUBw0Y+Q+QxdJJAGAWsYLK1qSRsGiDg1Qr1cp8vD
	lWrA8Vx3RWvQX0tUi7YY0LxplPRb3DYWnS9m83asyBP5PV1kz4oKKsgB
X-Gm-Gg: AYBFou2VeZXQNxL3IuLMFiSdJe72DBkJOkwOeJ82HhIOZlx5fjrRd61lL/KBNHN9QMq
	XdeuZan7Mn1qTEPXdZvfzrfbifGvA9wxjqhnWnrPJLYLEhviGJ4JYzlDf0tTPK1kJzIkSchsd+2
	3Cnreufy+Tb9jWrN2kafAvQmZwgM1NzH/s5leD1eZ3H/OplgpVNeHTd2H9KE6Ti4WYtmP1NYfQj
	bAVL5kdgHipkTONVxCK7Nxai28HzRhxykUjGeIUxtWSVnB4Rq8qn92P93aQ43rzgQ2/2063deie
	sd77oLkMvB+5GhDx/0OpvAnrWM/NEQOWSY07/T/raT6HgxNTp7FWGX9Zm1l6/saD1EJYtWWvEJ5
	bHmWKUc5R0llt/y6fBBfk3/1+NbfD64ipC+wSqUNLTMHRtgK3+0GYvEw68HxBX68d/iqZD14VRL
	zpok5IaQqxBhdVvB0V10qQRfaspD2+B3Dli+iG9a0KoKoQ1kHLj2TqvzmZenswl/ZWslAEHWhi9
	rdY0fIevpooVQHUpFl8aN6XVJbJnNNGXcg+5ceh/WFudhU5jtCc4V3WS54P9LXP3wmvFh3BFs4g
	K33ZkZY=
X-Received: by 2002:a05:7022:3f07:b0:144:fa57:c617 with SMTP id a92af1059eb24-19935dd7f53mr9109408c88.34.1792973127715;
        Sun, 25 Oct 2026 17:05:27 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee69sm26698531c88.4.2026.10.25.17.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:05:27 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dm-devel@lists.linux.dev,
	mtsai@redhat.com,
	colyli@suse.de,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] block: fix discard alignment for non-power-of-two granularities
Date: Mon, 26 Oct 2026 00:05:11 +0000
Message-ID: <20261026000511.73371-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

bio_discard_limit() uses round_up() and round_down(), which require a
power-of-two alignment. However, discard_granularity need not be a power
of two. For example, dm-thin supports data block sizes that are arbitrary
multiples of 64 KiB and advertises the block size as its granularity.

With a 192 KiB granularity, discarding one complete block at offset
384 KiB is split into 128 KiB and 64 KiB bios. Neither covers a complete
thin block, so dm-thin ignores both and the mapping remains allocated.

Use sector_div() to find the distance to the next granularity boundary,
and rounddown() to align the maximum bio size. This handles non-power-of-
two granularities while preserving the alignment for power-of-two ones.

Fixes: 9b15d109a6b2 ("block: improve discard bio alignment in __blkdev_issue_discard()")
Reported-by: Ming-Hung Tsai <mtsai@redhat.com>
Link: https://lore.kernel.org/r/CALjSBEvjbiGDVewuapWKhGDtaxZwcn4=22raUiBEOyj22rY7-g@mail.gmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 block/blk-lib.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 688bc67cbf73..e0de5bb4d969 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -13,26 +13,25 @@
 static sector_t bio_discard_limit(struct block_device *bdev, sector_t sector)
 {
 	unsigned int discard_granularity = bdev_discard_granularity(bdev);
-	sector_t granularity_aligned_sector;
+	unsigned int remainder;
 
 	if (bdev_is_partition(bdev))
 		sector += bdev->bd_start_sect;
 
-	granularity_aligned_sector =
-		round_up(sector, discard_granularity >> SECTOR_SHIFT);
+	remainder = sector_div(sector, discard_granularity >> SECTOR_SHIFT);
 
 	/*
 	 * Make sure subsequent bios start aligned to the discard granularity if
 	 * it needs to be split.
 	 */
-	if (granularity_aligned_sector != sector)
-		return granularity_aligned_sector - sector;
+	if (remainder)
+		return (discard_granularity >> SECTOR_SHIFT) - remainder;
 
 	/*
 	 * Align the bio size to the discard granularity to make splitting the bio
 	 * at discard granularity boundaries easier in the driver if needed.
 	 */
-	return round_down(BIO_MAX_SIZE, discard_granularity) >> SECTOR_SHIFT;
+	return rounddown(BIO_MAX_SIZE, discard_granularity) >> SECTOR_SHIFT;
 }
 
 struct bio *blk_alloc_discard_bio(struct block_device *bdev,
-- 
2.43.0

