Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E926A46D560;
	Mon,  5 Oct 2026 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215812; cv=none; b=tfp7Etb2LS4LBiHk9gS+VY+iINdyCrD1IZe1kuzc0ptg+cONRrc6ulDg6uC8t6RWrXXBPRAkb7/7pxJxntUdZGuaEgmbSkuJrcJdNBZKodhyCLZ9aHxOxArVRo+Xtd/qhf9tCUCQCIWFQmJk290HoDCRxSUNn+geb/ucXSsZPKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215812; c=relaxed/simple;
	bh=San2EAcEagKWNRww0ZuEmzeFYQv9o6waaC9tjR1tUb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/Fg1l+DkWFSmU3wg2Ww3QgOgkhJO7APe6PCNl/Qad81tvLF58l49tmpw8z/vpQOx810IFZSbpX+Z+6Sxqshaf4syjmO+O7Vdmv1b/jWzFXjE6luLRO6cKP0Cu3Rla8GpTLiH1stuApe4m3dXC1SebWyHWRAFog58KoATQmlk0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=G6D+kfaG; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="G6D+kfaG"
Received: from CPC-namja-026ON.localdomain (unknown [4.213.232.17])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4C46220B7166;
	Mon,  5 Oct 2026 08:55:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4C46220B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1791215755;
	bh=Wdh829qJ7XTsvIb70ZlYNzuuqViCk8z9qtK/9ymW1Rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G6D+kfaGOqzocjmWkiioeyHDN4qlCVutn8sy+4QIiI0k3x9gKouT01ZrZPOgnZTm1
	 oKRlmLH/e/gmmcXjlokxn3eq06IvEmhRELqzUj0gnTPZERik/+Vebd59c0oBIhhkvZ
	 mz+g1Yh7ZIQsG3/BXpeOIgwpgPgqPNi7cr3FYrAA=
From: Naman Jain <namjain@linux.microsoft.com>
To: decui@microsoft.com
Cc: bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	kameroncarr@microsoft.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	namjain@linux.microsoft.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	x86@kernel.org
Subject: Re: [PATCH] x86/mce: Report unavailable MCE support at informational level
Date: Mon,  5 Oct 2026 15:56:41 +0000
Message-ID: <20261005155641.272139-1-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923173033.4104944-1-decui@microsoft.com>
References: <20260923173033.4104944-1-decui@microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 10:30:33AM -0700, Dexuan Cui wrote:=0D
> mcheck_init_device() reports an error and returns -EIO when=0D
> mce_available() is false. However, MCE support being unavailable does=0D
> not necessarily indicate an initialization failure.=0D
> For example, a TDX guest with TD_CTLS.REDUCE_VE set and=0D
> FEATURE_PARAVIRT_CTLS.MCA clear does not enumerate the MCE and MCA=0D
> CPUID capabilities. This is an expected configuration, but it causes=0D
> the kernel to print:=0D
>=0D
>   mce: Unable to init MCE device (rc: -5)=0D
>=0D
> MCE can also be unavailable because it was explicitly disabled with=0D
> mce=3Doff or nomce. When it was disabled due to an earlier initialization=
=0D
> problem, the relevant path already reports the reason.=0D
> Report MCE unavailability at informational level and return -ENODEV=0D
> directly instead of routing it through the common error path.=0D
>=0D
> Signed-off-by: Dexuan Cui <decui@microsoft.com>=0D
> ---=0D
>  arch/x86/kernel/cpu/mce/core.c | 4 ++--=0D
>  1 file changed, 2 insertions(+), 2 deletions(-)=0D
>=0D
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/cor=
e.c=0D
> index f3a793e3a6c8..24ac10075263 100644=0D
> --- a/arch/x86/kernel/cpu/mce/core.c=0D
> +++ b/arch/x86/kernel/cpu/mce/core.c=0D
> @@ -2825,8 +2825,8 @@ static __init int mcheck_init_device(void)=0D
>  	MAYBE_BUILD_BUG_ON(__VIRTUAL_MASK_SHIFT >=3D 63);=0D
>=0D
>  	if (!mce_available(&boot_cpu_data)) {=0D
> -		err =3D -EIO;=0D
> -		goto err_out;=0D
> +		pr_info("MCE is unavailable\n");=0D
> +		return -ENODEV;=0D
>  	}=0D
>=0D
>  	if (!zalloc_cpumask_var(&mce_device_initialized, GFP_KERNEL)) {=0D
=0D
LGTM.=0D
=0D
Reviewed-by: Naman Jain <namjain@linux.microsoft.com>=0D
=0D
Regards,=0D
Naman Jain=0D
