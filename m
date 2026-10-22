Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664438;
	b=R3qGIqSlCDCpCjo6ZPM3tSB2LEH4MqCP/tfcg7/GnbPmAJ+N5H+phfQk3LCgy4YJI/Xu
	 IxaSCqm1nrYa6scv+p6+vcYAupc4AK6Y39qMu17sZnO1ZK1mtm84Bi1yY9FtOXIqPl36n
	 hDY5U+V7ccltYftqLPERJJAMkFwdyHbC006ukErciLqmU/4BHwb03Qkikkkymf4SH5vov
	 5mvPnzqoMBYGJ76BMH9rKZPGt6eHTPmFvvgwuDUHhmRmhvI5B0hpyfTEVDEOSa40oAI+t
	 7trTR34wTIJ4HSLUcou5XU0AyJrrdtMRPCFJjJrQOej+k1M/ATyjRbCW093AOSA/BEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664438;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CNFluKpc3PiFtbzuhbtuk0N/oHupR2ogDzznwiIe2cw=;
	b=TYuOOFgm05C8u5WiQpjhZnH/9seGUUSrrn0Q1NTOJBxSaipUHQwk/rDUNhfLDLSpyC6j
	 9gnLrN68dJVf0yF9QvmeBPnA7JKRMjHpx0F7EwYkAS4AUHiWMbbFZQcWw67kxc/osWrua
	 gL4kPtzNAmIZMYWmZRz3WUnm3FQ6sfq5ivo2zk/MV95KeBlzoCN0OPpVhzUp59/x/G9gS
	 gHAERd0+ZBBfsKXU22d9OtR4j21Olusp5gOWsUBMHal189HTVX32+kvAJeyNEcXcomNIt
	 ePdVz+GcAXq/xr/DOo0ADRCmRTMv13Df5O6ynddAO5Dt/SDs/evbZ683YaqO6ntxmQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nkAys81o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EesX9ODn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0EC606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC0EC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nkAys81o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EesX9ODn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xx9S1962207
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CNFluKpc3PiFtbzuhbtuk0N/oHupR2ogDzznwiIe2cw=; b=nkAys81o1wXYj6RC
	inL06ScI6mTc1xzSrV6YsKj3o2zTC5XgDk7iH2U44qmE3m2x0OAUKb6FpbD6c+vN
	UGNZde1EFEo4qbLOoPUQlkXrwlOOm9p4rijXuSEdvwPa0ymFma1gKDOxhFzFnXJC
	dSxCE7gE9jOoAXy6UEjFe2BBKVuZRR/FKp7hWdIJ7Onf2cn1s74MmOs283yuMRFc
	2U5EvMdrOcM3KJipkXb5wD+Tw6ZKb+P49JupCtaKs0AcHY2IMJ5GEWITfI0D86TC
	OaxOS0hdmyGrLyCL+7IsySd/g8s2+wGRKW6fmeTxjYouw+awRT41BvX4nX9CdU1l
	71UD5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aj0b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:20:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso1161327a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792664436; x=1793269236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNFluKpc3PiFtbzuhbtuk0N/oHupR2ogDzznwiIe2cw=;
        b=EesX9ODnKI0dNemzZXyDX44Uiw6sZpilS7Td2J/7h4gX4HqRMMPH4qPZjR8ltOdGFg
         6DZeoNJzUYqkBaGGjIJ0zpIs9LjaKat2na59Hdl+pB1F46IboKAhV+f0NGwXQUVehWoD
         h0HnSZ5pDmYmoQfwuGMTrco681MmIvtrnyLJ3hUSwDYbQA9aPJzEvWH67HPQYWviZqui
         sxLpNKWxw66ge0D/Eq1NqEntJksR4rLxJ1p8xrxJ/T+X6+PTr7o14BkaFoniAnezXsrn
         KW8cyV1l7C2aAAM6/cG3a8ZqD6fOZxrchK7TCTT8oeyNVAUH3GjqqS+xNlc1/V2D0Nbe
         miEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664436; x=1793269236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNFluKpc3PiFtbzuhbtuk0N/oHupR2ogDzznwiIe2cw=;
        b=K7QGMDChvXgLF1tU9Mz7exFCdAGksif3fooDA2hpUN+UY0q27J8TamwGN2SAWeCu+9
         7kvuxtRED9UCoCaHzgAnbHCWOJjIVrB9RsNp5nShhrF87T9mLyGgktGmvgudmk8SaUoQ
         59BCAWonaNU+0/rEOyXNOONGGva9gdW4kntRPF2TKl4WYGsH8XPgcv4eR7xRQ+vXKB1w
         WDYzDRiGAua7Nt5iRDKJTILQUSfP95F1q5vDeloaG6a1m+4HosAF1gCelS9PbYm1yNh9
         dUSO6y4FygUGJDpesu7VSUjiEWDJdh619hPENp5qoJDtWsqIP0WW2sZz+MzMbm9rlp38
         412A==
