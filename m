Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30BC351C20;
	Fri, 25 Sep 2026 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328392; cv=none; b=AhD2SaafxyqhbeUcEeLjAOtkZDi+emQRHYFqQ5iPbqIWGrl2wA0LWcBRvsc6eWvUrgFKDV10Q3NqBZ8vlEe0i4hYISeiZZ70MPveg+LtmQoub5IAWoTb1Mex0qWmQ7cDelyYS/40Ww5hVaBwrDKc7TY1+b9rpoaO8lxyCVWCVyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328392; c=relaxed/simple;
	bh=3kjd6lZj1dIUtedJktMj1UoleqR9/JbTLWiLSRcewj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rD5+PvhyIpbC0aVXOXeKOjXQt4gyMoxDQASDW4i4xKrCUIsmuTagXhHaFYSVp81WOH13k3JaK8RjPMBgweoUaKMvgjXKGsbWhoSh/Mc1seawNt77c8GLS/9Yuv84LP+wP1dcetW0fv61fQaaW7KLZaQHaqQyk/3XgFELMuzD9q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TG6UsdHM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TG6UsdHM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96F3C1688;
	Fri, 25 Sep 2026 02:26:23 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23B893F86C;
	Fri, 25 Sep 2026 02:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790328387; bh=3kjd6lZj1dIUtedJktMj1UoleqR9/JbTLWiLSRcewj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TG6UsdHMPSeGq8RWseV0KrNzFW1yYNZcoAhoPJb+pCuWrkSYVje8gJNRx200IDpVW
	 AFFAKsMlumA3VQnJEnAvDx8FX7Sjjgm2LcTqHUMe/7RhcQzVIqgB7be3ZWQudoZp4v
	 jjROSC6mVXc8ucrhayAS/kPSypertZMowkz/8mu4=
Message-ID: <e78a2a94-ab4e-4c5f-8e55-e11b273ed8ec@arm.com>
Date: Fri, 25 Sep 2026 10:26:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: mpam: Document when to set arm64.nompam
To: Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, James Morse <james.morse@arm.com>,
 Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>,
 Bradley Morgan <brads@mainlining.org>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260908145622.2828319-1-fuad.tabba@linux.dev>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260908145622.2828319-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 08/09/2026 15:56, Fuad Tabba wrote:
> arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
> finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
> firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
> left unwritten, at reset values that are UNKNOWN, and KVM still hides
> MPAM from the guest but no longer enables the traps that stop a guest
> from using it. KVM never saves or restores MPAM0_EL1, MPAM1_EL1 and
> MPAMSM_EL1, so what one guest writes reaches the next guest and the
> host. Nor can the kernel make the EL2 writes unconditionally: they trap
> to EL3 on the firmware the option exists for, and TRAPLOWER cannot be
> read below EL3.
> 
> Say so in mpam.rst, and add the rule and a pointer to the
> kernel-parameters entry.
> 
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

