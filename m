Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737358;
	b=mbB58a+nK5z4jhSUMisD1mQRQ4wp9Okipk3ZQbP4RfUMdsBocNoGzcAMYpDWMIMi62eQ
	 QZk0pylSE2pKeZORvlUK1w6NVbVxzLfRzvcggYITbaGnyz7rYj4P58p2q+mXnW1BLkxVx
	 b4A8h6t04jF+0VT7TYYUOBdR+pxihtJpzQwsS7YqUrtYZEAFkWcHCupljh7QM9w1+Oihw
	 IpfOoPNQ0mndSCWlYTD54mz5R1zhnHPq+5SmzmRv4DstUw/U4KK5AMQ1o1Gokm8a1zeBp
	 L8bol8HREO9o3PZJw5g0nI3668XAuzfdg7j7k/3u0CwU98bsZKEvbsuUyoQ9z4n/AFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737358;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=;
	b=pQVC4Kw3Lp/FM1p/7VgZT8DAn/mVEoct7syhzI0LrOsyA1aSCcX3n449EvDMXj7q5QYw
	 HsqRWInpT1j5L3S9iwX8n98FfGVGpOm93tm7WQgZRZMMQ6WXx25a70vXeL2EQVth6YNVx
	 nWIwnCe05cRzh+miPQy0jBGLyjrKrifYtO5OFrIc8BOm3johlsCQygLyFvMmNx2bR1IZI
	 4gMoc3D73IIRhBv+cEJJb790+b5wPH8JwLZW3qo7uIgENAOxMruhVi8RHrvzVhcvEvX4T
	 kGQgePgOQUq7WMJ7rCge8xYnz9cPHdB8JQPMyojiFEcDdcEEClJYP/ecXJ9/amlXfqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSfuX03Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ggc4TNH8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413DF606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 413DF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSfuX03Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ggc4TNH8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1EtT7772889
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=; b=aSfuX03YfS+94pFv
	7plch/SN3ozY0zca1mXWGPSdS3DaJmoA1JcxwoAjTeqEilifoP+0UMqWYms5L/5I
	jEfZw/bSM+bto/WuOO4pLtU4erDqhrHw/3Fgt/u6tseicUkIIYM1lK4hcLG2fupW
	nL1ZUtv7mrFzGSpywQSImgTozvUv9WFf4bFPaGpZQ/ghpa+wtmi+YZaZLLETO+JQ
	3XOzidkr68huM+J7biySdI4ZK4/MLMwiA+/cZTAYi8xMPmv+aliXo4WLqt93C9sa
	YlWhXgt551LC/VfgAcSsBAME/8fwaugdlWCyPUepAu8LytVA6mBpk1bT1/Cidpd0
	3LF6fg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtt8np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:35:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df375fb9b2so5765595ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792737356; x=1793342156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=;
        b=Ggc4TNH82qvF/YCx707qgFQuOLIfWJ+AQUY71FbBZRC6DgRdvoGzx+IOUHHDEzVEhP
         Xgzr2wJ739x/x6Y16ta4tyMb1VeR4uMBeO/Slc/fP33idWeQMCz4g5hhkBpaI9smgbzI
         iiCs6kNxKUilOEtYMQ5QdLypdYoxG7NlvAE1HtzYzIPo9sUO7eTdWMJueR2J563jGv1Q
         cLvQtMAmY99FMiMt0D2A4dBTgSsYx3khLFgAbscq6eszoBbYE/gyqvOya00LG/Md4O/a
         l4+2+A+GrokhN7hlCvaGiGr0nNWl6wOIYNHw4vm7bobKc2dyCgUUgh4YkZ28KFdJ7wkm
         RItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737356; x=1793342156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=;
        b=twpD/Bv4Z7CIP2r+7QNwAQrVRyNCSccTncKaYlBGIoLqy7y1Lh8hWFg+vC24801dPN
         y1Uh3HIk8zwTofZHLp57V3nNz64mJ9ASP61MOG4/lRISuATh1UqbXOlL2dcH4zMwfpK+
         37ZK9rIU+LSNZCQ51oEMB0Seat8VPCG7ThfjTEzL8ZNllKp/8D0jxDTdzGlEyOF6cP/d
         HXD9Adhj5a3PERmUANCzk/c7J1c0o032ekGQ0o3bgxOXOCn12nRqSkPMb1uLnbeclsbJ
         15fYDQu2Ac31WLof8xvEZ5IH/2tssNY7fPyEyUB8ydfckxm74P4qTS/mDgM1t26euvxx
         gOOg==
X-Forwarded-Encrypted: i=1; AKwUvBzOjoFv5VH2zY8gIcd1IsDSDwVLpUvXhrjTSVim4dP93+4cZ4EHxslB1jXlqgl9JoFp5JnK3KPRzZN3S3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKf7JwvF9hL5lBsztnf22vuCUYu52/8/nfFCYjGhxmDbcTKaTMi
	A7IWazPQEobcbymedIT3bTzxgN6WoF7uDXz7KcKV+7x7OPRpAsyI3bBWW33sk0AnNNIIXVR42du
	p7ftYrisMX64O0aU/mV69RUcBZ/byqJDY7AkJH9gVjYZkl1RSsQMBBp8Ub/pQUVRkdhs=
