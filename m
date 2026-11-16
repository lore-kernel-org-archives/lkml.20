Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845027;
	b=sOVj3ARxhYoBZevUluLAzV2Qm4N0KF6N8sIA5igapio/jaU9A/KHCBLyAatib73VOnKQ
	 nGVmG+ejORDy0hAfIPEOCn4dYCkqgEe5z+mwYQJqO/8LDxUBExQSQ0Uv0zvLXFanq60AX
	 N0ga7ejALJxr0xdS4yvJrb/SAGFh0TcR2GplbJChptNUIEapvAOhyD9CFDhxP+TnMXGgd
	 C1pavqLHu5X/tfQ7YG0mXVECuta9OPyIBdSNe6xdyEl2Gu6v6IU1IAUX6qCSPSQqfS0XM
	 6ENt5i5O2/vFTr4EoeYfIo/2EidCZhejNQ2+snyf4SibJ71NQCt8/gOYekRpADQjUmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qlAA127R2oaYgttGLwgrOOAAhQ02iKpyezBNnMMVfD0=;
	b=ecLQSyuLZDjndIvsDFa0BaRyctFwHb18lOI3bm5Hn3QBs0JeS9+vYIr0z511QVEtGUq5
	 eLtbBXVQzkEfQlK9hU6OhIAFdD40qunVU/SUp0CdNb+n/dIkpI2UKZFd8j4hmjzJmBavc
	 a5HH9zc5RkVLlw2aZ/IhfBzY2evoHMv0IQAJbg0vyfL2dUMpg0Lx6nqxWN8bh4ICxBiGH
	 iX5s8O+OBmUnvRiVVN3D6fmbgK0w2ruHESoW9SLlSPQXRsa4yTBTSEYpGzPtMZDXqQtU6
	 s+GXWHomkBU9OuplG6jZIezLiA/NxdNR7jYGIFgsv21soZGOX5AkqkpbFuscbw1d2XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Yy+jDt7D;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E5D606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E5D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Yy+jDt7D
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f20b304c0so425163085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794845026; x=1795449826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qlAA127R2oaYgttGLwgrOOAAhQ02iKpyezBNnMMVfD0=;
        b=Yy+jDt7DanMeBnfkd7YR2MwwpwCv8ZxB8S/AaqsRfCqNKzPPhWfyJ94WGUHYseDxU6
         6EbJJDSlPEO59GvUH4BOatmnKT3QzhSXwJ+hSKKSCM4FBDI4CbgiI43hrMOz6reW1WFO
         91bWhtr/j9+kzy9/FSnqmQFDHlzappuXiq2ULLVh7mKVgyefoP0bNVlPo1uLZb7dhiRD
         yGbwNkLfL0C4tDI4bNbHozbOMh92JTtiJQTmISM6bry5/aE8Cx6jpbRTf8wiuOg3oSm3
         iMMOeByurDRMj4dS5NmQXSeyDmS+8B7RcU3FLjcjJdhfTE3uiU/1zX8grhg3NRJ9ia63
         T+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845026; x=1795449826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlAA127R2oaYgttGLwgrOOAAhQ02iKpyezBNnMMVfD0=;
        b=xVhQhooZ2YEHaZGbVqTkYZkONyqgwEj+PMsJV8Mgk2+a+4LdT3rHR3EJimTT5cZWHp
         q7NnIdAfYrpbBsgiNxL/zxv8r7eAAa2LmWLOyZJP30jLOtUniQxUVCA6VbOImlgHL723
         u5ClzYVTeGBO2EgLKIK/2Md9i/vHFUx7mAvWzr4hgQ7CsJfQVZmEcP7wJ57xYoY2ONMy
         /a0/67tKSg/PyMfF9ufZVcvvM/k8J1hjMjVxbHRthEUlQmQ5CwKhczRAKt9NuCOUxTwZ
         ipXLcdBOEzX/+ObSp3k60PGfPZRNDdjhJqOstcDg174uV9ACClTBo9a8hCIODnqskg6Z
         K/Ow==
X-Forwarded-Encrypted: i=1; AL+hErGd6XD+zXVDgf46AGGDpSkBQkHWDLPd1k9VlqMby745gTaQrZrmSsxqe3uQVjnC6wpWiWYvyqSpLbd7cU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NyjIHH1U4GqpN18M4/9CiNZYSeXXO4Y29c5ZaplgfPCslWDZU
	1czalh9MmLs9nkZONl0iNHZfOngV9HLd8bXyvUFUAEOcp92E9ruen+l5n3wOLYQtmq8=
