Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E468356767
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790823266; cv=none; b=ntUru3/H8Mpi8zDAIrzL8EltU7rrhWTDrFovBYjxKfgq3lQv5+U20jBmILq7FRnEQvxvNmVoosSAjRvaTWBxBKu726N9MzsK9nsPmMG0ov1jLvNqdYhVKOsByb0oSPa2Rte1Uh7ouXNenTE5WEqA4zhN0rxU+C20JHZCSCMFQI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790823266; c=relaxed/simple;
	bh=RM7Q8LuVXNK7jCEGkGv920ktboE/Hn0OLc0GukBcBZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1f9vmoxpKW1je5+NGNZC1rrU5ga7/AyTWtrUfb9J0rohT0s8deIndBBDAtu7DhyCy7AXIjpW1y4gwENsyIGbtkKeuCQ1GHpz8F+aT7Qu55t7A9FDTYIQYZQeYZ7WaC3nvJYKq1ttxDpH2JX3igP0MAKEkydKhvrpZ00sop07mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGrisp0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThAJIxzv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGrisp0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThAJIxzv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jqQb1140929
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 02:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTEUHYATqDxsYMltgZdkU98cIItEIMdRJsbDGh+AOgg=; b=mGrisp0UClavX+Tr
	cIETMqAW5niyjBg5Z288slPCaB7K0uY8faWp9kv0Ha7hY4Um822+caLuIRODZs5Q
	9ahnLIb8WwPaLnF6Qv54scK7kJ6ig/MEonxGBjZx0Xv5NW/m/6a0drJEZlE549pj
	4EP1yJCvWeoo+VF48wR2NXitEkjf8fPT8HJ74yOTxfUP5uQZ90boHxTIkvKY/jwi
	oc+1Wcx+7/F0Rm5RHMGJM6E9vS0nY/2WuIZzax6E1pk0g8ql9xHl45j7Dc3CMtVj
	7FibZ/6Ev5VzGpoAJBpi2JfPm61P/elwdWGQ9dMFTD+NVq46B6U2Jx64yXtIbDsQ
	H6WzZA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bkbugs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:54:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d49d8dee1so1357856eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790823262; x=1791428062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eTEUHYATqDxsYMltgZdkU98cIItEIMdRJsbDGh+AOgg=;
        b=ThAJIxzvUhvQ57gX2RsCAJWl9to+bgvCF7O48ipKSrAe2N1izfZHI+/mfaXLYE5yGj
         qPUsRtxrHE4jw17zL4Kxe/doO74R7HUPSd+iGuG3MhAYBo3Nat4OwfrZH1piTYWIBhf5
         wX7/xBYM1eNEOMZP3dOEL5CPfQGYuSAmcKepD6R6H0wT0wsruZGUbloznQ8WmTaAoaGW
         36avEcN07u21S+ev7rAICueCA00LNI5+onb5ZUsfoocEiVtP2Jqd+g2yNUwE4PQKPcJ2
         VN4ThyyvJl8z1nfH0IEvotxpRn7a6JJn5TWdAPITk5MMDSLpkSiO4x01xkDRcoE8gjh6
         /ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823262; x=1791428062;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTEUHYATqDxsYMltgZdkU98cIItEIMdRJsbDGh+AOgg=;
        b=SGxS8zVA3qjYoa7u6HwT8CxWRiWNlxQz5FGz07DHyPIziGg2Gl+1OjwVpsitnbuH5+
         Mb2qxdRpziM7a/g8ZXR8D7MhZLoFe/CisghvP/mGU/1m0MhmcXbBzrcK0wOAYGFj169Q
         rFsgS5WJYAiJo4CGPI9lNnMnRjtYFZU1+yTykjR90EgS+UwI20uOhdYgUE2ApFZQv1p1
         E9pmtY8MPHAmkTPhd9slhdrKgVSpMBOulZpZajRdIABurMjkHDDpbpD5GmmT287SRDM8
         eAkpbbVY3skN1pVcA1ngGBr1a2izad/bn+3zN9FREPopDr/SB8xruINRSTbhdIvGu/6d
         h40w==
