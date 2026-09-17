Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138564E01E3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672871; cv=none; b=tyH/eGCnjjzXm2g0R9Ay2SPnmpTOfuPK4zu0wydxofxJIQZhnhS13ILXM3+6m4kfB2Dp/Yaw9kGjHC84/0UOq2Ef5lDlb8bSv2xLKK/ll96lcbZwZQzq9NkxmuXVysVpq0l9aMRRJ0CJjqRlhYg/L8t900/gM7WoTU2Qr1Ys+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672871; c=relaxed/simple;
	bh=9/PLeGutW/K6U+nlg7g/u26bEQRwEQjLvyZeFh0yc2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UK9n5cASuqeWXlIOJ+Bly30pUd7WLPwYLa0FbyASE8NfOyPvxfycgPdy7s4evZaihoQRKsZPU0mJhIUa2EWtswpDMt9/TIaxA9RjUJY+tzd+WuxERcPluSoUBbRupneWxi5b7XBtJdg/lcgQD0QAdvX9QsAlgpuJUpNRVBozJ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1TpSbMN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TE83NdIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1TpSbMN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TE83NdIL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5DbU3242580
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPnDJDcRj/tiJwf3z35D8zbS6cr4m6dIivt4rL4VpY0=; b=c1TpSbMNfYLoL91R
	rkplFg7+k/kqsFY1R8EsaEG27EjLIfi+UySfoIBfc592AAxIr40cyxd0WhtEH9Oc
	ES7pBZ94/eKOHA5nkKd/4ve8hvFN/Hg+fZm0RwzKToEkfAnyjamRj8meaRkTT+JA
	Y9cpCoEbRqYSKUol7wzryh33QOFEfzAn8Lxa2j+5GUPjw9vWgGwMKWSjjcdCD3ZL
	B3jBsZvR9+ACHQEFI8wE3eTNYZ+pl81FULg3W1g1sKI+q1nCDymogKKvHpLeSFW7
	2LoWW/y3My0hGalw71a8wWi97NsmqKE9+HwZhp61fTVYgHj9wP5qXFmEfhOjnqL9
	AnnYbQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grkcugx7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:21:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a7bb1dd95so1509744b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789672867; x=1790277667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPnDJDcRj/tiJwf3z35D8zbS6cr4m6dIivt4rL4VpY0=;
        b=TE83NdILO1B8jw1MM9eEJiDMQoIUoCljQqyV4IVvODviA4NlA3ZSE8/e+8j6untKRJ
         6SjoiLUIiNbeZIYcFmARPIwmpRPYC4/bxBT0vBA4GgKc/4hs9WDJuIkFT3ZtNppeBJXV
         oWrRlPe8lQQzRZW51hoIPRaPRfTCgNJCN/1wxUBjRdr0OAjYuKKTjmIH6LpcCSFWw0ws
         Sq4P6jsdSY8utKuwXZvRaEl4qn+Q6J6601ooMbHI/6Vqe8Abg1F1ybdDMxzQ5wINd/Me
         duD05hqGcr46z9zf6p/jBRbpatKXZut37qKFSO9j5SYRtGJXKlKxxrsmt3FqkvqPYB06
         GDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672867; x=1790277667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPnDJDcRj/tiJwf3z35D8zbS6cr4m6dIivt4rL4VpY0=;
        b=kMe/2QK/zeiPqPRZKtYJulRibLmjjr8ILTGRTfGsfhFD72sjjiWmtt+Y+IV47osvkd
         PpWFD7jTPGNfgt1vBRMiKlCUMRtbtvfB8pOouAK9pXfqkiX2qQVE+XrI+YUzou8q/ze5
         fW2i0meSJZnMfXWS9fN6+I1vOp3S1XUHsKeLpMhBkaY2Dl4wRNpMIg9hhKcJAcwgXA/I
         G1KIvRqMN2I5Q0ZsU5PvNeYLTBlRwB0v9pIbrCxiz6tnDL6h7dKuhky0wMqIEfRdtNzh
         Xro5mk6Lr746Q/h5FC1toHpYMZvoBh7xp9TcscNfXdQmpdIqNexfSLBhh+OxVRowyGwq
         x5xg==
X-Forwarded-Encrypted: i=1; AKwUvBx8ucEOWrVXKfYmWSOfaTv821q+jnAnzz7pJBmNbAQ2muQq0Pk4bUO3ylobyOe1CXnM1RDE050mTTPg424=@vger.kernel.org
X-Gm-Message-State: AFuF++l8SHYhEAKEu/Bo0bp35bhoMtboQenz1ahVqhVmJyx5xt77oHvk
	7vlNCqm615kRuEVB6xqMNfFBxl8YmEL61iCG+p6J41d8eC4l4A+o7o98wsZK/ujuHSxbO9g0a+z
	6uYa3BMSJt276lreWymj7uAgVJdCKBoRbWEMkrGbPBiaIbEbwi4mx34dE2SBfhg/GG6A=
