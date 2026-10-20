Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491820;
	b=vF+Tkh13XVszUpU+oFgZ3PrQpvD+CRatLpik/DK5e7uh7L2B/f42+QtXe0Qyx76PJCVc
	 p+usCLAycWK6UL9IWr1XS/guLePncNS5udX2QRRpuH5qmPkP/1zd75EL9Jm1DakPjwjlc
	 iy+AAvBRtdu3NIonaDIiFDDt8mwrx8NuKe763sgmqbKAAkQNM/8rLRl5QXiGQ4yBzypD1
	 eMwtjcm2h4nbf9yIuCp1eFGL5/DmYJZq/9tm7jX0fCOAsMCnONfK9m0N7CHXmmGrBB7MB
	 VRL5dtpfysJRZpMWr4hp/pRnjQWoHEC1syhhCRvlaVVwnh/uV6PgdMDWicxR16IAqAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491820;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ML0UmfiruTUSdKxIKCeHCoi5WSh7jgGq5RZtN6SxqAg=;
	b=zStiEoou7GWhT1J40KQg3gTQJNPsZXkgcA5ZsG6BPsW3S5aOC4k9/ihAJqj+uDRkaTAZ
	 +DiGBBDAYndcT/8SiTyxSO/PIGEgSo6F/sU9WynUwIrUuG+R7Nb5+8b9c/9bEWhonbxzO
	 Yr0nLFOwlsTKaGuTkz8KZLx9S6lDZ/zRp6RgVNb+cCc2v2ODLfVlLqMkEP+9iFI60VNBO
	 d7I66s9v983dQSu1wd0MhxsvSvnEUc5RjIgezACUo6L22u2tdx9UR+orTJ4KV40lfvHIs
	 OBgsjadvT+8oAy2O2AhfLHxBeuOkagcOX7DILApWQlgWXHazAkhNZgWuDShYLHqovfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JTZVy1pV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF510606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JTZVy1pV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2711F000C4;
	Tue, 20 Oct 2026 10:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792491819;
	bh=ML0UmfiruTUSdKxIKCeHCoi5WSh7jgGq5RZtN6SxqAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JTZVy1pVM/a/4me4eW4pvaHNS0leaFQUabFv/BPfhjPfLrANJSOZtydZEQJG/Kfdt
	 HP/c2+A4IOS7Z3h5jkJmrikgr/slKS/Z40WZhgYXlCnRoJsRyMJkqx25RaqWdjRbir
	 4tXZsJl5lwQj/1ga+XILQJZcxgnsdsLSyxzuCCdI0+QC1OyDk0kay043YBaCQSgqlM
	 o5NbPGXItPvLWoZGmfwSbzNna+vjzFfiqKwrGGXCRd8dsUFOsTsvRQuCjaXupiKyqM
	 1I3uFCmYjwyq8/iLQl/Gm0GxsOuqcufcwdGk6Qt5gyTxNaH23s/7Q4/S/R9jNfBm6I
	 IVejnupjebIlw==
Date: Tue, 20 Oct 2026 11:23:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, sudeep.holla@kernel.org, conor.dooley@microchip.com,
	atishp@rivosinc.com, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Populate boot CPU topology on UP kernels
Message-ID: <20261020-unsent-commuting-91739a882031@spud>
References: <20261012131034.1026-1-cp0613@linux.alibaba.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lNdLKYfrJyJnocyx"
Content-Disposition: inline
In-Reply-To: <20261012131034.1026-1-cp0613@linux.alibaba.com>

--lNdLKYfrJyJnocyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 09:10:33PM +0800, Chen Pei wrote:
> RISC-V selects GENERIC_ARCH_TOPOLOGY unconditionally, so the topology
> cpumask accessors resolve into cpu_topology[]. The RISC-V calls to
> init_cpu_topology() and store_cpu_topology() are in smpboot.c, which is
> only built with CONFIG_SMP. On UP kernels, cpu_topology[] remains
> zero-initialized and its sibling masks are empty.

I'm curious about arm64 since they've got the same as us as far as I
know. Is the same issue there or are they solving it in a different way?

Cheers,
Conor.

>=20
> The sysfs topology interface is available on UP kernels too. As a
> result, cpu0 exports empty thread_siblings_list and core_siblings_list
> attributes rather than masks containing itself, violating the expected
> topology semantics of this stable ABI.
>=20
> Initialize and store the boot CPU topology in a UP-only early initcall.
> This runs after DT and ACPI CPU discovery and after the memory allocator
> is available, before the topology is exposed through sysfs.
>=20
> SMP kernels continue to initialize topology in smp_prepare_cpus(). NUMA
> needs no additional handling because it depends on SMP.
>=20
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
>=20
>  arch/riscv/kernel/setup.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index d79f99b86033..234d9af414b7 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -9,6 +9,7 @@
>   */
> =20
>  #include <linux/acpi.h>
> +#include <linux/arch_topology.h>
>  #include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/mm.h>
> @@ -370,6 +371,17 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_clear_hypervisor_csr();
>  }
> =20
> +#ifndef CONFIG_SMP
> +static int __init riscv_init_cpu_topology(void)
> +{
> +	init_cpu_topology();
> +	store_cpu_topology(0);
> +
> +	return 0;
> +}
> +early_initcall(riscv_init_cpu_topology);
> +#endif
> +
>  bool arch_cpu_is_hotpluggable(int cpu)
>  {
>  	return cpu_has_hotplug(cpu);
>=20
> --=20
> 2.50.1
>=20

--lNdLKYfrJyJnocyx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatdBJgAKCRB4tDGHoIJi
0k2sAQC3ls6D+/fV87AdRfYvfN0Wu5FBH4WolErHmt1Fa1L0EgEAz4YWntD3aBPa
CXxCATphliqY3wtPb5Bt/1h12pc+PgE=
=3M1n
-----END PGP SIGNATURE-----

--lNdLKYfrJyJnocyx--
