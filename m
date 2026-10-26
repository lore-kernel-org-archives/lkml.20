Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004388;
	b=nJJ1xZwcbkzxwTf12O5g3APfOjA02eMzAYKGnWSI5EVuK6bD4gYRiBjsSpaliO0abo0J
	 OztDZE5kT3bulFIovnXO8XLPX+Ovi3ZtZjFA+pvUDB2VZ7fixAbICtO1lkEV+T8sMHOLu
	 3MaPxn9u1m1UbwtrfF2RN0ZASi0R0l04MiTj5V8GxLB1a5WucuVMq+Ec9JMgXxcIGpQ6s
	 yOq7ZQQrWbtMIEMcwydzPsmhiK6cJYQMn5PfIXqwdHDv9gFQUnapVh0OvTFk95zQt0o/t
	 +06Bw01YEpbPlpQ2DQiJcvKSiMWmA7eEgjsWegEgIcKeQwVVJmTHD8cW2JhVmGq91dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
	b=uUTop1dTQChyJs+7x8uSlTqe7Mw1t5zfmj/A1Bcmr18a4hOmQSaHm40/pKMiT/AA8P94
	 4x6zlq+ElKdzeFcX/yYu5V4n7l0oX8x8qE0HReCPIuxUkcbOyCY3g+jkbS3MhaTNzZvvJ
	 kC2lyneiGXKtb4Mb7Kxq1IBPg/a4BsDPkIdqMu6VpNtppp7IzmC0/sgLYkjARHCJmauo8
	 mPgMcT6QucY2zAV841qCajoRgNACBfUob6yqjt7iv4oO5QX9CFLinCNzswSZwoqZL/O7A
	 av75OPI5Vjgrs5dE9mxc4k1cuEUu6bjRIDyt+D4U8adlvC44lX2o8JD4TfbpIgp1rhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KNGrYKqm;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C8C606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C8C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KNGrYKqm
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so25633745e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793004385; x=1793609185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
        b=KNGrYKqmfIoQx7G26nK+hU0aEiCpetb+aODEa24JtTAW1UqmeHkN8uRhPqBtcvoyIl
         OM+wsoA4rANZUWbhu+xg1RYG8r+spNwUHybHWEaYQS9F8skZl9NtRhDbMXaK6UpTAerh
         oSIK44IDmEf33YtYLu/VRTt4bz0bXGJHlkCz0H2A/NeXdLB1vepv5ExBs21q5Nl81TV9
         f3VGCHK7T5KM9xIe0O/ZkK0bqbaRq8Hj2wnqleQ9YPUnPXLuzQL4qXi/kEbypit6PmwG
         yJoAYoNsqvjaUBDMf+QucyHqNwXJMlO6Bo8O1RR6yKHzWMOzLSpnF48RXrYKj++avAV/
         uqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004385; x=1793609185;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
        b=1brCYN8aiRYAaTQpLTzJZVWAijAPLlXyWNiww1axC6FEMkV2L7Mr6XirLNy13YbkYz
         RGkjx3qABW5p+x1v92tKT/kjAEJ9FrKtR7wIoB1E5aI1dH3GEWz/HMEVcjFuThHTa6z0
         mFSTlJZ8ot4nra8KGKawHemAPUNK3S9oanI64HteBQHyWo3ySAbfU05owd8bUVPgHfpm
         prTFdn+1b/MDKqEB8GW2U0Hwj/0aki8pWbJaciyXc3bxpmlLBRdT3f3aPkYKmLjsDM0X
         xmb0zEHwThuDmECIMyOR4kXZmefxX2fjZ59pIPUemJUmjCtNxa4vY6z5a653V15yHjtg
         b6qA==
X-Forwarded-Encrypted: i=1; AKwUvBwRM2co81mZMI6YWhc6XxA2SoaEhXzdigL0QTiNQpS3DzYK/2zlgEAY8/4OKyOg8MP2d3Cpk4zemfheEZk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUGoo12DGOxnL3bV9rpoIvAGX4xk7ZyOOkoivBn/spnnwF21Jq
	7WbZdJ5WHzJBPYvzZ/FwTMJG1c6E2uUNtWL5wgYgzACVZ+cm2nEOOIRd6c01p3yuMQA=
