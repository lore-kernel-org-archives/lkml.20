Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423118;
	b=2muhARpowGqKH1xCfFt4pu658oLI8Yldrx6+6hIXpdzFwHO5VBoZDkWP7JjaSjQUOiOb
	 7jfY90848oP4DhhG4Tm3jOHsTKg+X82TQyJPTpmeXxSZSzQyAze7QhTSX+1pwtmOT458h
	 fbDc+6V+FYs/jqaPzpe8ANSBEMyoECyrdNCTjQCvNCCS2UT6GPvIKBsK6qq02PgMVBpLL
	 hKEp4Zr7DUBl8TfnH7HfrNnyV1VET47JgDqaY+hTwXqpCsDc2C8gNJ7NOtI8b4p/hgvbd
	 9NOKjw2Y/oU+JidKJi0QgVgvuV36MS8einQtGbvg8wxOV4xa4Ojx1OTthNXUMXzBIWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423118;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=acZPaXrGTu8/UUtd1RI5ijXVddLO0ChjxOvKHHFA4g8=;
	b=JJHqulepAKFmYoBR3CRghRk4xngBvDkflfNLTbdCHQ7s/LScmFuYxqpCXuG8IQY2HmQV
	 bFL75aZZ5glbvLxiX+2NIswwp/JiRrXdkkmYHrfxjdUh8pOOz3C4/rnJgAliAGu190cTL
	 iLJbm6z3Y/ti12YGY9GWXnwBa0PVSoIx8QJH/9jf/cbzDALnKFYQN/+MlB2yMtDt9XTDD
	 f2nGNEO97H2/KdE/QzXlcMm5c3b5PzGLsR38yA0HpbTY9K9+nZg0rRQcndEQs9QXy9SNN
	 lnSNG6owx3GPN76f+To7nIO0GpMeC3QXhgGja7Iz3HQ1DT++hJdMpw9RhMNLZixf5mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CV18qq9c;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5dDuiRNe;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A85C60A3820
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A85C60A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CV18qq9c;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5dDuiRNe
Date: Mon, 19 Oct 2026 17:18:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792423114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acZPaXrGTu8/UUtd1RI5ijXVddLO0ChjxOvKHHFA4g8=;
	b=CV18qq9ckVfOqLuuj38MGWnduisOubCKPr1BOhObU9fnkn6iMGj2zH9fQHsELEtxH/loBL
	IZblKRmNPFPrbjzWD42GRKNjQp08GbTKunV6GN3hInSIS9yN7fVsmSqx5yzSPruCRHTPsB
	aU3OzTwdgPZbfYAeR1ZGQyDMHjzB6ZyyaBLTGW1TI/awwn/xd4Yh9aFzY72h9/pnflHKf5
	TZcvwW9OFhRvgvHs0s9ufMbzp0A2z4cnhba0L+HGsaeCNq7bDvzEMJw0xm3/eYyjoQndwJ
	vk+pHF7OcYG7+eGEfpQYts07kbV573nVuG8AxGKExuAfzuIVhnzf1YbBrfA9+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792423114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acZPaXrGTu8/UUtd1RI5ijXVddLO0ChjxOvKHHFA4g8=;
	b=5dDuiRNetGyuF5nsplT8nuOxNGJDnk1LwQ5fKWi4z07Y/cC2PDGo8y/474nmJfOW3a8zn3
	clRWyakgyjTjVUCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Bradley Morgan <brads@mainlining.org>
Cc: pmladek@suse.com, akpm@linux-foundation.org, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	kees@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] panic: drop the fake trace id from the oops end marker
Message-ID: <20261019151832.cGDLBKXZ@linutronix.de>
References: <20261004175419.269865-1-brads@mainlining.org>
 <20261019144628.r8Q0S1M-@linutronix.de>
 <56958262-5F26-49E3-87B2-C26CA2F39F64@mainlining.org>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <56958262-5F26-49E3-87B2-C26CA2F39F64@mainlining.org>

On 2026-10-19 16:07:12 [+0100], Bradley Morgan wrote:
> On 19 October 2026 15:46:28 BST, Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> >On 2026-10-04 17:54:19 [+0000], Bradley Morgan wrote:
> >> print_oops_end_marker() prints "---[ end trace 0000000000000000
> >> ]---". The format pretends each oops has a trace id, but the value
> >> has been a hardcoded 0 since the oops id machinery was removed, and
> >> nothing prints an opening marker anymore. Nothing in tree parses the
> >> id either, the pstore selftest greps for "---[ end trace" without it.
> >> Kill the fake id, the format specifier and the 0ULL argument go with
> >> it.
> >
> >Could you please figure out _why_ it is hardcoded to 0? Someone
> >requested this with a reason. If you want to remove it, you need to
> >ensure that reason is no longer valid.
>=20
> Nice catch!
>=20
> uhhh, well it's just always been there I'd assume. Probably for selftests=
?=20
>=20
> But what's exactly the "benefit" of this? Idk.

Once you figured out why something is the way it is you could make
change it argue that the old reason is longer valid because of =E2=80=A6

You did not do it. You simply said remove the 0 because we have in-tree
users. At best.

Sebastian
