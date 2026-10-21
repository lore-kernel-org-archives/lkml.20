Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583410;
	b=J1dGqy+xV51gW8EYAnOjbtEQEVaaKpW/O7V6IGlODCFsBywqivoNhFzAYtr2ufuJ7xD7
	 fQJWqisilGHCLne07aWULnu6EzH8DSzCCb4ybJlW/1ryys9fe7QA5nTt3FbBPOMLlAx10
	 S/7JVugIQg36zAKmaUHEVe8ohj8ri/cRgXcY7P2XYHUJIkJ1PI6aN1JQ/9BJQwyqA2Rbs
	 CCXIL5kWCRqn2A+6wPg2qwtPDMhFpIVpx0U6QglSiBOZGPiQNXvvwZ5vS/5aKpYzpnTm0
	 RJtDLcYqBGrZwl4bvcf+6KyV2c0lBncL4Aw2o+1VyrWkUX9Obx1t2XJxTuVk8I6OE5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zN1YohgORCrsb0fgBq/M+QsSb1XehQmuOvn33cCPAMQ=;
	b=PV69FFl9xmFb2wDZaFY6T7LjEXfF4WkKQ/wh1zyUne7Ab60Dup+nhZZMApvojTZA5/Vs
	 aaUl7hy54tW/yNZ4tUYM9HcqRJe2zqVCTgTbVxyuR7VxRLydTry6k6xqiZOKsk97DFbmU
	 iMM8r4y7D1gtUl9isMcWeYejamR62EBklimzq5p7vt8/1t896UmiDXKmLFc1rwRCqccYi
	 W8VNijDedToCd4DwBGWiib+XZwH7LxKxPITCzitwPbURRD0Zs7JnskWx2weGqldBPfSWO
	 JOZ4GV/tnhwNC7vGVEbWNx2O/NPLF3Nao9vyt2e8PJfQ/0Qp8MjMsAeyRTMoBUyeStg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDmc+9gw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ag6kFi/r";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4F3606A329
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D4F3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDmc+9gw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ag6kFi/r
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgKAo184152
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zN1YohgORCrsb0fgBq/M+QsSb1XehQmuOvn33cCPAMQ=; b=VDmc+9gw3DniNvuO
	2lW/B3oKKlHuKI4Ufs6M2TR7k7LU1M+miaNBgx6XnXR6/Zr3UWGkb0kneLW8sX6n
	20OdYfWpPsNbLVYCVuQUEpTjTBj30klEipO/hkcP+mxohAjgX1IvQKLQuxIeAziy
	fCi5M8nxciyNhiB4JeeaFJK0IBNBThztQe/VrRsYJBWkreVYn6JLwVflBpoQam6P
	Qr5u5htd832GQUMTDrzvjfH0PQTi2QrIAcsO2H/Ww3wkdLMYClzCek/UlIRaH08S
	aL2nU7ddrwNZNupa2mAw6LbWHeWxWiOlz3lq6HvMi5O8R2TUt/Y3XRNcltsss8Q8
	4/6AAw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9huq9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:50:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so953695eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583407; x=1793188207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zN1YohgORCrsb0fgBq/M+QsSb1XehQmuOvn33cCPAMQ=;
        b=ag6kFi/rTNHqnRqesYyFGVzkruuowcdPSeFWTLGF4KUqKABzCixnuQPP5T4R/aa38k
         lLJh/KMDKq8zfSt3V5/BFrppJjsk/l6aembEpUNv/mABOak+ZQVMdh32FDe/TrKjD/RG
         SIIV7Fa3rhiDfm/T73n8Qy9sCdo+ciVzTXIbRKAYiJ8z97GMekMsZzWUQ1Wx0PRA1C+s
         zB84HVfHgTAydUls5CyXBFuRZaW/dfAoK1zEW2NNzmcxNqcEaeVdUO8C7z4e68XmL1WS
         uZ7qxUL7yXof3oYU9Q4ZOSEKuG3zPcvU9ox63MpOGtydtd7rsmMfgVa1WZlIw66KWSAV
         AsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583407; x=1793188207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zN1YohgORCrsb0fgBq/M+QsSb1XehQmuOvn33cCPAMQ=;
        b=hUs3HE/rF4To4Z9HQ1LGn12HqhbECScUNCAECDsYGFLorCmpdkvmFzItTm1jcXDa2V
         tUJZsQLuvalNvBU35vf7VlbpV2z7GBF1G62EtLe41OvbeNF8C34s1+I9vzELBBlLp25h
         pGyNxArYnqpye53x2MlfRUmjiWLnjVcz7/3hvfKCtQMIDvl5MYxyWBYMBbQAJpj07pK2
         NpOAaVsbTBNvl+miHvCfu0hdVga1pBY1NRa97bTOR1xExqcdV1j6kNrfeHZ/l/YPctwl
         jaOaS8rtjWf7FaDLKx+y4shnCBd/X4H1Aic71L1ZQgWTWAW+zvZ2h/vfFAcTPjOr4Uos
         8FJw==
X-Forwarded-Encrypted: i=1; AKwUvBwChPDweKv4kYkD8I/SVi1pQ8ZslcbXv/iZ16rqM/OUhP6fQ+Y7RghGhDU5GsvjK4Um08N9a7tCwVtZbGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJgHPKuzJ2VHfdpB0eZEM88YFd+iG5hH1Vj6qkl6KP70kqhu3v
	xDMpEWiNXxcqQHVu7DsC4P/N9/6y1z9sCuefvDtuOqSSrsbY3bMluKyU3nMGn4b4m/DL03gkI11
	B/VFJP2T/LQhhZdF2oODPg3DnuT/S86tm0JBdDwqRyzUmmyZVF3GqDnlGApCkdVaa6m4=
