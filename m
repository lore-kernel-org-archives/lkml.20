Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483066;
	b=nEm3xHbUlA+Cs3HpRul7SsP6Ht8RReSsEM0XTB6IhtrSnSoxAb9ZtY/LmEmrcQB07/S+
	 3xhVAjy7/K41rbPHKtQKQT5tHDDOXFkWdzhMZzuw9fIXmds6wBab3A8T4t79Q9/6EzWOF
	 1kWrYJaqlg4TQqtAIytnNpq3gwcmafSz7bAT4gEbwuPs+DF9UnLZApQS4qMaH+N5krHAn
	 yJopJo1Pz6GGC8jTUhkbzGJkMgDQMhoADLgx2nj4Dxf8MGmJdxd+0Cy2bijKes8VWQD1W
	 TCtXTNrl8HIvzcux7zGG2Sm7luOeiCb3EEvdfeBw5ctKuUSq/u9oApiWw2CR2FuPXWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QtaI6ngPGNeT1DD/YyV2Ag57CpUXifqmSKUI2JI3pK4=;
	b=m1qjNJosIfn4fBBX8yFR/QS71rQxEXJ7TramoD3A/RfgPRg5R5BDgawZ7g6MDhE/UyfY
	 +FgH0gDBOhKHL9solnJMh0BqLm9a1PbhtG1Yd7CGiDmLx5rwgJWXtWMOii3W8fnuou6wi
	 Q/ObzSrLPm8tBL1J6RxRP4fLaJvPmQLkODi/3OgqqrS7AloA2MoXobp0kWXluQRl5HJHB
	 fXl+9tWtUkSWFV5ZsuHIS8qpj/GnB6qU8H5+kodcyfzcKq4bZlb4/5M80A2tFvMhrvLZO
	 wCOxM0goHzHubF6L3E6ddN/gD1g07g1Io+fsXdmOLNWjRopXv7qeDQK7Wi/Yzl4fIAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noy8g8YV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHaDqmdR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE5C606B59B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE5C606B59B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noy8g8YV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHaDqmdR
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9DvmK480051
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QtaI6ngPGNeT1DD/YyV2Ag57CpUXifqmSKUI2JI3pK4=; b=noy8g8YVf9J5rPmJ
	UwPBDCfjMPKR0RmF3O1R4xqqK4215RtxouUI53FnNoC9ggbOyZ5yfKNhSw5DT2vj
	pJ93GKcm5Y9lx/YDIYENjiInMGcgL3vT42v2b06iyMnGxn7bJMzvHKpfRCXCmAZG
	vCvwppkw666OrlXoRusHBZhvx5z6UP9TxyMed4h1lO5cPZWrwWQ4D0iJfhYo9d1x
	Mr9Apx1eNK2WCkcr0PwgIcd9V2J57kweSJIiPXIyezzIyYW6tnFvB0rSgp1PBssm
	xD2VZGHTH/CIpA2JeqyCllSSay5jVvY8YyxeUoEpX5C2CgGb74roTmgdwvZJ8CtA
	+nBKxA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4revh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:31:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a073778890so3526791b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794483064; x=1795087864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtaI6ngPGNeT1DD/YyV2Ag57CpUXifqmSKUI2JI3pK4=;
        b=IHaDqmdRB6t49l+r1ABPC0H/gRzWI0foqbJXdf3Oi3OOXaWCt2T/zlXktJC4NgHzpB
         WZH9o36gAAP67sG4sjCZKN5Iw9eaEgNuFocH6wKP0uEM3RCyM8W6j4bOhCjIu5kqQla8
         aPMMBnsP1KanCG2p8st8tYxnynQWmMu5vrUTmXf1rUBcHUqQk/dv1jLUB0WyC5Vu0cxq
         +6AycmpDTvbctcQNlp8nc4uYKSzOQuSBtjyiSdEXkm+NF5SkOFwGWbOUtdaLj37Bm1sR
         owPaLn/N8ZTBBLgFJeLPXPd7rY7tDvv8EleuhMyI0l8wqkO9GMg879ope2z8Y3IBg8yE
         nxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483064; x=1795087864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtaI6ngPGNeT1DD/YyV2Ag57CpUXifqmSKUI2JI3pK4=;
        b=VE/Jz8ZuK5Ra+2XEBuCNvo9Cf5PCkO/vR8KmC50o8zx+jC5UL44LlIFitxO8GQbh80
         hxWtEOd5iAG1LZ4hcolCwzkoMf2SRlLtnGdXW3cnJ16bVYF/c4F/ovUebO571bBEGQrq
         xXOXC3oNT1JbJiPHDfZvKTCBWMwyPRVMZir9dP7L9uSmlumZLBXpa+Ay9rezYTiplT99
         OLFRrTrVv6hZbTHohcrtkN/JZtvbIWLxGo147TH1UYQLIKyOiwC+MJbWKnoUyceGU6gH
         15x5N6JeMGafs8mQ+5rQUGpLVVpolUOyYx0OP0GHr/3YJ6o4myzSMfeOMF10fvvRXaEW
         22/g==
