Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502007;
	b=XcQWZdWokBWsj50BMf4N4t411ifXVjtkQ2KBiwcvlvey6VQK0Y1D2G42g0h4y+enVr1A
	 MZFsGMui8ua6fa8V/mtTFgbJqcqLGKdmncD22eK+hc46eRlqcMRLW23lt77ZwiR8laBZc
	 jlsEUx1OpX8XuaNbI02+R9Cq5Ms8V2sdUN8vC2GBex/sNSfjPlaccctCGEmKt9otARWxb
	 cNql9sGXDL6uBw7M2GAbLSgOsgLmGR3aFQWHh5qWgp2guLfKqgMhbAfnj/qHU3u+EcN/f
	 XcUnrL6tOdnQ23ER6aGUxgVErOdcJmXPJ/vDpCEp0JHsJ7qD73IB8WUBxOFHwHupQ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502007;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=7Xz5yxwYccCRdcBBh2Atm6NcgygrMQamQyqFOlgMgL4=;
	b=Tvb1ZBm715+OPYdusb6MCYfd5kLVuDfm2PvV2ip0S+2Jn6rJQ/FesWEbBpN2x/uY59T6
	 40lBMf31WEald5U5lW/6MX730h3h1dBjKmzh7mzYkdybciOESaloz/1p86O7WKGVLyVsF
	 8YmwBJ6X1ZKGKuv2qIVBTM8nr8/DBVwL84XEeMGpy5Naw3wwB58k7FCr3uILYHEKGM9gE
	 s9DADqjYuJhwsYT61Q3CuDiGmyUuO01vnmHWPDp6tFJEDhqPuaqhc1gwc5G4DqvQoTsC7
	 YhnhVrS2+TxrXE2mjq689nHGCc1ZJaWhaz2ZftfCmHoYITSXwJTo9V9sDw+qzMIvz3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dnDWpxa9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B48606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dnDWpxa9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2495B1F000CE
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502007;
	bh=7Xz5yxwYccCRdcBBh2Atm6NcgygrMQamQyqFOlgMgL4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dnDWpxa9l97VSPrUOTRkA2Xsba7JqFur9sXZcDCXGjJfy0OQyv4T3nV14A7oMEfwl
	 85/t8eWFPmE/KXIf3RpnD6++Ds5cB/2VP1KUzUNVipjJLxjwrtASlTpS7k4Itt7jKI
	 Sthg7BN5LZKfG9BQ+wk7KutGBqQLa8y7XV+sXdzlivCU4kW0NRCAKr/Kl9din2IwQE
	 +Tcj1/IWKQbXhjTZoB3mdo8ZO6D8dRFu19gGN8SlKeeHyj5a0exVvfg4Nki7aCDUKi
	 i7mGMJnBjQt5cOwQBaIWFlwsUA4XPiRMPQOhNBeJsENYGA2ZMQ4efq/e8XaDibURvg
	 apqVgoYCUHU4w==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a98f260f85so26774541fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:13:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwMOTt/t9sJTnACD8VnsNcGDuwzXos3wdEPvkgTRLBenqPs4znnghHx/9ZyeCgbbdjFmhiuf5wp3DhGK40=@vger.kernel.org
X-Gm-Message-State: AFq9FYLavghhgD9N6OFRTnsIwJegoLqFytT5PQ9mTD0xlDa3XCRpcYaI
	bKG2jKw0Fy6Eo8ccuL5izpc/OFwQMHIm/KlDWjyG7lqofDLr2eIQ+g3d4MRoxTKNGph7/3s8W/c
	3urXOZtFXh+ZxaIsG+biWF4yOGRByP3RrsVich4qynA==
X-Received: by 2002:a05:651c:b29:b0:3ab:1fc4:8eb6 with SMTP id
 38308e7fff4ca-3ab292aac57mr24128571fa.5.1792502005805; Tue, 20 Oct 2026
 06:13:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:13:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:13:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com> <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:13:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfNYiKG05SH=1iu-=5=-udUZ8D119FW4NWYv6OONz0_Xg@mail.gmail.com>
X-Gm-Features: AclHuK9cEPruM3nikBKdX3c6tCX1jD7CMOwmmVs7mWGQbc7Fpw7kzXpuklCrV3Y
Message-ID: <CAMRc=MfNYiKG05SH=1iu-=5=-udUZ8D119FW4NWYv6OONz0_Xg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
To: Linghui Wu <linghui.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 11:39:08 +0200, Linghui Wu
<linghui.wu@oss.qualcomm.com> said:
> Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
> resources need to remain available while the application processor is
> suspended.
>
> Teach the Qualcomm WCN power-sequencing driver to use the existing
> SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
> as a wakeup source. The PM core keeps the IRQ disabled during normal
> operation and arms it for system suspend.
>
> The series documents wakeup-source for the WCN PMU binding and enables
> it for the Shikra CQM, CQS and IQS EVKs.
>
> The series has been runtime-tested on qcom-next and kernel 6.18.y on
> Shikra hardware.
>

Please don't send new iterations in response to previous threads. Use b4 for
patch management if that helps.

Bart