X-Forwarded-Encrypted: i=1; AKwUvBw1RQP5xReV2XO2CqcwhXB5afEhpHAsHkPBWKFGi4xQES+jCNNKx+vZavwPdjPb0cE+7vPJqzzvxumQcEc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJcCYD3IOuxNjomSAqyND8azIhdanMQGprl/28Axblbkswt8K7
	//nhB1eUjcmnZJfz0lQoL8Soja7BJsjfgLnSLnDyRG2lNO92ntgTWja9heelpzA8QTT8MOvMupV
	7gwGUahyH2XjdxLOsYNe+rSiVFy5klhDDiTuE1kiZOEBrAT0hzQwCMXaMV+Wp8W5Yre0=
X-Gm-Gg: AYBFou1kVAX4d0itrTGqxM+vQE9u49mrTDqVGTpy52GsmahADbra2to9VV/VLrro0tX
	fovQxC9eD/GO+FzUCdKjvO+0Ih5Te+t26iZF0ROCoWLv2sceJPvWsxDJv/9AyNqtwc9LGDIUPwt
	YV8MSNKRm5EQIQFNW5EmjYI6AQSmW70+yShfFXGki8n5kJqB2O7SA34Ri0aPdSQaUTiG3RkdL7q
	MIWnL0tk2k83+oFxsELGSh4IRry+fQ2wsp1KXJCIdz0Aohx15n6GRhttVSFf2p6ZvFKQyQEnxIC
	BEIbe6zABEvAp61VAUUpgfeMjNg00EWJZUVwi1Tg4FMuHfqyqM2BAA6e/oEfX20En7aJvTOOOOG
	9xpC0ANyd/emHiF798nfpcefL
X-Received: by 2002:a17:90b:288a:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3ada6c8df85mr1039595a91.23.1792664436185;
        Thu, 22 Oct 2026 03:20:36 -0700 (PDT)
X-Received: by 2002:a17:90b:288a:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3ada6c8df85mr1039576a91.23.1792664435599;
        Thu, 22 Oct 2026 03:20:35 -0700 (PDT)
Received: from [10.233.17.96] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3844903a91.6.2026.10.22.03.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:20:35 -0700 (PDT)
Message-ID: <808fbc06-f1e7-4deb-9209-4056ab2e1a55@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 18:20:31 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/2] net: phy: aquantia: add get_features()
 for AQR113C
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-net-phy-aqr113c-fix-pma-capability-v3-2-0bbb1b84035d@oss.qualcomm.com>
 <179243437352.3135.719818276407053323@kernel.org>
Content-Language: en-US
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
In-Reply-To: <179243437352.3135.719818276407053323@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX0Ib3QmllPYdi
 S91ogVZpy4t8YxigyWUCGluvgk0TOdrB+qsOJXvDa1idNLoBhKNkduKb5EheUfrjqlwgocvLnvD
 s/zU5IVb4Arucwnxc6D7pmn9AdAA+ej3diu3YxzjQuKSA5ghxG/4W2IjhPKfRf3+mWS9pT0A0Nv
 wx3Ng2K95T7ca1s71JZQllf/cZESGrmTeKsMxA2XM9J/Dzf7+85HFJujam+MN9WQ+ZitEwA0U6G
 m5d3amQ0dWoZi5yC3/DftuiG6UrhGlv4hfPHoXNwqe9oBGBUFKm2C6QKwMDDz5PFTQXyRE2A+PM
 uCWJdvD2Edk3FgEwWdTccoJQxOUZqEQR01Agl56F5UG/QIKXagv00pjTzKO31OiHfraP9uO3nrZ
 e0kQueTM4OP20flmyx96rHwOGB/jeopbnKdCpadD1vw3ARZ4z0BiWMEaRawn5ZkpI8iMM6gaJ/+
 EUC4lAuwoqHHDBVGw1Q==
X-Proofpoint-GUID: dgsGnHE2PiynFyrwgUORSuJxfSsJUjOg
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9e374 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Ghr841LcyMZEtTkRx-IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: dgsGnHE2PiynFyrwgUORSuJxfSsJUjOg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfXx8C081quja7F
 5bbcCXFG+EshQVluVGsuKIjYHrTHZLYYlTd/wSFI5kIcUbSkiPv4yv89RhBUcq9XTGZSEsvTDiY
 PD9CjDXmAX8mW6teB4iRh+/3wNbYfl8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220041

