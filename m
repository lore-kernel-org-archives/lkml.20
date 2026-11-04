Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758677;
	b=rFPDF0HatGKJFy+sYYOasUWz41AYvb4Q65U8sTojsc1bXfWA5eOAkAGqUQn8x45GbS6x
	 f+3tSkASbA346Jruy2tu0PO6chD97dJwl+0f7/pf3he+9m18Kv9pP/OSqEmqWRCcGBNbU
	 83fOCwNGNoRbb7lWJWbyrfcHiud0nD6HVZGX5qvh//s9FvwSvZLAjrZam4x5lfed45Ofe
	 xl0eRuJd//phJe4ic2h7+LrOmPDizSfxzIfQAf8RgiT/75O58fQpt8M7h24quLQxpCAEx
	 VUCFXs3Qn77MnO991tkTi1BjR07lHSONbmMVPNSjc/67tUSFtCI7Qn/77qd9HZFAA5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
	b=2wVeGlcIhNjTM95M4UqIUDskeiCF7AcsiuKgyACXbpDg3yWaYzrRlQk2njq/PavmUT0Y
	 z+/wn50n2XY4HlKHS9jhEkPjM8v++zwuBQMpX8ruXoJbqwPbt5rX8N6Sr8aTYLrbl75vX
	 O6S3RBr8A7d8pV3PYDSOq4l+HtwQzIqRHIm5ABeNWy9GZ18KGX4cHjxofCLTsjnwBUQ5p
	 JRCxX+i1Hrye+FmlYW55l6qvYGMaEMzHdl7dN6QGw/G/Rv+FZqtnrgrp0vtIshSlQ31hH
	 3wpkVTO9JxeKu+adiEL7ecpwbVk0J2jE9eOeEv3KXS+dh42fwi5k5GXCP40pu3dVN9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXVJxd45;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3A606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE3A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXVJxd45
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so174781a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758676; x=1794363476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=VXVJxd45zz8QpVB5JFLOxvi7OiNrlNeel4et1ZZx/4I1QqBYe+XSER0oQowVoMs6+Q
         CfpH2MH/ONQQbQcOeu88iCjoW0gQ0hxwD+Y8oV3h/863ZXSTZ2jwjyZNqjCSGXWmYAHL
         kn9cU/6kB+MkIKImgHRourQpaauVeXOh2fVKr4d8R81i2yC6397IVv/1bWDKGBgeeMCS
         +XGY+c70W5mKXAHPlpLGA+n0sMhSTvYDLnkH2CbmFrOGISjEaoERAZvS6KimqkxjPdS/
         UA19cZswZyO8X0Pqubszxqfeo979s8FSV0Mhp1W1YKnaraBf9+37PRV0oDGEneWxmnZu
         TjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758676; x=1794363476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=BNWhAfxPsUwsWXInE/TkmZvxKVkZyKATG71GTfdBS7qv8GnvPx40JFP37Fc/BN1AIm
         0lyRBKwxx+hjuRTr9J/pvKWGUu9IbSP7MI3iO77btbgNVtvENdUBPTog0JGARyZmCJde
         +6Vc6CpDeikdtl7famOP921ytrO12OHbosQ/OGKH0QEIco+XhRY5ECDGqDiCgBTXGLmh
         pQjJTtaCN+mtr+xdeoqqLL2MmclVHh3EdS+Yg2mzlnpxH0CHVGwZtMOh4IohNsl8Rfdw
         bwBzY9AhbaAh21ygmHiy4jBHhOIVRw9Ihog4KMX3+9ajJYWVzHp7Rz/ZycTmc++IyNcx
         ET/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/xXdkSW+M4DUnYAGZe66k/K+xVctNsCUQFF9gXMxQg6F7q2/McrCRuoILrretzKBxAUCDyz4FHNFh4Ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qMcqhhZQ6HXqjOL6v+JINHhdDGI4AKk/jctVYriVgGm1KY/NY
	WchpHeu99RpiGrt+8rOHgyYR/GAZYadd7rCCPb95ScRtBuit/HJhQhaA
X-Gm-Gg: AYBFou2Flb4pE0cqK8H61Bole5nNpVjDO2S1NfFAwsdhYGvdnvlDiWjm26bJy0viKcJ
	Uozd/i2uVjnk7FEaCFK+MSP1jEs2+EILoZy/CESTtJU/O9MkMulOTwk7fykvWRKc49BVJDPR4M2
	jzNAtFf/oMWhpvOZg+PMjWWpbcMMMOgIALZaICZuTwxELG7jT5E611MRXfn4Gfb3ZOPyCnGYWNR
	2pWoTR1twWY/8hgEWm0/5ugR+7wS1qlYJrtZVbl6H+EY3lTp4bbg+JMD1E5NQeDpm99L8Vo8Ruf
	PY8Xar6uOjSZwuk/0ntVvq6diTXrRecSbJ2ELyIIROh13zB/RRzahbeC0lOwKSEPjDgygiQGLsc
	wRpLCsQVWYNNF3M/QQ/nc3K3Hk9LSEAWLugiRHIqq23P23ncFN4ZXSNsrlNH5T5mTf8UXAfLkGz
	El22PmE1/l66dFWWUR6T6RN8hw9Nej4PDjkS7T80cU6vsn9ixQ+MuZIYvdOZ3lwPDzTWC/F9sQq
	y8iofCyBZokdzHTnqU+PlKnNBHz7uUh3h07mkRi5dupOZ5kAW9Cjjr/GtNzdfrm6fdbdePLtXGC
	J/Vc57N+j2bStUJ0U5GCTpUTIQ/zlbezLC0j6Er9qdeObZE9vfS67sY+DW5HtkKzpk3j1bwj5nK
	GYkkBIq3x1vPssSLQJS5mGq938zvAHxc4T/csciV6BGXHcEQX0MEmXH3QLIyFBztVLV0z
X-Received: by 2002:a17:90b:3d4e:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3ae8981e41fmr11117473a91.37.1793758676321;
        Tue, 03 Nov 2026 18:17:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.17.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:17:55 -0800 (PST)
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
Subject: [PATCH v14 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed,  4 Nov 2026 11:17:34 +0900
Message-ID: <20261104021745.57733-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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
