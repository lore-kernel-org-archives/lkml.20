Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC9F3CF200
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439796; cv=none; b=SnIIZZMcCkR8wQ03BqvY7Ew+sWQSHvfZnixs/IkPsZPRFaqR2Jn8JeHArUzETD9H3K2waJh+6qHHFUBr2slXH5EZYu+ewmqUdU3lv3dL8KdyriaHQJCpS/wZ1gmFLxExHLLSp4SadTnj3KgyfIVGoYKN1SDaWWk8LLByn9QpWDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439796; c=relaxed/simple;
	bh=tciJrUYHEO/tApj9QIQhrkPvTQ/yMljKuplCAW2wUnk=;
	h=To:Mime-Version:Subject:Date:Message-Id:References:Cc:From:
	 Content-Type:In-Reply-To; b=CcO9TN+06udIbbaf+3E/ZwJpz+D8NyBQHkhc4gc7PmqEJcTjvMMatae+HkMUVcfU1r0f9J6rF+zv0UUV+m+sF9frFbokvCF0uPTPK/hsPUTfKfDzHpqdAWhLfl8Qxs3UXjXUcs/5ZT3I6mxPupdAWKR8b2kj8Vg2ySpgEDki/z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=G5D5Em+i; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="G5D5Em+i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789439781; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=KLaSh2f9bN40SzV6SwFBasYFV2KpP5m+iFBAhe2VTsc=;
 b=G5D5Em+iVsdyFdY6ayGuFgDy9Evsi3UjtdRGX86McJ4D9AVCN/yqN18EkuisLAMd9ja8w3
 7VTt8KyRd7klziJGxdTzcfcZHdWT9SGC6mHRSZYm2WvJ3fPcqITsppTjilTgM5cJHrs3rG
 qvCNuf0D9P6k3j4JBNtx+YI5xBvsO7fx+BEpubzb09WgvXYokiNswXu69lbhw0hkPXg9Za
 ow6Y462ec/UANtVtGpBlHnFBQGgecgh5RopviHl0NQwD/TTIy6Ihedn9zfiCf6c80b2hsH
 2fyDoc8dl3aCNdvRmpCKXLiMpZu0EU1+U5W2+41ARJBNdhF46046GdXghW0Sew==
To: "Himanshu Chauhan" <himanshu.chauhan@oss.qualcomm.com>, 
	<linux-riscv@lists.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: Re: [PATCH v6 1/5] riscv: Introduce support for hardware break/watchpoints
Date: Tue, 15 Sep 2026 10:36:01 +0800
Message-Id: <fc4e18e7-a3f2-4fa5-9be0-284f24ef5661@bytedance.com>
Content-Transfer-Encoding: quoted-printable
X-Original-From: Rui Qi <qirui.001@bytedance.com>
User-Agent: Mozilla Thunderbird
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com> <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
Cc: <qingfang.deng@linux.dev>, <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, 
	<palmer@dabbelt.com>, <pjw@kernel.org>, <shuah@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <thecharlesjenkins@gmail.com>, 
	<jtaubepe@redhat.com>
From: "Rui Qi" <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26aa8af23+e4fc47+vger.kernel.org+qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>

