Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464697;
	b=qkhtxmJMswxoDQzOYdeu+/STlh4/9aozYKELSoZ+O8psFCJ0JrOnmD5FdyaCX5Emhmt4
	 YVv7HYjHz6fTFY69lRK+cka1jXHiw/mbFc6a1MS7nbdf/saBrkLIo/A1VJEso4GrLmViS
	 gvpOYEDHGw0KVkrfdaeCVp3VEQ5tD6FU5vC9GhAiGKe6cWhIvyNmQbjUsMZXnPCYmsSvv
	 UVqnf0JtnROc3bIwMnF74oC8jTMzGMF54vLfZxy208PItMlGTPKMQdvdn07m4Qo4Sr4tV
	 qGP2OmyCtJcHQzMlyHeVKCVMs/vX+iTEvwXZIslqVYa/K6zk198OFN0Z+BCyGjEFGig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=2+lEKM1A05HA32u0w+MbCnOG4e1WGUzOCKpVFeFQ5yfw0w99wECuzaFfjrAgmsb4JUfo
	 00ky9kose1/v3iUUbFZYjUDII5wweQY6btX8MFaPZfliPwqSAfDIK/ZMeeGpwD1twN/V3
	 9hYBeq1XOOmGzbxMpxRkqQ2NyysQ/aBd34+JXO5iET6prZVtJMQ0Bb1/jb38hgz16YZb0
	 G5d3r1to1qDzKN460cBOknYzA9gpy1lHshGHjJkilXAf7noNKm8rSMLRfsYI7hGm9XmVa
	 oWB7i/qB5oC4Ii4buASHmhcaqmQFlTN0vsTK+dCARA94EczcwdB4KxpJPwgpdyGCLPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR8ckgRV;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA798606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA798606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR8ckgRV
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9eb579c0eso21923715ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464696; x=1795069496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=TR8ckgRVmKh2zAdNhJOq28GIP/TT+y0Qxh5sVo6OGEV8ZmX/hV5FazpxkoqGgfsUAa
         XbYx/75DCDTL6cFz4S9XLOM249xvT9a1PyJCYjnSmaPbfv5OG3zCRsftGeuVzoaEAzuW
         Mo37Z6xuk1P9gU6wEgZMb1hQ0H4tZ8QefmMcwyHc2Pfha8jfdJkYIdAd2eXpCca442be
         Hugv4wclFzUmD/Cs9elZQbdbMEuAK00dtXGMXuzTHjBjcJtZKXChYplYb34GxwKzzkGc
         x+mj6w1WcasJvvkDxL8/k65zpgGvCWsDB+C0ijyEO4N7Oly0m6k+T6n8YIXB/WDm2ccr
         rc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464696; x=1795069496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=Nzcl1aulC1mEaHZ+F3koh+QspzuDd6VHDVtXcvV7pvyfOsL/S8E+A5LaLQntxrC1xQ
         oQCPIqGW8h+G/qH8kySEgJKS14W5jm/LNXOhtvVaidfFfPQ++FTcdASPpSu2N1dw3ZRr
         aIb0C9yf2aWm6RWLP+b6EoykIHf6aXEjmLi0sah0vd/Z5/sJu1FH4VBT0gR5BenJm/7L
         C5UqyTgfvmydVNNl2ZQZzoC6LBgAsb8DMidPnSpaCL5e/X6voxSfQFWzXpeFU6Ydi+co
         Anks5GZ5Mm1eHQPCYRDdyEIodjYQQ+zq+dete9Brb+vpUehMjrGMn0nSPJfOw+PGboUQ
         sJuQ==
X-Forwarded-Encrypted: i=1; AL+hErH5c7QikV3LjTzTACByJIhwkT43w8guVp7lCxSnbwP6QdpKXJOmFf6Yw2U+sq5svKszfEwYgpscMTC4SwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xRKkm6TuCXpqk6ZJ7903RrefyqqkdO36z9v73YkrZMh1YItr7
	/yQvpgruet6+3uLaed1FzJf/95AnwqsGbL2+RQ3Tec7vKpIpJd8gj+cT
