Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460703;
	b=WC1ivJoRq4s3Pbw8bSMc8VBcvZw9/CJujpo/X9Osr1waG7dVS6SabOmTioa8ZBXyXMpI
	 ek8CsgvjeeIXoE/Qe4CoOBejrWM2Zu4rdBj0cbyAJoN33zvmImus4b5zhw+9AjTkQ1TNM
	 je3cMC0lKKKkUMLwW6zDHE2jbyr0Q54hQLF6ezQ+csmDyUS1jLZ8mrWF68+iogUT4Urq2
	 lOYj9v/GDU0Tpc0cVBx69bfjVKC8A+hJPQavnV1Sk3khsyzFuLq+q3F4g3d3oLG4rmHI7
	 bxd+uwT2PZEgppJ07+ur9mzZ7HYoBBiEexAhjbwZ2OMj7hmFMExB/xvGyeoV7ju2sZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460703;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rZcZfYXBzlUwQ6YnCv3oAfZ9AJiBpXJOG8bn7No/VXU=;
	b=Jyw3A3E9eCJeeh7gRFrczu9WhMC0d4TYhEnoods27iSPId4MGwktGugel5N7Tl6xHJoy
	 zo0RNwIizycK3pPEiuiWPscgsJhKlZD5o6BjVUAIPPhJzLTxhDHcpSBSt0D0OvQVGLDvV
	 4S3XPXFSM9IUx3wXKgsUOR1XGO/kvxzqkxw09/anWHdFIM818DGPqVCdRwS3ccUyYJYs4
	 6KsOKxbUdZFPpuN3lgT3CbS3LCPJuP3LhItLThuo9o5oVO1/WtE8I8f99U7/mZj/Veb6e
	 BXJj3MEOMZMujnhpNARj583EMGlwJb5/ucToG1yOKHD+WNpkkeDdH1CPiEKKC81hmYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=dvokr1Iz;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rsqb4gXR;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE24606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE24606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=dvokr1Iz;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rsqb4gXR
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CE64714000CB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:45:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 19 Oct 2026 21:45:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792460700; x=
	1792547100; bh=rZcZfYXBzlUwQ6YnCv3oAfZ9AJiBpXJOG8bn7No/VXU=; b=d
	vokr1Iz1oTOqj/CkKLMNHSZVtPVIRGeV6t9wvqnu6lEiQc69E0Z+TwDI+WHMoqvs
	xhsbJIkthopcImflHzgNUrbqVoQ1bdTBEJQzFLecWERPJz0EVP+a+IDFBTZ9F6nj
	ERpybWmeeyJsh7MheuJYIp0OyrW7GikoZUX7V9G3EWzptjXeeOzId/tvsameENvG
	aKNMhzshHpxjo3tj6NH18FyBZ3Enw+mz6VCL9HCLoLhlcRTbX28KjCLXZlt9fxl7
	1vYM22RhGUBNodhAyRciLygmu7fjw07P7vYf3gcAGsIpnFPvmNHxeq2MLYgcEf4c
	kw0+RiUVpOG4dtmcndmhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792460700; x=1792547100; bh=rZcZfYXBzlUwQ6YnCv3oAfZ9AJiBpXJOG8b
	n7No/VXU=; b=rsqb4gXRJBMYUeVVdxJ47aZVSusqxhFrMfGPPgs/VdenOoYF+oc
	AtQ0iuxY9jpUlHDjQ9KCy+PlE3n1bSL96+wTX2BMdp2qYTZqjvSb66oqNDAKiCa3
	C8UxD7P48p03qXSVRJUjPPgafuVwb1thJnLiKV7tkfYnV0FX0/Me+S5ARshUoqoF
	a1GV5SeaSt//Ja2Uv5KDRYa6FHRRziXQO5YIe5nILrRK09Y1GuDJj2Iye0ZPmPqP
	pVkyNwV68aKMBjCtaak0p9UmQ8HyuFUMUrXXfJCudJTYrNzEG1JiVsgk0oGXYbCO
	DyECoshGhxlNpgsDMwJvoNoKeER59RXjJag==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792460700; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:eJUj/XzAUKDpIoo9piwI34IvZ9Raxc0ecDfR3FjkXyX+9Z8
	raGJOgmzjVi3Vjyhvgjlm294NMjQeBVmo3ZDRD7vTP0f5GghgB9KnZYocFiV19tG
	VgbhhE5EV1Ga3lEQGKlPViEqYfY2LVlCWE7feryIbSXPW9AyxoIzysTb0LzaXzDZ
	GKaoQoQvng9kqlFNGAVFaIIZMkZxlbWLvru8SKOO7vkAoSvqYQPVL1lFYObHbe7E
	Y0YyKqf67xcs3IeLUq0GbRaChioevwAWqxEHfNLZPJ3AoMKLYARjFHDczOzOgJ0E
	9it8eQB8DLrIYxZA+spJXiaZOJRjctmj8s53Xeg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:lUvEeXc2GW6k7qtu7v55SWTUciN2VgoSlicBRnD6ZQ4=:GUp/lQENMb6M3mRWSWTQ/ABJrHcYPEzn5ohvebQulng=;
