Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704093;
	b=nw7Nud5HW6cD7bP60VtU6SOUd0qsQaxQwJd3AhE2a0/dMT4uRvVhM8uJZeQZSX4Y59eB
	 mSbBMojGZCWpJluw09IRM+U9OgR/jQ6HpnM/Y7SqzaRqc9Zw3w5yuW/AfSNlCknYzzW/k
	 34VVY2FVnbH2WpyZMl+Q79kJH3HOLTWUZoDY2x0edqYpkT7lirVBVtC9pi9gmYcdPLO2j
	 CE7G14yuJ5YRm9cDmNO8KHyWqqdxUDOke+PeZfROX1dJbleSCJY+61/h0OJmJigpiQizZ
	 kiSOtf+nAnDooioYirQVLtoNfB/PjBb60x00gzW4ROrlOx4oHgik980d123Z2kolaIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704093;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xPoZusWyH3D9fdoWkwrWqXdMyuACo60BjbvRfcDTRcI=;
	b=RyGBeTRXzEEfNX5+p3LdGv+iVZEIkfT02hi0E4U/i0673AQy1zMXGWEA4BLDjKUWcrsr
	 giGK1wrcGQ0ltePjOqMnTewFhVDTMOeEYEVGLfEnCmqqoOZ4Ga1n4PWUjMiuXMA1Gt/0b
	 DkO4DlPP1q/2QU359vZ3AuSf2EW1Bvv8P0cWJ8LzV/C6Z2zaSK9twgedaQbl7H1NI0nxf
	 pcrAtO1FVbA9DulNW344nkDADxtjqHwfGhW5XItSrv2ylja4STsYwT9bP5Dwi/hG0j3f5
	 8/3uY/hCfWuSBEUnUigV3RJNoVwpQMgSVdESAxUlQ8U6yseDMVvJMNSehkfVIg76MYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jr1jjeTm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1E0606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jr1jjeTm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AAC1F00A1A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704092;
	bh=xPoZusWyH3D9fdoWkwrWqXdMyuACo60BjbvRfcDTRcI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Jr1jjeTmxIIUDKAA7vQy9e2z82OjX4tAzwSjypOUSpnWXu2g9pPb37PEr9WUm/Zfs
	 +xNv+hn+Sr0QBC3cZ6nZVCpxAuw4ElK6wyjQqSyVm/QJfdXufj/727ehk/Ki9YproK
	 Wlinuhyn8MNFH/WFqtvsxZJHDngc3YbWz/UiLoYhZnobY52M8OMKgD8VyO8fPZukNP
	 6f/a9hUJNlVn7rbMII765p2MFshWCYNuvjexjZOCnqmEV4zqCXxNU26zWWTvgXFRKu
	 b1gddekP01073QOIG5kKNcrvKHPiEeHDZGqS9hIepE3N0vF0T4aIuMe72wYn/G60R8
	 tVaVanp/LtLgA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so34256841fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:08:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxJuvgvne6EKuYVlmEoDr9CHReEvSTa0sASoXnxyoCDtMZ4A2lgG5haUB/gItx/u9rE6IKwUxKOqhrkiSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/F2sfhJ2l5zV5VIRoaDPx/TjYRFRzxB8ONKjuSy08qR38sWECh
	+ekWTAJnG49i8k6mFwRic2j9g1UncY+tHRNVc1nN57LK14y3RtqZqdHem2fahCUJhkHqLTu6Qcz
	h9grKudtgdiAL6xX+0UEQouGZIsXTIDE=
X-Received: by 2002:a2e:a555:0:b0:3a6:5ec0:7977 with SMTP id
 38308e7fff4ca-3acb7b45f8dmr32247991fa.22.1793704091325; Tue, 03 Nov 2026
 03:08:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
In-Reply-To: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 3 Nov 2026 19:07:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
X-Gm-Features: AclHuK_7MCsHCFGRxCGrHLGiBJS1LagIQXdv248ODfyEYfHWYTzn5PL2aAFmzB8
Message-ID: <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: rajanyadav0307@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 5:09=E2=80=AFPM Rajan Yadav via B4 Relay
<devnull+rajanyadav0307.gmail.com@kernel.org> wrote:
>
> From: Rajan Yadav <rajanyadav0307@gmail.com>
>
> The CPU thermal zone in sun50i-a100.dtsi has a sensor but no trip
> points, so nothing throttles the CPU as it heats up and nothing shuts
> the system down before it overheats. On a KickPi K5C (A133) without a
> heatsink, the CPU reaches 90 C within minutes of full load.
>
> Add a passive trip at 90 C that throttles all four cores through
> cpufreq, and a critical trip at 110 C, using the same layout as
> sun50i-h6.dtsi.
>
> The temperatures come from the Allwinner BSP (sun50iw10p1.dtsi). The
> BSP drives this zone with the power allocator governor: control starts
> at 70 C, the target is 90 C, and 110 C is critical. The power
> allocator needs a power model of the CPUs (dynamic-power-coefficient),
> which the A100 does not have in mainline, so here the 90 C target

Does the downstream BSP have this? It would be nice if we could port
it over. Then you can properly use the power allocator and/or the
schedutil governor.

ChenYu
