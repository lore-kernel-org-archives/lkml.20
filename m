Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0DE2EA749;
	Sat, 10 Oct 2026 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791644601; cv=none; b=uF3EPK8+Zy7JfXjuwvb1rlAa44HdDVDcVri/oJS+PPaWXEXQlR5luzP/h/6HI9JZp4b/e77DwUqzn5+M+qr4ebJe1iOtBYQX+qsLC1VrtDcf+1SwNpoLhYgI1GAO1Dxdaou3PbJ07+E+M0iQHlehzskgsFwj++gG3dDzD1Ry84A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791644601; c=relaxed/simple;
	bh=iR14zn64rysPwXESh6dg9xmhrdje895tbO4TCKrwGbs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T7UF4MLcfrdH4S7QX4K8369A+b5yffzrEYME5iF2IcWYqeNgMyd+xeS+1+Ms13fNthBx40KDw01/oBDhoveqduoaedSBffShX+PpTJaULY/CuQNJJ7LydG7+sWUoU6TBDabqD8kRd7rlsQ1O7xm7haVAWxv8E65XQDWQ9dVSI5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=GrtDCI+g; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="GrtDCI+g"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id E8893D19E4;
	Sat, 10 Oct 2026 18:03:09 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro E8893D19E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791644591;
	bh=UbS7Kdi94gS4s+B/t67W2xIrAQZTkTP4OBN6Zzly8aM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GrtDCI+g3nYFFBMNtmWJBExxK1VOf4/Jwpkih0zvV6TcLBcC/Y1BSMdGfiWwxIKrJ
	 ow0moHN/JoWvhVFmVEnCIA0uQAvAQQj8bFqbNUbVX54Rn2B3JXLHOZVhvv7zvI6F+l
	 OIV1SVKDizp3cgfFJpKUEbFjxA7VKLIRB5zHI7qygzPpKiOJW+9XWOVSPCE9OGhHJJ
	 7tqQLQGJ9nmoetBAFy2Chghy57ORTTJqkuvUf92oDbZULp2XZXMBYi5VBHgKXqtQYS
	 PFAOjwbq/gh+111PeTyKiBjLqI2NwDQs84A/9bbyx8VJnA3DJbKosj6eAG47oirV9Q
	 XUxLBcA//B9AA==
Message-ID: <4c8807594fff7f44dab85b96acb266101c03f164.camel@rendec.net>
Subject: Re: [PATCH] of/irq: Document of_irq_init() device node refcount
 contract
From: Radu Rendec <radu@rendec.net>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev, conor+dt@kernel.org
Date: Sat, 10 Oct 2026 11:03:07 -0400
In-Reply-To: <sashiko-outbox-164696@kernel.org>
References: <20261009011324.1503697-1-radu@rendec.net>
	 <sashiko-outbox-164696@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-10-09 at 01:19 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] of/irq: false API contract documentation encourages use-after-=
free
> --
>=20
> commit 553b68f6aa4fe4b4ead9f98bb63dfba3cbd9c9a9
> Author: Radu Rendec <radu@rendec.net>
>=20
> of/irq: Document of_irq_init() device node refcount contract
>=20
> This commit adds documentation to of_irq_init() claiming that the device
> node refcount is intentionally never dropped upon successful initializati=
on.
>=20
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index ef1ed9743907b..bf277781cdb6c 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -647,6 +647,15 @@ struct of_intc_desc {
> > =C2=A0 *
> > =C2=A0 * This function scans the device tree for matching interrupt con=
troller nodes,
> > =C2=A0 * and calls their initialization functions in order with parents=
 first.
> > + *
> > + * The initialization functions are called while holding a refcount on=
 the
> > + * device node corresponding to the device that is being initialized (=
passed
> > + * as the first parameter). If an initialization function is successfu=
l, the
> > + * device node refcount is *not* dropped (ever); this is intentional a=
nd
> > + * guarantees that the pointer passed to the initialization function i=
s valid
> > + * not only while the function runs, but also for the rest of the kern=
el
> > + * lifetime (i.e. it is safe for a driver to store the device node poi=
nter
> > + * and use it *after* the initialization function returns).
> > =C2=A0 */
> > =C2=A0void __init of_irq_init(const struct of_device_id *matches)
> > =C2=A0{
>=20
> [Severity: Medium]
> Does this documentation accurately reflect the code's behavior?
>=20
> Looking at the end of of_irq_init() in drivers/of/irq.c, there is a clean=
up
> loop that explicitly drops the device node refcounts for successfully
> initialized controllers remaining in the parent list:
>=20
> 	list_for_each_entry_safe(desc, temp_desc, &intc_parent_list, list) {
> 		list_del(&desc->list);
> 		of_node_put(desc->interrupt_parent);
> 		of_node_put(desc->dev);
> 		kfree(desc);
> 	}
>=20
> Any successfully initialized leaf interrupt controller, and any sibling
> controllers remaining in intc_parent_list when intc_desc_list becomes emp=
ty,
> will have their references dropped by this final drain loop.

This is correct. At the time when I sent the patch, commit 30724547b221
("of/irq: Fix remaining refcount leaks in of_irq_init()") hadn't been
merged yet (or it had very recently and I hadn't picked it up yet).

Sorry for the noise!

By the way, I manually re-added the email addresses I had used on the
initial email. It looks like sashiko replies to a fixed list of
addresses.

> The documentation appears to mistake a pre-existing memory leak (where pa=
rent
> controllers popped during the while loop leak their references) for an
> intentional, universal API contract, while ignoring this final drain loop=
 that
> cleans up the remaining nodes.
>=20
> If driver authors rely on this newly documented contract, they might assu=
me
> they do not need to take their own reference on the device node. Could th=
is
> lead to a use-after-free when the final loop drops the reference?

