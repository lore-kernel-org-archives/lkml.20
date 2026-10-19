Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722AB4AE103
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404921; cv=none; b=ut/YMCbZwCgZR7uMvQ9ebidcNRG7kEnOYHLkykDq2UhcVxFgumXnbBx7n8dcRUKbO2y9jvmi67LVVWYzsKwjH2Qa1y3t4ASldsC7RsbB1QecG/UxzCsBzSruEmB63mSkVogr93ey9QPpGLrDeCIPL1U88NJo4+lyIDj6ahXuDQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404921; c=relaxed/simple;
	bh=C283mnBuZO15/DNBtEg5d2hlO5HOSoKCwW2jB4d6lWY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tNCTTHz2FmA078QiN/I+gnM61I0WOWXS0upsRX8m40sk9BadrdA9K6Qji007x92z4hDJlXDB9LkJsvoBFlwezqBIqo95aST8hqTtn9YEP2CKZU3Sj0uTt9s51BNQM0FRmFhOG9ZEXmQPWjGBe5LEpY90mg/9dtY2HOv+uxpKRjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB89yFKi; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB89yFKi"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd60d155070so788267a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404917; x=1793009717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daxkRKPrfQ14arV5FJlxBgklthHAHPn8HqW4o1xkfkA=;
        b=OB89yFKixYHf0SyzrHm8NNQYwZOUky4y8fuupkW5Z/sHNcLYGcWo8rBKqeG/eeG0CD
         y7Im9aFi+Nvcose92vflQaVYEqmB35RQQREv1SINC8q0Ah+WtaRSHsw7BOzfdkvQRPak
         MNtm+pTX+7bAmHclggTTEaIVezaJoqijcMQPPD5ChNOORFRfzBWOdWePM1a/rn6UXRLn
         wAqi0gJfdYsGJVTTKlgM1rTAeKm3dh36pNPRNAuaeiUHghMSdB7MXhEtNCHbgIKSIKYC
         uxS8v5qSMuQvveFzfKEoytT92G2xqIcRjUgEiWWPShyGAFcKKELXwdwwcekFdlz72+2Z
         ivcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404917; x=1793009717;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daxkRKPrfQ14arV5FJlxBgklthHAHPn8HqW4o1xkfkA=;
        b=Whm4zQhv8mQRALRbvKJJBBMgC64GvhlYXpjKMoLFjHtL9Xbd684sfn7GiWjYPX1X2j
         QcuDpn1W+HKClUjJE5hcflgTLTizgHfXxeo1S4QAlup7wqjjP3b//fgDq2k5ze6TAjVk
         x82dt7OgJrD50wqefZSnRDIFBRYRdTIQyjz/Lc3tNQDpSwruUtMSkjuVK5RvIDZw2Yn8
         2T6oLjxDC3YJXcBUcw8aHT+KQs84WS9kqGnWQAI3JMFprMhPS4flZ6SzsBZErUW/RlaD
         XDeaw5WLsPXYAsBBqQp06iQonGmixTZ6O9wewUJx+e8fQ7jNBm8McmN+Kf8vKq7hV/nM
         uRBA==
X-Forwarded-Encrypted: i=1; AKwUvBzRoSplrabsGMN/hRugctDrLehPWZ6rtss+aE290DEmQWyKHki8bDEFSCXz6Q0++IIUXCbOm8UuP5qzgxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7goO9ua7URLIZ6q1PkEa9Ev+kBRNAhaoQ53RE0oRb3X53Bnlj
	Bza/N3p2u+tpPthZferfnX2u8BLbzp3lSrsupti/FQgi73NwIAepKhyR
