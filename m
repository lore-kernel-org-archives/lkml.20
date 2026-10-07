Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F3044A3F0;
	Wed,  7 Oct 2026 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363543; cv=none; b=ftTBKcSu7IRlEoSGfktu7XG/l3AP5LD114DGsDEMfE1qCdSIYmbeuo44c73yYk32Wltkqg4djS0R2f3lz5W2+5I8UNTpxPD5FyWouFbUbHwcoQZlSrOoskZvQy1tJBx6FRpFoQ3+f+36OpHLwT7CdH0Ijhi/EEhjXtqtZ7ws7wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363543; c=relaxed/simple;
	bh=cO7E7mdFxwxigcQAmIjlYNrzW89T0GPcNvedPKO8Cvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OjFjeNhCkUnPCI0nk1oIK7yGPMpvfRORy5gMsE43Yn6UI3xoutYlQue02RloQdbmMx3SoK4bN6O3qUS0aJGF3706bdlj3D0ZKozofn9GydycZBPOk1/aq09U1K4HoXQMqr4W4gUJU/8NQ+ItpDp+UtXP74zJt+t11C6NYMIFIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fs41tYdY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fs41tYdY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3CD1F0089B;
	Wed,  7 Oct 2026 08:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791363539;
	bh=jL0i9MfDA/PminIFRDX9dVufuQqO+g5HnrYu4cZPTR8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fs41tYdYGRU8d41Wi1d1+UWI/TmJTlqxriOq6ywI4qo25rJHceDey6/KPUth1PWvE
	 Qt6iZEoHP7VYbhsQzU7lD7xtFv0iWyirUW6t8YNh3nNNiciKBlpKUWXsL/PpnSzEly
	 AdkOY30FRmNKxIYciBOPZ0YiXVejCWyF40uef5Oa16ImXRZohaLcT58Afa/fWOiLmQ
	 dan18QB0mfRncPyCrc4Xa1y0O58oEM2R84YVwJeESwoutOQjop0px32eHeqEb5C3Ym
	 nJxCLh9b1bzCCatHikBUzl4A40XZPQMlMgl/6h2owwVhumytdGO1x6jKXShF+cCp46
	 /ZmdjGpOLgSAQ==
Message-ID: <27745be4-20de-4a00-95cf-27fde23f7e28@kernel.org>
Date: Wed, 7 Oct 2026 10:58:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] media: iris: Add HFI metadata buffer delivery
 support for Gen2 encoders
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com>
 <inQVe3E9xQxUl97a9oxAvOjTb4IDzqhxOQqup3aHNw7U0PKfGHr7lWGM7jXu5bLR94PU88T5GRDR9txWtXBDRg==@protonmail.internalid>
 <20261005-enc_roi_enable-v9-4-831c24135cb1@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20261005-enc_roi_enable-v9-4-831c24135cb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2026 23:38, Deepa Guthyappa Madivalara wrote:
> Add the infrastructure to deliver metadata buffers to the HFI firmware
> on HFI Gen2 based encoders, used to carry per-frame ROI delta QP data.
> 
> Metadata buffer structures (iris_buffer.h):
> - Add metabuf_header and metapayload_header structs describing the
>    metadata buffer layout as expected by the firmware.
>    HFI defines (iris_hfi_gen2_defines.h):
> - Add HFI_CMD_DELIVERY_MODE (0x0100000A).
> - Add HFI_MODE_METADATA (0x00000004) to hfi_property_mode_type.
>    HFI command side (iris_hfi_gen2_command.c):
> - In iris_hfi_gen2_session_queue_buffer(), after queuing a RAW
>    (input) buffer, check for an available BUF_ROIMB_DELTAQP metadata
>    buffer and, if found, append a second HFI_CMD_BUFFER packet for
>    the metadata buffer in the same command, tagged with the same
>    buffer index.
> - Add iris_hfi_gen2_subscribe_metadata_delivery(): sends
>    HFI_CMD_DELIVERY_MODE with HFI_MODE_METADATA and HFI_PROP_ROI_INFO
>    to instruct the firmware to expect metadata on the input port.
>    HFI response side (iris_hfi_gen2_response.c):
> - Add iris_hfi_gen2_handle_output_metadata_buffer(): locate the
>    metadata buffer by device address and transition it from
>    QUEUED to DEQUEUED so it can be reused.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.h     | 18 ++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 12 +++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 39 ++++++++++++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
>   .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  6 ++--
>   .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  3 ++
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    | 27 +++++++++++++++
>   drivers/media/platform/qcom/iris/iris_venc.c       |  4 +++
>   10 files changed, 110 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index ab8e5d953101a786ade20540ee3c3ed226160cbe..ee2d24bb69c57220b0a735d9b4aae4434a33daf6 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -107,6 +107,24 @@ struct iris_buffers {
>   	u32			size;
>   };
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
>   int iris_get_buffer_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>   void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
>   int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index d97fe50d48860b0f26b71d328a704f3804b1d93d..cd5597b2cbb69f0608fb8f21bd813e11c1f97693 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -1704,3 +1704,15 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
> 
>   	return 0;
>   }
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

What does ret do here ?

Also is session_subscribe_metadata_delivery() guaranteed to be non-NULL 
? I see it initialised once in this patch.

> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 08db807444203ef02f83008fc311cad20ea79f44..ef2c09485ad93719e4acc7f395899d7f67cb5b2d 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -51,5 +51,6 @@ int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_ty
>   int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_properties(struct iris_inst *inst, u32 plane);
> +int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index 16099f9a25b65e2e4556d54499e2c2a4cc4e22fc..79b276cc64f656c387dab5994d844bc9a9c9e624 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -132,6 +132,7 @@ struct iris_hfi_session_ops {
>   	int (*session_drain)(struct iris_inst *inst, u32 plane);
>   	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
>   	int (*session_close)(struct iris_inst *inst);
> +	int (*session_subscribe_metadata_delivery)(struct iris_inst *inst, u32 plane);
>   };
> 
>   struct hfi_subscription_params {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 388a36ff2b07b7bcd8db21d4345bc900356b4ec3..cf88dbe11e8e9faef826e661d8e9909fd7f16b94 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1307,6 +1307,24 @@ static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
>   	buf->timestamp = buffer->timestamp;
>   }
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
>   static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>   {
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> @@ -1359,6 +1377,26 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
>   					inst_hfi_gen2->packet->size);
>   }
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
>   static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
>   	.session_open = iris_hfi_gen2_session_open,
>   	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
> @@ -1372,6 +1410,7 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
>   	.session_drain = iris_hfi_gen2_session_drain,
>   	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
>   	.session_close = iris_hfi_gen2_session_close,
> +	.session_subscribe_metadata_delivery = iris_hfi_gen2_subscribe_metadata_delivery,
>   };
> 
>   static struct iris_inst *iris_hfi_gen2_get_instance(void)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 2394213d8272b53bf6a1cff9574dc93f6830fc8c..746d7c1aad52cd87c55a7ad71fcf9560881dfce6 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -20,6 +20,7 @@
>   #define HFI_CMD_DRAIN				0x01000007
>   #define HFI_CMD_RESUME				0x01000008
>   #define HFI_CMD_BUFFER				0x01000009
> +#define HFI_CMD_DELIVERY_MODE		        0x0100000A
>   #define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
>   #define HFI_CMD_SETTINGS_CHANGE			0x0100000C
>   #define HFI_CMD_PAUSE				0x01000011
> @@ -177,6 +178,7 @@ enum hfi_flip {
>   enum hfi_property_mode_type {
>   	HFI_MODE_PORT_SETTINGS_CHANGE		= 0x00000001,
>   	HFI_MODE_PROPERTY			= 0x00000002,
> +	HFI_MODE_METADATA			= 0x00000004,
>   };
> 
>   enum hfi_color_format {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 6e04175eb904b494309a38eece41213600f93a88..655f4c2fcdd5b89624887807f4fa17a645fac803 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -100,9 +100,9 @@ static void iris_hfi_gen2_create_header(struct iris_hfi_header *hdr,
>   	hdr->num_packets = 0;
>   }
> 
> -static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
> -					u32 pkt_flags, u32 payload_type, u32 port,
> -					u32 packet_id, void *payload, u32 payload_size)
> +void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
> +				 u32 pkt_flags, u32 payload_type, u32 port,
> +				 u32 packet_id, void *payload, u32 payload_size)
>   {
>   	struct iris_hfi_packet *pkt = (struct iris_hfi_packet *)((u8 *)hdr + hdr->size);
>   	u32 pkt_size = sizeof(*pkt) + payload_size;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> index 25b9582349ca1a0ce6efc0b146a3abb798485c45..613eb500609f745daebdcbdf9a25b85cb9465a79 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> @@ -121,5 +121,8 @@ void iris_hfi_gen2_packet_session_property(struct iris_inst *inst,
>   void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
>   						       struct iris_hfi_header *hdr);
>   void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct iris_hfi_header *hdr);
> +void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
> +				 u32 pkt_flags, u32 payload_type, u32 port,
> +				 u32 packet_id, void *payload, u32 payload_size);
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index f0782c4b1e6e88d06cb4bd18f0210c105ae2acf8..ea1fc96077fdce83db9c6a6c1f753ec7978b0673 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -77,6 +77,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
>   	case HFI_BUFFER_PERSIST:
>   	case HFI_BUFFER_VPSS:
>   	case HFI_BUFFER_PARTIAL_DATA:
> +	case HFI_BUFFER_METADATA:
>   		return true;
>   	default:
>   		return false;
> @@ -452,6 +453,30 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
>   	return 0;
>   }
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
>   static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,
>   					     struct iris_hfi_packet *pkt)
>   {
> @@ -499,6 +524,8 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
>   			return iris_hfi_gen2_handle_input_buffer(inst, buffer);
>   		else if (buffer->type == HFI_BUFFER_BITSTREAM)
>   			return iris_hfi_gen2_handle_output_buffer(inst, buffer);
> +		else if (buffer->type == HFI_BUFFER_METADATA)
> +			return iris_hfi_gen2_handle_output_metadata_buffer(inst, buffer);
>   		else
>   			return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 2f2c56bf9122c73e10e86815b1aa5fad99b0fb42..08353a8895b0e5d8769c2deb137a4fffcbc3108d 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -515,6 +515,10 @@ int iris_venc_streamon_output(struct iris_inst *inst)
>   	if (ret)
>   		goto error;
> 
> +	ret = iris_set_metadata_delivery(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (ret)
> +		goto error;
> +
>   	ret = iris_alloc_and_queue_persist_bufs(inst, BUF_ARP);
>   	if (ret)
>   		return ret;
> 
> --
> 2.34.1
> 

