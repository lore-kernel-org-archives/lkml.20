Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981929;
	b=PYVkzbXeiJdxVk59xFtH/DjxKwEunWduKQZ492kyo7UzCoZ89yTU7pixxw4/VTEcXBNw
	 aqtWpxAEaN+Um24slLztA6C5kU5o1SeH55XbvtBFjV7xyX+q2HA0Z8+RSwPAfIhDH8dqt
	 sEL8PhaOvYfimHoOeVjmSQOp51aMxGUsV664SSSmzgBl4B1e1YW07r2/5iyKbP6qoMQqI
	 1UkMLo3Otv6CGNftVHWtKFKW9cDI7DLEXyVKCuF7RZIdk9Xo8m7Jba2FfjufxWPyJ7bqs
	 d4dBKHhjhvnMcwpIhjtotJ0JNi/gy8JfUmOGvsQvyU2vXFfl1KcuF3ztBwQgtaqQMaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=epggfuNQuYUHF8KDUn9UKTUayIw3VhaeLSTRmCMme7El+M5wR9gtZ69qE737eM9ZuiBp
	 5oirV77kWmZaR83pEW9nsDxlKH+cBSCEb/jurNw+adjm+bwgMvBRgMmWbRJUeEPsCAQxy
	 t9BtubN4++eMJlaSf1ET1L6fnh5uqq3ri4cBsHuSs9QUCIF2VR95PxSAHh2BVwwfZQ6YM
	 0nEyqoa46qY+ZP5+65gbLT8AwbJ9cFh+Ke3oIQxinRlzv/prErhUatuNpQbiMrpGMYmqF
	 Qb+NSp+t0Z2wAOkIIkzhYJASG+S1QLylUcDjM/we9aZZY65J6EYKwYfybLcMqaOxBwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMFFgtsv;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C32606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45C32606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMFFgtsv
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso1897657c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981928; x=1794586728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=ZMFFgtsvkKDyDqvniJJOn5eDH4rdYDFBtMDrtd5ISMmvKFQ6hqu7694rbrkwLgCUlR
         NLN4AJCpIjS52xEmPJ76TEXopfaM9i+vple5wgMYG/NPr4dH9xPSfRnOGvr+OaXNWPTT
         b1X5XKWd6AuW1Qs7y7l6g/CP0kNNUgRF6yxY7VrZ736ixZvHvo0C7BHFTMpaQtaFM559
         B4ZiLjzw8AVMG4o90NmUiGVm0eH4TUT+hEaxMNt8glxFMSmrwLn0RY1f7Q8Ro+JF0BCJ
         cKtN0UPUQ8EF+kO5usk4USxkpPEEvJDH8BbmOG74rJo7RPf5GCkRHIJvD3CjOFZxCI1q
         BGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981928; x=1794586728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=ddv8axrbDoucN1YiyAsx6uVysy1jt3KFBeWYV3rOKdLjjciMHhHCt7uxNEaQMhyuoo
         nuoxAueAG3VS625njz/Wjf7FgBV27v0ysQEcrLm9o0B8PV/9tV3+e8Ivl2hYYcxsEC7n
         2cnD1iQdVqpgHblzPaQWHmjkmFLTSLbiUXNXgazT6D3TY0mJVseH6lQVkhXcDM1WbxFR
         39oC9JMOwI7c3MTFU+eXtMPFupvqPghemQDWYw5MoamNISWApFeH75jiyau7CrTxPUO0
         rmJ9DHnPwEi5Mu7s/U5QQhuXdgrfmjNbeaoI1KjzRwIe/+9jYfDOK5aemTybpPPbFwgy
         eBjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqmUdgqF9KYB+NeIe4+BONZtO3Aix36j13aHDrP6sQ5fIQ/A/1QIPen30vmw5pYy3lNyGHaZ/v1IGKzF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zWZ69cPsKM78x6rxvKo0j+XAdl9zsqzG7GxXRsSNaSDviRlB7
	8iu7xu0iHDLSr1pApFY5J5GJ3l6w3di5y96d20EjBL4koHr6UtodbDsE
X-Gm-Gg: AYBFou15p9Cxj2dTjVM7IqWIcPSpcWQn8NK5jqiZPMpmagZIs8KYNG6bCxcsWfb0f++
	DPkgay9UmRP29BLbjeuMs2vwmV0D1v39NTFtVnAMqYxXDPRMis9zFmH8EYOR1Js33lYs9BYlCCz
	CzSYU3Gd7jeqaIXlAufIDM82TTgRd801/Fj4a01/vnzm+NbLW2ZpsfCt81jQKzdNhRGvUrswJha
	AhVYngdgTVnG/a/J4wPSeEAncRDY7HX9RQ3R2kBv7+N8vbqRVR9b0SMba1lnlURLMK9I/fuaM0/
	ybUKCtY50urI1ca06CTe0dNzqihiVk+joTIsetMPNJqL1FLyw49TmGFCj9RMihMc/TgY95p5Ded
	6Hrs/GMNrpVwQ6pbdktI0ChKHR02P/8eMyzo4GxvW1rhWxpUV6461qpfr992HmUMrRKciBxqHJZ
	K4PhmRfSq0MIUiKuMfhxwGDisMptcZIKULrhDNnMvrr3HoJxncR65xQBLYBlgCjadmnOjQpxfCo
	XOQQ7nii003R9nsEtZuMGQBSdyCmVgalGi7Oan2L5asRHYfNt3PZWr8CMXS9wCaZPYgvBCJ09Xy
	gvr4je59tuV9feAYG2MWxRLrOnJcuCz44aclVuF3gEF9mW6Nk3g2cl2aDnds9INFGoSIgfvDctz
	ctyOudgvAI3lRs8pujWasAb6EIuwI2lzn0zY/1EH7eMa3vQ==
X-Received: by 2002:a05:7022:ea8c:b0:19b:98bc:326f with SMTP id a92af1059eb24-1b25d31f475mr3820669c88.18.1793981926801;
        Fri, 06 Nov 2026 08:18:46 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.18.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:18:46 -0800 (PST)
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
Subject: [PATCH v19 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sat,  7 Nov 2026 01:18:27 +0900
Message-ID: <20261106161838.94308-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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
READ_ONCE policy sampling in patch 9.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.
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
