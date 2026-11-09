Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267660;
	b=VMnSPeN5939MY0ugGmEO64LfocjsJ4Uq176Q5lGMGj0ZDmC103rdJzq/Uq5/HrZSJstK
	 hhsDr8AyoQ/81GjxfBn4w1p1OVZC2kpCv3mUyJa8msIMyIYJMZiL5/lYcg7Nh8S+OM7Bm
	 Fx7zf+DwwGpfhxmCgLYNU2JCmmP6cj6uspWID8XiHZEQ3p2dFGB2gvCp7ZWGnjY62WWWo
	 ltFFT6jqpNGjzX5LKuPon5k4b+veJDwSQ3wsYlpQR5XgJWRQMwI4kz3TU0ziZIiiQ9yfk
	 MZwV624eC+81HQ/j7DXdm3a9ahft92a+AzjpOr4qqsgFWUa+XcBYUA6rxGFa9OAgetw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=gUyCLGrqLq6qy/lJt2SfGl7llrOBkb28fkzEA4v9NDbUe7SufozkssnhBuP6QNI9JaTV
	 hVI+p95Ls1M2JzmzJqONwh0TTye9h0YCdGij3T65dqpkshP/+4Y9rqdl0/0sVq/jL4lTa
	 zz6aLKQmCgsSxGM/SFJhpQHM1Eu32PB6OFQlnVp48cTfNVuTSKpAkU62KfzI1YX11d3r2
	 VZCX65toaBQG3JDWYMeX8UVuvGoi/pwFlD1OeWN9F7dnJzfejLEuR4aYlJp0DcVApj4Us
	 WkJVpT7bd3yO8ox0buTwFo8I48vRSez43cCWxo9gjoc3sTi/QL3lYZ8n8a/juC43tCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMEblv5E;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6D3606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A6D3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMEblv5E
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15dd124bbe7so1499253c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267659; x=1794872459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=CMEblv5E/ZYdTwKbuiQF2TJwj8bc+53lpi3+wCxvA8s8Loec99E7MJE/Ob/VbEfBs2
         j9ZeFwNWVDFp96V5UwVvuC6sr0NZDY9aHU6ucxO0/sO9ebK6DzWqK70Wqj5fN8PzfkGw
         ENUJ4nppKN98VxMR2JMJlL5wWJkjFCOoRaKIf2kYOuYpZ+h5u5FSbpwlUpcax2Bg+bku
         ZMAuJvqcMyVRXSxnvg8v3dVOrtM7xxzLTUiFrzZuuXbIDBBAZ3xj+Fz8zaZaZmrAKVAJ
         6U0HMSS0xOzCQr57co9bTZSl9q4eApC9TjKAcutp5siVaP7jGHnSRJKKjWWHinIhy/yB
         doyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267659; x=1794872459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=IyvNiCsk1On8J2zPvdxhV+ZT43tN5k4EJuQ4T6HJPardsUgjU1NuU8yz4iJwC2h4Qy
         N+RPcKVMSi/lz1baqKVp3fHIcPfixK4/l9XDGJ/trIOx5WTv5Kercksp8CPZsBIvcQrn
         qSrtut5qDYkEGLCOKFgv5hYAaJSg5oHhudutI3l34/TZ0tx1O3p7Z3xP1fZa3hOT+OHr
         kZPkA3sr+NywM54Iy97YFwW43S6wlIWKu0kfrYcpDyBDDIgVQk0W4vjMG8FM0aMEArvL
         dyBijL3KR01SwSlosYNSIJQzOXsyDWw2jQEh6Dup2hEiR9FhVHxmoY73NElsV2n34qyi
         a47w==
X-Forwarded-Encrypted: i=1; AL+hErHvrSqKVagdbLHCKDRnQTRs0qyMhFC6fQWhTKP/VrVunC5ejXQx/YLHSBLTIUeFoMlT2FWrAbvueoX4aY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PIhmyuMl8DFYRjNjztqzAl7VL3ceQM9lYHtkHcXsH4o9dOFV0
	Sj8wKGTHOc88HKaEzMB+Mli53gdXhtFQOVZCxVvclqkbHz8ny5oGEkSR
X-Gm-Gg: AYBFou0rXsojrmMEXm8F7lr4KQ/XPZReDRryaRvv+8nBH/COoWqv2RzFo76gioT//06
	NlRF6F8AtwRmXWH4KlW8Duxql7Bt+V/hwjHiF8Z1JklCVwAk1+2mcCA4ipDbLc4VRdziA/V1irg
	MiKzMYK8eaHDT2yzem0afaU+WDLPO4EVLdFM/8pD8kqCYJWsfcAkcNcptgBAQEfQXMzYnXpX0rv
	S8IqaL8VzK283Xon6tR2U01gW2fAwuLMilAauo1l3siczLsMQH0fsrI3zmj560qLxpmxwlDTuXm
	yMEpTVlJxYqSRRNsZbhiouNhcJv5/IV/fMcCnWsA3D9EPw8xUdqzU3b9GZCQ21ILyAJ+wM8VQi0
	bzkh0ZTKacI+GfckQDXUo5Y0i5iAKk8zRl66t3ceuSBq9PqFBT+jFz0iS1hVxp54nmqPnW5XGn5
	nkuAvd60ESVfPUlvsQIWNvZ6Z23W6EkyXN1IuYz6c0NljhzVy7YLlw94kjd4zq8O76XTZwpCuw/
	3lqQA/7Tk+g/0Yjq/lZdVjpG+NeHj6ocaT3D4BVMTV+H34ylAvkVePF74ko8PjOJs92Vmj5VaOB
	1rt5Z289YNLkyFNxzCtqX0EX8ckc+RufjBffvnCZqpxSy7HKi/Sk0ndQy1/2gS9vCaRXNpfHArd
	FHZyYB5kE3qXh+9lvzGAKPDxjHFxfaPiitxCNhhLRl3Zt5ow=
X-Received: by 2002:a05:7023:a4b:10b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b3b618cd61mr1286428c88.40.1794267658673;
        Mon, 09 Nov 2026 15:40:58 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.40.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:40:57 -0800 (PST)
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
Subject: [PATCH v23 01/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Tue, 10 Nov 2026 08:40:36 +0900
Message-ID: <20261109234049.79534-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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
