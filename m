Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E974825D0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764375; cv=none; b=C95dn9QPZLl8OOkIn0KgGEG6TtkjZQaYILBnHXTFgA4SeYYgxYLLG0g9K9wLgKIfUv2FDinISdoZrNmEZrHk0atEvK1qk5y/wtadI5xH3nKlC7ZWe3VTLTYd/Sl1aZ0xifbDpYOtzxSmGiIRNtAOihTuRB58nTl+ey9YkifnR04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764375; c=relaxed/simple;
	bh=JH8sCV9+Xv9sba2LpxjbGm2B0qbYpiPMyF7ZcZbbpuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/QR//vXK3cyJdJTHVFr0Z5fLD352cwyvEliAIxsOdVTyRTU8OXRC/jck5YHB5Z+n0FFjfaCdQAzJJLMcbWsuV5zOMkDp+gFEi1eANOkCLheIlqqSIkfWqOdzfLSXaP7zn60pO+9S/b5wRcDdrAFnadri/uBabLm8jZIsiMu6ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xlj9spsw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApXYYVLH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xlj9spsw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApXYYVLH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dQ2u1556131
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xfKc0MU4mZbrsV+W376Hf1zXEFQ3vGa6Js9DL7NQcM=; b=Xlj9spsw2xEujV5F
	DMZOQ55lMoodiPYqD4YQmHNgvqZh7w0sf2F7Y4PFs4qUgiH+/hRQ4sinH3bhK9ux
	aierW6abgAeu/VB9d/gxMzPVaYriTu+y5YI279CyxcUlMo7hp/OX34KcYEpj28hY
	C6jO2DshFlyaEXzXlMHUpLuQebk/GP/ep2JGUzpNcrXcut6DyUrPf1e1A9X4blG0
	UIhRN0Lj3str7myHCyzI56yk58ID3vL0vg8uRkmfx1DudHAot31B5NWibwF2kYOa
	OdTGAHxTtVFBppfrdZ6R+ZX6xzx7ZAkPs8/dy5lYkbzwpFs8B5Zr09ytrQ0rXIHp
	s7zabw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c0suk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:32:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d49d8dee1so126707eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764370; x=1791369170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xfKc0MU4mZbrsV+W376Hf1zXEFQ3vGa6Js9DL7NQcM=;
        b=ApXYYVLH3mzHZiouUCzCs+MYrcp+cB2sSLZDvwzWkCELFkXzb4xa/KT1OPGwINLn/b
         PTYH1dFqeOf+JQ28JQj1X/rvvdv/KA0JaV8w5n3qpMdrW2kmHX6snMbVzYp8swAVBtZs
         qO87cd4LyDpdY5xsXTNgjiS4DTpkkDbbYGtp/MdUL5TjVyjvvHp/npSeFVQs3pyFEGMv
         LfKBx7cRHf4vD+g2o9+eRGgRKB2uxavTMDyuh+d9a1NWoZrB+vrfPCZAPI3/c5+KS07U
         eghOHr7Ikn4K0U685VAALzqKI8moXQXDnA3oKGAOgmWU+ySarRzwUJksU9zgXmJ+FnxB
         FnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764370; x=1791369170;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xfKc0MU4mZbrsV+W376Hf1zXEFQ3vGa6Js9DL7NQcM=;
        b=eAcfz0jogL9rvAUw4VrXMU25ud4qS+STIfwjqBcXbmpMLX663yM2i73KayZoejDXmk
         rSZkuwnoGvE7LhrmCt11KUyZPSENzjG2xESS1WDJz3yvh5pVPTZJC563iw3PTwSXlkno
         TTqbNsX7QGG5fzsyeTN4RjvTjQUbEmnrK7YeDb4PUNupFPIs9cxjh6AmI0cDMYmuoDGo
         TJ/qziuz8SAreDGbuNSoTic0ur0iQo7KwIboBmCniyOw/Ob5LCHCTZjVdHn1z5mcdlwb
         b3hLEHFQhVBfAYAtW7h4LLK13uYGi+b8oUfpZK94jcLhNKfsxY6VUrInrCIf7TIysyUM
         HKJA==
X-Forwarded-Encrypted: i=1; AKwUvBzVd1L+5Bk0e5JLzlQpYNrx9dSy5wA+lg/n5qBC/is443k6CQ+zwrifghQNhubLrahkqdPD4qDKvj3b+BM=@vger.kernel.org
X-Gm-Message-State: AFuF++nBbthmu0t2FtRihgVIrkTD0lyFg99OB4TRvVpBMj5Qdi16hGcn
	lf7I/HUNdsl9VgSGhvS3naTihotK1418kz8X0sDb5CLiGLXVN4+udyShE5t/W+7x8baimNsC7/t
	8aMXLR1+cEb33Kj47Y6jFPrKsDYkBUy6OqaAVnIJygvWs3na5AkhB6Yl9I0Kyf17nL8X5/9E4YS
	k=