X-Gm-Gg: AYBFou1fYhoJPfUVrzAFw/yENWnfW+dHJhsf+b2N2uI/2pdYTo18YawV5pH3dxKqHw9
	7ytGJFDBkOF1FZgWK95q8XhZg+6b3AQruq2g7rETjatu7jvVk5kKuIElNl9yvSVD1h8CS43ObnN
	3J5yoo3OTGVXzQg2ZaHzUbyoVDgXUbF7GNF45XJARr1dnxA10ljeTVjNU6MLMPk71f4bKGW4Sqs
	cBgrBDATsVOXGM2pmJZvoRazgwKTB3aSHxOqszfUl2e0+wlZGb0ESuH7Ag7k4+T8k5BqvjvyjMK
	yZ22OieUXnRmSmRwFpUgkhVjS3gqUBD9hsSMD1loQZZLnxdWiJ7swDyYVTWi0waMSdWUOX5/NMt
	tiiJyJ8G2NKK/PVwScIa6ZJWUMP9jTScOIN50yWHUy4/oAIhdJQzVTEHaCrLblduCDkAidMVl90
	KUcPBHPTYOfQWm3DH7G6betHM3Eee2EXJva/A+PAzQJC+fDzsPId3WlLzRt2XWMtpO6ehxbCebV
	M1+B1suXcM6mwkJzz9chi6TANRQlPE4h39puArFb+1o3xJpnaW05t2mdknm0pD0qPCde5g0xO2p
	b20Mp3Y=
X-Received: by 2002:a05:620a:2987:b0:93f:2a56:2772 with SMTP id af79cd13be357-9494bcbc465mr1773546485a.78.1794845025968;
        Mon, 16 Nov 2026 08:03:45 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c6025f5sm866869585a.5.2026.11.16.08.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:03:45 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSzBI-00000009er1-1WxF;
	Mon, 16 Nov 2026 12:03:44 -0400
Date: Mon, 16 Nov 2026 12:03:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michael Margolin <mrgolin@amazon.com>
Cc: Eric Davis <eric.davis@broadcom.com>, Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH rdma-next v3 00/13] RDMA/core: Ultra Ethernet transport
 verbs
Message-ID: <20261116160344.GB2299285@ziepe.ca>
References: <20261109-uet-ib-core-v3-0-3e7e7ffed2e9@broadcom.com>
 <20261116143656.GA34010@dev-dsk-mrgolin-1c-b2091117.eu-west-1.amazon.com>
 <20261116144830.GN2532299@ziepe.ca>
 <20261116152652.GA8275@dev-dsk-mrgolin-1c-b2091117.eu-west-1.amazon.com>
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
In-Reply-To: <20261116152652.GA8275@dev-dsk-mrgolin-1c-b2091117.eu-west-1.amazon.com>

On Mon, Nov 16, 2026 at 03:26:52PM +0000, Michael Margolin wrote:
> On Mon, Nov 16, 2026 at 10:48:30AM -0400, Jason Gunthorpe wrote:
> > On Mon, Nov 16, 2026 at 02:36:56PM +0000, Michael Margolin wrote:
> > > On Mon, Nov 09, 2026 at 08:00:33PM -0800, Eric Davis wrote:
> > > > Ultra Ethernet defines a reliable unconnected transport. A queue pair
> > > > sends to any peer in its job without a connection, incoming traffic is
> > > > demultiplexed on a JobID rather than on a connection, and what a device
> > > > orders is far weaker than IB or RoCE and varies between devices. None of
> > > > that has a home in the current uverbs ABI.
> > > > 
> > > > This series adds the generic half. The objects, methods, and attributes
> > > > any UET device implements. No driver is part of it, though two already
> > > > exist against this ABI. A reference device model that implements all of
> > > > it, and HPE's Slingshot driver implementing a large subset. That is the
> > > > argument for ib_core carrying this. What is device specific should come
> > > > from private interfaces per vendor.
> > > 
> > > Hey Eric,
> > > 
> > > Thanks for posting this. EFA's SRD is also a reliable unconnected
> > > transport (one QP reaches any peer, delivery isn't ordered), so we
> > > looked at the series as a possible second implementor of IB_QPT_RU
> > > that isn't a UET device. Other vendors might also want to support
> > > this interface in the future.
> > 
> > I'm not sure about this. If you have exactly UET programming
> > semantics, including the job, then sure.
> > 
> > But squeezing some EFA specific thing that doesn't follow the spec
> > isn't a good way to build the APIs.. Persumably EFA has its own
> > job-like mechanism for security that is different?
> > 
> 
> I see your point about trying to fit an API to a different use case it's
> not meant for, but I don't think this is the case here. EFA doesn't have
> a job-like mechanism, isolation is handled by the network, so jobs just
> don't apply there.

That sounds like you are saying you have a job for the entire
node. Which isn't the UET model at all.

I haven't looked at these patches, but I understood job should come
from outside verbs as it is something an external entitiy is creating
and then sharing across alot of processes.

If so then EFA could still have a singleton job object and that could
be the deviation. One job only, and the job doesn't actually do
anything to limit access.

Jason
