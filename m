Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680793;
	b=JxF71+z07mWiidKnaVmzA1yY7y1vVvRGLtviBXeF9naUWxRFR4a804Sxaw+UL8BJDTVB
	 +P/yfiF6vHnx9wDq5JYb+WiUUK/UzpmMbPgzKncoiH/hS78WL53dll1c+LSca+KmzX+XX
	 x+WevERSoMqB4a0P1hADOeuoBbFjFB+ZnD5JZGpLP5ffZpCd4I/B5MWFmfj+Rpp5+zUod
	 b16+cWwaPszP5pjyumV8fe2NUCdNcWxkqn8lQAv0/aROjLeJy57FB5bGprHwYayzyXz7M
	 2wwBDvHX6gQM2VqG76zYqFptLQlM6MZRCHS7rCTbJXk9Lqp1wMhLrKJrPGc8CzfQUaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H+sRkJkPW5hAtcM97zG9YoxAxPi8AjtEoexboPV7suE=;
	b=SdiC1aGz7bgOJAWhJkigJZUXzgNw6U/HNVN0P7RhADbpqN2QUtKuevTkHzHtfZ1R0Nkn
	 4nq7U0WEEq1DfHFDinz65OEb/ka0OqmT9epWUSlDNkMGXlnl5yD0q0aYdN8Op5Q3Ma2FF
	 qKcm0HZ+RTQtmVDyVuH+H/Oi4M6pvpJHTmhIkrMIFuU97KUmHDjIDCrKZSFG0hEaXXRwL
	 29BMsEi7cbwTNl5iiwFpsxkunIVOBbVfiqmalc+UQ+LVdIXi3wOBm2eJTSDueDtTw/3eq
	 0mRXM+FQKVJCc8pcoXhZXXJSGQExo+jXNAhlJr8InB0LDUFfHRAUby4yc5y0jV2kpqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TSWedaXK;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D5C606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92D5C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TSWedaXK
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so1349655a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680792; x=1793285592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+sRkJkPW5hAtcM97zG9YoxAxPi8AjtEoexboPV7suE=;
        b=TSWedaXKutKkHOavcBM3WKuGdVEIpWzMWB5neUT0vVFR/Rdh3zw7enRL0r0YZyWMHj
         ZUM9LEbGxyYvh+TKjv97CsChy9Y4PTi6lvUvGv1Dlf8zBAICKGSDheaDPsWABRya91c2
         qXJMc0XgqS5DI59texTUsaUkSQ9Nbiqaid+OSmUZIOcEeEN5YF4iugDJx+RY5+kwmvsh
         wV4odJbE8JseZX9emPbG+6eusNXXtVL/9GnjLvcx6BbpgI9DgJQdx+0OfGmakEx+AdZn
         P+WMmwvhAF/82XtAc8e6sWG29d+QIt9YKmhHuI8hx0wYGSGEICD1MOkaWHU5cg+gMuHV
         Mo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680792; x=1793285592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+sRkJkPW5hAtcM97zG9YoxAxPi8AjtEoexboPV7suE=;
        b=x8pSYQjPgbl+X5n6ZAO+4sn1GgLn57St2jaK9tCb2YV44RWOcvnpDkooz1a5jJ4M+Z
         9p9pk92Z0lX3YJJZ5bLwKxypP01Iavbk3QfMQ8XROPoSep2oS1Os7JltZYjNSMzZiRRg
         KE7nf+DORhH29MzYxHJzZK4oYSkLQApAahE6POji9EDtIcTJasop++U4T2s2l94MA3Vj
         EI9Iol59MgjbTwgR1pfeT9pUIE6AY9f5Ic/04eYyKJ7NgRFOonwIbWNZNwRv8QELfzLQ
         z08s1/IRP/Z6Y5BQ0PpvEjEkcRns7KeXVpSijXYZrJ67umZSpxKCckJ3KRIVPkcBfgBL
         UQcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZynrUnakey4tNAOZS6juRPyBsvFBGUIe5j69qGL01duymGwboyqZlvdjjBe57OLLYPIDAyKvdzEoeti4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPE/cc0vWlZ4woS6/pEsjxS8Uai9IM/6o/IBx7u3Y5QnSDzSBn
	2zLmmqJUZd/JaSWC2011PDCYJ6Du7UhSUPY686B1saY5QFfLw9KdE7yc
X-Gm-Gg: AYBFou3kgvMiOX47by20qj5YqaCu+7FXaGLx/WuMbBnVPP+8QjX+FWF7+ISqANoTZp8
	K0BZF9H6U2rNWkW7ef2qJ5rOpsUAraeeWNRYT8nstGEzivsmfo36vyUmQfJA4y+9Y3pN0ytNjJe
	xW5s06QhdbkRVWgbSxhWm/uJZ7efKtyIF5PuLdpyrVkN+fpZOryqVFt7xPiLaYH/uAvBjB+npFs
	DIUogJhkaDNrhSPfSiCS/u+ygpOJfzn9IDgJREBwlP546ubb3cZx5lSFlvh4eEIqmEkOiT2T4yq
	JRqN+Q2nIJmAU3UN66XYHZz43qLp3fHrHxx448pE08qsaSklhlQ1hESEFifM8uziMqPa5S0osBb
	nzh3vVtA2N/LEIHmMgwXNvyggldyBot2rh/CQxwhRu6rdou9DzTsJ+dpB1dvAYFpy7veiO699Ob
	ysKQvoFaWh2TWmSfQcEJxTFjHWfh4h5E+aURNuzQ2hHZu9K7vwTjPVpwQdTRfhIQbfEGjqU2yp9
	JSKyYIb8YWx0pu7Urdc8Zndw1h68b4Vn7pB5kBQBXQwWzTXqxpt
X-Received: by 2002:a17:90a:dfcb:b0:3ab:d45c:59da with SMTP id 98e67ed59e1d1-3ad86f717fcmr4333012a91.40.1792680791935;
        Thu, 22 Oct 2026 07:53:11 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm4767829a91.2.2026.10.22.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:53:11 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 2/3] ALSA: opl3: Clear voice channels before freeing their sets
Date: Thu, 22 Oct 2026 22:52:54 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-2@gmail.com>
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

Clear channel pointers, delayed-note flags and voice state under
voice_lock before each port frees its set. This also excludes a timer
or pitch update already using a voice. Both private_free callbacks must
do the cleanup because an in-flight OSS event can refill the shared
voice array after the native port has been drained and freed. That event
can only reference its own still-live set; the OSS callback's final
cleanup retires that reference before freeing it as well.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/drivers/opl3/opl3_oss.c   |  1 +
 sound/drivers/opl3/opl3_seq.c   | 13 +++++++++++++
 sound/drivers/opl3/opl3_voice.h |  1 +
 3 files changed, 15 insertions(+)

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
index 2bacefc3201d..f711139c5067 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -148,10 +148,23 @@ static int snd_opl3_synth_event_input(struct snd_seq_event * ev, int direct,
 
 /* ------------------------------ */
 
+void snd_opl3_clear_voices(struct snd_opl3 *opl3)
+{
+	int i;
+
+	guard(spinlock_irqsave)(&opl3->voice_lock);
+	for (i = 0; i < MAX_OPL3_VOICES; i++) {
+		opl3->voices[i].chan = NULL;
+		opl3->voices[i].note_off_check = 0;
+		opl3->voices[i].state = SNDRV_OPL3_ST_OFF;
+	}
+}
+
 static void snd_opl3_synth_free_port(void *private_data)
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


