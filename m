Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A8F3F8226;
	Fri,  9 Oct 2026 08:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534978; cv=none; b=XXTKHmSHDWcuswX0F0CdWyF7irDrw9/2nUIAtVktcrk0k6X47DuRSsAiVEEu9J6zzQT4hpyT75kPtAZdq1kRKuPWYAOW2h+vUFjdmghcZ8e/Y65PqY0pDNOKzT/dGyg5LunvdgUFcphAR00xOiZsksg6xayzOF7EQ1cH2zksEro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534978; c=relaxed/simple;
	bh=acHOvUyNNpBWZOfc1ig2RRGAlkdonf+3o+8ZFzA5xrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FHqH8yHaYbm++gpZmG2Sn1yVKFKOgz1Cf/4Mrkox8y7o800DGA2szwsbLJ7fkyIgvZmHhYpCK2qyU4ITRy8kxPKsvMHh8CwhPH9x4tl0CI2J5qrEEccBEHgigjS7fuZ4KwYLufv+zlHtoIG8OKdgEIVzpgKdnbHy9vg1s331obo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXZjC/Gp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXZjC/Gp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB96E1F0089E;
	Fri,  9 Oct 2026 08:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791534977;
	bh=FkE4i0Iq8gfT1jJULW5hGas59VgXRfgZenVoYC9LFIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YXZjC/GpVzCN4HlfOESv0DP718uMsgoQ1k8emcLSESXXMZeBqv0EDBRucM2RKCE+K
	 +kZaDMVgSMQYSfJR9NEC0E+Eh9Xs01TM6qFaOfO7LUoYvE323GKnRFica9Yk5gukfP
	 yotx0oNwncnvgSDtbO59KpfELvm/ZncrBKPxF0/h+hKDuhYupcjT6Dol+lY19cAQhU
	 BXS18tMcCmC6P/BWkHAavy/atn42q8GBJA9m0JFv/jrLd3Hd2vZWIk1PKdqlH4RJs5
	 kbssTgNmaaBky7K5NaRQeCM3UzV9MQ7oyP6AFYVrWPcyuubCQDG8vHWPT8qBFmHEwD
	 MsfszU3Z2GI8A==
Message-ID: <f026c92b-4fc3-47d4-b34b-1f5e7d833db9@kernel.org>
Date: Fri, 9 Oct 2026 09:36:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] media: iris: Add BUF_ROIMB_DELTAQP metadata buffer
 for ROI delta QP
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com>
 <LUZ21kT904VvfF7rnE8IzfLHFnXMPM3cysAWOEsdgevW4KGZbLWir7s3vf0S2vwOmAq3L_9YqKzklwB8lYU_rA==@protonmail.internalid>
 <20261005-enc_roi_enable-v9-5-831c24135cb1@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261005-enc_roi_enable-v9-5-831c24135cb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2026 22:38, Deepa Guthyappa Madivalara wrote:
> - Introduce BUF_ROIMB_DELTAQP as a new internal buffer type to carry
>    per-macroblock ROI delta QP data to the firmware. This buffer is
>    allocated on demand when the application sets ROI parameters via
>    V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP, and is queued alongside each
>    raw input buffer as an HFI_BUFFER_METADATA packet on HFI_PORT_RAW.
> 
> - The metadata buffer layout follows the firmware-defined metabuf_header
>    and metapayload_header structures. The s8 per-MB delta QP values
>    supplied by userspace are widened to s16 as required by the firmware.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 114 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_buffer.h     |   4 +
>   drivers/media/platform/qcom/iris/iris_ctrls.c      |  28 +++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   1 +
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  24 +++++
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |   2 +
>   drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
>   8 files changed, 176 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177f5e1ab83b90a3c8c80e0b4d1f02e..a7f1d74360d6a490959b27936fa5bbc61a7d9358 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -5,11 +5,13 @@
> 
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-mem2mem.h>
> +#include <linux/slab.h>
> 
>   #include "iris_buffer.h"
>   #include "iris_instance.h"
>   #include "iris_power.h"
>   #include "iris_vpu_buffer.h"
> +#include "iris_hfi_gen2_defines.h"

Why pull in gen2 defines to generic code ?

