Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792696804;
	b=JlDCIcRL3wxv5J88YFnPd1HETeYJMXj9HhYmZdy8tXFF60Y5ECCyUf9yIZsaMZWXKvtL
	 vrJUppE/DYCUZROpENyudsAV+sfVBrDsz2CNhZB0u1Rwn+I6UciI08Ytgz2I5BwU+wrcx
	 Bk4YqqRAH81+WHL0KKKqFQ27IjcnW41LonsJSS94iAIXRnaWzlvMvPlifOybwiH6PbGJU
	 j5bZv8veG0CWQqA6TGU4IK9zKsaCMs6Rs1MN5NDCyC/xWbXwARtc2yWLOXx2rCqc+EKSr
	 fj298IeDQzh20C64zi89yuIhHJlevTAjdXgpZNT0fxpMGnTNoLQjIE71R5slpCDcg0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VnTlvi9w4vT9PX72wgTL9hevlcfdOn/hzgPWC/rBkk8=;
	b=HRymjCIQ2OZDpJyJX5kMYkRwssT6FC4ob5g89Er3PXtV57D1Nh0BkMoUeanuVTplYUys
	 NG25vuZiSUlNlLJlxUtzMsBLC6Y1Bg2Wo7WxQs226INrWrIoPmvCwuFfvYfk9puyvm1EW
	 v04EUHZj31vf5KzwrmASHuvwYQzqhn8GaaQOb6a0ER1HBpCAD3Z2MIn60qOOLNapjK6IY
	 rUuX0i/ezyc2lNTQCAGyVq5+vpNi8atXjL/GfRcApJQDnQnl9/NG3b/dZZsq3VM8ddFPv
	 Jn8mq6M5dZXrODkQqN7lqg6D2zKf9C/NOFbZTycnnAvcxXQxDqj8wlVAXTq4MerN6Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=TQiBgo0u;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FF2606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44FF2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=TQiBgo0u
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D5817240104
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1792696794;
	bh=VnTlvi9w4vT9PX72wgTL9hevlcfdOn/hzgPWC/rBkk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=TQiBgo0uZVZLGp7Smlio7yGqhVc9wPVGGNjXQLmWN2auIzFyh/cKWSW2S0VeqYGDA
	 ojjrjZggsoou5RcmdOB2dff5yh/5wwc/08md2TrAFJpC/RMFdhOFjbXAZ2MpuI7jAT
	 LQd8GAGqILk5U8R+9Cclurf3ppcY+xayz/9Beh2FXpb0sXRrhZ5tDcB9WGlAhCYKiR
	 waZbW/LRrHpID6ik4Got++k4aNe1JKwYf6S46jk6H83Kv+oNvG8YJkHfibAVbJ8VH9
	 r2Nz88A3AgFBUfnHFVDkJbXu2KPWviLj9LQ73qnEJO1LtkrpYY/cl5WE735qjf6AbQ
	 24MWorRQ0OO8Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4j9bZK2njSz9rxD;
	Thu, 22 Oct 2026 21:19:53 +0200 (CEST)
Date: Thu, 22 Oct 2026 19:19:54 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Indrek Kruusa <indrek.kruusa@gmail.com>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, Bjorn Andersson
 <andersson@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-remoteproc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Message-ID: <20261022211952.7293f8b6@posteo.net>
In-Reply-To: <20261022190203.1998156-1-indrek.kruusa@gmail.com>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
	<20261022190203.1998156-1-indrek.kruusa@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Oct 2026 22:01:15 +0300
Indrek Kruusa <indrek.kruusa@gmail.com> wrote:

> Hi,
> 
> I managed to run this patch series on a Sipeed Lichee RV Dock (Allwinner D1),
> in this setup:
> 
>   - FreeRTOS on the HiFi4 DSP, running a task that contends for the lock
>   - a test kernel module touching the same shared memory, with and without
>     taking the lock
> 
> The series is applied on top of v7.3-rc7.
> 
> What I ran:
> 
>   - probe: 3005000.hwlock binds and the driver reports 32 locks
> 
>   - mutual exclusion: lock 0, taken alternately by the C906 and the HiFi4.
>     Each side added 1 to a shared counter under the lock, 1,000,000 times:
> 
>       counter=2000000 expected=2000000 -> EXACT
>       tripwire linux=0 dsp=0 -> no overlap
> 
>     A tripwire field is set while inside the critical section and read by the
>     other side, so overlap is caught independently of the counter.
> 
>   - negative control, identical loop with the lock not taken:
> 
>       counter=1885761 expected=2000000 -> LOST UPDATES   (5.7% lost)
>       tripwire linux=100302 dsp=674915 -> OVERLAP DETECTED
> 
> The loss rate in the negative control varies between runs (5-19% observed);
> the log linked below is one sample.
> 
> Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
> 
> I put this test setup together with AI assistance. Sources, build
> instructions, ready-to-use images (DSP firmware included) for the RV Dock
> and for the Nezha (untested), and the captured console logs are here:
> 
>   https://github.com/ikruusa/d1-hwspinlock-test

Just out of curiousity, did you also had the impression, that the spinlocks
are quite slow? I did quite similar tests back then using a H5 SoC.

https://lore.kernel.org/lkml/cover.1615713499.git.wilken.gottwalt@posteo.net/T/

greetings,
Wilken
