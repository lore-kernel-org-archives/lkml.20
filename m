Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B9849D5A3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997606; cv=none; b=ZDS8A7z+myTkGGxT5xlWlQmPG/GR3eJxo9EHTmmuSrokozfP52b24znY71wsudZITWG81XwRUJErCVY38whndIJvE6tDTv9pJdWIGiTTz+WYWimVJLiT0TpJvGvywptjC9GGvqN2UCipm8ZEii67BJ22VJTUviY/KIkpMpAO5fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997606; c=relaxed/simple;
	bh=Fw2WS59fAjQfg5J3rnz+u6bzFfRp61VAs/SzMqJv8mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XorDoN+Up3eWW62oNVxz9DWxf4biPXDYqOZuf0Z162jdPPhkuQoswGUSzzvkKBMcnYslIe6nqcrh6ABmeRXNWfq4LcK1hm0l81XGJ5AQkm0c9ei1Ks3H4Gc//Eh8RQXNmhwco16RYbaylOs3m91nmNZFQMUrbomYgk31+ja4iDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSdZN3Pc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhZ6KSno; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSdZN3Pc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhZ6KSno"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdoMC1217731
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5J9RRSss6wNB2+tlXaGjp8FkDbVH1cRZmO7BFQ90LN4=; b=KSdZN3PccABMLK4t
	RwryNlwQZGngt8dcW0Fc+qp+uZMH6jlX/FGN1enkNqBa7mKCoLBTC81e1WNs9s7t
	WybPPD4jzIHm8uguy08LS46dDjl76DMfCI/ZOadAWW0XRsjST4KkOV1hnDLwEHxf
	GL8bOqzR2rXdaHhtxBpEyXzzTsGKo4cu3nxaNyfA7ZKhXIvpQvdOS0/26Js8GWIS
	mfNBcfdi4OSN6LoG7edt8/ABmGW8RSFsXqsx3eT+Vng9WYg6BImfMBd1cdfgBNE8
	ygSPVoBN3RP9wsMYgM/51bFY6AhKW6DFbKO3yunYvDZC+ODzemiwMOp0L1Xoipwh
	u4XCJw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0119g8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:33:21 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-980d0c9fc21so38617241.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789997600; x=1790602400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5J9RRSss6wNB2+tlXaGjp8FkDbVH1cRZmO7BFQ90LN4=;
        b=XhZ6KSnoTTMGDeha8n27pdN5KCLq53mhJRFV16Vr0UFVo9yLATrECIEhU3xPU1FmWC
         n7Yl40JcCtFPjW2DlbR5zb8TMHDO/SoYm5Ou+QbL0a9Dr0b2EGf/RfhkLcHvNHrn7j4V
         Tv5GK/I616M13CZL8H2ymIjJCW4S9s3bXP4s+5neFm83vGm0PzEQoi55W7t2wlwszI2C
         WQm41kaXD0A6Hj6Lbuf1ZTHlO4Uqe8rw8XqYruyl6yjLZh7MssqT5ZkgZmB7wfh5z+Is
         Q2m02aiGiqFLvlw9Q05aegmJ83efcibVG8onmAv7v4U6Q2PLITYqs8rFNM3ZnX2Q9KkU
         GcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997600; x=1790602400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5J9RRSss6wNB2+tlXaGjp8FkDbVH1cRZmO7BFQ90LN4=;
        b=EIC4BXArcDdsfaXQRoAHPEKFKz9VTQFXAiSL47xjSlfMQDHitDPINkP9IL/zwKlSa7
         6hTfoxkDw8JUes9YxFrhxUW/nMXbs+3w1sXtnLFYRhUyEXrs5mVI7ubJm8TZDKJN4RNH
         1H32mlcEfU7hRzE/7RdpOSXym/DX1FfO1asnfE/swEIwRHEaShhD5Gmrwk4crj6VSu5W
         RtGxEKsPB8nOeQ9HntBgpE1JpIUAaGIYt48FsffR2a0vWj7Joz8RUzaWiJ/vXuOyR+wp
         uKtti5ey8OyONI1TbKBPzmeE94IYwbJiYytM7Ms9frwb+/YvuQ4A1LffVqEqo/BRB/xO
         OB7g==
X-Forwarded-Encrypted: i=1; AKwUvBxX5n0wceq9Zv5yi7SSBYy3U3eSsSS3KyEKibi4A75NZUowdUyvvAluAHkRkIMYayCAYuqjjQpGE9cDmvE=@vger.kernel.org
X-Gm-Message-State: AFuF++myxsK44oE2oosvMr3WBVgjOFaoYSJ6CXIAx05/NECQDbxLNz9I
	OwKgxdTIA+rzq4tRHZNrK/+vgmqN58Vi+v917Gck68xFn9anVNW1ZuwCBNl8UkJyaCBxMupZ7la
	s5vUGH3JiH3gIpzCkwrnSU8AZVWj24WYWdU32eCOx/EA8dhRWETFCQFVSxSx5gbUpUxs=
