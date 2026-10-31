Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793420432;
	b=pPQXnKkXkdm0nl7J5VgTGt9nwCA3IyXRgTnh2lK3c2kpSAAip0SamdfNhkjx8+uPvo9Y
	 6QSAa0WKI0JRDQU2yEMGCfrCz7mMNMH5MW/2T8W/fuVHm03VRqbc90DCjsi4lZlpAjSCC
	 ku6K8U/y127rc0cqIMqK+8OYftFkQ9w4CS4nZlblfirf7Fij3NHX0otlJmtQ6TwZ0rj6z
	 C65IN9jmKweG7omhHlpvJGvXCrBcPIMJuTcHEqAWoLwzgSjlx6AydE1rhpjL2ZL1NaL5n
	 E3QOPyuEuDNtZihBB0M2wa4kIMPPKy62qA+xIjbZvyqIh2gqclAJoMdfsNPkaGwC6Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420432;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aT41beIP3bq5uedJzmXJrLnGkca8gBeByJi7igmmcZ4=;
	b=UQbX4UCohLxoPh4ONGmrNcKmEqWqP15nI9CPoxE5/qsP8s4IllgTYUhr3/PTDX4X1K1B
	 zMdQrJ5BNeg+IhmXtDPrQCkWSDplb+LAdLKWL+ybgy/NzKPU0LTs0oaoKjygJktpr+Wvw
	 b/eth3gd/JEaQxX6wok6tDJiaPEqRh3FPfG/Frwjs1fAKk1jE6Mz6sqS9LZaZXvHzvt+5
	 7Yh8VqTuk8/FLn4Knwl9EnktbS6b5q+s4zM7Y1bzhE5PWZ4+qufzIUwzUCzlDCQQty1WB
	 DQwp/TmmboMPZeI9ccewvEKTH9qgUtBFTzC5cD50B3UXnuHndtdJ5uswdIa8E2Y/qjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hS5NNOag;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D95606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D95606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hS5NNOag
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A686F40E03BE;
	Sat, 31 Oct 2026 04:20:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7l8FJU6iKTwx; Sat, 31 Oct 2026 04:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793420422; bh=aT41beIP3bq5uedJzmXJrLnGkca8gBeByJi7igmmcZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hS5NNOagxeSIZP7l7+r4Vt9J41AyloPgDUUF9m5eSYcdhg0pb7axxFU5LPF6804QF
	 P3THEOX+beo/5YGodEvGGgIkSCV4ANtZ4q1ilY7Il7IsZ53JbshQlrzb52JMx/1KQm
	 85q/vEkiUtRurITQErxVK1n/sDecW+2wrJ6gokpigUXD6auvjQpFjc9Z7jEVOG9gwO
	 xcVJTwKk+ngcWELG9W5FeFMQaXsL/d4jQEW4umesxhAS+1skm+AiZ+yEcpjRWmaliu
	 bI+kk9hsLWf9PiXT3BXKvKZZy6douplXRwh7LKM4b7GXKd4WXwJGmESUjBxpqMrxgv
	 xa76Kqwtc17IB/pxn9jQbmQfWi+RGzrWJ40wYTzNLpToVzNM68TVYGfNyHPvWiZTIC
	 9tw8XmEXmhOsnDeHpBHf2u4B9VlrnGE+4gAIHpP3aeWOPgY8GHvLySzTVjlGmouMx3
	 6yILUfWLpvtC1Dsy2w/zA8jX46qJg0OLEcSW7CZlIuzzIHQnQymlXPq7mZr0dNFosp
	 tPZ9m9l3xS/TzXZ66KSayVq9q7u+Cf1XL8GXJr0yKcE020f46NBInwYa4yVTKBGGan
	 OkV5sJxfNYHuTnZx0CViO5XvU3/niVL+0YmzrQpxukp3e2Q9gFqBn2Uu/hIJA++Oi/
	 ENyrdl/vS4GUvVe3KpRHRPsQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C6B4740E016C;
	Sat, 31 Oct 2026 04:20:11 +0000 (UTC)
Date: Fri, 30 Oct 2026 21:20:08 -0700
From: Borislav Petkov <bp@alien8.de>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/bugs: Replace RFDS model checks with VFM ones
Message-ID: <20261031042008.GJauVseM2X4-dye4ra@fat_crate.local>
References: <20261030195214.1284995-1-sohil.mehta@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030195214.1284995-1-sohil.mehta@intel.com>

On Fri, Oct 30, 2026 at 12:52:14PM -0700, Sohil Mehta wrote:
> The RFDS vulnerability check uses raw model numbers to identify Alder
> Lake and Raptor Lake. Most Intel-specific code has already moved away
> from x86_model checks, but this one got added recently.
> 
> Replace the x86_model checks with VFM ones to make them more readable.
> 
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> ---
>  arch/x86/kernel/cpu/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index c7352827f491..8d7bd8bb7b18 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -1392,8 +1392,8 @@ static bool __init vulnerable_to_rfds(u64 x86_arch_cap_msr)
>  	 * both Core and Atom CPUs. Mark unaffected when Atom CPUs are not
>  	 * present.
>  	 */
> -	if ((boot_cpu_data.x86_model == 0x97 ||
> -	     boot_cpu_data.x86_model == 0xB7) &&
> +	if ((boot_cpu_data.x86_vfm == INTEL_ALDERLAKE ||
> +	     boot_cpu_data.x86_vfm == INTEL_RAPTORLAKE) &&
>  	     boot_cpu_data.topo.intel_type != INTEL_CPU_TYPE_ATOM &&
>  	     !boot_cpu_has(X86_FEATURE_HYBRID_CPU))
>  		return false;
> -- 

Queued, thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
