Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D825352018
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 04:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788236046; cv=none; b=cVeBSbmakEkqi289vLrxVGvM2QBwmsnt9HTQE+yuOCQiePN6xc6rGEfkbYabq8RgyPZNbJmVa6JqLCwhLRh3+z+ocjO19AGA96Nk6Giu6uapl4xTV61ifSebfH3LdPl4g/7Uygs/yh8ntC6iOooKVIlx3x03auqnfHur19dIdOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788236046; c=relaxed/simple;
	bh=c/eD2mNzX+Cg+SX0eFgedbYz7HqblIe8cEkxvSpI7Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5giZIpC4x86qSVlG4yWQ36SweEZcSxrA21/457gltLMYWSl8DuLp96tcoV4CshVRy7b6IdAZ4waeArou6LY1HEo9mk/os3Isn7by32mh/+McgVP9jcqPJ2R1freXHosNIXnoMVZR8QJCnJ0KO3uTAi4kykfjmKC5q1p689IyyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1cSLcCg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VzPo4W1i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1cSLcCg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VzPo4W1i"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810o6MX500209
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 04:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZyJTepe6w7P2D+jnMwbH6UDSUiOwfozv/QCZQIfcSAo=; b=Y1cSLcCgUsdpey3B
	12bymgc7t2w5SwCWP8x8Y1BzwiVbQTLYE5LrQFiY4gzp6FzVr8w1SD0IqMUuvK6b
	4rNggtC0AQfzitQH73qqO3jPGKtLO2kdGxklUmiXEYrixvTvI8HXFmOsvSOUL8nK
	vPEp/NC9t0R0ij7ReHcMgIoq67E7zgal5H8oQmvRlVsX7YWOcUdEC2kWIt3KWNF8
	ZAKdXRkxhtRRguc878tCddwa1jCDBT7HP8tNnAFOhadalzwy0In7+PE7g4DCGNbe
	F1VUlzBG4pjRD8xw3glXj8qA/Pl6R5p4alM6BSUEtRCmvt1BZR+FGMcJhpEY5oSc
	X6//lg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx13vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:14:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so5289305ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788236042; x=1788840842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZyJTepe6w7P2D+jnMwbH6UDSUiOwfozv/QCZQIfcSAo=;
        b=VzPo4W1i+Zn+iRM9c1AKNtPnRihPR2jpYNFXd1JK7CL3eRjbsFS0Rc/gDOU3ywcarc
         kbqBAahC+jS3rKjnjmmOhmXfY/lASy8/K+oZA9SMBj6+Je3jPvQV17OSn/DZBdMdhCDX
         GEOXipijG3IJB/BrR3u+om7VkbPdvbqHw4/rv2CRgH+0b8ez+1Zdldy0zjUbQ2quhqSI
         L6Uk/+rH1W6cUWPZYyPnLtQMaOGiW2MIvVmgA8U6T4Uu4os9GwXT4eU0UXK2e5snPh1H
         IVq6gTonlMTmCLne1YjOI/a0zaq9br4qSNQtM9kIWkVwZtgC+YbrqImZQDpr9gUBsDNk
         5n8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788236042; x=1788840842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZyJTepe6w7P2D+jnMwbH6UDSUiOwfozv/QCZQIfcSAo=;
        b=qaL+ovEadN1FCY17k2Ww9eCN5D1GPqN0XPlDkgOdTJQxkiMeso/8g1bFAhzemue7FX
         wPq1mArsAnh/lMKQBUKllTHqbiUDlw9UJV4kmyWg9Ud38uc05XZnqfE3sxxVrroPr4iN
         TFjcWKeoIX1MetN0B8EsfX7ZR/3cyt5467SjefDjj4XAERKgjIR+HTrpEomilubltOb1
         OJQbl9P3L0JooaTtfB9Hf6+LaBp2ixvytrKEaBEli2sUlTB50Y7Chho8fNBCvzr3LBJE
         twjpV+LsYo2avNwlPtZEvOH4g/BY3q/IC5AnyLiNFGFvG7dvkjN9MFeCjp5VF38Q2e22
         qg9g==
