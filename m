Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259409;
	b=qD+l8gGEi4yGTzjiqLfy9IAvNfdqhxCxMmpQ6D927SiWs4j9Z89ddslO6jcSzQlgdXQj
	 PQvX6Min8hBl8sKLVkn5r5YHrKoJgAiua9rcwEFFub3lGrBHhNEnJnZQ1mEVwJyOJ1LKX
	 TxaNZUJSKDO5qN1lSm1kqYFsnV7HERL6CHGj62925eDY4ypyehZxC8BV0Xw8+FrZC7t7O
	 FajuzXv1/DgKtekNZwj4Wz96olGzox1EvjDwKb5JN0wNavFqnpYbapM3gYzkMlsclt3cH
	 kHbJRfrZWLHX/xkjWstLocavux9kseYwpxrNrT4x1qkEIrNb2GTifY1TXZiY648hjfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259409;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:
	 Content-Transfer-Encoding;
	bh=5p15Wb3kzPE37M7VtnOaHaW0RqcNfcAj8nyBrjFRkQk=;
	b=CYaQIn0aKs3npEeFK0GB3MxcoZRvolFkxDZt57jJrGztB2iUAgDPeMEgC4CrDkD1SCf0
	 +wHazqNiTIBbdUcnv+N1nAJmAdp13+kwdS3mf7r5XymikqVTFRHIwpaZHqIbk+pBSKuwF
	 p4rQB5Rio73+6f6XVPftkBidhsTk9ObiQt6OIrFUJD5g0vBHIJ1NbH1cNWVG+xcMs33Ph
	 SiODcA4auW2DIiGi6c+C+Ep46ZssWLD0Jh8tTjVo7smXMOJQJsILeKhZ3MJcN4uxC1i2H
	 HAt1Zos1m7fhIn4lDTyBMPvS9K7+tIn8gLF5U4J1FMvGkSGN6f4RhYHOZtDuoK1ACcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=fail reason="signature verification failed" header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=j2tpxB9H;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A462606A325;
	Mon,  9 Nov 2026 21:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A462606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=j2tpxB9H
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DC8C440E0255;
	Mon,  9 Nov 2026 21:23:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wd58f5gQ-F7D; Mon,  9 Nov 2026 21:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794259401; bh=PCx4oeUJ0piui2+J9YL4CZu/4nfYGRm57CG6++yDoFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2tpxB9HXAbjAcij5vEWnn/23KcZZcyHCjGshnbNojFz/n+jVyvfEDk02WKK4UHgL
	 pnJQOZLMfkhbvzjrN6t2hUak2sXIufcYT0I+iXwPp5RhHly6O6h2uyHLMuhKbydpNr
	 pCmHlf7eO3pCzPB+2cFKOA9J8Mz08VyHIQXvEJ8z42W90+h/lidq4KjQpwPfrfrHOl
	 VW+WA7xQrGHzTHk7x9zFq9hSr2YBtgRgorxRY7cjaYi6TrQ2IQ/v0hPZ3dxQ0xYdcI
	 X2GCq0tPnbMkP/KVLIUBsM1U5UD6xbr+XYSZ05Gzs+7ARee3M6tUvXvuDncDkH4D2o
	 fBrRX4ZwmDxtpcPA+Eqe7ps76B92ZQfFXbYJS7bl8bFc/L5/hJKvjFdC4wtFeWCc/V
	 yNHZLKeOW/4ozodGFi+XG9XbKn3QiW7O941/l8oLmsJMlv2G2wAmLvJUkbT9WbIriV
	 DewdLKUgt7SRaMCDTSAhEF/9ZVGnS+q+RsQKmA04QcmddvkumgzLO5oWoWkEmTwfhT
	 RbqsdYc4CLStzq/n79OgX8yC+VoPJGEYTjVciTjcNrT2KLNeArQEzlNWpuDXSE6MTB
	 +UQk5nU4QQI7j2LBXaok98j4TtmrzT7MTYK9bmhfJcSHMq9OyElQq9awDztC5txOmG
	 i0BggbghVQt5OsjsAnumXILA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EBAF940E0184;
	Mon,  9 Nov 2026 21:23:08 +0000 (UTC)
Date: Mon, 9 Nov 2026 13:23:05 -0800
From: Borislav Petkov <bp@alien8.de>
To: Rik van Riel <riel@surriel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] x86/mce: Restore rate limit on MCE logged message
Message-ID: <20261109212305.GDavI5uXK066CxHoNA@fat_crate.local>
References: <20261108143751.3af49e48@fangorn>
 <20261108202820.GCavDbZJgmwKqysH4X@fat_crate.local>
 <CH8PR11MB4034331B3E52AF39AA9C003E68FC732@CH8PR11MB403433.namprd11.prod.outlook.com>
 <20261109195216.GBavIkcPlh-HcT_7JW@fat_crate.local>
 <63ed91b49db00d7a601b8ae1625571ee0c46ffca.camel@surriel.com>
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
In-Reply-To: <63ed91b49db00d7a601b8ae1625571ee0c46ffca.camel@surriel.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2026 at 03:12:43PM -0500, Rik van Riel wrote:
> There are a dozen or so "mce: MCE records pool full!"
> lines, and then two=C2=A0of these:
> "mce_gen_pool_add: <bignum> callbacks suppressed"

Sounds to me like you getting errors logged and there's no userspace cons=
umer
at all.

What is your fleet policy about collecting and logging hw errors?

Do you even care about them?

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