X-Gm-Gg: AYBFou01xmAutRaWFXCVvngbA1umRYVLIKU+x6qboISSzyOz81VuLpjyMk6MtmN2G0w
	2JVKcybog2qkrut6t8gGw/vgMn2o0zi1dVxPbTnkTKLlK3zoZ9bc8ccpcxwfP2JqjxiVh+cvdaT
	vNO6TnzqnCtuXaNviWgrmv1ojKtljCTifIjSAm8QVHbEtoTH0AaZRoTzeieWZ5ijwLfiLjgN4UU
	eLy+Uk89n4c7kGcvjYd+fqmO0ltMX/ytbZQBWVHyMa1ioF3NFb4hMLf0pOB0gWtX8bnO6Q6IloT
	QbqwP/wrMehD0a/JRo4/iq1nn/Cx5C/NFlVB9lIoL/FW3pmITkH/0lw+55XBZyOrWxznr1Ucloc
	tL+p5TOaQnN2ZpjRgog0ziw==
X-Received: by 2002:a05:6102:5808:b0:7a4:f9b5:ed2f with SMTP id ada2fe7eead31-7a556e125a1mr4474440137.0.1789997600314;
        Mon, 21 Sep 2026 06:33:20 -0700 (PDT)
X-Received: by 2002:a05:6102:5808:b0:7a4:f9b5:ed2f with SMTP id ada2fe7eead31-7a556e125a1mr4474370137.0.1789997599813;
        Mon, 21 Sep 2026 06:33:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358dab38sm316743466b.57.2026.09.21.06.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:33:19 -0700 (PDT)
Message-ID: <90d203ad-525c-44dc-83d6-1548b42c131d@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:33:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: qcom-pm8008: Add PM8010 support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RHFVHmhOMqGFh8OQiIe07DHuiOb1G8AJ
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab13221 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=of9sHuRbKvSQs4eXnhsA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE5NiBTYWx0ZWRfXxcLPhobYJRns
 GFI+i+Nzl8/hgmanUDumd3FZ04UkQYK/lgsb5hANF89Zf/+ZhEHrhdJ7JUM5WJ9GNHmLlhLiaEp
 z+e8Q+mwrl75cj2/C4O7Eg9HpiYZY9DDVO3UGGntJyYnTqR7aakDWCxRdy7KXwZ4uebmavKHRG1
 Ji2zykJ2BOhQcm/AipSGsAVHm/PKvOCeL5ZlBINMEVh+JUiGc8JGZ97AcW+Feu5qikOjcqzXMwy
 agg6tKtRNllasXU0EbUw7w13ezItamQU/F25PG/QF87LGLDVKy5vigcANf0xPEsmRj7awJorJSj
 lr2hfmtwgGXcrTedkQUF8JaA4WNgcjZ1zfDYTLYrkJbGJhOuUv4fUFOsg96yEkC6hDbMu/c8g7K
 gygR0tTPZovnWyIFGo3/rJUGGX2JuqkO0BHhn+Fc1f3xU93XZrI0CtUudWX//cXjUU9MZrAed6g
 VTbrg3USDu7sPGpHckw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE5NiBTYWx0ZWRfX7PiAYnVyxSaD
 czyERcY2a2/nT3yiu8XOwXOK53J1hXSjiDE4NMwRp+2sjGoEoIt7b/jqTRkTVbbB8F9HHxKYgSy
 uZWcKE3XcRu4TMgHtr149fMFhVjiwbk=
X-Proofpoint-ORIG-GUID: RHFVHmhOMqGFh8OQiIe07DHuiOb1G8AJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210196

On 9/18/26 6:42 PM, Jishnu Prakash wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> PM8010 is effectively the next generation of PM8008. The device is
> generally designed to serve the exact same function - power camera
> sensors and the associated supporting hardware.
> 
> PM8010 supports both I2C and SPMI communications. The latter case is
> already handled, since it reuses the same peripherals as other PMICs.
> The I2C front-end is more less the same to the one of PM8008.
> 
> Plumb in the necessary changes to support it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  drivers/mfd/qcom-pm8008.c | 67 ++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 63 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 60204cc9a2dc..ed656f0d6df2 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -34,6 +34,7 @@ enum {
>  	PM8008_GPIO1,
>  	PM8008_GPIO2,
>  	PM8008_NUM_PERIPHS,
> +	PM8010_NUM_PERIPHS = 2,
>  };

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 8408d045e754..84c2d50545af 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -35,7 +35,9 @@
 enum {
        PM8008_MISC,
        PM8008_TEMP_ALARM,
-       PM8008_GPIO1,
+       /* The GPIOs on PM8010 are fixed-function */
+       PM8010_NUM_PERIPHS,
+       PM8008_GPIO1 = PM8010_NUM_PERIPHS,
        PM8008_GPIO2,
        PM8008_NUM_PERIPHS,


or drop the GPIO support altogether, if we conclude that they are
fixed-function on PM8008 too (I couldn't find clear info)

Konrad
