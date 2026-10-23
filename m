Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749587;
	b=gVPljx1plEo7tI//lCCSfnjAi9PAhmvwwRPfpi6SY5bxfgJrAvtzu9Com8GAPHBIL4Oz
	 Qdfou5RMpa5FPW4Rw27K2XLitm3HRew1sIEhc07HKvVuf4lPY4Mn1t6lChFch7e1HvntW
	 uwSJEC6G45Ad9mhYHBZPPl7Bu8+Le+bxNCh7Na+apprZFslRxaFu3Y/UJUL4PW2Hyh8vm
	 ilWEmvcqnPbwAfpH4dyg7DNPXc9Ki4wr7jezARQYWZSSQBLP3pJR1uDaULp7xGC1WVQ4H
	 WtHlVnFtyeAlUYv8eXCllWspS0Zo/uELu3Zu8o0YA8BqQ2up2tAihqhwwJW+dVY14/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749587;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YkRpJaDqco6LEFQuZ/pvK2bkmZohErX1p+9QknBbkno=;
	b=y5nJElW7fDxV+0UrQOeS+Jhn9CuwsY5xX/4xhSnwcUgT8wPqcHq2r2vMM9tgEGvMchwq
	 OsqPgrhQ1Qx7no94LgR7/bOoLDsfUz1V86u1/EIBsjhSZ2eyQH0ijadNGnTtH/Ct0wJYX
	 LqUjmWZ3VVtcuje2BptDv8e2nNJ/Ds+5AaRXs4OanpQww2eIPXg+0ZMccPE5SaId/6pN1
	 ch2Q0s7nQ/4FvUw+lqUwFSoIceLcSdzU5K5GfdE2cbtJTluMuRNn0lWz+exkWcHLlKQh4
	 9s6KVCpTFO9rwBBQXYq6mix1hLE+LjJXey/KeP5XgZBtoxsp9FmmbHFqclfOCF+pElw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p456WRBa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N9F5mQnN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43811606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43811606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p456WRBa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N9F5mQnN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FBX12092798
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YkRpJaDqco6LEFQuZ/pvK2bkmZohErX1p+9QknBbkno=; b=p456WRBatilPuf4q
	Qk7dmM1hggU8GIPT3UdtqPgDeVAKsyEy7Boyd6T7XE4xTrPXliRMwZpRncIWzy4a
	miMYRtZ0bWuB0qmdwHxRxJso4p10Dq5aH53AAEgNg4Q7dxbqWSt1Bbpek5/4uFkW
	M0YT/VBvMKCd+Z1DWEeBGGPMxsy7ThcrrV4pbpCO2omD6J6gWehCH/P576F33gfy
	aV066oawhIAQzNPZ4mq0ULu5t5+bflI0tNb2jKsLUs2Q/g04+xxzAIsTE4x0Tx93
	pBkrb7XkRUfS4n33mgWSAEUWb6VLPeNj73WUJddBwUEE0mwXpAYNTTtFjLTcYMNZ
	WQzLWQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftygaaka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:59:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35dca90dea9so67423eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792749585; x=1793354385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkRpJaDqco6LEFQuZ/pvK2bkmZohErX1p+9QknBbkno=;
        b=N9F5mQnNa/3/IFIBmN+1lMUndZcenMaHvjn/HawvUOG3kWfXkoCce0kRpgsUwPCwQq
         6394vBG71qs3XrqBKxYZhBzJkg7p/uaohclbGiH7mk/Z9xrUKMEKsSdVd0zNAYvM/rO9
         PclTwrpFBR/SbaoHk5Z4NmtUffq0mKkXrKqXv0rEfZ7Wwr8jG5dmEKvgZvaekKS7SXcE
         rUiwlxjn0DQT66fQQpVWgeFRl4JMP+pfuGWMDB2TbFO0UENE0tZLgn+FzKZDUOyrTXDi
         1+uLONAhuUo+YikJNcXMsAqeVZYa2c7eNCaGu8gYQNpT54EUgYZxX1M0VQLuz5MLVCcD
         +GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749585; x=1793354385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkRpJaDqco6LEFQuZ/pvK2bkmZohErX1p+9QknBbkno=;
        b=XIAhlZ6tt4Ja74832CV5UusyYWeAczk/igsbxunlgQ4SQvmqYRcwuQpEnTfqARBwup
         ZSW9U5Q5lqOP1SY817X6MYX3EYykJaBHuZbF8tnp0wXtRLv1a2tkVtAkqjKjhUuu4tfi
         9oMdv8UgXr2X6vuvu2tOCufllue1AgHsT3SayGdgySiJKXa0lxHioYbg/IqblJoYoJgn
         bM2A+bhwHXv6xw0ysVywCaaZa2njPdjizggL4gWe7kSb+5BAYzK2ZQYBJupKULd0hFwn
         DehFFfcKkpDPdCptiZyQir6KKFnL+ak+pz4IJYYRiTF+UkwX9Kv967gyVOyI32/MtHzS
         Ngpg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ/gbAu0/ppPoVSETyB2zaNjlV7DOOSo7iaBGjGabpemtvNDQ+3UZNXcKLeKSe7huSO4XnfidkbygMmZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNKhRIs/7McVjbcw0c/MraZJ/Z9PSnkTmINgYhfHsWwAvRySYw
	o/uwIQ5NtIBF0kcEEsazDgof8ICnAbN8hSjRfs8QKRld1aFsKPlNn3d6HHA3CJCVCgFfX51YoyJ
	2QQV7UX4G5DMHXlJ8hy4wgD4ZqKnO10CcUyXHZIhLSrbBvfuWV8rJG9UQXHz8vH8HsY4=
