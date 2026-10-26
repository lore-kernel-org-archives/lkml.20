Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050200;
	b=mljSh/XmyTPDhd2gSAP5dYEBbw0A+HOGvP552G5oWEBHIlXedZwEotVyg2Q5YO6xZYn6
	 4TuxgUgN7zdDMgTNLn89vgGbgCu3NsrLefeh7wM4WRGtgMRc4L42zGb4zp7zkQansPPfs
	 Oh8uSmRU/h7tM2zK5Yzq4Wgv7vC+d7LICOJ2TvozbgdZGeD+yl38FPXWLvhxOml9muZw7
	 x8swhr/KMCrGqyWXdK9CidLFqxRTP3nwlT/4wnFHFkswNgKo6JxE7ZldP36CJfd8VlD+U
	 4X2etQIU4jc18njWiKovbnFTJ/HcfFIEnDg6sDGIxch7f9seCCvr+6/ztgYVpgTHVZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050200;
	h=DMARC-Filter:X-KPN-MessageId:Received:Received:DKIM-Signature:
	 X-KPN-MID:X-CMASSUN:X-KPN-VerifiedSender:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Priority:Importance:X-Originating-IP;
	bh=o5yyMIRuUkf5RrYeoj823JZMe5ZGLqQ6EzaclqXbKe8=;
	b=Vci1YaB+A1YcPCEC+1uDOS/Qyqu4zTQm+LKNaVlLDneJIjf5fUovbqBE1gs+9gKpVFdc
	 0ybKIAr7kEabyG3OyS6q9hR78SuRD03hEVOAAI09347/TkYEOsturFccu4NG+HfgxpFBn
	 b21yVw1x34WfkbeN3oiOKd6DT0Yx24P6a6V/1CviBM+dmKdOoS6PkAYIFRbtiN6utcROD
	 Eh2quteq8mP7yGeQYoFQ8c6ArZa2fIGYGqaTxb6TGRtogN5bPUJkfJd3/nRDf9y7yHkI8
	 91sl64EqLzfaFuDFWNrnwx12ZHGvLmLjI6erHzwbXz/zulpxIRJGti+CDET0vQuwXDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	arc=none smtp.remote-ip=195.121.94.186
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24B7606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B24B7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 5c2bbb72-d184-11f1-87e5-00505699b430
Received: from mta.kpnmail.nl (unknown [10.31.161.188])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 5c2bbb72-d184-11f1-87e5-00505699b430;
	Mon, 26 Oct 2026 22:29:43 +0100 (CET)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 5c278d2c-d184-11f1-b61a-00505699693e;
	Mon, 26 Oct 2026 22:29:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=o5yyMIRuUkf5RrYeoj823JZMe5ZGLqQ6EzaclqXbKe8=;
	b=AIKNKCPR3DldW+bEjNxnZ67jcxVFuiqtkfOe3cCipKZsJzmINeXxFVyKr8q4kw+bf5aBZbcWY3vAN
	 QbfTLVTSyZa8iwvUl7+5ZBRX7WS4TZwvEwDNOA3BTXtW8Cv1elSzt8/k3+wWI4w293TGDhmgAqjmll
	 eZFfHf3DBZDGCO95orjEFMVJR1KCteC8R6q7pLBnp/+4sy+kdyddlRYFcF7VyQDcsHaKMHo58z6NZm
	 zzactbrqxoe0C6G+HtToSVbMNjDNow6K7f16O4FWSaGtQOGDYej9p6nVY+/U3+EgywQlcbgCs1oIax
	 4VWj4TrROjfmhbA9P8X6zgO0EyFeDfQ==
X-KPN-MID: 33|I7+Ub7Hf3yUor5T/Kh7gZ8Mw75dKoLO/7Kqiq21Lne1giPMqmenbRhhiNxdz4WM
 msZrIAvX8n/EiKuvwiArhKMOCvFVJjYta545r5AcVhHo=
X-CMASSUN: 33|g62ikWvkAut3AWDXBc0aN5jiuuBp5fqd7+FrV2D6EKkGRuT/FOegjmun57TCDeR
 poz+IXkjRoD3JbyrQvfG3FA==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh07 (cpxoxapps-mh07.personalcloud.so.kpn.org [10.128.135.213])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 5c1b5a1a-d184-11f1-90df-00505699eff2;
	Mon, 26 Oct 2026 22:29:43 +0100 (CET)
Date: Mon, 26 Oct 2026 22:29:43 +0100 (CET)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Linus Torvalds <torvalds@linux-foundation.org>, lyude@redhat.com
Cc: Troy Benjegerdes <hozer@hozed.org>, Theodore Tso <tytso@mit.edu>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Message-ID: <589012467.2408267.1793050183634@kpc.webmail.kpnmail.nl>
In-Reply-To: <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin> <as7uqZn9rQ52USwy@mit.edu>
 <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>
 <atjjQ0oupQ4pmKHB@false>
 <00636bea8791e75b3b16afef2dc5ee7f2cb8bc0d.camel@redhat.com>
 <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal


> Op 26-10-2026 15:39 EDT schreef Linus Torvalds <torvalds@linux-foundation.org>:
> 
>  
> On Mon, 26 Oct 2026 at 09:04, <lyude@redhat.com> wrote:
> >
> > On Wed, 2026-10-21 at 16:07 +0000, Troy Benjegerdes wrote:
> > >
> > > It *is* possible to make a deterministic LLM, and this is why I think
> > > it
> > > is critical to my personal future to have an LLM that can actually be
> > > understood by a human instead of a random number generator casino
> > > that
> > > sometimes puts "4" in your private key.
> >
> > I hate to break it to you but that is literally not how large language
> > models work.
> 
> More importantly than that - the whole "deterministic" part is a total
> red herring.
> 
> We shouldn't even reply to that idiotic argument.
> 
> Why? Nobody is arguing that we should stop take human patches because
> "they aren't deterministic".
> 

I am curious: suppose for the sake of argument that LLMs come to reach a
level of sophistication where they surpass even expert kernel engineers,
in technical analysis, code quality, speed, you name it, everything. Is
the Linux kernel project then done for in your opinion, because we should 
always prioritize technical merit, and LLMs just write better software
than people?

This is not even that hypothetical. In some areas of mathematics this
has already partially happened, to the point that for technical merit
alone, there is no need to let people do PhDs. Whatever they can do, is
automatable.

LLMs ARE tools. They are things that humans use to be more productive.
A better definition of "tool," I don't know. But are they "just tools?"
It is hard to agree on that, LLMs are the centerpiece of one of
the biggest economic expenditures in human history. They are also a
threat to the open source movement, because they let you essentially
circumvent licensing. They are a promise for improved drug discovery,
unprecedented access to information, and disinformation. They are a
source of hot debate in science, education, and here in the kernel
community. I think this distinction between "tool" and "just tool"
is useful to make for productive discussion.

Jori.
