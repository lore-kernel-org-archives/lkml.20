Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048CF479887
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254009; cv=none; b=DZ64qSwhMVGAxU5EUe9aPDh8gh9SWNFCIRKD2j7p45IHY2ySJX9kKcVb2ju9k9L1MwTY7PMeKFt7wmb165hLxXPpMOnqdDYeg0kzHoZ37CthCD5bTcsLE95WAsvc8HRjmzz7/c2twbjfwt6TR+1V9/CDFD5yM/Tn2sZz4OnaoKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254009; c=relaxed/simple;
	bh=5TXH4LC7ZsK53s8hTAxjUirx2sEYY+ExHWiOtAZax1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WLuWoB+zJpZ8rUCb2mvx1naZ+Ytp9PNKC4YsT7l8185Uq399IRa8vFI58s/RpTxjlQ0RSD7Sp4yju+ZID23CA0RgjPJAcWDH8IL2Znu8hAsNdasik1Ek1ncJxx0Y6BLjZJ4FhfQ0WYDrxDOUgSljwgwbBZzWjoqaaOEFc2361vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTVC+N+l; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTVC+N+l"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b9320423cso44597765e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254005; x=1788858805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6/zRLtsUSMddk2IzAgWLfFXWAC9OmiNCU9k76PvNK4=;
        b=KTVC+N+lmN5KJcwrfqShoqBht30i/ldO42Hk4YXOyFEqc7l1KbwfwvGTc6tJGWzxO/
         HrCw8k/KeaFULbtM/AuRJ260xcvBXFyC52LL+fxiE5+iN9C4mekdHDFze7kWZn+jeu2W
         5bYpQM2sjkVWGAVelCuieVBmilz5n0PkTHYH7EKq2Icrk9347KORMEDHQd6n42MGmxMH
         ZvGnpLp79fDyNrSYFhfB0GgR29y7lKY89kjP0iXQFby6PBJQDK/7o94Luht7AwGXytrE
         Lf84/g3tpsZM3JzfB6K6c5OrLQWKzSilpWBqwjmeVYRqfUFINhaWs96RkegcHDfhL210
         4POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254005; x=1788858805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6/zRLtsUSMddk2IzAgWLfFXWAC9OmiNCU9k76PvNK4=;
        b=ib2QUdDqS7jZaLn794A7Pnw0u7uNmiCEwmnBKx0n7V4O59Jle2C6dSEE9jP4ZobiCs
         MUKmuTvGTG/nrrJxliJ0ih4H6SDIxnEuMs5zIAyUtgQk5kqRZKD57EP50EJLuu5njgJV
         h+1Jr/0a5b/4LT/WZBYbJt1xqbCHbRlsZGYwHGqbIYbl54O9Vp8UThTmOhnFN1kajsuE
         syFNwA4Dxhbbyaizz+bZVNhAINdgozLgd/yZIWypE/hSfzaQjlUO6mWRt010m6QgM+7y
         BlqOWwyuf+mWFuKh3/i4hATXu3Q5vYeUT79aLqr0Lwy9Ji2lLVA2Ez7ap2JtvQ7/3Qxf
         lt1A==
X-Forwarded-Encrypted: i=1; AHgh+RqJ/JD7mRmPk/rhaCSd1Z1R10JGADEQIhUQaeQOgduY1cz1/ucgLKBmnUBB0uXIXQsgOeetAnorgrBoiRg=@vger.kernel.org
X-Gm-Message-State: AFuF++nMnY9r5S1AO2DZ8yFA549Huex+LE5Sws1CRhK+IvlQ/rxmztkR
	eJwXT7qJH4pkjLDKev3V0+WLibgpg0V1ET6SfKU46x42mzO04skoIOg0
X-Gm-Gg: AR+sD10EOfI+HotpDcDvIHFeA3PHNKgXYyz0uWyziVMdl5K+jmgFULpx1VsQURHG7iA
	9KBe5F91zPdA440o7HXA1LOOy1swy2vmZHFIjyZfSbPHb0vPwazUuYrqFG+WE91+F+ABRDHIP2T
	fXbxYtCFHi7m5CxdwLRi65v0OroJXJrEOeksHbp7LJqEZTwPUSUSE8CgrJXlntOoJ2S7dIKShGs
	2lUMPiovOVy8tzUCz1qSAl4nvmpJC5IFDCc71DpOqbWZ6sDa0fumwzeN3LrzCFHJxNIz0cDtcA6
	tszS8gU+nbJIWLiwNVCLs6KPwiBXHpGHYf9USBAE0y2pWLUEEENUI5bN9z0kUtbbnvdzJGWuFiQ
	lzC6GdLuTdtZhQv51h61vDenURIUTT0OIm7YlpoDqjpoiahn60iKdKVZJ0quW2QR1g7vWFx+RYJ
	O5Rpsuma6dkzywRfb3pa4jj2wj29X56upXz8htMGAm0gwB3zrEeqnFQ83/jfdwgrmo3X0bPXFMY
	HNY7X+2okVt2PLlVNxnqFReh/NPfsLVkoZCRnrBoXZO343LTfxFp4WvdTHuO6NGDvwr1DjTQSNg
	bT8nlF9DBKTLOJT0ytRbUSNZSG+tqc+SwauMtL/eVLyYqvgTcHT6sfuIBDRuYhsu8pspPxONY/G
	mmg==
