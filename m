Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B2F3E557A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790222339; cv=none; b=cCjKdTy6W33I/tqFQ1rSfUd3k11Y9z+2Pn2D5JGi842uTzi2LmAEpvvLD6DbdiqZ9ebWhnMcJShNIA5TwTve5tlw3OJJZjj04JiRUFTTgbeNW/bZnrJABh3fLstCdB8m/iEnqCzTs3J01q17BTTa5PhxJT8ZWXjh3kYwUP2s/Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790222339; c=relaxed/simple;
	bh=mTHABsVW6LrK5x1PKQz0xfBMUl/EmalKRgXETRBbGF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFoTzbBmcfvSucVtbqE368Y3gfwJTtK6WFtOVyBmq/OuqQjoBBl7I3uZQinI5PPyLQ8lD6s0FXUNF7uWN5rU40LUsE2abbqdNWNn33MduI+zOYwDQTW+P6rNQJDq77Iy3OA4BfrdaJQUMs4RBIiZbXO4es6PovzjGl++hMuTki0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXHbTmXO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZEwwi9Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXHbTmXO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZEwwi9Q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O36h4l243984
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRqR6EsbtaDsBw5NOzPpm7r2TQRIPV2xWoHRZ+CiMEg=; b=FXHbTmXOZAzY9wCA
	aEP3GeIS93HuSotfr7W6mMsy2jbOaQQ15mknxtxccgC0LMjd/CRCTsRFvjahASmH
	1QXOW1SB0S7twxUr7OwooPlbpRklGaof+l44L89BPqT3juTx+M/9gUwhefY7Q0B2
	uU9+rSt6tx+eaVo3Yk2xPqs2RhJezkqYPXV/yjOhToT9zADYzESSCnLxIF/34TVO
	Y6bEPPsJbOU5z6dAWdWG2gnftdaZLnrA7835q7B04zvCC4mLeuG+ctOmhoQnBP7p
	DZEDxWIlzSzFlzc5YtyWTBfH/BOaX+eUavzqD4C7YXFHkDyjnW8zAPIUWxecffnG
	8zQP6A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7m3wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:58:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1686993a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790222337; x=1790827137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRqR6EsbtaDsBw5NOzPpm7r2TQRIPV2xWoHRZ+CiMEg=;
        b=OZEwwi9Qwy16FoW1HRTiQZdrGcqARGWAAcsuWIYBR3n4bip+uf9b2gi/koPmEbGHfu
         WKUew0kZTtQyfvZfhseGGXC1UtsoUJZw4Qln466uBWtEWqw5QtFAPh2FG7aIQyQrZ64X
         Qbb7FP0fZPL8issVpMuvKYcBKkUtioJg8Bg+JByN2FNtCpmMTaL5shOUSJj+zS1HwN7s
         8SBEvJ82xrQdPM61kJqvUbL4qPI3/A0JZQ7FGIyO0NXZKs/9rLV0ghX8fZ3a8hw8j9S4
         UuKJ60rBHwvsZvt+rMgpUKvMf+tuLilR5dAQHDXkw9Uw1aKRFHRmp2kSETGozM9eS0bC
         04Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790222337; x=1790827137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRqR6EsbtaDsBw5NOzPpm7r2TQRIPV2xWoHRZ+CiMEg=;
        b=RDz2rkev3QtGDib6s/rG5qWQEvm9DxvphsnjNKnP3cC+nOG4snz35Fy1MPVENX+2Yf
         0gyEn7CNbrMd2jumqEZ5lfqZHwGtqprQnJJRVsyH2rwc6rJ5rzThFzmrR8AVuroMEGJM
         nzcYITRQGb1c5uTtmZfeysqcSWdnkn7teSUPpdavvE4G3A5f4jRO6y1/Ue45MbgLCARE
         mAxDMHXafA+B2pXEMAHvEm4HKUmU57lEXVWaVAhxXrh57cwt2EYlAqxV/vAx7VZS2L5N
         FeLiXJL1kAUjT9tL0e/M29KVMlec1XM/ZWbwCw5rVf8G8LCJ0gTmrnMQpWMptXOKG3YE
         WcQA==
X-Forwarded-Encrypted: i=1; AKwUvBxMmQiOYkYr4nhQd8EiBZaou6fyDEl7OG3G+GI9fN2Rkx4g+jP+RjBF+/r8JHASDyY+rqbvzGoO121E/oE=@vger.kernel.org
X-Gm-Message-State: AFuF++l/v742DPwXtQ3dEbBZWOAb7IrBrdkAmEEFC3RAnQ7BXmECqfiy
	uhP0R0cVXvoEV3G3JofBWJQ+VWHKXWNC47Z2AB/1dtg79G3OafSY2cPqHFNFZf72MlqqGtZS8IW
	XDeQKy/TRZkPcrZRjjusaabdzRnQ2JZdfcqJhx6qbla0BOp+fFIvvE1jlDGnaeg4QpFA=
