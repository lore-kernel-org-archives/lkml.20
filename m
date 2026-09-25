Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ED84E80D9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368793; cv=none; b=qsyWzL5OLOXzQzvsT2x27LEbo/+QH8DJz0XHUkFyCIu9PSXrC+0F338i49XEx9nRFju9CndrKAqoWjgbFUs+xLDJe/mzrtnAoXZz5HMak4BTyo+9fPNJWecAaSCThyQ8OlXpP1BT4ZxMDDOP2cxnAO3s1X52NpKiYIT+w6HsSiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368793; c=relaxed/simple;
	bh=hOeNgvkY9Glj2bsp/dfCWNWGz5/LIwWywT/Yke2oiqU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=I4sgr62PISnwwJGmQvUEt4H6QaBzPzplr1iAHVb52YnQrGqEfSF4K/pKX2NpUCdIib+o/8aZ22/rFgrqGV3UTa3yGvWn/00HJE6W1YJnLyTA6IRfDFSdoWgOprwHxrX6i7Ly+VEiuX4vRwqbyz42Yjm3+MaNbpWffAYXHACd6Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CVtNweDi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CVtNweDi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28E61F00893;
	Fri, 25 Sep 2026 20:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790368792;
	bh=5Gb5X3clV5atptDzkAwvLI4CZL/0ZOW5/9a5sAqhUCM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CVtNweDiulw2Vndzy7khDg/Hoje5x9/wvtftk2kBt3HBx4hRIAhntrs1Aj4IU13Ch
	 opTyLm66iswBxgdzKrU2W1Jd2trPXvyP5jgR8FMvtsaTa72tvTmQAES5oXHB9vdPwd
	 gJhZHsdHxPmpjMr3QRndx/IBJdqogcIssaCcUxhg=
Date: Fri, 25 Sep 2026 13:39:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yury Norov <ynorov@nvidia.com>
Cc: shashank <jain.sm@gmail.com>, Yury Norov <yury.norov@gmail.com>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] bitmap: fix three parsing bugs in bitmap_parse()
 and bitmap_parselist()
Message-Id: <20260925133951.a80670af112718d9b9c271fd@linux-foundation.org>
In-Reply-To: <arapwjg4cp25e3br@yury>
References: <20260925102307.49513-1-jain.sm@gmail.com>
	<arapwjg4cp25e3br@yury>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Sep 2026 13:05:06 -0400 Yury Norov <ynorov@nvidia.com> wrote:

> On Fri, Sep 25, 2026 at 03:53:01PM +0530, shashank wrote:
> > This series fixes three cases where the bitmap string parsers accept
> > input they are documented to reject, or produce a different mask than
> > the one requested.  Each fix is followed by a patch adding the failing
> > cases to lib/test_bitmap.c.
> > 
> >  1-2: bitmap_parse() treats a non-hex character directly before a chunk
> >       of exactly eight hex digits as a separator, so "x12345678" and
> >       "0x0000000f" are accepted while "0xf" is rejected.  This is a
> >       regression from the bitmap_parse() rework; the old __bitmap_parse()
> >       rejected all of them.
> > 
> >  3-4: bitmap_parselist() does not check for the end of the region after
> >       the group size of a "range:used/group" region, so since N and
> >       all became valid region starts, "0-7:1/2N" or "0-7:1/2all" are
> >       silently parsed as two regions.
> > 
> >  5-6: bitmap_parselist() walks a "range:used/group" region with an
> >       unsigned int that wraps around when the group size is close to
> >       UINT_MAX, setting bits below the requested range.  This needs an
> >       absurd group size and never writes out of bounds.
> > 
> > With the series applied, test_bitmap reports "all 391544 tests passed"
> > (UML, x86_64).  The three fixes are independent and can be applied in
> > any order.
> 
> That looks reasonable, but please resend the series with your full
> real name, and also specify the version of LLM you've used to prepare
> the series. I'm uncomfortable taking anonymous commitments.

fyi, this was changed by 816d9992d9ed ("coding-assistants: simplify
attribution") - see latest Documentation/process/coding-assistants.rst.

So now everything is supposed to say only "Assisted-by: LLM".  I find
this regrettable - I'm interested in seeing what people are using.  Oh
well.
