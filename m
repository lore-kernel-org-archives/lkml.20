Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102513;
	b=E6VdkA8rTStYlX3/n0XG04U9ABO9Gd0WhQT3YNLy5vjbz+5S+t8lBoDN/EA7RxB905/u
	 yDTMiYuOP9H6A5J5X/0NnVZGRalbVEb5hMRuM01PxyFgEIOrSwlN7kN6Kkd4+qOu0riCd
	 WSb8NpDwUnZpd3eah78SbtFe2rRvQkZ7OucFhdEbtROZApOOL7rpeIYZFOmdgcv/f+4Sl
	 8UxlpDVFbwV9UqZsRUx4w6I1tSaj85e4ZukkI0aEFsbV3IlO4GAGurucozMWuhUX8dc0F
	 /Mu2P/Fc15RfrRtg5HY34+VpgcGFOxTT7oqyi1NqNVLe5BYAWeTQHjjp3N0bev/l6UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IBwMcjhkH/5qWAjY7BlvDB/LeARpzZamJYtBa1MZy4Q=;
	b=Sgd67bH20UKLVlRnBKImoOn6l5Y+iTw4EKWnvlAygsHU+Twc3+/L8Y/blxfSTHAP+58H
	 xLVCBNcpAwtRNjEtkgNfscWEAjPUzwIRtiHFhH012nblZ7TtQBMHimf58wBiD/Hutf31v
	 QwK8Zv3YibV5GCk+gOwNiwi9YolY9cC3wcub8GakLmtSaDPUsBfelhOMCScsa+mFWhSj9
	 JB/utEunyhUGyeQ5ruEO1bIhfTmr5B3ENhLCsnligyBxphw6bWrVXVkdnqc7ibXTk20SW
	 NDQkH60KHXTf69KrugGv0CJ7YbpFXcqBkIntdTYIfLvFEnLaZ3XjpwllFC/o41RudJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuCwDgS3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dVUA9O/i";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ED660A5BFD
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6ED660A5BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuCwDgS3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dVUA9O/i
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe8MZ3026355
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IBwMcjhkH/5qWAjY7BlvDB/LeARpzZamJYtBa1MZy4Q=; b=fuCwDgS3MX4ohcug
	9wXn6nsWRS1Qh/HY5RtkDsdEQ7ZuXeQwR7MTEIEEkyuNqil2HNhFRsPCgd6gNP1E
	t79WD/wYrG4XP/cQpbi6IZ2wxrOSOauxfFdYWuELFNSpeMC2iwkCaJLM/piq+ogJ
	lRLH2kr84Hb73IFgB5J+ih6X10c3xU/Q6AwZzMmDdWXROcVe/OSuxCPWQbdpzRAA
	dwf2wlK//8cx8mDjYeVJvO0SpxBPG9k8Fp7HUr2HDuFn8vjiQrtpZ82qoStNsQWu
	pLL8IzXV7guE/B4e97dcDgEc98/T0gGz5O8TnK24Td+e2ozHuGvswILC9p2mq2Q7
	f3ntzQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91ab29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-77f133855b9so190625137.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102511; x=1793707311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBwMcjhkH/5qWAjY7BlvDB/LeARpzZamJYtBa1MZy4Q=;
        b=dVUA9O/iOB1WXY7qibUkLc0BXGuALjQiOUYlrQjJ7k4Rha0Ur32tT9hQlVbbDBT8SC
         0nKDRrsuxB9XYxUNSOOXIthprCusGvEq0S+MKotdBMIS8dYtzN5f6q5IPQ6oByoJJ/pX
         dvhSwHSp3TWdBSGVWTi2b+lMMttQEVb38ilx+1aH/UFW07a1vA+M0u5nIQcOvWUKrhI5
         SUi+fe0xUmE1pIBdUfRHfbFk17mojnsxxTnTcz7CZToTFYyRhmP2taAJqpUfL0rybXD6
         Ck1iVNXl/Y/NEZhZHHLscqd98DuRQzLpZRD2fGJe59toOFQDm6epQ41nIKATUd+7rqeh
         mjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102511; x=1793707311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBwMcjhkH/5qWAjY7BlvDB/LeARpzZamJYtBa1MZy4Q=;
        b=TGpIovekSz7KBqYRMzJQGyC6Bv4z6pfWUG3wXaT+0vaGA+pHaCid2n7bNOihLdo/LC
         012oOjTxp5Rn04Tk9IMmJ4xvfmBs+yN01G3Dxk0NbFNc/kMKPtTP8yUZLFzAldCU86fE
         8l7SrLuI0DkU7sMDMRWIbvxrr0e7lzs9rUlD1dNE9alBL4mUmoK6LkEbPk1cC0asrGGN
         h0lASQ7rXx88CqueCg2YFhO4dj6PmXFccLEt1nA+uSHoqcFUkd0pKaVYBSxAiKJzacJc
         IuuKqjIb4Bl2UpfW0K92nsNtqOAf6bCkOiIjrvcX3oH9UkamH78SAz+GpospXFBmP27k
         8OCA==