X-Gm-Gg: AYBFou2r2lCDpuSa81+ggNFHigGUUzxvxrqhwJeNf45T0oinurQJg7CcI074vjDIheS
	eQxWiYF+sHjtzx2Lw2oy5Z+VTdtvE0UKXlieEdx/yXXNbLy7TLUihubN03a+NhJexf/w76NroPM
	XIH1Mv8ce47tDKhj+B1Zuy8vsBIbrcZzHR5FqsgYA6GH+FTrxh8PthhFtQdL4dv1c+V7xFS+5Rm
	eC3s7xYHQs7OY54Sc7pRi0nhXDm+zpcca+vfJiQ9MFaJE8qpaljCEOBBH3sDkYToDxou2S958rP
	NamoMfz939odOdhIlYTv4JcmFoeJcb74ft8aXvaxOmlalJ6vT486x+XtIPYUTJTO5yv3U2LFrPa
	Y4Co2Dmn9Sxf53s5qWtpbrpCYRl5ZZ2bs
X-Received: by 2002:a05:693c:4144:20b0:35a:22a4:132 with SMTP id 5a478bee46e88-3674ee2789cmr3293053eec.34.1792583407079;
        Wed, 21 Oct 2026 04:50:07 -0700 (PDT)
X-Received: by 2002:a05:693c:4144:20b0:35a:22a4:132 with SMTP id 5a478bee46e88-3674ee2789cmr3293015eec.34.1792583406512;
        Wed, 21 Oct 2026 04:50:06 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed2absm8043559eec.5.2026.10.21.04.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:50:06 -0700 (PDT)
Message-ID: <8b470cbe-d06b-46ea-b928-bbf7dc1c158b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:19:59 +0530
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
To: Jonathan Cameron <jic23@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-2-aba3cfcfbac9@oss.qualcomm.com>
 <20261016182014.7d2d8bbe@jic23-hlaptop>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <20261016182014.7d2d8bbe@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad8a6f0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yu8sOhoR8PlAKUki7sMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfXy4ULyx/IASdu
 fqYjq1rWIRQX/5MIRdqHYIWmfG9H55pPP6mnM/1Tv8QeRvtK9sySmMHh4D69eL6+f5SpDAftrfy
 uAiZys1ZtPdvwZ9H8IpYqK/mtrjnAy8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX4PL7mhiYzvOG
 DsLjSyIyApD9/Wca+Q33hzDhm0r9wwKORY3BH7Fke4eH7yQrqSOH47pYctfArNmjVETEtV6rLog
 ARSmoH8abgGTCXd2ccRRF9aw2o6MRU27VMxuIB0FaEVqMF3LEssrMpm6F89U3wN0qScUQjZRaMZ
 CWHRNLC6G3fl6Wchsfer4z6pvN5spjbXg26qnPgPaa2WUq9UDLc9CeJeQkLpBXe6Qin6zC9V7Y/
 qxUM28CiG9O82TQ4rAvufKcuLOYTlerOyBXro+V+ESngk5lJejU3AVjnixeewcsqt25ja47ShkB
 mI5nMRbGn0aNdNL9Szvru61oz9Pzz1Db+O7R5slnnJFtdX2/ol/29f3xiUOV2Ql25f5sLb4OjXW
 /yYWrpULmexQEB5X+4PecV2SW0i2JCAfSOiY/wvW0qzAKthmMxMuIrzwOS141HrGITOtmhsyH8d
 N/IQ+iMtLrq7VHkVz5Q==
X-Proofpoint-GUID: DXQM_ARsI5H5rBdQhE9qdiifq8KronI2
X-Proofpoint-ORIG-GUID: DXQM_ARsI5H5rBdQhE9qdiifq8KronI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210047



On 16-10-2026 22:50, Jonathan Cameron wrote:
> On Wed, 14 Oct 2026 21:26:17 +0530
> Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com> wrote:
> 
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
> Hi Faiyaz,
> 
> One comment on existing code + a suggestion to tidy the new stuff
> up a little.
> 
> That global for drv_data is less than ideal, but given you are touching
> the driver please tidy up initial assignment to use INIT_ERR_PTR()
> 
> 
Hi Jonathan,

Done.
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
> 
> Unrelated to your patch, but why don't we need that tiny bit of error cleanup under
> goto err for this path?  That use of a global is not the best anyway, but none
> the less I'd expect either some consistency or a comment on why not in the above
> path.
> 
Good point — changed lcp_irq to use return dev_err_probe() to be
consistent with the adjacent ecc_irq path.

>> -
>> +	if (cfg->edac_reg_offset && cfg->edac_reg_offset->lcp_srp_interrupt_enable) {
>> +		drv_data->lcp_irq = platform_get_irq_optional(pdev, 1);
>> +		if (drv_data->lcp_irq < 0 && drv_data->lcp_irq != -ENXIO) {
>> +			ret = drv_data->lcp_irq;
>> +			goto err;
>> +		}
> 
> Maybe it's local style, but generally I'd put the value in ret until you've checked validty
> then copy it to the good location.
> 
> 		ret = platform_get_irq_optional(pdev, 1);
> 		if (ret < 0 && ret != -ENXIO)
> 			goto err;
> 		drv_data->lcp_irq = ret;
> Both more compact and obvious when we trust the value to be good.
> 
> 	
Agreed, restructured accordingly. Will repost as v2.
	
>> +	}
>>  	drv_data->edac_reg_offset = cfg->edac_reg_offset;
>>  	drv_data->ecc_irq_configured = cfg->irq_configured;
>>  	drv_data->dev = dev;
> 

Thanks & regards,
Mohammed Faiyaz
