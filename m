Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204207;
	b=jjpnoJMddjN7PBhUI4xPv08x4AQThgeADjozeZDbwoEy+EQ2ujOy6qmYmkJgpEsYyTkD
	 B9AYP1EBdbREaxyWduD9K0aDKVmdiYPJ8jF04HlrscVQJb7dHCjfPJw/CvhSjLCygkTYl
	 6CuJnnkmwMG3ZMvIhOaF2AYn4JHyOPU6p0BoPImctsB2PvybQflqv46rwGEHf3mpcQOe+
	 pHhazJcpPCrRwepMsP5p6Ban5eF/P7kAHrUWvWAVCPb/lTl5KPtJoazEtfspHIcdOMy+2
	 +JF/WJW0H6gdXyqCc58SePvfMyK1lZ8lfu7ShCCmefAgh/ZI44eIeVC5bCkSXrI1Aqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204207;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=iTAj/l0Wsa0dWyHr2HUK0KSTuSgtFX39Oe4ZR01XU7Q=;
	b=BW334XipzAgQasL6SvcibiwhUKrmEuYoemtjA2rKqjYMegvE6y4IFwlddZVDvjLWQPsU
	 c1mAlU0AqsSitGcME5r8yHcp1BRvfg9OzVVIbGvBfnAXcKTaG4C+pNr1MrqtMJqsp/J9v
	 M7n1SrFMl31cOzN7OD56gF2JbtMGhGsUgyWaedlZ9MMHztS8HQN53wiwUGrOLB1NqINnp
	 gINe1Sv8tk2KXGadxZdUGoY9z+9dfIgoosszTDT/9au0yhjGscbf+oYout1fijY2C4F4e
	 zJB95Nv7/TIMp0n140FPCbKPOQG55xhtBWLY297ELkj0AiV6DCGjBp6MJa1jXx2j8Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008EF606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 008EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1A74B68C4E; Wed, 28 Oct 2026 17:16:40 +0100 (CET)
Date: Wed, 28 Oct 2026 17:16:39 +0100
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Erwan Velu <e.velu@criteo.com>, linux-nvme@lists.infradead.org,
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-kernel@vger.kernel.org, Erwan Velu <erwanaliasr1@gmail.com>
Subject: Re: [PATCH] nvme: honor the volatile write cache enable state
Message-ID: <20261028161639.GA21871@lst.de>
References: <atJXYHJa4jkUWJmP@kbusch-mbp> <CAL2Jzuz1qFwLSA=iivp5qLCTL6-4rvKmvFzJbOQzjPu6j_7Y2A@mail.gmail.com> <atJeazM_rJ0uj3vt@kbusch-mbp> <CAL2Jzux8v6zCxfcdd=MY5n0zQMVSa-_8Lki9z-fz7bFShNf7vw@mail.gmail.com> <atJk_2FmzjUZYO_Z@kbusch-mbp> <f665dc3e-fc5c-4352-8e41-a46b7ae97946@criteo.com> <CAL2JzuwuZp0gg1D7wSn7cdgpnhotnuLP6YpPd-SrdVyqhkeiJw@mail.gmail.com> <atqZmctbU0siYmVX@kbusch-mbp> <7fec6534-9e57-4041-8699-72c5950c7e2a@criteo.com> <auId5RuBhMFGirJ1@kbusch-mbp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auId5RuBhMFGirJ1@kbusch-mbp>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Oct 28, 2026 at 10:08:05AM -0600, Keith Busch wrote:
> > Considering the performance impact for these type of device,s would you be
> > open to a backport to stable once merged ?
> 
> Not sure when a performance improvement is stable worthy. I'm more
> concerned that doing this is going to expose corruption, but it's what
> the device is asking for, so fine to introduce it, but stable is
> questionable.

Same here.  We should not send these improvements to stable, but let
them soak in linux-next and mainline.

