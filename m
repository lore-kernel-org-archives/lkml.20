Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482A34F68C9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895188; cv=none; b=D318+xavVX/TA2BIbncsTVByooGpcsCojoi8R65++tSteo+bA5sCIFYUks0Glilw19C2a4CE4ELxdKv5J9iPEa6CGFpwm50FpizEUHc909REFLHTJhhfymxOoj+xCwQP560eV9I5yvdZpssjB6QXoAfDWztXsWYxaBItvC9/k/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895188; c=relaxed/simple;
	bh=sA+c0WYN2bPE37DjivosiMzZqIXScnG8RZ8vm73mDVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbgSW1YHQ2y4eByj7uY0IM9ev49fHj19fGiJJ3BHtTRmmTzuFydboz/zTjsEmLf+btwa2HAhMpzOLn+000jot1pe/V+PlJP0D1K+L/W21kge//1En8qUMcPIu54QBRTG1/7o3l1TFXuntmvgE6gbwF1xg2X5xrOOwe7bFsxXlQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxmvhIrJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxmvhIrJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso3169700f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895185; x=1792499985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TF+nw/u3d0JmPL6ecEUe1KLmlN203omllzFb/e1Krk=;
        b=lxmvhIrJNoJFKIc7BjnrH1V68VSBcY8TNEafUctMZw3Kvx1P5K+DvrsZasHJ33rPEL
         /oE8EowRUMsU2bg/N9DwpPudTtzRfXj1QRsH72xx8lBS2W8gNLam4syg99q/NJ7F4vGq
         a/f00JgfVZJ9rCs9GsRpXzmyJ8zJBwsYUfkKKHGm8T9/eZFZ5NVLjwdaGphcqdK2E25t
         5rTUl8ssEv8IPK6KMCSwVwU260mFhnPTko8XyRbPmfn7Uau2Z0mllVEy8OqvlpXYa7bA
         /63l0w/yi6E2M+HqiLKnhF1XvaEEmn7Dqs1AHhpql4XIyS03Rssk+twq3B2HB+x1MWC8
         Dv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895185; x=1792499985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TF+nw/u3d0JmPL6ecEUe1KLmlN203omllzFb/e1Krk=;
        b=pgrlnv9yDhmLQ4rPTCpx0Qbwrwbc7/UVwJV6JnGzgp9BSL4eza6zWH/CnN4dAoxPfm
         L/aSsbulS7qo0ltezk+Vt863oljMrAlydiOSPtYB0c7S0YKKYjTKQzVKjmbKxkAd0riF
         8aZljEKuxsfzM/U8GZ6gIaXRfiLTkcJCVhYSiqko18mTZyjQGPNHCnR3cJfWr1XzIn2O
         J06cwFaN+d63YqSFeU4Hz8J1t8tgENikcJWNI4yLqu0j/LrcDXMzxt9iSP+pf08+/ycn
         msdgcVvR6T5RfeFKIlfKne6ADr4hpTZCxLYbHyWtkFgeXLU+PP6YFz8nwmmJ+bYKNIED
         VnYA==
X-Forwarded-Encrypted: i=1; AKwUvBzVgEqUIMW4cvMu0cyQzF6ecnBrs+i93LrvaFT49Ca1zINFtzZF6ajy+3bVPX8ajNvNkht4HGD3b+F8vl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3cmPd9rJW7p8/T4g1qIOj0asAo1uqQ+9/yoV305Kt1+J6NexW
	h24DniWe7MaF1xJnY8jzek5WGczaK7iCWNaS5PtBmyAMJ977/q276ysX
X-Gm-Gg: AYBFou1hYkgembQ4gPAvOXRY7hiKdQ2a/OBzck8qS73+kcxU1tEL0ZjTKMxDqrLHkM1
	iaXEkKw9UJ5h4bn0VIBPAKl6Zvyh1glrS3qivSgS/NiOv/7zXLh7Cs9ONz7YzIYAHz98ACcu/QE
	BCnSeiFCrinZg/RG3/hYyTKTqdZc/4lz5YnJ+8ZV7FPowF3/to4t2hkIBTj3Klp+j2BneMqKuh0
	rMlO5XVB+aEpQyMPlKsl1Sh47uUEhXWp5zvBGrGYLyqjBSl28qXOmyWQfU/8llUr9yvvI9IOaCf
	bgRviyCmoAEOicqkp9oc6hQofNrz613QF7oCUxazkQdwoV8w2N0ICE17d/XAPrahMPNhFE8pJqy
	2EJ/ZXAnu4hhO1rbHpvn8uo2kJXyNV0iH/g5OwkOmA9kD1V9Wu14Hp2kMfWZ48PvCxil88Q4hg1
	uV89vwSCrFnadNpXwJg9BFLbfYX3I12LqW/QSAFA19LPxLRIiUPQ220nUfRXv57K9dRboxvsBNp
	AMXGahy4YIeidVEwg6yGy9jbK8nwWNIZGElUqqFZjM0VZc=
X-Received: by 2002:a05:6000:188a:b0:48c:72fc:3644 with SMTP id ffacd0b85a97d-48dbacf555bmr28162303f8f.22.1791895185415;
        Tue, 13 Oct 2026 05:39:45 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc7299sm4179440f8f.53.2026.10.13.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:39:45 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: mpatocka@redhat.com,
	snitzer@kernel.org,
	agk@redhat.com,
	bmarzins@redhat.com,
	dlemoal@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dm zoned: back off when reclaim finds no destination zone
Date: Tue, 13 Oct 2026 14:39:38 +0200
Message-ID: <20261013123940.952-2-illofspeed@gmail.com>
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

When dmz_do_reclaim() fails with -ENOSPC because no free zone is
available to copy the data into, dmz_reclaim_work() still ends with
dmz_schedule_reclaim(). If the target is idle, dmz_should_reclaim()
keeps returning true, the work is queued again with no delay and the
worker spins on the same failing pass.

Re-arm the idle poll instead, so that reclaim is retried after
DMZ_IDLE_PERIOD. The next patch makes -ENOSPC the expected result when
an idle target has random zones but no free sequential zone.

Tested on 7.3-rc7 together with the next two patches, on emulated
host-managed drives (scsi_debug zbc=managed, and the tcmu-runner ZBC
handler under md RAID5). Earlier versions of the series ran on 7.2.6 on
three 27 TB host-managed drives used as md RAID5 members.

Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Assisted-by: LLM
Signed-off-by: Kyrylo Biryuk <illofspeed@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index c041413c729..315f0da99f3 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -540,6 +540,14 @@ static void dmz_reclaim_work(struct work_struct *work)
 	if (ret && ret != -EINTR) {
 		if (!dmz_check_dev(zmd))
 			return;
+		if (ret == -ENOSPC) {
+			/*
+			 * No zone to copy into: nothing can progress now.
+			 * Rescheduling immediately would spin; poll instead.
+			 */
+			mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
+			return;
+		}
 	}
 
 	dmz_schedule_reclaim(zrc);
-- 
2.43.0

