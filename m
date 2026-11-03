Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793677780;
	b=QOVQDEZVTVlE+l06wABiruP35eAdYXtfBxER60O2G9ABSmtfwT7+OnZVN2z3aROdktX5
	 4txJrEQx4PGY5XhxmhtHp3+eSmYxLCSCR3KLsyYamzP3na5D+Tf21XLPa4EU3JbQvJobr
	 BGlKzLdPB/mfX+lxmwL8sWT+0+1aqa4jcCdnCF7Qi++1qqOiDTUja8Nmfunlw0ly+HZeb
	 88DhJmPU2T7yO/CdQygxR+6CCAzwAd81bR054ri5vU5KC7+Se0u2ZvjjW3ojlvX90pG50
	 jHhkBSuQijhPDIATMzZSYAORgWaV++RngyPpV5WtPSH06+EWXKaQCLXeig8tPedQgSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793677780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZ/NX7uo8xloLOcGc8uQxWAK76padB8qKwhdHOOlzHc=;
	b=FqneM9JO1CZ8Rpi33o75nJ5bTZczBynXdubQuk4kjplFGL6ikyEUuDUPMrHe7KxEb24X
	 VrasZ++LTvTsybEacKMnTdpQHCz85JUz7KJAzJP9jaNmvqSbm33ZbidQ1i3M0+3034c0+
	 Fpo9YKbfRKpPVMsTjwK9tffElYSu7Y1aQIp1CooYJtqLZ5z5fODaLCGOuPKSLSSINUMQP
	 hIEiMkIhb9dLuOE9K59LX4oq7weFY1kLRqxV81s+hmH210+BLzifhYgYs9+rGybIlzMAK
	 8MjUYc7+oNvCwtyH0VLa/pJn3PgTms+DLJ2S2Am/2a5Wxy0JuyA7DETKiyKpiPMFKyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jVXtSxUK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Qsd1z/Wd";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E96606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E96606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jVXtSxUK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qsd1z/Wd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32om7F2609157
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 03:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZ/NX7uo8xloLOcGc8uQxWAK76padB8qKwhdHOOlzHc=; b=jVXtSxUKddlNgSq9
	kpw8LMVJBMHdzSvYSjLUNvlr2VLJQJas7CrSh/IMyiVlyDVcE7I843TVHxQlneGm
	GICWBw0Db7gQkK/TqffKoDX5HfoNesmgtuhz2DHLQegvBfOKI1Qorp+yN5B30qIk
	lm3oE91pt6jQ2y3z0MLuQ7IuAazgv6liCmXM81JCeX0RiiL0MfLUAN6xqy/Lwj4M
	CS580V4m1b8JsJD3xNYkQ8l18t08tRgQ8ztnEKzowDQwap2bchnfHELCk1zbJV9s
	eCzoc4pFrhoo+WlpudCjRJCzYRYF+KfiFnO+ovXCtqTMIHQ2YFSK+KwaTuoKpuuB
	Z6RW8w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d85y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:49:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so8471213eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793677779; x=1794282579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZ/NX7uo8xloLOcGc8uQxWAK76padB8qKwhdHOOlzHc=;
        b=Qsd1z/WdOBfyrl1XEGwf+xzSOFm4T97bdfqYmNi0YCix5/NqI5m2IMwbN/jqwRHcLK
         rGxSw4wtPec8PWwkRwdZHbn9HHSkZ9oXbU8bb5bJcz6DQE+hqL/5GiuyWsvLSmcBL+1t
         kr+lyeVToLNAzXE5Ppg+UXbFA/nmXfjF0Lij+kecnhbfMk8+v75rQy6G/Jj1eIleR/jN
         LlwS3JM6p6t2T86tlQ8l2eo+lfQeWdcHawDDuDPVd0NHwP73G8UXalo1aCQ49fiAMrC7
         uQzvk3+XPH1qy9+wcz2wl7K7KeP/VgS7X2NXYr5X+xDqv9PBVzaKL1rFkwqowfpWWXoo
         81ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793677779; x=1794282579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZ/NX7uo8xloLOcGc8uQxWAK76padB8qKwhdHOOlzHc=;
        b=afwEHQummKmTrQgaQ6RIPltEDCMUmuilx8s4YiKSj5xTmYZbeNa6DJO6ChNUo2wDKt
         ytizUrJhNbdhAZwWHaLCvJn971iimkmtuRg/qOgL4fhmd66OgZZaCymM38k7/p1j6qIA
         paznNulqNwVj/7PBY/3FVVeG88i3Ss1Auwpxa9gsM9Qds9LPQV8QtlDOJmCbf8XQoSre
         WwyKqIp42aoXJUDetEr2Zu8Be2sOjpL0FTEGpdlye2tZn46eM/05EV05ar0L7SYz2oEP
         2XOdjPBlX6qPXsYortfRDpX3U4pavx25vUcUEI8GlUbSNYoPol3/T9pn4dzicC9Htt9O
         jVxA==
X-Forwarded-Encrypted: i=1; AKwUvByfza2KHCNeMEQzurV2qdCwbilG4xjmd2PFBVbavwHN6ezFTo7Ikpb+QFyQvoNnT22z4850Cs+uImiBZt0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK12Z5f/E+adfbr7Zaz3hxcdOulELLOszEJzHisUox3RXhibagn
	4BN9o7CH92cTgiqmu50Y7hzA5sPrBgIiL78vNo1d3MD4C5rInpUjFxFvfzW1gcWcvR5Rae4RpNh
	szNTMj6dhZ9OSx30qHFDV5z8bkX1Iojl3kp0fjtnM/G+XSXsdlgQdg+VQwA4FeHevtNw=
