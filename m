Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613050;
	b=iH/pofqYlkVbTatoIPUljCrXxb9/UU+7Xrdogvi7huC6er4LMMCbjX5pxOCjzYg7HwUl
	 ePydBTvXPoxQ5rUahUEeCLPj0P3N3tp/LYzLAunxxqcpM4PHh8SBXIk8uD0zZmg1kak5/
	 em6rMhvRsxCxUFTZfP7y/nutc7T5yh5nvnG/5tx7awxPb9znEizxFIT0xzL+3ah0LOpZq
	 f2G1InYn8J0UUn6nY1kmtDK+Zr5UYb3WkkB/CnfuAR/7AraAfVsQFkmD4pQNwkirLV/Ho
	 8rCvVTurDKOUrR+APe9dbDMOddn8jhlrsHtuiskyQ0wls5G1XJCGjoGRTJzyeMEAGKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613050;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MIbUiP3K2dMJtTF2S2c2tQfkGNGWgYIUmgf5oUw23gA=;
	b=bbxnjRkE7C/0tDlreGhgBGtSxvkGH2mNuKZJH7cLo06CSMfHmDU2ipoFCg4XrCTNJstX
	 LzukZ/UWkpkC2LWhTToF9Lj5MDd1gu3Bpqe5hR4GgE3JTRNcekPcNG3cOJ2vUGNU9GRrI
	 M494fX7WQdhtjjlVIhcWhk1GGaOI9oef7c6hVdqYRN7uewENkWYf3JdOFUDBNYCSwPa9S
	 5va6D3r+zUgtwyiueh89Z5x892nUqA+BFmMbsDQHMq+LPqx1SBO2ZfBZlL4YQMdA6dY11
	 Lyn0zLcga0Y6kNlj68lqR9CjPET/0xh3Vq8wFcln1UvrjCz/0y541Fq9QCD1Yo1TowA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=jBAAXZzB;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB0A606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB0A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=jBAAXZzB
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D392440E0184;
	Fri, 13 Nov 2026 23:37:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Hm38P85MNo6R; Fri, 13 Nov 2026 23:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794613043; bh=MIbUiP3K2dMJtTF2S2c2tQfkGNGWgYIUmgf5oUw23gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBAAXZzB2iPjbrgxX4/k9R6ol/tMt90sEbSij7SQN0FKmc+aqt9+IMUA4vkqyg16a
	 d9SyObU9lURzOOIwEXF/Hm6VpV4IvioNRSoQMhYEdxFxv/UJGDoZZ/Ksufz+Cmvi3v
	 ntCadccjhhyc9c2M0eOvAXgGBKWECTf2kgmNWJcPslVIVG2yOLj/BF5ZKBbyN4iH/d
	 I7DxTIKA/uqxPLMtJBsoHxMxNodtXFEuPXrcBFC+Imok9i9LXzSZVkjqLc/usq7xPy
	 o9MM9MgW53j5sjlXnbx3VhcZ8XL4MMGZL0LnvOVi3yHX39kq7LVb8DYytFdN1otuZ5
	 OjxL+6Ft+HcJ2MAWhJMnO4GCfqiWaeS9f8SS1Hi6Fs7LHrMNo9BOzaw4zCWk/poGLj
	 +KlKLmIO/u/QSfy1w9z5xVPjM30q6RY4TsRfluSKz8fpsdxnLZJdwWix6gi9OFiBs2
	 1Ls+Czaupuj/Dn0kBfZKzUPJSQ/xbZEDWz/shNSZ6C+TA7bStHjeiywm2qYdaZpYNC
	 vqwYs5/jp1HWPVol/yaBtVRDXiM1GXLbUNA85NTj+39u5LKWWBdT4KBMZ9BXxWVHp2
	 8ozalewV++W5NUKY5pNCbGby6ADiYvohNOrp1v/LltkwzVAd9/nPIG1n3BkU0rj4ma
	 YTn4xGSKaHgpTjHqXvHC9owU=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8223C40E019C;
	Fri, 13 Nov 2026 23:37:06 +0000 (UTC)
Date: Fri, 13 Nov 2026 15:37:03 -0800
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Usama Arif <usama.arif@linux.dev>, dave.hansen@linux.intel.com,
	dsterba@suse.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
	terrelln@fb.com, tglx@kernel.org, x86@kernel.org, kas@kernel.org,
	hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
Message-ID: <20261113233703.GCavefHwxVZX8mGFCm@fat_crate.local>
References: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
 <20261113141137.1113517-1-usama.arif@linux.dev>
 <20261113160300.3f0d0a37@pumpkin>
 <CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com>
 <E9C129F6-61F5-49CE-8948-064DAE86EF4F@zytor.com>
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
In-Reply-To: <E9C129F6-61F5-49CE-8948-064DAE86EF4F@zytor.com>

On Fri, Nov 13, 2026 at 10:36:30AM -0800, H. Peter Anvin wrote:
> Well, we can put a request in for compiler support. This equally applies to
> other compiler runtime functions, for that matter...

I was going to suggest that too. Lemme know if I should ping my gcc folks...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
