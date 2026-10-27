Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116725;
	b=dtdLvlqPMhLeVaXh8143W8kvfsoBIMd+HmT5IEe7o3HF4SuI6O8mjN+kGKR+BXRGUw1R
	 yD8o2O44kd+acA+4SX2sU3wE98i4JokxT3b2NGvLkhuYwKuAIesCQvzJrtPNjj8tFECwD
	 r9xA9O/s+9x+zQMTHfneNgsU0uPrUzOv2QElcDbL9pp70AF17S6QR+Eqrl/sFEYNmd7HD
	 lh1QfcHLceQ6eVzBdAvuwA8gC9Zm15wYaCV9xXT1DSyieO/vualr4iRW8vM9YQwsfkNYV
	 udUJiTp8YHLxf6QYBm+TTcUKmsptifpI+RfcM6D/CuH2vAR8Mn4yt4nFv2kYUH6b8Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116725;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/yIWyQunKXfcHJU/jPfgnmZ55cnAcfEQ8VE3Neqv5Hg=;
	b=4TzM3iPGeHzlELov94rM34M8mH9LoUyvz5lW/wOqp11hQoYLLtVePKYOPixbHjZWEnFd
	 wKknvqmlSN9sr4YdNuuDuuZlHCUNSde0X5LT99PBAkRxoG06YME5Ip+GuwKLkgAFQNbOq
	 AUgi7vBjUa+joe2ovygOYG4iJaBRFqTH34KVM1iYSjGN+srBc21S93weaRgwX14PrQ1b7
	 HenbnkCZGl7KQYyBcCzx9OWamAmEZmciJZc7EA9q20kPNJuJvY0YczNmfOUY0aFHJM1Mc
	 WsNor0E18Yb98tdOVk+uHCVG5TRTy6f8F+IpTb0+xADqwPLV7AGk3jHSEYWSvqRd5ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3XNotsa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VlRo3Mv7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573A4606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 573A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3XNotsa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VlRo3Mv7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL9t83153567
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yIWyQunKXfcHJU/jPfgnmZ55cnAcfEQ8VE3Neqv5Hg=; b=a3XNotsaUyDQL1uw
	78FVAxhd5m0hakz1Wei7MQIOYmtuzS4v6+sM7J8u9rVcruRD4ll1kS6BxVr9GV4N
	TBrLq/o6c+c7O33ZzjbNncQUxWLVHNRYEKRdnu8lGweLfRgxyBYwaD57lhQBAZj2
	9EDgkPk0TLEe5x64l3c/pUfJZ5weO3hsEUNW+uao3Yke9TuNj8ghSQQrSjbKxA5U
	KTRlOyPSJTOXiZ+L6SHH27V7i1Ngbm1T99UmAwmIs8VGQL9AB5Fza77GP8NoXzHJ
	bYNTog9hETuTSK3U9kw4h/wVVHV8zIs5PJeQk+VIXDAV8LxnEWxXBqLtr20UTsEc
	mYKZPw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw21yyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:58:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1cf1638fso83544137.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116723; x=1793721523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yIWyQunKXfcHJU/jPfgnmZ55cnAcfEQ8VE3Neqv5Hg=;
        b=VlRo3Mv7kWS+xyEHcRmMPGdoGkD9y1LpqXpQK/8+ElXWQ9d5RuAEE0u6LxxhxeyFD3
         Tk5Rvo0FmNgn2wha30jejM1C1rOsqckgdoFqh/KnodoYZMPrxTnZmTyVNziJyIQJphjU
         00pni65XEy1trAShZeyQbMs+baJve/3a4EMJYPg2/hKwt+t4fESoPZ8UOj55jTzHvadr
         4y4vKGAkFu2pNFluRAfDqavSPZlKrP2rTfgvSO7d23/1rFX/W4JsOwPAJEG63b8CzyAy
         Anw+rFZiz3pucipfEtL4DpWUE416+jfV0iTLreHoOrLyLPnLjmD2IxuBvECYRG2OkRDa
         ubSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116723; x=1793721523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yIWyQunKXfcHJU/jPfgnmZ55cnAcfEQ8VE3Neqv5Hg=;
        b=qteGXDFq/8MtHpcztuyaNINQP1AzgeMrOzofSFa1rAOCt4IvLmtFbon3pXx1Cd5SGw
         RGzVDI1gKsZTFg10WEpjsZBOVDFr0T95PqlXvzyR5a+WOsK3AN1QPmh1MPjJx6kcA+jb
         VWaxPEu60hLI4n855VxZ+/hCEDf7x0d0YPtZp/+x2VYioBVuaW7rhZqOoJOxsLRRUJc9
         Y6Qkeq6MooQ98zdDQbh5coy3f6VkH+4uAkvoASjwEkw7q2lW1oo4fzoDZhBCLpf+iRid
         geVVyQhMbVB30XenKzpdJHF344c1hBI/TISNtZOb+S9aIjsPI7A5npCv/+RrYHRgYf+i
         OnWQ==
