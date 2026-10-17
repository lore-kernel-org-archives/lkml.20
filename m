Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3C31F936
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792231369; cv=none; b=EWMECgC4qXmv9jbABUL5ZLOEjkJIli0aSoyz1kYbo8swcQwBKWLXompqByb+VlotedMH73pnLNifIwq3nlOuSqsodRV1Aku1d222eXySH2EHE56tLqZCOX3mYqGcAnXTMZpxL8VPOvSTW+c4Q9M1avyd5Anl5TnHIEGnKyxzKEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792231369; c=relaxed/simple;
	bh=EBSVCbO8V4DqQ9rlO4rqunERlK9URPSb++T/jRHaW8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMTp7TSG989EqzOx1ITlS6JI3lQJubY6LjSOAaww49u9UJDEjTRgh2p87vpwZCYJXSQHeIf9pplqm9G4pKn4yUDNelQcJssMRsH0dikI7mWilJKETVb5CmqybG7uOBpg62wCTKM2wMSs4rOVnq7Qi6NbArdim33EaUjlQ2GyUEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyiIIEdP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyiIIEdP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1df146015so836125e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792231367; x=1792836167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXVGu8tiuXcZRPdD2PY21S3+U4/Hc9jvW4sjeujnkZg=;
        b=GyiIIEdPueQV/svSuYejsCyWN0Ej4XqmdCrYeAH3N+Q5vrWgBpxxaqS/64ox5XVKKe
         dk5VfDfzUJaCN/l1c81wv1aUFZqD/NjT6BQl85KjnGAnKTG+VKMc65Wt3dcFwpUbDLEU
         S1bXIP1/K9zht/5GTz3wisrOmtjnjmyg5i5T65vRD7uhe1AtMLMfYLMv9TS9J6+2cOu5
         Do0VJ34me95DJyPRIxcJLAKoeZlBfrj7l0b7dsQPs53gvsXbNOXYdpMAEUMw6SJnZ9E0
         9cqMzL3kLORVq3ZvEB50Ep8bNpDpzKwVfsI3/09H8Ghdq+9+xDeN0ca8gqgqMVRBwuwg
         WBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792231367; x=1792836167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXVGu8tiuXcZRPdD2PY21S3+U4/Hc9jvW4sjeujnkZg=;
        b=fg7BEbB82vh3gHkYXMrKvUG9hCltlTFrIKIN/JRncxvCiCY6OM+tBEznQoXLz9a6hE
         uyTQADTJavjGjZSxtaCdcmy5Z033CzTTOR0C4pf+Y33xmZt8sNbZg6+d7wuaPgdIEEdh
         Fy0sKODWUiB0b8s4u/myT2B1bZNSd9rjJxWYPqum6CDwVD7YU7wV/UaX2fXyMcWmk3l9
         6ER4UqVse6JIFe2+UFFObMtau3AUQS9bYWxfR1zwnotwSZRwme4YqR11bahzXvr12ej4
         hId//pFizSN6W2/3EknMrvK0W8JA1H3iYpZ12AKOMSxLqBXN/1ibWzW2FWbri4N1E+ek
         SR5A==
X-Forwarded-Encrypted: i=1; AKwUvBymxfJj03KjJKk6n9ba1gCFmm+taUGDZd6WuXz8LnWxf+AL9paynXX8MSYF+QPOmHmqdBXeluNVgxDDEZg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtZfFI52FacE12KVGd7KtevJCcJ2/AU1gxc9EubgnnQgNa1flx
	bQqg5+207TfravRcJ6N7oFgQ8L0O1Ayd5H3Cx+cBR3tHC9r3CN7y3B8s