X-Gm-Gg: AYBFou01RY23nveAzzsZwY6Pw70f4jGIloSvx7D9ZKWyQfEJ6tJ0nYsOwPJ2E94pH80
	cEiuWHc1hpkyClBSMPQCh7CNsQqegdWK5Gk1z6shDPqZoNBSDI/DW3gryB6PzIW3Y8M7fmdObp4
	uqhl8whRh25IcB+3WbCfUOZi54BR1AFWwzSo7urmc6Bg72j4IwyzDgWElcEq9+VCMSqNUPetFb1
	kZRAkfJFVo1H9N7ovALzqIPwtdxNeP6CxuWCPLEeGvxFSesAzca0iDfKGLydoL/cvaWbbGYcG0j
	Onpcg3a9sF1ugoes7+tHnZNyg5l/6jfIel4Ce4H/rjrCXOq3EDbPGIsZaSR8ONGzLolC+QXwX8A
	6RpuF0nEWgKfqhGPZtrMAi/jctMqPsV9VEhE=
X-Received: by 2002:a05:6a00:4b51:b0:867:bb96:52b2 with SMTP id d2e1a72fcca58-874d2c8b9c6mr122145b3a.5.1789672867387;
        Thu, 17 Sep 2026 12:21:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b51:b0:867:bb96:52b2 with SMTP id d2e1a72fcca58-874d2c8b9c6mr122127b3a.5.1789672866613;
        Thu, 17 Sep 2026 12:21:06 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720173842csm3307185b3a.41.2026.09.17.12.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 12:21:05 -0700 (PDT)
Message-ID: <84d2f245-1493-40e1-8b20-e5b88170c564@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 00:50:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dmaengine: qcom-gpi: Add I2C High-Speed mode
 configuration support
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260912-i2c-hs-v2-0-b0901791e244@oss.qualcomm.com>
 <20260912-i2c-hs-v2-1-b0901791e244@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260912-i2c-hs-v2-1-b0901791e244@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfX07/CCUykmJUB
 8JxLAZmhFGs2HRARDykVT+MUZbfjPrc1TmZiMcF0zadcJlVbhTIacdVQvuv16lXUFcrQ+xcAsCD
 Lq9HF+WfDoFh5M4NH+f1zEg02yQrUjM=
X-Authority-Analysis: v=2.4 cv=XttvqlF9 c=1 sm=1 tr=0 ts=6aac3da4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=/ba+GChBmZZUisokHISCpA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pOrFmiSUyACN_rSOyqsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: J06zY2B9hjUxWfa4mzPQeTcHcXWCs3ux
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfXyFf+43v/mjYz
 isQw3YAXMpHWBRVjdJEWRMyiGYDX/fbsFZmSoXr6sjsZUqG1zfyuYnQsrp6Gnm0m6i8pqwxgcvA
 wnl0gGVi60IDKMV7GN1gbV/yvnw1QZ/boV7Ar2e0WgPmPcpMTxXl//UdkbciPRUE9ZmSGO5NcBo
 gDxEZUfC5bM6qHNssDmGyE1R0s5bbiAGJttijCzv/aWMB2jV+uMccD406pCjxoof+EkVLBkBK6a
 At5cIQUwFAy1uPMr/fnLA/OSs2urlPNa8res5uzevF9N1BjgaMySKdZt/96oexspTHcTY6zTKKH
 HTj6oyAS6U/vtHOXzBNFw5cSt+M2Qy+GdAdA1g+p/QQZr42daViUm8Wuryma/shkA2DGACorpJL
 VqZxV5jpLqvrnYka9dpxM2bcj/RCMSXjUOxleQd6U5SID/SMlAqpDQDToKFG94BHJ4XG9YWk+A5
 hGKlED6JSd0+ySczYUA==
X-Proofpoint-GUID: J06zY2B9hjUxWfa4mzPQeTcHcXWCs3ux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170277



On 9/12/2026 6:34 PM, Jyothi Kumar Seerapu wrote:
> Add support in the Qualcomm GPI (Generic Packet Interface) DMA engine
> for I2C High-Speed (HS) mode transfers
> 
> Introduce support for CONFIG1 Transfer Ring Element (TRE) to convey
> HS-specific timing parameters to the Qualcomm GPI DMA engine.
> 
> Define a new gpi_i2c_config1 structure containing tcycle_cnt and
> tlow_cnt fields, with default values of 28 and 38 respectively,
> as required for 3.4 MHz HS mode operation.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>   drivers/dma/qcom/gpi.c           | 56 +++++++++++++++++++++++++++++++++++-----
>   include/linux/dma/qcom-gpi-dma.h | 28 +++++++++++++++++++-
>   2 files changed, 76 insertions(+), 8 deletions(-)

[...]

