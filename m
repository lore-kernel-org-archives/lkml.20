Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794815836;
	b=br/aKH7/0/Q4seIDyrotJORZexvfqTR9gZOW8luECZs/uOnHN9+QOt7zwuOPr3xIb8AZ
	 Hzzqcd2f2K3+IghKUEzhGoJHSq9texfDpGcD6uG9MOMVzZQaK9xciyLvINd0X1tWc8dUo
	 IIh43pnOuIfF2sJZs7mjvviYxFOsRWXOfBiTm48jo6bi0ZSvAC+zWcDCV1eBrq6+05lNk
	 GsZnXKWblpZkhafu3AfHtZu6ZRrzHGlnsaQpANyxsTjEobGMT3wJ2BV9lvBySFovt7FGU
	 u49D4o/D+Z9EKnT9OZGpy9MWvI1oTWXdhL8b0V23Ep6vTpduXhhuByRHqvZgQZ89JVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fj4cXt4NV451vKWkLMm3SnGNqAEB56Lh1g1FNy/XasM=;
	b=ARKmZ/BAOqO7eCmHOgzfTeoIUiGFZCpxHwIQB64CWK7FeCcGAk1CbgpXKW4YLntVKHzl
	 9exlWBL2fud+SXdSR8EhtwNjZnOgqXa8hQ6i2fY4OuQZe43W9rqP1lDs/SsUIRnVKfL0o
	 yNzxnHHy7IQs/q8IU972aWubGJctYA+MyVz5/3DBL/I1BBYNGoQ9n03VvRt7ceWeywVBz
	 zJV15woaB06M3XKY9nxD3INE7tF/dWBYRz72+bVta5+NvqATZi00stmg2+Sc5WQESuDbH
	 VcQJuqUUUlkmDLpBS09JytvRskdPCFmkRTzk9QIMlwi9w0Y6cHKVziCj5oTdvZleNrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzr2DNxW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9Yn5LET;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152EF606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 152EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzr2DNxW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9Yn5LET
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7f7uX967058
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fj4cXt4NV451vKWkLMm3SnGNqAEB56Lh1g1FNy/XasM=; b=fzr2DNxW4foWpXxT
	mvJjmDoPv67OLuzgqDV4/qpcFcqwILyumP4/MtYotkF80rAincOXzU3/FuX4UyNF
	LjxU4Z+jSMFnPPaOperiGD2rkUVsytoHK21sP5p50qSFbbcFyguRVuvU4j9ONfH6
	IEl+9EBMjH4jkBcoAMuuunJlJnCDWh8ib5psqUdlAxbDNFU0sODILeT50fE04jWo
	XmRjl1gNJqaajB2+9M8bzZt3bS6Thjoc0+C6aCcznXAEq8ThMr/InC5sL3KDM3oj
	ps0zyAV7R/HvYmC7HMu3ul//K9zU6GFzmd+QVhTMiR7rjblu894eW90BpgF0NIUC
	YHgxrg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk25f4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:57:14 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4d09fefd7so7092957b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:57:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794815834; cv=none;
        d=google.com; s=arc-20260327;
        b=XYYuDwZHoaKKh8rx8ZLXMS0+B2wiTQcha/DHrk8k+/vurflwJqi5ZlvP4ZQ2Jw3kVm
         Aexcwjg0qE72Mx2oI19M7aX/IHieyas7NT/Uv/w2gO+ZacsfP1PN64TUFE1A/REA/sta
         gR2KKA/uhhCgP7Lkrc81z+F8V4Usx9Toue8XMUlVLa2wZ1yapQhn97owtvSIG+JL6d19
         gniU28VVx7A/khLn6YOhRP4w6fpTWe77Oh2Z/GhqybP4ygCM7BpMw6EitmUjnsR1Dpnj
         UAz8mDNhqfPGdGJLEhF7Afg+4CF6bk/cYu1XVRnwKNSLx6uBtyZYHP5/GAX46pzDDGes
         5lQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fj4cXt4NV451vKWkLMm3SnGNqAEB56Lh1g1FNy/XasM=;
        fh=vg0f4HVKnnSoItac2MmgscLuhrqbF01JaoiILF3B854=;
        b=NvB3PQnrL/iJP+O0ri1EW8E3WPqY7jRh2KGujAsxTFInZwC3QOl+S+M8CYJk55QPEe
         SwgvUTLs33gUvsi+SbyoqdXTRmyzgzPyHBIfZP3cY2zxDyLFwykrR2mILyNHeGYB7HJ+
         US8e20H820cppQKq7Ik73DACFxx/NZtMjrrKn2Zp41K8lvdQTsal1oLBMEPJ14cdqZ9l
         jmsE108AIqnX0DOItZ2f6icZAd9NyYPmlEmEp//cxlfBWmdemILMiohSDUmsMEY++nIg
         SSxGZhSLB+TgA2BsddUd06ROtRE+GBxCUecz6th3a+W0Z6m9CYDAcCnaRnEjPem9HHdp
         1anw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794815834; x=1795420634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fj4cXt4NV451vKWkLMm3SnGNqAEB56Lh1g1FNy/XasM=;
        b=b9Yn5LETPV+l840iMJ4mVHGn7R3QKOmlpKIna6ciyepZO/JMkHNtQOjx6E6MJSwBAN
         6j/nwKySLpta/au1FBk3/xlPz67KeZh/TLEpHBr9TlgwTuNWCRPnbuZUNV1k579xPsrN
         NflD8grO2Q8FfYL9Af4Bc3SZZ7pCC0lxHcR/2O0gY4sXcxF4LDmgT8n0VulJ9xd1rE4B
         yrQXx6azRW1DJmx7xekFtkGv9XzQHH9ZhDCW3nEA33rQSSfRgb0KR6w7IZd3PpEg3c9K
         8OXGVfZ+NwNP5089JQW4X9OgAXAXrH+0ovV+QPWG59uvbXyp5pgVnQH69QR4P/Fj/8pD
         P/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815834; x=1795420634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fj4cXt4NV451vKWkLMm3SnGNqAEB56Lh1g1FNy/XasM=;
        b=c+jJ/yx2ArgpVQKe2ewZtI0NK9HpE0BECG0JqlleHd40rxyNnR+bZ7XaKrXuTeT8vL
         hqQOvLvv+YJ99s/O0ReeUNWexc4SDQPJlAKoJ0m5AGovLlT7WI7iNc2CMXIODsbWD5Th
         ie2FrIw+G75f/KVusy7yYJCA4/lK2DwKtTWbVt7+G3tC2apLPI0O2XfzBPDiR4UhlZGN
         xf91MwhJF1pTLezPKjVLTkJqxzZQJq4W+97BagqQ0Y8IIl+LkpWpHWnFN5fyhf3+Or7G
         aXQzc90L+CBiHGKcBrGcWmD/RxFhSWBGkw1uOA828idYViusM8dAY00U7b3hLZydx2ZU
         ztRg==
