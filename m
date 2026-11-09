Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234409;
	b=makM9FdGz48vBka/TAlLxVBb+zo1U3IyQXff/Nuu8oX7FLrKFA29LBdf/sdfTVytiKzo
	 rA5aTVZRQ/MoA/bjjrgzPezf7eurYS1l0I0evaR4XsSluTK0fJXdMgjOa5C26Qeldih54
	 8c+Dl3UkNET4BX9awCuaUmLtH6HxpOJaqnhjJqORRidkg1kVv7NdMoa76mJMaH0F7XODN
	 YBsC8T2hqv+c0nALh6Se3aifpjHHLH1XOArHWQqCu/sUq+VM7zalMhbS5v4Z4PN4t/qfs
	 iAGbDU8MH0TpFBh/jaXTA8oQOgoNYPhP9qw65QMkFCS3Kh71D8zoydDjd6W0/yAfb0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xH4GuIdgKEDoSqYRkyo/VjSwPcMicalP2XhqgL8SdTg=;
	b=Ju8SOqY+rjt1dRWOQSfEEkbW6OYCHUndS05vfZcs70JeO9Xyz+6lrBlQMixz5WhFwu+g
	 Ft6Ool20CjKZGVOR7/z3sjfNIGd1n8V40W65g0ErsdXCz0PHG+LtaXNyLzfmvrnLO7Q+/
	 /FQo2YC2UQMotjIkZmfVILnpvtmFomro8PYDj9XqheSYioICTAyljxvpYBtz8fGhujAfK
	 Z0guaYnm6jD3o8J9jSdP2hJAhE12wy4v9yRkUTlCbqNSGILcj7FyxSGkDDFKHM0ukeRRY
	 4hDhqzV6waZ5rqn0frXtb3Xk5+RQKRHglrQ7I+UAkUcgZi/w18ezNfbMIyvDIwdIVyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kD5iPYuP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BSX2MuBi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736D8606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 736D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kD5iPYuP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BSX2MuBi
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFNtO3589056
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xH4GuIdgKEDoSqYRkyo/VjSwPcMicalP2XhqgL8SdTg=; b=kD5iPYuPY2+z/u6Z
	vMILKDiQRWVJ6WKTsxgpUUZPgIgNSbbIXlhxpfXnQGZaxXN27K731zoYFhIAf0eX
	eYJnFS+TM7jgo/Y0brzTNIUP+omu3CLbc5dlrO6TvO5dURuToRLhXuZ8nVWR8zzX
	/gv06Dw3r8QLF4G5BwMrggJPE2n7mCzUKVlJPehSLpCs+ue+rwd96vznDXcJO7Yp
	2WbBvrZ9mkwFP5leXUy71qMGBN/7Y+qREZyibOXvQHUMcvYqlLstdtqeIkeMOzgY
	A3M3no9M+teXzTvXsFA4DOq3MIJgqpFTY8WeT9fAfUFC5yQXJxF+UXaie7dg4lQ8
	aSMeRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8k2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:26:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so7189885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234407; x=1794839207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xH4GuIdgKEDoSqYRkyo/VjSwPcMicalP2XhqgL8SdTg=;
        b=BSX2MuBibrH4jM+2CyradsJcro/vrW7PlaIskt1vgsU5rdhXVNZ5Xc36lcGIIbsfxG
         zu2cm/iGiF/rNZAkKsb5Mm8+sxP8Vp388bHGi0RA1WaBd0gEzHNCMdYb1SVgwZDKeevU
         QN0HNZ6L4W0i74ikg+YU228ViNymEs7WY+jjkoMJhWCQV6H+kGPHa4k3O6UtBjHywp2k
         cwueUHMzhJRMrk5SoT7GmgnDpcAlSpTMKILXXhhPUJ99ThlLHpVOYGn9ApM6i9N+3kC4
         dz7wdGOgOrHxHGtjwart1lgQXEgAi73mosoq3y4UPE0z/8LQaXN3mEh9RmPmZdx8wE4t
         G+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234407; x=1794839207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xH4GuIdgKEDoSqYRkyo/VjSwPcMicalP2XhqgL8SdTg=;
        b=YOmDI9ki3coXf+fsAJgS8RQ18e4I6QtqWyBpZupNWJaLRzkWD8T6gmNi+4zrBFNY9A
         H2r6MeWVnYAlMzR+U/tWMlgZmskWZfEJEvCcUsDR4Z/4IgFc2IC1iHNc9EQxojaK0AnO
         fIUFyYPsdVs+rJOnWDsX/SNtXzMOq1F2Kg19m6bSoaw/sUO+3rgb1VJIsNWBWZ1obRcQ
         S3LHEepgKCElOrzER3o4YJ28eDb4A54w+jjmx0euW8EUAQVe+12LmVLxOoGGaKZzg+d3
         cVC0hZNEATKlrKNn4vIGAP6Xg7I/8IRUSwPZzBDQL41xAiEb4fCPGGVp2lHvU0t2hLnJ
         Msxg==
