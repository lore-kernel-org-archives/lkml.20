Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823457;
	b=s6t21xbLXC3lTSVR77SJQ1bT0J6gwJ1kdUwoX23gaw0JV2gljc9bxgHOSQdECjO0oiPD
	 CwT/satnSb0GekNaxIxwf2fj8DQyNpW7pei7yrwezGlK/HvuNcewDZouC+wHZrLgzfuN+
	 Ugz48PbyK6riXrcj076l80AUGwwyipHThQtDh56gk/nXTzKENs0493rZVmuoe0kXD+/+x
	 idLxdrQLDGk4/xoFtaQVg4zWjfuW7aYMkfAzJHKjCavNBDZu57ETv2yj2vRDT3XkYRQKJ
	 HptfSSEXWfnSQtnWDlbxY26Lv0X/Blu87Wrmy9mwcMmWA39BdbWwBql2BJoHTKFyrPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
	b=bE6VegW7GEvg4hckLpGGjxjXrxYv4rRRE0+SrtNkxPkIxvW4Zw5BpWQ8UyXZz7CKKvIM
	 w0T++uUevPSwUclYpapn5wbosJ5fq0cmJua3cyciMnPD82SF0v96SS/SgIO3tPnbsWA23
	 +TjEheG0yyf8B14zkKv3j2Zqt1DH4+uVSWjNuM8DmQ43n7h3MXDxMtjcuk3/jQARIayiD
	 xMYwcDP+lcIVAdFAzJduxlaSFAQTARQMzTEiSYADeq8Uden3cw7i9Hxh76Uf3Jk05twxV
	 QOltjjHiQf+dftzPSq7CL+W2HP88wGOVZ2uiZKOtLvZ20gumANF7Tzx1ykgpfF958qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WvTzDzFp;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5813606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5813606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WvTzDzFp
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so838772a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792823456; x=1793428256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
        b=WvTzDzFpwJXxsq73z1oDVR/CZx+PqdwKkp0nA6/X9dnDZyJ22GmjPVxB7pSgJsDDpB
         G28R2HCAbxzYfFj/aP6AH3IrGweRuknoh5sq8Y9/XOSjaEVVbvSf7hEjorUUzKTx7COL
         ZWC6SKp1eq4UH6qUd6uuemlcFzwSt1KWai7l0qMWnKhLuILaErlQyUY6S3+1KqquV4ku
         /c00zuqPbIGKYQJSP8pa6T3XU93RA3Suiocdfq5H9cWerRyzWlDfx7T3UUn+Eo5Djk52
         oNNAq/vHZ5rLQLUZG4NsS2VCTrd0MqSamTLURPTv6kIyMuGs/G5EK9azvh/i/BbXIsAR
         vSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823456; x=1793428256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
        b=Ygv9xHtFPZtUzLPE3RdOOU3d3hnrbVIa65oP7SiDAYfXacKTRRI+tW7Hy/lcS2MBaN
         eRsbyiTKvLMsLiFdavCpNKbmuBb4B452bVvbyKbp/UpmlZ5nTLNwUGaf1s3VHBZEkFPj
         Ihba+fyscbApVlzVGuAvSzinZmFq77OxBKCOu+UFbeCPZg0u5HwDTQaEB3d6rj3OECkv
         ORlQbdevdTrIrTRl28wQ+iqV5yoh/9Eq50XW928r2ATK6wycyB+EgTQGlxEHUq3QhfeN
         Cp8NdDhlJZpTSz5Y5CKNv6jbWAzsqjQE0eNeTY7or0qKNcQKgFYxFsyfyjN45+6ls8dV
         P+SA==
X-Forwarded-Encrypted: i=1; AKwUvByhQY87sgTDfFLn8P3blkc2yzC7KH2IUg8sVDtg7D56EGodVmaq6TuAYsaM64dAlHGDFccRxM+TgksJ7dQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxZIApGFLS2xtKhoVills6d26DZr68SrHkgROo9IuOfDtIm/N+
	fPXuXotibgmLSs9kOOs3/GtQ4OYD3f1aMEhBoAL9yEArOHQS+WJXMROr
X-Gm-Gg: AYBFou3P9kzFAWZmmHLovdF/hH+hxROWQi1zWbms8f9Zk4gHgahMJ4GH6g++bKS99nq
	uNby5S8PAovlSeipeZtLaDVQqRnG97Iow/OPlQWGTt9z2ijpW3LOvdtJuH89lQU8xcP7SYZcWFM
	6v7TCqKV6OFNGaXaZf0ZuDLGtiW5H3+kkE+P19B+xpQoSpiPQSChBc2mDGJLiDlATSYOjp7Opi1
	KdjV2Q/RJJqu4jWqs2KlKr6X1eazvc060nN46Mf8uMoeaTu43OoFeybL4cIIAnPbMHUAVjgGCe7
	a8zgb/L7vy0dHnGKyovK37MOoEW630bKx7GmWukWSYg0jw2jKOqQQXy2GNWZzVAEFKzYLUmWDvQ
	VlJDT0wafz4a9ov9gENlx5r+2QKVO9C4xck1NpyDC+8lf9OJFpTVx19wynZe3+dIwofTfaDf1hz
	UM28p42Zsmikwqhcqifd8TtxhyDzPT3BuuGBJCkZ9YD+zd6PU3fD7mOEKHrSN14Mn3k/HQSqYZT
	zNH9ucZqLoz6m/CV5B5Lf6XlTXhdZlFAt3qD6PcOpjbMKbsEtc=
X-Received: by 2002:a17:90b:3852:b0:3ac:452b:4a63 with SMTP id 98e67ed59e1d1-3adeaface72mr1329537a91.55.1792823456015;
        Fri, 23 Oct 2026 23:30:56 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebad6306sm1248371a91.2.2026.10.23.23.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:30:55 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 1/3] ALSA: opl3: Initialize the timer before publishing a sequencer port
Date: Sat, 24 Oct 2026 14:30:43 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-1@gmail.com>
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


