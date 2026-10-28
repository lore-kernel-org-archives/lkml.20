Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190329;
	b=zFR2LwGGPthKZnKsRY55n1t2H+xxNqhwhrmJZKkpTsK7//kLW94fvLWmywzO4z7BhA1w
	 HPC6KU+ZbP4kqdPyWCxaOB5kXXRI+JLY694fUOvKCNcHgZbWokSm3ZJqLneiRB1r3ySgg
	 Utp/bcgKICauizGlo5ig2eYE4OI/MvDN+FWURQ0rkTTdECQxUJ7XhbawaG+jy+K5dLrvB
	 ITTTcuKQXJEMT7aJ1txtruQFZW0OxGsMPjHXDG6a4hi0nS+XkJDT6dCoEw7qxtcP0OwLs
	 LZrFbZrJuufbGVlC5TjukQDLeom4DfLnSD+kwXacD1f+jSmHy+qxVBtkyqkuev1ldeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1RsGJ2QltHbA5w4L7lGT0rlrQVfd+SWN8BV1Y4m0lyg=;
	b=e0AzGSPDvvMPRNDG0T+TSyJatQXVkBh0fBOodqC9zNDuldcDcBq2HpBy232v1Rx8jSxc
	 laZP26MNY+mvPmMXi+zu89jSc6oZ4PivauOywU5vTQfPGIqBq8WeuuSdQkjOX8Gec+k00
	 CQ09ZisP7DczxLk6Vfz1D5LGFWkSGD7IJ0X6WPtyyEs4SkUd5/1gk+l1HveLcK7A6HJVT
	 iidzdCuvBgui4bjhCoTKcwfqPMNlCZJQZ2Wummz/fE/P/MKwb28or+YjxSrj+ISgGsIyD
	 7PAHW3eO2kWC4LbBRrYyt7suOrCqeWnFeQgZ7r2U9pru43D9R5suABY/1skFgDdo1jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1ksFMMs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DMeMdlxt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8610606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8610606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1ksFMMs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DMeMdlxt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe1P32105858
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1RsGJ2QltHbA5w4L7lGT0rlrQVfd+SWN8BV1Y4m0lyg=; b=Q1ksFMMsMzOif9lM
	/hAa0VBzFRCc771ob4K4MWOfDJIVRbKmwUqSLIyT2O42K7iXw/wRaHe4mk4BGVn0
	vWPvWZs4XDxfk7LIIIFQuH6omFLY1L9SH3OmxMiBV+lecYDzP1jNVwoILutc4v83
	p2MLI1ymByewjKMqANF+TqrlTBXXeBZGB1xbglkUtAQGR6jsPF8ItPh92YDrwIYz
	X4qCYJPRrf+s86o1+GVd73MvjLbxPzZxGuK3M0lFWnC/8aQbhq3CQLR7JRTa+2r4
	SefOv2F4fjhsRPFbiFtdT3r7zYxXxWwL9r2RmOZv/WykwOqHlnRJqGk1y4X2Xt2X
	faNnuA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pugbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:25:28 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eacebedc9bso43663e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190327; x=1793795127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1RsGJ2QltHbA5w4L7lGT0rlrQVfd+SWN8BV1Y4m0lyg=;
        b=DMeMdlxtsy7sfwwWKbXUDEaX3WszRNg4R8HBqCsZNcXxbcGQbG6xoxgkyxdaPXCBeI
         N7qDoVAHU9sxWO5Hf7FA0I1sI7c0uFkWliD3YeKh8TiyrcySjgmV1LWfBIQbfU2/vLKb
         MDH23lszBdqpRBgFRv6HSa+yvVBl9JzMPi5vu6uiCz+0PvExPqjGfcVG3cr0/Wt9oLHe
         1sUD8n325OrCu7cIYKNErXnUYgr7gi+ZT9QnVH72R1ai9gLX9AIkN2uXUjgKnvQbe9Cl
         bT7oPdf3Q5CLInR2oBHyIaFVotujEN4BrsVJVyGWXG4lsqzf7lu1D/xG5A74jaPys9Bb
         1GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190327; x=1793795127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1RsGJ2QltHbA5w4L7lGT0rlrQVfd+SWN8BV1Y4m0lyg=;
        b=WP9BPGvkRAWJyntPnJbRFF7QPHxrwX1zIFaP5i2UuIWFbb7z1i4oD3g/Z7+UXWolIL
         oqskVPF1bfLA9SYXyburBEpAo41IDbmkAPkmd6nyMiEzPKRswA2cN8hVEgCcYGsXkgfA
         WXc+ViTf9o3dITQdnw0i9dbWpk642WrUqbQF/gw1sHtdnwC4C+azudVfQ1cndQf9Y2hq
         bP33grS5o2o4dTsEybRmkg2tMOfn46bmRT4qti9UjyJZSyEewBvmHWSMhlu4MpQ0A4zL
         zHtwjkXgL2m9S6T9MzCZzFGRmzJF6o+m03cQhXPfd4v8IVmTLFImV7PM89EKQjVqj9Qx
         iYcQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+LZ74hIfNeXZYXWzT8lnjtMUdCV4wx1csd2LdwOth+VSi2SYwihKWnVdddBtzWjYJQmRNPTjo2llpZUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1h1UorpHj22/PlzyghFm7ldgMcHgALIzYfVDgm+JOy8W+mvWY
	2r1k11BU3ivFDvX9st9ype4C3TlJ+H/K4U3wzT9ygFuAQ1sYTFF1sSjRT3mbiIj/1x/j1XLhLdM
	SJSJA6tjzX3UWIs0h08j7P31pdgZ3Lp4VPaI/QEGuyIBdDK+5zJqZ2qCHOn9F11huzTg=
