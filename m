Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.212.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974697;
	b=1kJyTRyunX4laXJtqnRKJh4cmJZ2SB/t0xmGxhSfsMfu8tgYO4B1gWVDY+fvWsrutgi/
	 TU24eIgVYYCwOHazK0hKg3r4nB8gwpvMQZtfAcBn5PRTKbGnG1PEKZj8BvcjJ7HZ1RoI1
	 tIV57y/Mi7RyCt0xx5QhvpbMrZwuNE2aIzWqPX0VRSbRjqgvp6LZuZip3D/HtVz9c53N9
	 GpGjG6NrVRZu0aceytIluG4DTrtdiuHIk5NR2OeGLzHi2cq69Un+/4jUZA4KUQJSaQqI2
	 1yy9cpCH+pZOgst0KJgimMx6fh4e/l9GBG+74PfLzj2LECVKjrkXhgjgz7NhodcDVdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974697;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MailChannels-SenderId:X-MailChannels-Auth-Id:X-Arithmetic-Industry:
	 X-MC-Loop-Signature:X-MC-Ingress-Time:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=EFP9Z7S/OG0SHtFnEDr1gH6R2eS/BTibXfBShMTZbXk=;
	b=Sj5TeZScb0kPGASDKzCL+TGLEjmcCxnxcb+n510Kbx6OrRAY71W3/MI4VRckUiO3o6lv
	 ZHTv5QVcZKYl2GnCjeB/Qax12ZvGXT0JMihP+OnH3Wz1cnl0Byzwl5mMUnmz8aHM0GhUE
	 MDXk/XcSFwQqOUsB2Wx2ZrdEq8XLDhu+rVuOsBHi/QlZNBbrAsgVMHXyYbVP8voyEy1eE
	 fMieoYwTasmyVTtBr0dcE0a19X3deRa4kgEbY4VrkKz/1iL3tiGUpMHYM5JgovqlDUR1C
	 /Dc+jSR1tsJn1YNTq+UiCuuDE8BHiBvjkNBq67qARruyFqy8kKTAZ3O+byGw01pxqaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stgolabs.net;
	spf=fail smtp.mailfrom=stgolabs.net;
	dkim=pass header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b="cnppXV/7";
	arc=none smtp.remote-ip=23.83.212.45