X-ME-Sender: <xms:nMfWavNvtfHkS4lsL_bbq-o7C_mB6pjtnXo3YuM2S72sjEM1MbnPCQ>
    <xme:nMfWahuAo8NuJlCQUfjDZOUdrnL3O8rFT9ISS5AwaDzSBHO4VGeTp9dCNlve27Z3n
    YRGDWV5JkwCjqROTohHXAyJqyfVkxuhvV4YqEycnO0E-nOWLWcjB477>
X-ME-Received: <xmr:nMfWahVJ-x7K_gM-xrzLHJtOevHDQc5o9zjD604yA0f3i-RARyP02wx8F6zl2PUil4roBcmpUajm6j28BtFv9P7mq0k1>
X-ME-Proxy-Cause: dmFkZTF96aY4z4lBvgfoihxo8gJ7Tv/YcWB5RRQiAs8g0aRg+C73GFqwIQqaEwbTGJ2oDe
    JQw2tjAA04sn0Y0tAuKtAQiEF7QPjMYG1c87OGg85QhKw9S4rnmPYcQKAnCZdpAuAD7gYP
    /1L4+6LfrL7TirPodR+UqIZ/6g6an8GBLyRpCYh4IPvNXGX84sB61AKbIeqOkAeQTJSWhX
    Ddscm1JGUWiSzrtTr0ThUgk17KpwzstjBoE515qBRKZ6v7V4LWneNFM7kt9EEIgh1+OKb2
    0EWMUuTkS0TN8P9mW5qIH9ozaeH9uMioxggB3nyg+6dGZHoOF0aKsR6cj956DiC8FPf+nC
    PqbHbuGvN+/gZL244W5mYgX7vLDIP37IHP13+26GUB7wqr0fh0bDovZ56y5FzjXYcvDqRx
    3fF10eLicDQAS1mU+2OW+R5siGqlbZApq4lUN64wRgkvUbtE92BSXrDWxiaWOzowQ5rMyN
    7hNErVOYnWvtHazRx+mKoWXrwf/nTBxf3L2AZbyyKoL9YFVe4EDYDBH8pNZg9yfiKs+GYS
    9AAEGfT1qumlPNMnkzsPvMYoTiVz2khSd43xPGyjUxIoTYrClz4yKgrlwxvS/BfTdBEUP7
    UYhkKk//dH839LJdRetPn6jVHOL9OCFY+l6ryNLiuasC1zMkEm63DP3AvKQg
X-ME-Proxy: <xmx:nMfWaht9lJSikY1_I-s9VGQXvaQVCK5mvw4UYZc4tbsGcNZrC-zDrA>
    <xmx:nMfWalWQVtjj915SnNn_IjLfLv1-5LhzkSZdZ3wj3FThKW3qt-xjPQ>
    <xmx:nMfWasmSEgogg6A613J4viw0KlDQOzbxrLBUq8X511XmBercpwMUeQ>
    <xmx:nMfWamYj_wbYDGfdqA2LbIhHN1PGyt2zSNr0KKVQv3tVR2d7PJ2_dA>
    <xmx:nMfWar8IpQ38w1dXoBgZo6-muJY5cyxZ_yIMoq-tN0sC6F1_BcvPkQGq>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 21:44:59 -0400 (EDT)
Date: Tue, 20 Oct 2026 10:44:56 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ieee1394 tree with the origin
 tree
Message-ID: <20261020014456.GA335452@sakamocchi.jp>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Mark Brown <broonie@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
References: <atZBEI6G3PgKHKaW@sirena.co.uk>
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
In-Reply-To: <atZBEI6G3PgKHKaW@sirena.co.uk>

Hi Mark,

Thank you for reporting the merge conflict.

The ieee1394 tree has now been rebased onto v7.3 tag to include a fix from
this PR[1]. This may have introduced a conflict in the linux-next tree.

I believe that linux-next will merge the v7.3 tag and merges all or
required branches onto it  within a few days, at which point the conflict
should disappear. However, I'm not entirely familiar with how you maintain
the tree.

Please let me know if you encounter any further issues related to ieee1394
tree.

[1] [GIT PULL] firewire fixes for v7.3-final
https://lore.kernel.org/lkml/20261018103634.GA346762@sakamocchi.jp/


Thanks

Takashi Sakamoto

On Mon, Oct 19, 2026 at 05:10:56PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the ieee1394 tree got a conflict in:
> 
>   drivers/firewire/core-transaction.c
> 
> between commit:
> 
>   7f9f2d6abc40f ("firewire: core: fix race condition in split transaction handling")
> 
> from the origin tree and commit:
> 
>   0f7228de31f1c ("firewire: core: expand close_transaction() into its callers and remove it")
> 
> from the ieee1394 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