X-Gm-Gg: AYBFou37f4uzzm5fzQuA1oaDf0ipTEu/eK+3t3hNEv5SeJM4IzqXPLGpipE2/WA9v+G
	Af2g+tjPgG3ec6muADlFuQNfi92d1yR9ZdUsPR9I/QtHTa05YFiCpnuhQZqgribCNYn4NJTYFt8
	nnSIfV5PbGJzLlhFEz8Azz4MwaUsUJ0yEiWD9XrImRcKhxEqg6UzpRk09Kda6rb8Kma1vbcn8/L
	l0lsQdrm0UQLQWuo0gGLd+BjoGzOmgrKaK2V01vwGvoj2IzhCE5lIriY/2SX9aAyZtmB0P2zgUt
	sXgwTHJv0q7GgSRRs8bjzwz/a5GQRjK2mjdOXVQUWqGsTVqhxdB2cAGj8NGlz/WoR4A8VUcVdSa
	LLoTJX2nrxVRmJVDGrZr2s7y6
X-Received: by 2002:a05:6a20:1f28:b0:3dd:a196:69e1 with SMTP id adf61e73a8af0-3de0ea1cec2mr1157961637.60.1790222337331;
        Wed, 23 Sep 2026 20:58:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:1f28:b0:3dd:a196:69e1 with SMTP id adf61e73a8af0-3de0ea1cec2mr1157950637.60.1790222336873;
        Wed, 23 Sep 2026 20:58:56 -0700 (PDT)
Received: from [10.233.17.96] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e0fc5casm2142631b3a.53.2026.09.23.20.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 20:58:56 -0700 (PDT)
Message-ID: <93e44830-d141-4ba5-8048-fbbaf4a2a63d@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:58:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: phy: aquantia: Add support for 5GbaseR
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923-aquantia-support-5gbaser-v2-1-4d789dc21418@oss.qualcomm.com>
 <9a79f51e-50ec-4df2-b908-71573c81b69e@lunn.ch>
Content-Language: en-US
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
In-Reply-To: <9a79f51e-50ec-4df2-b908-71573c81b69e@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2fNN2DeIz0wDkUHeuTY01d2qnzRY_uAF
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab4a001 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p6hV4UG1XhPPKoOh2iYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxNyBTYWx0ZWRfX85YXJ8fZdTiH
 l25wBjZ8RS/y3ozqt0VfvAIDLDfa3SgICjc1TcWYaK4DjKsQS5Tajoqb15F7iXzHc5qK8T7a75Z
 nsyy77HPiHHYH5My2L3hD6F8ypLrq6DPd+fIzMG9u7CJ/PGc+Ll3ORdV96Hs3OUq+0jspwBb31z
 MrCUHq5mPbTMI2OAfGucS2K1ik71wWpxOPcDERYFXJTVySowzIrDV9Rg/2v0upduzN3dmZdiaNc
 DC3KXR75y9zB2muNz1R41m+fR9jnmYjQC9/o82JhAFGmhwWUR1AsMG1BR8lAUfe9zRUOnmOfagA
 9ZJ2J792bS+OPpVut6F80vvCdwcjN8fFnzMNo5UALE5lEwgufaiK9K8M+7yJtKnTv8Rte0blb/0
 6ItB2/AbXUz+bkBYForciXIptKc5Rysax2ChiMDYrDh3k+16au7iSvHVmgCoPZjDSVIkYuA9j2E
 ReNHoT16doFIUC/cJuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxNyBTYWx0ZWRfXwkNRNCkCVLKZ
 QGJQYFcFUE5UA9x18iDJ7k71T+eGFgA3LsWbQaQD8iOcmDthvd/Nx/ZeQ0kH6mCuruvcVHnhQy1
 hJR4OcHaBJFFDdUsVfzrGl6eJRwy+Aw=
X-Proofpoint-GUID: 2fNN2DeIz0wDkUHeuTY01d2qnzRY_uAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240017

Apologies for the careless submission. I will fix the changelog and
improve the commit description before sending v3. I will also ensure
patches go through internal review before posting upstream.

On 9/24/2026 12:02 AM, Andrew Lunn wrote:
> On Wed, Sep 23, 2026 at 04:24:24PM +0800, Hongmei Xu wrote:
>> Add support for 5GbaseR within Aquantia phy driver.
>>
>> Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
> 
> Did you even read your own patch?
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
> 
> Please try to setup an internal review process, get other Qualcomm
> developers to point out all the problems with your patches before
> posting them for the world to see. Silly errors like this are not good
> for Qualcomm's reputation. Not that it is very good anyway within
> Mainline networking.
> 
>      Andrew
> ---
> pw-bot: cr

