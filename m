Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808108;
	b=s/g2JZLGIRYxwPNCeXvWw6OZaSCY2p532dk+1wkXrnOxvlK3pDRip+yWZ+XJtNSgbzoj
	 V9cBS49KHrZ/UZgg4U/0pXrYjICewN3jDvkK5kQ9REEdc+xX9dddva1iDD0yaH9eOvaNM
	 QQie4cay6sPXqDyHGzQGqy0hX3gkkekAVRbk2nLfsZCTUDZZgGWgYq/O87J2qMBNmDPFR
	 jCL3owUP15Qz29MFm8Vgu5Ij4MfgteEeZejeDtCE7awu1PfJXJZvGi7dWgVQdWyMJXtHM
	 9d/8ra6TzcbI2blJuJZSoQK8hzPZ2jz1N5MBEl0RG5DQNn4O5XUnM6xJ29ZNe0ldsgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7TVjAetQhr+zqiL1REQZJOBOF8yETe6loWTAjtaYDT0=;
	b=oWonf6R2eT/Igo/P5w0m4JFt4bSOYOD/AQkm5NjgLAMfzfc3j8vnGwV6aEzzKrTEtyA1
	 L6dyF9bBBb0T59dNUzLfxFypQnN1L+y1JWWQSRsMc0/pmZ7Y/SPqgZd0LE1Hw/UivtvXY
	 YAmQiG9l8x9p2ymg92Fyf4O5JbsXuij9AW7aE9vv6r8IC2jzfT5UY5cvSft9Uv4xnJ4Rv
	 /FXp70dkwZDD5NKN9N9XVRMyaCnfeztjkRI/a6UeXXITDRUlxmT5pH3GnouflQfU6XIfI
	 +h/qHA2WrwKevyoFUOpvoPWAdehZIQI82ldOI6L1xTZAPC1ZsamomcJHGyvzjbgH9bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mndZZ8q6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CfZQ3+Ev;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55944606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55944606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mndZZ8q6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CfZQ3+Ev
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj5p63208770
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 16:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TVjAetQhr+zqiL1REQZJOBOF8yETe6loWTAjtaYDT0=; b=mndZZ8q6HS31pdl6
	HNsFtLxpMXNTO5pmJCmr/NXsvnHKigi0f5KzgCkZn32BgqsFSWzgk9OlRyMzKXD+
	yMxEVMMJfqQV3l8LXfApIZcA4kk0NAC0knuKIvFL8ysMLpnKWHWGzITV+VMz3UkS
	mDQxV8LS+O04mkCJHjNVrxUK7KlfwnxikSLpOyPlptRWYyQ+RvEArDz8bbokYvuj
	VF+84mZEpqfDPNb9k3MWwF8WbWXRerzOPNog2Nnw1Gn3tmvpzWHbpMSLU+ncE2hW
	TvhkUhvT+5lqtSrml/7A7WzXwBJfVSEe2WV5B2enuHQTV1JzSp6oB37skhsqrtFg
	kqSbOg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj0cyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:01:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36c9e87d262so1212865eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793808106; x=1794412906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7TVjAetQhr+zqiL1REQZJOBOF8yETe6loWTAjtaYDT0=;
        b=CfZQ3+Ev80cNv3HPJmUTNB3gtlG3Pt/oMko8wN72mYHQ93Yisn3zdksD4vxsk8ixWf
         6TkZEI/qh8saqWHSxv9b24prO/aeoYLMJslkvj5nlTfTntKvLkQPwgaIqJJbH9rQ4NlU
         HBw8Pa/CnRiUmM4pmYs7zg+iut/DCa+wqFJwnEn+BJRnpsWoVRjwBphidsr/yXVL3oot
         Mqr/rmMMtMmozcilMPkjHUqRzWe1bqd6CfJ+bpXWgfvrektT9hP/ra0G8QzC8LzjdH3l
         xZcGKQUcKR1s8NblXrHkEZPA9iNauCdDGaiwKIT3EfS8edfyQj2r0CzXT64kW473lmBg
         n6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808106; x=1794412906;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TVjAetQhr+zqiL1REQZJOBOF8yETe6loWTAjtaYDT0=;
        b=tFMvqYs25cTKSra7r/yXWuXBIA+4MQbuEZisr4IaH4A5CNRiHDKz93f9sBYc4ISdok
         T7N0P/KslWM4AuGV1hkpNbhsCHVPK53r0NhJGARETEJ0UwybyVmgKhzLBRvNEb/Jpzkx
         WiLjBoMc/izqNM5b/LHxBmr/4OXODkoDZkFqLFX3y114ue3x5lxqdSkALnoll11I0+mh
         4wZDVranz9Z2fyhLnwJYYp//KSA20wDCWpCak2+p9U1565gGJDHb2Wu4i0rlBXYxQsou
         zj3IueCAsqHiYj8ZxVsy9CzfL5Tu87mXCFOpHuddV0D/6C1RbbazPzcZGTRvIa1SRNfe
         lEBw==
