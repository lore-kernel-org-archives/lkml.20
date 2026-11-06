Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934404;
	b=iU4BnIK4XgI18NCrWHz3jTDaUs/UN6h6xGGQ59rMbyOHfJ0KPAEtbKQOrBWiQt3GgIM6
	 Yk0GnmYJFX0urwWgtBYx23CG6wdansTr5bOXJbZ94T5R7Z+0L8ixpvvsPjWTaYFh2Fckc
	 drIgr6oV0CZT4GY40VQWrFttBs8IEsuA7wkOIT8GDZ/1czqwhMPu3v0IqKdxkrq6iB2lb
	 uA6ykx1/YUmxtZTEuZAXwgBzX+56Q7MLTFbAD/opY1ove8Bd9EE6rabK8igH704Xs/tNB
	 f31Y+s2qxkBKCVvPziLzsl5bDTWr2ShC7MjKRMKH5IWkEBx/vhabLWCkn+qM6f8EGCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934404;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=InNgl3TtcjJHMVvDRtFJfM97UJ6hHy2nObXAWQhTsAw=;
	b=GMKs7/EkqemONmEiMk9Hy5mB2Xq3AuNWoPe/oEqksjn82qsrohl/Q5J6iiQa4KgwbRja
	 yK932hlkM+b0olfBElze/m5snF6DjymGDcy36N3ldSSpBojWuVDDKo3m5t4SGoTO16Xoy
	 14OlrxYdCNn1tkyVr604pzh5HrQcmCdl/hya/O0aTCYImEDd+Ndv73OvpgWqYz3rFrNl1
	 oVhoz4j2SzbTY7Xlwk4taWH7SIJQ7w5DUREO0HSrmQPBVkCkT84UcinkWez+ZSI3rY3ou
	 gqzev4JtPuvWJmjXz4rWcC37pnxS4FE8VCRtP6D4AwwYilzjsoGJbhTMqJsAmp3hgcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73380606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73380606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso216175e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934403; x=1794539203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InNgl3TtcjJHMVvDRtFJfM97UJ6hHy2nObXAWQhTsAw=;
        b=jvisRH5YCgDyBOCV6r1d/MiPOaWTIwqvMwSRM1ZVxOJLYUTWPhCQFd/27XoCHKzmjN
         pTk+x6+JGtD9NP5G/bUvgaX7DbjAccP1DA57BcVUBtmc737ImSZ+ojX1HEBAQ/v2LGSL
         klSIfY9QCwI/Vf51bpeVh1zZeUXuprqK5EWbo2R7+A4CJiduSKO39lOnhajMZiLh+8Ja
         stcQVFEFjptpHbpD9diI0WaL4+p0jHRMglKsvAR+OP5Hhwz/45XYs88VmRv4MVis23ub
         HgX+YQ2BFn1dqtBlCJo7PXkzrVBPAc29R+MtEl9SiKOyld5N+S806d1BgNIACj7yTKHc
         hLig==
X-Forwarded-Encrypted: i=1; AKwUvByd56Y94ZC2B7RJgfPUSiwCUqy1fLPuX3wfrR0RcMZeejvD/1qCzrMJ+j+fFuoupmvXbsp2/4oXNk7TocI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FCuDH/xd3LsptmDz8ta4B6WgkAtS/TFp2KrpXRxtNin1dw9uW
	HsLjSQ6vVLP8BjCsa2qlmAW4xGwMeI37ffzp+THUkgCL6//TzyiMXiX/eV5JwgTur3yMTQ==
X-Gm-Gg: AYBFou1g0KLqsSm9/mlmdaG5302LgGTCmPv3Bif2ZfkFBVt3ORNrTVGEqz2H/+78aid
	5s6t/5AZ3WPFrh9KMYmWkbV6FP7jlpSjZ8V0Cu1vz7GpTsr4vK6Ffswpenvjm7ZU7kxDJ8B4OeO
	bVVHuSIBmvRpcc8yi+tOZtybQnLb6inwkMfpMmZHmzQlStfAef3zIglAOHL0NvY8RrUShvNKBAS
	Om2JTRVSvEklS25cyjt0sIYVzMZ4fHBeB0SMaNpPHlvb9gO8jF+xCQK2zokkgOpvQfdmz3xwK/e
	UIBHypFmaxbm46cPz8LMStu02ukAUwrfavmSJbsMt4aniDbm7YVT6Ge9UfTbb42Df3g9u1D98Lm
	/EoFs0li3rMFJRD7iWmkjkd+LPRyFht7KZZSue/N7Er8TcMjuyoQMZ6oBqeCSIpbD51bwfEmgTP
	iiNtbI31MeUBJw35IeoIrkuGK7KqylnpYJN/RmYWwng8Ci8HNV/qShQuxzlx8Aa7jQ4Uy5I1rBP
	jjPHq5eDcU5rgExvU9pGKoQx5tXkvKP5chTdO35MVORZsXz8kWO6emlrNQD7p7lQ8hnSHTV6D7i
	HctYvhkaUkh0KP+E6+VgSc38oooK8EJamthZbWWmIhYz4F5iVYnhJN0TmbbhpcUf7lE=
