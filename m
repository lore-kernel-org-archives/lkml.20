Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498497;
	b=YFTCRbNQYWfAQFboPnFy155jneNAg/fN6Ybus6XfPK1Zq0kvePwRZ5Doed9oIbqib/7U
	 aRrzy75S1yM88HCzNSLPL1leGhA6QPJKX3hdTq9oevdCmtX+uV8yfvv3UJPj2TQbFtPpU
	 ltDfRZYcKTdpslnGL/m8IjI5iJaN3J8q4ODQpMz1Mf0x1AE8vMSlFajrgjllwvmskait5
	 oQCKfDGDqR2lWhom8j7RQJBzLSvaJG93nGp2fRZjB9sNlVzs5uB8y3s0OqI4WX1A41Kl5
	 TIM3ZD0VWWDjJxbSImNUA8Ek/1AsNgnoMZGibKRDO2xYJeLyt1R8PpZgcd117WrKikw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tW057FOfkctUWxUAS6E1dHkE3yvGosPl63BmjNY09qc=;
	b=AehrTfc6zPH6QvNDHaTsr/l6DO6jhmOAfLScJDVVIUB8ivOlOeZBKWqGAFd1q9b5SODW
	 apQLL9ECmRye5LARvyGQOz5hIgVAJ0Gvxvi67MnlHKADXK82uYIm7q060fhtqNfys7CtG
	 nwCfKtZzoo2HJ4svr4aavUTZbQMXCUpn3Kd7K4NGfFw7LSOk7Xvy6RQ76HoFz++E8hxLl
	 4+LgsYpbIQdsncjFiyZ7PSEnFZXWzdYbmJHik9P1pqoeAM3ci2C+ySocOqDzM5NYTrt+f
	 jLROuMUKxqOoI1APU1EmwCfAYSzZAHwNc+QkfGgFHZcf4+H02iOna+O1P3cuGPPcSuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgfsrHAc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QWIVbJ5N;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E2E606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E2E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgfsrHAc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QWIVbJ5N
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KC5s7f1592542
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tW057FOfkctUWxUAS6E1dHkE3yvGosPl63BmjNY09qc=; b=ZgfsrHAc19/T+Yp4
	jF0Vwwa2rrG73PUhzpiN0RMdXqJXl5Uwr+ElgdzsI1QDwRXWNe/N87zQ+sPomlCw
	z1XK5Vz/IiTAUrxLL+3iWXF0jlW4cW5OBBx/pSHqkdyIA8+EUKReEWA5JCp/A+N5
	mM4nLz8/+me9vupU95vRUmF6X/VNQ+l/B3zNTZdKl8RaeZSymwUa+QukI73len2P
	3BS6OxhNSXqnHcN5D3NYEjIZuRVaIyqFnkd8QdJ/rZ9sa3sTxi/YExDJ+pzl0WYg
	n9qvMr/+q0PKyK6PjkMq8CmEL6f1xwUsoZAR+lCTlPFLqt4anOpewAd64pN1FJ6i
	16V0Rg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2d54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:14:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eabddbb650so26713e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498490; x=1793103290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tW057FOfkctUWxUAS6E1dHkE3yvGosPl63BmjNY09qc=;
        b=QWIVbJ5NmNlYJ7p3bmYaVTQW/TxnBBWVKaliezLTGiXmLmXONDYoxW9uoR9KCIXwfr
         /zAuivXFNjO1O0YhhcO13eqOSLK/aM7+v8z5Oz50dAe5xipXu1dFKUOXczybQLI5GiPp
         L66yPFd+CZMT2q7zFZf6tihJcWl1LllDZEXo3+lHji3nVJvL3zEMztS1CBA3zElUXAAZ
         M4XGiJebEi8knCIe5me1XYFRPmSQo4Jb3rpnKksnih1n444TwZ36mPt525Zoi+rExn7t
         GhiuhMFwg4rUX0gydv9zdWfCC7CB1S/G//9RZSqR+580CMclqLkAK4xWvsdLd5/2c0TD
         qnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498490; x=1793103290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tW057FOfkctUWxUAS6E1dHkE3yvGosPl63BmjNY09qc=;
        b=nzPT9FA7bb7fKSSKd1m/hOHatCtZniP9bEJRt4xwch74lbPsZDgsF8N6liCa+lXKnA
         ckk+RRLcSXAM1F4boB+rG1qQInCnQfBYimRiomkrMYRIVVdE9V6cxAgdUv/ApoiiDFCV
         +J9NFBxCRCzwQ2qsrmkOCd3wD/YpVdKRS7GJR3MQaWW1dM6uXmWq/q2GFWViwE4L4MyP
         G3+4F0QGzfEWW2IIzcoTHsOvgvUB/DO5dK7wuSxHzGH8zIbp/Vqbbw7AR+MJ8lEUa5OY
         PshkPwndkjE0UbwRTJIHL3yvAIwgJDtvYsCAdcSVUSsdEntkqKJNYiPqwVQgysqnrevz
         7qlA==
