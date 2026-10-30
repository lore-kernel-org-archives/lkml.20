Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357805;
	b=3m2ZUok1l4bXG1kkcCcC1pi6tDnTTFSuSww2G03qCLq6+dn8s8YOua92LZFVbtCJLeEh
	 Pr/XJwN0v1A56Y/kUokQTOhUileuKxz/X7mC3uApdZZHJD6R621mtFQstVFu2h9wrhtDV
	 0W2desbFi8M6Hv7aMV31OCc++a97lwZopiq5qnNK9S/QoKgtjITvGhkG96cVDXBcjDATF
	 ib+5A9l/e8YOwCU++pLt8VzQy7M0GTOC1ajLRRn6nGIepr80DYkyDJADaMUcyMvtnCLOt
	 SnmNw4kqq2RiRtf4buop0ucnjbV4587ciuJkiA4EhyFN0OWlyqWRgmTPo/DS2tCZOVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357805;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NTukFeVWe3gPBUSKesHzqoAHfR6mFj65R6Awtdh2s/w=;
	b=FG8MRX1dkaKTRjuCiBnsAMJozrRWAHmeB9eDzPc6ZT5Si/RzHdpSHw/FElKKrsYhMfmf
	 WlMxTyPWlhZ9fFyM6nexddy1rkHnD506jCZ9sPxFshzQil2WcuAd9Ppuu9srwJGJwOJ9O
	 8k+iKJq2mY6HFLFz6MfYy/joUTENVHsThgHKF9WuR6O/lTAxO2IVTdxj7Js0+x6F7IleJ
	 0gNxzbn8RAhGLbtPVfkUm6J/UVm/xpkuVDI98gD0mN4WxsYmKLsaioa1iybFVS1K9W1yr
	 yOB1bMqvVxa4SjtS8KoIKg1lQJqgqVoe9W1OKV+IR6Grt1YG/YPt+sNcAY2e7bas4Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOlfwdnY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E5F606AC11;
	Fri, 30 Oct 2026 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOlfwdnY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D371A1F000C1;
	Fri, 30 Oct 2026 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357804;
	bh=NTukFeVWe3gPBUSKesHzqoAHfR6mFj65R6Awtdh2s/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SOlfwdnYYz8WckYxuFfVvlTCtKkE1wFzHuUSnNEqKqynJXSaxyMQuNdFL2BUrd0Qc
	 HY6PNBB8f9aEhNp0lYPVnggIo/3OSA6sA3iRp60HqTowDu0mQ37e3C8LGsdaC+r/+J
	 yObsPI+ODTHYEr3b3h6hRg0e4FzvaUA52j4P8X0z9mqXQ1iXXFQesDChQUzSmQeshE
	 p+lxkrC8CiogH9EpNAubYfcCc8JFGzxmSAeYWzTJnP/x+/9NnLFq+8XHKiZhyXgsjq
	 HhZP2U4hl0ej2dWX7QO4kgIVWX+Q/xXQwkEsNzcUgJpy0KbxGa27mVkimISz5ZqZke
	 kRTbIeireisYw==
Date: Fri, 30 Oct 2026 11:56:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: realtek,rt5631: Add the optional
 MCLK
Message-ID: <20261030-industrious-unicorn-of-pride-a4b188@quoll>
References: <20261025145354.3476371-1-romain.tisserand@gmail.com>
 <20261025145354.3476371-2-romain.tisserand@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261025145354.3476371-2-romain.tisserand@gmail.com>

On Sun, Oct 25, 2026 at 03:53:53PM +0100, Romain TISSERAND wrote:
> The RT5631 runs from a master clock on its MCLK pin. On boards where that
> clock comes from a SoC clock output, the codec node needs to name it so
> the driver can keep it running while the codec is in use.
> 
> Document an optional "mclk" clock, as the realtek,rt5616 binding does.
> 
> Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
> ---
>  .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

