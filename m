Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5017E411A17
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370836; cv=none; b=rrPe8fFBAit3/5jNVWngMNIPBDPC6NwL6y96b0R54JpHgcq2qZP4mzIzDOnl6mtYkPFMv+gDN6/J1CjVv2RI16UrOcmGtjHxh/CP/B+OYY2DC2bJWJqwbZ1BXvfkEQw/zc1PethHMi/N2sfzKEG//fNAdiEUCWuywtGV9EpSTEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370836; c=relaxed/simple;
	bh=Y9bpFOM1VUhnaOWBbYrZlpU+30dY39GCJjPIDQtXR3w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=T3HCKgmXTcqRhT3KUbECoZniJGIWzmCaNnH7dZi5cxqWUEher2liPeWEu5TrREZZcfrQJDTJ1gDKz2r8mPdldcRxQSBOLhObjKzQklwJhX7P7j2HT8BLqBkKdwoUFbOcj7ttkSmwJI6zc8gr7K+pAaPmFL6sh74Ok1u1PAbYoQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=m8DPf50w; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SrVzVUSs; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="m8DPf50w";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SrVzVUSs"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9DB4314000D0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:00:09 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 07 Oct 2026 07:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791370803;
	 x=1791457203; bh=LDG3xjPOJ2obgXVD18HUKbMq4LTvYDGG9OdLOFRm7do=; b=
	m8DPf50wuhguwYdW3zRPocZq96c03weW3wYv8iCddrOULN4WBw7StPKPb5H0k0+j
	MJmNc6AWDGdM1yjDJR93o6ixEfVbYZHx/gpq2UJK1/5iR87sgzKab5X226RdB7zv
	MXnvaDN1+GPSxpVSPEKR/taPFKhLbtWyfcaUu7Vuu3ex4iigpXARtFQ5aBCekCU0
	AHLizgNmX4Vk2CpAG5pytlKuZtmropm6qMTFvMgnrP8dgWq0ocAMntmLc3tg8XgU
	BaKEuzrePnwT6KIAZHdYhwldwu82tD2RpbRZWkI8FH4rEBHHS8NH2Ft/ObQkB97D
	u+rMUyDShB/oI0dQwv7oAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791370803; x=
	1791457203; bh=LDG3xjPOJ2obgXVD18HUKbMq4LTvYDGG9OdLOFRm7do=; b=S
	rVzVUSs8CQTBx07XpvR376VEFaFGMDX1AqrnuV8EaIuryiPoM3M7xc0Ja6yLS0JA
	H+h2rb9mqeOANOZv/AhPAbJ5pcfhKJx5+CVtf9p5H5T9IB7V/jh+fwbKkRAngFEe
	t/1U0rmN4YGg/PT3P333LruFcyVzp6K2wvqFpPAU3XHXiq/Olmp3SDHipjP+UBS4
	kUVAMOXGaM1ZyAOuzFvhNxEFDao41l+sBZQJ75r4SVf/NjniGAMdhK47DOlkzPUx
	yJJ75eAiIeqqHaBU9MsecFtDpLOi02peln+TiKfAsF4IvyCTtAzaeyn2he345PTF
	mg1WfJOuWNPunO3VhFAoQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791370803; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:YJWaAlZJTJD82vbCvnp44fxw64sCiqrTckraZLA88sp5/YK
	sweBSw1p2U/fbIkHA0RwLRfn5w6e8QSqPEAAh1ONzLt3eo0hgf8FzCHGWDiSNcsh
	F8r84cVVoTaQ60Jg0H20dNp09OnpSnDElS/Icxle56V8aUp/sxepJ2qnawJaCZZD
	lfHK0amEXgsTwNWNdKqqdQYDOpldOgNgCSn9R+teANy/5tP9S2yWASANBQT9cC59
	zYq+24Nj32Q9YapImdsYoeiBIJfplucZSXKobmElbPwrGOqJareqCloKhyCyAAuY
	bwB0VojExuf/TzUWTCIF1/GkYXljCQjPgaUTG4Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:vCT1nfdBQj3oXWwaSi3lCGALNtaYDGzayYnhnDtPRjo=:Y9bpFOM1VUhnaOWBbYrZlpU+30dY39GCJjPIDQtXR3w=;
X-ME-Sender: <xms:LSbGarkWn698_dJyqRA673k9qNZW1ll0_EcbAizMgFc7nBR32L6-iQ>
    <xme:LSbGapq2QfEImjVr-jSMpRTlsr7pjVkMrutbtRxBQiYXvTlCFHQvWC8xOMgE0Wx5E
    lwHJqazqEc96Tftiskl8Xl15DsWzICSDOLgInLCpr_XcFqT9mY1YCSe>
