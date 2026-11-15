Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749397;
	b=yB7r05ERIs3UGcQxZpExlfIDmguEQFME5InpTdzvj3qqd0+Du5MffMClbHjeVokvZDUE
	 otMlqyoLrnLc2wTuJuTbv5Pm8TZ6vAEggBBepkTGPknZbIbiKh20H0iEDk88l4h83GqwJ
	 5ckFgIdhsgbSxQplke4w8Bqyn3Ki6DY2BlBbyeKBaE3YUDHrYISlaAK5ifnFUkyw3+6vE
	 y5ZtljzVHWHfXA5pOw0gVFRvUltUxVQ0aIhxaUYOQ0Btb7XfAHkO9anIhPQ45N1byhQ36
	 JSQkeVHG9aPsBydXu70NeHv01DHvuhiwYePqHTkOj2h8OoFYvDkj897GLpcbz4ZdHog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749397;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:MIME-Version:Date:From:To:
	 Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=iktG5hjiD/wYVGQdP9GzsEFDIk8eVu3FBLZrJbjfmyk=;
	b=2Jtw1BVSI4Glo0nPdBbTUWXLON+pg8us+U2un4j5OReR8LedImko2AAvywKTUOvUXBU3
	 6u0dkwyF1lREOlPrdC4JPZvqYmPMqoL8XvuGAdRRbIoYzPkT3+idx3UVk/HJ9Q19gS1MS
	 +P8kzaOugafin3Oue0gk30QEo6cEb6mzTIs1yWEafuSoobqXVvPoFL+fQWMOhg7ovg6Ju
	 5MgfS93B+RM4mlBF6OswIBbTGSU+A72y6pnLD0E4sCe2Oz2xaUg+aymh0NEHLn0nD5jNQ
	 sS+o4KfWJQdQVwfaEkMANO/vYb/U1fb5xOaMkEXV1jodnrkQpsrgykU12nm6vMJa/6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=MOxDdhU6;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=EQ4SX2ST;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2948606A31E;
	Sun, 15 Nov 2026 13:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2948606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=MOxDdhU6;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=EQ4SX2ST
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1794749339; bh=iktG5hjiD/wYVGQdP9GzsEF
	DIk8eVu3FBLZrJbjfmyk=; b=MOxDdhU6nnU67Cyz5OnXbvX8DuGGzLlbpd3/0KY0Z49y7eTRik
	iIYQIm13HyvTnb7n55LuPLbAM5HLBMoflka7L+gJjvUGTOIimWFKfmXcwsxJnwBGRze8llEi4MR
	3wDEOtDgBGKZ9O+her2MzDqQCvuSVs1FhsmD4AIzF3Ntfz9KSJEMb9AenHfX/OeWteaiyF3XF94
	W3PiINZDPVOjAf5eWk1eWtJHG37lwgBbOkTIX+vu8SyPA8JUMnORiB/kP/6j6/Y6oEVVetVjeCb
	2iozFRHDlkr6UQoViXq1l9FxOTEbPIWdf41Mo93k1WVZ6Mi06n37L+MWtIXKs/brMSw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1794749339; bh=iktG5hjiD/wYVGQdP9GzsEF
	DIk8eVu3FBLZrJbjfmyk=; b=EQ4SX2STQDQ3q722WsMhoUpMLMG9ZDzovAK5ZVkJVhuGxAVp9p
	nESLkS0ewhV4yExAKMmw4eFgDF/r0LvuFfBA==;
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 14:28:59 +0100
From: =?UTF-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, Dang Huynh
 <danct12@riseup.net>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Weiss <luca@lucaweiss.eu>, Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] MSM8917/MSM8937/MSM8953 fix prng
In-Reply-To: <20261001-prng-fix-v1-0-72f924527465@mainlining.org>
References: <20261001-prng-fix-v1-0-72f924527465@mainlining.org>
Message-ID: <fbd93a808dbd9c4ab859494d7b33c7d3@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-10-01 07:51, Barnabás Czémán wrote:
> On MSM8917/MSM8937/MSM8953 HW QRNG is configured by TZ.
> qcom-rng driver will not have access to the configuration registers.
> Change the compatible to qcom,prng-ee for skip the initialization 
> sequence.
> 
> Compatbile changes are fixing this issue:
> Call trace:
>  qcom_rng_init+0x6c/0xe8 [qcom_rng] (P)
>  crypto_create_tfm_node+0x154/0x198
>  crypto_alloc_tfm_node+0xa4/0x1b4
>  crypto_alloc_rng+0x34/0x48
>  rng_bind+0x60/0xa8 [algif_rng]
>  alg_bind+0x15c/0x1f4 [af_alg]
>  __arm64_sys_bind+0xb8/0x120
>  invoke_syscall+0x6c/0x11c
>  el0_svc_common+0x98/0xe8
>  do_el0_svc+0x2c/0x3c
>  el0_svc+0x40/0x9c
>  el0t_64_sync_handler+0x88/0x134
>  el0t_64_sync+0x1a0/0x1a4
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Barnabás Czémán (3):
>       arm64: dts: qcom: msm8917: change prng compatible
>       arm64: dts: qcom: msm8937: change prng compatible
>       arm64: dts: qcom: msm8953: change prng compatible
> 
>  arch/arm64/boot/dts/qcom/msm8917.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/msm8937.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> ---
> base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
> change-id: 20261001-prng-fix-5366a05da970
> 
> Best regards,
> --
> Barnabás Czémán <barnabas.czeman@mainlining.org>

I hope it is not forgotten, should I resend it?
