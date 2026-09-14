Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7A3439F7E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381891; cv=pass; b=f5MWGWZs2Q0UHEzm3whVx31cRk2TDLeF/7AYz4dGvdrTMIZkcknAsbEC0b30nno5d++DxIyWcm/FuqCFZFfAe8roj+S11sQ0ynlZS1ayRPkH2XJ38YF+aKkDXHgTrjEiCr0wPIgRC+5A5ggnqZ8aU7J/8LYzDgO8M7dfN/5sqo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381891; c=relaxed/simple;
	bh=mSW9evORFr4Evxx+NXu8peIQg02dm0NDFJMCeTfYFoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+/2W0p4e2tYfX2xYk0yWPTk9vXVsYuxQ1LJYpUZq7I7pEVdi8+cW6MQzGTHmnjL9SyE1dYZx4XPQnt/pLoWWAIwOdw6JDD+riqemlDGrRfOMe0BrsEJqffDkyRSJrRcnIb5NUpslVn2rLPLVDyPzk7I32/6HGAjYWx5vYgO9Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=et5+xSoq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WWOyVAqZ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="et5+xSoq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWOyVAqZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nfEQ1086135
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qcoqWqTxDsRFnEr69fW5ULWJ5nUfx2+e4yVyOPgR+xo=; b=et5+xSoq/ACGHePh
	k+fZIjtmNTy89zgkxM+HuK4ZvN/LCXEI1lBc0l/Zo75ZPnZUFfWtavv/8rjxTikJ
	z11dZF/Hb4zzIFzYG4u/aIRRXw0vV+rX/3vBlKb8WY8QUwvjq5Aj1DeY9ho3Nif3
	tmBnDa1S6GKXOvkKjhS/cb1oajY/IIYYnv1FoFAMeQgcYj+2UswGdNPwC6LUuTQ0
	aBWbQath4mdb/fwqQ/3pPOiGaq0fLTn9+siBjjnMqB8UssTh6XQs2YEkFjFzudGC
	KR5Siva4QtQOSMIsuCghWeOq0frVF2ge8x4c3t1FSjp0k5Gi32xYyVGOLCK4I+26
	Wvz00g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0a032-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:31:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc132709c76so4126486a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789381888; cv=none;
        d=google.com; s=arc-20260327;
        b=kLSSTumjVpChM7fzEIVHl3nt2gLdSt+Ot9yE3hIu90noD8p4Hy2TxehnBH0xe72lCa
         CRhQSQqfTw9geJ9dBEWbzzSNHftFsapN0BaHI5rpagiFZOhC1OLNcm/SiQ+JEA5vYn5X
         +HC+qNK7YFjBtZfH12nM/5tX5v2Lhikz9o9v12J0yocaIv7pymgXtn9KsPeUMIRy3np5
         k3rxU7ZADPcjeu6IglfNkgWnX3oU6JgCUM/pOz09CfVDSoHaXmC0yrlMaiMNTOttR1xG
         1ZeZvE4HTsXdtrl2qPbxW27OisQDW9Ej0KU3BC4dTeWjSkYj7cxf3qixtRweUWwOWQPr
         4nBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qcoqWqTxDsRFnEr69fW5ULWJ5nUfx2+e4yVyOPgR+xo=;
        fh=SFLEn4gp4a2ER2KN6rHgnsIFoPFh3ity5Ml+Wia83uw=;
        b=miIZsF2o77xUuovnx2U7F6ShPUSAsWBS+Qp8n4BTwFDY4yn60/EY7aE4Q246tSG4zi
         jSMA3JF6AZv7+DVemulfiaHD7danGWDV6x/MoB4aDTaVQ2/Pvw3qRwEoYOG8gp1irS5z
         3tCnrLQ0YLe6N6WOLvd5u/2Cm/OtrDQNFs9r5KhmQX6LKdZKg/ybGq5c1hNL4u4y5HjI
         xU/QZHQWTGSe7XTpcJ2u7mTg5uY/yvP2+k+Xeic6y0Wm+F0p+zdFDLsANgkb3Gc4i13G
         GB1kTTGPgQYycfB+BTjG2xEnzZnVwhDQx3xkFO+dGwBVL/TAw8Qsk3jvJunWK00Cxua1
         WtWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789381888; x=1789986688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qcoqWqTxDsRFnEr69fW5ULWJ5nUfx2+e4yVyOPgR+xo=;
        b=WWOyVAqZh3sWhHIBjUxM2lJrEppY5hKHfEQq5ib0ioehMyACUjaWmCrfksWOnYsVS/
         HIpTkivJnkPl25TSU73UGQmaniTsF4eyU/ahBbD5LLYbbavMnk2BYuLkUIe2OdpPOSBY
         XbQ8wjGM8FXtBRqJlHxLi4qKoDk05uhH+pS0SRBSC1Um/Ib3383jB150DxSHjsrmIb4t
         /huwyP+Os82i+d0wFnvZvX4PZtKKaU2ngbtxpth7N2sGqxkAJVM02bG66Zq9NTqO1pK+
         uvZo95aMocxXWPyLcHqZTV/QOyK21ApanYMFuLoU1cw37gvO20VkLxtDyeUZBFzPGFPb
         3qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381888; x=1789986688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qcoqWqTxDsRFnEr69fW5ULWJ5nUfx2+e4yVyOPgR+xo=;
        b=PknTnYdouiC6htPMiIHF3Zndvr+JAsm5tZRMy6bQnb8Kzp8NrCLaOLhP+qKNknMjKJ
         BQ39cWWzfj9XUi9vRdN/sGgLBj07dS0tFmZ8w5WlsxpxKIUHDFXxGn35HvBKxEqcPRP3
         ui/6qmcx7g+7Y7jjAmBkONJsPRsoCaY2Hvec7ZQW4yHXJfeLwaHjr/L9Ei84M0oTPEze
         b4e1c0/LP4jleVHqCKR3lZPWRW53+nW0QU9w1PuoWLCgZS+qcHDrbcX1xpdd+PAZ6OIh
         fVV3olCw0+uWBDeRuETzMbT22jIe7uRjafo3hPwIfVivSZNAy7w7kDJKqff/mTgATZjt
         nSTA==