X-Gm-Gg: AYBFou0F7UWW/ZIw2o0+kXYNcKOXhlU0/Nrq9zwrm93F74RZijgRHLlAwumvsNqyyva
	oZ76roV3/1uibyUSDmVR0KQKGy30rxesvTF85oQDA6xbV+thLLiWbT0rkSjsBOhlMYqo50z/u77
	F4rbl1wAbYWN5AWeJU7iUSqmq/JHvSduzDV2gizh+wcsHpF4asiV2PbED/VWfxolPuZ+B4kmu1y
	9cfD+xTCR35B8WRvbo3c4heAj4d3Wxgc2dncLXMIPlyboUq/UN9nCQYS2otD4oO0A54Exi4ZVvD
	fT5Wro7Yz+eDKF7GMjsTYO5XrVqV9ngXDBS7V63ksgfRnK5/pWo2G/gpIqU9VRE9mRX5fGXsq5F
	ff5Au2g35P/uuIXZaZm7kX9HmrKrcmdTlTYOSTU+A8rl1FMAhm68SLp73YCbfY6EvFQjl3+d0YD
	3eXRkhAVhv
X-Received: by 2002:a05:7022:f115:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1ac5e22840emr15230866c88.37.1793677778578;
        Mon, 02 Nov 2026 19:49:38 -0800 (PST)
X-Received: by 2002:a05:7022:f115:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1ac5e22840emr15230837c88.37.1793677778005;
        Mon, 02 Nov 2026 19:49:38 -0800 (PST)
Received: from [192.168.1.5] ([182.65.247.97])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm65455321c88.10.2026.11.02.19.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 19:49:37 -0800 (PST)
Message-ID: <dc441642-aa49-4f99-b10d-695f8d05fe2a@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:19:31 +0530
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
Subject: Re: [PATCH] ASoC: codec: pcm1681: Acquire sck when bound to a card
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding
 <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
        Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae959d3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ya3+xhBzxnqkq9vGoikweg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=k5KkOgXd54y_7d7CN8cA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNSBTYWx0ZWRfX/c4by8TucrXH
 jrCoSc0/g4k7K+eVUlMiM4vUf5vMg2/+r2o7seEAxDm2/p26EXMqaGQ2F9WNq2wHJQ/h7VYFOiX
 mTgkBSLZp9LfCu34sRvD0hyMYKQDDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNSBTYWx0ZWRfX6kIv5SSEq46W
 5qqN3yT4kZOz5msLtggZ3fjXlz6Ln9Y3JucdH+4z1VMYp1oSv09R326JavmWiy1CcuJp8gC2gjE
 g2WUAVwbVT1h/ml2FB0tZcFDvm8FZxmmZ/YxSgruUuPfL6yPso1xipmd/Qb0gMSM+Tkc/2gQ6As
 DnSxYY9ChhTKBI/eF1t27sr2eiBmMppqtzPfzmTKrzD8ihxPl2tQOyaGIwG1ag8BkLXNSE2gKrF
 qJBlV8GxPbpsg8/6UX9bTT5kASmY1uYAj+87xn7ZeHahWtg8gvrBsA/YkRnBo1d9XjXS8++UKgo
 h62lAJ+H8IPKraB7LsuVG96GAYqhul2NVtBIe5co2zHBp1ubKkht8NNEb4+0Qr4VMtyEXa3BDU7
 BZ0f1YoE7o3Dcdiy/gTcNacPibEilIB6zvIF6/Iyi4MDrYb+15dr4CEssJIungco72WkVcARskt
 SYU8z578ngQowyKcMrQ==
X-Proofpoint-GUID: J5MqIo6wYpj3srRhw54XQl-LvqpodGo0
X-Proofpoint-ORIG-GUID: J5MqIo6wYpj3srRhw54XQl-LvqpodGo0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030015



On 10/21/2026 8:42 AM, Shawn Guo wrote:
> The sck clock is taken once at i2c probe and held for the lifetime of
> the device. On Qualcomm boards it is an LPASS clock exported by the
> q6prm clock controller, which lives on the DSP and is unregistered and
> registered anew whenever the ADSP is stopped and restarted. fw_devlink
> cannot tie pcm1681 to that provider, since the provider node only gets
> a device once the DSP is up, so it falls back to the remoteproc device,
> which stays bound across a DSP restart. pcm1681 is therefore never
> unbound and keeps a clk handle to the dead provider.
> 
> After an ADSP restart the first runtime resume fails with:
> 
>    pcm1681 0-004c: Failed to enable sck: -6
> 
> and there is no playback through the DAC. Even with a fresh handle the
> DAC stays silent: the new provider registers its clocks at their
> default rate (19.2 MHz), while assigned-clock-rates (12.288 MHz) was
> only applied by the i2c core at probe time.
> 
> The sound card, however, is torn down and re-created on a DSP restart.
> Move sck handling into the component probe/remove callbacks: get the
> clock, re-apply the assigned clock rates and enable it each time the
> component is bound, and release it on removal. The i2c probe now only
> sets up supplies and the regmap, keeping the cache in cache-only mode
> until the clock is running, and the cache is synced once sck is up.
> Runtime PM is enabled and disabled together with the clock.
> 
> Fixes: 8987e9a24f45 ("ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

LGTM,

Reviewed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

> ---
>   sound/soc/codecs/pcm1681.c | 122 ++++++++++++++++++++++++++-----------
>   1 file changed, 88 insertions(+), 34 deletions(-)
> 
> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index 6002da3a5666..2cc34561aa83 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
