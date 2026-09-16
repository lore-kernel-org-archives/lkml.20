Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D552BD00C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534432; cv=none; b=W5PQIXvqvA8uaFUhXKzlSnU6ON0Olw1Y1fmAA9BvfT1Eaz6m+DzGvAM3bWXPWUEqSg+ixLlpBywxuC31aI/5d3hht6i+rbByMi6+q2Dvk7d4lKDMN5hLGVAru0vFzyhDOA7zsZFQ77yqXS1+4YCl8RYDAeMYABN7eyKjqjknqwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534432; c=relaxed/simple;
	bh=WYZVxc5n/Hg9/CWUvIAX/woBW0LEL67QlMmahk15rwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLgQUSO3qYPWSRd/Y6Kb90KChQpnirx9TQESzh9Yu/7YXyvR5bYjrxO06lNE17+xQBAyLxz85MNDizZK4Tq1yY42T5x6NgzG1EPyWj8YFxVrkJUtDdHIHTf99Pa3KhI8K6h2RXErixEdlaveEvScmCC97gHZMRGCPixrSX4/A+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kC4Gpe5H; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kC4Gpe5H"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3D20240E015D;
	Wed, 16 Sep 2026 04:53:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nLyehoeXxplE; Wed, 16 Sep 2026 04:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789534415; bh=bdOsZ4CAgtYMSWtFDfDRVg3djUxr1e5aAuzWrPZ+v1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kC4Gpe5HIRpl6Ox5f8AYGR3B7RyZDa7kKc/xjbRNHYUkSbK53y/OK7X1G/jw6JnR5
	 hmkd7DNyloU5oRuGnVciTHljFFKRTZybCy1EeI0gwCxeP7CvN6/1A982atRLP26agr
	 4nWxwnGMyEpaOPdH2x4fzzwnU8K0SIM4zCY7Pjg5vAkveinR/lSsDcrnWS8AwpYsxN
	 8nlfEZ1wJfp6nKRH2sx5jwmekkSlTNHYlO85VBUrhVvT1XN7sqeW69cd6BD/MSAlZA
	 HG7j7rAEd8NWHJBJW8VH54fsyDOPYXMMhqqadxlxZQPK4ZoLukJ1QB/rQSkFg93bzs
	 /FNzvtWTlAo+O+FwwzUtLU/OuA/WRV7PE6GgX5cjwkYFjgu4pT7pZkurOFq/B7+7xI
	 abtUIn38v4D8X9jagut3UwWAniFZlkrVVqBJLqfp6nwaQp3i8HNsASMZhwjH72vmV+
	 mdRN/68tafNlif5pD631Ie65Atb+MruwM5FfX31Fs5BHr5nSRK0Kzz0UOtgyjpYrvR
	 pdpUzNz+2nBOeu5iQGpmB0tg+w736tehsMLOrFd4RmcuezsHfRaHGYAUyVTiS962+i
	 5B9enPO9bjf3xPiZnAGv5thLL7FprawitUbwO9js5z+Dcpi5bToSCqJfadYYPKh+Ea
	 oUAVd9yCi/3Crya2lDaWPclg=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9758C40E00E5;
	Wed, 16 Sep 2026 04:53:24 +0000 (UTC)
Date: Tue, 15 Sep 2026 21:53:21 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrei Vagin <avagin@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	linux-kernel@vger.kernel.org, criu@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/7] x86/fpu: Document signal frame layout and portability
Message-ID: <20260916045321.GEaqogwVlAjFS2yl5K@fat_crate.local>
References: <20260908043427.1842515-1-avagin@google.com>
 <20260908043427.1842515-2-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908043427.1842515-2-avagin@google.com>

On Tue, Sep 08, 2026 at 04:34:21AM +0000, Andrei Vagin wrote:
> The x86 signal frame is designed to be self-describing, with the
> 'xstate_size' field in the software-reserved bytes indicating the actual
> size of the context. This design is required for portability, allowing a
> signal frame created on a system with a specific set of xstate features
> to be restored on a machine with a different (larger) set of features.
> 
> Document the signal frame software reserved bytes (struct _fpx_sw_bytes)
> and portability constraints in Documentation/arch/x86/xstate.rst, and
> add a summary and cross-reference in <uapi/asm/sigcontext.h>.

No need for that paragraph - that's describing the diff.

> Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Signed-off-by: Andrei Vagin <avagin@google.com>
> ---
>  Documentation/arch/x86/xstate.rst      | 55 ++++++++++++++++++++++++++
>  arch/x86/include/uapi/asm/sigcontext.h | 14 +++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/Documentation/arch/x86/xstate.rst b/Documentation/arch/x86/xstate.rst
> index cec05ac464c1..92e5ff7dd6a2 100644
> --- a/Documentation/arch/x86/xstate.rst
> +++ b/Documentation/arch/x86/xstate.rst
> @@ -172,3 +172,58 @@ are extended to control the guest permission:
>  
>  Note that some VMMs may have already established a set of supported state
>  components. These options are not presumed to support any particular VMM.
> +
> +Signal Frame Layout and Portability
> +-----------------------------------
> +
> +The signal frame is designed to be self-describing and portable. This is
> +especially important for checkpoint/restore tools like CRIU, which may restore
> +a process on a different host than where it was checkpointed. A signal frame
> +created on a machine with fewer CPU features can be successfully restored on a
> +machine with more CPU features.

				... but not vice-versa.

> +Signal Frame Software Reserved Bytes
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

...

> diff --git a/arch/x86/include/uapi/asm/sigcontext.h b/arch/x86/include/uapi/asm/sigcontext.h
> index d0d9b331d3a1..d85226c67e19 100644
> --- a/arch/x86/include/uapi/asm/sigcontext.h
> +++ b/arch/x86/include/uapi/asm/sigcontext.h
> @@ -34,6 +34,20 @@
>   * fpstate+extended_size-FP_XSTATE_MAGIC2_SIZE address) is set to
>   * FP_XSTATE_MAGIC2 so that you can sanity check your size calculations.)
>   *
> + * The xstate_size field indicates the actual size of the xstate context
> + * (including the 512-byte FXSAVE area and the 64-byte XSAVE header
> + * struct _header). This size is used in conjunction with the pointer to
> + * the xstate context to locate FP_XSTATE_MAGIC2. In 64-bit signal frames,
> + * the fpstate pointer points directly to the xstate context. In 32-bit
> + * signal frames (including 32-bit compat tasks on 64-bit kernels), the
> + * fpstate pointer points to a legacy 112-byte FPU environment
> + * (struct _fpstate_32) that precedes the xstate context, so the xstate
> + * context starts at fpstate + 112.

Break that one into two paragraphs for easier reading:

 * The xstate_size field indicates the actual size of the xstate context
 * (including the 512-byte FXSAVE area and the 64-byte XSAVE header
 * struct _header). This size is used in conjunction with the pointer to
 * the xstate context to locate FP_XSTATE_MAGIC2.
 *
 * In 64-bit signal frames, the fpstate pointer points directly to the xstate
 * context. In 32-bit signal frames (including 32-bit compat tasks on 64-bit
 * kernels), the fpstate pointer points to a legacy 112-byte FPU environment
 * (struct _fpstate_32) that precedes the xstate context, so the xstate
 * context starts at fpstate + 112.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
