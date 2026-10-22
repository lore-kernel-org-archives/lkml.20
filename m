Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666831;
	b=q6jdgLGK6IsfnIVdfrpFeb4Rn5LdmHRodslgDyYmji+D0MB5zXFCTMbmEBz1XJ8ecMSz
	 pdes9EoJpRLAn+xEXFyx+6NwrzmQmFXZWUNIuZiS4QXaq3NVkI8JxHsTbdc26gsziA+Kx
	 cjpWTeiA+NfI/ZvBqtCiRnQ4zFW/fvm5AKc2/5OukTUq2WBj7VZh7+u8KwSWe5LZPUgBc
	 jKAp6Pb6ntn365QleVFZDvzHw/i515TrVMVOFnVxFElNkuPudq8sdduzm+Qh+QHJREFKU
	 VVkOPh6AX0YoqacS92KrXaxrh6YqF6InDQaAfkbcxCNE4+QHxpbKpeHsd3PXKR83GEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3HGmCF0ASxOLS2y7H3kM1+aMPDTdYvwreTI3xARkJWM=;
	b=pe2mUXutpQsCAxAjYZcp7LdbGSIoq52MNKbZ8SEqHIoMSM3qQ5FWZ17VqEbpSqm2GaW2
	 F4cdd08pzyeW/BuhC13nkINmzFigrCeWXSWLPQYZjlR4XF+F+eckslDVZjoOj6S+lXmFd
	 CgWIodsJWYA/VZaBjt3ahUobHN1j9iF+w7h6M0u0OQfOCnYNUXA0K0JMI4UfKehEYhxkp
	 CXVaark4Tgs5dKAZLyJxKTtrlJYris6sLPcxa6i6fOSngpTOkOUTbTwwsMs6CXdlUNc/s
	 J9NSV3vgcPBLTd8Dw9XT0E2/lpyuUoi7xdxDRvkyBnOyCdrf2kD70j3MUATenDnvAJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1YdeBXv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0h3InPk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3BB606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E3BB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1YdeBXv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0h3InPk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xmJ8317704
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3HGmCF0ASxOLS2y7H3kM1+aMPDTdYvwreTI3xARkJWM=; b=I1YdeBXv3GuA32iK
	GOcW83tArQvzILS3tGxCosSMkhqqGq20UjT6lRKZKZ7VYR9outJwfKR94/w6GwMk
	WNeZlmaR2M8acxdbHgRZ0IFon6PiU6tfj7JQjkIgxUf7x5zQqhk4TdPhGYd1D8gn
	2TbpfxV6Yu2hSgmU+fe3nKvShe2tz0x9bv52c1q3V9xQedkcfxv/gnI6ZeFTJX2l
	Zut4tvalxDrJ0Iw3aiRM4QLe0uZBQ1LqVGv7iU+3hfzyI7DZRsrZzK9JpePny4z0
	dOuKqMKcfymkNxtmkNCqhyOmbmBF3+C0iUQE6UN3TLObTpVIAJdH7IFhkZ3Pks2B
	Sz+wuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ajeb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:00:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so39834785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792666829; x=1793271629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HGmCF0ASxOLS2y7H3kM1+aMPDTdYvwreTI3xARkJWM=;
        b=b0h3InPkw4/DOE4UWdcq+2zqboowWSn6b9by4K854xHocUML7iH6nD7kFB9jqck51R
         1yJj6p+XgYNyBbQ+UVQpmO7I+Rdwg19rrLc4X4mcWLK1EvzL1giVjDOuTajKuHVhnECA
         EvF7LrSwCbX148KRLOUYuAJfgFHflTpGyEF8TJcXPtrTDE2ZL2JiJO/zwu/KwzIZAj7R
         SZFwVDNSKsTGPMHos0toUx+dIRcr+ngiTqdBGVMpjmmkNsQ3dvA/SE2yppDEE0cfcK7Y
         BNMFtpeeqhWVyn5Q5zycSm1ENnpLHgOflTKcAu8S2T1wXdx2SEnjwAW1DetBuOb3T2mv
         gRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666829; x=1793271629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3HGmCF0ASxOLS2y7H3kM1+aMPDTdYvwreTI3xARkJWM=;
        b=gdtIQ6nKoTPitmm8p3PWWvg97u09H+ubP3/cQgRnyGEuF0Eg+EsUonZmOV/JjGDX1P
         S92ICGl+r0hjA1LieEr3PPtmVdROvSnC6goKTzfYpyynMvn2qJqqchL+uzYD80f0F0IX
         CihhGq4f16u+xIH+JFduPBq78pRNMAR6KohgShM4ee8knjSvK0sFOHemXNesWpUxi9Zu
         BjIxkHIZ6JsyyjkNb0pfnQjA1Qx1yW8KffTP3kS/r2WwSksEsqwSTZyusrYCO1RASvp6
         y9bP3ZWTP4BC8YRXJnUDiiWky0vrX3jWQU0vu/VFWLHDcDkES3j/eZz8+Jj9Mq/F2Tdv
         Y13Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNFNROiUGagsLwlgbfTlmFNfxNP3qadaNWJ/F4NrbbUAYgVGqpoupXls8cJPE571OK472nTXw7rxLdtvI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcFTnGXtJNqAHnAAlybdy+4J12qSdYU0yALgSX0cGXfn6Uh8Pg
	k+DNaoec0V2LdktkEUuBRoPfVEy/tuC5m8sUNw1wsTivbv965JhxuhtgoxMMn7I0G39S3fx1/bb
	LSiWwWLjfETNi0P88ebBpBxuj580EGVnAT6eVpClZKdZV+tAy5Advmo4+mxJQzzDwvso=
