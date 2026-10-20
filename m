Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497709;
	b=WkkCwLcbi9bEta1iPEmAtyPrnK6/AjoIk2RtyZqAAHsgWpH5WH5GhvvTzXH1KUqMOS6u
	 3hjyDmdZ59SJipt38i1AjFEI3MpeCu1LtCbm+wjYiSkcg3zWjD0ABqd+3rFH/Y/Wj/5Hi
	 s/LWHm6FGNsZE+uDPrGVCoVj7BtGo9HqwR6UCECsUudNXXHGJVoWGitnfJhIemycVx2NW
	 asPDVeFLHbe21om6gwAdlnFCeHveZHrFH8NeBNzM4RuZewOe8h94RX0tCs4P9HTynJgVM
	 MCWU6QiatwTzUM4AoEDb6NTEmh/6kRc8Xbs6csLF0rHIEYIcNxfm3MHBBZ7bN3wg2ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=21bLR2JmXTDddOKLW1hcjZrQEwDB8KnFMAgwcI186gA=;
	b=K8xl8wbrDpVVDsfF6B836l2Et36wzBM1V+Jmp5l/gjRBtUkesuoLYyJ7txvmvC/FE1FB
	 3Rbz+B2jPquI9KS3fh4+X4DIfsyh/6tqilYvR5IMaGMIbE8FR49oGyK5yvYZSURnYWECU
	 TF+JQDq50N2QZxnrpeNHgzI9E6mvufsb2p7WSckVdXjjINiNfr2pHTMRJIIvn4VnIwOCp
	 q28pSEqiznJLKL/IeFPmHDFINlqMRu3SpQGHXQ7SV/VKoBgAS18miV+TMq2fxJmgWdvj+
	 aY5BXPMy/89oI2QZyehf5TxgmigCf9u0hkwI9z/OIwDdkKY0vJetXTglVkobe6RCMdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dKxBXOIN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q88+ZnaR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259F3606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 259F3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dKxBXOIN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q88+ZnaR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxabp927041
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21bLR2JmXTDddOKLW1hcjZrQEwDB8KnFMAgwcI186gA=; b=dKxBXOIN03woNdVS
	thwtuYdNCsc4hn3wnVlabqxaHdpgaqK7nE08iVjEja9F7EEAuMrEMiKLOzAo6G9u
	XSi8pdplwkzQQH9nTvfuSPpmdxJTGVX5Lwm6t0rs9hOGaP8eTExB0XFDrbjREgqU
	9D+pBdA/bw6Urk4adotjR78tUp0jbKuGlKxcbg4aNu9UxeH3q0kjhj6UUuB9mjlt
	DMyvtYDKd1EbIBhYr4cdzuvubU9Xb2dMf7/+PLjFMn//VX31oh0ecTLs5uZQSStx
	Y5cVU1VXznvA55Pmesj2GDI0X4HQzNlB9ORilDFEJrXP5RUPPh6vS+9x7566/KfV
	c01KyA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pabyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:01:48 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaabe26601so102620e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497707; x=1793102507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21bLR2JmXTDddOKLW1hcjZrQEwDB8KnFMAgwcI186gA=;
        b=Q88+ZnaR2wCichGcDdqeujCnBTtgWfL7c0AujMKNkHQOV3jjlW6zFe8xPTwjrLVdcq
         poZkNYnHg1prWqPkM4K/wc+/RM00Nhdyg86UEguZW6xiL/ZsHa02bNDXznMu1RW+EJFe
         hMaA5f5sMI94ubzfrgLMx/oVKluEy+Nz3S6XAIHU31D6t4KS03iH3xI7UabMApd6n7Jr
         wTDL412nMz69OlEfkh8Kl2Tz6OnYGTn7hKfOZA4prZZvAtUqfTLKwxCwWaPKt6skk6Oy
         9kNNZYX/ES/sh2DKlRL3FC++4wpFqqKlsfah5Lq+28+sojKYw6xitGH66gkf6oCxvVhz
         KpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497707; x=1793102507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21bLR2JmXTDddOKLW1hcjZrQEwDB8KnFMAgwcI186gA=;
        b=iTrpZiezHCTRSve5fzeExsoA0Tef97vctRZA6zaWmnk8ZLevmgHDm9jcqynwXQDAjO
         2dCg7D2m7jHfECDyXpo/h8NbxxA1tmbkn7HePHuC/qybjNbJYH9Vo5MLWmr8OyvHPFPt
         n6uVflPIVuoDA0CTEvU7KT8RM8X7Bc93TlPwiHxUwed8uEJ2KynueUSD+oWBs0Y5NzdN
         VNYcAW3FwH8gNbQfwRmx7Xr7R0oKBOX0ESLxdV33iFleA5ZYSvWGy5f2lqHe5N81gB4Z
         oHGh3yAI735kSF0DVYs98RCfmKhdNjEfwygyA+1k44M9dUfjJuOa0hHrJDMbsuNzxLMQ
         GjEA==
