Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1632F12AB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411122; cv=none; b=moNH6s0qFCqkjegGa9WLOQHD7462XNsejNg884ZtnQYxU/rKctZAzadSh2XSlXsjNzQ+2nnjhpKLrDDIzI1R5vJ94V1cb/XuUn9vFQwWvsi4uLkTjvZTiaxrRKbUkvFRGVJmyM8qAFvhQPkWM+f3VdNCYnWxnyVEYUAnF+rXt2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411122; c=relaxed/simple;
	bh=Eh/uI/+cw0YRXseEyIE+nd1HHctdQFB9EIy2EzZUcXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/k7L4q6foHhLcMmCC4/HznzPYaaGQwIx1wpdF+B4XNUlJNbk2Y2VN7q0c/o6PDuknNP06667rCCVOOhJ7wgvS8EA4b/MQiacV08lh4FFZlD1nd/pVahj+/kubjXGKtXK+Km5OgTmjUs5SfDm2y2EQRibckDpQ2Z1nani1sjEpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=WmG/36+d; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="WmG/36+d"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B027E40E024B;
	Thu,  3 Sep 2026 04:51:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yXgz6CGWDa-Y; Thu,  3 Sep 2026 04:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788411106; bh=JRvskJnObM+TdVoCK+z7UvnGq+bAFm4DvLvyxS4pOkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WmG/36+dwbSpeNwXP2ygN/Pk8HL05vjVbrFIqeBBltxZXL0arJQEYwCUWYq0I4WAU
	 9pSz0dQxhHh78QBkmTNz0NaSgDYa//BUJKYBSsFXV4BdZd2EV8geesUg9mG3Ybcbd8
	 hSlknuxTPKPda07nRv3kkGx5Hxl52ORZ9M0xKDVjpe+mzrMgryUCOgZdICKQWYEgGk
	 9/qR9GcIzn4WkDvmjQ8Rd+oba8ohLapWIerTtcv9zRhSzO3pWeoKlic3vFnORq1Y1l
	 nqBnAWnz1mlJyUh57+WFlm7Bk8LB5K8xrQb+tXP67vVphp0kr+QdJn0UTBPQE6jEIi
	 CgzMhtG/IUAHmb/gR651+QeEQsTr26Wm5Ct+qnXqKWiFCVP7KZ0weROip4lf3WoNzY
	 LlXV5EWawHEEXZset/gAzl+K/WZ1qMu33+issGF4zfnpyV2JO/zEOz/c+msI9k1z7N
	 LH9IUC5d4D5s6/BemI858MgR0TUkd7S9rJlEllsaATuN927Z8zgfV4UZXGzJmHmBcT
	 Dw+9rirE9LQxRNBj3W/vt9SOuExRCx4lusZw5mN769yjysFurPK90k5+KnVyS/51oK
	 IeTvjjY/UUBkH9wHdmuTu+OzzkwRKHKwEyX2VxkaEMeMqcKONo2W96/nKwAC7Qgjpg
	 MWIIyId6x6FmJMmXEG74Pu4I=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D0B1740E027F;
	Thu,  3 Sep 2026 04:51:35 +0000 (UTC)
Date: Wed, 2 Sep 2026 21:51:32 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrei Vagin <avagin@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	linux-kernel@vger.kernel.org, criu@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/8] x86/fpu: Document signal frame portability
Message-ID: <20260903045132.GJapj81OfDk6q2uKJ4@fat_crate.local>
References: <20260817042048.1579415-1-avagin@google.com>
 <20260817042048.1579415-2-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817042048.1579415-2-avagin@google.com>

On Mon, Aug 17, 2026 at 04:20:41AM +0000, Andrei Vagin wrote:
> The x86 signal frame is designed to be self-describing, with the
> 'xstate_size' field in the software-reserved bytes indicating the actual
> size of the context. This design is required for portability, allowing a
> signal frame created on a system with a specific set of xstate features
> to be restored on a machine with a different (larger) set of features.
> 
> Document this contract in the uapi headers and Documentation/.

