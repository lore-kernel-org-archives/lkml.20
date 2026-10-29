Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793260642;
	b=Wt9hJusGQRzcv8kRTr4QUuRJgThy+KO67WENl20BaqG+xjmckT7ONvc0W6DMJbcL5Jqg
	 IWSCX3FBv7j+shZtvVL6n9+YEfGciuvnns8h9HZYQ7Det0VW3tH6JrFNeNydRQnfmkSey
	 drX3Vfl4lTkmP17j9zXpyW50VlIO6ex0QZ+bJJQf9HehJPjMWHcHgDXj74QlyNpTvZTO/
	 +gNoIVYKKndfg0zUdr4xrlneEd6n48qWWuZ3lDvotpBdSZV+df9O2+qEgnTvzgHZ+xRMW
	 395o4uPur0vTmGEkSn/XjMa13A8v6UwtR/WBnV3J3tvSXO3XQ5wdsTHJBzZG/vDNdRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260642;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cpFRuvO3Jl3fnt7ALuGlhaNMOCFCoZdWddX+Hx97veY=;
	b=PBjnAYjOsjSlB6KbGsSl6V5HrBVj1Am3Z5uSskq2GIHMPJcIGnycxQzCUH/BuSxek/mL
	 eEsG8aJ4vRtLXteUbFkyFoVPEWmIfCZ+L/Yz0Hu9JaxfEiPD66FeHt/Skul7OT00rgS0I
	 89lc4cGu78tq+kU4Z0xRT/J++dF58jPb4jpiuTGAvUeZYAwpK18w4X5zy53bevwO8fILy
	 iQ5MC4yH4vjFeWoHFkPdtSJnByvlohqdY4AsA21fxwPaY0k3Pn0kBAOg5ZYtlLZEM7sls
	 +53An8DF+fvy+/9GRIHR+Fz3scAxEmAPh6usAyXQFLBSiuYutAzih+cj+Vj20WNubkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRARc0+V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QO1Gc5C4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128CC606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 128CC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRARc0+V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QO1Gc5C4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gvuu2974012
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cpFRuvO3Jl3fnt7ALuGlhaNMOCFCoZdWddX+Hx97veY=; b=dRARc0+VYytnB4va
	uloFN0RLp5TqFRmx7RQf+krB7Q1ndNxjca1Co5IpR2ZzcCls1ugihU5awLiYpcOp
	JZNE1byJtnzYOd740RJzWkgh8L089Fuciv6puwW2TTt7vHgdPhRo/bXqnw8WfKq+
	9MKV6gNB/z+Ldk92g1T0Bls9z6+rrskfU57eQFOjZX9FHIAF86YJTIJ0n6CImqSU
	V9C0w1CwJOIOHwhUZWs1Csqr9rHmjptyT3PQ40cTBHX59TtM7n4wFLJjw7tgSvHj
	/b/f55q/9msHA1IISMAjUUDWXu3T+5BKP3pMTbt1fQ4RzeN2M/JVvmPnTQV85HR8
	3AHNtA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpat5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:57:21 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679f81e0f96so2738321d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793260640; cv=none;
        d=google.com; s=arc-20260327;
        b=YPAynY4NDXuig53x2BSO3+vljtLG8MuTwkqLIqtoT8KK9XXDvtSa04j7YLS26p0bL8
         UqrB4POUuABh3Q2mK/sXvgOOSpPVaI9QTELHpwIsx8LAyUbWhI2LljlNAG9+wMV9y34k
         xGjhkeR3giK+vJc8xqGcoTKhKsJQgaIOOUs2haAS+hMQ/++ZGDbN1bgEAYb3EtwiL2Ut
         5vLgUyEVP3br8VgYsAhtROY6OHAaI5OY9BPR2JJTkPP2c/wej7vHjn1m7aSipM00UUia
         xQn/33s0Qf+NNtNmqrLcENXoPpXDEB6HeknHV0GkB32WoWxwPMIE3PIaq+YuoMXG3akf
         LZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpFRuvO3Jl3fnt7ALuGlhaNMOCFCoZdWddX+Hx97veY=;
        fh=wxPxi4/bos4D8ycw88HSX/ZsygzaD/Dq0uxXz2cSFGM=;
        b=G56v77UHD+Cm00vtckxHLbFQq5kQ6jubtpm3sfJtp1c3KBfWh4e2HpRj+d7BdLY1wh
         qcyZYEwB8Q7Kdz9LC3pDLd0N4l8AbjdTFOdoPibazCc+z5fC4eEaFXtVyjz0BcG88L2w
         CcCDpbslcEkiMPviq2f6a/JUIRLIQQfw4rnKjtzHfoZeXxqF7lX9DLrGh5DJS1C14YzQ
         CqFCvymPwXFvLCAU3D92dMV+l+D5MBzKPnx6gfzfcA/p96zZvZNLmZPr232zQcrmhIIn
         vZWaFwndjzSK1nrMlR0K5S4GTFawtKfcsBCUDTRDGQp204Cgh2DAzBOakyemJLuota8q
         bHcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793260640; x=1793865440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpFRuvO3Jl3fnt7ALuGlhaNMOCFCoZdWddX+Hx97veY=;
        b=QO1Gc5C4hmEJZ8zhu1LZGuUGxOjp4hHEgmEllQLZTJJHuF5OfN15BME7b8dOqAqoXK
         3JQMP1oPpyXDiNtnXxnGRJOFMcRkM8245O05a/HlSnDu8/6yHq4DVpNVeLDLM5MyZie4
         f46jiLhRRJdp4xfaIB0x78qd4BKjbV5tLtZ5IoamwmgWXj8kXCzBLi5q1r6BwIb7PAsp
         OiEybSahoE2TSMV+IIMKhJAkHLf9MV3fhHBEkhldj1IQ2F9b7I5qxSEaoE+vHmbfRt0R
         E/iZJD5makjBeYig892F8FnK3FtWpvFvq0ZCndYK7inR155DwG9e+Cl1kaLfU61cfzRV
         4/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260640; x=1793865440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpFRuvO3Jl3fnt7ALuGlhaNMOCFCoZdWddX+Hx97veY=;
        b=nCpcJp01p53Qkaii/Kcbi+GmlpoAvI5vpL2Wx92cs22wR0mOfbRdMO1BBugFKQar3l
         zaSxjgOkLnyY44k7Zf/0yMT+rGVuzOy/5p3JqfOEs7uV4ESgp6vLWImbaSPYzQ9dMYoH
         2GzG0dcmLIawkQn0WjQTjv9+FlDebGQvb9ehTV1et8C9NUsW3qWggdy8vM6GsHqPgg/Z
         TjRHGH5Yxc0gFaUa9Fabicpnb0qc7pnfvkgoL2FEtiwYjWfiNwok46oa2xsq5Iu+lSCv
         6pTvgx/8XPK2eOLHmfS5dMv23xkvyYaV5/rKqLFKpT7f0kC1xvcP9i2Kbwit5zV571SW
         nUHg==
