Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365826;
	b=G8gIXhhXHMDLUupiXzLyHNDel4W1U6JU4kDeQXTKzVsO/43BA27DtDK+hQgw8CH2Mf86
	 kaxZ4ly+vztErUDQxMIFAfYhr0KLBxiELUgLIkLSDB8PI6d5b2LSJIGYTQUvWCXbwSpfQ
	 dB/5o5W9mtwXBAw26o4tebvkVjpTrlp+Fs19WlG5pdJfyBtP8/0B/g5nf7PNveBaxkW88
	 CHS6ViYqUgjiDNL2vCL6vHNSP6+S/JzbQ1GwcKnrfF58b4yYbm/d0muRJGKe0CgI3cbMq
	 /fmqLSjZqiC0Yod0g2KJ2Ovep1vfivjGyb9mzor/hru4EeHnIplJN9LnVxskuWr1XIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=Bytc4USBIh0tFlfZ0YF5wHXQZGrX6vKEHqSPro8p+Wzxm4YcFylXaejsMMS6fXmR2rSx
	 dHLjr8ClDzoOHN4B595rEuNnI8saIpm6maCS5E/FhafQbzEYRpXsQRxV3BKtfF4EVBQya
	 jcHfwpjKrzgotnncLLX2AXXG7iQ4M3/K4fOPa4oM0zptB0kdqVC/eru4A6EUpVJW5Vp1N
	 tnvc5ppexBV93+e8JkxUCOK6pdvo23QxRPPbff9eJgACnKP9hWOR9scYO5ePg4D5zoYv9
	 UZKVBEZ/Qdd4qT7RkQ3VtJ7jdSjbxpQ420EesBURAo5dJLQS9aVsDkA6ZvS55r8s+wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tchQIMAm;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D399606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D399606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tchQIMAm
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a315ed211so3047813eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365825; x=1794970625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=tchQIMAm3N4Z3rdEQUCbuUavaoAyHFkR2GxapDzoH7BNdBGZJjD360Weti8lLBEO+6
         JAlwsKExOa4JUgkCg6hjgV4Gl2Wm7WE/pjhKXK3ziDxnOIq0WTqSl1mubFhakgw55Z5f
         MAPgM5wHkxv++Cuw0x4AJN3Ar9aBo7xD6F8q+rO7Tw52YT3yIv8OzP8hIrBcffAwwyel
         f+t2h7tzvLuVaV8VsJx4XWAOsZUqGT409sNLU7CkzWM7p/kK6i256eElLd7uy0pEE73q
         xARHNw/aJb7krlxFbR9Xou1NCj+FmeOu3RqNrZdO1LFCL/czHDs8tJAkJODiRN1/bPVA
         hdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365825; x=1794970625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=kgJdkKggZyRHHHjr1XfV0O5fYjglhB+DvdB3ZAM7W4K/yirEPORMfIe5IJ94RsruLf
         XUk9z3iIwGGfQb26MGRQWkhu/FCZwCXhG8umNhxXFywSyZ9USU2BS7M8yNz9AIMvsuS/
         gsZpxKHHlBMb1r7GveLmxVGhRhvfbulv/7yPe6ioGBqhdV9Gw1KQAjaoze/CAUf5yNSv
         3Rxbiqwg5rSN/XjQCp2l5OOllxQqmICf3LxPSAz3kHbP4SorICdEu7SS2PRYRADZLQ04
         AHdw7aRtGQSuJHWf/la3Ef4euhDoMpZjtYWzEE2Lv79bQlLCOVDlCM3YQIwRLwcxK874
         2+yQ==
X-Forwarded-Encrypted: i=1; AL+hErHOh9cOkBUJFWLBLcL2WrnmM2LxzxFj2BcRMPOno1tqRsdzsO2ni5gC5ksU4skRzNxQnaSl0DLY2K7bYBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/84QE7jSH14+KdHQKWxKRHsuWe73Vr9ombwZP5msDtGOR2zkRa
	cih8J8RlMAWwhoAkzzfTZadEuGxIbEkuul9SIzExpg9ABYpwKXD4vtNi
X-Gm-Gg: AYBFou331tqUx4kccC26+KkJTgTNt1LwKC3N7oJPYe6qn10u1Lt1F5RTQ5DZBZAP/g7
	y8FKTKS+PgzLyQQ2Kureym2rbwvyfjiJXM0pFGe9Jo+aKBNEAQchUGb6yMDucYWOF19kHUefbR3
	9yNSOYblY2Ah/oCyol6c7RGK1FMC71NffeXY2s6G6NHKCtcnO/CfEChy9H9ODv37uUMoCkjTTif
	TzxjMWlBHPjNFztYydZFJ+vq2hzeUrHK4NaykemOn6V8mRy6TcwNvZYXrTm4ahxkmQpLEjwoNfP
	34qjawEC95N/YNkppqzjIZyeuRUThLI4p/WqtAZ+kW8vN7QwXDeGThPH7Kq7RIW6gMkUjyKjPBa
	4+saqp0dr3Dgb8st5fwOuFnhIaI7+C8OUOMezJ4zmbJYmu2VTLP7Ljx+vu5dqF3YCZvtQUU16CG
	i9ADoVf/kiVopD6lD1sff3whbd9Y93rt4AVMy7DyF3eQeOnkzN/Brd14XoG0pu8aN/x103zWYOO
	/PNNZGuxcdr9lFu+zdwZlnMLXmwiMbyakWNKu5vxXKveYwxU3v+T9AseamvyjoH+nuVfAXwig3H
	jKyqiHiMaCILLUYazzFukAXXG2O4LO1dIxVVP3wjAsBmnfbwmw+hTl5uGQCJruPgwh9lzsGvDK5
	ZrLYdA7z8Nk90zJbGcHRrD3R8Aw08PfAtfSU874v6cCZWn24=
X-Received: by 2002:a05:7300:560d:b0:361:a195:c46e with SMTP id 5a478bee46e88-3766763b79emr1918799eec.1.1794365825118;
        Tue, 10 Nov 2026 18:57:05 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:04 -0800 (PST)
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
Subject: [PATCH v25 01/16] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 11 Nov 2026 11:56:40 +0900
Message-ID: <20261111025655.63951-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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
