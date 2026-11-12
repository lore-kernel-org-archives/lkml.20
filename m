Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449648;
	b=eeIMfOBQlH/pV2FTwUUBCJu01TjiZq0n0r704YdSjV6OdHYdJ5Et3j79ujzQ5iOgpmJ/
	 W/sM9WbQxZVLW5JMqGGFlSWZowQfyxLNjc//6oHkdlwf2i7fiUxK3uXKlj2vni4HFZbCm
	 1WmQIWhN1b9Ypk/9PHWM0Q9R9KbvS92RzIWB0J5Vc9uk+kPFKvwZFEmF489SG9QPZDV7W
	 /1ly5bU91ZdxbqM5MaOdyzpQjUlu93S7Gaj+INpzgVB6xX5pF6l3l2/vRBIcEWL7x9ZWW
	 g+r5U1RrPH2IinXf2hJKggmW1vtp2PUYFQVigXj2ZRuIigFyvhRHrbVU7KerjzfWlmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449648;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=7DCnhPMhPOIF6svXs06gCjoxoFnmXhoJWXAzQrckpic=;
	b=0glCC4qODeWYD9I4h7R05BirZl/4+VaSHnOsWq7do5Qfk8mBURXRnV7+iW9pc1ATBmxX
	 aBHcbXqBHSaVq1esxfUiagM4MfUQEaXOcgDcdJ4jXC4x1QIk/vOEpfdWb1HEOLzOTmsWv
	 BUA2CqbcEV83pjx4LNuolYKELCDht+gr3hFQthSj8pgyOVxaL+8m6W+7cKjb441pg02Ra
	 xUtdNcdM3sIyLz91BRpBD35NCLdhlvLaFRVABn0WRVsrmPQdpwn+a6xar1qwnflafQ0UT
	 1DgSjtksBPvr+wT1nprZlr8PUZ3SBy0KwtXotei0OVH7znX+eUvoVBZh8qLwW7skPRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=PUswFAGe;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=BVIeVKm6;
	arc=none smtp.remote-ip=188.121.53.167