X-ME-Proxy-Cause: dmFkZTGEDCjvNfWDKrRH2lIdXWpDMQQKRGHdOAgLDdnvttQ2Nh/6e7YhPKrOpL13jQWw/2
    9hUx4R5faPZnfScnlXtZ/Ehvpq9grx2ik2bnnmb+uUIVqno40FnNR5Gzr59YGz/XV9WioM
    SCM7mdikVFll5h7hI4GYrdvGZa1pXTdewJV/N+rzujJQNrmcy1l//DEOPfnWsbsbSwvfJ7
    O/4B7ZU7y1BA+ZmN70Ss6qvH/KElvXczmM8ddR3ejWX8z7mxKFHNcj0LzmHwmAtnxTdlqN
    d6NkTBf9dfFGUha7ibheEVgO+laHUmcVaq2zDalqPHWEfTdlmO0tT3ZHb+m254FspA2Cj6
    2YNqndHibOYKpcPFOgeSmiLwKebtF4b1cRLOcmvV8yAid5+GXr0Tih/mtRDn1XHquHeVCF
    nEbTVc7GmutpR3L+jpqtEDM6Yv7/pBqM39w80GlMPx5MVtHSwU/gXavOt8T4xDFC7bs7OF
    vT+/wHV1eIw9wO359Dm9BZqmTefBGjSkPLB5kmsC2q4ZgUKK+iRoE1DrRkIt3opdUTQDp7
    N5x+gNtrWSaXGjhVwHSYUTTMZDj/0xSz1bLfje6X5EHP8AHSBy6NRjoOY4g7IdsOZ9j0M3
    kuGoJYa1EL++lxEnlVN+6UKpGjfHc/2qOlpdkr745xuCTNMO/wlkuxLgdNpg
X-ME-Proxy: <xmx:LybGagcSU6hl5pS0tBYAdJuwpHk0nA1F1Q6k-0yRtXruDXVXG6C_PA>
    <xmx:LybGapzGllSG-2QI_CHu-meNz9wkVTImQp-pdDwXkQRnD4bg7dnsIg>
    <xmx:LybGahLDHfWE2MQJ8m5MKSbbKT0oL1JhDySJ8jHaWT2t7P0IkzS28g>
    <xmx:LybGaiuaOT91slmt37NDQcfa0ZKn_h-OrlrxE0j305qdtjcbFGY2zA>
    <xmx:MybGau9EEJ20Z9m3dtOrYclxAFB15Ww8GYwo1EcO1Z6x409JXUJ4YTmh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3BB9F32A008E; Wed,  7 Oct 2026 06:59:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AICZ2hJ9SF6o
Date: Wed, 07 Oct 2026 12:59:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "Stefan Kerkmann" <s.kerkmann@pengutronix.de>
Cc: "Ian Rogers" <irogers@google.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Arnaldo Carvalho de Melo" <acme@redhat.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Eric Biggers" <ebiggers@google.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Message-Id: <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
In-Reply-To: <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
References: <20251016205126.2882625-1-irogers@google.com>
 <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
 <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from packed
 struct to memcpy
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 6, 2026, at 14:31, Marc Kleine-Budde wrote:
> Cc+ Arnd

Thanks for the Cc!

> On 28.09.2026 17:39:15, Stefan Kerkmann wrote:
>> Hi Ian,
>>
>> On 10/16/25 22:51, Ian Rogers wrote:
>> > Type punning is necessary for get/put unaligned but the use of a
>> > packed struct violates strict aliasing rules, requiring
>> > -fno-strict-aliasing to be passed to the C compiler. Switch to using
>> > memcpy so that -fno-strict-aliasing isn't necessary.
>> >
>> > Signed-off-by: Ian Rogers <irogers@google.com>
>> > ---
>
>> Is this an accepted trade-off? My understanding is that the kernel is always
>> built with -fno-strict-aliasing, so the packed-struct type punning was well
>> defined there, and the __packed annotation is what lets GCC generate valid
>> code for the unaligned access.

The previous upstream version was the result of endless discussions, and it
looks like changing it to the memcpy version was premature. At the time we
unified all architectures to use a common implentation, this was the only one
that resulted in correct and fast code on all architectures, so I don't
understand why this was just applied without including everyone who was
involved in coming up with the version that was replaced.

My feeling is that we should just revert this. I'm not sure about the
motivation for the change. It sounds like this was meant to be
used in userland code, and that clashed with assumptions we make
in the kernel, but I don't think that is sufficient reason for
regressing kernel code.

       Arnd
