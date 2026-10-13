Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999E534041B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898749; cv=none; b=mj7vygWD+OSEnrWG8jFQDDo4amyGqR0V6ZjRltoi8QQwjux3rBsoxNmCy8gNlyCMLBEJ8pmN4Qbr9tPkqWOpvwUpCcJ3yHfM+2aGEquILmN97gfhl5ZYvg/D1lAagzjHdG7TGIESPys622+Xjc7XpjJxftq1Q3zg1sYMo5betm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898749; c=relaxed/simple;
	bh=Xibk7ZZrjCGxgBVlBWwqQKg2NMbn7mu9H6vK4Z+5BTo=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=jJpdt7ipisNncIQ8KqQUwloEVy9itErmkdT0up1Utjv/PqMhWiui/Z06sex5Si6J7DWZcFUfWmAFGid3SpxRIgAWmeQCAygyHBbKedWgS2P0m4N9BvJKoS/t6YmJl45sR8FCQjfFxuV+3TmPTzq8BnCnuDcCcQBOIT1xbghMe2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=CVoXSJgX; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="CVoXSJgX"
X-KPN-MessageId: 4bdb38dd-c70b-11f1-8f57-005056992ed3
Received: from mta.kpnmail.nl (unknown [10.31.161.190])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 4bdb38dd-c70b-11f1-8f57-005056992ed3;
	Tue, 13 Oct 2026 15:37:55 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 4bda04b6-c70b-11f1-b419-0050569977a2;
	Tue, 13 Oct 2026 15:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=Z8yTwcTSluWZJY5ZBYBe2zIFDAQkmy5cR5V2a6VW3TA=;
	b=CVoXSJgXLqX6kd9Ud2YpuOm/03GVxPUP0DlmfwHP+o0BCtrXrn4+VylSPFBbLL8gUDelfLmNJqYRe
	 NG/z6H3YJxOGr/JuB6Cu+2kIStGT4sVW3grllcYSM9TEFJUMtdPVkQnJB6BBFJFmH4OJl+02qACbBV
	 S0BLsKcZKUC9iA3Rr02dC9kBGXEFtzRKRKRA8Tx/Z/pXXz8Q8JsKtMvlPF/9P70fStMfbrxaXdneTY
	 42cPMkNfrqdqkpXCEZnAGmigaWc8/d01OD1gcqBSEjyEwgsd5PV+FeBzaZSvBkurgDW2Cjw0lkkmbF
	 4EMUqZKqMcGHYlbcHFrnIYnBrwI2C0Q==
X-KPN-MID: 33|l8c3Ci0Mj6eVISZaXjsuexY9LszYX48mW+j2ZaJc8WBwGL9Q6QRdrEG+3XTjKZl
 beBCdHagj4obboENe5zUK7WNMrCF6kKy69RE0d6nutec=
X-CMASSUN: 33|VJawk7Wq0cGHKte5wFwkW2BUeGyb6UDcdZXyz48i9vDi0IVhSUHJuHVBrQWOJlR
 lFiFqaQ9rdLg8kf20nVedNw==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh05 (cpxoxapps-mh05.personalcloud.so.kpn.org [10.128.135.211])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 4bc3b32e-c70b-11f1-8edd-00505699eff2;
	Tue, 13 Oct 2026 15:37:55 +0200 (CEST)
Date: Tue, 13 Oct 2026 15:37:55 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Message-ID: <1955936841.795627.1791898675484@kpc.webmail.kpnmail.nl>
In-Reply-To: <as4xMnT8a75pIw9v@gremlin>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
Subject: Re: [PATCH] docs: remove Assisted-by references
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


> Op 13-10-2026 15:29 CEST schreef Lorenzo Stoakes (ARM) <ljs@kernel.org>:
> 
>  
> On Tue, Oct 13, 2026 at 03:12:43PM +0200, Laurent Pinchart wrote:
> > On Tue, Oct 13, 2026 at 01:59:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> 
> > > Ignoring is the only workable long-term solution.
> >
> > How do you decide which patches to ignore ?
> 
> Anything that looks schloppy. ATM it's very easy to tell.
> 
> In future it will be newcomers who do anything but the most trivial work. Or
> they will at least be super-deprioritised.
> 
> Yes there will be collateral damage, but it's that or no more open source (we're
> not the only ones going through this!)
> 

This is the tragedy of things, and LLMs have made it much much worse. I am
sure that in today's world Hardy would have missed Ramanujan. I find it
distasteful and wish it were not like this, but it is better to spend energy
on looking at what we can do, instead of wishing it wasn't so.

> --
> Cheers, Lorenzo
