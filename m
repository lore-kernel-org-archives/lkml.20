Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D685201278
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790321028; cv=none; b=YB4jXjPCsLWsou4hZyoeBiYiS5mIslI29s4cc/Vu83FtZObEHKMI/R9vVUafNQVvZZUFSzy9M9iXDRGGt3fTOfOt7QKHYbV5vQXW+yxCa8j+j2s6nCYt/A6komuDSJAmQM7RyhdISE7ws+cCCH00rw9ERqRmQ5NJ+Y9K5lwoqxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790321028; c=relaxed/simple;
	bh=TtAFYlXaYEptlGZE+r/oa4Q4G8MLw90q0w9FU1D5r90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FHNP8G6ZjB/RYMSkdLntXBG0TiynOVhlpZ2S8WAAA4O0rR59CR2fHyBygJZDcdK36/DMYXpE3EP4SqYfBpTuYi2OGN5qERCjiEv+d/gQ4epKypD3BeZ6+BHT8tO2VmWKCsbl/JqK+AklmZ3ZRjeAPStZk25WmyVMyWtSy3jB1Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9mdq6/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keo80uSi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9mdq6/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="keo80uSi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YW5j039595
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/JWi2njSoZ1wwDKZqga17FGTzS6i+4DFrIsYJdf6ZXs=; b=P9mdq6/ftwv9Xgh1
	k/JvJCQdW7gvY/IHqEXWpos518FR0PWh5pviYAbihZkuP9cI+rnsBeJgoxK12Bmk
	ZE/sQ2NGIJRhPQ5BzcAaqp9E58DNeptauTZwJRO0XLvClLq+kTDGDd0mhtiRePPv
	ofFSipzHR8WoW1MrjQsuXkl6Nl1UvNeHsX2O9w6XbFqvN77kfHmiMMHL3jJYw79n
	r8MyRv15wjb+Sc/9pQj/Qj38DTtEShqNHtlxhGW0H6epvb94uv5AKcuYruL17eQH
	8HVNmy/yp0NKTOKq6pHT7uiQtBod9LXzCbz0Sn1qbdFNLtzyKAJpd9Y+KKk/pVdA
	AvbU/A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw4653pb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:23:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3284bbaa89dso2358849eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790321025; x=1790925825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JWi2njSoZ1wwDKZqga17FGTzS6i+4DFrIsYJdf6ZXs=;
        b=keo80uSiZ7hON2DZmb47qRr+Yy8Wrq9NbXiMoitZZSqUCPXuTT9NHak6iJfPy0fLFk
         QApt9E31DqmajghtX9YYh750BIOKyzk0MMP0ffzUAXw2w+a7yrIu4fvkzeM+T0/Gl1MX
         MDjTOs1qXthGuQ52DPINStI373LAUKFoKKxrIi+iTNlut9RyAsRvR7ISC4ZJFAOgiMYj
         fr4oRRuPl0w64iVKNwXuHoapCgjOhX+Y5c1S6UbHgwDa+QubyFJUyoWYIay6lIcrwa/S
         PvMupumW2RXAlaVd27KOZzk90RfEVaoI4/SrVeGY7FqfM3dX/Y3XGTq1DCzexh6u+BKu
         QSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321025; x=1790925825;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/JWi2njSoZ1wwDKZqga17FGTzS6i+4DFrIsYJdf6ZXs=;
        b=YLePh7dy7rHjzHLahEMNdQr4Ck0y0syoAseBJiIiZT2UwF1LNZ/tEdk9v8SeKYgqvU
         wmAaJzfzk6Op2wSCLTH1/XMwcTtDisvd8723szg3TRrkFc6iXcWAfkpZlVfuaRgu2ty5
         oQcUy0sGqWWmEGmGre4jOIxlTg3UYZVzDhMpuXMrOHT2ZmeXtkWSLUzgajQ96xYmT56k
         8yyGljT9+ytlMQFPHpG+UEieMBKQAklG8AR1znCtCH5j1VUvLzWjJB89+JBgFgMs97H+
         VD4yfgIcDsrnUQmI5M254T5hwhtiWae5KL1uYY8/5rTGzbvX8/z24EovLhuqo9GZ3OeI
         xynw==
X-Forwarded-Encrypted: i=1; AKwUvBwA+yke6E+px+j886AqIL2a+xsxIvtFZr3xrgee1SGMq82B5xLO9KfPJD31XTUSByY9/s1sLZxq5e5deqE=@vger.kernel.org
X-Gm-Message-State: AFuF++mU6whKls7l4s+qZk/02vtuqWGFGzsxsHt4aSf6yS+I5ngMgxLv
	Ttxxl6pkpvgbnHqKTAtoRBLE85DuxF58To9A+DunYyQ8nj8AZqMggPMisnyPiuWCrWtqvG+2zMx
	olSsvn1XKJVYLaNxyJPQmtibPaUCrS9G4pRsdMGzXfVGwCUrn2kzoeswADrL5zUsgPOg=
