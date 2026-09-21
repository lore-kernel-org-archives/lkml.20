Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BD34534A8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977863; cv=none; b=a3j7l6i1peraTOyHNuqC3KRICLV2/KBAIgSA3uD6Ts+YBiTkJ5DeASTNZA1wueR8r4QXwLwG/5VmxD95bAksb/4iVwo4qOOp3wpBQ8YEhBgQNGZFIoTFLTmDbkNwu2Mmf2SV6xWt8XGTn6Dd2w7WcdbAqNFLGTT5uS5ZW3wjMAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977863; c=relaxed/simple;
	bh=b/XfElmrg0PZz/9GmZOtZ6MsUFfU44t+Ljf1eSJeiyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A72O5sQMU3f6pKvuEfjsYVR0rrpGXv9xlHd9Z79BXjaJ013ntuDUqzHhnnr3XUQFoQCXb6eVzhGxGNwIJYMPrhT/zcUkVeQskSUvsGx2gpbnkkydIB3TzWRoL0IrFLPXx1Hi4cgM2mWDcAb59zUKs/LIcktcfavvs1NsI0fdpN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VB57gxky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fv67QSBM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VB57gxky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fv67QSBM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7A2s64143566
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pc/Gagg8gfQKPvLUu6IsK89H4wLrEEXFNiyIxsT21Qg=; b=VB57gxkyymWJ6a/n
	n7EOThVu6Z9wDailqRDUPT2W6NZdbGH+2A2pDAUx6HHcEevrB1hx9CRE9FcnC5ZH
	3eEYmpGAMgNrRPvD+Yg9/5KfmLLlCPrcIysg09CcMsFduPwQBLzj4h5RZx1SR9rT
	ZlY85en97ofEeZUxUVx25O3X7Zys1JN/rQVKGVsOzDbsrvyiJFnCPe0MItWah43Y
	acpjzdG1pxH7ZPtzPjFmBny7AqeSNIeq0iZmqqRJC/WVV7O4btGIUFRNNdzUdh38
	wc/BNtxyc5kSGfa1lF68iMTpuIFUgPUezdRCi/u21+aUdSs2SWGl0Prd8XTlfNX+
	IgLEug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq872f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:04:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9392788b3f8so81791885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789977859; x=1790582659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pc/Gagg8gfQKPvLUu6IsK89H4wLrEEXFNiyIxsT21Qg=;
        b=fv67QSBM99G26sRQU+4JBsr5YkbmVBYOj4CsGLJwR2W1o1n0bgOfg1FYmF7dqnqg5u
         AJFnZiLRxL4urEod2VZTQWRu3Zn/RP8WM1zgi83vp3BawdXHarHvlJ3kBHls3gPvV4gM
         xprfpCGNEa+RA/mm7iI/67WhIvBVH0EyihfkZ3VG0LyTTsnw5Oh6y3nbVKtvToIhJ1Li
         qL8Sc/vFipcxRYn3iIlfmtK0goiOadlRtP9+3xSI27oK7Aqi1V2d2yyqifJs1vlTeXZE
         o86OY0zewh4MWbYI21D7I3d/4+tl0QTOMO93isUEhWzZFitwTKIDjnI55gbx/zWaEW4g
         f/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977859; x=1790582659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pc/Gagg8gfQKPvLUu6IsK89H4wLrEEXFNiyIxsT21Qg=;
        b=L6A/Vf7LX8s4gDeuWNOiMgmc01q8g8S+FGuHsDZ03U44r6T+T0MVSzPIjrsDzPoJ+j
         MGaaWLwNJbm6Yf2mWzJfcEG0I1WiiuF8DCqssuO8eA3cPMV5Ih1wyLCdZV5rjP3o60H0
         /XBuMzF097pciUiNliTAB1RZpS7Qk1pMx32bGcHcL+7y0xzeP1UsD/azG99TXZlC9cu+
         8Jr7P3LzA9lF5ZqE8tXowT9oyr7JRRqnH6fXhvg0Qrhrd5E6+A03XeUZdHpKdzAh6nxg
         xvkdB2Kt6W7pjw7VIGnnSARTLWCyCuFMRVda+bJ8vcxg5gVE5NsMv90ZqY7pQQcG3Kjz
         E64Q==
