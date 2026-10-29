Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261194;
	b=sjRY8KJhEsxDoWeEvyDiENOnTYMclvSgpIVeMEjVpQnThIgSLIkCUCy9FhQ9jWNxwm/k
	 HQohagm/YnL4D72PGBpglmtbN3ZROrDrUmaoKD5vvkg1oiTNAfup6SsyKUaXwK6wbSKyB
	 eLKQRjgc/R+vkFG7uLoKvgoZY7hg0SWNEaGGPx0eeJA39c/eJGqNiecvxCFcNdtbokA8r
	 whiCmlULcXvV0Y2sjEnhtY1NyU8OTkK0fyagTfWgPOWhZG+UKoUET4nL6XGtkfTotk1O3
	 3s40FYtAorHKdiqjCtNf6qRzAWLCBsISNAcKVddLjaFAvsslujHvTneE9iS0r/Rk9Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=;
	b=w+DNaz8bxQyPO48XsDr8s5i2wvb/eaSbL6mX9aDKElzRYuYfzpJ/FNuLdZzvuMhwbobS
	 Jt/3r3b6VGQSKk7BGCywKmbFNYdICujHRjEOvwczcU6hymKpO1+sIz+w6qeOjV4PM8/L7
	 F0T7uqCC5iA1T0ITsDPjuh+qv+x3A5PEnTnz5ilSQZb0Z2AJy3wAg4T6GUb2F07hyaNfW
	 Db/4pGKM4t02M/0i7XnBTMZzVxh8x5ufZX7++QLE87jO/Jm6kjEFdRrSgL7ObIxdXBHJm
	 lpH2i6Z7cbrgcznR2vB2GPBo29xt0QK0n4txyDTip7pAgwKlRpedm4lXKUnfWK78W5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oHi105vQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QhDuiqLS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4B606A329
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC4B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oHi105vQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QhDuiqLS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gqv63294103
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=; b=oHi105vQq5+kupfu
	nkq7DiBxKhWo3JDmC2j8eL7/8U+tz4p8Zw9W+sxL0IuzjHJ/0jZaAfZnKFTQ+B/c
	mZFBVpuxaKh8LVZaKjauwNrJyHs1sZG/VactDeU+xFAytxJOAOc19F5Ey17V4psq
	NEdcnixVx3y+XrZOhZnb3WhEO++31f/W+7h8rty2tzbQFPFWIv2cQUbOf6XiPPia
	4fJjCIsHFx1lfPOqqcnaFEycKMMkr4cp3S8ZWuSXvvCg+Mm18UAqA6WAXcuPawUO
	F/CIry2q5OWq12oAS5gHui+W3WMTONQIIQ86q0krZ0dFRtcb13sFE2YBSvUmqR5D
	xF6dow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshrs30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:06:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so44548585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261192; x=1793865992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=;
        b=QhDuiqLSfXhXHNRwQhFoxjcmAPzJqb0vMmDNNFHdxCLXdJ4kR1mJi9roZo5ii1rJgh
         3rKAiCFZh8TVM/bID49J4pOLZCBjq/LvqxkThAS9/3el75Scc4TFtj1NdvKWoC0uJ1yv
         mkblcpoVwSs44fDG/6oBTGCnM0PnJ/N7AO52MowL0n6jeFQ1dD6LmuvXTZwMgM+SKVmq
         phvEmRHa0CqVKQIddING31lOy74Nr4jUckYNj0jhUqfRraF9ehCRAD8SRvKTvjr3KSa7
         h6WhrF06eq4JiAljJMC2pL4gj+AyOyBc0rcQ+uB2r1RGXYncsI1BYloOC8mNzqXA6Asf
         Aj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261192; x=1793865992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=;
        b=eRf6mO6aBqsVFTGChy807GKbO0qwEibrOC4KySGJB5MNg5cY1txQrXXk8i9j+I/Beb
         dsS8xQ//jloTGvhxG/MHQ+0Ns8pAyEnu+BDAxW9sxIMCI4RG58s/4kfKXz9pFMHye8tB
         AwzfsXC6eOdZYNTbJIChw8zewtzKuNVsR/HvuwuEasivhII6iFHyfKTGzv2TetHe155d
         W8MnAUDMbZnAnUKEWxNHQVoGiWIBYcLcXzyNH3z2X06f3LmaAvIOZMulvFaRUKGkVHoV
         eBCOurvehhCzeR2BHb8k4YNGGMh4JM7bNBnrYXOh7ILn6X3Cdqhx7KDxaDqI8aqQl/NZ
         R+5w==
