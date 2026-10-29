Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263877;
	b=ig2/g1D4smXIbmc2up/SjVjyawMlA12W6AlrT3wGYEwXLgR2RyNxCb0Q8J+Cn9dByXN4
	 54ZkuMbAdOlBGVkUIzeT+paOkGGt/khdWV2NTytQNL77RSW+wiqrpgR/tGibUmXOEMPHP
	 Dt/J0uNVkSgVxwuyHRpwQWlDhjO76acYqKqisj0rIROIwsKQCM8V8SABLxeQ6N2tdEwog
	 3HtdChIh8NBT0SEiydWH/VzzqsOuiO+gJ6btMKTvG0psf75oH3KbpSKcifwpL0NHpcLpJ
	 MDHccHQbJhMQ2fmrzn7K3eGK9mlBuGDIV71E1j9uHU+JCuR1urozME9IZNuMD6efdaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
	b=5KfYpjZWUEj2cPg4qhNyiPQpFHk6T4Xq6kRve1DX/vMnQSsj0x8HQpkWL7UT9wyYWUL/
	 W/DvBGt+JXfeF95nPfQS4jRgi+CE/+SYkVHN9lJehTE/dKeUJ7mYeDyoYQ1I6QhT57/uQ
	 MUmOcjcx8NuPdzIUg4jEsyGn+i013xG9GKf86ja7wFNqHgZ9RljMI/idXLDUGOKJMXPPx
	 1rXuy2TMri69VWYtpdeMfOCZ26YqhYXhFyksNd2cXaZpp1ewR7YDfR5d2X6Yu3j48TdSG
	 1+k4S87rxcyZ/aaqTDwb218LoM0ts+Yl56QjMY0cp7G/+nMbzgO3LXLYFxs9BZBcBhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9r6GOqv;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA2F606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BA2F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9r6GOqv
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e60f9af6e6so15472665ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263876; x=1793868676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=a9r6GOqvtReidRbizvrwYq5yG2LsJtD1l42uCKo3/jhXYRdPvyaMW/RTS4F3JqPaNU
         Y6TGybNcwPerJdGie+nqXuyKQIM9oikNKYYWjiV4+VuiebMyCoDnAmD/6QfRKzggM/vB
         lyi4nWAU/3gA70Ije/TI4fu+sqL5ptU7plEPlXlF200RFK8hVN2DPBaHg6JZCAVQuCJ+
         CMZAg1hOMRMdU124C9wW5pME2QymvW6BV0O5nzuPkm/i8eJokjfRbaTv1sRZ8f1d261o
         UZH9STY1hyz/P8GTbzJkJCnawpEhJcK64GTtUMWWiLwGPWqs8g3S6bcLRXyvG6yMGwWE
         w3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263876; x=1793868676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=fCdgPUsrJ+IgEsx+kGZuxTDngas6DwJt8xUokTTUhYSLPzGEceumHUNAAOJhXcpEwM
         SR+DumqXtHRSpWcJmZCfOLMUV7Eauf4JjqTU143TIJbhyHDGGxxNfAUONQmGzpgkCLNY
         IevhsgzFaJSFaKHILY7GzbCRld/ibXbDHnpbWP7QjCFvfc8UgwjYo8Y50otnlpD8YxGT
         1sRl5zJOo38HDFUEwFtYS8zcZVU/molsZCztFhExUWtgFOFIKbUZBz9YaOT3AgjFHbVA
         pQJCBnmTjwIop4lktp05dzqAZoOZNVq5RBMF9zfvMRxgiiJgCJsDErh3De9h+GNywP6w
         PWiA==
X-Forwarded-Encrypted: i=1; AKwUvBytiH3ETIPlPiKv1YS/qLS/eLwEm6MzFqR0amQNl72UN2IHpJEyYCVNCpJH9Ec8HUHhMvVe7SbFDspqSb0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQm4RbWw2rW6yLIZq/zUuU2qKpj9cxK/wBlZsIbMoxWSKRhnn1
	avEOqAbsxDk4KrIVVAdTdGMlAYJ3j6nIb4jsDlDb6gUTSHvljWnVdhy0
X-Gm-Gg: AYBFou2i7BruSGe9TUZ/UBkdrQEXXaY7tkXKVyybdE5PiZsdPI3nCwJGD8SH6x6694G
	XKpnqO+7TZMC6AR2b4kFggY7WBsxenUXKBIM8ms7nGzG9YUeqwwQjjq4BJb1yWuMnHfMdkMcqCp
	n/USrrZKt8hF64jfsVRx2b8SMVya1fViodTSIkW2EjzUIlW3ji+UZg/ssWBx/JL4rGKhsSK7j/z
	o+DKphv5sP1fACQjyefWavtIfgNzPbx1rWymGcFjZfFBxSKNvJSpq42rHrhNdcMKDiV0KxGLENJ
	fGh0GFaoJMTAAkrNbMrT3vQ7jBijJdmHRURSRdidw2MSwfw/Y3rwvdpJBsxknkxBUgO+U+9PNoI
	OeWvt9g6xjdLUG34J1/dl/zJUnrcxjbQ/QAdESnM9flzolVCUl0lTwAfWYaOXRSLVL26w676I5E
	n13aGMPLhHlQj8uhO5vy10x+gkIWhUidh60ZLfdpf6G4QSNUoA5rwCII8kA+0DAiGrEiLzOLga3
	ZsyGj7pWWRx/nzJTooe2dFkwNxk+7+vCMD77qbvg3H475KaYzowgRHrxB4uuWS6bt71iONX4txa
	v2SR61jx0tK3+L8M4nLOXltAuqNzkSj5cPGGK4s6peqitTR7seIn/YBMsT9Djgs3pKmkfcKt1GE
	OfoX3aV4vzezeUEdPIb67wq35MKTu9aNZ0sH+LBXB1g==
X-Received: by 2002:a17:903:240d:b0:2e9:3d65:22f1 with SMTP id d9443c01a7336-2eb00519403mr41782825ad.20.1793263876019;
        Thu, 29 Oct 2026 01:51:16 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:15 -0700 (PDT)
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
Subject: [PATCH v9 08/14] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 29 Oct 2026 17:50:26 +0900
Message-ID: <20261029085032.70689-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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
