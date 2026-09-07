Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F2951FCB6;
	Mon,  7 Sep 2026 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802159; cv=none; b=AYLyhcu2KNXxoJhV0AOODeBBUI6eUmWkUpen8CWukRWIyCBOTqXzgRvDqzOo+R+6QkXtZthGZeKyccKHbWsHUlYONTW+6a/p/rk2zV6V9YjDy8hiooFCfpSqglOe15C3e2k2yMbFoNY1YbK5/QX0rqaFwpynrd06wgNXDooUf9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802159; c=relaxed/simple;
	bh=PPWqAM4aqsNRcs+1+J9eJDez+drLkfXvqky6p0IDjIk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JBGK9OBrKWUgDChsF6VLldMiut+2OtB7pED2T5SEo2ZIVfQb15HfQtY7zWK9pHlCoO5b5Yt1LJHqQIdIpHgRnf6RFAm8QsZIQrF9pd8jZnWSlVSpuLK314MoFK5XRqQTem+CooZclHe101bFvtRPBcL2WOJApZ+eZmCAEK80/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=SNwliic8; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="SNwliic8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1788802144; x=1789406944; i=spasswolf@web.de;
	bh=LTy/z4lx1Mguza4pQs79QasfJi+cSq33OddQzK23WtQ=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SNwliic88WrmiaSn5WJVaEYnmtdCTZUhNvFo5jLv2n3QI2gBHsgulk1J+/54x5wp
	 wMTdZBfypyoeSussozxUrcYmv8BmA1vLfxZO3iYsXtqavWQnga51t20ny/yvfEIz6
	 hRD/rgXEeUQDQ2cSxTBMY3eYGbJc8cHWvFO27dFUFfeTc5kYSrkSrkx8kQLR+uYP2
	 hiKh43r4BHzBk7BQBumhRD2mZDv3PsYS1bxIloq0J20v862NTYGwI4K53ez7Us/FE
	 IRQidmCTSC8WnVji+I8TjxlOzZxRElDCbkORS0ma3sUeoRZB5GaUCq11E3hxFvPTL
	 kz1Cv6W46s90geBPEA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZB4F-1xPmhV16kz-00SBXq; Mon, 07
 Sep 2026 19:29:04 +0200
Message-ID: <57252878c60f15fbcf9d3c8904cc690db0998272.camel@web.de>
Subject: Re: [PATCH] mm: memcontrol: fix compilation
From: Bert Karwatzki <spasswolf@web.de>
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org, spasswolf@web.de, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 07 Sep 2026 19:29:03 +0200
In-Reply-To: <20260907141808.3F4581F00A3A@smtp.kernel.org>
References: <20260907141409.215031-1-spasswolf@web.de>
	 <20260907141808.3F4581F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2-10+b1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RcuJ6Nq87kKufc3HOMOKgLFTMvj3WHc8Nxfwa3zTt94+mzOV8h/
 1uAM9qrJlesh3sncbhjToGHaxFwtNV5XWG9DIG1qt0j1W0wa6Wbw0N7y25yCnj8ZUN0bGMh
 XxMWuxPW2bvctOftQJ3AFLFAFZg9kD5XIQDURHg5gn4in6vrZWOs+EYRp8RehW/ZUBxxQhk
 fFZLh4M89DGLwUCkD/cLA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HKwn7S0gN5Y=;jXNTR6fl7pWJZOJHu2h1ttjqyKQ
 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

Am Montag, dem 07.09.2026 um 14:18 +0000 schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
> - [Low] Redundant include of <linux/irq_work.h>
> --
>=20
> commit e46ef07a908650625b6fdf687c2624752ae3ff9c
> Author: Bert Karwatzki <spasswolf@web.de>
>=20
> mm: memcontrol: fix compilation
>=20
> This commit attempts to fix a compilation issue by including
> <linux/irq_work.h> in mm/memcontrol.c.
>=20
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 307203301a2a5..4740f519883a3 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -72,6 +72,7 @@
> >  #include "memcontrol-v1.h"
> > =20
> >  #include <linux/uaccess.h>
> > +#include <linux/irq_work.h>
>=20
> [Severity: Low]
> Is this additional include necessary? I noticed that <linux/irq_work.h> =
is
> already unconditionally included slightly earlier in this same file:
>=20
> mm/memcontrol.c:
> #include <linux/kmemleak.h>
> #include <linux/irq_work.h>
> #include "internal.h"

Yes, the include is neccessary because irq_work.h is not already include
in next-20260904.

In next-20260907 it's not included, either, but it is no longer necessary,
as mm/memcontrol.c no longer use struct irq_work_queue.



Bert Karwatzki