X-Gm-Gg: AYBFou33u27FZfeOfngdDk18xHfRpIxs0b/GERh36D4lX4UqIrmB5M996025m2ekvyu
	DrND/mbmMG9Mqp8QO3bjuH8BieIJ8SGu7XXsfWZbNuOSh0sIMjs9sFcOARkf46ciSu1cG60t/K0
	/DHzAry3UYYP4sD8R7KzLeOBZ2/iRQpPDeBUQfFEYUr+XQFPyXExLKZcuTb5d9UZ5mpkUErus8H
	2ulxP33XzlBt3/ys3imYgOZXF1/rvm0z8b9EZedBc4gRZBJS5rYXRBOaIBeG/0z3cLRArnBtuUN
	+GLrHbGq2QGcyvi6xDG3D+WaTcLGX13vhnFg742pFMAz+JuiZeeG6MdBonBW6SE+FXRmed6yOJo
	FTm+xlRXAkLYiOlmdbJ3genLKwI0fgy54u2PxjUVGw8lUsZc3dnVZmdcaWtyrdFU/dtr3mYkRjq
	C3afIyJA7cRM0ZwbbnVDPqY5Fdp66mONM6rom00IDYXu8soES3NsOXQ0hF2f7MyhCf92v7EpFFH
	AJ709oyScDT1LIhOP5bqgYmqIG0kLkzmfVPDCcJO0Rp165ibYOV7dvJVLjGdC5ASlT6h3ufmk0=
X-Received: by 2002:a05:600c:6384:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4a35ac3acb7mr105232365e9.3.1793004385073;
        Mon, 26 Oct 2026 01:46:25 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm146277845e9.2.2026.10.26.01.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:46:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH v7 0/7] Add support for S4 audio
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
Date: Mon, 26 Oct 2026 09:46:21 +0100
Message-ID: <1jik2okfxe.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 25 oct. 2026 at 20:23, christian.koever-draxl@student.uibk.ac.at wr=
ote:

> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> This picks up Jiebing Chen's "[PATCH v6 0/4] Add support for S4 audio"
> (and the tohdmitx S4 patch) unchanged apart from rebasing, with
> Jiebing's authorship kept, and adds one fix on top:
>
>  6: g12a-toacodec: fix the S4 source mux read-back. The S4 DAT_SEL
>     field moved, so the mux always read back as input A and DAPM never
>     powered the selected path.
>

Jiebing has posted a v7 already.

Using AI is certainly nice but I would advise that you slow down a
little and get used to working with the mainling before sending 7 series
in a matter of hours.

> [ckoever: Jiebing, if you have a newer version or prefer to post this
> yourself, I am happy to rebase the fix onto that instead.]
>

For example, instead of this you could have tried to ping him privately
before trying to takeover from him. He would probably have told you
that he has already sent a v7 and (I suppose) is working on v8.

So please be patient.

> Tested: HDMI audio up to 192 kHz; the TDM-C to internal codec path
> plays without errors at 44.1 to 192 kHz (not listened to).
>
> Tool use (Documentation/process/generated-content.rst):
> This work was done with the help of an AI coding assistant, Claude
> (Anthropic), used through Claude Code over many sessions. It did a large
> part of the hands-on work: it read the vendor kernel and the firmware
> interfaces, probed registers on the board, drafted the code and the
> changelogs, and ran the builds, checkpatch, dt_binding_check and the
> tests on the hardware. I directed the work, reviewed every change and
> the final patches, and take responsibility for them. There is no single
> prompt to quote; the sessions were of the form "find out why X fails on
> this board, fix it, test it on the box".
>
> Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
> vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.
>
> Christian Stefan K=C3=B6v=C3=A9r-Draxl (1):
>   ASoC: meson: g12a-toacodec: fix the S4 source mux read-back
>
> Jiebing Chen (6):
>   dt-bindings: clock: meson: Add audio power domain for S4 soc
>   dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
>   ASoC: meson: g12a-toacodec: Add S4 tocodec driver
>   clk: meson: axg_audio: add S4 support
>   ASoC: dt-bindings: amlogic,g12a-tohdmitx: add S4 compatible
>   ASoC: meson: g12a-tohdmitx: add S4 support
>
>  .../clock/amlogic,axg-audio-clkc.yaml         |  18 +-
>  .../bindings/sound/amlogic,g12a-toacodec.yaml |   1 +
>  .../bindings/sound/amlogic,g12a-tohdmitx.yaml |   1 +
>  drivers/clk/meson/axg-audio.c                 | 165 ++++++++++++++++++
>  sound/soc/meson/g12a-toacodec.c               |  51 ++++++
>  sound/soc/meson/g12a-tohdmitx.c               |  80 ++++++++-
>  6 files changed, 312 insertions(+), 4 deletions(-)
>
>
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
> --=20
> 2.56.0
>

--=20
Jerome
