Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776438;
	b=exj8h3mtKNa3IlfWMjHH5YCmc1HvqBQjWrKyQk8SfO/D8XMrGFOcxHLHuSjIWIOjRT+f
	 9Vu4eKKhyiOUsMnaqXeUBveFcEycs+klbEDdy+wf/g5xoRfd/gZupoEsgAzH0PoIobVrY
	 QhkmyGB0rSxLmgHLyR1rMJg6aLn0cPni+/H3TWkgpAjCVsoQ1Gx4AI5lMhX+C3xwVFLpP
	 AW1NlnwDvgjNStwB79Utc6w8okle+REw1ZrfoR8OHEJht8fZoEk8jhb/h0YfWlPJnXSOR
	 SApdFK4msycU/6mkSupwbcT9nshXZhrIHJlWJ91jhYbcnicVFi8xKTDzUEEUL1yT6YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776438;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=oPFoL03LicYyqNzWV6HqHKTBbJIAib1QU0AIbZccpAs=;
	b=1euKeJpdZMH1ZT1Cl72x6Vf5BoB6ZUqFfmk8wzyN2Ac1azkKda/QnFVr32WHBZZnUsu0
	 iS/xTMX9UUPZqBp4q7fMvdW9NdmDtX2lgvg80N7+Vt+AWGuoimBxIJ0Vaq3lYfifQxtIo
	 sXXae4C2TXqi3O2IkJ3ZA9rEqMhxKlIrGBYqUp8ijDeseSbdxW6HH/rjq1L7c0sgY8so2
	 5jG//hv8v46QQSDB6jZwU5sfu+pjUcAbZuQRuB6Js3R93UoLVgolkXbjZ+zi7gct098vX
	 QAe1C7hf6u2yiYe1jJIuWqcYA7RNXcX3xlTTc75VbQp1L40gW6xu3igu+5zWa7736ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF436606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF436606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C983D68BEB; Wed,  4 Nov 2026 08:13:45 +0100 (CET)
Date: Wed, 4 Nov 2026 08:13:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 07/14] nvme-fabrics: Annotate nvmf_lookup_transport()
 with __must_hold_shared()
Message-ID: <20261104071345.GA28939@lst.de>
References: <cover.1793654853.git.bvanassche@acm.org> <f7be25530c5ddb30da2f13638a35e2daa8002c0c.1793654853.git.bvanassche@acm.org> <20261103075116.GA3844@lst.de> <c587609c-58fa-49af-b5d1-dbfd98c60ff7@acm.org>
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
In-Reply-To: <c587609c-58fa-49af-b5d1-dbfd98c60ff7@acm.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Nov 03, 2026 at 12:37:51PM -0800, Bart Van Assche wrote:
> On 11/2/26 11:51 PM, Christoph Hellwig wrote:
>> I'm only seeing this one of 14 patches, so I have no idea what to do
>> with it.
>
> Hi Christoph,
>
> If I have to repost this patch series I will Cc you on the entire
> series. The cover letter and the rest of this patch series are
> available here:
> https://lore.kernel.org/lkml/cover.1793654853.git.bvanassche@acm.org/
>
> As explained in the cover letter, the purpose of this patch series is
> to prevent that lockdep_assert_held() suppresses the need to annotate
> the functions in which it occurs with __must_hold().

So what is the point of the series?  Do you want individual patches
in the maintainer trees?  Do they even work standalone?  Do you want
ACKs to merge them together?   That's the reason why you should never
ever selectively CC anyone - persons or lists.  It just does not work.

