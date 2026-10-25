Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894735;
	b=0VHvtFI00JccmRNcIEfB51s265P+Qm2aI6Ar6ETMHokbQWzAX1XEE4o4OUdmw3QWv70H
	 kPz2up7IeJDv0MVeYfrCMhWD4lc/hJ8sp/eZlH44TNVw7w1XxOUeDDsCcWiJZ716FQLWn
	 XTK8c0X30RtQWkeZX9uwIQg1QSj0AMDfXqret3GEhszOHp3FHkgtaGncL2Bs5CrCz71TU
	 cacZr1pLCmMmmrSK0PIcmY3P5ELGeNAqlS958j2968cEP4UCLDdD5OXicltzOU9TJlazX
	 XBxzwGZ1dD0lSw21v14/Eago+yrTEJsTSaA8JEc99TU4iTHmu4ri5xnIDa86krYqjgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W+dUZI0Q28ikrVhP8r1OLTtsR33EU3YB9h6P4MYpUiA=;
	b=CqE4tD/Kyl2/zY2gTguu8JBS8CZAYkUgYWuE6ppJ3SP/LNLThjw/ObM+fxo8vG1Mtfgk
	 O4AIR0F6yP/feT5fZbhYvudvC6Ld5Q5QIFK16dznAt2plXctZElk8raoBXcYyCjVvIzSe
	 Uj4gM25zPzcABC3ffp1ULYsWinUb8mMVqS8veKjDnDmVV2IFbz2nrCONK/50MabX2dw2n
	 /3g4fXUssRpCP0SmXWgHfGaqoW0qU5ENzrYXQzmMLP2gnWMBXORcUx7Yy+pwilggA11F2
	 ePDvqKDvIvM17u4VbyDFcwoEaAJx4eeUUCzRGuylKfRiCNyS0uKMKmdwRWVwmUSRwDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XRlFShF2;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C10606A329
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77C10606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XRlFShF2
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so2650680c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894734; x=1793499534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+dUZI0Q28ikrVhP8r1OLTtsR33EU3YB9h6P4MYpUiA=;
        b=XRlFShF2Xdbo009f0ELNMp6a/ydYVhe8QyVATX3GChs94WU1YYFVEPwrBFooWbVtZu
         K/LbC1jX8VNfoYkdESf6icS8N6xxocGQpxizZEgAK027kGecNFeK34Z4kLDGJS+osM4W
         aPmoQtX1OEtFUE5JHHoRgj7BnH6OD9jfXwXgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894734; x=1793499534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+dUZI0Q28ikrVhP8r1OLTtsR33EU3YB9h6P4MYpUiA=;
        b=1BQvLOIprgESnnXXar//3OgVG5TZVwrmI6xgulv9QfWYZMjxO+j0L1w/i0muwGxoOT
         YcEdxhKN9wdRYHZ8/O8ke+s2UO7gMdDgR7ubpe7eULiJTZn1pfGnJHP/HpL5PkhKqqNL
         Z/UiQCCykQSywoLmpi3eCWJiEnPkFgk8pgWxfZ8tgun8XkqBsj+ChJ9ar636S6HQzLrD
         GU3mfHKsqcTEEy4kfycR1FEoIvotYvWghrrc4noJSM6w4+v/gKKOq+0NYkMdbREAnYjH
         7A0LQoD3ptgxDiC2nTSliW8P9qXwvQUOGvAbH5IKCa9vqIDoCRg448zvBTgxYrGbss5v
         tEAA==
X-Forwarded-Encrypted: i=1; AKwUvByIJANzpJZ9GrNgM8NMqrekdRmbXpkyQrsvwBaV1Sdo4YMz5E/r+HV4UmQA+HO4PPx98Zvv1E1Pp2ycz1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRoq4TbZ+i3k1vsBZK/KM19fYZedI72D0rASSh+FEN0ZmP+gdl
	JcovWO5mzbe6Ov2b+KGBl2dg8jAwT28TNGnbKSkZlFwwjto5n5//UhbXM0BczrjeaA==