On 8/3/26 9:49 PM, Himanshu Chauhan wrote:
> RISC-V hardware breakpoint framework is built on top of perf subsystem
> and uses SBI debug trigger extension to
> install/uninstall/update/enable/disable hardware triggers as specified
> in Sdtrig ISA extension.
>=20
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> ---
>  arch/riscv/Kconfig                     |   1 +
>  arch/riscv/include/asm/hw_breakpoint.h | 289 +++++++++++
>  arch/riscv/include/asm/kdebug.h        |   3 +-
>  arch/riscv/kernel/Makefile             |   1 +
>  arch/riscv/kernel/hw_breakpoint.c      | 678 +++++++++++++++++++++++++
>  arch/riscv/kernel/traps.c              |   6 +
>  6 files changed, 977 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
>  create mode 100644 arch/riscv/kernel/hw_breakpoint.c
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f7028caaeae0..a624dacdaf12 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -172,6 +172,7 @@ config RISCV
>  	select HAVE_FUNCTION_ERROR_INJECTION
>  	select HAVE_GCC_PLUGINS
>  	select HAVE_GENERIC_VDSO if MMU
> +	select HAVE_HW_BREAKPOINT if PERF_EVENTS
>  	select HAVE_IRQ_TIME_ACCOUNTING
>  	select HAVE_KERNEL_BZIP2 if !EFI_ZBOOT
>  	select HAVE_KERNEL_GZIP if !EFI_ZBOOT
> diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/=
asm/hw_breakpoint.h
> new file mode 100644
> index 000000000000..4df1bfe0507e
> --- /dev/null
> +++ b/arch/riscv/include/asm/hw_breakpoint.h
> @@ -0,0 +1,289 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 Qualcomm Technologies, Inc.
> + */
> +
> +#ifndef __RISCV_HW_BREAKPOINT_H
> +#define __RISCV_HW_BREAKPOINT_H
> +
> +struct task_struct;
> +
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +
> +#include <uapi/linux/hw_breakpoint.h>
> +
> +/* Maximum number of hardware breakpoints supported */
> +#define RISCV_HW_BP_NUM_MAX 32
> +
> +#if __riscv_xlen =3D=3D 64
> +#define cpu_to_le cpu_to_le64
> +#define le_to_cpu le64_to_cpu
> +#elif __riscv_xlen =3D=3D 32
> +#define cpu_to_le cpu_to_le32
> +#define le_to_cpu le32_to_cpu
> +#else
> +#error "Unexpected __riscv_xlen"
> +#endif
> +
> +#define CLEAR_DBTR_BIT(_target, _bit)	((_target) &=3D ~BIT(_bit))
> +#define SET_DBTR_BIT(_target, _bit)	((_target) |=3D BIT(_bit))
> +
> +#define RISCV_DBTR_EXEC		BIT(0)
> +#define RISCV_DBTR_LOAD		BIT(1)
> +#define RISCV_DBTR_STORE	BIT(2)
> +#define RISCV_DBTR_LDST		(RISCV_DBTR_LOAD | RISCV_DBTR_STORE)
> +
> +enum {
> +	RISCV_DBTR_TRIG_NONE =3D 0,
> +	RISCV_DBTR_TRIG_LEGACY,
> +	RISCV_DBTR_TRIG_MCONTROL,
> +	RISCV_DBTR_TRIG_ICOUNT,
> +	RISCV_DBTR_TRIG_ITRIGGER,
> +	RISCV_DBTR_TRIG_ETRIGGER,
> +	RISCV_DBTR_TRIG_MCONTROL6,
> +};
> +
> +/* Trigger Data 1 */
> +#define RISCV_DBTR_TDATA1_DATA_BIT	0
> +#if __riscv_xlen =3D=3D 64
> +#define RISCV_DBTR_TDATA1_DMODE_BIT	59
> +#define RISCV_DBTR_TDATA1_TYPE_BIT	60
> +#elif __riscv_xlen =3D=3D 32
> +#define RISCV_DBTR_TDATA1_DMODE_BIT	27
> +#define RISCV_DBTR_TDATA1_TYPE_BIT	28
> +#else
> +#error "Unknown __riscv_xlen"
> +#endif
> +
> +#if __riscv_xlen =3D=3D 64
> +#define RISCV_DBTR_TDATA1_DATA_BIT_MASK		GENMASK(58, RISCV_DBTR_TDATA1_D=
ATA_BIT)
> +#elif __riscv_xlen =3D=3D 32
> +#define RISCV_DBTR_TDATA1_DATA_BIT_MASK		GENMASK(26, RISCV_DBTR_TDATA1_D=
ATA_BIT)
> +#else
> +#error "Unknown __riscv_xlen"
> +#endif
> +#define RISCV_DBTR_TDATA1_DMODE_BIT_MASK	BIT(RISCV_DBTR_TDATA1_DMODE_BIT=
)
> +#define RISCV_DBTR_TDATA1_TYPE_BIT_MASK		\
> +	GENMASK(RISCV_DBTR_TDATA1_TYPE_BIT + 3, RISCV_DBTR_TDATA1_TYPE_BIT)
> +
> +/* MC - Match Control Type Register */
> +#define RISCV_DBTR_MC_LOAD_BIT		0
> +#define RISCV_DBTR_MC_STORE_BIT		1
> +#define RISCV_DBTR_MC_EXEC_BIT		2
> +#define RISCV_DBTR_MC_U_BIT		3
> +#define RISCV_DBTR_MC_S_BIT		4
> +#define RISCV_DBTR_MC_RES2_BIT		5
> +#define RISCV_DBTR_MC_M_BIT		6
> +#define RISCV_DBTR_MC_MATCH_BIT		7
> +#define RISCV_DBTR_MC_CHAIN_BIT		11
> +#define RISCV_DBTR_MC_ACTION_BIT	12
> +#define RISCV_DBTR_MC_SIZELO_BIT	16
> +#define RISCV_DBTR_MC_TIMING_BIT	18
> +#define RISCV_DBTR_MC_SELECT_BIT	19
> +#define RISCV_DBTR_MC_HIT_BIT		20
> +#if __riscv_xlen >=3D 64
> +#define RISCV_DBTR_MC_SIZEHI_BIT	21
> +#endif
> +#if __riscv_xlen =3D=3D 64
> +#define RISCV_DBTR_MC_MASKMAX_BIT	53
> +#define RISCV_DBTR_MC_DMODE_BIT		59
> +#define RISCV_DBTR_MC_TYPE_BIT		60
> +#elif __riscv_xlen =3D=3D 32
> +#define RISCV_DBTR_MC_MASKMAX_BIT	21
> +#define RISCV_DBTR_MC_DMODE_BIT		27
> +#define RISCV_DBTR_MC_TYPE_BIT		28
> +#else
> +#error "Unknown riscv xlen"
> +#endif
> +
> +#define RISCV_DBTR_MC_LOAD_BIT_MASK	BIT(RISCV_DBTR_MC_LOAD_BIT)
> +#define RISCV_DBTR_MC_STORE_BIT_MASK	BIT(RISCV_DBTR_MC_STORE_BIT)
> +#define RISCV_DBTR_MC_EXEC_BIT_MASK	BIT(RISCV_DBTR_MC_EXEC_BIT)
> +#define RISCV_DBTR_MC_U_BIT_MASK	BIT(RISCV_DBTR_MC_U_BIT)
> +#define RISCV_DBTR_MC_S_BIT_MASK	BIT(RISCV_DBTR_MC_S_BIT)
> +#define RISCV_DBTR_MC_RES2_BIT_MASK	BIT(RISCV_DBTR_MC_RES2_BIT)
> +#define RISCV_DBTR_MC_M_BIT_MASK	BIT(RISCV_DBTR_MC_M_BIT)
> +#define RISCV_DBTR_MC_MATCH_BIT_MASK	\
> +	GENMASK(RISCV_DBTR_MC_MATCH_BIT + 3, RISCV_DBTR_MC_MATCH_BIT)
> +#define RISCV_DBTR_MC_CHAIN_BIT_MASK	BIT(RISCV_DBTR_MC_CHAIN_BIT)
> +#define RISCV_DBTR_MC_ACTION_BIT_MASK	\
> +	GENMASK(RISCV_DBTR_MC_ACTION_BIT + 3, RISCV_DBTR_MC_ACTION_BIT)
> +#define RISCV_DBTR_MC_SIZELO_BIT_MASK	\
> +	GENMASK(RISCV_DBTR_MC_SIZELO_BIT + 1, RISCV_DBTR_MC_SIZELO_BIT)
> +#define RISCV_DBTR_MC_TIMING_BIT_MASK	BIT(RISCV_DBTR_MC_TIMING_BIT)
> +#define RISCV_DBTR_MC_SELECT_BIT_MASK	BIT(RISCV_DBTR_MC_SELECT_BIT)
> +#define RISCV_DBTR_MC_HIT_BIT_MASK	BIT(RISCV_DBTR_MC_HIT_BIT)
> +#if __riscv_xlen >=3D 64
> +#define RISCV_DBTR_MC_SIZEHI_BIT_MASK	\
> +	GENMASK(RISCV_DBTR_MC_SIZEHI_BIT + 1, RISCV_DBTR_MC_SIZEHI_BIT)
> +#endif
> +#define RISCV_DBTR_MC_MASKMAX_BIT_MASK	\
> +	GENMASK(RISCV_DBTR_MC_MASKMAX_BIT + 5, RISCV_DBTR_MC_MASKMAX_BIT)
> +#define RISCV_DBTR_MC_DMODE_BIT_MASK	BIT(RISCV_DBTR_MC_DMODE_BIT)
> +#define RISCV_DBTR_MC_TYPE_BIT_MASK	GENMASK(RISCV_DBTR_MC_TYPE_BIT + 3, =
RISCV_DBTR_MC_TYPE_BIT)
> +
> +/* MC6 - Match Control 6 Type Register */
> +#define RISCV_DBTR_MC6_LOAD_BIT		0
> +#define RISCV_DBTR_MC6_STORE_BIT	1
> +#define RISCV_DBTR_MC6_EXEC_BIT		2
> +#define RISCV_DBTR_MC6_U_BIT		3
> +#define RISCV_DBTR_MC6_S_BIT		4
> +#define RISCV_DBTR_MC6_RES2_BIT		5
> +#define RISCV_DBTR_MC6_M_BIT		6
> +#define RISCV_DBTR_MC6_MATCH_BIT	7
> +#define RISCV_DBTR_MC6_CHAIN_BIT	11
> +#define RISCV_DBTR_MC6_ACTION_BIT	12
> +#define RISCV_DBTR_MC6_SIZE_BIT		16
> +#define RISCV_DBTR_MC6_TIMING_BIT	20
> +#define RISCV_DBTR_MC6_SELECT_BIT	21
> +#define RISCV_DBTR_MC6_HIT_BIT		22
> +#define RISCV_DBTR_MC6_VU_BIT		23
> +#define RISCV_DBTR_MC6_VS_BIT		24
> +#if __riscv_xlen =3D=3D 64
> +#define RISCV_DBTR_MC6_DMODE_BIT	59
> +#define RISCV_DBTR_MC6_TYPE_BIT		60
> +#elif __riscv_xlen =3D=3D 32
> +#define RISCV_DBTR_MC6_DMODE_BIT	27
> +#define RISCV_DBTR_MC6_TYPE_BIT		28
> +#else
> +#error "Unknown riscv xlen"
> +#endif
> +
> +#define RISCV_DBTR_MC6_LOAD_BIT_MASK	BIT(RISCV_DBTR_MC6_LOAD_BIT)
> +#define RISCV_DBTR_MC6_STORE_BIT_MASK	BIT(RISCV_DBTR_MC6_STORE_BIT)
> +#define RISCV_DBTR_MC6_EXEC_BIT_MASK	BIT(RISCV_DBTR_MC6_EXEC_BIT)
> +#define RISCV_DBTR_MC6_U_BIT_MASK	BIT(RISCV_DBTR_MC6_U_BIT)
> +#define RISCV_DBTR_MC6_S_BIT_MASK	BIT(RISCV_DBTR_MC6_S_BIT)
> +#define RISCV_DBTR_MC6_RES2_BIT_MASK	BIT(RISCV_DBTR_MC6_RES2_BIT)
> +#define RISCV_DBTR_MC6_M_BIT_MASK	BIT(RISCV_DBTR_MC6_M_BIT)
> +#define RISCV_DBTR_MC6_MATCH_BIT_MASK	\
> +	GENMASK(RISCV_DBTR_MC6_MATCH_BIT + 3, RISCV_DBTR_MC6_MATCH_BIT)
> +#define RISCV_DBTR_MC6_CHAIN_BIT_MASK	BIT(RISCV_DBTR_MC6_CHAIN_BIT)
> +#define RISCV_DBTR_MC6_ACTION_BIT_MASK	\
> +	GENMASK(RISCV_DBTR_MC6_ACTION_BIT + 3, RISCV_DBTR_MC6_ACTION_BIT)
> +#define RISCV_DBTR_MC6_SIZE_BIT_MASK	\
> +	GENMASK(RISCV_DBTR_MC6_SIZE_BIT + 3, RISCV_DBTR_MC6_SIZE_BIT)
> +#define RISCV_DBTR_MC6_TIMING_BIT_MASK	BIT(RISCV_DBTR_MC6_TIMING_BIT)
> +#define RISCV_DBTR_MC6_SELECT_BIT_MASK	BIT(RISCV_DBTR_MC6_SELECT_BIT)
> +#define RISCV_DBTR_MC6_HIT_BIT_MASK	BIT(RISCV_DBTR_MC6_HIT_BIT)
> +#define RISCV_DBTR_MC6_VU_BIT_MASK	BIT(RISCV_DBTR_MC6_VU_BIT)
> +#define RISCV_DBTR_MC6_VS_BIT_MASK	BIT(RISCV_DBTR_MC6_VS_BIT)
> +#define RISCV_DBTR_MC6_DMODE_BIT_MASK	BIT(RISCV_DBTR_MC6_DMODE_BIT)
> +#define RISCV_DBTR_MC6_TYPE_BIT_MASK	\
> +	GENMASK(RISCV_DBTR_MC6_TYPE_BIT + 3, RISCV_DBTR_MC6_TYPE_BIT)
> +
> +#define RISCV_DBTR_SET_TDATA1_TYPE(_t1, _type)				\
> +	({								\
> +		typeof(_t1) (td1t1) =3D (_t1);				\
> +		(td1t1) &=3D ~RISCV_DBTR_TDATA1_TYPE_BIT_MASK;		\
> +		(td1t1) |=3D (((unsigned long)(_type)			\
> +			     << RISCV_DBTR_TDATA1_TYPE_BIT)		\
> +			    & RISCV_DBTR_TDATA1_TYPE_BIT_MASK);		\
> +		(td1t1);						\
> +	})
> +
> +#define RISCV_DBTR_SET_MC_TYPE(_t1, _type)				\
> +	({								\
> +		typeof(_t1) (mct1) =3D (_t1);				\
> +		(mct1) &=3D ~RISCV_DBTR_MC_TYPE_BIT_MASK;			\
> +		(mct1) |=3D (((unsigned long)(_type)			\
> +			    << RISCV_DBTR_MC_TYPE_BIT)			\
> +			   & RISCV_DBTR_MC_TYPE_BIT_MASK);		\
> +		(mct1);							\
> +	})
> +
> +#define RISCV_DBTR_SET_MC6_TYPE(_t1, _type)				\
> +	({								\
> +		typeof(_t1) (mc6t1) =3D (_t1);				\
> +		(mc6t1) &=3D ~RISCV_DBTR_MC6_TYPE_BIT_MASK;		\
> +		(mc6t1) |=3D (((unsigned long)(_type)			\
> +			     << RISCV_DBTR_MC6_TYPE_BIT)		\
> +			    & RISCV_DBTR_MC6_TYPE_BIT_MASK);		\
> +		(mc6t1);						\
> +	})
> +
> +#define RISCV_DBTR_SET_MC_EXEC_BIT(_t1)			\
> +	SET_DBTR_BIT(_t1, RISCV_DBTR_MC_EXEC_BIT)
> +
> +#define RISCV_DBTR_SET_MC_LOAD_BIT(_t1)			\
> +	SET_DBTR_BIT(_t1, RISCV_DBTR_MC_LOAD_BIT)
> +
> +#define RISCV_DBTR_SET_MC_STORE_BIT(_t1)		\
> +	SET_DBTR_BIT(_t1, RISCV_DBTR_MC_STORE_BIT)
> +
> +#define RISCV_DBTR_SET_MC_SIZELO(_t1, _val)				\
> +	({								\
> +		typeof(_t1) (mcslt1) =3D (_t1);				\
> +		mcslt1 &=3D ~RISCV_DBTR_MC_SIZELO_BIT_MASK;		\
> +		mcslt1 |=3D (((_val) << RISCV_DBTR_MC_SIZELO_BIT)		\
> +			   & RISCV_DBTR_MC_SIZELO_BIT_MASK);		\
> +		(mcslt1);						\
> +	})
> +
> +#if __riscv_xlen >=3D 64
> +#define RISCV_DBTR_SET_MC_SIZEHI(_t1, _val)				\
> +	({								\
> +		typeof(_t1) (mcsht1) =3D (_t1);				\
> +		mcsht1 &=3D ~RISCV_DBTR_MC_SIZEHI_BIT_MASK;		\
> +		mcsht1 |=3D (((_val) << RISCV_DBTR_MC_SIZEHI_BIT)		\
> +			   & RISCV_DBTR_MC_SIZEHI_BIT_MASK);		\
> +		(mcsht1);						\
> +	})
> +#else
> +/* SIZEHI does not exist in the rv32 mcontrol layout; nothing to set. */
> +#define RISCV_DBTR_SET_MC_SIZEHI(_t1, _val) ((void)(_val), (_t1))
> +#endif
> +
> +#define RISCV_DBTR_SET_MC6_EXEC_BIT(_t1)		\
> +	SET_DBTR_BIT(_t1, RISCV_DBTR_MC6_EXEC_BIT)
> +
> +#define RISCV_DBTR_SET_MC6_LOAD_BIT(_t1)		\
> +	SET_DBTR_BIT(_t1, RISCV_DBTR_MC6_LOAD_BIT)
> +
> +#define RISCV_DBTR_SET_MC6_STORE_BIT(_t1)		\
> +	SET_DBTR_BIT(_t1, RISCV_DBTR_MC6_STORE_BIT)
> +
> +#define RISCV_DBTR_SET_MC6_SIZE(_t1, _val)				\
> +	({								\
> +		typeof(_t1) (mc6szt1) =3D (_t1);				\
> +		(mc6szt1) &=3D ~RISCV_DBTR_MC6_SIZE_BIT_MASK;		\
> +		(mc6szt1) |=3D (((_val) << RISCV_DBTR_MC6_SIZE_BIT)	\
> +			      & RISCV_DBTR_MC6_SIZE_BIT_MASK);		\
> +		(mc6szt1);						\
> +	})
> +
> +struct arch_hw_breakpoint {
> +	unsigned long address;
> +	unsigned long len;
> +	unsigned int type;
> +
> +	/* Trigger configuration data */
> +	unsigned long tdata1;
> +	unsigned long tdata2;
> +	unsigned long tdata3;
> +};
> +
> +struct perf_event_attr;
> +struct notifier_block;
> +struct perf_event;
> +struct pt_regs;
> +
> +int hw_breakpoint_slots(int type);
> +int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
> +int hw_breakpoint_arch_parse(struct perf_event *bp,
> +			     const struct perf_event_attr *attr,
> +			     struct arch_hw_breakpoint *hw);
> +int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
> +				    unsigned long val, void *data);
> +
> +void arch_enable_hw_breakpoint(struct perf_event *bp);
> +void arch_update_hw_breakpoint(struct perf_event *bp);
> +void arch_disable_hw_breakpoint(struct perf_event *bp);
> +int arch_install_hw_breakpoint(struct perf_event *bp);
> +void arch_uninstall_hw_breakpoint(struct perf_event *bp);
> +void hw_breakpoint_pmu_read(struct perf_event *bp);
> +
> +#else
> +
> +#endif /* CONFIG_HAVE_HW_BREAKPOINT */
> +#endif /* __RISCV_HW_BREAKPOINT_H */
> diff --git a/arch/riscv/include/asm/kdebug.h b/arch/riscv/include/asm/kde=
bug.h
> index 85ac00411f6e..53e989781aa1 100644
> --- a/arch/riscv/include/asm/kdebug.h
> +++ b/arch/riscv/include/asm/kdebug.h
> @@ -6,7 +6,8 @@
>  enum die_val {
>  	DIE_UNUSED,
>  	DIE_TRAP,
> -	DIE_OOPS
> +	DIE_OOPS,
> +	DIE_DEBUG
>  };
> =20
>  #endif
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index cabb99cadfb6..590a280762c9 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -100,6 +100,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+=3D mcount-dyn.o
> =20
>  obj-$(CONFIG_PERF_EVENTS)	+=3D perf_callchain.o
>  obj-$(CONFIG_HAVE_PERF_REGS)	+=3D perf_regs.o
> +obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+=3D hw_breakpoint.o
>  obj-$(CONFIG_RISCV_SBI)		+=3D sbi.o sbi_ecall.o
>  ifeq ($(CONFIG_RISCV_SBI), y)
>  obj-$(CONFIG_SMP)		+=3D sbi-ipi.o
> diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_bre=
akpoint.c
> new file mode 100644
> index 000000000000..fc54a1a897c5
> --- /dev/null
> +++ b/arch/riscv/kernel/hw_breakpoint.c
> @@ -0,0 +1,678 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Qualcomm Technologies, Inc.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/hw_breakpoint.h>
> +#include <linux/perf_event.h>
> +#include <linux/spinlock.h>
> +#include <linux/percpu.h>
> +#include <linux/kdebug.h>
> +#include <linux/bitops.h>
> +#include <linux/cpu.h>
> +#include <linux/cpuhotplug.h>
> +
> +#include <asm/sbi.h>
> +
> +/* Registered per-cpu bp/wp */
> +static DEFINE_PER_CPU(struct perf_event *, pcpu_hw_bp_events[RISCV_HW_BP=
_NUM_MAX]);
> +static DEFINE_PER_CPU(unsigned long, ecall_lock_flags);
> +static DEFINE_PER_CPU(raw_spinlock_t, ecall_lock);
> +
> +/* Per-cpu shared memory between S and M mode */
> +static union sbi_dbtr_shmem_entry __percpu *sbi_dbtr_shmem;
> +
> +/* number of debug triggers on this cpu . */
> +static int dbtr_total_num __ro_after_init;
> +static int dbtr_type __ro_after_init;
> +static int dbtr_init __ro_after_init;
> +
> +#define MEM_HI(_m)	((unsigned long)upper_32_bits(_m))
> +#define MEM_LO(_m)	((unsigned long)lower_32_bits(_m))
> +
> +static int arch_smp_setup_sbi_shmem(unsigned int cpu)
> +{
> +	union sbi_dbtr_shmem_entry *dbtr_shmem;
> +	phys_addr_t shmem_pa;
> +	struct sbiret ret;
> +
> +	dbtr_shmem =3D per_cpu_ptr(sbi_dbtr_shmem, cpu);
> +	if (!dbtr_shmem) {
> +		pr_err("Invalid per-cpu shared memory for debug triggers\n");
> +		return -ENODEV;
> +	}
> +
> +	shmem_pa =3D per_cpu_ptr_to_phys(dbtr_shmem);
> +
> +	ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
> +			MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
> +
> +	if (ret.error) {
> +		pr_warn("%s: failed to setup shared memory. error: %ld\n",
> +			__func__, ret.error);
> +		return sbi_err_map_linux_errno(ret.error);
> +	}
> +
> +	pr_info("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
> +
> +	return 0;
> +}
> +
> +static int arch_smp_teardown_sbi_shmem(unsigned int cpu)
> +{
> +	struct sbiret ret;
> +
> +	/* Disable shared memory */
> +	ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
> +			SBI_SHMEM_DISABLE, SBI_SHMEM_DISABLE, 0, 0, 0, 0);
> +
> +	if (ret.error)
> +		pr_warn("%s: failed to disable shared memory. error: %ld\n",
> +			__func__, ret.error);
> +	else
> +		pr_info("CPU %d: HW Breakpoint shared memory disabled.\n", cpu);
> +
> +	return 0;
> +}
> +
> +static void init_sbi_dbtr(void)
> +{
> +	unsigned long tdata1;
> +	struct sbiret ret;
> +
> +	if (sbi_probe_extension(SBI_EXT_DBTR) <=3D 0) {
> +		pr_warn("SBI_EXT_DBTR is not supported\n");
> +		dbtr_total_num =3D 0;
> +		goto done;
> +	}
> +
> +	ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> +			0, 0, 0, 0, 0, 0);
> +	if (ret.error) {
> +		pr_warn("Failed to detect triggers\n");
> +		dbtr_total_num =3D 0;
> +		goto done;
> +	}
> +
> +	tdata1 =3D 0;
> +	tdata1 =3D RISCV_DBTR_SET_TDATA1_TYPE(tdata1, RISCV_DBTR_TRIG_MCONTROL6=
);
> +
> +	ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> +			tdata1, 0, 0, 0, 0, 0);
> +	if (ret.error) {
> +		pr_warn("Failed to detect mcontrol6 triggers\n");
> +	} else if (!ret.value) {
> +		pr_warn("Type 6 triggers not available\n");
> +	} else {
> +		dbtr_total_num =3D ret.value;
> +		dbtr_type =3D RISCV_DBTR_TRIG_MCONTROL6;
> +		pr_warn("Mcontrol6 trigger available.\n");
> +		goto done;
> +	}
> +
> +	/* fallback to type 2 triggers if type 6 is not available */
> +
> +	tdata1 =3D 0;
> +	tdata1 =3D RISCV_DBTR_SET_TDATA1_TYPE(tdata1, RISCV_DBTR_TRIG_MCONTROL)=
;
> +
> +	ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> +			tdata1, 0, 0, 0, 0, 0);
> +	if (ret.error) {
> +		pr_warn("Failed to detect mcontrol triggers\n");
> +	} else if (!ret.value) {
> +		pr_warn("Type 2 triggers not available\n");
> +	} else {
> +		dbtr_total_num =3D ret.value;
> +		dbtr_type =3D RISCV_DBTR_TRIG_MCONTROL;
> +		goto done;
> +	}
> +
> +done:
> +	dbtr_init =3D 1;
> +}
> +

