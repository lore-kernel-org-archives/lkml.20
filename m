Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354AF3BD64B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792268979; cv=none; b=ftByrMA3pHE7vnkGJ1NJkNqrSGP7VYB4OUSfp2r4EIDi/Gn2dnnOoKCxO1y8/EmuZSwEFMvGlZqe0XYmC0m3qUEcieGLU2GZuWvSimY18LJ6yO80HZHNt53igbGxU6Aq9zE40ylzg4eZHDwqsu+/+p8Rdafwt4PGM6IoGljzraw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792268979; c=relaxed/simple;
	bh=mXIrzcSyVTFqKmbG/Y3wCXBGm2VLzlef5Rh9o7gs+pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlnYOgTiECtKpS7z9k91l50XLbib0OT62YogxGgPuGHjrWCrLTxzmFuRRw0xw5zJlT0NmZtFAPvrjaSIXEGiJVL32muyRewUJESVImlqIla2EWb9pWuTI0GrFSjF69r27XQ61fxGlVe+mMoMQz1EdOEVKTe4lC8HlmSboqDTwLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=boogiepop@gmx.com header.b=Acqouqd+; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=boogiepop@gmx.com header.b="Acqouqd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1792268974; x=1792873774; i=boogiepop@gmx.com;
	bh=k8RBBdIHwOnE6dGfKvFZuqiHAxqIJkAg9/LP6wG+Ig4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Acqouqd+E2WcBCoJh89Oi1OTJcp9Pf6Q6cJysH/5rPovKbQt/YhmCsMlkXtnJB9J
	 V1XsvDBE2x7DuV2sK9723tFoxfhBQNBDjwEn3+B9b3qhkj9/sKMpwWGhkAVuQg+fb
	 uq4eLH9spXbaCCevfu/XQQP7Rzw2pqe6fodLoepMJVCSq1dMpV//TosFmPKBUYQ1O
	 wEK31FE03ZEBoutRS6cBBxS7t55ocbOf6cayEV/oXt3YXz4GR6vMVll4BnnQQ3mCy
	 4jElMaWwD5zDzNMAiwAjInpblMCtfJnF/dgOnMb0NCPeBm0Umbgmx47Kg3ialK1+x
	 qcmXWxKmxicsWDdCJA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MY6Cb-1x7wpv2Z01-00IT2I; Sat, 17
 Oct 2026 22:29:34 +0200
Message-ID: <1720a844-fece-4983-a639-3af9da26475c@gmx.com>
Date: Sat, 17 Oct 2026 22:29:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: rockchip: smp: enable secondary rk3066a/rk3188
 CPUs
To: jbx6244@gmail.com, Russell King <linux@armlinux.org.uk>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261017-cpu-v3-1-25d8f4b06362@gmail.com>
Content-Language: en-US
From: boogie <boogiepop@gmx.com>
In-Reply-To: <20261017-cpu-v3-1-25d8f4b06362@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Kz2qsiXC/XlF90NwJDh8Tvf+FeQIae20o2pnQFwrIeCVJdnXBCQ
 8/wT5CzJGmQP61HTSuw+QlSbmZWeapqIg63dDp/M52jqRlV4HjctlGcJ+S5UaXElcM1253T
 QllUIORK52lxFC5nKRptOewZY0V38cgGExyAiBmrBCeV97LeNVHxTAes7KdXhfON0dp/n0S
 AkSd7ccdO86iuqPqqvdQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:78nt69TG4Kw=;CVeUoTuAyIGVmo+BNRZsTTNT14Q
 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
 Pb05s/cUvD6HmCZ1SJSlw+db9HCy7U5/

Hello Johan

Thanks for the clean patch!

Tested on my Lifetab md98486 tablet, everything seems to work fine with=20
rockchip TPL (30_LPDDR2_300MHz_DDR3_300MHz_20130517.bin) + UBOOT SPL=20
(almost latest 2026.xx) booted from nand idb.

[    0.169171] smp: Bringing up secondary CPUs ...
[    0.176761] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.177211] CPU1: Spectre v2: using BPIALL workaround
[    0.189310] smp: Brought up 1 node, 2 CPUs
[    0.193902] SMP: Total of 2 processors activated (96.00 BogoMIPS).
[    0.200728] CPU: All CPU(s) started in SVC mode.


[alarm@alarm ~]$ cat /proc/cpuinfo
processor       : 0
model name      : ARMv7 Processor rev 0 (v7l)
BogoMIPS        : 101.76
Features        : half thumb fastmult vfp edsp thumbee neon vfpv3 tls=20
vfpd32
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x3
CPU part        : 0xc09
CPU revision    : 0

processor       : 1
model name      : ARMv7 Processor rev 0 (v7l)
BogoMIPS        : 101.76
Features        : half thumb fastmult vfp edsp thumbee neon vfpv3 tls=20
vfpd32
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x3
CPU part        : 0xc09
CPU revision    : 0

Hardware        : Rockchip (Device Tree)
Revision        : 0000
Serial          : 0000000000000000
[alarm@alarm ~]$ uname -a
Linux alarm 7.1.0-ARCH+ #22 SMP PREEMPT Sat Oct 17 22:11:35 CEST 2026=20
armv7l GNU/Linux


