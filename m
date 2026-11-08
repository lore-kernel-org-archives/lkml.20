Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794159186;
	b=sbj+DHRbvCiAgilU/Rz1rqH9TJutA+88g3DsDH5h0O4p9xcr4rGS7nouY/OlM5kJf85U
	 e28DzBzVIboH2n1+TKW1RQiqNI6mLycJ3xXDw8KQaRZhT0b0EG0U1nfL1uTt452ayeDCo
	 B0/ENoa7QbU6mJWByEUJS2carbNLfqpaN0gPmiO9EIEsUc2qlk2cw9yBNEL4bTIf/iyCf
	 pDg/v0yC0ctIB5wIwftOQyafP0nJYlHjbcL+KXXO7pfFCusPH2OtuL6enANXBukMsZ4PN
	 nz+m207Pxmif7V0VNLCvKdu4hi9nBi5hugzp9M6TUEpLKIifG85zz4iu03lSnCEEqyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794159186;
	h=DMARC-Filter:DKIM-Signature:X-Forward-Email-ID:
	 X-Forward-Email-Sender:X-Forward-Email-Version:
	 X-Forward-Email-Website:X-Complaints-To:X-Report-Abuse:
	 X-Report-Abuse-To:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=mmRDTsFTMdkB1knSlLyF6ragoIMpPyE7Nd3fqt3pBKI=;
	b=MsbwK3wWuf/67Yor1h9zM1fRSvWBEkDg+u0v3lkVVXKp+DUUv7935jdWuGD/sxStAdxC
	 1d1h50F9VCknh2N+YqEW3HCqfmkoWbK/Ob4E+7eqJb8f31XzDblw8vbPHs/4eAPWBpBlH
	 j5WZyJoDXDKk/0zB2Hcgw5aKauCAbzfBvn9mtv8DGB2TnnVftCt8OVCj5YonSfcGeP1UI
	 7wSp1YndVFaKIc624CJFe2kT4gEETh8enlaZ/IVbCUScp07W8MeUXFQ/C9Uw53UGG0vX9
	 5V/gkOAWkvH8UxwugzPgL8l/4dNG27x/+/JSfVIsPhjp4WIswLBCiqb6oIno75LCnmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ubuntu.com;
	spf=pass smtp.mailfrom=fe-bounces.ubuntu.com;
	dkim=pass header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=hUH62b6w;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084A3606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 17:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084A3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=hUH62b6w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1794159179;
 bh=mmRDTsFTMdkB1knSlLyF6ragoIMpPyE7Nd3fqt3pBKI=;
 b=hUH62b6wWLBQaAHtKJmhGM8hS/IgZWJAg9FAPlzX6nxk7E1AFgrue1+f2e0Wxu+S1eIKEgK+6
 sEvU543Nw/HnzaLYnOWE73w1luC6CZZH+AgblbWKUrMz0eg7DfE1xQLk6l1DcEEzCv6D0MIVMmA
 PzlENqckvChaKYAt3ZnvXm1bS9UtX4zLYUl90GRVF/6Zxg2vJBUS7IgE7bFB08PY40xSYvW2F3Y
 lrA+XJ+KfVLXoTgT4zj8GKpF9gALE3U/i3RtK7YQyC0UVmpq2rf401FxvR16R1/xznypzK1y9fN
 YitKq34puxj+dX1lGM9uuf/PwoDW4WmjavVVk62kgSIA==
X-Forward-Email-ID: 6af0b240935e4de7801c9067
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.13
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 08 Nov 2026 12:32:46 -0500
Message-Id: <DMQ0CENBZQGW.L35BD1BXYE9Z@ubuntu.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>, "Yuvan Shen"
 <yuvanshen09@gmail.com>, "Nick Chan" <towinchenmi@gmail.com>
Subject: Re: [PATCH 00/13] drivers/perf: apple_m1: Add M3/M4/A18 Pro Support
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: <myrialsarvay@gmail.com>, "Will Deacon" <will@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Sven Peter" <sven@kernel.org>, "Janne Grunau"
 <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Marc Zyngier"
 <maz@kernel.org>
X-Mailer: aerc 0.21.0
References: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
In-Reply-To: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>

On Tue Nov 3, 2026 at 5:14 AM EST, Myria Sarvay via B4 Relay wrote:
> This series adds support for the CPU PMU in the new M3, M4 and A18 SoCs
> presed in apple devices. These PMUs have new encodings for events, along
> with larger codes for these events. All of these events are as Apple
> describes them in the various kpep files found under /usr/share/kpep on
> macOS 27. More events may exist, but we have no idea of their affinity,
> or what they actually count, so we don't include them here.
>
> These patches have been tested on my own M2 (t8133-j413) and M3
> (t6031-j514c) devices, as well as by Yuvan on their M4 (t8132-j713)
> device.
>
> If possible, the device tree changes should probably go through
> apple-soc, as this is where the recently picked up M4 Pro/Max dts are.
>
> Tested-by: Yuvan Shen <yuvanshen09@gmail.com> # on t8132-j713
> Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
> ---
> Myria Sarvay (12):
>       dt-bindings: arm: pmu: Add Apple M3/M4/A18 Pro SoC CPU PMU compatib=
les
>       drivers/perf: apple_m1: Remove unused variables
>       drivers/perf: apple_m1: Support per-implementation event size
>       drivers/perf: apple_m1: Use macros for per-implementation init func=
tions
>       drivers/perf: apple_m1: Add Apple M3 Series Support
>       drivers/perf: apple_m1: Add Apple M4 Series Support
>       drivers/perf: apple_m1: Add Apple A18 Support
>       arm64: dts: apple: t603x: Add PMU Device Nodes
>       arm64: dts: apple: t8122: Add PMU Device Nodes
>       arm64: dts: apple: t604x: Add PMU Device Nodes
>       arm64: dts: apple: t8132: Add PMU Device Nodes
>       arm64: dts: apple: t8140: Add PMU Device Nodes
>
Maybe the folder should be renamed to 'apple_arm' or something like
that?

> Nick Chan (1):
>       drivers/perf: apple_m1: Support per-implementation event tables
>
>  Documentation/devicetree/bindings/arm/pmu.yaml |   8 +
>  arch/arm64/boot/dts/apple/t6030.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t6031-base.dtsi      |  12 +
>  arch/arm64/boot/dts/apple/t6041.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t8122.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t8132.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t8140.dtsi           |  12 +
>  drivers/perf/apple_m1_cpu_pmu.c                | 664 +++++++++++++++++++=
+++---
>  8 files changed, 662 insertions(+), 82 deletions(-)
> ---
> base-commit: acb925da49876e74b806ccd48a7518d2d3368e5d
> change-id: 20260929-m3-plus-pmu-events-e4010ab44135
>
> Best regards,
> -- =20
> Myria Sarvay <myrialsarvay@gmail.com>

