Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DAC4A9D71
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052267; cv=none; b=vD33oMODuAWHdmtRCdzPYU8LuNGhWrikNN+aCwN2b2xxMOKqbA+d5qjmvYFaFsDI5IbbeTDuWkTRAW+c7WhQP1NrZO3eT9UG/eMP4lPgGbWXjr/GDq18GIb7Dl3qwIn/XbXvmK14y1Nqu2sPFVFpw5WCWAiZzsnS5PbgA5n75q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052267; c=relaxed/simple;
	bh=4IhL3hdVBjSkwp3tHpxBzbcp2btgjpd+4Rs/0dgsnqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKCgsjZRhsDqBObmX55B9rxHjoD2CcKtB7/BtEFjVa/kFTEM/4DRzi/z+WenONFNkLvkO2rSAyMonz6k6TRTNTmVnYR7adtVeMuiRUFGoY86RN0+34UKODU8e5n44FNOphbGtTc5jQNAwZaSTvuzJ7gH5sHTxkWLu6276/DYrxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BkQr52cx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1qCcfOR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkQr52cx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1qCcfOR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADqdsd1151122
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOhP1EfYDCuzBlcUHllLpwpuZOdXHfemEhFe64d3kp8=; b=BkQr52cxFxOmIl0l
	eIXTTquh8E+z8ly/+szilfdSN2nWqs8iM3k01OKp12aRSOL1rB6V487m+wJAF0b+
	A1GYbDkW1g4Fncy0HxL6Hs4R2Ybe7mrA7PHfZP2rGcdQ2UceFQdl72+F42C9SdLk
	m7d6eb1oSFcNskTjqzRuQtyRQ7BNmuItPyWxTuCjRsYTyLD+xcVETs3e5nhHDtek
	SfpdLKxfKf6Uy7qkDMAURQs/PyQ+uVRWkjfOOd4qIljGNsBZ6uuOWktCUAPZR2Zk
	u8+pWZWvroXkDjKXWnZqI7bzerA7OYIgUmgnkErWu5pfRPrt7WkDjBXXzDPgzlyP
	emCUxA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwts0d2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:57:44 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-48e5de5a23cso615186b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052264; x=1789657064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WOhP1EfYDCuzBlcUHllLpwpuZOdXHfemEhFe64d3kp8=;
        b=R1qCcfOR5Bwi9ra6gmYU7DhoIi+tXwmd9xJyXFx2P95BpKtSs08iq1PhFvYoabmYwN
         x/6ra/Zas4EZ8LxWb0FGtA4JJoCvh6/1QQqUKkWeCmdnznL+q3OgtXWCiQenJ+4EHILq
         lEVKcpfs3YwBl2hCa/Xu3ncRMcGXAByhn92BKVyu6MyJHdRWd7S/XDc36Ws9Eb6mUZAy
         5UD/3tAhOp7PHYl+ipMK6wiaxWxbjNmexupCXr05RxknN5aJt5UAATaxA5v/rJXsPzTq
         7lA9rx3p1q6QdgHw8pDJm0YQ31jEFOOxh4anhX+muPfM0fqwKuqSKDmLBediE1MbyxXJ
         6bHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052264; x=1789657064;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOhP1EfYDCuzBlcUHllLpwpuZOdXHfemEhFe64d3kp8=;
        b=M43MZG4WejyYyizWYYfROGKfQPtdEwGUrUC49SV4bEVTjOTANz+/uvBDi+Tzv2Q77j
         yTPWYPL4R6jUhEO5JQn+qTXC5Xo8hTPDB7M7t4Aw8KnHBmF6jSf/46uZ1DSEFAzoolwp
         Mm1qKTbXWyPEzOTDjh1Y5MS5KTdVsCXgCg55LSdm7slQD/KnlEB85xrDsLG4WoarTPvj
         QEC4l/CPB4mqnAgTUKlDw/e+oepKItMYkuhUgwbEmmLj7TymBlAigsLhEfpgfZ8NMxRM
         gKWCFz08CFMMSgw7i3JfqveQsUo//x9QCdNr8h+zjf1B3TPRO4s1Ms2DXugv37hhzKdt
         F+Dg==
X-Gm-Message-State: AFuF++mjWx0eK63Typg9stgxyIIlbUkl2A84fqUG2vf4ee72Fn+deQ/J
	GtF7BFDQnZCE3qL2rLXlv6UO+hxvGhbMp3J4xOHtpWwjk/lMhoz+i8SOYK8MtA2Svj/H3w3JLxc
	I73z3VSsXxgU8GJ0byUgB0jAlwwJkU7xrJYtXYNsxCPq699rpYyyHufZPdXQ2RwPbEVw=
