Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E181943DEBF
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791741298; cv=none; b=gDN5sU4XR8F+JgetFruJphS4//aMkDvubGAFRz42ezXkbtcRw5UeVAMRa6u0QS1v9/b51H+IMakIzB1aqphbmHgwH33hC0WOmKRYWcV5qNtTwlqCKUZPf8GgO8w/67F0L7yQ9hqUUIxhoc2WZuaa9IP23WRPMhu3kU2CINhmLSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791741298; c=relaxed/simple;
	bh=mh0naAZ5rGdtBm3SRObJJh3xiuOOeB+3Lk4WoYcj6y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARRXI6TSmSuEP/5LqDsfr9n4MDFetqx+wptJPGou+Dk4Gr0z4694qfAewjR76QV6qOQUSqD/AgJEKT3wjXrj21/XmYZW1PAK8HO8lhYuq8kqqkXmge5iOsTCa1XoQC90m/18B6Oq9OlK7U27ZuAo0YoX2sE6qWkpDDqkQOxz59E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCiEuMfV; arc=none smtp.client-ip=74.125.228.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCiEuMfV"
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c2e25574351so114206866b.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791741295; x=1792346095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXeUGkwkx/B0ZcB6bHet0Ei8c4WjWUt9Suh2yBdHG08=;
        b=DCiEuMfVlzTy2yShKI4QywKyp7JuXMHypFSYbZIWtPS0mGHVY50tSHJWDqP4mZ0dq2
         QsSy8rqWKQBOgOaOGReurnPo+uuDMOtwTa7Fj8KmqURi//nfua1y2Zxf0F9OaVhSweee
         GzNh4A09xy0yF1/dGIDwXMYkeOFMrb8Wt/zvgAhKdbUl1OgsiQ5KHUpusXm9sMX2qXjR
         y2rHHyK4r9F63LfmwTt+D+o4eu2ur838UUaLKKreEL8CcOKxT6M+hijjUi7ElaTVTlAU
         TNhgHG55bJQLM8SD1xB/IEbuz5wJV6dQ7rrklj+a5ltxEZBKm5AIkLoxR0Qi612iyGFD
         gqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791741295; x=1792346095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXeUGkwkx/B0ZcB6bHet0Ei8c4WjWUt9Suh2yBdHG08=;
        b=parRBrp8VIAONqUcsgQ2SgF8LvpGysOkfnm6xiRiA9ghEQB/IwO3KCtVC8fzNXrmwc
         wu6A5cB022MpelLeF+9l4BsfBiAn2v6Gm3lMXaN7Vsq1lcX9Y2rU9MCQ8CNgwfR5Z1/4
         yr2eRmM+930mTSmq2JOGaeuRpDyClYt6ze/NFcTS3buk7vRhmzQBHdaJB1tGyavpWQ63
         yVDceqCGKw/20SkXYIdCDHr8Gr9tJE4dgAv2RcYqafXHF2mxMUW/BfG7o9tM6ffTpd4u
         aadBUJReznG1lUEVQa1GyHv1M06E11y+ZEn9Dac0zAsXHSi7dWRcYzTR4vHBl1BnGM7D
         WO7g==
X-Forwarded-Encrypted: i=1; AKwUvBzmBl6o7CyRtN2/YBqXiMIzglMO75JWvJx+704OA6UOFKwAUMPriCqC/yvbulJlaBgPsjLmJLP5ECGmIVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJkZCoyBiYSZqo1IgmylGdzXO1klpd7m4sWSEmwYDvmUAWdCAV
	Tv6G2KAi0jTmECPQyFntOOQzh4/zH0E+3FZeigv430pyqZ03o1+y7obh
X-Gm-Gg: AYBFou3N7rZiaJm0TqEivTViom+YplndAqHEQ8dFh4BeBg9ch9dY33eIgYU0Ee6tMLV
	0Xc6lasjPMZNEkIbeX7JulCrQy3qdCLhNLUDQxqUHUgLpqN5c/wZDnCTDOCl1eTKrxgsn0kVEsZ
	I/dEs95N7NZG42OAI21mAcOlBBGmT0kYCnvk/g3jrF2jDBSgiX6hpqkNaKCMtRE/otMf0JTSONM
	dwjf8z/icHyzw9umblzR/FAM6xyWOoNnu+8nFf8ql939fXCfEBrsq6JfyRhEO1+7Yy9tWgLEtiO
	qliAWNZD5VsW550RKc7XQ//bW8gEPHN0V1r+6DUhUGChpx58nNT3vpA8DYd7lf0RYrc3Gy0nY9d
	XaAciV6/oErraqNjcsovJefka3Wl944M9vzeb184y/bko0jgVrBe+C/pMwxijm/nyPDuD2h/itP
	L24cerqqpvedEjl6GnzXPg7jVIKYYrcK8wxXcXvzEAQOTfTvhZXMC78VB935MUfRhcvbl0gsCTN
	1n1sIufoipR2s4fmsqaSidFn41ewJSiFZQcciHRKvWKcEA=
X-Received: by 2002:a17:906:7956:b0:c2b:898e:24fd with SMTP id a640c23a62f3a-c31aa0857f1mr838591166b.33.1791741294891;
        Sun, 11 Oct 2026 10:54:54 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm376806366b.48.2026.10.11.10.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 10:54:54 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	dlemoal@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] dm zoned: keep polling for idle reclaim after a reclaim pass
Date: Sun, 11 Oct 2026 19:54:50 +0200
Message-ID: <20261011175450.952-4-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011175450.952-1-illofspeed@gmail.com>
References: <20261011175450.952-1-illofspeed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dmz_reclaim_work() re-arms its DMZ_IDLE_PERIOD poll only when
dmz_should_reclaim() returns false at the start of a pass. After a pass
it calls dmz_schedule_reclaim(), which queues the work only if reclaim
is needed right now. When a pass ends while the target is still busy and
has enough free zones, nothing is queued at all. Once the target goes
idle, nothing re-evaluates dmz_should_reclaim() until new I/O arrives or
user space sends a "reclaim" message, so the random or cache zones that
filled up under load stay full.

Seen on md RAID5 members on 27 TB host-managed drives: after heavy
writes the random zones stayed full for hours on idle targets; the
workaround was a timer sending "dmsetup message <dev> 0 reclaim". With
this patch the emptied and filled zones were reclaimed within minutes of
the targets going idle, without the timer.

After a pass, requeue the work immediately if reclaim is still needed,
otherwise re-arm the idle poll.

Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Assisted-by: LLM
Signed-off-by: Kyrylo Biryuk <illofspeed@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 88d56d3c86d..5084e10ea7e 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -556,7 +556,16 @@ static void dmz_reclaim_work(struct work_struct *work)
 		}
 	}
 
-	dmz_schedule_reclaim(zrc);
+	/*
+	 * Keep the worker alive: when a pass ends while the target is busy
+	 * with enough free zones, dmz_schedule_reclaim() queues nothing and
+	 * the idle poll is never re-armed, so zones filled under load are not
+	 * reclaimed once the target goes idle.
+	 */
+	if (dmz_should_reclaim(zrc, dmz_reclaim_percentage(zrc)))
+		mod_delayed_work(zrc->wq, &zrc->work, 0);
+	else
+		mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
 }
 
 /*
-- 
2.43.0

