Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099840;
	b=PV9Fshvflr0YqtxNP4xXzlsvb+89PzR/EgUtKh5pKK8nUXRD/mYDe6rBjRS8/wgCZF9p
	 U4YqXUQvW1swXDfxTiQBGdocsOV0+b0mc0wdS1Hr42oPxpCTS0MumYBwx7TThvm7L+GBp
	 mqv1mTK1alxvItRwHKj00zm7xhWwA+CS1dAAB9/6BCGHuiKCuCZGbJg0V26A6tUwpN2wq
	 aGi+ncY+c99LTmwWy8mQbWWTwQMv3YzYqhCMyVSt1PrAa+24/CfmWvZnP/brP7Gp2QbKh
	 1wYV4qj0q/UEjYac7b1td6vB9L7ONiW2BFXHD1WhEtwMEGlQRR2FuV/pr8Vc+thcKJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0HUZxBK6kLlN9yABBCF2IbW/t7a+9RUBtdNWeHBGZRo=;
	b=FRJSrWUSR6I6r7P949qMWmOEGLdeBQQxVY+t7ks2cScS1gSpOh/o+ghftUsSEPuGKZ0R
	 W9qTebpt9d1aKt/0oVycm7+1vw69p3QBmlI7RgJD4+mgxctuORJ/lkx/NyWvOY03LSmPs
	 LBGSIbB0zbRwduk9FfbqCxku4jJYv1IaCK9qy25TSy++fhbwZ6cpBfkCSicD0RRwTB+mv
	 +8ez7c3Ti+0F+IyRo3ryoPIXIYJUCE0iiMVbdzepkKi9sl3Vo5FrpkKWZ7TmOGKCsPOPN
	 35kG0flvIhbqN6uf14vSuYo0RCoJ96HDz0xlL+wi18uNjuhUbSeoncXzL/9EepoIPBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JvI9dcQF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctco7fI9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7ED606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA7ED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JvI9dcQF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctco7fI9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe2bl1974129
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0HUZxBK6kLlN9yABBCF2IbW/t7a+9RUBtdNWeHBGZRo=; b=JvI9dcQFSN8YtCnM
	pkfMGvrVPecxUrUszM4xBRUQG+TkjY9VZl+aZjxwnyJtBYpl4gKa4u7O342w970q
	3/2G2ggrcqfk6CnEuSgL0QgKRBD0cZJYfQJHrOou3DHNNmnWzLFb6rQbfMmu4zmn
	WLpNGCEwPP5K1PFBPd+F7n8fFTfBaDbyiC6FJt/mVfIiuJz7f4wARc5AwGCg8FJM
	teipzRBnP2WagbRz/kVHDtkbUI3Ql03AJRwAcRCcorisscyKtejHO3nm/jOgwwm8
	CPf9DoqZorCfg5lHYborF5etKQAeXnPxcmQ75FhXYnG/NQxC0kQA5cNqJIgShgHf
	HViKqQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1g94u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:17:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so3719303a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099838; x=1793704638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HUZxBK6kLlN9yABBCF2IbW/t7a+9RUBtdNWeHBGZRo=;
        b=ctco7fI92RmoQ9jj0vtH3dFweR2+mdt/MjAYHKffvxgM5I7d7Pe4aeiCyraC/wb0Ch
         mHiyulgc2IAjlWluH+gvFjFXr8hBkZBtRN57cADcjqPu+KOgbK+4i4NQkxZmtYq5kNGu
         g1oBpB3DNC/rZ2iuF9nD1vSyTbb2pK3UAC1Gw/Z1mlZUwmbWMAQMiu5Du9DKziFB80//
         ZnhC+0Qp+xlJ6Qt+S40uv72WTaZj4xWbubfmbccl+BPSuDaFE3S3ltChPoaCbcMC+GIN
         JNziz0oe2jGHtq8DbrMfgSSSNwYAelPeL/hnr5MZtwC8uiimuyMQV/kZXt35tcKSD7tL
         eyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099838; x=1793704638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HUZxBK6kLlN9yABBCF2IbW/t7a+9RUBtdNWeHBGZRo=;
        b=n0I/8fvcJtIixC61daqNscikqRReW1IiN3cq6x8KvpAXZBljbR3kakzW4sSmz/enGF
         +e/5Tau3gCY3XsKfqwZLHQoupsSLDhtrr2lm5mHkCbKT7VTO/maZi9dkZJgpuw09FoLK
         4dvwi6MXBPNUIhhZKNV/EIXl2bXiqbYHuqhg/xiDjIJbozfzkKnIFN8AFi9dIosiqsOL
         W718nVvF6O73k2mI2e222jdwG66y6cQkjxkb8vzmy7Pf+uiR6y4SfxlZ6ij7uKTnhB6R
         z4niaeFe5xYBhharTHRwVrkkwIk7WM84LLHI51DCJ1bivXai4znCIyEe9MazBRfCEC+y
         Exjg==