X-Forwarded-Encrypted: i=1; AKwUvBxsmSKTvTQdajzm3wVOafn5iZhj7O8oFzIDucX5yl85PWeqAtWq2v64qNkZFQvmKjcGBUiXdbXYPyOhp4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHsJz07pIQoGTGi3XIu/SvJF6hjzoVuALe3WLbHPCxZ4dY4F/p
	FrDpSzI3MVgj784zU42zAkiNA1CZRpzqPlt4s0asCmVkX92q2mdWOecX2x/rs9RwBFFCCiKQkgI
	anvWGzT2mJhj1/Vq8Tu63XK5oehcEM9X84CBGB2pGuWgWG8aW1ejjOkG14UQIb1VroFxf9exRsk
	GDYFSAVnLc48m3y4QVNykarSXJbY+bCnAAf1ae7WYU6Q==
X-Gm-Gg: AYBFou0+zag8cORDT6EmYfVw73Oh4J3F4zhZzfNNoi41iZ8xdnaLJTlEvLFwj+G8sP3
	FAFK8yOLOtZreXJFVBneavuSFLKA/u4uUPxc13JlO5srMjKNe9mLhhaPhq7f4ksbWzHsaS+hv38
	1/9Fo1onX9OYVe5YW/I/avXDG/Zio1ov5ltmqpAuyDQgqkhEjh1sazAqEgFg==
X-Received: by 2002:a53:a711:0:b0:679:9e90:a97f with SMTP id 956f58d0204a3-67a7bd1013emr2271456d50.74.1793260640411;
        Thu, 29 Oct 2026 00:57:20 -0700 (PDT)
