Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794757321;
	b=CBToE09ZAFIleoxIS/RhFOVG8J3CK93w0hJG0Wb3L+EJbELFDsY3QQQ5Rzcngx+VRe6L
	 EEEI5TDwILq8RjTmZFNuN9WOjcOFMGdiT2FR+Nt2roCjgNQcAbXzVicSoqiFrirNtqJy1
	 EPHiCrEMBb46vhbIvG0SoxTMCKcWxYekcwfcx8MoVUii6TXPJ/U8Ny2qkGFWKL1Y12zxu
	 TqKZdddZ5IT18Hg6HbqVOawhBQV005wrK4a2CIZUvsnjQ7gCCGA9RciQ2rRo0gN+YQbn3
	 zhJluzLLvsTPn2i8uAi72SayZv/Wp/kP+Q6vYZTCvKbJ/sywLdPl5W2X5q/zS+Nn3Vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Y0shGZ6hyhRZI7u9lKNPwzmsqe7OyakFksQ4HOiAHG4=;
	b=bsfvsqan+KP+6x0PR1xXHwjF/9qHQzowZTfcpjHhyiX5lyegpeb1RX6BjmFrjgIw9soN
	 fNKc6vnulOwb0Zy9Jp3jk2LcvW0oZFcB7f3u2Ev8SquKqtsXuCsUerROur5OSydqKvv4o
	 /meh75ZhT8QF6j/KZGe5FQ5CILbGU3zfN/YjPE/R0K7SeAAl/q7pQ+D/tBEjYYPjiA/tD
	 Bnb9AqvV7gWg2awGCqH2Z+fihabx0lEyeNTKdlQKCowObR7rrVYLgw31JBz1Oi8YKQJHV
	 AV/QGMFVdb3LHlK6VuTVBMPMHngqVBWZP2+dm5LJZuP+7lM8MleLWuR/99KzzHCP9gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+Lw0+fG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA9606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BEA9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+Lw0+fG
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso2730543d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:42:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794757320; cv=none;
        d=google.com; s=arc-20260327;
        b=E7UHNJYJUO+jG3pRBTRQIg8P+59j4M74t1M8IfslDYaVGfLO7eoSuBZIvLmA+aLmh3
         9n193U0w+F+0Kmrll8SNcjlrSVkLgO5Le1fJ/Nfuks5rXNkCfWiwGcKekC5gpZmkINIO
         ZZLirpfQc0g5Lx2EwH7f0oRp5hyAkKbZul2UzxjOUItEyTH4QihSe56UjvHqaJgrKzjB
         psykT6l9bM/0PWaTCMPLj+2aSMiFhJsvxqV3BLht8BKONDVZrs8rPIUTN64V9/Chmxpp
         /G2suGE/EffH3h7i4ft7LJY6YNdW+HMhZI2B3Kzr9hQ7YwRWlyPHmK4IaSHoqPPsgNXG
         jd1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y0shGZ6hyhRZI7u9lKNPwzmsqe7OyakFksQ4HOiAHG4=;
        fh=h5cZS6zOZY5kBYR2jzxXAVw6+UW/RrCvfVk0DBAUVNQ=;
        b=IRvlKQYnKOfeF5GWJgsUpqT0OoLhSduKGewUwiUPsY/8eANIXBKKlQxK0x8C3rDjaF
         borrN0j0bmh/S8a47gEeUoDtGwpyNH2zH5WEPkxIpnsec+DFTWxkT/39ob+g4TmQk2GW
         uqb5yujG49wngA7mgtorkHsjqplwPYI2H7km6accLiF/dKEKhpvlz7p9mfS2Jj/pr52c
         5QIahxxbJqkb8Zs6I2Z60p5EbqEjOUJuoB032k1l+Kv+3l03PtbkEusM3hUGdVUcDf1v
         zNjCtvsdIIKHcdcNppfKxCk6kD2kk4Ft4jHHljKLnLoSM81Iqoc6q/noUVz3b6wfsAV8
         k7yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794757320; x=1795362120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y0shGZ6hyhRZI7u9lKNPwzmsqe7OyakFksQ4HOiAHG4=;
        b=u+Lw0+fGEwnsMts5plO615IBT8mWkOZSG19nR+eOkB1ARvLDkFzNhwCHkTIk1uaLYN
         NxBVG223K6iHF5QqFD1WRsXx/u/f3GXhApT+6SIApEwIW/N/HI8o2RxWC/Eh5ByEaeQz
         oHzDBBcQaXmpug2I9j6SR5oFS2IU2WVQGT7/o0p1nVgtfTaI8oNYxJRzVZjLMcGx5saL
         o1y7TFOryoG4Z/zPF7xcXhxhJwUlle51sRjt4ohFJim3lGD0cWFGE4a/9Qa0VNwGfSi3
         sIaM2vyeso0PJSx5g8oGO10tsLpv4Apmf5i6arpUjnsOoFIbdkfw+mdWUjQ6o+nZMRyy
         XHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757320; x=1795362120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0shGZ6hyhRZI7u9lKNPwzmsqe7OyakFksQ4HOiAHG4=;
        b=JZzF2TXvJirHoN5WecR3iqI8oghIlCOk64aWJ62NuWYMfCzkxBg8lXrafUr2JyLjwt
         ZWuerQiB48uG5usNnsWPzqCtT5WotynUAhpNdcDa4twPy4/Fh3+/KpFryfJ1JdthFitu
         yqeniEf1ZDiuZKmkG8aT4vfUzlvYij30ZqAB0KdTrhbDpktZU5mkqvLmJ6Pdygibl4YU
         l7sTR9k79SetTxq+2v8tuKY3xUP1NhgQEhZkV0T8gdDx6rqc4ambSpMvlh3eyawJc2OT
         ngD/YEPpCEWp7AvrgFmc2bcHzIgwQ72lKYfGjBoqeFfLSq//d+0M8euy5RkAlgxa4R7s
         FkmQ==
