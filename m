Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793058818;
	b=lFqhCJX0DjTIdSJYXTC9EXHJIsnC6uGW8ijuCrTMZkFKQtQWfJmY6FNeuR+8a8dQsrN6
	 E5MWkZDECqYLjfpmsApGm1qPbdhM+R7rdWcDITH3AyP1LHRvCWQ7NuJbVWoi4sKRUWPWm
	 BYhn9D7lPaHE3qx32/3z5WMQMi9QDbidY0IcGbOcOoM2xda7tTPSpM4/Oi5agt4N0PhJa
	 kJPnlg/lcdXSRqaod/iCBvUzUeKqbksCkj32bhc4Wm+71PNo3H7uIGisZxeFh6jiSCiYK
	 dvtNLxT7PvtJjoncEQE7eAnxzvLF7Cf4puJKXL7eToku5cqxxUIrBmwZw0lUFcHVD5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793058818;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=sFeDkC9zqMittCSgY8EWGhM+YGFJ67oEKhT0Sl3nYak=;
	b=AeZ0kzZFjrLE5+ZWrjUXtwcBnUYmBw/HK78JmyLuSVov6XvV2yPa6jzisR6EplstexMb
	 BklAKR+JcUB/z7z+raJxr9Nc4QpgIP4FfVvycS8q9K2fl+eIuTWGJj2t6cI/zDmA1B5Rz
	 xtv6f1v07IkYmdCdq0WiA5rO051JWN1GJMfMpJGy9eh6OQAitCh3QTZQ7q1+Dzb940Udd
	 9xWuaXZ3pMH91L4EifAh5qCvbqqGqKM7DeEtQCo16P+V7ITzvIrXuxalHH+p2mNgD1n0q
	 QYkpn+BrEm/7IWF1KKFwvulJXFna5YSGYVXYRBF9K3QrIMtTp7t1INWWmpt+Rdx6IoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="S7yYrGX/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20FB606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S7yYrGX/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AED1F01828;
	Mon, 26 Oct 2026 23:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793058817;
	bh=sFeDkC9zqMittCSgY8EWGhM+YGFJ67oEKhT0Sl3nYak=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=S7yYrGX/h0IEwuHPwFco0u6cJlXg2PKopBlNQjCgrtxUZmbrkKSwymrIotMhDHqK0
	 n2XBhabBqpUyipFjH3Nv6Qnyit3R+P+lQ8nnbgKNQ1uLwXIHCHdCusSelx84CJTp44
	 oxwVI8DKhx0jEX+D60CCP3OpR6ta4ri+rK3qxVfOlXwbz4tQd5MyYT7PZ6bOnk1Ddb
	 ZTdxIt0emLPidkQRU+VSYv7M0hdOKREB1Pfsz7wLHlvs/QVoRt2Q9blCda5EI0Cn0C
	 1KGzc2jZ5HbEni33D+kD4Sdtmjtxw89D6/cVpj5qFrl1kk5BfOuMXqGgGvE8qspylo
	 PKK4ZX4Z1r8Eg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0D1ABCE0C35; Mon, 26 Oct 2026 16:53:37 -0700 (PDT)
Date: Mon, 26 Oct 2026 16:53:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] x86/nmi: Enable panic() when NMI handler runs too long
Message-ID: <abc1e11c-52b1-4069-9a9d-60d1efd69f04@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <53ff8d29-b7ce-4b3f-bdcf-9ac1f31f0a9f@paulmck-laptop>
 <8b14bd35-8f7e-4e41-9aae-e085f9a536f6@paulmck-laptop>
 <20261020045247.GEatbzn7VKvUfDTbR4@fat_crate.local>
 <5182974b-500a-4076-b9a1-5c67dded8380@paulmck-laptop>
 <d8a05f9e-42ac-4c19-8713-558e1f002bd0@intel.com>
 <47884f06-820d-4a95-8036-4c75f45fbb6c@paulmck-laptop>
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
In-Reply-To: <47884f06-820d-4a95-8036-4c75f45fbb6c@paulmck-laptop>

On Tue, Oct 20, 2026 at 11:27:00AM -0700, Paul E. McKenney wrote:
> On Tue, Oct 20, 2026 at 09:45:48AM -0700, Dave Hansen wrote:
> > On 10/20/26 09:15, Paul E. McKenney wrote:
> > >>> +	toolong_nmi_panic= [X86]
> > >>> +			Cause a panic upon return from an NMI handler
> > >>> +			that took longer than the specified number
> > >>> +			of milliseconds.  The default value of zero
> > >>> +			suppresses these panics.
> > >> Cause a panic after an NMI?!
> > > When the NMI handler runs for more than ten seconds, life is hard anyway.
> > > And no, these were not bugs in the several affected NMI handlers themselves.
> > > 
> > >> Oh boy, is this trying to solve a Meta fleet problem and you're thinking, why
> > >> not upstream it too?
> > >>
> > >> Because I fail to use the usefulness of this...
> > > I might be wrong, but I doubt that Meta's fleet is the only place where
> > > such bugs appear.  😉
> > 
> > Yeah, I once upon a time had a bunch of problems with NMIs taking
> > forever to run. In my case, it was some actually wonky firmware, but
> > differentiating the broken firmware from NMI handlers just being slow is
> > what motivated the existing "took too long to run" message next to which
> > you added the nmi_panic().
> 
> I guess I am glad that it is not just us seeing this sort of thing.
> 
> The existing "took too long to run" message is a good thing, but in
> our case we needed a global timeout and we needed it to be quite long,
> as in multiple *seconds*.  I did not see a nice way to integrate what we
> needed into the existing ->max_duration checks, perhaps due to a failure
> of imagination on my part.
> 
> > That said, I'd much prefer something more generic than something
> > NMI-specific.
> > 
> > Would the systems that set toolong_nmi_panic=1 also set panic_on_warn=1?
> > Are there any other "extra" panics that these systems also find useful?
> 
> We do often also set panic_on_warn=1 on our fleet, so in theory we
> could make this be a WARN_ON() instead of a direct call to nmi_panic().
> In practice, we would need to do something like make check_panic_on_warn()
> check in_nmi() and invoke nmi_panic() if so.  Other adjustments might
> be needed, I don't claim to be familiar with this code.

And following up on this one, setting panic_on_warn=1 everywhere we care
about too-long NMI handlers is a no-go.

> Or is there a better way?

So unless I hear (or think of) a better way, I will forward-port what
I have when -rc1 comes out.

							Thanx, Paul

> > I'm kinda curious if, for instance:
> > 
> > 	hung_task_panic=1
> > or
> > 	softlockup_panic=1
> > 
> > would also panic() these systems.
> 
> They did not do so on our systems because the NMI handlers ran for "only"
> a few tens of seconds, which is not long enough to trigger these panics.
> We did get the occasional RCU CPU stall warning at 21 seconds in, but
> these proved to be unhelpful in this case because the IPIs used by this
> stall-warning code are deferred until exit from the NMI.
> 
> 							Thanx, Paul
