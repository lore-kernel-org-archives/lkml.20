Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524092;
	b=Bp9YWqcb377QplFif4vniX5tzj8pA4A6WxMANeZXPyAZZwQSehBkq+vmU1vQJxQASUXh
	 U1DjSXDQf5YPEiP9rArccbKcXwAvcStGep6X5ozz8bw3v8gtNEauNIBU5zIqhMLQMrg0M
	 As6sU9d2U7DcRhBNUcSrjTBVrS071hjzyalTudAjNGnrMA84QdiGm4LkjgaOkO8Lw79Ei
	 GF612WJ1vhbTGuedVK5Bk2s61oSwphX2VEzeeVXtpVdr4gAephllorMurplDeHZ49moo/
	 iRwEssRZft+syJUFrPD4nWpkyYhJISqrCJUxnzdHmfWo+T1KjLGorhmcDxS8oJcPedQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524092;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=gjhwUvZ+yDYJaSNCsPHjeahjfo5S4oyh9yQNrbfVu5A=;
	b=LSDmPdvoS+w9vM9QFWZttZP/BQKiCmujusiGa9yJPf3Rmm0ZBA6dfchnGNBPsfSPBQdg
	 wofD/GBdFQmhKFbDX8vEps2bl2MfqSBj9XbyEX3wCyTuGSJe6n2PmNi2jMS7t5l6hXYm0
	 /7M+KlV4rJlxFbuSFRAdu092zf5ZCC/Jv6XPr/MV0gWxEgKH1aAaIsUADOIDxaSp2f+PQ
	 kAAxPTENGCi4zva8pdj+t7mqXvYDZBkCDvOv8jS9G15Hkp+KKPBqeiwq0FUvAZPi+RcCA
	 0AnqxQJI63QgYGOCM1103uH1VYXcHKan1hKGONQJr1vfKuY2GvKGUEmM3REM7Ut8rFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUvptvRp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D564606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUvptvRp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC611F000C9;
	Tue, 20 Oct 2026 19:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792524091;
	bh=gjhwUvZ+yDYJaSNCsPHjeahjfo5S4oyh9yQNrbfVu5A=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=aUvptvRpIDQXxFiEMHRlteDiUn9TX6rLO0siz22cMrADhud6WZNynzrqtc5T5GBLk
	 rTCnTk8bwxIsEzgMdS09IDBc6W3dVp6KMNRXp1np9tIPHpe3z3ffBoLWuIvMjj5bx/
	 ELJE7jiej5txPbv4DGRZ3baS9PG2rrzYQkm3LktMl8IV80UEX5wxinRHqVycbldESd
	 h1IDAYoN8p47LebVLLLriCRcqHeYgxyfqZMYY3/3CZJWehjx6SnR6lbWzls9mgXvII
	 4wCSA3k3/DKnC+xqwFgG1OeB5SAJk1QTETbTE1FaFsxnTncUKc0AXYLVvtBp0ixE2Y
	 3M6GW4Or2Zl3Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 79312CE1B83; Tue, 20 Oct 2026 12:21:31 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:21:31 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
Message-ID: <4162b48c-0101-4900-9d80-3c091774bb09@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
 <2f65337241e230cd26c130bc3183ad230c7c40e4.camel@physik.fu-berlin.de>
 <62138DD6-F054-4992-810C-EDE92C835346@mainlining.org>
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
In-Reply-To: <62138DD6-F054-4992-810C-EDE92C835346@mainlining.org>

On Tue, Oct 20, 2026 at 07:54:38PM +0100, Bradley Morgan wrote:
> On 20 October 2026 19:48:32 BST, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> >Hi Paul,
> >
> >On Fri, 2026-10-16 at 20:51 -0700, Paul E. McKenney wrote:
> >> However, it sadly does not permit easy implementation of all algorithms
> >> needing on two-byte atomic operations because there are some systems
> >still
> >> supported by Linux that do not have native two-byte store instructions.
> >> There is reason to believe that these systems will soon no longer be
> >> supported by Linux.
> >
> >Since this paragraph has produced a headline today [1], would you mind
> >clarifying what you meant here? What architectures are you talking about?
> >
> >Thanks,
> >Adrian
> >
> >> [1] https://www.phoronix.com/news/Linux-7.4-Two-Byte-CMPXCHG
> 
> Annoyingly my name isn't on there :(

But your name is prominently mentioned in the pull request linked to by the
article.

> But I'm happy it IS a headline :)

Me, I am a bit surprised that this made Phoronix, especially given that
Linus hasn't pulled it yet.  Perhaps there is someone out there who,
like a number of the commenters, got confused and read "architecture"
when both the article and the pull request said "system".  ;-)

							Thanx, Paul
