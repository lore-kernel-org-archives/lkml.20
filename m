Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583694;
	b=q559FhdNmwCWXUnH35VvMntpKSDUl8ySkflYbCLG8nQhR2XrB/g/yrxqcv3LehCQZV9h
	 51oPum3R5DToazjbL+pMXrOnzVaKW3tYtVRXOTCe/IOoTV4fI2u1kymEVQtkquHuLe0Nv
	 GmszLyOC2Uy6xDBdrE5Q7cRSQiC318ozXbenuXUC2TR6sWbRfP/baQgHLa6VRPJ7wkJOI
	 awLw2y6XONUHFs16f2Jj/Z9pxsfhATP1A3qetBGTEBAaVT7Fnn6Z5zH3lMvf4Nxhkl4ny
	 YSzfcu5kSKr+NXTQnRmRbzDilINimQt86w6qocUeJu8V4ogZ8LsMgZu8eAJc52ehz6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KxoxQTAfdxc5nsQbvnGm0RGN1ZSXS/BoHHTwOCHcxOA=;
	b=bUIHq3JnohX+OPkyO88ZMAndu2Bw8w3ZrmSKJuUfNPzDPwG/nvgZ6w58fSi0GakGHI0R
	 RYoRWoDF3J5FbF0JSAXvh677qZqjJTFLZKxNZUp2zowI/IpaHw1ctpNPj82u0joPFEEJ8
	 lpdfl/oDZ7PGZEWt2myhSG9icJqv2dPC1KbYgRRQ48d2Y4pKJfeK6d1WvlhC42Pkhq/Jp
	 nnN54ceit33Z+dWnpVERu3dUffpS/s9H3wkKVqVr7hTyHXI8tkXy2nHW7MAiCIMERCN4O
	 VnDaIoxLzxUxt72/c5VFSk0WM9Q651gAKZdGkFY5p3M8QpvURjxjSiXvAnZnplJYu/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ua51GJmd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPCh+CmZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8866D606A329
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8866D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ua51GJmd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPCh+CmZ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfxZs3829324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxoxQTAfdxc5nsQbvnGm0RGN1ZSXS/BoHHTwOCHcxOA=; b=Ua51GJmdnkG2tfL/
	tArK9LKhlgyybEuUKrA4cNSRpoo0HcKSNumOWjbKehdQHe7lmVPEN2BTLeXFkiT9
	hV28mELMWmFAbHY3h2f6yudeYG72/frzng1rKdnB+8uanyISpG2YgZJpgyRWUmf6
	VCiZhynaK1MfEjZ1wLnMspQnHPiEDP/y0CQl0YQw7aKfBVSHewWb8n3zc3I7NCif
	5X1JGUkaTBwZ7CPf8NOJ1Lcm1nvWXFScJx8QwsNEriQp1cjxk9kG9Mi/FFGZBRSH
	92EDI52tiM7MyzB4zCcyZRphrYk6NARv83dea0YROAomnSzB7QiLYJJZd8BLQv8w
	k9wBRA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd45e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:54:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1130553eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583692; x=1793188492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxoxQTAfdxc5nsQbvnGm0RGN1ZSXS/BoHHTwOCHcxOA=;
        b=JPCh+CmZ5Nraua0GgenannhrnbtnA9a/6qDfeCEUzMCE+jIIcGwF3HXrl9SbD3R3IA
         5vqdM/2i/S7G/eVvziB1UxEH4C2fMxC8Apw7V+HTBjL0+V4lSewPl143/tvagHou6DYa
         hwhVztQLo1m4Q1qA+HyYQgV1Ls8vZ0oBAUL62bPTR3h8U4gb+0Gwo+pQUewUvGUX+8UW
         JcvUdrtBktv+8pUWdNNJHm2F4RZM8KNReESp3+rLlY9Bx6PDlxDgU3sypS/LdvGYE6s5
         ULCFguooVI0iH0COewnjABluWyLn2Q2CYsvtvR5dX14cfcgi06Mlp4o8qE4Tqc891uTX
         4Gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583692; x=1793188492;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxoxQTAfdxc5nsQbvnGm0RGN1ZSXS/BoHHTwOCHcxOA=;
        b=B1W2Un7AggxXqJiSc+vWBsjvs1ZeJMHPekJZQ0QPPB5nO3kqU08xCDLSusQuJrAmcE
         BqJHtdG+4IkYvmvEYMDskhjaw3LcvgcEnyc5N67jx6v5Ib4ofdovCQpVcZNVARXXybwJ
         M1O7404bs6KXRcrqUkOf/6C2lW7hMHyxz94uqBsGdEsDsAmcvsxSndZVEHs9XZ8Nmiyi
         X4Py6pj1hIGGT2QxZpR4ePYVWqUMP8qbo177RZJdj6yc5IioiObB0DyXDNfKWDCYXusY
         3WvfmgrpMrBlRQnyorsX+/wBRrDd2HxrIKkQ31Zlvps+lCppb+iGzk9UaRsqwp/1B06n
         HE6A==