X-Gm-Gg: AYBFou31DrWoWVlZThDx/jh5vkGQdSBxSHTS4Ted2+GhLmpvYpWy1+Sfe4jZxnO/1+Y
	Kto8D0yOAL8J6wXjcsGdAforEkHX4RrMhme0fSL9YXmhtYyIirn5OO+ZYVgHB9m+JXfLolh71cQ
	aC0jGyzUA8mk2b13EHEyI3bwdwN7QNI9Ad19rVdk9jyY+7awBEe8cEcXTtD4GPaeVQON0vNY4g1
	sE0A5dA3Pbt7lSb+04tJihWT5k2v/lk+IoB9Iff4nL7OnTW79V5zNL9nMO+1waxGvqBgmwlw4i1
	mNyg3FZUXR8+efD54UlgQUelL+438uFXCbQ+6wfIGegJJK8sgQcoJeMNwYSOF5vgW2HQkTWWM6W
	WTTcK+p31cPYzVwPeKaaElGX6dhBS8oKo
X-Received: by 2002:a17:903:4b47:b0:2df:afe5:56ab with SMTP id d9443c01a7336-2ea7c2e93b8mr13960725ad.29.1792737356540;
        Thu, 22 Oct 2026 23:35:56 -0700 (PDT)
X-Received: by 2002:a17:903:4b47:b0:2df:afe5:56ab with SMTP id d9443c01a7336-2ea7c2e93b8mr13960525ad.29.1792737356123;
        Thu, 22 Oct 2026 23:35:56 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b343d1esm6107115ad.23.2026.10.22.23.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 23:35:55 -0700 (PDT)
Message-ID: <adffece9-165b-4576-b111-6aa40a443734@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:05:50 +0530
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
Subject: Re: [PATCH v3] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>
 <20261022140139.GA952798-robh@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261022140139.GA952798-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb004d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P-IC7800AAAA:8 a=07d9gI8wAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=9ErL3UT9lRrTfhtYDI4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=e2CUPOnPG4QKp8I52DXD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: A2Xm8VUN-R41V1D-QTimqDPOkEP8VF5E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfX1MkJJlioSGNt
 1pdsFVCNNz1pkNKiDL7YtN/5P5NpJCgXYny0jtnSQJQYxYkG/G309sDpMpVC2a6uGFdXx9if1Zw
 HDbZ8aoKNT3yMGOPCgGmgjkKCixC+0/mm2sPpU1hs7hjl6wf6pUdNhReg6TZ0tfF/XGGTjts60N
 LehUIXWs3mmIQ73XKiZf7bK3/fYZvvAG5fGuwPA8mRUZtENHLb0Y1W0MU2XO7uC0QKdx2HtPXDE
 19d86+bfdx6LrtceAbuevnePGuJkNw4GdbzMjwtvC+6o5rAcNsgD30l9WUB73/zNBtT0dKzsoO8
 A2zKq4cAvFcN6f+cE962MQFN2Jq9reWlGy04W3Duh4VoIP/26Zddl3EAN443loeQgw5Wn+m2BfE
 w9d6eDDV2vMWep0GSLwOREksk4lNA5QBCbfc/yL/8uWCWha30Tl/IkTmwUoHC5+k02ad585z0+r
 mZkq5YHlwqRjgWX1d/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfXyxc/kxWUfAI9
 3N27jQ9le+QZEBf0PTidxIB1hKNcvA+9DVaiagFj3zkR0izuMIEIWRx6Ao2hfQG+QVG2Djb7Xt+
 /lOTEk0rzfKgZC8PImznV2OylBJdhM0=
X-Proofpoint-ORIG-GUID: A2Xm8VUN-R41V1D-QTimqDPOkEP8VF5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230026


On 22-10-2026 07:31 pm, Rob Herring wrote:
> On Wed, Oct 21, 2026 at 11:22:35AM +0530, Vishnu Santhosh wrote:
>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>> domain, preventing it from accessing BAM descriptor FIFOs allocated from
>> arbitrary host memory.
>>
>> Add an optional memory-region property to constrain DMA allocations made
>> by the BAM DMA controller to a restricted DMA pool. Access permissions
>> for the remote execution environment are managed separately.
> dma-ranges is normally how address restrictions for a device are
> defined. Why can't that be used here?
>
> Rob

The constraint here is access permission, not addressing. The modem can
only access a carve-out that is assigned to it through SCM.

The soc bus on Shikra already has an identity dma-ranges covering
64GB [1], so there is no addressing limitation to describe. dma-ranges
does not reserve memory, so allocations would still come from the
general page allocator, outside the assigned carve-out, and modem
accesses to them trigger an XPU violation. It also applies to every
device on the bus.

The A2 BAM on Shikra is not behind an IOMMU. restricted-dma-pool
provides a dedicated, per-device region, which is the setup it was
introduced for no IOMMU, with firmware restricting device accesses to
specific regions [2]. Stephan suggested this approach on v1 of the
BAM-DMUX series [3]. The BAM DMA controller and BAM-DMUX reference the
same pool, so a single assignment covers both the descriptor FIFOs and
the data buffers.

[1] https://elixir.bootlin.com/linux/v7.3-rc7/source/arch/arm64/boot/dts/qcom/shikra.dtsi#L508
[2] https://lwn.net/Articles/841916/
[3] https://lore.kernel.org/all/an27PVxkCpD09xSR@linaro.org/

Vishnu

