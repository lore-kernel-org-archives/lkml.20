Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D77433D6F7
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648980; cv=none; b=UcplABP4W2cXQI8Cc5L9Bh5/HekjESMG5N5c4sIC8Z2e/9yJ2DGua7tczocEn1bcRTpM0Q3Mmj4sLWLWDATEBRTZQtq01Jm4CdkxcnmxXKOOk4ctxd6LEOYKiNkz6nmhAcJlWGn5r7WMPUHUTwQ2SuwTkTbw6vsRhiqbU0ffeus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648980; c=relaxed/simple;
	bh=03OF+1Ek6lttvtzebwu1i3h0wWO50Z4SqmRyzg8h1DY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JdEpSSWsdFj8zXE6PYHJfRulUaAPZu+13v2i7FmMBBJpeBLU1GrdKvyVwY1QF5riyNqlrXwMzLJofTtBzr2lTwbeaXgD9sO5aWaw9mTtS8d7E1W2uZt/sG3djrjGJwir2bXy5EBaGAr174GgNKp/jy7X+fyWnzTDSAGCkfEreec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMDHm4RF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMDHm4RF"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e6df2742cso110731466b.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791648977; x=1792253777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFZZRv/P/W173y8m2SUZ2LX6mxqwcOiMdvmZTNTtqnY=;
        b=DMDHm4RFnYOAmtbhi/yGnknGF4wuTQY4tr7fPx4fnm2YJ8FdKC8npYHVEwN18+QGXd
         7e2EyP4f45q6JFBCzvR0GYTNSlLhGDJ765jNMLXbjOMGsO30d617kDzHYSYZJDcJTVun
         MAvAKUNjE9Dz4XSkLZi27AaeVRlwzo9/6GJgIMubAY8Hn3jH4GP/nsQzYtomJiyt/GZ+
         C1my30w+UzBmiPPDLr6U5JlLMBiVYkPYtd15vh9YmPqyHL57B0e1gAR88/AAteMOp0Me
         ibDT2gyqX6jrhBMZVfVQ6e5/N++C94E9q3VT+yRLfBO7DsYsMOnwMUkq3TW7zTsMbrsD
         xztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648977; x=1792253777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFZZRv/P/W173y8m2SUZ2LX6mxqwcOiMdvmZTNTtqnY=;
        b=Fi9yR/7zRQ4/UVnsXDeC323qMsqJJeGi8hJPz9uPcDs5AlGmUGHhg8g/DfiObx8++B
         HcMe5PieFU/WG4neV9fmLWkiO/SW3ZOwY0ax36NR7kasd7jJiMD5GRHTdzv9geQsaYmh
         s5lPbuN+32HqbVfLUTpM5o89ndkoUBfsr8qA5TQMYHvGDRSY0yEb9xlRRAFxsxpyIWPC
         Xb2RP0HFDy6+w3yU98aWeYKDmjrVCEFxl3sAJSE5RZBueLQayVTyDEgJ8knECn0YlFyO
         vTbumGOQsmCb3ZqfcwhNgfiqen2IFzAqtvi4pL69jBcsgsKRkCCEM4VjMQHSTLFD5iW5
         +Dhg==
X-Forwarded-Encrypted: i=1; AKwUvByfYn6490BiElz3TycD6ChinkwVHK51ZAecuaGNdAseTfD6KyCi0Dokbk7X36PLFrEWlTCMZ4eEtnpdTKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBlSefZBlYgU7S+QU4ew/eiHpvIxWNNibTCvnygzo6O7GkUYtd
	QtNEAorgMRr5PK8M5eSS6LoFD/6b3pyfgQN6gx0EAiUMwNNzMMSCqHZf
X-Gm-Gg: AYBFou0k/ZfPyyi/y8mgaUqYYI870h8IeGMq1EirFh+o0ok2mdI7YSEiEEK0AQH1joj
	g/N87VmNc+9vG4/houXLbYFVcj3AzK1FiZHP88/6W9F6LR18z0L3fv65QRtw0xmthJB3tSDArDl
	HUIWjaFIJVihyxVlmzmAgJV1H9b6RdzYp8bLRYwNqP6bywkYKSWGQiKzGM8yBCJ3eM2aiLmP1k8
	h8cYIpcYBBSY23YwU/rj4o1IpPHVAAZh8LzZLYY9ak4NzxlDt/D+ZRr+FiW4J2LS7krYpFxDDhT
	OB1wLSYV+nTS9WKqyMcmW/B1efxW+YWHIuGVetfYE3BgV62hnwJLJ9z1jIWC3mkE8btV24NJChM
	10fxIdJ6o413WluyvkHUmLxV0koHTvb47lPje8XsQnjDTEEdXqSpw3KE0iwlfalMbs4RusyOASB
	JAoLQ5ufUXCG+mUulnPxpl1nVLTfMqONvM2llrlgcDEao14Mp3nleRPIbfG69k3CFsyoa9iAhu2
	Gp7beVhktaZ54OLY9iYdIoa3GlW3Bl7PwkKRefa/0WIhlw=
X-Received: by 2002:a17:907:dab:b0:c2d:fade:e089 with SMTP id a640c23a62f3a-c31a96de49dmr544110966b.0.1791648977074;
        Sat, 10 Oct 2026 09:16:17 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bd7sm261422066b.37.2026.10.10.09.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:16:16 -0700 (PDT)
From: illofspeed <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	dlemoal@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dm zoned: do not reclaim a random zone into another random zone
Date: Sat, 10 Oct 2026 18:16:12 +0200
Message-ID: <20261010161613.396-3-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010161613.396-1-illofspeed@gmail.com>
References: <20261010161613.396-1-illofspeed@gmail.com>
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

Only allow the random-zone fallback when the zone being reclaimed is a
cache zone: moving it to the zoned device still frees cache space.

Fixes: c5c788595292 ("dm zoned: start reclaim with sequential zones")
Assisted-by: LLM
Signed-off-by: illofspeed <illofspeed@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 315f0da99f3..2bcc163d209 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -288,7 +288,14 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 again:
 	szone = dmz_alloc_zone(zmd, zrc->dev_idx,
 			       alloc_flags | DMZ_ALLOC_RECLAIM);
-	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd)) {
+	/*
+	 * Without a free sequential zone, moving a cache zone into a random
+	 * zone of the zoned device still frees cache space. Moving a random
+	 * zone into another random zone gains nothing, and when the target
+	 * is idle it repeats forever. Only fall back for cache zones.
+	 */
+	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd) &&
+	    dmz_is_cache(dzone)) {
 		alloc_flags = DMZ_ALLOC_RND;
 		goto again;
 	}
-- 
2.43.0

