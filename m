Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444467;
	b=OVluY3IG9mGVwTLEoSnF4unfI+oIPlQ9b04dLCdjM+L9SI2HtYxN0bBer7bMXf50hKka
	 hj12jJRpxZ+QdshcH0tOHbNdx+Ke5mjP4FafXJPMre2tmHiodZrlOFs2As2KZ9/BZSMP7
	 CoTDAMWQgaCNdqlA8StYuXNaFlIv/riTFzZOY84b8qIV/zxUx6kDNIgdqJWFxOsJrb8LL
	 Y9uLxkO41opqLMGmOZZWlidbMVZSO9RjaJ4JgAyuMfu7untxgaGKXAPWijnjKRDV6Z6ns
	 eP3kh92oeTWMHndk58dHROS8lwobglcmthktJL7lw8kxN0GNpRKqY73XilnAlM5dAgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444467;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=tid/0wR9gci7Dym5NPe2+TVAuzRKy2oUwD3lKfhNkEo=;
	b=B77qWffEBFdNB8YLzcJ62agOCEZ2Qf48BCBQnMb7UJ9hQnAv8NF/9z6OBhofjrTqetd/
	 Lh58ldBHaGULGEZJAbpLvt9wfb5nqkkY9p2m1Ri5VzpHMzgpzlmtHrXFPJzHUkV2R8Bga
	 koWIEQK9ZbxXE2yU0V0OhIZvTfp0fcfPpLPy5EBZkqYb/LYdevpcJTCIJR9pEfhdRbhD7
	 Y6XVY3EBCSoOAZ/QlufP470MWcXkIJzEZ4mLyKM2BMvaJEjsxjvMbdEWhxwhZZOSZOBHa
	 eRfCbAY+HuwexU5cEDjJVTKM5bG+Ax1g4Vfj4KHeuXAAzQYg31Jz2vCT2BpCXXcc5OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=CwOyMgAT;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=t+2esDFB;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A90606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A90606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=CwOyMgAT;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=t+2esDFB
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EC3A01400093
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:14:25 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 19 Oct 2026 17:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792444463;
	 x=1792530863; bh=tid/0wR9gci7Dym5NPe2+TVAuzRKy2oUwD3lKfhNkEo=; b=
	CwOyMgATDZFny1of2Q5z7H8k2upNtb5NeeVZnnfgtoCM8dEzFvsbmrEEo8ciLt3C
	g11RXUvZg6AvztpkXlxgIVBsrz3FZxTGRmgIMIOI0JXzOp33xMgPZ0Cu5mPXbDNC
	gWfnIXzQQSKILedp9bTtDtiLmLRfzB0DQc3VnBsqmTe6GjEXz0v9PhyzqeVxT98z
	ZLTI6MWJr/8TKMER2/ma0PV9/Yu6SnaxpAGUfLuCfZKWYJiSXTplPn6U2AOOrIAu
	tE1rri49CmoCRJZYZs0bkpCE4vFc+CDAJlakglhMsiYCU2N6vwe9Ram1DAavhQhM
	U3w18HC7G05ZJIVIXCygzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792444463; x=
	1792530863; bh=tid/0wR9gci7Dym5NPe2+TVAuzRKy2oUwD3lKfhNkEo=; b=t
	+2esDFB1d/fvi1my9L7+zSKwY231hr+ZlIB3Tu3XdRXsao2sLgMpP3NfvTVwefs1
	uSw6Dt0fPWla2H+0HnGqUqxTLsHIMI2bUxL/RxM+WoR+CFxyebfsoxN2P9R5nzAV
	al+ERRu/hCaYFR9rH8NdiTwCjrfmP4QtkleU7D3X8uGSIjZ09BNfuUvbyzdXVWnB
	510dziW5vg4M5qXjiubh+2laZ1X2HgG5oI9+ndfjCldlQ+0DmGGyeLbi4skVLwCK
	dF5uJ3HuJfQfhB6PI32fACPz6p3o7YynlEsQMyAgD6UYtKeDdkNRJ7WxbY8E4Ul6
	vxRRM7VU8l+Es/BusH/Vg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792444463; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:oxWYf+GFR0seBqS2QPS/lG5+vs3UJ69iWfUE4G6fLyNpb3j
	rwh7xIEX+V7DcQVWiO7E9jxsXoZGReYMqBfyianOddpWbADV2ZCWhoArC70l36mP
	LQINwZdn38RT6M+lDsus5nrpvEbS8ImvqpS0pQXNCFGIn8CviLOEhnZX6GAWYeEO
	uNlWKugezr04VWR3c7bDig5Hrn4EVBn/aMfHOsirtIgYIm/PgA6JUgkXXRUCDrG+
	qAfeLoRhDoJOBrVH02hZRORaP7XSmQWqBwL/9KKkkEeRU0RT/qhNGPzcHdlRtNOW
	LEb2l19QP0hPDfi150MqaVoeuejfd8egvwri6kA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:WJ4WD7vUUEl+/GC8iYTXIGLxWVtoRiBkH0u/OosubpA=:tid/0wR9gci7Dym5NPe2+TVAuzRKy2oUwD3lKfhNkEo=;