X-Gm-Message-State: AFuF++lzoTchjTAJAy3xEjcUO7hklg8sfdMfuG85qfSFZ1foJDQLF9bs
	NdysTWtQwpZYLtd4MRk6NIkKRtAjWXtBpBUhSgkIKHEls1r1R02V/DBF2VEXNbBUVW3XYBolekU
	2z3y98/O7hRjG+JnYi5rPuWXcHA4FCPEwy84c3+xEkIGkF0KNH6k0xZqEiG0pGgHIlxE=
X-Gm-Gg: AYBFou26e7bWvmAdZpA24a8f9FTZCa6Lj5S/X5Kqyl4pfaC4Xtk9iY1RWbB5FxPU+zN
	qDe2ABsEd8S4SOIEAI5aFri4jJ9+W6ApjcJ9nKUZzddT6Sa1FBnqjTGtsaBxy8IS0oVHQm2a6oJ
	XYZdBXnV+mZxJfWuro/r0i17BPH79MUzoE/hLdSZqgK8oDOktTLAvQhksiVLU16CSDRmM8BVlsT
	kCAbRh9uk0x/pdXGDbwadhitehA9l6ue6h5Jq0SjcSIsJXCSChMXYiGsOMLqkN6JZFHp53R1bfi
	2zrd3EAJ+NZg1VHeBalzx6Px/sGT5VV0LfD+Zq0wxjsdAkTDo20ZZEKfXENAkgBDtu/pa8eCYXl
	xM7nioH8EBpoXumoR2bvO/w==
X-Received: by 2002:a05:620a:6499:b0:939:8bc:8826 with SMTP id af79cd13be357-93bf5568447mr909256285a.2.1789977858804;
        Mon, 21 Sep 2026 01:04:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6499:b0:939:8bc:8826 with SMTP id af79cd13be357-93bf5568447mr909254385a.2.1789977858424;
        Mon, 21 Sep 2026 01:04:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e11071sm3732647a12.23.2026.09.21.01.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:04:17 -0700 (PDT)
Message-ID: <27b70cf0-3c99-4e1f-b1ca-69a228f92e66@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:04:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-arm-msm@vger.kernel.org
References: <20260918141833.3023124-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918141833.3023124-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QezbbZ1Hd8zRCIlrQTT6NJGChDwdc_OF
X-Proofpoint-ORIG-GUID: QezbbZ1Hd8zRCIlrQTT6NJGChDwdc_OF
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab0e503 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=nSpsjYtsPra2AegJnUsA:9 a=QEXdDO2ut3YA:10
 a=3Sv76qktopEA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX8M3SayZqrM0M
 jWzt8EUHYcdqgtmq6YLDjGv6XNsl3dLl29JCUdPojAEGxumIUBavlB7/GTWRaaco9pqhnozZW+i
 YiP/2KxJCNoww7RayBMnJEwEfJ5U7REpEzJ7Ryo7FnPb5Yg6xZNrHHyq7549S93S8sJxdYJP/hD
 P8tNdu8Fm+peKjhVqi0oU7p4zj5oKSGSeAmEDxLU6YmMt/lhK8UyW2r+2OCZquRNROxL2s/68cb
 1Co6N85GyWF0Ldn/gyvvpGZ2NwqfJ5wYQ54wQyItBmLgk0PNztIpYGWmITRA8+86j7CrlodMVfW
 8nM36StL3LtNvhT+sGmRz3bBLvw5eVApeEwCqCMudDUUQaiTEYqX7OWrKtJUVmKJLdQDrv04Mwq
 YjsrmLaO/2BLVXJNkkx55C/w7cQ+n3K2uAp7oQYDvqMpymk6kQJAP0+itqbwCr0MTpNwikepo6n
 dUybutNhnL85m49ES3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX5T2pXQNAcLkd
 pn4dzdTaEJOTTn+0Y5Y8TfW0Fk9hUKyJN/5Ow1wfEdnDCgmSthbiM4KcbcdBVnNMOZdelVpWGYm
 7WLhdBsPqYwwAzTnCauZ57Cn635rsHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210115

On 9/18/26 4:18 PM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
