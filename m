Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269519;
	b=y1Lfe1P3ECsgY/Gwt9MHDmd1A2AzlLq69J1D0TmG4+5FDFLDtr/uLBla2Ugp7l+Qe8jw
	 OnguHzJTsOQu9+kgC6NSmB+9z4DnFqp613ySwm6Ybt1/N+E/FBCY1GHzkuDhWK3gmXHa8
	 HW745pwaTd36luOmkfmXvbN+nXbEbFm8v+qY9EcG3janfymd/VquUzlboFvFgiP6zBtTi
	 FfV97NIxwRcfOe2EzykdGBye0vwuFLauOxmeqdR3vYF2GQNM8SdG4hsMsTckl2RfiTPyy
	 f6InmMvEeXZvY2AHOzPitTUWWM0yrlkl7wFgbK+GQ3oiNE44H1ClHA9bnsvFtnjSHxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OtSElUmkgSMBmtpp69kzqh/LAyhlzAFVWeVHo7DNDyY=;
	b=Y7ytslpaj8k4MnXB2hne8GPwjxxZwtpijYQmcae+d2UH8SnlCQHTUYbGdY4WpgSLw8Z5
	 d87vaC5u8jNORtFuWYinX+9FOdCODKUFJ9FfrMZtGdb3717EUVuvJz4FiJ5vnIzk95Cdu
	 KECXzZ93/7Ntn7xRVJqBQ65ffMw69TJWOQlFNwUNzCJmizs59tutouAq4xwtHf2Iwcp/C
	 HCFOIcb1lMLGstJqoOJqd2vNhYu52WwDm/JM4jajk26bbbj9NxIT8BLUCQw8olcAMX5T3
	 CzucamlXMJsKqyy21WMhmtXlBxw8kTf9Na8EmCNz3nGKg2Vmoe83afyIxuCVBf5a8ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bRbWJS9S;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B975E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B975E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bRbWJS9S
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so18252095e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269517; x=1793874317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OtSElUmkgSMBmtpp69kzqh/LAyhlzAFVWeVHo7DNDyY=;
        b=bRbWJS9Sq3WUrvm1K5CCDr/2/y8KgqJiqm0xxnpw/ojea8hd/zgAwmJrEL71ITjiqZ
         t4aGIfbQtGFCXTpFU5selcxPoZVOx81+BOYn78zUeUvDXX92flM8Ncdm2ekyE1btDhn+
         xE2vof3zAVSlu0LpRS+SkvNBvrfGH3o2EShZVHeTDrQuPYXRifPOLwmr7TJNBcv76PG3
         VKVW2hDUXmw/+Q1JHgqUL1Uy8jnA1dL0RWSA9Ss/UFFAmOvD0b6it/Yc3FXIxoA5+hZ5
         H5KSat7xyYQQ+6tHt00CexmB3azBzcPyGeXfKUwIKmd7nKBOwScnTDtG4osQsIaGxvqQ
         CJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269517; x=1793874317;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtSElUmkgSMBmtpp69kzqh/LAyhlzAFVWeVHo7DNDyY=;
        b=BUQACfmAx6+Kngr+/dRHnFP5ileMww22KiaogjnfUQktMw7Be63PUycN/wmybDv7cC
         ZQXcFXZboqenWdmQFIWco/xh00+pRByBObLImFmFf+AxewLXCogkauVsB+wdx2X2XdLq
         ti6jkAUNgpJhduZl7aWuUm9LpSGQ5JHn2qx3ZIATpDEewhgrcEnNX+JeYadwUJeDchBU
         krQ4BewxS/INoPQlhJHOJKwJ0W6NcCJOfvFaJKzGCW2Wf/87u2CCq+q9q2l3XdWMAaXR
         4BRa5gSu4RtujPVjmKR60K9kXvJib9afYaJhFgwZ+xI71wmZf9CYGkM3X+bh3YAdloe3
         cZ5g==
