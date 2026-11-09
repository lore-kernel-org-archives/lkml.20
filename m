Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268644;
	b=lr9CM874/JYUd60TSZDuphqyVBsk/8y6Fk7OVOcfUk8G22FlRvJsI8/tWaL021EFHiy5
	 BrF+eAL09l72aJ/CU0DlVXv8Sj7ZWaEQPlyfq99j65nq4C/C+yzlymzdNYPn+k/qlFdsQ
	 7Lhv57xSW8mFzPtDBGIF1eEO9F2eEr8xQ6o8FtySqlosKm41m1BXb1RzcYSQB9gttBiEp
	 Dz/Lzn7mWrU4UBiliRyetPVFtcxysl14734FR2hDcmGUQjA7NXGhouZ5Z85rVFAQe7SK1
	 h135YT4HE6DAuOs4yVJoeezma2swL/zFjb0scsgev13MF6f65U3zQhz4d3LdJFf48aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=;
	b=b140yo/AbudmSwExkTUClGhLRJ5xLKsw+1dGJ2cLUse1i+8exy1pbrYcwtfG+vKc/Ge1
	 +iFOYQlFUOqiI87nGTMvH8Wmvr5GnZCyyDYS2NcI0mShZ/NQARNUIXr9JNiag3xIaR79A
	 i1ItRaTX+q81Z7qA/3sw7VAal+YnSQdmL7ey17XmEbQ25nGvdx/6aUc+leOT77J+FyHBT
	 Z1A7kmu9pZOzGUn3jlzuOnoVap1djr3Cjl8U4j1C+mFJC3qEORkEKdSkVtOeEKC07jR4W
	 OhqyIFdpC4bN6/hovPqYw1UFkpL1bUj3Yt4/Fn0Wp53VszoXA7pJI9BQIu2p1Rd33tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P7df/oHK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gVv1/uPl";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8746071818
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE8746071818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P7df/oHK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVv1/uPl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9L9t5X2017996
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 23:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=; b=P7df/oHKtu/L6AL9
	oqYI7wHDYo8ud+Jllx28MBig/s6ZgrSXgSZD/FmgLmOSw5KhdD0OIUqoIHDM3uhE
	GX4utPRN8O+heRLZjQvIie38noeZiaKYJM2rNyww0+N7G9FxR2/0uxvIbYHjSTP6
	lkHtRnEJdrfspa4LbZoWMf2Y5rIOSc2paYFC4vVRQGNJn0cxWNfvI9SmfEixSX0c
	HH7pwFMAze9twemWpnh7rHEe5nxk/O8tSMu9L8qDMpYnXTsET+ldsCQ1d0mknyMH
	kKoK3cS+h8m8jc8CGvh2/lh9LO2Yfq/NQ5ukTOXIXU9HrKzcNagmnCTiUd8YxLZa
	/MbDwQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg0rvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:57:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1797487eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794268642; x=1794873442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=;
        b=gVv1/uPlgCLww/HUdkfYCw4cN6zYD+rQ4YDn/MY//8kQPqwadDyGeFNuprOMHq6GSS
         LxEvlSpLLCJMgXiJJMKaMBXgW5OLUZHUOWsYRljWN0125SoO8R6uDjs1GjEmKPjn2II5
         ogV2D/awHsx86yay6dQ5CBlWq12WlpAdImjeI7FzWaCB20x3Wvjk9sr3WNf0XVZvRcyF
         biUPB/FsdQ+yZDQ7Z0/4dSnvae5NrRPDlv1LPYNJJMJBw0TI9DmMdkUd6x20T2nVLfer
         R2thru6i8VbcpZ2NWWUDC67i0QBz+dqpWGtQ0U9JnnNHDIGJoPidYZEInUdsFaYsouH/
         tW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268642; x=1794873442;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=;
        b=e9LvmJO93AhIhuRQq1N+M/ZVv8qQx9sGp7uKhDP8xUVsaILPC59HFB/Mqqohzgxuc3
         n8Kn+YfsULkp6500DhfTf+IHzad9rQ4vT9/w8rSYxDgWGSPMy7uns0TG4Zmqtfc4bow1
         Po50/RUJMwv3HFnPDyiqTOxojufPoo4I9JzPEtAVOaK4jfRpJYQjj3xk7YlhZgXol6iP
         vLMTfLJtQ1eGlFJRaJMuaAoWouqu0XHn5lMSe10i4xbyeeShJgD97M85RKUTJJA5TfvG
         V0jAynIvvmYFO3MU8DMYvVUlFG3Ccfjakp1zTsRcgoxVSRnGfY52BY7KMnW9ljBp5bSM
         vcoA==
