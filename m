Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793260420;
	b=rjCcciFgecHNm+MEIu8wsPQHQFnv7XJNYFBT9+VGuu4wmjjwz9y9sTDyja+fQBaW0KZc
	 ru4Vnhi9st1kvxose003BxV6mNmEsOZqExOpwomtYSAWkMrUG0r8N7d0mVvfq0i+4kega
	 3X/Kugnt0m5GiIiUUNQBezt+UIoQIcJv/8Q8OSEiGyxXG7y/RrdycLvszVrGMRcAXqW5Z
	 kCww++GGytQfYN/KTANlR5G6eqndR6LqD0kcRpRn5Q9zH84X75PO4BbrqQvI180rPugq+
	 6RJOWiUWZcxYnuEpHfOZkVowkYMq9EmdBLtIm10q0hV6m7qv4O4Wj5eh6CZaOePTxyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CErQWwHpTQsdv1eeRp0xj54B/5qd6neVJ5ivvO2qTQ0=;
	b=ezfCmIY3e3Fj6AS3aaO38d4wCAAo/FKsd5O/VSOAwqPCMqXr3s+Gjheiwol2SYgL9HsA
	 8+5/u2LDhd46xvzdgTV6y2uFzuj59fbGPOlM2HtSVkiIffr9yNhAGdlM3HA51qVBciDJ/
	 a4VGsLUnYdvvRz3lDnY55GjRrfQ26jzs2KFt6SO1sOxV2Ce7GLFbYiqzAMCg4ZHiC5fnM
	 hVkeFQPuGTAmM4umvMgRf/8N1oL58UtMDsVyFMUyKBFTrqX0iXAY6GiAPK88/66huDUlj
	 8683SMPYs4Ke7yKdIfA6QIFA0idEqY8WegKhQRJSDf444rVAYj/rrpLRWRmlmPg6cCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=puTdSY9O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q02XaL/k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FA0606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FA0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=puTdSY9O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q02XaL/k
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GqsK3294103
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CErQWwHpTQsdv1eeRp0xj54B/5qd6neVJ5ivvO2qTQ0=; b=puTdSY9OvvwDdC96
	3LuK1X3mWHVf8Df17NzY7zR5h5MGW+LU8nkAqS/mpNEPNs4GVB/bM07ehgF9i1w1
	nLEWmOuOa02KjUCb/8OO5aMh0v047nPr8Q5tg/5eiVVoLVvKJ4yiAPpXc44rItds
	uwL9Ia+EF3WED4v8E/6s2BKG/JKTE+VS15P3HSLjgNPmlDocursNB17Dogs5Lpo/
	WkEET55DyQnctEGJ5MU1xIqHEBthbRJqqIegjiAGGg4coCTBoUfNDFlYapjRfXAq
	OpQfBuI9wO/zvr0FsbQdBrQLF1MuesH+/oRh/0EyhGXijP3UTTha/ZfvvOXA++LT
	4/aK+w==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshrqb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:53:38 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679f81e0f96so2735055d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793260418; cv=none;
        d=google.com; s=arc-20260327;
        b=Gh9p2u+QDr5z+Ym/Yx32KnOxcqB0Zm7iYx8cSz14VYMTIDjRUaeNsoyAz2BMt7y9tX
         23ytJO4j5n5PlUZTT5rZ0ueSBH5ERzooTiEZeNFbNng0LRGadxjEH4z8uD1NeabdLCg7
         eByZMAX9f86r9oA90ZjWxiaGh/IidAhjbQ8Sm69OkEi2si6MXFrdFhLphVN34x8e/Gez
         Cs8+VJBQJ20SpTV7il0tb4dqOKkaEkmAO3g77j2TH4iHEkGRmrcczaZSSVTdBnMfUGy7
         AU700wMvW0LVnOsThceqc8znThwnP8GPppuEsN9sWCAIZYLqvJ0eDRInMM8bxT3gWaF6
         YbnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CErQWwHpTQsdv1eeRp0xj54B/5qd6neVJ5ivvO2qTQ0=;
        fh=gCcXyfcOTLn7PtFyI3rO53/t3OLaSh8XXE5rmWqiCB4=;
        b=Iyc7enOi2X2WxG48xrb7IFXssDZ6K4tydK/BYJc8vtN6gGkjG18q70JKeHrQvg3B2K
         r8JWzoAEqZ5Ow0pRxsIQCX+BhfR/x0ZOQtZbb/3xmA1Z6nMJ50CHkcTGyKK8zr29svKN
         fneP0bh+mQ9iwKtYrwLv7PgwMJInzOUJCZS9KCpDgF0fw1RGguge5Gjn9H+0u367BNcA
         uKpLZYv7E+9b/Ah9mGcQz8j9dTABDPYNYIb3jqT/ijH89lcHJ0V7arB+JfdT+Cg8ixRe
         p/b33w8GcfektuoJErLtahsycWpq3eLXP/KjhECo7X3VepQe+qCNun2j+3qGsu2AMqr9
         fHGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793260418; x=1793865218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CErQWwHpTQsdv1eeRp0xj54B/5qd6neVJ5ivvO2qTQ0=;
        b=Q02XaL/kY1scdw41k5QtB7Cg8YFLaKcVUis4whjsLjAGJQCt5udX5RPtU4eXxnSmCw
         JzcdZAat5kKpuIhBFVIA5jo1DnGtGBYhh8UvRXuYOXrMPS0LMrL0Jf5sDVIUO0OJtmlZ
         V9dYzQWCldAqyLuM4Jre77aQwPeYMp6HU6l7YLep/BbsUo3QY4ifctKMZBBZ0Kw53b4G
         nmmRSFllvXrQp5C9IVpCFfDDIwJpvRgBRJirnuPGv5OnVh5gU5wk3z46NuP7j/esl8Lp
         GSLNvn73rV87bvhPkb6lO/s0DK5VSO3UYMVL4NdD0jDMKEzPPCns3g4zHGq5yJQCvy3Q
         LshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260418; x=1793865218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CErQWwHpTQsdv1eeRp0xj54B/5qd6neVJ5ivvO2qTQ0=;
        b=YSIa7GI84YyU/d7Yz2At/BqSlrDeToHtiB8VEMcALZL5RyIdSzzPOdgumgnKxTHWdk
         TDFB9gx6tucuCHsFSE58dV6dN7HAR7mO5/PlkORFiUaneJAc8QsKernrT4Ad//TJgvWo
         9eQ5S+Nd3NcnXgJm2iE5+P3SnRwYYfjNYxO2arjwlm5vel0IQregYJ7NovqKY/2AIhUW
         WOLOtqcXPnIGFeozYbymIgvnPWg3D/K44S79r0LWWJQkihQy4N8MbzLM5VOEOQ8AKeS4
         Jom6VmZwKGompP4QF5VyHuWyzFo5IcAIF5kWrPppuP+6TK1FsDMDmTEw6s4mayrseaU/
         XSEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8hvCQt5/NHMxhFSZ0PGXmXPLUklsEgHyGYM77S5O/L+Alsd45UebiwEOIK15mURQOnJeFRj7QwKP77aM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlhIRbcLM0UWrHJ7lM7TzV/W8gYd3T/DTTmYo1pG8ZyaHgVau8
	L5B7q7dmFKN+svrtkF0v6I4eRgx69e0wRZ0+vPXMk2+JJ5DNw706gOn2Xr4/z+/gpouXwdjOK1k
	zX/j+g6L2DzxS/0aCDHMLES0exowNCN5u3ECLjPSw86O6dDM5tWcuYfiZFTyKLD1fYAy0vb3BTp
	7D/4DhK4jvfW1DQcOVqmEsLumMYRQdgoXwHaS56I+VvHgxkgxLU8rS
