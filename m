Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FDA517BD8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787991; cv=none; b=FA4wxc9t1ELr2wsOMOkBIQk7QKPVnyf8hsxZtpwxcNZlQ6rFAGq77euFgDs7H5sw7lAbS8m156GfFRvcOHsMKSAT80O3xHYG0MC2cQiEKhQ+CutUtJ+xFvrEt4WJXoP1gMstBL/XJSxrFUxJZ+k4f76gJdZaU/KOtZrYl+fcPH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787991; c=relaxed/simple;
	bh=BlZ4WNg2UivZGUcFnTIGc74bxXmqJPCPfsiruuYF3vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvktKJOM72b0M/mvWR5cmxw9oNYL+oDhtz1/KM5ndhzNpF00fXMv6mm3h5+S1IuZ2OlpMHtgavLChE2pfNCFJcs9bCizV9eiPobRKaSzUNVddd6OHXX7j8mChf35PSyR1NK4NFOVPm8L5n6efg3lGNCJuRGbd7ZbRqKmtSD/hrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSGiCk98; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLSVpGoS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSGiCk98";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLSVpGoS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxs4M3519855
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HIgBV/QMQ2q/6egrqsFUxoQ68FvW4gpVPHL8HCp7SUs=; b=gSGiCk98XGd+6D2r
	kFmga8bWSX8IywYwQ9sfssU6Q6vZNA0fJs+M0DMAMcS5s66ssAJV6ToyOJOUSAAw
	5QpRo5gYqMzlN5+50CXCInr44EwXQNKvPADGtfi7AOQFOJP98XmHM7APsn2v5vlr
	sYFTQWTNY5pTA+sXvrzGrgVP+DMsWOXMRAYjNJJxfS6JeVBms+w4JYaefW9wQ3dl
	ipKrUcp+qrZzIYvQAscqLn8vT016BB9+lXn+eqruT9Xkba89rdClQeMYtMTtoIZt
	Tw6C8+GB9uX8PynrgIXPFSqPNtEJ37VzTiWJEhOY6iMCZ33YmXvbHcERd0j9KstN
	YD87Xg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27jkeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:06:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313b1501a0aso940498eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790787986; x=1791392786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HIgBV/QMQ2q/6egrqsFUxoQ68FvW4gpVPHL8HCp7SUs=;
        b=PLSVpGoSmyDmcJQtqe73QtE27zwQsso5aVKmpqjrP1eTQmt1W9yB8W6HIvXwI3eimZ
         yHRIg+bdfDlqEG9s08GqKl5mseJJ/9QzdJe1XW+XsayHr4WOMDVhhvipw7sVvQfGjx4O
         E2ZSUdCZWouT+4AIzX/xZu/MROxZs7wBtHVnII+ipyRe9mHr756zvVXNftzKTBn7d/vy
         xSUvzffTbV9n846M/uFenikeAbQK0k+0irhvqvGH5U0hvLz5Qbg/GV0zJbWxfmZ4XXFQ
         Rhy7gqw0Vh4dXqe+yb8I0HRYuEpe5E2AKL0jadBcWlvwM1aZHx6gOpguKXzcdWEEKUL/
         x8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787986; x=1791392786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIgBV/QMQ2q/6egrqsFUxoQ68FvW4gpVPHL8HCp7SUs=;
        b=kQBRM1C7H5wqBB/td93okAgvDKgTw+RSV4Pw+gn0oiMnobPcIQCeQP+AcZZ1mULxDP
         8aRJzZiIYFqC/FTpDF9BQP5fVq4lbREDCndnj9sEMwHUXhX+DLC5j/POgO1O7t1tNujY
         DNDVF4d8S3zJMjDC+PXiMCOSL9JDuvq0k6pUKc1otK3a7edpIRc/pIxT+wz+C3iSv9Tx
         jLr1AuuVfLX6MVJ+l/TjdXcG0HJCmrcAFmni/MM5Gi16PCx41QuywwWCCvvQF3856jsR
         0Z/plB6fpu4uSf+i3jIEvr0OqrQD6T8nFP7wVgfmzidCP9/0UrBBKJIliVvA+6caR6Sw
         ybLg==
