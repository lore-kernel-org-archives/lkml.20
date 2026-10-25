Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941878;
	b=rFMt88ePltSiOAgfutmRF8Z0PD52Mfha4luloWPpcEDPf1Iowo3PB4qoNOrgRPGGz1HV
	 5H35Qr9pXIq3VCCcYmEFgzm4AUFjO1KlVxPIySQGELGEIZS5xkAxpd4LNOTlfd9wRyzef
	 7X+Dz1/9J+xqdY5CzmF4tqD0eddNmRU5QcVXD0780C03+2jJF1OWoSh9eMYae7Ed4B5Ll
	 tp7DoR4ukSEKzeQkbzx81yYTb0dqc61qcvXgv6dpLzd6PhI5tlx3jSIrm36ACBxQGPrD6
	 XZj+TXV5Qw6r60ZgT3eOcWRQ/gvtbLEuCVethAJlABGhbqZcsRxa9QAUVFMx6eiEBNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=IPyxHxI8QCk7tgMR65iE29Aq0L2SmeJ7DzhvVjt4aIA=;
	b=fSbME3aK6stEbbAVqdvQsljJmDPzHzhj/k59e8Wmr9+Hj5YUIDsiukjzlYKzxatdPQwH
	 BVe/muIzmFlSdwkCE9iFB3HI7HexQbnKYK6q675HRLX+X6mEdGdg+8pKttovlOJl7ZC+J
	 n6QGM1sE5P3k3c+ru4JbPG7y6QfSRpfl/wJ8LAvpzxAI7o68rOLvTB/6gLK86F4xm/GYC
	 XBjwu71gv3DJuRblg35TJ8q+tDZsO1OVw4fpiXRgCGnPFxzS+kRAoe/keKGrMiD8wpqFc
	 bFkGrTQL4KpTYyBZCMROLoPelU3ss2TH0ZfuIMgu+SNCf8bhsG80xxv8iyGw8REh3Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gMlUYdFd;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4D0606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD4D0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gMlUYdFd
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso8880305e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792941871; x=1793546671; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPyxHxI8QCk7tgMR65iE29Aq0L2SmeJ7DzhvVjt4aIA=;
        b=gMlUYdFdvAQETuA6YIj5DvJs0A0nnjA5nYRIngOybGCA28mWCGlOgRHYWq/eHR6/jL
         /BX0jAZW8kKRXsVlSCPoKzQI5HJt/+J5Y4/PB4qPVxPUbKjwXe6y5ULZish6et3YJreS
         nWMllquRXTaLm5UYgmioTZRM3JANKyWQ2DIkNCndkZDU3p0kGz0ZqVM2fslDVE5ORPUX
         H8DHzt4j4t9QNMRQTqJlPNwRLMSwGvEJZbDQDhcHbrWQ+h8CJzIlbfUTvsw7paI8ucvn
         SiV5e5bo/kImdaoFmZg2omjIeG7q9pudAUZvKxU0TvOx1Oamj0LgGwsM5ahUjas9x0RP
         Z+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792941871; x=1793546671;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPyxHxI8QCk7tgMR65iE29Aq0L2SmeJ7DzhvVjt4aIA=;
        b=ZMUUPZuD74cCMUc9CU3PU199zTyP/ry576/fRhF4IDzMgPVE7qkY3wS94uLCAY5MsK
         6LZRH0EzdV7TuHBdX7YdoJ9x4sh0Bt3LLpazN7zFoYqf36IscmrrWY1B8gXPs8r6K4IM
         hK3GLjXYHgJWydtFQsHJScI6Ls5bp+Yct8LbrGVQ6OS5XduS6Lxk3HgECny4W9OcC/Mt
         /E4uWxyVW283wQsEwNqTyE9oIZOOz/bi+GVCZYYWOKX/WqM0NdUysO4pfi94YukwNDe7
         XHPr6lxusNmRidWEai5k3Um9e+7nuJsXZgzJKuSQavK7Ana5/zB6LgcIvL0WH4QX30W/
         cJvw==
