Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1674503E4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386459; cv=none; b=ht5q77l/h7IlUh1v7u2tlKgQJ37tgUfvVrR7cSuEK6XXoY/+hIKFB0fC+7D0oTWGa9Wb6Lfro4EDeNQ7cgHPYyWYpoDPoa0m6+yaSRvR3n125pj4t/lEaQwXVfjhAtNL3ZZLb9vNJsL/OIPyrEUTCWNruQpoLeEjNhBQAmBeWDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386459; c=relaxed/simple;
	bh=Nl2hyhnIuKjaAGYEh2GWwsKII0iSAjDkgQwJ2ZJGKUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ByesdbHLR9UrtIQpU/GJM3pUpb9gkQmGafKYRLbg8YaUOPPZ98Lw5fSerTWoV3YCKx69wYrjULqMgi/vfkKiYcWbAySfaaIVe91qpp4NMsDlDhYmi/KLkdAat2aWH8i6FyzTYf9+tWK/xQRNtrSW/iBnq4JK+gD8hflmvF93qkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Spboylb9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJiXcpZd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Spboylb9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJiXcpZd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmhrm216178
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M+4iPA8QD/+p0p8S3jlJYiFHqSDdDbr5Tq0BxXtyJXk=; b=Spboylb9w7yhvIVK
	ww0+3LATHX7rlRnk66czMXcgYhYC2nfY068WH3/hFDqA5fiaVaVGrv3qLopy64Lc
	5p6UEtLTrUQ0MatmpBYzK+eCWEWZ7vVhIEEg1MjjkYuMTIi2IFSomNmr7Uvs/QAk
	A+aIfr5I/Y1bN/bQ7HudFfX8kLMM/DLGjiMsAzFVeFFjDn5ftHxMhSDz2nEAe2Ql
	iNhsfSuNx3CZipYm27NOYSG8siWi0RPKvzN1028/GUFZYp8Q2QAwMyPHd1C8rfaQ
	BycHdwy+1NZZj7JsAzOwBhxhLEEMppaZN0CMqm0JY7/wfeYN1qOio6MrtnC8SJ+s
	K4S7lQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9defcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:47:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a2d361e1aso93730885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789386455; x=1789991255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+4iPA8QD/+p0p8S3jlJYiFHqSDdDbr5Tq0BxXtyJXk=;
        b=dJiXcpZdmXSuqJuZVzPmIhExZfmM4ExPR5aOpkDp3jkeTMqS860Zw54cXW2Rcg7G68
         Wm7QryU5hHVMiVQjfsm3daHsWvaoL+xBC8cihOxRL7tYOjY2Kzdi9YFgP5lVASYYQIw9
         GZzVcpq9vJ0xJ8OZHqGYhSOQThLKpL8/Lw8L48JOfvGj+zVp9pwCY1y4oP/1HDLOVyXZ
         pP7zGnRqZInIBW3AJwzJRL/i4ywp8fd3Ia5JLjzliq/HZJQi+zt8vj6qrziGgt9oAS8E
         RuZGqV5D+rT3XUY9IkYIcyEB2QYFEJpkJ8T20vcMKZDr71qJtHolkZqcECqtEFR2j4Ia
         UnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386455; x=1789991255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+4iPA8QD/+p0p8S3jlJYiFHqSDdDbr5Tq0BxXtyJXk=;
        b=Q4UCMnDJ8oBSjXFHQ8daghuSi5DITO3Dc3ZvvTp4brdnO8iJEYe79S/SfbeAbbOEW9
         72eSTb08aaSRZf5BIbTDmLVkd4s2L1dKkMwDq14lJ9JBaQHy638/xrhNdma8LlVsxMrC
         FRHqfNrIW0xcXrcpl5+fxG14t+bBacRkbDMC6fCmeExHrFQrDmraWGxysT9Geq9nf5PT
         XCPaf9vFDOr9DAvBthFCzuPbdnKs4JtqFZ+elkPM9vzhl7Ye3obEdev1EyV/MPVg3/et
         CsOstpeQAf8NsCC+Nax1Rs5/g9YIRGOA4vIO6rExQD4c49Gd5hcMhHmBk7M3UENotN8B
         hNIw==
