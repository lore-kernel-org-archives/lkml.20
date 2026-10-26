Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027526;
	b=FDrJhF6B7yj4lZuij/Zh9UCsarcEII8lgz5n2dLxp+lUFxqEBFaDoF3JGzYqVMc1gfVW
	 8q3lE8qMgxZIat8Tv6LyUcLtmGUdyH0d6zCbKnx5jlnCAdp8zERb234bCRbfOWL75y6IM
	 CoK2NgjmOT42HqT//ZNhYcxkOnUD3HwEXIVQGnlK2WnBAEvP5brdgy4vV5Wia28N07M9p
	 G5IPESSgmycyyEko49u9KdEPsZLOm63+AbG/QBhhB6bSqBNmXinnILL1zVKGzJtBae/pS
	 hfgMmxar2+7mLxAXTPl3thFJ0zcxAiroDxyCwVzs7Btq8Y3bDpqETqrMAazhmxBcErA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Siz2D5vkVqZu7iFgwk2tA7kIq5v4uUSOUjK1Fa1sAkk=;
	b=EjO3SlWXlBAgLesdpYNLKKZVxrpauOFQxjjQlx8w/Pv91LP2K7kc6k1UljPgnwbguiw2
	 ZKJeWtW3gIHNCqMvQiRJxrsXZsdfqQA0eTsY1sKxL2XKVH3fgTrF+bOF+aBrIxpRlRTq5
	 Z8tyMAKVfo1UTFAFYqDXmMRl8FFyfbt5rwpURXShch0yV9PIMcQAsTjdp9D+M24VgUKJW
	 Y2dsdgu8R0PoJKtayGX/jVFOsZAoD+dx3G5kK5BqF9h4mUgBkGu1JQrW1F0j38o9MDLpa
	 84RpLo/kMb4QtjCF8VzkYlwaEXpONqw5G2y0BkvHajJAxqiJEHdbBQCtw099JasO6vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mefbt2FT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeQel0Di;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB64A606A328
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB64A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mefbt2FT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeQel0Di
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEwSJh2082538
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Siz2D5vkVqZu7iFgwk2tA7kIq5v4uUSOUjK1Fa1sAkk=; b=mefbt2FTJ+upAxLN
	veJjYdu1o+tJ9DEyyULCLvgjWnzeQ4HqySarcMoTaumrnuDxegpMu2/HiaO7vVoa
	hlD0/EDATR46YBTmcUzKQiWp/SjWY0wrBfpTF54+iYvLd0HK674EvvT4FTf4CH+/
	llKx/zkg+2rA3+mMU4wjaSuaGoT1bsE80Hdo09NYnZXoA1d9f4RpyblIrE4qfczP
	ntows3NPP5GEidW7B8k4AcQJXkUjuwS+QKI8Jblg797qaefN5K8syAqBo5UB+ARj
	a9ytIOEYtPDLlP5Mz3kMUDvlsi+JFjYNH0L2581wkkQhnrxnbgz/uileMB6/A3v8
	SXwQUQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgsu2cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:12:05 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988c723394dso112069241.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027524; x=1793632324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Siz2D5vkVqZu7iFgwk2tA7kIq5v4uUSOUjK1Fa1sAkk=;
        b=BeQel0Di6yLoDXltTsS8fdXhHZHmjNg+0zOlfIBacjXcMdS1RBVmQp8aSh4ATXrjzN
         k3FSnEw33Bt8tr0mwx9BRatHAtVtgMy/vXcDCoKlGB20TRyrfs9Cgk9Op8v2G7CunQnD
         LeM4yN9KQxD/LjqdH9FH4nmj3lJiC+VwnGFIKknJxUuMO9ustAnclJiEG2FSThUuFFxw
         haYdhrfxf5EIx04exMSjs/yGtb2Jp/jPrQ3YdbPfaRT0n+q6177tZ+ftl+3Y7q7vMcSb
         c4Ij5pulfVk/EB0I5UDQolpAhLTSjAuh1CEevARb+uOS+KaGfXfEeT6N3HsDp1qpr9Q7
         FhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027524; x=1793632324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Siz2D5vkVqZu7iFgwk2tA7kIq5v4uUSOUjK1Fa1sAkk=;
        b=urUnPpri1+pD6dA5kTzVEWuB5niehCX9WiMWSXuBXJ4x3DpshFgHgThX0XYQc0HVOb
         OdYB8CEvlB1vulBO3IhshCuR2b+ft8lcIGFGJ30SKQ6XriPuE+mK2RpACldbzY+2lSBK
         Uu1ary3hePfdOLOq4Ly87q8jUsVaEhFai3F6Kwni7KCSsth2PX74jibYtYwccV5J6sQ7
         gZUK00vLxkQzqgaKjkOG56+S/ff+3TAkuam4yQ+e5RX9I7R+JyqmTDGfMMp3sySeR4NT
         Gx6JCfHKOp8Pl5+jJ92+U3c2OWPOjaNP5TW2LsdLNDaBr612NsXuL9OO36aEJIVJWJYb
         +HPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYRabWEyGMeBkMxr1yp7kFx5Da5aBCfUW56obBB++uprwdmub4J0J9BqGrJcZCgbOceFx3MpW4e9LNsfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOiG1XT3moNtdPDJYPk/NwaQQW8UzNB0h+0rph9FtpcIi9vxts
	7Xdp365SmZpZ0+9VbtR/XU3V8Og0Vrn1I5Sl3hBu9c+0S17j3x+OFvGfdCG1+OlKs5x7PbvTQnr
	RlQjrUet7bw57xy0LhEMlmTNvYCgc8KTNz9XdvqQHfyDy8b56/At+13VBGlJgjtJas9w=
