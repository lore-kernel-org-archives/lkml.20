Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273781;
	b=eIc8cBkHvaZEVf657cM9T9olBxkfVz3Wvm50qC3C78QSoUISUbWAeHyiRTNf/CujdvU6
	 R49DhZBlEUzSZdBL9PRFy4yvtbf4xU0TeGP3VDsAANG7R+C0nCdPCxdJ7QvfGRP/9RgZl
	 82kxRyglDHkPfplpTYJlQLpEXXwiPu2cyBDqNtobwNvgK3khcIzpe+/6juw3uoJASLxEZ
	 ERMkDVBguOnzC392s3OUfGRt81loT13cIFZAO8+NIqB01yZchKNDNFmu7nBEN+iovXMuy
	 +YDE15myuu3jHZOVPafFFzr2e7SDPj3JKRqdp4U3SUgfi5+ve1hC0/OVdWNPKbuINBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273781;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6ikOY1QtqE20RvpK7jFWoW7yVGQoHNL7uN7yLyDwl0o=;
	b=xQamPsGqGboGoyt9b2+PhfZkOI0WPWJtpgGAhecDtl3VhzFQF+fS3AKykPctl1SHy7fu
	 +KYgsmWkAMNeIzs2BSaP6+tyS2jd6PITPqQHyH5uhlX13HR/bqAwMWPfOUmaPfK0spXLq
	 HnAWxbygH6PB6/IuVugsl3491qo9o/PhFYiAPof2s5VEH4/ipWFEuuwM6SOlasOyltyr0
	 Y82fe2aP+dsj5Zc1nz/dFnMd0UYQVMcR2egT8FLAKFQi7izYWjA5HmaHICbHGqTXdnzyK
	 t/MRba8U3hLOyP1RCuorOf74djy3HKjDhmT+6YqUgcGRj2Nlpwxa+0lkY+NVwSmKHmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=QvCCZnSZ;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57B060A3810
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C57B060A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=QvCCZnSZ
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CEED740E04D0;
	Tue, 10 Nov 2026 01:22:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id U3d-J4j9N6Rs; Tue, 10 Nov 2026 01:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794273773; bh=6ikOY1QtqE20RvpK7jFWoW7yVGQoHNL7uN7yLyDwl0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvCCZnSZDa/dgEVnXBnwTDTJy0LvOTxeevkFHiny6MenRW5ln5sHwqxnIr/33oned
	 J8cSQqo13ie3ddTClO7/BRza7nKpUU8Az1PQ7NmgFsJJd4mOmQRSHCTHDUjeNWa84r
	 K7PQe5Ai0PIDc4kaEQsfoWK4HVu6j92ftaTrupWGgr+Gh922TBsD2t6jzFRdc0s+wi
	 W9wE5Kg5SNb3jmcRaKAkdrM4503wW46Bnt11e0XZNq/YQDPECbUA0RTKDIjjSHuLbm
	 nuaqhMIHZElfsLa9PgDAmjpn/p93UGk4KgSwX29CBGwFpImC1UTlcl+oqH1rA0K2uq
	 932Nc5BTCP4kVhbltIGB0fVY1rsfC6qFfqm0LeEqyTgKvYWfwiWQraVKnWrEqEbha/
	 92Gu9yYjZPepIBZ7Ks6+ZoeYMEuMs4hI8g0TLksWnaQA5+AU9Gfda6tXHNni/SAhBC
	 dtMkiwIVevIYTLg3Qifj+lShquImiC4pUi3AAMVLdesWpdlbEaN2wExObTXNyRjon4
	 9QzlQIIxYakfPePLF0PO2XM696I2ealW++DFg8uZMHhnlOGn4ofWTvC3V+5bLMidCx
	 v7+Z9XulK4jVqAjyE2MhrIHZdtBCi5HxcnpI9qWWQkEyzpE5pixx7F3H1TzJbS9Bqr
	 W3kymcEucSYlSIfJ/ucoC0EI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 537CD40E01E1;
	Tue, 10 Nov 2026 01:22:45 +0000 (UTC)
Date: Mon, 9 Nov 2026 17:22:42 -0800
From: Borislav Petkov <bp@alien8.de>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, peterz@infradead.org,
	david.kaplan@amd.com
Subject: Re: [PATCH v4 1/9] stop_machine: Refactor multi-CPU stop glue code
Message-ID: <20261110012242.GFavJx4qqoioeVSZ1M@fat_crate.local>
References: <20261104182322.578066-1-chang.seok.bae@intel.com>
 <20261104182322.578066-2-chang.seok.bae@intel.com>
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
In-Reply-To: <20261104182322.578066-2-chang.seok.bae@intel.com>

On Wed, Nov 04, 2026 at 06:23:14PM +0000, Chang S. Bae wrote:
> stop_machine_cpuslocked() currently configures struct multi_stop_data and
> invokes the multi-stop operation. An upcoming stop_machine() variant will
> have different configurations but the latter part will be shareable.
> 
> Extract the common part into stop_multi_cpus() to highlight each unique
> front-end.
> 
> No functional change.
> 
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> ---
>  kernel/stop_machine.c | 35 ++++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
> index d085ba1f4b44..8dcd5be67b85 100644
> --- a/kernel/stop_machine.c
> +++ b/kernel/stop_machine.c
> @@ -582,18 +582,8 @@ static int __init cpu_stop_init(void)
>  }
>  early_initcall(cpu_stop_init);
>  
> -int stop_machine_cpuslocked(cpu_stop_fn_t fn, void *data,
> -			    const struct cpumask *cpus)
> +static int stop_multi_cpus(struct multi_stop_data *msdata)

Waay too many combinations of "stop", "multi" and "cpus" in this file, with
different ordering, causing me a headache.

Call that function __stop_machine() instead as it looks like it is going to be
the naked, no-locking, version which is internal only.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