X-Forwarded-Encrypted: i=1; AL+hErFe7Dzyzv1RaRRvkvUndVEAzr41V4baOzY4zcLJtYwh76i63QdENbDyNWTOeKiXq+DDGHmOwlp9pq4y6pQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qr9GFIg81MuiiWZGypa42GL9aGvIhCuszD56LzeiPOoCntOfu
	7wRfGGlJ4pD0ufH2BBtss4uV/bhJpdtwAwU83E/i5VG+51svKACy1paZsgC0sMMGZqbKULWAaDx
	PB5Vo//H0CSM9nqvKRDbCEciLZgOPk6mLQc+xqTC7nFlzwlL7r8ujj4FEE/CNKGXXCqlNuTHMG7
	KYIyUQVyDkjZXqzCm4vMikb/SaHlAyfCb9YJAYcDj71w==
X-Gm-Gg: AZFdTZd03Y+Ii/QHD6jsyDC4p1sFudh4lr8U1kh2TLBCQtA/IACxr38W/JA2HfNAWgO
	voczD+GqAeF4MaG+Y8W9H+1oZ2aREk6zYxE8IUgqvuOXeq6ohNsE7BTaFfgMtz2U3Dhi1tSG6hs
	TxLfRQI3QfYeNAAtxH89cEtoiKwSJfbOhicRzq8kVANR3FN55r15BoEZeqcQ==
