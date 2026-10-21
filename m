Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576982;
	b=gGz6T2OBG2BXykJSeYvOZNp5jzZLQMSyoK3ga1SY2eWs7p4w5OMHLbdDTjApSw4C9F/y
	 EIp1Lvlokc0keGpyQf8PzuhKWl70pZFQbT5zKyto1W+FSfFSJ5rVpSxrzx0Grbd5UCXDH
	 OwkRbvVGy6IqvFZSjTtearGjN1INXhECUwuTfwQcib00v3Pk6fEuFgCmV3wbqW/DnknxN
	 f9Cvhu0zFZMi8FhKsBcm3ci3KnUno97GxvZ7wopUb6zgW99+VjiZGH1KHJ8cGKUEGTVbo
	 /f3M80uM8U+hFhQNBrsm9ZORx+jORgQ3r/zWSbUj0YuNWSgP34xo9eQLD4uUpVKYbfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576982;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=icN0Hj4ZHyJdsIbO5eUJgi5yjxGEVaxSWAWOw0WoRGA=;
	b=EirEM5ezXdvXVkiXklzkYFi1Y4do/DomZsPj6Eo0PrpqqMGGohbVhyAW2yhcw1bnyZyZ
	 WN2qINGlHbt0nXXTfxpnymZVFuE4OWDXjybjO5Myh5B7NmDQjaiVRkcVxRBo+N4UUEo5R
	 9OD6kBvoGC+BJxfS/qH1evPnhzLadD4wloGvZ3t/wozU+YHBsCGHeOhgImwpLgOSQyVwL
	 e4jBoh3YSLJHYsgRAJoVttlHBAvoWluuDtfckf3uFVO1KN+YaLpdR8f2MVwA5bYc5tKRd
	 UkqtuJHS5cGVpqzNQjBMBA3rWu14ofgRohZv7hRuLUxAWlZOLbjlwmCjPJeYVFI48+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WvU7kcap;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h5ILwTqz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCD4606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CCD4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WvU7kcap;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h5ILwTqz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j1kN3355615
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icN0Hj4ZHyJdsIbO5eUJgi5yjxGEVaxSWAWOw0WoRGA=; b=WvU7kcap9XqJMtST
	USaqpwLUys0DdKOCxbZP88ZmtcjdHlcEpZdmefik4Ek1zq3Thp0cKKuOUhNfvMO4
	vlp33xGWhiQhcwYStNLzhN9pa7I9dT/ze9ArceRHOpcjAvqGtSoFUD+hvVxfIjA8
	pzXWTWZwDjoqF46bMnCDbfjoId/GEvNkMrBmTAcAdtEaG7hsXSOY9x12zgjiA5ln
	8353l454XfmLqbm/DR282rMpDOJ5ymJJLSdTEhceAGA21waUms/7IcdfV1tdFDC4
	glO8HzBCwTXTj4bZektUdKwwfMGn3MVJpc46ipUrh4sXXvOOF8iy5GKy60IqQp95
	ryEswQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kc6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:03:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso17283485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576980; x=1793181780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=icN0Hj4ZHyJdsIbO5eUJgi5yjxGEVaxSWAWOw0WoRGA=;
        b=h5ILwTqzvKWBy3uFMSdyFHEbq0I7ec0UXAS6ECZ08urWd3x+VUhYcQB2pVwofDKIxd
         8V9BHFWy6YzHblJ2I6bVDaWMsavpUZxWmUtc4iYNkZ6OzCyzh3RK8PnDxfm/B9jIbDKV
         ACOs69hzj/wcWrShAz579nObwUaiY9f7Q7/tJ+hPPimb0vBZpWHSollJsnmtd/FM6MFA
         K8/cbGgI1dcH/Os4wMb+DdHiiP4bEM1IjGkzZCXiQGvsRV5jjPWjHInuW7t74c3IXkwj
         0mXLCsPndmjq5ArCc46mbZZnX6GSZHWZLGX0fCsq01wYYpAgOWUO+d6fTBIamRnaLg0Q
         3U+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576980; x=1793181780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icN0Hj4ZHyJdsIbO5eUJgi5yjxGEVaxSWAWOw0WoRGA=;
        b=dI3wJOCXs6ttTR0DL4qErt45DKCT+w7e12+8ETZR1pXa9V0jjr5cPlDokXIAmqRe2t
         VVEKskB15YWc4BjHH6FdjPyCpG17l0dlSX3O3wN6o3Mtp5k8TsBZCvClFx46Te5CjoZH
         B0fT/bfvonlRuBU368YhGOWhjOVFnIbccAlw5p9wGc2+0hhQbBYhRSd1i+JY3awAz90l
         x7MwRZ5wPme7f3FlbX2dUcOxXIcqlHBgWI0zf4KaGmfyd+NzOkWUKS0keNutvpjBz5yo
         Pg+vHf0XgeO+vZz3gmkjQWGwMLOHbeRV33371ZdBamt7JoxEfhNvpKKsLX8M6vUF1SRO
         JWuA==