X-Forwarded-Encrypted: i=1; AKwUvBygHaT9RID4cJunmfI+16S9NwB8wnRPtCUYMWBNvIr/eVtqTxuihL9OBpk8xA0c6Pigoow9VALLYV8ceuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ613SS9zXOG+L3nqNdognlqxiYlHACSBK1BTQNffZVsPMJs9X
	bRJCX1aVvhGE+uAumb2kgz+p/kpNm1pV1AMw5qHOn7JcsYRDEpns+i4ZsXxw6v+/pYh3Dhj/oTS
	q50Vlbl83m9vxhv9IWu+rxASI02QeGEG2qz3hre0L/OKZ6bgg3NRsNFeCVeawE6FnQ/I=
X-Gm-Gg: AYBFou1BxRMHJhsWsBfvTR6UinCupVR+WMQVzuL1fpyIAWj9RWFFcHpowW/uaBO2Rtg
	PdBp47h0iznsRrInMd4SvikrTcp++kxGkKTvKyerWOn2vsn9YDs9pZ4CUPDnqpgl6s+bTvGK3jb
	0QIdbER3lQutmZnkgnNUHEEpSCKCudYFvMzS40OC1/5rp3I7W4Xc212KfWRC+DaYNDHJTznW9aU
	uZUpbfSfGxVbwYbxL1bmfeWvVwiubyfpvlTsXqlOxJ+hRYUepo9xtME24H/1r3rs85p7psytI9R
	DsRkf7RhDysUjsDN2LeyjzOGQB+qjhLA4hLO3p4svzzj8pogN+zB3MGFnQUKAD3hRMfopEitVVT
	92SKzVDrKphnMXNaWUGBB6a1XC0/vn0ajlKn2vw3i7c0EZIfwQp+ackf7tV6NVA==
X-Received: by 2002:a05:7300:b54b:b0:343:fdea:9a0 with SMTP id 5a478bee46e88-34cdd9900bfmr4495741eec.2.1790787985610;
        Wed, 30 Sep 2026 10:06:25 -0700 (PDT)
X-Received: by 2002:a05:7300:b54b:b0:343:fdea:9a0 with SMTP id 5a478bee46e88-34cdd9900bfmr4495667eec.2.1790787984641;
        Wed, 30 Sep 2026 10:06:24 -0700 (PDT)
Received: from [10.110.82.170] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3750765sm331736eec.12.2026.09.30.10.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 10:06:24 -0700 (PDT)
Message-ID: <9e5f6f46-d325-46b8-8f3b-9b6188c8f7fa@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:06:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] media: iris: Add BUF_ROIMB_DELTAQP metadata buffer
 for ROI delta QP
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
 <20260924-enc_roi_enable-v7-5-6fa7413af23c@oss.qualcomm.com>
 <8e350ba2-0eb7-7f69-e36c-7c0294e9c564@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <8e350ba2-0eb7-7f69-e36c-7c0294e9c564@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX9xi8pkEA6Diz
 T7MaYmZmwsDqYHFPS6xIIFEOnMywwqKROss6+UlFTBydjQyqSp9MVYwcwm/khFUdh7XZWD2MXE6
 iBxVtKwGXanHWlsv4PN4ieCEjyiYra4=