X-Forwarded-Encrypted: i=1; AL+hErGnHWzMRm0sgfi2BtXAijl42O5ICZzngRlkJOG7R2oaYX3TJwbFWGmRLTfaKiZiMA2p1ehSc004Iq9r+VY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MDo7hcIykIOs6WOy5MRcY1c4BEQViOYNJYG+AfrKDviKo8l2C
	qOPh7bHM3e48/LtQalhpiZDVxsoby4GQSrITF7pggllHbIBO7yiyVhuR9irQL1lzfmfkU2u8EjB
	msgr3yMXmSZo21MSoiIvcfBnNO72+22w=
X-Gm-Gg: AYBFou0mKIfVzs9Umt/kKiNcSd2DAb2eHMRQr71GqH8klQSek12iTTuSvPLT/OL1SpW
	DVeG4EYHArLFrkXr9elBBhMFFOXG2POn1i6nTmGVW0dxui+Puj1eyut2juCgQCSf8mst77rnC0f
	HMbhArqTB422NKTjkF+WbE+7SMxok7oLQ0hWK1/9WMYlqPk4wm2I6vyDJFCVNvM8SK6RBf5dGSY
	YYGtVlbFt3C1kVdpLeqqIinSYar27I7uBYJaGofDSuKm9NTpylKu8o2ARMjjqIRCzYRrQrqp3dN
	cHFIOvbdWjXZ2tPrlnAUqzVPGDvCJDfsRRNdxaWTZDX4VE8mQOmWKZJ7xHK6WP09UqLh9tZ+gNl
	NgmIHxlEUKH0ZzkZIHAYcLX4f2gcZPhf0GMAl2uRMK+7sy+ZSWpzVn4UgiVUUTrBaLqmT/nI=
X-Received: by 2002:a05:690e:419c:b0:67c:443b:7437 with SMTP id
 956f58d0204a3-67d8972f769mr4176218d50.81.1794757320129; Sun, 15 Nov 2026
 07:42:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-nyan-wifi-32k-v1-1-311c6f2163d4@gmail.com>
In-Reply-To: <20261114-nyan-wifi-32k-v1-1-311c6f2163d4@gmail.com>
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
Date: Sun, 15 Nov 2026 15:41:49 +0000
X-Gm-Features: AclHuK9XI2phd4ElF0I4ZWo1qXh6X3hb82lItzI21-3DRYQCtspJfYTGO2-pD7I
Message-ID: <CAN1s30rP9jkTp8rmyFBjp9FtmZO9QTXNXqawpJ1nZbusFw59bw@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: nyan: Enable the 32 kHz clock for the Wi-Fi module
To: volodymyrchapman@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

In the interest of transparency, (and to meet the kernel AI policy
outlined in Documentation/process/generated-content.rst), I was
assisted by Claude Code (Anthropic) in creating the patch described.

It inspected the device tree and clock state of the device (HP
chromebook 14 G3: nyan-blaze), identified the missing 32 kHz PMC blink
clock and drafted the change and commit message. Warm reboots were
scripted by Claude over SSH and cold boots were performed by me. I
have reviewed the change, understand it and take full responsibility,
acknowledged through my sign-off.

My best wishes,
Volodymyr

On Sat, Nov 14, 2026 at 2:13=E2=80=AFPM Volodymyr Chapman via B4 Relay
<devnull+volodymyrchapman.gmail.com@kernel.org> wrote:
>
> From: Volodymyr Chapman <volodymyrchapman@gmail.com>
>
> The Marvell SD8897 Wi-Fi/Bluetooth module on the Nyan Chromebooks needs
> a 32.768 kHz sleep clock, which these boards take from the PMC blink
> output (CLK_32K_OUT_PA0). Nothing in the device tree requests that
> clock, so whether it is running when the SDIO card is brought up
> depends on the state the firmware left it in. On warm reboots it is
> usually off, and every attempt to bring up the card fails with:
>
>   mmc2: error -110 whilst initialising SDIO card
>
> leaving the system without Wi-Fi. Toggling the reset GPIO on each retry
> does not help.
>
> Describe the clock in the SDIO power sequence, as the Tegra30 Asus
> Transformer and Nexus 7 device trees already do for their Wi-Fi
> modules, so that mmc-pwrseq-simple enables it before releasing the
> module from reset.
>
> Tested on an HP Chromebook 14 G3 (nyan-blaze) running v6.6.144: with
> this change Wi-Fi came up on 8 out of 8 warm reboots, against 1 out of
> 22 before, and on 5 out of 5 cold boots (4 of them on battery), and
> the clock summary shows pmc_blink enabled by pwrseq-sdhci0 (ext_clock).
> nyan-big shares this file but was not tested.
>
> Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/=
dts/nvidia/tegra124-nyan.dtsi
> index 89a749c..c98de0d 100644
> --- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
> @@ -645,6 +645,9 @@
>         sdhci0_pwrseq: pwrseq-sdhci0 {
>                 compatible =3D "mmc-pwrseq-simple";
>
> +               clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
> +               clock-names =3D "ext_clock";
> +
>                 reset-gpios =3D <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
>         };
>
>
> ---
> base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
> change-id: 20261114-nyan-wifi-32k-9964d3513b7e
>
> Best regards,
> --
> Volodymyr Chapman <volodymyrchapman@gmail.com>
>
>