>   struct gpi_desc {
>   	struct virt_dma_desc vd;
> @@ -1631,7 +1637,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   	struct gpi_tre *tre;
>   	unsigned int i;
>   
> -	/* first create config tre if applicable */
> +	/* first create config0 tre if applicable */
But the variable name is still set_config, not set_config0 ?>   	if 
(i2c->set_config) {
>   		tre = &desc->tre[tre_idx];
>   		tre_idx++;
> @@ -1645,20 +1651,48 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   		tre->dword[1] = 0;
>   
>   		tre->dword[2] = u32_encode_bits(i2c->clk_div, TRE_C0_CLK_DIV);
> +		tre->dword[2] |= u32_encode_bits(i2c->clk_src, TRE_C0_CLK_SRC);
>   
>   		tre->dword[3] = u32_encode_bits(TRE_TYPE_CONFIG0, TRE_FLAGS_TYPE);
>   		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
>   	}
>   
> -	/* create the GO tre for Tx */
> -	if (i2c->op == I2C_WRITE) {
> +	/* Create CONFIG1 TRE if requested */
same style as set_config, write in lower case.> +	if (i2c->set_config1) {
>   		tre = &desc->tre[tre_idx];
>   		tre_idx++;
>   
> +		/* CONFIG1 TRE with timing parameters */
Lower or upper letters ?> +		tre->dword[0] = 
u32_encode_bits(i2c->config1.tlow_cnt, TRE_I2C_C1_TLOW);
> +		tre->dword[0] |= u32_encode_bits(i2c->config1.tcycle_cnt, TRE_I2C_C1_TCYCLE);
> +		tre->dword[1] = 0;
> +		tre->dword[2] = 0;
> +		tre->dword[3] = u32_encode_bits(TRE_TYPE_CONFIG1, TRE_FLAGS_TYPE);
> +		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
> +	}
> +
> +	/* create the GO tre for Tx */
tre/TRE ? keep it uniform way across.> +	if (i2c->op == I2C_WRITE || 
i2c->op == I2C_HS_WRITE) {
> +		u8 master_code = 0;
> +		u32 cmd_opcode;
> +		bool is_hs_mode = false;
> +
> +		tre = &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		is_hs_mode = (i2c->op == I2C_HS_WRITE || i2c->op == I2C_HS_READ);
> +
> +		/* Select HS-mode or standard I2C opcode */
Should you move this inside and just above selection cmd_opcode ? I 
think the comment is covering multi_msg condition.>   		if (i2c->multi_msg)
> -			tre->dword[0] = u32_encode_bits(I2C_READ, TRE_I2C_GO_CMD);
> +			cmd_opcode = is_hs_mode ? I2C_HS_READ : I2C_READ;
>   		else
> -			tre->dword[0] = u32_encode_bits(i2c->op, TRE_I2C_GO_CMD);
> +			/* I2C HS write vs Regular I2C write */
> +			cmd_opcode = is_hs_mode ? I2C_HS_WRITE : i2c->op;
> +
> +		tre->dword[0] = u32_encode_bits(cmd_opcode, TRE_I2C_GO_CMD);
> +
> +		if (is_hs_mode)
> +			tre->dword[0] |= u32_encode_bits(master_code, TRE_I2C_GO_MASTER_CODE);
>   
>   		tre->dword[0] |= u32_encode_bits(i2c->addr, TRE_I2C_GO_ADDR);
>   		tre->dword[0] |= u32_encode_bits(i2c->stretch, TRE_I2C_GO_STRETCH);
> @@ -1674,7 +1708,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
>   	}

[...]

>   /**
> @@ -62,15 +82,19 @@ enum i2c_op {
>    * @high_count: high period of clock
>    * @low_count: low period of clock
>    * @clk_div: source clock divider
> + * @clk_src: source clock
>    * @addr: i2c bus address
>    * @stretch: stretch the clock at eot
> - * @set_config: set peripheral config
> + * @set_config: set peripheral config (CONFIG0)
set_config0 now ?> + * @set_config1: set peripheral config1 (CONFIG1)
purpose or usage not clear, looks mostly similar to variable name.> + * 
@config1: I2C HS mode timing configuration (CONFIG1 TRE parameters)
>    * @rx_len: receive length for buffer
>    * @op: i2c cmd
>    * @multi_msg: is part of multi i2c r-w msgs
>    */
>   struct gpi_i2c_config {
>   	u8 set_config;
> +	u8 set_config1;
>   	u8 pack_enable;
>   	u8 cycle_count;
>   	u8 high_count;
> @@ -78,6 +102,8 @@ struct gpi_i2c_config {
>   	u8 addr;
>   	u8 stretch;
>   	u16 clk_div;
> +	u32 clk_src;
> +	struct gpi_i2c_config1 config1;
>   	u32 rx_len;
>   	enum i2c_op op;
>   	bool multi_msg;
> 