X-Gm-Gg: AYBFou2lPB6m5dJQjcDEitbVI0HKgU9SsuKv9zrfLqxNJzZswYhqA2JKq0R88bpqePt
	lcw/iT+iTN1dqHNm6nLBn2BvvKpTa7qH+8db4deXA2sXPNArKWX9NYIqLl9WkIReRztdciY/sYZ
	lw7zTSIBggW1wF/C9RjSZClDowVGnRD3jiaBJL2YDKnytfyzlOQDhEVA3w5xcK6qRfHS3Xiqrnq
	1cRcyvXy2uXdtGQFyINGUkAYmGpU/ZZeK31cg7TdAhEYtsT4h4AUBgY3VfE1pyFd7QW/KLO01Dy
	puLZY03pM7n2X9JAFBxMZOnN4Gfm90/4CQEpt9ack2aNc30BnicQGkbh5HVYW9q8AI67oU71951
	psetC0HPd1wXjTC5Nan3OQtuZ2MLpBmymYbZMKkwDWwsiDBZmQdraUDY=
X-Received: by 2002:a05:6808:c008:20b0:4c1:dc01:f1ef with SMTP id 5614622812f47-4c1dc01f72fmr3827317b6e.15.1789052263948;
        Thu, 10 Sep 2026 07:57:43 -0700 (PDT)
X-Received: by 2002:a05:6808:c008:20b0:4c1:dc01:f1ef with SMTP id 5614622812f47-4c1dc01f72fmr3827287b6e.15.1789052263393;
        Thu, 10 Sep 2026 07:57:43 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971675f82sm17916653b6e.12.2026.09.10.07.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 07:57:42 -0700 (PDT)
Message-ID: <e2c332da-3fb8-47e2-bd59-b64a563f1236@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 07:57:40 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fixes tags need work in the ath tree
To: Mark Brown <broonie@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Ath10k List <ath10k@lists.infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <aqKuWv0oUjGHSMIV@sirena.org.uk>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqKuWv0oUjGHSMIV@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PIaaavqC c=1 sm=1 tr=0 ts=6aa2c568 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Bv2zyjIpLVm8bXmoBHAA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: BTu6JGQieeHfiKTSuj4bQfai5jAUo5s0
X-Proofpoint-ORIG-GUID: BTu6JGQieeHfiKTSuj4bQfai5jAUo5s0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX/O8GqlSl+k/b
 ye14WGwb5uxPuC5B8chgclBiizjjHDnMQyUQmPz+uEk4ZRv2M6OV9EXp6lt7fEimZehF+HAfhYZ
 MEM4f7b/iW/9dC5A971vVg0wMg7lMwc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfXxdpmzCSuIyyB
 BXVI9kKhic5hLCyun96flu2yKC4XdazrRs8uHkqU1ua0vQHOSsRCm2Qx9Nx6AohdE1p8lE/2e0a
 uo2gIjEO394n1QoW6MOL+J91BNmdjdKxARtQO7WH/JyBb01+k6EWY51M5U9z/wTlqorZw7iafJW
 t+jBYz4cz8YM5MKgEOUiuO61oQTDKw43vj5HSUbS6XiRFTQP5dyKrJaTD6DdvVPIR5fbg4tO6g3
 g1viOxOvespLaMrIcd/lrnagsyUYHEEydGc/zpa9Rw1jHTRy1FiXDVM5xD54tmiHF2dnCoWef96
 nwxbmorxzwuCtzxyA8v/uiuVvbhFoehjokB9WQgwEQflmhRdfbympguk68nuzfGB7b4XEnNOZ/1
 awjl1/TabkM9sb0ru2O77q9lNlR/HP5zVekMgwnqFjdq0TlRTUg+r5LH7NOQB0LD+1zFKL1XDWi
 meSIa09JlVwr/sxUsWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

On 9/10/2026 6:19 AM, Mark Brown wrote:
> In commit
> 
>   bea22601ee301 ("wifi: cfg80211: don't free driver-owned scan requests")
> 
> Fixes tag
> 
>   Fixes: 4a58e7c38443 ("cfg80211: don't 'leak' uncompleted scans")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

I inherited this from the wireless tree. the wireless tree rewrote history to
fix this and I've now synced the ath tree up with that rewritten history.

/jeff
