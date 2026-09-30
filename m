Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB297471CF4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808415; cv=none; b=n/Sy31RKAqmeLL642IFU57QTBP0rkRC1PrtB5mumvo7Ypl3WZHJJMMVuiGsrlHekhpTiMcITu/D4rddZYQrG9e+3mBKEtobGaCVDjA3ifvT04IZUZBxV+RsHAxZWBVan6xY6fY3XG8QAWkpRupPhv0KjTOKPbHb1XV7UplKrIrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808415; c=relaxed/simple;
	bh=iUY86fmykHrLIrj1miJWlEiKPnV8cPd6QnSCgVjlVwU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qCpgF1knvnt8MyNEl5OTldbJ27dDHl8wkpRFiBNYPms4hw0TVeAURpsyryRZtTALXww00gAj659HloY2Q5STM2NJCS4tRByAOYRfBSQWKlFcTJa8Cx4t/MP/f1bp7AoMCYWedKqspk4XrLIqr0hUZ1pPjPttHOAyZ675W5e3oBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=Z/+RjXYY; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Z/+RjXYY"
X-KPN-MessageId: d1d5d6a6-bd20-11f1-bfbc-00505699b430
Received: from mta.kpnmail.nl (unknown [10.31.161.189])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id d1d5d6a6-bd20-11f1-bfbc-00505699b430;
	Thu, 01 Oct 2026 00:46:48 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id d1d4ddfe-bd20-11f1-a0a1-0050569981f5;
	Thu, 01 Oct 2026 00:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=hGT3xmN+UaCy/pILQr/zg+mQybeBh8qMlcohUsN4rJo=;
	b=Z/+RjXYYp1KgrGba5w8L47pzDtiVdWlQqX083mf0i2fOMKK41dxIcsolPaRuAdFbqZtpGmgakuUUn
	 /zTo+SjAmZF/OTKlIBdEdPuZoQMgyGmdyckZtoiYPVdYNxq8lRSOyVMjL4H5z4u/ZSz6o1vp2QNfkw
	 2v/q/iEbQawFlelG+aWzRZM53aiV6jKRuLZl8HG2VqFeKhUx1HLWlF8FV+dBWYKzY4hVbD0eZL3D73
	 3laMRxJG2/R39GW0gk/Lf430n//sex+K9+hnIAhYW4oBxpdGYmz81dieSkG8cKd0s0ncjCyN9F8Ee3
	 BDOLnuPTdAtSM3st3eww0paCb1SiP7Q==
X-KPN-MID: 33|MlV3jDjwT9VYNh5DnhIq/iGM/XUvECs0ml3jQI/RJ1dGfIeOJvu7lE03UIcS2vj
 W5hcF5Lb5uKgzSmQgbYftgQ==
X-CMASSUN: 33|SjyCVKNMGQgw7tLnRv5Fz3woWTCXXWRwzyZCoEOc7O08Ti23KymKWgv7psMm0zE
 7hh+S+QTh35r5xQDN1EtB9A==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh08 (cpxoxapps-mh08.personalcloud.so.kpn.org [10.128.135.214])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id d1c9be1b-bd20-11f1-8edd-00505699eff2;
	Thu, 01 Oct 2026 00:46:48 +0200 (CEST)
Date: Thu, 1 Oct 2026 00:46:48 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Yury Norov <ynorov@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: shashank <jain.sm@gmail.com>, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Message-ID: <1237394198.791420.1790808408141@kpc.webmail.kpnmail.nl>
In-Reply-To: <arfQcR_iUru_HQYh@yury>
References: <20260925102307.49513-1-jain.sm@gmail.com>
 <arapwjg4cp25e3br@yury>
 <20260925133951.a80670af112718d9b9c271fd@linux-foundation.org>
 <arfQcR_iUru_HQYh@yury>
Subject: Re: [PATCH 0/6] bitmap: fix three parsing bugs in bitmap_parse()
 and bitmap_parselist()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal


> Op 26-09-2026 10:02 EDT schreef Yury Norov <ynorov@nvidia.com>:
> 
>  
> + people from 816d9992d9ed
> 
> On Fri, Sep 25, 2026 at 01:39:51PM -0700, Andrew Morton wrote:
> > On Fri, 25 Sep 2026 13:05:06 -0400 Yury Norov <ynorov@nvidia.com> wrote:
> 
> ...
> 
> > > That looks reasonable, but please resend the series with your full
> > > real name, and also specify the version of LLM you've used to prepare
> > > the series. I'm uncomfortable taking anonymous commitments.
> > 
> > fyi, this was changed by 816d9992d9ed ("coding-assistants: simplify
> > attribution") - see latest Documentation/process/coding-assistants.rst.
> > 
> > So now everything is supposed to say only "Assisted-by: LLM".  I find
> > this regrettable - I'm interested in seeing what people are using.  Oh
> > well.
> 
> Huh... The commit says: "provides free advertising to proprietary
> software companies", and that makes no sense to me. My email does
> exactly the same thing, together with the emails of the  vast
> majority of the community.
> 
> Can we please somehow revert this "simplification"? If people use
> some wonder tool, and it helps - I want to know the latest best
> practices. I want to know MORE rather than LESS.
> 

The analogy has no bite. No one is making huge bucks off marketing specific
email providers to kernel devs. Also, we can't get rid of mentioning
email addresses. You need that information. You don't need to know model
specifics, and it has nothing to do with best practices.

I think you'll be able to find out about wonderful new LLM models also
without the tagline. They are after all shoved down our throats at every
opportunity.

This will I presume be discussed at the maintainer summit, but there
was quite a bit of consensus (iirc) to bring something akin to the current
systemd AI policy to that kernel document. So, emphasizing what the LLM was
put to do, keeping only the short assisted-by tag for quick filtering and as
an alibi to point people towards this document.

Best,
Jori.