X-Gm-Gg: AYBFou3M0ugh4kgc5Ac+BfcGB4EFxN47NsO50+WUbtTbtzsUPk2LjYiHsgaKDIWVf1j
	tcpqKtYt5alyWX3EA/ECGbCeeeNZ6B9YaNbhp3Y3ZgULgJxmuQpiQAlFynEJKLDui94d65hxyrx
	N6PAwj6pgCPj8EztHOrUlRenfj7ovbWOTKUs+a13dqg327eV4VQByz5dKe/Q==
X-Received: by 2002:a05:690e:13cd:b0:67a:8c43:74c with SMTP id 956f58d0204a3-67a8c430a98mr1437246d50.86.1793260417717;
        Thu, 29 Oct 2026 00:53:37 -0700 (PDT)
X-Received: by 2002:a05:690e:13cd:b0:67a:8c43:74c with SMTP id
 956f58d0204a3-67a8c430a98mr1437233d50.86.1793260417225; Thu, 29 Oct 2026
 00:53:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-net-phy-aqr113c-fix-pma-capability-v4-1-95a17f75dd7a@oss.qualcomm.com>
 <179300813648.3134.9297051486113517048@kernel.org>
In-Reply-To: <179300813648.3134.9297051486113517048@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 15:53:26 +0800
X-Gm-Features: AclHuK_SD15FggeMBxLfki7w4xzIjgia7vhRH0bv4P2PPKU4EI3tVVW9qX7VBcc
Message-ID: <CAPTcHHSUkB7arP+BW924uvsQ8R+ure=Tgnasms7=HLAL0qFXpQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] net: phy: aquantia: restore EEE discovery
 in get_features callbacks
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: h96TC9rRU_3jb6zZpwz4OfuTTlb1V5zz
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae2fb82 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=gEXrQIplmHuzUTvuzaAA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfX0TESAk+YsNkE
 LAzlGSezJ9xC/3y6vEhgS8NUjaWFGsERVxfzyROng8ZesbAIEqTDriFAHnIH1fFdJfTMJGCdogB
 QGuV2J/8VUkXT+g7Zam7UW4v9NigHGM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfXx/9tSx8saplp
 068JvOpKtXvabET1phVH4RdVm4q+N/paPpyuErm5vBoGT16wPDY8ji9adE95khAsEC8ovOGuK/I
 dw+iTrcFsqnIEWAZTl+z4X2BR3QyEgpNTlIJ7aWqPkPxzhtyX2FuiNfJLBBSHQIBi7uWyPk9ikw
 EdiDyW8Ggfdiq63jnsfRADBCTFbPSaS21ubS+WxBPpEj2wS3T1M5qfHXjf5TQmpr/JuDm2k3IGb
 pe4pYvYTrbP5Lnz6VcUB8ulssOfq7zHVkf149P1HUSYRFl9xm0/7bt65c+Wo1+BQt+CnRRr/vJ9
 5jhsA8WXIrczWGFRZf4IJ97DLDa0twpXc4kSjv8nYA2d2zyA9Tj6WdLXwDkS2aQmRLPTaFIG5PG
 EGcnyxnd3bfk4nh12sMAApplgaURwYyVfjnKATTUEeNhSXt5UXBmJY9KSAEg4K8Im4cYYmoqTnf
 UZWUG9R+7gnxW3cO2TA==