> 
>   #define PIXELS_4K 4096
>   #define MAX_WIDTH 4096
> @@ -705,6 +707,20 @@ int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
>   	return iris_destroy_internal_buffers(inst, plane, false);
>   }
> 
> +int iris_destroy_roi_metadata_buffers(struct iris_inst *inst)
> +{
> +	struct iris_buffer *buf, *next;
> +	struct iris_buffers *buffers;
> +
> +	if (inst->domain == ENCODER) {
> +		buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
> +		list_for_each_entry_safe(buf, next, &buffers->list, list)
> +			iris_destroy_internal_buffer(inst, buf);
> +	}
> +
> +	return 0;
> +}
> +
>   static int iris_release_internal_buffers(struct iris_inst *inst,
>   					 enum iris_buffer_type buffer_type)
>   {
> @@ -928,3 +944,101 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
> 
>   	return 0;
>   }
> +
> +static int iris_fill_roi_data(struct iris_inst *inst, struct iris_buffer *buffer)
> +{
> +	s8 *p_array = (s8 *)inst->fw_caps[ROI_PARAMS].p_array;
> +	u32 payload_offset, lcu_width, lcu_height, row_size;
> +	u32 array_size = inst->fw_caps[ROI_PARAMS].elems;
> +	struct metabuf_header *mbuf_hdr = buffer->kvaddr;
> +	struct metapayload_header *mbuf_payload_hdr;
> +	struct v4l2_format *f = inst->fmt_src;
> +	s16 *p_16, *p_temp;
> +
> +	memset(mbuf_hdr, 0, sizeof(struct metabuf_header));

Just memeset the buffer for its agrregate extent instead of memsetting 
at an offset again laster.

> +	mbuf_hdr->count = 1;
> +	mbuf_hdr->size = sizeof(struct metabuf_header) +
> +			 sizeof(struct metapayload_header);
> +	mbuf_hdr->version = BIT(16);
> +	mbuf_hdr++;
> +	mbuf_payload_hdr = (struct metapayload_header *)(mbuf_hdr);
> +	payload_offset = sizeof(struct metabuf_header) +
> +			 sizeof(struct metapayload_header);
> +
> +	memset(mbuf_payload_hdr, 0, sizeof(struct metapayload_header));
> +	mbuf_payload_hdr->type = HFI_PROP_ROI_INFO;
> +	mbuf_payload_hdr->size = array_size * sizeof(s16);
> +	mbuf_payload_hdr->version = 1 << 16;

BIT(16) not 1 << 16

You've already done the right thing nine line lines earlier..

> +	mbuf_payload_hdr->offset = ALIGN(payload_offset, (u32)256);

Why the cast to u32 ?

> +	mbuf_payload_hdr->flags = 0;

flags is already zero from the memset();

> +
> +	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +		lcu_width = (f->fmt.pix_mp.width + 31) >> 5;
> +		lcu_height = (f->fmt.pix_mp.height + 31) >> 5;

This code looks a bit odd.

lcu_width = (f->fmt.pix_mp.width + 31) >> 5;

->

DIV_ROUND_UP(f->fmt.pix_mp.width, 32);

> +	} else {
> +		lcu_width = (f->fmt.pix_mp.width + 15) >> 4;
> +		lcu_height = (f->fmt.pix_mp.height + 15) >> 4;

DIV_ROUND_UP()

> +	}
> +	/* Firmware expects each row to align to 8 LCU */
> +	row_size = (((lcu_width + 7) >> 3) << 3);

ALIGN(x, 8);

