Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF6054855D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085635; cv=none; b=LjoTh0aj5VodHRWM1Gl3meNG3uZKY5KEJxVYEbxu3Dt9HxM5R31236PszyegUaqGW/kawPuBJXuMDMTejRVjcOHaW43kYUjX5/aLQxS+PkGAgvUmG5SALulsbW1aVv/rdfbcklvRdwIhkuNa3a5qG47k0LocrlcqmRd5sz2WswM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085635; c=relaxed/simple;
	bh=aMSPwsonXUOJ1aXDqudRz657VCrZXxupM1rNcnO98Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQBo87DhAZejeObTx+4VfV32W2I3rzljPorgUu1NXfJp8Uu/FPvuyzgqxAtzffvKSRR/zoA7UMSgitA8RP69LqbgkCLLrymp43ZYZwxl4Z8+EhEnD+r1j2ZLMWadHjfx5+dFX1NS62LoVI6GYMkilakVsFFqiLRr9ZFn3iURU+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RkLVk7FJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RkLVk7FJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F192D152B;
	Tue, 22 Sep 2026 07:00:25 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6E923F86F;
	Tue, 22 Sep 2026 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790085629; bh=aMSPwsonXUOJ1aXDqudRz657VCrZXxupM1rNcnO98Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkLVk7FJUB6giUbh1Fn6LMGtU3EEBobOs9n5spdUMz3YF+mIhVVDbq6fPqZ+WuNQx
	 j5xQMBRSifB210fwLNNDOKVqnq0urdF7wEdPopC125+vKEKu+rbhPoQWVhpoHICqZh
	 0npYJQEaeuaNMZlcSAzrfnFfCUvpgu6SDBTFXikw=
Date: Tue, 22 Sep 2026 15:00:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 20/21] arm64: tracing: Advertise a mode of EL1t in
 synthetic kernel regs
Message-ID: <arKJ-T7fltE9u8qG@arm.com>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-21-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918161407.2300-21-will@kernel.org>

On Fri, Sep 18, 2026 at 05:14:04PM +0100, Will Deacon wrote:
> When synthesising a kernel regs structure for ftrace or perf, advertise
> a mode of EL1t to reflect the mode in which the kernel runs for the vast
> majority of the time.

For consistency, not that it makes any difference in practice, should we
also do:

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 79a19be88ced..c7f954f1ddbf 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -489,7 +489,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		 * be initialized by start_thread() or start_compat_thread().
 		 */
 		memset(childregs, 0, sizeof(struct pt_regs));
-		childregs->pstate = PSR_MODE_EL1h | PSR_IL_BIT;
+		childregs->pstate = PSR_MODE_EL1t | PSR_IL_BIT;
 		childregs->stackframe.type = FRAME_META_TYPE_FINAL;

 		p->thread.cpu_context.x19 = (unsigned long)args->fn;

-- 
Catalin
