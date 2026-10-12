Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE41D49BD9D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818701; cv=none; b=QXadvGTv9rPYf4HBrhmz/GfVd8PwDg84WtfqL2/ldtxNjFZEQrLZ7ysIJeoHBIS5fhQ2cXehTbxyzIdEV1XRA+6a+93602WoK2PdYJd0sDVUnkUUNVKSU7gU8G546lglrlLyq3Pn+hrGW2lvZK0tzc+PIEWkGb9mk3+ncPy3drU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818701; c=relaxed/simple;
	bh=ip+ZMlVYX0OgkoLPssESsiu8xYgxA6lPAfELhX7CVu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MeDfF+RpjrJDgUVp4AtDtiWl96GG9o7xgUAQsqFVPcIhtYeD+oU76ciTjnqpBgton62Nwas56LBitse0xgIqSvsxAXPSwy9F6NNs+8T75E6pgjBfV4PJOyxAfDNFloYlVq6FeYznu/DrXUkoocAUpuNmLHU7olRJ4qvLMd/dvlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9evIjk3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOoQ7nVE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9evIjk3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOoQ7nVE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0dIT2679953
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BuIdJzBsTot29WtX7UNLyxnvjTOPbUUbbpt1d12vZJ8=; b=e9evIjk3VxEJdvgv
	yQUwSDD2asdM/MOXXh+pRI6Vnc8Q9wNZZ71nN89JosvIZrdgCCsLnCqkX5SRAgXz
	hsaGJyKcCHIs1EsXi7voBCSOimhj2MFeVZTiEkiM05qNhD/WEIerRrYuon5PMyFx
	lPeEirSg+3fBjoQ4cG5T+pENDQIq+cv8uRRfQ15M1Y5iqi029Bw7CdNGg//BRYCQ
	VTkPNyUS8514g9y/sVoFYrHL3ebCtaR0ejwxa2Vp8q95z06R/jHrAMk+Ux6gpkjU
	oIo+dWPj8J+obE8/3lfdq+1TetLURn0AI1h+wnYBZCDyqByDiIumBkPef+8oWm0m
	orSGVQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1tmcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:24:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cba2460f8fso29888137.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818698; x=1792423498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BuIdJzBsTot29WtX7UNLyxnvjTOPbUUbbpt1d12vZJ8=;
        b=QOoQ7nVEqWtkFqrGNFf9qH0m56BZr1qAMu+ScEe6RqpGSP7xiAta3I9c9Ng8WxMY1n
         I4YJtPFaSIVQo4kDNb0jn16n5/wygU1i5sCY5S0Kvvj78pyTTsKNsdRDaSYBuMgTwWfG
         wpYDJdtaScx5vHBcFhU/xQSMyou/qv7FFCn2CB9W6fMxC3tQ+o8bVFTW/jTx4wmInak1
         Jifaym2DsfYBdPSXKKjKyrUhddNsAJlPcf9SHn33Q4EcJVnzNwIlCY3hetBBTWi2ymwa
         A2L4EuQsUGGSLECVFq3bWBEudqn2G6tmLLmNaqpoN6WcQwKhaDNNh0HJe0nnA9iuqhNs
         QwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818698; x=1792423498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuIdJzBsTot29WtX7UNLyxnvjTOPbUUbbpt1d12vZJ8=;
        b=gg9d76c00lpQZRWoG+UjnzP+gpD184oF7aNtb1F5AONmMQ6THGNjZNV0BLl6HfldAp
         eJVED29KHxSkReK4HSIKVF2ht5QLNI1vYC9Gptvec3u8CLCcJY7Ba1D2LpKfs+EnWMRU
         xtDzGk9TRiT3MDGywklhHNMHLXE8gYU8mDmcUxdFI3nKAslbrsfmxgA1gwdQG2ispAw2
         UDzR8x8DyxpAlvwh/QnF8S7srpBpdjK6y7ANClex3AGKgEYQ/7sOZQH0TbxbQmGkiV8H
         wcRE7b7wOFRLAjuJRwU+hCKqC7IlPM3eF5mV+H6Xr1IU055tdY+WvCc9xnBoC3SEglZh
         7vvw==
