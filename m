Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656444;
	b=gr/27qupGyYwo0hD4Qu+E86i5nVar1HJ4NDRaHhAqqvtMjN7OsnBl79G+a87fL2RlYDc
	 K8WB/sc8fKdZ9OnHzxKMLVUS6BALPx5nIf3oG6agvd3A9XbAKvK6B8rlVYkGilCspmVAY
	 lg0H/Cu0pxvvpgcYk1pUD/d+EsHjR7J5fRFG08hzS1vOgUdWCo6GUYsTPPID/2/4rdI4Z
	 9KY69ZlZyfl/PXvznfVzijrJZWnTPQzl4X7v2S2mJsE9dbHNwsNEVtirssy1wtBEcHCyg
	 F4u1AvYEbu8aSFWlxcBZYajZRMWZ5tBaiMw2bykbv5Etud0k/pfik69QxL9/0BpST6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=;
	b=G0xym1edgjeARNeqyTSD/+X9C9LwqbAh7rcZ4m2RiAVypACVcC9F53Mig94p8IRcpcS8
	 KSw/kbiwS05Uzsdp/YwNZgPpXTlptgPjxC1JkdUJCF93RucGZWSB4lBSTwaQ1KMqoMwxO
	 8EIF3EG3UszQGpekqwm0Z/S6f22jTJUSC9DZBkWIGtMThYaFpC7MdyOA5X1Fnz+LZ0paH
	 x7Y4IYnmriLdEBq0rafQcJN0zgroh9JmG1Y1eKQWLgzZQzZXbm0tsQwY6vO0pH7DGgijk
	 Z3xme532zdCcYV0ddrMW3p+Tukx4RaXEEkSOeolCvF0SOGxp4XBRJlRKXKNWvIRB6mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC+Id0HG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jJKWMTOV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F6D606A333
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F6D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC+Id0HG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jJKWMTOV
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7tsh33148340
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=; b=JC+Id0HGcxwKpJD1
	ibh6qFVHKM9dmBjD65sOixx5xw554XLDnLtPjxnCKc+ShzclOWADpNIJG49iLWBY
	quC+72LO3omfkHpfHAHLHKv8pqZ758X3SJRAk0ccIM5AiS7ILJ9ptmSc88ztAzwt
	FtprcO4sGLGSdD1Ru5WtvqMzq7iks1uRitRccIpXHC9rtA+3XlwSZT3ETuY1kpVM
	LI/t/zOI+TXbmkQx3FhLQcNszGJ7NiYkcwmUYRvVVKo1noX1/cU/Soo29zTuDoSy
	vnD0+CBRANW4lTn5j7rdimZMClXa4ef3AazXwbhlLeXj7qw+DnHATqeSIlnGKFhR
	wcWDmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asar7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:07:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so32266585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656442; x=1793261242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=;
        b=jJKWMTOVV3nF8upLCwyMBKBIDjk//0MvGPDAY1PVugNgL/kYMtTo7ynrvF3slv1kRt
         z+MvaiALYzVzIjTQ8N5Ci1FlLgAvxwk5mj7qByKTQHvYjSu74C70a4oUcn+1d9KB+5+K
         aDaLuCakiqKd8cT99gGji/aGSQbtfHkDRJpRjzK9BbZjyBWTKEnE9zZMsgsLMH3jzMHa
         sf2HOzm8/2DQPVyYusYiwoEKEmJNHQ8egrqtzdAmvWjejsWQN3TQ2jZhMesXmvl9FbZ6
         XLWVEvgJNTpvNlLw3OR48LAhigSj/tMs+OL6fPRDLurhdOgQU6vz5yjGKoig82/8Q/mg
         iwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656442; x=1793261242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=;
        b=ERgz5efkbftVy/d1AI73uMhHuomEwFz0ZnxPxVhLOPSTs3rQogO0ls900J7vB69WVz
         wWgACI8a3Rs82nZTxYgVkAJgu1U5F/U+0kWZkpQ9snqnCfJcnnq3GAp6Ozb+F3eXaFyu
         Q331QsyDxtT50DftZLmKfz5VaUyxkJFQj/eLFeAxr8mmDhE6HZs6e6FL7Z8Dqugj/IuQ
         wZEPHsaQ2f4NzX60UMuFk5D1M1SiLkQjsVAzHiBujtI9mqbijcZ5YA+h3T9P9x75ikTd
         F/IMMuoHkXQ2Ep7MxtxXA3t6jS1amk20+Bc+yCFx1t4o62HO7QLBsHdsQWKgAMWW1usP
         YaBA==