X-Received: by 2002:a05:6512:ba9:b0:5bf:cf5d:358b with SMTP id 2adb3069b0e04-5c0037ab7fcmr329163e87.6.1793934402470;
        Thu, 05 Nov 2026 19:06:42 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c00309fd3fsm147821e87.75.2026.11.05.19.06.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 19:06:41 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be416e603cso142862e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:06:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBznom66VvwJTbME8scFJ7wfq6mLkiOJ82jFu2FlPmSbOtoQbr/CGVaE49NXPzpJ1FSeNVPe8FLaBxkGwrM=@vger.kernel.org
X-Received: by 2002:ac2:5692:0:b0:5bf:cabe:23dd with SMTP id
 2adb3069b0e04-5c003a87d1amr290258e87.27.1793934401749; Thu, 05 Nov 2026
 19:06:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
 <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org> <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
In-Reply-To: <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Fri, 6 Nov 2026 00:06:14 -0300
X-Gmail-Original-Message-ID: <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
X-Gm-Features: AclHuK-k_LlKDqZXI1tBCGgD-G1XeUrAUABAuETiZnNnNKc4iM6mV-xfAtboOL8
Message-ID: <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150 CAMSS
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, mail@andrewgigena.dev, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vladimir, Bryan,

Thank you both for the review and for taking the time to explain the
direction.

Vladimir: I understand your point about the stand-alone CSI2 PHY model,
and I agree that is where CAMSS should go. I hope this series does not
give the impression of entrenching the legacy description; that is not
my intention. My concern is that I don't think I can do the PHY-API
conversion properly within this series: as far as I can see,
qcom-mipi-csi2 currently only carries the x1e80100/glymur
configuration and no upstream DTS uses the PHY-API path yet to take as
a reference point.
Converting SM8150 would also affect the other CAMSS SoCs that
still use the legacy description, so it looks like a separate and
larger piece of work.

If I'm missing something, or if there is an existing branch or series I
should base that work on, I would be grateful for a pointer. I would
also be glad to help with the conversion as a follow-up if that is the
preferred path.

Bryan: as the CAMSS maintainer, could you let me know what you would
like me to do for this series? I am happy to keep the legacy CSIPHY
description for now and follow up with the PHY-API conversion, or to
fold it into this series if you think that is the right thing. I will
follow your guidance.

This is my first submission, so I appreciate the patience.

In the meantime, I will send v2 with the review fixes so the series
does not stall.

Thanks,
Andrew

El jue, 5 nov 2026 a la(s) 6:47=E2=80=AFa.m., Bryan O'Donoghue
(bryan.odonoghue@linaro.org) escribi=C3=B3:
>
> On 04/11/2026 23:16, Vladimir Zapolskiy wrote:
> >> +maintainers:
> >> +  - Andrew Gigena <mail@andrewgigena.dev>
> >> +
> >> +description: |
> >> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms=
.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: qcom,sm8150-camss
> >> +
> >> +  clocks:
> >> +    minItems: 42
> >> +    maxItems: 42
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: camnoc_axi
> >> +      - const: camnoc_axi_src
> >> +      - const: cpas_ahb
> >> +      - const: cphy_rx_src
> >> +      - const: csiphy0
> >> +      - const: csiphy0_timer
> >> +      - const: csiphy0_timer_src
> >> +      - const: csiphy1
> >> +      - const: csiphy1_timer
> >> +      - const: csiphy1_timer_src
> >> +      - const: csiphy2
> >> +      - const: csiphy2_timer
> >> +      - const: csiphy2_timer_src
> >> +      - const: csiphy3
> >> +      - const: csiphy3_timer
> >> +      - const: csiphy3_timer_src
> >
> > Please switch to the new model of describing and exploiting
> > the stand-alone CSI2 PHY devices.
> >
> > Any CAMSS drivers based on the legacy description of CSIPHYs
> > should not be accepted into the upstream.
>
> I mean we are just adding a new define for a SoC here - not a new init
> sequence.
>
> We could move all of sc8280xp, sm8150 and sm8250 to a new driver
> topology but, I don't think that's a reasonable ask for a small change
> like this from a new contributor.
>
> Certainly would welcome the transition given above as a defined and neat
> series but, I don't think there's a need for that to include this SoC in
> 100% existing infrastructure.
>
> ---
> bod
>