X-Gm-Message-State: APuU4Z90ky82zZwjMSSv3kYPaFmeK+mz+c179Vt2EL3qaqmDPRoTGSeg
	wLENwoy6Ei2MRR4i2lbPon6BSScDwraIm5O7cwAXBMgY2GmlqziPHRIM1Q9Q1vZQmayU8jIKtX/
	0kXF0PfDu5EOJ0SLhvbYZSoCWRJrC3dfo/6vizjwYq88myDcvzUkUac6ZNKxtY/32KVY=
X-Gm-Gg: AYBFou18xdzZCteikx3jhn8y5M0qK/yoXyDzaMq3Y/9NPqYdzdu3lXN5uRGD+4KvnIm
	SPjctJJ3Yk1adeI+ergYX7/JY4yDlH0PAs8CDeIC3a8pcwS3jsruOP1OjnGSGnSFYlx5l4YiI0C
	JdZ33u3lrBf3ptFDFin9ChZOH2RYsf65hkX6op9poWjrfZokw1BaqqDU55hgQ8FVVlBf0mnfw1z
	yQI4j6y9TngGPSqzslJu42W3hEOq6/s5cyFTSeKAh24VQ+d3Z+T4wdQmvaTD0CTGbsVGvTM6O0z
	442RhkUsOzchAS6yKc4/SM3qAT2m4rOzi0crNAjx48Iw1Cgc4iTiJlPED+dQUTryn3zSRVQPAry
	zcKX5LSTTB6METLGedYnOGif9tLZuPC7z8F5K5kqG2WdjE1F8UWUb4oU2KvUAqBpdrWilj//h0t
	3IeA6sOdF/p1pCn61MPguBsw3mUA==
X-Received: by 2002:a05:693c:808b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-3751fa3d519mr1153087eec.21.1794268641540;
        Mon, 09 Nov 2026 15:57:21 -0800 (PST)
X-Received: by 2002:a05:693c:808b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-3751fa3d519mr1153056eec.21.1794268640929;
        Mon, 09 Nov 2026 15:57:20 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm1608728eec.13.2026.11.09.15.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:57:20 -0800 (PST)
Date: Mon, 9 Nov 2026 15:57:09 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 09/35] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <20261109155709.000059cb@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-10-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-10-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA5NSBTYWx0ZWRfX4kW7v8t9E1fD
 2VkdczRdPuBQeFCjbLIgqwwWYAqr/MoT7e5m2P/N1HfFdnIErbkcm3QTmiTpxnGqDntmoDcxrDA
 3ceiHJIL51WXerEPQU1XsQLYKYhHQG4dTzP/vKH4J25o+d2tN9lHLx4h8ZE27POXk5emzq+u982
 KSj6kzKfjF7TzsB/gEjDQsCCH8zbecT3QXb4TlKr1lFU+fMxBV4njsS4CLKdit7s+2uUhZjhzH5
 VS3vOuEStGQg8xPuJLg58ozi2rvF33TvhcDi9RsY5soeQiqLrX8YxFDMVC0pUhGTdpEkxywzJBx
 4g7vACqbnZvFbqbUa6eSlra3pKB7UgoD4slBTGC7rUB1sKgJ3UQfbKXtCA1rMNnw/YApUlu7hEa
 dwn+dkkk547sms/fpNmD+kFpNkHqXqwfqdSNGQP/QPdQg3yGMcmENQRFobvMG+HWLCefaaIM6Bl
 AoPMkj6BeRedPFKhOqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA5NSBTYWx0ZWRfX/6+K6mU0UoOl
 41xhR3/CpkZAV3QljevF1pgFrWmzh0mwtu5NzQ4F/N01GQ6AQpfPnKQx2Ua0NDABdW24VJOAtq/
 PyEtYZKL3HzuaDg71eF3BptxCOhXS00=
