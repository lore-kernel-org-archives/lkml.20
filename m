Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576501;
	b=kdcXhoZf5PDljkYAx3ZDx8ephpdEyjnZUIY2M/Pqtt2altfWkE6PKUd4OPFNKiycSHbM
	 aRtZf1DEziq3O+Z3weIWdDTiFh5+3UaQGByXLHYElsnEGAF0ufWXjOOVpH6oAzgvd0doN
	 PkMpzvuQIJUOM/0RkRtyPpJdOrlWv6WBGKgskhj0qHQKMYKLtRYFCry3FqgsJfCLV0g5o
	 f9ymsEAFRb6GR1ZaTz3zfN7o/r8wplLU6MjMwfsldE9RqEU+kum73jswcqAyDISuy045f
	 4bIGhNQVbx/d4ph1AX1FJ4PgO8CT/vCcI2m0dHzGkfCPvA8TT2kjM5MVBopJZgBfm0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576501;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MExLNxo30QD12Kyb4ucdYdonXGQpRob/JKPTjbdcYUw=;
	b=ogocmcFuHUGytuoZa4bd3SXl2imftufRbR3A0GNxmJ6x800DKsq7I0vLBpRcVgTNmqnU
	 JL6e1MmdSo8aJVSr2jEhdApJsCOb0jchy02mgE5mCPx/TarTBoxU6SvqhBexlEiNVPAz/
	 4TfsEC4OVcsbpLGtTZS9+/MbbZvDmZdTzN1vV+RX5+JmLMqD8d2Nihao9WiYL1fE5TItc
	 2M3wkCI+Qka6jPZUANJ0tON2vxjA4U0GHzK39uI9VxNk41yTnfgtyta5Nod3xD5NGXD/d
	 Uw6JKQ7NIB2JlOcO5Hxl7UT0CG+HrnfZ84PfTuEPv8a/25VkGMh2vguoQtlE0MeclwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJauNYda;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C963C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJauNYda
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961C41F000C9;
	Wed, 21 Oct 2026 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792576500;
	bh=MExLNxo30QD12Kyb4ucdYdonXGQpRob/JKPTjbdcYUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nJauNYda1heiTixpeplj8GOZdEBNqEA0ekDZR9zS0GMSGpmpz0B/C4SnzBNSo9i+F
	 YzoqB+8NzevEcE2A6zUu+vXa301b7gwLeERoXhFjvZQTFa48EDGeWUhht8zm010/WE
	 jbnQO945QwVDZC0un3iSyZHkEGGicdtsuhXc/iinQHSiwyZo8kE/CAezr2US3S9bOY
	 lC9Py4vn4mmQSUoB78bqYgntKcK6f5mS4Q4HXO2yi65CwopqmT9rDjgHw+qwfnctoh
	 C5f8UpRbCRCIQ+G6tsHs0w0qCVv3p3Yy+nRJDE5gIl561kM3UrVkeabXKncuWjOxVC
	 t4P7G8KecbJ2Q==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id CCF691980047;
	Wed, 21 Oct 2026 05:54:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 21 Oct 2026 05:54:58 -0400
X-ME-Sender: <xms:74vYaqVl2KoKaAEI9wN6vD_TyJ2o1PtMlkJU3WHStvhoCsFWnfRbCw>
    <xme:74vYauV4F6NRqO4apXMewdcBnKzBdvxd1tuWiCpC0bzROQTVs0RFOi9PD5_a8fFsd
    aDzrfBZtT4G4YWE8k2F9qLx4qsCpwLzL6f7EswCGZkJvVbrrx-Sa62xvg>
