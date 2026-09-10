Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE803C0A13
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026157; cv=none; b=aTq7RPvOUfwftqWiBhaz1NuxQvBx11uTrfjxeOBDDaVM5S4tXZZgiGm5laZpXLZrBQ9Q41FJy122ELAzD01s9XV7DuLrKfgTmsqKBiVp1TIpPGUTMoinbRyiMwNEVDKIJrjyiX+b2RkKM+6fsQVysdOjPW9khC5kvLo0v4qjBCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026157; c=relaxed/simple;
	bh=vjldFUlWJ3Bv467WKqjWPrWJr/pIs/4SUNGMbgof+iE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYJdKXBcn3DwIK83RkVQivNUTjm/lKIQNA7C2IvBRIAXub28hJfoAQiHjU57WgwFddRKITCYAc5uvf9e2UVW4boyIXvSr49iNG9fhPe5KnLpXq4PJ2QM8mtEuJZAWEpK9jLz+o0NgN+/M+5S1ZFqZa2QJtxRfmD6sjZ63Wk+NuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/Wrz/In; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EgpY3e0s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/Wrz/In";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EgpY3e0s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A71Bo6754338
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HD3KIZI/JGXXpi3r04AqikoOKtna+WhS+DJyoZDd85I=; b=Z/Wrz/InqhesG7hS
	sa34X9S+yBKauVlfeHvla8IFGF9qjU0McP+8Ndraa8Ofnz6oUBJWL7l6SZp/piht
	9h1DeGK8asV2PFTmA4dw7OSLPZc5pSUEa0oXHoEkzcmtfbJ6FfimW+9adkIQixE6
	Rvb+RwWfTZs4MGi4Mx5+xl46rj/xKKoJGR0UI/IIq745I8Sgf5txYZZFljnLMTqb
	/L4/Q8aiQhYtlYA6ZOHocxgHlE8noTNcGLGzbnDW1wmFX01zmlCwx6Kcy7z+0r5M
	csYfHoCJzgB+dCSR2d4gy3mS0aS+59hsKnNw5untPZutxxTp5NoHF7UbKT3w27M0
	3b+T6w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvr558-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:42:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530ac448bfdso2913721cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789026150; x=1789630950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HD3KIZI/JGXXpi3r04AqikoOKtna+WhS+DJyoZDd85I=;
        b=EgpY3e0sixdtjP6MMBmCb4qb3kAt0lSK6SIekiMe1fEc3Qngv9e2e04+94j6+E0b7J
         XsUJYTkOUaVl0z0iMLys4RmQui1r/pTrK9TpFKoF3qu3wVszF/UVoxOUwYHGGT3y52B9
         oLAE61CwfesWdIlWqimzA4a5CL+Trd1I++/PeLzBt2a3O2DhonufT7joEz3Iai0uqsDI
         e1rb7CFeRuaQz/Fti2gunSs5jkVll1HbZl7vxh1tRcnlkWUIHTnYwrMdGbUqb8d0X/YD
         b7p6YWH/RJjhZVqbesh1nB2+AN+YaEzdGIGnolnu1dyiJcOADeLDIaZjvZMeqQBbkHfU
         Ua9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026150; x=1789630950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HD3KIZI/JGXXpi3r04AqikoOKtna+WhS+DJyoZDd85I=;
        b=HKKW6lyKrMGouDtG47ia0eGhB0qCawjtD1g6cOPQz0h5ARo7t2DwSbmKSXESz1RHj/
         IC9bWKjig1Es2JXmF2ILr0lsMMJsg3IwJ9Z+9Ha92AE19XXiJF/uATAmfyCyQAlZrXbI
         WK7ZxfY1GD8RXvJT0Mki/fEGi8QqvHmRXNYcmT4k1vQk667+m2WTpEWN2j/sv404NDpc
         tEO4IgzFheLZ0G5b9cKx7okZ0ibZdqqalIWiP5ZFodeAyM6SzQg1ZCnzn3fpHDQgf5/I
         vyDfDAFIQg5TY+ByIU9OoDaqRKNFA1BgFivSYfJzSc/buBMiwR+bmp/oqAeKcFMnCf/k
         PzgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8yb+Gx1LzFeFlDEO+GB4/yeLKFPJeVtJkzZM1Voss0zISzCrk3ll62WlKfrqj2Tym8JO13QQHMWhBKEw=@vger.kernel.org
X-Gm-Message-State: AFuF++kDm+As26ly1APMp1/EM7r+UZee90TRSrYm598mi1U2BmQrxWsC
	ARVTiJAPft5nxrgiihWJQltGCOPkteE107hW+J/Erh03yx7FPdTxUFbavtgHs9jVFwAd/+CQhpq
	xEZAuytdz3jDQF+oKFS9aYMNMGmt0s5ygvvbGAj9KHckrkI5M8XAStYU8lKXj73G/ZYM=
