Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDF1456E19
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885123; cv=none; b=CgRjNgepLkGhe+0+n06dRN/AvcF8BSNCs7s3nM+WD+8RyoGPXHZPJWG+zTxDvRSulE3xiOTCFoEM9U1agRQhinPQfRmwUqd+Uf7m4LAwYc43m4/gnmXC2Ek6P6vXURui7X9nDsnnpfvD+mMuagFHWTv72ZTXR4u2W0kS4aeuiLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885123; c=relaxed/simple;
	bh=e9bn/UCakEL5ibDf9c6Ma0OTAL5s18Ero3lNFuVTzR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ORSCHLLgZIQrAi7LJsTksgBWi7oMzlAcrxVNJT2O8G3VuBDGGaWfa384R6kCAMGSqi4r1Fbk4i2uEOJN1BifsFfsBvEHot52f0OUO+MzVqrSrEwe14zOjej8XJX3NtTh3EgFKl1Befpb4qRg9g2VRq4qiuRdKF70IQkzoW4ge4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwbF2mYC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kh1KS6Jl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwbF2mYC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kh1KS6Jl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8A29T302898
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3eKqBsrCAuMUf8kNfzz642O/Ylvy8LyobPMKIFSJVM=; b=JwbF2mYCRnbL3a3h
	3vCzP/P46bDim+XNYUAE6mBJFhomKpmYKwHfr3csTuKvGALttqysbZ9s9NRNAsu3
	/+GcKROLG8gWpNAzE5xXoOs42PUVG4mDsbZZpiFYRLMp8H1nWtxrWds/hSuwOaWC
	pS2Mxq2AbbQkxcmHWfC/mZz5a832VxCxRbu4eihkuKlGpyRSdq3xhc9toeqdcA/4
	wD85PlCWMk5FOgOKBeNLNd3vy0i0cuI3K00rWyBWCOqoBEZ4fQvOcKFBwtah5uNq
	H4xcWSsyK/jKjTxeemIdSq6nrVK9avgIfuIUWJUQPyTMs8qB4eCqAuKXYc8P65yX
	6fLYWw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqa7rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:52:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso2523383eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885120; x=1792489920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3eKqBsrCAuMUf8kNfzz642O/Ylvy8LyobPMKIFSJVM=;
        b=kh1KS6JlLvRhlmlohBlq9RHKoSifjemp1IXXASqbufCCVW+Nyr5yp193JVWpF9LOnY
         0w+oErAaXNE/WOVawTdCcMXIIvU+/7HAqnltdY6xUOxoe4yAy4XykrZ5MNogQfMMvjRP
         bpZx3V3WJaD6L3ocqkBAqYExm3UX02hNS/O7ru1fDkbesZI5vv0e8Afuk5tb/ax5iZ6B
         hKfCrZnzVG/F4lF0GHQBqhEM1Nclkb+rZWxlAo/mxkeDbl49F4QfCm+njViKmFIritw/
         1QIzEek8M7pdBYLE+ziyuplwZGN+TcXm7Mi+d4+ufJ+Sa2arGbyvKQju3F0/YUGkoIzc
         mpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885120; x=1792489920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3eKqBsrCAuMUf8kNfzz642O/Ylvy8LyobPMKIFSJVM=;
        b=R2huG4MOstOaTOxXhTRjLcjY0E6/3arG5AtsjT//vI8UeShuy4t873FY9m5LEqrN6e
         4HottBhixPOKu4IjOyvjxw4n9Hn5yxLBmiLJGaV/8B/HUfYtWRu0r+AAdQiUdho7oJIS
         Z9/G+lKrHaJJWgSD80bUpMLzD7ykOIDAG1QPsy7cGBWKMCRLp3caaToQ0RY1qN/gvgjb
         KRS6twzYPABLx7qz9IeFdv8B/kGPpmFNwrc10rV4pcgLRv+yT8LIxb3SGmaKIvEe+WVg
         lC4frbRo2+R/InrODG0LE4pQQ1lzHQuSBFsZ3oNZ7GlazhtVPWWZqjC9bgHlDZQx1LoH
         ob9A==
X-Forwarded-Encrypted: i=1; AKwUvBzIgyET/fcrnBGptiMJOd9QUCNkiuNL3N7/R5FBjW1kmVJLYbUjcYS1b0+weyEH3NzZDr0UPZ5b6KExuTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK6dNNIyEY8cs99zxZpMADGBYv4/YW9vNte5wYkBUzWbLtQwZM
	asuJ49UVXh1kGikr1r1LdfAMRiS1avUQuYjz8owoCRWO89bj848fLT3eCBytpi3cWzGrWsScvtn
	gojLy0na6XwEJ0ShL53GHLuRgq0qG5JPVoWasEK0Plg8AQKp36vjH3SpjfvuWnWG6qxI=
