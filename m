Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823461;
	b=azBlbONYaQPCQb92T+dIwRNmCT+1DLj4qsVabCxqEseQvvKuch+lEFvwq2M3ETtafJrX
	 LFe8ztiAqTZof2e6ri95u0yLif2lATp5touDNzGJEn4b3AIAXayuUlcE0fgiIH32IFDg2
	 BwnV6C9nbKmRs6B1whB9effT9XfkwLc7ZBjnaD2g+MEJjdB/4bN0/wCphhSEsr64RrHf0
	 e2xYm5/1v4+bysZ4SeHZOl3HkSpOaqtiVZhYt2+/kpESt9ceAxRLiqS0NYKv2JpTyOMLR
	 pKNyQQLK/lgh93882dCYDVUtI9GLTTbL3paQTDSqOmKH+ugbFz8EmF1/zwtlkixTzbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=shpNj67r+UVszkXWiu2sMw/IwQkK01xcISpT3Bak3lM=;
	b=bILYheM+fKXP1LZsmpxoKXMNBbsxzMNVQuewKe5PZ+D2hWvi6sJTxSkuS8zq7gCuo5D9
	 hKsUDzGcIJFIhmywl1Fsw/ixpWB9TXV3DCGmN7unhXRuO/C4dbazE0yJWnZ6U0ZGO2D2a
	 9Vodm+ZxhieYcW33E6KKVXAbRIbigXIz6B40bKgjd1hedglEjxFEf5vgVi1fYhJJNBooP
	 LDwWeYVEb53ZbkO1ZgT+BhaExH/iPjGW7nmXNu/C57mMJKaNrdvZVMYBNdaDPRmYRljFA
	 K+FluzT8pKWUhPBLl8t/a0yR2xBt8XWHSpUuBQKMvJE5XK47uECwwBN8JmDQ5cfCzrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DIiJq+pQ;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29B3606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A29B3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DIiJq+pQ
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e5fb79ce82so9866885ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792823460; x=1793428260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shpNj67r+UVszkXWiu2sMw/IwQkK01xcISpT3Bak3lM=;
        b=DIiJq+pQvvfT3VEMs+oBwp//37qbZN2UYLUCtQYFvKUn+TAq9Ez2EH72fIVtt+6YO4
         u/nUg/nFG5+iFP+NKcU5CyX6wabO8+5HEXctmU0RiDb9sQdy5cWHh2SZbBEHqT6wq/9O
         oyJ+07HQPW9sRYxtzaaq5btpWtpr+pwpbvYtOl0Jy+r/j9XZUE2ClMA5qBDKymBfgko6
         P5NhEhn1ixU840J6I43FtGesX5UPqztnTimnDJ18dH7YcTkzudZF+K1doREp+Qa3Fj40
         8zVl3aGFBGDdxIGngEmT1Ex9Tl/QZ76OC1Zvx24ZLrsaZPVu0HB5Xw4AN5eM0dOy/WKe
         D7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823460; x=1793428260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=shpNj67r+UVszkXWiu2sMw/IwQkK01xcISpT3Bak3lM=;
        b=H2XlGLv2aUatQ+qwsYYzA2kMXJ/B/mvnXPcZptKgbVSnZargot3gXZ3ZzswlIeu2BT
         3g3COV1zeL3h4Z6i91KX5poAgP6ipsmJpNckRT1CL+GAOjn40JqN96H7XDCZqTpMS+OP
         WlQF95HR4V1BO7r+A0J3oogVfryDMIXvFtKrdNzJ/+rZRFzGaeeb7f70TFStpiU18f6w
         +YAyHQ271h6G5+v63DPdOAUYwcabdiZzfJoW6ZNdKrVl8XdJCNwu7sKMY//gdx0stl/Q
         XCqwzW5OJyZ3FaLJH5mdzG1/MLdUhgqA4OYky8LveLwSutinSNC3HRSFjUHGcRaI8Y6Q
         FOQQ==
X-Forwarded-Encrypted: i=1; AKwUvByyDxs8rTM6+O0Lc5dCSbZx3cUvJmwxZaNSx43QSGW6UdvBUsIYGszHDnd5HESZnBLV6jZKTqakYjSXrD8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhOJ4QS8G6b9k1sBxqGzwYR0yyUBNAlZshArjwioaOanx0BNvz
	lPoIYtea1Xgt4xQ53dvtCpjmD19hRz7+iASqfG0Ey+F1rCVBBzQcElBh
X-Gm-Gg: AYBFou2ZHMyMwmaajgCwbtxhtNBrkNuO67S0q7bE5BYBZk6ILFd511x/961vDmUqw9S
	Uxl7aXKUoxMtBbnVhwXvCcJTwxBMRwAJkBBEdhwdml3VBkYdmm8vGHKFFizFy52UcWiUNs+2jDd
	S1uBbGUsvUO3bmPEBsjRJiWbkryOgFRWJYh7YUAWT8aNXKkFnYVqUXHd+V77GcK1fqM08CIfkWy
	qlI3aSWIOGIMbEbhQTRNogqgM07cZ4wg5oBvBbDER26tjBCR0LqbG00HGjYDrIAJDkR/r7DZxDm
	WqtsCkDeQ8iOodIYu3WMiK6gNCeyb6X6AOFtJgKmp5wjxclw9DptRibwZq5vO05NAL4ET9HWjtL
	gue9etnc4UoxTQdGH9Trar6s8l8rcv8hUCSEvJRuG+MdHJvy/aTLuOJfMrBfRoKm36ppjH4I+PG
	DCiF7wtBbpjrmH+h1TmpkVCQQHsuynUTe/B84gDGo8Y0jZptVrN/Z8cMbZf0FfI9ZO9QuWeFCbm
	y6ipXqKcoZAKA2Vlq25pxDSRopmlAMkvfKL+E/81xx+VMakW68=
