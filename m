Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169453E4C90
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371571; cv=none; b=CTJrVLcj4Nf3hkEKSg7/yFgu72TgTc82tPqzUPqrssJ7YFewxkbgrvaeOCoYFvoCKksKgo3ORTfSqjtgFw29/oSln6jULOB6TksTupx0k4k9O0dT/FXPbx0yjb5cbSz/OVD3XbMhTELhs6hYvd7pbhMewYsM2TaNBQGDjcux6H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371571; c=relaxed/simple;
	bh=+45AxSlhEZ22gOSJjZe4JD86VbvHcPcGnVduuHVO1qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWUFk0ikpohf2HKtYwavd0JTD7LUhqToxxvstLZvomLQt3ELNbJzDbMVciGzYHSkO5muG4SKKZLgpaYkqw1jmNNap15jR59CFJJZW+QMMxSsPbzggLtfka2wpr44ahrnJ20wiYuNfnuT2f6i67ScjkQDnAqRbaYYXihDYKmFNoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FsvsMdAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1gFG0PQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FsvsMdAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1gFG0PQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jSAb237673
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KS9bOyoJ1mlSi0Y0TDim8Esq
	aDPD9SDEMcYeUOECgx4=; b=FsvsMdAFDdDviKqbFzv3ULZ7ro/nj1oszNaXwRIY
	6AqG5HCIxPt/B+7bVIpRIFd3+g0CDCHLAdlM/KTcv/ewpPNP0AJ+sWeqAZZkDkFO
	p1rLT8Vhc/XHLVnpumj7FC8/54pgraABG07xx8SC+J7oFvPk34eapwAniXMwWSSL
	Pet3haSNz2iVfRgd6etx/qv6hkuMtsdiGUanbOYlE/4a+fdegI9+JPr38S+Tda3F
	+I5+bY6ueJyrF5xPIUmRqazaumWIacmezTyQENv9IhsPD8gmyrbRNoX3vLFNNvVW
	j+BgpQmN/oyj0BijXRU9rV1+fnjfKCvfvdIGcRyT4oaYyA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnkcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91064f6e75bso97225696d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371568; x=1789976368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KS9bOyoJ1mlSi0Y0TDim8EsqaDPD9SDEMcYeUOECgx4=;
        b=I1gFG0PQmnH2Qo8zPwkq+/A5w6DK7F2e+YM2zQEwUgpAmr6/x18ueUd0fz8z0+5zyC
         gKld+G6BXF04imBFrfqN0LjwYr+nElcttmsElNyEu8MGmybwTl1vtCDT3P5gUR0DmJz6
         Qm9r0e/DM+vIzCpf4QGy7FelgSShGGZp/A7uvctMBtgCaT9kuf22wQ6gzkh0A9kICMBO
         12tCrnRaEsC9+sczFLdbkrEB1MZYlcAZcIOO9E/pT0LaDTxb2570leWL8sR6HV0x099G
         QeOqtdO3sF9AI7kIorTzG+s65gr1kkrswtwLZvRVP5mgwv3cWXJmM4IX8tg/QjEXMmSb
         G1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371568; x=1789976368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KS9bOyoJ1mlSi0Y0TDim8EsqaDPD9SDEMcYeUOECgx4=;
        b=AmbZe+tH2WVeF7vBQkNOCJKrKh7txUOmGTGcQ36FgxKLkckE/OGYaHPHSg+ArhgbDM
         Ynp6fkjIsYC+NX1Ota0gH79qwdOZd94I++Uzh9IW9Ai7SesrXg/sXBfPUfDwNxSlRXTI
         8NIwbwkQgwY1gHYpxz6zkS7o+doddBPdCrEZbUg/JtXm2g3MlCvowWm8SuUEq11gVgbA
         Uiy5rW+6Eh15pA0OrxgQtQ8RfN4dxNb6kNQsCCuJsPT0mwlSNS9InTRJK0JluURO9yPR
         cflhISj33i9i649ha05rM5J4LTRipr50++S3doPrlvB50bmPHsQLHaELpfsucswu/L39
         JebQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPPz0EkqwPFpbB80XPeoE0g4DzsplbPTqaOaGAcovHNC9n7s2GMGT4Gepz7zV5C+wBMRtKWAGwtzdczbE=@vger.kernel.org