X-Gm-Gg: AYBFou2FEJ5ASyuTdWbv8qgh8KcxUyjr3pVptAKxFayY5bKbe9e0kiEPtdX+T0q5QsU
	Sw3B8eWB/4q659oXspLNUy+2bBSG2zZPBlDHMwLoulbEjsK5QZqVfC+9pnoLaySpzjpjwP4N+/F
	lv/Vv74u303d4pYx4riqqamXSLFxV99IWYH/j0uaqu1gGkYX6qAOO06ms/mQRil0xaWAM+g+A2h
	HXGTQOoaKbI+mcTXD7qiTlk6nB3HzaKYE+2vgvKWNLTD2bPcQox7g9KQpKegCHeir9iz+B9r5ap
	0KjjLWRbbQML8gVRl5TKcxoYYOl0u+n60YtDcmSsmLCR6fZf3tMctu7I7PNWfEhT5zfMq/ylhUg
	xttbXbz4a4557ABYQeaYUhE0UJXF0hw==
X-Received: by 2002:a05:693c:829b:20b0:351:7883:bf47 with SMTP id 5a478bee46e88-369d8faf9a5mr4566186eec.0.1792749584914;
        Fri, 23 Oct 2026 02:59:44 -0700 (PDT)
X-Received: by 2002:a05:693c:829b:20b0:351:7883:bf47 with SMTP id 5a478bee46e88-369d8faf9a5mr4566138eec.0.1792749584342;
        Fri, 23 Oct 2026 02:59:44 -0700 (PDT)
Received: from [10.217.217.64] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea64sm7499288eec.5.2026.10.23.02.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:59:43 -0700 (PDT)
Message-ID: <01b1b1bd-2848-482e-af8b-8fab037c7a04@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 15:29:35 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/16] arm64: ras: Add probe/remove for arm64_ras
 driver
To: Ruidong Tian <tianruidong@linux.alibaba.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        zhuo.song@linux.alibaba.com, oliver.yang@linux.alibaba.com
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
 <20260602071540.3711528-3-tianruidong@linux.alibaba.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260602071540.3711528-3-tianruidong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb3012 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SRrdq9N9AAAA:8 a=49fVXzMj59YXLoLGRmgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfXybN94rN3czhO
 RC3HO8xzmyj7CQQXYEbmNWUDPn3MognK7WTlrohLzoH/wlZg9h/vT4MsM0ZgDDqlbBXeGZmbsUv
 4YKotiHuGFC6dKB7gSgxVV6+vJYtjYM=
