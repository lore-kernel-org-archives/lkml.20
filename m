Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755380;
	b=T3WSJ9CG2TcgVyUsl7o4Swme/EGtMOpwaNmRMWHHQiXSN3rbg0dvfFtRC79iYN54KnWM
	 tWXBSVp04TdkKG33y+mLkQanQ27cetpvHdZgh4NaCC/ZwGm0UREJM1/0n/+oWeUFcIITR
	 aOC96FlOTdjDwGXA5HkIQJ8sxweAF6g0dTsC2u3LEPwF54fY2ojep+O9fO1O654kKejdT
	 7o8V+pJLl/Mfn1q9k6C29BP85qJdUld3LefY8ufFLmK//CLA3SXH3w5+6jUQCxWhQxSjR
	 tUvVBWY5cotjLoQBhhS91nMx7WSYIyyxNIJZL/Z+drnA9SUlfzS7qoW5EoCpxZH8FNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755380;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Cq6yUQzukHtwhYuWtD3CdG/vzfG7TEB1pVADzBcWgFs=;
	b=EFcbcDzVS+ageoHzGAaKPQgAFwRrQX+RRPRhPg0e6ARiK5fXqbvtjT4cb6JNGnyhkx38
	 qC9V3qz2mlc+BPCcn5Ioz5uhNtJoKBjkVSjHNf0U7YwOwPJGO2gsvoa98Ucs5BOultxUe
	 y5Vn8mb6Wsd0hU91d9CkZxVZWiLN+g3KnCanDoeQ9NzHHJDTXTAAoB2hILKfRcq+sqWR+
	 GFLFWYHF4Bs/d2U1drYXIiH/LEFVfdtQBGiNG/ZVqinbL/24mYzVmi5uiic0CKb84nokk
	 3nV4jYd6agAzXxlM1+quMyOt3VUJbQRbApKX8d04HJzjuuzrC3yuAz818aptAqhLIIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cANDfa3J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423A5606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cANDfa3J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2ED21F000C5
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755379;
	bh=Cq6yUQzukHtwhYuWtD3CdG/vzfG7TEB1pVADzBcWgFs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cANDfa3JG/1VLOyWOyMbLnYziGnzSsHDw0+p48eFEhwqjIqqzBMypnlKn2KIJbBGy
	 Hq4EETBr2jUy034admevuoevndcXik9C6uGtap6cIMzgHvPoML9laee3OpAmf4sBiB
	 V6Hi3F0/36Jj6przMu8+XPjSpjPzA85GybC1zU02FANO/I/3EaUryQjljgHh/wI44D
	 5RYySKRVJXo2SRloVa8du07x2AxdwjTDUjUTJXlLIsql7MWUyVb1o93lvq6ZjrRX/R
	 dB0ZlpwIe039A6elGxys/Fb3U05iYiO1bsBl4w+OQaWaOFfVK9uQspK5cbriu9IOZv
	 IE74MzMSJVX0w==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae25c846edso22210921fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:09:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFwIcJcSN3Fg535+GOn/75nN4H/r6IjeWqoI00RYM17IjLMLIpDt/yVJxv/kYeJe5eGPDmr3Ors2NgTKp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JmOSsbNArnu7A1B4HbC4iHLoKLcbeVxpt0t6o5tHuBCjiaaJW
	mXK1+qQKtBf6SzY6FNE4yOzXlr/AVntjWwUy4Po5xMRXUkwgBISQmaW9Se4NmxPiLGTABfNfyHt
	MyQTqFAWgjE50nKAZQ8gScvrdH5WBU08=
X-Received: by 2002:a05:651c:1986:b0:3ae:25c8:dc78 with SMTP id
 38308e7fff4ca-3ae2b69178cmr25726671fa.22.1794755378199; Sun, 15 Nov 2026
 07:09:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115132215.289236-1-jernej.skrabec@gmail.com> <20261115132215.289236-4-jernej.skrabec@gmail.com>
In-Reply-To: <20261115132215.289236-4-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 23:09:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
X-Gm-Features: AclHuK8SfNxnDatVmiI32N0fkX-YaXg08NGH8ia-Bx19MDfSYUZXv-OL_jNzao8
Message-ID: <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU
 frequency scaling
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 9:22=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
> so the CPU never scales its frequency. Add both, like on Orange Pi 3.
> OPPs above the regulator constraints stay unused.

My review agent noted that some of the other boards raised the constraints
when CPU DVFS was enabled. Do you think it's reasonable to do the same
for the OrangePi? Or do you want to be more conservative?

Note that I already applied this series.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch=
/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> index 40c5c42b347e..a2a2e4cb0256 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> @@ -5,6 +5,7 @@
>  /dts-v1/;
>
>  #include "sun50i-h6.dtsi"
> +#include "sun50i-h6-cpu-opp.dtsi"
>  #include "sun50i-h6-gpu-opp.dtsi"
>
>  #include <dt-bindings/gpio/gpio.h>
> @@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
>         };
>  };
>
> +&cpu0 {
> +       cpu-supply =3D <&reg_dcdca>;
> +};
> +
>  &de {
>         status =3D "okay";
>  };
> --
> 2.43.0
>
