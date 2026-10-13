Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A22D4E325C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902535; cv=none; b=Oy1gRUBJvwDHGgvPKNLS2hKy+ILNwATz3NJV/cFi3MdfheCNflt/d9EPj/sLrAIEmaedOyN82/jrGPIKIdRa0MqdFvHdihccglmtxNEX1giS7WGDubUaETaStAna0mIHVFDi6i8JmNonF2FgAQO8NK02kQxkJohrRAg6NHq8p44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902535; c=relaxed/simple;
	bh=YBYSS2cd/vhZqe7h/46qa/l9XVlkWJDuAu6ViM8rvnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJ8sMw5yPiCpxXyDMgR7RRs5S5OFEI2AVepjuyxGqK8xGUyvqYL5kOUhPq50y6VCvY0qmcoM9h7pafIJj+jFn4Q0WcBbBiMsa7CHpwot2pqMwFIP6r+wMEJ56ozHkN337fzPhBFDMPtRu4y2ahMc3nRZNqYZxZHJ69NMpkTNdBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGqyOr6D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfY00kqM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGqyOr6D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfY00kqM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3tdS1460071
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3BNPrEtNqmXapnqW1Au8jUfClwKMM3TcPaX6dJBusUA=; b=GGqyOr6DX0K53ryu
	8eVDL9ontaGI5R8PeyTscxhgfLw3JQI0lwc13nTNjAfJ6hLe3xofLy9GMThSlD22
	KXUd8Hva0WYkRKNKreobmVR6ae/MdSc0BorMBRpSYxR5s+UmdBMQEwQR23zPWmXK
	bbmnRTct1/zmEYcgHf7jLOyKX41yX2NI9lTl9X/eqi/wpnNVUJJGWEGssW2EArzI
	WNDi5ivnUnxn8vyxcOWqcY1nMpqLJgzt8THJHxji9jaaK3AWW4EcsUSZ4jFwsFb1
	H6S9tlVqWuAGNwTTB+7wK9w481uE1DQgRB23a+c2w+VPAPIxOUK3zTA99ttN7zY0
	J+58ng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjsdsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:42:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cac495d99so19837085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902532; x=1792507332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BNPrEtNqmXapnqW1Au8jUfClwKMM3TcPaX6dJBusUA=;
        b=hfY00kqM6Qoi3yk87X0rJqqZOvJLLjCX3Th8CGxOAMT3P3ba6iF6GwmmTY+jSRfUPD
         nhF8TC6gpfh5q1YJ6i/vJmo8X9o9IlbilD6JowiZFYqq0IR2XWXcJFGruQP/KM30ysGt
         4Gz/9IordmC0dkU1vozZZTt+6fkffefUB+6MFIaUrHnNVva2PQkefTtQJ9Um+rzaRtoN
         6gmDbPwAOwYO5hwutFPPbMvCK6x4C2TRN39/Mxgi8yI1FK8i66RrJdSyLPKqZSyR6yy/
         CV/Libum+NP6sJxj7pycD+0qJsLOBIgB+LbZjLQC+/rjkNyBRGLv0DNnvfrAl6YK/+jl
         eKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902532; x=1792507332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BNPrEtNqmXapnqW1Au8jUfClwKMM3TcPaX6dJBusUA=;
        b=MHirEDhFK7NDZ8XV5Wi4CLK7+9+12EixMJzIuuJPYhYn0iLYUcoTUBe+/4uo4LytxL
         YmX3n9jSADbIh++6v5Jrde1uXu8hD1KPIWz2iVD3vYxbF2us2RG1O9VMzxkxuoeN/jnC
         bC85z1x3kMV/vCl4AayON6M496IgQULRtPBXAVmX+/40aSTXHklJuoXYAg45PlSiG5wu
         7x7GHoh6uSFg/JJbTgSlfjG7mcIAs6gzlt0T+19/K1y8f9cBkBM4fTZ4ZzD7XSP0FRw+
         hjEkT/70Py9tS2wreUcKle2hTizG2Medrnw7haijXX4fRZILXqAB7JlCDW5TFI6o9rNw
         n42A==
