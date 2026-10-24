Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792860603;
	b=MdsT/Uso5Ppz7+VBYEssoJI4wN4Te5bRO2Yvz4ynUpXmp3bxk3oAZwkFUMmD21HwjaB9
	 XIROZUfQe8EzUaP13NGMpNXq4RPeGN/fpPNm9XwHnfjKNxDmd2hmc8KlckklxvvwUZLsj
	 zfjyYx+KlpGPadso7CK8a2eu+k+ok0wdMuBMOec53vV88Doy+5BijPTETEIkrPVs3RIHQ
	 WwNY+tOTCn3B4lrYXK3qMgdNG7HwifVDlbTmA5Ip0I0E1acPhhm2RiCc6Cn3a48wo893z
	 v9tzCCBtnKoVet4v+HmDGtunpE2UBo2C5R8RCZi74f0olU1Um7HB7SCVu3m+9AV+9gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792860603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
	b=eaj3Ei54bDSjtwbapbE6sc6Y+nhojiim9BiFx1E5SL3ogXcwnSqBUg65nfJCsVwXeraP
	 XrUoqiGEXgUMEdjtSqtq2olyoHfEvXMH9Q92L2bO4kHJ7TvnVy274F70G5rNnc04DyY1p
	 Yr0Il8MiaVLwcQCNKYyJg1WzIbhp8VOoPAtIz+9awMIWDZH+Nav9nOopY1sWBgwMhj5A+
	 KOMqft/ZfcbyPKSRCqDvJIxo0aEhBHPh9/LcQ2Kd+FjMGtBsSrpCbAIUuGGrZoJmzylz8
	 IpYIyFTWNtHUILaJhhWhU30G8bG8jXVXHLbaHMKadWmQMOYmWvMY6m2sv8fRVqAEjQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GCxts6NI;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB16C606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB16C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GCxts6NI
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1299236a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792860602; x=1793465402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
        b=GCxts6NIssk3Bvl/vgqAdT+sii2KOLbdMtx5vBmdg1qBMSwmEzn7HgKd78JvZWMH7G
         xWUy+dsukPRRvEYux5LFPBkIb3x3D0FNPgPVZdCnbyO6rRDa4BPvFkKVfPzj3P2frdH4
         muxAg3SCAga5aJNBOJxcHMWqKEklsdAQItNImQaB4zfPPheN/s4R0ECO7hKpejjKOmZq
         TPCZBjI3JjufwsQNDLrxWnfREn8vyTjk0jOlUhGiSll0o9W1lGiTosdaOFpSDuHG0cfm
         wJZDwsD2obLjEpXEMm355N+j1OZOQjGoadIlF2YvU1CDWBIOsCCCByC4J8TI4Rb5lqSJ
         6Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792860602; x=1793465402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
        b=q+K95FxlqZR079PXEb7xED+8zS+6gvwxhOrrh+KUsfvV4stfu8mB2NvjqGeP7BUzQ4
         ECFAey90WtFVsgEbEvDGdUzg5g1qqg9YUqP6apWPtpnJmHElfUk6PmUwZiYBEyleqRfo
         DyRe9RaQ5Z2jeWb403eyBuqT+z0Hq6Y9UpPI284tngSkrdM+bcxxueXEtJ1tEOjNMlGf
         waNcjWG687Ysu7D5Bj890sOoM4fM+gIF8rVkcD/E5Cm3wCFDWTz4bQlSPfeeklPzztyx
         ZPp2/VIs22NxnDCtczrGgALI7SNyaN88ir+eti7QK7yECO1Rf7VRivACgJpztRzkIT7J
         caFQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/mGNiSn/7nZIHaC09TtRo9QJF5e74uNyEIleeUMVKdPstIEtdBQG08m2bh2rfrK1g+tH20pQIxzYCiOw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrxshBAlYol0tZtcHSoowjcR0ZZWqcmHMxp96lMnzAXRBb2SBI
	4Qp0OZ0EEBV/kMv3QxeoIUQbw0p0qWNpcSEF0oCz38VRyf7svjy+zA+u
X-Gm-Gg: AYBFou3LGQe0o0xIq5gTa10jsbQQ8URm51tLtmXc1FLQJQ9BhJobb0qZNCSh09PuX11
	pUC3+YeMjPuR52FyOStwrcjiQYD/2NhM7zkix4RRq4QydGcyfW/3/KezyQ7QmiaItNGJFgtWVkW
	ULk8/1NSeZCzh8FqJYW4BkN3+F6R4KhHk4ShwqejvfcVViSczq3ZfAzOH0fyewPRyzQscNRVugX
	Wwl97VgpVuMGvEpQfzLoLjuIFA2ELsMeMeYKpVfL7ROtPgjWv5IndbkG1R2BDiVVgwbCbyqhOEO
	wtRgKO7/y+eih3N+Uiec4+o/2njyMhUyA7+p6KlXyM+4+GgnHo2hAtYYR4Her/KgYo/4NcqUzXi
	o5M1wBMlQbJviLF0MCDnjct8dBWYU7FmbTl1JLcJTdIOMudAVq8F4u9AQgggcUReeZ5x19vO72H
	l80ZmAmq8Sgk8ARH4E0u5FNi5F2G/0j+Rj1UX7L2kLjyfDF2v6+htYO3PrimKG2BTDOxBf1tm20
	vnFwk0C+vH1J1DmLJGMGza29rzLueUW3AJdM4Tx+XldnRpudJQ=
X-Received: by 2002:a17:90a:e705:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3adeafa85b6mr2034413a91.23.1792860602000;
        Sat, 24 Oct 2026 09:50:02 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm3406683a91.12.2026.10.24.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:50:01 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 1/3] ALSA: opl3: Initialize the timer before publishing a sequencer port
Date: Sun, 25 Oct 2026 00:49:49 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-0@gmail.com>
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