X-ME-Sender: <xms:LYjWana3XnckBaf_8KGySPrM141_AFRsd21CF3KN-88DmFK4ke8x8w>
    <xme:LYjWahP1fjyC0D9nQkFpnAvBCOju5dux7pEwV4cxVLHDDCXnEtjWHbxbovsubEMQE
    0fY2WeVpkS4MPbIkkODJUa9G2K40NwxiV3Q6yUBvTCgqix3DlTvleo>
X-ME-Proxy-Cause: dmFkZTEgwLWKnLfT0RFcN3MwWmEF+vlyR0j2yjApfmzvcPJibc1KkLKldJoatHnE55ufI0
    R7m6OuEJriwn55dPEdi6IWcPrzUDQQv06TjIEXc9NsJQXr6DJlsAHWmRcM2o5BB6Jz4t8+
    oGd3G/DlASXMku6y115CGI3qP9C8tlFQ32aJO7HZ+ZEQL5N4ilHod3an2vD03qRD+nyTL1
    5RB5GCLCyQA9dtWU9H6bxqZTYqSFot7vC7hmf5+Rrvv3ckjuc7ahvFWROdU5lcQXd1Fxco
    SyCCbwZFSpr4m4eqKH8NQrwEt/tk7Db0lvQBd1JB3dI+nf1HEOOxuWKmSpQs1o82uEb1Gx
    jJxEvQ16kxs0AZFTseLUVH10RkaQ/ksTCs7JDucTnU4rkoLy06OOJyJo1fId3WGtxNFoh7
    l9zp5EdkNSLgGXUI76yI6Ms+47tdq622GnnZLYMemPdl0GtMuKHIw4O4BztGtq5uveR19w
    Ocmg3eUmKbB2AdpKsg4WRu4zeMinBPYZ9qxsqbdZuJnQwEd2zbiie1+ydx3EDcFWptjo70
    NcYVLFSnDc3rFR3Ml2RxBVF71ttPF+rHpyQBZu6Vjlho2NgD7llo/JYFiutUqHAygEey29
    /iV0QVxgFH0OrW4Ot+dVVWhK0hQaZSwB9yckAJzUxpZyVUH0oCoXYO4Ae3bQ
X-ME-Proxy: <xmx:LojWasBkN9-YWUYz0CjxxoZ_l5SF2R9tEmpoxR4OZCWQOrlrMvwU0Q>
    <xmx:LojWasVzOgnOCWwRGC4zaNxr5hHxluaSjLNfVJ2dwbplUmYGgCRrjw>
    <xmx:LojWaqB-w65yTOt4SAD4yNFN9WhUMB6_PDfYHHZnxVjB2-JL38I8xQ>
    <xmx:LojWav_3FtdLO3u30GfnfmKLdkvjBeARbNfiEEyMYCqelEncbLVeXA>
    <xmx:L4jWah-rv9xVIsSA2br0YTuzAxWJ3oFaKVfCiUaHGhTWYSDbSGJeOIDK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 59C4932A0097; Mon, 19 Oct 2026 17:14:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: Aql69pYtqFbw
Date: Mon, 19 Oct 2026 23:14:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-kernel@vger.kernel.org
Message-Id: <39fa34ac-7d01-4a73-9c8f-d6669c471fe6@app.fastmail.com>
In-Reply-To: <20261019165015.2656521-2-dinguyen@kernel.org>
References: <20261019165015.2656521-1-dinguyen@kernel.org>
 <20261019165015.2656521-2-dinguyen@kernel.org>
Subject: Re: [PATCH 2/2] nios2: remove 64-bit division
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 19, 2026, at 18:50, Dinh Nguyen wrote:
> The NIOS2 is not a 64-bit platform, so there is no need to support
> 64-bit division. Remove moddi3, udivmoddi4, and umoddi3.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Did this pass allyesconfig and some randconfig tests to ensure that
there are no hidden 64-bit divisions that need to be converted to
div_u64() etc?
