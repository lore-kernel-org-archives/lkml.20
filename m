Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265235;
	b=gbwFzVqH39NZy6nUzNEVAelVA6Jl8hzKyZ/J1yEZx+1n4MgdwEayeBfrwh/04qnMr/ND
	 oFOzYicimOiFPnUEhNXMyc5xeKZ5zN+YXoew4OGyl5Iujsu444+j7fFPl+AWCVBmVmUg9
	 OWW5vv7/wcKtpphou0ssKQ64WWqRVDgqwcnqz3YiRBpuCJePwlaHz1NR17OeaC5tFqrli
	 zdlLXwByT4aWiEnqdYuQsg8faUYLjHV35M4EgR4TCLtwWO8qpwtWiJvaR+XI3z63UEC3U
	 x0o2AzA6aIHZTbU9xbD/eVX4F6BCRzei0n/cxufmzj1XuEdxuKDmdUAh7yT0FueVFaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NFI2tWyPhBr82xP3dv2G8dPBOkHd5ea1/Lyuc2i+joM=;
	b=AvMKc/WJhIlrbSIK28Zl6w0r7aS2MkovyhUp3WV+mhd5+CphVbzKz8W/q7goPvAjfVqk
	 fAmvIH3MeZ9OSzwnetxNm5o6YxVTLhYYrTI4ZCAXRrdf5AeDhDtqrUpksBgueQRX9oB8j
	 TCaoE7BDxPs1GHskLEmLO5kAtg4Y2Xeg8cu+l5MFHeVeXWBdBFjFWABEmpVb6QhlhrejW
	 rxJ8nXSi4TcU310wbkC+Hk8ejYqcdjV2WJsDblAYT2T5XUaMKwAL6Q2QH98PqijeGySud
	 8ve8yTn1Khhuoj/CgJA+/XK3lioObRFLDKpFdCDoLBjBnFrNvixXjtt46cGUGXMjR8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXnCYEPe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpXeVObf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C827F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C827F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXnCYEPe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpXeVObf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vjxV690583
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NFI2tWyPhBr82xP3dv2G8dPB
	OkHd5ea1/Lyuc2i+joM=; b=VXnCYEPe9YSbImLRUGuQKMURvR1ySaRCMl+Lj18Q
	Zx/ZHn2zb2QOwDwsXCgHFMW/SK60JzeWnBTtmK6+GNxO0FDtv7NtFJxr3VvymlQ9
	QK86BjfqS28+DXntQgb2c3MaBrg+E6hqyyG+psQ7bCDTvUlg97ijl0j3xJD6i6D2
	ns2qANRayGrXABo0yj8EdBJj4/ogpvM/MapqjgZ68YKzo2W+PJjfgkh4NV+tj9um
	WJ/tLxnCiMuegvo6nIyRBYbJz0/BocifMlD7qY53iiVoK0Hi4OT3g3SSypWYg+C6
	rbfJE/HHMumMA9vntiYt3UsIA8d6azj2jORsw/g6zubMNw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneuu5wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:13:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so3298971a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793265233; x=1793870033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NFI2tWyPhBr82xP3dv2G8dPBOkHd5ea1/Lyuc2i+joM=;
        b=KpXeVObfHXYpbSCWBX6V1TXXfFuXWVoTDA7RWHMjzHFp2hLDxR9OM72umo7I7Tds8X
         wcx6f6s6YnTRfk7KrfM75cLEyjs+17UCN07PYU5+TdilELBigSsTCUJAvsMygVyNQtvb
         xRbtn9pymIbU1EvnfVeds+Shj7x9GVbKWDmKyPh1Ua0RXvXVp+tVvJpRgrQzFiKImU2Q
         hzZWveNAS5Cy2QX2EykxvKpxep5FfRsKn3Z+jX22a7f7yF0/QjMkWYy6QPGlllzMn8Vu
         AbG066+3wGf+LSxZmSeNOPyUYgpKSBC6LXioX2p6VlDtw9wMUygVIQxZ4HdqpsCVMiUQ
         6g7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793265233; x=1793870033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFI2tWyPhBr82xP3dv2G8dPBOkHd5ea1/Lyuc2i+joM=;
        b=CP07e3XXGqquP2eN98s8Ei3mGEYMJ51BonCSKTpzkI6DhQpq09JOsiFXJxMbE+H6KR
         UmjGfITesiCGiSwHAtNpZQKraBDlQvYPz30iHUGKsW9eqRoFipgEVndQBmKNmYFlHOUq
         zOVCW0JuAKZbe9HDpRLdJnx9yCMTN5ZCAxJyPlAvVhtY1YyPTsYC5NgKxu7n4HMi0NwO
         LeWsfkiIUzxarhBxZRQM9xWALb5qMCz97389MshYnkYMTjdQhnPJfHh6iCRdaMHU2yxr
         ZSsmRTnmNTi9umVOFUiOdrE1AUZAkiDxpLGlpPyGn9+0WMkGleTUpCaDvfvYxcixg06D
         a9xg==
