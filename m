Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932926;
	b=c885EQPylgRIwAa9UrO2rqGPnoDfzdUxDVDRsg9maYsvlO2h0CUcx7COUW3AFCEcXK9I
	 N9GWRp4RGNsj0/pR8BBfCO6elX5ORf9l7GZz9N3SlFsoOXKViBcEXDZhnbHHvRDIy8LU3
	 KtqzNjnFgswxDgzz7AVhkliHuBhxbB281wE/sIgigfzEQI26gH3dXU/Gn/VUha4COmjf5
	 tsXyhPTH63pNX97uOFX8ePebk7EEp3W9DVBZ3WfjgAO3zUTB+fQfLU2DNo/sY0DjfxwO5
	 YV8oWcLQpqKWGl92t1mUd+uL++heEJZzzntzRn4NfsRjsbuDQdUn9BdQ3HEEbLpYbYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932926;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6852XYg4nQB/at/PLi5oS751NBudRh/wjJbfpaCbjiE=;
	b=b+T0UdNN1/ezDFsiwIe2SBfBxAizdZMvAkiw/2ebVuEzUB+QE4NTA2m1sDFA2l/cHXhP
	 9znxFGZX8N3DlO//47lWFazNM23tPa7oiBmlGv5mC1toD4lvy5tKuxBhTxF8d0ZXvP8Ql
	 kkKGQ0E7vIGcXVTPy5/NAgY55ecRwSe6tyuWVwPHCZy82Hu9nFOQ6dKcHg2JnlDQ4e8uV
	 EPdVbo3erWmH5noimvvv9eS1S1yT1x2A2dDwLy5WpRIb9rLtdbdfHiP3LgrZICdOPIG/e
	 kLiTA+SQtzPpQ9XKsDAckSigJEurG55LjFi4BEHbiPjjNQczFFgNgPZ2qyrTZSWDvXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C86606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C86606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ace2e3a2acso959701fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932924; x=1794537724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6852XYg4nQB/at/PLi5oS751NBudRh/wjJbfpaCbjiE=;
        b=auS3MHzz2bH5R/Dcy6BDMU6datJLvQ6CaTZrlnoZ/cW93sti9A2Rl2T90cRfz4k7Sb
         X8dCsIrfLBjMLzwqSPy/uDCqScvICZT41OzwddonZUktz0xSd8msJj7bGjx7Y0XYc0As
         nDFNTBIg+h/sdJ07lBY84IK5aPt755pdqwD+0U9ynz1NTLIPtWPMu0hYvi250k8crkXT
         YV5Emt19EDUo0qpLuSXKtPGOoLMGAcd8H+HMhWK8dlIIa+anbo9ZRuv0N0dJqM8l38Jn
         hZUvdJ16OQqClNCdbi/t6oOOj2TMT9EP9gnW+ADkDnArstChudkE4Hbwg7qpWLNuUGJ+
         eJZg==
X-Forwarded-Encrypted: i=1; AKwUvBzy4AFiFqTnbtoZBJygBHLhIXM7BkVEJ79H4VkwwpDcyHW619b2UnJn6N1hgE3X/+EqjB8hNPudniVqz2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U601MRDnvSqolkn/CJQaTjsLAniW7/I4WK80YlfImh8kbGNvK
	XlfM5HUH1KG0y5aTSKwRuNjl9VDJ38dnScnFjGndfJXEXsAnBwWOHKAdL/Bs9rtIRZuLoA==
X-Gm-Gg: AYBFou1rR/aukUks3mpBe9pMumUtWcWFFSnz/yZM7iBanAvW8EGJiwSJl5+AoHqJ5/b
	+X96T9EivnHLkntoTLma5eZkpYy+gZ7nwzxjC6b5jGu/kL4T6KBr7LtYS9Xng9Bh9SX+ZXRkqtQ
	q8xE1D+1CpixGwe7HYwz/Qq8NUOgwIxcEEy0y4PV2GT2LJ/XRkcCY+bdVBgOo9Qk1Srvjizo6bo
	xtIkaspyeVJQ7zO80opsMdgXYFTXaTuyTgJkMSHD/VhOaiylT2PqLzd54Rplm0s5u0jgrsGyV/3
	4zufTpi9Nd4DgFIF8z0rXZnD+ORiPMTzN7B/ZvPYMPjL6twZ2AVUfgfAmek2SOeWmPBWj9CVw/f
	DzhdvlYZlepII+wYEyLjllLl/9IgD3J4eUv7Ys0+exLGuLgkfKlvknv49TBXKOS5f6gxSOgw/Vk
	UoOVV1Zzoo4Gm3RabPieQ/Q0Cmgm+LdI9myCXaitcJ9OBQMi+bfB89oiVuSgQ1rNZlOP3sAay0N
	IWWgFN1sDKP4w5ggaLIGJLvRLSPrjyke0p+qrTnmS7ojAD/u44EXgyk/r9iFjPoomm9Gs2fLQ2w
	JsxjdRbcWkbCrhtvW9+nrcljhDUC3r32nbOVdxo1zM0zqh55EZ9Qw/5ArQ4pNc72+eA/7S4=
