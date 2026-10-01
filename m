Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909FE40B10C;
	Thu,  1 Oct 2026 16:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871194; cv=none; b=IKxzd2AydavGpg6LBgnLmgyfasuisdDsez0fSOupUmnEt9le8GtbOkZZlwfhS+oODwdEEyfK5+YVrTzfG1wPsTYLp2mPTyVcX88o2IQxpDqlNMUn7lGQeNn2xdBbjxIbtHrDMkSBXQWS/BIKBzk33la+6MiAqwdkhSObE8eHPrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871194; c=relaxed/simple;
	bh=0cqJO1i8WSHNskeho44J8qRuYt033EnjtqI998xdVLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HeKOdE0E+VxMbvhzlDroFGFlAatdm4nAtYAfTw3WBdQyaB0/nkPuT8Kgwg/altMaC3HNi2zJN+cJXdxPl0A6GYxPlB+r9dtczh+wt9KEzhHd77UHlBHirpH5foZUfnzdgHc56w/n12jFwpAqBxt9lc54ZwQo54CtJkvME/sQI+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DCCcMtQy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DCCcMtQy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A21E0497;
	Thu,  1 Oct 2026 09:13:08 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A23F3F85F;
	Thu,  1 Oct 2026 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790871192; bh=0cqJO1i8WSHNskeho44J8qRuYt033EnjtqI998xdVLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DCCcMtQy/wkDs/2F6eLa0NNzINJKgwlyP1VAk0K+TObn28mjmbiGmgHFgvKcIi8dB
	 T2hZQVCrVIRPwI+uir9LnRmql0HhMfI/sAmU2AW41HsLaHtBiXbSnGL+sErlMm791l
	 8nhhbu0fm1G+hPkSbgFB2hEE0ygrfpDvFTMwSpeM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Xi Ruoyao <xry111@xry111.site>,
	Marc Zyngier <maz@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: mpam: Document when to set arm64.nompam
Date: Thu,  1 Oct 2026 17:12:33 +0100
Message-ID: <179087115295.1106801.13408508563792829779.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908145622.2828319-1-fuad.tabba@linux.dev>
References: <20260908145622.2828319-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 08 Sep 2026 15:56:22 +0100, Fuad Tabba wrote:
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
> [...]

Applied to arm64 (for-next/mpam), thanks!

[1/1] arm64: mpam: Document when to set arm64.nompam
      https://git.kernel.org/arm64/c/eb0fde98fee4

(and this wasn't a pure mpam patch, should have picked it directly ;))