dbtr_total_num is assigned directly from the SBI trigger count
(init_sbi_dbtr(), hw_breakpoint.c lines ~109/127) and returned
unmodified from hw_breakpoint_slots(). The per-CPU event table is
fixed at RISCV_HW_BP_NUM_MAX (32) entries:

  static DEFINE_PER_CPU(struct perf_event *,
                        pcpu_hw_bp_events[RISCV_HW_BP_NUM_MAX]);

If firmware reports more than 32 matching triggers, the generic core
will happily accept events beyond the table size. Every consumer uses
dbtr_total_num as its bound:

  - arch_install_hw_breakpoint(): idx >=3D dbtr_total_num check only
    guards the lower bound; idx can still be >=3D 32, and
    this_cpu_ptr(&pcpu_hw_bp_events[idx]) indexes past the array.
  - hw_breakpoint_handler(), arch_uninstall/enable/disable/update:
    all loop "for (i =3D 0; i < dbtr_total_num; i++)" and index
    pcpu_hw_bp_events[i] =E2=80=94 OOB read/write when dbtr_total_num > 32.

This is reachable in practice: any platform whose M-mode firmware
reports a large trigger count (the spec imposes no 32-cap) hits it on
the first install beyond index 31.

Suggested fix =E2=80=94 clamp at detection time:

  dbtr_total_num =3D min_t(unsigned long, ret.value,
                         RISCV_HW_BP_NUM_MAX);

