Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.189.121.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793455911;
	b=Hd64nK1rLKGUlx9QGV08rGP7/shZJCDJ+CNxZChJgr2mlRm+7BnoK4BYMF0qwB3L3Ndl
	 maHVg30Uedxr2u6ENo2ySLQxi3ddcyS9R6DKqsF881fVjU8jsPdZ4RfwCPfad+kwNsVrE
	 zH5s6W4SrKg1bbD57ShzSdicfv3wzzjGYv1fVvBmddwc3Gp8Nj7qiSwIlx1QwXvZ6XYPa
	 ByJ35QQlEiMBK5j4pYje9oBiccFoK5JCOE7+w1fdCyAFn+rIiIV72ukR3RcfGtbHTU6va
	 E5OL1qiKGfjkJmGfSheEcwWzm3xQaacQC6tgkA+hQ28qs0Mfo4KE1+sVeE4DmKeicuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793455911;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:MIME-Version;
	bh=lvlz765PeiLIZOiym9FNUcuzEVbVNRreYuI+C2LJcxg=;
	b=LXrJEOTMPKXDQ6sxtEqsOJ8mPvQLcIurbpFVWoC9Br0qOunbsTW8FlkA1iy++DgjstR6
	 qFH11a8vyvLpTw8vkNSNFR4VOR3oTue0KdHK2XKplB8vzZBT8/Wt7BpwzPlDLMJb7/gnZ
	 /xgQZcBEPe9a/4F9yTiaLWyrBy4JhoQPxlJuCsSPRkeKiiLnYPqT1NSTvGGQ8o48gVIf/
	 DjyUdkIluURXhDynZ/kDbVxQ88y6sj57bjvevj/gesmY6oNHV2vaeH+pRNrTtIhqQ6LAf
	 IULfXD/aJcVTC4VH5iCwNZNlmufjj2n52Ws/6Zm/P41PlhA9oNp0Lt2WtSdupU1mpOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itx.no;
	spf=pass smtp.mailfrom=itx.no;
	dkim=pass header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=fEszFz5Z;
	arc=none smtp.remote-ip=91.189.121.228
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2023F606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2023F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=fEszFz5Z
Message-ID: <a4ba7e5be50ed4de4cad3d3e53355eb533587694.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1793455907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lvlz765PeiLIZOiym9FNUcuzEVbVNRreYuI+C2LJcxg=;
	b=fEszFz5Z3nynviUrhTPmHzI8erwiqpKmx5HQM7/56p+bimpZ/V6fhIX/UOre5vXeP55JlW
	4O1mTyLIm48+Iui4LFmeo8DrIXEgvX5lj80v9DweSSOiWlJ1pAbBeXlzr2d0Ai50H7il+g
	iDJs6FJM6A7pfoykCDcnBxXZwtrmCfg=
Subject: Re: [PATCH] sched/cputime: Don't warn when the tick period starts
 after idle exit
From: Stian Halseth <stian@itx.no>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Menzel
 <pmenzel@molgen.mpg.de>,  Thomas Gleixner <tglx@kernel.org>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,  regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Sat, 31 Oct 2026 15:11:46 +0100
In-Reply-To: <auXzIbzU9aWBD_fM@pavilion.home>
References: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
	 <20261025100202.2584654-1-stian@itx.no>
	 <at-C_3rGi55L1v2X@localhost.localdomain>
	 <1e00b909b81c6195b3ad5aeda207d20cbedc3971.camel@itx.no>
	 <auDaMdhD2zGBLhDE@localhost.localdomain>
	 <bd9b6592bce4b8f2e802518bf2cad561af61e78e.camel@itx.no>
	 <auIDNl9EUX4CzWzr@localhost.localdomain>
	 <68f0450d47577dc4f83d32e5b0211c97ee8d24bd.camel@itx.no>
	 <auXzIbzU9aWBD_fM@pavilion.home>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Xwu0bUm283+Mi4l8kNS5"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-Xwu0bUm283+Mi4l8kNS5
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Frederic,


On Sat, 2026-10-31 at 14:54 +0100, Frederic Weisbecker wrote:
> >=20
> > Here is where it goes wrong. One tick has passed in real time, but not
> > in ktime. The switch happened d after the last tick, jiffies never
> > counted that d, and the tsc only counts from the switch on, so here
> > ktime_get() =3D=3D jiffies + TICK_NSEC - d.
>=20
> So that assume that during the clocksource switch, the new clock synchron=
ize
> with the old one so that ktime_get() from the new clock should start from
> the last value of the old clock. I'm having troubles to verify if
> tk_setup_internals() does exactly that.=A0

Not that one, the timekeeping_forward_now() just before it. It folds
the old clock into xtime_nsec, and tk_setup_internals() keeps that and
only resets cycle_last from the new clock. On jiffies that value is the
last tick.

>=20
> [=A0=A0=A0 1.549194] old=3D 1352575566
> [=A0=A0=A0 1.549930] new=3D 1352578748
> [=A0=A0=A0 1.550636] clocksource: Switched to clocksource tsc-early
>=20
> That's 3 us, it could be the simple difference between the 2 printk.

Look at the timestamps: 736 us passed between the two printks, but
ktime moved 3 us. The 3 us is tsc-early, from the read in
tk_setup_internals() to your second ktime_get(). The time from the
last tick to the first printk, plus the 733 us from there to
tk_setup_internals(), is never counted. That is the d. If you print
ktime_get() in tick_periodic() as well, old=3D will match the previous
tick exactly.

>=20
> But the switch from tsc-early to tsc is much more:
>=20
> [=A0=A0=A0 2.639818] old=3D 2445754540
> [=A0=A0=A0 2.640172] new=3D 2446107950
> [=A0=A0=A0 2.640927] clocksource: Switched to clocksource tsc
>=20
> That's 353 us.

Here the printks are 354 us apart and ktime moved 353 us. Both clocks
run, so nothing is lost: tsc-early counts up to the switch and tsc
continues from there.


/Stian


--=-Xwu0bUm283+Mi4l8kNS5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCauX3IgAKCRDoeAEuJe36
Vm63AQDQGv3N0diSFTWp+l2Ve0ji6no/verLCGOZM8j/6mEARQD+LsaZJKEYH6Ac
hVj1Ob+CQjxKCa1+nmNCcVTlgYFucwA=
=epro
-----END PGP SIGNATURE-----

--=-Xwu0bUm283+Mi4l8kNS5--