X-Forwarded-Encrypted: i=1; AKwUvBx1kynkQZEHLv6GdfqZjyQ7H1wpwjbmZJ2sPlNShRxFC7lyhBWuejOYr0UcMD4UumSOPoOYocjTgEIALKU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ03a0nVx3vsuAuUNihPCcLAQka/GIn4jRI7LHyHtjTXBTN3Xy
	LOwK5TGtVJxBBLK1v0mJ+aAW7UA5LUYza8iy0F8qZIEYQpqEZAUXB1h81SdsCB0OozSaz1NYlVc
	E9Kh7bRKMbi86C9pu4ga7W0RVPGm8twfiWC3Lhb8qZsnHyk6BtHr0Tp5CFZIBJQOMlQc=
X-Gm-Gg: AYBFou1JoWwxNbvDPSAfYkeUjsGXet20qxF8XELpK5OIQYMIvcUjLM9nbibtHDVePfM
	Nds93YivYj2TkX5gPrVwZMzHJX4ptPs61FQ6GyooG2KesU6aHtPCBSCBBUmudXtSt17YmcMGz/C
	gI8i2Mcemiz4FN5eQoCjPy2blCl5ZV/+BWJvf4DiX0rsfeYY4vjsrtphW5bknoGXVKrp/roz4dA
	hX3mNB4GjcdjTEBzD4OKR5WXsr59K03Hf3elVkgsXfNvWp7V0yld5vrf+djI/JV0YFTf7BUewdM
	PjTvmNKMd6lUiMMCd71HvAMH4LuEETBlcts2BxX531FUtlVWRBOLwchEkVhebLWeQ98J1Na4sqj
	MCMnr1uuzTzKWwAJ9HipTEA==
X-Received: by 2002:a05:6122:6c0c:b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5eae19634e4mr162839e0c.4.1792498490490;
        Tue, 20 Oct 2026 05:14:50 -0700 (PDT)
X-Received: by 2002:a05:6122:6c0c:b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5eae19634e4mr162823e0c.4.1792498490089;
        Tue, 20 Oct 2026 05:14:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40914c3fd7sm472344566b.43.2026.10.20.05.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:14:48 -0700 (PDT)
Message-ID: <302ff5ea-cd47-4703-8b29-125d5f91ccc2@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:14:46 +0200
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
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FHQB8RKg4Yek_vnU1K3kfg37lHdCB6m9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX6yTFktUWQ7JN
 5AqcC39DiNZnKtIVad802VFMzghP4w9carsTbjFC/tCtZ/u0ATJTstrikwULO+ssJoPscCl/ilO
 +WSH0LthgcS+eNvF8r1x6WzLAIbyF1U=
X-Proofpoint-ORIG-GUID: FHQB8RKg4Yek_vnU1K3kfg37lHdCB6m9
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad75b40 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=YyVq5OKRWxwgIy3V0V0A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX5yYcG2YG7FcN
 AA4fkfcAWymTjwpbhuWz+FHcGR5RCGB1kz3BmQcmuRFXwoo6wXNmzSL5hmKLmpOIdlnkulrFdcx
 k94Bg/+7xSMdXNG8aD2gbyrfWSgS7p8h0bNBXgCl9nJ0DzizM6RvB2lLubMsQW0Sn6dXF+pHqAR
 SiJYokCEJy+d5wp3mHJ+zsC9EzOe6ir1Y1p6We9/LEVkGYDvnmyS2W1DmiN2SGVutypgPwXOHIE
 PJ7a7zgK/P1wfdRdW9AMt0u8aIES5hZqQsDMkwFBtZs6SlXaZ1++PDUapxqi7IIHOg1dxNQmtqt
 sjfz2S13aq2HQi0ZY3w0FXjcuOweDsNmRh50GIDyHkn4LnJrGmWetjeuLWeJTK36pykMbQ9GcI5
 xzvsnwBj++B9LCbQgfcBCoU+nK4GSLPWSSfAo2ctIO/uYQjn+g8EoNqaNMxMlyYsxLHG4cudp0A
 oO77iQtRiuOyluT5mmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200048

On 10/15/26 4:37 AM, Shawn Guo wrote:
> Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> firmware to configure platform resources such as clocks, interconnects
> and TLMM.
> Device drivers request these resources through the SCMI power, reset and
> performance protocols.  Assign each device driver a dedicated SCMI
> channel and Tx/Rx doorbells to support parallel resource requests and
> aggregation in the SCMI platform server.  Operate the SCMI server stack
> in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> communication.

[...]

> +&firmware {
> +	scm {
> +		memory-region = <&tz_ffi_mem>;
> +	};

SCM should have its own label since it's an existing node

[...]

> +&qupv3_id_0 {
> +	compatible = "qcom,sa8255p-geni-se-qup";
> +
> +	i2c0: i2c@980000 {

Likewise all of these

[...]

> +	cma: linux,cma {
> +		compatible = "shared-dma-pool";
> +		alloc-ranges = <0x0 0x00000000 0x0 0xdfffffff>;
> +		reusable;
> +		alignment = <0x0 0x400000>;
> +		size = <0x0 0x2000000>;
> +		linux,cma-default;

What's the nonobvious reason for this?

Konrad
