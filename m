Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016000;
	b=DS/MD/q67+bWcvT0J2mECHNRRFBRE3YWxlI6NsDZ/mItl0y1pfyr/B/+v2V/VGRttSpB
	 LDflHmsoy7YhkMr8zFkKNIX8eUe4e90UA41Ur9m8s/+akk7G758Wjna6HTGehPywfjHBy
	 HQ+s+cEhBrFLW5+gpO/eeaE+bT+AlnxL5fcnMH+v2h8Pm8H7xKY99NOmHmnn7cdQ3+QaA
	 7nu8KU9JaXuWZWrhMazNNvxmJKMqdYRWWBaL1wj8DrPXyImnUDV6+kJWma6WlP8pPkvEa
	 P149tVEh1kQh6B0DP9zIMGxv2U/cy9Yar0+++Bz/Zct0/16C0K5o2x4h8alwgtkwtqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016000;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rtWr3blELUAHMd45WIMqDWi1b0Xo+6vTP24A83n8W18=;
	b=hozkeiAEFMhY83MD10jaxfdVwdq9PhYwjOtQrwcVSOBn1UQdOE+Fq8r03dj846QDPXqu
	 dOHSCV/OCo1qrvfmula89mK8r9YpBe4R5dB/WKpR4Asp1hMcSozPE70u8/qpxJl+qb5n1
	 4kbB3qeK+XCCYarT1bU3KXW/0y3v94T9n+aGmKFhCRuoVK/I/zE8ttYnSmWk3lDH07YpQ
	 tiQTF75jsC5FFEfKOoUs23pvCklGLqALCgTstF6aRI/GvZ1ItUbE0a6dsB696R5mM7wV/
	 55AsZ8YvnSCMF/41kM6pByk3cvf05BQ5mffwFM/vhWvVOCg2tt8Bx+hpew8cAV43Fdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fu3kWOGP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUdgz9t4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EAB606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2EAB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fu3kWOGP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUdgz9t4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt4lH3633158
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rtWr3blELUAHMd45WIMqDWi1b0Xo+6vTP24A83n8W18=; b=fu3kWOGP4Y6+tgGV
	FGGexaLb2UWT9K/cdofXCsW2OUbBfzOiD3adU29s6Ci/Was7o3avONGS3ytVbR3L
	djyGG2ZI7saajUZWdtTHVksfEzvQFmgeaoAOIKITuq2I3NcBpqRYDaqyGQ3+S1Ed
	yVzs4FPv+HCMsWR4yjd4T8IRT28gZH6M3dOh6gcIwfK2inOpxwkbN4BbqERcpwdt
	7ygMzCQzov35pM8ceIuYK5k6Rg2Q4maDpR5M0gJGp3VabfGmbde7P9eAy2FPwStj
	2n/uL9ltB2ls5YSDcu4xn0pCT5nR9GvQuyiqmCz6tFuDnI6gEJdBx6jnLJz/TLpB
	jg1kjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf0cvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:59:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53568f05f8bso10100121cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015998; x=1793620798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rtWr3blELUAHMd45WIMqDWi1b0Xo+6vTP24A83n8W18=;
        b=TUdgz9t4Oei6GrVCCkpAU8y36xJW7Rwo1tV8bbR6t5Wz2VYAmdOoAo0tnEfkt0LHox
         rRYvaiZz5Qkp+aEf+S+bcW3Rde6FtOZYSQsaKp4hZXmzadeLde1VVvOcdFYVHjY4kHuJ
         g9elrcOOUC0Ul0aUv737ul7gAmT8gHUc/skqLVLItkxRb6Y2mSNgi+inbFL0DRK3alYj
         pEyMNRdSsd/B7Uy+JKdg9QuRKeo/JnpolTEMjRAvMyDXx9xLTNSME3pkbkbsGDSyNUrc
         vEco8GvUl9a4Cgmfg7yOvqLcqqh2XBpox2QjC+sdrY3URyRaC9TXj8i08wRp355poano
         bgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015998; x=1793620798;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtWr3blELUAHMd45WIMqDWi1b0Xo+6vTP24A83n8W18=;
        b=i6Q9AwLruUDsdMN67vSoqsQsLuEcZDk7EY1GDPyQbhz351NjETAG/kuPRsnbhN2XM+
         dTVMFrI+Z9Jy3cf+Y0v4dwcgFT8q78HpwfIeQFNULJP0ZY6w1O3IumQpHsCgoa4+2C5d
         fME+l9uyCIoyCtxOKs+ZTYOgqNkoVyxZnu7vhhhWUl66eKT+J0Qkdr6cLZlpPJ4YHcLu
         c+XZ/3OCCBiwdWuZXhj/WklqdOtPraZHACsHfLx0XG8p25K7XGu8qtpYefiGR2PrAH1n
         ILQbTsbpUP+Clx7zqE5OnvSvqVcTbMWm3rBp5O+z9a9+HS7Hd/BbDISSSeErut2ymjME
         vapA==
