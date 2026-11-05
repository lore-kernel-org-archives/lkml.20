Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845912;
	b=hayqOBq+ovdj9nh51Ch7pjnoV2ERMJxOZVNPjw44C8vJNM3vRNTOMm3Oy0PQqPOke2CN
	 1bYSqlizTQXNbL0lLRmur4Dxw4IuHzXu5JN7LhRokbt+3S1TSTVzz+0NhnMUV4ujoryCw
	 Ps6D1fWe10APx5XYB8y+u9D+KT1FhQfzi3NKgcTMo4ixZLvhD9vWVamQvjIMe1cgt6XAg
	 jENYXIQKm+RV+ID2EXm021iS3KCQdNoa5zRrtaZLBbJmSroBgcxZuLW/jnelQwRpaXIAo
	 iVdAZLMgJzCpSLvdVvvxI9bfXH9xmDPcfLL5jkFhDg/0Ifu7TNISL0BlSABaZgyPkfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
	b=Pbfo6rKqHQJmoGw1b6BJNfy6I8kVn/rPvckABaFnWdshXsZ+hhFrlIf/TB7bDjiweoF9
	 eZcYUfO4xLQL0K3AE4k8SqD5uaDJb4WdCqMKQLFxG6ahZbC0CG7QyKXoIFbLPkBFJOEsF
	 MVKhPP21PHGYGA4FRuNGKoA+qgb0bgx4MkHOlaH1d5AcZcPj4n67CSj4dSXtB+ken2DoK
	 EOPLAU4qfWVdcw9CLDJr+/k19uLW59ByE6UdWXzlfW1oSncrWUNrnpwA9Rg78Q7Qi6JZ5
	 boq0I0UDY7/1c+Jh9MAkuVjnxBhAo/FbGLOGHDM3npVvCYIdYlv0nRi4M6s+GbI2GLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ERWZzjP/";
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E844606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E844606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ERWZzjP/
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso586729a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845911; x=1794450711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=ERWZzjP/Jgq+vdv/PRd4mYf6G0EIVbYd65eH1Xsd5vkwNTW/SwBNjvM9nRTjZq5xGx
         pNMlhQO8KmtfdU6vuY3zT9PAmamJe4yREYs7MNabfqW3IHknPM/oeb/D/Pcy573qB+xV
         7+39y+aYqlCIAToZ9bjPxA/i3AoOZ6TzQ/aWdY0XH2f9NKv8qUwHYpJFqutcYAuJj7u/
         4S6+d/if2rnINHVd//HZexiH5bWOECeG6xh5fHzoFA42Xpdv19icKnVyllQMbyejOvbY
         SgQ2u96rwzE/FKBgMBsZwBj7SY+yA+hSL1chQ5wkC/+lu703bezXl0//LLyinjn1Vazi
         axZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845911; x=1794450711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=pNOJ9HExLAEBbX6S7oN/WoBLm6k5YxlZ4hr6RI2zd0EWGtRAdutNcOxkV4c0D4fMo7
         rrH0ztlx22ez6oxBCNptR63dVO1acAjRi98rMavDyg+7LEI2T1/cRFwpvBYry17pZ0x/
         LQXvR/VSQIf68poBoyE+H/LEvLBivi8wS6xiX9pKnww1HmaQu1daXQwTLZQR19CSY0kg
         B7BvHu18Wn6KozUXtP0TZPzpLuTnSu3q5zjvqkHlNq2hkwfRDoEljZu/MW3hK82oKoN4
         hXABwRXnl8KXQTvyEn4HfttmZCyaEyAIZoxJVCMdM8Lr8TOCQ0po1JkiphGij8+Oq9+o
         PdPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAVjEh1NIFLLU83SLnXkbFbbzs41vfc2hb0vXRkgA7Ct8REPTQfAkYVdy6dOBAoVXdRBzmrQD6jSMQdoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gUA3jCFk3xDrhaO+i0OZq+WvI5y1jb4CKzJgp9H9aLxkCr+Ry
	BiE3B/m2ow6NW+OltAFVkIKWvP9eii44K5SpeX2d5dQGdsYIBbFX8Kh0
X-Gm-Gg: AYBFou2k9j87kgrjzpetc81OyP8Ni172qooQAfMTi91iNdnkHbKMSbBNFiQd5z016MH
	ew0zY7bXprgnrtPysH2hZ0D+rnfPEy25xViOEgQYMZVx22x/RbvDzd45Zd7w4fpX8Q0X4uboG01
	7GzOaYIrYBluzERBcIU6O1GBoGFN/swAjkk6lsHqahpQSRBXNBpOCcT3aSJZXULQSxG+M9pBkDj
	Cyc1uoch6ObG+CCGs210BXe3h72OjNLJZZGuze+j/1UfWIgiPowLl1tOcvaVpIdy2pgXcok6VPt
	TFQsjaSfTxn1gJu6A2T1RgOJ/EWd+9YhWQCB2uSy/oIRhKlKXAPrjaAApOX6R+oDuAzfjb8PK+w
	lwkRfYoZ5g/KSDxRLnjhBSsgDAAqUiVgjZNA0UlpUsRrXYBPsSwDupb1OomT6FTeKMLqjsUg2Oj
	1fKBik4Z+h8p+0Gucq9umTBmkPN6W07KWjVXvwEdw+TTwU7OXrPmNDNd4G4TcPsE4RIMZDIf4/E
	bANKHgdH1X3BLx/VwmFnTVI0eEcTwDXrRjIhHRafNr7E1xMNH2/Oauq25qHrkMsTMEGyZsE48FZ
	nNmT18s3RQxR0EcpzcNIvqI4GUGszSGidIwuCD+y6O9xNQvzj5b/GXiNle/C+g4ZwFWdAelxrJ4
	z3Q8kxVQQT79FhrAaqPQ1MUD1wejZtm+qNl2nKUrZRQyLqQU=
X-Received: by 2002:a17:90b:3c08:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3ae897a64b7mr15530386a91.52.1793845910857;
        Wed, 04 Nov 2026 18:31:50 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.31.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:31:50 -0800 (PST)
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
Subject: [PATCH v16 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu,  5 Nov 2026 11:31:29 +0900
Message-ID: <20261105023140.18373-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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