X-Forwarded-Encrypted: i=1; AL+hErFIOJJeOI2ATCtYduo/piGLUHjRjnxs0syxWUOlWoJS703GfIQ/qjyOYnBxI+1GpC84g+PJI5Q8Jorx4Ko=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jxHYkIUSQnneUefUuo76Pmy6mr/+3RxZ4KHKRbhQKAhST1SEH
	EKZMfPb9E7QKDRwVWOA81d+X42+7G85/QMekbb/BlfFKaB+XNPPd+tKmYVbJ7yRili4b6p+x971
	DohDrVFT2PfUrtkPkHNOoi8qRc+xaFAv0mg76/rFbv2qYl2V2Tml50r14KM24Pc9Fxlw=
X-Gm-Gg: AYBFou3ktIaPF/OAsHhBdE84TxjOX64w/DYl4UfzG7GcwTy/yRfzry6Irl+65lW9w62
	Imz+ulN9o5mJzPKxP/VR2Q/52hbWUA8IN0mrv8+NkE/6kSCx5dbw1dUiJiEoQFSIBVpfYee7rml
	BPmjie0kaLrnNLsztiADIgvq+GaMDsYHOVj5AJ3tFnt+iRZgvZqXpq/2IQ6SvH1XJlHS8+3T27v
	MP0RSoFUP4etF2H01G7m8trduUr6CCsj9LokXsFJet1thAJ10TIcktM5akOthwrN54Ut4s0rOrE
	ccz9tGd/xghCxpSuvBbZ0puUTzY2btHL/MMNSU32YLjidokEXrX/KTJ6Mb6E4ufIJXLnXGLVk4w
	JBTW3d7us2BzSIVEUzo3yZGXZCYeriIbv0+Ux4pD/OJK2en8SX7b9q3/91rIf/4rItXn2SlU18K
	0+u5Q=
X-Received: by 2002:aa7:930c:0:b0:88d:4b30:1c11 with SMTP id d2e1a72fcca58-8bc19dcf4eamr4997936b3a.6.1794483063966;
        Thu, 12 Nov 2026 03:31:03 -0800 (PST)
X-Received: by 2002:aa7:930c:0:b0:88d:4b30:1c11 with SMTP id d2e1a72fcca58-8bc19dcf4eamr4997900b3a.6.1794483063458;
        Thu, 12 Nov 2026 03:31:03 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3264720b3a.36.2026.11.12.03.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:31:02 -0800 (PST)
Message-ID: <172229a8-a4c5-4103-a38b-e4cce3f18718@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:00:56 +0530
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
Subject: Re: [PATCH 1/3] mmc: sdhci-msm: Enable ICE before enabling crypto
 support
To: Eric Biggers <ebiggers@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
 <20261022-qcom_ice_pm_enable-v1-1-f7a84086c651@oss.qualcomm.com>
 <20261024182904.GD2553@quark>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261024182904.GD2553@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0w1jFTP4yx2Dyg5QdKvDyuNbQcj2wEid
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX7hULf2Gb4hRl
 oAdV7LDc0TG4XoH2TwUjXeR1L6uKTZ61vwsDhEAp1rFLEkWqmO68EMbneIKpJS8DzVF3gBMf+S3
 AK+PPjlgwVGPjOzT+eNvOhcd0XwqRmg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX01X3dlQhd7rC
 zTEsvEz/epaCUhW4ZBFzZW+dEOwMVp075j44cXyQgWY1ELKTcyp4uxWS6kndP4qI2roTw8pDs3Y
 wha5tL3Zph+7dB+Y0PwmXLk/MsLKTvIsUVKDb8AeQGiByaZ+Q/nZntiLcKppUEKG6Yz+2h+TfNW
 d4F+4G6uUunyohRMMjNQsUcZS7N3GFfYRet82Ba8GgtIsHuAJcwzxxkJONtwcCzuue18ARNr7QL
 cU+lvbSH/cBbfQO54EWnHo8GnxwfnRJSWQYtXtAHSm/NpoiS+vVsApUAsGSB2k/Rr1qN0xGyvgj
 j/RncnHWfhYDNau8ZYYwdH14nJXzXNo/QxnVmwrsi0BF8Wx6U8YC9azu4ydDSLs8tWsubXmH0F+
 M0CQd0mq9hiXCTiQW3fA0l5MKuNMdEeWFtc3/aIPA5LnOW+Dn8BFk1qw188r0vrcl8bbdhgiDNu
 W5uEQeXztos+Uy9W3bg==
X-Proofpoint-ORIG-GUID: 0w1jFTP4yx2Dyg5QdKvDyuNbQcj2wEid
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af5a378 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=fvpZdPw5ZEdYVRYleWAA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

On 24-10-2026 23:59, Eric Biggers wrote:
> On Thu, Oct 22, 2026 at 03:21:50PM +0530, Kuldeep Singh wrote:
>> Remove ICE enable call from CQE path, since ICE is now enabled
>> during SDHCI crypto initialization only.

Sorry for delayed response as I was away on vacation for more than
2weeks and hence couldn't catchup on the thread!!

> 
> This change makes the low-power and "optimization" settings in
> QCOM_ICE_REG_ADVANCED_CONTROL be set only once, during probe.  Is that
> correct?  Those settings never get lost at runtime?

Yes, the low-power and optimization settings are set once and are
retained over suspend/resume cycle.

-- 
Regards
Kuldeep

