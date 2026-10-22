Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680788;
	b=sOtvKLJ/aCL3dUhl64Pn1/z9AJ0G/GZRHO6yNtEDXPC0gS8P1TrLeJiE7+HNKb2LS+CO
	 3XC4UZGxPumMgejtKJT4wVg9Q7yvJmJxS0NC/4WBsZu0USBmkeoAvG5ueFsjfS4xJAL6U
	 cbsBMj3hgqbOzByGq5QQe2VOjAEww7B/ifDjeHllumYW4XjSkfDVzTwXj/D8dTTawj2Ni
	 vcdMwyGcMsLPT0BeOz/28OOqjoyAhgOFKQ7bIMJdqTgPR2uSPs+JILVJXDgDzqu+rgPpp
	 2m3jiD8c7oRERQ9oxhTr0y2674oZRO2+q3uinJKlxy+C0oAH9CwEP0frrNX3Rmr8Eww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
	b=ZhHOp3S3SbNjN0SEMvTKUyVqHNC9WWVUx06RqTqyW2uM3+CU9gvAqeFlkzuqRLccaVsT
	 /Jur4EjXnuyEj2r9eDb5f26DNAYVeh6l2Ivy7UMyL4xqx3dvNeuTZ4lU+TXIfIzpF7IFh
	 20Ky+G0hlH6kCS8QfN7A/T5kbGwU8tlmH1dVboBgnm5jMcLCBsm3MV3qT5tNQj/HiZcym
	 70jwmkB2tlsTHjUYYW8eEfu3D9joiqWzm8RMRCkdeLiiYLRRTTy8qha0sNuq9osFfpWAl
	 PxJaPcpUO6tQnNq+2cnmJmjD9aFNhVBf7DZG2HOcUlBPDJL53hinjN6QXnzmJ1lIq8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MQAahmYx;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D54606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78D54606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MQAahmYx
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1045367a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680788; x=1793285588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
        b=MQAahmYxNC3kLSCRoMpvINqt/HMuJwwmTVHWcqs6kj2EnPHZ/Wu9w4B8q+1DiweW2+
         hFxe8sSGFEaUA9+hh8KTsQe7k4SVgCqcjQOCe8zw06mSekdcAaFde42tPodYoUNYxEVK
         Vefy0wsp2us4+0ELy+ju51348LC7bl+Erv6AeyqzdJty8BG5Cb3KRtZFqSUSFPstgN8B
         AjhzbY5M/DYRDkQT0yRedwF2x7NFJPepLrFnuCZyHVKjXte7Gg1a+XeAohMLbdcjI6Aq
         PwG1TSi8Lyq36N7QG4VNsn5wzz9stXCAD03ImtTxByqsHDavVLulMaqKNw33NDspaZT0
         hGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680788; x=1793285588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
        b=vbuhmZeoTG3pGgit+E7fOlJY+jE0yLvLfl5qVcHWx0UFHcYV3EgTGpyqw8x8jppxYR
         aoMQiq3y13/PbUkhdK6wsbv0btWWiYqQcT1SrCHDm1NsSRoDvTpt6btxfHPuyIUtDG7C
         H5DNeXvKgefSBFXEpX68rHMFXd4qLa67johewzZOM+ykciaWpe6PQJgb+4pVneBTaOlt
         0VkWwJ/xbQWAo0Srm0N4xMhongersYXYoHjCJmxoWlniGWT/cozMwm5YagVgaloNW4yo
         KkphquH2FTh0cMMusZ96McMjfwZybE35sMqcyi6WK7Zxuj/qbzHvn2dmGtmj19/ULiBj
         WEgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhhrVqrdD7gYXlZBgZkME0vI5XHTo6WSKJ24t5FZjvQH3aOXgsADcBjCL8I5QR0tRLy/+npt2diaqaytY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUN6/RHdGbiZx02jarlRnrCi58t0ygg4IvPC7plBlXPLsz1MGH
	En9LHTkmBQTrHhDFoYn1ICKmMcnadNakNW7IagkZobN9Q/1yV0i8FYed
