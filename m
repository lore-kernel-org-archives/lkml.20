Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557443;
	b=kkxAUceNSqiB4JxO3D1CeT291MtDdDltv4oaW6rVBjDk+Dz2JymwfuveQSJX1Is7xSCZ
	 CfO4vt735r85zRriJeizibWJgmwz0S8oCnDwAgwC+7OlvTBLZC+3rrnxNtKYc4eRBxPGL
	 r28cPyYKHTBbK7S1kvHUXaOyO7ZjHEDlN6Ex1ggV4r33pG1fr7xzD82uLjzs/FoOJ8Lbj
	 n1apY1tiz+m83j93jiEOntlnGQlCHMoejl86jxJe51ZkWC8a2StQSg4i7wfZDn00PmRYs
	 lvzVf1cIWwqJVZDhsegz/K58zzKtqh6Hr+dtP6WMHDkQjhyNswh/igYsJT9F0GoHyOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557443;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cdmuJnK594mGt7qJOAjhPXWv0xcPN6ntcaBG9hm3W/I=;
	b=i+Obz3pG1WgqcG1tkJ+iSwWaFkYgYCDj26oV2Iz4YgIl0cGWe7PPhE+4bIs0KI+2pnmL
	 plNcK1cR6DTD9q96WegNCaoFh0Fn/4s/csSjfsQy4agZicB1yt7atpwlVZHThz64Q4GGM
	 uvrsRT3W8m5RW0EU+L8rs/SH1kzFuyw7zpT/HLlMd2X/e5gpb8opl5zC0jCabRiHky100
	 eMtvk4s6YGCD+ELNMnPVNZIBB/hrpAqLSdrT8Dr79NhQHkTi98KfjEHAm3y9EbVqu5dHT
	 +6Fe1RL5yT2DBEw5zQoen8i9QaDSrNOaQHbH0vJwq12OllckZ/TNcP3Zb+A9uD7rR2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=clF4GZTS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivA3h2yo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA9606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CA9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=clF4GZTS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivA3h2yo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD56wEM3717190
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cdmuJnK594mGt7qJOAjhPXWv0xcPN6ntcaBG9hm3W/I=; b=clF4GZTSQMnnnlHj
	rvaueyze+72YQs0su5P33jRNJaNbdBMJPymz3OMFesLqt4GddP6o7wyhaLG43wog
	h6hg2DA61yMeVm/+Ys2nqkZHilKvY4E3OyD1y74AcFI3e84YJ/ynvx3Foph6B6wX
	XvxhfhV/LS4otqw7WbWnsx7QCbr0OI29GhlFC+5XUnl/+e8QTDVskH/bxiSmlyek
	vMgw+1DKamWz6zmGXgtZ+ErL0iZ1K4FYbPZ5lPEo7ToanO+2veNf6rd93z5Klz2n
	AIdx7EoiEkBfsbctuxMuaewY6yXRunu4hk1PhmV400imBHRN4bw5MlhzD+J6IH5p
	IVC40g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhebd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:10:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso15801185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794557442; x=1795162242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdmuJnK594mGt7qJOAjhPXWv0xcPN6ntcaBG9hm3W/I=;
        b=ivA3h2yoWFp61R1pRhCJK4apnjEQz7JYN2n9Ui3cbXv8oC/r8JKcDsbs5ZajB5MtkR
         LiBDKrWyMqoPSuaz7y1gjJ2tqslFiZGuT6Erf50aAtWjjzgtRH5T/Yp/Qp1pcGuBWytP
         VcsNYcYlklR4OJY5jFvXij+bsn3bNXCFsvj7IfPbn8EmC4KISgwp1JmfuYssF0v4s3Eq
         t2js+rZbINspFmNJVQfwj8VOaXP5Vy7qnJ3oeGTlhXIsZX1GUYDoWsyB1JuW8MtQce0/
         jg4lyWLUfnuhbJCBlwWOHP0BTS4Ce3DfJIREIzLSXnFDg5c9IUC+I2QfiZ8tIbePu0E4
         Sssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557442; x=1795162242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdmuJnK594mGt7qJOAjhPXWv0xcPN6ntcaBG9hm3W/I=;
        b=2yZiA+s5O60mbZZCSf8wdB1A8Exm9ldVeZpqLzc9180gApbsc6ZSrXP75emJlMsrVP
         1OtQ2ckxXOJMVgtFogucKh/m7LAO6b448Hovcc0I/R0YSxz9+heqnTYpbL++DhGCTtwD
         Rr4Ei5Ztv0X1W2xMPI3FJWyaDI+BWZ0kqPbWuEkZm1snjhhe4Hp3LRo0PypidEsxt/5d
         dVr7+NHrX1t60AtpAXs4aQS7YpuBvJlr2GyUfIHfCA+StCJ0rNolLpUs52fhpz4CtB77
         sLVjEcAvb06me8U+/JitZVyAjZ9akakppy+kBvu+Y4l/z4CIycMhNINWTNip3smyM65s
         6GMg==
