Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CB341DDEC;
	Thu, 27 Aug 2026 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824066; cv=none; b=TxTMTn67B24TUEmqJCuKd2Bi2Bcm/YPX0xq2u3qk8YN/pVNAf6E9J+SUxb5seZh/HSd3R+zvwSRG9biN+isVOZUIGAvoyEhNZ+92QwyGHUFSjJh/xHYm6LXcSeRqXSZlT1TF6tiEzSCvN4AVbxhtoDl4rwCij8Wyzu4jMprGvg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824066; c=relaxed/simple;
	bh=fBqBLWnj3bXA1ZbUvM2cXGwDI7zfndKWFxgY4ge5R0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smzRPlFBiEaQkkMYnU/MaDqIZa4tRGmGuf5+fngSBWjla+NNO7TqDvyHgChmp6kEK1z43LmveKQRnqKmX9VsnSgaePw2xww2FAO+l2jzVkOGaumXephUPscjmfeN7foDvPZji9aGCl6IX9HyaL6uA3ZRziE+YV7XMV7vL/AJJ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Wdjwg6vu; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Wdjwg6vu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AqoHi3wB+5NhjIn3E57jwOsqi45ENIQn3s5aha/P3mU=; b=Wdjwg6vuhJgaVcSfmzer492P/7
	X93o+ya2N1fgNVRPlT99e4PXu/U7sLve9n4Ps0Qjc3cuZfN/ZHxWvzDW6inDBLej99BPnDcPsMlSn
	7UNy3WBLYF1NFhGW8Y4TVd37I0kza1rhVP4MihEqlW3UupwIycS7oiWC54CrU1lpxrHra3RxipwQT
	BQmYy+RxBS0oCPt6c/ytU+5MORBsYrdQYcpfge+pbQk5vREh2poYqAI71ssiJ9J8MR4H5EnaS3y6b
	MX3wBrz9Wr1aebc0PLayOGxx+9Nc1zl00XU0lg7V25Jbs4bTWRSIfGDCqVpMh/Ykvb6vB7Ya8X0Ak
	1kcW4Zyg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wzWhY-00FuCT-3B;
	Thu, 27 Aug 2026 09:47:17 +0000
Date: Thu, 27 Aug 2026 02:47:11 -0700
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
Message-ID: <apAEy6c6xuXJXSEQ@gmail.com>
References: <aoynhOsTCcapwRbl@agluck-desk3>
 <ao2eT0TWS9EaA28N@gmail.com>
 <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825161625.GAao2_2d3U7xQFgHrw@fat_crate.local>
 <SJ1PR11MB60839657B965AC3FDA53C186FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825191555.GCao3p63v3fXzwa7E7@fat_crate.local>
 <SJ1PR11MB608315809B99B7194D167D8EFCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825225202.GEao4ckknyv8nRc8Dh@fat_crate.local>
 <ao7nGM9sCQyxJvsD@gmail.com>
 <20260826160934.GBao8PvsM8M-U7XuFR@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826160934.GBao8PvsM8M-U7XuFR@fat_crate.local>
X-Debian-User: leitao

Hello Borislav,

On Wed, Aug 26, 2026 at 09:09:34AM -0700, Borislav Petkov wrote:
> On Wed, Aug 26, 2026 at 06:22:27AM -0700, Breno Leitao wrote:
> > In other words, I'm more interested in flagging that a host is a lemon
> > than in keeping it limping along half-alive, thus my approach in this
> > patchset.
>
> This is your use case but I'm sure others would prefer the limping and
> gracefully saving work the system has done until now...

Right, and I'm making this configurable: users who prefer a clean
panic over a limping machine can set the kernel up that way.

> Putting my user hat on:
>
> +               Panic once a machine check bank has logged this many corrected
> +               errors. 0, the default, disables it.
> +
> +               The setting is global rather than per-CPU, and it is compared
> +               against a running total kept per CPU and per bank. Lowering it
> +               below a total a bank has already reached takes the machine
> +               down on that bank's next corrected error.
>
> Ah, so how many CEs is "many"?

This is a user-configured option; each user picks whatever number
works best for them.

From a quick look at the Meta fleet, this follows a bi-modal curve:
a bunch of hosts logging a dozen or so, and a few with thousands. So
doing some napkin math, I'd say "many" is around 100ish for Meta
fleet.

> Or you simply say, after X CEs, we simply panic the machine - instead of
> gracefully powering it off after leaving a helpful message in dmesg - and have
> lab technicians inspect it?

Correct, that's exactly my approach here.

After X CE errors, we acknowledge that the machine is no longer
stable enough to keep carrying the workload, and simply panic. It's
the last resort: it means lab technicians haven't fixed the problem,
and nobody has gracefully powered off the host either.

Thanks for the review,
--breno
