Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5653E2AB0;
	Wed, 26 Aug 2026 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750584; cv=none; b=oBALuOXdI55j6UOCTb9XO4iSuD/QCun4Eo4iNC7fFCkjZcedPZFo4GEsErgadLyC5IA6Eoxsf38T2Y7PH/O6qSeebMUpUtMlcApm9TwXSH3A2HdpmFGxHWzaZZ7Uc/8kedqJma0DDoFjiofcJOLvFKVXaVtK+On5eTJ9T8gYIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750584; c=relaxed/simple;
	bh=dmLCNekLF7qQsx2TYXubO6nCiWrbfqtJvrZ/qU8Cp/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iV9EWbE+uYBHHBAKQ/p3j7KEMUEpsPnM5+k3wx/qRZHv3zxxlFBAKfZaEW8KeZvyPtpLfJs2LLPSoTNkwXcXHp6i4EtOh3s/PtvMPfz3OMP0wMCa8Aww8RlTKDi955pUuMdZE71QL4lTH3yTScje0x2Z6F403rRNLy+0Qi8Mwuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=NhFSvt74; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="NhFSvt74"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dmLCNekLF7qQsx2TYXubO6nCiWrbfqtJvrZ/qU8Cp/E=; b=NhFSvt74PQACFlP8GSOf5Lt7Ti
	szltvFhI7h0BvYTmTRe1ax2uezAZgkX4ABuhd8rEcIM/afvLxD4ukXRiO8EkPWJHb0wSF6dIWZHwn
	sN6ZcHsZIhMCGk0OdJGinf0VfXAuNfWPQLPMKd97R9AD4tE/8lmaubA7NLI1rAoHz9yaXI/UzN+iJ
	hhCBruXvM/ymzYm3j1Db3kHcHnkoL1AHTgvmvzpVKg3kVNH8SjfcRx+dFzJCr8dKoFh5dhFVcUpn/
	2AJDHC2CxpBg5/voRzPQJvybMojGy7Kn5V+KDu4pG/v9ier/jYMOVlyDWBNze5bC47/bKWwqVRV9p
	qssB5zHw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wzDaL-00FF52-1C;
	Wed, 26 Aug 2026 13:22:33 +0000
Date: Wed, 26 Aug 2026 06:22:27 -0700
From: Breno Leitao <leitao@debian.org>
To: Borislav Petkov <bp@alien8.de>
Cc: "Luck, Tony" <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"kernel-team@meta.com" <kernel-team@meta.com>
Subject: Re: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Message-ID: <ao7nGM9sCQyxJvsD@gmail.com>
References: <aowABmagul44ENde@gmail.com>
 <aoxxxmM-xIpyAE_Z@agluck-desk3>
 <aoynhOsTCcapwRbl@agluck-desk3>
 <ao2eT0TWS9EaA28N@gmail.com>
 <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825161625.GAao2_2d3U7xQFgHrw@fat_crate.local>
 <SJ1PR11MB60839657B965AC3FDA53C186FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825191555.GCao3p63v3fXzwa7E7@fat_crate.local>
 <SJ1PR11MB608315809B99B7194D167D8EFCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825225202.GEao4ckknyv8nRc8Dh@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825225202.GEao4ckknyv8nRc8Dh@fat_crate.local>
X-Debian-User: leitao

On Tue, Aug 25, 2026 at 03:52:02PM -0700, Borislav Petkov wrote:
> On Tue, Aug 25, 2026 at 08:01:23PM +0000, Luck, Tony wrote:
> > L3 on Intel is shared by the whole socket. So you'd lose 50% of cores for an L3 cache
> > issue on a typical two socket system
>
> Would panicking the whole system be better?

That's basically the approach I was going for too (just more generic).

When things start to go south, panic clearly. That helps people like
me who watch for kernel health across the fleet and know how to handle
a clean panic caused by ETOOMANY MCI and MCEs, instead of something that
requires deeper investigation because the host is degraded.

In other words, I'm more interested in flagging that a host is a lemon
than in keeping it limping along half-alive, thus my approach in this
patchset.