X-Received: by 2002:a05:690e:1447:b0:67c:11c9:2d10 with SMTP id 956f58d0204a3-67d89828203mr7158988d50.89.1794815834155;
        Sun, 15 Nov 2026 23:57:14 -0800 (PST)
X-Received: by 2002:a05:690e:1447:b0:67c:11c9:2d10 with SMTP id
 956f58d0204a3-67d89828203mr7158980d50.89.1794815833698; Sun, 15 Nov 2026
 23:57:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-aquantia-poll-global-status-register-v2-1-b602fc7e80a9@oss.qualcomm.com>
 <179473078423.2199510.11398825136938509686@kernel.org>
In-Reply-To: <179473078423.2199510.11398825136938509686@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:57:02 +0800
X-Gm-Features: Aa3M54o6qBBA3V0s4UT_4BqHaeqEpI5eO_2r1FclneHZIMg_LaRtxtOzEjW4olQ
Message-ID: <CAPTcHHTdwtfhQkuOMw=HvnMB+HRRKGH-7T=Oou=zaFj+Zm9ApA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: phy: aquantia: Poll global status
 register for provision ID
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, sagar.cheluvegowda@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: U7HMzOt1TolFhL8QpxtoWen734_Sech2
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6afab75a cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=9R54UkLUAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=xwKONjL-6CjfJ1EiobAA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMSBTYWx0ZWRfXzumNlP7I9PX+
 oXaouPp1q/TSF1dr2PbzVawSvGwkfFUJh2GfhEg6Ggm02adurjmSliJJZzQXI03O3c6myG8Qlju
 v51Zo3CL3ASHEVOpyrzHwQY19IHyD/Q8lp5F3A7IpHgKOzBnKpIENo2ZDVH5sVnzEqc6mzAgRlI
 UV691/3q9o7WPhOtJ1suhPvWpOGiCZ2oOw+ND4G3nv3FfnXlJhvdGUQNqX75geNyo1fvO0jmCkM
 uWaPrh+J8Iz9BJZ16HubXlXiVGgPWIxb5p6Eo+h9zvc7/o4DOJzuL+Fy0VBpAaTWraY10xwtKDn
 rTMTnP65T2fINbEZC2QfKFR9frOoN1TSUu5s/yKStoVpFm1i330fXHP+5nUGMyyB9ca7Qy0Qv2s
 r7usTzE+a8iLVq3hjSVuMr7Wzkhbzsq2pL7ZWzHZc3KegWX0zJHGEnDVQGMbABFTRPHiAXt51Fb
 WCYtL3wgONkyUsnUCdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMSBTYWx0ZWRfX/ae7Ty2BRUfQ
 0CR/wZTsiocAIxSEEnl3S1aZFxG2MkvS4NveiPowpberCyqvaRjy0hDU0jGbS327WnOYwLz8iNV
 I1VsqqdqAEzL4Up4+LcbnmpXnoaF9zs=
X-Proofpoint-GUID: U7HMzOt1TolFhL8QpxtoWen734_Sech2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160031

