Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F988370AE6;
	Thu, 15 Oct 2026 04:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792039849; cv=none; b=KkBiu7R3X9lswwtNoR1rWkAF4oKIOQIekVmcfgxz8katDFOaXcCUe4biBxuyszAH4cVgOCwWRqadE3prrebIsu22rlePUB4v89RgnvXzmcLiwVvt0b2TMlK3iy6QcFPsPL23pk9eVUEsefDsipgTMoIQqQeial7FPHuTB1PGvNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792039849; c=relaxed/simple;
	bh=hEnYdcWvaVfvBTjrtiYDqeBInOl1mQvNxuuKtHGceuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwRtV62MEH+gNTP6z1qHU3/N0Owv9wqH0YO257eFnh01p8aQsaF0hQvy6JwEzAXuK8y+WPboHzNJlOypSmfbXm4ibSbVEBLgs4/DGR9AMLdcL0LtdUH7nlTARnG7VLtUq/9sJDCs/SCkrhwZeSGbqBCdnfXCARfrYsswKM5TkA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C87YkfWs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C87YkfWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D6E1F000C4;
	Thu, 15 Oct 2026 04:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792039847;
	bh=s5Y/6iBHV7ezHjvoUhMR7Eh3f9MZh8DMV1YS04Aex5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C87YkfWsbG0fqfeu3PlgMOMSM2NmAqPrW3jnELD4a2FliuCYS1ktfrnfiJghRl46j
	 5ms5Aim6lQRE6jftc/gmUDYvAPk3DlKPlql4vMztZGbkgNoubiSa1xb3mnv087p4Op
	 Gg3yRRYEiOhV0/f/0QLqjCYJNuy2Ddv3Dk2B/2RduFELYWd8AtPInGMIgejKQLEACi
	 T+QHoZOn5rxFHZEBpbziYQctuS0WOz6hok7ETUL/8J2aF7SsPaLGycrwam8eSy9fS1
	 WuP2hcIJLqmV1eFEdreathatLx/fRH7f0FSqCbBLSA4aQlTfI0T3rYNocBjoC68SVA
	 Q7JWBD8NBgVzw==
Date: Wed, 14 Oct 2026 21:50:47 -0700
From: Kees Cook <kees@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sasha Levin <sashal@kernel.org>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/5] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
Message-ID: <202610142149.C3CC39B22@keescook>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <87zewiy1sd.fsf@trenco.lwn.net>
 <202610122047.A9E381A@keescook>
 <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>

On Wed, Oct 14, 2026 at 03:51:27PM +0200, Geert Uytterhoeven wrote:
> On Tue, 13 Oct 2026 at 05:49, Kees Cook <kees@kernel.org> wrote:
> > I was expecting this to appear under Documentation/. The agents are
> > designed to read human text, so let's make it at least passingly
> > sensible for humans to read too. :)
> 
> The expectation is that the agents are becoming better in understanding,
> so more "instructions" can be shared?

Exactly. And the rate of frontier model improvement has me convinced
that there is no need to spend any time writing documentation to be
consumed _only_ by the agents. If an agent gets it wrong after reading
our existing documentation, ask it what would need to change for it to
understand it, and then see if that makes it better for a human too, and
send those patches. :)

-- 
Kees Cook