X-Gm-Gg: AYBFou3msVxoe2fQZr6mGnWli9tVlSqq9wRg1HeulVbHm0d9nRl97N7cjMxXpWutrgE
	Zu3IipBd1Pb/GG8TFwxnfJernF12Fg1YqEPI6CHcl6Snxg0AarndAjd5zfkHOwyASs0DQkF5SYL
	Wm/xr25/U7lrn47KOmx3rtta4us0pwyhSJ8yw6qXTe97ymI18HNi2unV5OJZnwagoPEV1HUqadP
	BiqGgZgC2zGBqVbcQplF3wOojLTtp4IC8B0kItbe+X2Itz2O1vSQ8oYM8N2EPjAlZRa8HhIwEh/
	QcCZrQ/bQd6RkVGw3pP6fcbKh/nj5MZ8T0OL24O2c+BWZCBEVyM/nlvSO44hhAWsO/i53eqoxjc
	xlNYz8XhIW6iaiOxWIaib8v2sPq5f
X-Received: by 2002:a05:693c:6316:b0:33e:a0c3:4163 with SMTP id 5a478bee46e88-340034baf03mr4274184eec.24.1790321024438;
        Fri, 25 Sep 2026 00:23:44 -0700 (PDT)
X-Received: by 2002:a05:693c:6316:b0:33e:a0c3:4163 with SMTP id 5a478bee46e88-340034baf03mr4274161eec.24.1790321023891;
        Fri, 25 Sep 2026 00:23:43 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414485a9cdsm4378008eec.16.2026.09.25.00.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 00:23:43 -0700 (PDT)
Message-ID: <84c8e0d7-b3f6-497d-93ac-4c3ad7e5956a@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:53:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] ASoC: qcom: lpass-va-macro: Add shikra compatible
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, ajay.nandam@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-4-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-4-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab62181 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PkPm6FwxeQMnA0nEx70A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: hreJiWkjMaXzwecDOHidyMyn-Bxsdc5d
X-Proofpoint-GUID: hreJiWkjMaXzwecDOHidyMyn-Bxsdc5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyOSBTYWx0ZWRfX0pjr6wB385TL
 wP6HBLoW3z0XaxCg1ny1YAKJBIB8hhs4LDf8RRRgfEFzvLTNr7huRE5xPcegxAVs20keEr6KhsQ
 miGJFdg8Ki1YcrUJrdyDil/2UzHaPBBVoE9NnAPv1fY+qg2B/wAzRbZ4TQaOOWvw0JUj0Yxunol
 zbUrWLPMDjgDELw21sEhLXxCBsKUyd+qUO+44vQcJxeoLtWqEfARMWJ1n131DeRm13r0RrQzhZ4
 ZTXiu6Xd4Q4XtBLOCNwVAj5YZ+06nvoSOKdHeCAwJqonCyMaCc2xgXsa/F8tLPFwsj0izPbJXs0
 ZxOoceczKRyBfFzeS7OHWKXxWPh3oaojs0XT4kXOtOh+zC/T6CWGmu41IEJySZgmyRLl8IyaTkq
 yFBnWWsawmzyDY063vtIDcOS8fmSfJX/NftLjMC7bjm8ANlbBM84mC+j5O6XsxvZ9TQHRMRxnVx
 BZxXsci7eUom92bwChQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyOSBTYWx0ZWRfX1aL0ma9gAz4D
 MMLQPXAN3UCA5lWNz0JtFSQbUaHXeRUWZDx5mjc9MFt3B7PG0aw01eUfln8Zcb5m7jw1ieXRvlI
 MqDAyl+tQkavVcJJ/pb2aBt+yOU+vd8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250029



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> Add shikra specific VA macro data and register programming needed by
> the LPASS codec v4.1 implementation.
> 
> LPASS codec v4.1 extends the VA macro with four adaptive filter (ADPT)
> blocks at 0x0800..0x09a4 and requires the FS counter to be bypassed
> before it is enabled.
> 
> Add the new registers as a separate reg_default array, used by a v4.1
> specific regmap config.
> 
> The register layout has to be chosen before the regmap exists, i.e.
> before CDC_VA_TOP_CSR_CORE_ID_* can be read, so it comes from match data;
> probe then cross checks it against the version reported by the hardware.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   sound/soc/codecs/lpass-va-macro.c | 281 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 274 insertions(+), 7 deletions(-)
> 

> +
> +static const struct va_macro_data shikra_va_data = {
> +	.has_swr_master = true,
> +	.has_npl_clk = true,
> +	.version = LPASS_CODEC_VERSION_4_1,
> +	.regmap_config = &va_4_1_regmap_config,
> +};
> +

The commit message says probe cross-checks the match-data-selected 
register layout against the hardware-reported codec version, but setting 
.version here means va_macro_probe() takes the data->version path and 
skips va_macro_set_lpass_codec_version(), so the hardware version is not 
read.

Should this leave .version unset for Shikra, let 
va_macro_set_lpass_codec_version() read/validate the hardware version, 
and then compare the detected version against the selected regmap_config?


Thanks
Ajay Kumar Nandam