X-Forwarded-Encrypted: i=1; AKwUvBxX5rT2MsYx+ODdL/HcZ942rPO3wF+tyzqm+MLE1gx/sTWOCG1YvQZl49/tLjXgwJIpuptc8DnnoW9aZQE=@vger.kernel.org
X-Gm-Message-State: AFuF++lkMwdczCmFDVANG6SwZafJfV1SXRFQ5qGGS1ptXHC72a3vpgWJ
	AUBCpOl+JRT8WGmiM6IG3Q3YbLasyOcnO6ld/DqAQpOQ8EpG2c7+3yvaLxGeOMXeVt27udQ73WV
	uuShOpm2aMeETt3U7hA1PigDWk2aEw6qKErfimWiDbyDHf4j0JD62dYTSi2Y3WptKhUU=
X-Gm-Gg: AYBFou0XwL/l7uy0OAkw5YP2/yf8kJ43ddZdFdnUUjVctiKmcEQ3IL+AkHhC3Ot3Uwo
	1gvIFtJMYSyTw1yRkgUxO0pSEP/W+Fxum+sSRPjcTuRRtv5A5454m5C8eIj6uwCsbWi/Ie0aeFP
	jk/B9fzgmwP547fTNR761cIYXSDDtYuu108FF/Fk2bMjPkDCZ3iKUGvhvW2b++d3RO0m8a2rape
	5o01cJefWkbDyF/XwlpWnhYc89e1p47IM+9sk04VkuPro2yWEB/ExZIoPYP84/uo0Tl9+3LhoOT
	bwUUw+a2g4Jm7OcB6mWVtruKgg+vkMnJTZGlFKHHD0JqOqcvCyxgPtDr+4RKTckZpyGcsZWGIjE
	g8KAwwt1KQMNlHpWHI4BaWVZQEKI=
X-Received: by 2002:a05:620a:4808:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93a297e5d21mr290075685a.1.1789386450657;
        Mon, 14 Sep 2026 04:47:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93a297e5d21mr290072185a.1.1789386450123;
        Mon, 14 Sep 2026 04:47:30 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2965c4f77asm413673566b.8.2026.09.14.04.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:47:29 -0700 (PDT)
Message-ID: <8acf2491-01f3-49d0-a357-39592ba991dc@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:47:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] ASoC: qcom: lpass-va-macro: Add shikra compatible
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-5-fdd2129c696c@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-5-fdd2129c696c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2NyBTYWx0ZWRfX5unuwtm5vYcl
 J97/D6HK+Zwk4Lpn2xPd1TYAfKb18ASroPiyryGKArIoJ7agdhnsj5K9tKDsM/G8qZxTaSbGkIm
 M8oq61FgVH1KU2kT4OHrkVTkrZL2SG+maCWib8yBxW6q2eaM59t4bnz+Bxj+B2x44AF6TieBVHw
 ij5T7/OGKfxSMdIsHmM2wgn3vWNkCsMUx/ENuhUPGPf2dOg+E51h5ttqndRNzIOvQ9nF7gKLOnh
 26Zpug7HgUNHSB5qP2bn2/YIc/1L2xM9fVOVnxRODCiQrLybIaajs5OGAKbkD3O6uQiSmr66iCg
 Eor/gqASwGd2zTP9nlX5p1KOluURw4LLlNHLwxaj1qLZZCi3lJ2HztkGSQS9DiFNJ3MLsdM6b+B
 hUEnzh22EK2Ya9pT6MgRyczxWPDgzG1bVoQjfqhpzQmePj9Y4PzuI5SE131D8ojgHaqZ0s4PlIj
 n1bBSSbNIMXdbXh4n3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2NyBTYWx0ZWRfX7mVE+yodP93I
 GwacvT5WHna3TXK+TVKWfUxi9nSAytwzxZ2Dulo6Fd7xCNtdH+i4q2aBVanXT/ZQM09LnIctN6l
 W74e7dhNtxrEwGlBob//c7dikaxJ19M=
X-Proofpoint-GUID: _w7OlJ86Upzk4O5F1DhlHmyVj3n0q_JE
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7ded8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JLmBH_I5Lc3HKOleWBUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: _w7OlJ86Upzk4O5F1DhlHmyVj3n0q_JE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140167