X-Gm-Gg: AYBFou1JRNq7oEijGipoApt1aEfysQ6Cef3xYgv6NvgdEZDYUxgLZkslm56FRUT19ik
	OwsJz3nylI5zT+qp8pV3Y9WZj5dm5meoYlKvHO8r9QkliUNhsuojw6xSfsimqgS80HRvxyqUi8J
	lY2xAFZj0Xt+UMear2stnQ7+I73EbNKEGMzzOdCGOeSG9cSkAGJ2sYcyC0NyKlpa1jNTN9yC93f
	wsuvVuYnusabQ1SJ/QpJIXr6hpe75E8JbapavO+s31DdiQkBXucG76s6Tt4mQ8d8PM3geCY4sIl
	e1SroKgAC3rXsEVuCkbJzBsLAgEEhQkmCbN/dLnxHpYQZbDvWCE32tbVUETgJ6V4oXZO0ouc/gx
	PkVWf2QI2O0b7CybciMld3a7UZ8Nre0qxnRCnYIHMFTIdiN8NXs6WuAbz+EyoLmxlouNer85Ft0
	5Ea2RQYxM5w/sOTVlDWoAC0iRB3E3jIgYkRA3ZVg32yyWLS9BsyyvYX66lyOm6WXkY19Vw+bxLh
	CMn
X-Received: by 2002:a17:90b:4c4c:b0:3ac:a491:3cf8 with SMTP id 98e67ed59e1d1-3acef52ae1emr6319764a91.43.1792404917291;
        Mon, 19 Oct 2026 03:15:17 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ee274sm14723482a91.4.2026.10.19.03.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:15:16 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: opl3: Stop delayed note-offs before freeing the channel set
Date: Mon, 19 Oct 2026 18:15:12 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An in-tree OPL3 device accepts FM instruments through its hwdep write
interface. Loading a bank-127 instrument with nonzero fix_dur and sending
a direct NOTEON without a subscription leaves the device in its initial
SYNTH mode. snd_opl3_note_on() sets the note_off deadline, starts tlist
at the next jiffy and stores the channel pointer in a voice.

Unbinding the OPL3 sequencer device can then free the port's channel set
while the card-owned OPL3 object and its timer remain alive. Port removal
drains event_input users, but the timer is independent. Without a
subscription, no unuse callback runs to perform its timer cleanup:

  NOTEON / sequencer-device unbind      Delayed-note timer
  -------------------------------      ------------------
  snd_opl3_note_on()
    lock(voice_lock)
    set voice->note_off deadline
    snd_opl3_start_timer()
      mod_timer(tlist, jiffies + 1)
    voice->note_off_check = 1
    voice->chan = channel
    unlock(voice_lock)
  NOTEON returns
  sysfs driver unbind
    snd_opl3_seq_remove()
      snd_seq_delete_kernel_client()
        port_free(): drain input
          snd_opl3_synth_free_port()
            free opl3->chset
                                       snd_opl3_timer_func()
                                         lock(voice_lock)
                                         note_off == jiffies
                                         snd_opl3_note_off_unsafe()
                                           read voice->chan->number

The timer can thus read a channel from the freed set. Shut it down
synchronously before freeing chset, outside voice_lock and
sys_timer_lock, which the callback needs. Shutdown also prevents a
callback from rearming the timer during teardown. Clear the delayed-note
flags under voice_lock so the timer reinitialization on rebind cannot
revive old channel accesses.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

---

diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index b77d8e8f12fb9f90ac72b9209f4f59373eadf6f4..86bf2680a3b5e2ffee73b59a9056f93fb2bec891 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -151,7 +151,14 @@ static int snd_opl3_synth_event_input(struct snd_seq_event * ev, int direct,
 static void snd_opl3_synth_free_port(void *private_data)
 {
 	struct snd_opl3 *opl3 = private_data;
+	int i;
 
+	timer_shutdown_sync(&opl3->tlist);
+	/* Discard delayed notes before reusing the timer on rebind. */
+	scoped_guard(spinlock_irqsave, &opl3->voice_lock) {
+		for (i = 0; i < MAX_OPL3_VOICES; i++)
+			opl3->voices[i].note_off_check = 0;
+	}
 	snd_midi_channel_free_set(opl3->chset);
 }
 