X-Gm-Message-State: AFuF++lnh+fR5vrOWbGjKErkEBe9SSwjHZ2ghVlWehdS6KiaIluT/Lgw
	4WInVZAuMNnS+b14w8ZkXVahaj88fv/E9cacM3hylC0cc1sdXUAFyWaa2J9xT94iUkdhZrOaJWp
	4HLhJJ7WArDoAXsfqSVQDce6pelrMPNrXe+DoYY14ENqQ6cQD4/NW1Ja4Cg0HkhlLr8I=
X-Gm-Gg: AYBFou2EJ31EWZwirtvsXekdShC5U7TtZN8NK1Zn7lfAhhJGWQ0tvJoyFxB6pnpAoaP
	NHQnuhWFTbUImB848lg0Ej5dSPyurkkbWOYdQKuZIaL9aV6qgNUWloz3ZSVa2yznHby2xA9jGGG
	HdFK0arM2YebYGKUybQzvKVVL/DjHHIyJ3vfz9xzo8ixvgF9yFIFPU757yZVStwdeCha9HKhBjN
	MXxOHcF76mfGWr+ZRX+6VcuZaugzHw0979bR1W7AzUxoIz2BnIu8d8eVtqt3no3ifgmQ71RIyRT
	HNQZBf4N5cBzpaWxAPNTUqZQL5s4S9SjplX4RgKqJ4SAA1duYhNrU+GGXooulWh8ymU6AmEL6tG
	hHyHS/cDs64JgFaXqT4CrPowqeziMBEeA
X-Received: by 2002:a17:903:2f8b:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2d74ddd684cmr434371065ad.6.1788236041839;
        Mon, 31 Aug 2026 21:14:01 -0700 (PDT)
X-Received: by 2002:a17:903:2f8b:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2d74ddd684cmr434370345ad.6.1788236041280;
        Mon, 31 Aug 2026 21:14:01 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm32847636eec.23.2026.08.31.21.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 21:13:59 -0700 (PDT)
Message-ID: <80a8ce4c-cebe-154e-71f3-d12fa88c9de6@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 09:43:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: qcom: iris: add firmware debug logging support
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260815-media-qcom-iris-fw-log-v1-1-c8a70eb08849@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260815-media-qcom-iris-fw-log-v1-1-c8a70eb08849@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96510a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eH0DUERm-k0s9sAx34sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAzNCBTYWx0ZWRfX/5QllKmIaNlC
 tztWGXrmFgZgj2eBkjRli/2iXgvVRLgK1uvCdnWy3MY/MeipBxVxKIEDQZNbk6P6Q9OAJ/iHjuv
 CjjUVR6S93fQO37wf0wd7y2RA2vQ5Vo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAzNCBTYWx0ZWRfXyOYVudfq9rkn
 LsXtVnCiefYpAeEgEn8Tds0JLRGhvTT2sjBx2F1z48hMTMElTcyU88KqDe6MTLHvtWYuyCyYPHb
 cZ1BQaew5fUzld2m3J6HmjGPTuSB3h0/YvdHWikN6Gi/owx4yyTkDmbL8w+N/vXv4a75Ph21/81
 GZPiPogO04vlPnFbZpQFlLjkmmgJb0k40bdmqpjwfqBIeE9qWqwa+kp+ONXMX0wdQQZbmSjfjdE
 pdb14QJurn3o5jyenqn6d86yaR4Q0F6siwfdjNfIjl69iXOtC4F6dujUQvxTC66CZ/3BqeNQxYJ
 SJQWhQE73JtjgBCjK6/EVlQu0NQgcP5JPFflA0t4n4zp3Ob2ueid8SEgJpz6h8HuUVauksKDdGY
 zng2myoGHvcyKZ4aD2+kGfm43deagITjocbKd1KzftfPLvQGM2+ULrEifp79JgCTZoYrxiOZp6o
 eaH+Z9c1z+tc+ADEV3A==
