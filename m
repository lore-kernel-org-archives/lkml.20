Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485760;
	b=IR9oyta/ssLvxwoe4wkdrQo2UwNqXwJk24pyv0dA1+F+A+/WdvzCETDbrrZ71JIvpfsK
	 /d3BKO9dtjnCwQHTqMZpmnejBud99hEzYAeqWqoyiIUbp1StoqdytmbqCsxuB2CsHXTOO
	 Ev9rbQGDMdJh1ADP9Q1/6zRdQsqEwfx3aevzVQdZ1l3V15U6B1E4e/i5F5KtdNp+DINAs
	 k/G5plGHtvoVzAm/t8jVfXtsfnyFdsYYdTdo/mko5+a4iQapJ929mwQ+G7LACVrUnMuNG
	 c/v5R3rRaqb1NMPtdWZz2pomyToWnwTuF/d063qvvOZLG0hjjdxbvGSK2W9sA9+povA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485760;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=H57ytD0SmhwH0dCmn6m/3ceBeTrNWXNPToOb+n8n7Hs=;
	b=aQk8G82OnbC8zYsq9q+h85miCGYvWlqS5GIekcqwJlcii3OfWTjbd2MLpi9QugPjoSjp
	 XjT2d2m7lELDkMIi9e4m2DJWVR9Fg9J/zZWZj9bSFf2NpJvtuzvrcfjHnTBj7AK9AkdFA
	 ZkLiF+Q4XPfaubE8D0xhJkK2TJu2DS2Q0xRwXiMGkZIpi0J5V2c5TV4GCn6d/u1W920Pc
	 YaINxrC0dyjbPVGJsLljU5FRRfACczWW58mOOM27CfIE8AfBXf6FOmqGO/ypw0sHgAoL/
	 4A2C9PeD85rBpdtQJ+0jS9FAvOqRGaSbkahNbywSQ3OQM/TJ7y10lFEcfy6HXdoRePA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=MM2MzMop;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lAmKOqAA;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13786606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13786606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=MM2MzMop;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lAmKOqAA
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2BB287A0151
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:42:39 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 20 Oct 2026 04:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792485750;
	 x=1792572150; bh=H57ytD0SmhwH0dCmn6m/3ceBeTrNWXNPToOb+n8n7Hs=; b=
	MM2MzMopj6g+iMKfDvPJI7iexbnjjeA8F3kbcSR2aRUai+hZrwTZzoYnhmLY4QRz
	Hq0OT0wJjwFoPeLGel6IMzd5vY/Y6FvR+y7IMiSJfLSS8k1i+q6NrHtkVr4GUBye
	yna/X1PH0mQ20nlmM9rcfXfV+D9XtfH0jnH8Tx5WRkab8Nq5YGMeoITkP6hGfqNJ
	jFKOp/Oo6yUW7dV9OSiz51dpi1Srjs+vRsvSuxutSQP9bkLZpRnnHfC+ZuLXNPVq
	S/+RxIB38/2BIUlsxtmWF7p4n6ksyNXiL4JJhXG1CcQZjFL+/LUjZZT8S8S/9I3v
	RcLNy+Btg3k58QFVxbxFdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792485750; x=
	1792572150; bh=H57ytD0SmhwH0dCmn6m/3ceBeTrNWXNPToOb+n8n7Hs=; b=l
	AmKOqAAvvWpxqu5+mPIFkg6jQ7wziG9jhSsq476xc24yAjbmjWpmkoG/C+cgozyE
	0ppW0bj1ZqzNbABR/ADj+d3bdfq3+5+oqKSCuuOa5b+XpO3gnljlTLi61dOnhrKM
	PdER+s3BtzwMjk7PdMP4qK5Ou4TT1oITKo1w7AoDUlt+ggYRYd3V8+V9RFLdoDkE
	90ZvEBHC80lFQdrnQQtNKG5fZjqSCzCt2DlAicYsL3EA+pZLTOigVXV+lskmOvM/
	b5SD2UkoDrobxuAth9qnJ3CQyQlzLGnjzaHCUicKPJIaGqSK4tvRNbEIObL6POkb
	UUiPeX/rCD3asXzOK+FOg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792485750; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:VVkb2QsCCkXseZi5YSaf9uD1TorDmc178qhxJd8sdmpUrNM
	d1OzBs96iUMeM89juswG4GJjizu5qNFdQ5JCxrpqWx1lzJ60C1pgmmmdSUtt8aCf
	gOlkVxCFfsGauwXcsgCudHcG/CmFKjrP5F4TfGHjkOSOOKkEjv07bq4DxJ9H3zdn
	huXPawHhKsISDv1DlBRy07q8yLIHU5UR7p2BSx2pMC/wTQAfB7DXEzZbi+1KjyiR
	AOoTHzM3izmT0/t5Kg7yW3bRBbL6okXPvWLMnWPGsp5siOBtSmhRELjt2wos0Tqi
	0hvRHXlenngiQ42t5oB5A8A+/SIfBNA9ecc9okg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:wlnoDQzVHgWOX44njWrI5mCps0tk4TqVB3DYwJB/Uv4=:hLZdmisS/N00oOna8X7ThkMnLWrDG3Cx1Ba6qlh68WY=;
