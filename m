Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793130427;
	b=ChnjTSC9KyDITJJCi4+LtsYXzGDdZxzPXXUI9VDWGnTMxXTqlUSc59IcyHXxG1MDt4GC
	 WW74vKqEu36ap/a23BTuz7eS8TaYSiCW8Ls98k2VP3jQ/JLdwb3jMbFFR+Un4RR7K84rm
	 ZranZISWK82wlCTbJPsmBBF57FVw1TVQTB36V4LeS2cDvZHY+wRLPjsAUvFBK959QkEQV
	 8jczpAoOikZyfHIlCR5FRA+nSTawRoc7PGUIgADr2SOc1O0+3Wh/YwUIC+8nUu9y9Cb07
	 tQy25JSHv3IR5RCszEnlUNYLg+9/VZDRpBgqp08apRpvS0z9+fI6a8w3X4r5pKhfDZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793130427;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vXupvzMkXEFxaRDSdiUYDES7qK/BByeFIiZk+85P+Ms=;
	b=lC5jrtLXc2exM3Hgy5/oHzmCJN5o9Ajsp89nwWIDobGJ0SVFXe5jFky8MWAyrNRGihz+
	 wB5RSYOJo1jI8gE16OyjUPBG4S3E6h39mn9pfuGk1eFfM/DeO5jroPGNfNK6lt0IzqiPY
	 hrD0T3uFhZQDOS60I/6v4kRSALc2V3ZeTg25d8WgmMi+duHatVD+SNlqzrjSVr4xaZY5N
	 OwlDbL7c+AyKqET+2YTggJF2dCIWtS/jiMnZye0J/myF9ivixSH/LuFTxuLiBEdq+wBQW
	 3nIOz1OFbyFBCpq+6I+bd+C7NgpUwmyvQKSSYIPatvjcGmrdtxaBGWg0rK/jKelKCTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LzujQoxQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6PH0zyX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197FA606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 197FA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LzujQoxQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6PH0zyX
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIIAvr3486333
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vXupvzMkXEFxaRDSdiUYDES7qK/BByeFIiZk+85P+Ms=; b=LzujQoxQ17BLu3f5
	CN627i/BGLQfk7BgVJKjA85vLKTX5g/qZZoC2kl/3DIJZdh/j83jFT+QUiTVqbj2
	RL6Zo4/purFVj773fYIDpUF1RMk3jELvq2WrhzHpNnAQy4OrP7aM9Dp1qwOILf9U
	k8Ojf5uC+spAsHB1T/Ju/lrznb2t0WoB5wqIoluWT+3nv4XPPoxVhmtLOXJMCXdh
	9jvL1LnRYK7sZmACOehN6Qps01hH9WnmZlHIjCDcZDaYinXSQx2qv688nwYoRkxZ
	Y+WRQdhd7IczYHUpFYaeTX9SM5fJJPRiX8lWYksweVDK8y2VZBEPGgDxI+gM4UcH
	bVL0cw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtc53q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:47:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06750c74fso160155b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793130424; cv=none;
        d=google.com; s=arc-20260327;
        b=e5TjZ5agnke95GwCmH7McpOAmY94qWcjWosFDBCnrdaNCPdoWdHA039GX1uDUclQMF
         pg2iDAo10opvjrWht9Yv3WYFqJgegre21Dk244W9jGFYx6OQEMXriuEnWvCAYwj7eeMH
         gFz3hSFEl99g1OswTPo1+8FqZKB11B4bxC5sAOx9n4NVAdU0kP2PiB9TGX0Erwwodkox
         09TDYFDAvry2TU8s/ie6vfEjeoq2PzMP+ZXUUhMtWeC1o3CPA9R45Uc6/P4uiMK4ByxB
         0+mygDsIe6nNQF4ybJTZ7v85BokBEkpDJYHpigEcHL/SASc2YoWNlAHBqo6rwmiC7nsE
         lZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vXupvzMkXEFxaRDSdiUYDES7qK/BByeFIiZk+85P+Ms=;
        fh=vYqn1UBiNKbVAoQjmbJH08i2513E4uVRGNADfzxbQnM=;
        b=HrVznFcRaYHLEO7Hvw9dILT1wBHb3cHL9hWhirVAExYjTfkPz5Fy0YfOv8zVaa1guB
         4LbnVL5fXE1RxrQgXlUCJ1LIUymPRtiDSfSvq+Yu+mdd9SVmqNtBbWi79scXIkedyVOG
         QnbdrxhNYrMUKSyXeD6LqFINlxpeMAgHlBlxTCGiEfzEgVBawAA1vNMvoBT1bdeFS7I7
         hmk/JnGkInT8Hvvfci08JYB4unxD4893QV7/z9wTjc0UjN6eLyAtzO9ynnTO1syLvay0
         H5UeggYKR2pXY00F9UyeevLF0Im66VZf1g0ynBtHKG23kLx8vUbSVNRADC1q3Sw4Tr+h
         iBIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793130424; x=1793735224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vXupvzMkXEFxaRDSdiUYDES7qK/BByeFIiZk+85P+Ms=;
        b=I6PH0zyXswXsI0b/+7VmGrLu7/KnpbM19lsLS7dYEWr3lsdYlKBsDvTMjMZZD0FjNw
         9chhVheMrh7uoRZ9QHNeLEtYD+TVPXZ4tkhRwA5skDJQc7+qplHEEMHQYqVFeqOqY0b6
         n+0Zobo1TQwEnGRuc3GsTTl2kKQ9oNq3Q18WKa7OO9VOlzxHx6n97EElJIIT55Y8dqCr
         iBTh3RLr45ovZt0tL4HbcbD5vl/bXhCdp+ZPZoQW2eSPGMACcjzj8Jx07xHntzBVaCNZ
         /0CeUZNpAlh4ze3kbmYnUl2yFvlk7kc9h98GYLyTTtkyvya3WRN2PoQykLRlrTkf683V
         Utwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793130424; x=1793735224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXupvzMkXEFxaRDSdiUYDES7qK/BByeFIiZk+85P+Ms=;
        b=OYsD2rN3mTCd6P9s7kXGpbFGo3LMh+uFflHWtu+OZXxmCeRzzJkShdjZzGa+Gr861V
         yIOZoMJ2FGdFHeYIqq1w8YTNdbt/0swtqNO8aNwxfmhVaIXajJy+Sc+D6ssQXG+acv4/
         CvT011tkyAxUqcZG5m5nFthCFuXJMy8fYHmAX+sIItHMDKGwDd0KY6x8ojpy3hjELaY7
         i0lJn7YT1ItsjpGSokYPqqLRhMM6GYB0wqkpT8m1G/4q9gA84Ulbu/xuAcrPp9grT6PW
         GsaxqxtVMKnWR+mS9hIYL/2cNQILFKk/l6I5fHPkozm+ugFHzlG5JFzk1pCETXdOX44S
         usAg==
