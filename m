Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB473D7D6C;
	Fri, 25 Sep 2026 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329520; cv=none; b=dSTGuiriwXqPaRzB5N74BP7Qpvn2xDff2NGMCk3Clxdjzq4ORRDNyaAzjSgm+/7KTsXzSSJ7x3iKfo3RDzo6XmuCwdxLOFzww+DdCXm9uvuODTo3MoKr1QFjaHeDAhoeXZhEMJ4QcHg/vY9Djgqlc2sPKZGqBqEhd383wLWX9hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329520; c=relaxed/simple;
	bh=t57QnN5CvewYG9UvBNAoDPURp88rmPZtbvlfUjUdZwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7eUrgyKYBjspJeqh3HwIJuJcAuN6PGLrev5nc/vs/oKSyz+UukL0n4mfjRC6zh2jnJZWSnaz/RmckWKBdb6vYC8eXaUC4oRH07RWydpoKxQV7G0MOSr6RGOhMVdsyimEHqWe7r3D50MwLAjyUwZQN0YKAeQ3M7I6mz6WhYlXfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtMeVqr9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtMeVqr9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E988D1F000FF;
	Fri, 25 Sep 2026 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790329519;
	bh=QF+t8IM5rtois/coLBurOMjj1uxUNN2kpwHQyQR7DOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EtMeVqr9e9Pi+VSDJ8BqFZcqkysaPKerPEmLvccr1q56wJYcVP01TvnC20KWCwAsZ
	 OMzEi6Fz8naf3NTzdhasundjhDktFiBIyyplc5fPSaRa0QMoKSAiGZ8GhsR+8B4Cio
	 FaO4tgONocTz3AGWpcGeOfdVoajpBjYMhTNkzGAFPvxJ/p6EkZalHA/gspa4LEsNza
	 qy7mGzJ7Y1MYgl/oLwItCEKWFeyLNVBCZUp8ZUteLd0032UsFRECxzr8Kwjl0+F6fA
	 O1lWFMTq/amE9Hf1ywf6wofR0TLvGTKYFoVdrUILeDLlAg3CJGlDjuSWNhjF57AAYc
	 vfL78yBfUWW9A==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xA2UW-00000000DsB-3iIY;
	Fri, 25 Sep 2026 11:45:16 +0200
Date: Fri, 25 Sep 2026 11:45:16 +0200
From: Johan Hovold <johan@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for Sep 24 (htmldocs: include/linux/tty.h new
 build warning)
Message-ID: <arZCrKViN6XQ3zzx@hovoldconsulting.com>
References: <arWmD5B_Nt3qcBXZ@sirena.org.uk>
 <20d75a7a-2e7a-484f-a267-c21db82dd922@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20d75a7a-2e7a-484f-a267-c21db82dd922@infradead.org>

On Thu, Sep 24, 2026 at 04:21:44PM -0700, Randy Dunlap wrote:
> Hi Johan H.,
> 
> On 9/24/26 3:37 PM, Mark Brown wrote:
> > Hi all,
> > 
> > Changes since 20260923:
> > 
> 
> Please add kernel-doc description for @break_wait:
> 
> WARNING: ../include/linux/tty.h:243 struct member 'break_wait' not described in 'tty_struct'

Done:

	https://lore.kernel.org/r/20260925094222.18303-1-johan@kernel.org

Thanks.

Johan
