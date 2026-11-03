Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702443;
	b=b3PP99TfjRo0vNjyd34SrOW0g+XkrgR4xf/WnuTds8H5c+H0Jy8wqQn/OL7BriiRCZG3
	 Q7SRydCXVKB9emgLht7d13AaSClb7yzQy9eJuEa15aCW0p9NccrHkATYfkt4WfvYotQg7
	 7l2V9YGke8zGXePHf1BwfwF0eCFjBNxUqp248hXY58izS5cOBM8EtxYE4Hv5wLOHTd/NY
	 urTEHuJNcFtRga7EIjDXcst26ZV+3DcBC2jgA+RsXSGbE4ccOeNKgFox1v2Kd6PiD0ybr
	 NCkv/2TvKUDECf9i4JOASvdEk4Fzr2qZRZire+b3EfxGHwykIBK+NiA2bFHT+D207hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702443;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=e4BowQ+amK38o//s4NxPBalFr8cpFlq9Zh+O3SwU0ZI=;
	b=YGNKD0vp1zdqpNASvySqp3g6xFaUQyARvRTTcZY39iOtmaB5IrytMfx3Z4xR11Jq6Zwa
	 ZkSmsGgQgiwwrV/mpV0Btk36NRsAajPFKKGpKGaT+ZncxPYDiyRlKczXJ1bzSL5bd1pra
	 y/E3GtD0xMPS4qSOAqcuPhmh1+CJoBnd74hekKN33BNYgpxvl35Bw1emfjMgrihTgn5RO
	 u6gnIzezjbd7FEyhDvveWcmQFlfFD+HxEi4nXAacRnk3w943ZhbipK6ivBls6sJYAhQdl
	 8ZpeVysvwtKASjgV3pLW0OqF6n6AS5Z5JSFr4GyWiWm6jkaPHvZ+v38/DK/kRFgpUgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=AYbZAvnm;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA70D606B109
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA70D606B109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=AYbZAvnm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=e4BowQ+amK38o//s4NxPBalFr8cpFlq9Zh+O3SwU0ZI=;
  b=AYbZAvnmPPrmjN2nm54y/XOOtk2qFGxS5Fq1etWVg/eQQ3zGiKrhEThd
   bEk6tD1niW5tnYsTPn68Vcrb8AZQIaZ1qaLQGInUY6GwBQTcV3J2Tq/zm
   OtP8RH2VZrdBOSsmBWxz4tGfim3fnhunsoyaSHc0bh2Q/Q+AVitJzxSG5
   U=;
X-CSE-ConnectionGUID: SC95fYGpQZWvGPBNN6q0gw==
X-CSE-MsgGUID: N6K//vBCRaiQC+RyUl3sHg==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,193,1787004000"; 
   d="scan'208";a="161600837"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 11:40:34 +0100
Date: Tue, 3 Nov 2026 11:40:33 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Kees Cook <kees@kernel.org>
cc: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>, 
    linux-kernel@vger.kernel.org, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    driver-core@lists.linux.dev, Nicolas Palix <nicolas.palix@imag.fr>, 
    cocci@inria.fr
Subject: Re: [resend PATCH] coccinelle: Add devm_kmalloc_objs conversion
 script
In-Reply-To: <202611021747.3BD1EB4D@keescook>
Message-ID: <491ec0d4-f85-e8c6-e59a-6c9ccc84e0@inria.fr>
References: <9b55b3e3269ef43ede64fff34f42121f7aa47979.camel@perches.com> <1a6026c4-3e19-a1a9-e637-f1842172482b@inria.fr> <E7A57F75-AB90-4B41-B942-55D65F2B65D8@kernel.org> <c47392bc-e522-19b6-a653-1e85b44cefba@inria.fr> <202611021747.3BD1EB4D@keescook>
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

> On Mon, Nov 02, 2026 at 10:09:21AM +0100, Julia Lawall wrote:
> > On Mon, 2 Nov 2026, Kees Cook wrote:
> > > On November 1, 2026 3:51:53 PM PST, Julia Lawall <julia.lawall@inria.fr> wrote:
> > > >
> > > >
> > > >On Sun, 1 Nov 2026, Joe Perches wrote:
> > > >
> > > >> Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion script")
> > > >> with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GFP_KERNEL arg")
> > > >>
> > > >> Finds and converts sized devm_kmalloc-family of allocations into the typed
> > > >> devm_kmalloc_obj-family of allocations.
> > > >
> > > >Applied
> > >
> > > Please don't send this. I already did this. See the PR I sent for rc1:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-linus/v7.4-rc1/devm_kmalloc_obj
> >
> > Too late.
>
> I don't want the rules duplicated, though. It should be a single set...

I guess I can send another pull request to remove the rule I added?

julia

>
> --
> Kees Cook
>
