Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BF94F30D5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903331; cv=none; b=D76369+Ho1XJdDqrhvMjhL8/oiXzb1999xFgE5P5wijOXNxiLB4C6MBwmaGrArtWE3W268etNPwNEFqvFxl6ALW3dTOyBehI1MKwgOtiHbvZYfJ3la3pXnlJcLvGD8nmeiYLCaDMd2TrVI5kKnb1yn/GZbu0KTRh4zmdOMhV0ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903331; c=relaxed/simple;
	bh=iUcWbF6VqinwqarzVq3Arlchef8+Y24uEq8bk16kOrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLQyVs8X0IL1W7Xcw5YjhaRNPXy4ToyXEUvQSXJgbxS9U9e6CeyDdNIMn13ZGCAbk+VeK4oHYtgSXjYJk9ojRgjkJ73QNKcdAordMKK3Mr5C8+v2XnjB+P8JacpF+qP/BnAdHCrhDgzxEgkAkDj1TuA+J/KIO6Fui+BD9lRTF0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHJP9Wbp; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHJP9Wbp"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3679734a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903329; x=1792508129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5kbj9NCQZ2sDr390DiL8elbJ9zikv1LhsX0xMjIXaM=;
        b=MHJP9Wbp+hPIzM6zJrmtEFXWV0COA49P4nKiGwJlRcLfdAaMNX0f0CwpfmXgqQv7Ef
         U3vGFHQpNSwWCCz8MbORM/uhzU/bCqT3jFJ9p0/3uWQvg3ZS+/F14R5+cVeEY2fHX43K
         gUTnnTBvpDL1CjGzOWGlypSYCQpGgWnseksIU3vQwvW0dhtvQIAgpjbnAL8N8kQemINU
         pIQNGz7KsLKeb+meqqrBYhsIZ0nynRTsaBIEFi47ELXYOfLEjXBcywMoVNj5FRYC0lpx
         Bei/hG6C8WYETEW2shQ8hfbK9M4ONMJaXZ4VxZYItkWY2RCHNxlJGRxwGVOUNYf574O6
         7Tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903329; x=1792508129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n5kbj9NCQZ2sDr390DiL8elbJ9zikv1LhsX0xMjIXaM=;
        b=cIgC3R/kBoElNFfWXtH2fbbqFFC00bX9RdxUnWU0yAG/gU5RyPhGSEZJQoY94GKsDs
         GDLH+1D3J/UnKRY3NldVj25wWdZu6L5abw9+SwBd9Lstg8H9fEJZN8OO+wN9hYq8E8Bg
         jNObEWB94j7AIBSsTFeaNUbYaOO64ehDPG23PQpats99RCYCM95x2x8qoURnlKe2uGNj
         7lHI4rgmOxJV7dx1PJ5Lj08qKnWNL0bCLwjIjeBsaEiZYAZi1zn7y9/J6bEPWjeLdVnf
         BNH6C92zSZ5N5MPRtYfQ1QW9AOcb7l1ubNd5M9Pqd0JVJE0WZc3gVAzMBNaOi3bsPI6r
         xIyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAXcg4M52QT3Rgar0aD0QLsNs2OSQLhKtcD6QpV+Djw3OmUoZxDs/6YOA+/joTz0OaRVAGjM5XVJ6SYY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXw7GbKbDnEylZyXoezY6bW4frpRIIiYlM2w2Fzr7XAAqv+0Gz
	c2bS4InpiH/ZptCgf0kg4HkqkTBwOFDKljTNFDDicWIpCkJrk4PV1VX/nI0oQDiq
X-Gm-Gg: AYBFou3yp44drkNK/CN5Wnlxxw6NKoPleXQjKkyExrA+qNK7RDtTtJ8qoC+uTQwh0P2
	Ef3O/TIydGG8EXLt0Fe1Vikt0CCZLdN0RNLiXbCjGOOpWOxwn+5Sd0/5p50Z9JvEC8EUKDd8qJS
	X6S8vzL4/Lhym+JQjahRm9wx/iO6wWOaOrrLr/d4HJKY8Uh6g287W3Jd9VLzCVWosH93wY9jMLz
	V42tZSpeR0ijC5qjjMOtQTtN/+N36BEfwUZDKUEIbuXrYjNAWGMy0I1QiypgKztOhsSWxOEYjVr
	PHvy3i9JHJGU/5dV1WNAerVer8Yx3fek/WgpjVwxI89o/mclSmUbh4Epdy7pfk9AFW1laX7zued
	36N2wtrDNcavjpYillplxT7RBSpegVm0fOi/OE2ZiJvDHU6iFp9YqaP8MetYv57tnV/T5+WlHd1
	rQYl9Fdl94o0RUsrPSzx68aVS+5PqirQNCSqui+xu3lsRclN7tbfeaLcLsGFXDaWnG/Ek+cCfu8
	2stJD3IZjeWQSRVzJy75c73/qy/iWb45kixsDNbDw+VdfE=