X-Gm-Gg: AYBFou2MhHHNkMWyITWvMM3gX6/McFWrJhptUdSC/GswUVyzKISGe7LBzmkT3PJ6BbZ
	QbKMx2kjZerSHP2tNWol1FffOFNbkqB/mRvYQZW8m7keheXBk2OwTpdQykV3zt70gAwyEVGWOFA
	knmevfOGqMTb9chGupTnSWAgd8xu62fyp6sMBo2+o15Npm8VvoKOi6jyqSVWMURYH1kgfv4ZTqI
	AsPYA8aVSq+QSjUBoz/Mt56Z+YYVdlRe7GAbdBlSPpu1vDCZgb+wsYQEn41wh9td//E+pbpQEZL
	o9QE6DuEmn0+F8t54n+d3pvcBxdQorL2oTZuMlQKezW2o/5NlFD/vfAtPyjN/B4RDGslrJMgOcF
	+t5EbOjvVBjtLhV+os7mHF5WpF+zH6I3DmjcxFQ08sMW3KL6erm+AEo55aDSP+Ox77+xTf/ZoRW
	ahdeiV3YbC5TFzW1PqB8IvaMYsKo8q/Zo4r8s/epFZG3uV0MJVvrGlzk0pYAlVqsoev9/P4pvii
	7HWlyYAZcX/xaYrvWqz8/zxbw==
X-Received: by 2002:a05:600c:5251:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4a1d76315acmr46037375e9.34.1792231366607;
        Sat, 17 Oct 2026 03:02:46 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ccc15aa1sm117773395e9.14.2026.10.17.03.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:02:46 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Val Packett <val@packett.cool>,
	Federico Amedeo Izzo <federico@izzo.pro>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: aw88261: start the amplifier on unmute at trigger time
Date: Sat, 17 Oct 2026 13:02:16 +0300
Message-ID: <20261017100217.1451-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <bf823f3b-f064-4dd7-acfd-4136efd090de@sirena.org.uk>
References: <20261014120000.aw88261-trigger-v1-1-tvlad744@gmail.com> <bf823f3b-f064-4dd7-acfd-4136efd090de@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 15, 2026 at 06:50:39PM +0100, Mark Brown wrote:
> OTOH some hosts presumably do have the clock running earlier and will
> now get delays added in trigger which isn't ideal.  I'm not sure we have
> good solutions here given that this is all system dependent.

Right, v1 moved the whole start into trigger. v2 [1] splits it at the
PLL lock check, the first step that needs the bit clock: PWDN, the
I2S/PLL setup and the boost settings stay in DAPM, and only the lock
check, AMPPD, the SYSST check, the feedback and the unmute run in the
trigger-time unmute, which the mute undoes. That is the split wsa883x
and wsa884x make with GLOBAL_PA_EN (the vendor aw882xx driver also
starts the amplifier from .mute_stream). It does not depend on the
host: one with the clock running from prepare gets the same few steps
in trigger and nothing more.

Measured here with six amplifiers on two I2C buses: the unmute takes
4.3 to 7.3 ms per amplifier (26 to 38 ms for all six), the mute about
4 to 7.5 ms (estimated, see the v2 notes), and the write that starts
the stream went from 52-57 ms with v1 to 28-36 ms. With two
amplifiers, as on the Fairphone 5, it should be a third of that if the
I2C is as fast.

> > The trigger has to be nonatomic for the I2C accesses, which the
> > Qualcomm DPCM links using this codec are.
>
> Are we *sure* there are no other users out there?

In mainline, linux-next and your for-next the only user is the
Fairphone 5 ("fairphone,fp5-sndcard" in sm8250.c), whose DPCM links
qcom_snd_parse_of() makes nonatomic; the driver has no ACPI IDs. The
out-of-tree users I know of (Fairphone 6, OnePlus Pad 3,
motorola-dubai) are Qualcomm too. But v2 no longer relies on that: it
reads substream->pcm->nonatomic in .startup, and on an atomic PCM it
does the whole start from DAPM as now and nothing in the trigger.

[1] https://lore.kernel.org/r/20261016120000.aw88261-trigger-v2-1-tvlad744@gmail.com

Thanks,
Vladyslav

(I used an AI assistant, Claude, for the analysis and to draft this
mail; the tests ran on my device.)
