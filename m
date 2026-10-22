Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656901;
	b=szMJOWNS49iS+GQOwcOHCcP/6e90k+9PPvNrveoZsLWoUd2tUQdBEMBHg/eg3qTrx66d
	 E3d1RxpCpGAFbRtSah/wiDwOknskqLfEZXIvu7zEWOzHAM7VSrzJLQBnawhjYe8g3nOFb
	 EA7cFS0Ne8F94HNhPOs1CXvDhKewJGb5mPj/+LBhEW6aVg2EpgKYwazO0cHD/s5TLmBO7
	 Vf+uCdFrjSRlgXuE2+7QQ/NwYecyHZpcIGNYums3DQx4mvzdNb6OHjHVkPiayvAGbkWA4
	 U98TBCHsEoEGlj8WrFVr1N7iuu+2w/62AjuQyTW6ugxDCktHqHN1EyC+JnH5iNGBPHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=;
	b=34rfYosU90ms9OVCYtyPVwIBauRIyTW1qrgs/RpY2LKp7Ae7Kq4M40q1QHSpQuhab4Y3
	 YyS5WpbX1TDXQurfJTuSyG53iE2msmyjmGH0kbKVYWyZce+aYgFE9TU/1P4Vf4QAJxlfB
	 kcrMtknuPMgLQyWSra1uy1qYw/JqhGVaBKphwySE1gCPwnWn7siVEvH/5ZrJh0xHLS94B
	 kBqUaYJd27WSPpMpRuYjDeyOOtuSJasNjECrLN4D3b6Pgg+LYJ//czIn0UrClhNc1tPmZ
	 uj6kWC2DccFU/BscMLsf9CFJCJegA4vljv38LcNdQXjrZVbWRicu5jcJ4vjJKxhVA1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h0htjNc1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlWHBvr2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B5B606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B5B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h0htjNc1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlWHBvr2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xvA11560112
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=; b=h0htjNc1Gi/TTbwB
	2XaQK37cydh256mj0l2Rc0f+BGpNaxoxQoc3hEBAJiR7L3RhAtuyzKVwwDMbLSnV
	VUuVpIM6jVR+bqd0f0HzxHl74JKQJye2ntDhuLTDGdvPa5P3o1scr8nYIFij6S1S
	FuYvYcp+PvVTbmR4BuLvOquJqncLx2xoD7pv7k2CRu+tatmn2nP/UhSVv5D4fX14
	bzLmCHY2bJ5MA4by3LwBTlXj5fvFUqFaZwiVek1eGkKeaDKlE3ofgWNBgzuIXH2C
	gJ0GBSlNIJa4VNvuzs6L0EZH1OltbNx5X/PnBopbQ32Zd0hdIc9n6i5965OENs41
	fSzl5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahdyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:14:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so36331385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656899; x=1793261699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=;
        b=QlWHBvr2SOtc3LhdVgVZ83IOTkjuV64keRaSqkKYHPGD3rwCb9LE5lU1trMFm0SYcL
         Bapm5usmdK6QthVgWxT2txhW3aFU5dUYFRb7ZGniPZStcV93dLkPCg9u51355cf1hox3
         ej+DaxaKPXkF9xe6pU77GmmvC15gcenx7s+RzHDjKgqBN9omCOfThTs8cYjvVMtco8F3
         QEULofhSZBOwk75mpjj0tZQqhlL+tEd3FfZMh/UFatGpDOGgPexOBm0RoYok6AadsKr6
         t6gFerEujX1bo+iuiUd98bllFeKYMvmMi36CuggqRjT+7tytlufVG+hOxvYjNkjUZvl6
         gfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656899; x=1793261699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=;
        b=rrVcYs5VYRIzIT1RxEuhNMTf51quhAI7+NfOmAdVfgUmOEaxiEnZaKMyb40X1sdXfU
         kZywrNnpM7LnsLyOlg8twzea3BWUp/K1RaGRHADbObqYjUOhE4jUDwRmAVrpOn/Q91rS
         FyT3G2p95CkpRKc/BjT1zlSoZpvVWGOBfiib2iTNV4EKOGT9jGOHDEh98Ur3mreTSoSJ
         otFd1lGxPUsM7MMiksg0P7mV0aYLSI+GEoD5RRJcvDz+OLow9OLxb1TQEdLix+YS1ick
         NB1AXI6++KuUv6rd4yPFERVIl2sjkT+9PsBeBBWh5H6p5xpJvy89e6Fkfojli1Y6Gu4A
         Rm8w==
