Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E172C3F39D8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790831682; cv=none; b=GtzlDK4kBqhv1z4km9Uqc+jp22r3hue/DjL9ZsA5ELcdrLOCPotpeEv9/ip9Nl1fcKxYWFjKRR41n1/xrrirvzACYQe3wP6EesMo1I/BF9EgU1o75xoXkrOQzfxhGIGepxpwaHJyfy6ZOiO6rKlu2rhltk06go2s1TEiIegemcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790831682; c=relaxed/simple;
	bh=F09fQjBm9foMQrCr4d2BlxcarcKL7tNoZvGLudzuoTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CwgQXhDD+Sy3VbweTOe/BAJFK4Ba0MtDTyX8fTOwA/UHupIIiYU5rVHfQD6pwoKm9AsH0mQbRBKca6R55NFfnwmdPzv3XzH6/mBXuufZUoUp//r/8gVGC41803WfTufMZjmeeJ+WwRfgwovp0dEOi7ZLkj89tnN4vusEqEPAJqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opGODJEk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQD9h7Jr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opGODJEk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQD9h7Jr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913g1Eb865881
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 05:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fwxnw+1UTIa6on0QdAiPMgTixRwEDbP4YFLa8TGXxU4=; b=opGODJEkR0R3lcqU
	c4SQGJMnhFcenEyTNn47j8wGoOPAwlxRZAdRbu0+b2chGk3EQlu2SmTM5/Z8WSJG
	ug5XciOd01CApM/AeKu1SOrxqFmhw717/UPVB/psD7PVxK4oeygpXdLxYKrAq5s5
	naAAmsA20j92pUkIqNUX8kZNYCByu9XhVaJtSp020zbHroP4xPbTKam8VYwbbwMc
	IWflJCgE8EUmt1ILuGzvpkvabWs4muDP6gFviloQRIzoQfylPjG3byWOVvDawFis
	2OtC7rWh03KA7v2e8pdRNJ3PcQdRI6NZ40ehAq7kiEYYjGgutBOXSZzaC+Nbe26j
	sEBJ0Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pja470-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:14:39 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-142f4306744so7051695c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790831679; x=1791436479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fwxnw+1UTIa6on0QdAiPMgTixRwEDbP4YFLa8TGXxU4=;
        b=LQD9h7JrNz8HCpQhrHb0CIuPH76SUW8Vw/bDQiJFNR6sXNMvxZFLw++zi5J4WnqlaI
         h14c+OkOI21k9yppvoyNnTu922JpEhLkrDMdajVVegDvnxlMFwFMCBOXOkeL0wtKIYqL
         4V/ahbybBP6znmfcdlbQFyGDWF135tEfMkE4ZKvsOM2KfjyUbCTJxxCX+FJlBjFXTxM5
         gKtce5/0pP7CadOVbb34wWOdXrkEvXJ8e/ejbvkszZHW7ybTYq2GB2Omc0qoA/OvnAIW
         MeH3LJFxR/JeSbGUOTH5SCcEnwzsh8Mjvhq+zMnsPI62s/VNRXQdY3dMQ/z7EehyDHYC
         qkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790831679; x=1791436479;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fwxnw+1UTIa6on0QdAiPMgTixRwEDbP4YFLa8TGXxU4=;
        b=PsFWQ9k/jWFmFQOK29dlVV8UYd5+bT3cHcleL1yGdKm1zBgSxP5jO9R2Apsq3V/lU9
         skpvEWK4wg99sIc2YiOejDAKJyJ9TvXhBf9WHnHpfido02XHwSetjPY2kMWdZ/Ia9fuG
         ODNkOanbER96v6XRlv7ZneFLIU8rM/2lcqAaSOGTQg8k9nZB3nulF5ljjOhddJB2PyID
         R1IQa+Md2+frGCaqNxzXmW5Ttzb2802lTkahSNJMmrs4h7SZc9Uswi3F3P3IoVr+uL0d
         8QGTDX1CenEwEZaTYKfoiDsak+0C90Y1jmkPdYGRhx/v+4dNK4wJcPVDh8/KZj33M879
         bggg==
