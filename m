Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560485;
	b=qEf6qDizdxkF8FOSy8R3x655JOwhOYH6QjS79xpJW9ITInFA8NDSYBN6CMWSwdtogseg
	 cUg01+YD7R5n+9iQD/50hEJGN3/YtgtSteQtajnWcjwfXgNv4vr1LtORluo53DNTmr8vj
	 FF39hEGOTFr+tbtI5DnfVTqeNJmQUQIvvd2jpVvLUT6hczELaOjHMXsiS9JuvXNNLZWlF
	 52E0eRy/bu+xpSA3ra+tFHVNT+Wrnq/e/DJieqUqiyeaaBimJqz58Nda35hzP8X+11Pys
	 ZvSaZfcGqGuop9IXIJahgr0z8C+90VkYWIlwVuBrrdxM5chrtmymTMFp4WAg6Iym8hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560485;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=seAT7my4zBoNsyaBn1Kf6H9akZuh9OuzKaTISNXvFGo=;
	b=i5mcCh3K45RIXVun0IbqHwLm/Idk2MtOX+yUBSDyqhZf6OW31BQo8MvX/vU/0VX8f+XT
	 p4dNJ/RLkLXnAByHyv56ECb9Si+czTyUPC21nL5Inl7EPvQNrHyagrbAkjTtmhEpTOt+p
	 Cs/v5cPA3ZQ3XKBGJ+m+OW8KTP8skMVLSON8Ur4/Vnl1Te1yl/Xk89suzIXf2/7ISitYx
	 StvPd5RxBpiDDRRTQ2BPXx+HxUuRX1sNwpxW81rgzvVR9DY1Cns1h/LIlOfNwWNsgm3yN
	 e5pITMxicWV7srT60Yiu3n42NI4zCtYtkeIOk0wCW6V+psJUZJ9jgsqiabuuSLiO5PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjRxx2zz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKuxbRAb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B3B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B3B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjRxx2zz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKuxbRAb
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8UuXU2181309
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	seAT7my4zBoNsyaBn1Kf6H9akZuh9OuzKaTISNXvFGo=; b=GjRxx2zzEQLexuuo
	Z9nToIwO8/DYKT36+GMWBDteintULDGewNe8IqEmlsMehvxaZwIGxzHn1iuajpND
	9xKiws+LJqijJIUeve2odwNZmpfMiDp78qcd8DrI3Hxqn4+h52qBzqQg9SYvQMS/
	Dd2Ea4uaYoNtshrfTiwZnoKn0w1GWEiWL5xRZJRqyWsutn+R5NwJMkbLv3axYGov
	wkoRvhBzKhwjfzo1jXmNvKRgWUsHhdPMh/5Xw7B1T0rQQKqtQPxqpuq0xbQ7esH8
	SUAXadoHIJyWXNXYOwiK2X79TuH8f+xStWHQv6t8oJfaiqjRvr3ykALzpCcArEkg
	rFWFVw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6rm9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:01:24 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9992bd6a404so5773241.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794560483; x=1795165283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=seAT7my4zBoNsyaBn1Kf6H9akZuh9OuzKaTISNXvFGo=;
        b=cKuxbRAbERswdPDsFbst2tG78eVqmdvOcotqjkDQm0fhjgYBwSIJyWG6foI3BM3TnG
         P1eVR2OkZALmAmSuR7LYfbkEbfQVUyfu2OoT94w1WWbYHlgpyae0+zp7pE1G1RTHkqQS
         /ad5aGfPReFzrqq6TxJ2v1ulSSJFqFL/jbZO6LpAU6oHKnvpEKeOoOg02Iyw7m8mVwIo
         XF9f8oh6vIj0zYCWUrxrj2KwqtKvp7PwjWyE6oySqaUYhxUbw9+wzYeRrXFpSF+1Jual
         xRGVFwFHY6ePQBtFCjhSWc86mf7DMK9S4zQ4ZSXqRQlFQl3ui0LUusRIU+GxpokYrquZ
         so0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560483; x=1795165283;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=seAT7my4zBoNsyaBn1Kf6H9akZuh9OuzKaTISNXvFGo=;
        b=Rnv7KlQ0Ocpt3FUa2CJ+QQELtBOJB/AyGfKoro9ALIlwYvCDz8sCrbuc2H/N1Gd1ES
         FXIem7PTpHr++jsTGHmBw0aP8Xushf6zb8PjFxRASa5sTmiFLpNW27XIGVOXTL2co3eJ
         k5z574xF2NcnNUp6uZ4BewRl52EZbNnVQvoHpRrFEJ27WX383p1uLQedNYyvDhqSPvWL
         RIiLLNjzrICzSdqVYih5ObRRGbjulTpu2p9CbypKiNM4Sxe2SMXkemPUU6o3vomR+sS3
         7B3N5we/xWpwcQnIztkqVSqwtMgWSY1N7xxir2UCb5N+HrCLkZO3rWnAi1mJW477fcGm
         5uvg==