X-Gm-Gg: AYBFou1+PTLZc8k19R/jBZ2nNSCURGJgyPrM2wkdtg0teMp4Z1966LggIATFExYw4yR
	b8q/SzCrFFzDdMe1Ccn7sJin4obrSItyjyD/EymQOZMlm4/DZ9B+mChYYWAl9Tz7/ovz1/hf0Su
	awHE2XAQ9BO6lw07M1T07ZowEY7l4v+YdPECCo9SWAIA+ebd4VVywdg0SQlyUXAKxBbEJtRBbwM
	GtIFcTmT71e59KbDG7ckRL0TNgjBUfbYAJn+i5b4xsOr/sGz1ePR9y2dMDDOuoHaBmMfE5cT8ii
	J5KHHLjureCIRajU2npSsHePniX+WFIrxNCihYp3EooTkiQ+d8VHC9dRRPn88p/H3TCDsLjHH+b
	CkicO0mVFbyroSvJW9YE9SQ==
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr1077439385a.3.1792666829398;
        Thu, 22 Oct 2026 04:00:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr1077433485a.3.1792666828987;
        Thu, 22 Oct 2026 04:00:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5ba26csm90719666b.62.2026.10.22.04.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 04:00:28 -0700 (PDT)
Message-ID: <d54b50ee-f0c1-421a-9d1d-5dbcf84d556d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:00:19 +0200
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
Subject: Re: [PATCH v5 10/11] phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY
 init and configure sequences
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-10-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-10-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfXzVCyCqTB0aqi
 aAiM9GgbHWFoZq9/7exzt7m3lYnq9fQ3UhhJ0qYJEZREMpNY3A8BsXqrtWIZfYGxp+R0kyXk2t2
 ohJxlTOGJAQS3q5db5a9vqDFp6TAOwjelJ5sMakIgiRa1vSjA3zRomYvMBPfKk13nb2aRwwX7vm
 wKs8ZMzEgm6BkgE5puvoPY8DnVjxezglcWfmYna8EFEqRp4o7ORi7g4N6+WQPYNMorG0TQTHJPL
 GUdIoooefhLqoEkQacN8dKu6ZeJq1sC6QPHW4G0ky6jxSBlVxH154Perwt5z7dabsD4UAn3nI2e
 ZJaEm6F1e8KN/CjW9NHzfFoVdNJyZeV0hmBcoIyUnAgU942/fFK+XSNNDup7RGpo/OqS9xjyiSY
 ISm/WBCibusiRYJNr6J8HpikspB90PiFjg59xVQ2arMnHjdATbRJNkkBzz3BUwYCn0CCTPyptRg
 qtzsm793SvnaBeM1REA==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9ecce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=igDMAPUHuX2-SMk_MF0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: rzIrnElvWpBPQEUWZqxJOpkteJQx8AT7
X-Proofpoint-GUID: rzIrnElvWpBPQEUWZqxJOpkteJQx8AT7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfX7xrCFsHwj8I2
 Xj62lApVHytXuG1PwtcrtNzHeNgMCX1AyeDa7hhFY6itoIFLA+y7PFLt7nu8ga5RH9Nokezt0GL
 3ZE/Oa6bvnScvPV0ba4FQZ0tIhvH/Sw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220043

On 10/1/26 11:34 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Update qmp_v8_dp_aux_init():
> - Add CLK_FWD_CONFIG_1 initialization (0x3f) before power-down control
> - Replace PSR_PWRDN with LANE_0_1_PWRDN and LANE_2_3_PWRDN in PD_CTL
>   to correctly power down the data lanes
> - Correct BIAS_EN_CLKBUFLR_EN value from 0x1c to 0x17
> 
> Update qmp_v4_configure_dp_tx():
> - Correct default TX_EMP_POST1_LVL value from 0x20 to 0x2b
> 
> Update qmp_v8_configure_dp_phy():
> - Correct 2-lane and 4-lane driver enable values to 0x30 (was 0x10/0x34)
> - Add CLKBUF_ENABLE (0x87) programming for both TX lanes before driver
>   enable writes
> - Add TSYNC_OVRD sequence (0x03 -> 0x23 -> 0x22 -> 0x3e) and
>   LALB_RESET_TSYNC_EN_CTRL (0x0a) programming for proper TSYNC handling
> - Fix QPHY_DP_PHY_STATUS poll to check BIT(0) instead of BIT(1)
> - Replace post-lock TX_DRV_LVL/TX_EMP writes with two COM_CMN_STATUS
>   polls (BIT(0) and BIT(1)) to properly verify PLL lock completion

If I didn't have the LLM at my disposal this would be really really
hard to review

[...]

> +	writel(0x87, qmp->dp_tx + QSERDES_V8_LALB_CLKBUF_ENABLE);
> +	writel(0x87, qmp->dp_tx2 + QSERDES_V8_LALB_CLKBUF_ENABLE);

The HPG asks to first write 0x8f to first

[...]

> +	ret = readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000);

The programming guide doesn't ask to check this bit and the way I read
the description of this bit within the register, bit0 already asserts
this being true

The rest is OK

Konrad