Tested-by: H=C3=BCseyin BIYIK <boogiepop@gmx.com>

On 10/17/26 15:27, Johan Jonker via B4 Relay wrote:
> From: Johan Jonker <jbx6244@gmail.com>
>=20
> Early Rockchip SoCs like rk3066a and rk3188 had boot loaders
> that remapped the boot ROM and the internal memory. Currently
> U-boot makes use of a common board file without remapping
> resulting in the secondary CPUs power up hanging in a wait loop.
>=20
> Make the various boot loader methods work by:
>=20
> * add code that disables remapping on both rk3066 and rk3188
> * change to use the same boot ROM path for all socs in rockchip_boot_sec=
ondary()
> * drop the rockchip_smp_prepare_sram() part
>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>=20
> Changed V3:
> remove include
> use regmap_write
> ---
>   arch/arm/mach-rockchip/Makefile   |   2 +-
>   arch/arm/mach-rockchip/core.h     |  10 ----
>   arch/arm/mach-rockchip/headsmp.S  |  16 ------
>   arch/arm/mach-rockchip/platsmp.c  | 105 +++++++++++++++---------------=
=2D-------
>   arch/arm/mach-rockchip/rockchip.c |   1 -
>   5 files changed, 42 insertions(+), 92 deletions(-)
>=20
> diff --git a/arch/arm/mach-rockchip/Makefile b/arch/arm/mach-rockchip/Ma=
kefile
> index 62596d5deb88..d05123a7b711 100644
> --- a/arch/arm/mach-rockchip/Makefile
> +++ b/arch/arm/mach-rockchip/Makefile
> @@ -3,4 +3,4 @@ CFLAGS_platsmp.o :=3D -march=3Darmv7-a
>  =20
>   obj-$(CONFIG_ARCH_ROCKCHIP) +=3D rockchip.o
>   obj-$(CONFIG_PM_SLEEP) +=3D pm.o sleep.o
> -obj-$(CONFIG_SMP) +=3D headsmp.o platsmp.o
> +obj-$(CONFIG_SMP) +=3D platsmp.o
> diff --git a/arch/arm/mach-rockchip/core.h b/arch/arm/mach-rockchip/core=
.h
> deleted file mode 100644
> index fabcaa66607c..000000000000
> --- a/arch/arm/mach-rockchip/core.h
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * Copyright (c) 2013 MundoReader S.L.
> - * Author: Heiko Stuebner <heiko@sntech.de>
> - */
> -
> -extern char rockchip_secondary_trampoline;
> -extern char rockchip_secondary_trampoline_end;
> -
> -extern unsigned long rockchip_boot_fn;
> diff --git a/arch/arm/mach-rockchip/headsmp.S b/arch/arm/mach-rockchip/h=
eadsmp.S
> deleted file mode 100644
> index 37a7ea524a16..000000000000
> --- a/arch/arm/mach-rockchip/headsmp.S
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * Copyright (c) 2013 MundoReader S.L.
> - * Author: Heiko Stuebner <heiko@sntech.de>
> - */
> -#include <linux/linkage.h>
> -#include <linux/init.h>
> -
> -ENTRY(rockchip_secondary_trampoline)
> -	ldr	pc, 1f
> -ENDPROC(rockchip_secondary_trampoline)
> -	.globl	rockchip_boot_fn
> -rockchip_boot_fn:
> -1:	.space	4
> -
> -ENTRY(rockchip_secondary_trampoline_end)
> diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/p=
latsmp.c
> index f659d894bfae..5f3ca7c0cfe4 100644
> --- a/arch/arm/mach-rockchip/platsmp.c
> +++ b/arch/arm/mach-rockchip/platsmp.c
> @@ -21,17 +21,21 @@
>   #include <asm/smp_plat.h>
>   #include <asm/mach/map.h>
>  =20
> -#include "core.h"
> -
>   static void __iomem *scu_base_addr;
>   static void __iomem *sram_base_addr;
>   static int ncores;
>  =20
> +#define RK3066_GRF_SOC_CON0	0x0150
> +#define RK3188_GRF_SOC_CON0	0x00a0
> +
> +#define NOC_REMAP		BIT(12)
> +
>   #define PMU_PWRDN_CON		0x08
>   #define PMU_PWRDN_ST		0x0c
>  =20
>   #define PMU_PWRDN_SCU		4
>  =20
> +static struct regmap *grf;
>   static struct regmap *pmu;
>   static int has_pmu =3D true;
>   static struct reset_control *cpu_rstc[4];
> @@ -133,66 +137,21 @@ static int rockchip_boot_secondary(unsigned int cp=
u, struct task_struct *idle)
>   	if (ret < 0)
>   		return ret;
>  =20
> -	if (read_cpuid_part() !=3D ARM_CPU_PART_CORTEX_A9) {
> -		/*
> -		 * We communicate with the bootrom to active the cpus other
> -		 * than cpu0, after a blob of initialize code, they will
> -		 * stay at wfe state, once they are activated, they will check
> -		 * the mailbox:
> -		 * sram_base_addr + 4: 0xdeadbeaf
> -		 * sram_base_addr + 8: start address for pc
> -		 * The cpu0 need to wait the other cpus other than cpu0 entering
> -		 * the wfe state.The wait time is affected by many aspects.
> -		 * (e.g: cpu frequency, bootrom frequency, sram frequency, ...)
> -		 */
> -		mdelay(1); /* ensure the cpus other than cpu0 to startup */
> -
> -		writel(__pa_symbol(secondary_startup), sram_base_addr + 8);
> -		writel(0xDEADBEAF, sram_base_addr + 4);
> -		dsb_sev();
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * rockchip_smp_prepare_sram - populate necessary sram block
> - * Starting cores execute the code residing at the start of the on-chip=
 sram
> - * after power-on. Therefore make sure, this sram region is reserved an=
d
> - * big enough. After this check, copy the trampoline code that directs =
the
> - * core to the real startup code in ram into the sram-region.
> - * @node: mmio-sram device node
> - */
> -static int __init rockchip_smp_prepare_sram(struct device_node *node)
> -{
> -	unsigned int trampoline_sz =3D &rockchip_secondary_trampoline_end -
> -					    &rockchip_secondary_trampoline;
> -	struct resource res;
> -	unsigned int rsize;
> -	int ret;
> -
> -	ret =3D of_address_to_resource(node, 0, &res);
> -	if (ret < 0) {
> -		pr_err("%s: could not get address for node %pOF\n",
> -		       __func__, node);
> -		return ret;
> -	}
> -
> -	rsize =3D resource_size(&res);
> -	if (rsize < trampoline_sz) {
> -		pr_err("%s: reserved block with size 0x%x is too small for trampoline=
 size 0x%x\n",
> -		       __func__, rsize, trampoline_sz);
> -		return -EINVAL;
> -	}
> -
> -	/* set the boot function for the sram code */
> -	rockchip_boot_fn =3D __pa_symbol(secondary_startup);
> -
> -	/* copy the trampoline to sram, that runs during startup of the core *=
/
> -	memcpy_toio(sram_base_addr, &rockchip_secondary_trampoline, trampoline=
_sz);
> -	flush_cache_all();
> -	outer_clean_range(0, trampoline_sz);
> -
> +	/*
> +	* We communicate with the bootrom to active the cpus other
> +	* than cpu0, after a blob of initialize code, they will
> +	* stay at wfe state, once they are activated, they will check
> +	* the mailbox:
> +	* sram_base_addr + 4: 0xdeadbeaf
> +	* sram_base_addr + 8: start address for pc
> +	* The cpu0 need to wait the other cpus other than cpu0 entering
> +	* the wfe state.The wait time is affected by many aspects.
> +	* (e.g: cpu frequency, bootrom frequency, sram frequency, ...)
> +	*/
> +	mdelay(1); /* ensure the cpus other than cpu0 to startup */
> +
> +	writel(__pa_symbol(secondary_startup), sram_base_addr + 8);
> +	writel(0xDEADBEAF, sram_base_addr + 4);
>   	dsb_sev();
>  =20
>   	return 0;
> @@ -320,9 +279,27 @@ static void __init rockchip_smp_prepare_cpus(unsign=
ed int max_cpus)
>   	for (i =3D 1; i < ncores; i++)
>   		pmu_set_power_domain(0 + i, false);
>  =20
> +	/* Make sure that the remap function is disabled */
>   	if (read_cpuid_part() =3D=3D ARM_CPU_PART_CORTEX_A9) {
> -		if (rockchip_smp_prepare_sram(node)) {
> -			of_node_put(node);
> +		unsigned int reg;
> +		int ret;
> +
> +		if (of_machine_is_compatible("rockchip,rk3066a")) {
> +			reg =3D RK3066_GRF_SOC_CON0;
> +			grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3066-grf");
> +		} else {
> +			reg =3D RK3188_GRF_SOC_CON0;
> +			grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3188-grf");
> +		}
> +
> +		if (IS_ERR(grf)) {
> +			pr_err("%s: could not find grf dt node\n", __func__);
> +			return;
> +		}
> +
> +		ret =3D regmap_write(grf, reg, NOC_REMAP << 16);
> +		if (ret < 0) {
> +			pr_err("%s: could not update remap function\n", __func__);
>   			return;
>   		}
>   	}
> diff --git a/arch/arm/mach-rockchip/rockchip.c b/arch/arm/mach-rockchip/=
rockchip.c
> index 82102fbabf92..c2b919ac99bc 100644
> --- a/arch/arm/mach-rockchip/rockchip.c
> +++ b/arch/arm/mach-rockchip/rockchip.c
> @@ -14,7 +14,6 @@
>   #include <linux/clocksource.h>
>   #include <asm/mach/arch.h>
>   #include <asm/mach/map.h>
> -#include "core.h"
>   #include "pm.h"
>  =20
>   #define RK3288_TIMER6_7_PHYS 0xff810000
>=20
> ---
> base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
> change-id: 20261017-cpu-c8f61c6466f9
>=20
> Best regards,