X-Gm-Gg: AYBFou2oPJUn5F3PZgrSHoVBckRgRiFbPBWAgBlDtgDLXnMmvkki42BDAIX+6bcqBSy
	DbWVcq5HtN8bvmpimvPk3fFOMfNsIFo7FwkWYnLQ67vK2HPdzGKURRR8+Icygy7QMbS7cC1B6Va
	4+a3YCBh5Gvtg+P60VeQ7vNpm289u7zCzigTl6U4qBfBSq5f8XAXHk3uVU1PbQ0BXD+TS83LJ0a
	hvT0VtGKgPyAuWuN8I/eCyBkDpo4FTwVooHIdulUMFNV3F8ImTBeQ05YUG2+bzLAGGHmtCeuDpF
	z5jWijIBcctBgGKXvJRMituMH7HRTpt95FobVxEeMYGa562lGHUI5rK3PLoF9UIjtWqJjkqQRw3
	vmMdu/8zgY7Mm+U8OjBS06g==
X-Received: by 2002:a05:6122:106e:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5ec230f8433mr2339076e0c.2.1793027523918;
        Mon, 26 Oct 2026 08:12:03 -0700 (PDT)
X-Received: by 2002:a05:6122:106e:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5ec230f8433mr2338960e0c.2.1793027522944;
        Mon, 26 Oct 2026 08:12:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6dbsm327506866b.59.2026.10.26.08.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:12:01 -0700 (PDT)
Message-ID: <436398ee-4bae-42ae-9137-1a4d7d0582da@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:11:59 +0100
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
Subject: Re: [PATCH v12 6/6] arm64: dts: qcom: lemans: Add OPP-table for ICE
 UFS device node
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-6-09271f583dc6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-6-09271f583dc6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX6VgGMqZbE7Cb
 DhwzZnHDQ1w2vIM2lzVJKNtx48mZnF+2XoOlKLGrLwIDtNIYPuUIf+QwN05FnE1xUdQJkXSVJ67
 /PXxS+hxOFeKkb0CpRreUA14uNXLq54=
X-Proofpoint-GUID: akZYjmSttiFc-cBTQOlPSCxgLIITr6wX
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf6dc5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xhZcOr--89cURCpmMK0A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: akZYjmSttiFc-cBTQOlPSCxgLIITr6wX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX89edHGh//SeX
 4xS8W1KqB86AbGFWK2PKxvP1o5AqcaQXxoDQlxaliJqa2DtXkILzjVOrUv1v0qYnkRK2tbZAzgr
 62blg9fPqvR22OzBCBVSLU/nFBCUurJr+MoXD4iNTqDvbgBibeZ8WTVShdsLDWWbf+/QxOXG+63
 u/fFj6l5T5WwcMe4OqGkSlKuqoc7rDr5HS+TiSA+D3GSyb73mS9Y7lOtty9U0uRBHyjzpZNv/3T
 WHGfloUkzYShVUlmu8xGI8iUkitD5w1FyjwiPY20IjPqk6OlrgM4xLhBXzR7Uan/Cu721F5Nj5m
 Op+BTa5jlsjLDULtNBjySmejxP+TQNh6qXahSutuHNBzY5odrFb4J7JjxljMIDUoamrHYp7PTwf
 A3mT7dpcWsUwKiuhwb+IGe1wwOpbiLsJqSkXDE2ndybLeCqsztMXjfYfK56EcWaqURrzgkxaWyk
 dWjGB2UHNGZrqOrZnVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260060

On 8/23/26 9:47 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS device nodes for LeMans platform.
> 
> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
