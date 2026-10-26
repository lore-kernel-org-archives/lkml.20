Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992786;
	b=ffpyvULJU9xJtpAEKXEqGMtM4ClUHvaPBuFSWOsmLcuEjgMKH1SjzBvk/T3u0dRbNHBD
	 Cd9bor0JlWL0pi/MvZBYhf4W2TRsAsVbsqG4YP8SBI0sCCSJFjyXD6ESLQIbV0s7051MG
	 PtTOhUIGHHeQWZJ8FIEDUHb22nlg4Adpq135BQP9SM6MgNrsxZSh163Z+wYxSINCK6Pjc
	 3MrdJucaE9VI3z9zpszAr8pce9X17w0qJa0WpftMZr56ggigi591fKGCeFfptEY2DypV/
	 9kMGTUkvu0+nWgyNDN2gbUIxRbYP4ARu0wuPs6K+DHmAAls31gVcOuUqpcrm2Lt4KQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fw3YBDnl2JEKQGYwhV1bigEwA0pD9yqTO6oVKeScAcI=;
	b=FtceIEysAVCgw5kRYubsgIYm427BNR95R00+QFjMw//Z1lHZOONvjyXYLqWYCIzV7Svn
	 n16NqOnDoIpp13q+oce1ygPJFwUkdhOKcMMKdGG0ZL6zrSs5zZ/wfoXuGqwC7HdtZXQQp
	 pJLlUEo81a2r6CT23RD0fon+D6YT1SQgXD+UD77ASFlbx8DYv8CUAeqevMkHtj1szgdMK
	 CaeEr36kH21PXk+iKph5Vd6WLJsbdtWo33nkY+huo4niTBZV+smd5FxxDSi1Jbld+rGY/
	 JKvlUzSXaxtz3AKQebCqbhjp+YXdvWuY3jVopV/bwc7gvVOUq3orOaef4r85XqO119g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Po056Kel;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BzSaZtqd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B7D606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B7D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Po056Kel;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BzSaZtqd
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4afxF2222806
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fw3YBDnl2JEKQGYwhV1bigEwA0pD9yqTO6oVKeScAcI=; b=Po056Kele6m1al/C
	bHUihIf1InO6MSspmTFZcYBqxJq37uAFUxQaiCbE7L5kGRsIvgTHoUUEYMwAP8cK
	oV5VxVzJ2XEwZPoAodrIsg/BhHq67s+yTAV2t0tvHrq5kvFwgzeRpLZXd6XB+PjA
	nyorGltDu4kFjH4QhIpUpe7fC1noEfs+6w1OJYcJWvjodWrzpuj9x6MD7rUPgvfw
	4loEg7ogFIgwKxhKcHv8AYAkeRScK9mk/s5dPcHnNH1B36u+Y70c+wrKpzsqnPzN
	nbch5FYzA+yskFFeEqzczxRCZ0WqTzx+MmAvFNcYsgdY9f7+DZx9jsG219+4HVCV
	GPQEyw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd8nr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:33:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e95f8543c9so21885745ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992783; x=1793597583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fw3YBDnl2JEKQGYwhV1bigEwA0pD9yqTO6oVKeScAcI=;
        b=BzSaZtqd4yzulNAG2m1xLNRl1KUbZrkPTMVkfE4SZYF6Ebq/WDR73aowY2WAWtjR7k
         G9Y8Ver4uz7n1hFD0rmMX7SpwT0CnqJVt59xYiin5dhlZRRzHwiKdfIpovES8NthMFIW
         izZxrK5kgX4OPCWPA+y02+0L44eTWkt70WV6OlgxSuGAY/GHF3HCp6OXk+Q5pwjC29k5
         t7BXcppNu+gCK8S3JQQOOL7PwDfZ29ex9kjeAIzBIuxkQ3iSWBE+TeXHLEMw1b1rDihZ
         IiayvJaV06+QR1EaF0cXX/v5lou1hio7P1Vp6XuLiSKsjKBImHIhlkakMzzzrOYiMxrj
         K8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992783; x=1793597583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fw3YBDnl2JEKQGYwhV1bigEwA0pD9yqTO6oVKeScAcI=;
        b=UVavMrJdIYgaF9dUl6biIJlC2opES75XPCxK/YpdH9v3mwnXGVgG9dgnMqN9MFGroA
         Z7s3ijjKZhqH77X+NBF4nlqy0dd4y0/9bh2n/d/HINNHHJfNQvSFeaC2xWGBodAoqs4o
         VSPoiE6ZpZHVtl4vRRIEuLn55q77frSXjEqVqv0V2lw6Wv2gTj7Xto65cLMA4ptM7WCn
         4QUBSLH5SBTj7UtQX0Yxx4DPp7YdMJ88B8APnIUtZ3hXzflaX4y5HCxZ1bU1MFCF1zdT
         WJ18cAwVCtY5o8kqD/CwZfm+s/S3FF9cgaC4mpLo2BvsCRmiZ2VFq08Uf78rQCTayb7o
         Xhjw==
