Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866671;
	b=GdbtJAscqr3dYbZkr+OmHSqlLwGIufUrcJ5j+RehwjIj0XfiBxImIS8pm0WG6ATGdjiP
	 jo4d55MvAYav5K0+E/7fdtn6HWO1dYkkCzkOEQ6jfgUUnf0OLLDuJTxAUmdGipbxfVSwe
	 rBIgDJs4YXX69Az4haBS//rcDDuYqbclut+vVtlnLYgUNi4zIV0ZdF66Wb79RsaTuMduv
	 xMjIXncOHopQDRr/2o8li60r+fqxwnaPwjVu7waO+7uGcXwhUlfiw/Eo6Pp+53OGsOCiD
	 v7yA9NqPkv99ng+V0jkEdR1WvYvnkl4Nx8Od4731m+2arSkDH94f9NT2RaiE4ebH0ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RIDXH7P+jdTY9AZB5lDTIxU+JVMIyRXXtejliGs9E3E=;
	b=wjapelrmHs0bCzyNy/sJZoS2bZPwBYzJpLwiawH3QMwkqWS3vw9mTtEP58YhDC0JmlUg
	 tr/bQj4HWZKqWznRATT22+olGoYLgvouFzZ7MD/03YEPpaNCKJRkSm3JBILTKJX4B7ha6
	 6qAPk0YMi46VayzLvAdV9JuVPZbKWAf2a4aoU06pJyc070jJB2MAEvH50nzAc14pFH770
	 XQxZL9AFftoqFx9D1BzK/vuSzUgtq0+f+ykPhRki6XjnBH6kDm+vlZvf+Ox6RZaWLlkhG
	 xNFPxASYfmIbSOOqATRvY72HVzFV+uamZHEVU/+AyhLYSGMStVUsKqhBZn8bk95HmSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LV5rhpYz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EFvnwAPs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B514606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B514606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LV5rhpYz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EFvnwAPs
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UGnh4179315
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIDXH7P+jdTY9AZB5lDTIxU+JVMIyRXXtejliGs9E3E=; b=LV5rhpYz68Pukncc
	sucjCXNXBQlpVt+QyxUcq0H+iQ+bTO6rR7Ap37bSdyStHxGBrOwOI/DsFmvIlGb5
	wDEmtQEZEnKaiGP075HOPgj+2oKZRrNUIaA380zwuM86zO1L6DB4tvTNkjcffvMb
	uoyMxeki+M5kmlNoRoj2ftp/Mb0fV+lWs8wzWpHZ8/e8KUlxUJNK06NHCo1+Wvs1
	Am4yqLDAxOpB3rO89T0V4G3T1Nut5PzoxQEL5UlpOHx2i2oz4nG9A/X2nklGFpH/
	HEcr1ao7fFRYjkjcpUeZxH8tRKQZknveQ4TFrg5X+CKQa0WHr9YjHwrKGcb/qPM6
	a4fkFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn4m3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:17:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so36868685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866668; x=1794471468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIDXH7P+jdTY9AZB5lDTIxU+JVMIyRXXtejliGs9E3E=;
        b=EFvnwAPsOxqWB1bCixAbGQM0KxaG78+7mDA0JmRBgf2N4USYQJUgdDvtCu6SH1ulZ/
         woVWqrQcTB+y0Xmd/l6fO9bUwUhmtvKtPAzY4+ZVD0e0L0irXX/paSD8VCAKKmIGPitK
         HMaBsbdv+dxT/sehss9M7UTU3tEJ2OnHL5xtWz3h+Hwikjm42twBtPVbPy8OH4keKxnh
         pLxs2A95a3VhwYEoH4/jHL+D3L/LE/5hCkBmCief8PLKOyAM6G7NslGtESiGM8cWB6DC
         LNp73WIqMsdg+8JnD1n2xxM7p/bt7ivP5mRiuivgWRQIjGLgO/vaF5Fu+LLyQAwogCdC
         vFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866668; x=1794471468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIDXH7P+jdTY9AZB5lDTIxU+JVMIyRXXtejliGs9E3E=;
        b=HFvZYVUuV0dOQB7ROnrciIXvLkRq4MvjQ8bSo3CxXf247/zsYMUHlzKmvE1/7E0fjj
         pRnzB5lbjlSxSyrTVOifZJPyrp7PiFMOPfGUQhYfOZ5GGQByRYK4dtg1iRIee0P91eB9
         NyB2dB/WvhjEg62t1RcR6zqOCREoGZ8y8iLM2qMr2enavhmhYw7Y83zca7sBcnQtmDgv
         eOZ/K11k16jXJ0kzhumdAfka0AyoKtQrz7uGlYQzx3y+G+7qhSVkefyG8fzDLc42Sj1j
         tdysTM6WdekonMtuvgGhwYzdiBRzzKNo4fJw0icJeBwmAFQ6CJ9jFCU/iPaOt3+InY1J
         OGNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn01HAOhyZEls+ol1tnFNZmKs7QolI8YgwRWLHcJqBTDgp/2Tm8n0Kape1PWCEwmO2UVWYAh7id5fwEuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QG+zahxbHW4kHg/qLgNhZ4ZmFQPtIIRdbGIG/Jomxe9UWfb4Y
	hKiD8962Thw2cKPYDHVffVcq7yDI/eZ1hhCuW80OL8fbkR/tyV7UWY/D8YRqW3nT4I2NC5kyxGv
	viR1xK25VYMIR89jjpzA4H32z3HOKTcXVgW5zNaObsi2OGLG2+6H4rfGUJ+L7ktwJqMI=