X-Forwarded-Encrypted: i=1; AKwUvBwiKCdX9RL7czN2PmvX/U3gksSpcGkP1vSpU8nftvN347Rwdi00CUXl1KtJE8kjhYCVhGi5J8k9rwCfUYA=@vger.kernel.org
X-Gm-Message-State: AFuF++nFtdNDHkXcws82LQlOfzBIgBy7CrVy9mf8G/MxgSwRzwmyRwjt
	Ikbk5+BAWyYUTq38VNqZZXrQ/WXhSpegdcfpEHiSjMjpq+7XDHgN/7eGmq9Bj5+Lq1Spbm/KEXE
	DTGt8tSPJ/gbvOQ14OfFxmNV9yfJoaQ/aKCIm5jzRDVJQMP1dz3FAw/uPDqHecI5o20zu/ElbRU
	x9WWgFP5vCurITXrr0wPRMOQSuQDCT0r4Fwy8codmZm/0NJNurgLNB
X-Gm-Gg: AYBFou3tmLZ8tuUyXdrALCa2B9t2D7BZWVuGx4//94JwLvVtuBqjuq5FqJYZehVfUqy
	ZFPXxEeOlvXBxyO8W1E3nwAsMGZ1K4/e6p65Enh0VVBP4zHbWvvwRhRDotpnueyumyOu8YxYYec
	/p/3I4rvH0SMnEqs6xUwjGWGMXPLOHXR2R1L9uiSiMtTKrssshObDCEGmeag==
X-Received: by 2002:a05:6a20:258f:b0:398:8870:b58f with SMTP id adf61e73a8af0-3db40521dd1mr4431213637.14.1789381888127;
        Mon, 14 Sep 2026 03:31:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:258f:b0:398:8870:b58f with SMTP id
 adf61e73a8af0-3db40521dd1mr4431164637.14.1789381887642; Mon, 14 Sep 2026
 03:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912163810.848989-1-hjf3108@gmail.com>