applied at both the mcontrol6 and mcontrol branches in init_sbi_dbtr().

> +int hw_breakpoint_slots(int type)
> +{
> +	/*
> +	 * We can be called early, so don't rely on
> +	 * static variables being initialised.
> +	 */
> +
> +	if (!dbtr_init)
> +		init_sbi_dbtr();
> +
> +	return dbtr_total_num;
> +}
> +
> +int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw)
> +{
> +	unsigned int len;
> +	unsigned long va;
> +
> +	va =3D hw->address;
> +	len =3D hw->len;
> +
> +	return (va >=3D TASK_SIZE) && ((va + len - 1) >=3D TASK_SIZE);
> +}
> +
> +static int rv_init_mcontrol_trigger(const struct perf_event_attr *attr,
> +				    struct arch_hw_breakpoint *hw)
> +{
> +	switch (attr->bp_type) {
> +	case HW_BREAKPOINT_X:
> +		hw->type =3D RISCV_DBTR_EXEC;
> +		RISCV_DBTR_SET_MC_EXEC_BIT(hw->tdata1);
> +		break;
> +	case HW_BREAKPOINT_R:
> +		hw->type =3D RISCV_DBTR_LOAD;
> +		RISCV_DBTR_SET_MC_LOAD_BIT(hw->tdata1);
> +		break;
> +	case HW_BREAKPOINT_W:
> +		hw->type =3D RISCV_DBTR_STORE;
> +		RISCV_DBTR_SET_MC_STORE_BIT(hw->tdata1);
> +		break;
> +	case HW_BREAKPOINT_RW:
> +		hw->type =3D RISCV_DBTR_LDST;
> +		RISCV_DBTR_SET_MC_LOAD_BIT(hw->tdata1);
> +		RISCV_DBTR_SET_MC_STORE_BIT(hw->tdata1);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (attr->bp_type =3D=3D HW_BREAKPOINT_X) {
> +		/*
> +		 * Userspace debuggers can request execute breakpoints with
> +		 * bp_len =3D=3D 2 for compressed/non-aligned instruction
> +		 * addresses. Program execute triggers with "match any size"
> +		 * to avoid missing valid instruction fetches.
> +		 */
> +		hw->len =3D 0;
> +		hw->tdata1 =3D RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 0);
> +		hw->tdata1 =3D RISCV_DBTR_SET_MC_SIZEHI(hw->tdata1, 0);
> +	} else {
> +		switch (attr->bp_len) {
> +		case HW_BREAKPOINT_LEN_1:
> +			hw->len =3D 1;
> +			hw->tdata1 =3D RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 1);
> +			break;
> +		case HW_BREAKPOINT_LEN_2:
> +			hw->len =3D 2;
> +			hw->tdata1 =3D RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 2);
> +			break;
> +		case HW_BREAKPOINT_LEN_4:
> +			hw->len =3D 4;
> +			hw->tdata1 =3D RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 3);
> +			break;
> +#if __riscv_xlen >=3D 64
> +		case HW_BREAKPOINT_LEN_8:
> +			hw->len =3D 8;
> +			hw->tdata1 =3D RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 1);
> +			hw->tdata1 =3D RISCV_DBTR_SET_MC_SIZEHI(hw->tdata1, 1);
> +			break;
> +#endif
> +		/* Set to match any size */
> +		default:
> +			hw->len =3D 0;
> +			hw->tdata1 =3D RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 0);
> +			hw->tdata1 =3D RISCV_DBTR_SET_MC_SIZEHI(hw->tdata1, 0);
> +			break;
> +		}
> +	}
> +
> +	hw->tdata1 =3D RISCV_DBTR_SET_MC_TYPE(hw->tdata1, RISCV_DBTR_TRIG_MCONT=
ROL);
> +
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_DMODE_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_TIMING_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_SELECT_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_ACTION_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_CHAIN_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_MATCH_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_M_BIT);
> +
> +	SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_S_BIT);
> +	SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_U_BIT);
> +
> +	return 0;
> +}
> +
> +static int rv_init_mcontrol6_trigger(const struct perf_event_attr *attr,
> +				     struct arch_hw_breakpoint *hw)
> +{
> +	switch (attr->bp_type) {
> +	case HW_BREAKPOINT_X:
> +		hw->type =3D RISCV_DBTR_EXEC;
> +		RISCV_DBTR_SET_MC6_EXEC_BIT(hw->tdata1);
> +		break;
> +	case HW_BREAKPOINT_R:
> +		hw->type =3D RISCV_DBTR_LOAD;
> +		RISCV_DBTR_SET_MC6_LOAD_BIT(hw->tdata1);
> +		break;
> +	case HW_BREAKPOINT_W:
> +		hw->type =3D RISCV_DBTR_STORE;
> +		RISCV_DBTR_SET_MC6_STORE_BIT(hw->tdata1);
> +		break;
> +	case HW_BREAKPOINT_RW:
> +		hw->type =3D RISCV_DBTR_LDST;
> +		RISCV_DBTR_SET_MC6_STORE_BIT(hw->tdata1);
> +		RISCV_DBTR_SET_MC6_LOAD_BIT(hw->tdata1);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (attr->bp_type =3D=3D HW_BREAKPOINT_X) {
> +		/* See rv_init_mcontrol_trigger() for rationale. */
> +		hw->len =3D 0;
> +		hw->tdata1 =3D RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 0);
> +	} else {
> +		switch (attr->bp_len) {
> +		case HW_BREAKPOINT_LEN_1:
> +			hw->len =3D 1;
> +			hw->tdata1 =3D RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 1);
> +			break;
> +		case HW_BREAKPOINT_LEN_2:
> +			hw->len =3D 2;
> +			hw->tdata1 =3D RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 2);
> +			break;
> +		case HW_BREAKPOINT_LEN_4:
> +			hw->len =3D 4;
> +			hw->tdata1 =3D RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 3);
> +			break;
> +#if __riscv_xlen >=3D 64
> +		case HW_BREAKPOINT_LEN_8:
> +			hw->len =3D 8;
> +			hw->tdata1 =3D RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 5);
> +			break;
> +#endif
> +		/* Set to match any size */
> +		default:
> +			hw->len =3D 0;
> +			hw->tdata1 =3D RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 0);
> +		}
> +	}
> +
> +	hw->tdata1 =3D RISCV_DBTR_SET_MC6_TYPE(hw->tdata1, RISCV_DBTR_TRIG_MCON=
TROL6);
> +
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_DMODE_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_TIMING_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_SELECT_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_ACTION_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_CHAIN_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_MATCH_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_M_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_VS_BIT);
> +	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_VU_BIT);
> +
> +	SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_S_BIT);
> +	SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_U_BIT);
> +
> +	return 0;
> +}
> +

