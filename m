Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3016730D40D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749806; cv=none; b=lG9ajzuLfPAG5FD+WRrlovT1adpIEI0b69Y5gK3Ywg++7U07w4d0cMyZ9BT/kGRuz6iK9uR71H9FzrwM4gKh/EZIVurnlHYPqCSxxUa5KuoEAhLWE/Iv7Rnc+4abpomzI+cPRnnc/9D6tkaTVDUW6z0CrNs7hYiLA0Hg0QXHEg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749806; c=relaxed/simple;
	bh=mVs7Y6Zlw9G8xVUrhFmCckDfMOLQDDWqs4AWD1QQyuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za+89mwCzxaBjby6U3OaADXbYGf1TxslNczohVzr/8FE5X5eQ0/IEzK4pSG/HKBQ2gogbRSK7OmFwSJb92+utdT+ppQNpM4Tfiw32H4lAsSD5BYpHDcB52VTyokPeVvVxU9b3oW2MXTHDfWy6ub5uro3oxuttw9mEMa2n9PVRC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsUVOYDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REBoEW5E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsUVOYDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REBoEW5E"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U66mvP2876506
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tPWV/hXboWzQLZnIxtfFdto0
	CNYSH9DwqGYVh/BZlFk=; b=HsUVOYDNINurXKdXX4nP7V0yFdc7tDpzDTj6PMhw
	DOtZTCcGT97pPbwf8QZ3gdBdjPfjaEmyiLsiVakjnbClnlKQECRtmE5ruLzNS+bL
	fm4bNczMkznWzfhwYXQKOGrucx6OaMvY6EHR+mfGqKo4pvDFPq/Jf2xHVsPIYS/O
	GIP8ZKztDOpHut6EJHj6LjO7kCNbfWpvyMTyD8hFVK0BlEbgZoY7WPzRoA1/VAmQ
	Qfvu9yDiHse3Smc58l4qzmk1ghIAl3R7FPZOmFbstl7d2kvFTN28t85oD4CnTOlS
	Y+x4qLXtIXdLnsimpHoFu0tfuArsSIC/A11M4yYN8D5SVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0et2bu59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:29:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso4730658a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749792; x=1791354592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tPWV/hXboWzQLZnIxtfFdto0CNYSH9DwqGYVh/BZlFk=;
        b=REBoEW5E9ZCNvIjWYAWQFYyylauw5I+t4fajJux+40jbBS9Zf3mLifCI1EUQDqbMU3
         bSCNYAbUqW8ZvGKwe7c/BCIkV5tYMWN+As7FCe+WWPUmkRHqz3kQ9NLLXacTOX9eJkPK
         6vxHL+brZU/ESawwYQx17w940DpXPh0IhPEsHAbgh4W6wAkLjhn1QRTMXXJOAiGF58S8
         0WA9BW7IxW3Ks+T4aKLttEZdtpnaxjTaH27otN5diNhn02c3CnjFr6eOdduwv9av0YNc
         j3zRJ6BPQb9STiRYVo0pVedE9oUpIF5tPJDPj2y7i9itgcoHuiQS6cx4B0GK84V2u6GB
         dAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749792; x=1791354592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPWV/hXboWzQLZnIxtfFdto0CNYSH9DwqGYVh/BZlFk=;
        b=am9c2q0zw141T03DuHQ5IdbyqV4Vr697RfmIOf1qPh5/y/wCKbzRWpCoUntUb/Gsu4
         8ioCdbLE5qWmrENgEw3hCxdxX944dHe6gWxsjghchB7s2HQU0+Y016AsfbTiDOP60uO5
         syPjHuYYPq3cVp+/PB878NMj2HmDLulnp0aK8/HqNbr6XNLRviZqzhXiaPHTP+AGfrWZ
         vzzEPu7vjvVYIrlVJJdnLh8TA7x6gWGJ03ynUe+FdTGuNYwUQ8AoeE3B4Y5JGVLeEejB
         75zTwUjR6XB2AXrEaIU+ROQVEzqKyVHOqOh/T0/meiJjEBoDtbt2hBz8lbbu3z4dqJum
         w3xQ==
X-Forwarded-Encrypted: i=1; AKwUvByE1NC4ilaCOwzQNmRhWrgqq0tfiBhB8D/rnuk4Mj6VjywUPeFcSUvJZzc6JMpj8I5xy9xKVp00xrM2V9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB30sbhjFCiJv5qknK3tR4XkAtjwRdPNLydFbCTNof6+F5W/4a
	qRmV3DzcGmygqQJApOEoZnxpT+pptWFlT1LoxVYDu6mjPzbQNYN7fuOwrvv1WFt8hNaeoy0Q0R+
	0iqbaB+b8z0PS56W9vsGurTjt184THveAQZtOQs4jRtwK1KL98OXC8n9rOLkxO7fNe4E=
