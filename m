Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935360;
	b=5VWrxbDR9sStqX6kRknkbNwS01GvRubfa0am77CkabAri/mwZ2JZS1GQDQdrTQ+xWdXj
	 2nHIQFDaju/n8ntZ+cU2W19emuRL70vCKRovTuHIvFehXZQGaQwM2/jVMJxoKqEAaHZqI
	 h8LXVHdH4BuNOpwWwsg40BPv+Pmz1CqwurlyWWv5Mp6hdEqrLslSMrycoOysTb500KYBS
	 Kdn8wW7SvnHJhyq1MYV9eWeueRHS9RXoveInfm1utSMy+kojWDv9+9Z9zM/yShJqic3TJ
	 gm2n7IxOuMWdN7y5M9U0oTcWZC2tR/9YI0yG69/86/mWm3fDC1e210ckqQlQzjt1lzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935360;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=3rh0oN1rwSepn1uG3PqoTw/cHvIFRoCbuKjKyerzXVQ=;
	b=1lpgPSwQxtRAHia7w2UihW5fM8gEL36B/NM7Z+rxPsHHDDegV1b80h/bGY21DN6hW+gz
	 qSx+RgWpV7yQNmhJL3H6SUwkPZ4dlvOlJowQeHJtxxk3FscLi4JLu7fWsACPRPE40+FDe
	 6KdruKg4IHkgv9GigEn/nnTS/sXhBE41AjitNJWpkXbcA0IsxPYBksaLX1bePH7G97ZCp
	 coGJqLhOhfR4FhdV3TlJ1q4gCy0ElxR3tovPILGgl4PlTLq8DzK8ahmHOfNlfrdzWPfnB
	 khUf75SGb6OehB6kkXFxgz1J79VfAV6noc1McNkIkU90Ie0AHjGqL/rX7Qgne/EZcTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=C1akDwDg;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LD7An0Fh;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D844606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D844606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=C1akDwDg;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LD7An0Fh
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B86531400018
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:09:18 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 17 Nov 2026 12:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794935355;
	 x=1795021755; bh=3rh0oN1rwSepn1uG3PqoTw/cHvIFRoCbuKjKyerzXVQ=; b=
	C1akDwDgLAoSWWZ+Y9RTvxunpnORlJ+xZldBsmmVUIxI0MJ732bzYtRen7ek95UB
	iynE5elJgrkhYTn/C+eAbp2yAys7gAPHJfSeoPeG0Ydhp6s0xXJDJiEGYQBysq3H
	hE9cZ5XVzP58wVOZIqjRyQtOjvsC6KabhS0X8zRX7LPvd06h3WupkTCr2zhxlMeH
	F4kXHq9nfkJSe3kefFUYM16lxw1996vxcFEvzvlA6Gy29ffdB+DqZb+/CClhGC+z
	ypSSCrOVlpKeE8N1guA88TZPRDXlVFRAKPAbumrg+H4KYRUeFZY1Fsc5nC8Ib88P
	djsOHJfxi9AAjnzjv5riNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794935355; x=
	1795021755; bh=3rh0oN1rwSepn1uG3PqoTw/cHvIFRoCbuKjKyerzXVQ=; b=L
	D7An0FhLZ8GhXJ4MRLAaf9wmBf/FkoduU8NaUzY9K+/+EDYi8msvh82z14vikIk9
	BQInStmHid9fAvrLu8xtQs3K4MhF5jj9Zuxr7/jtK9tj83nbaROi/WIan4APp/2j
	2hEIrdG4NflbGShwiO8VtOexhgmP64y1MP3BLQG9CMyNHyJGBpFxFemHJOjuUX1/
	vDMPm69qn+6E6PGp+EtrG5iKZ6iV1gjZqfTezSyV1EbJ3KUnyJuapzCQ9XUVFeIL
	wIaeIlHNNYw0Vw/MENLG+i1p2rmh/FhomofC3pQL1dHdn/uI4NAj/33sgB1dDHMF
	E07tt2nwTxpjGEa7GZ/CA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794935355; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:C1fa6VIUkEbyl++Jaujz6DsyGtdx0HzgYZ6g91yaALs4K5d
	hVhYuwAcE9OKeCrlOOOwvk516e62r4P7+UCPAix8AGWzFogQxRNsN69Q1qg3EWqW
	qK4W3e88OK/Q/KC35/erNGeOZ97Mm37vSuVrK6Zb21oMtK4t0tSzDZ9ZEo1oOE8t
	PNT8/CvKHG88jWHOYjLy7nG2Ts1W2RynLPYGkEY/oZ6KZQuVkqNWzeuH0kFfgSkE
	H58ySsrJMP7FuWGbq6FJMjGbfjB5WvSniME9QxQr23e6UH58cLuRNaaz36ccq1zY
	ZygBKnWPUtMx2fTqtlOLX0S5iYppzmW6mbHXdDw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:x1a9SWdrRjQ639On97onrdp3uHcwcIHeo5uo+qr1+Y0=:VYpLXwXmpGMm4df8DL9uiPYUyDNCU/Hd4EXgF0pBJDs=;
