Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794652867;
	b=PuYMt8g+jKoFCsY65/AITTURRJLz09zwLTtfVGGwFH8RaHzdjCcqlv4JLt52Uqtu/i6P
	 F29L8NHn81rxY7Kry7EC6uzlEkJ9lW9EwcMzIoU3tDQkemJdBRk3sn9JQ702YzUT+hCSD
	 cHKb8dhjXO15sPjNKNj8WlWaftcQ/VBfZ+xl0lYyePVv3TTjMf4W5NWFePRh2JlPshpGb
	 fhOOT2/K4eeeVJnlXDCE1cBTiy3lfIg4XaO31lwNJmGDFgNaA770nmOLWg0mX58ulHQ8p
	 33YDbnP392Z0UUnzYpnZFQ63m9ziMNWTGCP8+B3L1VWnxYmzfOw1s7mW4/jZoNL3xaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794652867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P9/cz1IPqslzTuhGV/fg0rokRPc6M/9rN+7xX5cdjGE=;
	b=l4Bz5222/pP2BPv0tvaSyNnkRMzxLAUkSPKScsL6+YGI20JiHCf1dIBespkmLcu6RJCy
	 CwKJDUFOfDMt9c0JiTySKLfPCnPvLi7ONCSFW9149eHdxNs7IRZT4OvTsiqrw4uG/Jec+
	 uehxbf0aKDb8G5JHZ8eOaMlQtgB9WBnIsB6DLzzk5mi6hFAXXcK0KO7Dpcak1FG46P6pr
	 LRHqoeV6GC0tpSnsRMbXGWtSvD0JBB4gFAl5C5Ca07FLcsFSMJgWssGwtIq+fF5UhudYk
	 zeUM6+uC6TZjEGGbdk2tqp/tM3i+MIt318IVi9ba3cMnqNT3mpIJkFx7nMcYgOwgNQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+EiilmK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mh6lDIWJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D06606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D06606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+EiilmK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mh6lDIWJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w9R0464638
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9/cz1IPqslzTuhGV/fg0rokRPc6M/9rN+7xX5cdjGE=; b=O+EiilmKR/Xj0U0X
	Wu5YbGLRpXVLgI1P2jFrxsXBneWrNq1cgE56xGn+Wy35ZwZFJ0qDvOPjCZhhTaQw
	ubeo5GrddjVdEUIAizY02thEZ8OsAL9yyTdH7VjuXiC/BB3yUfrMSKIwOxAUiv8u
	OSsyxThUjbIo5YCUt/5ag8clTNI+iChD5H2876V5gvsE5KEp0pR1C0rPd8GhlMfQ
	feZOmPe6vuQrQyIxx8yrhles/4d9SE6Qc4OTIh5uBC82ZhUqkYxBUWqgFoM13rRf
	EttXYSn4N/VALl6/vBzziz2SIqkFjUUD25jDH9KPpT+CNp8eG6fqjek/T6dxDar7
	XqxXxQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdrhu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:41:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0f667a666so2550481a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:41:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794652865; cv=none;
        d=google.com; s=arc-20260327;
        b=d2UvOq++ZPMpemr73vo8VKaNPIPZsNfpVPAF/ELJc3tHsGPMktpBXEL/zVf/SIJcLS
         s+Md0J/0mgBLebzBKG/gx01fQa8ZAAbKugZYNYHzRxCk2efioqDFRX7Xnp4PZjc+qv4o
         BqxweT2P/APGxRJCY6xvH3jtuo1dr8aaS+MFd3lo2PT5CHVuXX+3b8x9OfiZV2pPrQAZ
         jx7M52y3eBFfAagU/7VhvsvISNTF3pbTlfXDv12YmnPnkG6Fv0kMs2ER0267Sk7vsDLM
         L18nsfGKO3MpRLaQ5rrOXBhJsrPMgIGcso31OHo74e66sRbEewFP8SXfBi6cHsb6yfL9
         Cx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P9/cz1IPqslzTuhGV/fg0rokRPc6M/9rN+7xX5cdjGE=;
        fh=ijVHgeHCpiQyx0Cj66sDM6GDtB5mRTnPtJKHqJsArwA=;
        b=Kb8bFo8I+3mXVroKHxdmULkb0NtLgTKW3Tv22VYm/Nol+y7GyYtWRYY358O983dcy2
         Xo8u50ZS6pXTIbzODk9nVn7eWo0tCJ5ndN05h86FNdasLXfA1iArDctaThp5VlOL0G1d
         lInuGv48/APXmvpZW1ZFuGUmv2QfXxq1n5UnR1G8DwgpZak6ZU3MU/QjiWq1mtvK6ZE1
         ivYOiv8AEaEg0bWBaSG7h28YuGwQt9wcoBM48D6KQxwt3ZIVZ2jW2gKqOe6yFxB53mPI
         pUNAsqk5WHwX+Q8z0MdSxb1SmOAwgoKYlATH/39MZQOC8Wp8Ka0Ns6lN2/hN8vpCKmLA
         Q9mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794652865; x=1795257665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P9/cz1IPqslzTuhGV/fg0rokRPc6M/9rN+7xX5cdjGE=;
        b=Mh6lDIWJPO7nL5lBvFgbK1bM4Y5SnUWDyBQYtHPgLbulxt68phnqaFoei/khs5EQCE
         i/qK/4C5X7vuO5q50bCAuhRppeAU4oAtBj19ipuYp51DuHSrwBPzt17191f14QKlA5WW
         wBUtZMrpfZth+1Uh7u/LGY42Ey0EsJwo8O0ZC6ko/mFbFXR6quj+YTYBgr7bXggi5HWT
         MqBBEZwmepWk5/uYNAo821445zePhacWFRAbOQqGA1+vmjlNitD30fvttMKiU/zgC+RF
         VsFK4LZ7s1bxro8SgoIb+TPnlBEbBpknq6NDIEXv70+5HYVfCngFRXsVPrC3mpDCbLfJ
         xMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652865; x=1795257665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9/cz1IPqslzTuhGV/fg0rokRPc6M/9rN+7xX5cdjGE=;
        b=JlpQ8htBRFzMd2N+HwkzGC0YRt8pJA4pQux5foJT6ERJ6k7RnE6UwbKHFgUmsLCYJr
         HebsCqAEj1l6ym8UwK5okLruUJeBGCpRSBIyT6H/7CGpMQlKTP6BBeQpTjGiIaRpOZm+
         AEp9YTvovZyiLNwEX6HZ1CF/Rkyh0kzCOP/l/R82F4Zfocp+V3Ujm0TENjpwxGzVq/dV
         UbNPskEvo4LD7B2eUcsvN7uPtThrrzBdjv39lNrzdshI2IIPCChVC06iLM8DjbIuzFRR
         x8w3YFIWTH2lsdYiKmLvd8mDkuS1mG6SK02Rcp9qrCzN7iMxslnQkoF+XH44Ud0xwlbV
         DUyQ==
