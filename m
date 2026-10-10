Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B2533F8C4
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648979; cv=none; b=uk8X9m2JnX3vMxB3dyIyA5+9zrF2LvS0BN430T2W6lRmfW+3YI1PjsDnuoldM7KD+2siTGvvRMYD042F6jVxEr5FzlDo/emPHMcNteUEWrJE+Uv0nrkBTaAFk4v5m9A7l9HYkKljbFyLl4xHMW7+MJHy+hZfKdk1C1J6oEuHXL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648979; c=relaxed/simple;
	bh=ufd8rhV80UCqkXKJ/U/urcXuErq0bBJ18B91X+bAywA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b64XuWXp8eFbTUeBrcn17e16asNbKl80AZcTOkA/A3CKUtm5HWZVNq4z3PuBSWfVT3ae7C6A/+3rh0J93fNAmsO0UN2oOAdg1ZU3if0Uk1XtgxIRT0sDTji0nEt//df6ESzPtFEfciS0cLpDzZoEeI3+UCGIwbFDCZtD+0tV3EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rvjEa8yf; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvjEa8yf"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2a4e013a44so103970866b.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791648976; x=1792253776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XWf/RWrFZXj82yePfTV0/gqexEn/Us7le/SNtuaxG0=;
        b=rvjEa8yfTqzQCH5uDJKXNr1T2dv35336lqEoxMFEazb0rIhybSoMwfJKgF98RpRXJM
         9J6WJ+TTGGkg9dVjNl4AUlaJWVptjRXlRv33bc31ksnPmlA3mIZe8orPOvkZpRpUH4nx
         j9/3xEpE7819d+lOO/BmTE5vN9jqBjXaATJPLzf7kGl7+Tz5NJxcSvagW1nUZYUBsXkB
         k78HJ9rH8xYegWTA0rqyb1lx6GhiSm1AO8JOkt0PezcLHi4dH37HXypZ69sDWBorqhF7
         jQrhhbscXrxMkU0YIvMh8jdlEBKdapsMxijDYekibPZMU0oZDQX9q4aWMIwqqbuVYxIq
         KWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648976; x=1792253776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XWf/RWrFZXj82yePfTV0/gqexEn/Us7le/SNtuaxG0=;
        b=qpGSW7mnq1RGg/fZWD2W033XVsdyiWS9tQm95AXCTYosbydXr0otLNu6UB7VnymUsO
         2rPxTerTYCgNiCtGYw71qdEZDqMysjz/ELc/46lt7rSmst2RRt1rf6Xy65fvMm7xtDpL
         3jtOgnucJd8nzlzx0sJLT77esUoqhO7XgRh3sCO/Tb+/BDtZ1Bl8Nr6nDGLEoXph+HAR
         A+dPNx9QDz052HadZMXVDFmET/GRh3OWlZ/dWNVvPDJmaqK+xn411DeRYbinfAgYtU8k
         zXyi4SdVxj3yejrGwJ8Sk6TlLbh8kH7Mri8vxeRbK3uPxeiJkTjnn2kf3VOs9OlcvSqH
         4gNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpjs/Ti6OPV73+ZLEI+Uxg/BBBgC+H7Jw7+597IACrUtxz9Uaytvr1AzPZTjRF76YxzVz1PUiInqdYOc4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIve5xzdT3MFyXzCmTWxk6L8j4kOhUkVv9nvXKjiLPcS936vwh+
	63qVYYVBzPPeKzIb+iKIg8H638i77QwHudVPwlpvzohkYZEDMbhtUD3jWMrW0Bv03lI=
X-Gm-Gg: AYBFou0eE+vmAJWvpwkxuWGkjicbrxG+nyzG2JTQoLXYzp3WzAUPoqLiqfiBvhvDpZQ
	L/tU6CRhcePa/GrXLM+m5INrt9Q9KPXfjIZpT+BVr+cofNBnBer/mXGrd7TFc0rR+7zO4gMIRm8
	W+rwYmlWkxsHX1Ugq2xj04fOIbbfXax4YU/oFjJITuNSEsJGEB898jsZI1leKs5C8baDfmQE2D7
	Koi4x4gUZzdejeQ21L6kRwStNdY3Ke1eWb/Rre78etba+xiyj6udUkEG/5f5eeoqk1bZU/0pt9k
	wjdPjsHTlDrP5Lm1ucFfLw7qF5X9h12zR0/y4YYlugChjiGcNqFdxhllHDv7aiompYzL8gKRfP3
	GvbVcNUyPyCYGH1h5YaOlxEWxlhUCUmJLFCv+FJFpNFWTDRleQQmHvOzEEmoO2d8r3RwpQXEtbO
	hdU/jHi3TdPXDRQ/kliLfZYX6LcqbrG7itddUG1rjggI3eKTeLAlxmwJzF+ccfGvcdiGo/uqIB7
	YSjFRd/5qaQQYRYbmVqm241FV/YCzusJyc7HOI+99LxNe3A
X-Received: by 2002:a17:907:8d8d:b0:c26:306f:289b with SMTP id a640c23a62f3a-c31a9b0b097mr464030466b.13.1791648976036;
        Sat, 10 Oct 2026 09:16:16 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bd7sm261422066b.37.2026.10.10.09.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:16:15 -0700 (PDT)
From: illofspeed <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	dlemoal@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dm zoned: back off when reclaim finds no destination zone
Date: Sat, 10 Oct 2026 18:16:11 +0200
Message-ID: <20261010161613.396-2-illofspeed@gmail.com>
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

When dmz_do_reclaim() fails with -ENOSPC because no free zone is
available to copy the data into, dmz_reclaim_work() still ends with
dmz_schedule_reclaim(). If the target is idle, dmz_should_reclaim()
keeps returning true, the work is queued again with no delay and the
worker spins on the same failing pass.

Re-arm the idle poll instead, so that reclaim is retried after
DMZ_IDLE_PERIOD. The next patch makes -ENOSPC the expected result when
an idle target has random zones but no free sequential zone.

Tested on a 7.2.6 kernel as an out-of-tree dm-zoned module, together
with the next two patches, on emulated host-managed drives (tcmu-runner
ZBC handler) and on three 27 TB host-managed drives used as md RAID5
members.

Assisted-by: LLM
Signed-off-by: illofspeed <illofspeed@gmail.com>
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