Both rv_init_mcontrol_trigger() and rv_init_mcontrol6_trigger()
unconditionally set S and U matching:

  SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_S_BIT);
  SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_U_BIT);

without consulting attr->exclude_kernel or attr->exclude_user.

This matters for ptrace breakpoints: ptrace_breakpoint_init()
(include/linux/hw_breakpoint.h) sets exclude_kernel =3D 1, so every
ptrace watchpoint is supposed to fire only on user-mode access. With
the current code the trigger is armed in S-mode as well, so a kernel
access to the traced user buffer (e.g. copy_from_user) takes the
debug exception. perf_bp_event() then filters the sample *after* the
RISC-V handler has already returned NOTIFY_STOP =E2=80=94 i.e. the exceptio=
n
is delivered and consumed even though perf would discard it.

The hardware can filter this itself if we gate the privilege bits on
the exclude flags, matching what arm64/x86 do at the trigger level:

  if (!attr->exclude_kernel)
      SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_S_BIT);
  if (!attr->exclude_user)
      SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_U_BIT);

(The M bit stays cleared regardless =E2=80=94 we never arm M-mode from here=
.)

This also avoids spurious traps during kernel access to the watched
address, which on some firmware could otherwise cause re-trigger
loops if the trigger isn't auto-cleared.

