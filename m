Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216143;
	b=s0L+G1fPzjljEjlwHR4/zbC3SDi73cU7zkMYpoUbG0C8jwnaPWbDMgf0Es19gO8s5qfG
	 lsoOz48rI3JtjPhjb6vrtKf4N2GlCybbd/xUitNMBgyIbT4YA2OemFZlBY+n2zWCpZpLO
	 lHxGaYXTvMnpA3+Aaz7yAZ1VShLD7a2FrqhzN4ENpqRKsweQpwqOUBtHfVsiwc6viNB8L
	 lt9S28+dwyzy8/EOcB1SX6+qL3xxLNvhE7/UTznCl0Vlj+Ek+bNsB2Mij7OZ+6vyw3ABh
	 NGaHcrSf4+uIdBTRybH51yno59oRgDE58l22zlxxrgf6SKk0SjNjigG1sp497YYX9pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4L+5bPXUhgaVbpYyQ6OhFwBVz50lkDszwNSO+8Wheng=;
	b=gF+805h8Uj62yE5603iAqeaPjTCYkV2Q1DQ3plqGbKBkc0X06a4dwAh7UzH9BEwbrRDY
	 itU7wwyIY+E8AYwa7IhohJ0BhDykWCbmSpNlnJyq9TQa5nuzps+7jRoPTbUiETRk/uy39
	 uRH2dLkEVFc/Eq085C5ZosLeHiTP0/dckm9bucXNrNnBvEEjgnUcFVHmNW7z6i6uRdsM6
	 gU3HhHoL5QYfbAX1Z+v1qcK9romMj7gZaLSQqMGUfKsO/B7UYXEoGZlvXABN5qySV/j4P
	 ra7s/07kS8+eGmHBGW1OC9672Dwf0LLodSFqKO39cYlhZpafuFYHGSvmDMqM2+WXt/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xhp4Uh8b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J650ASne;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1A4606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA1A4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xhp4Uh8b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J650ASne
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A0Qj3580985
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4L+5bPXUhgaVbpYyQ6OhFwBVz50lkDszwNSO+8Wheng=; b=Xhp4Uh8bdhrJRRQV
	uDXW/AmMWvmeOivl596b5kERmWL0fr2ULx3zuE/qKyLBYO9HPvq3q9fGk+iRiOnt
	V4GYv7E06E+n6/fw/j8qticBygQ3Gnu3/0iNqlLveYLDzDNtpxWX/S0jfWhfqZu4
	uGVHmEU1ykDuhMfjANf+rZsjsd9pCmkRoh63ZQVMSOn9pW7wMc1eYVMmrOxL2E7I
	UkzLo+yRvjDCjOSY6pOolDYv8LtXQQxFJf09biu6of3QFvPolBfUkE+nznD5krLd
	ZiOdhoHp2xTBNX3CENrgAy9yi5DxnuE1h18BQnWjaQDKpBXhcgO2x5ofPJCEyCPD
	PdmMaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735k08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:22:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9460411fce4so11086485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216141; x=1794820941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4L+5bPXUhgaVbpYyQ6OhFwBVz50lkDszwNSO+8Wheng=;
        b=J650ASneNQOMDbXZ0hPyzJzbBG53wuirbvlRYkLsqdehcE2jZ/H46CEvBesdJQ9PFo
         ghuRpZZDxQaTjm/rYzRbnpVn09yJ7bUqfY0/WdDFkymCjzrrAnj1GKUQ7dvKfHhzJnpV
         8Alm8rIrPaZMIWDrlNCuBaGxXyn5leIp7VVpFWg4qoybDiTw+wywhz5PN8Btdd4yKXmT
         W0RUbOIX/2yL0PuxkafjYwCdLdqLyq2CUCiXH1NTr7URcqP5+WdN0FPUQaklEPsLUZTm
         0YfYSAL2PpoFji5GB83velOl20VKue98C6IAU3TNo97/xfXRqisNe4pmxERa9AdVHwoE
         8KJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216141; x=1794820941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4L+5bPXUhgaVbpYyQ6OhFwBVz50lkDszwNSO+8Wheng=;
        b=DPIVr/x7QAQpk8vVU1RXsSJM27MWfiy1OFQbXmGOaxXDFXYn5w0JMb+SCsSoIsbdlW
         /m04TA0+s+Xmt5JKu5okQEuhgCkssOhXgvd7xZfGTCXDwbH1ILgBISfMlH5CMiH0Cbak
         EIlaPqBG2LgIqiCmJxhvzWKRnwkxe7JCUkNtJY45mA3ZDh17+OmeDvjQyUmHkCoGNZ5A
         kX+J78RsvK+0i/D+OENxTwFEqSB0tSrfb9iNVa0OtbJrSJoFc2yA2FIEqToUqe8RDQBU
         ZiwuTMeSqF+0reRJI7zMrTdsS4Ox7ELou0jbfKFF6wWeZPwz4I97ujof2jg+0l6Kfnb5
         cz6Q==
