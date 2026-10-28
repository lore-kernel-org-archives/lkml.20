Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190373;
	b=GXaMQE8a9/+hLqrWZrKWCb4+TEkGLkI9K7kn/kWu7cEyXNlnmDsor5nS6K+rmlNQDaBU
	 OLaY7+q3Bew/3HN9/czPpJDkmvV6ZgPn3oapGwVd32j222fsvOhSeOxePKdZ1DG1vyz4h
	 Sf9J2Vl92xoSGnE18iCwU1sniKy0tU2ELFLkphX1a2CAEDBptrP+n9C6bUxv5Im+mpm9R
	 sCdGxcnt9aQBeegs5Op5wujSnYZp9bcVXmF/WUck6lIrm6SHVWaauXzNSA0ohkaocQ0fF
	 D+xdrjknjoN/Lmvj9NWXt4mD97OSqN9yrXEYVShhRhYLA++JYS5q0vPgBv0IVDYnrjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190373;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=y1Fmkd9835TLSblYAe+n5sapTQ3vTxm4rzuLDs9ya2M=;
	b=TzfUt2L1yA0/FvhYM9Fcr5rNp0WDQv3P/veDkowh0KvhDY0u3lzqdKxbapQvgl1Ltp+h
	 cal7zOF2b/T9Ndj1sx2FPXBRZRT0w63SY21XCd9nCPDCRCIBPXDTcuZsirT6dMDF/YPkI
	 mGUJ9l0y5m6sgfj2pzJXQtZGXXtkWZj7Ler0KNHlt4WS49BHdUZ0IC3Quo5NZnWN/At46
	 0iYvlPcs7P3s6iE+k5KNyJeNy3wKTNFpq49nr5EjdWu+AfrxqV6dSUJjAwspPZtoGkrab
	 Y9nNxaRy/yweJaNLTimC/XfKSWIuttx2F+Ckm68D31BiMVo5P5/4tmYJ9D3rogq1hGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABQ7kFfF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6972606A31A;
	Wed, 28 Oct 2026 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABQ7kFfF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BF01F01825;
	Wed, 28 Oct 2026 12:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190372;
	bh=y1Fmkd9835TLSblYAe+n5sapTQ3vTxm4rzuLDs9ya2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ABQ7kFfF1h6pobuFoubwuWAWHJwHoc/JOpSnKfTnle37ApjBbZNK79j9H/XnrKFZE
	 NP2TnphwLUL2urzVDDkVHuziObcLs30E10p+KQowOCoMo7k7dygRsvJe/wTrTFfs+h
	 wp46P6o9+2SBe5O0VtjMhgwCtkXu4FV+yEds4dKWIamkgYO0VgDxyO73xkZKZix1UK
	 TdS0Aqvt+cPdeVT4lL+Dc08tWwJCh7Lu/MvZBG3pQ+iW//lA+7nEUhq9q3CDmV6Qxe
	 2Wer11Rby1Wgeh/WTf4yypkJ9cZyCPOenfEBcrBwbcAhFLZvGlnc9YXrR/XUdVHCkJ
	 5896xi6s0jOOw==
Date: Wed, 28 Oct 2026 13:26:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hyunuk Son <hyunuk.son@irondevice.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Kiseok Jo <kiseok.jo@irondevice.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: Add Iron Device MA5311
Message-ID: <20261028-prudent-godlike-ringtail-249ed3@quoll>
References: <20261027093232.859755-1-hyunuk.son@irondevice.com>
 <20261027093232.859755-2-hyunuk.son@irondevice.com>
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
In-Reply-To: <20261027093232.859755-2-hyunuk.son@irondevice.com>

On Tue, Oct 27, 2026 at 06:32:31PM +0900, Hyunuk Son wrote:
> The Iron Device MA5311 is an audio codec integrating digital speaker
> amplification, analog-to-digital conversion, and audio DSP functionality.
> 
> The device uses two I2C slave addresses for separate control and ADC
> register banks. It also provides an active-low reset input and an
> interrupt output for fault and thermal warning notification.
> 
> Add the Device Tree binding to describe these hardware interfaces.
> 
> Signed-off-by: Hyunuk Son <hyunuk.son@irondevice.com>
> ---
>  .../bindings/sound/irondevice,ma5311.yaml     | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

