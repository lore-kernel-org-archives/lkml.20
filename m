Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923614;
	b=UhrPc9aLaTuLsdyvpFMw3sCz6NE3CvLMv17vZK/MhRGS9nDsB+AsiEOD3SS5jo4N5T1P
	 1NRx/3qL9PYyuNEFDTfhi21QQXw+oI+KYxoBs/+77LoaBuZpMUnRO5VNZ7HEhKMwYtVXn
	 6knWgdm7HfZqolUDZ/RGO5Gwvz+3h+pv+0ThWMo03MG0knmlaU6GvkJsnbICfu8nZM5xD
	 vT1b6+Kl4UPUXi9MJaiRZgQpV/9lRCX9M1Ht0Uoh7tcYzwTkfMj7c8Zzcb4jio68w0lj1
	 jPh0BYRTM9bd+IxlGQpCfU3ml2nnXW6Snym1djF4ti9B2R4I4wh3iOiQmoljkQgcEfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=Qs8BGWlVt6lnQrybTLMCirOqa752XQJayvlyJztN/eJoHgm/p1kHVgSZGsWqsWs/i69T
	 z9qstje3Lbu2ZdlWWOFVVJYwWbXeWRrRE6vliZ/+EuVO7oK3Np957MjbFfKtMIwcwPAAB
	 n0ZMfplb/99s9o+d2GY1VsLx11K1eduoy11GBp9JnRSRc0A7hiGDAWJ0Zn78tzThW7QAB
	 /pk9o+w7O69VndOLkBcuc/7+ar7CtIJqkiP9VkH8IqtkCh7DnhOjnSEo6Lxwf8G4vcy5v
	 3DCOITQXKOgCbjIxLqqSlBBsuEmRcf1NXRddqdVOoSfnMIPtu+kJBUh8rTYlH02lTvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtC9qfoL;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8547606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8547606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtC9qfoL
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1438d9363fbso102977c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923613; x=1794528413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=qtC9qfoLIOl8SwNDiqEg0PQFJpaoyL3MUnBvLMIb1ym/hUftiSXJXdt9XbIMw3B2Uk
         SVEBWgj+UVnCSlxt/jPUl3PODiiD2ELoS+/xGxgu7gk1I5/txZhCVJXWnP4Gj2PA6kJD
         ANoKqR65OYSsI3Uw53iGHgZkOS5CmK3B/UuXQWVjnNzo2JSSjGLX6S46ObSV8+isHyBK
         cDMWITKqP7ndTDTepn1KgStLqOiup1byymyjUR3pKQgZud7aW+pDqi8BEuwUstHJpbjx
         UheLtxOnS3lPLZrcCZMAsdxNz3yGyrCzWOw1rIqQBGHKO4QMk/GSsk3ANqTcGt5qfLA8
         CX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923613; x=1794528413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=pTniXo6JU/o+rdd13zOp97BznLH0PsiVKDsylm78zjpXkJO3XA4cBbIA4pvArENUiH
         UUDLn7MRc1EOaqEb9UIpOWjadWRfVkLPnjpErDHyi5DX72AYtI+nCr3uOvMWznIpeprX
         t9hUpOaktOPChwa3hADP/lLQOB9oR6gU9rmBHbgq3E3cQJ+nkW0IXWLu/EtNv9XGnXh7
         CxwFVGB9QFIjy0NMYwrcfUMCzggsx5magYquUtdJnBWLD/p0z/QHMezjur0a3/A3+oRn
         SAyH7+YOJskyf/gHE0auiEvfa8OymSxlgPM2NdxRpLD4MtS+JrSkzZC3nLrzjIgEMRyw
         S7gA==
X-Forwarded-Encrypted: i=1; AKwUvBy0RLFuH4+TcDptwW/6sjp147w5HYrrFYlFC87OtRkgHi/9kg34Um6Lywa9jb1TE2saRMqGm2meM2YSgIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i1qpWenV36nva84Azqp5QzneYN33fbjiBXodU4SuNnTnStScX
	9YYeBivutzKFAsxjHqc3KWewMSNxARndcseVybLBBTUJ2JF5Ly91rCqs
X-Gm-Gg: AYBFou0+raW/SulBBes6bFml3RdU6h1MjG0Gb3T7EL/IIFDEXKJ46ybLshW+k6ZDg3B
	Euicj302yFfgh34TzNgCZBuYfpYCyyK43af4cZbgfM9gJAJSTD09o690zQ/5mnCZC2VEz+3uGjt
	lzcPDV0VBT4n0gAXhev652lKZIm3dOYAqijcG+ZIyb/eGnV7HHcL2A9x/L0/Ciud+c/ToCNnWoq
	PpVc663WgBjTaWubEwYbS47Zt6PfQ34le+fIUVzeEkoMe2y/YyH1lr6N3X/EycfG+nBqPqPE2XN
	uN7hQj+yV1mso5EAhibyO7RucPl9g+OchN8aM/kz5mNW9JAW+3xRlmARnrztktRSpE7N0nSfYGT
	JIXIfLTiVg6/Qlt2zroOw22/PZhyS8VPLTl3M/a5yXLBusLGNOnocRlYL3aLec54asKap6qJxLc
	WysFdPBGThy0J/4x07C8p3CpW2F2LhhRLa6G9HdKKrVwQD2HgVHWxjuNqIKCzlvQfDja6Yhli8y
	bkMZLvqNN25oM57+NBgrKBh2rGD13n/7Qnc9h/5V1/DjC92BKKrTw3UMxv2S5a7HKxe8xp79noX
	h5Zh6DAh7sGcQf7Sf1He90uxyRRLjGVSgiiUtT9kqfFyYxu38e9t1AW69vcJXfuKtLPmKKxCU+q
	l5jg96rxxc5It7hx004JM4XnH6/85+jR9bHF7gyNFcAksOWk=
X-Received: by 2002:a05:701b:260d:b0:1b2:459d:331f with SMTP id a92af1059eb24-1b24f4d01b2mr4820315c88.16.1793923612880;
        Thu, 05 Nov 2026 16:06:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.06.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:06:52 -0800 (PST)
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
Subject: [PATCH v18 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Fri,  6 Nov 2026 09:06:33 +0900
Message-ID: <20261106000644.20460-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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