I think this sentence is enough to be your commit message if you're going to
repeat the same text from documentation here too.

> This
> requirement is critical for checkpoint/restore tools like CRIU, which
> should be able to migrate processes across machines with heterogeneous
> FPU capabilities.
> 
> Note that portability is constrained by the architectural XSAVE layout
> (component offsets and sizes); the destination machine must share
> matching component layouts for all features present in the frame. While
> layouts are consistent across CPUs from the same vendor for active
> features, differences can occur across vendors or if the XSAVE space of
> a deprecated feature (e.g. MPX) is repurposed for a newer feature
> (e.g. APX).
> 
> Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Signed-off-by: Andrei Vagin <avagin@google.com>
> ---
>  Documentation/arch/x86/xstate.rst      | 16 ++++++++++++++++
>  arch/x86/include/uapi/asm/sigcontext.h | 17 +++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/Documentation/arch/x86/xstate.rst b/Documentation/arch/x86/xstate.rst
> index cec05ac464c1..0b4d541ab6f8 100644
> --- a/Documentation/arch/x86/xstate.rst
> +++ b/Documentation/arch/x86/xstate.rst
> @@ -172,3 +172,19 @@ are extended to control the guest permission:
>  
>  Note that some VMMs may have already established a set of supported state
>  components. These options are not presumed to support any particular VMM.
> +
> +Signal Frame Portability
> +------------------------
> +
> +The signal frame is designed to be self-describing and portable. This is
> +especially important for checkpoint/restore tools like CRIU, which may restore
> +a process on a different host than where it was checkpointed. A signal frame
> +created on a machine with fewer CPU features can be successfully restored on a
> +machine with more CPU features.
> +
> +Note that signal frame portability is constrained by the architectural XSAVE
> +layout. Restoration is supported only if the destination host supports all
> +features present in the frame and uses matching component offsets and sizes for
> +them. While layout compatibility is generally maintained across CPUs from the
> +same vendor, differences can occur across vendors or if the XSAVE space of a
> +deprecated feature (e.g. MPX) is repurposed for a newer feature (e.g. APX).
> diff --git a/arch/x86/include/uapi/asm/sigcontext.h b/arch/x86/include/uapi/asm/sigcontext.h
> index d0d9b331d3a1..c01f55f1fc12 100644
> --- a/arch/x86/include/uapi/asm/sigcontext.h
> +++ b/arch/x86/include/uapi/asm/sigcontext.h
> @@ -34,6 +34,23 @@
>   * fpstate+extended_size-FP_XSTATE_MAGIC2_SIZE address) is set to
>   * FP_XSTATE_MAGIC2 so that you can sanity check your size calculations.)
>   *
> + * The xstate_size field indicates the actual size of the xstate context
> + * (including the 512-byte FXSAVE area and the 64-byte XSAVE header
> + * struct _header). This size is used in conjunction with the pointer to
> + * the xstate context to locate FP_XSTATE_MAGIC2. Note that in 32-bit signal
> + * frames (including 32-bit compat tasks on 64-bit kernels), the fpstate
> + * pointer points to a legacy 112-byte FPU environment (struct _fpstate_32)
> + * that precedes the xstate context, so the xstate context starts at
> + * fpstate + 112. This makes the signal frame self-describing and portable:
> + * a signal frame created on a machine with a certain set of xstate features
> + * can be restored on a machine with a different (larger) set of features,
> + * as long as the destination supports all features present in the frame
> + * and shares matching XSAVE component offsets and sizes for those features.
> + * Note that portability is constrained by the architectural XSAVE layout
> + * and is not guaranteed across different vendors or if space from
> + * deprecated features (e.g. MPX) is repurposed for newer features
> + * (e.g. APX).

Definitely split into paragraphs as Chang suggests and perhaps that text is
better located in the xstate.rst doc too with a reference to it from here
because it would be more accessible there and it reads more like
a documentation text than code comment...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