X-Proofpoint-GUID: wf4dWMU4KJQBmD6ZxSFMSV1jAbmoU8_Z
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af25de2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=FN7pwp8LrHzWrJGgN4QA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: wf4dWMU4KJQBmD6ZxSFMSV1jAbmoU8_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090095

On Mon,  9 Nov 2026 09:11:55 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support for minimal initialization and
> protocol attributes enumeration: expose telemetry instance descriptor
> via a simple information retrieval protocol operation.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

A few minor things inline.

Thanks,

Jonathan

> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
> index d1f1bde8a7cc..77daedddaab7 100644
> --- a/drivers/firmware/arm_scmi/protocols.h
> +++ b/drivers/firmware/arm_scmi/protocols.h
> @@ -410,5 +410,6 @@ DECLARE_SCMI_REGISTER_UNREGISTER(sensors);
>  DECLARE_SCMI_REGISTER_UNREGISTER(voltage);
>  DECLARE_SCMI_REGISTER_UNREGISTER(system);
>  DECLARE_SCMI_REGISTER_UNREGISTER(powercap);
> +DECLARE_SCMI_REGISTER_UNREGISTER(telemetry);
>  
>  #endif /* _SCMI_PROTOCOLS_H */
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> new file mode 100644
> index 000000000000..23eaac485691
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * System Control and Management Interface (SCMI) Telemetry Protocol
> + *
> + * Copyright (C) 2026 ARM Ltd.
> + */
> +
> +#include <linux/atomic.h>

I'm not immediately spotting this being used.  Perhaps take another
look at whether some of these should wait for later patches
where their usecases come in.

