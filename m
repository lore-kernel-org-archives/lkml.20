Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610565;
	b=GZpLWYaNJ9wx5FJES2OP3sQ36TVkCRt0+EGmLeQPxA03wDTFcmxPSeNprO877uzdSdPE
	 6Ct7FkVprD5zTdEPfaFrNNa8A+IjAOQpQZpGfPCB/oITut63vro0taXjmUNg7v1SzgpkR
	 94fxTAvc0NtCcCp4XelRGEWj9Kf2j5g/85zj+IO42RqLwFjNRLxQ4dgiBqzq5sVHpn8Jg
	 /UZzNnfn8PpaTYK6jont3mB+JMAB83IQ+G8Ic3T2CmDQVzRnFtIJLL3EvcPnuLzYpMPBg
	 gNrj4xHKKGBjQOC++V/5OHGYome8LJ0MhaoezMODVobtibQe3k4ZnA0wpfTzWneG10Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610565;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=IYFW2lTOpyKjEnXh2uR1HGY+0FKkCifbwuEO2xZ7rNE=;
	b=pnQDsyNsBx2CqRGR26bo6DoDh8DACJhkPz+jUlk+t8tPywYXzqtB6G2ukSRV2lZJWH3Z
	 RFCarnH1Cl0hHqnXA4EzA1nvVIvvSxfehJ87yN1Inc3CIrbaHt5E+CeZZTgsRo1QC/K9W
	 ibbeqkt28jDyY3LS7GYIkxJH7tFZd/gXo1OrhursI0hUkEWwqRHmwrQ00INSh6YR1S45z
	 n5B6BtN3Q47wjACEs1yTbqp2qDe6xOYhZGrLv5YJHE/qNSQUxmrVXkgfwCXsiTZWeng0x
	 qbcvsTWZBVQxXGpRBTdhi0aHHX5mQQWG86FGl46wzhIwzV3N/8HiuTzM1Qg56QgdIJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=FPh82kbK;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F148606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F148606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=FPh82kbK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IYFW2lTOpyKjEnXh2uR1HGY+0FKkCifbwuEO2xZ7rNE=;
  b=FPh82kbKRC2x5AkT1pgqQkRaqXaiNAPTtradhtnUKi9jhKCDRh9HKsss
   X+1bIhliA6vK7Mqhjn/6L8tmF4odm+tXew/myyGZS51TK/NHhXY+V3bGj
   HAGtSubjH+jl+hYaptg06R5lZ17K3mO9YbUjS1TDyPMGIbZp8eg+3KG0L
   E=;
X-CSE-ConnectionGUID: ozxKcFvfTKausaSb0UebIw==
X-CSE-MsgGUID: SEgQBXdrT0O1xls2NlHySQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,191,1787004000"; 
   d="scan'208";a="303298693"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 10:09:21 +0100
Date: Mon, 2 Nov 2026 10:09:21 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Kees Cook <kees@kernel.org>
cc: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>, 
    linux-kernel@vger.kernel.org, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    driver-core@lists.linux.dev, Nicolas Palix <nicolas.palix@imag.fr>, 
    cocci@inria.fr
Subject: Re: [resend PATCH] coccinelle: Add devm_kmalloc_objs conversion
 script
In-Reply-To: <E7A57F75-AB90-4B41-B942-55D65F2B65D8@kernel.org>
Message-ID: <c47392bc-e522-19b6-a653-1e85b44cefba@inria.fr>
References: <9b55b3e3269ef43ede64fff34f42121f7aa47979.camel@perches.com> <1a6026c4-3e19-a1a9-e637-f1842172482b@inria.fr> <E7A57F75-AB90-4B41-B942-55D65F2B65D8@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 2 Nov 2026, Kees Cook wrote:

>
>
> On November 1, 2026 3:51:53 PM PST, Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> >
> >On Sun, 1 Nov 2026, Joe Perches wrote:
> >
> >> Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion script")
> >> with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GFP_KERNEL arg")
> >>
> >> Finds and converts sized devm_kmalloc-family of allocations into the typed
> >> devm_kmalloc_obj-family of allocations.
> >
> >Applied
>
> Please don't send this. I already did this. See the PR I sent for rc1:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-linus/v7.4-rc1/devm_kmalloc_obj

Too late.

julia

>
>
> --
> Kees Cook
>