On Sun, Nov 15, 2026 at 4:19=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In aqr_wait_reset_complete()
>   (drivers/net/phy/aquantia/aquantia_main.c:708-721), the new second=E2=
=80=A6
> - [Medium] net: phy: aquantia: propagate MDIO read error in
>   aqr_wait_reset_complete()
> - [Low] The comment above aqr_wait_reset_complete()
>   (aquantia_main.c:684-690) was not updated.
> - [Low] On a provisioning-ID timeout, aqr_wait_reset_complete()
>   (aquantia_main.c:717-719) prints 'Firmware provisioning ID not ready;=
=E2=80=A6
> - [Low] net: phy: aquantia: missing Fixes trailer for
>   aqr_wait_reset_complete() fix
>
> --
>
> net: phy: aquantia: Poll global status register for provision ID
>
> This commit adds a second poll to aqr_wait_reset_complete(). Once the
> firmware ID shows up, the poll waits for the provisioning ID field in
> VEND1_GLOBAL_RSVD_STAT1 to become non-zero. If the poll times out, it
> logs a warning and the function still returns 0. The stated reasons
> are link failures seen on AQR113 and correct fingerprinting of AQR412C
> MUSX firmware.
>
> > diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy=
/aquantia/aquantia_main.c
> > index e95d391a6dc23..bed891cfaaa1b 100644
> > --- a/drivers/net/phy/aquantia/aquantia_main.c
> > +++ b/drivers/net/phy/aquantia/aquantia_main.c
> > @@ -702,7 +702,23 @@ int aqr_wait_reset_complete(struct phy_device *phy=
dev)
> >               return val;
> >       }
> >
> > -     return ret;
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D read_poll_timeout(phy_read_mmd, val,
> > +                             val < 0 ||
> > +                             FIELD_GET(VEND1_GLOBAL_RSVD_STAT1_PROV_ID=
, val),
> > +                             AQR_FW_WAIT_SLEEP_US, AQR_FW_WAIT_TIMEOUT=
_US,
> > +                             false, phydev, MDIO_MMD_VEND1,
> > +                             VEND1_GLOBAL_RSVD_STAT1);
>
> [Severity: Low]
> The commit message describes two problems: link failures seen during
> AQR113 bring-up, and an AQR412C MUSX fingerprint that can't be built
> correctly. Both come from aqr_wait_reset_complete() treating a
> non-zero VEND1_GLOBAL_FW_ID as the end of chip initialization, before
> the provisioning ID in VEND1_GLOBAL_RSVD_STAT1 is set.
>
> If this is meant as a bug fix, should it carry a Fixes tag? The
> FW_ID-only poll appears to go back to commit 43429a0353af ("net: phy:
> aquantia: report PHY details like firmware version"). That commit
> added aqr107_wait_reset_complete(), which was later renamed to
> aqr_wait_reset_complete().
>
This is not a bug fix, it is an additional check for PHYs who need the
polling of provision ID like AQR113C.
So I think it can not be treated as a direct fix the commit 43429a0353af.

> Without the tag, stable maintainers and backporters have no easy way
> to tell that this change addresses a problem in released kernels. And
> if it is a fix, should it go to net rather than net-next?
it should go to net-next.

>
> [Severity: Medium]
> This poll only exits on a non-zero PROV_ID or a read error. If a
> firmware image reports PROV_ID =3D=3D 0, will every call sleep the full
> AQR_FW_WAIT_TIMEOUT_US (2 s) and then return 0 anyway?
>
> The commit message says "not all PHYs require a valid provision ID",
> which suggests PROV_ID can stay 0 on some images.
>
> In the driver, prov_id only matters for one fingerprint:
>
>   AQR_G3_V4_3_C_AQR_NXP_SPF_30841_MUSX_ID40019_VER1198
>       AQR_FW_FINGERPRINT(4, 3, 0xc, 1, 40019, 1198)
>
> That fingerprint is only checked for PHY_ID_AQR412C, in
> aqr_translate_interface().
>
> aqr_wait_reset_complete() has two callers, and both now pay for this
> wait:
>
>   aqr107_probe()
>     aqr_firmware_load()
>       aqr_wait_reset_complete()
>
>   phy_attach_direct() / mdio_bus_phy_resume()
>     phy_init_hw()
>       aqr_gen1_config_init()
>         aqr_wait_reset_complete()
>
> With such an image, would each port lose about 4 s across probe and
> attach, and then 2 s plus a warning on every later attach and resume?
> On quad-port parts like AQR412/AQR412C, that cost applies to each port.
>
> Before this patch, both paths returned as soon as FW_ID was non-zero.
> Could the PROV_ID wait be limited to the PHYs or firmware images that
> need it?
This makes sense, for PHYs with prov_id=3D0 as valid, the probe will be
bcloked for fixed 2s, this is not acceptable.
Yes, need to limit the change to PHYs who really need the non-zero
PROV_ID. Will change this to limit to only AQR113/AQR113C,
and leave AQR412 logic untouched.
>
> > +     if (val < 0)
> > +             phydev_warn(phydev, "Failed to read VEND1_GLOBAL_RSVD_STA=
T1: %pe\n",
> > +                         ERR_PTR(val));
> > +     else if (ret)
> > +             phydev_warn(phydev, "Firmware provisioning ID not ready; =
"
> > +                         "interface mode detection may be incorrect\n"=
);
>
> [Severity: Medium]
> If phy_read_mmd() fails while polling VEND1_GLOBAL_RSVD_STAT1, the
> val < 0 term ends read_poll_timeout() right away with ret =3D=3D 0. The
> code then logs a warning and returns 0, so the MDIO error is lost.
>
> The VEND1_GLOBAL_FW_ID poll just above handles the same case with
> phydev_err() and returns val. Is it intended that a read error here
> is non-fatal? The commit message only says that the timeout case
> should not fail probe.
>
> Both callers act on the return value:
>
>   aqr107_probe()
>     aqr_firmware_load()
>       aqr_wait_reset_complete()
>
> aqr_firmware_load() treats 0 as "Some firmware is loaded =3D> do
> nothing". Any other negative value goes to the default branch, which
> passes the PHY read error back to aqr107_probe(). With this change, an
> MDIO failure on RSVD_STAT1 looks like ready firmware, and probe goes
> on.
>
>   phy_init_hw()
>     aqr_gen1_config_init()
>       aqr_wait_reset_complete()
>
> aqr_gen1_config_init() only builds the fingerprint when the return
> value is 0. After a read error it now goes on to
> aqr_build_fingerprint() and the rest of the PHY configuration, even
> though the provisioning ID was never seen.
>
> Could the val < 0 case return val, the same way the FW_ID poll does,
> and leave only the timeout as a warning?
>
with the above proposed change, we can safely change the warning to err now=
.
This is not a concern anymore then.

> [Severity: Low]
> This warning can fire on every model that uses aqr107_probe() and
> aqr_gen1_config_init(), such as AQR105, AQR107, AQCS109, AQR111,
> AQR112, AQR113, AQR114C, AQR115 and AQR813. Is "interface mode
> detection may be incorrect" accurate for those?
>
> The provisioning ID only affects the interface mode in
> aqr_translate_interface():
>
>         if (phy_id_compare(phydev->drv->phy_id, PHY_ID_AQR412C, phydev->d=
rv->phy_id_mask) &&
>             priv->fingerprint =3D=3D AQR_G3_V4_3_C_AQR_NXP_SPF_30841_MUSX=
_ID40019_VER1198 &&
>             interface =3D=3D PHY_INTERFACE_MODE_USXGMII)
>                 return PHY_INTERFACE_MODE_10G_QXGMII;
>
> So on other models, a missing provisioning ID can't cause wrong
> interface detection.
>
> The message also doesn't mention the link failures that the commit
> message describes for AQR113.
>
> > +
> > +     return 0;
> >  }
>
with the above proposed change, (limit the PROV_ID polling only to
AQR113), this issue will be fixed together.

> [Severity: Low]
> This isn't a bug, but the comment above aqr_wait_reset_complete() was
> not updated:
>
> /* If we configure settings whilst firmware is still initializing the chi=
p,
>  * then these settings may be overwritten. Therefore make sure chip
>  * initialization has completed. Use presence of the firmware ID as
>  * indicator for initialization having completed.
>  * The chip also provides a "reset completed" bit, but it's cleared after
>  * read. Therefore function would time out if called again.
>  */
>
> It still names FW_ID as the only sign that initialization is complete.
> It doesn't mention the second, non-fatal wait on the provisioning ID.
>
> Also, on PHYs where PROV_ID stays 0, every call from
> aqr_firmware_load() and aqr_gen1_config_init() now times out again.
> Isn't that the repeated-call timeout this comment says the design
> avoids?
>
> Could the comment be updated to match the new behavior?
Will update comment accordingly.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261111-aquantia-poll-global-status-register-v2-1-b602fc7e80a9%40oss.q=
ualcomm.com

pw-bot: cr

Regards,
Hongmei Xu