X-ME-Received: <xmr:74vYas9dKnQ-mDrhRVynmTKPQUkVabIa7iz_ErItlqyxus0ixMCO3M0M7VU>
X-ME-Proxy-Cause: dmFkZTGb/Scrq1IeFW6Re/s6z4hEr+1tf35xinWTa+O/Fw80orVIKU9SW3pc2dkWLXOxYX
    aj4ioxmBvCvOHRjRdogkFH1rnMbj7322v1gTqwmXTMhq+Z8nTAW6lao7civSlmdBfCBEsC
    dKosLcITrmuLbvRC2qdMEduQR2GDfbPDEyQxftwTkmKHsu89cPNX4zF3Ytu8Ri551fETE9
    jFhri3RGjfONpTgZvjZyoUmlZipSdJYJ9z9Vin/KCkM0L2moggAaeACKCYYu6+N1IYv1hd
    WXKzocmG3QVqE+svsBYuYwDOHIHJzfoTPzMNXHbFhUAcXHYrf5Xmxw9xs+KO83Cz9kF6gO
    lN9/yxDlOr7VZ0TlR67P8dgaYMmJVGvx8KrIjZVN7Mrl5EKV8gHLw1JEll9RZ44Is86w7G
    mxB2B6R4XFgXExXQtEFSi6y3rhqjgQ/oEe2BiablW4VLfTv7eG+yoBx4pFLJ59eq1E89up
    9yXVGCB6IjeAwOId5O2ppYNR/s2LgPmoIWFq6QTkxMI8qM95y8b8rRk3sT5ae+ExSacpey
    +Sx17rhcYq0Mg57WLXbyG9md0+I5D88F/+LEDYejObZX2rNRb2zlKXKOPeQtKRvC5vC9Ds
    f1RW9hFCFt8wfG5qCH8uH9vUCOPnayvZQBBH/jv8e2W7c5UYMaUY5biwSVNw
X-ME-Proxy: <xmx:74vYarrsuHxJMa9blAEqSmJ1ECzF10GSwXI8zA_z1-bcIkP3UzaMrw>
    <xmx:74vYaoeSpFLYNZ0lPYG8yuBAcliWv1Lo-37mMMD1ycOvfhja-M4LWQ>
    <xmx:74vYaq-2nnNyD-xPDVbKsuRtBKGlWkL_rkj2aVJEokgw69BCSzqAOA>
    <xmx:74vYaiYyzitMP-K6gugZGd-mUEO10KwVWolCba8CD3RTHPcNkeZtcQ>
    <xmx:74vYal0UgFzPYW3tHiU_dpVP5tyqLl1UZAvZnH3IRXm2VFRB3iDdLFaE>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 05:54:54 -0400 (EDT)
Date: Wed, 21 Oct 2026 10:54:53 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: bp@alien8.de, dave.hansen@linux.intel.com, dsterba@suse.com, 
	hpa@zytor.com, linux-kernel@vger.kernel.org, mingo@redhat.com, terrelln@fb.com, 
	tglx@kernel.org, x86@kernel.org, torvalds@linux-foundation.org, 
	hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
 without FSRM
Message-ID: <atiKeB-76nOj-ztU@thinkstation>
References: <atCpTMcAALymqADw@thinkstation>
 <20261017192727.2760919-1-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017192727.2760919-1-usama.arif@linux.dev>

On Sat, Oct 17, 2026 at 12:27:25PM -0700, Usama Arif wrote:
> diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
> index 12a23fa7c44c5..6b3e203b6087c 100644
> --- a/arch/x86/lib/memcpy_64.S
> +++ b/arch/x86/lib/memcpy_64.S
> @@ -31,9 +31,10 @@
>   * which the compiler could/should do much better anyway.
>   */
>  SYM_TYPED_FUNC_START(__memcpy)
> -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
> +	/* The FSRM destination move shares the space used by the ERMS jump. */
> +	ALTERNATIVE_2 "jmp memcpy_orig", "jmp memcpy_erms", X86_FEATURE_ERMS, \
> +		      "movq %rdi, %rax", X86_FEATURE_FSRM
>  
> -	movq %rdi, %rax

Moving MOVQ inside ALTERNATIVE_2 is ugly...

And it only turns a 5-byte NOP into a 2-byte one on FSRM.
What is the point?

>  	movq %rdx, %rcx
>  	rep movsb
>  	RET
> @@ -171,3 +172,11 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
>  	RET
>  SYM_FUNC_END(memcpy_orig)
>  
> +SYM_FUNC_START_LOCAL(memcpy_erms)
> +	cmpq $2048, %rdx
> +	jb memcpy_orig
> +	movq %rdi, %rax
> +	movq %rdx, %rcx
> +	rep movsb
> +	RET
> +SYM_FUNC_END(memcpy_erms)

Copies below 2048 now take two jumps to reach memcpy_orig() instead of
one, and David's point is that nearly all kernel copies are that small.

Can the check go in memcpy_orig() after the existing 32-byte compare?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