X-Forwarded-Encrypted: i=1; AKwUvBy60bGn03kNp/q8aDw9yoOuNYfjn7soh0FRbf1Guas3oxT8pw+sy2u5fwyLooUo8zytw81OPTLfXIT95HQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6+S9z25yRJT7IVzQBMgt9kV4+qYlLvAMuGhhuvLtDuX5NInKg
	wJD2ObetGIRBI3WCxCr54yASsv8NwpsJ9aSzF57mAWlQFJcsq7a+b0ELb0hnKn/m9WRcSG9fjYw
	+tJo6UamNchyClr5mEu93y4bXc3LJS906iMDi1nJ1MuZq3DhnWGC/QnDJQylZnEqErvE=
X-Gm-Gg: AYBFou1zCw9xYZQB1xXzBRb52YjdnrJF6ynZouYUdWVCfMtS+6j2Dh1zTufuAvM9itO
	MFIrKjF60m8Zohp9HbE28Vyd4phNXhZ5Xun9SmEbmWZ6Vr4+18ml9aRwrSPercTcRadSDmYNGFh
	9KyzfTHVhdgFtwWgx1RsmhH7dCr/g76tmsw8I2RRWJiwE2Ta/Mz+FpBvRmyKll2Zdt5pUZvkLnJ
	K36WPCg89b4lP1/7PHhMzUNyPnCjws5O+c6favV6XugbwE3x9fr1g2x6bdRlNmG+lY8CCDcF+o6
	O3XGb17HiYRQNCJC1cl0Xj/2Te501km2Y/45r2Lgp1R89VD5rbX7O4V6anECQSndq9tQUi4r90S
	Whm6Vr0Ev8KWzCKeVh+j48w==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1008989885a.1.1792656442351;
        Thu, 22 Oct 2026 01:07:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1008985485a.1.1792656441987;
        Thu, 22 Oct 2026 01:07:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daedbsm1627775a12.13.2026.10.22.01.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:07:21 -0700 (PDT)
Message-ID: <52029ffa-1bd5-4243-9550-85cb00bde8c8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:07:17 +0200
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
Subject: Re: [PATCH 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
 LVDS panel overlay
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-6-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-6-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX4slz6oVF+oEy
 cRRWMgmQCmMhonL/xu/J5aYaz4LNKVSgsA6IvTWCjk3Mih+nkHeDaYjRZ+r9zf2qYaqKLUK04lp
 9spfEGaznwHowCmAjrjxJhUbrFfTiafjFNxDmQPMQbvhMRBXkQdeImqMPBX4oE/nyB0Lj4Q+jO0
 nGSYqIEN74JFM66ZFvczvUIBlkf+AtA+2YEQOh66sfHeIs6uLXaIazNYRsDUYuwGGDKapNzU39F
 4WREHRt+q26OdBVPjKMFWUZA6BJ16/SiJZMyr6Y2ICUXvM+cY/Lso7RjgOxx4JwBp941QKxyRye
 +sbBnNGi+soSZaUrWGwYKsoRkBml7eZDcDJ5bCb/vMl36D0pgNhMJTuD6xLQDRkQ2dunarazjsV
 Fl5ypt0Ifn0wTcuyO9SU+SQUlSC0ECcwidg/xiotVVwSDbWUuKo3BnVgqIDA2A6F6HlQ9ppFvOm
 3aNrhv9bAuq7coPVSeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXz6JxsvU4vt9Y
 45OM141tnC7kxU4zNAdChZ7buyfT7M6eY03t254IJgmRbwIO9/FD08UIXSbt4KteHUVLG//6usK
 HwU6t0ZTKT4H3wg+Wm9KPfv9B7WIpa4=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9c43a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jboVpbf-MrRR0o0IvX0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: EBlAiv7fSQ13XXp3Rba6tgip9B7Mj26q
X-Proofpoint-ORIG-GUID: EBlAiv7fSQ13XXp3Rba6tgip9B7Mj26q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220032

On 10/21/26 5:17 PM, Anand Tiwari wrote:
> Add a DT overlay for Talos Lyra EVK, to enable LVDS interface when
> LVDS daughter card is connected to DSI0_B2B on carrier card.
> 
> There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
> connected through I2C5 with reset and interrupt connected to
> GPIO61 and GPIO60. Backlight is driven by a generic clock-based PWM
> using GCC_GP3 on TLMM GPIO59, with an additional backlight enable
> GPIO on TLMM GPIO2.
> 
> Disable the default HDMI bridge and connector in favour of the LVDS
> panel.
> 
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
