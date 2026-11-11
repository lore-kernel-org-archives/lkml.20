Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387886;
	b=MaDK0aKye0Z2WxfLGUjGC6HPdfA5Omxwki6Xb+6kQI6JIsuzK92oWSyt1cuwFd3fZuFD
	 BexvO90a6e8D/A3jFF4jvdbBes7vct2VkkMA8WH2zrac2V5bpg0U+TtM7BnfgQLZ9BlZE
	 NX5kUy1MdwLfp+5dqiJuzwB0Lrc0QsMr3ttaBWMiy3Il9WeuIrkHYLZ3Iw3Me1ftgnWRT
	 +McocTmyJirU6d6yn2NzsaKt5o0nrBKSY8zdo8/v5AK1WI96vW897U2jiLwaoRJp7/nAY
	 Q8jHSRJqSNivGC3Vw3NsXx3mEXbVVqc7QcK7GsNF604nx5Z+v3UGZh0OB+IzvVP0i8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iopuf+0CPJ1prxbi5e5LK6HB0bPSt5qJvXq2KBBjS3Q=;
	b=r1H5csf0j1Mrp74b97YCdAwqkcdHqp8GqJIKnrNEBRMZUlQe1saSWviemI9pLeH5VGL3
	 JuhAxaxcRNP9VbnRHkspU02cqSyZemTRUlWpPMYUR5UTEGj4Qp7zhPkck9ldw2HUnPvrA
	 emPcc0jEWxioPmNK91DPXsfMabo+TwDSHXu2xvb2R9FrRCYmNnZ0OP4vLl10TlrYvx+ch
	 /8oOw9O4dmWYu0sIvYv5a538RJQfPSrVi6l+YTeZiQegNRtpKMTovnl+s5/3TbS/b9Lso
	 8u8I3aedFv5FiWB4XQgqjyqke0AiSxV3LAB4Fmun30iI4sDaqTZ7cELBYmj3bchwciA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D11pQqVL;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEAC60A2620
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEEAC60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D11pQqVL
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b8ecfa886bso1388004b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794387885; x=1794992685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iopuf+0CPJ1prxbi5e5LK6HB0bPSt5qJvXq2KBBjS3Q=;
        b=D11pQqVLxduA2HiDS9kaLe4YqBelzGoE/SDyLf6kxKBLQDF9C2rBRssaQoZoSzQt7X
         KLLjr8DL359uabODoinxTgWguCexJ8rmXUHxIAlmRcv6YnJm32LjC3rwevowjnr1supR
         bILDTTctpU8VgbELeRcea/4+RJGNAx80V8hXvnJ8lPUCDOklhiA49lbWP4O7LTLE8yvr
         i4FBS3NxqYl26HukRI7uOQKstJeqi0XHr3Qdv5JT1MwWNVeac5oVz2EDjS6QmA+kVXu/
         llk0PDa6L5Q0MrL0KalB++Uef1C5uOcuo1As9tGv5ROY9NLTjFCjajeANUuJCFO9oWiQ
         Q2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387885; x=1794992685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iopuf+0CPJ1prxbi5e5LK6HB0bPSt5qJvXq2KBBjS3Q=;
        b=X+Sd4MtpbpMY6+mZJeHByUeO4sbDg50yJ28zh5EIAh2+p0PNOd1VekPU0a4Jl4A4Us
         RaENJZ42xhPCNbEYQozFd5PMJZ2R/ukqO3DWLkWtWlNk6OGl6klZTl6AHdxRhdcn+S56
         bArRnoB+Z5SAizwLY9TzFM8bB9Te5ydMlkN6QUSmDGuQa8KuMBxh/pr+T5AeXC5BQmBY
         CM63Qhq+XS7K4Rf8n9NWgKI3g8SWden2MHbJ9kA0oeGwbPPFuum+WHYf7UCw56INautm
         xXf6F9RpntNuA+bEE9b2Tgg6P8L+/SYCqxK9j9fJeJ+s8OzXP1yxh982Gh1bVT6YCe/E
         EYLQ==
X-Forwarded-Encrypted: i=1; AL+hErGJppan2mrCFDD9aJhfntThQzb/HC51eSyKNIVLVzH/VnGfhPsyxFS+UzMbWweCupMYOCPQQinlGSU56aA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PjlZhHlDDkG/GmqJHR+6vKzfEMJ7XG/sOheqYYMNcOKRfTIne
	dFoUgIcporQmW1Z1SuFYjzuydAFZ3Yq0SOREdkNYYVBHgiwRWLri3YGQ
