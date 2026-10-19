Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426562;
	b=BvTNd85phbG/PNcyzYF27zVrK49koc21gEXvCtTrd3jnhIudcIzAO3xv5fbh2yLqv7bc
	 UD8I9soudva2FVrkeiWZAftveygEv5exm6ybP5wQSO61sqJ3cr6FlzWQR8J285LyXaFNg
	 rTLBV3I7wOxvj2YUKeAx3SbyHPFRrTtiCNLK84p6faVHSwsaJBc5WQnhzDz5OXh3nrc58
	 GHunHjpgBBAZj/rpxp+1+XY282ms7d2Si9ycRdmwnS2/0pFGEzsAM3KXKA4vqVnKzLNuQ
	 iug/rRGfgh61hEd5ORr7AXpPZFc2HI/P86lVb9VhTOgnyObJoWM08KH4vQw3wRjvHPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426562;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=UFFxL1UFds4GWqnT5XtzZvSspwC5fuyrVnzJMfy/5ls=;
	b=lCSorITMMdCVK0a5bKVkPT9tVarWSdj1T/uCwsgo33Akgl0UAKdVP7RGgzawYHzvEvkn
	 K2Ad5GBtjAzXH4z9XXJf5hY20eTdlTqZHtr79RRI9N3r7wBAqqyL1pU/ymIcn50YnK8yl
	 uYKiYwgmYqkm2LZbkhuiP0/vBz68Sf6IrqCszRC35Sf/eyZ5ET6YwMD7ccobfpViu7F4s
	 tmAZknrnLhkEjL4f0AEwEXL3ABD7YSHOk+3B8JHBwRWO/29m85qXDNbDmAMxGgun9bG7+
	 oS7hNSbLE2BavJJpdcMZBUPrww7T/1krISRizl8Cb/EvxCfnfonq5aXnYK2SzRkmoIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HJSAWdyZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m6V++kXF;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E3E606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E3E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HJSAWdyZ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m6V++kXF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792426561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFFxL1UFds4GWqnT5XtzZvSspwC5fuyrVnzJMfy/5ls=;
	b=HJSAWdyZYSKUwq6Lr8NLgVDyjtrJv6J8OHcCmWYDmNQ3pIVfQaFlCdh+3CAlEN2qrbrws1
	9etgUJTfumjNfupgEFXK2bI31esmd73leboB1pJ/E0L4aqCtKkoRwrbur6u5PzJAEj/5o/
	fs69AqxnQ7q67p47jEFp4T1CR/GrYWs=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-mk1XSd-TNUi6yAyDr6AawA-1; Mon, 19 Oct 2026 16:15:53 +0000
X-MC-Unique: mk1XSd-TNUi6yAyDr6AawA-1
X-Mimecast-MFC-AGG-ID: mk1XSd-TNUi6yAyDr6AawA_1792426553
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-703d7249379so1898622eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792426553; x=1793031353; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UFFxL1UFds4GWqnT5XtzZvSspwC5fuyrVnzJMfy/5ls=;
        b=m6V++kXF+0jMuveqDKrirlDPJaYAuVm24hJJTa2PdUmC9iVitkhjayI3wkB+HDMomN
         0+NsRJ2bY03K3ZhUiG0FZt+KsOeTqzHKsMG0zitwXybfGMehs5aSv3CjfsYRDlW/eOZR
         qw1H9Om3FsgE6n6VYxMl5eWkT3GRO7nRJkqXLtM1czfuVCNk+JzI7uq+mSAUcUgAxt6W
         GoE5C/CoiYJ40pzz6gPDe4rRC2coDFrAxdjhcTwz4us8XMRovdwhWrc0Qt/nB9IHeQd9
         XmkVn4Va1RW+ntMOAuW5KJFZ7PC2D9NKx/ogShcRRxTLw1uh5W1djvhAjG2Fio4SdVed
         Xx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426553; x=1793031353;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFFxL1UFds4GWqnT5XtzZvSspwC5fuyrVnzJMfy/5ls=;
        b=y7VD25fdHEgrsPxGnGlLt30LoevghfpJfboU2sHnBKPowfhEpSE9wob96eK0EQPIsI
         xy36M7Z3nzxiBWDUuqsN05G1GU0OZEJC17pf73/ehbeEyz1ztAukHsyyOATv6+syrf8D
         0EJuLFChNThd/lLzLzI4j0agzXgF6+G/N3gF0SSL25ct23nt248wNPcHX+f3UUP71Hv0
         mU2N48a1dRZ0KK2eGufuCXqHX86n3SI2pqssc2ziAXR0fDfu/cQ0+Y7tRmmYrc1Veqq5
         yVwnWRA2RzYAgvLA4vNFfTQkuf3trx6mYfHQKcD0yR56N+vetacFH17hGV/kxLvSvhrS
         S5qg==