X-Proofpoint-GUID: KGxe852DGuclgchdBOtlvb6anNToiLN7
X-Proofpoint-ORIG-GUID: KGxe852DGuclgchdBOtlvb6anNToiLN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010034


On 8/15/2026 9:55 PM, Renjiang Han wrote:
> Iris does not provide runtime control for firmware debug
> logging, which makes firmware-side failures harder to diagnose
> without rebuilding or reloading the driver.
>
> Add a debugfs fw_level file under the Iris debugfs directory so
> the firmware debug log mask can be configured at runtime. Keep
> the default mask limited to firmware error and fatal messages to
> avoid enabling verbose firmware logging by default.
>
> Store the mask per Iris core, and normalize values written
> through debugfs so userspace reads back the same mask that is
> sent to firmware. Use READ_ONCE() and WRITE_ONCE() for lockless
> debugfs access and HFI packet construction.
>
> Program the firmware debug configuration during core
> initialization and before opening a new session. This lets a
> fw_level value written before session start take effect for that
> session without requiring a driver reload.
>
> Add HFI Gen1 and Gen2 support for sending the firmware debug
> configuration to firmware, and flush firmware debug messages
> from the debug queue. Firmware error and fatal messages are
> emitted through dev_err_ratelimited(), while other firmware debug
> messages use dev_dbg().
>
> Treat failures to configure firmware debug logging as non-fatal,
> since they should not prevent video sessions from running.
>
> Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> ---
> The driver currently has no way to configure firmware debug
> logging at runtime. This makes firmware-side issues harder to
> debug, because changing the firmware debug mask requires a
> rebuild or reload.
>
> The patch adds a debugfs fw_level file under the Iris debugfs
> directory. The value is stored per Iris core and is normalized
> on write, so userspace reads back the same mask that is
> programmed to firmware.
>
> The firmware debug configuration is sent during core
> initialization and before opening a new session. This allows a
> fw_level value written before a session starts to take effect for
> that session.
>
> HFI Gen1 and Gen2 paths are added for programming the debug
> configuration and reading firmware debug messages from the debug
> queue. Firmware error and fatal messages are printed with
> dev_err_ratelimited(), while other firmware messages use
> dev_dbg().
>
> The default mask enables only firmware error and fatal messages
> to avoid enabling verbose firmware logging by default.
>
> Failure to configure firmware debug logging is treated as non-fatal
> and does not block normal video operation.
> ---
>  drivers/media/platform/qcom/iris/Makefile          |  1 +
>  drivers/media/platform/qcom/iris/iris_core.h       |  7 +++-
>  drivers/media/platform/qcom/iris/iris_debugfs.c    | 42 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_debugfs.h    | 14 ++++++++
>  drivers/media/platform/qcom/iris/iris_hfi_common.c | 35 ++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_hfi_common.h | 10 ++++++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 30 ++++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  7 ++++
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    | 31 ++++++++++++----
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 21 +++++++++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  3 ++
>  .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 29 +++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    | 10 ++++--
>  drivers/media/platform/qcom/iris/iris_probe.c      |  6 ++++
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  6 +++-
>  16 files changed, 242 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 48e415cbc4390bc596f6239fefa2a2ad2cd3a2bb..105a66e1b0af44f010730a899be26cae23d76c73 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -2,6 +2,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_common.o \
>               iris_core.o \
>               iris_ctrls.o \
> +             iris_debugfs.o \
>               iris_firmware.o \
>               iris_hfi_common.o \
>               iris_hfi_gen1.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 24da60448cf24820af7947b85eb7208555ab7786..a8e34c456ce3f3f178ca66a278d06d1ab50dafc4 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -31,6 +31,7 @@ enum domain_type {
>  };
>  
>  struct qcom_ubwc_cfg_data;
> +struct dentry;
>  
>  /**
>   * struct iris_core - holds core parameters valid for all instances
> @@ -65,7 +66,9 @@ struct qcom_ubwc_cfg_data;
>   * @command_queue: shared interface queue to send commands to firmware
>   * @message_queue: shared interface queue to receive responses from firmware
>   * @debug_queue: shared interface queue to receive debug info from firmware
> - * @lock: a lock for this strucure
> + * @root: debugfs root directory
> + * @fw_debug: firmware debug log mask
> + * @lock: a lock for this structure
>   * @response_packet: a pointer to response packet from fw to driver
>   * @header_id: id of packet header
>   * @packet_id: id of packet
> @@ -110,6 +113,8 @@ struct iris_core {
>  	struct iris_iface_q_info		command_queue;
>  	struct iris_iface_q_info		message_queue;
>  	struct iris_iface_q_info		debug_queue;
> +	struct dentry				*root;
> +	u32					fw_debug;
>  	struct mutex				lock; /* lock for core related operations */
>  	u8					*response_packet;
>  	u32					header_id;
> diff --git a/drivers/media/platform/qcom/iris/iris_debugfs.c b/drivers/media/platform/qcom/iris/iris_debugfs.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..6122b994ad0aa70c0c4f26ea4ce076f1b025f810
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_debugfs.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/debugfs.h>
> +
> +#include "iris_core.h"
> +#include "iris_debugfs.h"
> +
> +static int iris_fw_level_get(void *data, u64 *val)
> +{
> +	struct iris_core *core = data;
> +
> +	*val = READ_ONCE(core->fw_debug);
> +
> +	return 0;
> +}
> +
> +static int iris_fw_level_set(void *data, u64 val)
> +{
> +	struct iris_core *core = data;
> +
> +	WRITE_ONCE(core->fw_debug, (u32)val & IRIS_FW_DEBUG_LOGMASK);
> +
> +	return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(iris_fw_level_fops, iris_fw_level_get,
> +			 iris_fw_level_set, "0x%08llx\n");
> +
> +void iris_debugfs_init(struct iris_core *core)
> +{
> +	core->root = debugfs_create_dir("iris", NULL);
> +	debugfs_create_file("fw_level", 0600, core->root, core,
> +			    &iris_fw_level_fops);
> +}
> +
> +void iris_debugfs_deinit(struct iris_core *core)
> +{
> +	debugfs_remove(core->root);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_debugfs.h b/drivers/media/platform/qcom/iris/iris_debugfs.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..aa3cb97eb2b2e71dfe6a0db6ccfd430256cdb6fa
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_debugfs.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_DEBUGFS_H__
> +#define __IRIS_DEBUGFS_H__
> +
> +struct iris_core;
> +
> +void iris_debugfs_init(struct iris_core *core);
> +void iris_debugfs_deinit(struct iris_core *core);
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> index 8769ec61f11769e004945063381d9baddb302b06..d54394770740016852d5f46905fe3b476ce094ad 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -87,9 +87,44 @@ int iris_hfi_core_init(struct iris_core *core)
>  	if (ret)
>  		return ret;
>  
> +	if (hfi_ops->sys_set_debug) {
> +		ret = hfi_ops->sys_set_debug(core);
> +		if (ret)
> +			dev_warn(core->dev,
> +				"failed to configure firmware debug logging: %d\n",
> +				ret);
> +	}
> +
>  	return hfi_ops->sys_interframe_powercollapse(core);
>  }
>  
> +int iris_hfi_set_debug(struct iris_core *core)
> +{
> +	const struct iris_hfi_sys_ops *hfi_ops = core->hfi_sys_ops;
> +	int ret = 0;
> +
> +	if (!hfi_ops->sys_set_debug)
> +		return 0;
> +
> +	ret = pm_runtime_resume_and_get(core->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	mutex_lock(&core->lock);
> +	if (core->state != IRIS_CORE_INIT) {
> +		ret = 0;
> +		goto unlock;
> +	}
> +
> +	ret = hfi_ops->sys_set_debug(core);
> +
> +unlock:
> +	mutex_unlock(&core->lock);
> +	pm_runtime_put_autosuspend(core->dev);
> +
> +	return ret;
> +}
> +
>  irqreturn_t iris_hfi_isr(int irq, void *data)
>  {
>  	disable_irq_nosync(irq);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index a27447eb2519962cb958b0e330a6d018310c3450..d8bc0862c54bd229d575113752526d51e863e303 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -105,9 +105,18 @@ struct iris_hfi_prop_type_handle {
>  	int (*handle)(struct iris_inst *inst, u32 plane);
>  };
>  
> +#define IRIS_FW_DEBUG_LOW	0x00000001
> +#define IRIS_FW_DEBUG_MEDIUM	0x00000002
> +#define IRIS_FW_DEBUG_HIGH	0x00000004
> +#define IRIS_FW_DEBUG_ERROR	0x00000008
> +#define IRIS_FW_DEBUG_FATAL	0x00000010
> +#define IRIS_FW_DEBUG_PERF	0x00000020

Setting the firmware log level to 0x0000003f may cause hardware response
timeouts due to excessive serial logging. HW_RESPONSE_TIMEOUT_VALUE should
be increased accordingly.

> +#define IRIS_FW_DEBUG_LOGMASK	0x0fffffff
> +
>  struct iris_hfi_sys_ops {
>  	int (*sys_init)(struct iris_core *core);
>  	int (*sys_image_version)(struct iris_core *core);
> +	int (*sys_set_debug)(struct iris_core *core);
>  	int (*sys_interframe_powercollapse)(struct iris_core *core);
>  	int (*sys_pc_prep)(struct iris_core *core);
>  
> @@ -153,6 +162,7 @@ u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
>  u32 iris_hfi_get_v4l2_transfer_char(u32 hfi_characterstics);
>  u32 iris_hfi_get_v4l2_matrix_coefficients(u32 hfi_coefficients);
>  int iris_hfi_core_init(struct iris_core *core);
> +int iris_hfi_set_debug(struct iris_core *core);
>  int iris_hfi_pm_suspend(struct iris_core *core);
>  int iris_hfi_pm_resume(struct iris_core *core);
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index f6e9cbfccd09e4013e842c92c8272ddeb1b166d3..55e2fade62e0450b8ce5e5c928b746dcb6ef8387 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -53,6 +53,35 @@ static int iris_hfi_gen1_sys_image_version(struct iris_core *core)
>  	return iris_hfi_queue_cmd_write_locked(core, &packet, packet.hdr.size);
>  }
>  
> +static int iris_hfi_gen1_sys_set_debug(struct iris_core *core)
> +{
> +	struct hfi_sys_set_property_pkt *pkt;
> +	struct hfi_debug_config *hfi;
> +	u32 fw_debug;
> +	u32 packet_size;
> +	int ret;
> +
> +	packet_size = struct_size(pkt, data, 1) + sizeof(*hfi);
> +	pkt = kzalloc(packet_size, GFP_KERNEL);
> +	if (!pkt)
> +		return -ENOMEM;
> +
> +	hfi = (struct hfi_debug_config *)&pkt->data[1];
> +
> +	pkt->hdr.size = packet_size;
> +	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
> +	pkt->num_properties = 1;
> +	pkt->data[0] = HFI_PROPERTY_SYS_DEBUG_CONFIG;
> +	fw_debug = READ_ONCE(core->fw_debug) & IRIS_FW_DEBUG_LOGMASK;
> +	hfi->config = fw_debug;
> +	hfi->mode = fw_debug ? HFI_DEBUG_MODE_QUEUE : 0;
> +
> +	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt->hdr.size);
> +	kfree(pkt);
> +
> +	return ret;
> +}
> +
>  static int iris_hfi_gen1_sys_interframe_powercollapse(struct iris_core *core)
>  {
>  	struct hfi_sys_set_property_pkt *pkt;
> @@ -1149,6 +1178,7 @@ static struct iris_inst *iris_hfi_gen1_get_instance(void)
>  static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
>  	.sys_init = iris_hfi_gen1_sys_init,
>  	.sys_image_version = iris_hfi_gen1_sys_image_version,
> +	.sys_set_debug = iris_hfi_gen1_sys_set_debug,
>  	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
>  	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 275f3fea3d2aabe26a2a0498c78c09ec28765b24..c892e28058641a82ade1a0eb52102e133429ef7d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -80,6 +80,13 @@
>  #define HFI_BUFFER_INTERNAL_SCRATCH_1			0x7
>  #define HFI_BUFFER_INTERNAL_SCRATCH_2			0x8
>  
> +#define HFI_DEBUG_MODE_QUEUE				0x01
> +struct hfi_debug_config {
> +	u32 config;
> +	u32 mode;
> +};
> +
> +#define HFI_PROPERTY_SYS_DEBUG_CONFIG			0x1
>  #define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
>  #define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index bfd7495bf44f064091afb3245ec53cd18d323068..a446c1930fe58480eedb441be6612ba42a083093 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -674,16 +674,35 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>  
>  static void iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
>  {
> -	struct hfi_msg_sys_coverage_pkt *pkt;
> +	struct hfi_msg_sys_debug_pkt *pkt;
> +	struct hfi_pkt_hdr *hdr;
> +	u32 log_size;
> +	u8 *log;
>  
>  	while (!iris_hfi_queue_dbg_read(core, packet)) {
> -		pkt = (struct hfi_msg_sys_coverage_pkt *)packet;
> +		hdr = (struct hfi_pkt_hdr *)packet;
>  
> -		if (pkt->hdr.pkt_type != HFI_MSG_SYS_COV) {
> -			struct hfi_msg_sys_debug_pkt *pkt =
> -				(struct hfi_msg_sys_debug_pkt *)packet;
> +		if (hdr->size <= sizeof(*hdr))
> +			continue;
> +
> +		if (hdr->size >= IFACEQ_CORE_PKT_SIZE)
> +			continue;
> +
> +		if (hdr->pkt_type != HFI_MSG_SYS_COV) {
> +			pkt = (struct hfi_msg_sys_debug_pkt *)packet;
> +
> +			if (hdr->size <= sizeof(*pkt))
> +				continue;
> +
> +			log = pkt->msg_data;
> +			log_size = hdr->size - sizeof(*pkt);
> +			if (pkt->msg_size < log_size)
> +				log_size = pkt->msg_size;
>  
> -			dev_dbg(core->dev, "%s", pkt->msg_data);
> +			if (pkt->msg_type & (IRIS_FW_DEBUG_ERROR | IRIS_FW_DEBUG_FATAL))
> +				dev_err_ratelimited(core->dev, "%.*s", (int)log_size, log);
> +			else
> +				dev_dbg(core->dev, "%.*s", (int)log_size, log);
>  		}
>  	}
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 388a36ff2b07b7bcd8db21d4345bc900356b4ec3..cca3c2e8668802d45ff309928a731b04a78a1bcc 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -17,6 +17,9 @@
>  #define SYS_IFPC_PKT_SIZE (sizeof(struct iris_hfi_header) + \
>  	sizeof(struct iris_hfi_packet) + sizeof(u32))
>  
> +#define SYS_DEBUG_PKT_SIZE (sizeof(struct iris_hfi_header) + \
> +	2 * (sizeof(struct iris_hfi_packet) + sizeof(u32)))
> +
>  #define SYS_NO_PAYLOAD_PKT_SIZE (sizeof(struct iris_hfi_header) + \
>  	sizeof(struct iris_hfi_packet))
>  
> @@ -54,6 +57,23 @@ static int iris_hfi_gen2_sys_image_version(struct iris_core *core)
>  	return ret;
>  }
>  
> +static int iris_hfi_gen2_sys_set_debug(struct iris_core *core)
> +{
> +	struct iris_hfi_header *hdr;
> +	int ret;
> +
> +	hdr = kzalloc(SYS_DEBUG_PKT_SIZE, GFP_KERNEL);
> +	if (!hdr)
> +		return -ENOMEM;
> +
> +	iris_hfi_gen2_packet_set_debug(core, hdr);
> +	ret = iris_hfi_queue_cmd_write_locked(core, hdr, hdr->size);
> +
> +	kfree(hdr);
> +
> +	return ret;
> +}
> +
>  static int iris_hfi_gen2_sys_interframe_powercollapse(struct iris_core *core)
>  {
>  	struct iris_hfi_header *hdr;
> @@ -1391,6 +1411,7 @@ static struct iris_inst *iris_hfi_gen2_get_instance(void)
>  static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
>  	.sys_init = iris_hfi_gen2_sys_init,
>  	.sys_image_version = iris_hfi_gen2_sys_image_version,
> +	.sys_set_debug = iris_hfi_gen2_sys_set_debug,
>  	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
>  	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index f43aea10090d8f1d6ae5c20547e5f6321b2ca203..1d4ded82ecdac6e4af9fdd11460158682d27fbf3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -39,6 +39,9 @@
>  #define HFI_PROP_UBWC_BANK_SWZL_LEVEL2		0x03000007
>  #define HFI_PROP_UBWC_BANK_SWZL_LEVEL3		0x03000008
>  #define HFI_PROP_UBWC_BANK_SPREADING		0x03000009
> +#define HFI_PROP_DEBUG_CONFIG			0x0300000a
> +#define HFI_PROP_DEBUG_LOG_LEVEL		0x0300000b
> +#define HFI_DEBUG_CONFIG_DEFAULT		0x00000000
>  #define HFI_PROP_CODEC				0x03000100
>  #define HFI_PROP_COLOR_FORMAT			0x03000101
>  #define HFI_PROP_BITSTREAM_RESOLUTION		0x03000103
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 0d05dd2afc07d830cc8502ab5f28001312991ba8..2dbe57b87fd3c3198d183c32be912797cf36de39 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -226,6 +226,35 @@ void iris_hfi_gen2_packet_image_version(struct iris_core *core, struct iris_hfi_
>  				    NULL, 0);
>  }
>  
> +void iris_hfi_gen2_packet_set_debug(struct iris_core *core, struct iris_hfi_header *hdr)
> +{
> +	u32 fw_debug;
> +	u32 payload;
> +
> +	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
> +
> +	payload = HFI_DEBUG_CONFIG_DEFAULT;
> +	iris_hfi_gen2_create_packet(hdr,
> +				    HFI_PROP_DEBUG_CONFIG,
> +				    HFI_HOST_FLAGS_NONE,
> +				    HFI_PAYLOAD_U32_ENUM,
> +				    HFI_PORT_NONE,
> +				    core->packet_id++,
> +				    &payload,
> +				    sizeof(u32));
> +
> +	fw_debug = READ_ONCE(core->fw_debug) & IRIS_FW_DEBUG_LOGMASK;
> +	payload = fw_debug;
> +	iris_hfi_gen2_create_packet(hdr,
> +				    HFI_PROP_DEBUG_LOG_LEVEL,
> +				    HFI_HOST_FLAGS_NONE,
> +				    HFI_PAYLOAD_U32_ENUM,
> +				    HFI_PORT_NONE,
> +				    core->packet_id++,
> +				    &payload,
> +				    sizeof(u32));
> +}
> +
>  void iris_hfi_gen2_packet_session_command(struct iris_inst *inst, u32 pkt_type,
>  					  u32 flags, u32 port, u32 session_id,
>  					  u32 payload_type, void *payload,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> index 25b9582349ca1a0ce6efc0b146a3abb798485c45..aff025fbf5eadbedbf0108b41b6f9bf418d4f779 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> @@ -111,6 +111,7 @@ u32 iris_hfi_gen2_get_color_info(u32 matrix_coeff, u32 transfer_char, u32 primar
>  
>  void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr);
>  void iris_hfi_gen2_packet_image_version(struct iris_core *core, struct iris_hfi_header *hdr);
> +void iris_hfi_gen2_packet_set_debug(struct iris_core *core, struct iris_hfi_header *hdr);
>  void iris_hfi_gen2_packet_session_command(struct iris_inst *inst, u32 pkt_type,
>  					  u32 flags, u32 port, u32 session_id,
>  					  u32 payload_type, void *payload,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 8c2644c7f6e85983d7ad7584fc0cb570e4813ae4..c845e5e6de50b75237cb829d35beb988f3b3d367 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -991,20 +991,24 @@ static int iris_hfi_gen2_handle_response(struct iris_core *core, void *response)
>  static void iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
>  {
>  	struct hfi_debug_header *pkt;
> +	u32 log_size;
>  	u8 *log;
>  
>  	while (!iris_hfi_queue_dbg_read(core, packet)) {
>  		pkt = (struct hfi_debug_header *)packet;
>  
> -		if (pkt->size < sizeof(*pkt))
> +		if (pkt->size <= sizeof(*pkt) + 1)
>  			continue;
>  
>  		if (pkt->size >= IFACEQ_CORE_PKT_SIZE)
>  			continue;
>  
> -		packet[pkt->size] = '\0';
>  		log = (u8 *)packet + sizeof(*pkt) + 1;
> -		dev_dbg(core->dev, "%s", log);
> +		log_size = pkt->size - sizeof(*pkt) - 1;
> +		if (pkt->debug_level & (IRIS_FW_DEBUG_ERROR | IRIS_FW_DEBUG_FATAL))
> +			dev_err_ratelimited(core->dev, "%.*s", (int)log_size, log);
> +		else
> +			dev_dbg(core->dev, "%.*s", (int)log_size, log);
>  	}
>  }
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index e4acf4a74f944bcae83089ef5489f204d4b0078e..8bc94acc4f58ce7792ddaeaad036475c476d5c36 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -12,6 +12,7 @@
>  #include <linux/reset.h>
>  #include <linux/soc/qcom/ubwc.h>
>  
> +#include "iris_debugfs.h"
>  #include "iris_core.h"
>  #include "iris_ctrls.h"
>  #include "iris_vidc.h"
> @@ -207,6 +208,8 @@ static void iris_remove(struct platform_device *pdev)
>  
>  	v4l2_device_unregister(&core->v4l2_dev);
>  
> +	iris_debugfs_deinit(core);
> +
>  	mutex_destroy(&core->lock);
>  }
>  
> @@ -230,6 +233,7 @@ static int iris_probe(struct platform_device *pdev)
>  	if (!core)
>  		return -ENOMEM;
>  	core->dev = dev;
> +	core->fw_debug = IRIS_FW_DEBUG_ERROR | IRIS_FW_DEBUG_FATAL;
>  
>  	core->state = IRIS_CORE_DEINIT;
>  	mutex_init(&core->lock);
> @@ -298,6 +302,8 @@ static int iris_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_vdev_unreg_enc;
>  
> +	iris_debugfs_init(core);
> +
>  	return 0;
>  
>  err_vdev_unreg_enc:
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index a2ea2d67f60d05bc0dceb097f94a4f80199b0618..e4b874a7119fd05669e49e66efc3c0e3a0feb314 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -127,7 +127,9 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>  		goto unlock;
>  
>  	if (!inst->once_per_session_set) {
> -		inst->once_per_session_set = true;
> +		ret = iris_hfi_set_debug(core);
> +		if (ret)
> +			dev_warn(core->dev, "failed to set firmware debug level: %d\n", ret);
>  
>  		ret = inst->hfi_session_ops->session_open(inst);
>  		if (ret) {
> @@ -136,6 +138,8 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>  			goto unlock;
>  		}
>  
> +		inst->once_per_session_set = true;
> +
>  		ret = iris_inst_change_state(inst, IRIS_INST_INIT);
>  		if (ret)
>  			goto unlock;
>
> ---
> base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
> change-id: 20260815-media-qcom-iris-fw-log-3b62b8645b7a
>
> Best regards,
