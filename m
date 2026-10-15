Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164D94DA9DB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068167; cv=none; b=PLVXEduwVqRra5fM7OZYOqPdA5ovpR+dvK5+KNVdUcacoJO2y5D47F7NnP3RHOsyo+XNZAumHCOyBU0FfsMQUO0w+FEamyoxUYxojaVxqD2H+SP15Lp2Uk9saM1jOfgcPAuxEn8lHr2/538EnyKwHbkc91LhN0vhSjrDwPAmSxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068167; c=relaxed/simple;
	bh=iue/25EugCeiP+JlUAe0+14oDJOn0PTFfLPEqbW/HRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8sTv49Tp1RzbE2yqbiWew0Ak/zSahy5JjkTHJ3SvT+FuF6cID6zZR7tQt1HrU6qUkXKGb6HPf7ufGg2+E2F/GXoBnO61iDue7ILUzt9hTsSflxmjRuoghgjjnOHM1W5H9wUQhSWFrGuk/vZnbPCdGuPGeqRkRra0ZuEYwiSVtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R25y7Euu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYig4MvF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R25y7Euu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYig4MvF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jgPD1955846
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KgCkbIqj+Xltp5HS/aMjiyIa
	do5whRz2Y+pFV9bEePY=; b=R25y7EuuLXCZtzDPvFdgieK2SbIvfbN1jRnQW+Qg
	Fl/7uNZi5zwoZ+YKQLCsVdTrDJsRk17T3DAN2EwcwCUKO/LlT8TQqVhK9UDPK0U2
	TJ3d3+MRlCI/G8R7oYHaGKlRVl0MOyBheA1VVxEi/SP6hqGYhweHPCrFvwREJwTp
	2dmXH0GtBhjZoAbTmWS6AXpvfkcckuC/C0JSfK+kM2OsVtXaoTG5oAOfbKngdpF5
	glNu6K8EZSka/gEgk8RWDFzCZXU3bLT3j+Y0bhiJlKXH/u2WG9s5Iajflm0fiAQZ
	joM1dWehim2el4uVZ9WnKB1NayqHPCRZkzRaKslfkNM3RQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdetwm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:42:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso912524685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792068163; x=1792672963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KgCkbIqj+Xltp5HS/aMjiyIado5whRz2Y+pFV9bEePY=;
        b=LYig4MvFwr+aBZqUIpLYUQdwgs+aVDoy8G3qeF8wWuWQEUHejwF8aR3hiwMFpil+rL
         8ksc5hsKpk0CHEHWApe7mP87TMYHLaqqHi1AjJ6cBcXeUDeoBm2LoMDf2emLfpzAP+DB
         9H1MZ+tT/o4ZYaJlgzDQsNlu06z0J44OBIxLQhVY9WLvHAnxHzLTPMbtMjnyuf9Pkv64
         xWE/rA6n4ChkDBFSJKQOTD4ihM/crR7HWoC2UGvFbqM9RS2gne4N7dnLeW/NtdoIIWhu
         vXYinkAnzUODKxHXXm30G7ugqeCjH8KrhVet1OD/okOglXyabGLdLRSG2KysecUkatSh
         sBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068163; x=1792672963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgCkbIqj+Xltp5HS/aMjiyIado5whRz2Y+pFV9bEePY=;
        b=vVbNrKh7Sy3waN/YqmcuFe39LwpMFmf+IDu1F2/v2tROkZRqz6oSpeZhGcxpKsLCWX
         AkiZiwffP4R+GjoaCe8uJp8csLxtyepKmXcDhgNsL9+Qkr8eOH78hVmt54TQDj4gJ+Y6
         2t+XR5xslh2rnD0l/DEB997XI7Nw4ZxuMndEFNegWWLARvqP5np95BhR3SR/3nm86SAX
         K++ewXlk26oidNwKGS6TzKjlFhY/TsbujyMMvGNJBdENmiA2CFl4cgM2noRoh/zaiB9n
         ew/dzee8WE8zr2VrLXacK0in+WIDFD4ywx3tFdsysZkBZmP6f/4Fm9NHEyREP9u6MJX5
         Rv3g==
