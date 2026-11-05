Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862539;
	b=gpfrQriTNTcsuEQfVOLhZcWkpyFUY/mMK/Og6WgFtxwYQYoHRelGAuTwJhbgZtycBSV3
	 ja+KvZ0f6ISIngo3P6KMlY7ZLIDFgfzm32fTIkvrmhJTmKYmbI/yT0+XPndXqWTaNPzYw
	 UTqlrkG0MLBaU/OEbXzyEH7K4Wa9+dXcfsPo0/1GRr9TFAfl0VMmStBXmOMCnLbVAHLpR
	 Ia7B6bielK0GuYtf3UjN15Nd3EWgA02ybRPq4inf84CJ7FmCcRPAfioBJbfD7G9p4CjJF
	 2ugAmZkzdloALfkrbUbeG2Eki0OX87y+y+uFtoKE5Gf4Swl6Gmai2bHqQMYTahxoDyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=Cr+rYiFpQezyCCdz5oVIbctFX065ej/0x60lvqo1Cvi1mznYGDVHYNQIReTDL4BHm9YX
	 cgYirOWC+q620hyUJCuSuk6bjQrkNGAw3vzjrIUcTEB+iVZcmJgrE4ZJl47ydVsI86pYK
	 VBgvaJdQKtTxAv+HEjHDhjlcJARKGG3n78c4T+bRCusd6qWg3CDkBxF5TYepaC4dEwGIw
	 PaHnoQjRf6o8djkEyz8wM1sDRaHJ7KtLu9GoPcV4zYp8SrJxCKEpfx9wxNgCCmjYxvdID
	 UJItsbthTYnU/P2gy8mJ0Y4aepK8XVRMsasGSeJOashTSQ2AZ9Pft+67FSYFJuOPyYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRwVEz9S;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF0E606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF0E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRwVEz9S
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so2995093eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862539; x=1794467339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=JRwVEz9Spf6C1WlqEzlOYtqnrPDl/3FEVt70uoSP8uLaseHiniVppo4JLAbiCs20qR
         c6wQbZe/KPAw03GtZsrSsPxHac+nWAtewASVK0BLg0RSl9/RhGaHiDAYwwYHnAPpBzJq
         HMB/YlhZCLrnUZY6gJiMSZ8kP+/liHbofRzxSp7Wz+epLQXueI+GVmnwQGeBG1xHTQNP
         ZWOld9weCKequkid9nybE69agS2rWyJ+ThdpLYyHO/PK9Tp+ZKKx4caLn7A5THW9WL5i
         8R3QveyJewGZ+wXT4/zqer143B6ch6/BffENfaZdiulZeCuk8PHsHzhxWN3ut3ofmhim
         XWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862539; x=1794467339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=R+XFJN+iA37NBhTfK9Kvg20xEWYuncV28zz84jOx/oPHUOqKWAlBX/+gEMk/EdxD0G
         NPDx04rJOstCytBkZGQkBBuHgvUySd6njDbbcsv07a8F0vufprtoAVCToIYLGku43/Fc
         gxEgkouW9zCchh+UHcnC38lwzPvcUkMo1zDySInrFXRVc6H5IDpregegf0bhZC8EiMRA
         EbQhxo/G5C+f1YOwcRvJL487PF+YffdR3HQcSrG97QfcxNpCgEsRkSbc709vIukuWCQ4
         jMYdkBPDCgdODdM6Jqg+GJYCKlISFlcLkV4Xfk27GQpWnhztTrJcLILA4YPhuAX23FaS
         sLNg==
X-Forwarded-Encrypted: i=1; AKwUvBx/CDvqBU+XKGIaqn00308IqdFK3DfmAcf1cBcVnA7ifbEONf7R/qTrs0DTD5/Y3jELXjyzPKwfo9pKJBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y087dlGYNRzXSTlBfSWhLKxtB78qXHRPmX1Uu3DKIJL+LCEJR
	MT0RU8V584Ijv+IzToYnTCeeCVI0G2AEpZ/UccagOdewbZqNHjN2Srss
X-Gm-Gg: AYBFou0S5sjJYxE1C5uoo7yEHImx+k3RMq1YiE3urEeawT4pXEVMQaWGrxEWYVAgcC/
	S3lR7RyVbEQSOOGSvOiaIFwLqbNHSTGNgzquIZsFQ72qS04SHj0+N+LHYw2UCG+Xa35vPVQeiJo
	OKuqsEfT74gGkEg2I/usFPzI+zEjZOkPhHpWn8FsLGMpm91NEVzjG6PNJefB6yMQwR8rctxcZWh
	vRGA01IAQ9cLcTWz13k/oolNmBjxJrit8OLajRbBS0bfzhxjmso89aJG7EHECWlTYRY3V2xZ6bc
	Dedi8bFWlvKLk9rqB7iyub3k1AQw15gOvBqWjVfkdYb4nCCRyRyGBPTNcdITc2ed6KwdFFpFav0
	oeD/AZv1KssCrkjFXf+820P3iPNKRPBtPCF/yXwWIoGAMFheH54zhpeEPN3HvXBqW5oKoLW1cnG
	+nkOBP9fLDJ9FXCKcjCOSWrLldgm5tm3HAm/uzSsmx3LeM4YE4Xljy/6+ginodgoVmUIsbON6/f
	HaPXEhy5b3QNfYeNDviucYYe1HtKAyBk32aniB+qj7MfmOdVVx3eY+g+rRbiQI9HRdr4Y/YqFPT
	CKg6PghyzlOCxvxwYjgg79RWIrYXysAy4WUeDJumfvW97Yyg4FWJ2bTCyDRiqbjnNMWN6tVVsmc
	yMMu/O1CcdSKpyDczg/wr9OgnJU5jwvwvImfgg1JHWUvxWEIG04uXb+u6uNLPWG3R0PQU
X-Received: by 2002:a05:693c:6391:20b0:36a:21b8:b6c4 with SMTP id 5a478bee46e88-36a423408a1mr27277012eec.8.1793862538357;
        Wed, 04 Nov 2026 23:08:58 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.08.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:08:57 -0800 (PST)
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
Subject: [PATCH v17 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu,  5 Nov 2026 16:08:34 +0900
Message-ID: <20261105070845.6449-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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
