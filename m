Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964167;
	b=bFL2gi49rVcva9lQo7/U00GG9pxTJ/bP5/Y8JTalrem491UMXwRfWEyYiQitaTlfFbn5
	 0A4W17PTQMbWBWVPXuQb7SBUlf0IgnSY111qcOBmqG9Dj94JRJgxepS1LxH9++rf5XhGP
	 WjbuH9g4CMEToVQiGY3HnKN0B0mJGEujfUjvAIT5/1aHxVlTLUQrGqa1BC/mhDaaAHDt7
	 MOiS9Np4dy0hEmHyFXNix70ZaB3NEb3HUJQEnvhL/FqDuKzJIlsoihcEJKwD59PvsLJh4
	 fMuQY0xMJNclPBa0j8k5KwmiTWifr1zP5mHeLZVzfSUWSqgIWpWad/EX0MYoSfeSnyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ieGADuHKQdAMTXfJjcI0pPXfovk5qK/wiv1qHG7Gn7U=;
	b=iVA3vWNtnpkdIXNNlXi4T9n5oqChL3nN5EomkdrewaLLRKT97q0+uqnt/C+NF146YBAA
	 wAwQNBrgMlzBSfBQlE2v9TYobfqPGu3AvWfxx5ajQblUqh4lOQ3C0YdVsIJCGJbS4oiJQ
	 w8ewZfkEz+NU1kluKp3DI2OWG+vIeddP8mgUhxB0R8g8K64RlwvCjG41ThNJpTbLnhw/y
	 Dw98qaZ9rkR4nLfMFifG8oQIGgq89Q4COaka4sRUiTdVoUGWgi/gHaob0E9CP5Ps9aRuL
	 LqMm4C21L1hccwA6g3qnHRN9Q2cJhRRGg8Zv2P65pll7/3FP2VYRIxpqCKsGx6ye6zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A56bH+AK;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E112A606D81B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E112A606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A56bH+AK
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491971ac844so449929f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793964165; x=1794568965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieGADuHKQdAMTXfJjcI0pPXfovk5qK/wiv1qHG7Gn7U=;
        b=A56bH+AKoKn3WxGkU/3FShzWyjMsOWNXmrDjIMbboHHrTJksHZGtdhCYMn9Lv90sC5
         rkYXo1y7hX4deXW2sWOoz1Ac2mbU5okpF8OWrr7bm1GrRw8jBtYFo6a/zBui61xax3pb
         MxM+Hgcmv4uwI9ilLgwv08sZ5aBb9rG6kDxrv/no5lF61erZujFajEcHhgPTadNbLwon
         NXstFFc5hlWtNweNmvNby/AFeMq0ftId2PcCN7wb8fvPlTXFADo0HqfVVJ7GGN30q57W
         /D2t9o9OspR62OBxhuhrHVRGv8sJfx7t8PVb/a5eZappR2Y4uMYS7v7j+PqntEt2VIq6
         4Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964165; x=1794568965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ieGADuHKQdAMTXfJjcI0pPXfovk5qK/wiv1qHG7Gn7U=;
        b=1zYFs4uth5cWdLefd3Ju3KI7L7B+NOx18UAs3tkxjvSupbezC3ZZBK3jC28nxLuM0s
         IP5MdA9xH8kuO5CMgOGY++vCPud2u4W15cpyjINp526CY4pT0GOPujzlPu2jDsUtO80p
         KdyNNvGq1yaIpOmAQTlclzHDIFE7qgTGlPhKS7bzk1k49qaeCDNvNtOpt2Np+zVQaiLr
         9yM8xSW1SoX80tVr2MVeq3fDcNZ9Su5rKUMUsRVwj9QgxxAvCYYu/UBY5yAeU7NsEtrr
         O8L53ueBcYzqfmYSseNj4aO9kqJ/4M153PIX8TQqM4QpvGOwpE0Zq5CKqinc76svLAI2
         7xpw==
X-Forwarded-Encrypted: i=1; AL+hErGqE24/UwAN2RmRfYuyIx1AyHZIHLL7JJu4h2P2P40NYs/UI/MOY0RX2DvyGfrIZFP3zzFdl5Bj+EYOhUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FbCQAcxgPZ2UAo9auyt7tT3D4/gzhdUJvn2dcuLad0wnGn3v/
	dKKk2td0WCU5AFFAnvO43iQyuZjtEZev7cjgZzo4+u1GF/3w4nKijZ0xRTtQJpvUivI=
