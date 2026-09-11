Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F93E4AC157
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147900; cv=none; b=jL1oJBGL2qaudM4TkozfyOKm7EtwgdhJphV6zu8sJC9n3TG149pCsUIRcxIKkrKYYyel0ZPEiphKqDDhx8kAVpnX3uILZkxvlVVaXbaZ3ZWC1+BbgcWovqCB0b4zv14yu7b0eBuQqnCgF8lGr220c27nw7ge7Op13fuAEZHuclQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147900; c=relaxed/simple;
	bh=2ESWAHE5hsFSpIaCbYHVnDSH1nMykm/FS2ZX7QiUB2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQB0HV4DpYZLRIOdWcByhAB0tfRYKASk6sop6WCzlL8oFtvfKTTKj5uZKi78Zkpq5r9tEmaUpN7x3TmQVDmljwd1xkNduv1Z3hnLN8Z7aFtbkj6WacBUstL/ueiuigZBTm7a4ZfG20bd9moUlBXdTUd9htPNzjwZKnVcW3GSob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SDYeL/ft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzVTTj0E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SDYeL/ft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzVTTj0E"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHNCUw1439524
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VV0AZ4NNvbaMXYg3fNasls2c1vDhwoKWDHh+Op4tw88=; b=SDYeL/ftlF9reOMz
	z4aKfBsbPauKnCtX/v0Uu86kJQuIZV3uZR3mqXtC/G4AE+noga+qwjZI1i7zqHl5
	9Wf3h4cGjeVRVB0xrQgD3JkagWu6wFGsO1z/6oZpPOi2VDRl2ON1dw7eNgxfGJ+W
	yzue40QPKqNoYPayWEq0VOuekHDyP5G6nKuuO9T3qFDhH/A8V8Wf7zvSBry3NCUj
	Uj/5JF+BLnkkkyJQtTSNRND8r0yKP71nDy/1JdnUlvOUdgGKqcSYE460rBi6z67+
	5TQsaaK6g7ln+X04wcOAuT1+bb63IvDXmDX6GydRX49oZkqNA4jMwk442zKLDXic
	372ifg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmp0dg12p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:31:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a63cca6ffso1453430b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789147893; x=1789752693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VV0AZ4NNvbaMXYg3fNasls2c1vDhwoKWDHh+Op4tw88=;
        b=HzVTTj0E0XwKmUDqG3qnWV3AoM3P2I8XMVHIeEGlSsZnCuPBCV7w0z6Hvur1lcxyQq
         w3KTDqoFYkbjgS9g7MA3MMy52VYkiw/eYKbhnYxc2BT+yfppyNXzMsj+ebKyC9SXomSr
         m/K7Z5fdRzRbkQJH7F8CmvDxe/LWjsfma1SPbbug2HT0t5qTIKLtARmL8gLCrZsKZpts
         +SP7ogcDsqzgG1CwCiX4j+DBPODQS8d5bOYdScgHDDhm/h8CPw51rCcgFMF3hNOGquUC
         LsBK4EFLF5Q7pMsr3yd6mrcWq9bT5Waq5UIAZi5Jl0PCD0QNBz2B5o6lQdza64go9COG
         GUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789147893; x=1789752693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VV0AZ4NNvbaMXYg3fNasls2c1vDhwoKWDHh+Op4tw88=;
        b=rFoJzA/KunkfRl47eTuAJYan2/XETZb4RCK6rM8rttxHYXml6VDvBSPGzX+rvKfJBO
         VV1c0i3z69riNd0yVWwxemUZ5eMhW8h6VVxGAVVa4Yqt9o8oUT4BjphdFOfcKFAzIVR7
         Rogyq4Ou/fR6DpTN3y96/uYJcWAwNVPil8uAq0K00jtTS3p2EEzEyRPkVl0alonweTHM
         rkYhSszJElNUQixNDGy/YBX4o3E7wXTHOI10Uj0+FQm6XOkBId9ZBjUSUq9qsYd1ZcAk
         OuliVHKIa+T5ZTqeUQxJ635ZIn04yZfId80BgbAzq6nowYE3F3vAQ2lnk+PoNvgOpj5H
         JZSA==
X-Forwarded-Encrypted: i=1; AKwUvBznfsg45r4rpLSGAaID40loDbTloVHmHNPokvwnD3e2JpRuKMn0d/R999IA5QoagHc+BRq0qfETa82McTY=@vger.kernel.org
X-Gm-Message-State: AFuF++nf2k2zPu0k6SHAV3kTjgADMgVWFUVtwhb+7NuZORrXhBMRNcRG
	Mw+QyrPs51baF1Y7tYr62ROhfZcrMSZrhjc7UUEuIuFrP2usZDEFqTulCFFArXpILi8fUpI6OPg
	ACxwSRMlqhZl+s4XvtZMpk80bJFir1Y2WRTgqFpPTyu1G4lSaGaMXnsGR5KRtAaG2n+U=
