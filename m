Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88964EFFAB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903331; cv=none; b=GxiePRdcJQL0AWwcsXVOHqXKCrMWsRK7YwUL0CVyXpcZOHlR8s9whnYiJE8jRe6RR812t1TDASiknKZZ4jkbUG5WQc/8SuSS3LWA/ddYvMtfKBqB/3qYUCYqemVFNG10UfC9vMPs6BYflEqLI5jC+kndx+wFFWQajT+ioPPzoL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903331; c=relaxed/simple;
	bh=7wzxSB2qhmpiXV/o6gYxzAhM8kMclX7fnVPUbCiiuKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACXQmsiam7l7P5r0R7jkF+98kliDeBBKyNBV5jg/k0/c8cjaedYxrD92oAYVgo7AEvbPA0alWS3FDXsYyH0lT07GBneR8pRe5RFVOXpk+ac84HjZrhrqemIYzDrCgAp6ufvin6MiGWAoAU6dsrXyBEp2c78unM2JMBG9c+IO8Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beNuu/aA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beNuu/aA"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so3482893a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903328; x=1792508128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRLm6A3T6Ct0MidSnOxtbUyQRmhGnsYliHxtNklqnL4=;
        b=beNuu/aArKc+EUOu1QiFV3e4XYt2pt7vKdNihhTwfTM85DZTC7XQEHw3xHIkJqslsH
         fq2is/WU6p7BJWW332h2XE/PrYUBjqGzq65YC/im8T9W0Vzx/n1SaHyKHvSv1WQ0s+Wa
         4tJlNz/CnKpwBx4k4CDaf0KG13W26t/E9VOYOtWWCvlODKy9f7kYF61YjPvej4b5AUey
         OyZutB56YKZpR44hxMizov3d6/TZguQJpYgv/rAtvH0slHaacU60UOIi7QJU/mVKHpe6
         ppgS55a29i+qqAiHS4Q9GG1zQBiF6ziwIEDNKk3GK4SE+beXEkYPzv2juUU80hcR2ST2
         Lf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903328; x=1792508128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MRLm6A3T6Ct0MidSnOxtbUyQRmhGnsYliHxtNklqnL4=;
        b=CCLG3qeEEMb2rQRT8AqEBLMFullnn1qDf7bcVxgK6SaeBZb50HRq1TGl3j5rVkBTDA
         aKWRJ171b4dcZryOXw2jTVbgP1YXvtnFjoAhD+ujjbDJilPE6AfK+/0xyGoY7nkbpXgB
         fUwNPcinmWq8Nyv2DyCc9PR42unSkOHpW1wLW0bwBcudgu1Kqv9xjEQOPUSFoRKLU63r
         jRhdgoJw7sbX457WJCeHNfeJSYicYvAWd6nydKfY++BcZHgoFD6s2nfkpC4nbiJ7oobr
         HK24Rxfm+ESJqonzQA0ajs4jxxXHjrmIuHw81I1OwMIIBwnFz7P7D6YsCHfOnwVj6guX
         lLVQ==
X-Forwarded-Encrypted: i=1; AKwUvBztv2sVetE5JDNXTJJafUzij5qXyXrOdHe/UPYQop6UeNzXgwFCgst08m8SZhKy3iC0NZDtn8t6IxMVV14=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCTdRuYjjCxE4JlBtrAbUW31XZHCkkjXFUJNPs+1Z39PcyrFyJ
	Hux6F7l7FzHNv3TtOn1JO6/61RO7dYHlLkyU0/23b8ZcJNgByo8rAncN
X-Gm-Gg: AYBFou2SHybF0R7DaEDPCHyZJx+yDis2MvHWIpNrDEOz+dVa+59QnfMb5oDNKJp68bY
	MNtqLs0VLgDCKgMahlTqIWoszC6QF43Jk8+l21RuRu1PO5BBsUpmQsrHT0f5wWy0uSvsZ2FA8Ml
	ZI7CQp/rdH9C2d1LOSaLtLXOGMnNDS5IEM4X6liQLemNaZHuV7Vib8YnvbGXEX8cWvjPYcSe7Tt
	fdiiY8BNL6ah81H87I9ak1cqF8wkEnRhKsytQvQiWlCKoxqppwSlQnZQwVFLt8y2q2ylUJCxabM
	lYbzRWIxwi350H2OKtm0ixQ3P003l8Pt6JApNbZr0xYGNvRK2LvCmxpW5wNWxgrKDTQa130RjaD
	xs9cqN2akvgqYFzNeZ2c2jZVcJe9edGtBEb075V7Bun+c7vmDSUAQaxvoclFmP/Or2AtW67om99
	6yTtKVa0AyuBTDfHfuz1yWL67PHQNVzn/Zb7upUz3h+Uc59Wq3Uz7FlKAD2ps9pG81CTDPWgEQv
	u1xErwFp0PXULd/MYEw1xu9S+snRjvisAG3zhF/3FphaqPB
X-Received: by 2002:a05:6402:3251:b0:6b1:cea1:a023 with SMTP id 4fb4d7f45d1cf-6b1cea1a354mr3819615a12.19.1791903327741;
        Tue, 13 Oct 2026 07:55:27 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e03428sm6169161a12.37.2026.10.13.07.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:55:27 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: mpatocka@redhat.com,
	snitzer@kernel.org,
	agk@redhat.com,
	bmarzins@redhat.com,
	dlemoal@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] dm zoned: keep polling for idle reclaim after a reclaim pass
Date: Tue, 13 Oct 2026 16:55:21 +0200
Message-ID: <20261013145522.17499-4-illofspeed@gmail.com>
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

dmz_reclaim_work() re-arms its DMZ_IDLE_PERIOD poll only when
dmz_should_reclaim() returns false at the start of a pass (and, with the
first patch of this series, when a pass fails with -ENOSPC). After a pass
it calls dmz_schedule_reclaim(), which queues the work only if reclaim
is needed right now. When a pass ends while the target is still busy and
has enough free zones, nothing is queued at all. Once the target goes
idle, nothing re-evaluates dmz_should_reclaim() until another zone
allocation, a "reclaim" message or a resume schedules the work, so the
random or cache zones that filled up under load stay full.

Seen on md RAID5 members on 27 TB host-managed drives: after heavy
writes the random zones stayed full for hours on idle targets; the
workaround was a timer sending "dmsetup message <dev> 0 reclaim". With
this patch the emptied and filled zones were reclaimed within minutes of
the targets going idle, without the timer.

When reclaim is not needed right now, make dmz_schedule_reclaim() queue
the idle poll, so the work stays queued after every pass. It uses
queue_delayed_work(), which leaves already pending work alone, so the
other callers (zone allocation and the "reclaim" message) neither
postpone a pending poll nor delay a pending immediate reclaim.

Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Assisted-by: LLM
Signed-off-by: Kyrylo Biryuk <illofspeed@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 88d56d3c86d..f1f9adf6039 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -641,7 +641,8 @@ void dmz_reclaim_bio_acc(struct dmz_reclaim *zrc)
 }
 
 /*
- * Start reclaim if necessary.
+ * Start reclaim if necessary. Otherwise make sure that an idle poll stays
+ * queued, without delaying work that is already pending.
  */
 void dmz_schedule_reclaim(struct dmz_reclaim *zrc)
 {
@@ -649,4 +650,6 @@ void dmz_schedule_reclaim(struct dmz_reclaim *zrc)
 
 	if (dmz_should_reclaim(zrc, p_unmap))
 		mod_delayed_work(zrc->wq, &zrc->work, 0);
+	else
+		queue_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
 }
-- 
2.43.0