X-Received: by 2002:a53:a711:0:b0:679:9e90:a97f with SMTP id
 956f58d0204a3-67a7bd1013emr2271443d50.74.1793260639809; Thu, 29 Oct 2026
 00:57:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-net-phy-aqr113c-fix-pma-capability-v4-2-95a17f75dd7a@oss.qualcomm.com>
 <179300813766.3134.9194099464144589935@kernel.org>
In-Reply-To: <179300813766.3134.9194099464144589935@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 15:57:07 +0800
X-Gm-Features: AclHuK9PJZib0DDVcJdOkxwv6Ecfg_cqJ1SfJWlZiTcGGriESuSJyhYIe6usOrg
Message-ID: <CAPTcHHS=t9MPUBjRfwwqFkf4RDKWuXtjfrZk0PPANsRmwA7csA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: phy: aquantia: add get_features()
 for AQR113C
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae2fc61 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=1AIBLGRYXtrC9512w2UA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: mLU4Cjf9UfcD40ixjigY-nxbUWYbeCyK
X-Proofpoint-GUID: mLU4Cjf9UfcD40ixjigY-nxbUWYbeCyK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfX26ank26Hq+gE
 d5/eITRGyTcoAzIsw4UQxQmOoySJhW/3S1WVNS3mCuHoKWD81xBg2t95KNluS2QFLAsM6UF/6rB
 /pcvXjy9p1+M42R3nCLiJhn731C3CZU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfX8CIPVEkfZC+p
 63Gtzpo/rp4+3Nb+5w+F78BzLzN/6fPFrKTenrYzFHl7gLTDUNOdWd80i0xeWpzx4WJaHUT+HQy
 t8EviI5SoXc0bcd6RagUDWmZvoo5nx+YSmlbPI1QpvB422ylIJ9a+uDj2iKb6arS6Ct+/xgpLfh
 ClXDxcUUI1c5XGQUdN42MNvsXxtoDOTx1XLKmXCJd71dGRHZmXLv+ewBGe3UQnDfWVnKqB0BUGC
 +rOa9dqFx7NHvcBwON95l/fcXrNxK0pQmNqOQdMBhknaVyUhemRt2ijT7s/ageOZapbPlHgczws
 pwORV824GTsnjCGfGvzVljeFOCjTIwWM0NX1d644Wp/f0rdt5XkAf8uA+60MiQz8hPm6qrgHaH3
 h9Z06SQi3/tfjJP1oWcUsWjeS8lqCOOr+49d+t5DQ9l9TXWz3n06OeoGXyNJmdgMkwUZxHf/jDt
 dnzZldu6xMNmKQId66g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290030

On 10/26/2026 5:48 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] aqr113c_get_features() adds 10000baseT_Full to
>    phydev->supported only after EEE discovery has already run, so=E2=80=
=A6
> - [Medium] The commit message describes the fix's mechanism incorrectly.
>
> --
>
> net: phy: aquantia: add get_features() for AQR113C
>
> This adds an aqr113c_get_features() callback for the AQR113C. It builds o=
n
> aqr111_get_features() and then sets 10000baseT_Full in the supported mask=
.
> Previously phy_probe() fell back to genphy_c45_pma_read_abilities(), whic=
h
> the commit says produces an incorrect supported mask for this PHY.
>
>> Add aqr113c_get_features() that calls aqr111_get_features() as a base
>> (which reads PMA abilities and forces 1G/5G/2.5G that the PHY misreports=
)
>> and sets 10000baseT_Full explicitly since the PHY also misreports 10G.
>
> [Severity: Medium]
> Is this description of aqr111_get_features() accurate? It calls
> aqr115c_get_features(), which does not read any PMA ability registers:
>
> drivers/net/phy/aquantia/aquantia_main.c:aqr115c_get_features() {
> /* PHY supports speeds up to 2.5G with autoneg. PMA capabilities
> * are not useful.
> */
> linkmode_or(supported, supported, phy_gbit_features);
> linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, supported);
>
> return genphy_c45_read_eee_abilities(phydev);
> }
>
> The only hardware read in this path is for the EEE abilities. MDIO_STAT2,
> MDIO_PMA_EXTABLE and MDIO_PMA_NG_EXTABLE are never read, so this patch
> moves AQR113C from a mask built from the registers to a fully static one.
>
> The message also leaves out a side effect. phy_gbit_features includes
> 1000baseT_Half and the 10/100 half and full duplex modes, so these are no=
w
> always in supported. aqr_config_aneg() will then advertise 1000BASE-T hal=
f
> duplex:
>
> if (linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
>      phydev->advertising))
> reg |=3D MDIO_AN_VEND_PROV_1000BASET_HALF;
>
> The previous genphy_c45_pma_read_ext_abilities() path never set this bit.
> AQR111, AQR114C and AQR115C already behave this way, but could the change
> be mentioned in the message?
>
> The new comment in aqr113c_get_features() says only 10G is misreported in
> the PMA extended abilities. The commit message says 1G, 2.5G, 5G and 10G
> are all misreported. Could the message and the comment be brought in line
> with what the code does?
>
> The inherited "up to 2.5G" comment in aqr115c_get_features() is also stal=
e
> now that a 10G PHY uses it.
>
>> diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/=
aquantia/aquantia_main.c
>> index 099ee919de94..153adfbda53f 100644
>> --- a/drivers/net/phy/aquantia/aquantia_main.c
>> +++ b/drivers/net/phy/aquantia/aquantia_main.c
>> @@ -1096,6 +1096,23 @@ static int aqr111_get_features(struct phy_device =
*phydev)
>>   return 0;
>>   }
>>
>> +static int aqr113c_get_features(struct phy_device *phydev)
>> +{
>> + /* AQR113C does not correctly report 10G in PMA extended abilities.
>> + * Build on aqr111_get_features() for 5G/2.5G and add 10G explicitly.
>> + */
>> + int ret;
>> +
>> + ret =3D aqr111_get_features(phydev);
>> + if (ret)
>> + return ret;
>> +
>> + linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT,
>> + phydev->supported);

