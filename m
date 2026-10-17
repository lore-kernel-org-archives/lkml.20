Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7763B71A1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792271057; cv=none; b=YKajON0HwTygN3LKqh4w6+UI69TBImIoIPMVwrTiIZeEcYO2bh/S60N0HHsLQEKnRyZjlBC9RLMLu8XVX2HdlBgBrokrhc52wNI9D7svnj/cQWJAWpgguuh5YCJQYnHk9BKbswIvhKJaOtP96HuSL40yl5vyH5ha57UNBZuHZPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792271057; c=relaxed/simple;
	bh=HwWzw3xfEq4jvKDTMeX4EgBvXHItR2vDR0d1ycZ4Q5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TV2NApgFjBSKR84UDoZNPB87snKW1+/WkIyx7eF2MPlxbvDeajWYxZRuhGITONx5ITIsPP1t/KlsBoSExRsWNKWPF2bOCCi4JxCK0b7h82EAmrugG6YH26z9CZry8l69PIe2TfrFPaN0/xoCB3Xw2Bl9ay5kjTtyu/WpZ48ANr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtrLfmej; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtrLfmej"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F661F000C4;
	Sat, 17 Oct 2026 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792271056;
	bh=HwWzw3xfEq4jvKDTMeX4EgBvXHItR2vDR0d1ycZ4Q5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=OtrLfmejYm8UHuk1OKAhzA+DjaescCZC3UOm3QZQHzLweagFpurnzmUhtR3HCV3Hf
	 Hfe2Ug0cCvprAYkTNOHqnCTO5UXqYKpnjXSar4tMZBvdYtHZybpOG1rQjxHGiUw4y9
	 8SrFKNj5YvOPEmjrSpTk4f1UO99d87bhIPsD4RhiGnruuVOotApKtJxYSG+I6MRNUC
	 560TW7Kz33WfH6nyu4J6ZndrfGQweSR6g99+K+L8OtangLL00Ea0/cYolc6kpx8XQU
	 VFZiFdQx3e1I27Ee1HE26BxRjBCmtlwOo85pUZ1bBVEl2Tyeh8/NaIGtLNtBZ3uN9+
	 Q+I6qPSGBZYfQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Cc: linux-kernel@vger.kernel.org, dmaluka@chromium.org,
 vineethrp@chromium.org, chuanxiao.dong@intel.com, jaszczyk@google.com,
 Grzegorz Jaszczyk <jaszczyk@chromium.org>
Subject: Re: [PATCH v2 0/4] x86/apic: Switch to x2apic driver early if
 x2apic is enabled
In-Reply-To: <20260924104102.3534474-1-jaszczyk@chromium.org>
References: <20260924104102.3534474-1-jaszczyk@chromium.org>
Date: Sat, 17 Oct 2026 23:04:12 +0200
Message-ID: <871p9oca43.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 24 2026 at 10:40, Grzegorz Jaszczyk wrote:
> During early boot, the generic x86 kernel defaults to the MMIO-based
> APIC driver (apic_physflat). When booting (e.g., via kexec into a
> crashdump kernel) with x2APIC already enabled in hardware and without
> ACPI MADT probing (e.g., !CONFIG_ACPI), the APIC driver pointer remains
> set to apic_physflat until late_time_init() runs x86_64_probe_apic().
>
> Because check_x2apic() detects hardware x2APIC mode and sets
> x2apic_mode = 1, the APIC MMIO fixmap is not mapped. If a pending
> interrupt fires in the window between local_irq_enable() and
> late_time_init(), native_apic_mem_eoi() attempts to write to the
> unmapped APIC EOI MMIO address, resulting in an early boot page fault
> (#PF).
>
> This series restructures early APIC initialization and installs
> apic_x2apic_phys (or apic_noop if the APIC is disabled or built without
> CONFIG_X86_X2APIC) as the default APIC driver in apic_early_init(),
> ensuring safe MSR-based or no-op APIC accesses while still allowing
> later APIC probing (e.g., upgrading to apic_x2apic_cluster) to proceed
> normally.

Reviewed-by: Thomas Gleixner <tglx@kernel.org>