X-Forwarded-Encrypted: i=1; AKwUvBz1FmnzWzF8EOWiiH0oEGctfD1X434aMPhgrGHKIbjRFsdh6+gPvU0HdVB8TlnNcIybo03i1UITCo8Z2go=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0oSAs6z82a0tpTRUx5ID641jqivGeIu0/XbI9uTzzsGEFuNDh
	bSRlnO0uQVcdYCXVu7S6cVeh1LtocixM2pSktbX4FIXuRu/qVEeH/M5G
X-Gm-Gg: AYBFou1rt+GCF7o2D0HeomDPJ/whL1PAYrkl/JY1pjHaB1DfRZpaCzSccVlhmuYTmB4
	mDSNBs9mb3YVe8YL6Rnl0rnMOccjYugH83aKigm4zFXJN5m3rDj/T3lGJQciiuAx5IvBJPs10U8
	HwQDkRT5krIx/RNPuW/y+SAbURqxGCLQEU81SCJybpRgdEtv2JHzm8uBUE5Ql+vDhqby46J3wzh
	8PkZ+PHCZrzCY3vt1GKn0mOxk7RyxU2K6NuE5YBFCwSgyxy40DjAGNvgl6/Ph/X4z1U1CKdWXUI
	ZDBMJ+umslYx8UIy9Gq2Izmo7aOrBK2Q0vdMwKch+H5LIjEPm21QN754Q/mlK0iY42ISSpVc83o
	KPealX+D7fcNiNfoXvsRvsndV4hrMIHcm78M+QVvGwIN2VEkH9lttUhMaOCWASgXXpadx7fHpPB
	frTsn4kTqsLorkLm3pAo3YehdJgRyeSLyAa0UVpX/jHMzeDQXcCQBu147p/GLZZOtSmiyPXXNE/
	N0pfzQBVg1pym59/MbnwL4Sl6k2qfjWqsxW9zUKk6iMrTAY02/NkHD3R4sEx7wq5ZqNxzysz9lT
	FHBoaXFcKKh/dTMJ3uhFuKyKK79hYFbjbPxBfw4CRZwG
X-Received: by 2002:a05:600c:5248:b0:4a1:83f0:7c8a with SMTP id 5b1f17b1804b1-4a35ac3cb66mr82142695e9.1.1792941871149;
        Sun, 25 Oct 2026 08:24:31 -0700 (PDT)
Received: from [127.0.1.1] ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ae28sm132982575e9.2.2026.10.25.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:24:30 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oder Chiou <oder_chiou@realtek.com>,
 Animesh Agarwal <animeshagarwal28@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: rt5631: Enable the optional MCLK
Date: Sun, 25 Oct 2026 16:24:30 +0100
Message-ID: <179294187050.4141843.1375662350308483762@gmail.com>
In-Reply-To: <sashiko-outbox-184258@kernel.org>
References: <20261025145354.3476371-1-romain.tisserand@gmail.com>
 <20261025145354.3476371-3-romain.tisserand@gmail.com>
 <sashiko-outbox-184258@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 25 Oct 2026 15:12:00 +0000, sashiko-bot@kernel.org wrote:
> Should devm_clk_get_optional() be called in rt5631_i2c_probe() in
> sound/soc/codecs/rt5631.c instead of the ASoC component probe callback
> rt5631_probe() (similar to how rt5616_i2c_probe() in
> sound/soc/codecs/rt5616.c acquires its mclk)?

Right: in the component probe a deferral is lost and a rebind leaks the
clock reference. rt5616 moved it to the I2C probe in commit b5c9df40ca56
("ASoC: codecs: rt5616: Move mclk acquisition to the i2c probe"); v2 will
do the same in rt5631_i2c_probe(). Please don't apply v1.

I'll send v2 in about a week.

Romain
