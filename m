Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252672;
	b=m8wgjXzyeigfYy3zWrNdaSnZL6JarvmDpetkjCcFB0R1m13bJhff733SUCRMQhKSx31M
	 knojCWIxclKyPn04NBSxHBCN8i7kRAdEXbMB8PJhvqqE7SzaiKn1lEJU7L/3lPggsymgz
	 BPjFDYaXIVfG9clPZAhxeQbebQvl2M2bFJF7YIqepWf3FHHltPrLIDRf3GxV7Zym2Tua+
	 qdM0FZsWQrh0q/mh278rA+fdgQ/zPTHtI3UzoKVg8tNBqPpjICmS9yc1K4EfxNl71cQxF
	 +DmKmXkQZH5oHTvHbexXBKD7BS7eKb+uMNjSDEU/VGi2l4ztvdQHiZP5R6aXIKebH9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1CqVlBSvwYPpTYL33mCW1+ANjaMpjIs5jzRD0wJXE90=;
	b=YshwdVPElBIEkcoKw6abql8AZ7HxgUNGBmXy0z9arx0j07y+VcWWBm/wR5n11Xmo6BF8
	 +botpDDZFfXmYqz85YDtjTpIUGfw1EWSi0c6UN93Nm4DQyfp+xXx1+HeKdYeZFSpVnorR
	 jXemaKa2/P3TQtQIFYT4lyWWHo+Uufp85xno8OsbZ+LHjV43veTKKNO8D8WEKrvBgFN0c
	 X/5+gVyNzt1RMR1s5bD9oa/tCJVvV9mujE3zUEyVBGs7F/DuRSq+UQHFfJPNciAUbU8wZ
	 A7w06LrEl1fjq2mKUADmjjNkHowQAo1wYZqgoDxaiu0im8ooihh3pNcUrH2AeucUnpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h++Z4L5T;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EBE606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EBE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h++Z4L5T
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so939377a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252672; x=1793857472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CqVlBSvwYPpTYL33mCW1+ANjaMpjIs5jzRD0wJXE90=;
        b=h++Z4L5TTcsGx7eTj1KcAyXeC3kBONYMwk6Szxknge1HwE4yiWmmcpT47uBUXVwDIr
         M2wmP3XnFHB8IpO4k0ql/PSfaxq7UkQlEsb9Hxw0ANBavFSdyYjHL6cDdlvc2HDssTCP
         hPPM4JcUpjsUMb1Wm2tXnbH0yeVmnxKnSpAu3p/EojrfEiXNPuMG4RCGhoQjxoRUCNLP
         Z29i/uJ/QXHfYizyvK6VvgricLlxGzuUwShIahB73XfnWjgSzaSK08kw9EE4nlJckbgA
         YUZ5CPMrl+MUUAcpJVbvqLwBD1DHKF5NVEtq9tE+TuvuBXfpSFfDMa7GVh5b+Xh/DJrt
         La1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252672; x=1793857472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CqVlBSvwYPpTYL33mCW1+ANjaMpjIs5jzRD0wJXE90=;
        b=y4u0S2W56jPyvoyr/guKQxoiTPMA7QUwR/vqgcP5XuB53u+ePN+pML+dVNVxI4Ci1B
         SQngKjrvDV1aenIdq/ggRsZ/NfN36HGWC9BQcVoxTBeGqU6PA1Qkh+aueUplMCKSu/MB
         bsrXAMKA0+gXP2afwmyst9Gx/nXyJayTehClaOm+VtU61HqJQKMyXr7orpQVp97aaBVc
         MtHsJAUM1VnUGFOliRQkrvmpxS7a9FpnA6XYzp6rD9Cn30zMJUODEZqSjlh2EHH3QraA
         GWB/lXplb8d+cD/T81qhSDuDZn6T7EVZc9V0zBt4zhk+zCgIC1Pd/stkkl0J5Wgx+Ekv
         k51g==
X-Forwarded-Encrypted: i=1; AKwUvBxLgbWgEY5RNvBUz5tn/BN8dJQWS7Txu1x8eypg0tYyJ5ISqYhUyVj/46M/790qHK5IldJbnGQ4xtW/1co=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8m9XpQ3c95pBcCJ61uA7BpF2fNumQoEAv9cmNsKo2hbkzr2Im
	Dmey0KisQ03Iee2wZgjFuqnwUF/Ia9/e8P0cjdbeYVLUW4P4lw6E1w4/
X-Gm-Gg: AYBFou3zpZO9Ps8HyU850rOGWOtJDWiL/cGrJX2W0Rm9uH+rXp92qsGakl6pTvQzyVk
	tU5R3Yjuik16Qygbvk22bbqQu7q9Dsrs4zuxCs0xgKQ2N0i/MmB19wGdr1ooRWMkiLT1MQrzn+G
	qhSjiukaoxfBQ3QRTO0VNpAXJ03qKnRFzp20Jsog4ji9Kf5foKEtSq41QtkQz8agNBuni2A+L4E
	obTQoHAfmi773sGTCO7xkwgfO2b3lvs9zG3MqdCAXUHA5ckzEXI0Z9HhLvwaiDOQPi5qMnRVPVX
	zpL/tmGYN2HiipsTXvNCSI6cNcrbT/qIUNnbEytxxzdQ09UYpEmWMYjERIJPX5Uq+Uwu18xSrkv
	pfFM0JMyzMnwg28TAqPKGG6h/tgQfsOb6VHXBLAIYDMx304zETTMzVnMtgcj4/pzYn5UOkAl0BB
	LrTBhyfNtTbXa+CYxNupqUYsbdLx0Jy461K1Kkf8TXfldl5cUTgKcd+zM12k1PR0Zto8hlZhPGs
	IRSpfGyEKfXNnDUoQ2BpS0sxXXW8qoknefNjIo445Fauewn3bXWGiowCGJwD8ECqsUQCsx70/Hj
	3B4QGVxkaBPShGzq0n9plP1K5cYk74mt8v8z+9UmzQJKXoEcymUwRZxDIFlHlPS+35mIvzGw58N
	4lW6KLNnh0pc2oHgUyGn/+tQyFyeIktugrvhkKnZaWio4zn0=
X-Received: by 2002:a17:90b:4c81:b0:3ac:9a03:20bb with SMTP id 98e67ed59e1d1-3ae57f9b35emr3665083a91.18.1793252671816;
        Wed, 28 Oct 2026 22:44:31 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:31 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v8 08/14] ALSA: pcm: stop paused streams before synchronizing teardown
Date: Thu, 29 Oct 2026 14:43:48 +0900
Message-ID: <20261029054354.2931-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

A paused stream can retain outstanding driver requests. Moving it out of
PAUSED without the STOP trigger leaves device state paused, and skipping
stop_operating prevents the following sync_stop from cleaning it up.

Run the existing STOP and stop_operating path for PAUSED as well as
running streams. This replaces the earlier v7 proposal which only marked
stop_operating. Drivers now receive STOP when a paused stream is dropped
or stopped by an error. The change affects all PCM drivers.

Playback pause/drop/prepare/write and capture lifecycle tests exercise the
change. Physical drivers beyond virtio-snd still need review and testing.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1607,7 +1607,8 @@
 			   snd_pcm_state_t state)
 {
 	if (substream->runtime->trigger_master == substream &&
-	    snd_pcm_running(substream)) {
+	    (snd_pcm_running(substream) ||
+	     substream->runtime->state == SNDRV_PCM_STATE_PAUSED)) {
 		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP);
 		substream->runtime->stop_operating = true;
 	}