> +	/* Firmware expects 2bytes of delta_Qp, int16_t */
> +	p_16 = buffer->kvaddr + mbuf_payload_hdr->offset;
> +	for (int j = 0; j < lcu_height; j++) {

mbuf_payload_hdr->size = array_size * sizeof(s16) is the size of the 
buffer - lcu_height is not.

> +		p_temp = p_16 + j * row_size;
> +		for (int i = 0; i < lcu_width; i++)
> +			*p_temp++ = (1 << 11) | (((u8)p_array[j * lcu_width + i]
> +						   & 0x3F) << 4);

u8 is not required here.

BIT(11) not (1 << 11)

> +	}
> +
> +	return 0;
> +}
> +
> +int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst)
> +{
> +	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
> +	struct iris_core *core = inst->core;
> +	struct iris_buffer *buffer, *first_buffer, *next;
> +	bool found = false;
> +	int ret = 0;
> +
> +	if (!buffers->size)
> +		return 0;
> +
> +	list_for_each_entry_safe(buffer, next, &buffers->list, list) {
> +		if (buffer->attr & BUF_ATTR_DEQUEUED) {
> +			buffer->attr &= ~BUF_ATTR_DEQUEUED;
> +			list_move(&buffer->list, &buffers->list);
> +			found = true;
> +			break;
> +		}
> +	}
> +	if (!found) {
> +		buffer = kzalloc_obj(*buffer);
> +		if (!buffer)
> +			return -ENOMEM;
> +
> +		INIT_LIST_HEAD(&buffer->list);
> +		buffer->type = BUF_ROIMB_DELTAQP;
> +		buffer->index++;

This is equivalent to buffer->index = 1;

But why ?

> +		buffer->buffer_size = buffers->size;
> +		buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE;
> +
> +		buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
> +						 &buffer->device_addr, GFP_KERNEL,
> +						 buffer->dma_attrs);
> +
> +		if (!buffer->kvaddr) {
> +			kfree(buffer);
> +			return -ENOMEM;
> +		}
> +		list_add(&buffer->list, &buffers->list);
> +	}
> +
> +	first_buffer = list_first_entry(&buffers->list, struct iris_buffer, list);
> +	ret = iris_fill_roi_data(inst, first_buffer);
> +	if (ret)
> +		return ret;

You could drop first_buffer and just use buffer here;

> +
> +	return ret;

if (ret)
	return ret;

return 0;

> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index ee2d24bb69c57220b0a735d9b4aae4434a33daf6..df9d018493f3ec37fd5e6b0ba049dba0b5ae76e9 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -28,6 +28,7 @@ struct iris_inst;
>    * @BUF_SCRATCH_2: buffer to store encoding context data for HW
>    * @BUF_VPSS: buffer to store VPSS context data for HW
>    * @BUF_PARTIAL: buffer for AV1 IBC data
> + * @BUF_ROIMB_DELTAQP: metadata buffer for ROI MB DeltaQp
>    * @BUF_TYPE_MAX: max buffer types
>    */
>   enum iris_buffer_type {
> @@ -44,6 +45,7 @@ enum iris_buffer_type {
>   	BUF_SCRATCH_2,
>   	BUF_VPSS,
>   	BUF_PARTIAL,
> +	BUF_ROIMB_DELTAQP,
>   	BUF_TYPE_MAX,
>   };
> 
> @@ -139,5 +141,7 @@ int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
>   int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
>   int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
>   void iris_vb2_queue_error(struct iris_inst *inst);
> +int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst);
> +int iris_destroy_roi_metadata_buffers(struct iris_inst *inst);
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index cd5597b2cbb69f0608fb8f21bd813e11c1f97693..fc6499598926af071fbd9f989c01e638d98efa29 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -1716,3 +1716,31 @@ int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
> 
>   	return hfi_ops->session_subscribe_metadata_delivery(inst, plane);
>   }
> +
> +int iris_set_roi_params(struct iris_inst *inst, u32 plane)
> +{
> +	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
> +	u32 height = inst->fmt_src->fmt.pix_mp.height;
> +	u32 width = inst->fmt_src->fmt.pix_mp.width;
> +	u32 metadata_header_bytes = 256;
> +	u32 lcu_height = 0;
> +	u32 lcu_width = 0;
> +	u32 lcu_size = 16;
> +	u32 n_shift = 0;
> +	u32 size = 0;
> +
> +	if (!inst->fw_caps[ROI_PARAMS].p_array)
> +		return -EINVAL;
> +
> +	if (inst->codec == V4L2_PIX_FMT_HEVC)
> +		lcu_size = 32;
> +
> +	n_shift = ilog2(lcu_size);
> +	lcu_width = (width + (lcu_size - 1)) >> n_shift;
> +	lcu_height = (height + (lcu_size - 1)) >> n_shift;
> +	size = (((lcu_width + 7) >> 3) << 3) * lcu_height * 2;
> +	size += metadata_header_bytes;
> +	buffers->size = ALIGN(size, 4096);

So you set the size here but, this doesn't correlate to the size in the 
alloc() path.

Its possible then for a value to be set that overflows the allocated 
buffer on the kernel side ?

> +
> +	return iris_hfi_gen2_session_alloc_roi_metadata_buffer(inst);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index ef2c09485ad93719e4acc7f395899d7f67cb5b2d..d5fb33a8e2a19035a0ff5eb412ffb8167e6098f3 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -52,5 +52,6 @@ int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_c
>   int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_properties(struct iris_inst *inst, u32 plane);
>   int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
> +int iris_set_roi_params(struct iris_inst *inst, u32 plane);
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index 0f4c6f955f4f408c45c50796332b47c116f52982..36d2517140ce67821962c200093a9887e5b6b392 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -1822,6 +1822,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   		.hfi_id = HFI_PROP_ROI_INFO,
>   		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
>   			 CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_roi_params,
>   	},
>   	{
>   		.cap_id = MB_SIZE,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index cf88dbe11e8e9faef826e661d8e9909fd7f16b94..a1b0c4982f0d789a807f22a1dffdf61decd20d28 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -134,6 +134,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
>   		switch (buffer_type) {
>   		case BUF_INPUT:
>   		case BUF_VPSS:
> +		case BUF_ROIMB_DELTAQP:
>   			return HFI_PORT_RAW;
>   		case BUF_OUTPUT:
>   		case BUF_BIN:
> @@ -1267,6 +1268,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
>   		return HFI_BUFFER_VPSS;
>   	case BUF_PARTIAL:
>   		return HFI_BUFFER_PARTIAL_DATA;
> +	case BUF_ROIMB_DELTAQP:
> +		return HFI_BUFFER_METADATA;
>   	default:
>   		return 0;
>   	}
> @@ -1328,6 +1331,7 @@ static struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
>   static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>   {
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	struct iris_hfi_buffer hfi_meta_buffer;
>   	struct iris_hfi_buffer hfi_buffer;
>   	u32 port;
>   	int ret;
> @@ -1349,6 +1353,26 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
>   					     &hfi_buffer,
>   					     sizeof(hfi_buffer));
> 
> +	/* check if any metadata buffer is available not queued, queue it */
> +	if (port == HFI_PORT_RAW) {
> +		buffer = iris_queue_metadata_buffers(inst, BUF_ROIMB_DELTAQP, buffer->index);
> +		if (buffer) {
> +			iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_meta_buffer);
> +			port = iris_hfi_gen2_get_port_from_buf_type(inst, buffer->type);
> +			iris_hfi_gen2_create_packet(inst_hfi_gen2->packet,
> +						    HFI_CMD_BUFFER,
> +						    HFI_HOST_FLAGS_INTR_REQUIRED,
> +						    HFI_PAYLOAD_STRUCTURE,
> +						    port,
> +						    inst->core->packet_id++,
> +						    &hfi_meta_buffer,
> +						    sizeof(hfi_meta_buffer));
> +
> +			buffer->attr |= BUF_ATTR_QUEUED;
> +			buffer->attr &= ~BUF_ATTR_DEQUEUED;
> +		}
> +	}
> +
>   	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
>   					inst_hfi_gen2->packet->size);
>   }
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index ea1fc96077fdce83db9c6a6c1f753ec7978b0673..4f8f0b78f7b7559d985ea627f9a3224f36fb6f18 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -58,6 +58,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>   		return BUF_PARTIAL;
>   	case HFI_BUFFER_VPSS:
>   		return BUF_VPSS;
> +	case HFI_BUFFER_METADATA:
> +		return BUF_ROIMB_DELTAQP;
>   	default:
>   		return 0;
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 05aab6e3005d5c3788f5dfe5857f2d6b782e7a83..ba56aca5c0d102869dcf7ad6c050579283000cd7 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -199,6 +199,7 @@ int iris_open(struct file *filp)
>   	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
>   	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
>   	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
> +	INIT_LIST_HEAD(&inst->buffers[BUF_ROIMB_DELTAQP].list);
>   	init_completion(&inst->completion);
>   	init_completion(&inst->flush_completion);
> 
> @@ -321,6 +322,7 @@ int iris_close(struct file *filp)
>   	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>   	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>   	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	iris_destroy_roi_metadata_buffers(inst);
>   	iris_remove_session(inst);
>   	mutex_unlock(&inst->lock);
>   	iris_inst_put(inst);
> 
> --
> 2.34.1
> 

