Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755441;
	b=bL9NITsnplGxR2NLoxwLj1HeSBWkpOHFJLzXgFVbRcPPp8RJfwtnxsc4BNl850PK+jyZ
	 s3ooXyBYDATrlhO/TzPt4rTRaxyL/E00ibiziyF9xnaHeJms3yKOcjI3OZBOFau316grV
	 qG055BcE9XO0N5fOV99d9LoAyo/rJe2hdxVwwlQg2sdtLXtEPcPjEDjiupzMEggEbsyo8
	 M62Re1R63yZ8V+OrWSOtCvDzFtncP9P65kDdjBm0PGXat74ij4Mc7DFalvTNGW3/Wgxz2
	 GFn8cmCM/fhQiza+CuAXKYQpeS5+eWsWIe0THejxRke44voYCZ9jm5rPg7Eyj+AUEUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755441;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JCwM8rDkFlQTwEXucCk9793pX+n1AgvmAuGppXinV4E=;
	b=GeOv880/dnB1wygYzrI7bIozmDNzYjpx+5txGe9IqqTGp/TTXS8bu5QImCGO2HjI49px
	 cEObqGTaEflOhfYdqCY3exfbGDtpFHgk11gmxyqGsXz2u83goA4uusOKDROzD3xbgPvPU
	 ZIZlx9khvutJON0HRWbiCuzswiFceEfeC8FDb+eb/1yDwX+M7ykuEmGAZX+OwXU4nfxbZ
	 /7OJ8olNGga/7eK8xz6Io+BJfRNhHrZjWzgygecUjTdPk8rnJP4kwpzQUvHHInsoAo/rP
	 QEdCsSTLkKx7SfsIvBFetjX9MPWpDkY4hxdanqrD3Kj4SGJ/2Xh/DrJYzK/vkRJGn4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEOKnsl0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93390606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEOKnsl0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273D01F000D1
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755441;
	bh=JCwM8rDkFlQTwEXucCk9793pX+n1AgvmAuGppXinV4E=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=CEOKnsl02RzO8hqbvojbfzPkR8mkOX86q0Ysz0E17ryw8jYCQ8JQtkCfsw4cuzoaT
	 zTOoDmNfu5WjMt5NTjd01ELVYIeXAlql2tRFh8MEIRuV0iF1m5ynhDUpWkUmUmpmhA
	 4oIYl9PrcRwiE4pugxrbPC42IXpc+S+p4Ov1Un3bBb936e0l1biH65zc6OpJDqF60b
	 OimosdwY/mJO+fR8VH1dVJVKV7BYUtobGXDKCIKlnqFPCpR3vJVkXnh51u7HUsdZpP
	 RRvYTti00Op4vE03tKSuDLsMOAiXyh62p13+YdriE2PAqpPK3jg2xk+5TpL4sSOOSD
	 7GMpPI3wrvmqA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae22dcfdc3so25074821fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:10:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHNNmcL1CEDv/ac6JSHzyeIzqXC4GSR5ympbrU8xw/J+FNMV7gw7/uPg/kQ/TAOC25WNdrRDjb3UTPE7rQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JiDDbGz0E37kNCOC+uBDUiQYnKJ9pHd2JpN6UMt6pWdKPWBs5
	E0qtnaubSO+bUJfg/6QOoBf49gFsIOGHMxrBXyjl0kl136oy35viAkQ7QlNnxKyYY52ZSFkMkNr
	w52ebo2b9Ee6r70U5OX0L4YHQWvt6Vpk=
X-Received: by 2002:a2e:a814:0:b0:3ac:f011:4863 with SMTP id
 38308e7fff4ca-3ae2b51f00emr24784021fa.20.1794755439586; Sun, 15 Nov 2026
 07:10:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115150758.16650-1-jernej.skrabec@gmail.com>
In-Reply-To: <20261115150758.16650-1-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 23:10:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v66PieZnwGs5XborntJ0q2habmPOgy7kMgQufMy2_nDc2g@mail.gmail.com>
X-Gm-Features: AclHuK8cMu72vW9nry4gtL72qtKKMcqmnvaqAKE5jJJltkSGWOST39D8mXG7bxY
Message-ID: <CAGb2v66PieZnwGs5XborntJ0q2habmPOgy7kMgQufMy2_nDc2g@mail.gmail.com>
Subject: Re: [PATCH] regulator: axp20x: AXP313A: set ramp_delay
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 11:08=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> The AXP313A DCDC outputs need time to reach a new voltage, but the
> driver reports no ramp delay. cpufreq thus raises the CPU clock before
> the higher voltage is reached, which causes oopses and hangs within
> minutes of DVFS activity on H616 boards like the Orange Pi Zero3.
>
> The datasheet doesn't specify the slew rate. The vendor device trees
> wait 25 us per 10 mV step, so set a ramp delay of 400 uV/us for all
> three DCDCs.
>
> Fixes: 60fd7eb89670 ("regulator: axp20x: Add support for AXP313a variant"=
)
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>
