Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729965;
	b=Rfe8KypEM5d8Q5Yv1Rsityw7A71dZNhgjKXHAMTOCH657vE0oV/3qPYfyTXa/w1hhsaW
	 ayfuBzBkFOCJO5LDfNa364paLN67aDyEqdi/L4gmuNhlXW5eTcOtJOf6prW+OV8oiCJ4g
	 sw2VUJwwoO2dGb9YTajwiLIed0XG/9RVm36RMN6iMbDDl8PvTexYzUnEVvyVq178ykO4V
	 /nPIW1BGJHBU4oLDcLAv61I4oN0yrPQ3/qf/Mpb3nqe/7G4aNx7cc//62n8v8AdjrbTGx
	 Z+VbZmd82SMiONFWG55eUCWcz/8eHab0bECRNcY7Y9MSg3edoqUnDTKXWSoVaYNjwgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729965;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=BQAYKpdoSrFTsTqrI0dYgxlaPs+j9b8WV1Qokm2C+Fk=;
	b=Tbp7lViPq25G5Vbxphu2YM6LPg6GWRB7dt+kvTVPeSxLNPxdEG+A5VXz7k0Vzwa9ZilR
	 hCa0Uv8UpkRpgkZBbFSyEX4LTLjzjT0QETpVFIRRwBqh09wqHBEehbBDNZSNQWLzyJHd0
	 +HomvlgaCsVEeIBp+gN15ULOLNZq9cUA6R8cVOSVffWrMzrUGuU32zbJr2EuxZ3eGadGV
	 C16yoCOrM5KwLnTED3/21q5JQJsGorA5HLlGk4pOlaZ0vgFxO33x2ckrABEWK2nf/OToa
	 /clE89Dv+CedZyJeJqniE4hVIT0Me5fsnPbHKqDwEmp9mE5cdd5ljnNTa69Jxp46Z7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lsKlFwZM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78C8606EE92
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lsKlFwZM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B87C1F00A18;
	Tue,  3 Nov 2026 18:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793729964;
	bh=BQAYKpdoSrFTsTqrI0dYgxlaPs+j9b8WV1Qokm2C+Fk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=lsKlFwZMWjnD7F2UEwo5VNiNjF+CfV0fYjBXO8lhg0DzeNHloc6fVaunxl08SMONV
	 JI4s8V2QudtbszkmElD1veYTLcZdOtMuqWhyik1BpJyHPq3mBuCdKcLMhzHVChXhEW
	 5bZQ2LdKiPm25p1xe2nA4HbU8tfETvUo/supeyhjNbUidcCLyKYRlTLGRw+1T4jEtO
	 a8vBSfk0COZrTUcczKSf0AG6PFAasXF7Kqv6tVM7VXiYkJE4ePrmdu9G6EdsYOd3OM
	 4G/ZXRFY75mG0C0nHar1QU46EZxvlQal7Wxq8uBe4Siou34Jlb/7fGt3ZeQybo0C2g
	 4e/K1QGG7+yMg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E4810CE0C97; Tue,  3 Nov 2026 10:19:23 -0800 (PST)
Date: Tue, 3 Nov 2026 10:19:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jan Engelhardt <ej@inai.de>
Cc: David Laight <david.laight.linux@gmail.com>,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, Bradley Morgan <brads@mainlining.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
Message-ID: <ad8358f4-483c-41d3-8fae-e7032c4a5bd7@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
 <4p5316or-75o2-s068-74s3-6q5011o75672@vanv.qr>
 <6f24126a-7f84-40f8-a297-095b470beb8b@paulmck-laptop>
 <qnrr9sr7-19rq-6rp9-0oq9-5939r07no828@vanv.qr>
 <20261102163448.3956dde3@pumpkin>
 <s2530278-793s-8r51-s5q8-349s35q8159r@vanv.qr>
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
In-Reply-To: <s2530278-793s-8r51-s5q8-349s35q8159r@vanv.qr>

On Tue, Nov 03, 2026 at 03:03:47AM +0100, Jan Engelhardt wrote:
> 
> On Monday 2026-11-02 17:34, David Laight wrote:
> >> 
> >> I can get gcc-17.0.0-20261102 with no further command line options
> >> to turn `atomic_compare_exchange_strong`+uint16 into some object code
> >> that does not contain a call to libatomic, for sh2, sh3, sh4. Haven't 
> >> tried xtensa or the others.
> >> Thus, is the patch really needed?
> >
> >Won't that need a big jump in the minimum supported compiler version?
> 
> 12.0.0-20210420 behaves the same. I just chose 17 because that was
> convenient to try first.

Are you also advocating ditching the single-byte cmpxchg() emulation?
If the compiler really can handle this emulation for all sizes on all
supported compilers on all affected architectures, that is actually not
at all an unattractive approach.

							Thanx, Paul