X-Forwarded-Encrypted: i=1; AKwUvBwoaJe8MeAiDRoTKccX2s5ffRInvFyyeE+vYr6m3NijBbsX4yWClwtG1YL8HsUZkF7yeeNzszIrmbLpIZw=@vger.kernel.org
X-Gm-Message-State: AFuF++mbmwxvztN0IRB8iUuV1hHUkI/wsxZrMUeTiKKr3t9Ikqt2bvyT
	j1KNm7Ujknau1jLGPBDDIFPJ/c+5RVXhWKprDRAit2cSYgmffGvI5Wjltsndqld3C4p/NzmZU0m
	EAH5lVgjMUYzZAgEXEqzmL9RGdU3ovdUZj+OdKRDBivrn58lHEg1vVDzTjZlSEKL6EUY=
X-Gm-Gg: AYBFou3Cu2ATJ+0AQizaXDLSlO5PC+qdoh4byGE1vNwaYnBdguYwc3iElDZX6v0o31v
	d9ixJryp6M2xRC7KmUks1NSszzn0UUERZp3l9ms+MQ38jdw6EEjQ5H+Hce+TTiexM6RGk6cny15
	Cl90f0wcB51qQvV3yvIYW3WD1ObZ+LHK38VFuywNo5mbujhDFQoKMf65oF6K0mYeBUJyCAoMKK+
	oFPoXY5uiXWDjy/lx2W25GkT/C+2/6IFUcvcKaOrpeJUwcMgdcSF5sITM9wiZWYaY7OIQjHzVqV
	Cz7tlb0UTaKeB2hSBA/0SZ8WuXEznAansjRhqtC7kbWvIX1s4SBDZUZZRshYFYFLlHaQ2QmxzkD
	CvVPYxDvxuhULIOUst1CXJ6Pw9HJXyts=
X-Received: by 2002:a05:701b:465d:b0:143:296a:c860 with SMTP id a92af1059eb24-14d32334dc1mr3086108c88.26.1790831678845;
        Wed, 30 Sep 2026 22:14:38 -0700 (PDT)
X-Received: by 2002:a05:701b:465d:b0:143:296a:c860 with SMTP id a92af1059eb24-14d32334dc1mr3086084c88.26.1790831678167;
        Wed, 30 Sep 2026 22:14:38 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df40dc189sm2846803c88.11.2026.09.30.22.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 22:14:37 -0700 (PDT)
Message-ID: <39d7e76b-dfd3-bc12-2234-1f8fd7d09f2b@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:44:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 5/5] media: iris: Add BUF_ROIMB_DELTAQP metadata buffer
 for ROI delta QP
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
 <20260930-enc_roi_enable-v8-5-2c908f30e963@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260930-enc_roi_enable-v8-5-2c908f30e963@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abdec3f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pdtBNdPs7a4fvCnHWgkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: ZSWFyNTTEOaP_0v8wBsfDt6-76PBFKby
X-Proofpoint-ORIG-GUID: ZSWFyNTTEOaP_0v8wBsfDt6-76PBFKby
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMCBTYWx0ZWRfX4une/UKnFYEO
 l7FK8tXLv4JjN83+uubJ7sqe2Jexkx3hWFmE0q2ytJtmGyTccYOuRU/9SPI/+aywQWz4H4whpEA
 Dwxa0cDJLi4a1xmY6ERuvDslgFsmPp0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMCBTYWx0ZWRfXzvvMSRpjs+KT
 v/zETuT0XDIBOQBmNHhnbkBrumglAu7L5gOF8CF6QB7CgJiZnOxSa2gFIH6iciOzu4PuET05msO
 dxltP76cgyxoF6cDoJE8qv6FYA5DqfWiC0IJM5b99u8WgAEESaBv0VsgA12WIqwxulXpdGScIX4
 q94plG97qR/+Y52NI9mPlR0wG07vDJOpvDkpZ9QnmWBldyAQgrozNLJmvvLTmTZdXVre7TdU2y8
 MIPxU3vI0u5KxV4E2fG54n5zkdd15fioCptOY9QOdus1YbxbbjSuTR2j/yRToNnNIvJEzpH6chl
 nhncbhpfliU99LBfSchZLLSQIk3JQnADNSqcNCDhO3Kub4+iOVIRmskyv69JN/8md/swN6Lmuyl
 XAPleYfw7el2NA6+bx7CpIyZgJ1iTvha0afXzcnllezU4AuRskOk7RyZjAvNP4cMRFfbRe1G/o2
 BV9N67DH950EHh2rg4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010020