X-ME-Sender: <xms:bynXanPl4IgaZ67MfYGs1k2bAv5uXpW9tWrT_wPSv4WyrdZPtYaN9A>
    <xme:bynXaszXeXHLwjkqCYN5-ift_rqfH33L-eWEysi9qddx9L8V7QQbFlfZQhE5O3WZ4
    sl5Di3rCtptgXKRilmgNRqCyLs1hI338SJ-9Y1pzMv1xRBjQSRun-8>
X-ME-Proxy-Cause: dmFkZTF2wqexXWYWVCztMx47r+bNtIcDF6fSzCH3t4rbXm3zM+09ZSnDRJySnjfTQpbH8B
    rDIXo3L1pQlXl59rNwqU6QK8SsZ24fZQ362qPHYEvfTEnw3cU8J5Zob/4sGIleguRhMEmb
    0beTNr7XErt/1sZWMcL52AUZU8hq4hHhBaPyC84wDwSgd33L0si88diOcyKM0cCxpHBPhU
    sy3L9sGGg+SQ6XZ/TW95fBcS3YwWf6+XkbFNP6EHZNpRjjRuPD3FcTRkg19Se1xvBI1c5u
    PXeGo+pAJ5lLc5qK9uNHLMXcPosEwXlKSVZeLhj7vr9udtypywHxUNxX8gJgu3DrdgmYtn
    nak0wNICYOBaFUs5cAapwk4UgSdCkp5S8sRQWs8WNyzTBjJefFpC/b1f7yv+U3y1WWLHwn
    ycKDwFSAvnpwOBW4g+5HLIq6FN+STWH+vtJYB17otITuooayC0KNIGsNZq1+YuUFC5W8R+
    gykF566g+Rj1900wCawFf2nQ9xZhIp33M3eki3vibfpvTAPwSQB+8AtpHELBPrWT8fb7XH
    Ak09twwBWlmWXUkwwMVGUXg7DSbMWGb9oFSz7g+MfeTEYhHsRQJAstWlraHNVnknERNBUy
    6Y5yWcv542Y2CSXjK121ZGBpSVNkggJ/+JrICF/qXm0ciVmIjNh0TTnF2YmA
X-ME-Proxy: <xmx:cynXaoR4gtL4YjF3xFpJsHiUTuR5Irj9kHJHrR5jqmJS6XUE7TYm6w>
    <xmx:cynXavIz6jx1vezjUDwI3b8Hyh5iMvO17aYGqM5B-GvDvwfRdX6Ong>
    <xmx:cynXauXHeum-0sFcPEUQ2oc2ekihabX4uW5MFWe_m2W3FUc3BaSVOg>
    <xmx:cynXarhYM9LJz_svOsdIV71NXJeUIQjM0b16h4odvinRMWZENwdiuQ>
    <xmx:dinXarKu9AAMw1Ftpn-V8QuT3s67fSp8taau1SW5fK01w9Croa7nxs5K>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C2AD632A0097; Tue, 20 Oct 2026 04:42:23 -0400 (EDT)
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
X-ThreadId: AICZ2hJ9SF6o
Date: Tue, 20 Oct 2026 10:41:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Laight" <david.laight.linux@gmail.com>
Cc: "Ian Rogers" <irogers@google.com>,
 "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Stefan Kerkmann" <s.kerkmann@pengutronix.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Arnaldo Carvalho de Melo" <acme@redhat.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Eric Biggers" <ebiggers@google.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Message-Id: <100aecfe-f3f6-4058-9f3b-1eb942f23253@app.fastmail.com>
In-Reply-To: <20261020093604.286e072a@pumpkin>
References: <20251016205126.2882625-1-irogers@google.com>
 <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
 <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
 <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
 <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
 <CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
 <18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com>
 <20261020093604.286e072a@pumpkin>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from packed
 struct to memcpy
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 20, 2026, at 10:36, David Laight wrote:
>
> Historically it has definitely done that.
> And you can't 'cast away' the alignment implicit in a type.
> The alignment can get tracked into an inlined function.
> Plenty of crashes on sparc32 from that one.
>
> Any structure that might be misaligned in memory better be packed.
>
> But what is actually wrong with using byte access? eg:
> u32 get_le32(u8 *p) { return p[0] | p[1] << 8 | p[2] << 16 | p[3] << 24; }
> On x86, arm64, ppc (etc) both gcc and clang generate a single memory read
> (byteswapped if necessary).
>
> https://godbolt.org/z/d33hvesr8

IIRC this is one of the versions we had in the past on some architectures,
but the packed struct version ended up being better in some cases and
never worse. It is possible that on new compilers are just as good with this
version, and if someone can show that being true I think we can do
that here as well.

      Arnd