X-Forwarded-Encrypted: i=1; AKwUvBzUUnmBnmEKc0+7w5DDFaGAi1ny6ytxlxenOwtZvyPBuvt8yGjsRzCFLtY2BIsoAFkQohAbY7G4F86gido=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq3d7E9d8HX6RGCH1ozhaH8ii6+ku6MtEKTsFVJtE/BKEAm4dq
	EwavRDmrJ9QYBzEnFgmmWNGUky8CPhqufijrv/6a02UvxXT5pm/5IUBnZ5K0m4vp4mTF2VZTvFK
	sdOyQ2r3mwVHJGn0xx1ykP7oI7x3RmtJ8ChTtpCut78s3hT9IbR1JguamO4xFjd3iwsUMqzR8cl
	A=
X-Gm-Gg: AYBFou0y9vmF7GcBu/AboDwep34aomTdRVvbofUbTzMbpNNVp2yPoCW7A1p/BFgvIfv
	SeVRRFtO5RdUXCWRbuJJGBjqM5se8fPpghQqa7oq+/8VbvO8FtiB4TYDH28e5v+7sOzzL9mtUMr
	aGwixCozvITCDd1yE9P27xJXNvU2NNkyeH/r92v8005TAzRxEPd1G9Izm8QoILFPZKuiUagvH8D
	uyNYZBFw2x1ibuvHYlxGsOPVJn+QqGFqKSBf/i/rEzGUEuIrjDtPLAsGudVY2h2RnT7NgHGv3TI
	VYTJyixa8+64RvMCc6ORWbJCc0olKHMkVzGxnaUVLrbMdMyWGS0uduoYUy8kJrE09cxoKBOsjOx
	r1D0hm82Dgo9GyDIq0tZI4g==
X-Received: by 2002:a05:6122:4989:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5eaaa107d54mr1758249e0c.2.1792497707481;
        Tue, 20 Oct 2026 05:01:47 -0700 (PDT)
X-Received: by 2002:a05:6122:4989:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5eaaa107d54mr1758133e0c.2.1792497705320;
        Tue, 20 Oct 2026 05:01:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32876asm481579566b.10.2026.10.20.05.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:01:44 -0700 (PDT)
Message-ID: <268aff60-c78f-4804-8125-c8a6aa10ed6f@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:01:42 +0200
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
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: Introduce lemans-embedded.dtsi
 as a placeholder
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B6lXYxKSmiE9lWHSvy5OxkLJi-f7p-hy
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad7582c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uVEy52KOV2DfC4Ai_b8A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX7NrW+ZdbtTT6
 T3eXTy6x+gk8+oFHc0r5A2TyWDePSNzCdOC5bWv9dXmN1zMCotLWfvwYbpXLFouxUdDUsn+LpAF
 MII4ZjORBNthHIQ/AlFGEyvrzSYsG5Rtpczol4UMKfuGhSXBrsTS5dKJxefvjMgDW2macSmtIHU
 niS6maJquj1paLIpKILOjfA3yo6d4UigYSeC9t87WX5OB/Bzs5uZ+phYk3S8mj4nI6kaUOiXSM2
 Fqx7uipWOR7CIafY9/ZNp8G5pbOkoOLmbXNICJmrVUlerYv7G6tCjtMMro0+7JWoXUyKshIcoux
 0QjlQGpTSjHMzvjmKrr2JMMhNbA5lQgN1+AncAhvA5xqRIFViGdx3OQEyxtTqRK3gtdd2HX4757
 OKlAnBb7ReUNUgjbMg25sdNobha+q25Jspm+8BXmwaJ3Gp5NHPUja3ixjL+xHdzumeNI0quyUpn
 H6uNh624Vejvjqsfhdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX06Fd4L+PmQBt
 QuMoGr4VJMcAVuR3OjXdo68WxASXSUBqLVno47l28nCPYMuYWidE9BwuE8zXJnyll3+sGX4WIRb
 HwkSrYAhNPBYlbI04UIwlzqGRR4nOCw=
X-Proofpoint-ORIG-GUID: B6lXYxKSmiE9lWHSvy5OxkLJi-f7p-hy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 10/15/26 4:37 AM, Shawn Guo wrote:
> Lemans is a Qualcomm SoC family that includes not only the Embedded
> variant (IQ9/SA8775P) where platform resources are managed by HLOS, but
> also the GearVM variant (SA8255P) where resources are managed by a VM
> as SCMI server. The current lemans.dtsi covers the former variant only.
> Introduce lemans-embedded.dtsi as a placeholder for now, while later
> changes will move Embedded variant settings in there and introduce
> GearVM variant support.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
