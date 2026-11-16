Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812666;
	b=VUYEDhk7FiABhcUgnV7dt8PIH2plDXGLNsZnD25fa0so5jNcHSIKpOUzBxO1STzuzM5i
	 w/9uBQLQCNQ0MWO5icK3wt3XtOwVtcZbHMdxcHjD8QoFthmZcrsYKw7RE7HCzQaOnj+Ui
	 5Oro1xFWdZH2v2E23XMIvKNZv5S2Df294qQHw6zgUCPOp3R9/ifTX4TgwZXGdi+ttum/C
	 PsANwEliyPBmfPlBj9UQWg3s4pjh/TY0X8fYj7+FbWtsNPoFyQkc8RcjJQVC+B6SAzA3W
	 /xP+Qx5Q1Pkw3C/8nvk+8ya9xOT2EVI4Dh92WY4IYEMiyrH+ll5ck5dTmAL5qcXZo9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=;
	b=BctDZ0LdVieZGdoatbOEaiGNpQqMyuFcBYQZwMcMya5S0mz0y3JI+b03sa7YetRxSEYb
	 KlTcAK/ULX0okNhvzOcVTmOhJthME1bFgoNcSjojbfpu7Cmdn9hRi51gjUuoGjqtqEzm/
	 Ialak6snQU899BcmIHiYRAFHEqfwk/FYR/Jc3Vawo94AO15ly6aEscNsPzD12mUsT/k1r
	 XiPkYFF9S/QiafUGl32ogTza1E73sWjM8qWAjuhoDpjk15om+ydjMk+fx3IAekkG9+ekp
	 pALvDGNgyHwfiTkAC+Gv6K5Ll8JaNngY9Y+uilKPRRihx6YzcOLVM98+oqQ9+mH+k2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eZGqU/8+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJ0d9qSP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E10E606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E10E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZGqU/8+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJ0d9qSP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LnrQ322995
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=; b=eZGqU/8+OWhPYFuD
	ySKZbP30C/XMF2ZitJlxPC4u3cRqLNwbs0oiTdizemAKQjLXw321Bcv8Bd4VGZKw
	yXYWti83SgW7IMpcwN39A6zycURZRxSdw4ToTEntaGwkW/8KZ+kDuSKy9mEOH8Xt
	ySysFGaF9cIeUNxZ3N4DY9A+4fhDFas2dawrVScfBNjozNMTxRMArhqUoKyHFy1X
	sACoPuou1Ehfp6bXHBhifCBR2Z99zC36S6H4DYQ0foytGRoBS0YbzMxfIiEQhsJN
	g/U8B1YJf2vHJzIMQYyfo1fOkAZYITdEq/WNYcQ0m61OkfKI9gzTq5WnqMsZd4aS
	8x+1dQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx5bfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:04:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdacb64970bso1274437a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812664; x=1795417464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=;
        b=YJ0d9qSP2Zeg/LFjKTfPzs7IYhktn82izo8TeU8lm4LnLmbQ3pNOjbZNrkrat290lk
         ts7S5x8W5P9PXxXmmIaoyiefFbH3rsxG8tZwTWN3sUTWSI9gDn9Mud0Ig71GYa+6ASUj
         TBFYa0rwl7VPkzW8ugAj5x2ridU7c58Ufd6IYWenjmpJ0cmpZK2UCtZq50cISQfZsWux
         GJVJnaWuoVbSHpcBB3GC27/SmPVTZlpJefVgwwBh7v6YX7kja0tHZep9jKkt+aEkHbQ7
         AxIJHzsfi3E/8ybabAhZtXkiCfz3noyP+QHceoVjBZjyRo7Bl2520x+h4LTGBbTFXYMY
         7ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812664; x=1795417464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=;
        b=jh794V1EUL7amaUJwF1JvZKQ0c2z+wwTUAb03PPv4g/zsVlMf9sG64SE2ky/tF+i1W
         XXCYEiLLLMtjdCM2QnPi/l4Ym7o8bWzOuwbjf1FIBxvXB0HX1WoVNX0tNyaHercjhFMd
         hl5x2/uRYbGG+dutlajHMW2UdGEDUPlAZFNpg/QfhgtCSFzNgVW+SrDRN6G7dFZOWo+/
         oraSPLVuWelD0brwY3aLXiRjw1k7uLOuA+jptVHuTJz030ZZJv0VSHoy23+UOi9Obi5S
         mprz0D8HCD5b/SNq94SnEAfkjAgjwA+AVRrvLplSwCsQmF1Z771CU3GRkkUbu/XdqZ7I
         gs3Q==