X-Forwarded-Encrypted: i=1; AKwUvByz6tTRnfC9AdXs3vRSQspGo2zs0EwuioHTiHRVsquhpVqltk2iZ2XCkH9e1/WSLFx5PEpA8kmh01FHuD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8eYamutl0nC/M+0S+MoXMQLi+jbobD+Jz+8A9bSmn3p5O/ad/
	aNHdiQ0rJdGGx+aSDY+LcA+fLO4e37mxoMKypkQcZnjzqr81YFtxFpG3tQ+CjrZOImj076+PwDt
	MAaf6iOmzRVphbmTvsPaqHjZN88dXJVIKY9cnXS6uPFq2etlv/Ny5sBaSMDgIsg0v2eA=
X-Gm-Gg: AYBFou2j0GEw1gKcireG1kYzgkTCZTpu1x0h5/84fCTRpYtEtvqzoppATDguZJsqpc4
	kVfHbbPbimkyTCk/KAL3ZJ0hcC6GaqIs7vvJyO+Rex6+wL7nFKx6fqZEW4KkSaKj0gextB41aOh
	rgH383IGrgwoYOC0A3dRHl/ehM+VIwgeyWIENaGFfc1FYNpTz1Uoxh5PUv3txD5twfKH7Xzo2L6
	DnTNYL39ee9a809pTi1lZhB7kWNLVNFrPGmSVDuKfVOBxL+GQv0wiVtDoeuve6RxzFyDEd0U1ZT
	HQVq2tvBkA5kVNBWX10hDfSoVKpAtbtuTx49MVQefNBsLyDqmyckgTmuUv496CnWpwdq3lIfzcX
	LFJS3Z8pfBvBrRFih74C4ng==
X-Received: by 2002:a05:6102:8699:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ce5cc59d5emr3593368137.2.1793116722581;
        Tue, 27 Oct 2026 08:58:42 -0700 (PDT)
X-Received: by 2002:a05:6102:8699:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ce5cc59d5emr3593344137.2.1793116722060;
        Tue, 27 Oct 2026 08:58:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640f1b9sm227658a12.19.2026.10.27.08.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:58:41 -0700 (PDT)
Message-ID: <9a299c47-a92b-4086-8218-3f6a06a25460@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:58:38 +0100
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
Subject: Re: [PATCH v2 1/3] firmware: qcom: pas: Add optional video memory
 protection op
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
 <20261027-pas-video-v2-1-5b52bca5add6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-pas-video-v2-1-5b52bca5add6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX5Kcp2dJl4NU/
 ZqCLmXGiQ8yuuePnBplizNVh7fZojK8GrU9xv9F/jZySrowhSI28ZxOZ2s9d+J496EDtqVrGCTl
 5DlSSCENRwBq9KRciPDYbRZpSKNm68eBTPNBCvwpnrlFPSI6VWI9bT30o45j7OyeLB4re8EMwOq
 /81PYZ4ozzfSTVfO34j9sz69hj8in5Ela/yCdioZoc2xSQJH0Bnlv4qofJwlXWyX10Xgha35hJU
 kX/QXTESgh47J6WUVP1JXLBnsoXYYYJKDwavbX9FIRLZLunRp5lxacVbHnxXHruFxeAYu7YP7in
 nmsSC3TgNjH8b2nJUmGD3OLATKRqK8bOk7WoZwPnR8JAaSOugEdKz42SXSG6gFvihK9GUINEF4s
 a/5vi/IvYjNgUA9DgVi4Lp9e8rmIeHX/k/JmoSxnBFdT6k0tWNzrFV0FXYAt5pbg9E/fZVNHy2e
 WYRQzoZhParw7fcRzhQ==
X-Proofpoint-GUID: PpR-j0KzvABkQ_fhRc4OR57DnwK-AoI-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX/VPN1x2GGKIt
 dRBuG+e98bBDOZgj0IwUIzRhnS/Gj+ncSR/MfUh2rBGMnnJwJBpt7xyMtJprZhBz9ftgcWQvkTb
 Bl4hzDrMOH94QvjnPEMKw6Oy5+b8TWE=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0ca33 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FUnjqt_kGT4GknzHWowA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: PpR-j0KzvABkQ_fhRc4OR57DnwK-AoI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270063

On 10/27/26 1:39 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> qcom_scm_mem_protect_video_var() is only serviced by the SCM backend.
> Other PAS backends, e.g. OP-TEE, own secure memory protection and don't
> implement such a call.
> 
> Add an optional mem_protect_video_var() PAS op along with a generic
> qcom_pas_mem_protect_video_var() wrapper so that clients stay agnostic
> of the active backend. The SCM backend maps it to the existing SCM call
> while backends leaving it unset turn it into a no-op.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

I agree it's imperfect but it fits better

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