X-Gm-Gg: AYBFou1fHBS1+b0xUKOYdlS43Yx/hgcA6rGU6FMvAh+S84fetU/4PSbOCW1H/VQKXy7
	5w/dOcIeaOEoy9SDCWmZII+TKjd6bPzeth5RRrD9ufzhkPfhQacGjfxvL7fa1AIqAmgefVDBjk0
	UwHhpvysnGDJZR5SOHoc81Dwy/EawpJHMoc2ei7pplaDsCHLW/umLZ6udmMJtQRtL6YSi01y/eq
	Xkj7Rg+CaRsnX49nFxt39//+LxOfiZ7GbR/zrh2vFCI/kO3LeQPKK+n1AQXzGPF6eH54eT3CH0S
	cTNvm+sUZw2KJgrL8Z9BN+RFRdyYWcIQ8eHDZzgld45Ugq6WZmmZ+xgsFMXxAKNCM1ZcdgrMrco
	s8XSA3A1Oho6uMEs8vn1Tr7HoRABXN4mOyAy8trl7dLTD9G55Bhi39yLu/axUv9ih7cGxGj4=
X-Received: by 2002:a67:f28e:0:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d03a4e9c8emr682592137.2.1793190327093;
        Wed, 28 Oct 2026 05:25:27 -0700 (PDT)
X-Received: by 2002:a67:f28e:0:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d03a4e9c8emr682571137.2.1793190326549;
        Wed, 28 Oct 2026 05:25:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4964203bcsm1386592a12.23.2026.10.28.05.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:25:25 -0700 (PDT)
Message-ID: <a31207fd-2385-4d0d-badb-b9b4f9aeb057@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:25:21 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: talos-lyra-evk: fix sdhc_2 vqmmc-supply
 for UHS-I mode
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028121840.3111281-1-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028121840.3111281-1-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Bl1LyXctedu7I702HEbexECUFITa_O8J
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1e9b8 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FAfHesXRkd0e4_V_TjoA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX8gZdhmnRjdfp
 Npjc4/a6o3npGNFCOJbf2kgmfyvhrMcOFpmct8o5+JbEMpK+AKkefg9ZNda3Uy0YNIvHAngm5cn
 /ZE2M7HKFVU1OPMqcs5T8NOYvhvS6yXfFVX2qx+Z87g70tHzuIFQ3B5PGucFL2s/At442lG1yl5
 Yf76RTxVNalE0YHtpqxyOiphfEZlFdDbwcLDdhqFLjszlYrlVUC7OIRcxwOxhTx9o6xpC+4/vSj
 UbYBjeV7oUm0+DKq92H+1CmngYUpn3M4gwgvyWabndPnOp91OVUzTHMOY6Y2E6/6aaW8+orwyRq
 /fcK9ZvhZQiPDezYiJvTz0ffhREvNCj3lWtsYV/hxiFhTuDWKecR7enLgRVEcfi356tNL3qpm2M
 6CqTYxGq2QplIlH6MiXDInFZZDmxTNfJ5HK49REsR3KXkDWtyyQOeYQNGpXqseGCgpjHJiufnQE
 OiUIt60s3f+CHT63m5Q==
X-Proofpoint-GUID: Bl1LyXctedu7I702HEbexECUFITa_O8J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfXxGig/L3uclQF
 +f8zjxPqRs7Va+cYJoTQGo3JLmOC37cKbhpr2lp8hU7qSet5MwvfPhG6tY/GNBlLPNJDjlv1/6U
 KVoz1y6eioUCFRQkMAVZudcA0OdY+yc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280049

On 10/28/26 1:18 PM, Monish Chunara wrote:
> SD card is detected as SDHS instead of UHS-I because sdhc_2 was
> configured with vreg_s4a as vqmmc-supply, which cannot switch between
> 1.8V and 3.3V.
> 
> Switch vqmmc-supply to vreg_l2a and update its voltage range to
> 1800000-2960000 uV to enable proper UHS-I signaling.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> This patch depends on base series -
> https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-2-658fd5a7ec99@oss.qualcomm.com/
> ---

Please fix the base series then

Konrad
