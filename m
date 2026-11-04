Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801871;
	b=RQZAkWROHxBAmYgDsy9ZtToqlEwQWWaHYeWl6dqO2C2moVeXblgMLAgFBrNuLpNYRMwb
	 SPROYno37rq6ZC20eDKCeuUJ6yyVzA0tvq2NK/0NYjnEuNKFK97U1cEb/h35u/EyZPR+1
	 HSUFjrvkx99FlDp3u4MCDkVGRYGooufDOq6vdI0e9hbtUChoWaTO6256E3FCIeM7b7vW9
	 qx532b/KWdmbpakZ/daKK1C148eqaT23u8WwEk7yd+5lzx9avwzcjQDT8U8qadZx5DON5
	 CkkKF6WD/H5vCKtJ7ZpyPiEAJEHbYKCNDhPHDJN9ESDO9BFXO87Lh37Vmie90MdnR1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801871;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mLazd9emzOWsv3JaPQ5UUfvKLht8lch/HQcvpq8y3GY=;
	b=zNlSc2PVBwTCwzxz4YmnqlUr2nU2wX214AYUONB3bCjnJp6Yu6nBo8P/yYi8b3wSuLqm
	 5fS+0H+G3DJNkLVOoMLJdy6bY8G2gFkdxog3dyAGelCYNVBOfmMuMoYPaHWiXMnYqupY6
	 GT+QXk0zqW9RINVm1sYXAn/cmpFbQnqqdXipi0pm4ytgaJqD90JqElj+s7aNqrugosOre
	 kcwudj0ZoExsgSLp7HNOkrdnjtEJ+doPNWkrw1VvYNb7yJ7SIXAphGH3dGvj1aHYvPBGk
	 g3mYpZh8hap+BG8OSvpTkGaAuMbNA9C2tIwToeLsTP3QwhuTJuuFEQnmlG0fhd7bVow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iamqxdwk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F17606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iamqxdwk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2E81F00919
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801870;
	bh=mLazd9emzOWsv3JaPQ5UUfvKLht8lch/HQcvpq8y3GY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Iamqxdwk2AMMca8i7/sa2z4aGVs1ZDXisqqarwuSEFO+3gX2/sSG4TUL+BC4uv/Bv
	 L3j6c6puWYceKcRFV8e0mZmapVSU/u/ObthL2mpXj80NEkeGUTAj06Vf6WjZ9NrM59
	 Q7KUn1rKqcnYl4SnHEq5ay1vrWT+gP0zKBNZiRRbxJWWmgPin+8mVjjZZtnnXG9bf7
	 KByMP3W5TDkbOFQKDC2nhkOPA9VZmXeDF30DJP5h12OjObuRjoUEsvEetY9BLKQqnA
	 klLIqTxkaJzOkmnYBs6TI3dyDt/Tt0qK1cI62kKq/CzOKxdqBwTnaXxvS+hYTLHTTF
	 nuMpT3N5zxsGw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso672227e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:17:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzf3q25n+wmGOV1y1mHutyEygDmY3yKXB5owlJzrkEV3DnCoN1wkCjWz2ttF+vvg2lg891CI//wcEW/AdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D0AwiCPd4m1uYufTYeK3wUPXfGoRM9WBpfmZ9vOKG+li7ewWE
	YumYfTgGxrnbFchiB14pHH/v2GMmIOXNIKF9oZsWMHmtd155tC5brWMQ8B8c0cTt0nhonj2jt1M
	UNZmI/K0Agxt6v41kIAckB9X2uYom5+M=
X-Received: by 2002:a05:6512:114c:b0:5bf:b7d8:f38a with SMTP id
 2adb3069b0e04-5bfd95730ddmr5925507e87.37.1793801869245; Wed, 04 Nov 2026
 06:17:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104070149.41393-1-lizhaoxin04@baidu.com>
In-Reply-To: <20261104070149.41393-1-lizhaoxin04@baidu.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 4 Nov 2026 15:17:36 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i_fmYOzgiJhoe_NdWfEopnDGb_GHuKXtMp5HD_-2_uLQ@mail.gmail.com>
X-Gm-Features: AclHuK98DawDgpC2GZl5mXQB82W_aFxlZCFZTOvGX1cOlWUoWcXsJEy8Rra_a3E
Message-ID: <CAJZ5v0i_fmYOzgiJhoe_NdWfEopnDGb_GHuKXtMp5HD_-2_uLQ@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: intel_pstate: Use rdmsrq_safe() to read MSR_MISC_PWR_MGMT
To: Li Zhaoxin <lizhaoxin04@baidu.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:02=E2=80=AFAM Li Zhaoxin <lizhaoxin04@baidu.com> w=
rote:
>
> From: lizhaoxin04 <lizhaoxin04@baidu.com>
>
> Commit ed7cad0504e3 ("cpufreq: intel_pstate: Relocate platform
> preference check") moved the intel_pstate_platform_pwr_mgmt_exists()
> call to the beginning of intel_pstate_init(), right after the vendor
> check, so it now runs before "no_load" (intel_pstate=3Ddisable) and the
> other checks.
>
> MSR_MISC_PWR_MGMT is model-specific and KVM does not emulate it. In a
> KVM guest using a CPU model listed in intel_pstate_cpu_oob_ids[] (for
> example "-cpu host" on Emerald Rapids), reading it raises #GP and the
> unchecked rdmsrq() emits a warning with a call trace on every boot, even
> with intel_pstate=3Ddisable:
>
>   unchecked MSR access error: RDMSR from 0x1aa at rIP: 0xffffffffa4009342=
 (native_read_msr+0x2/0x50)
>   Call Trace:
>    <TASK>
>    intel_pstate_platform_pwr_mgmt_exists+0x3b/0x220
>    intel_pstate_init+0x1e/0x500
>    do_one_initcall+0x59/0x350
>    ...
>
> Before that commit, such guests typically returned from
> intel_pstate_init() earlier, either because of intel_pstate=3Ddisable or
> because intel_pstate_msrs_not_valid() failed on the zero ratios that
> KVM reports in MSR_PLATFORM_INFO by default, so the MSR was not read.
>
> Use rdmsrq_safe() and treat a failing read as "no OOB mode". The
> exception fixup already zeroes the result of a failed unchecked read,
> so apart from the warning going away there is no functional change.
>
> Fixes: ed7cad0504e3 ("cpufreq: intel_pstate: Relocate platform preference=
 check")
> Cc: stable@vger.kernel.org
> Signed-off-by: Li Zhaoxin <lizhaoxin04@baidu.com>
> ---
>  drivers/cpufreq/intel_pstate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
> index 0e6ae4cdda5d..67447280e86a 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -3649,12 +3649,12 @@ static struct acpi_platform_list plat_info[] __in=
itdata =3D {
>  static bool __init intel_pstate_platform_pwr_mgmt_exists(void)
>  {
>         const struct x86_cpu_id *id;
> -       u64 misc_pwr;
> +       u64 misc_pwr =3D 0;
>         int idx;
>
>         id =3D x86_match_cpu(intel_pstate_cpu_oob_ids);
>         if (id) {
> -               rdmsrq(MSR_MISC_PWR_MGMT, misc_pwr);
> +               rdmsrq_safe(MSR_MISC_PWR_MGMT, &misc_pwr);
>                 if (misc_pwr & BITMASK_OOB) {
>                         pr_debug("Bit 8 or 18 in the MISC_PWR_MGMT MSR se=
t\n");
>                         pr_debug("P states are controlled in Out of Band =
mode by the firmware/hardware\n");
>

Applied as 7.4-rc material, thanks!
