Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C503E23ABBE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789796979; cv=none; b=aECac2WtkER2+/2Pfmq7/66U2lvHzl+6xrNwhL6voFPuBbxh11tcVi6K48fXLTnJLzbIDrRl4mv1gbhRZ9aKhYdnZ8cU4hQJ1p9+7Tn54I8Bk+cO3KiJDvzIhzZK6AVvOOcgecRyK/xEJKlu+8pd0XJPtqtN32aRoaRi5uAbKvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789796979; c=relaxed/simple;
	bh=ADlmP3cuIVH6XDELJaBXIFK0o8CQXGLyOKUW6Gu2JKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WU+TI10lCleMzDmNvalveAv4A/GWulwoTOyrILlHWLbqqBFtDlBmrYKmwTxxOSHuAajlYPZksQwa/llK0ePAf4Zv+EG5JPp19fKUNP+CvNhosovWB+dhbAV7Yzt7ibHJlPZNB+9wlurHNoLSSefxwg0VTz8QqWd3BfW8kimAL6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKFh90yZ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKFh90yZ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1123042a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789796977; x=1790401777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJw+LFtPFh6SoU2BWDHxw9/YHsXZDhQ0lOnE3Vh/h6c=;
        b=dKFh90yZORs92tY4TEA/OqSxrCgpF8Ov7q5UI4RFeE29yqiYXBkxsDPBIjjtDw8+d1
         EFXsTncfUi3jgsvX0S3fcIUWR2PjZnsP/WPxuLA3TyB7wggA0hY7Sz/nnjm6ePYzQ/+w
         70hn62B7sR5u5lh+iuSQGF8jfc6EYd9ndV6Itvp+QjuAcmYBR2Ofer5ZWFj25x5yV8RX
         1hrVFkrIy4akPWKdwoNniX2W3nieJq/uFaM4LucMjdA7S/XFDvn6Hl8Bu0IzU5NK+545
         C/I3OV3KakFIkj8j1HmTzuSPOjsntwP42DkUbZh/iabQ06E+5r0DV/7QAwAG8FLWBK7A
         /3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789796977; x=1790401777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJw+LFtPFh6SoU2BWDHxw9/YHsXZDhQ0lOnE3Vh/h6c=;
        b=a7EIrxtkVI92TCazwOvdnAvrOEaa2kdL/j5VNEKxyNq5i4N/j059ZYom/8usi9ckvo
         88YGZnsT/VfLGndb9Q6BlGQm+2whOsV1hwgIMpQmDkfrCPYPtKJpb1ZoP67MsUkMTNzr
         gaBfP5H4N4FHIvr+Z3lclhzd/a3LwRsylPbhpTdLUZVXG+JeyxwQl3umBzqfTj4T1qb+
         o1ti1/wK4XowACVYjR+G4rp5hZ5OCpiBNHqG1Cl0/lOI/ipx53lvW6SCEI+2qUl1ZvfD
         33Ruo8H/hvbAG3WJ70tfYIpInKKile7NbgTY0kJIMOKfHxYhREyNyA55hMArRSOXhGVr
         mypQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvtmrerhE0pB6xEVYRcQXB2zAvIiZZzkaF0Yke8mb1WsmLvTEXPtpw9aPpkzURsj9z7mHManlqshzvb2E=@vger.kernel.org
X-Gm-Message-State: AFuF++kT3B+xtOenR3oJmEwkSd2WQXOrOVJEKtqNO5PausZgijF0z1SA
	itIZvWy6XLOh7i3RL5cUx1in6arPiFRf2zGJqvlZ9u3CGMgXZ4b9bgVc
X-Gm-Gg: AYBFou3krfHasJuvTMe8PsYUaNlmOyTqN665DW2JhHw1HEr/pX93uXxUDIgfnmAUZ6Y
	vXH06NYBa5npkq/3m0bCR2+yhd0iE6qwSJX4NJBTwgXHUIoU//n7YJKfqXDTgysUobM4OPAOlQ5
	Uf6yD5qOPjy4Z6CLy0Ckl6VpvEmItx5uT8evGhAr2v6krsirk75O2sy/LDL3mMzhV3t2pzhQmW5
	3cEK/Y7AB5C9Bd6nf0NRLSsR9MbCQyRMgBrna6I++8WzJnEHS2/7OQ6FDKGpJDN4K1/fLa3FXv/
	+DJCRU+KgGIAl9VKh17PDD1eJy+lADWnDy9gm1HLw3BOGhxoGslsp+2rve8oGkc4qeaaHQnLcj6
	9p8xgqzOXPRVnijCe078Q+N9whVkIDYqMvQh29M6y2Yi6QfUtLlrjos5HseAt1nRROw874ZBTFW
	w91BIX5+ImUgRxqq9MgB1y1RER7wCdOaiF8Mm7FNy0npBYTYhG5DCjluLncCymIEg5jxOSjtgyl
	bIbWXqqH9AbwLCUDNaQPwzdcvuS8vNGkVkejVqrHqLgOkddJ/n1ddA=
X-Received: by 2002:a17:90b:3bcb:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39e54eab3e6mr15914399a91.12.1789796977038;
        Fri, 18 Sep 2026 22:49:37 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb400c3sm2791939a91.17.2026.09.18.22.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 22:49:36 -0700 (PDT)
Message-ID: <2d07e535-3029-41d0-9dcf-8772f7330434@gmail.com>
Date: Sat, 19 Sep 2026 13:49:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
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
References: <20260914031859.385224-1-a0987203069@gmail.com>
 <20260914031859.385224-3-a0987203069@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260914031859.385224-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

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
>
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> index 78534d613486..0a068abda6e0 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> @@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
>                          power-source = <1>;
>                  };
>          };
> +
> +       hsusb {
> +               pinctrl_hsusb: hsusb-pins {
> +                       nuvoton,pins = <5 15 1>, /* VBUSVLD */
> +                                      <11 12 9>, /* PWREN */
> +                                      <11 13 9>; /* OVC */
> +                       bias-disable;
> +                       power-source = <1>;
> +               };
> +       };
>   };
>

The outer pinctrl group node name does not match the MA35D1 pinctrl 
binding. dt-validate reports:

   'hsusb' does not match any of the regexes: '-grp$',
   '^gpio@[0-9a-f]+$', '^pinctrl-[0-9]+$'

Please rename it to "hsusb-grp" in both ma35d1-iot-512m.dts and 
ma35d1-som-256m.dts.

I tested this change locally. Both affected DTBs build and validate 
cleanly after the rename.


Best regards,
Jacky Huang