X-Gm-Gg: AYBFou3ItJdTCEA9lirco018gRhVbMGBFKSPW206jpFnzptQj0498CFmbkXYX34s05r
	bhh4pz81Kh9PK8b4yg2mDNl9sIFxZlw9XxyhlRZRxjl0qtlN8TtfHat2UKAHh54OCTXqC/KrjAN
	s4A9ZDCJS8KigD0KOvE3CoEz1Ts80P2Uug+VetdsfS7kG1lIsFvQVs/K9zTdFqiIMLO7g+g2RIi
	N/UEftyYuNF9KKDq9PaThdULiB9yMweBIP7PsPg1zu8Ao9ilUB53Wf08kNuhOYrmYRX5IZvbmRA
	HCWZ8piiqYS7xiCA3wM+ijEYLTMVkHKAXIKTBiIDm56tScMGF0UXY3riWt0XEYHdW3wy0XK+IVp
	2tquYJXvBfUEYk0w9UfCjrBdbHNiYKQA=
X-Received: by 2002:a05:7022:251f:b0:14a:94d:534a with SMTP id a92af1059eb24-14d32146770mr1404539c88.12.1790764370145;
        Wed, 30 Sep 2026 03:32:50 -0700 (PDT)
X-Received: by 2002:a05:7022:251f:b0:14a:94d:534a with SMTP id a92af1059eb24-14d32146770mr1404491c88.12.1790764369414;
        Wed, 30 Sep 2026 03:32:49 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d088e5b8fsm3443402c88.7.2026.09.30.03.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:32:48 -0700 (PDT)
Message-ID: <f47e18a6-3ef5-9414-29be-4ead44f8ee89@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:02:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 4/5] media: iris: Add HFI metadata buffer delivery
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
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
 <20260924-enc_roi_enable-v7-4-6fa7413af23c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260924-enc_roi_enable-v7-4-6fa7413af23c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX+7ETlWNDrwek
 X2WTOugTROIkRPzD4PHghlz/WEINs1wPtiPt2Y2H0EFuM7ATJiiCwK8tooJkwZWFiQEbvZiWPKf
 pjt/a9mXy4+NTpeYHLyEUB+vqvbm1uY=
X-Proofpoint-ORIG-GUID: _7pgv44S6-Tlp7FBUc2HdXtkahCdFBQ1
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abce553 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iaZgE1KkmNriuiUYIy4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: _7pgv44S6-Tlp7FBUc2HdXtkahCdFBQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX9uBhj8FhM0An
 8NAkHPYk4bKFa1Gt8gM6jUS826bAJP0J9nGCz2pyQSSmD4hKjzpl0il/GNIVk/EfL4B5O/Wn2MF
 qcBj7Z6R8lfsBNgbU6EDSUucN3g0+o99FIcQKOZRGqK92mxUisAVRuksfLeSJ0196yf0plcBoIN
 WTK/6HngrYNSULtLJ6aO9CR4Ykv8qg3hInXPT3EuJoVXksoA7tM275ezsvU5WslAXcM17TPd0Js
 MTytocg5aXWvjRIvohK7i0N1FbP0f/kl4zxOxpgtGTbAoSfQ3W1oh/+zcafXMIxNCuNP5eRwSLu
 2O99+qagVrb6kJ9bCxMvBYF12TrRsJv7XxnjTsGkUu4F8KKD7JX8drz2A4OmhU/ZwPvpXwvc9h+
 pYlYR017sj0FAIK4BzV43h9+UcSWnk/AEF1w+DeicQ9lsoQsjNfj4A+CN6tbgO/bqZogQXF1tL4
 HtTm48pEbXOub6MTTPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300041


On 9/25/2026 5:58 AM, Deepa Guthyappa Madivalara wrote:
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
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 16 +++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 39 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
>  .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  6 ++--
>  .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  3 ++
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    | 27 +++++++++++++++
>  drivers/media/platform/qcom/iris/iris_venc.c       |  4 +++
>  10 files changed, 114 insertions(+), 3 deletions(-)
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
> index 9f84d28d00ab25555f1d2259f7ef0ed0786a0271..1ce8eccdedbdeb840833bd92edb3f59dd6962d7f 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -1608,3 +1608,19 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
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
> +	ret = hfi_ops->session_subscribe_metadata_delivery(inst, plane);
> +	if (ret)
> +		return ret;
> +
> +	return ret;

Can we simply return session_subscribe_metadata_delivery() here?

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