X-Forwarded-Encrypted: i=1; AKwUvBxN7ybrnUs2WYTw0/2esG+oeOxKg3GUlaegXaEJc037phO2pG2P89kgzWt4SRhdAkO3wnNyhbqx8BqFpa8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIivvD86jeEkO29f02iDguzmJdVHrsFZaZtXUABeKdpINXbmLrC
	L/3WF13S3EHppM2qzqlFZOtcATwNrvoKnCDpcVT52AsXydfIIoyAMVqeynV4NlIHcJIZStwFlHo
	5GKwKBYMHYDm8/DEisBNNcQucVbnnceMo/0uYG4DmAhtio8uS9wEv4QtsQd3XttBQyJI=
X-Gm-Gg: AYBFou1BuMuhc7ZmQAjhL3X4E3wg9g1i/ExTCDl7x3uDU8bfsBto30lGWytD2BTgwqV
	rYxN4gsryrLlGzWNS8EHs15HKWgA1k28uMRitFIopzL9yec3qnNGHlOJCXduerEogu/fzHA3CUP
	b874BV1yvMslBCNYsaFlS8M974iU0sVjq7tLpTxTzPXATBj6RgkPI3ntqG/U8jYyD1JfBR0q4JF
	nQzsbqCfdeN72mIfNzcgoe1NS8GkcAAluT9wi78df4k9DDcncRyHFsMXprtnvM6ZGSOrZMBzyED
	NALeH3c/myFNiORcVSBpP6NVl4HIyg9+PUgjkYvjl7o6mWihOd/QIbyb0DKRnCAlOshGCqwzWsK
	Zyxtf3ko9nzGuapBboMrWrA==
X-Received: by 2002:a05:6122:4a52:20b0:5cf:69d4:10ea with SMTP id 71dfb90a1353d-5e92e15cddcmr1531056e0c.0.1791818698005;
        Mon, 12 Oct 2026 08:24:58 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5cf:69d4:10ea with SMTP id 71dfb90a1353d-5e92e15cddcmr1531051e0c.0.1791818697623;
        Mon, 12 Oct 2026 08:24:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766209sm479310166b.3.2026.10.12.08.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:24:56 -0700 (PDT)
Message-ID: <01025d97-c42c-4183-99cb-a1d5167b1e44@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:24:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/38] arm: dts: qcom: apq8064: Remove tab after property
 name
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <458647932763c7a063ae86c88e0ec9b0c09216bd.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <458647932763c7a063ae86c88e0ec9b0c09216bd.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Uzqnnlv_wTYwHFBfNOKPpURfXC_vDO-6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX3Kv/Gxfl7pol
 5eEcRnBtuT6mKuclm8VfZ+a2gVLuqSo6UJx5aNQ9uuHVChcid9+yeisJKRY/+ai6LYKojAyhAUh
 MwjcHOiis5NDqny60oewE3NRsdfXg90=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6accfbca cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=FDy9pVnie5uKVjir4MwA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=-aSRE8QhW-JAV6biHavz:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: Uzqnnlv_wTYwHFBfNOKPpURfXC_vDO-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1FZM9LIfTxhY
 JJMrrmpjccbbBVFfip2k9SDi5W1e4rM0TO2f5hw1a2ljCgkeKsdwKYA8hdg8qNDGdvnws/dxPUK
 BCfAp7G1J4LlqTz8YLzqUIchtN8uznYsepC+WVTqJxrK9Jy0IlVXOJtMRqJGYyGRc50ZmmQme7b
 IBaequYOc5dMFpY/OAIA0Pc526+b5DG3YXQLeEDHgppWLaoIvVmgf2psOz1lSm0ZRwz+JhRCz8E
 JYi161wTVui4UjDe6qJJfqd7B8XjGMfQW7ku9M8MuX7qt6kusxEq7AeXHjEX1c6qY4T9wCTFCiM
 xVF3ZsOvkfCAngN2kazwrmZCzxp1Rje1u+1YUGwksxMbwuU9rYZYYxfdXgLaYQ40C5qHoH1OAoZ
 3sr6mphCLLu85SkfORbhSmEwgVvlcpDRoe2XMF9tuU+OS8kwgQv9p37Xxn1uxpbB7k8Nu2UlTF0
 dC+sNAi/E8DqnwA4Svg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> These shouldn't have these to be consistent with rest of the style.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
