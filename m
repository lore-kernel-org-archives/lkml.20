Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADFF3859D4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619837; cv=none; b=CLkrRuydMUK5+py+0Ww7TDJXNzZro2g0YrEx0M1xODzR+DzfYAvuOAfOBL4vxqIfUUq2B+Q58xsdE9+HT3evznOl6pQVZuVsDNXiWDAo7pYj+fWrtE5Ey1KACM29Q+U9d59r13b3Fi6VqnPTMUyZTqu2BNgkuws4bIM/iHxsxBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619837; c=relaxed/simple;
	bh=aRIz+/TLeV5QG5HfhEI3Vm/Qlc+mrmjsdIrqB38cuUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R8lq9nVo3YqdUKsSa1FXudB3svyD+SGtbukJ49EfcTapFdFKlHlLQAatmHozRNtlqDBP5BGRSHFrnBRnmWnkuPYs5yyjOU+ULhYHD2bF20JYkfvICy5O5TQZwCHuZUpgedenZpkRdeRcCE2x5ZCk2B3nwOzEPL/2MIgP+s3FLpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5PPNtpm; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5PPNtpm"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d797cfdd5fso1216855eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790619835; x=1791224635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qaxRhHQb6MoYo1XfTIRxXUIBkVqO+XC1qTwYParAjIk=;
        b=P5PPNtpmEFbQctcQ+gSqHnvP5kUl9OCoV9nrkDcsB9w3P438gVG8h9iBgRr2uwIark
         O8t7Lk+bHajZwssnw6YxfZO6IfOMokUOh4H1k6xPqVUwFOelxjFnYZMK7gW1gDx5Ca4p
         0ZTB9sziVc/+AFNuWGg6O1Pc8EyYEH9uDnzj2lzlq0Bl9C1afx/sN6Q/X8lXVcktwcu7
         I5KaUZLhf+7M0Fod0uF9hbYoPGgLrr3HzJIvC2HFOIOEhuWiREHswYA4b+1LXAhNAVFa
         WDYTUemlEULGfl/8hijttcuX1WeQnWvdw7PjWNLfm7qO53k25wto6dWKnmtFl59nWaN0
         vMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619835; x=1791224635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaxRhHQb6MoYo1XfTIRxXUIBkVqO+XC1qTwYParAjIk=;
        b=Im7o1LuyBkQnLBbszJR5afFYz8+/fckO1BL+bLuTEa0KrRVP7iQTzfdNdXkMQRtdkk
         vFg3HJ5/AmfmYZclLoHJLJ2V2BDOBHx+aHJO+x/MmkK74epa5hnHmasnKLN3BBxWcGIa
         ByzzcYlFcZ/prTl/4LrhxeYkRR9jb5garZEiwCXG+e/gPvfp4GruEiP4iJetu1PfYW9K
         +2cTvszT4c4p4nkFsyvZacMX0zInC326NVwQ9i3/zHeVZT/ah50zaBX2wjHy6rji1gwD
         vAXYivKEnNy1T6Hf9avA5nO6VZvydMVJUAWkQwY8Eh80tc0QvVYlNXlw1eJOb7Mbp5XB
         8UeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/aOcWdzpebBsEJZilucCrqsYV3vAB1ZArj54pbxKDIdJeE7RYmC+/EyYZV5Cq3ypU5OFtyQ3R1/5IVbs=@vger.kernel.org
X-Gm-Message-State: AFuF++n+OO9N+KJzpU4RISxP+aH7MZ1KrXPFRhLAzghYi2yWvzs0wkWm
	ZnyJ/3O3EKek4B2RHqLP2UjVTNu/vAPaMMKwryxPSnCNjywSTHZAOsn9
