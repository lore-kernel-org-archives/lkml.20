Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01DA468C07;
	Fri, 11 Sep 2026 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116143; cv=none; b=pfrhIKXBALr4507Iwi2wZzDnVO0ItB36ZI/m4doDVUkWCgz1JUbLrPU4wn+xsC6pDanHz9xx8yDhbSZPoaKgC2vbJV5W5AnGhn5vh1n18DpRWJ0hiPGpvjv4UMeXIX/MSaFAI5jj9aYaJhoF2jH1CeNSFs5xcKS5elD4cVIrz+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116143; c=relaxed/simple;
	bh=6oKoYiK2l5nU9+CxDm9C2X1pUBXuiUuZI1otIiFIDq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2/U+elWMcv6B8PZIzyf9hLw1G3J0yt0uTektCwlBR3FY3KUreNIBuI0RNmINdLpxAtdwyAJZGQXfitPwcm5RclchUgDIWpC3aQqQLY78n67H0bXqbxzBZ+jcspYc16Hpg7t42kYZjdxk1fanhvMT2CgT2Z+aA1MR4ZfTPXh0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=pjG5Or/q; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="pjG5Or/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789116131; bh=6oKoYiK2l5nU9+CxDm9C2X1pUBXuiUuZI1otIiFIDq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjG5Or/qivetzcJqm2XKkZNhxY3I2rf5JPxSmbWrjehTNblKouybUAXedJu1QnhhY
	 6OLGQ5iVshwJCvsGEiGohG0NuU4X+p0rCASSJ+jDzdYgLE+HoNeXHw52dZlaqEwx4M
	 87aTKc+DMEhRKnS07vHDxK4ZTuGrRnNtI4IlMyqnX0R89q2aTOstZqHRBQbwx7ULk8
	 /Kkn+dKFmpozQiVmWgRm8/o1RHyXMPQTov28Ldv9vCDwYq/ZJIyKcftc918ozyCR3w
	 d93e6D7vk1wXro4PtR9hGu8kzOr09157kUMoxuANPQqDExv/64VKbJN39RotrAZwhS
	 Z+fj6CjkqL8mQ==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 9F3F041444; Fri, 11 Sep 2026 09:42:11 +0100 (BST)
Date: Fri, 11 Sep 2026 09:42:11 +0100
From: Sean Young <sean@mess.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/19] media: rc: Use binary search for adding or
 updating a scancode
Message-ID: <aqO-4_Fm_vx8-6Rh@extorris.mess.org>
References: <cover.1788882189.git.sean@mess.org>
 <afefeadfb3f69f8a77294f0194db4ec7f428d0f0.1788882189.git.sean@mess.org>
 <28ee58c0-f33d-42ea-bb9e-ad32734a8df1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28ee58c0-f33d-42ea-bb9e-ad32734a8df1@kernel.org>

On Fri, Sep 11, 2026 at 10:10:52AM +0200, Hans Verkuil wrote:
> On 08/09/2026 17:51, Sean Young wrote:
> > We can have up to 1024 scancodes entries which are always sorted, so make
> > this a little faster.
> > 
> > Signed-off-by: Sean Young <sean@mess.org>
> > ---
> >  drivers/media/rc/rc-main.c | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> > index 924b13fff753..795ac0fe4858 100644
> > --- a/drivers/media/rc/rc-main.c
> > +++ b/drivers/media/rc/rc-main.c
> > @@ -391,7 +391,7 @@ static unsigned int ir_establish_scancode(struct rc_dev *dev,
> >  					  struct rc_map *rc_map,
> >  					  u64 scancode, bool resize)
> >  {
> > -	unsigned int i;
> > +	unsigned int i, lo, hi;
> >  
> >  	lockdep_assert_held(&rc_map->lock);
> >  
> > @@ -406,15 +406,21 @@ static unsigned int ir_establish_scancode(struct rc_dev *dev,
> >  	if (dev->scancode_mask)
> >  		scancode &= dev->scancode_mask;
> >  
> > -	/* First check if we already have a mapping for this ir command */
> > -	for (i = 0; i < rc_map->len; i++) {
> > +	/*
> > +	 * Binary search for an existing mapping for this ir command.
> > +	 */
> > +	lo = 0;
> > +	hi = rc_map->len;
> > +	while (lo < hi) {
> > +		i = lo + (hi - lo) / 2;
> >  		if (rc_map->scan[i].scancode == scancode)
> >  			return i;
> > -
> > -		/* Keytable is sorted from lowest to highest scancode */
> > -		if (rc_map->scan[i].scancode >= scancode)
> > -			break;
> > +		if (rc_map->scan[i].scancode < scancode)
> > +			lo = i + 1;
> > +		else
> > +			hi = i;
> >  	}
> > +	i = lo;
> 
> Can you use bsearch() for this? (lib/bsearch.c)

We want to insert an entry if it does not already exist. bsearch()
does not give us an index if there is no match.

Arguably this should be an extension of lib/bsearch.c but I'm not
clear what form that would take.

Thanks,

Sean
