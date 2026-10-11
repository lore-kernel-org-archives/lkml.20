Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C656126CE05;
	Sun, 11 Oct 2026 03:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791688196; cv=none; b=O7YhYYpmsqUVaIlHOwRrVojK4gRQpaz7I2t/I8oxtoMnxBIN9bTpPIYYiWkmK2ddyX3EZJrlLcYJwXKnl60FkDX/qLxUgIFoW6n+1BiSQ8scVOYcaE298+Rf6tUjzvtjakKrVHwLfeKIsGzbbBk5FZMxkk2zyYMm4eh/BtQ+hYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791688196; c=relaxed/simple;
	bh=4m6CiHIXLcTLZiemS0ktlfqETabZ496cjz4VuaQM6x4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aID6kS37Rf2ULibwfFLswmAy9sr2IOZ/t1HqapTZxr51UaexS8eo42cjXaM4f7TeUStalUSVO0l4Fw9n+N2MxTDJCYDrOQHhJgIyBbdr5PHAbfL4lsg4B3GKrxvr8vSEjCnnBE1Wdd4B/N5NKjxJxlH4uo3Sma6sSb1x5MIzrTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=VH68w1l8; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="VH68w1l8"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 176BAD1DCB;
	Sun, 11 Oct 2026 06:09:50 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 176BAD1DCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791688192;
	bh=4m6CiHIXLcTLZiemS0ktlfqETabZ496cjz4VuaQM6x4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VH68w1l8JDks86FV+XSXsLe5NlV66EytKLKnvJZFm3z558H4OsMBzTIq0liJY7s/C
	 T+kjmGuPStM95e/OAqwrZRMUrt6FDte8lENRxQu4CS5X57soXpS3Oe84iO2YN7s9OB
	 oA21gEsprUzhF/SlsEEKlCaxWpOU4t6IPc00e9lQEKQGKCq1VGJ8S6wmtIxQlRTrW9
	 E+KW89vY3LnqI67Im7y44R5rebnutWuNW532O3QLe+WU8pN5s+AcI7TaXLmxeIratR
	 y84ac4ZXiinPoyHGqEWfQ9TFSXm4K09vEJlTSyim0EgQEkYDmtCMVtoPKZ2XIPRL11
	 XY4IPlevBD8FA==
Message-ID: <13259378e2e41c61a7235c1b47eac649ab06425c.camel@rendec.net>
Subject: Re: [PATCH v2 8/8] irqchip/al-fic: add irq_set_affinity callback
From: Radu Rendec <radu@rendec.net>
To: "Farber, Eliav" <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
  "Shenhar, Talel"	 <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>,  "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>
Date: Sat, 10 Oct 2026 23:09:49 -0400
In-Reply-To: <150803f555ade32668f31d507e151558a505cfe1.camel@rendec.net>
References: <20260927080637.27285-1-farbere@amazon.com>
			 <20260927080637.27285-9-farbere@amazon.com>
		 <c28806ad779b972c94b9dd89fb70ee64cefb63cc.camel@rendec.net>
		 <BY3PR18MB4722F4AFC8E300C4D01BE217C6962@BY3PR18MB4722.namprd18.prod.outlook.com>
	 <150803f555ade32668f31d507e151558a505cfe1.camel@rendec.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-10-10 at 16:19 -0400, Radu Rendec wrote:
