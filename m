Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E6F4BD7B7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765925; cv=none; b=iKcUQmYPS0ngba8whRHiCH19yqIa8VIPoPcHQsx7q0nXj389DmK8hH8y90qf/zlTsfjN0vZhL8XEZuEqeZIbWS267xM5u9G/Bg+xxIUANxFmzZC2yTXfLjoNwbbB4LgI7G/4ihaJhNW7kpqeuUltWdDUS7Z9MNqFtc4b+M/4zGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765925; c=relaxed/simple;
	bh=a2bTMlD1KyMr573s5ZGwPihSdRH7QZxo/Ncn3N3h6K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GqVjD4rYFWedbnFnyGnwznOtITrSbYhP0v2Hb5x5hclqzexaoRq/DnXAAlmQW5znGyzdWUyu+f7vqrzaDkpL8wdYKIqxEVGSJ87hzp8Jp1cftIMImfHXN0diNeo91sX8MtmEuUpEyyRiuDgtrYyIe/EoYhM+6yGVXC0suqm0pVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5bC9fsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLjaSiST; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5bC9fsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLjaSiST"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dQkJ1556128
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sp8WVuRBnCSfLsojxRBKq4GodWKFZ1Vq6gQ9R4uU43g=; b=P5bC9fsLXeYq4YCO
	r2Td3aDKF0M/GcGLtGugGqtcZGaUuFyryMiCBAytlewgUEddD9z4hs3WYr4uDr5F
	sHpZMboETziXe8fVYaex4v3113nZQGSiaw8F4A1k5k7eCHOFt31BsO4GPJgdUNrU
	4x/zRfYR/9FyYWPWjl+ww0nLihf8nqGi4xRM33oRgpsMbWtiegXESZkKF4L/W+m+
	COAKNoB43UyYsD1oTWCXmgJ3TOdibB4C38ZkN8zq+hv2Hp15SBOTLIm0fxeMdv4y
	nlFyZRU2SUKxlN7Cp5YFWTZvFA4HABjwe/y4vMDRh3cWnJB0RtIryNLkAECc0BOS
	/0bIAg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c0wgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:58:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so6092064eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790765911; x=1791370711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sp8WVuRBnCSfLsojxRBKq4GodWKFZ1Vq6gQ9R4uU43g=;
        b=HLjaSiSTl/CPrVRbvt1uj9pyGT5kNOW8BIuyvZL4nT/W9V7lVEixrUfRrfpcYOzKQY
         Yy4m8WETNqPRHpF1Ydf1igaMT5z3BcKKBWSHIqucpt48HTE5rbOWpurBq+eoaykgBzvr
         u2wl7FsXnT/EDcqoNxyRNtMn+KbDM5mkmXdI6pMf5T086p9bhTdYqjszK2zLY+NzpWxA
         YzaipMPMSGyUffpsLgY7T7u0b+1LukLoqpeDHSm0ZKJN9uTdb+G6JtAx1s83EO16kC4Y
         VZFrPyS3ylvFVDATX+g7RkbFvD5sZAbUOQRqDarM5FHpY9pvHAftZHgehpqM5a9k+Gpi
         p5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765911; x=1791370711;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sp8WVuRBnCSfLsojxRBKq4GodWKFZ1Vq6gQ9R4uU43g=;
        b=l0AheAEEVSUHWwR5hlo1aHo4YyhgaXBn6TJrAQTVKoG6+kDtpUSzHsUlIRI0PhJ2u6
         o6YSTB0qGhLjMWOHuW8MglAiQVjihHilteS4ABGvZQNuW1B2NS9jO2Lt2oGBQQF2lCkB
         zRESDwNhaz1JmYpdwwF5ZQv2gpOPs2MdCs+UmD8zdTtFr2vWJc4MAx6tw4FF+3s1o9Vn
         G0KZiIQ6c3LLzWBRTtYXJkUKz+CyxRjXXRTh+9GyAtJIr6qnCQVY/t+kc3aQXYFNQny+
         EzpUsymU8MUH0QANOSc2PFyu7ysQdQDxW8teX/Qi+J1HzKJBbGLqS/vXA7oEYusPA9lm
         oFVQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1OxOjVAzk0yPqeYSrQE5E05ELNipBuNrR5wgYPorZM+CD6NhFt077D4ao/fYvltZsUooQPY/UN/zovmI=@vger.kernel.org
X-Gm-Message-State: AFuF++lSCh9LJ3WeRFPRtTWUylahbV0acUa6woVAtc43Om3I6oZbNE94
	Y8JyxlXiBpuJe6lRz9tIyIH/zSYHR/OWnFq5i4NweMimMJumbBZ8K0CWICmKi3p5VPkQdiCxcqU
	ptY87IwmIjCLbwlF14rtXg6VV3nYkNO4ZQvVFKSlKEpYzPuqTLorj7wg+JauJYMIr4/o=