The commit message is inaccurate in v3 — genphy_c45_pma_read_abilities()
is still called via the chain. The v4 commit message corrects this.
Fixes: tag added.

On 10/20/2026 2:26 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The commit message says the patch adds get_features() to
>    "explicitly declare 10G/5G/2.5G/1G support instead of relying on PMA…
> - [Low] The patch is written as a fix for a hardware-reporting defect
>    ("AQR113c does not correctly report its supported PMA capabilities"),…
> 
> --
> 
> net: phy: aquantia: add get_features() for AQR113C
> 
> This adds an aqr113c_get_features() callback to the AQR113C entry in
> aqr_driver[]. The callback builds on aqr111_get_features() and also sets
> 10000baseT_Full in phydev->supported. The commit message says the PHY
> does not correctly report its PMA capabilities.
> 
>> diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
>> index ed5631f2956ee..8213d9a15b4fe 100644
>> --- a/drivers/net/phy/aquantia/aquantia_main.c
>> +++ b/drivers/net/phy/aquantia/aquantia_main.c
>> @@ -1096,6 +1096,23 @@ static int aqr111_get_features(struct phy_device *phydev)
>>   	return 0;
>>   }
>>   
>> +static int aqr113c_get_features(struct phy_device *phydev)
>> +{
>> +	/* Generic C45 PMA abilities do not fully describe the PHY's copper
>> +	 * autonegotiation modes, so add the 10G mode explicitly.
>> +	 */
>> +	int ret;
>> +
>> +	ret = aqr111_get_features(phydev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT,
>> +			 phydev->supported);
>> +
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Does the commit message match what this code does? It says:
> 
>    Add get_features() to explicitly declare 10G/5G/2.5G/1G support
>    instead of relying on PMA register reads.
> 
> The call chain still starts with the generic PMA reads:
> 
> aqr113c_get_features()
>    aqr111_get_features()
>      aqr115c_get_features()
>        genphy_c45_pma_read_abilities()
> 
> So phydev->supported is still built from the PMA registers. On top of
> that, the chain only adds 2500baseT_Full in aqr115c_get_features(),
> 5000baseT_Full in aqr111_get_features() and 10000baseT_Full here.
> 
> Nothing in this chain sets 1000baseT_Full explicitly. It still comes only
> from the PMA extended abilities register:
> 
> drivers/net/phy/phy-c45.c:genphy_c45_pma_read_ext_abilities() {
>      ...
> 	linkmode_mod_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
> 			 phydev->supported,
> 			 val & MDIO_PMA_EXTABLE_1000BT);
>      ...
> }
> 
> The comment in the function gives a third version ("add the 10G mode
> explicitly"). It does not mention that 5G and 2.5G are also forced
> through the callees.
> 
> Could the commit message and the comment say which abilities the AQR113C
> PMA registers (MDIO_PMA_EXTABLE / MDIO_PMA_NG_EXTABLE) actually
> misreport? For example, if the PHY already reports 10GBASE-T in
> MDIO_PMA_EXTABLE, the extra linkmode_set_bit() here does nothing.
> 
> [ ... ]
> 
>> @@ -1446,6 +1463,7 @@ static struct phy_driver aqr_driver[] = {
>>   	.get_sset_count = aqr107_get_sset_count,
>>   	.get_strings    = aqr107_get_strings,
>>   	.get_stats      = aqr107_get_stats,
>> +	.get_features   = aqr113c_get_features,
> 
> [Severity: Low]
> The commit message describes this as a fix for a hardware reporting
> problem. Should it have a Fixes: tag?
> 
> This commit added the AQR113C entry in aqr_driver[] without a
> get_features callback:
> 
>    commit 12cf1b89a668 ("net: phy: Add support for AQR113C EPHY")
> 
> Because of that, phy_probe() has always used
> genphy_c45_pma_read_abilities() for this PHY:
> 
> drivers/net/phy/phy_device.c:phy_probe() {
>      ...
> 	else if (phydrv->get_features)
> 		err = phydrv->get_features(phydev);
> 	else if (phydev->is_c45)
> 		err = genphy_c45_pma_read_abilities(phydev);
>      ...
> }
> 
> Earlier fixes for the same quirk on related Aquantia PHYs had Fixes:
> tags. Two examples are 17cbfcdd85f6 ("net: phy: aquantia: AQR115c fix up
> PMA capabilities") and 8f61d73306c6 ("net: phy: aquantia: remove usage
> of phy_set_max_speed").
> 
> Would something like this be appropriate?
> 
>    Fixes: 12cf1b89a668 ("net: phy: Add support for AQR113C EPHY")
> 
> Without the tag, stable kernels that support AQR113C may not pick up this
> change.
> 
> [ ... ]
> 