X-Gm-Gg: AYBFou2gy81ZK/37rWNEGAfd6bUCOfdftSPipye+SV7sfBliRDB1iV6MfWkyztWU0/J
	bSpRo4tyGw+4DADdZmEY2cDe+25S+Bxn4PjkAkYJUpIbEjoD6mqgudrL+0iqwYKTjsDWQV94i/o
	9tCQwBZVX/jih+1+A3u11VvB42FrdX6nWscHSdEaUmcBfoYPSN5zHO0FvR93cNZJgMx6LfOeBR1
	Nc+LFdQl8U66q+3E8X5Mu094c3i5uUicnqhDYI891PDtmDvYdO2lWXmGskXj6/vcv9+Z61+HVrJ
	OCvZKpd1DS/kNyKmnGmJ3VLdWb+FzZhZogEyWHtTxEz9rIuWV1bUsw9SEENFVn4BrsyvTyHt1Sf
	htCri4kbQr9OBOcecoq2RAw==
X-Received: by 2002:a05:6214:3d8b:b0:907:bdb6:6534 with SMTP id 6a1803df08f44-910477624ffmr125141896d6.3.1789026150360;
        Thu, 10 Sep 2026 00:42:30 -0700 (PDT)
X-Received: by 2002:a05:6214:3d8b:b0:907:bdb6:6534 with SMTP id 6a1803df08f44-910477624ffmr125141576d6.3.1789026149993;
        Thu, 10 Sep 2026 00:42:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm793516066b.25.2026.09.10.00.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:42:29 -0700 (PDT)
Message-ID: <c23c26bf-d0e3-4bd3-9dbf-3096b0050f87@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 09:42:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] power: supply: bq27xxx: autodetect bq27411 and
 bq27541
To: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        "Andrew F . Davis" <afd@ti.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
 <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
 <20260909234744.1177153-3-rinat.muhamedgaliev@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909234744.1177153-3-rinat.muhamedgaliev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa25f66 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bY1bNIcL0Yak-Vr8utcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4NCBTYWx0ZWRfX6wlQCOB2/ldb
 j+iEMF0b8mTIR1jzySAx25LpTd+vdQswt/Zmx7s9btBGEqrY/bVCMYFhl+NGtbU+/6bnmOnsLKU
 p4OcIofxig9nQrNekBT2G/hHCXn1Exl38CQYqVbhlBXx7jb8XaDKTBfQGT7V+retxDd7Ce+bjZz
 GUW3Zls2rUOlX57LxXK0BTgJyHn1SA3nuea4O4evSkxMJ1lkcgAoD/aZoQj5jmax8+3YwTJthSm
 bhGchmQyThI62j6gKaQ7Eafvtt9AVPZcX4jd/EgYpmb0cFg76qqWqbTRVM+hMycrqeRmsQOsmFP
 3RHay1T8lpN0EIajt+Dxc8C83TcBVipxMEQbsmg+csjAtSxE7Sx1zLzoD4/ySnFEz315ciwXoR4
 cP2wSlJLr9sE1Wy8p9HVykLqdrqu1TmwMkHTkWAE4/cGcGo3I4EOsIfQMRCn/slewoakzi+JO7m
 22BqGb1QlwQ0zXST1nQ==
X-Proofpoint-ORIG-GUID: lle3RpDbQvX9ZT2p6lEEqKRkl9_62cL-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4NCBTYWx0ZWRfXxCBsKZAPtcpu
 BZr9yCTjDTtZ4BnmDoha4evRYOllXmEZgk1mJ9Qrbrs0CVXB+ienzdJPyg7jdsnllai4ejoMkD7
 c24rnr2rP+oVeuE1OUa1w44q5V0H44c=
X-Proofpoint-GUID: lle3RpDbQvX9ZT2p6lEEqKRkl9_62cL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100084

On 9/10/26 1:47 AM, Rinat Muhamedgaliev wrote:
> Some replaceable battery packs used by OnePlus 6 and OnePlus 6T
> phones contain a bq27411, while others contain a bq27541. These
> devices require different register maps.
> 
> Add support for the generic ti,bq27xxx compatible. At probe time,
> issue the DeviceType control command and select the bq27411 or bq27541
> register map from the returned value.
> 
> Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
> ---

[...]

First off, please don't send new revisions as a reply to the
previous one, this creates very messy thread structures and confuses
tooling. You may use the b4 tool for easy management:

https://b4.docs.kernel.org/en/latest/


>  static const struct i2c_device_id bq27xxx_i2c_id_table[] = {
> +	{ "bq27xxx", 0 },
>  	{ "bq27200", BQ27000 },
>  	{ "bq27210", BQ27010 },
>  	{ "bq27500", BQ2750X },
> @@ -262,6 +300,7 @@ MODULE_DEVICE_TABLE(i2c, bq27xxx_i2c_id_table);
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id bq27xxx_battery_i2c_of_match_table[] = {
> +	{ .compatible = "ti,bq27xxx" },

I don't think we need a new compatible here, especially given wildcard
compatibles are very much not going to be accepted by the dt folks.

I think it's fine to add a chip_id readback mechanism that would be in
place regardless of the compatible and would say something to the lines
of: "detected another chip, proceeding based on chip_id"

Konrad