X-Gm-Gg: AYBFou3249br/8rur+M5LN8sm1nlSW8WIzADPEu8+ernpl1m+8ttshIa0gUFd+foUUg
	x3tYzRPuYL/+x3CPYGbbL2FySxPKLxUac3JqR3nwfTW6rPeqqtYfz1pmb179oqntTzeUcykKR/F
	KI9zUos5rGjxBAQp53bTf6GG1TRwiYr4jzQ9RZy5CRntN+O+SUJjJ0GkppwuHbnxIc4lW8FRC9R
	JUchF8MU67dEx4KNrkZyDM6TOx0e0/jkarSCLh6mog5ZMM32EAtErDLm6Yg7eWcvl4H0i6xe8en
	tbbGGk9gX4ZxH0uSflP8lhUpHhZfKvl5E7vyeXCqxbO0eixxHBdx2oR2NoP3x/waD1sV6jfRIIj
	23ldCvI1tTOabPuHRdcg7EzoVumChbGJPfBUKbaHDn0JJVc1Ur4DikWbonuRvB8k8MhTH
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr2969118185a.4.1793866668249;
        Thu, 05 Nov 2026 00:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr2969116285a.4.1793866667807;
        Thu, 05 Nov 2026 00:17:47 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e14093bsm150254866b.11.2026.11.05.00.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:17:46 -0800 (PST)
Message-ID: <d4be1b6c-3380-4c04-a003-9c7923839ef7@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:17:44 +0100
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
Subject: Re: [PATCH v3] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with
 defaults
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX8WKgLfhIiDIl
 /YMBZ/Bovu1l3p/dNdhON8b0CkfIR7kJzoKy04FmOyUTpxBktHebnaoHYBvq4fsx9iub7ad4sXX
 F5GSAtUuke4AhZslwecWVb7leeCpZcnqvwNvJatZucmeOTwRk7OTEvDOSTezyz2/hu0qC6x015A
 DTfbLcnFEwbuT48zcZi/ADCZfmcZrIP7fipdjxRINiV3StM6ym0uYL7uWkTbMvj38Yn1id8C1Nq
 I7RnmIFO7CdAYEk+DhV/MvgDCFS//yupWhZqQTgQ5kB7cGY9zC3T/3LSfZJBtY1B40oUN3CWjVR
 91rSOvczwIsCTXAR7ms8Bz2s4JFHAEhzMYuHJmSSnzz6v1MRr21dbvn93I7FuHeeeb6o95P7ikg
 nhYZP0G4eLjDIY2nw6ivk1b/+Qop6ehgeGV+j8TiwHlDq4CQzcV3M+jPo46IM0i1bVkEYHj5FIB
 P9L3CdBeWTejOL2op/w==
X-Proofpoint-GUID: glFBk6N3AmVvsEDnX0Cw6hSX7cNmTIPG
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aec3bad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7rGjOUnHYHVD1fYbDD8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfXxwooYbIXimXU
 evaQNhTaDAupQEHV9ErqwlU1GDv0iNLbufW+P6nWglrfR8npsQQGrUOmBimIyXzn6IZLa02ZMNM
 HWeswnhs2KGN1/+roqZh3KmI+E9izgc=
X-Proofpoint-ORIG-GUID: glFBk6N3AmVvsEDnX0Cw6hSX7cNmTIPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 3:40 PM, Krzysztof Kozlowski wrote:
> Several Qualcomm SoC drivers have defaults, so their defconfig entries
> are redundant.  Keep the few options which choose specific choice
> different than the default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