On 10/1/2026 12:00 AM, Deepa Guthyappa Madivalara wrote:
> - Introduce BUF_ROIMB_DELTAQP as a new internal buffer type to carry
>   per-macroblock ROI delta QP data to the firmware. This buffer is
>   allocated on demand when the application sets ROI parameters via
>   V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP, and is queued alongside each
>   raw input buffer as an HFI_BUFFER_METADATA packet on HFI_PORT_RAW.
> 
> - The metadata buffer layout follows the firmware-defined metabuf_header
>   and metapayload_header structures. The s8 per-MB delta QP values
>   supplied by userspace are widened to s16 as required by the firmware.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     | 114 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_buffer.h     |   4 +
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |  29 ++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   1 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  24 +++++
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |   2 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
>  8 files changed, 177 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177f5e1ab83b90a3c8c80e0b4d1f02e..a7f1d74360d6a490959b27936fa5bbc61a7d9358 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -5,11 +5,13 @@
>  
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
> +#include <linux/slab.h>
>  
>  #include "iris_buffer.h"
>  #include "iris_instance.h"
>  #include "iris_power.h"
>  #include "iris_vpu_buffer.h"
> +#include "iris_hfi_gen2_defines.h"
>  
>  #define PIXELS_4K 4096
>  #define MAX_WIDTH 4096
> @@ -705,6 +707,20 @@ int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
>  	return iris_destroy_internal_buffers(inst, plane, false);
>  }
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
>  static int iris_release_internal_buffers(struct iris_inst *inst,
>  					 enum iris_buffer_type buffer_type)
>  {
> @@ -928,3 +944,101 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>  
>  	return 0;
>  }
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
> +	mbuf_payload_hdr->offset = ALIGN(payload_offset, (u32)256);
> +	mbuf_payload_hdr->flags = 0;
> +
> +	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +		lcu_width = (f->fmt.pix_mp.width + 31) >> 5;
> +		lcu_height = (f->fmt.pix_mp.height + 31) >> 5;
> +	} else {
> +		lcu_width = (f->fmt.pix_mp.width + 15) >> 4;
> +		lcu_height = (f->fmt.pix_mp.height + 15) >> 4;
> +	}
> +	/* Firmware expects each row to align to 8 LCU */
> +	row_size = (((lcu_width + 7) >> 3) << 3);
> +
> +	/* Firmware expects 2bytes of delta_Qp, int16_t */
> +	p_16 = buffer->kvaddr + mbuf_payload_hdr->offset;
> +	for (int j = 0; j < lcu_height; j++) {
> +		p_temp = p_16 + j * row_size;
> +		for (int i = 0; i < lcu_width; i++)
> +			*p_temp++ = (1 << 11) | (((u8)p_array[j * lcu_width + i]
> +						   & 0x3F) << 4);
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
> +
> +	return ret;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index ee2d24bb69c57220b0a735d9b4aae4434a33daf6..df9d018493f3ec37fd5e6b0ba049dba0b5ae76e9 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -28,6 +28,7 @@ struct iris_inst;
>   * @BUF_SCRATCH_2: buffer to store encoding context data for HW
>   * @BUF_VPSS: buffer to store VPSS context data for HW
>   * @BUF_PARTIAL: buffer for AV1 IBC data
> + * @BUF_ROIMB_DELTAQP: metadata buffer for ROI MB DeltaQp
>   * @BUF_TYPE_MAX: max buffer types
>   */
>  enum iris_buffer_type {
> @@ -44,6 +45,7 @@ enum iris_buffer_type {
>  	BUF_SCRATCH_2,
>  	BUF_VPSS,
>  	BUF_PARTIAL,
> +	BUF_ROIMB_DELTAQP,
>  	BUF_TYPE_MAX,
>  };
>  
> @@ -139,5 +141,7 @@ int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
>  int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
>  int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
>  void iris_vb2_queue_error(struct iris_inst *inst);
> +int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst);
> +int iris_destroy_roi_metadata_buffers(struct iris_inst *inst);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 142c9712bb0b05bea2cf656be636e7449e361512..9b42d0e81dcce8e4b1ccea0b2959b4505808226f 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -1620,3 +1620,32 @@ int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
>  
>  	return hfi_ops->session_subscribe_metadata_delivery(inst, plane);
>  }
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
> +	int ret = 0;
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
> +
> +	return iris_hfi_gen2_session_alloc_roi_metadata_buffer(inst);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 9957b69366f50310338a0c1470d9744592655c33..7587dfec052a320863889eb15203416b9c527a40 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -51,5 +51,6 @@ int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_ty
>  int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
> +int iris_set_roi_params(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index d628bc6748438b19dac01cd11cb9f8da0b8500af..4d40d6733e5877a302ce63fb0b4a61b8f284e6dc 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -1789,6 +1789,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.hfi_id = HFI_PROP_ROI_INFO,
>  		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
>  			 CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_roi_params,
>  	},
>  	{
>  		.cap_id = MB_SIZE,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index cf88dbe11e8e9faef826e661d8e9909fd7f16b94..a1b0c4982f0d789a807f22a1dffdf61decd20d28 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -134,6 +134,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
>  		switch (buffer_type) {
>  		case BUF_INPUT:
>  		case BUF_VPSS:
> +		case BUF_ROIMB_DELTAQP:
>  			return HFI_PORT_RAW;
>  		case BUF_OUTPUT:
>  		case BUF_BIN:
> @@ -1267,6 +1268,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
>  		return HFI_BUFFER_VPSS;
>  	case BUF_PARTIAL:
>  		return HFI_BUFFER_PARTIAL_DATA;
> +	case BUF_ROIMB_DELTAQP:
> +		return HFI_BUFFER_METADATA;
>  	default:
>  		return 0;
>  	}
> @@ -1328,6 +1331,7 @@ static struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
>  static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>  {
>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	struct iris_hfi_buffer hfi_meta_buffer;
>  	struct iris_hfi_buffer hfi_buffer;
>  	u32 port;
>  	int ret;
> @@ -1349,6 +1353,26 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
>  					     &hfi_buffer,
>  					     sizeof(hfi_buffer));
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
>  	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
>  					inst_hfi_gen2->packet->size);
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 84b629b957442c024dccc18b354ac9a7e541abaa..f63e0a7723e8583da818c2b004e367c1dd3d94f7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -58,6 +58,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>  		return BUF_PARTIAL;
>  	case HFI_BUFFER_VPSS:
>  		return BUF_VPSS;
> +	case HFI_BUFFER_METADATA:
> +		return BUF_ROIMB_DELTAQP;
>  	default:
>  		return 0;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index fcbc60016beec693f2ce27927a09a2d51494bc38..fae3d113a9dc990f06167ee0b7fb8fab24a0552c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -180,6 +180,7 @@ int iris_open(struct file *filp)
>  	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
>  	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
>  	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
> +	INIT_LIST_HEAD(&inst->buffers[BUF_ROIMB_DELTAQP].list);
>  	init_completion(&inst->completion);
>  	init_completion(&inst->flush_completion);
>  
> @@ -299,6 +300,7 @@ int iris_close(struct file *filp)
>  	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>  	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>  	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	iris_destroy_roi_metadata_buffers(inst);
>  	iris_remove_session(inst);
>  	mutex_unlock(&inst->lock);
>  	mutex_destroy(&inst->ctx_q_lock);
> 

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
