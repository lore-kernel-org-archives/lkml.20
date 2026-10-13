Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AFD50E58B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897869; cv=none; b=hMefksEE5dUoppY01R5s/1U/EaLLpZ+lBzDUeUn21MaD8PPwq8SkUzmL0vD1gpoButIFRXpwMN0BdT/x5wFk8/PkYsz5aE685jH7UOTpGCKb2AC1wrVtiOXTSWEXIGfd9YHYBUto07j1dtSTaW0ZWez0U+MV3oY1445A0uVKqDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897869; c=relaxed/simple;
	bh=T63aiyxxeGbGMBJ1y0E91aHHSOIJHp3pN1FjrNgpETQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PQkI5o6KsoL8q4hqdsvFrbObvGWXeX34Sy6bF8HmX6LDsaHudEaanHnMIwNZlvUTX695IFFLr+fpErxH3SSIhQ4qZGSuRxvws+zIABPSs879jFk8ADX2xsyeZhUX1oyKAuvWOLgQgYYIkd6q+8riB9kbM6ir6eQsjWz9shGTBAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=ocXJXcXN; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="ocXJXcXN"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4f5d3bff929so1872374b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897866; x=1792502666;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T63aiyxxeGbGMBJ1y0E91aHHSOIJHp3pN1FjrNgpETQ=;
        b=Uy6SFzd3mvMXieOk0hbLsMP5qhEa3VeyYzgTU7Z6B9iPVdAbL5mXN4FeEWtgfi/SZj
         /EqmM94/vU7UzLfINK4F7Mjh4qBWfk97INAD2tDFm8nI24zOFzAI2tk4bsVbg98pK3zd
         wT+q44R5W1oWiDAIhQTNXGQGO8BM5JDXnxrQKZn/i3WW/cCLKf1KLGfXmUmWd8TXFeZN
         Cx0i7pM7SlVo1VbGf/rbs8m7RXpWMROyoLvU1znHIaTgaaz6FqGLGxIpM9GKqL62nsl+
         Iq69+8anHlBJE17xBQH79W9NN6o0uTJ/h7EMjySR4jMCUmFNTpm0lkDMzCRYc/v3h9rG
         xeZQ==
X-Forwarded-Encrypted: i=1; AKwUvByVGmC9JQUNfUGXHE7vJUqpoe0bYoxjuPef9Qn5tnKHx9zOPZUJsMUzeqJ2K/0afZwm7spMOp6bAUoupyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKACoE8WvQVe6ea+JSCcSQS8U779Edn6dbbHwySvyiP1PX1ocZM
	cH9PsYOhORkKEzOCFQyKcG7OrNqjcFtbJNDI4ejtPDJXqcBa1aJC2Bfb
X-Gm-Gg: AYBFou1F1ctJHPthvoyjcO4P7esOWVsx5U9fmk0sIqtwQk4cJqsyAN/HTsjNig7cS2D
	ZB61Z9SEVrbpQB2m5SZfyf6jX6NJ+lqGPxesBK9KieSL1AsblJqrKpHyK9WweK+t1cpZp1jfzaN
	1DVT/dXjUM6HnlOs0Jidv/ijHAhrtnGFcFBd0r5U9otPNnMGm+7UCZRewkxhGmEaWOSzwi3cwE+
	XZ+IkVKbPVRb48dL63zqwxSbs80TAafSVzk65qk1Jxvm+dwP84R9Wo+vE8/wv4iBql3qqU85tTR
	25tC1xnFMCtDxPcCkfxDdmvRk+QTp/NB85WczlgYDGKhKWab7/yS1NSHFheMwKcB5nLgwcTDn5h
	UUuw6qFAlZFzER0VlOhXcvuhkiuijsxJIhVq8+dXhNjG7JeU5eNrJQ5QF2ibzwxT8vArvN3IM31
	BsK/h405xo4FuEnf7jzZuozoRQt2JYi0adDhM2+mOV6s8NWk8IIImVHrZiIWvCz8YOoLdaMU6rZ
	piI6Sc6qZxyc0V6LbAY0L1GhqkhAAD/on4qCHtE44E4xUotV/SW2p/ofRFChmXY12/ughrOEpTH
	mA==
X-Received: by 2002:a05:6808:2511:b0:4e9:69e9:59c3 with SMTP id 5614622812f47-50c5c6c2bbemr13130410b6e.67.1791897866415;
        Tue, 13 Oct 2026 06:24:26 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c17d84e77sm14067947b6e.7.2026.10.13.06.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:24:25 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D53260359;
	Tue, 13 Oct 2026 13:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1791897863;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T63aiyxxeGbGMBJ1y0E91aHHSOIJHp3pN1FjrNgpETQ=;
	b=ocXJXcXNdE+wcE53Cv48AKrtaDvPE4DEFPdiMI4PJIPb+SdCKbzgfDUayDg9fCKNQ8LTst
	JoahU4ovD4Fa3kSbhGoWHcm13vrttRTiRHVxylr8QelSDz9u184f+RuMtubYwv9sTgpKL9
	OBzPGALKhEBfLa5WQqHwhLkXrW59e5e2faZCYsumlbs7BoG6d3kI8YFxb8k41eUNt6P3Ur
	urGXK6VYnrAnCXDXgAD2a6uykJeWx9IL9LQv2Qa8EPOCI42oGYmaby7YIjl0sgF/bkxWvM
	caBUwp3ZrDB1X7+mfLK9W5hO2un0gzo0koxcuRIf1gEcUkFBWz3lzW2Ysku6rw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 10:24:15 -0300
