Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516C12868B5
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791734219; cv=none; b=AhEz/TSkfL00KYl4TwuqM+SNYqB4WKffcrLn6BsU5QUH7UzlSJGmNB1yWCZdT6FIIaP8ngfi2wBMvfKNtpuLYOGqIXVos5cOcREIAXAujtv7idtaCbdDl1ndVEvHSJet22qy/1maBBQrhYjEAZwDt9uniyFFaIgVdRd9YeO0eSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791734219; c=relaxed/simple;
	bh=/t4zx5Og9wfbmIVMOSkXHk6KzJKtNg94x4wZpHfMUKA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=dL9+T+2pLwXIEGZsGYAnB8rLQfSpT+WX1bGeJ0sCN8qphv8aiEcErOSAgEt5LEORF5OnhqW5U+7u+thKbfsWQUsCbU3MlCCYtEcIO7AByJmTFtIa/+SS5MWMCPN9NU0hzGjFPQbNv1aaXXRvSlvCpbfIpn4Ay3OoJ6AOGH7QmMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=wIBb1zYe; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="wIBb1zYe"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69BFuHSZ2326697
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 11 Oct 2026 08:56:18 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69BFuHSZ2326697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1791734178;
	bh=PvJ/7VwUrE5KAORKRkVStyTayxObpyUWBBrIQ1DvRuw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=wIBb1zYeUTIvDTGlHbS64eFeNhiQ6iUZ0GidockkUrYWRM+Uh34vh9ss0CU5B01pb
	 o0RjyXR3E8vQjV3qhcIcAR3J0lGyMZgMf7kdSZVrTsoNZKk677gs4kSLWbjrVVmwBR
	 yA4JFZiqsivSO1gWApF7K0wQLrOohTn8joibSLkSZNjtt0eUYfQABH6823TiqIHDkj
	 UwYgI71MjA8+Ljdzj09r6DOCQleGW57jUNSl7V+mPzklCdGuPgzix0Fe4YhtWt11pA
	 dQgvo/5GAHV3PCF0m92b/jkG6xSPFJAlGgGN6CMQvp4YjBZkfe5gNZTepOYnPe5glk
	 fTD0YRYkoC/qQ==
Date: Sun, 11 Oct 2026 08:56:10 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Jialin Wang <wjl.linux@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
CC: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/reboot: Disable CET in machine_real_restart()
User-Agent: K-9 Mail for Android
In-Reply-To: <20261011151807.263575-1-wjl.linux@gmail.com>
References: <20261011151807.263575-1-wjl.linux@gmail.com>
Message-ID: <4928ACDC-A246-4DD4-8814-AE680ADB7CD9@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 11, 2026 8:18:03 AM PDT, Jialin Wang <wjl=2Elinux@gmail=2Ecom> w=
rote:
>When a kernel panic occurs in an environment without ACPI reboot or
>8042 keyboard reset support (such as QEMU microvm),
>native_machine_emergency_restart() falls back through BOOT_ACPI,
>BOOT_KBD, BOOT_EFI, and eventually invokes machine_real_restart(MRR_BIOS)
>to switch back to real mode for a BIOS reboot=2E
>
>When kernel IBT is enabled, the indirect far jump (ljmpl) in
>machine_real_restart() jumps to the 32-bit compatibility mode entry point
>(pa_machine_real_restart_asm)=2E Because machine_real_restart_asm does no=
t
>begin with an ENDBR32 instruction, an indirect branch tracking #CP fault
>is triggered=2E Since ibt_fatal is true, do_kernel_cp_fault() triggers:
>
>  Missing ENDBR: 0x9a230
>  kernel BUG at arch/x86/kernel/cet=2Ec:133!
>
>This issue can be reproduced with virtme-ng:
>
>  vng -v -r -- 'echo c >/proc/sysrq-trigger'
>
>which launches QEMU with the microvm architecture:
>
>  qemu-system-x86_64 -M microvm,accel=3Dkvm,pcie=3Don,rtc=3Don \
>    -cpu host,topoext=3Don -smp 16 -no-reboot \
>    -kernel <vmlinuz> -append '=2E=2E=2E panic=3D-1 =2E=2E=2E'
>
>Invoke cet_disable() in machine_real_restart() before loading the
>trampoline page table and executing the far jump, ensuring IBT is disable=
d
>and avoiding the #CP fault=2E
>
>Assisted-by: LLM
>Signed-off-by: Jialin Wang <wjl=2Elinux@gmail=2Ecom>
>---
> arch/x86/kernel/reboot=2Ec | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/arch/x86/kernel/reboot=2Ec b/arch/x86/kernel/reboot=2Ec
>index 0fed6d0d7e32=2E=2Eeb23b8977de5 100644
>--- a/arch/x86/kernel/reboot=2Ec
>+++ b/arch/x86/kernel/reboot=2Ec
>@@ -114,6 +114,13 @@ void __noreturn machine_real_restart(unsigned int ty=
pe)
> 	CMOS_WRITE(0x00, 0x8f);
> 	spin_unlock(&rtc_lock);
>=20
>+	/*
>+	 * Disable CET before loading the trampoline page table and jumping
>+	 * to the real-mode trampoline=2E This avoids missing-ENDBR #CP faults
>+	 * during the far jump=2E
>+	 */
>+	cet_disable();
>+
> 	/*
> 	 * Switch to the trampoline page table=2E
> 	 */

Indeed, this is very correct=2E

Reviewed-by: H=2E Peter Anvin (Rosaic) <hpa@zytor=2Ecom>