X-Forwarded-Encrypted: i=1; AKwUvBxlT1cjoCVdEIzUM5vp5K5MtHLoJD3REsV9y9u1z6KBkgiP+VOaK1nSIQ4J7FfkzrDj0rwV43I8sZQ3vUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6oNVBgzU5y03piOxWWDp5Ck/ksYVdoxsgIUcrUCLFCz7Uz2jT
	fHDCWHrkSY3qTKBEPhCd5ize8vlLOhaIt7Qzh1fmjmboA39mrYmnSHMpJMlKpfz2uXkJKkkB1lh
	kVEyVjDn6Rym3eNpMs78SyQOVvGRES+H3yIAggu9GH0JEDnCldOc1/K0VeB7KVgqvUgM=
X-Gm-Gg: AYBFou2p5MW4zv0YE+WiozylBq/G+d1ikIjxzb/Xp8vL0kFgWygZ/edyjsyIaKCd5Mq
	DLy7ewkXSMm/jYRgxx3IiUo0psUTGziAR3ZIlFxT7DUUc4i9GQ77eYBCrYhM8ukMsjYuO1+g/Wo
	MDEy2X7zhLTqJt0XPb3ndlBj+qHh/NiitxGJR+JhqP6swRM0X8Z5CsJJnOQzV9IgYPUg95RW54t
	fCvFH5V+56rgHyNpKfyn2GxrMQL0Yq8Uj4fiU+Om7cibIJJTxdQ89e/ucP/2i4ASXjatuE2GmSD
	fLFxR7CrSV7SxA8vt7/HcSTeCwL/DTPkTQlohUmGH4SCLAGFsZxsfvOmg3mpgBx9Kfqqkh7BMQ9
	iNuMWDoWTR65B9ucybP3ZqA==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2402375685a.4.1791902532472;
        Tue, 13 Oct 2026 07:42:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2402371685a.4.1791902532015;
        Tue, 13 Oct 2026 07:42:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74c48sm600297766b.43.2026.10.13.07.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:42:10 -0700 (PDT)
Message-ID: <3201a0e8-1d48-4db9-af64-50f61827cc54@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:42:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-4-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-4-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX59jnWAuQNp2o
 LWHbpHPDHso1Tsn3sGOSmJUaLPvywfn1cWIghYD8qstsy/dJKucWQ0IbrM46qjWRFrVa7NxppCy
 MpN5ILjy8yT4T2eYTOp6+9Gli0gaXf8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX9FXvqLEqLhMe
 ZWN7TkGtCdY97nJN+wc0RRbm14YNNRHWVnNtx6P6Krr3uT6nLwkcwCt4DRNuujWY+AFNu5XlJXh
 EcuMKh4osVVliXH5JpzU1lKJ07Xu5V8+GMS2Fp5mbDsx5io8vO0JeHfzAIs2bD+gaxmLiH8Z7YK
 d6ANGXPnppx48m8klFHpfopt/m+TQbV3WkQ6gS9qfip0yQAK4gO4BloQoYVJfBPpHHVuBPPf6t8
 JCgLPzBS33w7NSHWFIsR66SffO5Zh1u4BNyQCrnNHsSOO/sa/qC40XGvzY5/TzjlBm4q84BOfBz
 AX/z1rfYg+XNYDC5a7MqjVMlWy7fvJW8w6RSc0Ve2tzXgiVwMkJFIeZn6XBcyp8MX9RiO65dGwq
 VMRTxPAFcmD9M0emB5AcBt8ocJbWpMjAtekJmnwDcGKEAcPXqg16rmI8SY55k5ATZge4HGZ4n7j
 QthMsiObOXBIDcvJI1Q==
X-Proofpoint-ORIG-GUID: 6nTXluovbJVo2lQQcz73nTNdL1k5vILr
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace4345 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Zxf1fr6QNQWzRTqytMkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6nTXluovbJVo2lQQcz73nTNdL1k5vILr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
> based RDPs.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> index 67f62c1acddb..7f90a2632b07 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>  #include "ipq5210.dtsi"
>  
>  / {
> @@ -17,6 +18,19 @@ chosen {
>  		stdout-path = "serial0";
>  	};
>  
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&gpio_keys_default>;
> +		pinctrl-names = "default";
> +
> +		button-wps {
> +			label = "wps";

"WPS", capital letters please

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