On 9/10/26 10:46 AM, Mohammad Rafi Shaik wrote:
> Add shikra specific VA macro data and register programming needed by
> the LPASS codec v4.0 implementation.
> 
> LPASS codec v4.1 extends the VA macro with four adaptive filter (ADPT)
> blocks at 0x0800..0x09a4 and requires the FS counter to be bypassed
> before it is enabled.
> 
> Add the new registers as a separate reg_default array that is
> concatenated with the common defaults at probe time.
> 
> The register layout has to be chosen before the regmap exists, i.e.
> before CDC_VA_TOP_CSR_CORE_ID_* can be read, so it comes from match data;
> probe then cross checks it against the version reported by the hardware.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/codecs/lpass-va-macro.c | 228 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 221 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index a3b3af0d7..8353921f7 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -26,6 +26,7 @@
>  #define CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL	(0x0004)
>  #define CDC_VA_FS_CONTROL_EN			BIT(0)
>  #define CDC_VA_FS_COUNTER_CLR			BIT(1)
> +#define CDC_VA_FS_CNT_BYPASS			BIT(7)
>  #define CDC_VA_CLK_RST_CTRL_SWR_CONTROL		(0x0008)
>  #define CDC_VA_SWR_RESET_MASK		BIT(1)
>  #define CDC_VA_SWR_RESET_ENABLE		BIT(1)
> @@ -156,7 +157,54 @@
>  #define CDC_VA_TX3_TX_PATH_SEC5			(0x05A4)
>  #define CDC_VA_TX3_TX_PATH_SEC6			(0x05A8)
>  
> +/* LPASS codec v4.1 adaptive filter (ADPT) blocks */
> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL		0x0800
> +#define CDC_VA_ADPT_CTRL_EN_MASK		GENMASK(7, 0)
> +#define CDC_VA_CDC_ADPT0_ADPT_GAIN_0		0x0804
> +#define CDC_VA_CDC_ADPT0_ADPT_GAIN_1		0x0808
> +#define CDC_VA_CDC_ADPT0_DH_FSM_CTRL		0x080c
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0	0x0810
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1	0x0814
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2	0x0818
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3	0x081c
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4	0x0820
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5	0x0824
> +
> +#define CDC_VA_CDC_ADPT1_ADPT_CTRL		0x0880
> +#define CDC_VA_CDC_ADPT1_ADPT_GAIN_0		0x0884
> +#define CDC_VA_CDC_ADPT1_ADPT_GAIN_1		0x0888
> +#define CDC_VA_CDC_ADPT1_DH_FSM_CTRL		0x088c
> +#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0	0x0890
> +#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1	0x0894
> +#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2	0x0898
> +#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3	0x089c
> +#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4	0x08a0
> +#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5	0x08a4
> +
> +#define CDC_VA_CDC_ADPT2_ADPT_CTRL		0x0900
> +#define CDC_VA_CDC_ADPT2_ADPT_GAIN_0		0x0904
> +#define CDC_VA_CDC_ADPT2_ADPT_GAIN_1		0x0908
> +#define CDC_VA_CDC_ADPT2_DH_FSM_CTRL		0x090c
> +#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0	0x0910
> +#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1	0x0914
> +#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2	0x0918
> +#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3	0x091c
> +#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4	0x0920
> +#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5	0x0924
> +
> +#define CDC_VA_CDC_ADPT3_ADPT_CTRL		0x0980
> +#define CDC_VA_CDC_ADPT3_ADPT_GAIN_0		0x0984
> +#define CDC_VA_CDC_ADPT3_ADPT_GAIN_1		0x0988
> +#define CDC_VA_CDC_ADPT3_DH_FSM_CTRL		0x098c
> +#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0	0x0990
> +#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1	0x0994
> +#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2	0x0998
> +#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3	0x099c
> +#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4	0x09a0
> +#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5	0x09a4
> +
>  #define VA_MAX_OFFSET				(0x07A8)
> +#define VA_4_1_MAX_OFFSET			0x09a4
>  
>  #define VA_MACRO_NUM_DECIMATORS 4
>  #define VA_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
> @@ -210,7 +258,6 @@ struct va_macro {
>  	u16 dmic_clk_div;
>  	bool has_swr_master;
>  	bool has_npl_clk;
> -
>  	int dec_mode[VA_MACRO_NUM_DECIMATORS];
>  	struct regmap *regmap;
>  	struct clk *mclk;
> @@ -237,6 +284,7 @@ struct va_macro_data {
>  	bool has_swr_master;
>  	bool has_npl_clk;
>  	int version;
> +	const struct regmap_config *regmap_config;
>  };
>  
>  static const struct va_macro_data sm8250_va_data = {
> @@ -357,6 +405,127 @@ static const struct reg_default va_defaults[] = {
>  	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
>  };
>  
> +static const struct reg_default va_4_1_defaults[] = {
> +	/* VA macro */
> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
> +	{ CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
> +	{ CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
> +	{ CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
> +	{ CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
> +	{ CDC_VA_TOP_CSR_I2S_CLK, 0x00},
> +	{ CDC_VA_TOP_CSR_I2S_RESET, 0x00},
> +	{ CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
> +	{ CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
> +	{ CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
> +	{ CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
> +	{ CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
> +	/* VA core */
> +	{ CDC_VA_INP_MUX_ADC_MUX0_CFG0, 0x00},
> +	{ CDC_VA_INP_MUX_ADC_MUX0_CFG1, 0x00},
> +	{ CDC_VA_INP_MUX_ADC_MUX1_CFG0, 0x00},
> +	{ CDC_VA_INP_MUX_ADC_MUX1_CFG1, 0x00},
> +	{ CDC_VA_INP_MUX_ADC_MUX2_CFG0, 0x00},
> +	{ CDC_VA_INP_MUX_ADC_MUX2_CFG1, 0x00},
> +	{ CDC_VA_INP_MUX_ADC_MUX3_CFG0, 0x00},
> +	{ CDC_VA_INP_MUX_ADC_MUX3_CFG1, 0x00},
> +	{ CDC_VA_TX0_TX_PATH_CTL, 0x04},
> +	{ CDC_VA_TX0_TX_PATH_CFG0, 0x10},
> +	{ CDC_VA_TX0_TX_PATH_CFG1, 0x0B},
> +	{ CDC_VA_TX0_TX_VOL_CTL, 0x00},
> +	{ CDC_VA_TX0_TX_PATH_SEC0, 0x00},
> +	{ CDC_VA_TX0_TX_PATH_SEC1, 0x00},
> +	{ CDC_VA_TX0_TX_PATH_SEC2, 0x01},
> +	{ CDC_VA_TX0_TX_PATH_SEC3, 0x3C},
> +	{ CDC_VA_TX0_TX_PATH_SEC4, 0x20},
> +	{ CDC_VA_TX0_TX_PATH_SEC5, 0x00},
> +	{ CDC_VA_TX0_TX_PATH_SEC6, 0x00},
> +	{ CDC_VA_TX0_TX_PATH_SEC7, 0x25},
> +	{ CDC_VA_TX1_TX_PATH_CTL, 0x04},
> +	{ CDC_VA_TX1_TX_PATH_CFG0, 0x10},
> +	{ CDC_VA_TX1_TX_PATH_CFG1, 0x0B},
> +	{ CDC_VA_TX1_TX_VOL_CTL, 0x00},
> +	{ CDC_VA_TX1_TX_PATH_SEC0, 0x00},
> +	{ CDC_VA_TX1_TX_PATH_SEC1, 0x00},
> +	{ CDC_VA_TX1_TX_PATH_SEC2, 0x01},
> +	{ CDC_VA_TX1_TX_PATH_SEC3, 0x3C},
> +	{ CDC_VA_TX1_TX_PATH_SEC4, 0x20},
> +	{ CDC_VA_TX1_TX_PATH_SEC5, 0x00},
> +	{ CDC_VA_TX1_TX_PATH_SEC6, 0x00},
> +	{ CDC_VA_TX2_TX_PATH_CTL, 0x04},
> +	{ CDC_VA_TX2_TX_PATH_CFG0, 0x10},
> +	{ CDC_VA_TX2_TX_PATH_CFG1, 0x0B},
> +	{ CDC_VA_TX2_TX_VOL_CTL, 0x00},
> +	{ CDC_VA_TX2_TX_PATH_SEC0, 0x00},
> +	{ CDC_VA_TX2_TX_PATH_SEC1, 0x00},
> +	{ CDC_VA_TX2_TX_PATH_SEC2, 0x01},
> +	{ CDC_VA_TX2_TX_PATH_SEC3, 0x3C},
> +	{ CDC_VA_TX2_TX_PATH_SEC4, 0x20},
> +	{ CDC_VA_TX2_TX_PATH_SEC5, 0x00},
> +	{ CDC_VA_TX2_TX_PATH_SEC6, 0x00},
> +	{ CDC_VA_TX3_TX_PATH_CTL, 0x04},
> +	{ CDC_VA_TX3_TX_PATH_CFG0, 0x10},
> +	{ CDC_VA_TX3_TX_PATH_CFG1, 0x0B},
> +	{ CDC_VA_TX3_TX_VOL_CTL, 0x00},
> +	{ CDC_VA_TX3_TX_PATH_SEC0, 0x00},
> +	{ CDC_VA_TX3_TX_PATH_SEC1, 0x00},
> +	{ CDC_VA_TX3_TX_PATH_SEC2, 0x01},
> +	{ CDC_VA_TX3_TX_PATH_SEC3, 0x3C},
> +	{ CDC_VA_TX3_TX_PATH_SEC4, 0x20},
> +	{ CDC_VA_TX3_TX_PATH_SEC5, 0x00},
> +	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
> +	/* ADPT blocks */
> +	{ CDC_VA_CDC_ADPT0_ADPT_CTRL, 0x51},
> +	{ CDC_VA_CDC_ADPT0_ADPT_GAIN_0, 0x11},
> +	{ CDC_VA_CDC_ADPT0_ADPT_GAIN_1, 0x01},
> +	{ CDC_VA_CDC_ADPT0_DH_FSM_CTRL, 0x02},
> +	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0, 0x77},
> +	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1, 0x64},
> +	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2, 0x00},
> +	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3, 0x41},
> +	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4, 0x04},
> +	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5, 0x01},
> +	{ CDC_VA_CDC_ADPT1_ADPT_CTRL, 0x51},
> +	{ CDC_VA_CDC_ADPT1_ADPT_GAIN_0, 0x11},
> +	{ CDC_VA_CDC_ADPT1_ADPT_GAIN_1, 0x01},
> +	{ CDC_VA_CDC_ADPT1_DH_FSM_CTRL, 0x02},
> +	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0, 0x77},
> +	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1, 0x64},
> +	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2, 0x00},
> +	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3, 0x41},
> +	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4, 0x04},
> +	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5, 0x01},
> +	{ CDC_VA_CDC_ADPT2_ADPT_CTRL, 0x51},
> +	{ CDC_VA_CDC_ADPT2_ADPT_GAIN_0, 0x11},
> +	{ CDC_VA_CDC_ADPT2_ADPT_GAIN_1, 0x01},
> +	{ CDC_VA_CDC_ADPT2_DH_FSM_CTRL, 0x02},
> +	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0, 0x77},
> +	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1, 0x64},
> +	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2, 0x00},
> +	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3, 0x41},
> +	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4, 0x04},
> +	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5, 0x01},
> +	{ CDC_VA_CDC_ADPT3_ADPT_CTRL, 0x51},
> +	{ CDC_VA_CDC_ADPT3_ADPT_GAIN_0, 0x11},
> +	{ CDC_VA_CDC_ADPT3_ADPT_GAIN_1, 0x01},
> +	{ CDC_VA_CDC_ADPT3_DH_FSM_CTRL, 0x02},
> +	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0, 0x77},
> +	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1, 0x64},
> +	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2, 0x00},
> +	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3, 0x41},
> +	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4, 0x04},
> +	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5, 0x01},
> +};
> +
>  static bool va_is_rw_register(struct device *dev, unsigned int reg)
>  {
>  	switch (reg) {
> @@ -430,6 +599,10 @@ static bool va_is_rw_register(struct device *dev, unsigned int reg)
>  	case CDC_VA_TX3_TX_PATH_SEC4:
>  	case CDC_VA_TX3_TX_PATH_SEC5:
>  	case CDC_VA_TX3_TX_PATH_SEC6:
> +	case CDC_VA_CDC_ADPT0_ADPT_CTRL:
> +	case CDC_VA_CDC_ADPT1_ADPT_CTRL:
> +	case CDC_VA_CDC_ADPT2_ADPT_CTRL:
> +	case CDC_VA_CDC_ADPT3_ADPT_CTRL:
>  		return true;
>  	}
>  
> @@ -463,6 +636,27 @@ static const struct regmap_config va_regmap_config = {
>  	.writeable_reg = va_is_rw_register,
>  };
>  
> +static const struct regmap_config va_4_1_regmap_config = {
> +	.name = "va_macro",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.cache_type = REGCACHE_FLAT,

Pl use MAPLE here.

> +	.reg_defaults = va_4_1_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(va_4_1_defaults),
> +	.max_register = VA_4_1_MAX_OFFSET,
> +	.volatile_reg = va_is_volatile_register,
> +	.readable_reg = va_is_readable_register,
> +	.writeable_reg = va_is_rw_register,
> +};
> +
> +static const struct va_macro_data shikra_va_data = {
> +	.has_swr_master = true,
> +	.has_npl_clk = true,
> +	.version = LPASS_CODEC_VERSION_4_1,
> +	.regmap_config = &va_4_1_regmap_config,
> +};
> +
>  static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
>  {
>  	struct regmap *regmap = va->regmap;
> @@ -471,10 +665,14 @@ static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
>  		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_MCLK_CONTROL,
>  				   CDC_VA_MCLK_CONTROL_EN,
>  				   CDC_VA_MCLK_CONTROL_EN);
> -		/* clear the fs counter */
> +
>  		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
>  				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
>  				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR);
> +
> +		if (lpass_macro_get_codec_version() >= LPASS_CODEC_VERSION_4_1)
same comment as in 4/5 patch use a flag.
> +			regmap_set_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
> +					CDC_VA_FS_CNT_BYPASS);
>  		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
>  				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
>  				   CDC_VA_FS_CONTROL_EN);
> @@ -503,7 +701,7 @@ static int va_macro_mclk_enable(struct va_macro *va, bool mclk_enable)
>  	if (mclk_enable) {
>  		va_clk_rsc_fs_gen_request(va, true);
>  		regcache_mark_dirty(regmap);
> -		regcache_sync_region(regmap, 0x0, VA_MAX_OFFSET);
> +		regcache_sync_region(regmap, 0x0, regmap_get_max_register(regmap));
>  	} else {
>  		va_clk_rsc_fs_gen_request(va, false);
>  	}
> @@ -749,6 +947,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>  	unsigned int decimator;
>  	u16 tx_vol_ctl_reg, dec_cfg_reg, hpf_gate_reg;
>  	u16 tx_gain_ctl_reg;
> +	u16 adpt_ctrl_reg;
>  	u8 hpf_cut_off_freq;
>  
>  	struct va_macro *va = snd_soc_component_get_drvdata(comp);
> @@ -763,6 +962,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>  				VA_MACRO_TX_PATH_OFFSET * decimator;
>  	tx_gain_ctl_reg = CDC_VA_TX0_TX_VOL_CTL +
>  				VA_MACRO_TX_PATH_OFFSET * decimator;
> +	adpt_ctrl_reg = CDC_VA_CDC_ADPT0_ADPT_CTRL + decimator * VA_MACRO_TX_PATH_OFFSET;
>  
>  	switch (event) {
>  	case SND_SOC_DAPM_PRE_PMU:
> @@ -772,6 +972,10 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>  		/* Enable TX PGA Mute */
>  		break;
>  	case SND_SOC_DAPM_POST_PMU:
> +		if (lpass_macro_get_codec_version() >= LPASS_CODEC_VERSION_4_1)
either move to switch or something but not >=

> +			snd_soc_component_update_bits(comp, adpt_ctrl_reg,
> +						      CDC_VA_ADPT_CTRL_EN_MASK, 0x00);
> +
>  		/* Enable TX CLK */
>  		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
>  					      CDC_VA_TX_PATH_CLK_EN_MASK,
> @@ -1526,6 +1730,14 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
>  		default:
>  			break;
>  		}
> +	} else if (maj == 4) {
> +		switch (min) {
> +		case 1:
> +			version = LPASS_CODEC_VERSION_4_1;
> +			break;
> +		default:
> +			break;
> +		}
>  	}
>  
>  	if (version == LPASS_CODEC_VERSION_UNKNOWN) {
> @@ -1556,6 +1768,7 @@ static int va_macro_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	va->dev = dev;
> +	data = of_device_get_match_data(dev);
>  
>  	va->macro = devm_clk_get_optional(dev, "macro");
>  	if (IS_ERR(va->macro))
> @@ -1592,15 +1805,15 @@ static int va_macro_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  
> -	va->regmap = devm_regmap_init_mmio(dev, base,  &va_regmap_config);
> +	dev_set_drvdata(dev, va);
> +
> +	va->regmap = devm_regmap_init_mmio(dev, base,
> +					   data->regmap_config ?: &va_regmap_config);
>  	if (IS_ERR(va->regmap)) {
>  		ret = -EINVAL;
>  		goto err;
>  	}
>  
> -	dev_set_drvdata(dev, va);
> -
> -	data = of_device_get_match_data(dev);
>  	va->has_swr_master = data->has_swr_master;
>  	va->has_npl_clk = data->has_npl_clk;
>  
> @@ -1775,6 +1988,7 @@ static const struct of_device_id va_macro_dt_match[] = {
>  	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
>  	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
>  	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
> +	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, va_macro_dt_match);
> 