X-Received: by 2002:a05:6512:1383:b0:5b8:f0d9:98cc with SMTP id 2adb3069b0e04-5c003c4aaa8mr217538e87.61.1793932924154;
        Thu, 05 Nov 2026 18:42:04 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c0030a049bsm140316e87.76.2026.11.05.18.42.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:42:03 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab39af88aeso1460371fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:42:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByQEC81xCPITCB4a/qdVArXyma5cySm7iG2iIjeG7ZRyXQZlqjLD+NUz7nlfuoIVlt231DrCgN6G7I6Vpg=@vger.kernel.org
X-Received: by 2002:a2e:a80b:0:b0:3a9:db75:823b with SMTP id
 38308e7fff4ca-3acf3b2b509mr2161401fa.17.1793932922440; Thu, 05 Nov 2026
 18:42:02 -0800 (PST)
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
 <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev> <a83a948e-3430-4133-ade6-b30045b8b186@linaro.org>
In-Reply-To: <a83a948e-3430-4133-ade6-b30045b8b186@linaro.org>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Thu, 5 Nov 2026 23:41:35 -0300
X-Gmail-Original-Message-ID: <CANn8Umedp8s=rupOkSdi5NBxOE8AUnWSvfyeQsMSohZG+Hce8A@mail.gmail.com>
X-Gm-Features: AclHuK9yR1l3Ka6EneLFe1X-dNaa_gcGDfVBlZZtGQ6nC7Dgsgyzy5WyWv0PGgw
Message-ID: <CANn8Umedp8s=rupOkSdi5NBxOE8AUnWSvfyeQsMSohZG+Hce8A@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: qcom: camss: Add support for SM8150
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for checking the 1.1 sequence and confirming that the upstream
one is fine. I've fixed the ordering of CAMSS_8150 in the switch
statements for v2

Regarding Sashiko's note about the VFE-lite clocks: I confirmed it on
hardware. Routing the IMX363 through CSIPHY3 and CSID-lite1 to
VFE-lite1, the stream produces no frames and the clock stays at
19.2 MHz without the extra match. With the match, the same path
streams 10 frames and cam_cc_ife_lite_1_clk goes to 320 MHz. The normal
VFE0 path is unaffected.

I fixed it by making the driver also match the vfe_lite0/vfe_lite1
clock names. Since the same problem affects sc7280 and sc8280xp, should
I create a new patchset exclusively for this fix or include it on v2?

I can send the small media-ctl/v4l2-ctl script I used if it is useful.

Thanks,
Andrew

El jue, 5 nov 2026 a la(s) 6:44=E2=80=AFa.m., Bryan O'Donoghue
(bryan.odonoghue@linaro.org) escribi=C3=B3:
>
> On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> > The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> > VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> > layout. Add CAMSS_8150 to the version enum and to the shared code
> > paths, then add the per-block clock, regulator, power domain,
> > interrupt and interconnect resources.
>
> That's odd. sm8150 and sm8250 are proximate both seven nanometers
> sc8280xp is five nanometers.
>
> PHYs are about converting the analog to the digital domain and so
> process geometery - ends up making a difference.
>
> You can get the PHY init sequences here:
>
> drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/
> =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_core.c
> =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_soc.c
> =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_dev.h
> =E2=94=94=E2=94=80=E2=94=80 include/
>      =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_1_0_hwreg.h    sdm845
>      =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_1_1_hwreg.h    sm8150
>      =E2=94=9C=E2=94=80=E2=94=80 cam_csiphy_1_2_hwreg.h    sm7150
>      =E2=94=94=E2=94=80=E2=94=80 cam_csiphy_1_2_1_hwreg.h  kona/sm8250
>
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kerne=
l/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiph=
y/include/cam_csiphy_1_1_hwreg.h?ref_type=3Dtags
>
> So yeah going by the name that's CSIPHY 1_1 same for sc8280xp and sm8150.
>
> Hmm so much for my understanding of how dependant on process node these
> sequences really are.. perhaps the PHYs area fully synthesizable in RTL,
> probably.
>
> Anyway.
>
> The one thing to do here is to please _verify_ what's upstream now
> against the tag provided there.
>
> If there is a divergence then we need to upstream a 8150 compliant versio=
n.
>
> ...
>
> Actually its fine, did the verification for you, the 1.1 init sequence
> as is upstream is fine.
>
> Just please tidy up the ordering of the 8150 switches.
>
> ---
> bod
>
