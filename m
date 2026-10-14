Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EDF37C927
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967679; cv=none; b=GKtyDReVDKqL4+bIT0Bj7FOtiB4UTntbJua3EY12gF59Eh6e2+fOiZSR3HPlxXBvOVu9a+O9X3AZKktTotV2S3uHMhVGguSBw8QB4pD0J7S4ZxG/qV7qNYamQWZadOMPIxYt5wqdIcGVhLlXz7Uwu1R2EIbyFOvReA5bBoaJXJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967679; c=relaxed/simple;
	bh=Q6hLmNiL3xlOWh5buUNU8ncFyJPGJBVfYwXcvawW/fU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNv8+TOmzxrLc1gWt7OkNdQpId0JOSXaUcM9l9pK0dCmVJ/HaKv21temZhBQp73ifniWAgka6nCAGBK5XIBUnQMMdaVFRO8812Zxyih2zR7/lu3hZC3Up/Ao7oVQyLpzi5T8z3s68gz0rouQe6YA5gtY4dDiwXJ+6FRB7svtdTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iuUFTKdm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iuUFTKdm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B58A1F0089A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791967675;
	bh=7ZOwtKbzSs5jhvicAd0kCF0YNh/oXG040bjobslvnUY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iuUFTKdmNflpr2zGOcgLRI6af5tKNsgVJnfvOfoTt/My0qyWK9/roCDtSQdUhsqcc
	 QJ1Dmn98mCMHN+LOhK9n3KQ+HqSEBQg/pzA9fKPLNorZdjTEBuPN2UIPEYH68Sh9dR
	 LJM0voMhZjoeiueNyArXId7bTmYr7xpOvDBINJ52SoViHkyV2ErwBZncLOyXIfSFEn
	 Y/FTJ2fsy8691AQ2hkCBgdq+PBGLpUEx1TTIZozLRZ6GdaN9jZdl1I9cF6CTg+v/9F
	 HLMrvauKdtQvE49XJdiuWCuSA7nRZLxSugkCOm3gecnaoHilXmRzMvSaDwBWdTHNYQ
	 LP6dwbkrLoqZQ==
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso27247745e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwoxmcOPF0iL9E/okkSbEIpNdLbQNfE9FsrvHU7HVEBTTzDWEDCzPkokIkMrd17B3YkQMA/7fv7NjjEMmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaOmfFkLg4sugR/EAY/MLUbywcmV0M8KloDLCISA5R4oRm1KUL
	IwXBYXRAbKIrcySwY0ZAEKgVUX3fA7USoBUWDnbBgANFm4H/CXTSvlmdqYia2DFA0HogeCqzTR3
	V8g0C7c3nArvemKL0kFK8kB/EuBIPuxY=
X-Received: by 2002:a05:600c:190b:b0:4a1:82cc:1e9a with SMTP id
 5b1f17b1804b1-4a18e4b2b25mr301538815e9.17.1791967673845; Wed, 14 Oct 2026
 01:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012131034.1026-1-cp0613@linux.alibaba.com>
In-Reply-To: <20261012131034.1026-1-cp0613@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 14 Oct 2026 16:47:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRY+tHOHTAj0N_C1xDks91-5PtdhmrGcO9pYnQOUM_mOg@mail.gmail.com>
X-Gm-Features: AclHuK-QtzubWf2t0mbfoZoD_8_OMKg294M-GgKqr1kCkyEkHT-Mzth_q5OWNaY
Message-ID: <CAJF2gTRY+tHOHTAj0N_C1xDks91-5PtdhmrGcO9pYnQOUM_mOg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Populate boot CPU topology on UP kernels
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	sudeep.holla@kernel.org, conor.dooley@microchip.com, atishp@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:11=E2=80=AFPM Chen Pei <cp0613@linux.alibaba.com>=
 wrote:
>
> RISC-V selects GENERIC_ARCH_TOPOLOGY unconditionally, so the topology
> cpumask accessors resolve into cpu_topology[]. The RISC-V calls to
> init_cpu_topology() and store_cpu_topology() are in smpboot.c, which is
> only built with CONFIG_SMP. On UP kernels, cpu_topology[] remains
> zero-initialized and its sibling masks are empty.
>
> The sysfs topology interface is available on UP kernels too. As a
> result, cpu0 exports empty thread_siblings_list and core_siblings_list
> attributes rather than masks containing itself, violating the expected
> topology semantics of this stable ABI.
>
> Initialize and store the boot CPU topology in a UP-only early initcall.
> This runs after DT and ACPI CPU discovery and after the memory allocator
> is available, before the topology is exposed through sysfs.
>
> SMP kernels continue to initialize topology in smp_prepare_cpus(). NUMA
> needs no additional handling because it depends on SMP.
>
> Fixes: fbd92809997a ("riscv: topology: fix default topology reporting")
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
> Tested on QEMU virt (RV64):
> - UP, default DT: cpu0 thread_siblings_list, core_cpus_list,
>   core_siblings_list and package_cpus_list all contain CPU0.
> - UP, DT with 32 KiB L1 instruction/data caches: the same topology
>   checks pass, and both caches appear in sysfs with shared_cpu_list=3D0.
> - SMP, 8 CPUs: each CPU's thread_siblings_list and core_cpus_list
>   contain itself; core_siblings_list and package_cpus_list are 0-7.
>
>  arch/riscv/kernel/setup.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index d79f99b86033..234d9af414b7 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -9,6 +9,7 @@
>   */
>
>  #include <linux/acpi.h>
> +#include <linux/arch_topology.h>
>  #include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/mm.h>
> @@ -370,6 +371,17 @@ void __init setup_arch(char **cmdline_p)
>         riscv_clear_hypervisor_csr();
>  }
>
> +#ifndef CONFIG_SMP
> +static int __init riscv_init_cpu_topology(void)
> +{
> +       init_cpu_topology();
> +       store_cpu_topology(0);
> +
> +       return 0;
> +}
> +early_initcall(riscv_init_cpu_topology);
> +#endif
> +

Good catch. Although CONFIG_SMP is enabled by default (default y), we
should still set the cpumask to BIT(0), so the cpumask stays valid
even when SMP is disabled.

Reviewed-by: GUO Ren <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
