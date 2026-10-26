Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992756;
	b=KXSxF8za3JMFa5w4gmc+uIhAbMYWliZwTGWtY5MkaotmYK+MD3RThMYj7CaUglozcRLu
	 H0PNgpbyjsARY9gh+0VAhgk9t1sOzu03R6lusl+Emdn7DR4LsZtOCHQ05Jqdh+mIZXQgM
	 Cu0PhAT5P3bQId7z+iKdSor5tU0PcbCqVUfrajQrz7WQ1fLt/d1lPTL2d0PKbLVKclQik
	 5AJBsjWsF5RduB6kmBv/IH5mDBPVT3y7mYqTMFKKvyDCkv1QCq+MitYAvrX2jXnh/yZw0
	 0TRlHlCiKws3JPvn7S2ZX7Iy22qA92W2zO9cRJ6g80Mv6cJf5wrjVhEmb4GdxA1XP3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pW1samNYYT64bJe09RAe2TapYHj86RTpjxKKlwrWwCk=;
	b=EFdbNQWXNrompgKY/SyTCZJikHpSD6ipHMtIgHyad4QVLiNGbsLvhrONeoC7AhWH4j19
	 zF3QYUV5F947hSVqf93F6DetOQvMO/nFJSL6OkEz+lLGKFuu1SqzjQOOjJpJ6o51f/Vrg
	 FJMBKAHqV8F9n8MW9clG+xWMl7gMksD+y43zZbHIBHrf5rLNIZ9HdF/LCgRibb2DnTIk+
	 B/VJ79+Q2tToNFDCIQU14rPGQXWmfv/hSpKMOkT8qai0OoiwRsMuZMs0+T/qvneHo4ZC3
	 eBcAzskoBSytKADEiOXgv4AdDMy8kSoJ5XHkrDKxoTpyY/M3w6J+WmSUVSFk3mNsF3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=laYZx0k5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjuJLAi0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D93606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D93606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=laYZx0k5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjuJLAi0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b5oE1340528
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pW1samNYYT64bJe09RAe2TapYHj86RTpjxKKlwrWwCk=; b=laYZx0k5KqM6PnvO
	RGu6cyNnyeLJgzKwlDEdTnQgcq/Y4sjc4sRnknyRgAc9JYmnd1p8XBqr9xZK+PV1
	8vx/RKGXni6cpjgJyURTz9ejj0SrHBiWab0RQ5Y4VakrKH+BCXCrLjTVUx5xnV5p
	CyMvwkBTuWFo33OMcQAHgPw/wYY/divzGgo4Urrs6NNb78aEoslHtqrW5xEw5Ud7
	gAmOwlepjnUHb5KtqdpgsGkHCn3hneaCQtcX6D8KK/zNye1k7HwOpEWPzoRN5uoW
	p2VL3tmvv1Wci4tfQabZx9CbiPSJWAKyJifwfxrHhO0KkhuoWKc36w9OuJnl80eU
	Hk/E8Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9vr82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:32:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a08903566dso2637058b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992754; x=1793597554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pW1samNYYT64bJe09RAe2TapYHj86RTpjxKKlwrWwCk=;
        b=SjuJLAi0cAf07GR+2YrNmh0X3mhGa8B80I6X+2VDBcEGwSkFGzrWVSWmjHY/qo7E5T
         zyOPnEh6pOM5pRvMURhZVDDTYXUh427CN3jSfbfaVMeN0dlLZwMuhf9kSLZE+SIZG2Bc
         TJDLGOVB69bb9GdmEPtY6AtMa93lo8QLM85D2OvfhC0gWRAcZECEONkc53ZFmvUMA9n5
         fjyiWSaFJRUNMEBTGQIXjjd1nZOdsGjIOkqrPQ4v54e+hgFOaaXE0HFOA8yW767VaYIO
         T19hqX1b9z3KjvpAhAgpM5obIyo+RCJxDCmpH22F1eqrjMe2iIR7eeMEzr9ezNoWAGdA
         socA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992754; x=1793597554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pW1samNYYT64bJe09RAe2TapYHj86RTpjxKKlwrWwCk=;
        b=egRJoMbAOxPmfMV0ZWexB+9rXCFgE3ilb6DD6Q3PxBl2OkC4F1uedgTT5T4kGWbPnV
         qbYiBhM1c4qu2bDsR7yC/ZMisrhw4TZ4v2vjbMOU/fse8nM4jrCirePj0wSIcat4vK65
         jbJHtzjuo4QAHca8An+JovC13y3q+gGDrFQzq9vqZH+b6hwOe+6HVwdIoe/nA8U3XLJb
         2X1NrO++I8TDX6x/Ecymedk3IAYhyxUrDObLQq7kY5OKq2aYHNyEO/VVxN8hHRb8rJS0
         Av1nndFt9U1Eks7yldtut3+lIpJbCeC8wneUXfyVErXLUOXX++lVqg8x0CTuAH2CTyui
         Ettg==