X-Forwarded-Encrypted: i=1; AL+hErGI/AwlpWCwN2iYiSheF1rlBXZG4iUla/p4yl2W3YVNcOxgZS52vAWWZlAXUgXF6UY8nj8ywk85Gm2pUEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RntewQGcMADfD6QkKJjJxylcyR0DiKwKvlJ99ubdzdcIBKNpt
	wqHpShadbvDE4jWrZ5FE46msvDgYAn+N9VhtNww90eF1RSsT5/CewODuJSFq3ltCG4pNEigcbDG
	Ik0jye3ccYa2pI7JiD9EMxAiCbXMDLgfLXIlv8Q+/veITj56FUaK2Nk8iWDsXdkqdrEce/FSPus
	L7UZNeiK6OilYN6FdknCakzYVyzQ/ErHSUQ7J3pvpm+Q==
X-Gm-Gg: AYBFou0RfKibDG6N2cqsr0fvGU51bBxQNPXvmI7bE/gyc6qkTXc5svQ6Gyn4pGwBEHs
	7bD1Q75j29hhhvdyInZJvhg+sco8KpqOcyND7sFXXhgKbqx4gC8ajKbLlpFAIfVHF7cMnhpu9Jl
	NpNCbfj/Gmh35Llok3LdxbvnSvCyIL0SURhbC8m6uVGL7o+cSOqVKpU0uvqg==
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b1b09e5cb0mr4905751a91.17.1794652865109;
        Sat, 14 Nov 2026 02:41:05 -0800 (PST)
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id
 98e67ed59e1d1-3b1b09e5cb0mr4905738a91.17.1794652864649; Sat, 14 Nov 2026
 02:41:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com> <20261104145502.2.I59b2ea87f07947037b772c49c277092c887f4310@changeid>
