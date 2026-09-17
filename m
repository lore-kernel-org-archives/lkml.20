Received: from calculus.sigma-star.at (calculus.sigma-star.at [188.245.196.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168FA5AA668
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.196.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658196; cv=none; b=kiiCzm5+Fc7vRBhj+iJFGlqSO4LGHdRMBZ7KoR3tKrpbSqOwxzimdHNgBJ9GVVgn3GGAVoQh585yITK+brg5h5N0O4dHOW0GPvtQaB7aenK/NXdreuafWyQWhXz+o5Jg/hU/vtlxDNqD01sJYi4D52W37Fy6jIwJDeMaBp4TmgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658196; c=relaxed/simple;
	bh=qtb0mgeKfScFxGZo1EOooQz0tDlyEIhzKLAY0pGX1z4=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=U9XDonkbJr7rLuHWuo9EFWcqRGsOLPCr9dpZEQ7XwDeacPs1GeMmBF4yugc0zbviJfmseFyI1XsXsZn8E6pgAwZwSmKWhkSDAAGw+leX/p120NHWs/FgcLz1qgF18tVOWvxtoFmITGDd4B1NCNB5T7c6Dr6YvdUcTKy1yNDGZYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b=923WAEfJ; dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b=vEe9ZUl+; arc=none smtp.client-ip=188.245.196.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b="923WAEfJ";
	dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b="vEe9ZUl+"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789658141; bh=qtb0mgeKfScFxGZo1EOooQz
	0tDlyEIhzKLAY0pGX1z4=; b=923WAEfJca86uEoGBAZ2h1JME8+/mbPuhBiilW4cmsiezLuXFn
	x6tKSBB6R7lix7pO3f5g09fyRfFQZOXTSBBA==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789658141; bh=qtb0mgeKfScFxGZo1EOooQz
	0tDlyEIhzKLAY0pGX1z4=; b=vEe9ZUl+wMx+kEFHTVYv4RQ5h1Ue0Fiy5SA2ffnxMe/OHbw3vC
	JW5jbNJO8BkyRiXO6knu9mMySAfQhUAgcSLQK6FtCxuDcNJW8YetFB0FyIo2h7s+duN6t3A/rgH
	tR6S7nGD4WXLU+qhlaLw40scm2Kt9NEmFdz/Shux+PdOFi0puOWWaOfbaR3W1hJM4yjtJKwvD3R
	IcfNn1Lo8zswf6zVMblTFfIDxRwIOvP/JXl91M7u1f86KQwnkLhuZ+3Trg3zw7j4PHZo3n6uHhH
	QRU6sECQFGsY3fen0/Zn1iy2fm2XbJhk1XJQKmFh7pANyNqcSyZKczRbzkfD/csCTjA==;
From: "Richard Weinberger" <richard@nod.at>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, 
	"Richard Weinberger (sigma star gmbh)" <rw@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, 
	<vigneshr@ti.com>
Subject: AW: [PATCH] mtd: Call get_wunit() on the master partition
Message-ID: <mu5o8zxl.c40d2780-5266-436b-a769-1014589d8df3@nod.at>
In-Reply-To: <87ik43j4fm.fsf@bootlin.com>
References: <20260917145329.380628-1-rw@kernel.org>
	<87ik43j4fm.fsf@bootlin.com>
Date: Thu, 17 Sep 2026 15:15:41 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Am Thu, Sep 17, 2026, 17:14 schrieb Miquel Raynal <miquel.raynal@bootlin.com=
>:
> On 17/09/2026 at 16:53:29 +02, "Richard Weinberger (sigma star gmbh)" <rw@=
kernel.org> wrote:
>=20
> > From: Richard Weinberger <richard@nod.at>
> >
> > The code checks whether master has get_wunit() but still calls
> > it on the child. Fix this.
>=20
> Ha :-)
>=20
> Shouldn't we add Cc: stable?

Fine by me.

Thanks,
//richard