X-Gm-Gg: AYBFou1EcUr9R6ZRIdh91P0GfY1xP1XfyWRQ7hX/85MvdmxTsPI6RB+B4Rf6pxc3Tlv
	fCjxknyMNUnOuVKS4j0CyWmMgmELo4wEOAx99mmkKFIEWF5aW0xZU6mP5ByGcASS9ynjOWOKvCp
	EK9dO256Wl7x8hpRnD84mtlPmUfKf8T5dBzHyRUJVDJnjxvp+wx3LOdgXOiZff+9j2H+sEziEhw
	au8PrYOWMqi/Na5YVzh2zp8OB0fVku9KiBwO1vPipOdy7VA4dfEY+ZcxM6I3YUI/fasdF80BsOt
	bfsZgFrCyhFRK6RC9PqfTA3f5Uj9X0Su0PY7/F3fcuA87KAfodMRqCi6egDSdVYKiQj/e8C2O4Q
	DRXlFyHsBvrwCCyk51H6vBXxPCiL5SgWEUoZ8WGtETa6OLgCefaXvzWwoD6bVTLFeg+GjcJL+Ly
	GKlIq+rmDy5UEAfAw4rCHpGS6i2k1104QwjD6sLuV+wFlQDDdGJwPTQHZEppLZCnzfPOm1EQTP6
	EZZScUo49LHNJ6qUMG658ILYUPZBmQ/F2U0loxD88hL4SCDaL8=
X-Received: by 2002:a17:90b:5390:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3ad86cdd7a6mr4244176a91.67.1792680787720;
        Thu, 22 Oct 2026 07:53:07 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm4767829a91.2.2026.10.22.07.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:53:07 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 1/3] ALSA: opl3: Initialize the timer before publishing a sequencer port
Date: Thu, 22 Oct 2026 22:52:53 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
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

snd_opl3_seq_probe() initializes the delayed-note timer and its lock
after snd_opl3_synth_create_port() has made the native port reachable.
A direct NOTEON does not require a subscription, and a fixed-duration
instrument makes it enter snd_opl3_start_timer().

On sequencer-driver rebind, the card-owned instrument bank remains
available. An event delivered as soon as the port appears can race the
late initialization:

  Sequencer driver probe             Direct NOTEON
  ----------------------             -------------
  snd_opl3_synth_create_port()
    snd_seq_event_port_attach()
      publish port
                                     snd_opl3_synth_event_input()
                                       snd_opl3_note_on()
                                         snd_opl3_start_timer()
                                           use tlist and sys_timer_lock
  timer_setup(tlist)
  spin_lock_init(sys_timer_lock)
  sys_timer_status = 0

Initialize the timer, its lock and its status before creating the client
and attaching either port. No event can then reach partially initialized
timer state or have its newly armed timer reinitialized by the probe.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/drivers/opl3/opl3_seq.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index b77d8e8f12fb..2bacefc3201d 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -214,6 +214,11 @@ static int snd_opl3_seq_probe(struct snd_seq_device *dev)
 
 	spin_lock_init(&opl3->voice_lock);
 
+	/* Initialize the timer before an attached port can receive events. */
+	timer_setup(&opl3->tlist, snd_opl3_timer_func, 0);
+	spin_lock_init(&opl3->sys_timer_lock);
+	opl3->sys_timer_status = 0;
+
 	opl3->seq_client = -1;
 
 	/* allocate new client */
@@ -232,11 +237,6 @@ static int snd_opl3_seq_probe(struct snd_seq_device *dev)
 		return err;
 	}
 
-	/* setup system timer */
-	timer_setup(&opl3->tlist, snd_opl3_timer_func, 0);
-	spin_lock_init(&opl3->sys_timer_lock);
-	opl3->sys_timer_status = 0;
-
 #if IS_ENABLED(CONFIG_SND_SEQUENCER_OSS)
 	snd_opl3_init_seq_oss(opl3, name);
 #endif
-- 
2.43.0