X-Gm-Gg: AYBFou3cv4B5p8ZEqp4I29fqSHqSAb7Ey0zQbKallAXrq3BIFt9XrE3eS3J2Lk4QZrS
	IIJRNaB2bE5Jhe/ioSDbaslKxrHOPErwzZE4U14jPCx2O6UCoqFIpGvklmOzN+K+KmtGSPbsWRt
	/PydANjREdhua2RQwWNcKbi5UAsgMKyplno/AP9WNAVaD7HGrWmxKtY69FoK41D270xes0pRVRB
	0LmbrboUWUvsEgwovtbJ5nG2D7JFV3cw4GeN8kBeqIyBZkyTL8j4gaoKYrOaehZLYaoI2NLmq6N
	wuh0K1fx91PEzY2Gg+4ClzWhOMFC7GE44xpGUVbDBfvkBnPXQmw4msGO1c2MozqZxmydRc8K/LI
	YX4cpb4OjEhe5GsQR13llZDjBLjlKlG+FTK80Go0G6Z/G7eyBoguXT9I4OE4MaUkkyGVzsDyTal
	fcACh6RMCc27zZgJsAraMS/WQFNnWvDy43pw1os+94Jju2VkPET0bHGcRJIlfruq03ADiImrVSF
	9+eq4kOKousze3nxQFASK52q8W6fHuJQBdtuJb7oc6WfxWaCnMDv3oDJUT+VIW37TOFl9rw+gsn
	39MzXG/oJa49yvND6ifyfNxGBSLhyIclS46p1VVNyUgVg+rBjFtI+06wVNwL6o5tRlNILSFW690
	uj1ddBT/p
X-Received: by 2002:a05:6000:1861:b0:493:803e:800f with SMTP id ffacd0b85a97d-493803e802cmr669893f8f.29.1793964165187;
        Fri, 06 Nov 2026 03:22:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-493070bde9bsm2890244f8f.36.2026.11.06.03.22.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 03:22:44 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: display: Add the Ingenic X1600 LCD controller
Date: Fri,  6 Nov 2026 12:21:28 +0100
Message-ID: <20261106112128.14213-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <09A3F895-9007-414E-8EE0-17BD18E63F53@goldelico.com>
References: <20261025191640.13592-3-olivier@mgcrea.io> <09A3F895-9007-414E-8EE0-17BD18E63F53@goldelico.com>
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

Hi Nikolaus,

On Thu, Nov 05, 2026 at 11:27:12AM +0100, H. Nikolaus Schaller wrote:
> The manual for the x1600 is a bit ambiguous, but the x2000 and x2600
> documentation identifies this block as the "DPU (Display Processing Unit)
> Display Controller" (located at base address 0x13050000 on all three SoC).
[...]
> Please update the compatible string to "ingenic,x1600-dpu" (with "ingenic,dpu"
> as the fallback) and rename the file to ingenic-dpu.c to reflect that this is
> a scalable DPU driver not limited to "LCD".

Agreed on the name, v3 uses ingenic,x1600-dpu. The X1600 manual says
DPU too in its register and clock names, and when I checked the driver
against the X2000 manual it came out as the X2000's DPU without the
composer.

No ingenic,dpu fallback though: writing-bindings.rst asks for SoC
compatibles rather than family names, so an X2000 would be
ingenic,x2000-dpu, with the X1600's as its fallback if its registers
allow.

The driver keeps its file name for now. It only drives what the X1600
has and what I can test (parallel RGB from one plane), so the split
between the core and the interfaces, and the X2600's rotation, is better
shaped by whoever adds the X2000 with a board to test it on.

> However, this approach triggered a kernel lockup during boot
> right after successfully running lg35583_get_modes().

I can't reproduce it here, the R1 comes up with its panel at every boot
(with v3 again today). With nothing on the pins I don't know yet where
it would hang. If you get a log of it (the last lines with
initcall_debug) I'll have a look.

v3: https://lore.kernel.org/r/20261106112000.1612-1-olivier@mgcrea.io

Thanks for the review,
Olivier