> On Mon, 2026-10-05 at 11:20 +0000, Farber, Eliav wrote:
> > On Sun, 2026-10-05 at 01:25 +0000, Radu Rendec wrote:
> > > This is a common problem to all multiplexing irq drivers; not because
> > > the parent interrupt is shared but because changing the affinity of o=
ne
> > > child interrupt (by changing the parent interrupt's affinity under th=
e
> > > hood) would have the side effect of changing the affinity of all its
> > > siblings.
> > >=20
> > > I think the correct behavior is to fail with -EINVAL in this case.
> >=20
> > -EINVAL is not usable here because it restores the failure this patch
> > fixes. The consumer is arm-cmn. We have a SoC where its interrupt is
> > routed through a FIC group instead of a direct GIC SPI, and
> > drivers/perf/arm-cmn.c does
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D irq_set_affinity(irq=
, cpumask_of(cmn->cpu));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return err;
> >=20
> > at probe, so with no .irq_set_affinity callback the PMU does not probe =
at
> > all.
>=20
> All right, now I see what the problem is. I will be fully honest and
> transparent and admit I don't know much about PMU drivers in general or
> arm-cmn in particular. But I believe that irq_set_affinity() (with a
> hard fail) is there for a reason. Of course, because we are in 2026, I
> did ask a LLM what that reason could be, but I will refrain from taking
> the answer as correct/definitive or speculating; I will just say it
> probably needs careful consideration.
>=20
> The requested affinity mask includes a single CPU; by contrast, unless
> explicitly configured, the FIC parent IRQ will probably be affine to
> all available CPUs, so the cpumask_equal() in your patch will likely be
> always false. The concern is not the warning itself (you're using
> pr_warn_once); it's that the arm-cmn IRQ handler will run on a
> different CPU than it expects/has requested.
>=20
> > > If you insist on having the ability to change the child interrupts'
> > > affinity, you may want to look at this patch and do something similar=
:
> > > https://lore.kernel.org/all/20251128212055.1409093-4-rrendec@redhat.c=
om/
> >=20
> > I implemented that for al-fic and tested it on hardware. It seems to
> > work: with the parent SPI pinned to one CPU and the child's affinity se=
t
> > to another, the child dispatch is accounted on the target CPU, one
> > dispatch per parent interrupt, no re-fire storm.
> >=20
> > What stops me from just sending it is that it changes the interrupt pat=
h
> > for every child of every FIC instance, not only for a child that asks f=
or
> > affinity. .irq_pre_redirect is called before the affinity check, so it
> > runs on every dispatch. The ack therefore has to leave the flow handler
> > and be done in the parent context always, and .irq_ack has to become a
> > noop so it is not done twice. A level configured group has to be masked
> > in .irq_pre_redirect as well, because the FIC re-asserts the cause bit
> > while the source is still asserted, so for those groups the mask moves
> > into the parent context too. Today all of this happens inside
> > handle_level_irq() and handle_edge_irq(), under desc->lock.
>=20
> The dw_pci driver is not the best example=C2=A0because it uses a stacked
> layout with the multiplexing irqchip at the bottom and a hierarchy
> irqchip on top (which is why the .irq_pre_redirect was necessary).
> Unfortunately it's the only example I am aware of (and also what
> prompted the redirect framework implementation). I apologize for the
> confusion it may have created.
>=20
> I think in the case of al-fic, it's sufficient to set
> irq_chip_redirect_set_affinity as the .irq_set_affinity handler and
> replace generic_handle_domain_irq with generic_handle_demux_domain_irq.
> That will not change the ack/mask path.

Sorry! Scratch that. Human hallucination :)

Yes, your interpretation is correct. The ack and mask need to move to
.irq_pre_redirect because they must happen in hardware interrupt
context; if the demultiplexed interrupt is redirected, its flow handler
(handle_level_irq() or handle_edge_irq()) runs asynchronously in
irq_work context, so ack/mask can't happen there.

But note that even though the call path changes for any interrupt, the
handler is still called synchronously (at the end of=20
generic_handle_demux_domain_irq()) if the affinity hasn't been changed
and redirection is not necessary. So there is no overhead in that case.

I think all this would be less horrible for a driver that wants to
implement redirection if we changed changed handle_level_irq() and
handle_edge_irq() to skip the ack/mask for irqchips that implement
redirection (e.g. based on an irqchip flag), and provided a default
implementation of .irq_pre_redirect that called the ack/mask handlers
instead. That way, all an irqchip driver would have to do to implement
redirection would be:
 * set the flag that skips ack/mask in the flow handlers;
 * set .irq_set_affinity =3D irq_chip_redirect_set_affinity;
 * set .irq_pre_redirect =3D default_implementation_to_be_added.

I'll try to draft something along those lines next week and send an RFC
patch. We'll see what Thomas thinks :)

By the way, did you mention the FIC chips could be stacked or am I
imagining things again? That could be an extra wrinkle in the context
of redirection.

> > Do you still consider that justified for this driver, given that the on=
ly
> > caller needing anything here is one that just needs the call not to fai=
l?
>=20
> As I explained above, I really doubt that arm-cmn just needs the call
> not to fail. I am inclined to think that it actually *needs* the IRQ to
> run on the CPU it wants, hence the hard fail.
