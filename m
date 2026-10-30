Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338019;
	b=lNphTQlbuXn0mJ6HY5IHl6lreXZicxIzPAa9hYNT1CdTC9nrd9SRoMSdLKmWfV9NtRvn
	 A9u6B9Zu4St3Cg4br3Z0emMW6wIYebmdfU3cX3v1+CZPbh7KGoQ5GV9dF/Awyatxicq39
	 I89ZA0O9qbM7+leVpTjvHZxro2tycr2bMhzx2RiVFGxdQ6uaTPtg0+heShhlNxq44VXzK
	 2K3+tmDQBtoA9Rjt9l6H+CTocbUVRKxhVCPxu5S95vTfznpt52ysUJmmZiIbksWUdLnvX
	 yL80EMXc/IZm1l0p9qgv04whlOYxiF90wjhczzLOO3PjmRBmNk/JeMkzCazJh9nTNnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
	b=FRYbgnyZghe1tufUdZey+cY46a1yT154Afzk01I9z3+4iRjOedDG0GKIgKLBVbHO9cC9
	 W7g/NSNTsjOuKShMTBYJc53o/VvJH8Z85OmFRCNHI8FHFvLzveRvEjafwGc4Xl72cbLXD
	 b0azUfA/QbYCr3hu9NlG9tjQZG6U3zZRwmeUVC6hCCbCG20hOhftRWs6tP1u2vP5tpwe9
	 5f1vp+5Zl8j32Lv7Swr4iRxWhL4bWrUL72I9N6EHbtHRbL3OHoIoKt/JJqKgXRXrLig5G
	 2Xlr0c+vwd1dZngXOpRjC1J1QLfqiFMiCGhZImCTXMBIE6NROM2EiiTUf2GoYGEHLFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3iPL2qk;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774C0606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 774C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3iPL2qk
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc751eddf25so172660a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338019; x=1793942819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=k3iPL2qkrn5ii0cv0MZSTew3qcDwMegLK9e5Ssy7BJdyMTKpFKVgjYzaFCd7UPfFEo
         sF1GioGfBNgjXHN+Sz3IW2k05yHzp4LHwBdMiw8lCG7yZTlRfGGDhajnaaJSUxAp1Uhb
         Xj0k+/PoVpDpHq4KNlHhVOP315NCVmGWH8zESQNxGJK197CR4vDDuD+qCwm0lLycO2KI
         Sxi3WNbNxaThUI4z7zIpZnjt0CjEdEVi1HmojNSYt99oA9L+AlcxWzISdt4aofJ0utP/
         Kyz1wrOubpzrwcxH8+zMONt49wuIe3aVrCaXW95JZF4r+Fsl6BCrl5m14P2PEG5vIJ7/
         WHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338019; x=1793942819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=bZLHQSqAI+oeULDO0xumncAkGt1SXoaulBcPZKF0TyRZzDgRbQYb37d6KmmbwgtGLM
         YtMRW12sEYek5Ivihwvu7TnC03AYat3PF+EmY9c+1EOndJrI0frVgP8KoTa1qmr1p6NT
         NQt4fcEeaX78+gCEawbW4xqbwNUkmuEI40BE9LtoJc9hO18KD2n+yLsofE7wml0DjRbH
         DKEAwiOHDwozPM2rdCKJLXFbL/NXh9ulZUhwyVZxIZS9duuGRwhE4aAfa9GZHIzqcWvQ
         D/UCwoj4r6K1jMUrbHgWEduXThF0O0tbdtDVL2nOJzjLX7FmaAXEYbMjPTMeYsUlfQgz
         3yWA==
X-Forwarded-Encrypted: i=1; AKwUvBy4JIUEGIXabCXoJ1vT/+xmOTpKJctLX9QT/keUcCS/lzzB3tSm0oEVJK6t+Mv3+2gSJOrRjurT9d7caYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYInE5LMTnldNI7wMajzUTqCRnW/6TKuvqJWDYPDoeEC5val4S7i
	yvlg+zivzhMeW8fDzSeIRlyUCjVDvzesZDb0ftzOHbqcHA+cDS5GOgk3
X-Gm-Gg: AYBFou3PdpuVBTLs0LIKcgTKWm0A906v70OaL/8CT1E2c/UdRSV6hHOGrnMo6vbJvDC
	r7Hp2Clldeyg8GAPxBsPcZclM5FbaYh52Fyia2ZJaEQ9bIqWjhUsTZuWh2QcuoDGKVrk2h+Enb/
	ksRSDJQCAGuVwfx5nmCDfVXc13HIhd0TUGWV/Q3OrjZUl30ThGX6vOcMsfw4nV4mgGhYzGzYn+4
	UwDv7KL/Hsen982EU7j08ux23gwgduM6BD3bDbmhy5wM7JHF+vc+9OiNrwqbWU7OB376IeICnVJ
	H7+dI+a+MYuUS/QVDWfZGQ/9R9GXbpRaDb4hy1Rt8i/2smx3L8hEZtRsDSfaj304ZA2XJMqUkzC
	527aGOUyKpv4cEw1TaDk7iqJZP9qphCH+/KSydSer+k7KLkkHv0Lgm08P+3b3gLbHCnFiii+//e
	/27wRI5s1lLU+ZQTimAxahlr6iHIACJdlowcCIU5f1O4i41+KiHTRiqpZ/t01KKls+OrfslmVff
	HqCmqH3sSMcQhS7ahTRd5VpGinh99zehdwkyyicT42/nWGKlKuxUk5ezv31ahblANlWLVgm8rc4
	MBuBR+Hf6/SIv97SVD72ylKibh+sL5Jspr4FzII3Kymhyfi0gDOKLwn/l5UXipFjtZLfgmCpmEx
	D1MBrCfp/JjBpRzyKuU3Y409NiJkQoHEVV7TwIjlqfMXP/6I=
X-Received: by 2002:a17:90a:e7cd:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3ae89839170mr906333a91.42.1793338018851;
        Thu, 29 Oct 2026 22:26:58 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:26:58 -0700 (PDT)
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
Subject: [PATCH v10 07/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Fri, 30 Oct 2026 14:26:22 +0900
Message-ID: <20261030052629.27742-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
