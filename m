Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D8A30E0F2
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 22:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791066200; cv=none; b=acJFd5fmpKTK5k84KCaaKHsbjLVZvHOh1YnEZzgCBuOvUwP/Bq+dM8Eb/uQsRz+1DRx19An5T28eCRUvcGAMZR0eUkpXlnnF2jWvvC3sWVPYQUkhs5plyju4tYQeh1eZtXpZf3x1WFBnb/X5lH57m34svge6M3lzgHW6HB4T/30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791066200; c=relaxed/simple;
	bh=wxb8Bc+lSHcB3N8rgRRufGHFvK8NN/yscg4f7xItclI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nA11bvkm+WgRFEQA8Lx0/cGwVEacuFIMvoXuGEhLTPdRWgG+EWvvDjHcLKvUbpL1Xz+NpTy6a3wHeSoh6e0u0cOXzF+Mb9e6Z868VB/bC5wX/Jr161oDXD7++9UYoVzQpDT5p4ZAzqMi90nxnTd6A0t85MegbnvEwgBDS7b8VZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JR3VD1cF; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JR3VD1cF"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 423A740E021A;
	Sat,  3 Oct 2026 22:23:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7ee1uLUBtHOc; Sat,  3 Oct 2026 22:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791066183; bh=5hrh/8Cwmr8f4uSsVeKW9cGDDq9RMnSC2ZGUB+JZmxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JR3VD1cFzrD9upJVdw7jo6FfLjLNNRanCEkBeAg0KSfR0K145gVLhae+CKIp3yScN
	 xkQ5+V2Dp8vA5l9GVi81C6AwU7wOj4HlecBT39Lc5X4lF69vEl7szHY6pPTb+6ZJlq
	 Pf8DVjQ3eefze+tTcJNWvJkBTKDZzwbpGzQbu7/2ifVcINH2nT274qJKjNqAAFgDQq
	 KkfeLi4e1cc1pYH5HpCgOs7dRB3yINCj3zDlg6Ej72YZPxNNPzpMFRlYSA4sYZXErf
	 qTmsp3cLNkmcaWEyis462+OgiRkih5NOfWOSg/vmAEQ/Sli+akJz/tGH90CqUqkggd
	 1x/KQtAZn4CR6alQjB2pbJ32/GgontGxL9RMQV7G0JSPbDMxegfUGyH2eKURYxipLf
	 XLzS2oWy99rHd0jjzvGjBYAEBdSMK9wMowLQ6z/xn4oJUU7+7EHxqArZVd7a5PjkpR
	 SdOEFRT+OsyIiIgW+KvLLdb20+8JcqelivzSgXtUe/NpfFFSxhNXr3dOv3dk2lH42A
	 ldk58Uq1tBLUw8TSb5aYHYFi6o3uYzI6JrcrGnzEjfMg3HtM/kSo6fyseucbeDtuUN
	 pWI18tRqHwyUa33Goa04efHiucMV98kPAcHY+WLOp4lbU2QjFMu+9OEwB/tHu8DpTt
	 6poCRiMa9gx5/8MEvcC3cdtM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6E31E40E00E8;
	Sat,  3 Oct 2026 22:22:59 +0000 (UTC)
Date: Sat, 3 Oct 2026 15:22:56 -0700
From: Borislav Petkov <bp@alien8.de>
To: Alexander Lechthaler <alexander@lechthaler.online>
Cc: tglx@kernel.org, mingo@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch/x86/kernel/apic: Fix kernel-doc warning for
 spurious_interrupt()
Message-ID: <20261003222256.GKasGAQBcFjNuCmxK3@fat_crate.local>
References: <20260522194610.149471-1-alexander@lechthaler.online>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522194610.149471-1-alexander@lechthaler.online>

On Fri, May 22, 2026 at 09:46:10PM +0200, Alexander Lechthaler wrote:
> Add the missing @spurious_interrupt kernel-doc entry.
> 
> Signed-off-by: Alexander Lechthaler <alexander@lechthaler.online>
> ---
>  arch/x86/kernel/apic/apic.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> index 639904911444..114089c39a17 100644
> --- a/arch/x86/kernel/apic/apic.c
> +++ b/arch/x86/kernel/apic/apic.c
> @@ -2145,8 +2145,7 @@ static noinline void handle_spurious_interrupt(u8 vector)
>  
>  /**
>   * spurious_interrupt - Catch all for interrupts raised on unused vectors
> - * @regs:	Pointer to pt_regs on stack
> - * @vector:	The vector number
> + * @spurious_interrupt: Interrupt entry point
>   *
>   * This is invoked from ASM entry code to catch all interrupts which
>   * trigger on an entry which is routed to the common_spurious idtentry
> -- 

You go and find the definition of DEFINE_IDTENTRY_IRQ:

#define DEFINE_IDTENTRY_IRQ(func)                                       \
static void __##func(struct pt_regs *regs, u32 vector);                 \

and you see that it takes as a single argument a function which has two
parameters: regs and vector. This is what the kernel doc comment above
documents. Not the @func parameter to the macro.

HTH.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