X-Received: by 2002:a05:6402:3553:b0:6b1:cea1:a011 with SMTP id 4fb4d7f45d1cf-6b1cea1a32amr3900125a12.0.1791903328563;
        Tue, 13 Oct 2026 07:55:28 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e03428sm6169161a12.37.2026.10.13.07.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:55:28 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: mpatocka@redhat.com,
	snitzer@kernel.org,
	agk@redhat.com,
	bmarzins@redhat.com,
	dlemoal@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] dm zoned: do not busy-loop idle reclaim when no zone needs reclaim
Date: Tue, 13 Oct 2026 16:55:22 +0200
Message-ID: <20261013145522.17499-5-illofspeed@gmail.com>
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

An idle target whose random (and cache) zones are all unmapped keeps its
reclaim work running without pause:

  - since commit 90a9b8693f1b ("dm zoned: reclaim random zones when
    idle"), dmz_should_reclaim() returns true when the target is idle and
    the total number of random (and cache) zones is non-zero, whether or
    not any of them holds data;
  - dmz_do_reclaim() then finds no candidate and returns -EBUSY;
  - dmz_reclaim_work() runs dmz_check_dev(), which checks every device
    for media events (a TEST UNIT READY on SCSI disks), and
    dmz_schedule_reclaim() requeues the work with no delay because
    dmz_should_reclaim() is still true.

Without the previous patch, a pass ending while the target is busy and
has enough free zones can leave reclaim unqueued, which ends the loop;
keeping the idle poll armed makes it recur whenever the target becomes
idle. On three 27 TB host-managed drives used
without cache devices (all random zones free) it kept about three CPUs
busy and sent about 155,000 TEST UNIT READY commands per second to each
drive while the target was idle.

Only reclaim on idle when a random or cache zone actually holds data (the
intent of the "p_unmap < 100" test that commit replaced), and
handle -EBUSY like -ENOSPC: nothing can progress and no I/O failed, so
poll again after the idle period instead of rescheduling at once, and
skip the device check. Use queue_delayed_work() for that poll so work an
allocation has already queued is not postponed.

Fixes: 90a9b8693f1b ("dm zoned: reclaim random zones when idle")
Assisted-by: LLM
Signed-off-by: Kyrylo Biryuk <illofspeed@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index f1f9adf6039..0d62ade1466 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -470,9 +470,10 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
  */
 static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
 {
-	unsigned int nr_reclaim;
+	unsigned int nr_reclaim, nr_unmap;
 
 	nr_reclaim = dmz_nr_rnd_zones(zrc->metadata, zrc->dev_idx);
+	nr_unmap = dmz_nr_unmap_rnd_zones(zrc->metadata, zrc->dev_idx);
 
 	if (dmz_nr_cache_zones(zrc->metadata)) {
 		/*
@@ -483,10 +484,11 @@ static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
 		if (zrc->dev_idx == 0)
 			return false;
 		nr_reclaim += dmz_nr_cache_zones(zrc->metadata);
+		nr_unmap += dmz_nr_unmap_cache_zones(zrc->metadata);
 	}
 
-	/* Reclaim when idle */
-	if (dmz_target_idle(zrc) && nr_reclaim)
+	/* Reclaim when idle, but only if a random or cache zone holds data */
+	if (dmz_target_idle(zrc) && nr_reclaim > nr_unmap)
 		return true;
 
 	/* If there are still plenty of cache zones, do not reclaim */
@@ -543,17 +545,19 @@ static void dmz_reclaim_work(struct work_struct *work)
 		dmz_nr_rnd_zones(zmd, zrc->dev_idx));
 
 	ret = dmz_do_reclaim(zrc);
+	if (ret == -ENOSPC || ret == -EBUSY) {
+		/*
+		 * No zone to copy into (-ENOSPC) or no zone to reclaim
+		 * (-EBUSY): nothing can progress now and no I/O failed.
+		 * Rescheduling immediately would spin; poll instead, without
+		 * postponing work that an allocation has already queued.
+		 */
+		queue_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
+		return;
+	}
 	if (ret && ret != -EINTR) {
 		if (!dmz_check_dev(zmd))
 			return;
-		if (ret == -ENOSPC) {
-			/*
-			 * No zone to copy into: nothing can progress now.
-			 * Rescheduling immediately would spin; poll instead.
-			 */
-			mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
-			return;
-		}
 	}
 
 	dmz_schedule_reclaim(zrc);
-- 
2.43.0

