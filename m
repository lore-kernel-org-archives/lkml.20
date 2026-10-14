Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CC24A5EC6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022283; cv=none; b=I/rx4x3CJdqcKIwJgJ9YI+ZHfjnBInbo0AYoVj0kTWISiSKXzgXe1ktqtUBT6njfZhQuZjgvX3IQK7DWMuonfQSZcJMWWE/d0oJmr+MrpO+VELarkPGoOYuWEGu6uVab2vWVv5Z7AHTgoe9usmP1wSQuTw5xKTaKZnF8DlbTaDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022283; c=relaxed/simple;
	bh=z+xhEmSQl34A4qpYp225VZPfAjpMF/zgCqFcqplIPdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rV9NRmUkfiblEwzlNuxUKoTWrYhk7nuhUoZ8nFfHWmYfDyGL9pc+9h26XhnM2H2WOcutf78TX/LdPovUh37vBXCg0kLNkMZhNYAa8idqed6HRtCasJwjiTYC1iR1xZo4P6CKmmWpWCVVQOsD7IuzDQn3eAJaUa9ttiMS+fTFxSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=SLuEqzU/ reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="SLuEqzU/"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 03FEF40E02B0;
	Wed, 14 Oct 2026 23:57:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0WrJzv70E26G; Wed, 14 Oct 2026 23:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792022275; bh=ausymQBLxGPkz8L1V9or1eZuZEhcZPEXJFf6c9MvyEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SLuEqzU/U7CpOevlxTdf4JMdWrEsdhl4Ly3hNkV+YnXQjso24OezAoI5jPxXX7RVU
	 nVbadgbhoHWEikDWOqZE5ybpd9MV5+RodTQOP4Mq71rRT7OH7j8NI/LtQS3uIh2H1S
	 /L9aI0eDAU3E6i1wPAz5ACacNQ2raJ0e9RJ5NHur6MG5PvW0XiJ8amlgT+O68qCDF+
	 eXCEUIIkCoyDj7rAgZxCE125qfs7h5tw486uJBbpnl8Qe0kluNZ5+NGa/TKlmJwZ99
	 ekNEMY+LRqcupfNQ/M0LFaVi4q6SBsDYJ6z2VMcoKA98iwXBVtSu8p564t3HZuYOIY
	 kZiueIKOgSnHilcy+ezVADb2+5iYtAhRTm+6KoYNjbASicIJN1viEm7VnKONPcx/lr
	 aDkObPk8I/1ptf34U3PYq8/AWOiezYuxA5PneVZpOF2yXM9KM+wOTaAUyQRxA87an4
	 imyyh/Z1Bxr1cVndhTaVzhPBU6Uf/MEZ5fYU0rSNK5LGvyR30glxoyesLe82wXo2Ei
	 4/MStRWkTbyD9GrRgQWzQajbO4Ci1KE/fMfuiXdHgfg49F993VDvDN8Z4/mSi4nmD7
	 eToLqyvRBFslgqGRBsw8awFCuT44ItN8ygYv2scANmyq9WxQLBx2tbe69ybNvT2kbU
	 2Xj3TQ39uk4OWmbEEyOxhD0c=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2BD9240E02B3;
	Wed, 14 Oct 2026 23:57:39 +0000 (UTC)
Date: Wed, 14 Oct 2026 16:57:36 -0700
From: Borislav Petkov <bp@alien8.de>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Cc: David Laight <david.laight.linux@gmail.com>,
	Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	david@kernel.org, Mike Rapoport <rppt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
	luizcap@redhat.com, pbonzini@redhat.com,
	Tal Zussman <tz2294@columbia.edu>,
	Matt Fleming <matt@readmodwrite.com>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
References: <ar/F6+OUzj8qQ8YC@pcnci.linuxbox.cz>
 <asAE3kLFDUx5v0Nw@gremlin>
 <asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
 <bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
 <20261005132113.43548696@pumpkin>
 <asP5xK4axiUk7jun@pcnci.linuxbox.cz>
 <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
 <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
 <20261009090042.39ba9c06@pumpkin>
 <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 01:43:30PM +0200, Nikola Ciprich wrote:
> Since I didn=E2=80=99t have anything else to try, and we started having
> crashes on our own cluster nodes, where I can be a bit bolder,
> I built 7.3-rc6, deployed it on two problematic AMD nodes, and
> started a migration torture loop.
>=20
> Over the weekend, there were ~70 migrations of ~160 VMs between
> those two nodes without a single issue.

Did it reproduce usually with this?

If not, keep hammering on it with the latest kernel. We might've fixed
whatever that was, along the way. :-(

And if so, that would be a damn nasty bisection to figure out what fixed =
it...

So pls hammer on it as long as possible to see if it is really fixed or i=
t is
simply harder to repro.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
