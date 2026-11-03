Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793685466;
	b=SP/oL/oLq8WBLrGMlw/bb8foHQpdq9INM7++ISqD2qA6/mkS08nZF9z2/DFJRbGor1rd
	 jzzbsxCiZJ9VULRpghbeYT5KIo5PXc4Uf9SWqg7pPT0eMiylwvLJeGbzFH/Rgu2isUlqU
	 EfW+wWmgCdmnR4H92numJE/c0WLc2SnYaQV7pzdFjAtu0MKlNy7mNx2D5QquF+WYlrdM0
	 2r5lM+diQYIsIwY4Rq9Y2NfDpoi+tMxHPgJJnq6mvXbePm7f25Ze3QJLQuXuzuM3/sSVN
	 OAW8yFpObpssKTEsob7I8ByK4XKgdkI2qhRItGWRKVy8lxAOkgn3HG5RlTgIqkOYriQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793685466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PJsG2kFUzmWIVpV233fDLAY1GQdDB0aSN4idiIfFSMg=;
	b=uJFbhSVZN3VAO+PVPhMHfareZZ8/RYJ9F0LTlTrs5c6DfomnEWHROJTq+koBM8LWf3uJ
	 ZK+lYsdoqK8ItO8sfAuL5krKtSs+kp6dMEofBfRv2PvkUuS+6t94eJCwrPr0/d+eFTfx9
	 gyQijs26iNGhxBK+CV9jphGWmAuu/+C7HwnIeFKe22/0dMfIAlIeg2pOKBIx3NKuix1d6
	 s9DV2gAsVxDYVUMsjeIbIUwZ+I2h2s45wqSiQwRbH+nbVQksz0U+4Q7bRQsAT2H2KbyY6
	 gsPFyDmNXfaRPiPycP/FzvrvryhEN7FJSD7GEOhvaIotsf2AZmLh0psJEGr4XRokiGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S9AesGBP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPCl2tQ2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8F9606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D8F9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S9AesGBP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPCl2tQ2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A35376v2450966
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 05:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJsG2kFUzmWIVpV233fDLAY1GQdDB0aSN4idiIfFSMg=; b=S9AesGBP9hSJljeV
	ww3dgpha13lRM5zcSnS3feur4P1jZnXP0q+bCwLoaM83bVFreJ4eKk4lSO7sV0Ju
	0aZdeeRvA5X2Pqj0IKuLFuPKq8CXb02W0x7Sv89jEDg7Sosv+PFys6myY2RL4yKZ
	IAz2j4Mq7an33cLPGhd/LK9OM4Zo3Cbx9+hnNfnMTZ1uu+4a+mRtiFoqjDOdrhC4
	EmU7TKiKJvt4+Z9GWSaXI2kVjgIXmmi+N5LylNICjm5ZKaGdQ9n05GjNfWVNKJYg
	y3DIqexGT/ypBE5B1L+98PYcm2zv2p6Az+5eSxdYn7d67IMV7ZON/Ipop7xAEFkj
	uimAsQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cr5pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:57:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so4968204a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793685464; x=1794290264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJsG2kFUzmWIVpV233fDLAY1GQdDB0aSN4idiIfFSMg=;
        b=IPCl2tQ2nWBR383KPUh4rk9EnWD83UOyzXaLKMgjZBIVNl+DnwTqIRLkWroTvhn6DN
         ePGjlsCtFqIfCs0N2COVeIFqTOVV6afBkokvGlxlPd0bH230BLe0n7jJaPZ/s0KtEIxl
         8JEBtDkaMrVnQ09kZf4egi3fgQYUxDCcylwquijPWMXdd6ygNRy1s5CEzSKaOOU7jH0V
         VIezK2Mp6IbzZ9gez8CP7Df1hKIEiSf8pIUWpMbTZsMq/C0PQmKmNIsa3BJu95g8TjoE
         qXTrm7wJUqY2DGoNE6NpC1/ZoC9T+uyd7mFCWFV8afN8IGLrGObO/iy0IjvGXJMAnoNJ
         lVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793685464; x=1794290264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJsG2kFUzmWIVpV233fDLAY1GQdDB0aSN4idiIfFSMg=;
        b=XL3/9BALfrcCi9Rw7RhGWxIrwoOjpCKvQa7cDSfhUo2TNt9/GP/DAMH6IBCvapeItD
         k+WJS+Uzhs+RGHLGJlwu6ODTHOcIxE+n/XNAr/l3dzdSpZ1fLLVmOgWpoAHekfNIaCwa
         xQLUfyHCJL6fXEt15PM80s32Vo50cGNRui9P185ZCxqC9+VjZCr5+d+ySYDv1bVeBUui
         3ZB3R3gx6kNSFQ61cwLimgu/1Yh890TN7t94f88f33hBubj74TqupeeeVzOWfUQ9ZzMM
         rTULH68JW0Hyf90btOKBeADdeRVx17WouyHSkRQbvjIs2Y35v27YYQDbjGLPLtMOSTyX
         /WeA==
X-Forwarded-Encrypted: i=1; AKwUvBzbOGic1B0vpCWjCZVbnWAetvTtNx6LiJiJUCql21OxGCGLygOdsKvFrRPK3uCCs4YW+oh6ZTbtHVb46xw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OblZJCSw97dtwJC6DaIVsz2jc+DA1zOF9Rr+FNGi4IOUPP+fa
	24IZnLSbhlWfs9OgXlSCwJIDVQgSBnjQ4D2QWIdgyW/ykEXHZrUO9X74sLDavPf96AGiRz6WZJN
	qTxWr6itAQUGD66BSWiU1fAz9yO6ikNyc2W8Qn/QdDz50slcuMBU3y/MpIfnv9D2lk6o=
