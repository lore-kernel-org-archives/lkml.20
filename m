Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1828C3E7621
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207844; cv=none; b=FkXVnOoXupG77R9APhIoL6QujVoZnGNs3kDIKkZi+mtwZof9Pd+mwKVbWVTQxx51huBnoGVA01Q0uNy+okWF0bsqVI6Ro1kDrKqKwbNTagBaH9TyBJlCr01DvuOsjD+M8wWGg57NtbsmoP19czNDRLNR2rcX3EweygOs7EfUQog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207844; c=relaxed/simple;
	bh=+IL7Tzvq3KcfLEaw4OP5IrwOuJkSe4KhPiVbBl2aB2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZH9i++oGGI+0fk8iOSV1J29oWgbCMlLDUZczNJGjm0NK71cXC8CEDr/gGrJGH0pRbdOiERI7yryIMduO2FJTQOpD6xaOWAJbKsP6gQgt2qvaADAMfaFNfEFEjJzpjt08EAhxzPedsq6/zaIZVxAsEwXYKCe547rYbOkA/9ADG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Rzi0ngmp; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Rzi0ngmp"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BA93B40E0173;
	Wed, 23 Sep 2026 23:57:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xsxdvwjdnxMO; Wed, 23 Sep 2026 23:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790207823; bh=bOHtXNMMkEBwN4x+OxdS7o69Cq9RgfPdC06EDtw6Yy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rzi0ngmp52kT8aXCll5udkX29NwifuHQp/VydO6v1PegNg3gRWaaN2jpAYj5efvQN
	 g4fiRjLes6US+u2EDED1+9jlhn06U+QLSkCJ/H9cC9TjMUCKpCMmf5Ks0M5mfvHZyM
	 HSp24LQaaclf2GndGk1YxAMBv49Sln1KwbFxp4LZpeTsxfThg6pvf0wqvdnl0YsVzx
	 Z4/cL9N38sRUXn3bEbA/ER6mR+Uj+/JTqFuOV+p844MKQFNeb+J9nnMxeuQjsgdjMt
	 F4wj4L8UyfHS7ji84X1QOPfYWvAtNKeweVievjOCgtztloJv+uC2Sp8ySgkL0EvoVh
	 e/Qy98SXvx+UQzPvAFKDUatWozHT9/+yyv2Nordz4T717vh8ORYNCEx1iCGAxzcKh4
	 8C/2dolDcngfdtDI2uIU0XWuvrZr4OxK9vWHd0gX9NQJOzbZSYmT3rxXSoha3r1b5h
	 0Wt7PNy5NasWxQBc/ia/gkJ65SQgrw/A4hMfciEewAJlNRQnz3H+aiPP7oTK2Elo6+
	 jd6ru1akeCSPPlpSpXT3fZnC3StdEMbzwBW6mfmovZD4OfegaS63EiVK4O/ZjbKIDh
	 uhr8Sf3d1XXrtGvQJ40jPGgfGRnGpz8KH3I/EHIQfbSY77Ch5sPSBK/uEvb9FmhenE
	 NdllqFbJGiYnZTfH8xHacsu4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6A8AA40E016C;
	Wed, 23 Sep 2026 23:56:52 +0000 (UTC)
Date: Wed, 23 Sep 2026 16:56:48 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrei Vagin <avagin@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	linux-kernel@vger.kernel.org, criu@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 6/7] x86/fpu: Pre-fault only required size of xstate
 buffer
Message-ID: <20260923235648.GDarRnQEsqvjRrA9yN@fat_crate.local>
References: <20260916232310.490786-1-avagin@google.com>
 <20260916232310.490786-7-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916232310.490786-7-avagin@google.com>

On Wed, Sep 16, 2026 at 11:23:09PM +0000, Andrei Vagin wrote:
> The kernel previously used the default task FPU state size (user_size)
> to fault in the user buffer when restoring FPU registers from a signal
> frame. This can lead to attempting to fault in memory past the end of
> the actual frame if the frame was smaller than the default size.
> 
> Introduce consistency checks to calculate the actual required size for
> the features enabled in the xfeatures mask, ensure that the provided
> xstate_size is sufficient, and shrink it to the actual required size.
> Use this validated size to fault in the user buffer.
> 
> Keep the strict check that the provided xstate_size does not exceed the
> default user_size for now.
> 
> Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
> Signed-off-by: Andrei Vagin <avagin@google.com>
> ---
>  arch/x86/kernel/fpu/signal.c | 38 +++++++++++++++++++++++++++---------
>  arch/x86/kernel/fpu/xstate.h |  2 ++
>  2 files changed, 31 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
> index 050e58691964..1c4d83f3c44b 100644
> --- a/arch/x86/kernel/fpu/signal.c
> +++ b/arch/x86/kernel/fpu/signal.c
> @@ -29,7 +29,8 @@ static inline bool check_xstate_in_sigframe(struct fxregs_state __user *buf_fx,
>  {
>  	int min_xstate_size = sizeof(struct fxregs_state) +
>  			      sizeof(struct xstate_header);
> -	void __user *fpstate = buf_fx;
> +	struct fpstate *fpstate = x86_task_fpu(current)->fpstate;
> +	void __user *buf = buf_fx;
>  	unsigned int magic2;

Reverse fir tree ordering pls:

	struct fpstate *fpstate = x86_task_fpu(current)->fpstate;
  	int min_xstate_size = sizeof(struct fxregs_state) +
  			      sizeof(struct xstate_header);
	void __user *buf = buf_fx;
 	unsigned int magic2;


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
