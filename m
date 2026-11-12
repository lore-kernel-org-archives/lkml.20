Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458126;
	b=Elkph6QvyBE4b2ihuu6gkoPR1bNDhso90QZ6vYwDMv0EQf+wF+PorsR1WDePWwBVJ9TQ
	 utl+cPYpAL1x3X6anMeE0XYWWDoeMh0POwbfF2zu11GhItPyyoC6WytQdMddW1/EyqzXT
	 IJzCHISE6Suy9EAUApi/1qUTVtLLi0zx+oOQlGvU6vZrRrMHNAgY4lcWhQ/kGGR6+3/qa
	 NA16nM5MLqpxeCcp4NKCG+XCISyh9PektquXTnf0t+DR+0TL/WlDSZzWLjZ7fRE8cs9FE
	 IeIH1BJnI9c2rTE2UFlaHA/Z0oOj2ZFrt78rTwZ5OllafDPewaUj5HPZRWXKoFcTuIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=VqtPmtSriBYypbuPKlPY8eIBvdNWl07kkX2t+MoPBgs6mtjbji5QzKolr+HSe/FNuiqm
	 6Xgc3hynbFQ1i8Ac/VClKPKi40lHAix5VnSDooP7OrwqIZLDkOdNcp7FLFNVTd5O9OyuG
	 fxkNa3/VtzOEIg4sn/WvNj9o9KUvMDINzrzMiH160anwTyOUGtOnd2xNZb96JcMFRpaQ1
	 LnVSlBO+sC5kE9LyxY5rjsRHdX8e85OsvOq+hKmyPU/STBF7xt2pg+MLm7mMpvFfjQsEC
	 w+gvWHRpCv7rKb+wicSOohNhs/tpAW9fBnwShm8Ek7/d32qRARSp+ZJrn9cpDqZCibQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yTvywWgH;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0890A606A882
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0890A606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yTvywWgH
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2897392a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458125; x=1795062925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=yTvywWgHaB992/+07jJ8uPgYTmnXdgn6Z8/+qEQyE+82utOKU56zTXNXGPaeE95+aj
         lZAZYLzRF8bw4BE1idhj02EZBEVmoPHxfeyCoyqDI9Egq9qgm8EbZyrUXAsDfuptHLyj
         3zX2KSAPP/wTp0BT0wVYjhLidnoODgAlfK0H6+fea9DZtGF+J734WV+Oy0ue3NMorXIz
         ddVyVfZ65PEXS5YNiy+UpwZ8RQcd42nZoMJlO3k8Ia2NEr03mqdsWrisod8M5QLzhopI
         qrH6i41uE4VOSkm3oPWTD4eCnq1EYni3Wlg2npbtpf09c/0PQGb9lGyuymwRruqn/Xu3
         pQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458125; x=1795062925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=rpTIPqx7+ErPoX+T/EHyF43nCukAGOARH2+FTlT9+a+aoN1PMc8TE3qlo28D6xSkjV
         gz9bce5AMudNJjBb9wjjne6faRsXn584I0OQAmwGL62zzjI5FTNyjyyRRSZgpWGVdTap
         GjUhSmtt4t5iPS96xwtGCFfur+gRti4vDIMV6WM9i30aGTmaaT/0121TTlbaJAKpYIb5
         h309WDvXOIogSdlSHPPNYf3oyrgbv8ofIRgmcMwEnCqy+4n/om7rvWsjCCE/CN/RGE1B
         crrV6ZfC7UhJPHP4TN6Xyt2TP6tx2y+j81wWnknoDRkNmslEtxdGvypDNclJbEudcv2y
         MKcQ==
X-Forwarded-Encrypted: i=1; AL+hErGU1h+iWaRKK86ONG+nyvUm1ppHmOVq9R/v/8bTmdgyrLTukpHx/DXmJZsUg+dXhpdI+FdJEOcP01nNkBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KOeVCVS4yEK53H3jSNElujlmxpuzuhoYsZ37qhtqFuvsih73b
	a1VH3OdJnD7hBnDqSeR9SGvPIRBNNA9NMZ/TtSyjAJSEzPXPfILfoXYn
X-Gm-Gg: AYBFou1k8v6ZqPIZp6fyfFuvpFcNriJDAMoayxxM8a0ptuNNLCRAdRcS5WYVkR2N0Fg
	1lsnLZhmNON5b6PW91WT5z6Lb2+JpPzb4g3Is9NuydZcvqnbpdrXiYrrPakB4AWKDjbV7GfUqfJ
	dkZOGFpyR+6szKn3SYCL3rGTCOygvhpSETWeVHu0uvIKULiuAk1QpQ6Wizt9bdAVPf5RQyijU/Y
	ddtXnoazX4I2ttkbzU+0OM2Pnb3xPmKdonpjbgyrtkUHZnDctsw2CXyoEvRvquyKMFY0yYxBGID
	npzrKUYGSx9HxUcowV41nGAekGD2yhZ1WzeDEMvx3Jb8tAGF+qF0BIEOnkYIp54Mh5JW+qrXxv0
	Shmweb8SkxKwdOD9qVKe9GjuOXCtSlY5K4WePB6k9asn1wDM3FD8JM7jdyCF+dt1MaTt55eqhMd
	Vp7464qJ9yXBujDU5Pe3d19gI8mvgmDL0qjaNs38lKC6Rd2F3FUM+RORsm2sXLy8rqUYk6BQjeU
	aYNnKiV0BILDlzFZiCDKs2eqnBo1RCntKgEls2Uq1EnycqbTjrLVqOePkWDYAL6JsabnRbfPdM/
	+WZVpWWDGoQPFEmBFPRn2d7/EuNjUTu6u1/9CgpYILYXjeF0ABkXmbJERKpPbxvCZHLhG5gM0ek
	kVAwTl7+zqjv/F+Td3S7L87vZ99qtCUocLgMZLtutS5nThdI=
X-Received: by 2002:a17:90a:ec83:b0:3b0:a38a:6715 with SMTP id 98e67ed59e1d1-3b182f61eb7mr4107773a91.59.1794458125200;
        Wed, 11 Nov 2026 20:35:25 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:24 -0800 (PST)
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
Subject: [PATCH v28 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 13:35:00 +0900
Message-ID: <20261112043516.37010-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