X-Forwarded-Encrypted: i=1; AKwUvBysvvAlQ63v3KK6Tq+ImqqfoCLpoGkg38RcxwdmoRjwlKaYEYtCRjmMY4XwUe+Taa24VeAh0s+AbYfCHDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1oeL+TMgOW1d6AQE+OY9GEc72ME4MNEhqnLPL82KqcbaWV1/x
	YJizkKfUtcLAX3Clag4LMvCHkpNrXlvE2WoO4DXyUJEjLkWlSU6JnY7d+vfP+yXLqx1oD5eQIdn
	f/b+8ONcZoAxG6NTySuffaaJtY5v7jyNntLkySw7S501yTJZAeMNIHoi/ae0GGnJwYD/SHWWSsh
	Ab3RTjDitRv9zPffT+GDCYnCvLcfC4SfevQulW8CD+PA==
X-Gm-Gg: AYBFou0wKZgu9J2MZpVC5wboVBvau8K77Z8ydGbUBdP6KwZYbE7bLUjL6/XzQCZQ8yr
	K/+pqofNpCw1HADfVdNikoT8U5GATAN4gfAYwMY2BcjoMheE4J27q9XUrnJBuKheAgIEiV6wNgI
	OcinIUE3r+pM3di7wjsBT0lUY0rz378l3XJ5ZRcrJEL75hjxpSSwiJQA4G5g==
X-Received: by 2002:a05:6a00:399f:b0:89f:3c81:e733 with SMTP id d2e1a72fcca58-8a6e6b165f2mr200685b3a.25.1793130423820;
        Tue, 27 Oct 2026 12:47:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:399f:b0:89f:3c81:e733 with SMTP id
 d2e1a72fcca58-8a6e6b165f2mr200670b3a.25.1793130423390; Tue, 27 Oct 2026
 12:47:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
 <20261027144051.249211-2-ulf.hansson@oss.qualcomm.com> <583dc515-855c-48d6-aefb-abaef26b2564@linux.dev>