X-Proofpoint-GUID: QeDFKmQYvG__UzjwIdA0G7nmbH7inKNj
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd4194 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ja7yzqJmmUcjEkDZDlMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfXzgxTqfhVPF4F
 UMgc4FbAqTRUcHFULtteklEFkLJjvllpS0HMcIN1LLrt4DVjvX5Nt3DDS/WZg+7roDC7a9pSahs
 yopZyykIPtbujEwwq2caAXqUqZfqsBM8RUdKUkUng3y3cdg/FuHjPsAdrqCIyc7K5J0h588Clq+
 uvz46wg3xJgDG76VtsXxaTkcKNRGceUE5CLifucQ64cnAl/eT6I1v3+WjalmBjQga94bX0myUCm
 lktjZ+mjk6Q4zPC/Py7Yt++V4rDZnecNUE+nFd8EmLyN9V3quwBBgJtQOyzMebIHzB6Bu4B9oX4
 AsP+2AJSE4btepC1Up4Z4Xs46zF3qjvP2cOkmqVqeUfcrityxKwUYtMEcZuMVWecFMYO5sN5NlX
 eyBREvTfd+gqOzlIvgFStGLpZPsNXr7/n6522X0AD/a1W0vZvCiFFTIm0ryApy5fjK7UJokd5Ab
 VjcVbQMWIrGpAjM1hmg==
X-Proofpoint-ORIG-GUID: QeDFKmQYvG__UzjwIdA0G7nmbH7inKNj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300068


