Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4E84756D3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005362; cv=none; b=mWdCekN4suxjqvB1Qg28WFR0GqQFXkZfWJoMF5hkJzZDbLbu5pvYtBVqm+yJAkZLXkV9Bzhm2YnLrPlTrNHLPfQRHJlxVwNB9MhMXP+l9vX6p+y/9wLYweA1y4mmVEOkJG+8xRgMG9pOqP+hZdzuIDvs3PsdcqthYEq/nAVswLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005362; c=relaxed/simple;
	bh=I9I4EOND5TtH3mV4xT5cLVd8uGjJE3khrYWrEH2r6NU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XWl6mdx6/7u2yLSa4l91zN6Fa6SlGEmPlF55qnO7vcD5VrcaJV8EZ5W7mNCAMmjgv0OxblCW46H8iU8Gt5HMbKk2wyJVOW1j3uud/aI81rLtHCJLkrO44ytvATvKkK85w7TAa4VwC7e+0U0spsBBfr452VHhLEJhqaDHjekHORc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=nVlqyriL; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="nVlqyriL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=A+QLA+MTonc5guRorxistBoawFVrCJ1ubobT4AQZVfE=;
  b=nVlqyriLrRrXhEEmgXSKus1COP9jqN+AelU6dy1XQNGTUXjwA181XFUd
   stvIjHzv+dxAHFxLemLJZVOlvKKKH9xqTtex4hlxg9wIDOs9micsWHLq6
   BpjY64848gNKJOfpx98UEZWkbkD3iPWSXvGifMrw+Pxmkv86wmjJL/wMc
   0=;
X-CSE-ConnectionGUID: Bx2F/LenQvK9F6HxKL4HEA==
X-CSE-MsgGUID: gsnCk0vwQcCZp9jkAPNHVg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,158,1787004000"; 
   d="scan'208";a="300237533"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 21:15:55 +0200
Date: Wed, 14 Oct 2026 15:15:54 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Jeremy Dean Clifton <gservice341@gmail.com>
cc: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>, 
    Alex Elder <elder@ieee.org>, johan@kernel.org, gregkh@linuxfoundation.org, 
    vireshk@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error
 messages
In-Reply-To: <6d881c38-33f7-48e0-88d0-4d16170c24e6@gmail.com>
Message-ID: <b37cb31e-a9e9-7248-27a-fcb31c5f6e65@inria.fr>
References: <20261013022402.6322-1-pavankumaryalagada@gmail.com> <2fd23f9b-7eab-4afd-aa77-93a5b9ff0c75@ieee.org> <as6mC7sZnpqIKxN6@user> <6d881c38-33f7-48e0-88d0-4d16170c24e6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 14 Oct 2026, Jeremy Dean Clifton wrote:

> On 10/13/26 3:43 PM, Yalagada Pavan Kumar wrote:
> > On Tue, Oct 13, 2026 at 03:11:51PM -0500, Alex Elder wrote:
> > > On 10/12/26 9:24 PM, pavankumaryalagada@gmail.com wrote:
> > > > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > > >
> > > > Use %pe to print error pointers directly and display their
> > > > error names.
> > > >
> > > > Keep the other PTR_ERR() call because its return value is
> > > > needed for ret.
> > > >
> > > > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > >
> > >
> > > Generally I think what you're doing is OK.  It looks
> > > like %pe is better than just %d, because it prints
> > > the error *name* for the pointer-coded error.
> > >
> > > But I have two general questions about this effort:
> > >
> > > - There are other places in the Greybus code (even in
> > >    just the staging source files) where this exact same
> > >    thing could be done.  Why limit this to "fw-core.c" only?
> >
> > I initially limited the change to "fw-core.c" because I was
> > focusing on the error messages in that file.
> >
> > >
> > > - Do you think that all Greybus error messages should be
> > >    converted to use %pe (passing ERR_PTR() if necessary)
> > >    instead of %d for showing the error number?
> >
> > Using %pe prints the error name instead of just the
> > error number, which makes the error messages easier
> > to understand.
> >
> > For example, the current message is:
> >
> > 	failed to create download connection (-12)
> >
> > with %pe, it becomes:
> >
> > 	failed to create download connection (-ENOMEM)
> >
> > I think the second message is easier to understand because
> > it shows the error name instead of just error number.
> >
> > I also found other PTR_ERR() calls in Greybus. some of them
> > are used to return error codes and should remain unchanged.
> >
> > For example, in fw-core.c:
> >
> > 	if (IS_ERR(connection)) {
> > 		ret = PTR_ERR(connection);
> > 		dev_err(&bundle->dev,
> > 			"failed to create management connection (%pe)\n",
> > 			connection);
> > 		goto err_destroy_connections;
> > 	}
> >
> > Here, PTR_ERR(connection) is needed to store the error code in ret
> > for the error-handling path, while passing connection to %pe makes
> > the error message more readable.
> >
> > >
> > > I think your suggested change is a net positive, but
> > > doing it in some spots but not others means it is
> > > adding a bit of inconsistency.
> >
> > I agree that similar cases elsewhere in Greybus are worth
> > checking to keep error reporting consistent. I will look
> > at the other Greybus files for cases where using %pe would
> > be appropriate.
> >
> > Would you prefer me to extend this change to the other
> > relevant Greybus files, or keep this patch focused on
> > fw-core.c and submit a separate patch for the remaining
> > changes?
> Also, you could coordinate something with Julia to use Coccinelle for this.
> Using regular expressions, you could programmatically find all the places
> where %pe and connection can be in place of %d or %ld and the return from
> PTR_ERR().

Coccinelle could probably be used for finding opportunities.  Modifying
strings can be a bit awkward, but is not impossible.

julia

>
> Jeremy Clifton
>
>
