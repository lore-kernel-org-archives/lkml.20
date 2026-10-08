Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D584B1F2B8D;
	Thu,  8 Oct 2026 01:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791422052; cv=none; b=Ug3iluXO5xBfqboO/Q4xtpDZV3DEK3AKVsT6xw3gecH4XLW2UsTW1NXe3gzVCY9V7Dnwe0m77oh2KAL3cMSPXl8VcRH/XxYDex7/LQMiH2mjJtIwnCE5YZscsQ9ROszLeqZVmj38YxuVnRZEmkZK8rJh0FijOv4T4eB6Zm2Lt3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791422052; c=relaxed/simple;
	bh=rvA3JmXv2+EGWfRFYGAx7sMWNUPsOE97KfqoDz9Vjzs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WXu7/6PyJLQfGxKhm6TS/485h38IqFYx3meOXl7EPXD9drC7+US6HzaYlAMvtMy5giuW2KrtBoWvD9kU6jKnJm942stmoSGpBvaHScvbFWC8Ejulv2Du0znOuCzcTeqqpmESPEbNHLeaAm+fKGTmwTYgva5vuRxmi1t8zA11gRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=pW5I/NrH; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="pW5I/NrH"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id B76A4D19E9;
	Thu,  8 Oct 2026 04:14:07 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro B76A4D19E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791422049;
	bh=rvA3JmXv2+EGWfRFYGAx7sMWNUPsOE97KfqoDz9Vjzs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pW5I/NrHxJYVoBw/OigD96r0UeTLx2X5WlwLd5fmguag08CmV6s9lAfQtU+UA2oSf
	 zWtAiZ78NgDKcfwYcIW71nfEfBSc/l4LIz6UD0T5RMFyJzHqo6rM1SQRqXwa0/VA0p
	 9eZfaH1J/OnGwGvvArX2rtC6ZFHtTMpSkhVV9lXCb9/6koRZWMg6OzJvzofcp18F9X
	 qCNJms6R1vmxbDXey1j+ujWxJG8jnLMyuDztSGIxNA9TPSHuaTNPvriDXT9xAHy5U/
	 zKqRxz6Go/Gr7OA0ZW79BkI5XHmOVcG4nyBm+rP3J0gsn5obDqDVcYP5AqRRiqosyT
	 uCNVjxO5tVdBg==
Message-ID: <bc9249ba60ee202b995aeccc5b8db35e9eece0cc.camel@rendec.net>
Subject: Re: [PATCH v2 3/8] irqchip/al-fic: keep the device_node instead of
 a cached name string
From: Radu Rendec <radu@rendec.net>
To: "Farber, Eliav" <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
  "Shenhar, Talel"	 <talel@amazon.com>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  "devicetree@vger.kernel.org"	
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>
Date: Wed, 07 Oct 2026 21:14:06 -0400
In-Reply-To: <BY3PR18MB47221B1A895DF607B6480576C6962@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260927080637.27285-1-farbere@amazon.com>
		 <20260927080637.27285-4-farbere@amazon.com>
	 <9f281f3c922c1b64a7a74a91e178990c798840e7.camel@rendec.net>
	 <BY3PR18MB47221B1A895DF607B6480576C6962@BY3PR18MB4722.namprd18.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-10-05 at 11:17 +0000, Farber, Eliav wrote:
> On Sun, 2026-10-04 at 17:40 +0000, Radu Rendec wrote:
> > On Sun, 2026-09-27 at 08:06 +0000, Eliav Farber wrote:
> > > struct al_fic cached a "const char *name" that al_fic_wire_init() rec=
eived
> > > as a separate argument and set from node->name. That string was never=
 owned
> > > by the driver: it aliased storage inside the device_node and stayed v=
alid
> > > only as long as the node did, yet nothing in the struct held the node=
 to
> > > express that dependency. Keep the device_node in the struct instead: =
it
> > > holds the owning object rather than a bare pointer into it, lets each=
 site
> > > derive the name on demand, and gives the driver the node it needs in =
the
> > > next change, which requests the parent interrupt by the node's full_n=
ame.
> >=20
> > That makes sense. But keeping a pointer to the whole structure instead
> > of aliasing a pointer inside the structure makes no additional
> > guarantees w.r.t. the lifetime of that structure, it just makes the
> > intention more obvious.
> >=20
> > What prevents the "struct device_node" from going away after the init
> > function returns? It cannot go away before it returns because the init
> > function is called as desc->irq_init_cb() from of_irq_init(), while
> > holding a reference to the node. I *think* the assumption that it can
> > never go away (even after the init function returns) is correct because
> > the code in of_irq_init() seems to deliberately "leak" a reference to
> > the node. But this is not documented anywhere. So perhaps it's worth
> > calling it out at least in the commit message.
> >=20
> > Rob, you're a maintainer for drivers/of/irq.c and it looks like you
> > merged most (or all?) of the recent patches to it. Perhaps you can help
> > us and explain how this is supposed to work?
>=20
> You read it right. of_irq_init() takes a reference with of_node_get()
> before calling the init callback, and on a successful init that
> reference is never put - the of_intc_desc is freed but desc->dev is left
> pinned. On a failed init it is put. So the node is kept alive for the
> life of the system once probe succeeds, same as you described.
>=20
> I've added that to the commit message, and made clear this patch is not
> closing a lifetime bug - node->name was never actually at risk of
> dangling, since the storage it points into is pinned the same way. The
> value of keeping the device_node is making that dependency explicit
> rather than fixing something broken.

Thanks! I think it's very clearly explained now.

> I'll leave the question of whether this ought to be documented in
> of_irq_init() itself to Rob.

Of course. After giving it more thought, I'm quite confident it's the
intended behavior. There were some patches to of_irq_init() that fixed
some reference leaks on the error paths. If keeping the reference on
the successful path hadn't been the intended behavior, it would've been
called out when those patches were reviewed.

> > > irq_alloc_domain_generic_chips() keeps the pointer it is given, so it=
 now
> > > uses node->full_name.
> >=20
> > nit: should this use of_node_full_name() instead? Not that fic->node
> > can be null, but if there is an accessor, why not use it?
>=20
> Done, here and in patch 4's request_irq() call.
>=20
> Both changes are in v3, which I will post shortly.
>=20
> Thanks,
> Eliav
