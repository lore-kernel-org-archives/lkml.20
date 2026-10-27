Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100056;
	b=T+q1D+Jw52AH0Hi5DaKcrroomGxvDVI6pxDcQNvbkN9Jh7vuiqcpzo4iYIc316Imp5Tg
	 4npiEvwGOluoAzE5MXMFiCmYlA0dzW8P2smTmeyN1hN4DyCdOTN7Lcv2omcV1m4vqrmYA
	 An+oQh5f+HjPjtVokSMjG/gNj1QdguE+6fMYli/E0c6tuDruQSvSQWCAGzAR6y86OQ+wl
	 fln97Ndq8z6Ohw0txh7WteDL3pte6uzED93stnWWZSjWee8ls558kAGPAx0si59Tqe/P5
	 Iu8reUgQeY96gktB8zGq+dLAv1iw7y+t4GJB2CeQMW0pJ6aBLaxjvskd2904OcqvfFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1kMGzQ7umpbZhrvqiHmJPKy9EhW/4CQ2ThLKi6xfv20=;
	b=qX7ZfiK3Fk8K6NbBSO1T8N6BRAfBcwci70UWA12BPRh0pJvrXZnB3Z7s7DPnz/xioJuG
	 cRDyt1Ys9XtEnWaH3ui9rxNto+8XPolaS8LjGRX5xVeNv6tbshAn2C0f2cM9LzQoYwme+
	 eMHGbIYvGhnmBdmc1zBwreHWC6ejj8S2oZlZkU9K105D5Xj2ig2pnD13C4Zpf89p+GKUL
	 5ZRuNdNZKVPF630XAeEyLUmFPrk3Vjg5JhTN47sgY7LFGRrEo/Fu5hX54qHfnQr6kdMg5
	 S8LqcW1H2TspBaPn36g6FVpgtWBZuMuR0O8n8WA2gQq4rtPz+4UEBUsHGHWner8XCmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GydBJZbE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3m+aza0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093C9606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 093C9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GydBJZbE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3m+aza0
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe4dl894403
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1kMGzQ7umpbZhrvqiHmJPKy9EhW/4CQ2ThLKi6xfv20=; b=GydBJZbEq4BUfEnm
	PuKstUjmpe7qii4HSSwD6luUGWze4l/IyQfFwPDhUncUKJNQfxWEnf4MjtAD2mGq
	Vhc4xGQetu0KXr/r2fNtgXSZ6WdQIeLVP7QvJo07XVqelpC229FZjBmMohnN00XQ
	umd3jtEIh4/DNYTOHPZpazWXc+C0+1c+nEL2W/llxcgsDyvy2hov77yHft1OWkLm
	RQUuZW7lxN7TdlT7uyOgvaUMNMa3KlBviM0yIUzGuKTfNMz/bfe/ANM0Fn5MHrdo
	oTautnUOF84EuKPtJwFZWHrGvYkqD9CLKtPmPCICvxYonzX7YPl+b/sSWxO4Vitm
	9fRDOQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smv6sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:20:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53568f05f8bso12956031cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100054; x=1793704854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kMGzQ7umpbZhrvqiHmJPKy9EhW/4CQ2ThLKi6xfv20=;
        b=B3m+aza0r70wxN9PQnFJIUAtmhTCISIzE5yL7ARzvOGZNe0k3SeL5BM4K1TXB452of
         bL86Op9uxMIRpaFzNuXArwmrM5xeXxbQo5bGWKTZVbrTBFsbiWwtsK0g//69BBquk+nI
         7VKcg5tVbfOvHdqRIso5rBT/6eLJezZOtA16BuCHbleN5WabR4Gmd0mekK89QLDfXNFJ
         J+uZ9BcW5bE4YozrUDx1iPJ8WYab8mdRhel1qMc7mAjCxQzHakLsSkvXXbODVsyas1WH
         othj2/0Hp7iy2ObCeIwSiH6JWWkSNwJE6wQVrVv95R7F2HQv5QpRxW68IX50GpaNDlCH
         HBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100054; x=1793704854;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kMGzQ7umpbZhrvqiHmJPKy9EhW/4CQ2ThLKi6xfv20=;
        b=Bl5nElRmZFd2bnzbqit7WWdkf2b0vskjP2r/ZrrheH11JSpCQoHkF6HmPzt6siXkMk
         N/O6zoZoXJPwGRkPmhwJRl/rYSb7KwGBqGl52pfyZzH6AhxsJCp+eUTawqJzcb+bo4Zx
         wrG3/wTmt9UoGiQhvHDPR9yROC8wnWnpkzoXllur0OgFvf5JEjfjDS+90Gc1sr9UkYD2
         /pJLmJ/quA+yq4w6DQuEauno5oSzZ6LUwewNMX6YdSIBQ1qhkgMIugpvCuAttJ85cy8x
         2ZSYyuiBeKLdNTaAN37dop3jfEQRg9e0F2ftxT7P4J6DPl0zsnbpg6mHSPO98HywFaWr
         4qpg==
