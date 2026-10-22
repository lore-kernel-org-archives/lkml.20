Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659521;
	b=gua6+PmosxL/6hFXvg92jLpOvqoje1ULlhLy6VbxvfErSJM4d1xRUL27wBQH/1CvlWSv
	 aOV/GikO4zlOKYacvJAe6ptrwTVHo8FdQwyxZm9fOEO2M7hTqxwi9RDh3qEzK3epyPJFW
	 yM2OITogFowvKI9lBv9FqDr7QkiZZv71zB9Xp8AYEm1tif5se7vG1bm+vlzbLnPvFhPJH
	 /RJF+/3Z7yvhxUfkpShdgTOtGZ+0DcVum1Ib5nDPeBvLA/8WX0UiKURVzl6xsprSbdzqk
	 QG9H3/Ah5DC4pn5u0ow6eNyG3CAf9Ixh6lrl1q4Ug7zAtZypqt2uKO8NU1ElRz03PTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uwjdmy4HQ8RIpiCkzz5vSQlEwh/mqQ3eZpqMOnYJBN8=;
	b=t/RX3pEY2OXxZ8/76MQpP6dTyq8ZBcEgWX14uBW0rcAZsUwTIHbEl2+FxKAhSqhuwNuz
	 QW1HBizLl2m9wDkFlouD/sQZT4s009lUypGHv3weH4yxW15MYUHtoy94IDm9nPEJ0EYQn
	 aAZpzMfnMvgIXelfa1fkB3GapcqSZDtYFiHrIuVbeqgQ73cPdPjQOXJPRM4D+bIFo4+oD
	 MfjfRZkDY2Irxcmq6rj+3InCDd7IkRh9yNxRdlpALwPaa/LKF09qfN1sNRyvb/OH/lnDi
	 z2/1TFkOmptPZx2gIl7Wwku99m5urE2uoPIukLW1I2xTSc0rl+tUOkXu6vRT3fwm4KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e4OfLAR0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnh87nLP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F5F606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83F5F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e4OfLAR0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnh87nLP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M702Vh2714430
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwjdmy4HQ8RIpiCkzz5vSQlEwh/mqQ3eZpqMOnYJBN8=; b=e4OfLAR0dHMk5Y7m
	9vy3FmunungJ3vq/maAunsEkz1mlHYpsZ04UCZp0PnPEzRsYZJ2jKlpVn9SC7rm2
	FHd311KK6+gmuF1d5+Kv7t11ZYq4wFcB61uD4D9YqyGRzyAwDupJbbmHtaPy5Zm2
	6H/n3g0fcT6E2T1QFLyk4tjLy1BGfK3hqPpl7rhdewM9JIjyb01dH37I4JmYVsG2
	Y38DhuRCnKLu3eak1Nv90+Y4Al/kvpSVHGHPN1ZSD5oARl7Ftr32jrgwA3PYn0YN
	8X5/Yq2zguHH35spgXhxxZJ64YNV4exxNUuj3X60ZuetgHLnWWD72xmTF1EdZkOp
	cb16eQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsj4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so33177385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659519; x=1793264319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwjdmy4HQ8RIpiCkzz5vSQlEwh/mqQ3eZpqMOnYJBN8=;
        b=jnh87nLPjAwofu9zX9OE3+i6nCcEQwlylDaq9IlriJwBfGDNvDBD054oR4uGe2XW6g
         3btP2BjCOZwqgWFTi2STOrUzcfS0EO2Uy/5aIRku6EdYVSIzVuOP37Q5icfeAR1n+8L2
         r18VsYzKqEfv+asc5Btbjl51ZikA/OTNY5SxgJsplmWi+8SW0Rop57AWSCMY7oeg1mBI
         ngjOZ/LnZ0VaZxAqCe7+ti3t/DYOGH15DvLwxCkQiMrUQc45V+eijDUQFmmsnwAJ02uf
         w8K1HkORyAwPi2BCBxVGDD8gDN6ChR3ZoSENk3t8BEzs0unNvutTGLBeBiiRDWNqsd6q
         Oowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659519; x=1793264319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwjdmy4HQ8RIpiCkzz5vSQlEwh/mqQ3eZpqMOnYJBN8=;
        b=iDqrV6cXf6w1BQUJtszMkGhK4+hzYB17p8SGZ5y5LVytkCuNaI7pNJv+i2dX6hay41
         iDb1YQ32RoD2KMySpbrsXEL7kF4Qev4V4KKrn+rKrcbpFG2ZIjzOjddzaRFBxLHnZSr2
         Zfu1bcRWMVsrYJ23R55TRROAEgCwfmEqq+pI6k+f8FsU0KRWSRe+YN3PcIRFeECRpivx
         u4ewf/6Er+mGzweMs0hNZooZseLkzJv49iYXKR0c1WD4JKMurRyq/l8Mz/fogW9DwbsB
         jUV4Bbr8EykYaYmAbA7qJP9OP/cVuwuRiZoa7OSXvuc+e86bUoEAvFYQktDsxyQ3juWn
         x8pw==