Received: from sxplsmtpa04-16.prod.sxb1.secureserver.net (sxplsmtpa04-16.prod.sxb1.secureserver.net [188.121.53.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098BD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 098BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=PUswFAGe;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=BVIeVKm6
Received: from ravalox ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id RKJwx3CSu2ExXRKJzx9XFb; Thu, 12 Nov 2026 02:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794449633;
	bh=7DCnhPMhPOIF6svXs06gCjoxoFnmXhoJWXAzQrckpic=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PUswFAGeq++nCBHAtwOowVIKlhfsSoj2t63BIBuqkPSP+PheWANJfWxeDESTLa2gK
	 KCMRR73VmNsF7lxJhY4fD33RKpwF18yfbVLcWfAhCqarMBzCqcbcwNRQ0pOd6uKowA
	 WPFCt/qlRlVpyV1AhvrVauY9X494bIalwj8oz4gASmKzWUbXFqxJueQslEogsaSFH0
	 BRKETT4buV5OArKgka1m6xOWMv5aKzwoUuSdbE3ORWR8lzh25t2wc9/M0aPzEobMhP
	 GEysmJlVSH8gJHpFjuyI1xlDgMKZNvRgGSUegt2mbmixrWT/uQF/jYIco58YJjvRKN
	 b5cdwVQK+TR5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794449633;
	bh=7DCnhPMhPOIF6svXs06gCjoxoFnmXhoJWXAzQrckpic=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BVIeVKm6jWndtWykxaV9bSIimvBPE0vpyvJ/+Ez/JtMs2rNGMn2e4FjJPe/KPCo9y
	 FEHeMersGiY/PLnp/jQZETq3NuRtP+fGVuzVIUsgLgSZX6/2cKnTn3NqMVBaJI8eWu
	 BFI4Eto5q57p/PnlvwE28o5Yvb9V6pFqHHwzS8IcCXLrHrcduW3oTBBR5zKrmL1bB7
	 1Mghop+DWIldPUYhGw8u0Zrk5fvhhQnV+fjIBr4S2SqxtiuWJaMkOr8E1coJCJgcY/
	 HnIrruyTmyQJIbszR7nonwhDR69P70Jt6yZyNQ6we6OTlMJ+npgWlS/izv2xQ/shBy
	 q3Llz7ByA2unA==
X-CMAE-Analysis: v=2.4 cv=A5b5rKWG c=1 sm=1 tr=0 ts=6af520e1
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=kj9zAlcOel0A:10 a=IJv9LcIfAAAA:8 a=FXvPX3liAAAA:8 a=uBD6eunphCpAWh5GeVUA:9
 a=CjuIK1q_8ugA:10 a=cmr4hm9N53k6aw-X_--Q:22 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 786f214390aa7bc1439cdcbccf6a9629:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Date: Thu, 12 Nov 2026 02:13:48 +0000
From: Phillip Lougher <phillip@squashfs.org.uk>
To: Joe Perches <joe@perches.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/18] Squashfs: convert SQUASHFS_FRAGMENT_* to inline
 functions
Message-Id: <20261112021348.d1f1eab31819c1c2c68b3a15@squashfs.org.uk>
In-Reply-To: <657676fd307b604b70f262251718aea9@perches.com>
References: <20261107052843.725239-1-phillip@squashfs.org.uk>
	<20261107052843.725239-4-phillip@squashfs.org.uk>
	<32fd1f6ad824796b525ffaa3ebdd8d2610858bf3.camel@perches.com>
	<20261111235940.c9bdd0f2b5faee753f9496ea@squashfs.org.uk>
	<657676fd307b604b70f262251718aea9@perches.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGtlnebS1dctRwNbU1eyXYye97bWGwQqNipcUQiD9HRhKZZbQtjbp+dm7jU+hEqKsc777/nk9nniCVFwJ5H4OfpDVCiKLwGWpP4768Bw6uoLc67VhhUM
 BrYv5d603JpJQpt1LlL5CFAuMMMsu5zKYInE5A7Gk6V3n8fCOINu6vgZGIUFPExf6WXGJsc7DkbqR9CiLXzgesTboT78njmqnyiFi48IBDDFAMkW16le+yx/
 m9DshHDtVSQYgnYZTm9ARQ==

On Wed, 11 Nov 2026 17:13:02 -0800
Joe Perches <joe@perches.com> wrote:

> On 2026-11-11 15:59, Phillip Lougher wrote:
> > On Sat, 07 Nov 2026 02:05:28 -0800
> > Joe Perches <joe@perches.com> wrote:
> > 
> >> On Sat, 2026-11-07 at 05:28 +0000, Phillip Lougher wrote:
> >> > Convert old fashioned #define macros into inline functions.  This has
> >> > the following improvements:
> >> >
> >> > 1. Inline functions are typed, which makes the width and sigedness of
> >> >    input and outputs explicit, which reduces errors.
> >> []
> >> > diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
> >> []
> >> > @@ -51,4 +51,31 @@ static inline s64 squashfs_mkinode(u32 start, u16 offset)
> >> >  {
> >> >  	return ((s64)start << 16) | offset;
> >> >  }
> >> > +
> >> > +/* fragment and fragment table defines */
> >> > +static inline s64 squashfs_fragment_bytes(u32 fragments)
> >> > +{
> >> > +	return fragments * sizeof(struct squashfs_fragment_entry);
> >> 
> >> Needs a cast to make the multiply work properly no?
> >> 
> >> 	return (s64)fragments * sizeof(struct squashfs_fragment_entry);
> > 
> > That is fixed in patch 7 (in the original patch-set). This is because
> > it was reported by an AI and so it is fixed in a separate patch with
> > an explanation of exploit and reproducer.
> 
> Should be corrected the first time instead.

Shrug, I disagree.

The purpose of that patch is to convert the helpers to inline functions,
and only that.  To do more than that is to do more than what the
commit message says, and in effect it will be adding a bug fix without
explanation or reproducer by the back-door.

Mixing code improvements and bug fixes in a single patch is always a bad
thing to do.  If things break, having done multiple things in a single
patch, you can't determine whether it is the code improvements or the
bug fix that broke things, which breaks bisectability.

Phillip

-- 
Phillip Lougher <phillip@squashfs.org.uk>
