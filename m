Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAEE4F7975
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895189; cv=none; b=YUFpN1P/sgqBd8HJYtOLnl8Jb12HbQggN/3lbnDQJ7yh1QJxRUfcaM7EPD33yJO1ri5ftromMAXfDJq/MP8bnfnxPK/9V36DWCVrS57MbNgPvs0vQkL0p9RgOiOINvBtPzXA32XqC3qx+PVDaktVfIrgcf5KzewoDdImrCjiACI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895189; c=relaxed/simple;
	bh=o+oFNcLpuYqRZRBrDMdI0bemVABEvrdGdfb8nMKpYCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4gERWjxvBb5HMvvRY7CIv6RPqHhQfq2/Yoell+LBdMso3i5qqfTjT06As3FRCoSC9f9EGqXw5xqDSvCRmPI2K7CISULOrr7R24wN7EKC1VoQdOLDxmEU2VqcsdsKNw4HxC/oqqTvPMWZ3phYQ+gD2R9Rk6A+g+BsH8emubq2Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdvWsrjL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdvWsrjL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1af482519so4175025e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895186; x=1792499986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAWkYGdqvifr12JtKIaB4bUGFJ5gXXZ5L73FeOEQvOQ=;
        b=GdvWsrjLWcMiP9fZ1ahbbhArefyTeYu9wHC4qBHFlI1TFSVlJXkI/e7FPCsGSDPeMk
         Y1hGqca4m4MSFuVWz7ayVsis9bZJuZnTNbGWJEgAC8/S/h8GOWc3IZ/tUeARwSaA9Wjc
         nSDFdXnuJZh5KvajnIbqUhh6hYAG7TO/0ro0lyraw/HyitmmybR9NDFdkiaUI7mshiYm
         ttAoD0aKev82a8RP0RE7iR5TAP7HxCJJEMYkQHoCtx1CKGrR7oNZufRmVPGNA2g4HwJh
         HGGD94ED9ROUCtre8ZhZF+OgfWQunGZxysNIWJ7Qr29P3CFKBYK6VfND5d4xlavuneJg
         laHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895186; x=1792499986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAWkYGdqvifr12JtKIaB4bUGFJ5gXXZ5L73FeOEQvOQ=;
        b=FqeAzyQv1iiKLRMNIMjn+a5qKbklvnlKWCW9amBtPeGjHIm20F3zErwphDFAp3Oarh
         55tt3Eylnzs12yC2eoe6fhU8Xy0D8gJ4/C3uEEmlhuYErPKsv/h9pxCo6EXUUKhi6ntu
         /tc5gk9UMBOfyzXFxyeYQHSOxnAPmTjNZwsDZWOgsH+qP4ghpimBlvsBLGze360ik1Tj
         4h6B6XP71MMjSrZJ7H3LFMohUYdALHirG3SHaeN+VpbK96/Mxsov0rAjYCM+PqwRF2MH
         wd791HmTGkK+nndJmV3o89MMNBvnwWkN/eHqGpu3u5eWXL9Dolxfzandu0shqo5B3/fc
         HUzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJFAIGadgQvzS1E7EboBqIqaNKGDW2nzrrpC6rrjcqGuids2m9ncp0TKXFzkwbR7p/QVARwTuWD4JvmKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL45Mv0ayJ8csHt442ettlRhb/zoJb02hFuhJmpRNvur2t+Cmaj
	U4R5dfabe20Z+cvJdH+Z2cIdJMoLNayUK3Jffx8hw0orEmJG6Csl4B4l
X-Gm-Gg: AYBFou1SH5azNwGTGxCC2Kn6Pq/pIfDjweiWb5hswPT20DicZ6yIQPom5gUYwACJHvT
	JnS31JXbRNqSwVOJ/1ZcbFNIqnNW9VILE+xQlzSvIXyE3r/NdsoMhvMlsUFw9TTUTgCNmuIRCfB
	kMD46cDwpJ+oQ9m/8ZQ2yejm5qmdyP/SeWtwWgqPqjIzSiwcFqXHQ4EiT9os0anUYlnSMRHMNUG
	R4UsVbVc+H40vdzAlfu4OiTU3Xxse60tvEZUSD7qIUyivHHViSjoLNcncKPdzWsbollO6iiWED6
	Hmu3DJc3QOz6o7Klb4mpBtMmAe0sxdJad5dqsIIugYrhnXWm2wcIVWi9qzXpN+WJcb5yLEZdThP
	n56HnkG79kC31zhFDralbZSuJhMW72wpNc4+aPfzY8Cnr83D+1kav78yoUE/SWZ85W9CLH08B4A
	HGirSMZD8XclTXmc2OfGDWV33OXHpYHLBuwk6W1L2JVaZU9ZWh7zHsX4FJPM9EScD9kaKFkJsXy
	v98TpN8sl5XMg374U8GTqPOVO+W8SkgFBdcNOHiRkS9D3vs7y1/Wwb8bg==
X-Received: by 2002:a05:600d:864c:10b0:4a1:8bff:9284 with SMTP id 5b1f17b1804b1-4a18dcd532cmr193416285e9.15.1791895186426;
        Tue, 13 Oct 2026 05:39:46 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc7299sm4179440f8f.53.2026.10.13.05.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:39:46 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: mpatocka@redhat.com,
	snitzer@kernel.org,
	agk@redhat.com,
	bmarzins@redhat.com,
	dlemoal@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] dm zoned: do not reclaim a random zone into another random zone
Date: Tue, 13 Oct 2026 14:39:39 +0200
Message-ID: <20261013123940.952-3-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013123940.952-1-illofspeed@gmail.com>
References: <20261013123940.952-1-illofspeed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dmz_reclaim_rnd_data() falls back to a random destination zone when no
free sequential zone is available and the target has cache zones. When
the target is idle and the cache zone list is empty,
dmz_get_rnd_zone_for_reclaim() selects random zones of the zoned device
as well, so a random zone is then copied into another random zone. That
frees nothing: the next pass picks the next random zone and copies it
again, for as long as the target stays idle.

Seen on a two-device target (256 GiB regular cache device plus a 27 TB
host-managed drive) used as an md RAID5 member: after a full rebuild
every chunk was mapped and no sequential zone was free, and the idle
drive read and wrote about 72 MB/s each without pause for hours while
the free zone counters in "dmsetup status" did not change. Reproduced on
emulated host-managed drives (tcmu-runner ZBC handler): 340 MB/s of
copying on an idle target, 0 MB/s with this patch.

Only switch to a random destination zone when the zone being reclaimed
is a cache zone: moving it to the zoned device still frees cache space.

Fixes: c5c788595292 ("dm zoned: start reclaim with sequential zones")
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Assisted-by: LLM
Signed-off-by: Kyrylo Biryuk <illofspeed@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 315f0da99f3..88d56d3c86d 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -288,7 +288,13 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 again:
 	szone = dmz_alloc_zone(zmd, zrc->dev_idx,
 			       alloc_flags | DMZ_ALLOC_RECLAIM);
-	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd)) {
+	/*
+	 * If no free sequential zone is available, a cache zone can still be
+	 * moved into a free random zone of the zoned device, which frees cache
+	 * space. Do not do this for a random zone: moving it into another
+	 * random zone frees nothing and, on an idle target, repeats forever.
+	 */
+	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_is_cache(dzone)) {
 		alloc_flags = DMZ_ALLOC_RND;
 		goto again;
 	}
-- 
2.43.0

