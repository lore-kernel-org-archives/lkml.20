Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E81A3B19A9;
	Thu,  1 Oct 2026 17:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875887; cv=none; b=U4k2yQK9qwF7MOCr6oOhdYQRPtEv0KkhydaXefbfPImlzM80eqPFBn8ZZ/r76pjssBATdRdWdEVq/x+KGLX/dgQARHEsRn4FjTTbaa/XvvEgtfAUo//WcE3BYqMjl0hAW8erGsmbgJVUMIZUcdObIxUjS7hHwqkxGkHM9fwSV7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875887; c=relaxed/simple;
	bh=yCKjm9+h2qCKBCe9AwdN70bhtyt7DGh0hApk/2wTcqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pqo76fok0wIQarFEsntaNIzhhwNwyM/kkgfZ9Kplv3/9VnIdBVf5DuBsaxRk3XW7cO9xdfR0FBZwcRKAGLz9XYXHuCKTBGZ99JiX9WPW+w1xrV5MUNaAuABelepi8Ho4tTIRxyVfCJ9xMs0lBcEsEYwbDWCXnAJS5stpVK8fgNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGGEYrlp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGGEYrlp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5151F000FF;
	Thu,  1 Oct 2026 17:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790875885;
	bh=1cfhNMvIJDm8Sy+ZsesWLZO/KcA2N7nqorQZPk3LipE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=OGGEYrlpdId/bc8vtYFCwdNtpy4WCi8en0PvYis4OH29EOKJLRopN/r/Feg9zIO5d
	 EZ2H3uqaGTZGKrh/ZeoQHB9ArYCsEgXNgEsVYdD7WY364LeXEE+xxgCoQaGbiEnvNx
	 nSmFg5Fij1fuHLJEwQrUEkVQgLMIW7/S6d5KBpyC2o5c//f7Fu6GV1MrTY8aY+JJ6p
	 SwglLBaXmStK7vWzGfES62jCbJ/28u0eCsgnqXsdxt1R+BU/LhE55meb9lOAl8Bcc4
	 kutq9gKdjuXOlut+akg8+spyMX2Ng9X61HdC25CihF2JlWCMvfOFXmvo0vmQvhxtuZ
	 AkA1NBx6hH84A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 03F0CCE09FE; Thu,  1 Oct 2026 10:31:25 -0700 (PDT)
Date: Thu, 1 Oct 2026 10:31:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rcu tree
Message-ID: <eeb2e29e-8d08-4755-9b34-366b0bcc2847@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ar5Zd022vYh5cXcI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar5Zd022vYh5cXcI@sirena.org.uk>

On Thu, Oct 01, 2026 at 02:00:39PM +0100, Mark Brown wrote:
> Commit
> 
>   d563f311e7e63 ("doc: RCU: Fix s/strategem/stratagem/ typo in Requirements.rst")
> 
> is missing a Signed-off-by from its author

Apologies!  Second time, too.  OK, I am dropping this patch entirely.
If I get an updated version of this patch with a proper Signed-off-by,
I will pull it back in.

							Thanx, Paul
