Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF803955C6;
	Thu,  1 Oct 2026 16:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870425; cv=none; b=kGZVRKFGQpTI5UhlTznZvob11M/AVMHP6xJwdZdGU8QfBELMqmOlITp0LSrUev3iHHoH+Htt1x8fuSavCBX4vdcHqnIqK+MSK2p7FLdUhDVACfovx5jLEQsajDIbq+IOossAabeIETzJswqZ7ZJ4KSHX2cn944gJ/1jnjaIRfOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870425; c=relaxed/simple;
	bh=0anjATVLl2lFF6xlG/CGUPt6vidLI3eT3YTi5MQ///E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Whyq7Raucr1BUDvSweB+kLslB1CUJh8Q0TgOnW1X18dcxyxuJQQJ3EzSbGtbPu7+yxf4K4QrqfXldyUp5/PdWmR1CxKcO6NPueMFND44G/cMvRPebagZXU6aCE2byR4ITHuAOJQxBYpJK0V2PUOuxuEMrZIbPLnh/Rx8t4rIYvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=G3xWRSBQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G3xWRSBQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FEC4497;
	Thu,  1 Oct 2026 09:00:20 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3D223F86F;
	Thu,  1 Oct 2026 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790870423; bh=0anjATVLl2lFF6xlG/CGUPt6vidLI3eT3YTi5MQ///E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3xWRSBQWtIqgglyOJmaSWMX/UDPwmvoExYNxIE0ePHLzqcWUzcwVZv1byOMMam6F
	 BlWIyCHOtKna0FkFlcn0tMPdzXPBFB0xm9fjDAkBMrZWqxVeLGRUfe2Xt/5+PchBwC
	 uoDb3hZ+SDpHJdALdRv8yXyTynyk3G2mqkOJJY5w=
Date: Thu, 1 Oct 2026 17:00:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <tabba@google.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
	Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: mpam: Document when to set arm64.nompam
Message-ID: <ar6Dj_frEGFBGWY8@arm.com>
References: <20260908145622.2828319-1-fuad.tabba@linux.dev>
 <CA+EHjTy6+JpcdwuP3wnxK9n2iR0REM7nFgxkLaS8RAOST4KY5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTy6+JpcdwuP3wnxK9n2iR0REM7nFgxkLaS8RAOST4KY5g@mail.gmail.com>

On Mon, Sep 28, 2026 at 07:56:14AM +0100, Fuad Tabba wrote:
> On Tue, 8 Sept 2026 at 15:56, Fuad Tabba <fuad.tabba@linux.dev> wrote:
> > arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
> > finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
> > firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
> > left unwritten, at reset values that are UNKNOWN, and KVM still hides
> > MPAM from the guest but no longer enables the traps that stop a guest
> > from using it. KVM never saves or restores MPAM0_EL1, MPAM1_EL1 and
> > MPAMSM_EL1, so what one guest writes reaches the next guest and the
> > host. Nor can the kernel make the EL2 writes unconditionally: they trap
> > to EL3 on the firmware the option exists for, and TRAPLOWER cannot be
> > read below EL3.
> >
> > Say so in mpam.rst, and add the rule and a pointer to the
> > kernel-parameters entry.
> 
> Gentle ping on this one; it has Ben's and Bradley's R-b. I think it
> still stands regardless of the other cpufeature work going on now.
> Anything else needed for it to go in?

Normally I expect a pull request from Ben or James but they rarely send
one in time ;). I'll apply it directly.

-- 
Catalin