X-Forwarded-Encrypted: i=1; AKwUvBzbnD2UWxXFfw75fl9OoXj86hNTqonPMIQCsq5Abci1cFZ9YRZwRyy4bTQG5KOTypKzZ52Apf+MgCB9OTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ed0EShKOgmKxuSS2E7DEOCqz1NRvVvpKIewx3gOlcMVK9FX36
	WOWJKIMqUGNx5/6u/mjeKv6GJAEe6gzl3oTnniVfWmXBpLAwwRo293yPUhVG8UKkIhG2M5gHp2+
	CrDqu5w7S9aoMynZnzVItKAUON/mjlNMtpXb3sJ24J/DyrZ0eLvyagQ8XxcP+K8ADLEI=
X-Gm-Gg: AYBFou0SvlhE7cYsfgCx+YmvWmCruTTEVsZ6NAF6jPx0reKiSizUiv4XXsblaO2DosD
	tCwyhseNZ4dBF7yi80xaj37xgdoc/Q9NCkOd3T5T0Srh8QQmQJt3kx8cF4JPlBS3uY7gNRT2mic
	GDe0WsyKShSJf1+DyrJXaZytw1kItJ3nIgqt+Q79tH9+ThlOa8P56NJi6mW8LwhTJZvGcOQnqYv
	mK9Ie0NxT+MH7mhGZwvxGIPcNzTL/xItgN6Cmg9iQjMFy6nWBPB3gWFRgWtHc0mSCIJRte67DNb
	ce8Zq1GUQ+Ykxp4JCGhLX2CNKpsp9csX1Pc+zLXnrLTYXqVkaqNUu5/IB7HfuMsyVvvImEW/8bi
	VeIZ0pj+rugYE2QLmkR9veY1gc60zUF5vjDNdufat6db8OXNYM+/k4WG/ydcnM4Ay3efHB+6dGN
	8=
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr25176942eec.34.1793808105972;
        Wed, 04 Nov 2026 08:01:45 -0800 (PST)
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr25176880eec.34.1793808105143;
        Wed, 04 Nov 2026 08:01:45 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm12698284eec.3.2026.11.04.08.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:01:44 -0800 (PST)
Message-ID: <8ae6dc76-1dca-454b-909a-ac5a09162131@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 21:31:37 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] media: qcom: camss: Add Glymur specific resources
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-2-fcb619fc7319@oss.qualcomm.com>
 <20261104-smart-scorpion-of-bliss-2e8371@quoll>