X-Forwarded-Encrypted: i=1; AKwUvBxaJ08lyie/s1ZMMJm629H2H2355GEvOrcUtvVr/1zZy1/4UceNd39SyOTgWv73ZbcGkubDH+k7//iilgs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAQvgZ5RHcbeodYXcInyme3DzKMq+LYG3j/O0M1B9kj85NvyfO
	1yHSFYAFRrcVDdESk6XqY7Ezu/KMJ5QRLgbJOGBhgQpvrmcCexgPqM4HPdPqs5nnOv4fNKJ+CMe
	idh3C5DLODguIGiu+1Adt52RWG4jWOpXVlQKJq+TlAqV0s/73z8LLTqmf+cjQxSY0W3w=
X-Gm-Gg: AYBFou2FYyAOuohoRJZb/tbPtGrHCFMz1ZwPk7MxjBg/2XGvlaptG/+ImE0kXQncbo0
	qucmsXgjsbgLwiD4PXOUkUIex+tntfQf2nivtENDBv8/5PqhgZSDzNJNmiYMBA45g5Ddqc3JxX3
	mKnnF3TRG+OE4IV/XQv43deyAUedGSSvVvx4keWxqZonvqFy04JyllM6QznENkzXfz+MW2ypzuC
	Ae/oe8szKdhL57aAZjuzc4JMxVfuj9nv+u1sq26NmSG+Ldp5oCehCSG49PG4BWV09WYwRA7/md/
	jcfBU1wxXS/68h317wy0OUYsOznvDMwA+nkjqZN0jgEAv1gsuPnz4LZ2jmPMA26So8lNu4I1ScK
	YW77+vwWCLHuOTneqf+QmEHcP3eJA6JVaWWi7hTaYgs5cbGbfSNK+KzEu6hZOfmKlJKq/Az0=
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr784405785a.6.1793261192111;
        Thu, 29 Oct 2026 01:06:32 -0700 (PDT)
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr784402285a.6.1793261191683;
        Thu, 29 Oct 2026 01:06:31 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49644e029sm2428460a12.35.2026.10.29.01.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:06:30 -0700 (PDT)
Message-ID: <ca9f3883-247f-4cdd-a30d-847b0c3f5433@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:06:27 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7325-motorola-dubai: Add
 vibrator support
To: Gergo Koteles <soyer@irl.hu>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1793218514.git.soyer@irl.hu>
 <89f7e6e9988c8744be37093777b0bc065a0e2ab8.1793218514.git.soyer@irl.hu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <89f7e6e9988c8744be37093777b0bc065a0e2ab8.1793218514.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mNRmvdLJSx8M2idWaYT9LPK3Zme4zvPo
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae2fe88 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6KvQjkKwYJz4M-1xzI4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX0One1zQBAz9C
 SK9Bmb/Q9+9jWjY8XEvlcur6JtfYnAXQv9Hc/8/sED7MloqokWPFfhIshbDz6aCqv94cTuZ0CLK
 W1BaaQPlLgOtvc9I1ZxlH+QENi1mitI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX3mdvBcveA7Xn
 O4pHcPszXPfPaxLLNrlSK/6JFNZCPbNyBjuBxQFLcRtzHysd4zpjkBXnWYtNuheRZWfsHbllYOc
 vcNNFDVN0LZT201uhYROqaqSMt2jDXxsRK6HrphQ2LpBv+6IvO1Xf9GpOqPYvzevIK4Db4HuWZO
 17/cAHSQ2aNKaZ4ws17OpPWG/qh+jh4At6oAckuTJFGCgxn9UK+tOHAiJXlsXAMvnj0/EID13gr
 oJzqjlMW9vxhUd/mIdAGhy/0T7RQIRaQFwHPt2A2hF4PmCEm1qN7jeWnyK8bDoNqmR6VEpKSgNz
 ivH+0MDTGGXNPTIgwhY08c5NBSs5t8IRTwLjHDxIE03C7x+gpFygb44qgPh+kxyxFonWqvW2UW/
 jcSQAyrEoVreK8SIhPGmqb3FgaYQGKywtot+a5NUpb/odgvrlY8+EUQQPSnGwxcDPvtYCz8yrJr
 G+MKNKIotZKJwOi/E5w==
X-Proofpoint-ORIG-GUID: mNRmvdLJSx8M2idWaYT9LPK3Zme4zvPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290031

On 10/28/26 9:37 PM, Gergo Koteles wrote:
> Add the required node for haptic playback (Awinic AW86224).
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
> Changes in v2:
>  - rebased on mainline (Krzysztof)
>  - order by address (Konrad)
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
