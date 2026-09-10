Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A5D44F57F;
	Thu, 10 Sep 2026 21:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076087; cv=none; b=tnL7fymceA4oCSWLdunKoY0T8XY54vyTyBlFBEWhRu5w4ILeRpvm6my7OBcoT/ArtWlKYKGNgYiqTk6oXk+AeeCiJMBnVWPKRaOUemoSFr6TFmaHvaErYLr362C9VVEXUP1T+oyaumBMbqY5+3t4w9HRFNUeHAxL5qAy75zeNXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076087; c=relaxed/simple;
	bh=ZGnms2TjxQoWacNdUmF0Qm+c+B3Whog03U4Pfq/FbIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGN8o4brCAI+IYgBRqmrW1aT+LUNx3LXfOBpoa/IYaCa8GTjgTtHXuxeb1WAippam9Le5tRN0kIg4CAUUCstAgGhd6/puggiZZCj3G/2FzdMQGgYrVnbVRlg4Cw8niicDGaLe+bJgGe8VNeblVPOFX982F9No5f9jDvV7Dnz/PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMnwZ3m9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMnwZ3m9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2E81F000FF;
	Thu, 10 Sep 2026 21:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789076084;
	bh=PKXkT/ObO3AiQVnD0gr+mNUkvO7QaDovBbeHZ8BprGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LMnwZ3m9+8G6xA4eJcyg1vRKBen51ojARFFWQLxA+XAWKssNS5/JGUuIA9Q3kaQ4M
	 7iDkzZTk6rPn3jQ6l0xCcb2z4KiVMYykFnFFeV/EOTCrDzyqXvNohLlz+1999VnLAy
	 /VjLfQZk9KlFP1A+f3C5he1lBEooJPUm7ZFCo83a6U97ux7nvwX/qbC7gVZKXkiVBz
	 xYJoK9fr3iuTrxVhyXoeg3MqRr2OvSuFmqthLdwvbz21VZ8ednjFGqp+VIpNHNuTCI
	 rvhouhNv0hhn6eub0AnMJabvvlOw/AftJy2U7UalOkbDpLmBgd77l94K6XpSI9z3JU
	 OxH2ys6sle/6w==
Date: Thu, 10 Sep 2026 21:34:42 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller
 driver
Message-ID: <20260910213442-GKE2346@kernel.org>
References: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
 <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>
 <my7qwtgrgph43hjxwmjm5hkeuxltlqjntnj5zdo7xqlrfrlffx@fp4mt7phdor4>
 <43ce274d284a4f94815ec25f5ca0604f.docular.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <43ce274d284a4f94815ec25f5ca0604f.docular.xu@gmail.com>

Hi Guodong, Philipp,

On 10:09 Thu 10 Sep     , Guodong Xu wrote:
> Hi Philipp,
> 
> On 2026-08-07 19:51, Guodong Xu wrote:
> > On 2026-06-03 09:34, Philipp Zabel wrote:
> > [ ... ]
> > >Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> >
> > Gentle ping. All tags on this one are collected:
> >
> > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Yixun Lan <dlan@kernel.org>
> > Acked-by: Alex Elder <elder@riscstar.com>
> >
> > Could you take it through the reset tree when convenient?
> 
> Second ping. This is a MAINTAINERS-only change and carries your
> Acked-by, plus Reviewed-by from Yixun and Acked-by from Alex.
> 
> If it is easier for you, I'd like to ask Yixun whether it could go
> through the SpacemiT SoC tree instead. Unless you object, I'd suggest
> we go that way if it has not been picked up by 2026-09-17.
> 
Sounds a good plan, let's give Philipp some time to respond, if he still
unable to proceed by that time, then I will pick it.. just want to avoid
 collision that both of us picked accidently..

-- 
Yixun Lan (dlan)