X-Forwarded-Encrypted: i=1; AKwUvBwa45r+9Rk7sF2bdEzodAsPwhCQ36ymXE0+JJBE0pPEZ22ZdxEzJN/p1iDY66yQ65fPy/7IiFkn0pmDz5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKenoKYBOIGsQhjK1HdGFgcZALLSL1xtpe1e8BB8W2Sbjo6eo94
	TXE3luo12ks/qouEJiHh2Zuv/iiCXYG8H/B0EJtVgGDflDalLkVjRV8u0xqamJhCCNt9owxvWQ9
	dzujq5e4HO4zD+epz4jFDJHJ21RPN0eKKnCTIM2ZIuV7zPThCflVIISY6ZaVujEmBKBE=
X-Gm-Gg: AYBFou07OwbhUaARlWQPAbGiZownZW0GLqIDSnmZKsts3cTKf79XXPlFbwX2Wathcdc
	defe4u17mdJXK1jE2ZaoZDu1NV/vqupC2lhMITk/B5PsO6zvrnje5i9864W6JpmKeYPWBN7/vBT
	Z46JQze/TTzV4iqSDB29l2vJzj4kTEmAu2P5FyfowMZtEdlEoA/L6WHUJVdajrPOcdKu8TimK3M
	7WDsvavTINdSUX3kHq1AaleLuXuRRwrBYuQ+upeGb2ocJvxsoyx3rAPRA/cS+yY2qcc0BKE4Pqz
	Is3pYyjSskhXir1EdjHHNi1QqHIW8+fn+hz+RSjnvJRchgYtsrUIl12x82NyB6xEjcxS95DWRVt
	VyCDnvyFo/502RTkga4uOxA==
X-Received: by 2002:a05:620a:6ccd:b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f57eba7c8mr374434185a.1.1792576979658;
        Wed, 21 Oct 2026 03:02:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f57eba7c8mr374430785a.1.1792576979215;
        Wed, 21 Oct 2026 03:02:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679ba8687sm59684266b.11.2026.10.21.03.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:02:58 -0700 (PDT)
Message-ID: <a3293a8a-ee94-4cb9-8cc4-03ce64c1cbff@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:02:56 +0200
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
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: enable the parent when
 pclk0_clk_src changes rate
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX5DVCfnlo7QgP
 32+C7Q74ITh067Ij1ttbvQ7O7vD0aAf5TSZp8ysZb+D3IKLYR8Y1BQFHFBWtHcweWUL4kb2Yn5Y
 8lTXWN950N3UkAckRkOgQi+ZqZNOrKHWiUOSVf1z8Hm9NBSGeXDjH8+Ht5iNp1sKyGddOi66772
 gdqQEgZqv4kyczjMDa4B5az3YPSTuTBocYFuR00kX2F6vekGc6EI9RZYr9Ze0BmEFIs8BWecdMS
 imqO7NpfM4iSoRFY0z5brY+MCYZjlyA07bto4Z1iCSNrSIMsykab3oE/MURZtrVsegN8WPMTquw
 MRsdUBXVV82DWFInpV7IVeK0RdV3V1rgjJU2XCHGJQzD9hSQ3BQnNdu6BYbvtBWdahgHYqRsWto
 RngJi36xwFBpP5t0ZeoZrqFgHIy/AQFh6ruNxsEDX5oLrzNZVoyAShx/r9xfpMJ3wDmgnjONROa
 nzoNIiuJuSBeJM0aFvw==
X-Proofpoint-ORIG-GUID: MkjxgtcANvg5vWYiEE5KiAIunV3NfBGK
X-Proofpoint-GUID: MkjxgtcANvg5vWYiEE5KiAIunV3NfBGK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX3g/HXwJPZxDt
 /LLjap5ucQC15KBAVEZUllbMUYlEmmhz2LJjuNkf4D+hOHYWahIXaC6s182SuYF3+jxuVXDIP2v
 w79KVlApzkKkWqxqqAPysBv77ltiU40=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad88dd4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BbLh709dquJP9IyRttkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210039

On 10/2/26 3:55 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> pclk0_clk_src is fed by the DSI PHY PLL, which
> dsi_pll_14nm_vco_set_rate() resets and only clk_prepare() restarts. The
> DSI host sets the link rates before it prepares the PLL, so the RCG is
> updated against a stopped source, and if it is enabled at that point
> the update times out:
> 
>   pclk0_clk_src: rcg didn't update its configuration.
> 
> Seen on a board whose simple-framebuffer node lists the pixel clock:
> the RCG then reads enabled at msm's first modeset.
> 
> Set CLK_OPS_PARENT_ENABLE so the core prepares the PLL around the rate
> change, as dispcc-sm8250 does for its pixel clock sources since
> commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel
> clocks").
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
