Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.189.121.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793035735;
	b=gQeRHJX+0SKoh6L79i5rvrd8aJqA9orw0hXS4qNMVbnXjee3QpW5tyPY0kL8xpi7meuV
	 fpwooWuJGCZ+sOqtCI+5HadH3mPOyiGdd1EG6ZcxH5FP/jMehIgY02mFljV28FJ02uMxp
	 usXIkO/yhuO86alS0mtizanN7x9WGh5GU9oAR8EBjnGJL7fRqVZQpBW934HQfvsp4CSdW
	 gxU3BqroFb+w6bbb5smDsc3g3VIHVe/SnYbQMulG5u8USDrpbaAnlPDyb8rX05N7no2en
	 Pg6w8HxM2H3FAOTUORW9RNE8x7rQW9WF9qaUdwuf4lrSxyXVGyIeSg6IS91sP0Z1IKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793035735;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:MIME-Version;
	bh=rNYVoB/vG5hvRMg+OMSDk4D9eXpEA7XdikSaZ4l7fw8=;
	b=mUEvaaMtTxSg8SD2Kw/c8PTIbYeuswOYPTBUCAboA/mY0p0OKCjySz2PXIJnXhmTBnuf
	 /R6tmZKPLxBhHCKEHT0YPMRHCO/IeyMpXvLsK47+ZAFXbFzh/+E2dWnd8xZcxm56jz0ha
	 y7FIXsygKyrbrww9vQ+P2OoNykeO6+y/lwCwXanCf/HChOtnAtZQYmg5NfnMsLEagp/+2
	 9TAriADeD4eYSPM/XdHIGkFE52kwazZ6ooxiC2EiPjN/frVx4LdFu8orHLEaELO5BhDll
	 LxK6Tvcsp0UMW4P/CBh87uOSIdK/p+YCGbN3kLzkJTUTN0DQ24JIwVtyGoehOtdT3WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itx.no;
	spf=pass smtp.mailfrom=itx.no;
	dkim=pass header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=amgzAXTc;
	arc=none smtp.remote-ip=91.189.121.228
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A3C606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A3C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=amgzAXTc
Message-ID: <1e00b909b81c6195b3ad5aeda207d20cbedc3971.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1793035725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rNYVoB/vG5hvRMg+OMSDk4D9eXpEA7XdikSaZ4l7fw8=;
	b=amgzAXTc5NZ/dPYXpBMPiLc6pEMpIXezfi6jYzpnRJcTayuGobqFYTYgQHDdHBtnB7lAjE
	7ISROa000YgTZfZCG//gugzB3EH6Gfj4cBp/4+CdCEMtwU/1A54W6XSZf0ggc+pafwqLXd
	ypULGgvlLtG6b6SIuankyq50xZTquhg=
Subject: Re: [PATCH] sched/cputime: Don't warn when the tick period starts
 after idle exit
From: Stian Halseth <stian@itx.no>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Menzel
 <pmenzel@molgen.mpg.de>,  Thomas Gleixner <tglx@kernel.org>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,  regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 18:28:44 +0100
In-Reply-To: <at-C_3rGi55L1v2X@localhost.localdomain>
References: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
	 <20261025100202.2584654-1-stian@itx.no>
	 <at-C_3rGi55L1v2X@localhost.localdomain>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Xt8q2rvFat6JboAfAbBs"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-Xt8q2rvFat6JboAfAbBs
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Frederic,


On Mon, 2026-10-26 at 17:42 +0100, Frederic Weisbecker wrote:
>=20
> I'm a bit confused by the scenario that happens here. Do you mean
> that after switching from a clocksource to another, ktime_get() goes
> backward?

No, not going backward, my description was vague, sorry.
It's tick_next_period that runs ahead, not ktime going back.

Also, please challenge my assumptions, as I might be analyzing this
wrong. This codebase is still pretty new to me, and I might
misinterpret some things.

But from how I see it, on jiffies, ktime only moves at the tick. So
seen from the tick's point of view, tick_next_period =3D=3D ktime_get().=A0

After the switch ktime keeps moving between ticks, but the next tick
still adds a full TICK_NSEC, so tick_next_period ends up ahead of now
by the part of the period that jiffies never counted.=A0
In a KVM guest at HZ=3D250 that was 2.3 ms.

Do you follow my reasoning?

>=20
> Also refine-jiffies is not a suitable clocksource for nohz, so
> last_tick shouldn't be updated while refine-jiffies is the
> clocksource.

Yes, right.=A0last_tick gets its first value from the sched timer expiry,
which is that tick_next_period rounded up to a tick multiple by
tick_init_jiffy_update().=A0

In the guest that made the first expiry 4.66 ms after now, so for the
first 0.66 ms a tick stop leaves last_tick - TICK_NSEC in the future.
Paul's registers show the same, now 235623102 with last_tick
240000000.

I can rewrite the commit message along these lines, or fix up
tick_next_period at the switch instead if you prefer that.

/Stian

--=-Xt8q2rvFat6JboAfAbBs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCat+NzAAKCRDoeAEuJe36
Vjt9AQDp8Boh0KnF7NRVAg6PQH/JONz79Sk6gO6LlNd8VTUF7gEA7gUWba17J7MI
YwY8M9vsJE3MvrFvPmHmOD3iO6KW2g8=
=9Apx
-----END PGP SIGNATURE-----

--=-Xt8q2rvFat6JboAfAbBs--
