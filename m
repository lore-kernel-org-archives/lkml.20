Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010208;
	b=IptRTwlvkl0jhVprBwivwcIKL8OVN2MZcbOusPqrT9RjH+Ppc5lLoWYpzqDuFwJZYuls
	 ji7sDCPzYfvMRzgeAekoBtLwISZMKpgGVS/dkYFYAEyUaXxizucx43/WBJ3aj7cldNQi/
	 Nd4XzUQ+H16fpVYnnulesA2gxj3T81Ub7IJ1e4HIEckN3x2nypQczD55f8z7u9QKiKZD5
	 J+aogU9lDuSCdR87nAtsnE046ECVOZ9I01U5S/Mxdu4PekMiJnV3No/RRqeCmE343Clu7
	 4SbDsoNs/RVbeHNuiWRy3I+9RtAj1pjtFr1FUjYu+NqLpgJSwawG/a08u7ItDPvL3Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GsDZSvb/ziwVv/+kCRkHifsd/bmXIrJplkWD5AtBipA=;
	b=NWRiPDu8jncMeak927wOg9nPxf1qi+wcEacsz0S5u2MnNkJbgjJLvnjVAiKydjOY9R3y
	 0uXmkmQkxXpcAIclGNUsqSsKFt1qTLDr5AVFxXTjEvVNtKISQypo7dMvpFIMBkhxR6/xY
	 jNTKbYeuiZfJYiE/e4f0mDCx/CbWLe65BWsxfgiK41PD9qJOFAoiIv1Zuw4ImG9MwcX6y
	 jGzcbFUPr2E6pNqd+Kyv3QpCIPwcEh+NpIIMURBrhFzEoa/Mt86g0PYWVUC/8xsObyrjH
	 yTbo6iZ/SarTyqGVXHHcWywHHagR1NMVWG5fys+fS0Zkhtz82ntBQnBk9alZJw7bezw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VLhNGqJi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q4p/uIeI";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F6606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92F6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VLhNGqJi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q4p/uIeI
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4asjT3303625
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsDZSvb/ziwVv/+kCRkHifsd/bmXIrJplkWD5AtBipA=; b=VLhNGqJiB2hH0sFx
	e0cz73xlzSoHeP/ooJsF18kH0BAwW54LJBHJjip7cpNvxTCA2PrZU54P3I/q0rqR
	sLVN26WH0njsjljagUB5EezohQufzn8IF0dQRkCqeMRGQZGpJuGpVzJa+Z4uYYO9
	kFzbIXpq3zLwgzMY7ZzhEmah9TLEslI6SOfIMQPXkWK9OxWNymEJ+S/x0ijU1Y79
	ZSLvnXaTal1S0fzav3XYz2Hf1DrA32ZiXtAes5RrhHye5d0ONRO0fP+pYocoxS5p
	c0rPtODw0cnJXFnOPeWX6m52OFfsGqQzwgcKiG/JDJOlx7KBgRk6IyTUlQXS8sbC
	AiI6Uw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmse060-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:23:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dfb24dfedfso31254275ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010206; x=1793615006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsDZSvb/ziwVv/+kCRkHifsd/bmXIrJplkWD5AtBipA=;
        b=Q4p/uIeIY2A+i413NxhtZ6Vj7ILv+Ww7Uw9xBlhXGCG3UCppv4lPH2GDfi8M1q4iOt
         m8oqFWLzxulCLc7q9wmXQVR1v0fxcMBUhNjg0W/cwnLbZ5M0i5CYI3pb86yJ1y1GS263
         yvP9oL8q/042G2TWbUF2fLcYnT8Q0UDozpf1cX7G6lq5cNm0CKle0LCNdwAP9Lm+wfEU
         R+xfaydmneytURmrl+p9zwPE9p3jJg9LTfKrCcVEg2txfu9VhoSf4xkt3qyy9+Ycer9m
         FPwUvUsrdIz0OG6NLCpZZ8gXOtVEZcX1rJokPHar4GKoTRkX93VI3AyPC4dOmd9xAkoz
         Bebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010206; x=1793615006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsDZSvb/ziwVv/+kCRkHifsd/bmXIrJplkWD5AtBipA=;
        b=XHTtyV2JxIedTVbo7J6g9X6suUzhZ4oqX4PrmV8JEV1Z4+dJejhE9hoODX6DiHtmPI
         bC3biBS0H90hiQgNhePH6TJQmedkZ4ZJnE00rWmZyHh0HrxoFiMcPwbsm2REy06z82py
         R0C7IXAIxx/DBTsL3b3QtGxpuLxBCIoAx0ykvv+2IAGB9Mg7hXXkykLc00YgkDsv8/VO
         1a9dItLzfpbyTbSVEtEnYe5/Pc5EbVyBeLt1FNpzeA1aVEzeGNlUxeQL1xyIwlvyq9yg
         gzCxzCz9ntQl0610bY4fV+Xhjov/mfuMhC74mv8v8bHXDn+SvxBr0h44Bj/bgweXyhg3
         V9dQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMixaK1dj/a7YkMIoRTJCICrBenuK9E8vHg6feTwLPPVgeUukw5D6/RDBAFeqmCdJ9hByg7jUncHd3Cvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYInPuceuswsdzjI18UxtR6V4XsndQ0eBdjKtLYaO1vg8dbE1ETj
	31VuZcaVYLnrNLWkH86oHLIshiKXRIihIGvkzGkjRFO3YbWE7Kq8KM+ch91MjgaJUrDejhLvksZ
	mwc6gOu3NSfTirjv6NLrp8GrgpRhDzOD2d1+r08vAVNzmgzptqX+BLdX6zDUfml7hyug=
