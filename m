Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793037107;
	b=zp58SLp5eZ6bvH4/UpCWWcZ0U7SA1Ghk3K8+e18xtQNd44aR+Zf7MuS7t5DQNnfE59iz
	 e319ylzzg0AWsUQ081Wdg2FUoomkBe1FjMhXCMDWFmFBOm+DRJA2v+tYIzXtfp0NV5N9T
	 cTdUVF4n9TUGVArFVkR9k5aW9Na82jxvVZ2ucsYX60POU81EqfU/er5hgvTM0SWFc/Tqo
	 TJm8uukAerTOKcwuWu8K4ayim9IeVtkr7MUIvSlAhMRGmhpVpQ7VF30lhhGaZzbtgqUG5
	 Vyj9tsaZZjbH5mpil5GyTbHmzLS3Fah1VFpusWhVj8ZnJ7T5XgMEFzyiBW9Mbc2hdZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037107;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-MBO-RS-META:X-MBO-RS-ID;
	bh=+zE9kVNs5C7sYZHMxAgpjn8fTZT69NqSWFunM32ji+Q=;
	b=tDAYsABv4ki+ovysujlYjGZYTb0gDrzvP2m5VpZxdtJeFiqW/BzwWpIbJKLRjw/wQWLt
	 vQYPRPEWKXGs+kGC397LJ6r8ChEF+BpA6yIMKqrW0dreA8q3fmMXjIUtwCPrEHcQhrfzN
	 pc5YaGmKiIJMr9JKsN63/bpi7XAb6NhvCUMK1aPXf00eekeWBT09iaGXkFbR5uv/rTU0F
	 t2fPg0JhhyqQip53b4OsA8iqVg4XzRu8N2s9G/wYRF4Xgg1WlaPAD6TWtA0btq8EMJy80
	 RTWy2PRMajP1YTub+y5dbnnlCwlocr9T5ndMPR2DF+hLCmU9rzouyOLZF0sEPCUj8JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=vfM+xgkT;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2019C606A31D;
	Mon, 26 Oct 2026 17:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2019C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=vfM+xgkT
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jD1Ql1YcdzKp50;
	Mon, 26 Oct 2026 18:51:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793037103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+zE9kVNs5C7sYZHMxAgpjn8fTZT69NqSWFunM32ji+Q=;
	b=vfM+xgkTeSHFp0dpRFW5mvDxLWynvaYYd1UZ+0M8/RjdK3Y/o+kfyc5kjAwpXTIZsr9Eu6
	iExYX6fI/vZP81wbfVGzOl1iJoKCqxBJmoBTf7rDmFgc7GkX9+CIvi72yb/ZgfofHKatWm
	CEhmHoyYhPPpDYIG2BX/PYZg6euQ1DnaSJdvglOUm5V7jnR3pJMr3adsVPyyWfe80IThes
	PV1MfXTDdgA2dDMotzgnU6/3lFKeT8b0eHT0SY7mfG9tZzTHCgiEdq+PwAAqfMMCzCGB+q
	5PjQz2AM722OC6zZ3Ral0YnsHFgnv2G3dPDeGPmex+WvUtmaIsXIBJ5iXOlHYg==
Message-ID: <72437017a038310cad48a5ff488377a9f8eb89f1.camel@mailbox.org>
Subject: Re: [PATCH] mm/damon/reclaim: improve grammar and style
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Randy Dunlap <rdunlap@infradead.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Aveline Noir <jm5905938@gmail.com>
Date: Mon, 26 Oct 2026 18:51:40 +0100
In-Reply-To: <20261017162706.103996-1-sj@kernel.org>
References: <20261017162706.103996-1-sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: 5bdyhnnc1mx585ghi5jiq6o1fnqt5y33
X-MBO-RS-ID: 6365762b24dbd342937

Hi,

took me some time to respond because of the procrastinations.

On Sat, 2026-10-17 at 09:27 -0700, SJ Park wrote:
> On Sat, 17 Oct 2026 11:18:34 +0200 Manuel Ebner <manuelebnerli@mailbox.or=
g> wrote:
>=20
> > Hi SJ,
> >=20
> > On Thu, 2026-10-15 at 07:01 -0700, SJ Park wrote:
> > > On Thu, 15 Oct 2026 10:06:23 +0200 Manuel Ebner <manuelebnerli@mailbo=
x.org> wrote:
> > >=20
> > > > Fix tenses. Replace 'set as' with 'set to'.
> > > > Rewrite complex sentences.
> > >=20
> > > Let's put two sentences in one line, while breaking it for the 75 col=
umn limit.
> >=20
> > Will do.
> > >=20
> > > [...]
> > > > @@ -113,8 +113,8 @@ quota_sz
> > > > =C2=A0
> > > > =C2=A0Limit of size of memory for the reclamation in bytes.
> > > > =C2=A0
> > > > -DAMON_RECLAIM charges amount of memory which it tried to reclaim w=
ithin a time
> > > > -window (quota_reset_interval_ms) and makes no more than this limit=
 is tried.