X-Forwarded-Encrypted: i=1; AKwUvBz3iuFOV+lzXbtxalccpqMzMS4Jr+oNV1786n7toWLP6jrGL1AiNKa83zBxIApmo5JoClJEy9jTPlRhnYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIKRQN1ru0F4UF01XU5BJrAmOUK5oMkPpHByay/rbaXeBTnxCa
	yIiuHS15TNQwlrsJhKtygNlp1ubmoXnSf98TKCg01NJqOSdeOnXAi0lbJGHP9juwJ2Lr9Y+oHMk
	/4Msxpv67+BUne75jw2MC0WNezSL3iDVas/l4mQa/A/aTWnHVP1HzRYC1HD6EtU7f6Ss=
X-Gm-Gg: AYBFou0fiod8OVfnukks9/hncyYByfWUeQeOHVR1m+o+6nFZry9+zswbfwa/aC5RRk0
	jrzBvuyDSetaDBoFJQUXMKngh0d4z5nQmx8gx/x5qTWZRpIntW/8z235F9eOY6F9WTzLfwKocZo
	Sp9WA+gREw1oc+j4WuCq9SH7JmdWtF5onoCM8MoEq15QPdKEVHbogvqzHdc4ghLQq1Y2hpcTGtQ
	rDH4r18/dhNF3C6yRD5TxPYobEsf/1F40l8KA91Yk3WcjYKmuPlalTxvHgBXmcQ2Y2RYQvVF9RN
	95Ox8LEZFf+nBIYnBLVLVdTdjtEM4XZWLQQ3p17aY3EVd2WOGaql5JExZA+7/+Ht/h0b7kAgrWP
	ruhSTLJxfiA9GH3Lm8Ckklk9sWymp
X-Received: by 2002:a05:6a20:548d:b0:3e1:d72f:4128 with SMTP id adf61e73a8af0-3e7c0f3df1amr4025294637.32.1792992754246;
        Sun, 25 Oct 2026 22:32:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:548d:b0:3e1:d72f:4128 with SMTP id adf61e73a8af0-3e7c0f3df1amr4025281637.32.1792992753812;
        Sun, 25 Oct 2026 22:32:33 -0700 (PDT)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccde306sm1046860a12.30.2026.10.25.22.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:32:33 -0700 (PDT)
Message-ID: <594e0a9b-32cf-4b0b-99ce-a8e92cef580f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:02:28 +0530
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
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sdm630: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-6-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-6-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yQDPiNaJzW7EByVU38x0Oj2qKMAzcEPS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX8GgYH6W6ghs+
 CC8pIbD6fOsHp2LfPMuEjttxgoT4cgy3praqRDdSsKR6j9qyVL8OWD2GKklFLFlEFuqh6RSI4E4
 NdHAkpoBnCJ7KHXOluUflQ65x6bFsV7fs/dqe6iLLU0tvj/uOl9nWJTC58/PJdlOT2diBg6c2co
 hwZRZJI8QLsFJxwcX3xI7TBJSsXlIUJzm4DoYIGzr3QZYWW1Q5OgtFP/Zdef7AQiMP0p5mLMatR
 MUNEAYFYqMhPjiqoxX+E1/UXPodYyhIS/Fwwz23gkFIjBLJsecMJwBVpqt+jwGk9fH44nIM0z/S
 g+7YQXgg3AJpVpdJ5KkYByecQn/ebl34EbjhSnKi6GECU4S+ycASfwUOBRokGZkgOT/aF8Zt24T
 OjxhZf5914ZpJt/hvuXQoDWj4DnRt50HtmscjP4KTghuwMsYKVJ0uR0qqKZNDjKUvCPsHGdCILZ
 SkzF83y1E4OaqexmgmA==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adee5f2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3XWmBZFTJKG1aVtgwM0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: yQDPiNaJzW7EByVU38x0Oj2qKMAzcEPS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX14OFJeV5MV6X
 Bw6jMUGeeokIpJ12lodCjSnB/+BI5bvtLyylLbYr5o2wzpAsQMIvbPEnNs4wanfcgjA/np7guN5
 tyk4qRvEF7H0q7ZsIXxd2Hdlsw3ju/8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260021

On 23-10-2026 14:33, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from sdm630 device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: e8e1fb5c703f ("arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