X-Forwarded-Encrypted: i=1; AKwUvBwusqMAcnBj3K2NLnCk379nzfHFplvvEkRyGXf7g/1jrrZrsN1TN3PnDJHTtJHB6mqNxTLWtXEgBlnPIM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbZgB7+xqpGYeFWI0Yrp5LQDSSaFXnJUfkLIWUTn7bXslMNpk7
	KfLBSEhhD0CZld36i4/bHFkvGlsKvUsGwF2/DhzxzDTXf65CNJaAXWt4IYuyxb0T0nder2rwvkS
	bD2BsKILXKjfo5/nV8XqBuvg/8SxGQeLBhH8LD9fzbLt0MxQKdDmMepomPw4mhE+biJ4=
X-Gm-Gg: AYBFou0R/N4jBeUPk2kHqtmljypoXS2ABMjHVwnnRhecb2e6Zy4j+MQk4mQcbzm6sjw
	Xz1Gzgw9CIzhDKi8npMmob0Q8AzsoWLfqO+hSoNyXyRz++44MTOd98D7hVBP4bwk8IsFCeJM6zQ
	wPjeAns+1SlYIXoph1d3fy297cmnkWrSJBPkuWIrvWwVR6pFe6WdF/sjwPgsTVG+JSTLGwByA3W
	pEBNjQlOkKBQ5lh1LUWRDUgeqMx4sk8PH81XVgXP0EkM7BZbGw1E8WQBFpmGPaikUu6dcLqkx8w
	FSm5NqyO+l1OZFuFTL+gZ5+l4Acdy42k/nMgf5ZBMm5gk33BzAw/M5kgMOyUBgFgjt/iKVZeS4a
	ur0qs+XZS1xgncFEUOAvNOQ==
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr1114252085a.5.1793100054293;
        Tue, 27 Oct 2026 04:20:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr1114248285a.5.1793100053788;
        Tue, 27 Oct 2026 04:20:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b45f7e6256sm3277505a12.31.2026.10.27.04.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:20:52 -0700 (PDT)
Message-ID: <a276db23-126c-4ac5-9cd1-5e6106925660@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:20:50 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: monaco-ac-evk: Describe the PCIe M.2
 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20261021104709.1428234-1-wei.deng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021104709.1428234-1-wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2wqIKF4Cy_dkOsLudnLepSLUzjPWePkz
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae08916 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1tuRgrbA9oXq7jUc8RoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 2wqIKF4Cy_dkOsLudnLepSLUzjPWePkz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX95S2ezUmKTaB
 nqzMi+AOOMWKIyvk8cr9SVfcgHZD8l1kNidqds8QUnfrvpiEK9/fL1ZHUbxqnWhLRhTJ6EweR5a
 qA1y7DnLJ0KPbvekjUl2BaJRNWyeLK4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX/LhHR8Ih3T1o
 q1dBhy4F7SQOQ62cdkMX/lf3wZ/7VsB0uqa5ZGcwRWewib6ceqbannGwEfW4+D1dVPQ1wNGGfOa
 QhSByceQchZKTN/fvWqjFTFMKb5se835vhI/PV2rAiHq1XZURk8T+YG16w0QuLh5e8n2fy9Ys6I
 12enCWF9sT9BMbDCvVRgBgYzv9NNuY59eJFVEh/0MTtbk6GdkqwGEhEJS5LOnEpKwOL6ZVfubx0
 VcyZAF64Fu2Lqk5ap8m6N6NPDJz/HBo49+AbFl1MJjKcE4BLWtW+SadDOaqr1kwLppjgNljTsJN
 rE9l9DMVlaNqceVYuBGkYseciPAn8o4i/MKwiZo0LMYBXOQTpK9rjl0ZMOBZO8TqNxDTmHFs/M2
 HOUrH+fzPMW5YXr8IKAo2Nx1wNlda34P+zIEq8sa7j9xApRluRnyDZuApvIKZbllPjV3VXyJ9h7
 TbOsCDQrkO6Xr4BXfbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 10/21/26 12:47 PM, Wei Deng wrote:
> The Monaco AC EVK has a PCIe M.2 Mechanical Key E connector to
> connect wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART2 nodes through graph port/endpoint.
> 
> The port/endpoint nodes are defined inline in the board file rather
> than as empty anchor nodes in the SoC DTSI, so that
> of_graph_is_present() only returns true for boards that have an M.2
> Key E connector present, preventing unintended pwrseq probe on boards
> with soldered wireless chips (e.g. qcs8300-ride).
> 
> The connector's 3.3V supply is described as a fixed always-on regulator
> (vreg_wcn_3p3), which is required by the pcie-m2-e-connector binding.
> 
> Also add the serial1 = &uart2 alias, which is required for the
> Bluetooth serdev device to be enumerated on the UART2 interface.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