X-Forwarded-Encrypted: i=1; AL+hErFxNx1r/4oLaPliwOPIghkyu0tivnCSnfi2YxHBCdBc3C3JnNEAIapVnpZl1euco8VREz2j+USpQna6GqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KiMyDWl05WR/9z+c1cUv5AJ4rXgV6kmL5QruWiDKV/wq+MXHI
	FrfyYbLpA2JiPXGEapFzaTyjM5upY/49GDhsc/xCVzKsJh9ir+h4JaEjeXpZnDNi9noz146K5MJ
	Jz+tVgACY2rdpIcNsqc8FqnktyhuDp+fsm+eOr6t1zcB4miV1UHKBrnVV7LRZc83TFeIq/ags41
	w=
X-Gm-Gg: AYBFou3CJw+f+o9FdXs40G2HwXmY1xqdjmGbsAEANh/yv+OFkt9zRQAZCbPbs91x6hT
	IWTQFE7ipHO48cqu1t0J4YknMcxzOay0NacUv+ZzIxDcgmMRDupXQGSrH5CSrURi8MVymgNfefN
	Scsh0VB3bIiCnBN3NkR9deTg+DO/XUI+QDpc2Fetb4GVfYBms3aHKM7OJ1KF0z7JuYFqM9fk2ww
	jW5IFJTso0slJTmHzR+NhhXyGG95XkgsubIgCRx/c6YLtP4M4VEjMCYPH+lqeRiYo1HPA2+vsRY
	T6/QCQffC5DtrEzrQAPPN9/t6T1ExCZOOEAkSgIvaszlKv39rinSOuDqAYfhk+HPGVoK8oeTJxs
	UQzhSy14UUpWHPzul6QDxYsCnfO/WGMtfxOxKCMpitnJ0hLP1O4tv7Nf+KOOc4oVjlqvl9r6Iuk
	BsUw==
X-Received: by 2002:a05:6a21:a10c:b0:3fa:7d10:d1be with SMTP id adf61e73a8af0-3fa7d10dd48mr2731037637.0.1794812664003;
        Sun, 15 Nov 2026 23:04:24 -0800 (PST)
X-Received: by 2002:a05:6a21:a10c:b0:3fa:7d10:d1be with SMTP id adf61e73a8af0-3fa7d10dd48mr2731007637.0.1794812663510;
        Sun, 15 Nov 2026 23:04:23 -0800 (PST)
Received: from [10.217.216.218] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b354sm3159661b3a.47.2026.11.15.23.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:04:23 -0800 (PST)
Message-ID: <92001145-02de-4a73-b904-a2e84645ff7a@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 12:34:17 +0530
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
Subject: Re: [PATCH RESEND v3 2/2] clk: qcom: Add SM7250 graphics clock
 controller driver
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116-gpucc-sm7250-v3-0-df68449f0e36@brar.si>
 <20261116-gpucc-sm7250-v3-2-df68449f0e36@brar.si>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261116-gpucc-sm7250-v3-2-df68449f0e36@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX/ua/7Nc6LFL4
 JzxPQ4P2h7u+nOJxQTEOmEjj//ECnzfgWZTYHgiVTMEo8u+zJgWYj8UdGjRsDdzYrobkMvp42AH
 EsAtXmAI5BD0B4W75X4FM6GbcM6mf6XIavUQA7ukHalYYv+dKGbWMJ3W6lCl0h0vSUwgTwJLr6b
 p7RgIhDzCKsbnhJUOKrEAFVBZXX4WlBbZxOZ3in38Prq9ra0ISaD4c9QjUxrJSnC+mvmTXSvb0a
 TwpUPyNWxHUzZ2uvUQs6/N9LYc/MTmICLGBHw/a6fjl9DogrpMUBeI5FM9vxK/0+9Ztu1FvMuUm
 6h6XjZv0ZSJy8GYGvyAYjKwRE4YMu7IpJQ8g8+1xuwC8MO37XQZHOrSQ2L0f8cIHxt+JWt7K48T
 RB0ptXJKFiDWM/M7cQ6JsD073eIwQd91GOKLIcOREalZXM95fw3vnwfnrZhaQzONb7c5k+C/3vM
 326l/MMoF1F77Fx3F6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX6ixGnDx95Pmk
 49eOWkPqYQRaVMIp+BfkihD0CfiB1/JU/5h/oupXA0AI3ZVnXDCArIUYFx8vp6EhOLAthUR/9K5
 G+4G3blhVbKgmUS5XM6fxs5tcDRs0H8=
X-Proofpoint-ORIG-GUID: mntZDy0EU1w7mpNHie41F7qU_eQG2NQ_
X-Proofpoint-GUID: mntZDy0EU1w7mpNHie41F7qU_eQG2NQ_
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afaaaf9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tvYaUqEbFtj8o43HNvcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027



On 11/16/2026 11:51 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.
> 
> Tested on a OnePlus Nord: the controller probes and provides the clocks and
> power domains for the Adreno 620 GPU.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/clk/qcom/Kconfig        |  10 ++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm7250.c | 379 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 390 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