X-Forwarded-Encrypted: i=1; AKwUvBzk0ynkcZ/YkMDnc3ezpIQTguse5I8x/k9gUS3OJUg9ejcCGl7fo4fe+kVkRgq4Mjkle7Pjdvuxqd3hr+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2x9O3eAX146AKvybayT/msujitdIX11h9UeLq9aitN4x83Vgu
	bSJ6e0SEx9gXPTT43c6mG+hEI2bGna4/8o2WiGUvUix5lcHseRLty0QtI1bZL57V0tfSP+y2CW+
	JEDQV/bZTfGXGqm3/MlBItMWaN9wx4KNWQSCTokxwS83LOJwOI1lo908QOPwgdsJcovQ=
X-Gm-Gg: AYBFou1JQUcgAOHLLeQckUxDY9BMP9MMcT1fMQMEIdxgUURVxNWhWNsf89GDW0PByFV
	7eExp5SL4iNmQiRiWjIH1/3waspS/CZbptjhsy2NHdUa3AgE1joOUa8NZyiPf2kSbJAuFv13S0R
	HVZBZ1RtFbBB01ilDp+r317YBWj+vhD9tCuG5WkwYxQ0tZeDPsWDBi3X/Uo9v6KxUaOqW6r6v/G
	PVqM47r1P+aJJ/BInjpQ0XZ/qx4YiFUvuv9BEkQYx0LT3VIucJY45/B3HVUlBZDorgGZr2KULd9
	KC30yZHcXH4VDXvHPs/SK+zZQ4e2KidzesNUwL+xSB59ejGha8PhMeseagm0psWRA+Tmbe+yzL9
	jOBgCXJXsfL1gLo/LuB3D67/euwkWea8=
X-Received: by 2002:a05:7301:7a0d:b0:34b:b410:9352 with SMTP id 5a478bee46e88-34cd917360cmr3593123eec.1.1790823261701;
        Wed, 30 Sep 2026 19:54:21 -0700 (PDT)
X-Received: by 2002:a05:7301:7a0d:b0:34b:b410:9352 with SMTP id 5a478bee46e88-34cd917360cmr3593103eec.1.1790823261036;
        Wed, 30 Sep 2026 19:54:21 -0700 (PDT)
