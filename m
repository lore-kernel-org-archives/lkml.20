Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8430253E319
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999254; cv=none; b=fnUKKAG9uDYPxf3K5YZF9wBwO8c6sEsaCafQ4HT5Ev96x/PQp2OXwzbAQ8IdkbWZEe/xsNPnvskygaKstg1lMoCyfOOuYANE/XVAWHZ4Ka7dgyFBWJZ/d3BA3ecW9g9NPEaKIGfR/+Rx86eLJZUk7T94bcjyY4mGmo+9Wa7jlBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999254; c=relaxed/simple;
	bh=NGSw4NWLY063IsbQ9QcsQyvRWG4TvjeFoEgi4ckRgJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ox2h25REKxh5scFClOYhon16iNt/Az1CTERQCQrjTrgTvmYAMg4YlfIeKUpFAWe/jHCAx66wdGens0rKJ4kORq6qU6aH5lVFoDouLEOfuSOkZ83K1qHaPH54T0Ju8PTWB2oYR/NbEXMbGgT+hfBvxd39IDKu09eaTzj2QFHpohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ed9jzPVK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ed9jzPVK"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B4DE14BF;
	Wed, 14 Oct 2026 10:34:06 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16DC53F7B4;
	Wed, 14 Oct 2026 10:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791999249; bh=NGSw4NWLY063IsbQ9QcsQyvRWG4TvjeFoEgi4ckRgJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ed9jzPVKD3Dbf+j/w2apV1LaDclbJKRz0kBoWUhXRN9eJSO09G91De2imrD6sUPx1
	 JSlYbIUtyXLfsCeP7zUci5nVyLEjhVYFfCh893B7fNXSJf5qGjg4Eeqr7cAnPeC8bS
	 57NmYQOS/uHDkP1Do9OYAyhcwtXpfipVaDXkUFiM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: (subset) [PATCH v2 00/23] arm64: Implement parallel CPU onlining with PSCI v0.2+
Date: Wed, 14 Oct 2026 18:33:59 +0100
Message-ID: <179199923896.3163732.3197497767996202998.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 09 Oct 2026 11:07:11 +0100, Will Deacon wrote:
> This is version two of the patches I previously posted here:
> 
>   https://lore.kernel.org/all/20260907164024.17164-1-will@kernel.org/
> 
> There have been quite a few changes since last time, thanks to all the
> feedback from humans and robots alike. These include:
> 
> [...]

Applied to arm64 (for-next/secondary-boot-prep), thanks!

[05/23] arm64: cpufeature: Check arm64_ftr_regs[] before the first store
        https://git.kernel.org/arm64/c/72add8bf4d57
[06/23] arm64: cpufeature: Add read_cpuid_with_overrides()
        https://git.kernel.org/arm64/c/cd9df8b01977
[07/23] arm64: cpufeature: Read MPAMIDR_EL1 in __cpuinfo_store_cpu()
        https://git.kernel.org/arm64/c/342e62ded77c
[08/23] arm64: cpufeature: Store every ID register with its overrides applied
        https://git.kernel.org/arm64/c/fbb6e5708311
[09/23] arm64: smp: Tidy up smp_prepare_cpus()
        https://git.kernel.org/arm64/c/9ddba588450f
[10/23] arm64: smp: Tidy up cpuinfo init and cpufeature updates
        https://git.kernel.org/arm64/c/f0a14972b5b5
[11/23] arm64: smp: Defer update of secondary CPU capabilities
        https://git.kernel.org/arm64/c/c8491bbf35e5
[12/23] arm64: smp: Don't bother printing the I-cache policy for each CPU
        https://git.kernel.org/arm64/c/6a52689f698a
[13/23] arm64: smp: Defer RCU registration during secondary CPU bringup
        https://git.kernel.org/arm64/c/e21f4de88aca