X-Forwarded-Encrypted: i=1; AKwUvBxDF80r++sHPliN1hMp8zL1mUNUOJn4HQuauTdmoCVFjRL9kMaEUmRP4BPtm/+qP6IfL0dTwzH4SCPUpoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC40buVXWQYRIJdwF1ZthZ5U6a3ve5vwKGHg68ve5ILvze6WG8
	c6xhGG5CDjYBt0RHjBZB6dQ1lXmM81wsA9IyCPfTfmW0q7F/7ABFJ2e3EcCA+rEN16qupaYT5/e
	McT/6YXqfWMtBU/8EkR2e0yyhnBtIewjjR8pD3lS7y52XAmhsfCFiBBBGa484eCnIpr0=
X-Gm-Gg: AYBFou10Hzk1ps/yb+qa6mIQ/m42ziYCp/JiIlfPMrcGGvpPyTnSwe1P7LpwV89HqFu
	dOX36dwWDkPPTMXD85Z3jJIc7nMH2geWNP+AoskGficHUYCE6CsE9WB7d4YjXi1oyxNJ/P9JtMn
	URmkLK0uzQ0YKMQWpXHEfF3O3ZFPn02UCGC/JmzYKM2MfIPehQ6I5hKxyAsXar/c+FipyGEnT9c
	9xlXViNnhHkU/W3NKMmTeLqPcBB9gF2RRZjlAfioX/Vi4cClJj4Ae0h+UblZRGTmvgQrBlQkN36
	Ovv9LRmsvXBoR01GrKeMzpvMzuMlp7w1pr0xdM/BnloRjeAeCcUz9vmfRahup1A9QB6Tj+4Xxrh
	jZ7I4gqeRzr7L6bVW9dY6O2doin3k/8MQYSm7ll78ogC2u4364AitaQ1/PLFiS7G11iO6DQhZDw
	bumg==
X-Received: by 2002:a17:90b:3904:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3adeaae5caemr7900145a91.19.1793099838180;
        Tue, 27 Oct 2026 04:17:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3904:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3adeaae5caemr7900124a91.19.1793099837681;
        Tue, 27 Oct 2026 04:17:17 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba31797sm8511118a91.1.2026.10.27.04.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:17:17 -0700 (PDT)
Message-ID: <857cd18e-19a2-4329-8ed0-a61228112b96@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:47:11 +0530
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
Subject: Re: [PATCH v5 08/11] phy: qualcomm: qmp-combo: Remove VCO_DIV
 programming from qmp_v8_configure_dp_clocks()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-8-3848c2615d5a@oss.qualcomm.com>
 <11c7f9f6-7a9b-4b46-93ba-b74153744a1a@oss.qualcomm.com>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <11c7f9f6-7a9b-4b46-93ba-b74153744a1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0883e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aezud_-g-FnJNVpHNpMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 4yjEYZk55ILTLYbjm8BVJaiV0nOXLp3U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX/P+S8pb2AD6Q
 ZblEb5QFt56Fc+3eer540nNsrbCcXznTkEbZSUOI9mI0GqmvNDgwY2GAlkCbR8Iw9BbSqle0UYk
 j/cvXmOQVYv+BginyeG2E09zX3pt2sw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX16jDd6ngT7SG
 nziXohIHBBUvl2nvIAZM1c3+wd8fZ/WQs7+wDRh6vcRPbUJXWJMxwxmEWlk7T0sJ33yq0pl5gZ2
 YgNNWl26nJo5lTWzzSwwOTkxhkqUghO6BfNYnTHNQ3yhgF2J3i2bBCISMlBFG18zqsM3hLYjrRT
 0eblA2PFY+WqLSGWaBfZTqcsV1mHB0/04Z2p+aZO5+6fDiYYWySNLIu2aiqRuwcM6N4yUd+BDt0
 ArlUjzeHYrOAFlGuiZhhwv/uyYqh+mm+fNlWVfPKn5x2uPHYEC2mElSt3z/og3f0iI9/ZQhkc0N
 BkSnsboQHyBBhdC10YXbUlqBeG2Xe2cTCyW5dvcsTv6U1xf++MDMHpiqSA/KgSi8aA9Rgp+NnpE
 H2H64RkgF+did+jBRTZu6XoJvOds1fVbkJeu5kuOiGYtyCcUGMmKgLH1bTgbCW7jCdYJQQcTtn9
 FUerp/i7YQi1UoE3/bw==
X-Proofpoint-GUID: 4yjEYZk55ILTLYbjm8BVJaiV0nOXLp3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270044


On 10/22/2026 4:06 PM, Konrad Dybcio wrote:
> On 10/1/26 11:34 AM, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> QPHY_DP_PHY_VCO_DIV register does not participate in the
>> divider of vco_divided_clk, it can be left as it is- No impact
>>
>> Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
> The way I read the doc, it can be left as-is on Glymur, but
> not on Hamoa

Hi Konrad,

it seems Hamoa (x1e80100) follows a different callback — 
qmp_v3_configure_dp_clocks — while Glymur uses 
qmp_v8_configure_dp_clocks. Since they were already on separate code 
paths, I believe the removal of the vco_divided_clk write should not 
affect Hamoa at all. Please correct me if I'm missing something here.

Thanks,

Nabige

>
> Konrad
