Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551201;
	b=qzBLhuajuKLnNsvKk8kHL6T/VKKSzSfmdxwZYtbdv1KINM0wmDD6d3/dITM8sYrS3S9/
	 sBn5KgNiCInjF5KjlL/Bd4uRD1BMogOTMN3XrY9f4mDJF5Osbpt+glVfPAMcaC2jE9TUU
	 lJ5xHJEvRi587I/m4GFG8cz9Q6DYUDuzIWUfqNFE4V8Z6JJWoAkZ0c+g+vxYAFjtjnK+E
	 YjesE4t4QNIBsL50+z72Xa3SUZeFfsFu68e+Pd7b1keXU+jP20/Yr6nlKWPcsUXckR1M5
	 IxjgCXEoXTnX4ur23Xgp1l9c4aeHukkFQ4vaxtDOfMEnxcmahKTnxjo8HLRYML2e9Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F+i9PR+PBpSj4Tps17fWo1rOr4JAq4SBNabInQeoHBU=;
	b=16HEOlxzbHNhKPg+AbIv/uaJ6/gQnxlQne3+SX9EDK1M+WFukSL8shy/Nzv43HfVnjb/
	 62vycZljBeNb/GWBWauuwvA6MwLxEVD9uicwlkDucnUWO0lWqvfYONYX6PwVNwTt9uOpD
	 tg2zxdQ63sZgUuyQQO/9RI0WSIXaiSn/toHW0/bW59ACNje+oh7L6wphGzyyztLKkgtAM
	 247IRY1fO0BkYt4+lrJWPKKCUvw41ge3M7/Fdd8m3yt+my8osK+ScvSsgCLlftwDxJcEO
	 6JUE8pJ6E/WJb9wf4dQyyZrxvae0zcsPcvWioFvarUIVRyRjJDDTiNAiA3ycyVCOLZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVYTzpSR;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118C8606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 118C8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVYTzpSR
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a210470b49so17604435e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793551199; x=1794155999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+i9PR+PBpSj4Tps17fWo1rOr4JAq4SBNabInQeoHBU=;
        b=iVYTzpSRRjcJVWroB+3J3QWauF821nPsqHtRRVEzJ17fc2EhPiPRnvhG+8Wyn4mIIG
         OqgZ5BA9uAUtfqoI+4+05beWLyW0/u2I5BTU066ncmvNE9V/VrW/nqANs1DM2Z8zHsLB
         EZuDSE8DUOWeu1KUYIyZuqFCR2ro0sRcPu3fSsuTk3x2MjX99SaJfLWpWLb91hzo3VwL
         lIolwNOLuHNMpnE2NO94E2hcUEzpLvkk2znTN6RiXh0U8tUssg6BBdtLlfBrf7rPuptR
         vA+UTIvDaFtH/8YMPDWgVqOVX6FNRLOl2aralPJ3sxTimL6oIfjpaS5bnxeztAqjO1lA
         SFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551199; x=1794155999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+i9PR+PBpSj4Tps17fWo1rOr4JAq4SBNabInQeoHBU=;
        b=CkmR4r5qP+Nh5DDLc3dPxYUBsPC84tAut/k+3BuNnyscthqc4hzjxWL6x95rqvw3Tw
         oqttApdUyeKdwHxhUl0ssnYsEquuthE/NUckBHXPdOxt1FgQF3oOK5n29bPiLWDA/9L4
         R8jixe4/jbVcoC/vvS5kRUdErXugSsHrgAxLX6XkeU0B7Aar8e28JQ2lHwYvdgk5NQj6
         HL60o+Dwqjt5ugjjDkSG9BqWbME2N65g1sWzmySA+yUZOKKAMQ/rdqNTGE4eM2hhYW56
         /50PFigXE/Am/lD9tgDM+x6iniDrX4Upmdzf9ZvynFF3DaFg78BNDhXmuKRlp41+3fn9
         s/Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzF2ZdqnTSuk88a4H4t+SmNA8UWnCAYlaxFwR/HvJXi/CKtOgVTR+2brHYrQO8vYGK96XcFTszlWEmMdlI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLOxaeSj+98WxTalPHHAimmIswG1ihSQAqfV8rNQQXoU4JoIU0
	kn1mn22Fs8B3MHBWN6sHb7da+/mcRIN9mkh01aX1lnTVXyaCIXLZbt1k
X-Gm-Gg: AYBFou0znIYa7ENGMS/DHjWb58Gfi8cm1kRI8sW0iDUhy4ussZFxJmzuER6H2Y25EN3
	9Je/KN0Tle3XhQC6UTIjyf2G8rcezNw+8imAdUeHUN3USCUowX2zQAA2bvHttRGtPXB9jmeQ1cr
	L2/xO9Phhex+PQnPHe5vZJJm+Ty2hm88CTWpeqRuwgnKVa3ihPVc/e8s9opKRAd8FU0wlsITamE
	REOR9E/ctb5PrJD/DrL6Z49GPUJ7KUXpjvAUp/BAblpMuALLwij5JJdjuMNVjBQGbibEoGh13uF
	5WAhU8qy0qLiH/zDw5LHUewYTyAthdwrOt5wbHdkqEIxsKQzyD72o3OGUQ9f69WF/U8VleaN1qv
	A3OYiaufECAVQUmuF3MiSIXBiKOTXEYCFjJJy9nYiv0CYMvhLIKY4IQXKUhqNW5wS5/6vPjcPBn
	Vg8q4utWlwBHuUyvDAKFP99+laxwED+586mngrYUJYiIU9pBwhZcE5Xc6YK2zihs9srVHeCbBAX
	3tD9B2wU+3HX8d2DEcme/KLc2kUy1Fc2Bn0fQv4cvXFtOlFxGDrX8fIDpI+8vlmSooJA9MutSM/
	G7pUQjcfBaC5Gse8X26xNSDlF7Lj9A==
X-Received: by 2002:a05:600c:46d1:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4ac187a72f4mr178469025e9.22.1793551199147;
        Sun, 01 Nov 2026 08:39:59 -0800 (PST)
Received: from LAPTOP-AVI.. ([213.137.66.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm16923539f8f.6.2026.11.01.08.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:39:58 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: jstultz@google.com,
	tglx@kernel.org
Cc: sboyd@kernel.org,
	mlichvar@redhat.com,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] alarmtimer: Preserve rearmed alarms during callback expiry
Date: Sun,  1 Nov 2026 18:39:55 +0200
Message-ID: <20261101163954.767646-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An alarm can be rearmed while its previous hrtimer callback is still
running. alarmtimer_fired() then dequeues the newly armed alarm, so
alarmtimer_suspend() no longer sees the wakeup even though the hrtimer
remains queued.

Only dequeue the alarm if the hrtimer is no longer queued.

Fixes: dae373be9fec ("alarmtimer: Use hrtimer per-alarm instead of per-base")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/time/alarmtimer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index ea5be5870e515..bf77af5e32c22 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -189,7 +189,8 @@ static enum hrtimer_restart alarmtimer_fired(struct hrtimer *timer)
 	struct alarm_base *base = &alarm_bases[alarm->type];
 
 	scoped_guard(spinlock_irqsave, &base->lock)
-		alarmtimer_dequeue(base, alarm);
+		if (!hrtimer_is_queued(timer))
+			alarmtimer_dequeue(base, alarm);
 
 	if (alarm->function)
 		alarm->function(alarm, base->get_ktime());

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.43.0

