Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA95395ADE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867032; cv=none; b=ZnIY5lh5WJbJvpZW2zBqvOXhF8urz+HjwKZlInKbqv2AeuSnnyOJtsSAO6nPyyn21Zp3fh7y0vsY7EuBPU05jmbzLfWzhsEBU9RHU32nClQw4iNqaBN4SqZ6m7ztEwxxrM9dFgvyMhgjt4OFe32eqqocMayQJ4N+z5ds+U466tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867032; c=relaxed/simple;
	bh=Uk1IB/yLUX5xMDeox1qyJEYqId4ibuxn8HZkM4l440E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ah0nG185ppFLZsxiRiox1PvCcKqTjDWl+MPF3dTvX5NgUrB7o8V1phL8Xh1PbDmaA7uZ744kpVjsBBhUxWo+ivXasYQLtH1i7rliZL8hRCYaFMqtc1q7iqjZDT8Cwbs7B6SB+5/Dcz4nbpq7PnEET5Y16rpDVXA5+hoNCQWBAHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1PzksPg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1PzksPg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1741F00A3D;
	Tue,  8 Sep 2026 11:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788867020;
	bh=e1G/5FmZL4xdw+0lMQfJjEPkPMKzHU5gOio8BHsZzuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S1PzksPg3GlnN60NnS8u3KBNEe7/XQ0UakTlKP1QoSmuhUcSbgqt1k4d09k6QY5wX
	 R/9SIIEU42bHp3YuHzLz0ykO3sWf6jDfuGfpYiTwelbaCgnyummIn86hf5NAOfSbol
	 IFk7BLyVI+n2ug1mifLTTcagY/wvvWa5q+6a7FNja8qDXc6zMT5mWVLU5lN9i2TppZ
	 9F0IallBAlbVkewMxKdEsSIdOUIsm7ROgvWPNx5TSc1CTZqTR2l9G8gSl4wOL2loYV
	 ncmPQ0rIuJEO9031Qc96uD7sn5Cvhm1LV7uCB5WMPDN0Fh58t31BxrLBxuF0KY26Wn
	 riiBYA0yJmNEw==
Date: Tue, 8 Sep 2026 12:30:14 +0100
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 19/21] arm64: entry: The great stack switcheroo
Message-ID: <ap_xxpoBi_x-7wF-@willie-the-truck>
References: <20260907164247.17223-1-will@kernel.org>
 <20260907164247.17223-20-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907164247.17223-20-will@kernel.org>

On Mon, Sep 07, 2026 at 05:42:44PM +0100, Will Deacon wrote:
> With the kernel stack pointer in SP_EL1 and the overflow stack pointer
> in SP_EL0, it is now straightforward to switch between the two on
> exception entry from EL1 by writing to SPSel. However, since exception
> entry sets PSTATE.SP to 1 (selecting SP_EL1 as the stack pointer),
> repurposing the overflow stack as a more general kernel exception stack
> would require writing to SPSel on every exception entry from the kernel.
> 
> Switch things around so that the overflow stack resides in SP_EL1, with
> the kernel stack residing in SP_EL0.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_asm.h | 16 +++++++++++++++
>  arch/arm64/kernel/entry-common.c | 34 ++++++++++++++++----------------
>  arch/arm64/kernel/entry.S        | 26 +++++++++++++-----------
>  arch/arm64/kernel/head.S         |  5 ++++-
>  arch/arm64/kernel/smp.c          |  8 +++++---
>  arch/arm64/kvm/hyp/entry.S       |  3 +++
>  arch/arm64/mm/proc.S             |  3 +++
>  7 files changed, 63 insertions(+), 32 deletions(-)

[...]

> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 12aacc74f764..0811fa569100 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -98,6 +98,7 @@ SYM_FUNC_START(cpu_do_suspend)
>  	mrs	x10, oslsr_el1
>  	mrs	x11, sctlr_el1
>  	get_this_cpu_offset x12
> +	msr	spsel, #1
>  	mrs	x13, sp_el0
>  	stp	x2, x3, [x0]
>  	stp	x4, x5, [x0, #16]
> @@ -156,6 +157,8 @@ alternative_else_nop_endif
>  	msr	sctlr_el1, x12
>  	set_this_cpu_offset x13
>  	msr	sp_el0, x14
> +	msr	spsel, #0

Sashiko rightfully points out that I've got this slightly wrong because
I've pushed the spsel toggle too deep in the callchain for the
suspend/resume paths. My original rationale was that the current code
already saves/restores SP_EL{0,1}, so we shouldn't need to change
anything. However, that's not quite right because it's the caller (e.g.
__cpu_suspend_enter()) which saves SP_EL1 as 'sp', so the stack toggle
should happen there.

I'll fix that in v2.

Will