X-Forwarded-Encrypted: i=1; AKwUvBytK2UNdlDxMKp0d3ulS55ccS2en4luni5ExokGxFLWNCPGZQAzpMP0xhUaCe2MXyb3l16CgfR9Am1UGb4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIk5gzlqGYQ2ZecZdeulvh9wBB/SFacRWEX1ad2q/b+zEkpPa5F
	47Ls5e+QaKWfJ13IDyfJudp46mO1kw9T4tOE5OAR+tRZHkXRizizFa/8Ve8cpPTJR2uA8/MKouW
	JWmffHdZ8maY3YacThhwc6n0pGiATWniw0Gj/SYubUrjAeLDqdVLA/UIqsB2n1HmxANc=
X-Gm-Gg: AYBFou2adIwznMgqdnC+ulh7ybQhGLTd34yVl340LPgbrDtnofbr0qxVjoZeNwBzX2R
	gq1rVVY/JtEG8n6U3kbejelLNR8XR9GdIr9WkgRRwQqGruCFsQqfPM/nVpgSMYuhqmx3kZPeEmw
	tw5yXp4XJhY3HYCG9qvUN0RMIQKtFAx0oWrvZ511KJRGnLLsprdrXQ84aTVGPlJN/lf0q8/gULU
	Mf1xF4OkIXicfPx23cSpkQiaesVvL4onUtPiRdK8LdCa+CtxCjy4oJPx7Z9HNLbM3KAMwhLvIXS
	172rkqZC7oMpap2oOmJq4IXY5MtrstrRqmyKtLNvz5+NKI6cuXCsscYRFT7nbKwPWu9C4FqELDV
	HGktkrUA37yTcaD0B4f/vMw==
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr970544785a.0.1793015997999;
        Mon, 26 Oct 2026 04:59:57 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr970542285a.0.1793015997533;
        Mon, 26 Oct 2026 04:59:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445990d9bsm3592295a12.30.2026.10.26.04.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:59:56 -0700 (PDT)
Message-ID: <e6b62824-8022-42bd-95c1-60322675d54b@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:59:54 +0100
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
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: sc8280xp: Remove FastRPC compute
 CB9 entry
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-4-abhinav.parihar@oss.qualcomm.com>
 <f0bd8179-f211-4d2e-bb0f-a419744de2ea@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f0bd8179-f211-4d2e-bb0f-a419744de2ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX8oIvIK/Rpjo/
 S9YH60wL/NxGiqrKDH0mA/6Jmbifffl9wqZWwek4KStPMane4Pzet+vU1Zim/0YZXy4RxB9ho9T
 ytSP/B2PxhLvWblJqIDdI6l+8AqhLXI=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf40be cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y_fbMFyzX05j7FwaadAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: FqH52KxoeNL5a8drgUlDBNtRyEPU74e3
X-Proofpoint-ORIG-GUID: FqH52KxoeNL5a8drgUlDBNtRyEPU74e3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX0CjhC6EaIxab
 DQkX3p4wvgPSYSxSKjtj1vWBAAYbw4cogS5UvczpqpV5J3F5S3S4h0+3bQQPWBRd//UGRz4iLA5
 6tJMrVhszGNNRaAnOtYyThJ+EbJ712WJ9Fh55BuU/gRacd077rQI1jqyiNJ6ZfthLt72Dpi2C+0
 Ge6wajbBeJF8OGuK9DunbxkP0pDpNvsp0uSQ0e+rTjjUUWb+BM6uJNdFd5vgcVmxvcXzm5q8Jwy
 D2P9NjVacciQ2CQAWjGTcZB5fudRtmBSv8KXe/FnJI2ivL/T3kulgCJ5bOpmsjj/7GXzrZXKgm/
 zTvGDvP/YqQtvX8WSZz4LTluzCiqEgYVAeVti8M0ya/l7tJmGndBRBMeGhoSfS9v8491gQcmhJh
 pTBAh027+l4Jssr+syWUI8lFbdChYb4v18Z8ti8Le9OgsAZFGaIFuzPpgohBDKCB4oGjqoNm9Xl
 8WsGdRrC0GVC33sW+0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260047

On 10/26/26 12:59 PM, Konrad Dybcio wrote:
> On 10/23/26 11:03 AM, Abhinav Parihar wrote:
>> Remove the compute-cb@9 nodes from sc8280xp device tree to
>> prevent clients from selecting a secure context bank for normal FastRPC
>> workloads.
>>
>> Secure use case support is not currently implemented upstream.
>>
>> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Retracted - the doc says the secure cb is the one whose SID ends 
in 9 (and these should match the reg indices anyway so that needs
a separate fix)

Konrad
