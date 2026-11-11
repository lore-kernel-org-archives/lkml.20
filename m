Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379652;
	b=H2eDYR3bpXVVf0nq7VjKoqVrat1oLsV31Syl64mvatrE1ay7qkQjdPRaEO9sNL9NRkjV
	 aw6h9Gm53RPwgaBO2YiY6cxCsrwa9DP00aW5ap1WJtiPcwwv148CXQIY91VqNHOeS/802
	 reC4/TdxpmeJrnkRCbNignmNhTup1kJRJjY7OuO4zc2JcmNoGS484Na5G6zZsqKNZgkd3
	 3oUHbwnKKin+oY0WlwhvfMbunPRF94zkx0BUVbryomSTiU8boMRrsrcGzmoT0zH1dR00c
	 kjoAOmRDtY3nRBt4SPkvRIYfX/1rss0gT6Wy1zVNSI/rMZlQ8s0Dt7HmfGf8cser1JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FxBgELUdpwYR0KSdpANT2wdlj1GRYG+jNYkJLmCk2gg=;
	b=Ph38AKE0hoV9NMbRVvOHFg8SfBlC58xbgqFyV9ADHJufPu9uuJcgRnWi48jSz/lShG0Z
	 41HwBEWTSzSLBtU5RShuNhETeVfwEu2PCm00ftr225/QZKAEyhcldrqakuLIUNQdh+qsB
	 4HRzgpcUhrgBOw14ns7dGg0rWy6Js0TCz7Sdy7ooM63Uy4516iix/xugVjl3MoT+JsDh+
	 d3XY2kfxJh2QbtiLnIfvwagC8bpB6VXWXby2nT66XbOtCnZOTMg41UsRVvQj6tgLvHNTd
	 4EeSIm4YcOg16nzXUVyyUZAAId+X5Luc5gB02GRw1lLktcY6nQWPPEpGxjiVIXf3TiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F34gCQ+f;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894F360A5BD2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 894F360A5BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F34gCQ+f
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd69954c755so2025057a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794379652; x=1794984452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxBgELUdpwYR0KSdpANT2wdlj1GRYG+jNYkJLmCk2gg=;
        b=F34gCQ+fCCsdN0e7vOwttwPv5bUW9XytE3ZxJWJajeLfJGE9alIme/Ue9OnhcVR4GT
         DKLoLxq4LH0dBeDwQ2Xj+0fzuxzfWHl2+eITf0e0jD/ZfkY0G1HIbdB2ri6A2Vni4NjK
         BTfQekxJP7n3OGR4fn4JrNoEaNYpbuLnjemaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379652; x=1794984452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FxBgELUdpwYR0KSdpANT2wdlj1GRYG+jNYkJLmCk2gg=;
        b=kCLHR1zLvgZbYL+nQfTneU0RYqqJkcMas/Apmk2RkwQxzvfVL/m+PsNe2IbVwTmyVP
         mIg9B1x3J4brd6rHDTOCAoMxAzAnL/hYArxmizQCqb18DlHi972VUIaKNIUnx/g5Zyqg
         YzctR6ZN4rcyvhe+ZrKKuL0MOocrWP6MWQOs8nUSvezt/Ii2Uibcl/sVwGAsat0Ww5I3
         IAcuKma20Y0PhYK9qv3+1xhPVt/ac2amCGfZ+frGz7ez4akoIgY3nGHvfb+tewd6QOM5
         af1nDPFDzYHKhqM+LK9DkesKj+pbsJTV53W6DJtSJxllLXD0kqjBl91fyppv1qOM4U1f
         UXvw==
X-Forwarded-Encrypted: i=1; AL+hErEIgico/aPK56CksHZEzKKF054uvKNFO47mgrb+n6hD4S3DesIiLF43bVk9xP0BJCrslOWzQ6O1ynI2JuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/nMRw8OIkfuMidMVYgVQQPXmgim3L/OgmPkMxVgcH+QLKmEvw
	9K28hCDRjVTsoj5juM/nmPyvnoFOK773XvklXMvS4AqY/J72EUF+UuRz9xC4+WOIbA==