X-Gm-Gg: AYBFou33q9Co0o3KIFidRxG1prIoeUpJ1ZbeNkYfgdO4Fs9+GDban6aUP6L+dLDd8+v
	otzvdhVe9fTxBWwjh33gzdZC3OlF88nvAATRItQTuXdIz2jxMOIS1ML6TTacsNwwSFsjNlmB+Td
	kXRr7+kDDGFmJpe0VyF6dtzo4sc67s9hB0LqKsn3tmK/GBtjZYQPUGOU2M88AUMc4EoG3c1jFCS
	jEVcLJv3tPJMGPsdAUpHrXR6gpt/Y/R4qxZE6iSgCPtTFg+vdAYnqDSke6yJt2geLkGHRTjpfxJ
	XisOGwZ31lImfMirN9qDzajXhGmYgGoqDhUHSSLGuXgNS4wj1G1XsuArh8d9e/4cU4HyYPsIsu+
	OuCRdH5jCn73Gfgho9EIZVaTEmj+C37UeDFPZLepWHlhbPuRYLVxxDO/CCQXLAPi4wlI+d7w/fc
	/rI6SgatuHiEN0SIYobbdgbpkwHUSir4qxnoUJfh+CJKNwlepHf20k5Cqd93f7ew8KlD65kWYD1
	j+9g6mHh7Ug+s50v0LXQ95Tn905j6U2aFPI3varn47bPs6b+QAiJUQ3QNJOf2k4j7jESEnAk7s1
	H/7Tx/HgLjZpYXbXkqDcIU4TB5aDj+H8fWQjW//qsq0uz+OIpoMgpJe146xhZG3jzqjhL0NWD5G
	iqx2Ms1QrV0O9mYvQTMyi4xRNRNsVS9iEl4jaKCBi
X-Received: by 2002:a05:6a21:610c:b0:3de:3f4d:f2bd with SMTP id adf61e73a8af0-3f2fa39112bmr1401992637.6.1794387885274;
        Wed, 11 Nov 2026 01:04:45 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7cede06sm1929924b3a.7.2026.11.11.01.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:04:44 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	ivan.orlov0322@gmail.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 1/2] ALSA: doc: pcmtest: Update to match the driver
Date: Wed, 11 Nov 2026 18:04:28 +0900
Message-ID: <683abc21677cc2fea5e00d1b620b9722dc98fad0.1794386073.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794386073.git.sammiee5311@gmail.com>
References: <cover.1794386073.git.sammiee5311@gmail.com>
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

The documentation does not match the driver in a few places.

The inject_open_err parameter is missing from the parameter list and
from the list of callbacks that can return an error. The fill_mode
parameter is a short, not a bool. The selftest is
alsa/test-pcmtest-driver.c, not alsa/pcmtest-test.sh. Pause support is
not listed.

Fix these.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 Documentation/sound/cards/pcmtest.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/sound/cards/pcmtest.rst b/Documentation/sound/cards/pcmtest.rst
index e163522f3205..ed0b57f583b7 100644
--- a/Documentation/sound/cards/pcmtest.rst
+++ b/Documentation/sound/cards/pcmtest.rst
@@ -16,22 +16,24 @@ At this moment the driver can do the following things:
 	* Generate random or pattern-based capturing data
 	* Inject delays into the playback and capturing processes
 	* Inject errors during the PCM callbacks
+	* Pause the streams
 
 It supports up to 8 substreams and 4 channels. Also it supports both interleaved and
 non-interleaved access modes.
 
 Also, this driver can check the playback stream for containing the predefined pattern,
-which is used in the corresponding selftest (alsa/pcmtest-test.sh) to check the PCM middle
-layer data transferring functionality. Additionally, this driver redefines the default
-RESET ioctl, and the selftest covers this PCM API functionality as well.
+which is used in the corresponding selftest (alsa/test-pcmtest-driver.c) to check the PCM
+middle layer data transferring functionality. Additionally, this driver redefines the
+default RESET ioctl, and the selftest covers this PCM API functionality as well.
 
 Configuration
 -------------
 
 The driver has several parameters besides the common ALSA module parameters:
 
-	* fill_mode (bool) - Buffer fill mode (see below)
+	* fill_mode (short) - Buffer fill mode (see below)
 	* inject_delay (int)
+	* inject_open_err (bool)
 	* inject_hwpars_err (bool)
 	* inject_prepare_err (bool)
 	* inject_trigger_err (bool)
@@ -93,6 +95,7 @@ writing '1' to the 'inject_hwpars_err' module parameter:
 
 Errors can be injected into the following PCM callbacks:
 
+	* open (EBUSY)
 	* hw_params (EBUSY)
 	* prepare (EINVAL)
 	* trigger (EINVAL)
-- 
2.43.0