The patch [net: phy: aquantia: restore EEE discovery in get_features
callbacks] will be reverted as it changed the existing logic for AQR111=EF=
=BC=8C
AQR111=EF=BC=8CAQR114C PHYs. I should not touch these unrealted PHYs.
And commit message should be more accurate.

> [Severity: Medium]
> 10000baseT_Full is set here only after EEE discovery has already run. Doe=
s
> that mean AQR113C always loses 10GBASE-T EEE?
>
> The call chain is:
>
> aqr113c_get_features()
>    aqr111_get_features()
>      aqr115c_get_features()
>        genphy_c45_read_eee_abilities()
>          genphy_c45_read_eee_cap1()
>
> At that point supported holds only the gbit modes and 2500baseT_Full.
> genphy_c45_read_eee_cap1() maps MDIO_EEE_10GT from register 3.20 into
> supported_eee and then masks it against supported:
>
> mii_eee_cap1_mod_linkmode_t(phydev->supported_eee, val);
> ...
> linkmode_and(phydev->supported_eee, phydev->supported_eee,
>     phydev->supported);
>
> 10000baseT_Full is not in supported yet, so the 10G EEE bit is cleared.
> Nothing reads the EEE abilities again afterwards: phy_probe() only calls
> genphy_c45_read_eee_abilities() in its drv->features branch.
>
> After that, phy_probe() ANDs advertising_eee with supported_eee. Then
> genphy_c45_an_config_eee_aneg() writes the reduced mask to MDIO_AN_EEE_AD=
V,
> which looks like it would clear any default 10GT EEE advertisement in the
> hardware.
>
> genphy_c45_ethtool_set_eee() would also return -EINVAL for a 10G EEE
> request:
>
> if (linkmode_andnot(tmp, adv, phydev->supported_eee)) {
>
> 5G is not affected, because cap2 is not masked against supported.
>
> Before this patch 10G was missing from supported entirely, so this is not
> a loss compared to the old state. However, supported and supported_eee no=
w
> disagree on 10G.
>
> The earlier commit "net: phy: aquantia: restore EEE discovery in
> get_features callbacks" put EEE discovery at the end of
> aqr115c_get_features() so that supported would be final by then. With thi=
s
> nesting, that no longer holds for a cap1 mode.
>
> Would it work to set all the forced modes before calling
> genphy_c45_read_eee_abilities()? For example, the EEE read could move to
> the end of each top-level get_features callback.
>
>> +
>> + return 0;
>> +}
>
> [ ... ]
>

Agreed, will call genphy_c45_read_eee_abilities() at the the end of each
top-level get_features after all supported mask is built per driver.

pw-bot: cr


Regards,
Hongmei Xu
