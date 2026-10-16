Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3F42853FD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120397; cv=none; b=s00I9jdIeLL2DweLvhbqd5mTKjDI+Q7I/OWxNcKe8Uv4fwplwyGJ0ATRq6f4ItR5I8H9rsOlw3+HXFnxVC05xrhHI3Ok35tc2aDpsFbM3M2kHxtmr4pGZhBbAqiYSUm4Dw1rINq2pwDLWZ9WcOhsGSgWXue2FCiwN21SyzS33DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120397; c=relaxed/simple;
	bh=xX1XNR4FUyGCNwMgFXenF0TymohhxAoMlU9N1h2TFuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7H+r5a/roRO/Q5zxXwyIFKuOLI7sk0e14eK+ODFf2bUSxiTk4HDIgOcvnWAtXqtjj/mCs4UmB/1AUF0i90EevAnsehrZLTBNfO9+dd9lhexBS7hL06G5G9W0IMqzhqL5sQTpy9EprcY2hoY6/Cz1az5413XXmEFGEB8YT1Ce1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kB8VpIqd; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kB8VpIqd"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1B4D840E00E5;
	Fri, 16 Oct 2026 03:13:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mBnfSpkapakG; Fri, 16 Oct 2026 03:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792120383; bh=j1zejq32/tNyzbLvGPeykcuEeIhlm8wIUYy4N4oErp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kB8VpIqdOiSX5ndcGB5+uU2Je2QVle5SGwgxBhwgniqNp9KofZz18qF4uDV4wnO+T
	 pCyhS8I+l/+1AOywZQDj3LtXIivTBSsM3EC53sEhbEnGH798zR4FFpU8hCrlz9qMVW
	 HcfkeKAnWl646osI6j9i3arBLszg8R9ZwM7Yv28dOn8y8Hf4m+YkqFWRhgH0u+lw4s
	 SfeIs4BdY6IEbtkJwhJze6bp4AzmLAEifPX1qCLM2iCEdCrZ2u78Qjznjqgil7MJr9
	 5FstuCvxUuc97mEZYep78dkzCxhKIKNtV9rONqXGx6HNP3w5tklqxbaRD2n+RKJlVU
	 6bISq/NbxwTeypI5eOHDEfPv1or030WfDf1ly9eeehXfY9IER4cnSTwmGcHkzDJ+T1
	 4V2xcf6XRCKfLFIQYsR35IOR02kgE+oQiVJmDgPAIO+HVqgLEGgLZ+iNTT3QC7GumZ
	 DVIvweDQ4uR5roSmA9bF9CroTe4Vw3rHt8waFgu+quLoWzueRK2uNi23M4k1DDFaa/
	 FRGq2WXcia0qwHHeDKG0OjRYavT3/OdnZ4l8TVYRLqyUmFC3OEEPv7sfLs0esSMNaI
	 6cRCHNI5GqjB2EDehxXN65fJ1Wv0gTObeMDfdV3KTcewuUuaQpELmCkVTQ4sTqHBd0
	 BOzgUgp7AVq/i9IMKc6+sXjM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6130B40E0497;
	Fri, 16 Oct 2026 03:12:46 +0000 (UTC)
Date: Thu, 15 Oct 2026 20:12:42 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nikola Ciprich <nikola.ciprich@linuxbox.cz>,
	David Laight <david.laight.linux@gmail.com>,
	Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, david@kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
	luizcap@redhat.com, pbonzini@redhat.com,
	Tal Zussman <tz2294@columbia.edu>,
	Matt Fleming <matt@readmodwrite.com>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local>
References: <asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
 <bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
 <20261005132113.43548696@pumpkin>
 <asP5xK4axiUk7jun@pcnci.linuxbox.cz>
 <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
 <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
 <20261009090042.39ba9c06@pumpkin>
 <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
 <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
 <20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>

On Thu, Oct 15, 2026 at 05:28:20PM -0700, Andrew Morton wrote:
> fwiw, I fed a lot of tokens into $LLM and it suggests that 55780d8a1dcc
> fixed this.
> 
> If that sounds sane then testing 55780d8a1dcc on that 6.18.x kernel
> would be useful.

Hmm, dunno if that LLM sent you into the weeds. Because I ain't no virt guy
but if vmcb01 and vmcb02 and "L2" in that commit message refer to nested virt,
I don't think any of those crash dumps do nested virtualization.

But hey, what do I know... :)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