X-Gm-Gg: AYBFou3AjybBMxrhOsdsjLQPpRR6aexWGHH9ymkLwu/s8UhXbJXtVT6Q8hOUhnOqfLv
	BgmIItTspN0QTD9c6vVHyNZXnHByBa7KMlAqBYGISZoOqQS73CE8WKKGHvaTYRjt+1qHU4BvMSa
	Zn47mFB3tSAi2VUKKS6B0rOO4x9UiiQ0/Ln+2jEecv7Y/CChrEyaupRT4ZmE8B6JXWzU1CIxQq1
	DXAn7DBUwFaZnTF2W+bwi4oCAZQVw+Flq4+l6IDxg0u+18iWAdT0iULJT8z9DqxZL7DqK0d8EU/
	yUvp1wCZ1NtXKhQN4B7zhqgt1jXtl5xnVkoqFGqrzkmz6gZNLYzazymB8fXIsT8oY03NVWXjWJy
	/uR7qIywyqulktPdCkbT4GBxv+r8yu9k=
X-Received: by 2002:a05:7301:46a2:b0:34a:fc46:35ba with SMTP id 5a478bee46e88-34cdbfd83c1mr1265099eec.8.1790765911179;
        Wed, 30 Sep 2026 03:58:31 -0700 (PDT)
X-Received: by 2002:a05:7301:46a2:b0:34a:fc46:35ba with SMTP id 5a478bee46e88-34cdbfd83c1mr1265079eec.8.1790765910531;
        Wed, 30 Sep 2026 03:58:30 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf4a605c2sm3144105eec.7.2026.09.30.03.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:58:30 -0700 (PDT)
Message-ID: <8e350ba2-0eb7-7f69-e36c-7c0294e9c564@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:28:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 5/5] media: iris: Add BUF_ROIMB_DELTAQP metadata buffer
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
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
 <20260924-enc_roi_enable-v7-5-6fa7413af23c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260924-enc_roi_enable-v7-5-6fa7413af23c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX8W4YTb9t9GeF
 BPrOOQuV4muRGRJCHwzTmJAKEyIV1/785mkli/oI/1Z+PoVMe7wYGEepLVX0YusK2aehFh25hcq
 C2hCQeO2PZ72bkSv5r42c0eeW2y+pqs=
X-Proofpoint-ORIG-GUID: 2przpEEzGVgibCVU05-pa7wi6_6rrUPs
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abceb58 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pdtBNdPs7a4fvCnHWgkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 2przpEEzGVgibCVU05-pa7wi6_6rrUPs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX/ZoOXxATh0Jm
 l2zQaYruf/xzyn5GksZNOXF8Mg8G/FCnIjgmMynxmXoHVKXBXO9RYlVXAXKJWtRzGp40FhKif23
 R1SeEOIoqcKug8Xsdp6fvzwbj+4kifDsvMg/otGScDTzvSYslqu5TsuLwnm3pPAVvEJjQcBxDUn
 4z1MNij+KGR/Do2vraeLQZSy8m6pfyQwgtynVJPNijw1+93cOlltNcTn6QXrdcAsCgOch2wLshV
 p2u4IH+FgB1walz871pvd3IDl8CN2shTJ0FeQ7s2U5Uei+veXn7f5A/jfT8b6WgP8EZ4n4S/tZN
 w2pQVvtsKpS5SBh5j4Hdv43fgsthKUS0v4uGSo34yXWDCi99yRCyewtgwNmbgkd5o+QzFhBwCtE
 FX3Qa7tcNTJCAi7eyjcZAzic0gGFipBquLHQ2MO8rg4TDijk9b0VKeDq3n0ff7IHxxvllPoGKkJ
 EH4UsbXBZ3jIqiymUfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300043


On 9/25/2026 5:58 AM, Deepa Guthyappa Madivalara wrote:
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
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |  37 +++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   1 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  24 +++++
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |   2 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
>  8 files changed, 185 insertions(+)
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
> index 1ce8eccdedbdeb840833bd92edb3f59dd6962d7f..2ab20cacbc2b79ac4cf28eda88b15cae332c4160 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -1624,3 +1624,40 @@ int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
>  
>  	return ret;
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
> +	while (lcu_size && !(lcu_size & 0x1)) {
> +		n_shift++;
> +		lcu_size = lcu_size >> 1;

Since lcu_size can only be 16 or 32 here, is the loop needed?
n_shift could be derived using ilog2(lcu_size), and the lcu_size reassignment
below could also be avoided.

> +	}
> +
> +	lcu_size = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> +	lcu_width = (width + (lcu_size - 1)) >> n_shift;
> +	lcu_height = (height + (lcu_size - 1)) >> n_shift;
> +	size = (((lcu_width + 7) >> 3) << 3) * lcu_height * 2;
> +	size += metadata_header_bytes;
> +	buffers->size = ALIGN(size, 4096);
> +	ret = iris_hfi_gen2_session_alloc_roi_metadata_buffer(inst);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

return iris_hfi_gen2_session_alloc_roi_metadata_buffer(inst);

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

If iris_queue_buffer() is the only caller, is this needed?
The caller already updates QUEUED attribute on successful return.

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