X-Forwarded-Encrypted: i=1; AKwUvByNncLn7q0fTD5tFd9glRv0PYETSDZqyS8R0F1X3oBQrPUrqDE4PaFg0EqYToU22noAbd8Bg4c/2IYlAbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIxzNPY+dvr7DLbiWnYItuwkaZp/uPeimlIaeZfYePwS9sdaXY
	HW6byiRPf3jFnDqigyFq/mzjLPTfOOzhmoTLsu17vJaDEpP8I3b1qaH4ThG2N5vf5eAWnIrZpvf
	nzb3JmB6MdECi3YEVZDc+N+U+fpg9hL8Aq2W9ubfliLKP20kE8sgbDhuxJUoCYQTnt+Q=
X-Gm-Gg: AYBFou0fxdh5aTinWS01EDFIdAKv0ZgJQQzqu4KArTCELTBAVxwsVp6chHysFJWyBaK
	+ONyiLvYKTCBNGpRdyWuRxzeI0n92s3XZCynVTwlVhJQ/doyaJ+CD2Kh1ZJtY4Msi60raxUI5It
	gbEXiQkMOVdI+g33I4dANSwxTRhpoDLSJzR0nokw7BM3outIoCNuhCKConMzr45KOS+NArdyCxW
	v3QQH+dtRA7IzXaaKYXObHcj7pfzlj8IO7EO7YPwpHaijG3Jo6601MvVIdpYLiheRiEzUegEEUu
	wGmxDnph0U/Sj/fTpsTQDV8P4s6I6n2tU2fiz0dvh/wUGjYXaHqDFkK4CJlan537QZxuOXkh2os
	20akAsyh25UVwNdhqYdXpbBvhw7Emqi5LYUGI9lwqyKkBcaK8R1qOWxv2MoWT2tTSkKpNyfSpOa
	Sfw8BdD3ETvTrG
X-Received: by 2002:a05:620a:4407:b0:93e:942f:b8b1 with SMTP id af79cd13be357-93ebd292a3fmr3061151985a.64.1792068163107;
        Thu, 15 Oct 2026 05:42:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4407:b0:93e:942f:b8b1 with SMTP id af79cd13be357-93ebd292a3fmr3061145985a.64.1792068162454;
        Thu, 15 Oct 2026 05:42:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdf4e5ebsm6660281fa.40.2026.10.15.05.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:42:41 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:42:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 04/13] drm/msm/dcp: Add IPCC power notification
Message-ID: <u7pcn75yh435vuuwqezml37bqfzdztvrywggbmkydkilwe5yzp@myijo4wd2bob>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-4-48aad0fe4f72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-4-48aad0fe4f72@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0ca43 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=CLenjPMy3891WX9YFLIA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8CEvOJM4SeCPeLw-RhU5-7lK7j6qnFA_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX8yBP3I6xK8fC
 Vo+agyv69VlVDdnS0Sx4nJQhnOXqiMQPCBYFObOD1P7vI3MLrG7OCmqlbWYxUsMOabrNFGpXVLt
 fMlEpIW3qD4vhUh2grBx2NcKbpapxbCSlo+Wx8gFHC6dmh37d5a9hkoYDi3k+lxemwuT0DIPqsK
 xVstQTJyYweAqA087yvvZLLyg1zyesbBfAs9kAfRlz33KK6cXKURO/TB3GSp9q3JeaLD1JOKnS0
 tGcmgyzV2g7rlTFXDH7xjIZk8cCFaLsrKZUKag/KILDSTh6QPPNLtfCcwY6f/Gm41BnhY7vWVVv
 mlQRqHqjIUT+p4qlHFXKaq5arrUsl7w6tpugVRlNf4vLtZwKF5NdVaSpyn04qCiesfUvrm4h6el
 SPDWVdfp72mP9eT+udE0HqYhrT7z3dc63rnm1qMWPhXxedopPGBy0+6b75Vijsd9Ag6IniuS4dg
 OjqXf0Xi9wLSQqMFSQg==
X-Proofpoint-GUID: 8CEvOJM4SeCPeLw-RhU5-7lK7j6qnFA_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX5w0Wl9besCaH
 X8uSrcFiBbuu50RDCQtcn3e7BBblmwfLLy1WGGBWyf81i5KsFoejuxygEPI3pg343k5IPJ+J/28
 RzCdRw0kOte7ynKYkrvFlr8oG6kYZp0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150050