X-Gm-Gg: AYBFou1k5OWV3QHoRBUqZ0Tufcm9UdcnJJTWBcQrOZVjEo5PYiW/DhG0jxd3Z9DdMJr
	Esp2/CS8Ld+/TjVYN5EHnbIDajsOGzxK7mqxDvMUJB4it4v2SzPD5KcNb62dh8IV/vGPBWhy48F
	/onDqmUkUF/5bxlrmZzkMylKEUGgVD2DChw0KljLsqw+JijMCkSThI4KI45IP35BCSiMmvSJmsx
	jF8OVCNBcpT+uW6Po5c96YZtdBXL8s42Bm+R5KOICmC+fJTHGohdns8z2cLagPVWJsoTQzDQaDs
	zfCY68BhsCCyua1YiPCECV46TaEDDwHBd4EjeFtRvvy0U3HmJk0qLtMfROcH772zJsjnkucuL5B
	P9awvy0oH0hzsvVkBGXzk59TWfDOJEYcIFkI=
X-Received: by 2002:a05:6a20:939e:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3daed4ec53emr9965530637.25.1789147892637;
        Fri, 11 Sep 2026 10:31:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:939e:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3daed4ec53emr9965481637.25.1789147892179;
        Fri, 11 Sep 2026 10:31:32 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.104])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm9220531eec.0.2026.09.11.10.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:31:31 -0700 (PDT)
Message-ID: <37bf9788-923a-4cf6-b27d-86ab9da0a36d@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 23:01:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: iris: add new rate control type MBR for encoder
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U7EHnuru c=1 sm=1 tr=0 ts=6aa43af5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=TwCXObd+TJU0JWB7kQOUgw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MG_CwHWzulrpBViiCCcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: s2-EYxz-UKLlQGD8qiOOH9YUiLDbQPHa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI0MyBTYWx0ZWRfXwGrUcA7W2dsF
 7EdrSnDtKAAO9b9b3Jkmyu2XqlhPbshWmRz/18TUdVHygNs23bfbJgl2tNno9TQ+ty3Q54HWMwc
 B5wAcuYyuSuW0w2KXiw/NeOth9uBA3g=
X-Proofpoint-GUID: s2-EYxz-UKLlQGD8qiOOH9YUiLDbQPHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI0MyBTYWx0ZWRfXxQIxXlOGPJb/
 2MPO9oNLV2xYExrl9Jvt6vl9EqJBqViocQ2SZW04OEbulLzIp7xcbaxnfylu+bYMUcZG9CspLmG
 0qNt5sB1qHU5Ja7vat5g9P3KIvVvaQ80rRlR92E1KrEl/Cqmda4X0DNeUuPxgcroIppDuYHsUuu
 9KouAxwejFQCnazXEQYtfCZumERXJEiMH9yj0HUJu3rzpTxjY9nDuRlRGRfkLzeJWvn4nkH1QGX
 DSstiiEsHSEjEk/NDTxKxBOIVl7OGIwIId9Mwijhg1KCnFbv/6tBMI3YjtpOfxxFihSukAajFEY
 USAsAfRmi5F181NpKLlXeLIvGkmFKW7Fk5GyvwUL3JRm1T5iYmUeqI5lQZo1QKCi6ho/BxgMw5C
 u4LxGl74qS6vCfXe4UYYRmwitWl8kxISSPkI0Am+21u0tMMuWBmKf8BbpcqDdaGhHtcoTPInL7f
 2EUKf+LcccFtDugX/ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110243