X-Gm-Gg: AYBFou0FYdcQtDvHstR43NIVu7Oy2qud0P+7A07G5Gu1gVF5zQOAgCHVyHam2nvlgPp
	3Ea9Bgq/ZJ3HtS00CHV7hCNUqAGYAs7ggwsNn7rf2ghwegEy3/2igaHCvJ3cJr6CYrvnpyaR1pd
	qKW1FBQHfLw4qGIxdCQnZV+caijlh3qs2CYOI+EZCYeu/Dm2MRGTrOZw4D+A5o+b34jn4opN7ZZ
	68yfEeo84ym7u5nxqQqcg1x/L3yrn/hqlFoL6P79sSB/wh8g4v138HAa7WYf1AfsX0VOajx/1F9
	YVW/KgfTsqt5416QhJ9araQFUdu5fLVF10AB1P4GQMMlrmaE1g2M2xPsXv/RZclDuyW/H1FjfgB
	wYFk98avtKxs0WGdUhwWTnVG2L61G0o4=
X-Received: by 2002:a05:7300:8806:b0:34e:9147:b862 with SMTP id 5a478bee46e88-3537e073ab1mr21652521eec.34.1791885119607;
        Tue, 13 Oct 2026 02:51:59 -0700 (PDT)
X-Received: by 2002:a05:7300:8806:b0:34e:9147:b862 with SMTP id 5a478bee46e88-3537e073ab1mr21652481eec.34.1791885118966;
        Tue, 13 Oct 2026 02:51:58 -0700 (PDT)
Received: from [10.216.22.79] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm45959418eec.10.2026.10.13.02.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:51:58 -0700 (PDT)
Message-ID: <87a47f5e-88c1-4b10-84bd-6a1e8d774f0f@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:21:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
 <asidb-ikeFXEXreX@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <asidb-ikeFXEXreX@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX0BlMm8qWw2Fl
 RFFDuG9v1z/i150LqteXY+CTebACevlLz0a9QUPyBBbniybhhVt/P9quK7/Wp1UpkJ/khlgy3EL
 rG9yvlTteYyzGzV7zr8i0tT+g17OeqDWZkiC+Yg5GTDDy3vgEgphdkMnXjS6IalmZz3HgUEjksE
 SCBwuhZ7kgrN6bBRQrB0gV30FTcW7+2qqV5JeHkYsrHQfEA6F7iAP6wA0OxIbhdsvQpdLVKuhoW
 GyB2Ot3s5PcD8JWcCwYixF66fWQfTVOK0XwvovIQnk122r8McTQrUcPU3BZWbZ6L1O17Kts4HF+
 acvcnxNF7CCQTzK/qqE0Jh4jPcFn4nHEazzQKk0odI/dB+0/qKozM3tGc1azH7QPfYIg9CxO6Bm
 T2phmXW6J1Qsiw20bQ/UXTdnJ1XTGyvBG1bcw150gom2Jt8w841MboZJldBNPV3D3GkOZ7oXnGt
 Tw0PSzBZTokWSOHGeeg==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acdff40 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=d-zXsN5tvHwsfdBtXxkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX1v8Sav9NuECy
 HlAWiJEW8k3oJTqwzMFvBVBhaAaBbqOGbKy5Y2nZba8pVpu8T3bC0yRvM96dt1WdF+FiPrrAKy9
 gFR8JDOhVufbYCuM+JvGJve+n3fVXY8=
X-Proofpoint-ORIG-GUID: Q1pOAaRWrz8Pm8QmY9mEDVRAtP_Hcsqj
X-Proofpoint-GUID: Q1pOAaRWrz8Pm8QmY9mEDVRAtP_Hcsqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

On 10/9/2026 1:23 PM, Shawn Guo wrote:
> On Fri, Oct 09, 2026 at 01:05:40PM +0530, Anurag Pateriya wrote:
>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> 
> Are you sure about this? It doesn't seem to match what cover letter
> tells.
> 
> Shawn

Sure. will fix this in next version.

Thanks,
Anurag

> 
>> It provides a solution for control-plane processing, reducing per-subsystem
>> microcontroller reinvention. Add support for SoCCP PAS loader on Nord
>> platform
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index a005546c265d..6fa958044218 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
>>   	.smem_host_id = 197,
>>   };
>>   
>> +static const struct qcom_pas_data nord_soccp_resource = {
>> +	.crash_reason_smem = 656,
>> +	.firmware_name = "soccp.mbn",
>> +	.pas_id = 51,
>> +	.proxy_pd_names = (char*[]){
>> +		"cx",
>> +		"mx",
>> +		NULL
>> +	},
>> +	.ssr_name = "soccp",
>> +	.sysmon_name = "soccp",
>> +	.auto_boot = true,
>> +};
>> +
>>   static const struct qcom_pas_data sm8450_mpss_resource = {
>>   	.crash_reason_smem = 421,
>>   	.firmware_name = "modem.mdt",
>> @@ -1844,6 +1858,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
>>   	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
>>   	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
>>   	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
>> +	{ .compatible = "qcom,nord-soccp-pas", .data = &nord_soccp_resource },
>>   	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
>>   	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
>>   	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
>>
>> -- 
>> 2.43.0
>>

