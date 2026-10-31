Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.189.121.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793448959;
	b=cckE2NZkb7fPjEsUacrJmD3FriQhIBmj+Q5ROFlmxm3VAGVsqn0BwspZDLLVr0CTgLZL
	 JcWv4mpaVFrWUYxbQp7WEZ1bpGJLqMFsSjRTQNF/zz3xWQnqRteA2BNoRCU793TespyJI
	 fWqEGwj9mg6JAUcX8W3maJAAQBU6SmgXZAuiBouV8MNfzJ7WuwYqWMwutW5ODnFwx90jV
	 IbWNKF3GZIXjjPcIiWdVyXi/Q9LrN4zkoyIpBvXPZylc2hAhwwOIYlAJ/0fTXa2zmWGt8
	 NG2CFXqoLIdiTVuqefKAzEw7zwypyauJ3ToKX3hmDYDbfkWI0Yny3qgbKoPfHt3vVoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793448959;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:MIME-Version;
	bh=EDnpldi5RK0AnuEzL3K5R2iyu0Pi3r3gBMzfdKdH7kY=;
	b=Wsva6d1CMlUXcx+IkCwJMM/C6boHRtE0mSjhD+b+gv/E7MUoEA3tsWpd21egmrhaJ3nk
	 gcVRtCyg0kFKs09zk80Xya1HyCQWBfhALE4i7RdvPwKsMZ7PZP5ikQfG9bqwweWJXkkmn
	 VddBlQT7M2yBdB2x1HFxUOdhOhR3SYESYMjxAY2CfZaB7uAaq1Tzu9dbHo7McttrcOaU5
	 /aMEu/QBNfob0yiyY6JCZ5PsLPsLOzr51Wizm/gq5iOiTxFFPc7IhJWbxag7awzE7d104
	 QSfdPLN6LhrEWAUaT3P6iZPg/7nKi9XAYjXQNOOAk7mesdEmFreD3wM7ScoXr/WQ2Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itx.no;
	spf=pass smtp.mailfrom=itx.no;
	dkim=pass header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=EwmoYvxk;
	arc=none smtp.remote-ip=91.189.121.228
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA54B606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA54B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=EwmoYvxk
Message-ID: <9bf3339ad6bf6b15668f6c35b57a8f42265b7f6e.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1793448951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EDnpldi5RK0AnuEzL3K5R2iyu0Pi3r3gBMzfdKdH7kY=;
	b=EwmoYvxkqH/hqN+UsiyREG55YjF9GhjlnPm2KDvmj6HnsKOEaXr90TwVMzH2yjgo0psomQ
	M+w629M374F7Eh0rKz85UMovDv6ZbQ+BJvp+YxiZqPsyVdtqmpoaoczFODQcbHd+YoFba6
	jI4em8Zpzq+N3FWjGBWRLet3lsrcY/k=
Subject: Re: [PATCH v2] sched/cputime: Don't warn when the tick period
 starts after idle exit
From: Stian Halseth <stian@itx.no>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Frederic Weisbecker <frederic@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Paul Menzel <pmenzel@molgen.mpg.de>, Breno
 Leitao <leitao@debian.org>, Thorsten Leemhuis <linux@leemhuis.info>, Thomas
 Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Sat, 31 Oct 2026 13:15:49 +0100
In-Reply-To: <auW3XbhjMjakWAhT@scheduler.schedules>
References: <20261031081408.3378884-1-stian@itx.no>
	 <auW3XbhjMjakWAhT@scheduler.schedules>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-VoUST8Xfb5JSxNKPyQ83"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-VoUST8Xfb5JSxNKPyQ83
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Kayra,

On Sat, 2026-10-31 at 14:47 +0300, Kayra Cizmeci wrote:
>=20
> TICK_NSEC =3D 4
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0 switch
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v
> Real: 8 9 10 11 12 13 14 15 16 17 18
>=20
> Time: 8 8 8=A0 9=A0 10 11 12 13 14 15 16
>=20
> Tick: 8 8 8=A0 8=A0 10 10 10 10 10 10 16
>=20
>=20
> So if we enter idle at real-12, and exit at real-13 this happens:
>=20
> last_tick is 16, so last_tick - 4 =3D 12. But normally, last_tick needs t=
o
> be 14 and tick_start needs to be 10. Or am I missing something?

Your diagram is correct AFAICT, and that's the case this patch is about.

10 and 14 would follow the old periodic ticks, but after the switch the
tick runs on a grid that is d ahead of them.

Idle ends at 11, before tick_start at 12. The code already accounted
that correctly but warned about it, and v2 drops the warning.

>=20
> IDK if there is a better solution tho.
> Maybe fixing it from the root would be better. If its even possible to do=
 it
> cleanly...

Someone might have a better idea, but maybe we could realign
tick_next_period when the clocksource switches away from jiffies.

I kept v2 to the warning though, since this is a regression in the
current release, and a change to the tick setup could be a potential
follow-up.

Thanks for the review!

/Stian


--=-VoUST8Xfb5JSxNKPyQ83
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCauXb9QAKCRDoeAEuJe36
VqEZAQC2E0gGPVVWwk7ejLcmaZxNocbAcJhx1JjlibzdMIVwLgD/dGfqMB876H+W
GfrivKJdNnMZ9Y8fuomOe2qVUozYGgw=
=WNqC
-----END PGP SIGNATURE-----

--=-VoUST8Xfb5JSxNKPyQ83--