On 7/20/2026 10:44 PM, Sachin Kumar Garg wrote:
> Add support for the MBR rate-control mode on the encoder.
> MBR has no corresponding V4L2-spec definition, it is exposed as a
> Qualcomm IRIS vendor-specific control rather than a generic
> bitrate-mode value.
> 
> Reserve V4L2_CID_USER_QCOM_IRIS_BASE for Qualcomm IRIS driver
> specific controls and add a new boolean control,
> V4L2_CID_QCOM_MBR_RATE_CONTROL, to enable it. When set, the driver
> programs the firmware with HFI_RATE_CONTROL_MBR, taking priority
> over V4L2_CID_MPEG_VIDEO_BITRATE_MODE when both are client-set.
> 
> MBR is currently supported only on sc7280. Rather than duplicating
> the encoder capability table per platform, add a mbr_rc_supported
> flag to struct iris_platform_data, and merge in a small
> platform-specific capability table containing only the MBR cap for
> platforms that support it.
> 
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
> This patch adds support for the MBR rate-control mode in the Iris driver.
> 
> Changes in v2:
> - Per upstream review feedback, convert MBR enablement from the
>    generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR menu value to a new
>    Qualcomm IRIS vendor-specific boolean control,
>    V4L2_CID_QCOM_MBR_RATE_CONTROL.
> - Drop the now-unneeded generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR
>    enum, its "Maximum Bitrate" menu string, and its documentation
>    (previously sent as a separate patch 1/2).
> - Drop the separate inst_fw_cap_sc7280_enc[] table (a near-complete
>    duplicate of inst_fw_cap_sm8250_enc[]); sc7280 now reuses the
>    shared encoder cap table and layers in only the MBR-specific cap
>    entry via the new mbr_rc_supported flag.
> - Link to v1: https://lore.kernel.org/linux-media/20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com/
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 101 +++++++++++++++++----
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |   4 +
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
>   .../platform/qcom/iris/iris_platform_common.h      |   2 +
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
>   include/uapi/linux/v4l2-controls.h                 |   6 ++
>   6 files changed, 98 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 10e33b8a73f6..0a979649663b 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>   		return LAYER4_BITRATE_HEVC;
>   	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
>   		return LAYER5_BITRATE_HEVC;
> +	case V4L2_CID_QCOM_MBR_RATE_CONTROL:
> +		return MBR_RATE_CONTROL;
>   	default:
>   		return INST_FW_CAP_MAX;
>   	}
> @@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>   		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
>   	case LAYER5_BITRATE_HEVC:
>   		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
> +	case MBR_RATE_CONTROL:
> +		return V4L2_CID_QCOM_MBR_RATE_CONTROL;
>   	default:
>   		return 0;
>   	}
> @@ -335,6 +339,17 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
>   	.s_ctrl = iris_op_s_ctrl,
>   };
>   
> +static const struct v4l2_ctrl_config iris_mbr_rate_control_ctrl_config = {
> +	.ops = &iris_ctrl_ops,
> +	.id = V4L2_CID_QCOM_MBR_RATE_CONTROL,
> +	.name = "MBR Rate Control",
> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> +	.min = 0,
> +	.max = 1,
> +	.step = 1,
> +	.def = 0,
> +};
> +
>   int iris_ctrls_init(struct iris_inst *inst)
>   {
>   	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
> @@ -368,7 +383,11 @@ int iris_ctrls_init(struct iris_inst *inst)
>   			goto error;
>   		}
>   
> -		if (cap[idx].flags & CAP_FLAG_MENU) {
> +		if (v4l2_id == V4L2_CID_QCOM_MBR_RATE_CONTROL) {
> +			ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
> +						    &iris_mbr_rate_control_ctrl_config,
> +						    NULL);
> +		} else if (cap[idx].flags & CAP_FLAG_MENU) {
>   			ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler,
>   						      &iris_ctrl_ops,
>   						      v4l2_id,
> @@ -411,6 +430,39 @@ int iris_ctrls_init(struct iris_inst *inst)
>   	return ret;
>   }
>   
> +static const struct platform_inst_fw_cap inst_fw_cap_sc7280_only_enc[] = {
> +	{
> +		.cap_id = MBR_RATE_CONTROL,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_mbr_rate_control,
> +	},
> +};
> +
> +static void iris_copy_enc_caps(struct iris_core *core, const struct platform_inst_fw_cap *caps,
> +			       u32 num_cap)
> +{
> +	u32 i, cap_id;
> +
> +	for (i = 0; i < num_cap; i++) {
> +		cap_id = caps[i].cap_id;
> +		if (!iris_valid_cap_id(cap_id))
> +			continue;
> +
> +		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
> +		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
> +		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
> +		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
> +		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
> +		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
> +		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
> +		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
> +	}
> +}
> +
>   void iris_session_init_caps(struct iris_core *core)
>   {
>   	const struct platform_inst_fw_cap *caps;
> @@ -444,23 +496,12 @@ void iris_session_init_caps(struct iris_core *core)
>   		}
>   	}
>   
> -	caps = core->iris_firmware_data->inst_fw_caps_enc;
> -	num_cap = core->iris_firmware_data->inst_fw_caps_enc_size;
> -
> -	for (i = 0; i < num_cap; i++) {
> -		cap_id = caps[i].cap_id;
> -		if (!iris_valid_cap_id(cap_id))
> -			continue;
> +	iris_copy_enc_caps(core, core->iris_firmware_data->inst_fw_caps_enc,
> +			   core->iris_firmware_data->inst_fw_caps_enc_size);
>   
> -		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
> -		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
> -		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
> -		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
> -		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
> -		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
> -		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
> -		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
> -	}
> +	if (core->iris_platform_data->mbr_rc_supported)
> +		iris_copy_enc_caps(core, inst_fw_cap_sc7280_only_enc,
> +				   ARRAY_SIZE(inst_fw_cap_sc7280_only_enc));
>   }
>   
>   static u32 iris_get_port_info(struct iris_inst *inst,
> @@ -761,6 +802,11 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>   	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>   	u32 rc_mode = 0;
>   
> +	/* MBR_RATE_CONTROL takes priority over BITRATE_MODE when both are client-set */
> +	if ((inst->fw_caps[MBR_RATE_CONTROL].flags & CAP_FLAG_CLIENT_SET) &&
> +	    inst->fw_caps[MBR_RATE_CONTROL].value)
> +		return iris_set_mbr_rate_control(inst, MBR_RATE_CONTROL);
> +
>   	if (!frame_rc)
>   		rc_mode = HFI_RATE_CONTROL_OFF;
>   	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
> @@ -779,6 +825,27 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>   				     &rc_mode, sizeof(u32));
>   }
>   
> +int iris_set_mbr_rate_control(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	u32 mbr_enable = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[BITRATE_MODE].hfi_id;
> +	u32 rc_mode;
> +
> +	if (mbr_enable)
> +		rc_mode = HFI_RATE_CONTROL_MBR;
> +	else
> +		return iris_set_bitrate_mode_gen1(inst, BITRATE_MODE);
> +
> +	inst->hfi_rc_type = rc_mode;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					 HFI_HOST_FLAGS_NONE,
> +				     iris_get_port_info(inst, BITRATE_MODE),
> +				     HFI_PAYLOAD_U32_ENUM,
> +				     &rc_mode, sizeof(u32));
> +}
> +
>   int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 3c462ec9190b..730d2d66ae2c 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -7,6 +7,9 @@
>   #define __IRIS_CTRLS_H__
>   
>   #include "iris_platform_common.h"
> +#include <linux/videodev2.h>
> +
> +#define V4L2_CID_QCOM_MBR_RATE_CONTROL (V4L2_CID_USER_QCOM_IRIS_BASE + 0)
>   
>   struct iris_core;
>   struct iris_inst;
> @@ -27,6 +30,7 @@ int iris_set_bitrate_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type
>   int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_mbr_rate_control(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 0e4dee192384..d737d3aba0aa 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -130,6 +130,7 @@
>   #define HFI_RATE_CONTROL_VBR_CFR		0x1000003
>   #define HFI_RATE_CONTROL_CBR_VFR		0x1000004
>   #define HFI_RATE_CONTROL_CBR_CFR		0x1000005
> +#define HFI_RATE_CONTROL_MBR			0x1000006
>   #define HFI_RATE_CONTROL_CQ				0x1000008
>   
>   #define HFI_H264_ENTROPY_CAVLC			0x1
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index c9256f2323dc..08b660d3285c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -183,6 +183,7 @@ enum platform_inst_fw_cap_type {
>   	LAYER3_BITRATE_HEVC,
>   	LAYER4_BITRATE_HEVC,
>   	LAYER5_BITRATE_HEVC,
> +	MBR_RATE_CONTROL,
>   	INST_FW_CAP_MAX,
>   };
>   
> @@ -319,6 +320,7 @@ struct iris_platform_data {
>   	u32 tz_cp_config_data_size;
>   	u32 num_vpp_pipe;
>   	bool no_aon;
> +	bool mbr_rc_supported;
>   	u32 max_session_count;
>   	/* max number of macroblocks per frame supported */
>   	u32 max_core_mbpf;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 6e06a32822bb..2e160710d6af 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -87,6 +87,7 @@ const struct iris_platform_data sc7280_data = {
>   	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
>   	.num_vpp_pipe = 1,
>   	.no_aon = true,
> +	.mbr_rc_supported = true,
>   	.max_session_count = 16,
>   	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
>   	/* max spec for SC7280 is 4096x2176@60fps */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h

separate patch

> index affec0ab4781..04ac1c6532f7 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -234,6 +234,12 @@ enum v4l2_colorfx {
>    */
>   #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
>   
> +/*
> + * The base for the Qualcomm iris driver controls.
> + * We reserve 16 controls for this driver.

please keep reserve for 64 controls

> + */
> +#define V4L2_CID_USER_QCOM_IRIS_BASE		(V4L2_CID_USER_BASE + 0x1240)
> +
>   /* MPEG-class control IDs */
>   /* The MPEG controls are applicable to all codec controls
>    * and the 'MPEG' part of the define is historical */
> 
> ---
> base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
> change-id: 20260212-b4-add_sc7280_mbr-597ac615b931
> 
> Best regards,