X-Forwarded-Encrypted: i=1; AKwUvByXNua0vcKYXtp221+DUW9XucsV0Boi5WCj4dq13bZgA/oDixeJLZhCQi7b3fSVtZjpzDUmtKCWxdBuBWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcJRHbhlWeSEpgX+OqdEvbY+aggMt7NvyfRW9/XRjYLkwtKhIa
	etKI2NVsiNyGNI8UxEek2YFPH3T5mlLaRpkFldc4eW6E3GI7pL2X+zI=
X-Gm-Gg: AYBFou07NIsULyP5cADBeMTfrUtt7ZsZAdRU1hZ9+B/QslKurQC1GaCxAr8PjNWFVj1
	Xg6pSNSUiAGEGqzVU8mjspiHX1N6XVgFwKroaD+QoPGH/qVaKNpLshCKs25ASvYvj7u6MauHVTY
	EVzF9ElPO4sqk3OTiEohbzQ9uDDJp2eJ+kEqf0NCp2pKBzh5u5Oc3NmcJG9vJ8hlyY1oz1Tj6ap
	+he3SNX8WIRkuaZjlVaZnf4v1w32LkU3LmQSxQnJ0mJNbLvsAkPERbXWZRVFcnePu1zaHmASn6F
	WfDjeOP/0oN9Yuw2Lc57gYQ2Fs03VJeJDFoaVUeHULJsOzbn4b8ZJ9MT+Kx3odm1Gfs/PGSPuv+
	HnjweHIMCX7KUZzn++xWOkVaxoePzeskcUv1fnIkOn34w9qSH+46A3qtKmEL6hqK0iLGUbh/t73
	8CItRibY67NdL2SiHnRP7GvnEWS0fypqj1cwr3WtvS2V6DVFW6DlA6H1Gj52AlO3LMzLGUCt+P9
	GqK1i+fLQmdcgo+wLQB46pNlM2/z2LN6vbfn0XY75AyF3JYI4oU4Dq4oiLGRtOwBF2J62lTdA==
X-Received: by 2002:a05:600c:1391:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a966c41a4emr112142115e9.9.1793269517096;
        Thu, 29 Oct 2026 03:25:17 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd49afsm34041196f8f.35.2026.10.29.03.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:25:16 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v9] ASoC: wm8994: drain delayed works on remove and probe error
Date: Thu, 29 Oct 2026 10:25:15 +0000
Message-ID: <20261029102515.3417777-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026112212.2519775-1-tristmd@gmail.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

wm8994_component_probe() schedules several delayed works to handle jack
detection and microphone status polling.  If the component is removed or
probe fails after these works are scheduled, they can execute after
resources are freed.

Cancel all pending delayed works in the error and removal paths.  Guard
cancel_delayed_work_sync(&wm8994->mic_work) with a type check because
INIT_DELAYED_WORK for mic_work only runs in the WM8994 and WM1811 code
paths.

Fixes: 99af79dff5a6 ("ASoC: wm8994: Ensure we get a notification on startup for jackdet")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes since v8 [4/4]:
- Guard cancel_delayed_work_sync(&wm8994->mic_work) with type check
  (WM8994 || WM1811), as mic_work is only initialized in those code
  paths — addresses Mark Brown review comment
- Add cleanup to probe error path (err_irq label), not just remove

 sound/soc/codecs/wm8994.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index fc9894975a1d5..30a164796fd48 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4563,6 +4563,11 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_FIFOS_ERR, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_SHUT, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_WARN, component);
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 
 	return ret;
 }
@@ -4604,6 +4609,11 @@ static void wm8994_component_remove(struct snd_soc_component *component)
 			free_irq(wm8994->micdet_irq, wm8994);
 		break;
 	}
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 	release_firmware(wm8994->mbc);
 	release_firmware(wm8994->mbc_vss);
 	release_firmware(wm8994->enh_eq);
-- 
2.47.3

