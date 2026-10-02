Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E1944C4E9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935358; cv=none; b=MD/BMoiXDW4yJOkqBRGSb0JHxFzI6niVg+EfASOeihWwSEg0RHKAxX9WxklnZrpxcfAYNOuaY3PqJ889spJ3uyAK8lk6tU5pEiJiPZ61bF/SqHIz9efk+zWZgGuogVpVRwQUqz66RqnXJBXPfwX9of8Gyr36NaegY7Z5Sx+4u4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935358; c=relaxed/simple;
	bh=yIDH2l7v7vson2N5Vi96ngQMczGbNHvdlvv9YzgYc+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLB1R8YHTxqHQeFCq3+VNEah/gY8FLjACS6GC53Jy+vM34MAz93tdWeaVDIeKivpEi6sQr5dS5CS544u6fd7VKfmyrPWN3UPcJRQMtjIEwce9PpacbjAdRKhabpAJNSxhMWNdKNKk0PXKADHp+V8zfRstFm6ktEMTZoIQos0zyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxocGDNN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bg5DpfAE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxocGDNN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bg5DpfAE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nZOW1190352
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 10:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Liz2cCmaLWhV5NPUrTvM1xU6DHZve8vqyeNzJz5JT8s=; b=HxocGDNNOaME5DOI
	m09VbKIVQvNABVnkEhTIqzQ8alIiFBUo+SBW6JH6qLNb80mBP6sXKrLAT9k8Jy9L
	PT6AHIP1D4LHZTGQHH6wL4LGWMhZvP9vO8xnEooO7VxXLElO27r9y9xJDN8a20Vz
	cczlDj8Mu4T/KKeotsw7tQzqZNtXCVEMFmMhe8UmQ++ttDlJaXez9Q9G56dWJ72W
	2aIOLFh6CK5SyhhYlc+KmuXalFVIkT/u4Rt7tADEZX0WQhgQfdZmX7c+xCia2F5n
	po6glUTCo9P2kaS2H/Frzm5Pog+vyCmUIMwAa4INgNL44YTguW94R2VOTjBCrNxJ
	XN/+aA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tjk5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:02:36 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988bc0ef0easo540636241.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790935355; x=1791540155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Liz2cCmaLWhV5NPUrTvM1xU6DHZve8vqyeNzJz5JT8s=;
        b=bg5DpfAEyBX0e5aRfJp9F+7mNmdDEQpvHSzvQPyBQCuL82N2Tf88Jl9SqIBmTjPm+4
         Cj8KtoygKviSs0KNQj2lwxPd0JhD6AejIrZfo+ZQlKYSgVco16Ug1OzpokaUqvc7gjcb
         sYtow9FI0dM3L4J3GEW3EjSL/E++3bS7+iCuCWMcqBxX9w4f7nIgx0sWEA/L0nAhchTZ
         W/cRQp1TlblL43Vx1ZzT+uWtKyLeP5TDNPbIAbgMxh4Hl5Q7Dh4EGeqAqiMxJDBeB8xU
         sg/2Y9e64rXvpEj/Sigq2d+fezQlSvTmQa5cn8lp91sInY/irwFHUfyIYmpSVx3Z9Eyn
         wWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935355; x=1791540155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Liz2cCmaLWhV5NPUrTvM1xU6DHZve8vqyeNzJz5JT8s=;
        b=rmtkbJT8NLC7DFOtfDm2L3RVkFoqyHmrHnxojnX1TKB1tqV/6WM4txjG0z7v7ZfiTf
         QmoBDpl021GrvyVnQUVj6bTk9lsptHzpEhxKCNwJw0twAONtBGTWrikDY7usCB/pTnyE
         9y2FbcYm22PO3BxmyuK3PTK8kHo0cNonmPYBOuPbuHr449RWmodug1eGDbOKbPiAEmhQ
         nOaKFlxOHvqRYkWDOk61waysCRfaOpdDyD6Cxr/WT4xwCnb50AJbLbwzHGjbYC+NE6iy
         papkvseuHhiHgRZh4DkrnPJcCrjHVihP8TqpgMWHUQUgar16hyZ3j+OE4p3Afv476mAd
         V12w==
