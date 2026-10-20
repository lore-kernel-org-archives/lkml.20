Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500976;
	b=W7kqgnqQcSlvGBFrejicJ+tTO2n7aR9//QvGcCGCgMBgOrzPTo5tw5egawQCTH4hswpA
	 3o8KrQxu/Dqk9pu9zxz+lQwM9t79B689ZkMPyYqMHSHxrCyQ2nEK2m+8BBwyE0JFGPgp/
	 4UZWamoAWrHHVGpCmVqaGVit4433UgLKE8Wpr06OUqLjHSjZzS8Y6J1Dv4xQ4uZexQ2ys
	 7mhUxvPCRuswqbblVpn8iVhEAwsPry1eHWiOctYg+lrsp3RPVessm0rXjUnP6U2PdjdpE
	 6QjHSFFjkb61KbbyDgwbrvA9KBwRt34AMsk+mUQ+/j5vMv3BQnCXsV5wjMmxiTTcjqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500976;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=SXoabNCBpXWY972AjYe7CTj33L0+E1gJGkd+B00/CNM=;
	b=LIZY7ArF9NGTqkmhf8Fkvm3oYkHC55iDyDOGYd8dRMENceeuLEUtfyz1jU2kWEGhm/fg
	 KIX3OsiGcB/EZtp04J836VB7Q+6+Da3rRbeMarAKoejL7Dx8cF+OAxy/R6hBl+QjqRtsZ
	 N+cni1KadG56E/4HIR9b1bcPg6MC+POKwYqZsuZLllGyQTNz/wF6CoGEjFGkoA9gafDRz
	 IYCpxXQwyxJ0gAGyBFfxpeflkzp0tYJRTeESGR1wgIzfeFvxAoFS8mH9bAUoa7PmYgls4
	 FcPQtA9vsNA6aoMuSdIsvsf8Hiyk2tMjGluxpyGeom42hXpqJGGOe+ClsccavYQEeqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=D5tu8U31;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=uRdAOKbB;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF600606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF600606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=D5tu8U31;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=uRdAOKbB
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E83131400112
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:56:14 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 20 Oct 2026 08:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792500972;
	 x=1792587372; bh=SXoabNCBpXWY972AjYe7CTj33L0+E1gJGkd+B00/CNM=; b=
	D5tu8U31hYDC4g4cceozjgVt6NdB2azCI9reXN6AvbPmEPKebmJzkilXLyovly9P
	4z1t/CJBT2FpmXcS8oHfSWRGZBDSkrS9pVZAn9nTSVI67yp8Oat5dFvb/6n1nDT/
	0bDdIQQJNXPHmxNqx99gR10B34L8XzLpV3Im0vM1fwC+yFSBKkZDQH9tkaZlX2Wh
	mpdTr8HxH3FkHZpr5fmXhugHnfbECmRb9+cPOpOedXvQRNq5FHjU+hZXEuht8lWo
	1qMuup5FBSfh53UvEiZHql/a6TCREF3Nuxx1M8gUU/nHA0ozfsT4YNlZapDLiy/O
	Cns/D9yF19K/70cfkFOiMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792500972; x=
	1792587372; bh=SXoabNCBpXWY972AjYe7CTj33L0+E1gJGkd+B00/CNM=; b=u
	RdAOKbBhM+kYcTEMM6Jx7MF0Vt2VINlXHFjSQNC4rcICf8gdD4QukPOzlubAi82G
	5xOaOAcPKSA0xZC2mOivoWv5z8U+vGGTM62nGTtRl+l0CGKSStpjJOH+fAFAvCj+
	1KIRYJehCcDbOWvxx06LcQeCkBeIFyAQsMc5z7aSAAoCU7HMvqaOjeUF1pHHZ9nT
	L4xRGmZUILBGjXn3H9ibB553nO4Ylje6PfCg4B/vcCbvx45RFgzwcPoqjMOba0ey
	xEcGkKIdC44qfZHASlypGZdkUNa77pT3MiyAAdyFS7Z0u1QEJfep/bY697/L7k01
	N/qyIu7llQRAUWM4tKdOA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792500972; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:ddFeF9iTPP3yfJqYCM2Y/mdofl77DnPlCLDy3tUBsemfElo
	QfoHyucoaN3y4KRpKGzFcagQ30EknTCBEH3uQSEPl8f6VUIwqHiyTO/vTLuFYyTK
	9D4M8Ts4sABdKUxAZ/SlZkMpWLFvDNKb1I62+uvvLfoYQOASRLTIu3y3wmSjwgQC
	gjya4F7eb2DJGv4OAmGGO9KXq80rkfAonnUqu+F/WiffigbaW2OvXwqg8VHvcuXX
	FSzN70amSbeJ7rvc4fzQDMNRWXvGWf2BsCyGCoaq0teGZSm1bGQF3J0M6az8zxNC
	MDjQl7TE+ighlCbjf6R0uUG2s1O1HjYdhIjgrCQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:IFabPxOamhNEPaeded0prHBL8jku5xbohBFcm2kbLSo=:7sz6wY5SsOdRusF59xh0L9hSlzbQNWM5qE+MHIjXNao=;