X-Forwarded-Encrypted: i=1; AL+hErEIbZlGx1IFV1yf+AMwixZKmRwZtX2pyS2JakaP27k27KHpPITSdb5rhJsVNeS0KPhxq9T67SkrtBCHZus=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tgYFj5P7lLP6fC0pADs+SNCIkbE3zg0ZUTIxgaZaaXfG20ZCR
	LrAJxpWWapW6AP8fejHd0CA2W9haS6XvKBozBRi3bH6TeBiLoy72O9kaXrXF0PVgSZjJyLsLRCV
	tW/LkmlFnhmQyOcH2kt20WFw6MVtDBrJnSPDa95XwL/fX3lQHFybmNvnqJgF+OZU0bcs=
X-Gm-Gg: AYBFou39/zsM45wspQ0OXPGkBrA8wIY4tA6O+kgP2jhohpKvSwLuzDyLpjIAz7qKj8b
	CYSK8U0R6MxWW5k0Q21tRe4e363ELFcjRaFy0m3yv2NTZaoEgfpsLZjNYmRVPnMOW2mkwv/OZSV
	KH0bXURKLmsc54WeGJQeYWroWU6PfnD6AhQ4sDcX1HcEUJDe+493gBZP2fQHEQaS2IleGFBpOJC
	nS9ZhZAHjWT4K0ZQ8ulUVJczMZ/k4yNyO2ehv0WghXm+JwRkUKs0j83tDnRROjQdfoWqJWibcmE
	9gUBW6GpZ+UDPdp39bR/nMvOWueu0JtpnN42drtV1sh0j2CbSjTiyw4ZU7gKxfvzVqKtKIxsyGQ
	k4EZzN+QDNYreqe5lS9PrY06qwU0hPdVeanVy4UVb7m5e86A2pVtciGVW4LzmiUb9ZeSUYQ==
X-Received: by 2002:a05:620a:a913:b0:93f:a34:d9fa with SMTP id af79cd13be357-947840f2208mr612806985a.1.1794216141063;
        Mon, 09 Nov 2026 01:22:21 -0800 (PST)
X-Received: by 2002:a05:620a:a913:b0:93f:a34:d9fa with SMTP id af79cd13be357-947840f2208mr612803685a.1.1794216140461;
        Mon, 09 Nov 2026 01:22:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474be5sm136556866b.37.2026.11.09.01.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:22:19 -0800 (PST)
Message-ID: <f32b7d48-62dd-48ad-81bc-9b0aff61b863@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:22:18 +0100
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
Subject: Re: [PATCH 1/2] mfd: qcom-pm8xxx: convert to subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
 <20261106-mfd-subsys-v1-1-1c3e755d37a6@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-mfd-subsys-v1-1-1c3e755d37a6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX6p6Cx4ioXWiB
 fiZ5ha6WcP+AbFZaeVaNHz6iQRV81MwoDDT4SLiJsDoPEwueUV3x5SPF1NURmLo5qM5aagGhNFv
 W87NfzAvpBa6ZbJIIyRD4x7uzXiON3Q5aUO5ls7/jr16ReJ4ASsJn7Vg1NhEnxqO/mU9RwvdQKg
 V8WEhLgbA9/yl89aqMggRbvFzJFowktkvLrlFPWNJeHRgMDmUV7x9FQHbh9NBDHm4zOoN0K8LwY
 wKABhRlmbV4Ig/ZRyy1DwwGoRnv+w00o1Y6C6AqJUc0M3XvaDjVNrrLA+Q1gUcB3+YeGltXuYRX
 2Q7ij2PUZcnJ2ZvVZFEGk/VjEok1blZdkxWZxQnUq2K7gba39Ux8t8CEDWbhFahCVC3Iip8mkEn
 ZDZodLBjgBsUDFGRWV0vhi0FbspjliKmZyVuHYPqhzNWrAeYfsEF81x9sqhM5lufRhs9uxCuPYY
 vzwNYyatez0gCsRQ4Sg==
X-Proofpoint-ORIG-GUID: RCYBdmW2A4iE3kK7BlFT3GGudu7xhmkZ
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af190ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=2mfksfQnj69i5T-jYpIA:9 a=QEXdDO2ut3YA:10
 a=tYq66TkwoL4A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX2XEqjukeUNsU
 YevdE62OGjaFIT+hVsqhi5SOGy8boWzv8bPsMCPteSFTcbBPeMDKpomwG78Do3l0Hvgp/kEp6NY
 cQIzoO3aB94e79OJ952VEAqFJPS2WgY=
X-Proofpoint-GUID: RCYBdmW2A4iE3kK7BlFT3GGudu7xhmkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 11/7/26 1:20 AM, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
