Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341A64F646A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191886; cv=none; b=jF6ncrSbVPrHiZnwIwemSZwtp7147sKFb9BaHcMxFzMBWAf/s2QMPeA0ml02AEhD/MXvTDA6i5qxlrBejfYFonQflenOtiAI2XhySq51RPI8bLKls6k3bfReuvlY46wdbNr0u5TbGkCJ/ic9bPZg7gfuxrfCq88aI7K99HOpc4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191886; c=relaxed/simple;
	bh=0bAYyi3GCLdFiwrtiO9nW4HRWiGG3z+wSQsq4pbpR1E=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Xa292iqdh0uobVIbIUsoZnG0JU6tQ6VRBCALrjCuBbEHtXZgEuYQB2vhqXDS+eCenhEtZaTUXvunYMLSQGSu0HRWDl4TNGBwyLFu8g9BgTeL+P8JSizFaA1hhrOE3FfgOAqv7Udji1vfSwRAvPV7nCHipKTfLl7P/gwc2Xp5HJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U15TE6Ty; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U15TE6Ty"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso7554905e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790191882; x=1790796682; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0bAYyi3GCLdFiwrtiO9nW4HRWiGG3z+wSQsq4pbpR1E=;
        b=U15TE6Tye4M5WDsw35fFP/Oh0EEjWzmo8Bk+GlPMfFg9Z8xiMQ0F6gAWp1AZyVpxxX
         C++x70T0ka8JR9j9/NiHGp18izRt/Ko/M4xBPlD5jAfmNG7Fw6V2zIZNPGvKBlQjAfKs
         c419SoCCExy/qT2RovQBNodJdoJ3uptq8NFTVlpprSFajPal3YLiJphbKZYQ7pObiXLW
         WnhhEaz8lX5z0VU5oa8w1EE7tfXV8+VR1lB0NK0PJduXxmvpy9TxBFFChPp5S+sKZZge
         6l3JSEm1p9Tr1gZOBxzCk8ar748lZeHXROF0FH5u6aL0Z+Ek0Pqv1ICZ/uQEZBqFQgUN
         i/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191882; x=1790796682;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bAYyi3GCLdFiwrtiO9nW4HRWiGG3z+wSQsq4pbpR1E=;
        b=G/gINHZ/+uzIuBNqdTZnmJWR7454vDdlba/CVulfyyUahVDNRKSaHEW8T00/47qM+0
         45g1RqgrNmChqSSAYity26JWIwissny2rWR88oxdze7qkNbcjXShoUFPkFVhN4ZXes4l
         Ds5AwE6QqbfnB5Xps6TuOdPV+tgNrRpTpRHdHyJdTBAXxJsbwSPgF/aa5jdwIKZDzKh1
         AbpCXQy+hC1SIdycxiHNftWCe0+MaON6sr/wbGKRZcC8G+mK60L/dpzWlSPe7sLdHGMX
         478pTxyVczrkzAXIXDsP1e7YCUVUHEVLX9+hozRvxmk3M1ni4otMZ7Ml977XOCf82gK3
         JrgQ==
X-Forwarded-Encrypted: i=1; AKwUvByAlcjahhbsgs5ZxLGKk/BxSbk9x5HsNCtbSaB2ci60th6NViaBAHGxIiVENFM2pKClQTXCkaSaVyKn5LE=@vger.kernel.org
X-Gm-Message-State: AFuF++lXau7C+CDkHsKQIoGs23CqY+D91B9X4Ru7iaWFtD9I8L9asTto
	xe3n0NC1vSN116HeKIk2l+fqXqLCmuGE+Fgi88KwVMGvZhCijlGoXrjz+d92aC0BftQ=
X-Gm-Gg: AYBFou1cvYfe4wotPruYUgJgP1lmSX2n9suC/nKwx2wzkycWpkX4WldP004jWAdxgK0
	xLpS3unZ4PD+Uxj/N09eVsH0saAp0Gds+zFVtogQrM39m4N60S8cv7QB5H2LcanbjbOXUWDoKqj
	T72Xvf4EdwvU6QXirczT5Lr/vrK6ghzaULwuaIle1XlMsQc8ab0OOj9t94Ukpr47yZGknsamdBl
	8Y2br2v+or97zmFQPp3D+YrywF0LjGs479sivHMwHWMf+ul82TbOMBfmvI45I4Goh0/+Ynlzah4
	U0oas4GtbEl+DEnZITFGXNeHeO1aefYqeO9dlItYxz4nO3EArBWZb7/RQ8EdPIqtAkWwlrErUAR
	jws0yIH22RWVXs8/lt4UcjztdmTPaoKF+KAJRjFvdxD5wHYYEBNZfBeUgCffwR9dLWDYht0802e
	/142gDgP8vFiNQaD5SKDoDUwwBZXEJPupMy/9IogVq7F9m0zusxxy2yEPPPVFLXZyaKyBPtLQlx
	NMWclyscJkdfZ9bx767P8y2yGjznvRSZb5gLCGXyImH+67EsAt8Cc1q31UnohWyXPdDDg==
X-Received: by 2002:a05:600c:3514:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-49fe67043a0mr3428765e9.31.1790191882395;
        Wed, 23 Sep 2026 12:31:22 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd42f2sm8534355e9.15.2026.09.23.12.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 12:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 20:31:20 +0100
Message-Id: <DLMY24LXCIJ4.15ZGPGC6UR28R@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <sboyd@kernel.org>
Cc: <dmitry.baryshkov@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <r.mereu@arduino.cc>, <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] arm64: dts: arduino-imola: add support for sound
X-Mailer: aerc 0.21.0
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <ca8cfb43cdc08851db1283df2108e77b22fedc6e.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <ca8cfb43cdc08851db1283df2108e77b22fedc6e.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>

On Tue Sep 22, 2026 at 11:11 PM BST, Srinivas Kandagatla wrote:
> Add support for sound on Arduino UNO Q board, which includes
> - Headset playback and record.
> - Lineout

And "Ear Out Playback" as well?

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

It would be nice to see some Tested-by tags.
I can't it test because I think I don't have this board and no time if
some fancy connectors are required from scratch.

Anyhow, by just looking at this I don't see any issues, tx-port-mapping
also seems to be correct correct, so:

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

[..]

Best regards,
Alexey