X-Forwarded-Encrypted: i=1; AKwUvBxn8PgJRlxM3KeUwBP73SGXWVL9bD+GQomyh68Hbs86tksc0NWMZgMRMZifootGAXtRYClL7U/IJF8peWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr1/V5JcZ5yc/ajQrIfDfEZqyUgpNiKgsrDXgbn0RwsB7YzWTG
	MYSAzBNAPie/QBVNsbhDI4pgAuyreDggBhSqyAMm83UGamPPGkjC5bySCCWbQkYPM2VpCRP0X5Z
	sUS/BiwcEKWCVhaf6THcf3Ig7+zLQtxalPy1lCAB5Qm+Co5rfoszO+THsJKg35veo2yI=
X-Gm-Gg: AYBFou2kY1dOTvnvWGbZK9UggUO/WG8RZhw/y6iQOk06HbeGKGuppPgOgHo/upQJYWq
	uYebGeeR/nHBPmXWB//qF75h+mJgxW4X8vPfRnlofpCUOuxrxQKB5b6SUC6ZbCMt8zoKB9rG50a
	wACV7MKLPHobZm9qXwFjQ3XHAt+wZHHitIj9+ivux1towzVtegQd+ru5fsOEXxSdfaS6shCj1Nf
	KMpWBz4hyW+TxUJP5DFQpKmAdT2iW6P/+L30QZCDrb3+s0IZ9k8sCH+VJP7O0tt29Lu8WBnusq2
	FvppTDBVdGAagtf0arDcacQ7wP0MmTgCIvUWK2m3MXTgoKUr2Dgi57MSlXZaP8KjwLxoFQpui70
	fBaRb7sNzJBgd00Slt2mCTQ==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr980829885a.3.1792659518734;
        Thu, 22 Oct 2026 01:58:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr980827185a.3.1792659518213;
        Thu, 22 Oct 2026 01:58:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59d641sm84471066b.60.2026.10.22.01.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:58:37 -0700 (PDT)
Message-ID: <58080b02-5c0b-458d-90fa-a135cc79b847@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:58:34 +0200
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
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: Add PMIC support for Maili
 platforms
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
 <20261012-maili-dts-v3-4-8b499e7b9a52@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-4-8b499e7b9a52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MHIokkfzz1_jGDsc40LCA2EnmzjhspSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX9T9S5Afzl1xi
 dkuEATL/cAv/m9AQ8JWIEB4UlBFEKjvfGzNOVNRhklNH8vozYS5iAFwePmVM2ILqOcD7E8DHU5j
 wlos5wRfQAFGFeDW2u+DPmstUCN9kDQNibHSR0C60esiMhzS0mu7IhcmMPGGd3ASsvLLGgOYPxA
 nr7xGAjl9HLNPkXYvywXK/DQ2ggOrDgu5hIVjq8k2ttpPshVss5lPKxxgkWbllJf9yLTVSrcmzY
 JqqEL/4UFyWBTHhxqa+ZjRf6AxRF9078Mj8Cxbvmd6MduEO9Ee0IF3yZiXeIGI4bwoFhZg2eGII
 IPwqt/gapdnlEakqMLZGs9gurnDk4sqOcuUJbPZYSi/2hAgZYiGSRM/26QJzDi1zSRdFV10NnZU
 ErWth4zKb3PUXhxh82hLbzx5eVMbjawKK9xpz2ONgyU6WL+eUsULKdStmJTYv6JKI6jxB/yHIUi
 bRpGywqDv7JIWBG6uZg==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9d03f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dlizgmcMvvRP8E2Vd-MA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXzOZ4fMRrT7Jz
 8IAu+QP1Lks1cwhpXsFM4oBaC1NSA85yr/ifggLkKyOGAmnw9Z/YanKIafS/5Sae1vGxppNbrc5
 I1U0lRTDpUve/jNcM+delyP5PK9fNsA=
X-Proofpoint-ORIG-GUID: MHIokkfzz1_jGDsc40LCA2EnmzjhspSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 10/12/26 10:32 AM, Jingyi Wang wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add PMIC files for pmic-arbiter device used on Maili QRD and MTP boards.
> Only one PMH0104 chip is used on SPMI bus-0 with SID 0x2 which is a new
> usage, hence add a new pmh0104-maili.dtsi. Also, add a new pmg1110.dtsi
> to support PMG1110 usage.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