In-Reply-To: <20260912163810.848989-1-hjf3108@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:31:16 +0200
X-Gm-Features: AcwNN1Uj-b0zu559y30uqphLYJrZnx1Nn3jvha6WXz3_ZpOYK6AfOeOS6m1wYt8
Message-ID: <CAPx+jO8MSY8P1R6ZbRF8C7Vb0zhmePhaDDzgi+BmC3uUdKqMfA@mail.gmail.com>
Subject: Re: [RFC PATCH] memstick: Add Broadcom BCM57765/BCM57785 host driver
To: Ho Jie Feng <hjf3108@gmail.com>
Cc: linux-mmc@vger.kernel.org, Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1MCBTYWx0ZWRfXzWEam8YKPrVC
 muN13YebYMUeYr9ubrellbOiOsyc4gJBQXUshEp3LXDLINgYOrA6rJj79a1akSM2T++9/n7QHvA
 cQ6fw2TuEAicwLAxeRtKQZwZWFHX3YA=
X-Proofpoint-GUID: 8ASuAh3p6iNN7LMkIuzzXcMr0iUQ3F97
X-Proofpoint-ORIG-GUID: 8ASuAh3p6iNN7LMkIuzzXcMr0iUQ3F97
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7cd00 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=NtkBfrexwdby28gpUdwA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1MCBTYWx0ZWRfXzdk8AboG7BW0
 qG9k/ELXRNrC8FtPLxGQ7lxfS2XE1rqzB1hi4ouYLkRI4NWScJcyvzb2qjNLU3gvL1HQMja+OdQ
 KJ9/SYIOael+KN0xb+RX2d31l7XG5HkU/R3P0ZF2EoMM9uKAokpZLwg6cMu75TZgLPD+797TYCy
 +kT48yvJnqO6492paOEAyJR9b1D7ouaIrTnvO8GzWyRcj4TRsxJAS56OPCoBGZP9RN+czkZY8W8
 m32tgGH3Dn5A2CiGz3Sbkd34bFk18oOf9aDW3d7TrJSBhRcmFKVXl9+2hgVC+VNwn4qZyp1lipq
 +ghazxXz7qzorK/nwN3O17hpmBh6hL9RNW+L2dsM5XOHtSLSXR1YiGT/dnmhCqRIXQWxxKEG+EO
 9Hgd+RjWZpvxIwu/u61GrNpVf1LEjs6wm3goYDwl3njmjHL+aeL9vKUTsml3eLHuWV5oggtPY78
 RakcU0P0AlVpDID8Tvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140150

On Sat, Sep 12, 2026 at 6:38=E2=80=AFPM Ho Jie Feng <hjf3108@gmail.com> wro=
te:
>
> Add support for the MemoryStick function of Broadcom BCM57765 and BCM5778=
5
> PCI card readers (14e4:16be).
>
> The driver is written by inspecting MMIO traces from the windows driver
> and experimentally probing the device registers.
>
> It was found that the controller exposes an SDHCI-like interface with
> TPC command handling. DMA mode was then inferred using the positions
> of the bits in sdhci.h.
>
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>

Wow! It's been a while since we received new drivers from memstick controll=
ers!

Overall this looks good to me, but I have few minor comments, see below.