X-Forwarded-Encrypted: i=1; AKwUvBypoXwvR7VY6Gjqc7GvuzUxcH60+A/LBXyaRbpt49+CXjpen/BO4g9qMhS/Fwfh7C45yPqJny8DmUg9OrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSDCTcWRB3AtCCXaetIcukDmFA0D4KQ/45Q+d832kDsTzM0JFr
	t0VfEw/uuqLn6JrDZ/L2vXmaYMfcG42unpdzEyuoWlP+hmr/ni0SFqx8mKHq6tlyaicYFrFnY0L
	FjcytwBbch3myzHQgdiqfKMIegyH8lt6lBgAmT2UQOAUVEqsLQI1KmOReEGietgLHDBE=
X-Gm-Gg: AYBFou3auR/814GTNlASH71eK41zxPJ2BaN9r8BHZ5+myJ5QM+jtfSWpNAZ1uw1gBaa
	XHNWSfyDyvPu5RnAvguxmeiWmnxIDvdyncvM3cVc4fpmSrhC+P6vuT5Wzfvq45p3O8XAMKADCZj
	5sguED77E7m89KHQcCkO6A+WAegVQd8H+oJem/49rJ+3R74WxxciYMTyvMg1jW9JFjLB+/iTSt6
	QOkPUkeoTGBjm6tRXwW/W/ymRwL9ZCbp5uI+SMqdQRToKKbIcn2+w2Ren405iFAunmZEe2QIm7p
	rzKtIQi5LbyQUWbk7H68hTzSiYUOwz/bv3hJjTf5hyx3ttY8SqPYXdIZqF8urHHUZ0SPVZMosBn
	cv+wyrfsh5+F6WhrMd3VnZA==
X-Received: by 2002:a05:6122:e006:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec232d4fe2mr3522000e0c.4.1793102510379;
        Tue, 27 Oct 2026 05:01:50 -0700 (PDT)
X-Received: by 2002:a05:6122:e006:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec232d4fe2mr3521917e0c.4.1793102509679;
        Tue, 27 Oct 2026 05:01:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89cesm445373366b.13.2026.10.27.05.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:01:48 -0700 (PDT)
Message-ID: <1dfd5e01-d701-4a59-9b10-062fd59e25bb@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:01:46 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: nord-rrd: Enable eDP0/1 display
 output
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
 <20260920091930.2215803-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920091930.2215803-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v2y9ZkgYTOOQveFc3blgsc5GpRhXyeAc
X-Proofpoint-GUID: v2y9ZkgYTOOQveFc3blgsc5GpRhXyeAc
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae092af cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wx-G1DhjD7h3rq9mWzQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX8ePDXApaSD6e
 MwEZkBddM/tMFSYzvUkO8OLiRTka0ek6baL2rCU+NCCPF4pwlEVBLWHUeZj+H13gyjeRltPIj2l
 DXMWzM67tUr29W4YYuWmtGG77iwjBifNK3HWiry3yDBFA+D3HFkDT+QJp2bfCJw4W8WCYNVyd2w
 E9NIKFAt0BLqT48sR0bIwPzMxnXiDRKKLhEbO6Xmb0kItjrj3n7WD/qnKfaOREdvGmhLQCRJbtx
 s8cUzkCwFbJNGbJ3C624viiZ0bRmsJo/2ulbSQfHfnjQMqAbhPTmWQ0UFZZlePcY4XqDMzVceT+
 Jx1QNIAJxXp1J6QREaKJejvx40gAHNRBYfDzfXHq5tGGL/BidrtpTRsAgFFfAJKLkQHbo1qrF2c
 Fys0x1GbHGbdsam8SYEuKJ3FoZQwIS/sh18vz5Z2tF9USRFeIW8D4Rg01dQtOpXdyoloGhQkcsP
 rKGGtV1DjcCpWiTe6Mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX5PXLKXRTI0vf
 kaRst2gIS8MEZA+XNFpaD5NkpTKVBmZic+A4rkee0wZz8WXhlhF5liRwPaGSl9h/8Y4BcHByydw
 WafaxpBOZ4pPaE1WeRDs1g9PfhVdVZA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

On 9/20/26 11:19 AM, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Enable the MDSS, DP0/1 controllers and eDP0/1 PHYs on the Nord RRD
> board and describe the eDP0/1 connector, its 4 data lanes and supported
> link frequencies.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
