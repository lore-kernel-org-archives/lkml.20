Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747033;
	b=ivnukmqJJ7hexZRIFqywiM7PWXTIBm5nlthkboxw8UPmZCXiMatvmd5N0Z0afK4tlAKV
	 nVVcZZ8Z8+Su3Rh01kdIu/1X3U5RNQ3wRhwKsM5GPWvYqkgTRNlh7XF9ImIeQYxkTmZPY
	 RXJDsgNuLvo3Om+UJQDmilDb/IXj1xr2HY+GRSpiD+xOaWA+oUnVYCsXE64qWFCpO37rK
	 0feXIngO8p2uD77WOnOcda1C8wvIsMOWxdksyuwA79PNv/CZvx7jZa67f5gJcUt30xBXz
	 8Q3e1KmFcHHGSVRzz60lrnFDMtp1d+C5AKd2HueS+LJ4Fu/m3sw2hnxpSCOiPbb7a3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747033;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=oFTl+nE56SewO0tNr6+96cXk4+EYsvn36bQJXT4FlH8=;
	b=Hxda6LOo9Mw8VF4krTdR54ibEqtoGrhTZC1Tkp7gMA77M2zu1OnGe7w+maBABuTJ4Qly
	 pJYmkvDEQnsr6FMw8RqB/9VZW3oRQlVZ2OCMGVNnRC7W8jwVGlq7DYILISSo6q3Q2O9jB
	 IoPNJrxZbZzPd2vOZr4h2HenOrj2nOX1Wj4GBNcWGY7yHSLJfKwy+wWHdccFLdhmnpF7+
	 PGuUmPk3PJcDIGGj3cPRRQ+I9jzboVDiuSlMnJ5nTKM7rx1BXN9J3EUiZJu6yLYMszQBn
	 bDoeQ4ccYAxBFexK3WmvfDSsCvfkiXzT2lohEiEdxWF0OSKEVu4u54CQgpKfBiQatfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ckDh3Ag/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A9606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckDh3Ag/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2041F000C1;
	Tue,  3 Nov 2026 23:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793747033;
	bh=oFTl+nE56SewO0tNr6+96cXk4+EYsvn36bQJXT4FlH8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=ckDh3Ag/EUmrCP+YiZqd7BKZ72t1xE5FBw6Xjg4EwO2KTrZFpeuwi4eG8o7izMMAr
	 ubSZlfK9aR52iA5NaFygs+iHUl05q6QDdL84/KvoP/60r5iciH3ZgWpjYXekaX2CjK
	 3mLqfAr8TzFdrehh/LW7/VbQMFpL/XvyZFL3ypvMw0ejVQB0oCIhCtGqJfoycPJQx/
	 nHjv5oGVoD3EYL3NlLGPATlLpNitbK/lrUQfyHLt0yHwt4xWh8EEQ3IZsuCdYb9w44
	 EKXbhbwdS1BwKnqyy5S5ch+sKhnjnm2cS7y8RqD+Mxv6qyiTSq3LpZkgnc2Mu/g+JL
	 ywPRo2IF5TP5Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AC934CE08CE; Tue,  3 Nov 2026 15:03:52 -0800 (PST)
Date: Tue, 3 Nov 2026 15:03:52 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Jan Engelhardt <ej@inai.de>, torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Bradley Morgan <brads@mainlining.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
Message-ID: <16b7cf49-68ff-4e14-8459-7b314fbf1860@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
 <4p5316or-75o2-s068-74s3-6q5011o75672@vanv.qr>
 <6f24126a-7f84-40f8-a297-095b470beb8b@paulmck-laptop>
 <qnrr9sr7-19rq-6rp9-0oq9-5939r07no828@vanv.qr>
 <20261102163448.3956dde3@pumpkin>
 <s2530278-793s-8r51-s5q8-349s35q8159r@vanv.qr>
 <ad8358f4-483c-41d3-8fae-e7032c4a5bd7@paulmck-laptop>
 <20261103224725.253b560d@pumpkin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103224725.253b560d@pumpkin>

On Tue, Nov 03, 2026 at 10:47:25PM +0000, David Laight wrote:
> On Tue, 3 Nov 2026 10:19:23 -0800
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > On Tue, Nov 03, 2026 at 03:03:47AM +0100, Jan Engelhardt wrote:
> > > 
> > > On Monday 2026-11-02 17:34, David Laight wrote:  
> > > >> 
> > > >> I can get gcc-17.0.0-20261102 with no further command line options
> > > >> to turn `atomic_compare_exchange_strong`+uint16 into some object code
> > > >> that does not contain a call to libatomic, for sh2, sh3, sh4. Haven't 
> > > >> tried xtensa or the others.
> > > >> Thus, is the patch really needed?  
> > > >
> > > >Won't that need a big jump in the minimum supported compiler version?  
> > > 
> > > 12.0.0-20210420 behaves the same. I just chose 17 because that was
> > > convenient to try first.  
> > 
> > Are you also advocating ditching the single-byte cmpxchg() emulation?
> > If the compiler really can handle this emulation for all sizes on all
> > supported compilers on all affected architectures, that is actually not
> > at all an unattractive approach.
> 
> What is the 'bloat factor'?
> While the function call costs, the atomic op isn't cheap either.
> Or are you putting the compiler generated code in the function?

Fair points!  Perhaps this choice should be make on a per-architecture
basis, given that different architectures might have different costs for
atomic operations vs. function calls.  In which case, lib/cmpxchg-emu.c
provides the emulation functions for those architectures/systems that
benefit from it.

And if at some future time, no architecture uses these emulation
functions, that would be a good time to start thinking about removing
them.

							Thanx, Paul