> ---
>  MAINTAINERS                         |   6 +
>  drivers/memstick/host/Kconfig       |  10 +
>  drivers/memstick/host/Makefile      |   1 +
>  drivers/memstick/host/bcm577x5_ms.c | 754 ++++++++++++++++++++++++++++
>  drivers/memstick/host/bcm577x5_ms.h | 138 +++++
>  5 files changed, 909 insertions(+)
>  create mode 100644 drivers/memstick/host/bcm577x5_ms.c
>  create mode 100644 drivers/memstick/host/bcm577x5_ms.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 978fe6999d3b3..20faa8c2b1bcc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5234,6 +5234,12 @@ S:       Maintained
>  F:     arch/arm/boot/dts/broadcom/bcm47189*
>  F:     arch/arm/boot/dts/broadcom/bcm53573*
>
> +BROADCOM BCM57765/BCM57785 MEMORYSTICK DRIVER
> +M:     Ho Jie Feng <hjf3108@gmail.com>
> +L:     linux-mmc@vger.kernel.org
> +S:     Maintained
> +F:     drivers/memstick/host/bcm577x5_ms.*
> +
>  BROADCOM BCM63XX/BCM33XX UDC DRIVER
>  M:     Kevin Cernekee <cernekee@gmail.com>
>  L:     linux-usb@vger.kernel.org
> diff --git a/drivers/memstick/host/Kconfig b/drivers/memstick/host/Kconfi=
g
> index fcd2c2cc3cb47..f9b18f0d85513 100644
> --- a/drivers/memstick/host/Kconfig
> +++ b/drivers/memstick/host/Kconfig
> @@ -53,3 +53,13 @@ config MEMSTICK_REALTEK_USB
>
>           To compile this driver as a module, choose M here: the module w=
ill
>           be called rts5139_ms.
> +
> +config MEMSTICK_BCM577X5
> +       tristate "Broadcom BCM57765/BCM57785 MemoryStick interface suppor=
t"
> +       depends on PCI
> +       help
> +         Say Y here if you want to access MemoryStick cards with the
> +         Broadcom BCM57765/BCM57785 PCI card reader (14e4:16be).
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called bcm577x5_ms.
> diff --git a/drivers/memstick/host/Makefile b/drivers/memstick/host/Makef=
ile
> index 0c90df33165de..8eafb70b26706 100644
> --- a/drivers/memstick/host/Makefile
> +++ b/drivers/memstick/host/Makefile
> @@ -7,3 +7,4 @@ obj-$(CONFIG_MEMSTICK_TIFM_MS)          +=3D tifm_ms.o
>  obj-$(CONFIG_MEMSTICK_JMICRON_38X)     +=3D jmb38x_ms.o
>  obj-$(CONFIG_MEMSTICK_R592)            +=3D r592.o
>  obj-$(CONFIG_MEMSTICK_REALTEK_USB)     +=3D rtsx_usb_ms.o
> +obj-$(CONFIG_MEMSTICK_BCM577X5)                +=3D bcm577x5_ms.o
> diff --git a/drivers/memstick/host/bcm577x5_ms.c b/drivers/memstick/host/=
bcm577x5_ms.c
> new file mode 100644
> index 0000000000000..81824fb4e9a82
> --- /dev/null
> +++ b/drivers/memstick/host/bcm577x5_ms.c
> @@ -0,0 +1,754 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/align.h>
> +#include <linux/bits.h>
> +#include <linux/completion.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/jiffies.h>
> +#include <linux/memstick.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>
> +#include <linux/pci_ids.h>
> +#include <linux/pm.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#include "bcm577x5_ms.h"
> +
> +#define DRV_NAME "bcm577x5_ms"
> +
> +static int enable_dma =3D 2;
> +module_param(enable_dma, int, 0444);
> +MODULE_PARM_DESC(enable_dma,
> +                "Enable usage of the DMA (0 =3D no, 1 =3D yes, 2 =3D aut=
o,default)");

I assume this is useful because the DMA functionality is a bit flaky, no?

In any case, I would rather not use a module parameter for this, can
you please drop this. If needed at all, can we perhaps use a debugfs
file instead to switch dynamically?

> +
> +static const struct pci_device_id bcm577x5_pci_id_tbl[] =3D {
> +       {
> +               PCI_VDEVICE(BROADCOM, 0x16be),
> +       },
> +       {},
> +};

[...]

> +
> +static int bcm577x5_reg_waitb(struct bcm577x5_device *dev, int address, =
u8 mask,
> +                             u8 value, int timeout)
> +{
> +       unsigned long wait_time =3D jiffies + msecs_to_jiffies(timeout);
> +       u8 reg;
> +
> +       do {
> +               reg =3D bcm577x5_reg_readb(dev, address);
> +               if ((reg & mask) =3D=3D value)
> +                       return 0;
> +
> +               cpu_relax();
> +
> +       } while (time_before(jiffies, wait_time));

Please avoid the open coding and convert to the io polling helpers
instead (iopoll.h).

> +
> +       return -ETIME;
> +}
> +
> +static int bcm577x5_reg_waitl_different(struct bcm577x5_device *dev,
> +                                       int address, u32 value, int timeo=
ut)
> +{
> +       unsigned long wait_time =3D jiffies + msecs_to_jiffies(timeout);
> +       u32 reg;
> +
> +       do {
> +               reg =3D bcm577x5_reg_readl(dev, address);
> +               if (reg !=3D value)
> +                       return 0;
> +
> +               cpu_relax();
> +
> +       } while (time_before(jiffies, wait_time));

Ditto.

> +
> +       return -ETIMEDOUT;
> +}
> +

[...]

Kind regards
Uffe
