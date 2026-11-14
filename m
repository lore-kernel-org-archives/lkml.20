Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794652481;
	b=gKJiLKkD3fwYOegpsHSMPQDUa2r3Nz5VtDsP3+jLQ8JYfpCKbeCuy1+kGYFOD3HrEi7C
	 AP7Dp1ZreG22DzljDgq/4So0/Bw6cEG5mAOCYFh/Ozs5YLBwZEbICw9sR04/nA3THngbD
	 h3X6WP4inMtNSsOKWwizygvuEyImhL7rlR61wxaXxUDBjRQTSveQXs2AVBkwU1LxTGnnp
	 Cs7XKhnMmHxiH+bGvQ6xWaUYeJrxQvZpJKFfDt2LwZyIrjgdVL4gftE6veUD8dbhWFAmv
	 00ygron5gEcE4Tv8Z/gXqx7eMOhlP/VaY3aFbYxqj0d8iJwSyHPo6gqqBz+b2oLUgPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794652481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=;
	b=TtxXHE3UtqFMIc/S0FhHfkJJPQwhkwDX7woJdBk1PUcccMpYoP8WuMZju+/ehyzvUufG
	 PfMahs3QwNGDAcUgV3t+AZ6zM0Eh1GP+YJrf9CwYGG01VD8FGWHNZBq8ZlTeyrnKvU3hm
	 2kjgUaSLvQFaw2Yc/ZQHyqp7bih0Lj/bMurE/ZB0In5bhWfsfNrXxXQz0NMG+eZ8VeKfL
	 +Q/pwDLUjIWcmL63WxJ3NrxeZhCjBznNxXzo9MimzJW3eEUjZGxTL/L/JvsURZjELLOy5
	 6XOb1xcRXnC+/qkr+YHGO32PH41M9a2/j0p01puOABTjN5+OVwDTmNTNAZb3rCKbJGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxYcyGch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="E3+SG/RJ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDE5606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CDE5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxYcyGch;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E3+SG/RJ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wRKa3276449
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=; b=gxYcyGch9+cPb4FH
	n98Ykn7pArnMkE2S4TViKEWtLROj0U6F+5LSs2MypMrJ9piRF6B+uyk9zXP5jDmW
	xotKFL9aJnmtl7IH/urvnpgIsSzbraNwclKh5Z7YlRdTcVdgOfLx/n1Qw9KD/AIj
	ppqANTaaq3U66TUbjDncG51BXDnjOsNfj4TMJoE8ep6l/46nqH2sYjtQyf8eg3VR
	0ns1BP+RrdUeGXjY8Sq3h8RR6pIyLDl7RcBwMM1feabPnWfhA2hXMnzdoaRDljFM
	xB3Ivpy9eD4KqFJ6pfjjlWa/5uuwotNXgxw87TU5+tE8CI6yQrrMcJUd4Ev16GNH
	hJukdQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgncb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:34:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso1026963a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:34:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794652478; cv=none;
        d=google.com; s=arc-20260327;
        b=NutlF1gT+U9N8qiujLR81bsDOXNarATBYIqCWZBgGhfiPAh/dgCsXKbMqpTuTB/6wy
         93Hadd0RzcXyU5kkf2tzCYdf/L+POilZYoEmydY0WiPw9aZbmNSvVQcV+TvBYxeZqB2j
         jOkEWPJ9iRF60cgbiEvOD0Dr5neuAFTfqzTE86S5gmDdo0amNQmf800QJTKIo+pO8c3f
         Hh/4E41aACv+RQivk/HhJ1ECp55EZf8PxEEsAtnO/NthqAl27LnQWPJDGpYdUeqoQ/Mu
         Rp0BmSufUm5wofJANMWaekdju74iHrLBGimYsSlptLGDpzgO9fJFRf8JVtZ7ObkdzO3M
         90Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=;
        fh=JIcgu88iGmpSXfvDz6zZG9+hcBMKheESNLO8lfOQHC0=;
        b=V+DZBytd/VDPnu7o23lXcnGNSUnWj3/s6MRtRqvTPPSGZPfFp0BT0+im8fYbZjv0Is
         KaW16ChrY7TPzjYq0JE8c4q8lDMpiOOuT09HWQ5TIUq3RqdKoN8fKDPc8TAb41UK3nA+
         fxGEfTH7RFpkQZpgXARBqjNWWShSiVZXk/0iASRPLABpAqstxwRyFALuJo72r+ZnfjQX
         0HiH7Ti4Al1+umSBfFb9mI6tOmy8z50VUMHGHoZ2RCnfQP2QWYxBwXvfvD//Yt5FRUde
         kZL3scUky1d/TdnTnv/VmpaKm2yo9kMCbvJbnjW8HXE77ndrFrA7veB7lEHF0D4E/vFm
         PBzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794652478; x=1795257278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=;
        b=E3+SG/RJ2JxmlzOHIO12KV2I/S6Ei/aMtTZaHQLrKIBfLF4IJNhHoiRiJVKgcVUxD6
         CHw3OtXcIBFAkT7V4cZ/L7L6//1MyjhstIqWaN0hr+riCXY5OFIjuQ6fFZsGRQCHetg8
         9/CEPH1uiyeSzWqp/6WhBboivlLJG3/LMmnxtzrQ6Kxr9rWU2NEl2mqjLB44Md85OMKV
         HGK8D1Dpp5qT5OVY/wuoAQYdJLyGmJABOp8f3s6EWrTqB7NTEJc1iqhLqRJCEVSgD9AW
         nUbD4MgAB31VM0FL7b6bi+F+pXXuA0/TG1stGLMxsy1nD55CNYVtpUFJ4v54N50lA1g1
         CyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652478; x=1795257278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=;
        b=gMVz5w/a66HAetOOEZvsKJ8bU79fOyNdZRfrJGakW65XSgrw4Mxkix1OEN8Yfkbhl9
         gfHC0tPFMu83WEliMzgcTQtjKdNXfLazEpJsMeXDoYdPwUjixUlmtwWT0+a+bD5uYD4K
         Hd/ZLer2ZbOafQ+fJ/vPBe6dvCTivOYyhe/1f9H3/xcYBBsgOK9VeOPZfV0m7vPXK4+p
         ZS9sTphHYv6+UtnlNDUUa2wyy4R/CV8g8elRU/yFQGpWmXYkpll91aIBwEtigVxGd1z7
         N5OOFQldT+SerW1x1salHHyqag++6KKNs8qVgXCsJlaZFK3Xf9Q+vUYaxu+jVdG2KCTf
         MtkA==