> +#include <linux/bitfield.h>
> +#include <linux/compiler_types.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/sprintf.h>
> +#include <linux/string.h>
> +#include <linux/uuid.h>
> +
> +#include "protocols.h"
> +#include "notify.h"
> +
> +/* Updated only after ALL the mandatory features for that version are merged */
> +#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
> +
> +#define SCMI_TLM_DE_IMPL_NUM_DWORDS	4
> +
> +/* An enum listing the protocol specific commands definitions */
> +enum scmi_telemetry_protocol_cmd {
> +	TELEMETRY_LIST_SHMTI = 0x3,
> +	TELEMETRY_DE_DESCRIPTION = 0x4,
> +	TELEMETRY_LIST_UPDATE_INTERVALS = 0x5,
> +	TELEMETRY_DE_CONFIGURE = 0x6,
> +	TELEMETRY_DE_ENABLED_LIST = 0x7,
> +	TELEMETRY_CONFIG_SET = 0x8,
> +	TELEMETRY_READING_COMPLETE = TELEMETRY_CONFIG_SET,
> +	TELEMETRY_CONFIG_GET = 0x9,
> +	TELEMETRY_RESET = 0xA,
> +};
> +
> +struct scmi_msg_resp_telemetry_protocol_attributes {

I like clear names as much as anyone, but probably wouldn't lose much by
abbreviating a little?

struct scmi_msg_rsp_telemetry_prot_attr
perhaps?

> +	__le32 de_num;
> +	__le32 groups_num;
> +	__le32 de_implem_rev_dword[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> +	__le32 attributes_1;
> +#define SUPPORTS_SINGLE_READ(x)		(le32_get_bits((x), BIT(31)))
> +#define SUPPORTS_CONTINUOS_UPDATE(x)	(le32_get_bits((x), BIT(30)))
> +#define SUPPORTS_PER_GROUP_CONFIG(x)	(le32_get_bits((x), BIT(18)))
> +#define SUPPORTS_RESET(x)		(le32_get_bits((x), BIT(17)))
> +#define SUPPORTS_FC(x)			(le32_get_bits((x), BIT(16)))

I guess a local style thing but my normal inclination would be not hide
what is going on here and instead define
	ATTRS1_SUPPORTS_FC BIT(16)
and use the le32_get_bits() inline.  These helpers have lost the connection
with attributes_1.  

> +	__le32 default_blk_ts_rate;
> +};
> +
> +struct telemetry_info {
> +	bool streaming_mode;
> +	unsigned int num_shmti;
> +	unsigned int num_des_tstamp;
> +	unsigned int default_blk_ts_rate;
> +	const struct scmi_protocol_handle *ph;
> +	struct scmi_telemetry_info info;
> +};
> +
> +static int
> +scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
> +{
> +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;

It feels like this is in the function scope rather than the if (!ret)
mostly because it has a really long type name. See above.

> +	const struct scmi_protocol_handle *ph = ti->ph;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> +				      sizeof(*resp), &t);
> +	if (ret)
> +		return ret;
> +
> +	resp = t->rx.buf;

I think this would ideally be in the if (!ret) as well which makes
more sense if the declaration is in there.

> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {

Maybe given long lines and indent, this is worth a helper function.

> +		__le32 attr = resp->attributes_1;
> +		__be32 de_impl_version[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> +
> +		ti->info.base.num_des = le32_to_cpu(resp->de_num);
> +		ti->info.base.num_groups = le32_to_cpu(resp->groups_num);
> +		for (int i = 0; i < SCMI_TLM_DE_IMPL_NUM_DWORDS; i++)
> +			de_impl_version[i] =
> +				cpu_to_be32(le32_to_cpu(resp->de_implem_rev_dword[i]));
> +		import_uuid(&ti->info.base.primary_revision, (const __u8 *)&de_impl_version);
> +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> +		ti->info.continuous_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> +		ti->info.reset_support = SUPPORTS_RESET(attr);
> +		ti->info.fc_support = SUPPORTS_FC(attr);
> +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));

I think that mask belongs up with the structure definition as people will want
to check the whole thing in one place.


> +		ti->default_blk_ts_rate = le32_to_cpu(resp->default_blk_ts_rate);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 3f7cc35eb861..f076ce5601cf 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -2,17 +2,19 @@
>  /*
>   * SCMI Message Protocol driver header
>   *
> - * Copyright (C) 2018-2021 ARM Ltd.
> + * Copyright (C) 2018-2026 ARM Ltd.
>   */
>  
>  #ifndef _LINUX_SCMI_PROTOCOL_H
>  #define _LINUX_SCMI_PROTOCOL_H
>  
>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>

Not seeing use of that in this patch within the header.
Perhaps it should be included in a later patch or in the c file?

>  #include <linux/device-id/scmi.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> +#include <linux/uuid.h>
>  
>  #define SCMI_MAX_STR_SIZE		64
>  #define SCMI_SHORT_NAME_MAX_SIZE	16
> @@ -828,6 +830,35 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  
> +struct scmi_telemetry_base_info {
> +	unsigned int version;
> +	uuid_t primary_revision;
> +	unsigned int num_des;
> +	unsigned int num_groups;
> +	unsigned int num_intervals;
> +	unsigned int num_shmtis;
> +};
> +
> +struct scmi_telemetry_info {
> +	bool single_read_support;
> +	bool continuous_update_support;
> +	bool per_group_config_support;
> +	bool reset_support;
> +	bool fc_support;
> +	struct scmi_telemetry_base_info base;
> +};