X-ME-Sender: <xms:6WTXaqTgkVx9GSi1UPnvBeweY-_hDzcsTESs77YKQ7UQYW4InBYjWw>
    <xme:6WTXaqnRrqRAP9QUGhV_rSEZJ_pkkPYy4PVxwfluKzB1auvV71bdkfrW_0kk9KSfE
    uGYuS9qkzvz7KuGY__XHgVETgxA7AkbEfbx5yJSK1pNeIr-qEEh3h66>
X-ME-Proxy-Cause: dmFkZTGk9R5NPZiX9BHT1MsG6xf2V+pHdindO+PVm32M8IwUrLEceaiP1g/a/IdoNTC4cp
    FuoS+kLaaStY5EXTW8kjDN/LMKhO/YKo/VRX6Aung+ArFYDml3mxr35k+k5hbZ2CL58xj6
    lfRVonIM+RaXNoUJ9oml88WGcAFyGNckIfVt3730nCnInhJ1GNGGadGoTzq6EVOzBadIF0
    mjPBegAd9xJlc/SCc2a7Z+i7w0rgeJYWuxUaZR39VpBZV+hjFOkpSn/Nz780d6OpTgHK2j
    0XBTlNEJeQmNIW8Nk33bLSOcUp76OdaI17Z9c1y5SBxj9i8uFf7x8V8jjJCsyptmCkAhKJ
    fUA2BBqz9rGzVl0H83A/GL56m7uXXRk4nTr6BOD/lcFs3WSmQLGG3aJ+menDiGAumLoSFx
    LLB1ux7otHTwCObsRq1XolhULQmthfeEAs4Rp+GrLEzNk87idBkTFOGMq70uFaFlOUShKC
    XgJ+uPIvfkV159b7yhsHT8IOe3aa/GgXNyFkUk4wl2Vf6xLxitwIDezchqd9wgunBxA1G4
    DbibrpoNWYxeNjnIm6lj/0+0zvPmA93mAuE58qiVtUU9e9F8vvr1ZI2ARRQE82dVtIgLbU
    zQbvEN69e17BvSHZcgcizHzUJl6JtPUCKHHag+/3xJqw3H1cvVJB8PGjh0Tg
