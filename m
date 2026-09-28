Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A1B4973B1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590518; cv=none; b=TEMYjylMAWXYuza3iBObxXYk1n4kTb7xO8S1bXRECBjiR8+Xrxq9nTYbcEcgB6YMMKiYhmEBJkGYr5LimHZvA7MfePwqiZTT/lbemzELgY5ep6RkWyeFTejPM2Xu8XYjX/+C6DLgUYSNRgKaT/EBrj67YhCaXrbCTAgg0+6qQJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590518; c=relaxed/simple;
	bh=P8rn0BUhNfKwZqKmW4/hpAJE5w9zl18XHq4N7okoxWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0IciKiKcDPu8V9NBdY5zf+OOSAUdiKsy8KCx4SjB7FWFUVVMlRtzhsRxdJE2iaeIegJ8Ciw3zH352GCgN7P0ch+poZTltjthKiCfBHaY2OzLJcTz0SgF0jMe3jbDvKmmR82lVLfuDWDqX1bvK2hcQV7rLwNqjZNTrzJIq+p1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtcqSAYO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbeFlQ3v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtcqSAYO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbeFlQ3v"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MAqv246128
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5uy429fJlY5ihYQtjqpiBMkvSzL/TMOUrN8aeSIFD4=; b=DtcqSAYO3CP5a7mW
	JkoGNLw4PhuNZizdfqMqC1gqecFuy/bc5A6HYPeXPEbf4N46AW+g3iK0Zhl3rOix
	FdhfzM+79iRDQBGRdk9vWxhzyU8mjsjAKy29ccudYSi280bZY33Ap646Fm+DgIB9
	90mVL6PMDR+5uaxg75+LF0aSh4VRxK0uu0vbcrUOg402mkZAKW5m/WTKLLEFIiSa
	12DEGjoQ/BS3YrELoJ+qQpNrxQC4OWFH5WULDeyhXvwD++x1AB4FqOK1nGmkIQBX
	RDrIV2iKEgck7ePCoG7Qq/eOHCJIEPktURkdqFKKcZ1Bpt0QtGjkrk36HEnxZG+d
	CUEpIg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt10w6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:15:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c6a0d2122so251286585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790590513; x=1791195313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5uy429fJlY5ihYQtjqpiBMkvSzL/TMOUrN8aeSIFD4=;
        b=cbeFlQ3vKD+ytFCHmX6K9vXp36JopLHcZ94NOdKu0lcrE3Ndi2wt+yBNU+gXflFE74
         PtO+vrfOTLzDEoNe9y4NJnEhWaHcazjXkPsaLmK9zvSaUIAYWsMFrhZw3lZWf+Qth0Kt
         TzOEVPlz7sDCc+Pl1l43s9Xt7e4ZL1JfqzMW20ODicVaF8ZuDaB+dGlVoYwY6y38oh1o
         mospiLKjaywFLUZFQz9I9w6GcV32f03swgHz0dMzUFLfj/EvSHMAhXzTAOYR++9BDyZr
         q3q51RKUSI5h/g9xqOWaUoRc3Y3GQJBw2YacOJKt1BRFEAeFblbJUyokp+5UgQor2N1d
         gNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790590513; x=1791195313;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5uy429fJlY5ihYQtjqpiBMkvSzL/TMOUrN8aeSIFD4=;
        b=KniBwNxdlxnXGn4vhWXC5O9Ty8XkyIBN371AlD4jPSnu2tac8bUDx3Yf4E9o9/rP3C
         ZmVHXN4vwzVOXYHIuWkW/tcCehrzCILwm2JOuPPoFki5v8LK4wjz0hjhm1P3h7WYzSha
         iwx+OeGWHtcZ29xZ8RwvmZCuSwzpcPdfx0pJzQ/NEKA8tp9IcuBfds+18NSsm2p8tSiB
         p33X1GZBOJ+XLqUvgrAdfAARHPNpsjS7ts0qjzz++pC6tRPDNo3dlMpZX/lw2KgqQI6/
         zJnYWnYX/qeS7niinfXtVNh+Y1dcEGFU3sSc2DldjGyDvWhWqFPF6nX/wqUtQAqrVQlI
         hGfA==
X-Forwarded-Encrypted: i=1; AKwUvBw6ryulUha/frDNzWynuSg7F290Ea0z6/mSm69LKn7MXmcvfcaVyFpC0ZZJQE9x2bI0MQ5zPgBLUkS52+k=@vger.kernel.org
X-Gm-Message-State: AFuF++k0fi/gDYuhXkfYzykx3XXk8pgd813148tWI8hOuKAggslpeKqS
	Nz6FUGRUGm41hy5TqnmmqD1q4PCD92FaSmhVnNeyx5ZD937T2c+FhBEI82el5zpU+B9BHH+SCat
	c87+08V0jT0fivHtF/oqcZFElQiOUgFshQJHh8W3h5PPK5iC6mlqHti6z80cGTfz0qLo=