On Thu, Oct 15, 2026 at 01:08:24PM +0530, Jayant Shekhar wrote:
> DCP may be power-collapsed while the VirtIO transport remains available.
> The host therefore needs the platform IPCC channel to wake the firmware and
> to receive notification that it can service HFI queues.

Is it allowed per the VirtIO spec?

> 
> Add the IPCC mailbox client and power-notify interrupt handling. Wake DCP
> before VirtIO queue activity, wait for the firmware acknowledgment, and
> notify the response queue when the IPCC receive path completes.

Don't describe patch contents. Describe your design decisions. The
reasons for the flags, init/deinit functions, etc.

> 
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> Assisted-by: LLM
> ---
>  drivers/gpu/drm/msm/Makefile       |   1 +
>  drivers/gpu/drm/msm/dcp/dcp_drv.h  |   1 +
>  drivers/gpu/drm/msm/dcp/dcp_ipcc.c | 212 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dcp/dcp_ipcc.h |  56 ++++++++++
>  4 files changed, 270 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index bdc34babfc21..4195bc0e1fc9 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -71,6 +71,7 @@ msm-display-$(CONFIG_DRM_MSM_MDP5) += \
>  
>  msm-display-$(CONFIG_DRM_MSM_DCP) += \
>  	dcp/dcp_hfi_core.o \
> +	dcp/dcp_ipcc.o \
>  	dcp/hfi/hfi_packer.o \
>  	dcp/hfi/hfi_unpacker.o \
>  	dcp/hfi/hfi_utils.o
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_drv.h b/drivers/gpu/drm/msm/dcp/dcp_drv.h
> index bf6c34af43a0..af2db3cf9066 100644
> --- a/drivers/gpu/drm/msm/dcp/dcp_drv.h
> +++ b/drivers/gpu/drm/msm/dcp/dcp_drv.h
> @@ -13,6 +13,7 @@
>  #include <linux/virtio.h>
>  
>  #include "dcp_hfi.h"
> +#include "dcp_ipcc.h"
>  
>  struct dcp_dpu_kms;
>  
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_ipcc.c b/drivers/gpu/drm/msm/dcp/dcp_ipcc.c
> new file mode 100644
> index 000000000000..e60a3ecbe3d8
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_ipcc.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * DCP IPCC power-notify mailbox client.
> + *
> + * The APSS-to-DCP channel must be signaled before a VirtIO queue kick.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/jiffies.h>
> +#include <linux/interrupt.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mutex.h>
> +#include <linux/of_irq.h>
> +#include <linux/string.h>
> +#include <linux/virtio.h>
> +
> +#include "dcp_ipcc.h"
> +
> +#define DCP_IPCC_POWER_NOTIFY_TIMEOUT_MS	10000
> +
> +static void dcp_ipcc_handle_rx(struct dcp_ipcc *ipcc)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ipcc->state_lock, flags);
> +	if (ipcc->shutting_down) {
> +		spin_unlock_irqrestore(&ipcc->state_lock, flags);
> +		return;
> +	}
> +
> +	if (atomic_xchg(&ipcc->power_notify_pending, 0))
> +		complete(&ipcc->power_notify_done);

Can there be more than one power notification pending? Can't we just
call complete() here?

