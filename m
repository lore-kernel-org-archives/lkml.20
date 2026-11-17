Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906603;
	b=azqLmmCUqcTYEhN79jfMj1Qzhfzi6r1BZ+feWF6GbZXo64nJ+dRmrV5TkZgnx1CDOLFQ
	 5o4my8uMan6y6QD5fXMlIQgWOWQakOpYRoKN15iAqbrVJCOMp0oGWcHB7agZNkJcYPpMp
	 wRPcrSBTHsyXtBMwNt826s/lRaeu+J2AnAEauhSny1qfyEgRDjduSyTs5ltPHmrqReKKl
	 JSYnGwL9Y+kR7j1HzyF2cQYSaUPlt2av13SlJeNbuo2pQBxFwzw/y+3Q/soGjUW4h679x
	 AbGDlEJun8LLgHxygwx/Bxb3kB2hTE87G6d/sY5ZQEVe9DrMPfssB6+NH6CMde1yPVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906603;
	h=DMARC-Filter:From:To:Cc:Subject:In-Reply-To:References:Date:
	 X-Clacks-Overhead:Message-ID:MIME-Version:Content-Type;
	bh=R+OqfM7actfzvs/UrNB/+O4Oh39TPWHg6g3B055HHec=;
	b=oQhAAel5RJZMyWr2HAy5QAKUcalvX3bW/HhePBJp8sMrAY7VV1dxjDl5zwtbjGlMgaoT
	 iOcHTEUf/S9K9BRbvVdsMJmswTRTQD/cNvh9hQDY6Rd2Sf3eNeqCoDjeAdxidLMwksNFG
	 xaEn8WHA3CSGWj8P53QDuXiye7W5m/o6jET4RtVcXIMrqGX1UnGzN6Mliz82BaxptGXdW
	 0bjlHk8MSpK6VCqzLSZRMP21dGYDLw4G00odfm4PfTgILviWyHCdlMoJhhXdwCgOTJjcH
	 jPcXKqcJ9/ibNaLVFU23wOtn2PYRt9HmV+ee0E0+8zVS7NFAq9+VaG5EJi8a8JbseXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F41606A336;
	Tue, 17 Nov 2026 09:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F41606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: mail.toke.dk; dkim=none
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Tomas Tonhauser <t.tonhauser@pobox.sk>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 linux-kernel@vger.kernel.org, Tomas Tonhauser <t.tonhauser@pobox.sk>
Subject: Re: [PATCH v2 0/2] wifi: ath9k: fix loss of non-aggregate frames
In-Reply-To: <20261028171652.1125692-1-t.tonhauser@pobox.sk>
References: <20261028171652.1125692-1-t.tonhauser@pobox.sk>
Date: Tue, 17 Nov 2026 10:09:58 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87ik1vu8m1.fsf@toke.dk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Tomas Tonhauser <t.tonhauser@pobox.sk> writes:

> Non-aggregate frames (stations without an A-MPDU session, e.g.
> non-WMM ESP8266 clients) are lost on ath9k in two ways:
>
>  1. The hardware filters them (ATH9K_TXERR_FILT) while the station
>     is awake, and mac80211 retries a filtered frame only once.
>     Patch 1 sets CLRDMASK on every non-aggregate frame.
>
>  2. Frames that exhaust the hardware retry chain are dropped, as
>     there is no software retry for non-aggregate frames. Patch 2
>     re-queues failed and filtered frames on tid->retry_q, as the
>     aggregate path does.
>
> Toke, I know you were not keen on clearing the filter
> unconditionally, so I first tested your suggestion (patch 2) alone.
> On a weak link it did much worse than patch 1 alone, and the two
> together did best. If you would prefer patch 1 limited, e.g. to
> stations that are not sleeping, I can rework it.

So an alternative solution to what appears to be the same problem your
patch 1 is solving appeared:

https://lore.kernel.org/r/20261110170459.31857-1-dominikengelhardt@ymail.com

Could you please check if this approach works in your tests (with or
without patch 2)?

Thanks!

-Toke