X-ME-Proxy: <xmx:6mTXapX5FrECtzU-ru7Or3UrtAjbAesmymDmJOc4bdJFxz7mSQbAIw>
    <xmx:6mTXarFMAdwiekYNU10auqtqJSyviU-8h8xzqJw8XyAPy0j_Az928w>
    <xmx:6mTXaldqtj2MVpz2HJz_ZEHFPNpJEVxJ2-VHxtEu-k9DNVAZBYqyfw>
    <xmx:6mTXasLKZagPgGUagl5RorYBPey0b5FBlxUctozbflJrnmymxiKVYg>
    <xmx:7GTXarw7wmKPOYsDLIjuZjVvqXcZeWUTkY3bGSyftTn--SgRqMy1XnTm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 470CC32A0093; Tue, 20 Oct 2026 08:56:09 -0400 (EDT)
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
X-ThreadId: A0r3NTwFBk5k
Date: Tue, 20 Oct 2026 14:55:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Cc: "Dinh Nguyen" <dinguyen@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-kernel@vger.kernel.org, "Chung-Lin Tang" <cltang@baylibre.com>
Message-Id: <426c73b7-b4dc-4b68-9aa5-6145a13280bc@app.fastmail.com>
In-Reply-To: <20261020123149.cyjzz4uo25oiiu2m@dev-vm-schuster>
References: <20261019165015.2656521-1-dinguyen@kernel.org>
 <f13fd39f-1ba4-438e-a1f7-fe4184adbc26@app.fastmail.com>
 <20261020085630.w7je2ev3f6ectshy@dev-vm-schuster>
 <686f4ca2-0fb6-4a73-9cdb-0edcccafdd62@app.fastmail.com>
 <20261020123149.cyjzz4uo25oiiu2m@dev-vm-schuster>
Subject: Re: [PATCH 1/2] nios2: remove libgcc for lshrdi3, ashldi3, ashrdi3, muldi3,
 and ucmpdi2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 20, 2026, at 14:31, Simon Schuster wrote:
> On Tue, Oct 20, 2026 at 11:41:59AM +0200, Arnd Bergmann wrote:

> Wouldn't that fulfil the requirement as well? Only "vetted"/trustworthy
> symbols get exported/linked, while it is easy to add additional symbols
> if the need arises? (If we gracefully ignore the downsides, such as some
> degree of brittleness such as implicitly assuming that all
> dependent symbols reside in the same file as they will be switched
> to local, and the fact that this is a hack, and that we tie us more
> closely to gcc on architectures using said "hack").

That would work, but it would add complexity rather than simplifying
the build system.  Generally speaking I'd always try to do whatever
the more common architectures do, unless there is a strong reason
for it.

>> I also found a similar implemention for m32r that was still
>> GPLv2, maybe that one works, see https://github.com/gcc-mirror/gcc/commit/38b2d07632#diff-4de4f3b573100be00cf40045c85faaca8ded1f13ef80df1822889cbd6ad639a8
>
> Nice find, m32c-lib2.c seems identical to the modern nios2 lib2-divmod.c
> (save whitespace changes). This already covers:
> __divsi3
> __modsi3
> __udivsi3
> __umodsi3
>
> Regarding __divsi3_table:
>
> This basically seems to be an array of 16 x 16 (even though its
> linearized into memory) that caches the result of row_index / column_idx
> (with divisions by 0 being assigned to 0), so "reimplementation" should
> be trivial.
>
> Regarding __mulsi3:
>
> The iq2000 target seems to have a GPLv2 implementation; slight
> difference in declared datatypes (iq2000 uses unsigned, nios2 uses
> signed, I'd need to think a bit more about this), but should generally
> be viable.
> https://github.com/gcc-mirror/gcc/blob/releases/gcc-4.2/gcc/config/iq2000/lib2extra-funcs.c

I now found another copy that may be even closer to what you need in
https://git.openembedded.org/openembedded/tree/recipes/gcc/gcc-4.1.2/gcc-nios2.patch

> So we should probably be able to assemble a libgcc-free nios2 kernel
> runtime without the risk of introducing new bugs in potential
> reimplementations if desired.

That sounds great, yes. Can you add the C implementations to the
architecture-independent lib/ directory with corresponding
CONFIG_GENERIC_LIB_* symbols? That should help create the a
similar patch for arc and openrisc if we can motivate someone
to do that.

      Arnd