X-Forwarded-Encrypted: i=1; AKwUvByibrHDWT4XPfzL3xXkpuUtogrzooLKkSSKZCW90PiBqWX/yCZ/13dkqyoUsn1H2rvNygnP4ysOxjXWBLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAgUGqKxFyd7bNk2oSH1kiU0S00MDjwsYLKdev2AwsXvlN00Qv
	PgNqjQ9L/aa5UDqefeZG9pF8KxyiRjz5f9u1iEkPRsKJw1TYyx4jxtoQj6YAyjQG6irAehUV8vu
	zZIl9yyYOyq3106S8zy1eu03j+896SfKAw21R+iBKRbjoXPE6frYX2CW7xqhycMFkyKo=
X-Gm-Gg: AYBFou3uEZ5c7+uMwnzUf4z1YQwgPLJUEohBuf1GhKc5rQwNZUxU0SdbqsjPMBOr+Ir
	VubhkgixY9cDNDdlGxTK5O/HbZFYwB0UY7VZq6B1ky6wYKxbP6aoI43qt+YqOCkBopAqIQePhx+
	vvbBg2ykZutDc2mMlDKENWapVDHmiXXSLSA811S+q6J+2gaGXs8YAeiFVLK3Wquzq5stug1auuj
	j3smEogO5RAIEWuXpU2GYqLmCHdKKuyuIl9NFjiAZQRq0uGMS1wZJStjyMz8jjlzY93CgzoISZ7
	XKttaXPmlOtgTzBcy6dfTxC8esx12uVfj+mk4ET4M5LBiZLX2VsW6bROAfQ3Vg8wfHiiChVKIz6
	ga4Iz1yM2guD2AJMPdokxu4kly3xMdLCUaw==
X-Received: by 2002:a05:701b:2202:b0:164:3237:4485 with SMTP id a92af1059eb24-1909a332a70mr2205192c88.0.1792583691841;
        Wed, 21 Oct 2026 04:54:51 -0700 (PDT)
X-Received: by 2002:a05:701b:2202:b0:164:3237:4485 with SMTP id a92af1059eb24-1909a332a70mr2205157c88.0.1792583691125;
        Wed, 21 Oct 2026 04:54:51 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d87ab1bsm6181635c88.21.2026.10.21.04.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:54:50 -0700 (PDT)
Message-ID: <67404f33-9452-4a53-8ed6-8fee4eea2611@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:24:44 +0530
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
Subject: Re: [PATCH 2/4] soc: qcom: llcc: add LCP/SRP DDR DRAM ECC register
 offsets
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-2-aba3cfcfbac9@oss.qualcomm.com>
 <20261017-spiffy-shapeless-caiman-d658a6@quoll>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <20261017-spiffy-shapeless-caiman-d658a6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX+940vb07/Gi2
 JbcyHBYEQaGnihSaIGImY0X240xnR1AIppbnCW1/vlQ4opX/E5vOy+zMLoUeCz0JqpyKBjfHbt3
 hqCYbdU4SCc4U7qhy4A+URid1XmJPgZbVxyo1jX5ac84j8MzGWdgmL+PKjueTWnxMNWcM6VH33y
 z8/6rcHrF3CeQ/wWqC6IGTcMOrmO57RZUXxi3mV7bvTEI3sCbJSmC1wh0rP3FPNJgkohiZwJ0yu
 Z1BLXrJyGvTelqlJSX9648vlitELePHoGLJpMBz8hy7dg7/qn37ZYcjldV2xNB029+m1epI3wkQ
 TxnuqdJ7/OaAfSqwHIRpeBs+cHUkzPm0FNvPlITdBoF1dHe9+lfxQT8CDZYRUpPya39WTGmvBKr
 mbA5+svGwkUiHZK9lU+K3NQrii/dhS/y+1wxUEtK1HyEpX7Rz6Av/pMGWhP41nDRivp+esvYiDV
 TKrD6ajcSJ5UMXDhdMA==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad8a80c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VlAtpL-8CsKfw-zIKP4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: GrvEPIPP88BVjTlaM2HQyOLfr-T17rUG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX/QbYulJFjjUF
 RmHCsrtkIWw7YMcvXnHVYKVyPV54NcGvLpAFhigPUldwx9QXbrNy4Uz3CU7RmBkgCEl/tgABcFx
 vBepfLCDEZlTHSsQIJOS+ssYdXpXSD8=
X-Proofpoint-GUID: GrvEPIPP88BVjTlaM2HQyOLfr-T17rUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210047