X-Forwarded-Encrypted: i=1; AKwUvBzdr25OZ/MQGIUNkPBt8mKakSeu5bTFpunsRZKQ0iKu0CbxqdDMvziFPm0vt8YCOwEdH0US5iaFZxUwHmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqAm1dce2bEIOJvgxIKserbi74ZnEgKv8nVEcj2cdA0biQeCpQ
	MH/M5whg7V3eJtIWZNESyt/gigN4TOohuAyF8eWrbN1SBEtRdYetvqFkUfBaq+zMWW/9gF3D7kG
	n2w6O3QqQmTUeInbA5VEN9l8d1X//PPlpcpkXe/2h+MDUXBZ7Xwp7AL4aMkl+M08mnEk=
X-Gm-Gg: AYBFou2ajMYQmxChgpjsKN/G08sTiL2O69zgOEj/ECLzBGMZlg/c/i3bBeXbsmWrOG/
	5thIVzqmvCwiQp/OmwRdkcqJdzIWBDmXSsDl8Zb8LUNWF+BmljQfK0BvyBsnrm/zjifpPvgMirS
	lBBxmw6jBp+Qo/j1CabV5Y7K4vb/m/KFJZfEyyfP+bGz95D/qRgV9IZ4Oo8wE+EZOC03c9EBg/E
	nG333OEq2D7PshRMq9hAyoBlm8Kg7KCh0YCAIFp+lj2LNU7W2noSL4vxbPFTZlRy6dQGD/aIfQ5
	W5W8GI2btH8fb2CRUg/5kIXOtNmEVStWYBX9q1dSrDLd79KIVewCSJ1f4CTODmCoytPycMAGUNj
	kDkS7CWDxrr5sXAraUdEsyMLQ/1MobqoE3i3Tev1UW7kAS/fKiLeeQqh9OghfijVU7AlspjwjbT
	GJOwsIRM+vf+B9iA8=
X-Received: by 2002:a17:90b:1c82:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3ae57df557emr4015079a91.8.1793265233241;
        Thu, 29 Oct 2026 02:13:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1c82:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3ae57df557emr4015054a91.8.1793265232701;
        Thu, 29 Oct 2026 02:13:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8401casm3428556a91.11.2026.10.29.02.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:13:52 -0700 (PDT)
Date: Thu, 29 Oct 2026 17:13:46 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
Message-ID: <auMOSm_roh5S-DTY@QCOM-aGQu4IUr3Y>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
 <d4349c3b-f6c7-41c1-963c-ca0e21e2f436@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4349c3b-f6c7-41c1-963c-ca0e21e2f436@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfX7CNJQZtxQcTE
 xONsl0YyyILM6uep02Ynkyfw+BzT0728+0SsYdd2iTA9Z+XgiJWuqOB6V3XrC9c4QvCUuekzzPJ
 k922nsh+kvK8dkJu1aFDznTCxGXtmUTtSsUqXZDSRVtlOx+7nP3yi1eVAo+1TMaKJj/sFukzzim
 b4je6Sfw0zLl/Ky1WFiCxNnJ32LFxvYFAa9FhpBY4e5tuGXOY6T/AV7PxpSgkAK/EuIiTyi8DoP
 Gw7CDuRGPqQnopCi9ST+YC4EokCyOa5L9bbz8QG8qZRUQWpZRJzqAtG/qYJlWcN6sWNTCUpmHI/
 jG+rDlclzMyGwehPosblW3l+j4UqrH6tNmitm6rXYQCkfycTFqbVB8TNIesA01YRe4HvKnhOu/C
 ITjUh2Y8cKUM8qA7dBHr2S214CMCkZUC3sXQepFHhkJknsZiDgLHoTkDlnvrN4ud3ZKTQnmWZj3
 ftbsOOmvcCq1rTww35g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfX6yrjXKkNlZn8
 yZGPfaQm78FerPiyDaG6LYwkBRiR7bzkUz0W6ibNNt9fRuY93DyyTueKyZtdEoPaZ87jCTjLA3e
 tK6iPz1R6d9Y0zperXNqLNuFwCJMf84=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae30e51 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RyhwSFVHSLl6ccd3bA0A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: uRWOPKnVcsZDgcvR9_HJBrZZ6odSPkql
X-Proofpoint-ORIG-GUID: uRWOPKnVcsZDgcvR9_HJBrZZ6odSPkql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290035

On Wed, Oct 21, 2026 at 11:56:55AM +0200, Konrad Dybcio wrote:
> On 10/21/26 9:36 AM, Shawn Guo wrote:
> > From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > 
> > Add support for the Qualcomm Nord SoC to the protection domain mapper.
> > 
> > Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static const struct qcom_pdm_domain_data *nord_domains[] = {
> > +	&adsp_audio_pd,
> > +	&adsp_root_pd,
> > +	&adsp1_root_pd,
> > +	&cdsp_root_pd,
> 
> I see 3 more CDSPs:
> 
> https://lore.kernel.org/linux-arm-msm/20260929155152.1898666-3-shengchao.guo@oss.qualcomm.com/

Yes, we have 4 CDSPs on Nord, and they share the same instance ID and root
domain. I will add the info to commit message.

Shawn