In-Reply-To: <20261104145502.2.I59b2ea87f07947037b772c49c277092c887f4310@changeid>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 11:40:52 +0100
X-Gm-Features: AclHuK-b_isk46W-WvgZ209_oTtCfQat8eiMOwnesXkd1lptXQ-43pZaayeQKAk
Message-ID: <CAPx+jO8_gCHgkeTB4aQDRjs1xwvXCB=zFjFBHB_UwqeOWSUEZQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] pmdomain: st: add STM32MP power domain
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6af83ac1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=8b9GpE9nAAAA:8 a=SRIYwMtUNH451uaLisIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0MiBTYWx0ZWRfX6gAGxQ6wUCH2
 doPgk21Vtar5M82NsQFdZ1h2isMIr0bHyrwfmvMWNfbMMnflBrgWNrzQ1HjdBrZXwqWnr6wt/Nv
 +4mtKSwOe7sQ7LfN22M4O7wufNiXzUI=
X-Proofpoint-ORIG-GUID: 3YKuUptxK331CqkWRRZKgIrR3dKLrKpZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0MiBTYWx0ZWRfX6WAHiVEPE9RX
 SYrC6JUCUXHmSUoeiEhtWvm+1fKZ/oyf5KDow8bs34o70NT2Uj1j3IBOlttP48wyc1owb4kODGR
 yYdOiYyz3gP/n8nMDuvpOWFYuaW/uvR+OTogxVuT+nRY42Xq+X/dSCnwD4SvVtrq1wIRdcSK5oZ
 mEf8gE4uSlWTlpvbiDUGSm2VS74cfP4G6IkUAOCS+bpYTP/GpHNTDn8PmY+zu4TcGjZfi2Xdj7v
 ZYofHSNZAQX2yw8mc3v7yHeqimpE+DNrL18RPU52jOrepenOo4CmnuSwTm9mdn3x9ACZlDAGVTS
 3hyMJBcK2aOXRQdbW9s/WFWGgVEyFSY7b+2si3gJemb5QzrJg+IAYyXg8HMQj5dN6EwFFHzyNo6
 YcHBMDuMtg75obTnWRUGuQzczEmSAfvS2ohtUa7yNy03Mh3M3HCBDmLVEBRwxuPEkUuNZITNwQJ
 +VMBTi2mc+oP8IyaACQ==
X-Proofpoint-GUID: 3YKuUptxK331CqkWRRZKgIrR3dKLrKpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140042

On Wed, Nov 4, 2026 at 3:02=E2=80=AFPM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Add a generic PM domain for the STM32MP D1 domain, using the PM
> framework to manage attached devices.
>
> Make D1 a subdomain of the PSCI cluster domain, so active devices keep
> the Cortex-A35 cluster in Run1. Do not set GENPD_FLAG_ACTIVE_WAKEUP on
> D1: system wakeups are handled by EXTI1 through the RET_PD PSCI domain.

Would you mind elaborating on the system wakeups a bit more?

The devices that get attached to the D1 PM domain do they have another
PM domain as well, to support the system wakeups?

Just trying to make sure this gets modeled correctly.

One comment in the code below.