In-Reply-To: <583dc515-855c-48d6-aefb-abaef26b2564@linux.dev>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 20:46:52 +0100
X-Gm-Features: AclHuK_bapBmxktEdZVjMgWgZxWqamgn8RlHpTC8snrfTiBMci97VrdDBV-_joE
Message-ID: <CAPx+jO_+P-ksGzbYp9Aky7etMyKtTUvtAZJZJpauw03Y8zP0Lg@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: mmc: Extend keep-power-in-suspend
 beyond SDIO
To: Shawn Lin <shawn.lin@linux.dev>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3OSBTYWx0ZWRfX2aII+sKX3//X
 BeYVwHhkxsx84m0TJapWEaISbdGtyOSg0+DOolVa/XF/c0tQs4kqZoZ3LuhLvk0RED+/wP1bTQ1
 7Sogs+bmicAwDsPSfuuIgS/nAUi1U1c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3OSBTYWx0ZWRfX/pt2SOYdqApq
 o4FxWAxPDT3lNSsD0VtMOd992eF03lKD1jhxsZuXbF2bCqjJZkf75kn8FSrOXhUfe6emhE5LqZA
 zXzU5RMSOFD/XKohFzkaE+5kdoXoodptOSu/Tvsjo0yqcKfJoMKvzGdTA5ob8gTEKDkD18jvP0G
 MqYmxTseiUr9ija++6de2UCdDNQX5O1LTWym+xTD/Ah21xVl80exr/6NhLecpej1Vnwh0fNk3tK
 3lPP6VpYncNQT9nb4/rxYJpWRegZkoy3aEXHeGNjmo5Q2UPia8K7bJU7GNlCilM+YVB0d2JYoG8
 4oPjT3ImtxunS8JXC+E+Bf4X/mpyTuKEvoGvefm354NkQvqS+Z/now+aKN1qf6TjoJ1Y/xvZUR5
 mHxZefI/UNlsDDUaYsrdvW1z4Ith/+ZbxuJqHZdH3c0QYyDLqrFuRxbwaibJ7HNJtNa6dhLHkck
 ZC9jtB+hV3Gmtw0zcdQ==
X-Proofpoint-ORIG-GUID: NunE1M3-d2W3SItZysZgo8JSsw9SPnvJ
X-Proofpoint-GUID: NunE1M3-d2W3SItZysZgo8JSsw9SPnvJ
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0ffb8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8
 a=HEP-3NFZZEzz-JMo_uAA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270079

On Tue, Oct 27, 2026 at 4:02=E2=80=AFPM Shawn Lin <shawn.lin@linux.dev> wro=
te:
>
> Hi
>
> =E5=9C=A8 2026/10/27 =E6=98=9F=E6=9C=9F=E4=BA=8C 22:40, Ulf Hansson =E5=
=86=99=E9=81=93:
> > From: Kamal Dasu <kamal.dasu@broadcom.com>
> >
> > keep-power-in-suspend is currently documented as SDIO-only, but the
> > requirement it describes -- preserving card power across a
> > suspend/resume cycle -- applies just as well to any card type. Drop
> > the SDIO-only restriction so eMMC and SD platforms can use it too.
> >
>
> I don't see how SD could use it from the following patches. Perhaps we
> should still be more strict here to say SDIO and eMMC only, unless
> SD part is implemented later.

I didn't have the bandwidth to implement this for SD at this very
moment, but the idea is to add it for SD too.

That said, I was also thinking that maybe it would make sense to add a
sysfs node to allow the behavior to be controlled by userspace.
Thoughts?

>
> > Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >   .../devicetree/bindings/mmc/mmc-controller-common.yaml          | 2 +=
-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-commo=
n.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> > index 8b9b3b036129..2fc8e06d5ec9 100644
> > --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> > @@ -301,7 +301,7 @@ properties:
> >     keep-power-in-suspend:
> >       $ref: /schemas/types.yaml#/definitions/flag
> >       description:
> > -      SDIO only. Preserves card power during a suspend/resume cycle.
> > +      Preserves card power during a suspend/resume cycle.
> >
> >     wakeup-source:
> >       $ref: /schemas/types.yaml#/definitions/flag
>

Kind regards
Uffe