X-Forwarded-Encrypted: i=1; AKwUvByS5kMJ6GJYggqV3Nj8cjU4eSwvfy9B6yeqmDtlLurLx+seNURfajYbHdjzJOwgoDpeWNTPVakIkbDcUVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTUQjlKDaptG975aC5iBRkYGNVgcBxOGBZPXelmyxQbUX1JCax
	wk51BRBpsTK4lipUjjNitjn0BTyFoTKmtuwk2w5TqXukqOzP9hOI3o86rE6e5VAr9oodKcTZqsQ
	8qeaGGc/Aofx+C7eLh3DUBYVXjT1lk9vf4htOL5SSYOkglhk7JsoiYR+H0REh3OwllfUFyAiSlw
	==
X-Gm-Gg: AYBFou3bWoQ8rQHZ4Yz0Td47nHK/HN19FDjhFel9E6COO3dwMS4mTczQUrNVm1dMhOI
	SoRmaJZYO7pbMt+JJbMp8g6A6Iosw3vrjLWUedyBTiH+1hKOwJufZq/gYV1hQL5rorFr/EKDmGM
	d8V3iD9VBlILltU09pbMzOPNkRykbiwMAjTFsKMYBO6JEXP+jfGBDPBr3yzwiCRR69HmVM0jRm3
	69+mS61XMAskCpMlH8lo53VFtTynNRvlIz3YeZrMLijn43EN63ijMOcvXjWoeUidHPotJLy69Ev
	daxsYPG+X3bV2nSxA9aXl16aV9I8UCUmVmdT8Lj/I+61IiVs8H540n0VeF4u5SZPO3KzcOU=
X-Received: by 2002:a05:6820:161e:b0:6c3:2390:c293 with SMTP id 006d021491bc7-70356387acemr6085304eaf.32.1792426552961;
        Mon, 19 Oct 2026 09:15:52 -0700 (PDT)
X-Received: by 2002:a05:6214:5683:b0:91b:81ee:a847 with SMTP id 6a1803df08f44-91bdf06366fmr143746986d6.30.1792426541314;
        Mon, 19 Oct 2026 09:15:41 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcb8c6d2csm102278596d6.4.2026.10.19.09.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:15:39 -0700 (PDT)
Message-ID: <4a55a48948a1f01686b0471307b6fc2d52be7896.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by reference
From: lyude@redhat.com
To: Jori Koolstra <jkoolstra@xs4all.nl>, Kees Cook <kees@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Sasha Levin <sashal@kernel.org>, 
	corbet@lwn.net, skhan@linuxfoundation.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 19 Oct 2026 12:15:38 -0400
In-Reply-To: <as4gLo_6acb_zZu0@daedalus>
References: <20261009083137.3-1-sashal@kernel.org>
	 <202610122124.08E058768D@keescook>
	 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
	 <202610130120.E43D236E@keescook> <as4gLo_6acb_zZu0@daedalus>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-13 at 14:28 +0200, Jori Koolstra wrote:
> On Tue, Oct 13, 2026 at 01:25:59AM -0700, Kees Cook wrote:
> > On Mon, Oct 12, 2026 at 10:56:59PM -0700, Randy Dunlap wrote:
> > > On 10/12/26 9:24 PM, Kees Cook wrote:
> > > > On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> > > > > The Maintainers Summit reached consensus to deprecate the Assiste=
d-by
> > > > > tag. Remove the documentation requiring it.
> > > > >=20
> > > > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > >=20
> > > > Yup, it has become as redundant as specifying what editor I use. ;)
> > > >=20
> > > > Reviewed-by: Kees Cook <kees@kernel.org>
> > >=20
> > > and for those of us who don't know details about the discussion,
> > > how is it redundant?
> >=20
> > No, I mean I use an LLM constantly for almost all aspects of my
> > development work, in multiple dimensions, so if the old tag requirement
> > held, my email body template would just put "Assisted-by: LLM" in there
> > because at the very least, it drove the build and test stage. It was
> > redundant in the sense of "yeah, of course I used an LLM at some point
> > for this patch". ("This tag means nothing *from* me")
> >=20
> > > Do you assume that everyone now uses it (LLM), just as everyone
> > > uses an editor?
> >=20
> > I don't make that assumption, but I always held the position that the
> > tag was meaningless because it's the human wielding it that matters:
> > they either sent a good patch or a bad patch, and if it was mangled by
> > gmail or an LLM, it doesn't really matter. ("This tag means nothing *to=
*
> > me")
>=20
> I think the tag did have a genuine purpose for a while. Now we have just
> decided to implicitly attach it to every new submitter (because
> basically that is the case.) The point was that a patch that was

I know plenty of people who would love to contribute to the kernel who
haven't before, who do not want to be involved or use LLM tools in
their own development. Considering how much LLMs lower the bar for
people to be able to submit fixes, I think it's also worth pointing out
that just because you've sent a patch doesn't mean you're a contributor
who is going to actually come back or is actually interested in trying
to get a patch to the finish line. I've even ran into 'contributors'
who wouldn't even avoid using an LLM to respond to review feedback
which makes it nearly impossible for them to actually retain any of the
critique they've received on their work.

> obviously LLM generated could be rejected for not carrying the tag, and
> a patch that carried the tag could be asked to explain further (if they
> had not done so.) Or at least, that is how I felt and have understood
> Greg, for instance :)
>=20
> Essentially, the way I read it, is that Linus said we don't need this
> roundabout way because we can just reject effortless LLM generated
> patches outright. This is good and an improvement.
>=20
> What do you think about requiring people to explain how they used an LLM
> for code generation? I don't care if someone uses it for review, or
> brainstorming, or whatever, and I have never understood the tag to be
> required for that. But if the code is LLM generated, it would be nice to
> know for instance what prompts you used. We should have some way to not
> devolve into the maze that Jonathan Corbet has sketched, where no one
> really knows what's going on.

Prompts aren't deterministic, and this also expects that everyone is
using LLMs (most of the contributors I work with do not actually use
LLMs, and most of the ones who do stop short of actually generating
code outside of large tree-wide changes with it). There are also
already drivers in the kernel which have adopted their own no-LLM
policies.

I have wanted better tagging for a while, because I do agree Assisted-
by: isn't great, but just going "well you can reject slop :)" makes it
dramatically more difficult for me to tell the difference between a new
contributor who just doesn't know how to structure their patches
correctly, and one that just let their LLM take the wheel and barely
understands what they sent to me.

Something that would be dramatically better, and I really hope would be
considered over the nuclear option of just dropping this patch:

Co-authored-by: LLM
Reported-by: LLM

>=20
> Best,
> Jori.
>=20
> >=20
> > -Kees
> >=20
> > -- Kees Cook