On 17-10-2026 22:04, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 09:26:17PM +0530, Faiyaz Mohammed wrote:
>> Add LCP/SRP ECC register offsets to struct llcc_edac_reg_offset and
>> create llcc_lcp_srp_edac_reg_offset for QCM2390, leaving the shared
>> llcc_v2_1_edac_reg_offset table unchanged. Switch shikra_cfg to the
>> new table so other platforms with the same block can reuse it.
>>
>> Add lcp_irq to struct llcc_drv_data and retrieve the optional second
>> interrupt in qcom_llcc_probe(), propagating non-absence errors so the
>> driver defers correctly.
>>
>> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/llcc-qcom.c       | 45 ++++++++++++++++++++++++++++++++++++--
>>  include/linux/soc/qcom/llcc-qcom.h | 13 +++++++++++
>>  2 files changed, 56 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>> index d7a42a8040a1..39e0da14b36d 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -4509,6 +4509,41 @@ static const struct llcc_edac_reg_offset llcc_v2_1_edac_reg_offset = {
>>  	.drp_ecc_db_err_syn0 = 0x52120,
>>  };
>>  
>> +static const struct llcc_edac_reg_offset llcc_lcp_srp_edac_reg_offset = {
>> +	.trp_ecc_error_status0 = 0x20344,
>> +	.trp_ecc_error_status1 = 0x20348,
>> +	.trp_ecc_sb_err_syn0 = 0x2034c,
>> +	.trp_ecc_db_err_syn0 = 0x20370,
>> +	.trp_ecc_error_cntr_clear = 0x20440,
>> +	.trp_interrupt_0_status = 0x20480,
>> +	.trp_interrupt_0_clear = 0x20484,
>> +	.trp_interrupt_0_enable = 0x20488,
>> +
>> +	/* LLCC Common registers */
>> +	.cmn_status0 = 0x3400c,
>> +	.cmn_interrupt_0_enable = 0x3401c,
>> +	.cmn_interrupt_1_enable = 0x3402c,
>> +	.cmn_interrupt_2_enable = 0x3403c,
>> +
>> +	/* LLCC DRP registers */
>> +	.drp_ecc_error_cfg = 0x50000,
>> +	.drp_ecc_error_cntr_clear = 0x50004,
>> +	.drp_interrupt_status = 0x50020,
>> +	.drp_interrupt_clear = 0x50028,
>> +	.drp_interrupt_enable = 0x5002c,
>> +	.drp_ecc_error_status0 = 0x520f4,
>> +	.drp_ecc_error_status1 = 0x520f8,
>> +	.drp_ecc_sb_err_syn0 = 0x520fc,
>> +	.drp_ecc_db_err_syn0 = 0x52120,
>> +
>> +	/* LCP/SRP DDR DRAM ECC registers */
>> +	.lcp_srp_ecc_error_cntr_clear = 0x59004,
>> +	.lcp_srp_ecc_error_status1 = 0x59010,
>> +	.lcp_srp_interrupt_status = 0x59070,
>> +	.lcp_srp_interrupt_clear = 0x59074,
>> +	.lcp_srp_interrupt_enable = 0x59078,
>> +};
>> +
>>  static const struct llcc_edac_reg_offset llcc_v6_edac_reg_offset = {
>>  	.trp_ecc_error_status0 = 0x47448,
>>  	.trp_ecc_error_status1 = 0x47450,
>> @@ -4767,7 +4802,7 @@ static const struct qcom_llcc_config shikra_cfg[] = {
>>  		.sct_data	= shikra_data,
>>  		.size		= ARRAY_SIZE(shikra_data),
>>  		.reg_offset	= llcc_v2_1_reg_offset,
>> -		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
>> +		.edac_reg_offset = &llcc_lcp_srp_edac_reg_offset,
>>  		.irq_configured = true,
>>  	},
>>  };
>> @@ -5798,7 +5833,13 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>  	if (drv_data->ecc_irq < 0 && drv_data->ecc_irq != -ENXIO)
>>  		return dev_err_probe(&pdev->dev, drv_data->ecc_irq,
>>  				     "failed to get IRQ resource\n");
>> -
>> +	if (cfg->edac_reg_offset && cfg->edac_reg_offset->lcp_srp_interrupt_enable) {
>> +		drv_data->lcp_irq = platform_get_irq_optional(pdev, 1);
> 
> Why do you exactly require interrupt-names?
> 
Good question. The driver was using platform_get_irq_optional(pdev, 1)
by index, which made interrupt-names a documentation-only annotation
with no driver enforcement — not a good reason to require it.

Switched lcp_irq retrieval to platform_get_irq_byname_optional(pdev,
"lcp"). Platforms without interrupt-names naturally return -ENODATA,
which the driver treats as absent — no explicit register-offset guard
needed. The ecc_irq stays index-based (platform_get_irq_optional(pdev,
0)) for backward compatibility with all legacy platforms that have no
interrupt-names property.

Will repost as v2.

> Best regards,
> Krzysztof

Thanks & regards,
Mohammed Faiyaz
