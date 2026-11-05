Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837371;
	b=Ved6cpd5HmYzUPbWdo+vuCgU4dHpORAe0AAnh9rpjnRpg3Ze/4mpvJmzcXgL4t2OojqD
	 0pQ4AW7MRV93y3JKuuwWsvcdSzBT4JW4BE1FQS8SlhxYErUXbnk+nMx53bUVcrgt1xvZe
	 GPJOUEX3C2RVKTjVJe/jrlEmGFtrwZWuSnF2+1b2n4n+fJKe+lCbmH1vKg6szM4QQ1DIK
	 tSyU8B7fyZiJ64ve0kCJ082IdrIQ5inYy0JjzHYvDsm0oE2M6rt5e7kSCW/rdjHzowxyj
	 ljpWs5EKslHgDbsjgxA5Cu95LvjO99dAdXmknr5Byg9qDM5sN5+8/U9cUa1FZd9HVRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
	b=qdfUnx7jBMkDhUeigkjo5We51kVLBNToK75br9kubYKeG+0IO1a+QAgYXbrfd4KVJuJp
	 paOPCH5FoGiMj2pB2NzDooH6QNYZ42vF1B5f50YpDcSE6hm2Zno5dQV27av8RNpmXB+QO
	 uZJ1OqEfl8xLoZYvWpFkEOnICxV0UtwV6PewtndQ0mauuczoYVOeKfhcXGVIC83UrNOFp
	 F0Ek8cDFOLeTwbS+uI8w8wWNtgmQtk1+MY6Izw4nkt2RYW1pTVJAN4Zij8c2CEZVnjD5d
	 vkARwkPiGIYuu59ihOlbiU8IUl+nLo8fhQSMr5NEecyMZHGx+eEPC/DCeOtEyeSK3dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jl6OFb5z;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41C7606D834
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C41C7606D834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jl6OFb5z
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ccca948203aso575985a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837370; x=1794442170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
        b=jl6OFb5zBydNsD/tNT6jBv/GBZ8ZMQye/xJcvyH0okOw+yu4OewG++lPVsQbbNLf+u
         iEogngGvmBSPwP6LOTrM7lwcICdBjt9aFHG1vQ9UZk7ST5SO6mG8uV4rTLqJx2wEQ2Jl
         DVvTBWL2S9SX9IY51lDkUD5bRYNSdVlYpiGvkNSoFAa7uvrmS37L8ayDIKVGwKG6Fiis
         xamH3kbyG01qqnPmyCubvJ+9B4pnknpnd2aajEFigos/0KPc3fPEncS0/xkrAzQHZ7m5
         X6TkBDaLvMDtpvSajhL2y4jq64tLDj5MDlhs2UPMg/GpYIumQTVTIS2F5CAY56VBaPjb
         zPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837370; x=1794442170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
        b=wmSRNd46cmbUjI36ofzMdTZeXBZ8M1ONscpaKEOZpQW9mzkMUsmz/3e7LY0HcQ+6eo
         OdF0Jjfxi2Y2gFUekjovgNS5pEc/KCWyXBfpF/wDjTXOfEzStAVw960ikdZnm1fIr1kk
         FF848fDPRwRSSpUipoRIvZfKKY3buCsgUX7agHLMjqVjL9zvM6neUeUMgMXBW4tqd2A5
         zdSvhQSo775B9/hSLSw9vRDijVAuAf9ZyxvJvJ24oo0ZW54C5dz1C7jfCAuk0FwbQs/B
         Ae1YUlbq4Nr+6IvH42ycm5/ipE5sTWlGVASsru2PbDSxG0kf/XTNi4wjxbniP7o+BrqQ
         z9Ag==
X-Forwarded-Encrypted: i=1; AKwUvBw+OMJ8/VX6ZiiYWY5Md/6gswYd7C1pvImdfr6oFtLqdsO5QJr5cNRgFtqmgjIJTaDPT0oI6GWMmG6mnTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8HIfyrDFYJwnbeQfezR3dIj3WEEyKOQaGUhMtsRHE+xCBP1kb
	j8vGybGbclZ+peWw0/uZCImrI9/6dldLIOuY1NrpC6MFj7mgT7q+r0Bn
X-Gm-Gg: AYBFou32PCM3ZOfyQpnoWkHKN7di6UcrakhO40sxhHLZuL+W+90QXJXEUQ/4SeGh/eR
	vaWm/0oG95Yp+b+tvN5i5Fw9HUwxuFs4b3cB6QNeOm9BVydV41IL67/aoPXqAGlnnXI2dNXKaX3
	gDgUuR76nHkWObP/10G3Y0X1D4+G/dzxriZqt3waKX1fDGfYadmXah3By1UBOzd6go2QENmYDPX
	BK84dMvs+07+hIW6FiFH1XJvln3ZjGFPcJ5OlUNhbm2F04k9JIL2bl4AenOZTBgOlaQ0yXQ4L4S
	FZlzJXPh2eEU1HEycR/JE9a9eRoDljIZzB/+TB6zCRSEFJW5nmBSMBp++NFKTMbc8F2IALlNAen
	SmXkf5kNK6NCivXZpW/T1Oixu0/ql5NAi/aA43M9n9bQFDjpHRr26XRfsEuF4vEYLpO8mQk2ce+
	PFur6/SNzFzjeExn7QIytsK839n3EgYPKpks4Tzk9girmupqzIxP+AleJw6dH3L7u5O6yBj0TUF
	OIab7gcu0/WKuMpi+2cVLdxijoxP8emue99fbjUM8W+PpAjnlPYQH/n3DMrGVv48DUUQrwiFu5e
	yC3sKnR0I2AHZvQjNyi9/eDB9Q1tV03t9TFTcVhnRWeTnmuqdd+SWJD4wv6P0zxKWTHzgHL/qa9
	1LSLNTOYhexLDluuSTuEBEf+3ZoWTX0twT+wASbGlpo7++n0=
X-Received: by 2002:a17:90a:e187:b0:3ac:77c8:ac29 with SMTP id 98e67ed59e1d1-3ae896f862emr13929601a91.15.1793837369930;
        Wed, 04 Nov 2026 16:09:29 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:28 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v15 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Thu,  5 Nov 2026 09:09:05 +0900
Message-ID: <20261105000915.15177-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring wrap
when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM timer.
The driver must release its pointer and trigger locks before calling it.
Existing period notification callers keep their current behavior.

Atomic and nonatomic synthetic PCM tests reproduced the missing wakeup
and false-wrap alternatives. The new helper delivered 64 final frames and
reported four available frames after delayed partial progress without XRUN.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1919,6 +1919,25 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Unlike
+ * a period notification, this does not imply an elapsed period or tick the PCM
+ * timer. The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream) || !snd_pcm_running(substream))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
