Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621A94F7CC9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895191; cv=none; b=qOQ6w6Wt09w2PYtIhlLqFw4n76EdpK1AItJ9MtjMYQ1k8FQHCbKuXbgrVWDYHOaONqEqX1zGZ5RaTaSq3mePkxRhFnbBfPDNdRzlbuaTY53kbNCb6ZccwVwykBFlttlqkB4atwEdspN3inlkvaDXDq8rkwQBaSie8a0FNdg6CFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895191; c=relaxed/simple;
	bh=q7IP0n0tFVgXui57e7ZoWvGl6mJaR5f8ZscXMkb5tZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEeQnQQTy4l6AIk/RdAod3zwK9kpVWDjxO0AM58K7leQ00VDu8uw0OcX3VHBujQUuownU6/I39R6zAvXRNTS1RW3C/pgHdJp1fsPLmsd/FbB5jMozhrq/d181niSbc8v8FNrdDLaUC0A2BTKe2C67U/115snVHV2f07wOnIRDsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONV2LTXd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONV2LTXd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so29387495e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895188; x=1792499988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ngQKRroXU/Uz8Mh7Lut0ld0a0rsmTuRWomcPoA8M0I=;
        b=ONV2LTXdrdsgtJb3ZcPs9Nu/d8IhlpIMwRn1hTsgXWhThM41PVVV+t+ALS0eCY7Db2
         gLaNwXcKJ8NXLX6Qir1uvZcdNMVzGNEHBklh8u0qML9DjQqpRf3qMArnLH71u/dMOYFR
         kb8rFtFkIH7taAWxjlXnvni+FGHRYZkn4jdBP9NVty/bjjkfAIIhj63bu+quS7Xl0DmB
         SHk1Xf1O6kgDtKkBKXfDxkySNvRE3/X5RBBex0BNhk/LZCo9esOn9+cKEo707V954YLl
         dZKhBnZgYl/HVCB9maWwEWXlPxnuXxNzRzdstwRo5CmC5LUrTXmj2sNvs8HaJAdU8RHm
         Lxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895188; x=1792499988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ngQKRroXU/Uz8Mh7Lut0ld0a0rsmTuRWomcPoA8M0I=;
        b=Ovx6Tr3bgimpmJzLyrtkbt6WgxKjvwvpXQeoYIViJoK8V47zH8pcDMq8OOmNcxIMXm
         IfXTpc70vQXAlkXtl5Tcz3/TSRkjYhL7BR8oEJY9Ui3OoJst9ELbPVBlUo8f5tEzhfGQ
         ZhqlIGJlg/8fTLrRk3eCB5uJ+FfRPHtnG9/5cECtnWkfct94Qqcs3T+8XCe+hKZs0iXx
         6AIENqto8u3V8ZdLCB0M6UOV5GcrhnZz7jgHW2g/vpLtonlmUS4/yXOYNZOldQhw/LC0
         EtwzpbkEfH1Ul1Qqd2RcFKjx1hWlS4zOZhoFyDg8asEvSxwdlv9q19O/jydp9Wq/OfMT
         9iYg==
X-Forwarded-Encrypted: i=1; AKwUvBxJAFg7Pfich3uc/bUIccivkOvysEajtT2rvwdcIZG2OqPc3EQ1sbDEJATM7BNWCdAEzBPwTpa6Oh19wSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoiIftoVd/5LQobS3tiauslx2tp3HDTYa16eDOqthdRK6g2kBg
	SIlEijPJODA+osTkiNrHHb9WARj4YH3D8kFX+LBh3d8cf89A1HWU8cFd
X-Gm-Gg: AYBFou2jFlTd1JVwmklSdp+tB/phoOhUjbUd89y8o9k4wO65KtaNwqiVXjYjwGEva8y
	7KXZ0/sPPjwSwvE21qncO2Pt5MaXF0MNzrYEArxOzyArDHbmsM/lrM9L+aIyT+1cG7z8ZeqmLov
	FRk/xWNwCEjFp/jcn1FtC2iwKpKHlMN+JUdgQfnH0FX0EUeqz6+i5nGK1IqPcxb7MTXn/MbFGMH
	Kb6MR+NXaQgJNMbnA6s5mryO+fIBCzzg6WoVoZPfLLZ+NLc4wzrsOtBHjVkfeop3wahOuFjRExd
	06KRBoV/z1pFGsNtfbh3Mlakx7lpp1SSFS30v+AlVJzfygIAl74rCf4LnVjsgxOEhDz1nKUjnq2
	DPMOCyATMV7aLInxu9TnX/xq1l9b8hsagmnS8UaeU0KM6N9nLATBODVylyoeUOoksaQT1X1lEIz
	eoY5OJ+90foFxm3QEn3K2pEUSRi2CpCvP3Xk5b+GQABvdQhOuCBZbco0h3dmoS6tEHRKZ/3PmK1
	S1Il6KbsAy3rK4YpMAe/MZQIkrTBiyKHOtCp/oV3iyWlA8=
X-Received: by 2002:a05:600c:3e87:b0:4a0:a34:6e7d with SMTP id 5b1f17b1804b1-4a18e4bacbfmr224923095e9.18.1791895187530;
        Tue, 13 Oct 2026 05:39:47 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc7299sm4179440f8f.53.2026.10.13.05.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:39:47 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: mpatocka@redhat.com,
	snitzer@kernel.org,
	agk@redhat.com,
	bmarzins@redhat.com,
	dlemoal@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] dm zoned: keep polling for idle reclaim after a reclaim pass
Date: Tue, 13 Oct 2026 14:39:40 +0200
Message-ID: <20261013123940.952-4-illofspeed@gmail.com>
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

