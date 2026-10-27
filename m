Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090171;
	b=BSpUW4cDJooHLHQLqlFdzU6JpgtdjTR6T6QMxZaK9sNG3dewUNG/Ng1h+H0fnC66lapd
	 5LSI8iD7rO0M1gkgO9Wu47I5nCceGZNmt6xhs+UXZdGZZ26qzF1V2QJjFMmQ/fQogMrGl
	 SkNWVXsrfCZCBgWzlqkT3lFfxRsXiCQ3jMVGKV7il5WxNNb8Pys9qB6HwTZUzUx904BnL
	 XuQqlmHkDtqDoiqIQ8LVdOF83wzmItgadWocVS1W9H5hJxWRtL7dKhwD26ZIt3mqID2o0
	 /NPCexShQrnYfJvo/ddajktt6maaON3aQixMu+jc0ftzXBTkuRoJoJGqpKL5QIO65aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090171;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ieIMc3BBz4pKSCnrMN5uWZ94uJp0IU9fkKJ/HuBkEow=;
	b=ZcHnlTvX3EvFYIfE55f9kCI8wTZe6xAAy8YKwR7zWAzZGkU8TnPVreqjKxKEzIK3m//q
	 GdJTvcsdt/buYknJDxlZyoTvG5+wh/ZQxvQalmW6wruro/yNy/1BOvIp88eg3GTcDzO2b
	 K2xhCV3fWnXZ6QWG6iEF4VBZKxONqfkJg2oHESpXsFc4Z0JDtkbuC5tVU5WSerSS2RBSh
	 mbp+5g7UMSZdowShq/TK+TdAyMorHqnSxe7lVT/KKtd93DWPj69dnUM14GytETBvQiSfk
	 J1EmCdgNrXnpT74fUdGG4iDG+1wcnklRHIlJZCIo94nUICQUJ9wbZR4ohaePXtYHyIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=na4O9oqi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8BiWFyf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A504606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A504606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=na4O9oqi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8BiWFyf
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZJ1Y3950115
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieIMc3BBz4pKSCnrMN5uWZ94uJp0IU9fkKJ/HuBkEow=; b=na4O9oqil6AM0aDY
	/Mw+uqnKwn7ym6DYKoWHGzHWmgNB0ru5yBvL8GWbIt66i7Ve5wRyduSp88itIdyB
	g21P9BoPyLTtfrb3WGj0ZS3+huBWS45IUdZPse45WcZPDQRLVHYhCHb8xYbz1abc
	PcipgCFpKzAqvYlobdVgYUULUNAWF+0bGjRmlQ28kwTek37WnOTqLUok6XmqZ9Y4
	f6pD2mp5C1RV5gWJ+8aiP7qIl3/xZs8C2lFKvJrbd914mvs6kKUm+xv/3v5wY/oV
	1StqwHGC/vMn6TiSnKfJdbdslJmTcvEQa+Di9XlYk90bLz8wcS9+/VRi5hitVrmi
	bPu1BQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54jvjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:36:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so117399685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090169; x=1793694969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieIMc3BBz4pKSCnrMN5uWZ94uJp0IU9fkKJ/HuBkEow=;
        b=S8BiWFyfisgWML7PD0jZd12NUky/jM2TYvfQNISYdzs4Y80VL3N8YH8s5lNW8nbRLo
         VK1A9BaW2LWaelD4kEyahK86wnTDDGdJeEjujYBVDJngdiObZZ5lciVB+RGtOD/h+gLF
         T3h1vmRxr/rBxNF/cn9dTwiVtlLgXfkEbd+Beb08qz4R8DGDvfMP+50Ht8Bo0waCNifC
         HHHiHd8jDkienXCIdQGsCKgYBkSvdAwaaFysnTOw8LiAD+oRksUHum2W9kIOxqnh/tVT
         NHREDU7uAkVQUtNFs806R5EpGS/0vWu+gN3Id1RqzbT2hcOmdPddFc6Whv5Tdmb6jkgg
         73Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090169; x=1793694969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieIMc3BBz4pKSCnrMN5uWZ94uJp0IU9fkKJ/HuBkEow=;
        b=DkG0Yw0mYnpoUQzTVcgYQrA5j/Fg/2jpmFVk6eyG8gQRMo+2/AHqQ240j9l34sSWJ3
         5I34CmqZd9tQ17VJkCayi2BJo6+9CrzzANq0hyCzY9KeHnBMFAWRhGlRaXqnOor/ALP1
         AOg6k2us1EN/NuedogypXMa9U0MJ7qvvN8EnHYxXiYujSDlxvFLpYePUEUk2U9skgpyf
         v68BK1WTwqWVbEkQjMmyqt65xF+phBixdefPFJZYuOaPq0aTLDLXSwbTAu7pRfwuYC4i
         QxcuaVil5Y0IXy5PTMg/7FjWCDzxAjozsSBudTOtN68sNZRai9m/4uQSCC+AvWrBA4Jc
         36zg==