X-Proofpoint-ORIG-GUID: h96TC9rRU_3jb6zZpwz4OfuTTlb1V5zz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290030

On 10/26/2026 5:48 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] net: phy: aquantia: premature and unmasked EEE read in
> aqr115c_get_features()
> - [Low] aqr115c_get_features()
> (drivers/net/phy/aquantia/aquantia_main.c:1082) now ends with `return=E2=
=80=A6
>
> --
>
> net: phy: aquantia: restore EEE discovery in get_features callbacks
>
> This patch makes aqr115c_get_features() call
> genphy_c45_read_eee_abilities() after it builds the supported mask, so
> supported_eee gets filled in for AQR111, AQR111B0, AQR114C, AQR115,
> AQCS109 and AQR115C. It also makes aqr111_get_features() pass on the
> return value of aqr115c_get_features().
>
>> diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/=
aquantia/aquantia_main.c
>> index e95d391a6dc2..099ee919de94 100644
>> --- a/drivers/net/phy/aquantia/aquantia_main.c
>> +++ b/drivers/net/phy/aquantia/aquantia_main.c
>> @@ -1079,15 +1079,17 @@ static int aqr115c_get_features(struct phy_devic=
e *phydev)
>> linkmode_or(supported, supported, phy_gbit_features);
>> linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, supported);
>>
>> - return 0;
>> + return genphy_c45_read_eee_abilities(phydev);
>> }
>>
>> static int aqr111_get_features(struct phy_device *phydev)
>> {
>> - /* PHY supports speeds up to 5G with autoneg. PMA capabilities
>> - * are not useful.
>> - */
>> - aqr115c_get_features(phydev);
>> + int ret;
>> +
>> + ret =3D aqr115c_get_features(phydev);
>> + if (ret)
>> + return ret;
>
> [Severity: Medium]
> Two related problems here. The 2.5G-only parts can end up with
> supported_eee out of sync with supported. In aqr111_get_features(),
> the EEE read also runs before the final supported mask is built.
>
> genphy_c45_read_eee_abilities() reads 3.20 via
> genphy_c45_read_eee_cap1(). That function masks the result against
> supported:
>
> linkmode_and(phydev->supported_eee, phydev->supported_eee,
> phydev->supported);
>
> It then reads 3.21 via genphy_c45_read_eee_cap2(), which only does:
>
> mii_eee_cap2_mod_linkmode_sup_t(phydev->supported_eee, val);
>
> That helper sets 2500baseT_Full and 5000baseT_Full straight from
> MDIO_EEE_2_5GT and MDIO_EEE_5GT. Nothing masks that result against
> supported afterwards, either here or in phy_probe().
>
> For AQR115C, AQR115 and AQCS109, supported stops at 2500baseT_Full.
> The commit message itself says these PHYs misreport their
> capabilities. If 3.21 also reports 5GT on them, supported_eee ends
> up with 5000baseT_Full on a 2.5G PHY. phy_probe() only intersects
> advertising_eee with supported_eee, so a 5G EEE advertisement can
> survive into advertising_eee. ethtool --show-eee would then list
> 5000baseT/Full on a PHY that cannot link at 5G.
>
> The ordering in aqr111_get_features() does not match the commit
> message, which says the EEE read happens after the final supported
> mask is built. Here aqr115c_get_features(), and with it the EEE
> read, runs before 5000baseT_Full is added to supported. For 5G this
> only works because cap2 is unmasked.
>
> For cap1 modes it breaks. Patch 2/2 has the AQR113C get_features()
> chain onto aqr111_get_features() before it sets 10000baseT_Full. So
> the linkmode_and() in genphy_c45_read_eee_cap1() strips
> 10000baseT_Full from supported_eee while 10G is not yet in
> supported, and it never comes back.
>
> Could the EEE read be done once per driver, after that driver's
> supported mask is complete? For example, keep the mask building in a
> shared helper and call genphy_c45_read_eee_abilities() last in each
> get_features(). A linkmode_and() of supported_eee against supported
> after that would keep 3.21 from adding modes the PHY lacks. Or do
> you think genphy_c45_read_eee_cap2() should apply the same mask that
> cap1 already does?
>
Agreed. genphy_c45_read_eee_abilities() should only be called after the
supported parameter is built. So it should be called per driver. Adding
it to aqr115c_get_features() is wrong as aqr115c_get_features() is
called in aqr111_get_features() and coming aqr113c_get_features() before
the supported mask is been built in those PHYs.

> [Severity: Low]
> Should the result of genphy_c45_read_eee_abilities() be passed back as
> the ->get_features() result here?
>
> With this change, if reading the optional EEE ability registers (3.20
> MDIO_PCS_EEE_ABLE or 3.21 MDIO_PCS_EEE_ABLE2) fails, aqr115c_get_features=
()
> fails, and so does aqr111_get_features(). phy_probe() then aborts:
>
> drivers/net/phy/phy_device.c:phy_probe() {
> ...
> else if (phydrv->get_features)
> err =3D phydrv->get_features(phydev);
> ...
> }
>
> The phylib core ignores the return value of this helper on purpose at
> all three of its call sites. genphy_c45_pma_read_abilities() and
> genphy_read_abilities() both have:
>
> /* This is optional functionality. If not supported, we may get an error
> * which should be ignored.
> */
> genphy_c45_read_eee_abilities(phydev);
>
> The phydrv->features branch of phy_probe() also ignores it:
>
> if (phydrv->features) {
> linkmode_copy(phydev->supported, phydrv->features);
> genphy_c45_read_eee_abilities(phydev);
> }
>
Agreed. Should not take genphy_c45_pma_read_abilities() return value as
.get_features result.

> The commit message says it restores EEE discovery. The code path it
> restores, genphy_c45_pma_read_abilities() as used before 17cbfcdd85f6
> and 8f61d73306c6, never failed probe because of EEE discovery.
>
> In practice this is hard to hit. aqr107_probe() already reads VEND1
> registers in aqr_wait_reset_complete() and fails probe on read errors.
> That mostly leaves a transient MDIO bus error during this exact read as
> the newly fatal case.
>
> Would it match the core better to call genphy_c45_read_eee_abilities()
> without passing its result back, and keep return 0?
>
>> +
>> linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT,
>> phydev->supported);
>>
>

Since my goal is just to add .get_features for aqr113c phy, I should not
touch the existing logic of aqr115c_get_features which will impact
AQR111=EF=BC=8CAQR111=EF=BC=8CAQR114C PHYs. I should revert this patch.

pw-bot: cr


Regards,
Hongmei Xu