X-Forwarded-Encrypted: i=1; AKwUvBwRhvNxv9rDscbbe04LHOeDtVJcUBktWEySrsRSAFNfrnr/L1NvARPndWFLFjNJLjHylBzQyiFv5V7CZg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLky9ZolBam7k1i7ra8ospjaq1Sb3qyXVY93iGZPbHd0MShts81
	v+i/0tz4mgohFVxQXtpkaFZFxyv4Pe6josKDCBgfp1uc3wVIZ6te/fOjMtg3CkEJFxtEasB9sj9
	gCkwZc1Mz9gNyqXUMGnzeRMjF+X3VqjyZ8GwT2m/s+Pshk9oPZtoXfIxcHwTZciqhUxQ=
X-Gm-Gg: AYBFou2V2btkhgWw+o9zuFdmKT+RGvAnzmdoVPzPorrPj4bs2Da2AXjIoqZeKib8uZI
	zQdZSUSaKZora2+2rzlxpRCs9vt4Kq4HuCUYPepV5GYcMhoFE4uHrbhFfDFZ6+a8EOjDzcEc1uC
	j17QGEQMXUVV/V4JKiX59FIkkRWEWcwxQ09ImYq165Yve1ObZRoDfnPPQvBH0sgv8WHyofGuwnp
	0epjngO/53Az51HnkoJiAPOOU6toQEoWspyKCm068bhogCyagaHaG2gh2T4w3LubIcP5BbQkuNM
	DSvtogxG2xPyaSI74wOnNZsFUEJxx88HLPqoMWrK3QlU87/qMyocozxoX3/SVPPcrAshp8vvOPJ
	uxSha/jtEx8c94BWrwuH+7w==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr970996685a.1.1792656898905;
        Thu, 22 Oct 2026 01:14:58 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr970994985a.1.1792656898555;
        Thu, 22 Oct 2026 01:14:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c1c3sm80367966b.32.2026.10.22.01.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:14:57 -0700 (PDT)
Message-ID: <9da45e28-ca6a-47e4-8a04-f1b916552f80@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:14:54 +0200
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
Subject: Re: [PATCH 0/7] arm64: dts: qcom: shikra: Add display overlays for
 EVK boards
To: vishnu.saini@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX6Ifa2lp1RZk+
 Ltnypc0KEXreY+dokArzgZCCaC/wcyVOipERP5iTELU9DYsgRGv6SC81ywCdMHcqeQ9lu+pm1Nc
 bb3Z8WlvXD494+EUUkgTuqx/mdr/7ak+OMtzyMMiEis7TXNPQtnyl3Ny5EZeq4+f8Yb2UxEaGlo
 3Rt4u1esmhAkw5fqG2CRvrPQa1PWVGcQhaI0Ct/pRKqhZRqoEhfBzIs+kKcWV5TAQcdO5xc/ihE
 zO2TkCmxh6bBHU0zKeKewvbo2MjCM4qeieAfZCGhJ0ZOgkFf/068Fly7i6fNEMd2AaUXiWsxKEz
 +532O3575J2R7NjunqtttKUwl80bmOLme6sl34WZdjS9nte+6HidBnFOOWvNsrQ4IQHurRgRZr8
 Fpiw9DzMf8cK9+4E/VVD6X0tVXa+gRozYnc1lEPlQuHHDS1R2cQEVA2bsBv1eyZUzcIkxMwv4iU
 lDNTGh3X4LXcQtVyIZQ==
X-Proofpoint-GUID: DwOcASk4_EBVCfCX9RLkaln8Fg9oVTtG
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9c603 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XF8Mg0B5h9f6Zh5FesEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: DwOcASk4_EBVCfCX9RLkaln8Fg9oVTtG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXwkeTLgPEYHsI
 aEeCPzgX9AxHyDHVTojD3I1VjrbZvXLrwY1i94IMlivvKQax6KNDDKVNHXAocayVE1Xe2yQVRk5
 22FNdnnItk1Fqzsq+/r3yksH0yilpRk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> Shikra EVK SoC cards (CQS, CQM, and IQS) are mounted on the Lyra carrier
> card. The DSI0 interface from SoC card is routed to either the 22-pin DSI
> connector on carrier card named as JDISP1 DSI0 or to the B2B connector
> named as PDISP1 DSI0, though a MUX which can be selected by a hardware
> DIP switch. There are multiple daughter cards designed that can be
> connected to this PDISP1 DSI0 B2B connector.
> 
> The below B2B display interfaces are enabled by default in base DTB:
> - IQS: DSI-to-HDMI using the LT9611UXD daughter card
> - CQS/CMS: DLC0697 DSI panel using a DLC daughter card

But if they're daughter cards, they should probably be overlays too?

Konrad