X-Gm-Gg: AYBFou03M0xn2/cgG8q/PbJj9Px8v5whY9/gjqts+MRO9A0fKZ6LT3p7cj8i5uu6sS0
	oHCALATxFmC+c0wrhaZg5bAQj4LGErmWcoyOQop238rCNDUhzBaMr85iEql5eK7KVFwAZzfKbd6
	1y/wQQDjIfBPP7s62uq2qOyYg4RDcHmicyMjoEOw3fQLoZ3Ly2dX9SXf612OcoQi0i8eaDX7XnB
	8q7lar5RwOGUt6CwCInWdl40wL2rejRRfh6hPV6z7FSVpBf3PrRXPWhqc2C+dIMCVS2XcQaIBRY
	1KqJU+A1ImiOhrwsV6nlIwES/cJ1upb5do7jwWo5zxLm/xKBMpOLXxoWu9lJzw0QeaV/SSfW8O6
	y4EzWe7aCjzjm1p2rq34zNCVSBlpSprKHOmCSLJxNpbRgUhHbAW9gkh2dq6dmIKjdOoipPvkK
X-Received: by 2002:a17:903:b85:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2ea9c953f2fmr51636895ad.59.1793010205882;
        Mon, 26 Oct 2026 03:23:25 -0700 (PDT)
X-Received: by 2002:a17:903:b85:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2ea9c953f2fmr51636575ad.59.1793010205256;
        Mon, 26 Oct 2026 03:23:25 -0700 (PDT)
Received: from [10.133.33.203] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af32271sm14575335ad.9.2026.10.26.03.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:23:24 -0700 (PDT)
Message-ID: <9f76467c-5b21-40a2-95b8-e91cf1e1b47c@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:23:18 +0800
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
Subject: Re: [PATCH net-next 3/3] net: qrtr: implement shutdown()
To: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sashiko@kernel.org
Cc: mani@kernel.org, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, horms@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        tao.zhang1@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        jeff.johnson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
References: <20261016-qrtr-add-shutdown-v1-3-e1cc01ca5919@oss.qualcomm.com>
 <179248895481.3135.9231497728918795508@kernel.org>
 <20261021133531.55da7de5@kernel.org>
Content-Language: en-US
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
In-Reply-To: <20261021133531.55da7de5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6l3chNhJl9catugJeVQbbmoviq0hOQO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX7nUVLcPdFQQC
 JrMlk9pqqxHViK1cRqZ8u9n8nUD/UHcA+VySjdfrxTY6Pgn1cCcBQauYuF8hO+i5ICXGVrZG9ut
 RUZrMdyG72t12ZxRR/Cb3OBfu3gf4IIFGnMgsnDuxFLkMV761DA9HH9KhuZhZcfJbK60ytGIQzL
 OiZ4/fHNTZgLLulUTXjAtc199Fw7hvJS2IpcDQ59MgrGD4366bS8QRvHgrAJKEIOuTp6erEa2Xi
 3H3sjNvQPa0g4Ma4zDCDNGBo1EQrswXWEXhwIM4sGcwMmr5Nqv6txpWngF3Thk/j1WlaMXeojQB
 NZes2mYFQehzOAWMQKGPxDUDOX0W5MGoZRRudToqRX2BQwccW2rbBTpRIMikllTwo8JinuH9/qS
 ZbpF3hzNRLUecLHAlVC7ybZIHTHXP1RESsF1lcWKg5uAwauUlvybDyRurpOl/zefnB1Cr1OAqhe
 LRiADD9+YsHcTtXSimQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfXwo5o4sJ14FRb
 Z8fldQ39UOd3IWXnN7pA48TUFqtPV5q9vSGNvM1qKF7ikMVjdbbVARNptVMqWkXHvVq2qNRhBDo
 IjZI8tyZj9epysiH60LEyxBu8kZ6QNc=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adf2a1e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=goVogqWYekQxIWN7P9wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 6l3chNhJl9catugJeVQbbmoviq0hOQO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260041

Yeah, this is a known limitation and the commit message calls it out.

The sender sleeps on flow->resume_tx, which hangs off the node and is
keyed by destination node/port, so the socket has no way to reach it.
Fixing that means either recording the flow in qrtr_sock (and dealing
with the flow being freed together with the node) or reworking
qrtr_tx_wait() to also wait on sk_sleep(). Both touch flow control
rather than shutdown, so I'd prefer to do that as a separate patch.

Without this series, a sender stuck in qrtr_tx_wait() already blocks
close(), ioctl() and the rest of the lock_sock() callers, and there is
no way at all to get it out short of a signal or the remote returning
credit. This series does not change that path; it only makes shutdown()
useful for the recv and poll side.


On 10/22/2026 4:35 AM, Jakub Kicinski wrote:
> On Tue, 20 Oct 2026 09:35:54 +0000 netdev-bot+sashiko@kernel.org wrote:
>> - [Medium] net/qrtr: shutdown() API violation leaves sendmsg() threads
>>   hung
> looks legit