X-Received: by 2002:a05:600c:3b2a:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cdc57d1d1mr105123535e9.16.1788254004957;
        Tue, 01 Sep 2026 02:13:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d781bcsm3378291f8f.26.2026.09.01.02.13.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 02:13:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 6.1.y 1/2] ALSA: aloop: Fix racy access at PCM trigger
Date: Tue,  1 Sep 2026 11:13:01 +0200
Message-Id: <20260901091302.66860-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260901091302.66860-1-kmehltretter@gmail.com>
References: <2026050445-connector-rebuff-f713@gregkh>
 <20260901091302.66860-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 826af7fa62e347464b1b4e0ba2fe19a92438084f ]

The PCM trigger callback of aloop driver tries to check the PCM state
and stop the stream of the tied substream in the corresponding cable.
Since both check and stop operations are performed outside the cable
lock, this may result in UAF when a program attempts to trigger
frequently while opening/closing the tied stream, as spotted by
fuzzers.

For addressing the UAF, this patch changes two things:
- It covers the most of code in loopback_check_format() with
  cable->lock spinlock, and add the proper NULL checks.  This avoids
  already some racy accesses.
- In addition, now we try to check the state of the capture PCM stream
  that may be stopped in this function, which was the major pain point
  leading to UAF.

Reported-by: syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/69783ba1.050a0220.c9109.0011.GAE@google.com
Cc: <stable@vger.kernel.org>
Link: https://patch.msgid.link/20260203141003.116584-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[ Karl Mehltretter: dropped the access-mode comparison and notification
  (462494565c27, e299a9fd433f, cdac6e1f7164). ]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 sound/drivers/aloop.c | 58 +++++++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index a38e602b4fc60..67bbadcec02b0 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -319,35 +319,41 @@ static int loopback_snd_timer_close_cable(struct loopback_pcm *dpcm)
 
 static int loopback_check_format(struct loopback_cable *cable, int stream)
 {
+	struct loopback_pcm *dpcm_play, *dpcm_capt;
 	struct snd_pcm_runtime *runtime, *cruntime;
 	struct loopback_setup *setup;
 	struct snd_card *card;
+	bool stop_capture = false;
 	int check;
 
-	if (cable->valid != CABLE_VALID_BOTH) {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-			goto __notify;
-		return 0;
-	}
-	runtime = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->
-							substream->runtime;
-	cruntime = cable->streams[SNDRV_PCM_STREAM_CAPTURE]->
-							substream->runtime;
-	check = runtime->format != cruntime->format ||
-		runtime->rate != cruntime->rate ||
-		runtime->channels != cruntime->channels;
-	if (!check)
-		return 0;
-	if (stream == SNDRV_PCM_STREAM_CAPTURE) {
-		return -EIO;
-	} else {
-		snd_pcm_stop(cable->streams[SNDRV_PCM_STREAM_CAPTURE]->
-					substream, SNDRV_PCM_STATE_DRAINING);
-	      __notify:
-		runtime = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->
-							substream->runtime;
-		setup = get_setup(cable->streams[SNDRV_PCM_STREAM_PLAYBACK]);
-		card = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->loopback->card;
+	scoped_guard(spinlock_irqsave, &cable->lock) {
+		dpcm_play = cable->streams[SNDRV_PCM_STREAM_PLAYBACK];
+		dpcm_capt = cable->streams[SNDRV_PCM_STREAM_CAPTURE];
+
+		if (cable->valid != CABLE_VALID_BOTH) {
+			if (stream == SNDRV_PCM_STREAM_CAPTURE || !dpcm_play)
+				return 0;
+		} else {
+			if (!dpcm_play || !dpcm_capt)
+				return -EIO;
+			runtime = dpcm_play->substream->runtime;
+			cruntime = dpcm_capt->substream->runtime;
+			if (!runtime || !cruntime)
+				return -EIO;
+			check = runtime->format != cruntime->format ||
+				runtime->rate != cruntime->rate ||
+				runtime->channels != cruntime->channels;
+			if (!check)
+				return 0;
+			if (stream == SNDRV_PCM_STREAM_CAPTURE)
+				return -EIO;
+			else if (cruntime->state == SNDRV_PCM_STATE_RUNNING)
+				stop_capture = true;
+		}
+
+		setup = get_setup(dpcm_play);
+		card = dpcm_play->loopback->card;
+		runtime = dpcm_play->substream->runtime;
 		if (setup->format != runtime->format) {
 			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 							&setup->format_id);
@@ -364,6 +370,10 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 			setup->channels = runtime->channels;
 		}
 	}
+
+	if (stop_capture)
+		snd_pcm_stop(dpcm_capt->substream, SNDRV_PCM_STATE_DRAINING);
+
 	return 0;
 }
 
-- 
2.53.0