X-Forwarded-Encrypted: i=1; AL+hErF7vRmhxUC+XyG0it67n/I+JpPNNONLx+HWJ3Gc11/4BXhm1jDCSJiUUTIzT22v/EBoNS0uJepWk+rcWhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i3uVsdRsmqeiBDgrkoWuqBWL4xlaqntzaitcXw1rZ0QAcTg5R
	cUrYV5OXn+0eKmggQonwQjpivVjvli7XCZX5+ENWb7giUDueQX2pXgzrde7//cO8ZgvATjKUJPa
	b6AUgANbSjRoFPt7ZlP37E8Y+5V5l2SGY18pBqaiweLL8aiKAFn22K29rgOh62gEsXJqtZZzKsQ
	+Ql2fRfrrVfQoQHejZdwSevUICBCR/ngQ+MZWkFf30Gg==
X-Gm-Gg: AYBFou05y7dF7xVBVH25EIGwAFnZegvwXhsmI/6Qk33mTC9BTILydOAUaJtz2likYy6
	coMJiZzRRmheJi+Csk+z9D4066MKCADnpNtNqqzGj80wUVV61z1aK0KUjhL7VAqvkE28/on9KLU
	LpsrNdb5jKYelARX1e7G82JNCN3g4K/NiUoiMui56WJrOFJ1/CG63lV8CRSw==
X-Received: by 2002:a17:90b:3ec4:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3b1b0b83494mr5437877a91.47.1794652477774;
        Sat, 14 Nov 2026 02:34:37 -0800 (PST)
X-Received: by 2002:a17:90b:3ec4:b0:3a0:4668:4cb0 with SMTP id
 98e67ed59e1d1-3b1b0b83494mr5437854a91.47.1794652477282; Sat, 14 Nov 2026
 02:34:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