Content-Language: en-US
In-Reply-To: <20261104-smart-scorpion-of-bliss-2e8371@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfX+nwcFSJhy1ON
 mOGJ/d3sRJMRHRdRadUQ+Hl8N/ESMb1jrXcWGQ9mrlbbveJUTzV68gDBpH/VfLEBOmMG+TeCMfE
 1mGMWfmoouKftPqwxGzCLpBdta791L69y7voaQbPJz1C9yKuwbGep+muxMhYRRj7lus7ThW/dwq
 eeSnp5gflmcTXvE0YJdy84DEh5LiBY1yCxOqsjcn8YVHVieLT7EUPuj70wuj2IM4sSOTd0voQvE
 eHcMNWWKDIXGlH2NEINwWEI06aXjWdfJ2KYtO5ZQkF9EPeOYsSjelLTcidg7JMgSE9uv0zIv9nl
 xe6bpdeS1vGCLN5W/U7OJBGDqnB2T5NWuWBbYs3eHBQ0Xh9KJ6nAXBn2a5sxvWLZpkCw2JNDlwu
 xqBTVFKr6Y39sekm2ouLYsCzmdjC1ztIuwgRc1mhn1j8Qt6zJzq3tiUBAg/ZuUVO9WsUHvwS6dr
 RocjvIaTOWIpBKIszmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfXwWMLxll4W5DF
 PwT/uO86XXovbcMpmgBadSgh9fSICVX0ONVpJGFincHVMN7HQphgy0ZPqqUwI39u//2oZp7iSi2
 jlMnXP1vUUefdqEbhKQUyOTS5kpApGU=
X-Proofpoint-ORIG-GUID: BWVDIED-tebPaomKTsS2cO80PD708Pe9
X-Proofpoint-GUID: BWVDIED-tebPaomKTsS2cO80PD708Pe9
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aeb56eb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PAWBQAtbQnHvqMwJI70A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040063



On 04-11-2026 19:24, Krzysztof Kozlowski wrote:
>> Glymur uses the X1E80100 CAMSS resources, but its CSI2 PHYs are
>> described as standalone PHY nodes. Reusing the X1E80100 resources also
>> reuses csiphy_res[], where port@3 maps to CSIPHY id 4.
>>
>> Add Glymur resource data without reusing the X1E80100 CSIPHY resource
>> table, so the standalone PHY path uses the graph port number as the
>> CSIPHY id.
>>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/camss/camss.c | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 1db66976e51b81edeb223cebb6bbe84995d102c2..4f705a056eedbc7b09d2630ee6284b8d768cc6d5 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5800,6 +5800,21 @@ static void camss_remove(struct platform_device *pdev)
>>  	camss_genpd_cleanup(camss);
>>  }
>>  
>> +static const struct camss_resources glymur_resources = {
>> +	.version = CAMSS_X1E80100,
>> +	.pd_name = "top",
>> +	.tpg_res = tpg_res_x1e80100,
>> +	.csid_res = csid_res_x1e80100,
>> +	.vfe_res = vfe_res_x1e80100,
>> +	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
>> +	.icc_res = icc_res_x1e80100,
>> +	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
>> +	.csiphy_num = 5,
> 5? Your binding said three... Confusing.
> 

csiphy_num = 5 is needed to cover from port@0 to port@4; it is not
meant to describe three populated links.

>> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
>> +	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
>> +	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
>> +};
>> +
>>  static const struct camss_resources msm8916_resources = {
>>  	.version = CAMSS_8x16,
>>  	.csiphy_res = csiphy_res_8x16,
>> @@ -6049,6 +6064,7 @@ static const struct camss_resources x1e80100_resources = {
>>  };
>>  
>>  static const struct of_device_id camss_dt_match[] = {
>> +	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
>>  	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>>  	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
>>  	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>> @@ -6068,7 +6084,6 @@ static const struct of_device_id camss_dt_match[] = {
>>  	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>  	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>>  	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>> -	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
> Why do you keep breaking the order...
> 

I placed qcom,glymur-camss there to keep the match table alphabetically
ordered, following Bryan's earlier comment about Glymur/Hawi ordering:

https://lore.kernel.org/all/23845ad3-dedd-4e24-803b-5abf3b030c4a@kernel.org/

I can move it before qcom,x1e80100-camss or keep at same place if that is preferred.

>>  	{ }
>>  };

-- 
Regards,
Nihal Kumar Gupta