X-Gm-Gg: AYBFou1BQSx5juBUJ4sWiR1cdSYFE9IomhVdoqpxRBIwsJiSG1FxG4Sn91C88w2v7xE
	Y0Pt8yAgtfZe6Y5Ke839ygSaLPmctYDnqE146CdFBxsgqq3kqtBK0jyTh7oX1xFjfkjzKxl+Tsq
	m666hCDCbVhQM8smRAjn+bn6hNmgKhPEe6itZTZ7NrOark/x0japHvS74skywzF+UuP8AyjJTg0
	UbbT7kN14CCEeWTUrBXsug5Bpnu1NYDvE/e2Az7ALVqhWU0LAyN50Sw2vBZQkD8oPGQ9g5Ez5b5
	T3o1ZNrbT9M4TCkeb9yMBZnlxajG8xfcSD7B906OdpWC1d/prNqXb2kLZ9qRY9izsnEg9zXq5oO
	JLNhpx3N/kOG0Fs1NerBvgJ46Wh3Fb8YaQfxEzgbi+Nicki2pM385cplcX4+14FXuu8E9djssjQ
	JsE9xXc/GxqtIhIdKuFwuny9LIywmHsBf7uydzo1Pr/0+URo2DNwCcLU8dpSpa7eFTAE22BGHFk
	LT3pmQmALYM80f7ZYEq5EACrRt/k3lgm9mtmTPfvEqVPiDsqiJIqSECAo+Qu/LOuLTbM/FBS6Gp
	bZED1TvtAF5fJRdY0gGIuY//LjcFA4hYKbHzfX5WL/bX
X-Received: by 2002:a05:7023:a85:b0:153:3c50:ab85 with SMTP id a92af1059eb24-19934a952c6mr5391501c88.12.1792894734487;
        Sat, 24 Oct 2026 19:18:54 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:18:54 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v7 04/15] zram: move mark_slot_accessed() under existing slot lock sections
Date: Sun, 25 Oct 2026 11:18:20 +0900
Message-ID: <20261025021839.1542805-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261025021839.1542805-1-senozhatsky@chromium.org>
References: <20261025021839.1542805-1-senozhatsky@chromium.org>
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

zram_bio_read() and zram_bio_write() take slot lock just to
mark_slot_accessed(), right after zram_read_page() and
zram_write_page() have already taken and released it.  Move
mark_slot_accessed() into those existing slot lock read/write
sections.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 0e1aa0da11aa..2affac25db5d 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2188,6 +2188,7 @@ static int zram_read_page(struct zram *zram, struct page *page,
 	int ret;
 
 	slot_lock(zram, index);
+	mark_slot_accessed(zram, index);
 	if (!test_slot_flag(zram, index, ZRAM_WB)) {
 		/* Slot should be locked through out the function call */
 		ret = read_from_zspool(zram, page, index);
@@ -2244,6 +2245,7 @@ static int write_same_filled_page(struct zram *zram, unsigned long fill,
 	slot_free(zram, index);
 	set_slot_flag(zram, index, ZRAM_SAME);
 	set_slot_handle(zram, index, fill);
+	mark_slot_accessed(zram, index);
 	slot_unlock(zram, index);
 
 	atomic64_inc(&zram->stats.same_pages);
@@ -2283,6 +2285,7 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	set_slot_flag(zram, index, ZRAM_HUGE);
 	set_slot_handle(zram, index, handle);
 	set_slot_size(zram, index, PAGE_SIZE);
+	mark_slot_accessed(zram, index);
 	slot_unlock(zram, index);
 
 	atomic64_add(PAGE_SIZE, &zram->stats.compr_data_size);
@@ -2348,6 +2351,7 @@ static int zram_write_page(struct zram *zram, struct page *page,
 	slot_free(zram, index);
 	set_slot_handle(zram, index, handle);
 	set_slot_size(zram, index, comp_len);
+	mark_slot_accessed(zram, index);
 	slot_unlock(zram, index);
 
 	/* Update stats */
@@ -2756,10 +2760,6 @@ static void zram_bio_read(struct zram *zram, struct bio *bio)
 		}
 		flush_dcache_page(bv.bv_page);
 
-		slot_lock(zram, index);
-		mark_slot_accessed(zram, index);
-		slot_unlock(zram, index);
-
 		bio_advance_iter_single(bio, &iter, bv.bv_len);
 	} while (iter.bi_size);
 
@@ -2786,10 +2786,6 @@ static void zram_bio_write(struct zram *zram, struct bio *bio)
 			break;
 		}
 
-		slot_lock(zram, index);
-		mark_slot_accessed(zram, index);
-		slot_unlock(zram, index);
-
 		bio_advance_iter_single(bio, &iter, bv.bv_len);
 	} while (iter.bi_size);
 
-- 
2.56.0.257.gf7497c7d27-goog