X-Gm-Gg: AYBFou2DgPIh3cmhuhl9L/1OhvIEg/lx7j51nSnSNBOeEn0Jiaph0ihpVOZ3OYw+GUi
	fllu1EPwmfGKN1hLaTudSy/1hk8gjdt29njW7W1AkAWRH6Wxvc5gTC2zcAyjA/k8FVagH4KgZMM
	mcCXDS10xdN6op6QD/bOHhePeM8gTi+4CiPabFK17iE61IeJNSVd4tsmFC6TULZYhMyR3MNCKQ3
	1BMunkLQtCx8L+ZLIIYN2ECFTf/Z8w7sXd5oK0m9fcLqeDQxC1y0Pc9i9X+dyzx6UxVbD8pjawy
	LGVb8ShKcf0ZJjBxo1Hj1/RBF8XBhXJriloTCEwKNx6+QCBOQb8bZfs9cOoLju+9uUWAEkwMez4
	mWMzEzoIa4IEaTR8QL4MpZLf0DVecsmL78oxPGmvz4Z5x+xAxd2wzXFE4eL/0fbM5WfPJf2oLna
	LYnQ==
X-Received: by 2002:a17:90a:c88c:b0:3ab:884b:65b4 with SMTP id 98e67ed59e1d1-3ae8984ceddmr10250872a91.59.1793685464267;
        Mon, 02 Nov 2026 21:57:44 -0800 (PST)
X-Received: by 2002:a17:90a:c88c:b0:3ab:884b:65b4 with SMTP id 98e67ed59e1d1-3ae8984ceddmr10250861a91.59.1793685463790;
        Mon, 02 Nov 2026 21:57:43 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5d7f82sm2470465a91.5.2026.11.02.21.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:57:43 -0800 (PST)
Message-ID: <c394d2b5-8f66-4fba-a38d-4ba52778b471@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:27:38 +0530
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
Subject: Re: [PATCH] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-qspi_dt_binding-v1-1-5249111cf870@oss.qualcomm.com>
 <f71369ca-5963-41c7-9103-dd39a7369e38@kernel.org>
 <53640a9c-395f-4faf-bbac-20c47013cec4@oss.qualcomm.com>
 <20261102-crafty-beautiful-lizard-36db2b@quoll>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261102-crafty-beautiful-lizard-36db2b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae977d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3EltNRdik5pUTb2ctQ8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: dvymw5JGVH2VAkvPK17hdyNNxsJiq7Xc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMyBTYWx0ZWRfX15cP+weI0xab
 yVPt5wBuKsjz8Zm3P7ObxP99uDvn0jTNrCX9Is5NzxTdZIGXCN9xRPpNghPvjZSGLQI3y+5ryB4
 eP/NQO7JSGLxEwd9dtEKeS2GLch2wiTHxh3A1JoB2DQTFzfwaRPzdhZRt0O5LwLTTunvqifed2v
 3gc8wZUb0bLEpYxFOKaqDUN3dQgduPZUai4f+iJpSlkddS+LrCYrr/Hjr/+XWgrAx/89SwoMixZ
 lPD60L1EQNkrDWmXTv024RJceW9nP/4fKaK4Kmqbg3PNHQQ/urpfnzolMrjZypmbkiQtaxxpPee
 LOOfyRylB+f7mg7xiIOPnCoNvRFOI1BEPIGF5wJX0TYIEI8dJ/3HCrCa+RJ0DR6I7XBkBq67aIi
 UzRaG4+6x87RW1slXY0W+zJ+fxdqlbRyPFqUp1ixnhaHKybfx976lzag6cgUb5ic6RQjXOVb+/6
 ILjbPXQaJQEg4mHWLQQ==
X-Proofpoint-GUID: dvymw5JGVH2VAkvPK17hdyNNxsJiq7Xc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMyBTYWx0ZWRfX4NWkgAX8q3/u
 yjTKiUkohQKUZBjyD/ceZJHJhJUa+84XJyxMDNIQJfZkzTBj+fKmU3wn7MqKCWy2CZMQU/zOXZC
 ioNIMKBh5o2hBYY5RRFev6MV9uQnKnw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030023



On 11/2/2026 4:59 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 30, 2026 at 07:28:57PM +0530, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 10/30/2026 7:06 PM, Krzysztof Kozlowski wrote:
>>> On 30/10/2026 14:30, Jyothi Kumar Seerapu wrote:
>>>> Add the "qcom,geni-qspi" compatible to identify GENI Serial Engine
>>>> instances configured for QSPI operation.
>>>>
>>>> The compatible also allows the driver to select the appropriate protocol
>>>> firmware when the Serial Engine is unconfigured (GENI_SE_INVALID_PROTO),
>>>> distinguishing between SPI and QSPI firmware.
>>>>
>>>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>>
>>> Where is any user of this? You speak about driver, but there is no driver.
>>>
>> Thanks for the review. This patch only adds the QSPI binding change. The
> 
> Please avoid stating obvious. I can read the patch.
> 
>> corresponding driver changes to add QSPI support will be submitted in an
>> upcoming separate patch.
> 
> So no point for this submission. Please read submitting patches
> documents (both).

Understood. I will submit the binding change together with the 
corresponding QSPI driver support.

> 
> Best regards,
> Krzysztof