X-Received: by 2002:a17:90b:5625:b0:3ac:8af9:4a6a with SMTP id 98e67ed59e1d1-3adeafc4451mr1169038a91.42.1792823459988;
        Fri, 23 Oct 2026 23:30:59 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebad6306sm1248371a91.2.2026.10.23.23.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:30:59 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 2/3] ALSA: opl3: Clear voice channels before freeing their sets
Date: Sat, 24 Oct 2026 14:30:44 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-0@gmail.com>
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

The card-owned OPL3 voice array survives sequencer-driver unbind, but
its chan pointers refer to the native or OSS port's channel set. Neither
port's private_free callback clears those pointers before freeing its set.

A direct NOTEON in the initial SYNTH mode can leave a voice allocated
without a subscription. Even with fix_dur zero and no timer, unbind and
rebind followed by direct PITCHBEND can read the old channel:

  Sequencer driver unbind/rebind      Direct PITCHBEND
  -----------------------------      ----------------
  snd_seq_delete_kernel_client()
    port_free()
      free channel set
  snd_opl3_seq_probe()
    allocate new channel set
                                     snd_opl3_pitch_ctrl()
                                       snd_opl3_update_pitch()
                                         old voice->chan is non-NULL
                                         snd_opl3_calc_pitch()
                                           read freed channel

Clearing only note_off_check or the voice state does not protect this
path: snd_opl3_update_pitch() tests the channel pointer itself.

Key off active voices before clearing their channel pointers, delayed-
note flags and state under voice_lock. Direct events need no
subscription, so port deletion need not call synth_unuse() to reset the
hardware. Merely marking a keyed-on voice off would leave it sounding
and cause the next note to miss the key-on transition. Reuse
snd_opl3_kill_voice(), which also handles a paired four-operator voice,
before either channel set is freed. This also excludes a timer or pitch
update already using a voice. Both private_free callbacks must do the
cleanup because an in-flight OSS event can refill the shared voice array
after the native port has been drained and freed. That event can only
reference its own still-live set; the OSS callback's final cleanup
retires that reference before freeing it as well.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/drivers/opl3/opl3_midi.c  | 14 ++++++++++++++
 sound/drivers/opl3/opl3_oss.c   |  1 +
 sound/drivers/opl3/opl3_seq.c   |  1 +
 sound/drivers/opl3/opl3_voice.h |  1 +
 4 files changed, 17 insertions(+)

diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index 6d3c5b5a35ff..ba807be2cf1d 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -632,6 +632,20 @@ static void snd_opl3_kill_voice(struct snd_opl3 *opl3, int voice)
 
 }
 
+void snd_opl3_clear_voices(struct snd_opl3 *opl3)
+{
+	int i;
+
+	guard(spinlock_irqsave)(&opl3->voice_lock);
+	for (i = 0; i < MAX_OPL3_VOICES; i++) {
+		if (opl3->voices[i].state > 0)
+			snd_opl3_kill_voice(opl3, i);
+		opl3->voices[i].chan = NULL;
+		opl3->voices[i].note_off_check = 0;
+		opl3->voices[i].state = SNDRV_OPL3_ST_OFF;
+	}
+}
+
 /*
  * Release a note in response to a midi note off.
  */
diff --git a/sound/drivers/opl3/opl3_oss.c b/sound/drivers/opl3/opl3_oss.c
index 6d39b2b77b80..1f01d27955fe 100644
--- a/sound/drivers/opl3/opl3_oss.c
+++ b/sound/drivers/opl3/opl3_oss.c
@@ -41,6 +41,7 @@ static void snd_opl3_oss_free_port(void *private_data)
 {
 	struct snd_opl3 *opl3 = private_data;
 
+	snd_opl3_clear_voices(opl3);
 	snd_midi_channel_free_set(opl3->oss_chset);
 }
 
diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index 2bacefc3201d..e03c88377bb6 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -152,6 +152,7 @@ static void snd_opl3_synth_free_port(void *private_data)
 {
 	struct snd_opl3 *opl3 = private_data;
 
+	snd_opl3_clear_voices(opl3);
 	snd_midi_channel_free_set(opl3->chset);
 }
 
diff --git a/sound/drivers/opl3/opl3_voice.h b/sound/drivers/opl3/opl3_voice.h
index be9ccca2d952..aa81512d23c9 100644
--- a/sound/drivers/opl3/opl3_voice.h
+++ b/sound/drivers/opl3/opl3_voice.h
@@ -13,6 +13,7 @@ int snd_opl3_synth_use_inc(struct snd_opl3 * opl3);
 void snd_opl3_synth_use_dec(struct snd_opl3 * opl3);
 int snd_opl3_synth_setup(struct snd_opl3 * opl3);
 void snd_opl3_synth_cleanup(struct snd_opl3 * opl3);
+void snd_opl3_clear_voices(struct snd_opl3 *opl3);
 
 /* Prototypes for opl3_midi.c */
 void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan);
-- 
2.43.0