Received: from [192.168.0.12] ([183.83.137.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34dae0ad3a8sm2938331eec.0.2026.09.30.19.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 19:54:20 -0700 (PDT)
Message-ID: <2f61eb6f-6e90-6473-9bfb-3ac47facfca9@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 08:24:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 4/5] media: iris: Add HFI metadata buffer delivery
 support for Gen2 encoders
Content-Language: en-US
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
 <20260930-enc_roi_enable-v8-4-2c908f30e963@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260930-enc_roi_enable-v8-4-2c908f30e963@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zLlhsklwarDF4Tbuw6JCcUbgZm6zokko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxMSBTYWx0ZWRfX8rX7ScIa4tp7
 dzwE0cCnBCyCu+BB/5GQzWUoH6SbBUDbCdgtcoq1rQBhGehnfaxeUs3g7eKuMweHTaR0XGiw72W
 9owdC3OQ1oUZ9TIHPSuJPHrwxp+axSIH8L9fu38LxixJx1vUjFOEi5JVl+6Db5c3DHS4UVUUi73
 sKHeY0syClhHK1UCGyHTz9IbElpKYo9fnvI6d4kszaP9BB69Z9nELS2Woen2JnTeWZsRV/PhfWa
 EHr1xLBDLt1h5PduYWnbJJqoZZjDVN0f40sijlV8bphF3AbEf5R2X3VurArBfzNAl/lCHXeZ+d+
 KOCfEX3EnbQ2+rLadmSiHQ+HVu7OQ811Fu9XHKzKUdGXsDjGYzPVq0j883GEdoCA1vKPeyZ3eBK
 6TA991o/GS6YYkDHGEkdyjlaIijpKf5NkuY4CTCRdLW2d20GaWFGBcEigW2G0aFIH9kWCT7PXDl
 KAfZwassLW+fQ9uvcvQ==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abdcb5f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=gJrurTm18R8X9NiJySVakQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iaZgE1KkmNriuiUYIy4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxMSBTYWx0ZWRfX1vdj3mxlF4BC
 HY1j8JQM0Sa+gLyFPb05sY9JdjxN07HG5KUQD/OEibPJKW6JzC8s9Ubuu5wrZJiIAgJhwXYSNqi
 EqcdpK8AE9DK4oD4ewW76LCv00juqH8=
X-Proofpoint-ORIG-GUID: zLlhsklwarDF4Tbuw6JCcUbgZm6zokko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010011



On 10/1/2026 12:00 AM, Deepa Guthyappa Madivalara wrote:
> Add the infrastructure to deliver metadata buffers to the HFI firmware
> on HFI Gen2 based encoders, used to carry per-frame ROI delta QP data.
> 
> Metadata buffer structures (iris_buffer.h):
> - Add metabuf_header and metapayload_header structs describing the
>   metadata buffer layout as expected by the firmware.
>   HFI defines (iris_hfi_gen2_defines.h):
> - Add HFI_CMD_DELIVERY_MODE (0x0100000A).
> - Add HFI_MODE_METADATA (0x00000004) to hfi_property_mode_type.
>   HFI command side (iris_hfi_gen2_command.c):
> - In iris_hfi_gen2_session_queue_buffer(), after queuing a RAW
>   (input) buffer, check for an available BUF_ROIMB_DELTAQP metadata
>   buffer and, if found, append a second HFI_CMD_BUFFER packet for
>   the metadata buffer in the same command, tagged with the same
>   buffer index.
> - Add iris_hfi_gen2_subscribe_metadata_delivery(): sends
>   HFI_CMD_DELIVERY_MODE with HFI_MODE_METADATA and HFI_PROP_ROI_INFO
>   to instruct the firmware to expect metadata on the input port.
>   HFI response side (iris_hfi_gen2_response.c):
> - Add iris_hfi_gen2_handle_output_metadata_buffer(): locate the
>   metadata buffer by device address and transition it from
>   QUEUED to DEQUEUED so it can be reused.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.h     | 18 ++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 12 +++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 39 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
>  .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  6 ++--
>  .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  3 ++
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    | 27 +++++++++++++++
>  drivers/media/platform/qcom/iris/iris_venc.c       |  4 +++
>  10 files changed, 110 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index ab8e5d953101a786ade20540ee3c3ed226160cbe..ee2d24bb69c57220b0a735d9b4aae4434a33daf6 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -107,6 +107,24 @@ struct iris_buffers {
>  	u32			size;
>  };
>  
> +/* Metadata buffer header */
> +struct metabuf_header {
> +	u32 count;
> +	u32 size;
> +	u32 version;
> +	u32 reserved[5];
> +};
> +
> +/* Metadata buffer payload header */
> +struct metapayload_header {
> +	u32 type;
> +	u32 size;
> +	u32 version;
> +	u32 offset;
> +	u32 flags;
> +	u32 reserved[3];
> +};
> +
>  int iris_get_buffer_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
>  int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 9f84d28d00ab25555f1d2259f7ef0ed0786a0271..142c9712bb0b05bea2cf656be636e7449e361512 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -1608,3 +1608,15 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
>  
>  	return 0;
>  }
> +
> +int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	int ret = 0;
> +
> +	/*subscribe to metadata delivery only if ROI is enabled */
> +	if (!inst->fw_caps[ROI_PARAMS].p_array)
> +		return ret;
> +
> +	return hfi_ops->session_subscribe_metadata_delivery(inst, plane);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 5180d53d3c904cad460b2760913b475d0ff1bb55..9957b69366f50310338a0c1470d9744592655c33 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -50,5 +50,6 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
>  int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
> +int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index a27447eb2519962cb958b0e330a6d018310c3450..5692375cdd357f9b00760053ffff5af4bd9cce9c 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -131,6 +131,7 @@ struct iris_hfi_session_ops {
>  	int (*session_drain)(struct iris_inst *inst, u32 plane);
>  	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
>  	int (*session_close)(struct iris_inst *inst);
> +	int (*session_subscribe_metadata_delivery)(struct iris_inst *inst, u32 plane);
>  };
>  
>  struct hfi_subscription_params {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 388a36ff2b07b7bcd8db21d4345bc900356b4ec3..cf88dbe11e8e9faef826e661d8e9909fd7f16b94 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1307,6 +1307,24 @@ static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
>  	buf->timestamp = buffer->timestamp;
>  }
>  
> +static struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
> +						       enum iris_buffer_type buffer_type, u32 index)
> +{
> +	struct iris_buffers *buffers = &inst->buffers[buffer_type];
> +	struct iris_buffer *buffer = NULL;
> +
> +	if (list_empty(&buffers->list))
> +		return NULL;
> +
> +	buffer = list_first_entry(&buffers->list, typeof(*buffer), list);
> +	if ((buffer->attr & BUF_ATTR_QUEUED) || (buffer->attr & BUF_ATTR_DEQUEUED))
> +		return NULL;
> +
> +	buffer->index = index;
> +
> +	return buffer;
> +}
> +
>  static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>  {
>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> @@ -1359,6 +1377,26 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
>  					inst_hfi_gen2->packet->size);
>  }
>  
> +static int iris_hfi_gen2_subscribe_metadata_delivery(struct iris_inst *inst, u32 plane)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	u32 payload[2] = {HFI_MODE_METADATA, HFI_PROP_ROI_INFO};
> +
> +	iris_hfi_gen2_packet_session_command(inst,
> +					     HFI_CMD_DELIVERY_MODE,
> +					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
> +					      HFI_HOST_FLAGS_INTR_REQUIRED),
> +					     port,
> +					     inst->session_id,
> +					     HFI_PAYLOAD_U32_ARRAY,
> +					     &payload,
> +					     sizeof(u32) * 2);
> +
> +	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
> +					inst_hfi_gen2->packet->size);
> +}
> +
>  static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
>  	.session_open = iris_hfi_gen2_session_open,
>  	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
> @@ -1372,6 +1410,7 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
>  	.session_drain = iris_hfi_gen2_session_drain,
>  	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
>  	.session_close = iris_hfi_gen2_session_close,
> +	.session_subscribe_metadata_delivery = iris_hfi_gen2_subscribe_metadata_delivery,
>  };
>  
>  static struct iris_inst *iris_hfi_gen2_get_instance(void)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 08fc1036013de29e51747a6425ae7bb805ca3e0f..d0661f5fe6a6f39295dad8950edb2f1a85893216 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -20,6 +20,7 @@
>  #define HFI_CMD_DRAIN				0x01000007
>  #define HFI_CMD_RESUME				0x01000008
>  #define HFI_CMD_BUFFER				0x01000009
> +#define HFI_CMD_DELIVERY_MODE		        0x0100000A
>  #define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
>  #define HFI_CMD_SETTINGS_CHANGE			0x0100000C
>  #define HFI_CMD_PAUSE				0x01000011
> @@ -175,6 +176,7 @@ enum hfi_flip {
>  enum hfi_property_mode_type {
>  	HFI_MODE_PORT_SETTINGS_CHANGE		= 0x00000001,
>  	HFI_MODE_PROPERTY			= 0x00000002,
> +	HFI_MODE_METADATA			= 0x00000004,
>  };
>  
>  enum hfi_color_format {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 0d05dd2afc07d830cc8502ab5f28001312991ba8..aeb0426a05694f219f82145cd84a28287ed3075e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -100,9 +100,9 @@ static void iris_hfi_gen2_create_header(struct iris_hfi_header *hdr,
>  	hdr->num_packets = 0;
>  }
>  
> -static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
> -					u32 pkt_flags, u32 payload_type, u32 port,
> -					u32 packet_id, void *payload, u32 payload_size)
> +void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
> +				 u32 pkt_flags, u32 payload_type, u32 port,
> +				 u32 packet_id, void *payload, u32 payload_size)
>  {
>  	struct iris_hfi_packet *pkt = (struct iris_hfi_packet *)((u8 *)hdr + hdr->size);
>  	u32 pkt_size = sizeof(*pkt) + payload_size;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> index 25b9582349ca1a0ce6efc0b146a3abb798485c45..613eb500609f745daebdcbdf9a25b85cb9465a79 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> @@ -121,5 +121,8 @@ void iris_hfi_gen2_packet_session_property(struct iris_inst *inst,
>  void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
>  						       struct iris_hfi_header *hdr);
>  void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct iris_hfi_header *hdr);
> +void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
> +				 u32 pkt_flags, u32 payload_type, u32 port,
> +				 u32 packet_id, void *payload, u32 payload_size);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 8c2644c7f6e85983d7ad7584fc0cb570e4813ae4..84b629b957442c024dccc18b354ac9a7e541abaa 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -77,6 +77,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
>  	case HFI_BUFFER_PERSIST:
>  	case HFI_BUFFER_VPSS:
>  	case HFI_BUFFER_PARTIAL_DATA:
> +	case HFI_BUFFER_METADATA:
>  		return true;
>  	default:
>  		return false;
> @@ -452,6 +453,30 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
>  	return 0;
>  }
>  
> +static int iris_hfi_gen2_handle_output_metadata_buffer(struct iris_inst *inst,
> +						       struct iris_hfi_buffer *buffer)
> +{
> +	u32 buf_type = iris_hfi_gen2_buf_type_to_driver(inst, HFI_BUFFER_METADATA);
> +	struct iris_buffers *buffers = &inst->buffers[buf_type];
> +	struct iris_buffer *buf, *iter;
> +	bool found = false;
> +
> +	list_for_each_entry(iter, &buffers->list, list) {
> +		if (iter->device_addr == buffer->base_address) {
> +			found = true;
> +			buf = iter;
> +			break;
> +		}
> +	}
> +	if (!found)
> +		return -EINVAL;
> +
> +	buf->attr &= ~BUF_ATTR_QUEUED;
> +	buf->attr |= BUF_ATTR_DEQUEUED;
> +
> +	return 0;
> +}
> +
>  static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,
>  					     struct iris_hfi_packet *pkt)
>  {
> @@ -499,6 +524,8 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
>  			return iris_hfi_gen2_handle_input_buffer(inst, buffer);
>  		else if (buffer->type == HFI_BUFFER_BITSTREAM)
>  			return iris_hfi_gen2_handle_output_buffer(inst, buffer);
> +		else if (buffer->type == HFI_BUFFER_METADATA)
> +			return iris_hfi_gen2_handle_output_metadata_buffer(inst, buffer);
>  		else
>  			return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index a945992f63aa8a0c40b8d6bc473d0bc90270e6cd..21ba9639d17b2c64e8fa33b4aacbd1946fc4dae2 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -498,6 +498,10 @@ int iris_venc_streamon_output(struct iris_inst *inst)
>  	if (ret)
>  		goto error;
>  
> +	ret = iris_set_metadata_delivery(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (ret)
> +		goto error;
> +
>  	ret = iris_alloc_and_queue_persist_bufs(inst, BUF_ARP);
>  	if (ret)
>  		return ret;
> 

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
