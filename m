Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830884;
	b=mvlkoEu1ZoycVKK4FcA9xWYfLUDAvLS7vjLvpT5uP/HzCGtfL688JD/5xTByvO0866wt
	 SM9cOl1+It1NzfAyzdkvLy1bQzUa5/3IqpiGanmIqUzffax4ZVcl8595+S7G+mRIo82Tq
	 tMekWggYQEpANxj57aLIbsSJ763WmfuvN9T2M4MRbIvAXco/Klr6y+V0kmeJA2L+lt2tV
	 ic2gmmB4hunKHE4JoFwJKKvXXtO6jfmi7maoWksVZAK1Bmcq+U4p2NqPN4oYOUxvC1uga
	 GRW5cayTJ235228pdw6TnxlzeARDNGuTIgrOb+FFuJbawMDSkZySiBaoUffgO6RSGfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830884;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=XCCk1/UzqkHSfoEOYC+LVl2fRx92CSah9mVG5E6sbPo=;
	b=y8eMlLmW5dlK70Mu6/ZqjWEZCBEJ6hKt/Id56CMb4iEXarf3A12YeRzq/6o1t0FOYMgv
	 6WBzPIwdSAff5RO6MXOPg7n1RLE8Ni7WjX8NMxSrvZzXwFwtBinmjIa6YBD0PRIH6aoP4
	 EAk33Ldp+zWTKaPP5/IwlROKd9oa9vFp6L8dUW7ZjkPshQFn35aXmmsOJBgwxvOF/j0Zb
	 cxv4FA+abyrxY/k6joBXoqQumOOdR3RDn3njmDQa2vkuDrnks1QESIPIofKRCkTwjqjHG
	 02AfohOQEepU+4UcbS9n4v8RPQKuYLegHwaqw6QHminrZXLgU9sXayC8Qteb2fNFTbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N1bvsY5c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89982606E83C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N1bvsY5c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C5A1F00919;
	Wed,  4 Nov 2026 22:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793830884;
	bh=XCCk1/UzqkHSfoEOYC+LVl2fRx92CSah9mVG5E6sbPo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=N1bvsY5cGXpvtzUUVHaK4mO1FkP1jrhiMoU0nswrfWZNzZG63gaLaJaNqep3aDO4Z
	 owqx0fo4BNlpd8OcVDcsB6iYNTlSPadICdgSMOv12YN3LQBeY0WAp0C5K833dGMtRR
	 jBpqiAIl7VXyVkBSk5V+fh0L/gByEituloN6DEpzVxfhf4AgXHYQQ8iD0m0KZQGnKT
	 SvTjvGXgIPv+LaEobnW3xByM+Sp7z5wko/baLD2ewkyvKJkDwKIzPhnRdiP+BPJNvt
	 9uofWRSFowuzshvYtFx4io+QLm0Zj0Oq0+KFdEVF34R42w3wB9OpDj+uWh/MnJ10KF
	 NHe3cnxrL/EdA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 20705CE09CE; Wed,  4 Nov 2026 14:21:24 -0800 (PST)
Date: Wed, 4 Nov 2026 14:21:24 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: James Morris <jmorris@namei.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>, Greg KH <greg@kroah.com>,
	gmonaco@redhat.com, ojeda@kernel.org, aliceryhl@google.com,
	gary@garyguo.net, namcao@linutronix.de, sashal@kernel.org,
	natalie.klaus@runtimeverification.com, willy@infradead.org,
	linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
	tytso@mit.edu, keisuke.nishimura@inria.fr,
	jean-pierre.lozi@inria.fr, ejratl@gmail.com,
	corinn_tiffany@alumni.brown.edu, kate.stewart@att.net
Subject: Re: Kernel formal methods mailing list?
Message-ID: <e788b576-43a0-461c-9ae0-d7de3a6866e4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org>
 <4ea0f231-eec4-4f41-bd2c-e5484c0535de@paulmck-laptop>
 <b765a5d3-9844-fed8-4277-2a998980b33f@namei.org>
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
In-Reply-To: <b765a5d3-9844-fed8-4277-2a998980b33f@namei.org>

On Wed, Nov 04, 2026 at 12:56:30PM -0800, James Morris wrote:
> On Wed, 4 Nov 2026, Paul E. McKenney wrote:
> 
> > > Thoughts? Would it be worth setting up a mailing list?
> > 
> > We do have (low-traffic) lkmm@lists.linux.dev, though that was intended to
> > be specific to the Linux kernel memory model and its formal-verification
> > tooling.
> 
> That's a possibility. Would the mm folk there would want to keep it domain-focused?

On second thought, I have to agree with Miguel, so I suggest instead
subscribing lkmm@lists.linux.dev to the list.

But it could be a good fallback in case the Powers That Be object to
creating a new email list.  ;-)

							Thanx, Paul