X-Gm-Gg: AYBFou3HGk9eM2BPfdqQKH4bXfJb0+8a/sMmIjTcEnsmrIS5fk+FP1xfvHSHnWvnBDz
	VeV/DL0AGIsZ0X3mL3H6aFnF6oW1T4QvgeAhQjnuDVAhhAv3BwZEx5cxncOcsflBwIb+eAfdHRH
	z6No9o70Co+si3Adv9kk+YBYuUIjgxiD1x9qT8rMNZWnlbEtycukLUm8A8MU2zXm47aceTeZpWT
	6KcaAgDYAK6yzwg5cjGyp34NQYW7gI6EKwjUyDiNAB4lP+VBeLsAGnrnlvo6/bT26jJRGes1pMr
	LuOGZKiRvObvJnUEMUzgET3uqCvKquqQAfLwFwdhEpxEPLagOUJnIPErhRKQ21Twtt+qEDdNl2e
	Q9nHR/gtYDayfZF3KXNiDX0OrR2nkPRc6dXFQCn52ZhvnarShsDjWECtoPEw67IL4uOHKBQbZ/Z
	5+1zZAvexw3pdE/79Nd1D6UTHeLNYEwcNbpiEO2Ws7vA0iGdt3g8Y5MJ3n5p6ay+THvQvBTAf2n
	/GyVoHTW/waVTe/8DrSoI4Mc4FmIdeOX+jy+uhl0dqEm0HDhpo=
X-Received: by 2002:a05:6820:3388:20b0:6d7:6eaf:8353 with SMTP id 006d021491bc7-6d76eaf8a3fmr3823072eaf.88.1790619834636;
        Mon, 28 Sep 2026 11:23:54 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d882dc4a9asm5994311eaf.10.2026.09.28.11.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:23:53 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: timer: Handle userspace-driven timer ioctls from 32-bit tasks
Date: Mon, 28 Sep 2026 13:23:52 -0500
Message-ID: <20260928182352.309457-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

32-bit tasks on a 64-bit kernel can't use userspace-driven timers. The
compat handler for /dev/snd/timer doesn't list SNDRV_TIMER_IOCTL_CREATE,
so creating a timer fails with -ENOTTY. The file returned for a timer
has no .compat_ioctl either, so SNDRV_TIMER_IOCTL_TRIGGER fails with
-ENOTTY too.

struct snd_timer_uinfo has the same layout for 32-bit and 64-bit tasks,
and SNDRV_TIMER_IOCTL_TRIGGER takes no argument, so both commands can
be passed through unchanged.

The utimer selftest doesn't catch this when built with -m32: it takes
-ENOTTY from SNDRV_TIMER_IOCTL_CREATE to mean CONFIG_SND_UTIMER=n and
skips.

Fixes: 37745918e0e7 ("ALSA: timer: Introduce virtual userspace-driven timers")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on x86_64 in QEMU (sound/for-linus plus this patch, KASAN and lockdep):
    - A 32-bit program that creates a utimer, starts it on a second
      /dev/snd/timer fd and triggers it 10 times gets -ENOTTY from CREATE
      before. After, it reads back 10 ticks, the same as the 64-bit build.
    - The -m32 utimer selftest skips before ("CONFIG_SND_UTIMER not
      enabled") and runs after. Its tick-count case fails before and after,
      in 32-bit and 64-bit builds alike: the global-timer helper segfaults
      on this host once the timer ticks.
    - No splats. Built with W=1 for arm64 (COMPAT=y, LLVM=1) and for x86_64
      with SND_UTIMER=n.

 sound/core/timer.c        | 1 +
 sound/core/timer_compat.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 679b26435670..69a59b25fe0a 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -2176,6 +2176,7 @@ static const struct file_operations snd_utimer_fops = {
 	.llseek		=	noop_llseek,
 	.release	=	snd_utimer_release,
 	.unlocked_ioctl	=	snd_utimer_ioctl,
+	.compat_ioctl	=	snd_utimer_ioctl,
 };
 
 static int snd_utimer_start(struct snd_timer *t)
diff --git a/sound/core/timer_compat.c b/sound/core/timer_compat.c
index 25ee81c1668b..5bab00466de7 100644
--- a/sound/core/timer_compat.c
+++ b/sound/core/timer_compat.c
@@ -99,6 +99,7 @@ static long __snd_timer_user_ioctl_compat(struct file *file, unsigned int cmd,
 	case SNDRV_TIMER_IOCTL_PAUSE:
 	case SNDRV_TIMER_IOCTL_PAUSE_OLD:
 	case SNDRV_TIMER_IOCTL_NEXT_DEVICE:
+	case SNDRV_TIMER_IOCTL_CREATE:
 		return __snd_timer_user_ioctl(file, cmd, (unsigned long)argp, true);
 	case SNDRV_TIMER_IOCTL_GPARAMS32:
 		return snd_timer_user_gparams_compat(file, argp);

base-commit: f090e7ff26fe08be4cd57e0950872ede4af5351a
-- 
2.55.0