On 9/30/2026 3:58 AM, Vishnu Reddy wrote:
> On 9/25/2026 5:58 AM, Deepa Guthyappa Madivalara wrote:
>> - Introduce BUF_ROIMB_DELTAQP as a new internal buffer type to carry
>>    per-macroblock ROI delta QP data to the firmware. This buffer is
>>    allocated on demand when the application sets ROI parameters via
>>    V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP, and is queued alongside each
>>    raw input buffer as an HFI_BUFFER_METADATA packet on HFI_PORT_RAW.
>>
>> - The metadata buffer layout follows the firmware-defined metabuf_header
>>    and metapayload_header structures. The s8 per-MB delta QP values
>>    supplied by userspace are widened to s16 as required by the firmware.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 114 +++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_buffer.h     |   4 +
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      |  37 +++++++
>>   drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
>>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   1 +
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  24 +++++
>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |   2 +
>>   drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
>>   8 files changed, 185 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index eb8de60c1177f5e1ab83b90a3c8c80e0b4d1f02e..a7f1d74360d6a490959b27936fa5bbc61a7d9358 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -5,11 +5,13 @@
>>   
>>   #include <media/v4l2-event.h>
>>   #include <media/v4l2-mem2mem.h>
>> +#include <linux/slab.h>
>>   
>>   #include "iris_buffer.h"
>>   #include "iris_instance.h"
>>   #include "iris_power.h"
>>   #include "iris_vpu_buffer.h"
>> +#include "iris_hfi_gen2_defines.h"
>>   
>>   #define PIXELS_4K 4096
>>   #define MAX_WIDTH 4096
>> @@ -705,6 +707,20 @@ int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
>>   	return iris_destroy_internal_buffers(inst, plane, false);
>>   }
>>   
>> +int iris_destroy_roi_metadata_buffers(struct iris_inst *inst)
>> +{
>> +	struct iris_buffer *buf, *next;
>> +	struct iris_buffers *buffers;
>> +
>> +	if (inst->domain == ENCODER) {
>> +		buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
>> +		list_for_each_entry_safe(buf, next, &buffers->list, list)
>> +			iris_destroy_internal_buffer(inst, buf);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int iris_release_internal_buffers(struct iris_inst *inst,
>>   					 enum iris_buffer_type buffer_type)
>>   {
>> @@ -928,3 +944,101 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>>   
>>   	return 0;
>>   }
>> +
>> +static int iris_fill_roi_data(struct iris_inst *inst, struct iris_buffer *buffer)
>> +{
>> +	s8 *p_array = (s8 *)inst->fw_caps[ROI_PARAMS].p_array;
>> +	u32 payload_offset, lcu_width, lcu_height, row_size;
>> +	u32 array_size = inst->fw_caps[ROI_PARAMS].elems;
>> +	struct metabuf_header *mbuf_hdr = buffer->kvaddr;
>> +	struct metapayload_header *mbuf_payload_hdr;
>> +	struct v4l2_format *f = inst->fmt_src;
>> +	s16 *p_16, *p_temp;
>> +
>> +	memset(mbuf_hdr, 0, sizeof(struct metabuf_header));
>> +	mbuf_hdr->count = 1;
>> +	mbuf_hdr->size = sizeof(struct metabuf_header) +
>> +			 sizeof(struct metapayload_header);
>> +	mbuf_hdr->version = BIT(16);
>> +	mbuf_hdr++;
>> +	mbuf_payload_hdr = (struct metapayload_header *)(mbuf_hdr);
>> +	payload_offset = sizeof(struct metabuf_header) +
>> +			 sizeof(struct metapayload_header);
>> +
>> +	memset(mbuf_payload_hdr, 0, sizeof(struct metapayload_header));
>> +	mbuf_payload_hdr->type = HFI_PROP_ROI_INFO;
>> +	mbuf_payload_hdr->size = array_size * sizeof(s16);
>> +	mbuf_payload_hdr->version = 1 << 16;
>> +	mbuf_payload_hdr->offset = ALIGN(payload_offset, (u32)256);
>> +	mbuf_payload_hdr->flags = 0;
>> +
>> +	if (inst->codec == V4L2_PIX_FMT_HEVC) {
>> +		lcu_width = (f->fmt.pix_mp.width + 31) >> 5;
>> +		lcu_height = (f->fmt.pix_mp.height + 31) >> 5;
>> +	} else {
>> +		lcu_width = (f->fmt.pix_mp.width + 15) >> 4;
>> +		lcu_height = (f->fmt.pix_mp.height + 15) >> 4;
>> +	}
>> +	/* Firmware expects each row to align to 8 LCU */
>> +	row_size = (((lcu_width + 7) >> 3) << 3);
>> +
>> +	/* Firmware expects 2bytes of delta_Qp, int16_t */
>> +	p_16 = buffer->kvaddr + mbuf_payload_hdr->offset;
>> +	for (int j = 0; j < lcu_height; j++) {
>> +		p_temp = p_16 + j * row_size;
>> +		for (int i = 0; i < lcu_width; i++)
>> +			*p_temp++ = (1 << 11) | (((u8)p_array[j * lcu_width + i]
>> +						   & 0x3F) << 4);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst)
>> +{
>> +	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
>> +	struct iris_core *core = inst->core;
>> +	struct iris_buffer *buffer, *first_buffer, *next;
>> +	bool found = false;
>> +	int ret = 0;
>> +
>> +	if (!buffers->size)
>> +		return 0;
>> +
>> +	list_for_each_entry_safe(buffer, next, &buffers->list, list) {
>> +		if (buffer->attr & BUF_ATTR_DEQUEUED) {
>> +			buffer->attr &= ~BUF_ATTR_DEQUEUED;
>> +			list_move(&buffer->list, &buffers->list);
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +	if (!found) {
>> +		buffer = kzalloc_obj(*buffer);
>> +		if (!buffer)
>> +			return -ENOMEM;
>> +
>> +		INIT_LIST_HEAD(&buffer->list);
>> +		buffer->type = BUF_ROIMB_DELTAQP;
>> +		buffer->index++;
>> +		buffer->buffer_size = buffers->size;
>> +		buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE;
>> +
>> +		buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
>> +						 &buffer->device_addr, GFP_KERNEL,
>> +						 buffer->dma_attrs);
>> +
>> +		if (!buffer->kvaddr) {
>> +			kfree(buffer);
>> +			return -ENOMEM;
>> +		}
>> +		list_add(&buffer->list, &buffers->list);
>> +	}
>> +
>> +	first_buffer = list_first_entry(&buffers->list, struct iris_buffer, list);
>> +	ret = iris_fill_roi_data(inst, first_buffer);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
>> index ee2d24bb69c57220b0a735d9b4aae4434a33daf6..df9d018493f3ec37fd5e6b0ba049dba0b5ae76e9 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
>> @@ -28,6 +28,7 @@ struct iris_inst;
>>    * @BUF_SCRATCH_2: buffer to store encoding context data for HW
>>    * @BUF_VPSS: buffer to store VPSS context data for HW
>>    * @BUF_PARTIAL: buffer for AV1 IBC data
>> + * @BUF_ROIMB_DELTAQP: metadata buffer for ROI MB DeltaQp
>>    * @BUF_TYPE_MAX: max buffer types
>>    */
>>   enum iris_buffer_type {
>> @@ -44,6 +45,7 @@ enum iris_buffer_type {
>>   	BUF_SCRATCH_2,
>>   	BUF_VPSS,
>>   	BUF_PARTIAL,
>> +	BUF_ROIMB_DELTAQP,
>>   	BUF_TYPE_MAX,
>>   };
>>   
>> @@ -139,5 +141,7 @@ int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
>>   int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
>>   int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
>>   void iris_vb2_queue_error(struct iris_inst *inst);
>> +int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst);
>> +int iris_destroy_roi_metadata_buffers(struct iris_inst *inst);
>>   
>>   #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> index 1ce8eccdedbdeb840833bd92edb3f59dd6962d7f..2ab20cacbc2b79ac4cf28eda88b15cae332c4160 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -1624,3 +1624,40 @@ int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
>>   
>>   	return ret;
>>   }
>> +
>> +int iris_set_roi_params(struct iris_inst *inst, u32 plane)
>> +{
>> +	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
>> +	u32 height = inst->fmt_src->fmt.pix_mp.height;
>> +	u32 width = inst->fmt_src->fmt.pix_mp.width;
>> +	u32 metadata_header_bytes = 256;
>> +	u32 lcu_height = 0;
>> +	u32 lcu_width = 0;
>> +	u32 lcu_size = 16;
>> +	u32 n_shift = 0;
>> +	u32 size = 0;
>> +	int ret = 0;
>> +
>> +	if (!inst->fw_caps[ROI_PARAMS].p_array)
>> +		return -EINVAL;
>> +
>> +	if (inst->codec == V4L2_PIX_FMT_HEVC)
>> +		lcu_size = 32;
>> +
>> +	while (lcu_size && !(lcu_size & 0x1)) {
>> +		n_shift++;
>> +		lcu_size = lcu_size >> 1;
> Since lcu_size can only be 16 or 32 here, is the loop needed?
> n_shift could be derived using ilog2(lcu_size), and the lcu_size reassignment
> below could also be avoided.
Agreed, will update in v8.
>> +	}
>> +
>> +	lcu_size = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
>> +	lcu_width = (width + (lcu_size - 1)) >> n_shift;
>> +	lcu_height = (height + (lcu_size - 1)) >> n_shift;
>> +	size = (((lcu_width + 7) >> 3) << 3) * lcu_height * 2;
>> +	size += metadata_header_bytes;
>> +	buffers->size = ALIGN(size, 4096);
>> +	ret = iris_hfi_gen2_session_alloc_roi_metadata_buffer(inst);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
> return iris_hfi_gen2_session_alloc_roi_metadata_buffer(inst);
Agreed, will update in v8.
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
>> index 9957b69366f50310338a0c1470d9744592655c33..7587dfec052a320863889eb15203416b9c527a40 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
>> @@ -51,5 +51,6 @@ int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_ty
>>   int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>>   int iris_set_properties(struct iris_inst *inst, u32 plane);
>>   int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
>> +int iris_set_roi_params(struct iris_inst *inst, u32 plane);
>>   
>>   #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> index d628bc6748438b19dac01cd11cb9f8da0b8500af..4d40d6733e5877a302ce63fb0b4a61b8f284e6dc 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
>> @@ -1789,6 +1789,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>>   		.hfi_id = HFI_PROP_ROI_INFO,
>>   		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
>>   			 CAP_FLAG_DYNAMIC_ALLOWED,
>> +		.set = iris_set_roi_params,
>>   	},
>>   	{
>>   		.cap_id = MB_SIZE,
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index cf88dbe11e8e9faef826e661d8e9909fd7f16b94..a1b0c4982f0d789a807f22a1dffdf61decd20d28 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -134,6 +134,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
>>   		switch (buffer_type) {
>>   		case BUF_INPUT:
>>   		case BUF_VPSS:
>> +		case BUF_ROIMB_DELTAQP:
>>   			return HFI_PORT_RAW;
>>   		case BUF_OUTPUT:
>>   		case BUF_BIN:
>> @@ -1267,6 +1268,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
>>   		return HFI_BUFFER_VPSS;
>>   	case BUF_PARTIAL:
>>   		return HFI_BUFFER_PARTIAL_DATA;
>> +	case BUF_ROIMB_DELTAQP:
>> +		return HFI_BUFFER_METADATA;
>>   	default:
>>   		return 0;
>>   	}
>> @@ -1328,6 +1331,7 @@ static struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
>>   static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>>   {
>>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +	struct iris_hfi_buffer hfi_meta_buffer;
>>   	struct iris_hfi_buffer hfi_buffer;
>>   	u32 port;
>>   	int ret;
>> @@ -1349,6 +1353,26 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
>>   					     &hfi_buffer,
>>   					     sizeof(hfi_buffer));
>>   
>> +	/* check if any metadata buffer is available not queued, queue it */
>> +	if (port == HFI_PORT_RAW) {
>> +		buffer = iris_queue_metadata_buffers(inst, BUF_ROIMB_DELTAQP, buffer->index);
>> +		if (buffer) {
>> +			iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_meta_buffer);
>> +			port = iris_hfi_gen2_get_port_from_buf_type(inst, buffer->type);
>> +			iris_hfi_gen2_create_packet(inst_hfi_gen2->packet,
>> +						    HFI_CMD_BUFFER,
>> +						    HFI_HOST_FLAGS_INTR_REQUIRED,
>> +						    HFI_PAYLOAD_STRUCTURE,
>> +						    port,
>> +						    inst->core->packet_id++,
>> +						    &hfi_meta_buffer,
>> +						    sizeof(hfi_meta_buffer));
>> +
>> +			buffer->attr |= BUF_ATTR_QUEUED;
>> +			buffer->attr &= ~BUF_ATTR_DEQUEUED;
> If iris_queue_buffer() is the only caller, is this needed?
> The caller already updates QUEUED attribute on successful return.
>
>> +		}
>> +	}
>> +
>>   	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
>>   					inst_hfi_gen2->packet->size);
>>   }
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index 84b629b957442c024dccc18b354ac9a7e541abaa..f63e0a7723e8583da818c2b004e367c1dd3d94f7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -58,6 +58,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>>   		return BUF_PARTIAL;
>>   	case HFI_BUFFER_VPSS:
>>   		return BUF_VPSS;
>> +	case HFI_BUFFER_METADATA:
>> +		return BUF_ROIMB_DELTAQP;
>>   	default:
>>   		return 0;
>>   	}
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index fcbc60016beec693f2ce27927a09a2d51494bc38..fae3d113a9dc990f06167ee0b7fb8fab24a0552c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -180,6 +180,7 @@ int iris_open(struct file *filp)
>>   	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
>>   	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
>>   	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
>> +	INIT_LIST_HEAD(&inst->buffers[BUF_ROIMB_DELTAQP].list);
>>   	init_completion(&inst->completion);
>>   	init_completion(&inst->flush_completion);
>>   
>> @@ -299,6 +300,7 @@ int iris_close(struct file *filp)
>>   	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>   	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>   	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +	iris_destroy_roi_metadata_buffers(inst);
>>   	iris_remove_session(inst);
>>   	mutex_unlock(&inst->lock);
>>   	mutex_destroy(&inst->ctx_q_lock);
>>