Thanks,
Rui Qi

> +int hw_breakpoint_arch_parse(struct perf_event *bp,
> +			     const struct perf_event_attr *attr,
> +			     struct arch_hw_breakpoint *hw)
> +{
> +	int ret;
> +
> +	/* Breakpoint address */
> +	hw->address =3D attr->bp_addr;
> +	hw->tdata2 =3D attr->bp_addr;
> +	hw->tdata3 =3D 0x0;
> +
> +	switch (dbtr_type) {
> +	case RISCV_DBTR_TRIG_MCONTROL:
> +		ret =3D rv_init_mcontrol_trigger(attr, hw);
> +		break;
> +	case RISCV_DBTR_TRIG_MCONTROL6:
> +		ret =3D rv_init_mcontrol6_trigger(attr, hw);
> +		break;
> +	default:
> +		pr_warn("Unsupported trigger type\n");
> +		ret =3D -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * HW Breakpoint/watchpoint handler
> + */
> +static int hw_breakpoint_handler(struct die_args *args)
> +{
> +	int ret =3D NOTIFY_DONE;
> +	struct arch_hw_breakpoint *bp;
> +	struct perf_event *event;
> +	int i;
> +
> +	for (i =3D 0; i < dbtr_total_num; i++) {
> +		event =3D this_cpu_read(pcpu_hw_bp_events[i]);
> +		if (!event)
> +			continue;
> +
> +		bp =3D counter_arch_bp(event);
> +		switch (bp->type) {
> +		/* Breakpoint */
> +		case RISCV_DBTR_EXEC:
> +			if (bp->address =3D=3D args->regs->epc) {
> +				perf_bp_event(event, args->regs);
> +				ret =3D NOTIFY_STOP;
> +			}
> +			break;
> +
> +		/* Watchpoint */
> +		case RISCV_DBTR_LOAD:
> +		case RISCV_DBTR_STORE:
> +		case RISCV_DBTR_LDST:
> +		{
> +			unsigned long stval =3D args->regs->badaddr;
> +			unsigned long bp_start =3D bp->address;
> +			unsigned long bp_len =3D bp->len ?: 1;
> +			unsigned long bp_end =3D bp_start + bp_len - 1;
> +			unsigned long stval_end =3D stval + sizeof(long) - 1;
> +			unsigned long tdata1;
> +			bool hit =3D false;
> +			struct sbiret sret;
> +			union sbi_dbtr_shmem_entry *shmem;
> +
> +			if (bp_end < bp_start)
> +				bp_end =3D ~0UL;
> +			if (stval_end < stval)
> +				stval_end =3D ~0UL;
> +
> +			/*
> +			 * Prefer tdata1.hit from SBI trigger readout whenever
> +			 * possible. Fall back to address-based matching if HIT
> +			 * isn't observed/supported.
> +			 */
> +			raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
> +					      *this_cpu_ptr(&ecall_lock_flags));
> +			shmem =3D this_cpu_ptr(sbi_dbtr_shmem);
> +			sret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
> +					 i, 1, 0, 0, 0, 0);
> +			if (!sret.error) {
> +				tdata1 =3D le_to_cpu(shmem->data.tdata1);
> +
> +				if (dbtr_type =3D=3D RISCV_DBTR_TRIG_MCONTROL)
> +					hit =3D !!(tdata1 & RISCV_DBTR_MC_HIT_BIT_MASK);
> +				else if (dbtr_type =3D=3D RISCV_DBTR_TRIG_MCONTROL6)
> +					hit =3D !!(tdata1 & RISCV_DBTR_MC6_HIT_BIT_MASK);
> +			}
> +			raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
> +						   *this_cpu_ptr(&ecall_lock_flags));
> +
> +			/*
> +			 * Sdtrig may report STVAL as the lowest accessed
> +			 * address while the watchpoint can match a higher byte
> +			 * in the same access.
> +			 */
> +			if (hit ||
> +			    (stval >=3D bp_start && stval <=3D bp_end) ||
> +			    (bp_start >=3D stval && bp_start <=3D stval_end)) {
> +				perf_bp_event(event, args->regs);
> +				ret =3D NOTIFY_STOP;
> +			}
> +			break;
> +		}
> +
> +		default:
> +			pr_warn("Unknown type: %u\n", bp->type);
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
> +				    unsigned long val, void *data)
> +{
> +	if (val !=3D DIE_DEBUG)
> +		return NOTIFY_DONE;
> +
> +	return hw_breakpoint_handler(data);
> +}
> +
> +/* atomic: counter->ctx->lock is held */
> +int arch_install_hw_breakpoint(struct perf_event *event)
> +{
> +	struct arch_hw_breakpoint *bp =3D counter_arch_bp(event);
> +	union sbi_dbtr_shmem_entry *shmem =3D this_cpu_ptr(sbi_dbtr_shmem);
> +	struct sbi_dbtr_data_msg *xmit;
> +	struct sbi_dbtr_id_msg *recv;
> +	struct perf_event **slot;
> +	unsigned long idx;
> +	struct sbiret ret;
> +	int err =3D 0;
> +
> +	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
> +			      *this_cpu_ptr(&ecall_lock_flags));
> +
> +	xmit =3D &shmem->data;
> +	recv =3D &shmem->id;
> +	xmit->tdata1 =3D cpu_to_le(bp->tdata1);
> +	xmit->tdata2 =3D cpu_to_le(bp->tdata2);
> +	xmit->tdata3 =3D cpu_to_le(bp->tdata3);
> +
> +	ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
> +			1, 0, 0, 0, 0, 0);
> +
> +	if (ret.error) {
> +		pr_warn("Failed to install trigger\n");
> +		err =3D sbi_err_map_linux_errno(ret.error);
> +		goto done;
> +	}
> +
> +	idx =3D le_to_cpu(recv->idx);
> +	if (idx >=3D dbtr_total_num) {
> +		pr_warn("Invalid trigger index %lu\n", idx);
> +		err =3D -EINVAL;
> +		goto done;
> +	}
> +
> +	slot =3D this_cpu_ptr(&pcpu_hw_bp_events[idx]);
> +	if (*slot) {
> +		pr_warn("Slot %lu is in use\n", idx);
> +		err =3D -EBUSY;
> +		goto done;
> +	}
> +
> +	/* Save the event - to be looked up in handler */
> +	*slot =3D event;
> +
> +done:
> +	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
> +				   *this_cpu_ptr(&ecall_lock_flags));
> +	return err;
> +}
> +
> +/* atomic: counter->ctx->lock is held */
> +void arch_uninstall_hw_breakpoint(struct perf_event *event)
> +{
> +	struct sbiret ret;
> +	int i;
> +
> +	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
> +			      *this_cpu_ptr(&ecall_lock_flags));
> +
> +	for (i =3D 0; i < dbtr_total_num; i++) {
> +		struct perf_event **slot =3D this_cpu_ptr(&pcpu_hw_bp_events[i]);
> +
> +		if (*slot =3D=3D event) {
> +			*slot =3D NULL;
> +			break;
> +		}
> +	}
> +
> +	if (i =3D=3D dbtr_total_num) {
> +		pr_warn("Breakpoint not installed.\n");
> +		goto out;
> +	}
> +
> +	ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
> +			i, 1, 0, 0, 0, 0);
> +
> +	if (ret.error) {
> +		pr_warn("Failed to uninstall trigger %d.\n", i);
> +		goto out;
> +	}
> +
> + out:
> +	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
> +				   *this_cpu_ptr(&ecall_lock_flags));
> +}
> +
> +void arch_enable_hw_breakpoint(struct perf_event *event)
> +{
> +	struct sbiret ret;
> +	int i;
> +	struct perf_event **slot;
> +
> +	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
> +			      *this_cpu_ptr(&ecall_lock_flags));
> +
> +	for (i =3D 0; i < dbtr_total_num; i++) {
> +		slot =3D this_cpu_ptr(&pcpu_hw_bp_events[i]);
> +
> +		if (*slot =3D=3D event)
> +			break;
> +	}
> +
> +	if (i =3D=3D dbtr_total_num) {
> +		pr_warn("Breakpoint not installed.\n");
> +		goto out;
> +	}
> +
> +	ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
> +			i, 1, 0, 0, 0, 0);
> +
> +	if (ret.error) {
> +		pr_warn("Failed to install trigger %d\n", i);
> +		goto out;
> +	}
> +
> + out:
> +	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
> +				   *this_cpu_ptr(&ecall_lock_flags));
> +}
> +EXPORT_SYMBOL_GPL(arch_enable_hw_breakpoint);
> +
> +void arch_update_hw_breakpoint(struct perf_event *event)
> +{
> +	struct arch_hw_breakpoint *bp =3D counter_arch_bp(event);
> +	union sbi_dbtr_shmem_entry *shmem =3D this_cpu_ptr(sbi_dbtr_shmem);
> +	struct sbi_dbtr_data_msg *xmit;
> +	struct perf_event **slot;
> +	struct sbiret ret;
> +	int i;
> +
> +	for (i =3D 0; i < dbtr_total_num; i++) {
> +		slot =3D this_cpu_ptr(&pcpu_hw_bp_events[i]);
> +
> +		if (*slot =3D=3D event)
> +			break;
> +	}
> +
> +	if (i =3D=3D dbtr_total_num) {
> +		pr_warn("Breakpoint not installed.\n");
> +		return;
> +	}
> +
> +	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
> +			      *this_cpu_ptr(&ecall_lock_flags));
> +
> +	xmit =3D &shmem->data;
> +	xmit->tdata1 =3D cpu_to_le(bp->tdata1);
> +	xmit->tdata2 =3D cpu_to_le(bp->tdata2);
> +	xmit->tdata3 =3D cpu_to_le(bp->tdata3);
> +
> +	ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
> +			i, 1, 0, 0, 0, 0);
> +	if (ret.error)
> +		pr_warn("Failed to update trigger %d.\n", i);
> +
> +	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
> +				   *this_cpu_ptr(&ecall_lock_flags));
> +}
> +EXPORT_SYMBOL_GPL(arch_update_hw_breakpoint);
> +
> +void arch_disable_hw_breakpoint(struct perf_event *event)
> +{
> +	struct perf_event **slot;
> +	struct sbiret ret;
> +	int i;
> +
> +	for (i =3D 0; i < dbtr_total_num; i++) {
> +		slot =3D this_cpu_ptr(&pcpu_hw_bp_events[i]);
> +
> +		if (*slot =3D=3D event)
> +			break;
> +	}
> +
> +	if (i =3D=3D dbtr_total_num) {
> +		pr_warn("Breakpoint not installed.\n");
> +		return;
> +	}
> +
> +	ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
> +			i, 1, 0, 0, 0, 0);
> +
> +	if (ret.error) {
> +		pr_warn("Failed to uninstall trigger %d.\n", i);
> +		return;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(arch_disable_hw_breakpoint);
> +
> +void hw_breakpoint_pmu_read(struct perf_event *bp) { }
> +
> +void flush_ptrace_hw_breakpoint(struct task_struct *tsk) { }
> +
> +static int __init arch_hw_breakpoint_init(void)
> +{
> +	unsigned int cpu;
> +	int rc =3D 0;
> +
> +	for_each_possible_cpu(cpu)
> +		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
> +
> +	if (!dbtr_init)
> +		init_sbi_dbtr();
> +
> +	if (dbtr_total_num) {
> +		pr_info("Total number of type %d triggers: %u\n",
> +			dbtr_type, dbtr_total_num);
> +	} else {
> +		pr_info("No hardware triggers available\n");
> +		goto out;
> +	}
> +
> +	/* Allocate per-cpu shared memory */
> +	sbi_dbtr_shmem =3D __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_=
num,
> +					PAGE_SIZE);
> +
> +	if (!sbi_dbtr_shmem) {
> +		pr_warn("Failed to allocate shared memory.\n");
> +		rc =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	/* Hotplug handler to register/unregister shared memory with SBI */
> +	rc =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +			       "riscv/hw_breakpoint:prepare",
> +			       arch_smp_setup_sbi_shmem,
> +			       arch_smp_teardown_sbi_shmem);
> +
> +	if (rc < 0) {
> +		pr_warn("Failed to setup CPU hotplug state\n");
> +		free_percpu(sbi_dbtr_shmem);
> +		return rc;
> +	}
> + out:
> +	return rc;
> +}
> +arch_initcall(arch_hw_breakpoint_init);
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 8c62c771a656..029fd66a285e 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -286,6 +286,12 @@ void handle_break(struct pt_regs *regs)
>  	if (probe_breakpoint_handler(regs))
>  		return;
> =20
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
> +	    =3D=3D NOTIFY_STOP)
> +		return;
> +#endif
> +
>  	current->thread.bad_cause =3D regs->cause;
> =20
>  	if (user_mode(regs))