X-Gm-Gg: AYBFou1yDdy7TQP1D8QcsSzVMXB3uOaNVnallQt/qJxr2GQEZfSIWPJM1sNiJqdtVlw
	mO0/mf2Rbje3AyYPRuINjy8iTxl99Z5cq90AK7Jpj6EyFHuOBqD1FM4hwhqpi5ysljo98gr3KAs
	UL4kE0iLFE0L+wm8Ndmox1VA4cr42jmSZt9ki6zr+tOCkyTkpDm0+ktqwLgmg4daW7qwqbWN0Qa
	r5gwv0KYI7vB6AwqqwOxEbaRsdYw5erFZGb1A0ubiWL1IwkxSCw1C/Erg8UiCueIW2B5AFMEQ8z
	Zi8J2HX7BeKQht18B/ldilEMmDCgMTDSsgc6XXxAJSQk1gXxMpwByVbtIvriwqzK7dwOd/PGoL0
	1TJ/ntKSlSDdx5YXYznXc8WWE6NlXipTA7mexWvU14XkJYqcs+WJc5ABmPHuvWuftZ0g8UZNq+G
	mTsrziYDtyrG+6ASzeUnQ51C67IBAZOcBG0c3JrqHFht+8Zg6wNbCbc9HHfHb/WB6VfQN6UV5sN
	9x+eza6iXKoUCWDkJ/5JwsJ/ddDIblqF0wSwBRFA2ixZy/dH7QEFc6btjGtoLRYziubGpq3PauL
	kSsx/gAq+VLQzAz16a9cBNKTxbcls6egyd73zz3ipTXqOFI3TFKfuDk8B/mm6fhfWqEHhq5/Kmk
	6Cjuyv7GiCB9k1NC383BOhf6pneUVYyjr2ZQEV/xb
X-Received: by 2002:a17:90b:1d4e:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b182f1903cmr1771365a91.54.1794379651615;
        Tue, 10 Nov 2026 22:47:31 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db85a9bsm3268666a91.14.2026.11.10.22.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:47:31 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 06/11] zram: allocate zsmalloc object under slot lock
Date: Wed, 11 Nov 2026 15:46:29 +0900
Message-ID: <20261111064707.2568433-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111064707.2568433-1-senozhatsky@chromium.org>
References: <20261111064707.2568433-1-senozhatsky@chromium.org>
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

zram_write_page() and write_incompressible_page() allocate and
write zsmalloc object first and take slot lock only to free the
old slot data and set the new handle.  A subsequent patch makes
zsmalloc store object location directly in zram table entry, so
we need to free the slot before we allocate a new object for it.

Free the slot and allocate the object under slot lock.
recompress_slot() already allocates objects under it, and
GFP_NOIO reclaim cannot re-enter zram write path.

mem_limit is checked before slot_free() (previous patch), so hitting
the limit keeps the old slot data.  zs_malloc() can still fail after
slot_free(), e.g. when we write from reclaim (PF_MEMALLOC), which is
swap-out, so the old slot data (if any) is stale anyway, or when the
writer is an OOM victim that has no reserves left.  The slot is left
empty then, matching standard block write-failure semantics.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 74e02cf4f53d..dbcbc267344e 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2261,11 +2261,15 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	struct zs_handle *handle;
 	void *src;
 
+	slot_lock(zram, index);
+	slot_free(zram, index);
 	handle = zs_malloc(zram->mem_pool, PAGE_SIZE,
 			   GFP_NOIO | __GFP_NOWARN |
 			   __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
-	if (IS_ERR(handle))
+	if (IS_ERR(handle)) {
+		slot_unlock(zram, index);
 		return PTR_ERR(handle);
+	}
 
 	update_used_max(zram);
 
@@ -2273,8 +2277,6 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	zs_obj_write(zram->mem_pool, handle, src, PAGE_SIZE);
 	kunmap_local(src);
 
-	slot_lock(zram, index);
-	slot_free(zram, index);
 	set_slot_flag(zram, index, ZRAM_HUGE);
 	zram->table[index].handle = handle;
 	set_slot_size(zram, index, PAGE_SIZE);
@@ -2326,11 +2328,14 @@ static int zram_write_page(struct zram *zram, struct page *page,
 		return write_incompressible_page(zram, page, index);
 	}
 
+	slot_lock(zram, index);
+	slot_free(zram, index);
 	handle = zs_malloc(zram->mem_pool, comp_len,
 			   GFP_NOIO | __GFP_NOWARN |
 			   __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
 	if (IS_ERR(handle)) {
 		zcomp_cstrm_put(zstrm);
+		slot_unlock(zram, index);
 		return PTR_ERR(handle);
 	}
 
@@ -2339,8 +2344,6 @@ static int zram_write_page(struct zram *zram, struct page *page,
 	zs_obj_write(zram->mem_pool, handle, zstrm->buffer, comp_len);
 	zcomp_cstrm_put(zstrm);
 
-	slot_lock(zram, index);
-	slot_free(zram, index);
 	zram->table[index].handle = handle;
 	set_slot_size(zram, index, comp_len);
 	mark_slot_accessed(zram, index);
-- 
2.56.0.542.g3ef89b7020-goog

