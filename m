Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792907832;
	b=QJWtyfnmxhTTJqCSOuqw7r8g4TE9cjh7udE9ckyseKJfgUbUC3l28kMaSRv5psqOJ9Hh
	 2BhBMtdGJvMOQRGLZr9Mmo2RUU4vtjRt+ifeUjzi2YJHiKrlrIJq2d8cCpdd8TWSoz+lX
	 kAsRHJruGpzfGFey8C7sxeE2aFwSLMU+qF1OMBdH+qrgyLzMq5xGnaZpVz0FIf+u0EcBw
	 vA7boDgFFVTxWq7Jk8DEB9ZWna15bXOQM12jVu2DpGkOly0pnfXeLfv+0xnxQNDRKHnDR
	 OMqVvcJ9L+velbuh0avWDgXxgPyYRJ2VnR/Vkz0xdImSYN3t4uwkjaEPsrqKApkXpqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792907832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=3qP2hxGeN9XAMEyBQHObsJT9jxWH8k4ynRa2soiiEG7KwBtZCoXPd5UGVwEUiS3twqUQ
	 V+HFM8+05xewMCu6YPphqBfu3RvnTb7Qxhci8yzbCu6v0SsIWHdYXMPjxf7PNSzAw/HcC
	 faPz3+IkFMk7lg1a/E2BmKHNA8evoKL8bgNQ82ux5xLIBIpLUe7eLGdDB4zDgTxWz4GqN
	 KAeGciSAiF8FfMczKI6XJXPYXTqD00wd0+W62zTkj2DT9yEBRgqXeM5slF/zR2Y285hGD
	 27N6/nLcgOFju72/M3ikfQceGQCGrmSd1hOEWgZPaFgRiDL7IvA38/Bxdlh8NgYmxzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BIxbGW9p;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96F3606A333
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D96F3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BIxbGW9p
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35829219da8so3752982eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792907831; x=1793512631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=BIxbGW9pO97vdtgMgDXF4UHmyz99zPRNUX61xF/4qtJC1BtDSmx9jQ0a3n5UyibYQA
         PXQ/PMJwURRdAvIexALEJ+eoXmCdaolC/iTx747Qaiswm934Lf0KJSIrn8rm8PcwuHEt
         dbnFoTNKDaeYQSpJLWQJKeSIZLKA3C0IeKnbaoGn5JBOyxWwdPxt6UccyIdnPgqIS3ri
         qvkPHk5i6sZmi3V00S6lmQSVlXwSHKCGY0W9TtKcXvxujJL0vYvhZlgaYBnVzWezUnCX
         39ARkmUG3ov1/qBMQHzHsGHgZMBrnLonviEF+kUjK+GgwP39jRItcQcaHGhVVNi4sFwm
         amdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792907831; x=1793512631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=kcH3bP4r1JEL5MgqNc9TG+RNghiCECI3wrKTrtqXVrTXhUQMjScuIu2jhfaopiw2TW
         +msaDB9WdS/7gjJYcSfXcPuw7i5S7ogIGy/TfNV6HeILr244CoToEDO7Bf0BlFzM2ecz
         /q6va0dTwYmLkwhBuHRtBatebwfouskvFvF4Xgm/hIrnDTu5hg7pWfSvIVAAyrknXKOU
         VCbtk6ekDWFCekAEqqqCZWm1n2RfXPzxoJa7GSJmy/Cp33R9ubMwf6EfxCKNtcR95OCI
         bvCUjkL64BChAgjpMblExH2UB38aBl3JO1EWfxP4nkZ3HnBn62xMlEjQXtoc9/W/VPKF
         nhSg==
X-Forwarded-Encrypted: i=1; AKwUvBzdGkRjNQWo6QunyipUGGa7ZLW1TeTi7orQ4bjpK6QV0/pT9aqUmg9hk4/BDzdLcHpQ8QIWD+ji4soQNMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDAFAqBjO/IXUlXOx4NvnmQ8ACWbTyj9pymEVuIW4lkmb6dhxB
	dupbe9AmdKR6yX3+/FtaHn7JjrqKYCqWhPkzB92Xw22xVxxON4s6a1fQ
X-Gm-Gg: AYBFou2wMQ1B6stiLrRYtLeUGoOq0BiYWgG+b7P1UCbusdc10gtHMaRJP8U7ZgLqyQc
	ALwCG7NXSKWttJU8BouBz4PySiXx+jfniHTt3Ng0zXGiydNK3vESYCVmLjXf0tqUJ/Ps5tdYDJA
	jXco4b8X8mOI2o0nT8WXRs0VENQZffB5bypO89S8C28qKr0YK67lv+7OnYlL9finwxVJzO76dnK
	A5BCDMD1GypgtNHGKdChE/rqbAWuvt48YRBw6lx3c0dNr5Ny8uodfVexQ4OddV92AwiyxNHjCW+
	KprheYXRa6MLObj92iU8W1nGCFYf36CEkTwjEwb0rMBvw07+Of41o+lryN+VmSnG3Q2In0GD3IC
	8TKu+hfRrHinnGzhwq+hQewDFSC1nimZimu2xfMDr3eHLRxofflY7LkNHDoCP13OzCm5IBUDp5A
	xtrkOU0e5U7+i7QMZKQhsGzRWnP1qTcjBWO5mYyp6mgSc7YQT6nA3qTRv2XOXDG8HRtT60KXQsB
	8UJScDhm6lBz+K1ya3Q/VMs61Ys5lM2aFAYABQEI3Ox0XySr8ssEvqt24WIfVglhT9X6ayzjQ9d
	lgWGiWPcZetqTsmZ4cX3kRlNG/EVgnqMt74SoAxOMzF/lVNnYW7kacRCsBYdpqCDCueJuTGvH4y
	0E+stLbsZfYiM03eKEFY=
X-Received: by 2002:a05:7022:5f0c:b0:181:6b8:31f1 with SMTP id a92af1059eb24-1993505e277mr4456002c88.10.1792907830883;
        Sat, 24 Oct 2026 22:57:10 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d9307bsm16046244eec.14.2026.10.24.22.57.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 22:57:10 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v3 1/2] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sun, 25 Oct 2026 14:57:01 +0900
Message-ID: <20261025055702.69259-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025055702.69259-1-mynameisjune111@gmail.com>
References: <20261025055702.69259-1-mynameisjune111@gmail.com>
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
READ_ONCE policy sampling in the following patch.

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