X-Forwarded-Encrypted: i=1; AL+hErEQ7Tz9VeBHy2iwy7GSN5CyZt5P+VVuFbyQ3afYw0FMha4oqLqDoT6PCKYMxEbk99wFpvqYu75W4esvZ5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gFTwEShhPYwT1QWqmNwOlYFfTPaI/nCyeDgSHM1JLSqG3BfDX
	D0DJ9FkF4+3+Trt6t4E+lcIxuei8aoHELYtNDHkTQySxdL2+XumuL3ViEiahqEsGdId2EQbxdDX
	x210fwi2imleyFx3WmXBosuhBA/y4gzGPz/TRRaZYMZ6vKtHeJKDpC/K3uyIBusHSjrg=
X-Gm-Gg: AYBFou1/fUXqHveXPq5bBivwagYYCATqqMq+Srwt7WxpSouGMTcQAAcsBASqrMDMplU
	qNakqUedtwJH3O+egmEhQA0a8xWdBz6eUOsEjAK2AouxAdCND2lD/56D5u22uhiB8HOsPlbNAWZ
	BqZsw0cDEj6n9vMn40P7FUr8f8nk4c7Q/SMa5TnVuNRVm+CzaVqdxw7HcqobiivQNg8CfBt0GW6
	/IM5Jym7r+BiHGrCesITC7JfVQvQMR7aW+YVbY1OUlpdBLS4vU3yAvQdA+0U+pzZPGizWajOblZ
	DjEm34kxfweWerTRGa5C4CupdEMB9Qa3R53LUG1CZX7CbJRTmBc/RMHbBUvw4ga9dg4Q2NEfm60
	MtZKeOaTnBatPM4TMHhbtSI+5BjXwYwiHR6A1FUyDo5SpD8NfsfOr4DJVBh0Ivm54S6F+PQ==
X-Received: by 2002:a05:620a:a90d:b0:945:c5b3:6356 with SMTP id af79cd13be357-94784143254mr722571485a.2.1794234407345;
        Mon, 09 Nov 2026 06:26:47 -0800 (PST)
X-Received: by 2002:a05:620a:a90d:b0:945:c5b3:6356 with SMTP id af79cd13be357-94784143254mr722567785a.2.1794234406890;
        Mon, 09 Nov 2026 06:26:46 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea4165sm1604449a12.7.2026.11.09.06.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:26:46 -0800 (PST)
Message-ID: <15ec6068-4529-4354-94cb-eea82eda5806@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:26:43 +0100
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
Subject: Re: [PATCH] soundwire: qcom: enable CPU interrupts only for MMIO
 controllers
To: ivanverbovoy@gmail.com, Srinivas Kandagatla <srini@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -jwK3m2RshOiMDJ7N_Ev2iHRPbUTOEOn
X-Proofpoint-ORIG-GUID: -jwK3m2RshOiMDJ7N_Ev2iHRPbUTOEOn
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1d828 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=e7eVDJc1qFFcJhx190EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXwIFQCosKEu2N
 Kz4zNQlOC1kJzTJ4ode/76Hc8f4OK2CZfmi537i3GOIwSsgSTwCc7DOTWQOQbrFPQEoCuuv9Xvl
 tjQsFMbv0fMSFHp+aog398JAS8DfvQY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXy7LxCdGSZzTg
 9EBzuNAbnII6g1HxPZ1OdMNuVfrVUGfWY4NpS6U3m8VkXX1qRjNjd67O7c4geEcMzCCRNBBDKZC
 nD8B8hVR6YgX29jCmrXMaQYRWo3bRzwEHOHVjNy0mIA3sx5HyR1MUyk6VMErdMpqR8wVSz1xnNd
 wit2g2x6f2Cy8a3JP4nEbqpFWvEm3eSyKmVtIhby/qTT9THur/ZfDp0VixzXzBAUqEXkDRljKaG
 ExQRg0j2I5+nOUvjYzZnk7RqEp8viM8NJCPTCMcSY4h5YParXq7/5XL5R+CUOsKGfq0XALYLBYW
 bdxkRcEF9Q/4SGthlcr/aTYQRWV95AD79+JmBGf+pMtd7PQ2+dkAlShPnr/lwt+DhhxDKGRWGRv
 Wx0WQah/wv9E1dDMWo9yjictH4XshEJ9TmQI26NzuInZMTsrOYA7Xlnc1S24WO11Zm123KH6UP0
 wyhVzsyvniBxVg/DCqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090057

On 11/9/26 5:21 AM, Ivan Verbovoy via B4 Relay wrote:
> From: Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> Commit b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for
> Shikra") dropped the ctrl->mmio check around the CPU interrupt enable in
> qcom_swrm_init(), which its message does not mention. The enable has
> been written for MMIO controllers only since they were added in
> commit 82f5c70c2651 ("soundwire: qcom: add support for mmio soundwire
> master devices"); a controller inside a codec, reached over SLIMbus, was
> left alone.
> 
> On a Surface Duo (SM8150, a WCD9340 with one WSA8815 on its SoundWire)
> the amplifier no longer enumerates since: "SWR bus clsh detected" at
> boot, "link failed to connect" at each resume, and every stream fails
> with -110. With the check back it enumerates and plays again. Shikra's
> controller is MMIO and keeps the enable.
> 
> Fixes: b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for Shikra")
> Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
