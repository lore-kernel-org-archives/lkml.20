Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296025;
	b=qCPogcgsOsfd2CK2JoNenpzUAAq3nE5WSJJa/YQCAcZ7CrFFrAp0e5RZTbI7vmnraUEU
	 Gfk/0BatuYz1bxfa6FDlBV5cTF6NbutAIDX5bKwRVc6RzPML7nWXFZRhCYZMOQY+RxIJj
	 A9qI27nLKz2bSJTSPbgUxrmZ4rOU2GB/MN3pGL8na1khSWWAndZl+yTa639xP6+4D98Oz
	 UwimiSXvQ0jrpSUOWgeXfWIzvwD/KqNsGrhisH0WSMXQnYv+3NHeLMBN24CUFWnx2JS6/
	 faJ/bPiXcgFpznv2nD+OHGzw3N7gX2oUi2wzwH8hEofgUQ0UEmcFCMR53uJm7M5I7tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296025;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=k+BTYLfN2+3y4nUtdaNTOtmM48lOtBOQFB+7io0Z1qo=;
	b=Prshk/UflqR3BDj36/+zPDsFgyLYSSLlRj5GPx21wXh39IWvfQ0dT3yRGY/Vre3pVypj
	 MOG87XdBhVzRxMrsJeiYUR0/vzvGIanOWrEQuB0nFo3C30Wuycmcqyzd2RIgAJDb4bL2A
	 tk0Xld1guU5MX1e81yXZTdzDn079bG8Itty/qGeyOQWwPfqyzC7b0PPr0g5xyDa5CoW5z
	 sUx5AgscgzXqytlO42CSzynMRPqoZFnV0TrQnyQSU4uFacThDwQAbSiObFpPL37EnZNcv
	 elVm65mOLYlaz7xgS1BFV6imN+zGyS5obhJnzZDmKOgUuSeDCle0Sd7/7Bu77FBhjFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=RBKboz0u;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7727E606A31A;
	Thu, 29 Oct 2026 17:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7727E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=RBKboz0u
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5182640E04D6;
	Thu, 29 Oct 2026 17:47:02 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nVX9Z0d0PBPy; Thu, 29 Oct 2026 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793296018; bh=k+BTYLfN2+3y4nUtdaNTOtmM48lOtBOQFB+7io0Z1qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RBKboz0u/TaqVbrar17f8KcrtSmI2dV5VefbpKLHva9zCY1cCDQcMNt3eJi3h3/ws
	 rjnbyaubJ5l1mxEfVVB0qT72fwC02QtaS+RiMJjLTOiggdtlA/MJMV9Ruql0USoGGU
	 SgK9cKOq9VuezuxmuCgU90m37KjktkaSIPAS1eFJ8iyM3ScnVq4mxaVg0WxtpoVHp3
	 32FCAYsP4WjQRtk5VSBQoqQuhl3lDwYKh52IaDMiBsIa35nbFoxUKHonMiLGGuJ95i
	 cyfKgn8TW0RMg/qu2ftxMYD7R7vXdS6UlvwgJCzbfP9UIAqQ8zLpE8QniKjc1ptGvZ
	 MsQI0+cXh9fCuA5oR2X1jjqrs7kvY7Ta3qEfoNtgZOoWEZM0G00XYKIQ8knGQOwWCh
	 MvB8Fmq2OnkvGHf/vCuL5qXCLU3/kRiZ1yrI8YBRA+AcnsFSyUPnIR5IGiEoW0oXA5
	 Wlb5J+34zlSKp6kpL0lfaduEY0LHVTjZID6ncU3h8OGI1H7lz49cNBn8y9vuGYfljO
	 gFDz+rEd80eQKcVJ+3vCCzEZpc7f1wOcheI1c/cbqBzO4IxCfgcAYjmiG9X0rNjqrQ
	 R6Ti3H3Uqtc8zWHLgcv5fIaWdmWqw3TrKRuy+FbknQuoagmP9HMPUhswg+jZTkClDj
	 mU1TX729mBdrTZ9j5oSKptgc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 97A7340E04D1;
	Thu, 29 Oct 2026 17:46:49 +0000 (UTC)
Date: Thu, 29 Oct 2026 10:46:46 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, peterz@infradead.org,
	syzkaller-bugs@googlegroups.com, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org
Subject: Re: [PATCH V2] x86/mce: Serialize sysfs controls against CPU hotplug
Message-ID: <20261029174646.GDauOGhqHXpndpV5BL@fat_crate.local>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13>
 <20260817235553.GAaoOfieqJBZTsAn3N@fat_crate.local>
 <20260818001840.GBaoOk4Mz_mmZYK2rK@fat_crate.local>
 <878q63lrqr.ffs@fw13>
 <874iec22sf.ffs@fw13>
 <87y0bhy5h8.ffs@fw13>
 <20261029165636.GA5110@yaz-khff2.amd.com>
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
In-Reply-To: <20261029165636.GA5110@yaz-khff2.amd.com>

On Thu, Oct 29, 2026 at 12:56:36PM -0400, Yazen Ghannam wrote:
> The diff below fixes both.

No, we've been trying hard to fix this shit and I already told tglx offlist,
I am that >.< close from simply disabling any hotplug operations as long as
someone touches those sysfs files.

There is no good reason to be toggling those continuously and f*ck around with
CPU hotplug at the same time. You do those configurations and then done. Not
whack them all the time.

So this code needs to be simplified - not made an even crazier and
unmaintainable mess.

So, I don't know yet in detail how we are going to query the hotplug core
whether operations are in progress but once we do, those sysfs helpers should
simply do:

	if (hotplug_operations_in_progress)
		return -ECOMEBACKLATER;

And that hotplug_operations_in_progress should include partial hotplug. I.e.,
has someone done partial hotplug? If so, error too.

And that's it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
