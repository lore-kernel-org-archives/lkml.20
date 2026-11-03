Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737984;
	b=SNBtB22tG9aTpLubFAOWvbA+zldcbwYwrl+l9Kw257mQb2+6xiLllQhu5H32AYthL5Wp
	 IPvHXA/xDtLc/X71V8ADGoI1FPHfNda20Q0ZJ0J0F1XCcsYnbN+lazpcKlWVBbDD0YiTt
	 N06babZxyJJrozJWA8y3/atUCzVdHj61YavUUNVzTDd55QXe1wfv6RZYFqkEp27rcy7GH
	 O21/iZNF7/WtESrz1cLnci6KXol+nyZfrx+HCsRSikGFHpYiNBk7Q5IJBJfySxdmvF16l
	 Ov58F9psgm5VKxVreM6lyti6rlKks3Hm0h0sX/R2IsEUTdEm+hs6uU4TGuwc5/C8k8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737984;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9jXNhCq+68kq22ZcoYtyCcrdGxQ5w6Cf/zqQkF9Nfho=;
	b=InSMu/hh6wqeh8SVj70oAjLzFyvLbMselqqHyagKtCynARwSrljdiSlxv2FgY6CtoQ2v
	 g1EX7Z8TmUukYIXMLGqCHqWzXCoxjkb0t7B94txhDIBvZweEqjFiOTo4dK1+CABA5oFd/
	 zLcuO3QvhKzptmwJVL9eZEw+IA+JyVFqwuple6DL5vB2I1G9AsuBhSqC40FzhztuYHnhM
	 T9k8DEIoLgtVSYQ//sid128hgJ7WtDSKD53LbE3Xd7+ImsA9NyoWMPtDBJWbGpecIOcwP
	 BPP3gzoJJMfwsyG6AmTd8RvUqwEY04ACds89dD80OjwVhuzA4HBXCm3OgpxQkK68pBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abJwhEH+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1276D606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abJwhEH+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941221F0093A;
	Tue,  3 Nov 2026 20:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793737983;
	bh=9jXNhCq+68kq22ZcoYtyCcrdGxQ5w6Cf/zqQkF9Nfho=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=abJwhEH+x0XkRvRKfJuKg2Fnk3lqSipX6XDEKBocjhfQsMO7Q6xBAFIfXd9h8j3e5
	 W00Ji2hGYIw9N/bAterSYG5OBDHtszp9UPDBqMhrff7m1EXwfkwUg2/31oBTndoZ4N
	 vRAHVyFBMqk3CrfDwnhHZNXjxMltWP9gHY5929PFBHhEU4t6weqsdGDtI0d8oIh4Z+
	 VQuKKdqjRB+TzcOaJedmEXgl2NSKL40HqZodZtxfrKFsuKt7z0qzQZb+j+v1g0AhK+
	 aYiZpNODfdNvscv45uenNvSuegKKiBWQ6l1K+mywRBXO2t6JQo9w0zn2aDdxAFD8zj
	 zOuJXHv0VSjoA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3FAB9CE0C97; Tue,  3 Nov 2026 12:33:03 -0800 (PST)
Date: Tue, 3 Nov 2026 12:33:03 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jan Engelhardt <ej@inai.de>
Cc: David Laight <david.laight.linux@gmail.com>,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, Bradley Morgan <brads@mainlining.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
Message-ID: <dffbdb02-0093-409a-aa20-1cf2a33b8f94@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
 <4p5316or-75o2-s068-74s3-6q5011o75672@vanv.qr>
 <6f24126a-7f84-40f8-a297-095b470beb8b@paulmck-laptop>
 <qnrr9sr7-19rq-6rp9-0oq9-5939r07no828@vanv.qr>
 <20261102163448.3956dde3@pumpkin>
 <s2530278-793s-8r51-s5q8-349s35q8159r@vanv.qr>
 <ad8358f4-483c-41d3-8fae-e7032c4a5bd7@paulmck-laptop>
 <so31o447-8o91-0pop-06qq-92q0o584q8n5@vanv.qr>
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
In-Reply-To: <so31o447-8o91-0pop-06qq-92q0o584q8n5@vanv.qr>

On Tue, Nov 03, 2026 at 09:11:17PM +0100, Jan Engelhardt wrote:
> 
> On Tuesday 2026-11-03 19:19, Paul E. McKenney wrote:
> >> >> 
> >> >> I can get gcc-17.0.0-20261102 with no further command line options
> >> >> to turn `atomic_compare_exchange_strong`+uint16 into some object code
> >> >> that does not contain a call to libatomic, for sh2, sh3, sh4. Haven't 
> >> >> tried xtensa or the others.
> >> >> Thus, is the patch really needed?
> >> >
> >> >Won't that need a big jump in the minimum supported compiler version?
> >> 
> >> 12.0.0-20210420 behaves the same. I just chose 17 because that was
> >> convenient to try first.
> >
> >Are you also advocating ditching the single-byte cmpxchg() emulation?
> 
> There is more?

Indeed there is, and has been for some years.  See cmpxchg_emu_u8()
in that same file.

> Please note, I have not looked at the code at all. The patch
> description _alone_ was enough to make me ask, such conflicting
> rationale it had when presented to me.
> 
> I had not planned to go on an expedition to see what gcc would
> produce, and was hoping the patch author had done that initially,
> to provide a good case for his patch rather than against it.

I am also not planning to go on such an expedition.  ;-)

The case for the patch is that it is a simple and small change that
enables cmpxchg() on two-byte arguments to be used in common code.
Another advantage is that it works on all compilers currently supported
by the Linux kernel, no expeditions required.

When and if someone comes up with a better patch, then yes, we should
of course consider it.

							Thanx, Paul
