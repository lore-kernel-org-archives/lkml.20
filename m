Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062071;
	b=GzG+0fIMc9vvkz0opy+lQWEhtWDq87t3pIDV1SleaNme/QgjDVPpW3qRck4GvwRa8pbR
	 SBHpbgRf12QjkrNr+Iv8kosRfzdWJVDDH9Oc51Ft3TeZgKttPu7G1eI8dfeaMlr6+3h7F
	 J4QdvHpq7fwl9NKS7s/o9gEqPQTbg1AMYI/fwnTn4FokLMAvZt9gCnhRMO3XKnXR9hWMG
	 AuAmPHWVu5K7V24KB/9VbmX15QnGpNsjzRd6Z98HiCOTMFKGn966g5eHhhaiJYjTMxjBp
	 VYvzIIlBEFJei1Hev1mrpySakXScTswZjeAxUmdEbozrfqiuqaiZwWUY+aW8ccgpb1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=fd15RzIsgcwvgbXCRtQ6BLVykryuN2PjkTyMoafNGttWEuxDoj5gDUqM16DPYQ4X073X
	 pH1Wi8qOZsZ/f0y9rYhZdd7kJR1U3C8K9wcP1BKgp1oJW8DildT73YlSEkQK6syUuHxz4
	 gQdRHzz9SanoGJqAF5PTG7JmITtn9UVACGj997SbWlkZHIX1hbHoRiaI7ZZYGKIPr3PqK
	 RlwR96hNRjZ+mVgEwGhmzdowVusWllS0AhxXhBaG3pFi4L4bRvZ837oyGl6XG/rUswwwr
	 zb3pUmCulQep9wx6rjij4mTGA4XyDZm+Oh7i/A+S58IsFp0Jige4TtNsD8FK2ZwMgug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uy8hJ+ou;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C5606D803
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860C5606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uy8hJ+ou
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36ff9c9da34so2109536eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062071; x=1794666871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=uy8hJ+ouE33Mb9klB09Dl11PkCB34KQuwLsOOMICYNWvhhXLIA2Kbbq6QiieOCYj7C
         4eguE5aCXm+w74x70kWaWpIeVBkwNq10UIN76NP0MgiclIbRU/2bBeAICVwQZOwKKmPL
         Tta/EUuDSir3csCHLluQyk864Qx4TG534ALWvYfCQI1QQTsftFlF0d5dnD3UXIDOjfNw
         lQSd2SqnfQYxhzY8qAzIODtD3KkcwFz9AInGmWwZT6KiULdQsQP8hL8JuTxY91kJOJYY
         mjWNa24STMk5DLF7gzA3vY8WQftSlF7H4yg7rhU1kg3qlqkOaCT3XaehnSN2b5JDr3/7
         NMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062071; x=1794666871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=lnJ01WSjwwt4eTFPee39XN/9WdalpiQL25bsLFNikUBSacIh5mJqoeR7tFZW68ALzZ
         DYqs45ho1jMP3iKc1ShpDw6NMVB3w6FOGLwTCz+Y6/NRQZ19sFbp/EvjlMRgVuQcf8uu
         6ZtlRTR1HoCpT91uG5CF3B3fb3Y1yCLaKKZgNyyWHFTlYa2L/WJ4BgyRII54euBBVPUI
         s52YoxEpeECeoFbXjTad8mwVNmQtIOjXuxWuG8jqI9dGxLxqsMts/ook/K3o9nuWVFDu
         LKPhI3iv3ASbT8I2jODHLZdo76rtdZ6r7NKgfeqxIDVNyu2WrZkA/DRAFHo6bIVDcVsO
         amJQ==
X-Forwarded-Encrypted: i=1; AL+hErEd38b2ifbO659MTo2lWC6+p/4x6JNcl/9nGmbe7T8+4OA9Bx4IHrlGIL+Y5xYhavVxXJ0o1CXXWLoglkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1+zFAxrwAZE+WGLO9fmec11WQDmtvMDNkbfBo0sVhkRz6wqZo
	M/LuJfZj4h3/4CS3U67ETXTF+Fp4xK7eBaBDauE0ZT0t++h79K9LxHnhu9TRPvgO
X-Gm-Gg: AYBFou2c1qIo4DPTOwG3DWCWLN4SI/YqipY++ECIfl+/9dXhMSKTkahHqL3nhbvj4w+
	shAXhDNojjTB9EG+CtDzS9HHxIy/fVU5S469vboFknuF8EBraIbOEuhVVQP4SYEmtEGN+V3sFYN
	HF8dVY+f7gZzBbx8YVYA3t/FDjMAa/i3Ydyko/Kd7xE9Oh/4eNb6hQirUUcW8+ElYwSIyT6Hf7o
	Ixxen8GOdo76Hgtkjj6es2BomM8PEOC8a77gE3qrAtNDCODLhedtZj6ejgGrv6S5PJyJ6RKI0rz
	fj9xBMQckex5NzhuUEaPiSYktS9iR342vEaIGQP9k9gUx/ONGM9NwHcgPdgsEE/+BFPJ/85si8i
	Lo38hi+OD9ZefxpVPR5HHDZGkOtkaQ7lxNShD+CXRrDCnYLUdCFkJFZXpp/H9NG2otC1BjdTMUb
	aVdIWzcfulNYgXKG6wcqtbHKQpjcAPguI2A2un03v96CUZdLJa1pwTDaoAOByiGbSeq6uXGHbns
	W7UQTN6EOrUSmAI+Nv0H4pCxG2Km7b+LrH6dKt+f2cWL9fIurXvMpNU+Bl7ksy5BlRzdmXh38G9
	2NC1sOH87gpy7ZRYg5awi23vUFwzYVKw5Udiddx1ibDZT8huAw+NdwAWE70DZd7wWPLafiSx8hy
	XTIFJ4UNqmHAFoHA0lUVqPh6laeroTJhhtZu1CQxsnu9mmg==
X-Received: by 2002:a05:7301:d813:b0:36f:6b99:f94d with SMTP id 5a478bee46e88-36f75b1f80cmr6584172eec.20.1794062070524;
        Sat, 07 Nov 2026 06:34:30 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:29 -0800 (PST)
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
Subject: [PATCH v20 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sat,  7 Nov 2026 23:34:11 +0900
Message-ID: <20261107143422.29319-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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