Message-Id: <DM3QRYDG6JEI.1MNGMM71E0NSG@marliere.net>
Subject: Re: [PATCH] docs: remove Assisted-by references
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "Linus Torvalds"
 <torvalds@linux-foundation.org>, "Sasha Levin" <sashal@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, <corbet@lwn.net>,
 <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
 <federico.vaga@vaga.pv.it>, <apw@canonical.com>, <joe@perches.com>,
 <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Justin Stitt" <justinstitt@google.com>, "Carlos Maiolino"
 <cem@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Brian Foster"
 <bfoster@redhat.com>, "Christoph Hellwig" <hch@infradead.org>, "David
 Disseldorp" <ddiss@suse.de>, "Mark Brown" <broonie@kernel.org>, "Jani
 Nikula" <jani.nikula@intel.com>, "Jens Axboe" <axboe@kernel.dk>, "David
 Hildenbrand (Arm)" <david@kernel.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Christian Brauner (Amutable)" <brauner@kernel.org>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
X-Mailer: aerc 0.22.0-16-ge144528849ba
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <1716819121.765615.1791890380179@kpc.webmail.kpnmail.nl>
 <20261013123853.GD4214@killaraus.ideasonboard.com>
In-Reply-To: <20261013123853.GD4214@killaraus.ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Oct 13, 2026 at 9:38 AM -03, Laurent Pinchart wrote:
> On Tue, Oct 13, 2026 at 01:19:40PM +0200, Jori Koolstra wrote:
>> > Op 12-10-2026 17:42 CEST schreef Lorenzo Stoakes (ARM) <ljs@kernel.org=
>:
>> > =20
>> > +cc the participants from that thread FYI. The original patch is at [2=
].
>>=20
>> Thanks, Lorenzo.
>>=20
>> > On Fri, Oct 09, 2026 at 12:05:06PM +0200, Krzysztof Kozlowski wrote:
>> > > On 09/10/2026 10:31, Sasha Levin wrote:
>> > > > The Maintainers Summit reached consensus to deprecate the Assisted=
-by
>> > > > tag. Remove the documentation requiring it.
>> > >
>> > > Please provide here some sort of arguments used in that summit
>> > > consensus/discussion. This basically reverts/changes previous consen=
sus
>> > > [1], which is fine itself, but it lacks reasoning.
>> > >
>> > > [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45=
@gregkh/
>> >=20
>> > Thanks for linking that! It is important to ack previous discussion on
>> > this. Also LWN article is up now at [3].
>> >=20
>> > I'm less bothered than you might think by this change.
>> >=20
>> > The tag's useful for push back on review, but the only long-term strat=
egy for
>> > slop is to aggressively ignore it.
>> >=20
>> > Linus has made that clear that that's fine.
>> >=20
>> > What kills the project is having 1,000 slop submissions that 2 or 3 pe=
ople have
>> > to do something with.
>> >=20
>> > The only long-term solution to that is to hit mark read 1,000 times :)
>>=20
>> There's a way to nuke drive-by authors and that is to require them to do
>> some kind of "proof-of-effort." So you want to contribute to the kernel?
>> Good, come to one of the OSS conferences, or LPC, or have some well-know=
n
>> maintainer vouch for you, or do the kernel mentorship program. The point
>> is not that this cannot be gamed, but that the "gaming" in itself requir=
es
>> some kind of investment, like proof-of-work.
>>=20
>> We may miss the savant that for whatever reason cannot show up to a conf=
erence,
>
> We'll miss all the contributors who started small and put time and
> effort in learning. I'm pretty sure that's a majority of the people on
> the CC list, and it certainly includes myself. Making it much more
> difficult for true hackers to contribute to the kernel, including by
> requiring paying for travel to conferences, is the kind of policy that
> would make me stop contributing to the kernel.
>
>> but Linux Foundation is already very supportive of funding people.
>
> How many people with very little history of kernel contributions has the
> LF funded ?
>
>> And besides,
>> Linus has already made it clear that we can expect of people to be able =
to grow
>> into serious community members (which may include being able to effort t=
ime and/or
>> money for LLM access.)
>
> Time won't buy you a ticket to LPC.

Also let's not forget the geographic problem. Many live very far away from
the usual circuit of FOSS conferences to even consider attending.

>
>> This would solve most slop immediately, and we will know about LLM found=
 bugs
>> anyway from cooperation with Anthropic and just the maintainers using LL=
Ms.
>>=20
>> > Sasha - maybe worth linking the LWN article now it's up in the commit =
message
>> > and adding a little more detail around the decision?
>> >=20
>> > Otherwise LGTM:
>> >=20
>> > Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>> >=20
>> > --
>> > Cheers, Lorenzo
>> >=20
>> > [2]:https://lore.kernel.org/all/20261009083137.3-1-sashal@kernel.org/
>> > [3]:https://lwn.net/Articles/1099594/


