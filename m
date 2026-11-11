Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359503;
	b=IhzrgzDmSzHhyoaldyLxP2ZALBFSgL+nl60cd0ukcKCs+e45j2NKq/wS2WsIgUVyy2yy
	 njtgqOaFB9ZPDYFcdkj+Bz9XOIsYP/Y5/dhULnsQjC5ZgjJm9C58MAlXttw9dq5LocMMY
	 Wzmy47ovM3s7GBhk6aFPezz6zq9xp5VJO+5r2qyoV4cNR/IIb/4vffUHPQoaaffaKgtER
	 4NOTtlnHj0gGB74xV6ASFLhZqlx4JRiZjIlU7XL/36XMzavAj94wOyAL1vjOvahyyr8zv
	 JZ0RFsdfK5vhfhoj694WTzDpWZSmIGskGriNurwshb7duw/DRcGQ69pwBfw6XZjrzjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359503;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Mime-Version:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=sl4qN9RDn6HEHsCUVdU22P9o6RoytL5nBRI3/NVeG/Y=;
	b=KPXfcjMDCuPEImpfIiUauJTruVXqEyuyz63NpHSsXf6nuc2yjP5rhkAyM4gxEoQkQJ7j
	 +oMfOXlBBPfNiUs13sgGPvZmY50Vj+MEtp79c9ikXx+tKVlJQGya4+GUA5wBeZzjHnRhY
	 h2u1x5fplTIrlEEw5UrB7EcojfFYORpOyTsyItd1jZoIwLsxRQfjbZWIl1cWKT5EYK7p3
	 iBpo4HOPHeQiLan000IWLHy9XOoWsh1QVNybiW5mH8AI6nBcDw2UYgVW/Lq2EuxMXQE4g
	 zgJsFmCHo7htVbwgRRiKAwkJXA6qTtoUMKjWugwpNM1/soCIq3qe4JNPVH+keKS/xJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="NtmP/+Rc";
	arc=none smtp.remote-ip=91.218.175.78
Received: from mta0.migadu.com (out-78.mta0.migadu.com [91.218.175.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B04606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B04606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NtmP/+Rc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bF/s9Eh+bsdrjEWqer0i7ryNUlXG2OzjJkfX9ENKl+o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794359500; v=1; x=1794964300;
 b=NtmP/+Rcp7qgfUY4bkpOKWxPgWjvawC2d3RoZibsSji56xk+92MIFDvhEPywj0vuES/5b7mD
 +HIsTAaebOqdwSuJ/GhEm4t/Wh2kkkZjeTyTactMdLg9PI5iInzEJPEqoyvqEns1py0cVbOUcha
 YP1u9Y2fZtL0jWSLOTxuH8O8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 01af7b6ba4ef9efc;
	Wed, 11 Nov 2026 01:11:40 +0000
X-Mizu-Trace-ID: 01af7b6ba4ef9efc
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=dbbf7b4062f21184826499ede7d5460c438b26e25673e1cb068044142669;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 11 Nov 2026 01:11:36 +0000
Message-Id: <DMRZCSZ0W7NS.K8CUKB6WCX01@linux.dev>
Cc: "Anup Patel" <apatel@ventanamicro.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] irqchip/riscv-aplic: Use handle_edge_irq() for
 edge-triggered MSI sources
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Thomas Gleixner" <tglx@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.dev>, "Anup Patel" <anup@brainfault.org>, "Radu
 Rendec" <radu@rendec.net>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@rivosinc.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev>
 <20261110-aplic-affinity-fix-v2-1-6c143b8b4e8c@linux.dev>
 <87ik24telo.ffs@fw13>
In-Reply-To: <87ik24telo.ffs@fw13>

--dbbf7b4062f21184826499ede7d5460c438b26e25673e1cb068044142669
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Thomas,

On Wed Nov 11, 2026 at 12:07 AM GMT, Thomas Gleixner wrote:
> On Tue, Nov 10 2026 at 12:06, Troy Mitchell wrote:
>> In MSI mode, all APLIC interrupts are handled by handle_fasteoi_irq().
>> For an edge-triggered source the APLIC forwards each edge as an MSI and
>> keeps no state after that, so an edge which the CPU side drops is lost.
>> After an affinity change, the next MSI can arrive on the new CPU while
>> the previous one is still being handled on the old CPU, and
>> handle_fasteoi_irq() then drops it.
>>
>> The fasteoi flow also never calls irq_ack(), which is where IMSIC applie=
s
>> an affinity change that was deferred while a previous vector move was in
>> flight. Such a change stays pending, and later affinity changes of the
>> interrupt only update the pending mask.
>>
>> Use handle_edge_irq() for edge-triggered sources. It acknowledges the
>> interrupt before invoking the handler. If the interrupt is still in
>> progress on the previous target CPU, it either waits for it to complete
>> or marks it pending so that the handler runs again.
>>
>> Fixes: ca8df97fe679 ("irqchip/riscv-aplic: Add support for MSI-mode")
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>
> Not that I care at all about showing up in some made up git-tag metrics,
> but in general it's a matter of courtesy to point out that the solution
> to the problem was suggested by someone else, no?

I'm so orry about that. Will add your Suggested-by in v3.

>
>> +	/*
>> +	 * Edge-triggered sources are fire and forget, so they must be
>> +	 * acknowledged before the handler runs. The edge flow handler also
>> +	 * replays an interrupt which arrives while the previous one is
>> +	 * still being handled on another CPU after an affinity change.
>> +	 */
>> +	if (type & IRQ_TYPE_EDGE_BOTH)
>> +		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
>> +						 handle_edge_irq, "edge");
>> +	else
>> +		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
>> +						 handle_fasteoi_irq, "fasteoi");
>> +
>
>   https://docs.kernel.org/process/maintainer-tip.html#bracket-rules

Will add the braces in v3. Thanks for your review!


--=20
Troy Mitchell


--dbbf7b4062f21184826499ede7d5460c438b26e25673e1cb068044142669
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iI4EABYKADYWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavPAyBgcdHJveS5taXRj
aGVsbEBsaW51eC5kZXYACgkQmAnvgPkzNC/ATwEA68tz0LWjoLhQ6lydmRmFFbH4
SqBX5eKqpNjMrVEbw78BAJVfavwwDwGaomM3yvjCdAxmfV9e269wEMCMPm3Cz1UN
=57iv
-----END PGP SIGNATURE-----

--dbbf7b4062f21184826499ede7d5460c438b26e25673e1cb068044142669--
