Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04093BED66
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005283; cv=none; b=DJ3OQ9gi4+nP6hVZJeiYPMcR9px+NAXXXIpD0FpdupjzcfZhjPcUBCaZC0uid3ML2COQzYvaR+VcIjAYjo8LwYsKNyxTm90FyMfcZnqdJmL+KknA8ERFrnkBL6ZBogzFyt+WH4P4W71Cz9U6W+80rdLOcOlTaO7c7YiesWenzoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005283; c=relaxed/simple;
	bh=22cMGJmu+olcIQAvru8FYwcvx83drLwu6zBAFWRXOkk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gnxofMDbFrdSrgDcvvVuzLGRzVo2oGaxAF0ICQrz8byaIeYFrwptXKmeXvDhHYPOY0Qrdss8UG1zkUT64mu/rw+cUY7eQa155DAF5wv9CaEjqfwTlias9VEDD/ntQztVI0KVWYUnku4ZZtUNnpuY0Thil5pN38KhGvjr6gtEAno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=gVctyC/2; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="gVctyC/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2XFcb73BfOgY5BAeGxtj9itl8uTCT7Sg++CRrNSV6LE=;
  b=gVctyC/2uAJQkGMJPlCsjd4V6ly49hws3QVqcT3FfdjK2s6qOf0/KMAT
   jOF4/pqtXKEOqdflDZ0rjFnkU4G+QlQoXuXaehSWhGrfXBXxdamo/RBpN
   TZvhkgBPcDO72bl4OEv0u5UpKw6dJRQ2sEayw3tE9oCM2ddxprgo5EagD
   8=;
X-CSE-ConnectionGUID: 9oiZ0uKsRHOy1l7giRFkdw==
X-CSE-MsgGUID: RzJDcJiZQlWUqUv73eSuhQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,158,1787004000"; 
   d="scan'208";a="300237447"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 21:14:37 +0200
Date: Wed, 14 Oct 2026 15:14:36 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
cc: Alex Elder <elder@ieee.org>, johan@kernel.org, gregkh@linuxfoundation.org, 
    vireshk@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    outreachy@lists.linux.dev, gservice341@gmail.com
Subject: Re: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error
 messages
In-Reply-To: <as-wgGhJAGgYBZ7-@user>
Message-ID: <9f3e98b4-8c11-62bb-49e0-99873c6fea8@inria.fr>
References: <20261013022402.6322-1-pavankumaryalagada@gmail.com> <2fd23f9b-7eab-4afd-aa77-93a5b9ff0c75@ieee.org> <as6mC7sZnpqIKxN6@user> <26a2a4af-5d27-4bd5-b284-3758fa7a67b2@ieee.org> <as-wgGhJAGgYBZ7-@user>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 14 Oct 2026, Yalagada Pavan Kumar wrote:

> On Wed, Oct 14, 2026 at 08:32:54AM -0500, Alex Elder wrote:
> > On 10/13/26 4:43 PM, Yalagada Pavan Kumar wrote:
> > > > I think your suggested change is a net positive, but
> > > > doing it in some spots but not others means it is
> > > > adding a bit of inconsistency.
> > > I agree that similar cases elsewhere in Greybus are worth
> > > checking to keep error reporting consistent. I will look
> > > at the other Greybus files for cases where using %pe would
> > > be appropriate.
> > >
> > > Would you prefer me to extend this change to the other
> > > relevant Greybus files, or keep this patch focused on
> > > fw-core.c and submit a separate patch for the remaining
> > > changes?
> >
> > I guess I mainly wanted to understand your intent.  I don't
> > really mind your proposed change, but I would really prefer
> > to have it be part of an overall plan to upgrade all error
> > messages this way.
>
> I checked all Greybus source files to identify other places where
> %pe could be used.
>
> >
> > Ideally error (and other) messages are done consistently,
> > and so changing them in just one file sort of raises a flag
> > for me.
>
> I agree that keeping error messages consistent across Greybus.
>
> >
> > Can you survey the messages elsewhere in the Greybus code
> > and get a sense of how much work it will be to do this
> > comprehensively?  Your current patch affects four spots in
> > one source file; how many others would there be?
>
> I found 12 additional cases in arche-apb-ctrl.c and arche-platform.c
> where using %pe would be appropriate. I also found one additional
> case in uart.c:954 where the error message could be improved by
> printing the error name.
>
> I will keep PTR_ERR() calls that are needed to return error codes
> unchanged.
>
> >
> > And if updating everything is a task you're willing to do,
> > then I think I would prefer you extend this change.
>
> I am willing to make these additional changes. Since my original patch
> is already in staging-next, should i send a v3 of the existing patch
> or submit a new patch covering all the relevant cases?

v3

julia

>
> Thanks for your guidance.
>
> Pavan
>
> >
> > 					-Alex
>
>