X-Proofpoint-GUID: 7f5j7N3RZ4x77TqBsPzqKFXFKTZZ9vRJ
X-Proofpoint-ORIG-GUID: 7f5j7N3RZ4x77TqBsPzqKFXFKTZZ9vRJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX7KORQXhEcsQX
 tiIQZo+lOHxNxUMUqCG8tY6R5JXJpVgu4lja9mJLG31lxIJajgf/qHohvHyY20mOrwf7IlETkuP
 V94ZP2wu+P9KDmGFytn0I5EeudSYqelVgOJrEwaVeVzF0fdwhd8qmJNDwsZ5ewZe1HFn915A4aj
 yVsN4asCuTUIcjgb+/8q4bUybmLdmcEM5ZhY+12p/VTcfTUr3FmYbr3Ud1wNVxHA/A7RvQ9nEzG
 b87r4cFnVP0qti6FER0Ka6ONlfPiBRp8zh4HL3Yt8ohzxZT+fzy71jv91kSRRv/6ApLjaZmaR9t
 1Gbmv9eaGueADUTfteTgkID6mdBmCo1g7YRrJ6MlN7a8ir2Sk5c1riUxdbEJEBj6Bd2EIlrn/ZZ
 IWxobUZvev2zJLdtBNdOFms/LAJzBqa0/Ec8FdZmSopumG07D4bLA7gdWeDyIoMhuIvdPHpOA4D
 QRNsBxgKZLMhkX9liNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

Hello Ruidong,

On 6/2/2026 12:45 PM, Ruidong Tian wrote:
> Introduce the back-end platform driver that binds to the devices
> created by the AEST front-end. Driver input is taken exclusively from
> fwnode properties, so the same probe path serves any future front-end
> (DT, hand-rolled) without conditional code.
> 
> The probe builds two layers of state:
> 
>   - struct ras_node:   one AEST error source
>   - struct ras_record: one error record inside a node
> 
> This split mirrors the hardware: a node owns the shared MMIO/ERRGSR
> window and policy, while records are the unit at which errors are
> reported, masked and polled. Later patches plug interrupts, decoding,
> storm mitigation and userspace ABI onto these two objects without
> touching the front-end.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
> ---
[...]

> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_ARM64_RAS_DRIVER) 	+= arm64_ras.o
> +
> +arm64_ras-y		:= ras-core.o
> diff --git a/drivers/ras/arm64/ras-core.c b/drivers/ras/arm64/ras-core.c
> new file mode 100644
> index 000000000000..b5448f4a841f
> --- /dev/null
> +++ b/drivers/ras/arm64/ras-core.c
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ARM Error Source Table Support
> + *
> + * Copyright (c) 2025, Alibaba Group.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/ras.h>
> +
> +#include "ras.h"
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt) "arm64_ras: " fmt
> +
> +static const char *const ras_node_name[] = {
> +	[ACPI_AEST_PROCESSOR_ERROR_NODE] = "processor",
> +	[ACPI_AEST_MEMORY_ERROR_NODE] = "memory",
> +	[ACPI_AEST_SMMU_ERROR_NODE] = "smmu",
> +	[ACPI_AEST_VENDOR_ERROR_NODE] = "vendor",
> +	[ACPI_AEST_GIC_ERROR_NODE] = "gic",
> +	[ACPI_AEST_PCIE_ERROR_NODE] = "pcie",
> +	[ACPI_AEST_PROXY_ERROR_NODE] = "proxy",
> +};

Now that the ARM RAS core framework is shared by both ACPI and DT
platforms, should we consider dropping the "ACPI_AEST" naming in the
common code and replacing it with a more generic prefix maybe something
like "ARM_RAS" ?

[...]
> +
> +const struct ras_group ras_group_config[] = {
> +	[ACPI_AEST_NODE_GROUP_FORMAT_4K] = {
> +		.errgsr_num = ERXGROUP_4K_ERRGSR_NUM,
> +		.size = ERXGROUP_4K_SIZE,
> +		.errgsr_offset = ERXGROUP_4K_OFFSET,
> +	},
> +	[ACPI_AEST_NODE_GROUP_FORMAT_16K] = {
> +		.errgsr_num = ERXGROUP_16K_ERRGSR_NUM,
> +		.size = ERXGROUP_16K_SIZE,
> +		.errgsr_offset = ERXGROUP_16K_OFFSET,
> +	},
> +	[ACPI_AEST_NODE_GROUP_FORMAT_64K] = {
> +		.errgsr_num = ERXGROUP_64K_ERRGSR_NUM,
> +		.size = ERXGROUP_64K_SIZE,
> +		.errgsr_offset = ERXGROUP_64K_OFFSET,
> +	},
> +};
> +
Thanks,
Umang