X-Gm-Gg: AYBFou0PNK4YXUEKRHzIiaMsWyYyN7eVa0uqqbv3OTiXrC2VqXxV78aKuFjCIqyFZnL
	JU9eEY5APZZPn7uDRjJXKzcUuBsfmvrPuEvmdd56pUHwREIYo/1BBQGXmDSedncwtZAid02BXTS
	xeQUz48JZ/AyO8oc3pn6MHfyTkyHBJPkeU3ugP9Zrig0R4/zEAwrzVFXacL9XEJi9BRG7aZ+Ng9
	Vj+wRyY8UYezN7ZxaQyj5womzjwc1lmnvhQBm0afTrp5frPvAmNJUAGry8cSxIGvoo2BbPxmumC
	uo6p+HFM6CYVWiqvvlb9T3Tup/skSeW5S0g4/UgCHSWy8i3tCtg+1eI4wGbgrRUZCou47+5XxCA
	Srm0mX5eiVa2lqwENsRHga4zC+zESevfgp3GynJshKfQUJ8Y0O2bAxxjheErQmcE21TQnUZf9jL
	H7hI7apulNM5Rm6MtTe7fMulSGm85fHmba4ENki25hDSiira4JYy1p/tV49Wl/jIo/rPFMZZ237
	oGPccygFuDTBLSq+ji8/mJohrHmoquY7PYvSbnvPLeCFgVLI30oHLXGhKBsy+mOFL0yMre+TSQD
	NigKJSIdo4eFg1zGLciuuc2fxIkOAkEeau3IIHK/or6gnpdL2P3qmKIhRitOnFj5blxDZ5T+Hdv
	1wS0Qq+EW1Om16AwLQ6JtjNpoXqd2wGJKjh6CWyDxHbJkguQ=
X-Received: by 2002:a17:903:1a8c:b0:2ed:a8bc:6d48 with SMTP id d9443c01a7336-2edd7a86c7amr46594825ad.43.1794464696003;
        Wed, 11 Nov 2026 22:24:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.24.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:24:55 -0800 (PST)
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
Subject: [PATCH v30 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 15:24:30 +0900
Message-ID: <20261112062446.159-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
staged-capture policy sampling.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/core/oss/pcm_oss.c |    2 +-
 sound/core/pcm.c         |    3 ++-
 sound/core/pcm_native.c  |    5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2958,7 +2958,7 @@
 	       runtime->oss.mmap_bytes);
 #endif
 	/* In mmap mode we never stop */
-	runtime->stop_threshold = runtime->boundary;
+	WRITE_ONCE(runtime->stop_threshold, runtime->boundary);
 
 	return 0;
 }
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -422,7 +422,8 @@
 	snd_iprintf(buffer, "period_step: %u\n", runtime->period_step);
 	snd_iprintf(buffer, "avail_min: %lu\n", runtime->control->avail_min);
 	snd_iprintf(buffer, "start_threshold: %lu\n", runtime->start_threshold);
-	snd_iprintf(buffer, "stop_threshold: %lu\n", runtime->stop_threshold);
+	snd_iprintf(buffer, "stop_threshold: %lu\n",
+		    READ_ONCE(runtime->stop_threshold));
 	snd_iprintf(buffer, "silence_threshold: %lu\n", runtime->silence_threshold);
 	snd_iprintf(buffer, "silence_size: %lu\n", runtime->silence_size);
 	snd_iprintf(buffer, "boundary: %lu\n", runtime->boundary);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -871,7 +871,7 @@
 	runtime->period_step = 1;
 	runtime->control->avail_min = runtime->period_size;
 	runtime->start_threshold = 1;
-	runtime->stop_threshold = runtime->buffer_size;
+	WRITE_ONCE(runtime->stop_threshold, runtime->buffer_size);
 	runtime->silence_threshold = 0;
 	runtime->silence_size = 0;
 	runtime->boundary = runtime->buffer_size;
@@ -1062,7 +1062,8 @@
 		runtime->period_step = params->period_step;
 		runtime->control->avail_min = params->avail_min;
 		runtime->start_threshold = params->start_threshold;
-		runtime->stop_threshold = params->stop_threshold;
+		/* Drivers may sample the stop policy from completion context. */
+		WRITE_ONCE(runtime->stop_threshold, params->stop_threshold);
 		runtime->silence_threshold = params->silence_threshold;
 		runtime->silence_size = params->silence_size;
 		params->boundary = runtime->boundary;
