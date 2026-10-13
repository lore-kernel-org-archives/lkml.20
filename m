Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DD647A878
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903330; cv=none; b=rXsGA88ouvHPIsuEzRjFKIF7q+C8K3WoX4gJblKFMRgDpdBI71bf6POvhaKY+S7S5IyQpSNyj3lCjKozhVZPyABzpLXrmAEoLX1eiAfAIs1NjTrU9elh6v5TuQFzFe+F7bMPMn6b7CPth19/8sSl/i1jO1HGyUM9L18XRQgteDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903330; c=relaxed/simple;
	bh=o+oFNcLpuYqRZRBrDMdI0bemVABEvrdGdfb8nMKpYCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m29DPWC9S2ZOZcpy9YV31qMuZlZWbrrcPnMhwRAdjumpVJ+vIPXE0GXOGR8JN5HujMrA1SviM5Z65sF3q+Zg6WKwD/9MrBn+kOtaWha4oa8KrAUCZllFXmIr/YxKZpSaUJk28kGRMY+pbU18/sCOlHKspia+5gKA8VAHVl+uFI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBX0iTcE; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBX0iTcE"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso2914995a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903327; x=1792508127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAWkYGdqvifr12JtKIaB4bUGFJ5gXXZ5L73FeOEQvOQ=;
        b=QBX0iTcEDpOW7xzkX1ctaQfAM21OW6mzs+wy7rjAm+LXIWiDynJnPhdDCCzeQCbFN3
         iyF0Dlmu5yRZStwXt52nb6Z0tYMDj0qQrnvK+yaouuj5SD+/P21mAUoEuKW0aa/OaBuT
         yP1JUFbBx8KazPTCAb+atDQPmXQ8KNhimS+tuv0ybqlMwOceDEqI9zE+HVVy2hpUToQe
         q3Apo32CnHe5tUFByNtnQwXBhlnnnOeYErBlCQd9x8CQZnxWnTOk+MSLDAqdpWvNM9Zv
         gaLQX291edvE8IKs8h6L3gqVkb7jiycQo6y/Ry/I0uzW4Gbtn/L04ce3JUOG6z5aGgNG
         nDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903327; x=1792508127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAWkYGdqvifr12JtKIaB4bUGFJ5gXXZ5L73FeOEQvOQ=;
        b=rq9F+eK0y4bKM8JHByKJjSYkSGaNRW4YaegNz7HbBJ+pfkBZtwdtOjwqZhuJXphw79
         EcOX6JwIh1JG1Q48DhrhPXpVzRPFy1Gf05Syc9CT4jDalbgAln63y75y5IxuIwu7e/X2
         Sh4i5gJOHF5Ty8oa+JCjEbBAdLSeeU0I2/ja7CKGun1PPX0ecIfwk9dMZsvXpFiyLtfY
         SpPj6hIRTFpFeWnBv+9K8gW4emS8XomynWZC/A5gqz5kwKNPz6Epz8lwP9HEz8aYpNgJ
         zf0MshMfp7BInRKk48GXmWC/A5euFQSB9A/e1DYSy0QRnYIJPqcRb9rKN7EE2RAktQHx
         XUUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpSKHpaibhq9zNGa2UPeGUldhbTnRADT4hK3grffqFPb4fj12+culqjeNuJmYEMRhMsDXqxQZHlWwEdCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkuGs/PF8i2q8HO4MWNoPXNu9D2KCW6MDnD9RMUJmb2tlas2X6
	g8uSJpQ0vyO89z6JgELsnkUCYO7bfZtSphZ2XBJsDDuFpEku97T9I0nTQlDvpYNY
X-Gm-Gg: AYBFou3aOJEYcyDSwcpylnjEO6qYClTfV9g0QHSeV4oGywSiI4QAxYDjXAueQI03p3R
	gqjcdobt8Qop1eedDPwAM5KQRT3lrC+n0dCZjFmpTP3gkOWFF9N4pnTLhgbusNJWTSblgGPllEd
	d/4PgNp/2CvaNWBc3kLyQ+LjBdZovGSv2fDxamiUd0LshcFBsQ5jnsxb2HQaEVt0r55vuUIpi4l
	IH4mIL4SwGQpZoBAkPrhyTpApoDiyaSEoCkmcBjjXtveIsuwCp8IMTFl7kqwViCznZ2vjQuJuiJ
	9J63+i7sAuS22rQULp18thWk6q+pfetRLAjk0aZ5hM6jiXYvd4w1OqKa3f3Hbn/mi5HPKJV8nqe
	RENXWelJ1+fpbuqtliWo2JmJ1N0z32p+WDaQCQvH4f4RpOUJFb+uzCf0rDglGHH/sNT2TPa4reK
	ru8lhvhUzMtAYacdGz7WcUwUM1iLBL2qH3O0PJaapTbXef+i+Imx9NIiCBirYKUyDb9wLMrlfBW
	PkfE6PvbkIR6/uZkUVtLC1VCPDdkzbjZQTJBzAM8B0UBIuKZwqJvrpmgw==
X-Received: by 2002:a05:6402:2351:b0:6b1:b626:5bd8 with SMTP id 4fb4d7f45d1cf-6b1b6265e1cmr5604234a12.0.1791903326983;
        Tue, 13 Oct 2026 07:55:26 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e03428sm6169161a12.37.2026.10.13.07.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:55:26 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: mpatocka@redhat.com,
	snitzer@kernel.org,
	agk@redhat.com,
	bmarzins@redhat.com,
	dlemoal@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] dm zoned: do not reclaim a random zone into another random zone
Date: Tue, 13 Oct 2026 16:55:20 +0200
Message-ID: <20261013145522.17499-3-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013145522.17499-1-illofspeed@gmail.com>
References: <20261013145522.17499-1-illofspeed@gmail.com>
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