X-Forwarded-Encrypted: i=1; AKwUvBwFT5xBRVo96ZS/XtJpQHGQzh2iD32Ci1iyctHqGVMt5PVloPpUo8V9zh4CdWeWwlC2kJlHbG886KDCyZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQnnUIUBF4A2jidrSF6IXtJ1L9r8/bZ9YdwVlshE/Vx9dlXRPK
	5O55SsWIIsyJgsufroDBOWYlkjuYbjHajpI3lRIKyADQusY4B3SNIRAB8d7md9dn16AHItmx6zK
	VSTe649pvewe8PA3HFtV+R9bDP9HJ3eH+BNXdQMchKIHNQTB/QNip2jgIS8aINIJO3qo=
X-Gm-Gg: AYBFou2NYsXPPUgZ29lSNB/jYML0EypFNNBQsUzG82ut+zFK1SGatuGXGEzwAvrWzoi
	xvNu7g/YuQMwQeLQsb7de+169oHVnxdmAuP1C9S2hb4ts7wU0Bj123h3XQJB3yN+vMVCgmQC2Ei
	Nm1K023QWcwlVoyNAbRkLIhAPUN50Qx8XB1fbXibiDRH7z8DjEAnU+Ou9yQodo1emFFCLoHO6IV
	ZQ+sxBYFghTfzYCqCoDgUtGNtcMmKVqt5SyfmDCAUZvYHM4g03X8Fdie6VZTQcOP9x7e7MNa4cN
	9YY1/cMOZbLO2fvj3E2HjAO7Std5qMgoVp8+jkb2eBr1f/6Luu1HXa0Ea5R8CdDXA5B/A0MBXPj
	2tA4m4IA10PDch26eF057ftdB5fwJoWt5UqkTXyJMvTKJiN4Yh0Sj3J7tDyanTw==
X-Received: by 2002:a05:6102:508f:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7c0f4a8430amr465770137.11.1790935355228;
        Fri, 02 Oct 2026 03:02:35 -0700 (PDT)
X-Received: by 2002:a05:6102:508f:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7c0f4a8430amr465759137.11.1790935354557;
        Fri, 02 Oct 2026 03:02:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38307190sm4255558f8f.45.2026.10.02.03.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:02:33 -0700 (PDT)
Message-ID: <4619ced8-b385-42e6-9c9e-0745a68c62c7@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 12:02:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] MIPS: GIC clocksource/irqchip improvements and
 fixes for multi-cluster systems
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Aleksandar Rikalo <arikalo@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
        Chao-ying Fu <cfu@wavecomp.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
        Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DPzpEKpbKdg62fZBjRH_hOGUbBV-b8fu
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abf813c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P-IC7800AAAA:8
 a=RSNH0M3Jrif6_pYBjZsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfXzEvu74IeG/Wf
 NlIgWuqOacBvHUNBjeGrho6BPECTqzWMb4HP3Ya5JGQsRYKgHI0OTM9Cv60wZTXVWbulx6Ugz9K
 0nb1YAyQFYVX2BTLDj3XfXHCzu8jhAX3+8e9eduk7xvYVvDp9Y3Dr1Q0GwcBowrFgrc6GOtkDfX
 ZyytQYJzP5ImUeaJHgL8CiEoj1+BYGyEJYO8O9OngQYo7apdqEczN4+JWw1nBn0zvglokS3JD0L
 G2B0RhgfcKW781Ct8SFrHtKljBssDGCAioxFNqrG8vx7NrhN2ywPJyeNHio//MTJlNMVjCF5Ltb
 S/1umy4Yvr1Dg1HPpVBM7MBCYLXF/jQuvMHAV3AZJgeeohRtPhE6tZOu3PFnkDOfe/Ptlq10Wsz
 YYPCvrrRsodwHaEH2ptQGcllOqP81JeHCUq/4PkkA8ljqugUBWXOI/bE8lEIYQkbwXkDAkS5u6W
 C5lNL5wbd3IFwOdXOCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX32Oifj9NgSQt
 VPJ69F2FI+xOacSqLAMjzDnwnFNYYho+w1MAO89XpREsQMp2ykLD3W0xkfhQuzhtfu6r1uwYdqR
 vxdSY2zhvbL7VHi4ObIxOCsUb7bQb+c=
X-Proofpoint-ORIG-GUID: DPzpEKpbKdg62fZBjRH_hOGUbBV-b8fu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020039

Hi,

On 9/29/26 14:14, Benoît Monin wrote:

[ ... ]

> Although I am posting this as a single series since the patches
> are all related to the GIC, the changes to the irqchip driver and
> to the clocksource driver are independent from each other and can be
> merged in different trees. I can split the series in two if it helps
> reviewing/merging.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
Applied, patch 4 & 5

Thanks


[ ... ]