Received: from crocodile.elm.relay.mailchannels.net (crocodile.elm.relay.mailchannels.net [23.83.212.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0321606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0321606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=cnppXV/7
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 94B5A4C1938;
	Fri, 06 Nov 2026 14:18:10 +0000 (UTC)
Received: from pdx1-sub0-mail-a256.dreamhost.com (trex-green-2.trex.outbound.svc.cluster.local [100.99.192.246])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2E5604C1B7B;
	Fri, 06 Nov 2026 14:18:06 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Arithmetic-Industry: 35392b2b687b7f9a_1793974690453_2712092115
X-MC-Loop-Signature: 1793974690453:1806338392
X-MC-Ingress-Time: 1793974690453
Received: from pdx1-sub0-mail-a256.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.192.246 (trex/8.0.2);
	Fri, 06 Nov 2026 14:18:10 +0000
Received: from offworld (unknown [172.58.167.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a256.dreamhost.com (Postfix) with ESMTPSA id 4jLh966Kr1zymb;
	Fri,  6 Nov 2026 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1793974685;
	bh=EFP9Z7S/OG0SHtFnEDr1gH6R2eS/BTibXfBShMTZbXk=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=cnppXV/7PiHwomac5Y5u7+ZrDbE44R5hoOZDISaFlLR2uKWgmHe/xC06V5RQ4gU05
	 ql20jYaVmiGFslak3amKNZ30cskveopeg8RYu9IMt7Oo0uBYVidLwjXIjxCO9W7iss
	 DNhycmN/iYrTxc8Ws39WDZnHxk3I0eCSGK425WZsbQRNfIEXp1zqyoNkTgigDjWHW4
	 4lBirHJGW8GxqccGDPze4xvyHT7pXIQFs6AMqnQxRu5PBiCuvlI4bR9WCxrgo+M29x
	 cQPXMiyD/Y2SEUWxViSKOqw3CHQ2nBfOZ4DuXM8vLm6Uk2LkjPL2gQDYNjlXXNEfG5
	 bsu86LlCl5l2g==
Date: Fri, 6 Nov 2026 06:17:55 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ren Wei <n05ec@lzu.edu.cn>, linux-kernel@vger.kernel.org,
	david@kernel.org, arnd@arndb.de, ljs@kernel.org, kees@kernel.org,
	schuster.simon@siemens-energy.com, yuantan098@gmail.com,
	yifanwucs@gmail.com, tomapufckgml@gmail.com, bird@lzu.edu.cn,
	caoruide123@gmail.com, enjou1224z@gmail.com,
	Manfred Spraul <manfred@colorfullife.com>
Subject: Re: [PATCH 1/1] ipc: sem: fix used_sems overflow in newary()
Message-ID: <20261106141755.5epzadks4mq4ea6e@offworld>
References: <cover.1778477179.git.caoruide123@gmail.com>
 <849fb1fdecd1cc241fd5b032602dbffa90f9dd93.1778477179.git.caoruide123@gmail.com>
 <20261031203726.2dca9645bd13ac9c18248380@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261031203726.2dca9645bd13ac9c18248380@linux-foundation.org>
User-Agent: NeoMutt/20220429

On Sat, 31 Oct 2026, Andrew Morton wrote:

>> On Mon, 11 May 2026 18:42:53 +0800 Ren Wei <n05ec@lzu.edu.cn> wrote:
>
>Slight delay, sorry!
>
>> From: Ruide Cao <caoruide123@gmail.com>
>>
>> newary() checks namespace-wide semaphore usage before creating a new
>> array, but the current accounting uses a plain signed addition.
>>
>> If the accumulated semaphore count overflows, the limit check can fail
>> open and allow allocations past sc_semmns, breaking namespace semaphore
>> resource enforcement and potentially leading to resource exhaustion.
>>
>> Fix this by using check_add_overflow() before comparing the new total
>> against sc_semmns, and reject overflow the same way as a true limit
>> exceed.
>
>LLM review tells me
>
>: The fix looks correct. The existing writer lock covers the check and
>: the later used_sems increment, so that increment needs no further
>: change.
>
>and
>
>: Please qualify the changelog. Default SEMMNS and SEMMSL cannot trigger
>: this overflow. It requires raised limits and substantial existing
>: allocations: sem_alloc() separately bounds each array's size, so one
>: enormous request isn't sufficient to demonstrate a successful bypass.
>:
>: With sufficient memory, semget() can then succeed instead of returning
>: ENOSPC, exceed the namespace quota and wrap the semaphore usage reported
>: by SEM_INFO negative. Additional allocations can increase memory
>: pressure.
>
>So I propose this changelog.  Please check:
>
>: newary() checks the namespace-wide semaphore limit using a signed
>: addition of used_sems and nsems. If that addition overflows, the
>: comparison can fail to reject a request which exceeds sc_semmns.
>:
>: The default semaphore limits cannot trigger this overflow. It requires
>: raised limits and substantial existing allocations. sem_alloc()
>: separately bounds each array's allocation size, so a single enormous
>: request is insufficient to demonstrate a successful quota bypass.
>:
>: With enough memory, semget() can succeed instead of returning ENOSPC,
>: allowing allocations beyond the namespace semaphore quota and increasing
>: memory pressure. The wrapped used_sems count can also cause SEM_INFO to
>: report a negative semaphore usage count.
>:
>: Use check_add_overflow() before comparing the new total against
>: sc_semmns, rejecting overflow with ENOSPC. The existing writer lock
>: covers both the check and the later accounting update.

lgtm

Acked-by: Davidlohr Bueso <dave@stgolabs.net>