>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/pmdomain/st/Kconfig             |  14 +++
>  drivers/pmdomain/st/Makefile            |   1 +
>  drivers/pmdomain/st/stm32mp-pm-domain.c | 128 ++++++++++++++++++++++++
>  3 files changed, 143 insertions(+)
>  create mode 100644 drivers/pmdomain/st/stm32mp-pm-domain.c
>
> diff --git a/drivers/pmdomain/st/Kconfig b/drivers/pmdomain/st/Kconfig
> index a77a70211f61..da8a54d44158 100644
> --- a/drivers/pmdomain/st/Kconfig
> +++ b/drivers/pmdomain/st/Kconfig
> @@ -1,4 +1,18 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +
> +config STM32MP_PM_DOMAIN
> +       tristate "STM32MP PM domain"
> +       depends on ARCH_STM32 || COMPILE_TEST
> +       select PM_GENERIC_DOMAINS
> +       default y
> +       help
> +         Enable support for the STM32MP Power Management (PM) domain dri=
ver.
> +         This driver implements a generic PM domain for STM32MP SoCs, al=
lowing
> +         the kernel to manage power domains for various hardware blocks =
using
> +         the generic power management framework. It is typically used to
> +         control the power state of devices and peripherals on STM32MP
> +         platforms. If unsure, say Y.
> +
>  config UX500_PM_DOMAIN
>         bool "ST-Ericsson ux500 Power Domain"
>         depends on ARCH_U8500 || COMPILE_TEST
> diff --git a/drivers/pmdomain/st/Makefile b/drivers/pmdomain/st/Makefile
> index 6d8b617eb834..0e8131b7fe9d 100644
> --- a/drivers/pmdomain/st/Makefile
> +++ b/drivers/pmdomain/st/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_STM32MP_PM_DOMAIN)                +=3D stm32mp-pm-domain.o
>  obj-$(CONFIG_UX500_PM_DOMAIN)          +=3D ste-ux500-pm-domain.o
> diff --git a/drivers/pmdomain/st/stm32mp-pm-domain.c b/drivers/pmdomain/s=
t/stm32mp-pm-domain.c
> new file mode 100644
> index 000000000000..1a6393840f56
> --- /dev/null
> +++ b/drivers/pmdomain/st/stm32mp-pm-domain.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Implements PM domain using the generic PM domain for STM32MP SoC.
> + *
> + * Copyright (C) STMicroelectronics 2026
> + * Author(s): Patrick Delaunay <patrick.delaunay@foss.st.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +
> +struct stm32mp_pm_subdomain_link {
> +       struct generic_pm_domain *domain;
> +       struct generic_pm_domain *subdomain;
> +};
> +
> +static void stm32mp_pm_domain_genpd_remove(void *data)
> +{
> +       struct generic_pm_domain *genpd =3D data;
> +
> +       pm_genpd_remove(genpd);
> +}
> +
> +static void stm32mp_pm_domain_release_subdomain(void *data)
> +{
> +       struct stm32mp_pm_subdomain_link *link =3D data;
> +
> +       pm_genpd_remove_subdomain(link->domain, link->subdomain);
> +}
> +
> +static void stm32mp_pm_domain_release_genpd_provider(void *data)
> +{
> +       struct device_node *np =3D data;
> +
> +       of_genpd_del_provider(np);
> +}
> +
> +static int stm32mp_pm_domain_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       struct generic_pm_domain *pd;
> +       struct stm32mp_pm_subdomain_link *link;
> +       int ret;
> +
> +       if (!np)
> +               return -ENODEV;
> +
> +       /* The OF node must specify us as a power-domain provider. */
> +       if (!of_property_present(np, "#power-domain-cells")) {
> +               dev_warn(dev, "%pOF lacks #power-domain-cells\n", np);
> +               return 0;
> +       }
> +
> +       pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> +       if (!pd)
> +               return -ENOMEM;
> +
> +       pd->name =3D dev_name(dev);
> +
> +       /*
> +        * Domain based only on PM clk framework, no GENPD_FLAG_ACTIVE_WA=
KEUP
> +        * support, the wake-up path is handled by interrupt driver with =
its
> +        * power domain. GENPD_FLAG_NO_STAY_ON as domain no required sync=
 state,
> +        * domain allow low power modes even if devices are not probed
> +        */
> +       pd->flags =3D GENPD_FLAG_PM_CLK | GENPD_FLAG_IRQ_SAFE | GENPD_FLA=
G_NO_STAY_ON;
> +
> +       ret =3D pm_genpd_init(pd, NULL, false);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to init power doma=
in\n");
> +
> +       ret =3D devm_add_action_or_reset(dev, stm32mp_pm_domain_genpd_rem=
ove, pd);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add action\n");
> +
> +       link =3D devm_kzalloc(dev, sizeof(*link), GFP_KERNEL);
> +       if (!link)
> +               return -ENOMEM;
> +       link->domain =3D pd_to_genpd(dev->pm_domain);
> +       link->subdomain =3D pd;
> +
> +       ret =3D pm_genpd_add_subdomain(link->domain, link->subdomain);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add subdomain\n=
");
> +
> +       ret =3D devm_add_action_or_reset(dev, stm32mp_pm_domain_release_s=
ubdomain, link);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add action\n");
> +
> +       ret =3D of_genpd_add_provider_simple(np, pd);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add power domai=
n provider\n");
> +
> +       ret =3D devm_add_action_or_reset(dev, stm32mp_pm_domain_release_g=
enpd_provider, np);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add action\n");
> +
> +       ret =3D devm_pm_runtime_enable(dev);

What is this used for?

> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to enable pm-runti=
me\n");
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id stm32mp_pm_domain_matches[] =3D {
> +       { .compatible =3D "st,stm32mp-pm-domain", },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, stm32mp_pm_domain_matches);
> +
> +static struct platform_driver stm32mp_pm_domain_driver =3D {
> +       .driver =3D {
> +               .name =3D "stm32mp_pm_domain",
> +               .of_match_table =3D stm32mp_pm_domain_matches,
> +       },
> +       .probe  =3D stm32mp_pm_domain_probe,
> +};
> +
> +module_platform_driver(stm32mp_pm_domain_driver);
> +
> +MODULE_AUTHOR("Patrick Delaunay <patrick.delaunay@foss.st.com>");
> +MODULE_DESCRIPTION("ST STM32MP power domain driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>

Kind regards
Uffe
