Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D0D44AB7A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844525; cv=none; b=ZjZVFlrtAO6GANfafb45rZH6VbPR9rHEpdqvL7iKRzpK5xTafNFM22Ps/khhgfTS+RUHmuk9fSzjlu8P26YsLO9AECo9gduSyWkOinRZRlPYDJneF7t0By+50g2H8IU8aVnVS03o3W/Y33RTaHkYyyTYv2kve4u84zEldHCbMto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844525; c=relaxed/simple;
	bh=nr+YQ7N1k8qNgaWp+FXDvJKF1MvgrJIxfO3fL5291fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGff76B/p4gP8P8QxwAHc4Uo4t5ETE7VcujnGZY/7QT5fD4iDqHDexfIg1b26nfJHQ3gbFidnkJUaqLHqCi6YK6COqHd/nguZejy/Oz16wPELbwTwmLsE2MfPE4JAf/gm6MjAOt8pQtRd9pzd0x/7lEOV6WJbtEc8NRaRl93Nus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuWgErga; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuWgErga"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd54610so2286629a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844523; x=1791449323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkYtUBxUyQXi2wHjivuAC69Sw5c4fAlKZiLrX6CMriA=;
        b=EuWgErgaYuOiZ5ZEaQb3fXHHDjdms5ZpY+RYYBeBFVq5EuTebKSdGjwRvcsV7C2Rzg
         8+my/DHwbmEKrXPrh5GvEkEDKl1xU9MpSSplFPERMqXx445Wkk1p/Vw2O56p4WRdKZaA
         Eoj51JZsnRZ/GLFRWfUkU5W34yB8acQ7eJbmlQtJOoyi12fNj7howR2ewNZ9o6LgFOJi
         tAnutz4J2cAKQQlw0Ah8ubuvU1gxehdCetvO7XEr1N+TOlWcnM5ebhSuuYRjK5bQzwXu
         RhIFyvNE5KQt3dsQ7hJPDHQ0HC+vniJxcNVmSRiJgxf4DxN9y91+tXknasbNgFyNluT2
         hhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844523; x=1791449323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkYtUBxUyQXi2wHjivuAC69Sw5c4fAlKZiLrX6CMriA=;
        b=HGHlgMl2OImEPyOmiykn0pAspkYzsuTBOBLc6sI9nS6aviSVwCnUs5FyzOC3KY/I3C
         TePjm7Miwyr6BbLYLySrtMxYVI3GcZqsSFYF0GJy7WA1KkQzjPirxhX0MCfEWrYzbAsE
         +8/45Dj2KnqZv5vQ+bT8A6u3BeGWOCG4/6xeyLagN/DPvQDUESMkEvz8gOci2TBTWs7/
         LieXqIgSWvyQLjYYqN0w+udkt4VX5OTW/C0+U1PnqveZoBbVbSbn7SXNQQ4AOQiPj9Fk
         z4jLMG/Jozou89doYwnSEBMmXfkezdag2w3OtHyJIucVrOVKvJwFsJjic4IW88RgNb4b
         M/uA==
X-Forwarded-Encrypted: i=1; AKwUvBz1SCCLlpvF0zecHPizhD89IovZw7iAcoo6Rjz00lNQzT4zbvUIHlVO5jBGTka3Yqwg9Up6ccouWTpt5sA=@vger.kernel.org
X-Gm-Message-State: AFuF++m5RYsJWXHSosTmO5vubjzxaU5j5G2Xefc9g9ViuHd8vlZkLylC
	ta1btSFf0dHAz7HG6/mB8vVcoIN0/r+EEXeTP0tSvro80vmlZUhkA+OL
X-Gm-Gg: AYBFou1aGjnJ3E0G2Y9BHkXHxj31mkqR/sH5nh45r/mRd27IPVqqtXfkv2Z6rAUpOtL
	noN2T4hCzt9IUCcvURpByQaz6r1On5n5GLVPqyHiNICq03LUSxU+WQ1bJTBL/5jy3MiSRyEO8pP
	6EGwjntOcmvEyl0fYSTTE3png8aEdDHte/HMcgq6cIn0j9ZJCT49Wes7QIm2UBfPHUH/uLRXCax
	AX0a206fSaQP3DkhlRVEHl3QSdQJALWHA9l0pGp2TiH1V1mioEMhabgvhYCZ5Kx3H85zpZKmz2Z
	nzzWKvcRx6mz5JfISK68WSW5ZUdoGi5laOPNPlMUb3Qk8aubN0vH6QgfpgSyW9+M3XVAliEfu1y
	o8RyPwaz8JQLGPusuuGFWG4tKtnCXzfL9IFIWeBRpmr8oyoa3XcxjaS3UcDsudVDRPOuFKizhfv
	VCHgx2hD2JSzitg0HGz+Wk31QEv0ZjBq8p+Q6xiSCvFagXQcoYrbsHScET8RoZJIgQh3wYinKyf
	DUKsSvSex5IEiIGm6NP6Wpo7ZvsUtXEFi+H5Rw2V3lpVNCrWuSBogk=
X-Received: by 2002:a05:6a21:9218:b0:3dd:85a8:cacb with SMTP id adf61e73a8af0-3de9e8a898fmr4391298637.34.1790844523436;
        Thu, 01 Oct 2026 01:48:43 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e546039dsm1125695a12.8.2026.10.01.01.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:48:42 -0700 (PDT)
Message-ID: <92216f9b-6c8a-430d-9bca-eaf583106a3e@gmail.com>
Date: Thu, 1 Oct 2026 16:48:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
To: Joey Lu <a0987203069@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-3-a0987203069@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260929020854.1282339-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



> Add the USB subsystem nodes for the MA35D1 SoC and boards:
>
>    - usb_phy: standalone PHY node with #phy-cells = <1>, covering both
>      the OTG port (PHY0, index 0) and the host-only port (PHY1, index 1).
>      Uses nuvoton,sys phandle and HUSBH0_GATE clock per the binding.
>
>    - usb (DWC2 gadget, USB0): phys = <&usb_phy 0>, dr_mode = peripheral.
>    - ehci0/ohci0 (USB0 host): phys = <&usb_phy 0>, companion pairing.
>    - ehci1/ohci1 (USB1 host): phys = <&usb_phy 1>.
>
> Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) add pinctrl for
> VBUSVLD, PWREN and OVC signals and enable all USB nodes.
>
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
>   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
>   3 files changed, 137 insertions(+)
[...]


Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang


