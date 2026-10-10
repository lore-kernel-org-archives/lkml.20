Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBA440D590
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629497; cv=none; b=B0E+iKhC5Mso04gMWfbrFLrN/RoqUQ6NrDGDXheow190bIX4oFpjv3LzIYqYKWepAJQ79+DeY/VudcC4kBp+6tkXRomAmuQ5/k0X0XMIoOC1RM/xn1WXz18Gt8ZC63psmpgojczHxcMMLlP9ZUAJKS5DPV8W2X9iuCzdyC01gWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629497; c=relaxed/simple;
	bh=Gz4FI65CD3FE4kIFuCVPHP9zbFGBTeTZJWQ3zjzPm/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3Vc3iT8TZTmE4VKgHBrI3KMco7cnJfL95bBgmozWzK6F+DqoLqOBaaHNQnL+w8NFPfPgid6ZY9OfrMXmO4LL13lC7RsbyRsAbHNO0a6zwuSrKlpAFaqLzSnGXJPBDsXlj7INzFvf/2hpWD5asZ1nsu0GO/iyimHk0UI9d7Uuzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkPpLnu5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkPpLnu5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2acc1e170cso95985066b.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791629488; x=1792234288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LHNp9A6zwMofA5wnyNlSQnfkRqOMomjAFoxyV+7B4A=;
        b=XkPpLnu5/lLg5iUxVuXyeUsaKN7EmRZVLpPAl3etWzD8jJsZHajbeHxbiYMpEd5lv3
         PK5qwfnR7bHiR4nVdgvB714Q6bpjjTROV9yapjzdVXAXXfJj8JfcIkZjmtcR31mAPNll
         H7vf+FLUJ39WekBGZ+yrWcXsnwnKH+GOHGL5Kf8HAyK1qoLViT/nDDvLZZ1aQSB5MnRP
         emnisGCgvjrq8fJ4nJrQ3ieHer+zGDzsolbL5HuTEUjczHvFTe7Yo0qHEWbdl7KJUWJH
         V0n3DEqiVRiQlNz9WIpoEE1K4C/KyqCvscoOVexZ26J/44S2QeJUUesL8EUQ7Q+bWgJJ
         3fZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629488; x=1792234288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/LHNp9A6zwMofA5wnyNlSQnfkRqOMomjAFoxyV+7B4A=;
        b=jDZ6mfmeMcQ8TvnhxTnFDxF6QnDWM52H9xa+3mrcaDQpwu5FFxOkdFmdnbeXUOrlI3
         nX135PzLfp+ojuq4xrG7ZJz2K50TqW8677irqfKQ+0S/sTNugRBhYnWaWbC7WbmfKxzM
         z3mVs9wejBqyLMTS2HyAS1GwkS+8XxsIxvQpvdwnGPHnMuszaWosU0EklCoeiPyLkRp2
         dHQskiMFU2rr8NjNmmR9EVQy47TejX2bwyarBXgQp7F2v6cKhvIcZhGzk3GzlZnAYoZy
         ryfIFoD4Qwo2vzq7IBbMeplpigQ/sedo5GlFrXki+glxWN4dhHTGmIF2fBb+4kBac7nf
         f5Gw==
X-Forwarded-Encrypted: i=1; AKwUvBy8wzbdTr/EMD1xvJqystgk5aqqOV2HHHdwSj7IU8v5TD1tXMmkfH48bcyOoPJ3yB2F/7tyklW4JNUgnYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlxvfVe8ZI5Fpi3ZfnDRcNpFgoaHYhAkcgA8zq75/mVkPI1HN6
	vj5EJWo+nYW5qK/QbATkpBU8IT5yraqwqcZuJ7P9giOCa3QZLAnOk+qA
X-Gm-Gg: AYBFou2FAb5vhF0++aHCePMcnif16v3gEe1n3f2Pzzw6sjbkLGvUQ4Ied15ZHZFXDUX
	jcYVtChPWgU4eEOzdIZOue7unMwKrKM5nmye5WpXkDu0QH9+JtdpH/NQ9H1bfido39RivoLHYac
	hTDRixoeLO24FolKQwdqCtiSSHM7uZhB5c7rrHls5MCAW3YNbx0nJ3+bBjBW7DjL6Ww4WaFMPNq
	2HuS/g7MS7hww4D1kwmYVhhk1RZuV3qeKBwuoRyTyTioxApruKZmc4bw8xyoMpQhDfnHaPjSWAs
	BAqS2XqHg/wWzN6gztwxBVaqUFN5JFr1XySM3G2Y2lqlHl6+qS8Au+DTGEiIw1mwbJsMnq2tEvb
	9uXm/pFrrqisJUVRPV6ZJkVL0DsJ3m6Al2VsBe6ifDUAiGPv6fwD9t5HG4CZ+GcUmqcWtNg9k4o
	34K04IJp++0fYUm8y3oKbkfa288TE6T1mHe1V8zuV7xoVWi4zyHUDh6NINJVboSTJ0SMJnLi4Zf
	lBBQ+xLO5nXH3gbbjwJFilnow/73gugDSkbMcUAHKnIs0EERIUK62faU2YxFhYOmw7fKV7tTpBw
	uX0=
X-Received: by 2002:a17:907:9707:b0:c2b:7672:8e29 with SMTP id a640c23a62f3a-c31a9fcf4aemr440278766b.16.1791629488280;
        Sat, 10 Oct 2026 03:51:28 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766743sm229984566b.4.2026.10.10.03.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:51:27 -0700 (PDT)
From: illofspeed <volvo.mail@gmail.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	dlemoal@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dm zoned: keep polling for idle reclaim after a reclaim pass
Date: Sat, 10 Oct 2026 12:51:22 +0200
Message-ID: <20261010105122.398-4-volvo.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010105122.398-1-volvo.mail@gmail.com>
References: <20261010105122.398-1-volvo.mail@gmail.com>
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
Signed-off-by: illofspeed <volvo.mail@gmail.com>
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