X-Gm-Gg: AYBFou1Rg4cB1bYJN3dodGo0KUSp5YK3cpiiX7ZJKjMxbVZLyuAVwIcNcsY/vd0hPOb
	cJRl3Ls7fuXq2+qgpXW6Dt+3MSp94RcwYo+dOR64imHcxSCw/l7zif3RcvbxhqPXm67rtlerVs+
	+eo/nDRMcQsOlyONK0LPOyBh6ybRExGoX9zJfJ5+luLvjAwtV4vPIljQe48xCLSt9cZJp/KKWPC
	uKxVAIkfhOlmPE53f7j3eR56lA4e9/O5VkiFPn4flpNpFp2vpmI0FT7jAMJB17DKbYe7JJgxkCS
	68BgL4mskBsgtBerVubx6QfICxWNfAJDAonCI0Tyz9pO3OrTizaHtG1ZUyu0XdTi6AxB9HJ3zTn
	e5YzYrDS8ZZqf+reUGq8I/pScliTf
X-Received: by 2002:a05:620a:1b99:b0:93a:3d71:c9ec with SMTP id af79cd13be357-93c43b7ee3dmr1871857285a.7.1790590513393;
        Mon, 28 Sep 2026 03:15:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1b99:b0:93a:3d71:c9ec with SMTP id af79cd13be357-93c43b7ee3dmr1871851485a.7.1790590512882;
        Mon, 28 Sep 2026 03:15:12 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm26840951f8f.12.2026.09.28.03.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 03:15:07 -0700 (PDT)
Message-ID: <872fdd1b-8dc0-4227-a162-a8c281e3e774@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:15:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
 <31a59040-bb20-4cb9-9dad-a62b90a16c6f@oss.qualcomm.com>
 <27997939-f39a-43aa-a287-44c9f70b8a51@oss.qualcomm.com>
 <28e20553-8c1b-4b2f-9839-1fbae1fda59e@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <28e20553-8c1b-4b2f-9839-1fbae1fda59e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MCBTYWx0ZWRfX8lqgTNuzMSeT
 41NEJ6wpLPQfYaiQH7UBkKjTlUbOtPKpaUs0rvHvDK5mhIsVfGrU25aOJOsSigfLplGV0jY6NsW
 A7RoRdu3i5o26iiG9YdliWEP/+G06kF/yB6H4xZBD9yYbN4taN8nxhktC+FZKzFFTQ+2a8ll0Fa
 YdQ44Dc01uixmLEk/YmHLuWS2PgET7+TDRYumI3K2ItQdsCCaXFQ5pCTRNDt8yPos+tH9wTdNdE
 JdF60hjrK5HA2GDd0RpX63w2OXYQl6+MLujzCFsziJLbhhS1We6un4GeGJ5TB+Text6l4IHHAqE
 rf/8ziJ5j5+J09oeVvTEv+IvZuXMXUSetwfm4aDAZ6GEtUqefck4TSpB6G//fj0Oycy7AUjXvP7
 S7yIPQ9PDiPwexwCTZBgEvCMCzbRSkpDspbXbJOqlGP0h8Qu4x5ZTPWx0gkIymju7CAKuhSIWEZ
 f5BFj7aGij65Rk0QWHg==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba3e34 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FNXtACJ1IdhLZLHqn6oA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: GLngeqp0Ipr41eva-lAEFLXP3n-bM2e8
X-Proofpoint-GUID: GLngeqp0Ipr41eva-lAEFLXP3n-bM2e8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MCBTYWx0ZWRfX+gXPCXsZgJZe
 93myS4ENVQiHaSGM+gYxuqJANHv6a8mekGYa1bFiKS170lfoaaY6vGx3hRNWmHTcLXMq/HJOeN2
 EORov1QmPCM6sIgpx0d47UOlwtsg2cM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280040

On 28/09/2026 11:55, Aiqun(Maria) Yu wrote:
> On 9/28/2026 4:23 PM, Krzysztof Kozlowski wrote:
>> On 28/09/2026 09:19, Jingyi Wang wrote:
>>> Tested-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>
>> NAK
>>
>> You cannot test it. Otherwise explain me how did you execute this code.
> 
> Jingyi is posting the Maili device tree from [1] and get dtb checking
> using this binding. And with a newer linux-next tag like 0916.

Again, let me quote:

"how did you execute this code"

And to clarify - execute on target. Build process is not testing. Where
do you see "Tested---by: Rob's bot" for every patch"

> 
> pls have more details of what kind of verification that you needed for
> the Tested-by and remove the NAK.

You CANNOT test a binding in the meaning of Linux kernel process. It's
impossible and I commented on this already multiple times.

It's a fake test, don't ever send it.

Best regards,
Krzysztof
