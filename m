Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739411;
	b=E0WNaojOwNgNT7tFEcATmA9AOOXA7DgtGaQFoQOZQZVKwYZc94ul9x8KNmr4W1tHu2xK
	 wxJrSx3/fTnNL93zbvHv2xKX/4LlxTN1VLLP3s9SSLfLqySSwol6gcLo+dydmbVjbRapm
	 A68OWgqmFnkLoAvFLH2uMMRKUM9bXfHDDkSESAxCSadj7QM0+IWSH9RIe73k6RkClyaO2
	 V+/enQBX4MBdnkcSVkLKavoyw30jgdvAWsC14gpaLpX07TlWCqjFU50r1/07d24AxU+eI
	 dKYntGUM58seBP6HCvuwf9yfQLAaPH9osFiYnb4HKWGm16p8bKwOATVXKzvk2hEL2NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739411;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0nqnviQtI0zVgBpLZforuUbgldUYw5y4JIwCb3k/byo=;
	b=l1ZSn7H/j7iiJUiHanGmQ6y30HPMnh19546dgzVN0RRX32qaRZ4gYpyNifI/C9i6hKaK
	 rbXKDJ4cWfbGYNUoXkVgQptnTFDwuW29mzBQCyFXDdYXzCeII0SIUvH43CmJz8Xdmvtrs
	 RsBz4avKTaPlTMivgiTDJZODxioGY0ALx4nTBgjPQ0Ug/45jwP5fbgbBQSj4IGvo6fgPO
	 EgJ3hQTRZTaK59J7FmiyxBHeGCdTnx2mMfx09HmCbYj6TP6Bhf0ycO48nQcMcr7DQ7zYP
	 wTVz1q1zSd8sP+CtqzZnspZ5eE4p3bLyjmcI+MdNrO4tBV+Q6HOjk8/Asne0zn91v7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMgHHDZg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A4B606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMgHHDZg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75651F000C9
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739410;
	bh=0nqnviQtI0zVgBpLZforuUbgldUYw5y4JIwCb3k/byo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=iMgHHDZgx9CCeW7jQ7Z0VvGlzs0uRoMnkwXwVYnMkgw3UfmNXwg7BPjCn3iJOmVAg
	 Gg+SZ2dj1i/3RTRPgmZ2y+tJ9mrVdGFL3hC7La7eAhV57oFHczQI4RTSjKH5QnkKxe
	 PRNwbnlancl3/A/4q7NR4LBteog+4r3S4N0arQL7cNeX0B4jXmChzh9wCKpcX1SQrZ
	 o9hAKkK0rA/fb1i9+7UWNHwe0dRLM43LV//ByEEn/kYBRtxmBH4DjyPGew/PLrsyFt
	 f1her53+EUpfBpeTRR6wldUdnPdu+GyEtCsdpiLOQRYeuOxZF5h4pue+tmjkFSCccq
	 +x1FjiSrRjw7A==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3adfe77d336so27030711fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:43:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHvzBRrqJ3RyR4Jxf6CTDrNjIXKQ+6/3p1d1TlV6ADklVqIDgUAVoZELhtpHvMYOixBuwG73XDOGGmcrsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z99cUZiuMNRFXmougLuol55q4hlF8SzFt99ueULCVaJ1Sm2+v0K
	R21RuJ8FnP4ZoS1Enf91CinZqbFoJLGKHS5StdhFxIeCYYGYLj6FwvnfhPg0EWwdKXREB2HsG38
	Yh3Rvqr9nr+wlX+1UM/QAWzQ+OZIDBOM=
X-Received: by 2002:a2e:a543:0:b0:3ab:1862:25fe with SMTP id
 38308e7fff4ca-3ae2b49f199mr27144831fa.4.1794739409347; Sun, 15 Nov 2026
 02:43:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com> <20261112-h616-zero2-dt-v3-3-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-3-1cd2664230c8@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 18:43:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v66CYb5LmHrThjqh4i7kQeG3D=0=om33=mJJUS_u4r=UvQ@mail.gmail.com>
X-Gm-Features: AclHuK8HzeMAHozlJAL7NvuOGHQVO3JAeAx6hsTa0bLpIvwSKJtCAkiSGEitsvM
Message-ID: <CAGb2v66CYb5LmHrThjqh4i7kQeG3D=0=om33=mJJUS_u4r=UvQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] arm64: dts: allwinner: h616: Add GPU OPP table
To: aiyengar1990@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:22=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> Add the operating points of the H616/H618 Mali-G31, so that boards can
> enable GPU DVFS through panfrost devfreq: 306 to 600 MHz at 810 to
> 950 mV. The table is the one of the vendor images (as recovered from a
> KickPi K2B image, also carried by Armbian). Like the H6 GPU OPP table,
> it uses <target target max> voltage triplets with a common 990 mV
> maximum: a board whose GPU supply cannot reach an OPP's target voltage
> loses that OPP, while a board whose supply minimum is above the target
> of the lower OPPs keeps them, as their [target, max] range still
> overlaps the supply's range.
>
> Like sun50i-h616-cpu-opp.dtsi, the table is in a separate file that
> boards include once their GPU supply is described.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  .../boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi    | 62 ++++++++++++++++=
++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi b/arc=
h/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi
> new file mode 100644
> index 000000000000..18989d11c832
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2026 Arun Iyengar <aiyengar1990@gmail.com>
> +
> +/ {
> +       gpu_opp_table: opp-table-gpu {
> +               compatible =3D "operating-points-v2";
> +
> +               opp-306000000 {
> +                       opp-hz =3D /bits/ 64 <306000000>;
> +                       opp-microvolt =3D <810000 810000 990000>;
> +               };
> +
> +               opp-336000000 {
> +                       opp-hz =3D /bits/ 64 <336000000>;
> +                       opp-microvolt =3D <810000 810000 990000>;
> +               };

Just a note, found by my review agent:

The temporary clock for the GPU module is currently pinned at 400 MHz.
So say you are just jumping between the lower OPPs, you go from
306 MHz -> 400 MHz -> 336 MHz, all the while the voltage could still be
0.81V. This is likely going to cause issues.

I suggest sending a separate patch to increase the pinned divider for
GPU_CLK1 from 3 to 4, which would give a *really* safe clock rate of
300 MHz.


ChenYu
