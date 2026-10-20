Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514392;
	b=PQtBNLb6OSz0ksEOk+Pfw+qOR8ENMb2v0Q9abVNxuQ0M891jErDqrSxzdZVPQyS42mgH
	 2UXxdBNGtblmTABF3m0X+gapPCQAFl/hch3q2RhPg5e0n+Qr4aqioOUDgaH0RXWJ7cYde
	 e0wsIZVFSnlFWfNbRvS/KljUmcdULyjE+cL4EBLZ0MnEXkixut+kNpQE+cWThXXdWZrtV
	 5UYfAcWlbGb/HTPZ6G7072AZpaoDjPbCbl3jlmed3uYHUm7kew0TNMprDhu5PSycXlTpe
	 EOfqNed/63l8UahTdfTCcDhmqkKn81f7iTcpbXVuTFsfml0RLOf3WPEpX0NWkildOtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514392;
	h=DMARC-Filter:Received:Received:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=I7aSeZRqOiGs9qoglPINA7QOH72KGaCp+aP5x2nuYoY=;
	b=gU93NWWYmUaMKC+oebrZZOypedz/jQJMrWtw/D+f8jlUvvLGKJcbcnZSK4ieX9vxY67K
	 QgWiLgbFxQDUy+G/zqupEu9vg5ic3xVA0J8InmTLsPuegLENkMJGirRvyDWH4RSp3pCoY
	 dhBpByaW4zwAS0H5Xpr4wiCkQjGk3TV+14mSViaRESvxFGhGhS4ajmUqI90cWNSbJmoFE
	 cSJwobAjsWuykMjsNYGz+X8N/XDFeFIp0wjavjSPAb1yn7bmAZ/IJGvu4YMapRfaRiHf6
	 I0etTmBqcCIL3k49vWvO1QX/0I1JfYmW6NU+YqHivi0I9SrDMj5ntCdNssBlBEA25sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C172606A319;
	Tue, 20 Oct 2026 16:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C172606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 0DD2C1A02D1;
	Tue, 20 Oct 2026 16:39:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id 3647B19;
	Tue, 20 Oct 2026 16:39:47 +0000 (UTC)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 09:39:46 -0700
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos Bilbao
 <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu
 <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan
 <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] get_maintainer: only use THE REST as a fallback
In-Reply-To: <20261020-witty-proud-coot-89ecd3@lemur>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261020-get-maintainer-the-rest-fallback-v2-1-162aea473488@linuxfoundation.org>
 <88c5be32a371b5d73561a82a63426485@perches.com>
 <20261020-witty-proud-coot-89ecd3@lemur>
Message-ID: <23b3cedc62f21179d9374661dc3dad06@perches.com>
X-Sender: joe@perches.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 3647B19
X-Stat-Signature: bmicfdtck94poreneq9eozgbc1wduj8a
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19U2qCaQ3m5sLaZ6wrwOtFUa+s8RXzYRP4=
X-HE-Tag: 1792514387-945908
X-HE-Meta: U2FsdGVkX1+wEJwEUewYAn/f2TZ10Q+veOBpJRxu45b5v2UbCK/oAW1gjsc7bEcUU4ErdVMB9CZijuRZSyv/NKS5xH8MWy3DMDToMjZ6RtaH/5MTuN3PbqO1dHpkEk9UYQgsygwElmhrmxw5C3ACOk3INDpetCcBFLe/fB2X16ZKF3omUUlSpwCP7igJX3HEmz0hn52HlywH5D7h97NJP4zf/rbQGid4RXhFFk1IdqbOYn3jAiSO7bynFg2qLmBYwztRChTuWJJdfrLq8LEOtl/GdUjYyuSpvtPa06p4csZRlPYO6uB3VpmaNYjMxS61Z9Bx0pagdJYa2hR8nMmCOw==

On 2026-10-20 08:52, Konstantin Ryabitsev wrote:
> On Tue, Oct 20, 2026 at 08:47:01AM -0700, Joe Perches wrote:
>> > Only add THE REST for a file when no other matching section provides a
>> > mailing list that get_maintainer.pl would actually output. Lists marked
>> > "subscribers-only" are omitted unless --s is given, and lists marked
>> > "moderated" are omitted with --no-moderated, so such lists don't count
>> > as a destination in those cases. Files that match no section, or only
>> > sections without such a list, still fall back to THE REST, so every
>> > patch keeps reaching at least one known-public mailing list.
>> >
>> > Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
>> > ---
>> 
>> I don't disagree that this is useful but v2: no changelog
>> 
>> Perhaps there's a simpler and more generic mechanism.  I'll play with 
>> it for
>> a couple days.
> 
> It's like to convey the sense of urgency -- with the amount of patches,
> automated reviews, and follow-ups being sent daily, having all of them 
> land on
> LKML and delivered to 2000+ subscribers... is not sustainable. At this 
> point,
> I'm very close to outright banning subscriptions from gmail, outlook 
> and yahoo
> addresses. Not sending every single patch to the LKML is a better way 
> to deal
> with this.

No worries.
Apply it and I might deal with later.
