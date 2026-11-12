Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444435;
	b=plMyNFrqy+SxLwcfnPA2ZzxaZFk5+1XcokPFiAFrniq3zEueS0A6lCRRJv4d8yfmAVPA
	 jlPvmW59sAjpB5Aur1WftCkqnEHQ40jNQzeY57bQeYYdGMQJCogYLlIQkWUEe4/o5MQ60
	 455GeUzUiS16YFPsIa3/C2gxUcLWRbEdVGpmo7h23IngUF9KdlCpguwngG3WknkhIx2lP
	 MjHW9ZKg6Gpnj1FXKBAUHFodDlnZH9A72qaWcenmU65xAYRUPy3ILNlR+Vg3F9wbKdbB5
	 TTb9aXxzZcU41zHx8ep335UAluBym/shsmKe5Ys7WXm/mD+SWlIs3oCxrvCGpDyAnYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=2ndDnQk5s9RMioaxt18ayAbqQQi2Srl1/ewnScqQsXvps3E0fGkB14MPOtBEtQOO2yQG
	 jMhPYwC0U4CgPY6TfiRep56tpi/6VVk0QAAEVoa5SZwqEvPBGo6bhzCPFSPPuB5nNbuA4
	 Xfz0a9VhU1hpY9xZQhOL6WqqLcIkD7JLqdKFg3sX81wlZFYwhKOJIVZw8qZvctMjvA6F4
	 mkClKBoL7gSJxW7tdBmsbQbZdkcYZ3zWbt1BqCAnStDn39w1wD22FgAb4gDagMz5kCC23
	 yNvTw+2jaGDdUvaPhrJtA+6KgFHk+3b2b2HBLD2A9GMDPXA3Syd4+ZQsIw0P9ZZocVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgtNzIk8;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485DB606A8A0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 485DB606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgtNzIk8
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37198ed3727so452868eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444434; x=1795049234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=JgtNzIk8WG/gZnOwdXMzS8FZ2NJ6YLpXjm4JUQ9gD6GntFJ/SiWL1NooVxJRIPepPB
         N5Ver9xlyCHRCutBkk54tDFYxjAh6cBI7Zl0o9e/16kOZQ9Skq3hPqMrFdbpTjs8D23u
         FQHAPNP1HBCdNA2jPBlKZ8jUgUC6CnCQ8SXwrk1wVJuKgfs/YXIuNTEhRnwDpwixf1/Z
         spN5O3mbuRfQH0/btIHNUtkuVBvTAidg52n/YNInY0TpV3592CqxKIpdpW29JVZn2KtM
         6UNxcBpAWBNQFRW7VvgWugtzxz3+xv0Vr0aLDberQ9oyOHkUtaQhuU/DvhRrtCA3YaGp
         QRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444434; x=1795049234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=sl5WiuMlqZzyxL2dcTdxvBU1ZgRZXAdz+cgvanVGWBLQOZ7rITTVbGtm0eGvMONWSI
         /89wlgo7y8dgjpKyF50+VRod+g3z5xZEk6yBY+5NEvvG6p+glUcXctq3M+LY1HMHqLyL
         5Mk5aXt3vITSXhyyvw6MsCPwsK8VroJRL9SbjWYWwAjm+wZL6SH/FU5RM4r7lOqK5ohz
         abfJjdfGITaOuckr9kckInmcjjLkYNGg9rG4yUGfNDR0Wmu6Wo+MHOLp43r5158vh6qX
         ERFvSDwCLLf4O3aRZP6ujDrlc/Q7YHyPLJKiypP8uj59xIWNHRv4ZZQjcLgYssWpQkaG
         4eHA==
X-Forwarded-Encrypted: i=1; AL+hErFornGW7hrDpSY0zYs1/s1uH4pTau/Bmr54HxxG51HFkczoxRqjygg3ZzgyTHIbKFTA3P/vxHKjnL/qXNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H92372oCf5wcMr0ErMtO9T9lcn+OWaUi2G8axifGAJSmYyqMz
	q9P3fILmVCAhsDSxCLZ7cME/NRLPfePXc9TQrKTLnsCa0ImHYpg67o0D
X-Gm-Gg: AYBFou3to/YjlTZv6SDeBDYgzKPL9KJ9C6sIa+VRTbhqxvGtU4SBR6BPk8frGPiiNUv
	XI3Gvkq+akmfxt8fLBrtvoxvpHrAT/MiOOEGu7AHxbOdP+e40VFqpiBfaR0Q4kgXmchauD5m+zk
	7f8awgYPRA2sBh8dQ5bBMNkP+i+fMHBWQKvCZ5feRGe1uGWts5PYD5LLG7ugUk1k/CsVu8tQ+dC
	mrxGeIWTSBHm15eKL4dHG+j033V0J6JECY5m1lGToEQPiN1SHoGf9e1rWymJ0a5FgR5M92J1xCj
	BQ5xQe6xuxRapcz88PegH5CFQ/z7XlNwlj0I1skpB1Pp/rSXR2AghXwIrgd8/M0EQWJsJGPvd5o
	A1bD1U56Se57AGpRHIpd6r5kKYiPeVcuIE4NLm2eOxhSJ1IzOC9DAtAXuPNAtz2BSk4pUsJNhjI
	4KAcjaLfcuemTdgmkZccdPaKwmvs3JTBIZqa4NHdM4YgSBJvc7An59kn/geLMWzzprUhVnpfcnE
	abYlCQRQ3AH7po4wHtS5zD3K3PiB6sL8qbxfTcnnGW6UlDo6xSUwXyN/DzKAAcntpL8tQgmAmhR
	sp8opezJFjwNejTm1PQc68avT84v3WyBPWhrI0xUh5zUlR4DuhnYh3Kj4NRq+ZOyN2+iS2Q/EmW
	1y7xP1w+DjiZeN2zJgDJ81c0blIAkXSpp55vC737NYc/a9MA=
X-Received: by 2002:a05:7022:b0c5:b0:181:6b8:31f1 with SMTP id a92af1059eb24-1b4f5f3475fmr902229c88.10.1794444433999;
        Wed, 11 Nov 2026 16:47:13 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:13 -0800 (PST)
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
Subject: [PATCH v27 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 09:46:48 +0900
Message-ID: <20261112004704.49758-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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
