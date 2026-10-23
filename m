Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742474;
	b=a9drmDTbv2iBCBbgHbdnwKc+Io0xnEDv9qcais19AE1BJcHHGFNLbI0RX6D5HUaieVOv
	 P9q9F19qxmEUHuFP46cQ776hupBC1oyyzuv6pkBUK5e3T2R1/TBvBWwlU/0lTl7FBAtxV
	 u432bT8fC4IomMMwtznVPrz/MjjCeziyRQKZZNvUXyaIK0dq3VJ72Lyb2ZalJNeVUAjF+
	 StJApx5eUpFZi6ESSs2XE6T4AmsNqfJBZJI3F1399hSF0aNP9SltRwgYrikxoCPphODIw
	 uiG0in+Kmaqg9USWlYSvDpnsING2EiW6I8niV+CYXwHjkE8v54iYgEHnEvl8693pa3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742474;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0cN3k4wF6cr4qpY9bR3UfdZgQwjnA2qGOVu9nt6JWhU=;
	b=BLKLyLDKUVs7/cIDucFBIYCwe0vTvbrlKW8ePI4k9gPU1RM5EmSkyV0lI88CC+pjDSUp
	 3r870WR0agbdnjlEpxlBFW/wb/O4QxYs9yygfZEIK6tQATLQHpO30NEzFSlAmBQZDJTRT
	 fxyKv5NzxkU0f9zr9vJkMu46eeUV3jBZkL59qeEPq2PMcMHGU62HpFbg5+K32PX4HjW0H
	 246aVIl9+sBFXMmkcI4gA9rnsDwMQqb6SZHiVSTtw8/MGM1NiH7tcJ0bs9JrBf1OmbSCM
	 3UXMynpC7rCAGrhDNjvzl1SakJfh3jOygQzUAm3hRQkKNB+/xHUcrfYx3tMP9O5EuWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYsAMdE6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOZERwUK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE02606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE02606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYsAMdE6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOZERwUK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F5HO1200734
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cN3k4wF6cr4qpY9bR3UfdZgQwjnA2qGOVu9nt6JWhU=; b=QYsAMdE6mHAddRfH
	xBhiPupQif2snOY8TOWxIixUNAbk5JBRYUm2DGhNc75MbkVDT9vItva3t7UkgWIu
	JGzBL8+hXvL0M1rMy7dIQMAMO0xWKIAu83QSpGTnuW92XpWv0PxxnXRybEdGKOh+
	pTjeox8AAfWNSHDwiaRe5a432MHMYgOyoi0UNmR4Ywtdshghl9XA9fAKUz4zVeGp
	YrP0gLuOwhKlpFY0/u7g6nLgKjzBd2kW9SJNFnQzIpclx99PIVwWcTxQI6F69Jrd
	mC8PLp7yRI8mHqsnD3mBFcOrsjbTM836GGRDYXqDYXMFYk+Dh2QYPvNoz3SHi56L
	Ub1Exw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2kdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:01:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9906eae4fb4so5163241.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792742471; x=1793347271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cN3k4wF6cr4qpY9bR3UfdZgQwjnA2qGOVu9nt6JWhU=;
        b=XOZERwUK1syMHRqTsdbDhSPSNLwtjsmMKCpiyuQ22rV394dfShCp66AQbT3X2oPAES
         vnA8Vbo8yc4Aig3M0/eVR1ajV3oBj5lwyLW3Mu65REHUufgOAJelRvxa1wIY41n2gZdk
         GiZArAzZwloML5xoKWwYrvDzN2p0rS0CBafluBWwWECIGWMmQ3gF/pgvvaltqlJF/b8M
         VPV3hRP2xBysmmSq9UYdIpZFOJ+V7H0hfgSI1QGo9AJ2i0MeyINpQcjPUGnKAeUlZ2U0
         sSUmPQe4sOsjmun+ThSPOYfCiYW2OilLS4s8ATHsBGk7B8mRuNALqXje3LqcNLvSqqst
         B62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742471; x=1793347271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cN3k4wF6cr4qpY9bR3UfdZgQwjnA2qGOVu9nt6JWhU=;
        b=jMNgPSlpAhwCLE9m4MCSWcoEpx0aCyXEUoWn3Q5Hz6CV3ze6FEePyAh8DP8eufzwor
         +HcZdDamZelosA94/TmHH2DG1uRPsw56KCye04VBncHEGg6h3olVH0Og92Qr6eSmuEjP
         +iV0nPEDVk3ugJjb3dUI/hJisvEetRSTLea4+y9cT9rsq/ovBAhXXIlfvn9uvV6zsAET
         Zl4ZFLj3IjMxrCDLDGxrpxiTep9ZyHSHF3oW3DGTl+XuflaKBtUrqQ15qJElSGUtpaKa
         aPOR4jCbHXl9YKyeUPmcdyNBB9sYPrx5c4uEqnCvSBwYe3zC7snfeYcvkECRbKV8jndp
         SxSg==
