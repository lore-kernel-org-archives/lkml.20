Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520821;
	b=pgngQn0qKm218T6NT6IxKNFBI2Ybpn/qhrN7iwgrWed9H4c1WZGUyzFK1zMSFetnu7IK
	 kB1GyQQGvl/0NVhIEYB9yC/iwLhh2IIgsJLrfgJ2mheAnCwVraF+jN3dl4CDYEjpvhzEj
	 ef1sGdAjc2J2NwCu86xCqsnWhpnGre+Vtgp2ROzE3gp4ckHxqaUsSec17qQ+WzBwDfHDS
	 phMxcK7Qwjbaw6GTWwVUYhUeXL83eVslgq8xhhAAP0h2k6mZDqYLIaQRln63x8HA5KPI4
	 bsa/1FgDh20q9D+A20VmXoaEbNv2+XnLqskYHIrCISOW630dDZCSXWYROeEW2T9lkug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520821;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=3OmwLlRNyLvNMujIWUf2Ri23JC1fyr6rgOiVHuG/6jI=;
	b=B/BdyZMJ7NIfMvqhrgodRkeNwjKi0OJGoh91HZ+jTWBD8+mAnaSnmbtJsa93YlOcWqHk
	 YnFiEb/9B3fzn5K/HOA+XxC1fR/bxtaM7nhqDjHgX+KteNgHR2zsn37jD2ZI5bsk8q6m7
	 biH19WDfNwlCWXYachor/vejgzWWRD85BrhOKvmCV6TRzyoXFivgWqpTFrJIj3BP6+mOU
	 rjRFshzIotgtpK3dMVoaDSnSgKt5TZNlJTt1AKZROxxxy0JK7Xzl5fcWzh8TTDSuiooyo
	 N1aeAz5W76Vke3BcgaKzFAVq+SE2D+Xx9YKsAPNh6xek6CyaNNMJBhmKWFDjb06WeKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBXIGrkZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3664B606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBXIGrkZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91F51F000C9;
	Tue, 20 Oct 2026 18:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792520820;
	bh=3OmwLlRNyLvNMujIWUf2Ri23JC1fyr6rgOiVHuG/6jI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=FBXIGrkZdZaQtbzSA7di429TuHZcgqZRrqkPmXwZj6/34Ans0MGsqh7QS2C9aUGAK
	 50KQobrqVK4AnZ1k2jzMyzsqNJDdILCl2r+Vo9/7IT5dSbAxsvKcARflC33CLI3GEJ
	 ZYmCZNLSvoYur0MFvSxYc/9oPbbKRwZzdSQDZPMj76vRP99tSFO6qGUEkrnFaIopSG
	 vBofHJor34nZ31Y2XnQknAm2dDMrman4iWeq9jqQUxs5cxbBvboic3LZaPM8EktHsJ
	 biXK6oPh2uOVfGQpnx7t24Czy2Psmeod6AyHfq3BtuT2HkFugSzplXsEfadvhkhrpC
	 8Q98dfEft/87A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 74172CE09E8; Tue, 20 Oct 2026 11:27:00 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:27:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] x86/nmi: Enable panic() when NMI handler runs too long
Message-ID: <47884f06-820d-4a95-8036-4c75f45fbb6c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <53ff8d29-b7ce-4b3f-bdcf-9ac1f31f0a9f@paulmck-laptop>
 <8b14bd35-8f7e-4e41-9aae-e085f9a536f6@paulmck-laptop>
 <20261020045247.GEatbzn7VKvUfDTbR4@fat_crate.local>
 <5182974b-500a-4076-b9a1-5c67dded8380@paulmck-laptop>
 <d8a05f9e-42ac-4c19-8713-558e1f002bd0@intel.com>
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
In-Reply-To: <d8a05f9e-42ac-4c19-8713-558e1f002bd0@intel.com>

On Tue, Oct 20, 2026 at 09:45:48AM -0700, Dave Hansen wrote:
> On 10/20/26 09:15, Paul E. McKenney wrote:
> >>> +	toolong_nmi_panic= [X86]
> >>> +			Cause a panic upon return from an NMI handler
> >>> +			that took longer than the specified number
> >>> +			of milliseconds.  The default value of zero
> >>> +			suppresses these panics.
> >> Cause a panic after an NMI?!
> > When the NMI handler runs for more than ten seconds, life is hard anyway.
> > And no, these were not bugs in the several affected NMI handlers themselves.
> > 
> >> Oh boy, is this trying to solve a Meta fleet problem and you're thinking, why
> >> not upstream it too?
> >>
> >> Because I fail to use the usefulness of this...
> > I might be wrong, but I doubt that Meta's fleet is the only place where
> > such bugs appear.  😉
> 
> Yeah, I once upon a time had a bunch of problems with NMIs taking
> forever to run. In my case, it was some actually wonky firmware, but
> differentiating the broken firmware from NMI handlers just being slow is
> what motivated the existing "took too long to run" message next to which
> you added the nmi_panic().

I guess I am glad that it is not just us seeing this sort of thing.

The existing "took too long to run" message is a good thing, but in
our case we needed a global timeout and we needed it to be quite long,
as in multiple *seconds*.  I did not see a nice way to integrate what we
needed into the existing ->max_duration checks, perhaps due to a failure
of imagination on my part.

> That said, I'd much prefer something more generic than something
> NMI-specific.
> 
> Would the systems that set toolong_nmi_panic=1 also set panic_on_warn=1?
> Are there any other "extra" panics that these systems also find useful?

We do often also set panic_on_warn=1 on our fleet, so in theory we
could make this be a WARN_ON() instead of a direct call to nmi_panic().
In practice, we would need to do something like make check_panic_on_warn()
check in_nmi() and invoke nmi_panic() if so.  Other adjustments might
be needed, I don't claim to be familiar with this code.

Or is there a better way?

> I'm kinda curious if, for instance:
> 
> 	hung_task_panic=1
> or
> 	softlockup_panic=1
> 
> would also panic() these systems.

They did not do so on our systems because the NMI handlers ran for "only"
a few tens of seconds, which is not long enough to trigger these panics.
We did get the occasional RCU CPU stall warning at 21 seconds in, but
these proved to be unhelpful in this case because the IPIs used by this
stall-warning code are deferred until exit from the NMI.

							Thanx, Paul