X-Gm-Gg: AYBFou3QGJ9drsFe9VOa2N8vtLGvYSBp4csDUYS7StoxMP2rwLfsdc7/3KasCDvJbK3
	ynoxEhHHhK/Mt7BtEIG0hMRPhVFN/+l+M0pbI8awpdsEHzPVl3jGxFVs0R4Rm66j9YLH6cuppKe
	aAUIues8FMc4DNVaG+71de44OKgj+RZhubX7JAcYSvDBgrN4jOe2nELuhKe8e6CIMMy9ah9+yVJ
	8LSpwFLzUPtYJGUZtzlqKvVPZtQNzovG1KiRDbySnlXYTpsnBIVtXl9MLXEV4+8Z+2UPK5eg8sE
	Qc/W3lUE2G7THLm6pFT2LFGzs9QLH5cFP9ky688CU12ZrOUshBYp5tzlmkbOVkOwlLEmQ/qHTEp
	pfmCE/y0XJAfouW1tY4fF49Hk
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f476 with SMTP id 98e67ed59e1d1-3a4d18c21bfmr437219a91.53.1790749791645;
        Tue, 29 Sep 2026 23:29:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f476 with SMTP id 98e67ed59e1d1-3a4d18c21bfmr437199a91.53.1790749791156;
        Tue, 29 Sep 2026 23:29:51 -0700 (PDT)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ca64bea4sm1825727a91.0.2026.09.29.23.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:29:50 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:59:45 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
Message-ID: <arysWfwaY5GOo10G@hu-raryan-hyd.qualcomm.com>
References: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
 <9612eec3-dd70-4ad0-ab4e-d90c921a94b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9612eec3-dd70-4ad0-ab4e-d90c921a94b0@oss.qualcomm.com>
X-Proofpoint-GUID: M90tD4mfd2PidIOUX4OQc-aaaOI6kDcl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX0Z7Te0v4S+np
 49XyHW9AEOBLLwPBBwb4yRn2ijbBUQkIFn3aaeH4hKW4NjLFxe7nnBaffJalZSMqfggmRQJznSa
 89Xm6uv9s/jgBQIr1Y/Ye/9v3NrOWVzgfxvda3Tz5iNlhsHz7btpGk3gVyaS7Dt4t+p3Rl5MrQb
 gca61BwB4ODoDW4HfhpACcZUKEJg3cUcU6zpJQP4xyGeIwf2G3BxTu4tSMB+mVuroD3Co2xsyZH
 7L2HQVlklpMPTErQy7skXZhg2oAIBq4CihOH6fTF/45IoMnWSQOwVbGtZLhK4RoNRaRUbunT5o0
 iULVtgZIiIZTfBaXPUa6eVV+B/vnYr1+fBB5wda5LW/D/tsq8FL6lD2SJd9pOTN3criiA0ra5/4
 Q+bbaMxqPyVFPQefFwmm9yKz0hJUnwp9m3fBOOO6GImGzdXSzZDV+mpphkOj9UT9jn9YSuFR3it
 jab+VYDnfaOErFNYbRw==
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6abcac60 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wkZ4SpZ5FDF5jysW358A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: M90tD4mfd2PidIOUX4OQc-aaaOI6kDcl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX5DzqEkAyQkAn
 RO68fAejW1NNBC0uQEDejZJDILMMaxA1ED/gidLwosgp++bECQoJf2khGXyvJ7csJ42i6/AFYEk
 BZIUS4bepARtlUo4nT6PR0c+7c7Psjg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300025

On Thu, Sep 03, 2026 at 11:02:16AM +0200, Konrad Dybcio wrote:
> On 8/24/26 4:49 PM, Raj Aryan wrote:
> > Add ADC channels for msm, quiet and xo thermistors along with
> > their ADC thermal bridge nodes and thermal zones for PMIC
> > thermal mitigation.
> > 
> > Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	msm_therm_bridge: msm-therm-bridge {
> > +		compatible = "generic-adc-thermal";
> > +		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
> > +		io-channel-names = "sensor-channel";
> > +		#thermal-sensor-cells = <0>;
> > +	};
> > +
> > +	quiet_therm_bridge: quiet-therm-bridge {
> > +		compatible = "generic-adc-thermal";
> > +		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
> > +		io-channel-names = "sensor-channel";
> > +		#thermal-sensor-cells = <0>;
> > +	};
> > +
> > +	xo_therm_bridge: xo-therm-bridge {
> > +		compatible = "generic-adc-thermal";
> > +		io-channels = <&pm4125_adc ADC5_XO_THERM_100K_PU>;
> > +		io-channel-names = "sensor-channel";
> > +		#thermal-sensor-cells = <0>;
> > +	};
> 
> I see the SoM also has a PA_THERM0 thermistor at AMUX1
> 
>

In schematic for qrb2210-rb1, it shows NC. 

> > +
> > +	thermal-zones {
> > +		sys-1-thermal {
> 
> Please give these meaningful names
>

ACK.

> Also, the XO one can go to the PMIC DTSI since it's always there
> 

ACK.

> Konrad

Thanks & Regards
Raj Aryan