X-Forwarded-Encrypted: i=1; AL+hErGjPFJJVFPQa5oAqEFfa+r7lZYUOqrPrO1jvooc+qrqyv1VDGk+cmRHho1tJNBtlV33rQtWxPr19gIsJjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JpjjMTyblmVvtEu3EmXjOzNvZJhWcyvPoFmerBuWKmzkC38Yi
	crHRAuVCtzg3gq1lj+JVF2WbVWDsm8oGNQwmXdrApvWpKPjnL+Jr7+I5Der/tLaPqxmhPSeTrS+
	pprGxWFN1XumswudstNevnj59Zb34z9cXCBWFczU9pDAEU7btkFP/smz/yh6sj6KaGXg=
X-Gm-Gg: AYBFou1P0ljA52ksQzD2vuPCgKTBE8vNrRShK4TDdxDLDGSPxXcwb53eDO/9FVlARgU
	SODMY+pCA3nJcaMwqSo6RXd6+CENIRrvTDbhjNCm5r+GWgRUGV4eSsVW84O1hne94BgeQBtnV1l
	CJaXatYSLEprChOo7ExtOR7e7y83F/En2+VMB6bjxVXazhtXCTq/x7sbWw4q2SZijQlzHuN4cCO
	keMnFcj01curKg1mswHkrhEdKgafEgJ2TKnxaTrxJAlSrRNyk/+6EUeROS0/W5I2SBe7fqQn+nw
	NnNaZeY/cEDhhRog+PjKljihhbGw0Lco656QOIWirSMtfXTDcHWfENIRUjM5IK4ZdZIMk8mMPzT
	mCCly6MSr/T9PaoMV3bl73O4U0odwoaiAbVG+pv5d6vZ/a2cLOYOk4yPHnPNs+gD0p/ggnLE=
X-Received: by 2002:a05:620a:a901:b0:940:f21a:eb64 with SMTP id af79cd13be357-9494bbc9f5fmr311190585a.5.1794557441744;
        Fri, 13 Nov 2026 00:10:41 -0800 (PST)
X-Received: by 2002:a05:620a:a901:b0:940:f21a:eb64 with SMTP id af79cd13be357-9494bbc9f5fmr311188285a.5.1794557441277;
        Fri, 13 Nov 2026 00:10:41 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm665856a12.9.2026.11.13.00.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:10:40 -0800 (PST)
Message-ID: <49cb1c4f-b3ab-4eeb-a5ca-156174b47e3b@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:10:37 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
 <20261108-sxr2250p-socinfo-v1-1-06244862f5c6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261108-sxr2250p-socinfo-v1-1-06244862f5c6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fm7fuTyWZKl5oiltl-tdodJ46rqLnW_R
X-Proofpoint-ORIG-GUID: Fm7fuTyWZKl5oiltl-tdodJ46rqLnW_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX1Aql4hA64LsF
 90/iV9oHAvJOhJeYhP0CjQjV60dt4gDHdMCz1Bu80dZQHhlwwfJOeN5fL133Vf8/jQEWI9/KEhk
 A/gJPClyZsOY0YAQxawxRZyPPwLYHbFu0VIvyM6R7COso+cib43BVLKRkyjSumswevttMOKQoNq
 /S3q6mwTxvK274UsvUB3W+nrbDIfYaLoQHdHunc31+cGausm6lNjQz32kLXFM11VIVUP7MAabAQ
 Jkq54EkjoIGDP4yxBXQjIreTkfD8Ck4S9av6NWzcsPwhAXEao+Qzypu0H761W4WbpzFx2nYnwZ8
 MMSOi/ynb1d+NKGCfjppRv+yOtEKnRHrgBkFdMieC7Onn6xiOtVo3+JvzaKcmcCx/jPVjohZCJE
 WNsQqZU8177s5KJMzn9C89sdBwSTPgRrQqU+occrjFVadcppIX1kD4k+jWsJdT+RrRRjXkmnQw6
 idUwji7zrrDHdqav52w==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6c602 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4f6XPtioFS1sYp0_hX4A:9 a=QEXdDO2ut3YA:10
 a=V6H6X79w_kwA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX191W22hK7tt1
 R4+uQrlHetiSmoukkVps3xB/H5zwpYz05izSZppnMn+c4viLghfqjNG7HBHzBMvKgFu4N//Nj/h
 OXwFnSS/KDZwl5EgGjXQAysM6UXQOQs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130032

On 11/8/26 6:54 AM, Stanislav Aleksandrov wrote:
> Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
