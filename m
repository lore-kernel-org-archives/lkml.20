Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124093;
	b=Nnw1PwVcHMGT/uhKoFI6g8dHO40wL1B3j7zUUqkx7zlt2MWIwno/By9/6RyFCj5w+1K2
	 xwZMGmtDIdDErxhxU3EkOXeNxWGINDf/SeRG9bVA1PTw0Zla48Wd3dU26DxXOhpRylnPQ
	 9R+brz58u1Z/MvwYvBAcN9104VnkVFQRgduuKGYHYQR4beKwC1RYbUTaKour2W+vu4ECR
	 vvkcApNJISkVK/0wBdVUqwgmZAq5VSU0niQkxnAWG5CoBgy6o66Lv5Fc1ERnAjDWnBDyi
	 cV/dT0NANVdkF1k0JfGaqGiKQ9eMq7AaKgqoPyLEFSDeVMI3rmtbMCLoBGKXYGlYcxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124093;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=00EXCs1IJceogw1dEIv8XP/z2EMeWnrwYAJ3rGEmUmY=;
	b=Vo6/bGvBNjqkgGQq2y7wp9Na0XpI6PkhY7CReTnlqHpMYBxqF00pKNjWo9abIPKHNNhw
	 fJ2fTXYPbuMfecJyNb60q4vU4fl8y7LGICaa3Yot4mpdqcmGa7C5l3xPufVKgfOViT+oU
	 IsgfMwbBK9slxSczfTjnK+CnP+nggGby6nLpVJhoCmuMt9hhuvEiQOEB6sWevknwidXiP
	 YVcANaIm/O+1mN2vHMEBM+NoB30/4MojN6Dje2F55+k5kjcgYwC++wDgiY86vgNGpoX1a
	 PSOyVbMEVil8vZV6Nu8P8SRF8BH8XenWEIwpvDxS+YLijknLtcrRVQdjScaHR5MOF4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Y3LDGJbS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lAikjo76;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5136E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5136E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Y3LDGJbS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lAikjo76
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793124091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00EXCs1IJceogw1dEIv8XP/z2EMeWnrwYAJ3rGEmUmY=;
	b=Y3LDGJbSvuVLeJl4TzTPIjzVCWKsgocPyk5LH23CfHTqd8dGsOQwN5dEmNliH3Mes5GODH
	11mrfJzC4yNUm2Piq+L9ACm79jc4IEdJdMlw+wKUmVvEA+6Mnk7akxGda2jXXdE/97VtER
	VsFa4yar6Ld8NlItM5HzlNFC65ewKOpmxRu+l/8FzcPgi0hh2Y3i34NVwIBocyVYzbbd54
	YTojJ6FzqIQHopej7q6yb8jvN1hOkvz0qMl/KvVGLOuAhZZ3/F385ADfjl53JGLbMO4xZn
	PRVzaj/szDE0lRBHGXld6qYQvKhajnJI8yR3spLEtx7lj8zD921lqvW69ue/0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793124091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00EXCs1IJceogw1dEIv8XP/z2EMeWnrwYAJ3rGEmUmY=;
	b=lAikjo769VGF/w19ZvNOw5C3kvAzc5X6fXEw8Ul2SbmN1iI4qL+eajjG/J1q7XuOouZM/c
	aQn9uD9OUj+Xe3CA==
To: Breno Leitao <leitao@debian.org>, Petr Mladek <pmladek@suse.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Rio <rioo.tsukatsukii@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
In-Reply-To: <auDibpMWv7mkdRTW@gmail.com>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz> <87bj8kkfwk.fsf@jogness.linutronix.de>
 <ats4n8snmReT7Nc9@pathway.suse.cz> <auDM_p2_nwVkw_0n@gmail.com>
 <auDibpMWv7mkdRTW@gmail.com>
Date: Tue, 27 Oct 2026 19:07:30 +0106
Message-ID: <87v76n2fb9.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-27, Breno Leitao <leitao@debian.org> wrote:
> On Tue, Oct 27, 2026 at 09:12:09AM -0700, Breno Leitao wrote:
>> So netconsole, or any CON_NBCON_ATOMIC_UNSAFE console, prints nothing
>> on kdump hosts.
>
> For flushing unsafe on nbcon on hosts with kdump environment, this seems
> to do the work, but, maybe this is too unsafe !?

For the general case, it is certainly too unsafe. As I suggested [0] we
need a way to allows users to make this decision. nbcon was designed to
allow for printing policies, but we have not yet provided the interfaces
for the user specify such policies nor the mechanism to enforce the
policies.

Perhaps we need to begin by identifying all the sites where the current
kernel is ending (whether reboot, shutdown, panic, kexec, hang).

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index d0bd2d0cf8990b..9f1a89e301ff01 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -140,6 +140,8 @@ void __noclone __crash_kexec(struct pt_regs *regs)
>
>                         crash_setup_regs(&fixed_regs, regs);
>                         crash_save_vmcoreinfo();
> +                       /* Flush consoles with an unsafe write_atomic(), e.g. netconsole. */
> +                       nbcon_atomic_flush_unsafe();

I am guessing that the CPU is _always_ in emergency state here?
Otherwise the flushing problem exists for all atomic consoles.

>                         machine_crash_shutdown(&fixed_regs);
>                         crash_cma_clear_pending_dma();
>                         machine_kexec(kexec_crash_image);
>

John

[0] https://lore.kernel.org/lkml/87bj8kkfwk.fsf@jogness.linutronix.de/