X-ME-Sender: <xms:OIr8alzvE52xcFYcoK4ZVZwlBN-7dFG-WRYofowYaHvKrTKzS_BHvA>
    <xme:OIr8agFm6BYnoKwl2_1LFTapS9q-fyRKSt8owWBpFrbByduHOPV0TJPxhAurwrqxP
    20MvS07qX4QwVA0MJ2GldC6MKHBbuHRvjKU-tcz34A8t7x6sWKpDA>
X-ME-Proxy-Cause: dmFkZTGerP10Z4IrsJ5o710MYyaV9m1l8qVqc5TQ3mny2kRUtDbW0fk5RCGziJ5Vvb0Y6R
    p9yalvvqZlDC9zQvLihl4S7eGOGXKcjNbk0RNZ9kBz7Q8wHmK2IQyviBnAPjGSsCKlHAFI
    CSmiuuUh4YwXlV6li12DndXs/TjlTIgcnR+AltyNRPu/aJ+zFN9eKI7ZvWyTKXhpN0aH2o
    1vmzCGXY69CeoVW53enKe72mFnEOPtMkF3YC3jBJBHoMSgqWw3xoyLJ7uBv9HfB8vUugrJ
    2DUbzbPNhNlYFWml7y6tRHRj6cLxOoVkU1GY/pjOX+nMyxE+o77un9thWr2csxBM5UfORB
    /Uvhfck0hcWUl+ON7mj+K7JzZjjlUDgTsfQQM6BFj/4fPLBAOVxMVEwjSX3hcQhwX1Dxve
    aPMDONnS2SdkcXLJOz8ej1E/8ew5RlZ+f/QLtVfQGJzuFfMqhHunTiTeQIA0i+RJSibW+2
    kxFlB7mEXds5e4IK25S9cm/bJqyoFGRel9WoSgGUiVRhhwydj0p/CA1FZT5509OnCF/lOT
    u+zFuwzIFb5RJ7cdNtES1Xj7lq6sfLHOuOH8gG91wPsYKpiY93ewu/YChpsJuDeiZ5F87e
    Shpso1EG1TPo7OpkdgrjYBU9/9Ep4x2/fdl4C+Gs0W9+E211BqX1Nvh6aFaA
X-ME-Proxy: <xmx:OYr8aorwuCpdwhcGmJtr0dp-DRr2mUnGhJTd-DgGRrTHgfxkAGFacg>
    <xmx:OYr8avXUwVLnOTvhVAELg84NjTcJuelEORIsC838sH9tTzPWEjQ-uA>
    <xmx:OYr8araebHHOS8QB5oexAOyOZSYjWppr6-kmDe4bxj4B7OuBmfwLSw>
    <xmx:OYr8akd37FdWZsBOhcs2zWcRLfJnGOhGUZqoBBIKlookY60UNEKtBw>
    <xmx:O4r8au4zoPtoqLk6SK-MBy1N2bOnI65YQcTJw0yojTRrTJi5l686cIee>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 330A732A0099; Tue, 17 Nov 2026 12:09:12 -0500 (EST)
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
X-ThreadId: AAuH92PldwLR
Date: Tue, 17 Nov 2026 18:08:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vineet.gupta@linux.dev>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: "Sasha Levin" <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 "Vineet Gupta" <vgupta@kernel.org>
Message-Id: <204a32bb-122d-40b1-88f1-73fd2a6f4b54@app.fastmail.com>
In-Reply-To: <41664890-337a-402e-895f-376c941d83f2@linux.dev>
References: 
 <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
 <69073cae-ced9-407d-ba96-e55fc7635735@kernel.org>
 <41664890-337a-402e-895f-376c941d83f2@linux.dev>
Subject: Re: [PATCH v3 0/3] lib: Add software mul/div helpers and use them from nios2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2026, at 18:05, Vineet Gupta wrote:
> On 11/16/26 5:19 AM, Dinh Nguyen wrote:
>> On 11/10/26 09:58, Simon Schuster wrote
>>> ---
>> If there are no further comments on this patchset, I can pull it in?
>
> Sorry got busy. I will test this for ARC tonight. Also can this go via 
> Arnd's tree - I can post a followup for ARC which uses P1 so everything 
> can go together. Or he can a stable tag or branch of yours, whatever works.

Agreed, I think it makes most sense to go through my tree, I can then
also include the openrisc patch on top.

Dinh, if you send me a pull request, I can merge that into the SoC
tree and you can keep the same commits in your own tree in case
you are worried about dependencies. Otherwise I can of course just
apply the patches directly.

    Arnd