> +
> +	if (ipcc->resp_vq && virtqueue_kick_prepare(ipcc->resp_vq))
> +		virtqueue_notify(ipcc->resp_vq);
> +	spin_unlock_irqrestore(&ipcc->state_lock, flags);
> +}
> +
> +static irqreturn_t dcp_ipcc_power_notify_irq(int irq, void *data)
> +{
> +	struct dcp_ipcc *ipcc = data;
> +
> +	dcp_ipcc_handle_rx(ipcc);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void dcp_ipcc_rx_callback(struct mbox_client *cl, void *data)
> +{
> +	struct dcp_ipcc *ipcc = container_of(cl, struct dcp_ipcc, client);
> +
> +	dcp_ipcc_handle_rx(ipcc);
> +}
> +
> +int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev)
> +{
> +	int irq, ret;
> +
> +	if (!ipcc || !dev)
> +		return -EINVAL;
> +
> +	memset(ipcc, 0, sizeof(*ipcc));
> +	init_completion(&ipcc->power_notify_done);
> +	mutex_init(&ipcc->power_notify_lock);
> +	spin_lock_init(&ipcc->state_lock);
> +	atomic_set(&ipcc->power_notify_pending, 0);
> +
> +	ipcc->client.dev          = dev;
> +	ipcc->client.tx_block     = false;
> +	ipcc->client.tx_tout      = 0;
> +	ipcc->client.knows_txdone = true;
> +	ipcc->client.rx_callback  = dcp_ipcc_rx_callback;
> +
> +	ipcc->power_chan = mbox_request_channel_byname(&ipcc->client,
> +						       "dcp-power-tx");
> +	if (IS_ERR(ipcc->power_chan)) {
> +		ret = PTR_ERR(ipcc->power_chan);
> +		ipcc->power_chan = NULL;
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "IPCC: failed to get 'dcp-power-tx': %d\n", ret);
> +		return ret;
> +	}
> +
> +	irq = of_irq_get_byname(dev->of_node, "dcp_power_notify_irq");
> +	if (irq <= 0) {
> +		ret = irq ? irq : -EINVAL;
> +		ret = dev_err_probe(dev, ret,
> +				    "failed to get required power notify IRQ\n");
> +		goto err_free_channel;
> +	}
> +
> +	ret = request_irq(irq, dcp_ipcc_power_notify_irq,
> +			  0, "dcp-power-notify", ipcc);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret,
> +				    "failed to request power notify IRQ %d\n", irq);
> +		goto err_free_channel;
> +	}
> +	ipcc->power_notify_irq = irq;
> +
> +	ret = enable_irq_wake(irq);

This is typically called from the suspend callback. Why are you calling
it in init path?