X-Forwarded-Encrypted: i=1; AKwUvBwSnCyhEGb3PhF+RsWzp+o0VVaqYdXAn6d5o5q4M5vso+O+bH5+dX2gAevzdZSJ81cK+a3hihsCrhm15WM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEOFygt8lkKDHAdQjg1a951QbpOOSLwk0e0BnmaF4R0Jdy1wui
	aefBcd73rO0R7EkYy3tNsJ2/ho2JBm/Tg49i2f2vFR8pcU1+3WJq7d1h1EaFTS5Uw+xapsiDUMf
	tQCCpIQNUE1L9fLJQWYeGx7KcbiAe2Q1Erhyc5nxgyrWuQZC7U8DrL5SyYlZ0epjMTucyK7ZO/Y
	t1tw==
X-Gm-Gg: AYBFou3LCJRIbpZm4KXR3o2ydXEatdBV/vmuHwDkj2XGcbQHzJieHwi7pnTerdTeQYh
	qFKc0mjS9m5NHVWUVKCI1SOBpu0GfxNYujJTvR7iIRSZEas1OotiNf1zYFUaRLMw0eZ4Yrlumy8
	XeVY36WtCgo54mVrXoqpVc+fxAFwciC57GIMmomr3oHSOtfkmCGSSqDwjIkmMN5Xz7Ffe0Yg2ml
	+GUO9eH87I5v8Dkz8E+CNJt4VE93F7UiYSMGbRBVF0jcrd9wIjEMSUt95G+i6dxSVEggoBUI43L
	TMOzP0wpQphL9be9PEQoilObY2sFBg2BUpJkT/OMm0vf0THPqqtAvTaUnU8HPZ0Ujb+TwSA0feQ
	lSzXmRi9ptx1JaROdmP7Mhq0OapAORA==
X-Received: by 2002:a17:903:1103:b0:2e8:3e5d:b2b7 with SMTP id d9443c01a7336-2ea9c8754e2mr48634145ad.40.1792992783521;
        Sun, 25 Oct 2026 22:33:03 -0700 (PDT)
X-Received: by 2002:a17:903:1103:b0:2e8:3e5d:b2b7 with SMTP id d9443c01a7336-2ea9c8754e2mr48633935ad.40.1792992783091;
        Sun, 25 Oct 2026 22:33:03 -0700 (PDT)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1dfee1sm11154465ad.64.2026.10.25.22.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:33:02 -0700 (PDT)
Message-ID: <520a64f8-db87-48f7-bff6-08a4bf6fa2e8@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:02:58 +0530
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
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: msm8996: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-7-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-7-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5bEEvxUaaknd4Qt8VJ5ZmvbbE939Gsga
X-Proofpoint-GUID: 5bEEvxUaaknd4Qt8VJ5ZmvbbE939Gsga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX7X6AW1Hu1oVj
 IhAAV0T0tGUwx08VJNbHGEx0bGZsu4rlQw01Afm9ApRoVBntvLNbciMnZxKOB6Z+0o6q2v8d7mZ
 DJVwMM/WT4IiuC535aMPq8KUJ7tAa2O63d9kNFaEhHQXTNyMAF9WeEvB3YkWTwWClMfgF2L2cve
 NUBiHONsgB6nq1qyQpLJsAvjRNUtmXjatf+01mH6tYrKLzMoNQiBc97EpoEQezUcD/bn22B50Iy
 kQX84YnbpnSR074Dp3Uhsd7nmk9Z8jNQFFt/VVP8P+wJ37sEBGxhb+hfJYCq99mk+BubQIEyvNF
 fhJGMvi2hCRNseFvAvN6ZoJVUlJp5uykIVrY2R+EPQGxEc2wAn8pO2O9bzwGvXdOVVl4nStg0yx
 dixIKdzgXmg8amqA77rhgAs9lqtARvWtZFhs7Kvjdi6oD+sBZR2edOu6fwc7kdhicBSHPiU/9Cf
 7tpWed6FMazlCUOT0VA==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adee610 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jtUn83jyyIc8HPFL8BgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX/BRwe+3g1fcC
 ImA0ZRvcErHEDdwtigOJJg3hJpsY8j4bYUoA7yGS4W3yLz5+YH8UbubbheUS8z1qNnvXS8pbKbi
 j9B7R8h8xtd5+o0hHOmPaIhaH4C+Ai8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260021

On 23-10-2026 14:33, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from msm8996 device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: 1b80b83f893d ("arm64: dts: qcom: msm8996: add fastrpc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