In-Reply-To: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 11:34:25 +0100
X-Gm-Features: AclHuK94u1eOHPpWE8nBMTRpf4tqar4SIHPxdb5PqkdOcIBUQwLxrM5M47Vzypo
Message-ID: <CAPx+jO8ByMju7HofLyZywRQRW4W7_15LoRVDn4K5oM+vsmrSrg@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: st: add STM32MP2 power domains
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af8393e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=8b9GpE9nAAAA:8 a=UgPYzwtURW4JLmgtzPsA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0MSBTYWx0ZWRfX044GA1IY44x8
 kYrI7yLnGlEdNz9tTeRfN3Qa+gRezqtYOH/6pQ7p10RSP787PcAfwwJ9z4WmfkEyNAUlXyeZNc9
 ditwGR7Ip92cwIdb3Oqx0pVP9y9MI1Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0MSBTYWx0ZWRfX32Wh9lnCLCRI
 0BDdo1g8yzRYKZhXEPjsjSj/ENi8qau7pscEWXEt/ZWdn992Aag4HS4Kp4ZYqIePYMrVmkdvoJV
 I0PQkQc2btpceBTWHgmABISd9fOFw8biTlmq+gVgiE1Jkri0tWVehMPkqcPzvhaoWWgV2P2X4zq
 K/7tKA42Oadxx4oDVuxwL6qrhRTK64911LWd6jBrJ7109FrOUSc9sC4BmGCBS2O4PuBexz7skSG
 bOXsMG0k8COd3X6B4v53Mo+bCv5/GcEjHp8PiszXrscRaOGSBLC2HBfosossKRgqL9JzJkYU8zW
 15yagR1R9evoZsxCBNqrb5CToWXYNbj7jRAxDSSqIKxSXf32XH6XwVDVj0QYhCR99ZiyrkTEHFL
 I7IEJ65WLxUAv61R/N4QpcPoL6GCHZSYCizRhigFSSiHuX0xcW5YgeVuvgEUfhBi1DIuh0r5m0Q
 MXErssQQBknYfvpq2Zw==
X-Proofpoint-GUID: 381ozlaJan_4tNDDtYlVK_gk1nAjOsB6
X-Proofpoint-ORIG-GUID: 381ozlaJan_4tNDDtYlVK_gk1nAjOsB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140041

On Wed, Nov 4, 2026 at 3:02=E2=80=AFPM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
>
> Hello,
>
> This series adds support for the D1 power domain used by the STM32MP2
> families.
>
> The new power-domain driver uses runtime PM and the clock framework to
> keep the Cortex-A35 cluster in Run1 for devices that require it, while
> S2Idle wake-up is handled through EXTI1 and retention PSCI power domain
> (RET_PD).
>
> The power sub-domain D1 without GENPD_FLAG_ACTIVE_WAKEUP is required
> because PSCI domains manage the wake-up path since the commit
> bfd5859709ee ("cpuidle: psci: Activate GENPD_FLAG_ACTIVE_WAKEUP with
> OSI").
>
> This patch is a preliminary step to support PSCI OSI in STM32MP2
> platform and the same power domain will be used also in STM32MP1
> series.
>
> The first 3 patches introduce the new power domain drivers.
>
> The next patches add this power domain in device tree for each STM32MP2
> SoCs: STM32MP25, STM32MP23 and STM32MP21.
>
> Regards,
> Patrick
>
>
> Patrick Delaunay (7):
>   dt-bindings: power: st: add STM32MP PM domain binding
>   pmdomain: st: add STM32MP power domain
>   MAINTAINERS: add entry for ST STM32 power domain driver
>   arm64: dts: st: add D1 domain for STM32MP25 family
>   arm64: dts: st: fix power-domain labels DT coding style in STM32MP25
>   arm64: dts: st: add D1 domain for STM32MP23 family
>   arm64: dts: st: add power domains for STM32MP21 family
>
>  .../bindings/power/st,stm32mp-pm-domain.yaml  |  46 +++++++
>  MAINTAINERS                                   |   7 +
>  arch/arm64/boot/dts/st/stm32mp211.dtsi        |  37 +++++
>  arch/arm64/boot/dts/st/stm32mp231.dtsi        |  54 +++++---
>  arch/arm64/boot/dts/st/stm32mp233.dtsi        |   1 +
>  arch/arm64/boot/dts/st/stm32mp235.dtsi        |   2 +-
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        | 126 ++++++++++-------
>  arch/arm64/boot/dts/st/stm32mp253.dtsi        |   9 +-
>  arch/arm64/boot/dts/st/stm32mp255.dtsi        |   2 +-
>  drivers/pmdomain/st/Kconfig                   |  14 ++
>  drivers/pmdomain/st/Makefile                  |   1 +
>  drivers/pmdomain/st/stm32mp-pm-domain.c       | 128 ++++++++++++++++++
>  12 files changed, 353 insertions(+), 74 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/st,stm32mp-pm=
-domain.yaml
>  create mode 100644 drivers/pmdomain/st/stm32mp-pm-domain.c
>
> ---
> base-commit: 7b3f3e772d5107c3a59b9f2278e9aeab227b26db
> branch: master
>
> --
> 2.43.0
>

Please re-submit this so all patches are sent to me and linx-pm,
including the dt patches.

Kind regards
Uffe