X-Forwarded-Encrypted: i=1; AL+hErEKeRJ2HKsZ5b3oNhKBodQc257MrNEh/bHpcYiSkYERvGctFyLQbmNG+QqbzEtcid/mixB2blPg0ruwCXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aYsBB1y2zwYDZkgDuz0hpmNmYcQbWArIJsFZa6PYFjw+Y5ByT
	p+ByZtbgiSppc2T45AHIxCdkGt8uB4IhR4oQ8QkefE3KWOYzAQmZzKnXMPQexU5nEy9D4+8QhRx
	aVaE/jYW1CoJJc/8OE3ZOjYiTyPoH+Vv5AYP6vdzWuVcJWIF9A/BHUXoPWjJjlvv7WX7/dBHYoE
	s=
X-Gm-Gg: AYBFou2QRaJbR08jzl949HRI4hYT1u4LUdjxE887HIvdg8xDkDtb/Q96TtFq7YbgxAi
	61fr78pMJc2z5O2b0IeWYj0qjN390BJ/93UmlF6S3XV7crILCAjBoGvSVsnOyS0efikMvtYj9+h
	qFyEso9fgv/4+Nk7Xfjdt/WhiEc4fAfhyOctXpAb1hOumM60cnhjzcKEydPtCVk57qn9ZUTqwTs
	13L2tYXA2dkFJbxegPFFv4ejlchRNKOGHGpOqgk/S+9iCZoSqXnAsBx/BnTSupZWBzE+tSsKIhe
	zTTD4VHqOHVVpx+YFAzKhbkmcl+vZBh7Oo9Y/QKlAMFDQ1JJX3Lw/wpiJt/lxjnnZnPfEj3asdV
	iACmJtdHJTSfc4D/W2mOJ79hB6EZzg+ymwZr1nr0ccS5FBwSZSCoOIGGRvY9lYg+FKmylpaM=
X-Received: by 2002:a05:6102:834d:20b0:7c3:99a3:314e with SMTP id ada2fe7eead31-7d64d120edfmr536443137.0.1794560483699;
        Fri, 13 Nov 2026 01:01:23 -0800 (PST)
X-Received: by 2002:a05:6102:834d:20b0:7c3:99a3:314e with SMTP id ada2fe7eead31-7d64d120edfmr536426137.0.1794560483235;
        Fri, 13 Nov 2026 01:01:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b5606sm698390a12.2.2026.11.13.01.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 01:01:22 -0800 (PST)
Message-ID: <79ac053a-3235-4da0-87da-ebd8da01e4a4@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:01:19 +0100
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
Subject: Re: [PATCH] soc: qcom: llcc-qcom: Reserve ISLAND1 ways on SM8750
To: yzddmr6@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfXyEUkqFGDLQov
 2GnfC7+IFe/CBcRX0ldgj0O1GY0VNy2EADpvzl7rzztJsd8oaJLJEjiyxflGaZiFdSEV2aTkJ7i
 Fk1w0QkKCFvIYzwoMw09d0s+yoY8Ja4A2NT7B7fKQbmQ3NKZDdufQmWhFUegik4FoAlo0OxljO8
 sxzcZnNhIxx86QOOBnOUEsN/j9af51Apr3OAoylU3UYfDY+/1M+biA1/IXgJTMEIQ6f9QYxst4x
 /JuVf2Xg4LtFch4pYTuzu0ijpx9OG1R3I1DVFev4TyAn0Lv/4XhEhbOQNjkkawAehF5G3ZYtANC
 XjHvid0E8Yk/ET6DEdhbLEDGi2NP/k7RluHk6Z5NyQ8DhYGqFrs2wgF90CfuXnGcqy7Opa+earQ
 zgxyu2rjjuEjVrhlRheTtQB9RzUOwj1vVpg3ID0vzveBUVD1lxgzuOrjePfGnLAJSgIKcg+0VvW
 lD+R0G5ah+0r6wrik2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX39Zs2L+zqgqj
 XPWeBb2Au8lxtsmKXYELjoUYdG5S10G4nD7eMMl8i7jXps41B/nP/ZPRizQnZ3jr3/ScaCaUoaf
 MBdLwBMznM1+R2Oc7l+fD8+rETys+ao=
X-Proofpoint-GUID: f_WZoMu3sVsM_sV12XLNSSJ4OZ9_1X8J
X-Proofpoint-ORIG-GUID: f_WZoMu3sVsM_sV12XLNSSJ4OZ9_1X8J
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af6d1e4 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=th7kVB1SI1JMAOI46x0A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035

On 11/11/26 8:21 AM, yzddMr6 via B4 Relay wrote:
> From: yzddMr6 <yzddmr6@gmail.com>
> 
> The SM8750 table gives the island slice (LLCC_ISLAND1, SCID 12) its way
> mask 0x7fffffff as bonus ways and reserves none. Bonus ways are only
> allocated when no other slice has reserved them, while reserved ways
> belong to the slice alone. The first posting of the SM8750 support [1]
> had these ways reserved, as the downstream table shipped for this SoC
> still has them (res_ways = 0x7fffffff, no bonus ways). They became bonus
> ways when v2 converted the table to designated initializers, and v3,
> which refreshed the table, kept them.

Turns out there's way more things wrong with this table. I'll send
a patch.

Konrad