X-Forwarded-Encrypted: i=1; AKwUvByFMaxOgGTR+ObSxYopgy8TBxOfoUBaS/Ir/y6fJ/gCfs4D46S22fRp8jzovx7fWZcqPi7qy6FJGcgkl30=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcUogeDiZQfOlroHLOoa9tdAeud3gYDK/CZN0EB1bdPpJLTJnQ
	w231X5NgzE2UWRo8Bh354P+JJS5+MTpZDVzGzXThbvxetshLT6QQyGe3EMohuuvX/1PdWQtFef0
	1tauQQPqrklNQ+tc/3azmoj8/Kr7knfKav40CzMlNIbDXj3BJ+DbTmc63AFXKXOi8/xI=
X-Gm-Gg: AYBFou3ghw07QosAWr2EXHcTIGkQVjajzllMnLw5VQUcTzF78UxK25KVphLaGVl4QaF
	bvHErDa++Bp7VX55y+FVmW+a3ksq1ynMXp9Imv7zn9vMuM8nIHzZSNEr/lvkz+Fka2meK1vyk0h
	23RNfVkh4jWaRLndwxhvOx+Rl748NUaHnplMOCG9vN5RyFli6+Pu2hUDrtFrKG7EiAnldXpVo0X
	BNgFKv9Fx+oDIZAf17U88fceK5bEmSDctM2WqC/M+fHEEc0EC0vW6v0Ga08TZHd0IrKY2Tr3GcF
	WT/Brek3i1W0zgvXYl7h2pXNx6wyegat8BSI2b2v8RE20JQskd/CEsw6HEvh70de+4jbxUYglZC
	fbVGVxHU+gsKRuHAY6+ZUJg==
X-Received: by 2002:a05:6102:6497:20b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7ccc3089a4dmr522693137.1.1792742471613;
        Fri, 23 Oct 2026 01:01:11 -0700 (PDT)
X-Received: by 2002:a05:6102:6497:20b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7ccc3089a4dmr522661137.1.1792742471072;
        Fri, 23 Oct 2026 01:01:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c848c3sm71563466b.38.2026.10.23.01.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:01:09 -0700 (PDT)
Message-ID: <5422680d-e642-4a85-9119-6a5ac5443d50@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:01:07 +0200
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
Subject: Re: [PATCH] usb: typec: mux: fsa4480: Keep the USB 2.0 switch on in
 DP-only modes
To: Joonhoe Kim <26rote@gmail.com>, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc: neil.armstrong@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022165143.1327-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022165143.1327-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX3hTnRvd1Bm7R
 r0YHhcOXz/Gje6AipCx3NXBnxryqDj+CsaIwb/LTBdyjVgcf7RHk4lLjgIQzNfk1gy4Qer5qQQD
 M/0Qt0CxI/2ELgnV33GKqdGQvix48O+m9KGJuQxb16uQylFcjB/BrmfOdp8xr8tW5SbbgPC+P2g
 IAyISR+vhdaQ4EIKweEVQRTB/9ieIYTrc6KROfnj657lhg0ttgxPA3LLKtT8yPgBiNERpZw2NDE
 6POdR0T+WC8HjQ2mSADyRjBWT5TPyn8NB+5MTlcxRdERTtSC+2AgKyDGP+EvsXlLIjFi3irzRrk
 yGqRRwppRKi1A+/V9E8x2DTIG8kyNIJFmeGhcwz5WSewTPd8G/eRBPgjUrUmzcz4xH6dzzcoNFu
 bqhCIdWrsJMxnWxIAbWuoyYHvzSaQRjAPAcEBJg2rRWJT8L+t3llzK6vnC6G54V02kpHwPKBxJF
 FPvPg/fRNNTIGkBgoAQ==
X-Proofpoint-GUID: l2Wh_4FbyAaa-R-PecoimofUfif642aj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX6hk2WxvDJ7m2
 z+Sf0VnTOhnnLBMR5kfjCEIZb04sPFHIjS4DYcJs3EvW9fXrkuXk73RO0FZgDHKwTRLJ5a6BIc5
 S8FODdZxSnQ2zKXBXKYitAW+1WeuA3I=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb1448 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=JsmhxD-A5SsRL_Tr:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=PfqxLEJM1DhM-lXbwakA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: l2Wh_4FbyAaa-R-PecoimofUfif642aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230031

On 10/22/26 6:51 PM, Joonhoe Kim wrote:
> DisplayPort pin assignments C and E give all four SuperSpeed lanes to
> DisplayPort, but the USB 2.0 D+/D- pair is not part of the pin
> assignment and stays available. The FSA4480 sits on that pair, and in
> these modes the driver turns its USB switch off, so a USB 2.0 hub or
> device behind a DisplayPort sink is disconnected as soon as the
> DisplayPort mode is set.
> 
> Configure the USB switch the same way in all DisplayPort modes.
> 
> Fixes: c7054c31c1c9 ("usb: typec: fsa4480: rework mux & switch setup to handle more states")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