X-Gm-Message-State: AFuF++nqStkVq2JNZg4RsgXhGY7wkIamv8rqql1Rk4VjqxVpnLayxD+p
	hTWyRTX31Agl6A9U5MCuMNQ8tJzpJNGyhyPz3T8/m3wUJuwVFqdwKTbNAP/s4j4G7wyFgh/Bdbg
	aYG4oL/n2uafkovSiNAyh9r/rKa3vstlJRM+h6LeUWUMM3cwetZm8hpgaKGEEOm4CjvY=
X-Gm-Gg: AYBFou2AMpjDNiFKm8bRk6RGlRDGTj0YuQQixRSWPvWfaeej/w/hLvvIxcMWLBRxop4
	ORtuMeKWnfZceyBWv6t+3mOFBEsOeXk2I3Rd0Q4PKJu1R+jEB+p1CpdLyEhlnHb7ylkhGHo09w8
	rfVxoV9rib46KTOBFBupN6GBzfglzdb+i5kygh5ASohRNGmm6vxRNv5ltizXl/9lxNfFCLq+ZNx
	yF0MV2JEDBa5b7a+qxVB7m0dmZOAN0aeDVj7fcKVia983CFxhn+p+o9DwjLnclm5jlYf2U6GyeT
	6RlC/fhz8PJrY8UjnZagtxXfldAnaeiwx/Y/U8YG1wzRWD2rJ31swKxa8AxumBzri8uq89LkrDH
	TH6prKcNk6m0l0WM=
X-Received: by 2002:a05:620a:4688:b0:939:707b:ec10 with SMTP id af79cd13be357-93a29c360f5mr175323585a.52.1789371568265;
        Mon, 14 Sep 2026 00:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4688:b0:939:707b:ec10 with SMTP id af79cd13be357-93a29c360f5mr175320485a.52.1789371567800;
        Mon, 14 Sep 2026 00:39:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm440910475e9.3.2026.09.14.00.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:39:26 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:39:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 14/31] arm64: dts: qcom: sm8250: Add domain idle state
 names
Message-ID: <evo5r4og575lxcct47sx2cjylkya3lbjoyqjhithqdhzimdljj@lhx6r2b4xs4d>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: gMD0icPmhXdlQIrR2IY7gJdM-j-ucOxW
X-Proofpoint-ORIG-GUID: gMD0icPmhXdlQIrR2IY7gJdM-j-ucOxW
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7a4b0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX+ZSBW4P2heX9
 q/uDlEVyxSrJwaI36lI7XbFbgQ6+r+Foeco9UiyyzQAsMp79U+kpeIHoNHLjDxqU9v7JEexjXbJ
 1tZEBF3+PBOmB8NKWqdaRfouKAXAyno=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX7hnn6k25pLuN
 mdLgjhPA6nERuKBaJjr73o7UN7pfK7j7STmne21H1DY/7tt3uTs5fNgx+C4mvDBjNWId3kovxHO
 2wT4oSDEvJft6emo77/WpenT6YKDaqEBytTbXnfJOu+NC/uIP/TndF/GEffYL7bkgRCZWsykDiT
 gETbep0DF3/U2dw8UNRLx7x+7XRug5l3NT5DGYjZkbSxOwWpvcwqEV3dJXDNu3s9XOnrE0Py8CD
 Rm2NgnwJbmDKyV6bAg9kHEAh3WFKbc+P+KpSrveOWT0Zl9xhdA07Q3DN0QegUtVpRSyGZw3hFUi
 jOQbNN5YhNhvHqZkYq7EGzSdp2NShlgk+W2FOx3twjj3UFiO0hxUe8p1WN+MO2c0K+ynGXwwrrK
 /qa30zIx3ylnkzTAxlmKQo6qQb0uo5Pe2Wnya3bU4bzoRw/ma0WnKZDckE+t8N1bgZfJFBV7tyi
 VYFM96WR7ml+zk6ZVdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:46, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
