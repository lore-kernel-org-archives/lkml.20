Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609221;
	b=ToFRmSVEz/XPU/vQv4Ous9MK/FLPuvfQbKG9QWC8NUAbg0aqnHa70GtmPedybOO3plns
	 r34GEm/ZQ3PkakmtQKBNWnY6UXdIPxh3OGglqhcPGfTNPIyJZtwJOMkLZ1kSCI4xoyKCA
	 uA4o75OxzIU5dNOIGjx0YD0joznH1KVqA7ZZfVGgk6pxmumtcx95hB/lccWuP5TwBcyl6
	 8khW7RiJ5ZWU1/BS87619vVVPyibiaJ3JwA6xITTYq60plABI7q+3icu3C12y7LWFRf+X
	 u1vJZdmcsfCYdwIXyJKa0VEbRsQNSLo9GBYdDfjqwpNE3D1R7W4jq+/WPkWoVJBPUzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609221;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=GvmbxsDvFYudt6rhJh+ITPAuPsN+lvCj/zyu4P/33kE=;
	b=yCBGD7f+dHYbOfQ49GjEQZ9Bc2KsDJ8akyl7eE08s67JnPqGKK4bgO247BzFvWeKT3+h
	 TyqT/zq9Iw21DYfBd3QTlXBaffYZ3ubiYhg8Ww7AhhVnR3+E96cXkbhz9+L6eJv0OPvTf
	 CU5dl8V3VC7Qc0ao63AwFevJyEVEmvDUutNeW95OVelZizwlB1XjzRcHKCjGaYKrS1PFW
	 Gp4WDc56U0hOGCdfFIhPmxCV7Gsvq8YUo9u0H/deqbZPCFgSzpdtT905eQNoGw883iomY
	 n5DUCo7S0aQWONjCtWw9Az77JIG7dqET/8r8Ndx2JGC8z27iNxNtmnIP6bapBnXCU3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQGKFvrg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72102606A319;
	Wed, 21 Oct 2026 19:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQGKFvrg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A371F000C1;
	Wed, 21 Oct 2026 19:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792609221;
	bh=GvmbxsDvFYudt6rhJh+ITPAuPsN+lvCj/zyu4P/33kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eQGKFvrgcMqigRMSGuNVBqq1cgWioDJzpUQ/hfdDwvdud8wgtU/AjPynem1mjW2l4
	 DkFa/1LqeJc8mZy5c/zh5EC+czKF1uSgPfKwSyS47QDqeuBD/x7l6iUApyBG5L0hn3
	 I6fxxU45u8sXEZtS4pMgAAK9K7QZhJZFZmAKQ3kCYDrbfmClXHJ/0LhhVbFgp7MlVs
	 ANItlZBErz3kUtpF0On2BbmJ8MpnNqy9+lxZ/w8yOFFfWr6GTzoRNE+rRPaZDnDO8P
	 821IVXaT18aFXqZS+QaLQEqeAHsuOVyx/oMgQMAVoAYFt7ssu+HoZVCVPLNgw86iP2
	 w+6CuMJbz3NwQ==
Date: Wed, 21 Oct 2026 12:00:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the kbuild-fixes
 tree
Message-ID: <20261021190017.GA2611266@ax162>
References: <atit3cSBFwe9cDY7@sirena.co.uk>
 <CANiq72=fy3XAqXCBCwQ8AhWRNPSruDe4fxDAdzaUhUw94FAS-g@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=fy3XAqXCBCwQ8AhWRNPSruDe4fxDAdzaUhUw94FAS-g@mail.gmail.com>

On Wed, Oct 21, 2026 at 06:01:17PM +0200, Miguel Ojeda wrote:
> On Wed, Oct 21, 2026 at 3:57 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > Today's linux-next merge of the rust tree got a conflict in:
> >
> >   init/Kconfig
> >
> > between commit:
> >
> >   f85147b291e35 ("kbuild: move the toolchain checks into scripts/Kconfig.toolchain")
> >
> > from the kbuild-fixes tree and commit:
> >
> >   3504d1bce9920 ("rust: kunit: use `file!()` inside `kunit_assert!`")
> >
> > from the rust tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> 
> Seems fine, thanks!

Agreed. I let Linus know about this one at the same time as another
conflict.

-- 
Cheers,
Nathan
