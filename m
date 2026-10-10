Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E282E364E98
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648981; cv=none; b=I6o3p4DecVxCFVKBkfHusnJ0GoRwpdmwoTj39jUp1cJm8EUKKYnknlfyvBr2S64VHaPA0Hj5M8tOhQInm1G5Toa5RHVVUG473+fQIu+R/Cmtg81EGpL4CPoj8wnqCcYbyco/OTKxj02a1TtvJUrvX6KX6LzjMABjUT9dTMvnmiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648981; c=relaxed/simple;
	bh=KutDEGCPlONJfWW9uuDS3X3faNGEyX+psz2/OPeNoAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/w0S9hlJeRTTInmd6vRAwzCby8FbnXznyV8nKNZtVm+vYpkpMGaAVOCif+FSmpCvEL+y6Tr8EB8pxMu9zHsovpwXZ7UH27nq3jimi4Dp/6Qa/nFTmk+LCyLC4nhDFJBk0YnsKCnOZkUnsqP/GFXSspGOxf/IS6nIT6XXlsS6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvFAodRG; arc=none smtp.client-ip=74.125.228.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvFAodRG"
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c3305a41e91so27246766b.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791648978; x=1792253778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjHNOUUglm75EsN4v1/xErxWOdU79LqCoAd2dMeTVTk=;
        b=BvFAodRGZRtylMwH6gFKaYnZx4bg1y7lJmJCvBr+mSc/dNzxfOL7ffTEwNjJMKeAX2
         5902A+gu0AYwFUR+a0IIlVyNDnGcEnXlNZ944KPloQKV4SBr+ZQSunaPj0lvWqa1BHGL
         yWxwz6OeK++v0iCOHq7NLsqAnNmem4H53blKkkxUBe/ybiBxhntDc90vCydjSmuA+q0u
         Rwft1J37R4/wS/yMK9SBCSLG+ggvzLsZNAZhAa5hC2SxudL0Nm9lgErV2FzDFwSjXle6
         l+ZamQ5L5Hya8V1Z6v1Ltz1Zg8g9vwvGLZRHZvZOLa6eBi0QOkfL8NYOS7O4rWJ7jGvL
         truA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648978; x=1792253778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjHNOUUglm75EsN4v1/xErxWOdU79LqCoAd2dMeTVTk=;
        b=tStSvKXMvdzLMpSM/gKfZV5swjxd38PlLIeMI+mr6RNuqtnuUfWibptbRKO+Lb4590
         DfvuARQ6GZPwuMMib3cEvIO09E9+oQRL5VOxMpxQRbLXTJ5tXvCDCba9UMAFhG9uVzho
         v4GFMm2iilpGPLsbiDG3vvElH45JQpSRkXQbZHvH14eEYJe2jhD1J3GY8lr4DS/vShle
         7/FYmNKOC37pCfkBLLm5ieJGmyxtvGAriiB0kxQynXViJwEZ5DpXDUAjCTFqNczesX+/
         2Q3Pby+iJxhiQ2sX+0C0PPqvviIfQp5zUMLfRnFrTzQWc5O3m/ozI6ECs5oyvxwNlJfZ
         qYCg==
X-Forwarded-Encrypted: i=1; AKwUvBzWbfj4DhmRjR4L1AgkriYNJZZ//BKfAwyXGvl7+1sQfu7CEb/DZvJXFuvCUOUuoMgdVx4o9UBfEWZjdW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcYLD+UITUlTr0HchaVGvApWrEgpyaToOZkaBNvoRqZPKocrCV
	TH/wQvbjqdTHIrJ5KQAdh4OmVpiGa3HgsSf+uVmRnY5CFmP6BEZGxmHV
X-Gm-Gg: AYBFou1xiujrR7DrGdcefu2D4eS0j08DtvNsG4lmsxCYwZUz3UfveiyS4ciNHQHgCUQ
	Cikoia6ybhY4nvOKZTzC5/wqgN0MsjOdiprziGb/mDWgTeMIcs+JvcyTbFpGyM0P7IokZS31t7S
	JkYtPFt9SbtYrQxs+i4iQSebIHhVx+oWa+67+2zFTt8/mSZerS1YSw3XVNh/32NjEwnCaiVlUan
	HRWYJH7+wRulSn0D0UQM7elU3rj1rQEedLUsSgjqcrmObcizCljAjcSMsLHoFfkhcmtzYjH8eUG
	HpXnvys36Z5tvG5720gi9G7ONZalON7QFchuySD8XztsDCzTxulW09Mkt4KTg9mfITaK7uOT8Da
	j5XzWYJtXFHOGBO6xhEykEFXl8CW7aQIJYEhKCTZOLZzlwkI0QIe5tb74B7wAvPOYBFLKeG+FmQ
	Q38Z0oKl9r6afGS6WFrfw7HmaBNxm4PZuFtl8ntp34n8Bx4JOQWcrcyMajO774jaovCf+aWalgn
	cl4BC6poL7lyHL+GZpuQkL5I0EsVgvyaBeSfRX0wKmU3EV/Z9xF0GY5HQ==
X-Received: by 2002:a17:907:1c89:b0:c2e:2d8c:4585 with SMTP id a640c23a62f3a-c31a9fdb266mr555312866b.36.1791648978017;
        Sat, 10 Oct 2026 09:16:18 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bd7sm261422066b.37.2026.10.10.09.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:16:17 -0700 (PDT)
From: illofspeed <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	dlemoal@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dm zoned: keep polling for idle reclaim after a reclaim pass
Date: Sat, 10 Oct 2026 18:16:13 +0200
Message-ID: <20261010161613.396-4-illofspeed@gmail.com>
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
Signed-off-by: illofspeed <illofspeed@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 2bcc163d209..7feb2628bd0 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -557,7 +557,16 @@ static void dmz_reclaim_work(struct work_struct *work)
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