X-Forwarded-Encrypted: i=1; AKwUvBxS4wutmBvImXRywLX3H3ggcbjcx5+aob6tkDCdzMFHucWnEgJqcysJHQtDyJuoId4n9Yh+ugNOjjr1/MI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW6jhonTS2SFpJcgg37ohOF9VkF0Bh4M9n5ZXJPaCd5sHMeeuj
	1oLd2KCm403dDi0TS5wHf6sUsskZtCgObi4iXx1QKh29DJVKf1I8M8zyKP+qsbtioii+Aa6+dFj
	iKo60fXUKTpThRNUWaRJH7fH7ovL4iesCJbmncWnC/iJiOOReREyxrgRrNL1He/TAeOk=
X-Gm-Gg: AYBFou2i6h7BtdBQhCjs8+x+I7i6sLOQFupgCaOIq09ag9yhjLDLEeJXxaFcWdzcery
	CV0buL3dT8/SNU3VxuQwGlcLJVBOfAtnGzbxotlMt1yLwWLGydNCNtbDn8OttwrpcRQ8BCmIbHA
	HpPyuBxJ3hFTd5tw/LX0cWSA1buH+boUlPxOU7s6p/MiqwK4NDaVGpBBj7pvvyJ7c1VTaYXFtzZ
	KD6HklkZ2hQBNocVoKQJu34D9RpaC8TioqGRBq7YEVLSy4Nv4iEMjFoT/jCYDo55uQjhWwjieJn
	hwsqFFsD1zM0cP+/NB5EKhB/91/t7cfFr6D6J4oLsRtY6Onqz7r0FAIMjPXqO8nIrR9L3lgrded
	1LzXE+RBUaxDks+23y0QGig==
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr1454627485a.1.1793090169382;
        Tue, 27 Oct 2026 01:36:09 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr1454623985a.1.1793090168889;
        Tue, 27 Oct 2026 01:36:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9995sm406415266b.15.2026.10.27.01.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:36:08 -0700 (PDT)
Message-ID: <732de9ce-7e8e-4506-86af-239bf84dd309@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:36:05 +0100
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
Subject: Re: [PATCH] soc: qcom: ubwc: Add SM7250 configuration
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfXz+J7P7DVYMCZ
 5IaK6Aj43Xw0SFCRe4TnRiJokcQl8l3GK3dwkmRMjxlwpeAfviG1PrVpughbtTcZE1yc8h5s+VR
 iT++jD4NQMu4CU45ZdNBeeO9/rwggdA=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae0627a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GK7zBLNOynR7OwqPiSgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: awKYxzBmKv_dSpqjVlvFUSCpyEqhYaAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX/19DT4W6nkZJ
 x4y0Oso9lhZqZ8dDwsBv6fhXxgiO0C08zHCXbBrfgNB7fFkEHLeEg+zxPkrhM5iKwfrS6tvjxiG
 MagxFA4acMOO53KwoVO2Y4E4e8lkjpSZAFoRbatrkb5Sg4zgqM5wliWjKpz/R+frfFTVFb2y6DH
 zIgqIQJ28RSciLigJKpbvUrB59d5KZGWxrCCDMptqo5YtoY+g790/lPTWD6hwwc/XWLNgC54Z9X
 M2dRfOpZN58CeYy6dc2kEltheI5nx047EgI/fOkIlOyIoj7YHas4F0WlP8jr34lVjav2r2VzTqg
 b5PjTxyfLdvEMnYih4lghYnkeWRAWvhLKgoycdYNOHb4zFAGmK65gBUSDrfRzuzGGIiBs2LPy5/
 Smqgy5IlKiVtWs2t90IgFjzEDWxC1xb5tzyPIrOFCQqxR5P38p6SOPgiiaAf7rHYhZI+v5nskO0
 0YGEX7oXBGGcHQOMfLA==
X-Proofpoint-GUID: awKYxzBmKv_dSpqjVlvFUSCpyEqhYaAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270034

On 10/27/26 7:19 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add the UBWC configuration of the Qualcomm SM7250 SoC (Snapdragon
> 765/765G/768G): UBWC encoder version 3.0 with highest bank bit 14.
> 
> The downstream GPU devicetree of the platform sets qcom,ubwc-mode to 3
> (UBWC 3.0) and a highest bank bit of 14, the downstream GPU driver does
> not enable the 8-channel macrotile mode of UBWC 3.1, and the downstream
> display devicetree also gives UBWC 3.0. No existing entry has UBWC 3.0
> with this bank bit, so add one.
> 
> Without an entry, the Adreno and DPU drivers fail to probe on SM7250,
> because qcom_ubwc_config_get_data() returns an error.

This paragraph could be omitted

> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