> > > > +DAMON_RECLAIM recordes the amount of memory which it tried to recl=
aim within a time
> > >=20
> > > s/recordes/charges/=C2=A0 or s/recordes/records/ ?
> >=20
> > For me charge is such a weird word exepct in 'charge a battery' or 'cha=
rge a fee'. And
> > 'recordes' is a typo. Does this work:
>=20
> 'charge' in this sentence is somewhat like 'charge a fee'.=C2=A0 I person=
ally don't
> feel it is weird.=C2=A0 But 'record' also work for me.

I will keep 'charge' at the later mention in the file.

>=20
> > DAMON_RECLAIM records the amount of memory which it tried to reclaim wi=
thin a time
>=20
> So this looks good to me, too.

Will do.

>=20
> >=20
> > I could do this in a second patch aswell.
> >=20
> > >=20
> > > I'd prefer charges, but my English is definitely bad, so looking for =
your
> > > suggestion.
> > >=20
> > > > +window (quota_reset_interval_ms) and stops when this memory limit =
is reached.
> > >=20
> > > I feel like readers might wonder what is stopped.=C2=A0 How about "st=
ops trying
> > > reclaiming memory when ..." ?
> >=20
> > window (quota_reset_interval_ms) and stops trying to reclaim memory whe=
n this limit is reached.
>=20
> Looks good.

Ack.

>=20
> >=20
> > >=20
> > > > =C2=A0This can be used for limiting consumption of CPU and IO.=C2=
=A0 If this value is
> > > > =C2=A0zero, the limit is disabled.
> > > > =C2=A0
> > > > @@ -125,19 +125,19 @@ quota_reset_interval_ms
> > > > =C2=A0
> > > > =C2=A0The time/size quota charge reset interval in milliseconds.
> > > > =C2=A0
> > > > -The charge reset interval for the quota of time (quota_ms) and siz=
e
> > > > -(quota_sz).=C2=A0 That is, DAMON_RECLAIM does not try reclamation =
for more than
> > > > +The quota reset interval of time is quota_ms and of size is
> > > > +quota_sz.=C2=A0 That is, DAMON_RECLAIM does not try reclamation fo=
r more than
> > >=20
> > > I think this change is just wrong?=C2=A0 quota_ms is not quota reset =
interval of
> > > time.=C2=A0 Which part of the original sentence was difficult to read=
?
> >=20
> > 'charge' again, and I think there is the verb is missing.
>=20
> If use of the term 'charge' is really making reading difficult, we could =
add a
> short definition of 'charge' as a separate patch.

I think it's not necessary, it's probably me.=20
>=20
> E.g.,=20
>=20
> '''
> --- a/Documentation/mm/damon/design.rst
> +++ b/Documentation/mm/damon/design.rst
> @@ -695,7 +695,9 @@ dynamic.
> =C2=A0To mitigate that situation, DAMOS provides an upper-bound overhead =
control
> =C2=A0feature called quotas.=C2=A0 It lets users specify an upper limit o=
f time that DAMOS
> =C2=A0can use for applying the action, and/or a maximum bytes of memory r=
egions that
> -the action can be applied within a user-specified time duration.
> +the action can be applied within a user-specified time duration.=C2=A0 D=
AMOS tracks
> +(charge) the amount of memory that the action is applied, and stops appl=
ying
> +the action once the limit is reached.
>=20
> =C2=A0To know how user-space can set the basic quotas via :ref:`DAMON sys=
fs interface
> =C2=A0<sysfs_interface>`, refer to :ref:`quotas <sysfs_quotas>` part of t=
he
> '''
>=20
> Please let me know if you'd like to send such a patch.

No need.

>=20
> >=20
> > >=20
> > > > =C2=A0quota_ms milliseconds or quota_sz bytes within quota_reset_in=
terval_ms
> > > > =C2=A0milliseconds.
> > > > =C2=A0
> > > > -1 second by default.
> > > > +1000 (1 second) by default.
> > >=20
> > > Isn't this (1 second in milliseconds is 1,000) easy enough to infer f=
or
> > > readers?
> >=20
> > Ok.
> >=20
> > > > =C2=A0
> > > > =C2=A0quota_mem_pressure_us
> > > > =C2=A0---------------------
> > > > =C2=A0
> > > > =C2=A0Desired level of memory pressure-stall time in microseconds.
> > > > =C2=A0
> > > > -While keeping the caps that set by other quotas, DAMON_RECLAIM aut=
omatically
> > > > +While keeping the caps set by other quotas, DAMON_RECLAIM automati=
cally
> > >=20
> > > How about "caps that are set by ..." ?
> >=20
> > Yes, this was my second choice.
> >=20
> > >=20
> > > > =C2=A0increases and decreases the effective level of the quota aimi=
ng this level of
> > > > =C2=A0memory pressure is incurred.=C2=A0 System-wide ``some`` memor=
y PSI in microseconds
> > > > =C2=A0per quota reset interval (``quota_reset_interval_ms``) is col=
lected and
> > >=20
> > >=20
> > > Thanks,
> > > SJ
> >=20
> > I messed up the subject line, should be:
> > Docs/admin-guide/mm/damon/reclaim: improve grammar and style
> >=20
> > I'll follow up with a [v2], including Aveline suggestions.
>=20
> Sounds good.=C2=A0 But let's finish the discussion about use of the term,=
 'charge'
> before posting v2.

Then I'll head to [v2] and make it a 2 part series.

>=20
>=20
> Thanks,
> SJ

Thanks
 Manuel=20
>=20
> [...]