> +	if (ret) {
> +		dev_err(dev, "failed to enable power notify IRQ wake: %d\n", ret);
> +		goto err_free_irq;
> +	}
> +	ipcc->power_notify_irq_wake = true;
> +
> +	return 0;
> +
> +err_free_irq:
> +	free_irq(irq, ipcc);
> +	ipcc->power_notify_irq = 0;
> +err_free_channel:
> +	mbox_free_channel(ipcc->power_chan);
> +	ipcc->power_chan = NULL;
> +	return ret;
> +}
> +
> +void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq)
> +{
> +	unsigned long flags;
> +
> +	if (!ipcc)
> +		return;
> +
> +	spin_lock_irqsave(&ipcc->state_lock, flags);
> +	if (!ipcc->shutting_down)
> +		ipcc->resp_vq = resp_vq;
> +	spin_unlock_irqrestore(&ipcc->state_lock, flags);
> +}
> +
> +void dcp_ipcc_deinit(struct dcp_ipcc *ipcc)
> +{
> +	struct mbox_chan *power_chan;
> +	int irq;
> +	bool irq_wake;
> +	unsigned long flags;
> +
> +	if (!ipcc)
> +		return;

Oh, you again ignored the feedback. Can ipcc be NULL here? What would
that mean?

> +
> +	mutex_lock(&ipcc->power_notify_lock);
> +	spin_lock_irqsave(&ipcc->state_lock, flags);
> +	ipcc->shutting_down = true;
> +	ipcc->resp_vq = NULL;
> +	irq = ipcc->power_notify_irq;
> +	ipcc->power_notify_irq = 0;
> +	irq_wake = ipcc->power_notify_irq_wake;
> +	ipcc->power_notify_irq_wake = false;
> +	power_chan = ipcc->power_chan;
> +	ipcc->power_chan = NULL;
> +	spin_unlock_irqrestore(&ipcc->state_lock, flags);

Ugh. No.

> +
> +	if (irq > 0) {

Can it be 0 here?

> +		disable_irq(irq);

What for?

> +		if (irq_wake)
> +			disable_irq_wake(irq);

It is enabled at this point. Drop the useless flags.

> +		free_irq(irq, ipcc);

We have devm_foo() functions to simplify the teardown. Can we use them
here?

> +	}
> +	if (power_chan)
> +		mbox_free_channel(power_chan);
> +	mutex_unlock(&ipcc->power_notify_lock);
> +}
> +
> +int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc)
> +{
> +	unsigned long flags, timeout;
> +	int ret;
> +
> +	if (!ipcc)
> +		return -ENODEV;
> +
> +	/* Wait for the doorbell acknowledgment before returning to VirtIO. */
> +	mutex_lock(&ipcc->power_notify_lock);
> +	spin_lock_irqsave(&ipcc->state_lock, flags);
> +	if (ipcc->shutting_down || !ipcc->power_chan) {
> +		spin_unlock_irqrestore(&ipcc->state_lock, flags);
> +		ret = -ENODEV;
> +		goto out_unlock;
> +	}
> +	spin_unlock_irqrestore(&ipcc->state_lock, flags);
> +
> +	reinit_completion(&ipcc->power_notify_done);
> +	atomic_set(&ipcc->power_notify_pending, 1);
> +
> +	ret = mbox_send_message(ipcc->power_chan, NULL);
> +	mbox_client_txdone(ipcc->power_chan, ret);
> +	if (ret < 0) {
> +		atomic_set(&ipcc->power_notify_pending, 0);
> +		dev_err(ipcc->client.dev,
> +			"IPCC TX: power notify failed: %d\n", ret);
> +		goto out_unlock;
> +	}
> +
> +	timeout = wait_for_completion_timeout(&ipcc->power_notify_done,
> +					      msecs_to_jiffies(DCP_IPCC_POWER_NOTIFY_TIMEOUT_MS));
> +	atomic_set(&ipcc->power_notify_pending, 0);
> +	if (!timeout) {
> +		dev_err(ipcc->client.dev,
> +			"IPCC power notify acknowledgment timed out\n");
> +		ret = -ETIMEDOUT;
> +	} else {
> +		ret = 0;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&ipcc->power_notify_lock);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_ipcc.h b/drivers/gpu/drm/msm/dcp/dcp_ipcc.h
> new file mode 100644
> index 000000000000..a3430e5cbe72
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_ipcc.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * IPCC power-notify mailbox interface for DCP firmware.
> + *
> + * Channel 5 carries APSS-to-DCP wake notifications; responses arrive through
> + * the mailbox client's RX callback.
> + */
> +
> +#ifndef __DCP_IPCC_H__
> +#define __DCP_IPCC_H__
> +
> +#include <linux/atomic.h>
> +#include <linux/completion.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +
> +struct device;
> +struct virtqueue;
> +
> +/**
> + * struct dcp_ipcc - DCP IPCC power-notification state
> + * @client: Mailbox client used for APSS-to-DCP notifications.
> + * @power_chan: Mailbox channel carrying power notifications.
> + * @resp_vq: VirtIO response queue notified by the IPCC receive path.
> + * @power_notify_done: Completion for the firmware acknowledgment.
> + * @power_notify_lock: Serializes power notifications and teardown.
> + * @power_notify_pending: Indicates an outstanding acknowledgment.
> + * @state_lock: Protects shutdown state and response queue access.
> + * @shutting_down: Prevents callbacks from accessing teardown state.

What is going to access it during teardown? Can we shutdown in a logical
way, so that there are no accessors after starting the teardown?

> + * @power_notify_irq_wake: Whether IRQ wake was enabled.
> + * @power_notify_irq: Power-notify acknowledgment IRQ number.
> + */
> +struct dcp_ipcc {
> +	struct mbox_client client;
> +	struct mbox_chan *power_chan;
> +	struct virtqueue *resp_vq;
> +	struct completion power_notify_done;
> +	/* Serializes power notifications and teardown. */
> +	struct mutex power_notify_lock;
> +	atomic_t power_notify_pending;
> +	/* Protects shutdown state and response queue access. */
> +	spinlock_t state_lock;
> +	bool shutting_down;
> +	bool power_notify_irq_wake;
> +	int power_notify_irq;
> +};
> +
> +int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev);
> +void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq);
> +void dcp_ipcc_deinit(struct dcp_ipcc *ipcc);
> +int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc);
> +
> +#endif /* __DCP_IPCC_H__ */
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
