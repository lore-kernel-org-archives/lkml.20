Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046303;
	b=sysEgoF9TodQHCDkNJdkI32jHXoM7jmCqIjgYTFwP1Z/0eE2/3gnXGqXpj6EmJ4NzDew
	 FOFLpC5mmdosPTA0OzrHOZf/ttbEbIb9VMz7zePbtIar7jJUWE5qumV27yOW0aNr6sqE1
	 BMF8yD/4TYZi5zTgxqwjOd+mahrxFAwId+x0KrW+2CXwYeOWUBGhxqyiWdAYBFvMxAJC+
	 0VUC/cZYbgOUU98Z9O6JzcWat9s19wQlpEzVWBt0FLEpwwtdoFWrFmaiTr/c91qMEGzYJ
	 nyA5aZMLuNAmRMv9nYKaVr4HlSUgIoRAzX5Ie1xT7p738Z/rkw3I4Aw+tObAcwCysBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046303;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=dyUiwFHOuZ6jUB6/ApCIxjebYZYlYZpkM6HcrbFEf4s=;
	b=Zg8EU+K2EamAc/gh0f7g4zl9hEWojmqe25QPQlR2v2/gzCBoq24aWsUwj1fAcYyuZLlY
	 xlXPDafoXb797Iz/m6CT0Cwt8BRL02JxVvRSeg8SS0ywBEf02lKcroQUZKyIXTsNAKEz2
	 SH5z0iT6djJDLEM7qhDrWFTb2hZlYmkAp8dakvPBx0uvfMCZZETSnsY5sTv9FYLxNrIR7
	 DGGKz6WCPIxAYjLLMBS4u9GVFfFev8AzFzvIRst4TRMoSd1K40wPd7P8R4V0MNNHo207x
	 WqHuFUXj2h95xMnv5wMMOPSFF3XI/RSwRXkHybF7ND7/yWd9uuJ6ig7JGDbH3cSufow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LKBdmTNg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=emqBnxMy;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997D2606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 997D2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LKBdmTNg;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=emqBnxMy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793046301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyUiwFHOuZ6jUB6/ApCIxjebYZYlYZpkM6HcrbFEf4s=;
	b=LKBdmTNg8sJ3sSNZqlJpOo/D+Dxzxxr0L+gDGGK9mFd6pvAY2w2Rfp+saUKPTJM/YIO5H5
	kZ6xTOiTCePcDKN+o6sGW49ke03/+zydJNnb6VW7iYAteysxlptqkjiAXkENTDHRfrUNju
	ayReAytvd+/RefGSecSIAUUyfHtHdKA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364--Sc9MA_GMG-HiTD-mVBK6w-1; Mon, 26 Oct 2026 16:24:59 -0400
X-MC-Unique: -Sc9MA_GMG-HiTD-mVBK6w-1
X-Mimecast-MFC-AGG-ID: -Sc9MA_GMG-HiTD-mVBK6w_1793046299
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so706524685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793046299; x=1793651099; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dyUiwFHOuZ6jUB6/ApCIxjebYZYlYZpkM6HcrbFEf4s=;
        b=emqBnxMyuXJ+dFPo7kma5wmC4AFechpY6FN8vs3RaZZ8+uQv7vqXoivxV+3KYs63a1
         g3V6LHEzWGPaK5i2d+5A6enI5EE/eqsk48t6zzrD0cabhW/rQSIjquFlbSxftchVyrMI
         vd1H5z6foL378/6OLIz1P6ZuHxSRJDuAED5cWZFwZpAk7RnCoshS6O4477qABKMWA6ro
         MYiurLzmbZgQ9ENdvzJsb5Qra838QVFmATgJ/TiG8IdUpIJZUn5PwbOZNldQUbodGKwG
         SuxdysTewFPdWcmRZrHfN/9j8Ff6FzQP7o09svZfAUIJGThXWTldhNg+E7j2hqc/SEEb
         ax9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046299; x=1793651099;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dyUiwFHOuZ6jUB6/ApCIxjebYZYlYZpkM6HcrbFEf4s=;
        b=M4uUM27BCPf/IQ0d5vV8wJ7kAYhg5r4rTrTSI7tYvGsSWVEess1Mmodz2cJ64XU+Tx
         XwovwhExZbhwl+Jssdn0cU5TySTRozu+IsevsVLEG0Z4DbxbLQxxLf/InBVp3s/6lxd/
         1qEATsyiFRYJlYVWsZvLkUYjjpCyWLbCaQYBAFm/BlapDVFsFHFNOLD13WYQQ7HEIWUx
         PYg8Uk2binCOl8NUG+pVPjDVd8EMQvZH+AtGfEt7PX428SJcCyNPBj4PXDr3wDVtjswp
         YFWqNRWfGZiYHctkbv3v9J4HGroKUl/xS4e2TlpE5bdYVi+gLN8G/BjI4lNccHNLIXxj
         ot0w==
X-Forwarded-Encrypted: i=1; AKwUvBwx9ahkoXKmJJHx+rtlER3O8ToH9UjLAC9TfGTw7FY5vQMs1+scbx6WGwqw07G431UNVUAnMltTVLpb8Rs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsHTBa0Y/hkprFbFQa42I2TZGciNsKRO7ndfjKKLRudKVREn45
	rpIV0TVpuFUfY5QkCRpcoL677dc37rK20tJyKILNCrReIiBoe5jeInwGg6LjyNh1UdSuHuEcOSH
	/qZoW7kC44o0nO54CSRNPMbXwxjtY1zVJRSMxpl1Q2hz8mGob9e34DsWJiWiJitUqew==
X-Gm-Gg: AYBFou3vdgBtMucKxtKnFePKrVFgltDzEkUys+KsXhVfTdv+uNddINkgD7AioaSGkKY
	iOyiccv7wEZxGaSAeOWhg3cqfsBij28Lrp3uRQ4d2UkKUqL+kZHhSA5Scd+wOXNnldxM3Eqvpwc
	c2bkSeNleSHOTwz09l3AsfY3TCA02fBtwELOZNtIE7ebwgrgtnkXhOfGhx+3awzBDeMlh3E2tWS
	uHwz6zeS1bpAXAXSjV/WQSnzU0hkul/cctXgvuEDaRNY+dqAs8b8dwNZl4JeYEuZOUOXRBAPk1U
	jar79Ud5VZtBPb1Q+dXRyStm/hY4d/s6r0ztty7h1r1u8aOQUQhR/7/gu1jmQjwg4j51Bhg=
X-Received: by 2002:a05:620a:40d5:b0:93e:9cc1:7b95 with SMTP id af79cd13be357-940ef98035amr1280969785a.58.1793046298901;
        Mon, 26 Oct 2026 13:24:58 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:93e:9cc1:7b95 with SMTP id af79cd13be357-940ef98035amr1280965985a.58.1793046298385;
        Mon, 26 Oct 2026 13:24:58 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a771c9sm779007885a.34.2026.10.26.13.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:24:57 -0700 (PDT)
Message-ID: <0b17a082338118004a56b9769a7fc753ae928432.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
From: lyude@redhat.com
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Troy Benjegerdes <hozer@hozed.org>, Theodore Tso <tytso@mit.edu>, 
 "Lorenzo Stoakes (ARM)"	 <ljs@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Krzysztof Kozlowski	
 <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it,
 	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Justin Stitt <justinstitt@google.com>,
 Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Jori
 Koolstra <jkoolstra@xs4all.nl>,  Brian Foster <bfoster@redhat.com>,
 Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, 
 Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Jens
 Axboe <axboe@kernel.dk>,  "David Hildenbrand (Arm)"	 <david@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, "Christian Brauner (Amutable)"
 <brauner@kernel.org>
Date: Mon, 26 Oct 2026 16:24:56 -0400
In-Reply-To: <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
References: <20261009083137.3-1-sashal@kernel.org>
	 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
	 <asz9AeFe3CutP73z@gremlin>
	 <20261013123132.GC4214@killaraus.ideasonboard.com>
	 <as4pAEnLd4H68W4W@gremlin>
	 <20261013131243.GM56180@killaraus.ideasonboard.com>
	 <as4xMnT8a75pIw9v@gremlin> <as7uqZn9rQ52USwy@mit.edu>
	 <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>
	 <atjjQ0oupQ4pmKHB@false>
	 <00636bea8791e75b3b16afef2dc5ee7f2cb8bc0d.camel@redhat.com>
	 <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
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

On Mon, 2026-10-26 at 09:39 -1000, Linus Torvalds wrote:
> On Mon, 26 Oct 2026 at 09:04, <lyude@redhat.com> wrote:
> >=20
> > On Wed, 2026-10-21 at 16:07 +0000, Troy Benjegerdes wrote:
> > >=20
> > > It *is* possible to make a deterministic LLM, and this is why I
> > > think
> > > it
> > > is critical to my personal future to have an LLM that can
> > > actually be
> > > understood by a human instead of a random number generator casino
> > > that
> > > sometimes puts "4" in your private key.
> >=20
> > I hate to break it to you but that is literally not how large
> > language
> > models work.
>=20
> More importantly than that - the whole "deterministic" part is a
> total
> red herring.

I'm going to stop you and say "please read my responses on the rest of
this thread and actually get a sense of where I am arguing from instead
of seeing a anti-AI person and jumping on it immediately". I use LLM
review tools like sashiko, I have merged LLM generated work, I work
with people who regularly use LLMs in their workflow to a much greater
extent then I do. The deterministic bit I mentioned was not meant to be
some ultimate point to shut down the use of LLMs forever, it is to set
people's expectations with how these tools can improve correctly.

Yes - people are also non-deterministic and make mistakes, the goal has
never been to get a "perfect" tool. But I do think it is important
context to bring up because the fact that they're non-deterministic
means we need to take that into account when interacting with and using
these tools in order to use them more effectively and avoid leaving
extra work at maintainer's laps. Especially when you're trying to get
across to people "if you're contributing to a kernel that is being run
all across the globe, you need to learn how to do this job as well
instead of leaning entirely on an LLM for it - otherwise people won't
be happy with you because you're making them do the hard work".

The bigger point that I'm getting at that keeps getting glossed over
here - LLMs can generate a lot of code, a lot faster then a person can.
When someone is submitting code that they've written by hand, at the
very least I have the guarantee that for the most part they've been
following along with the process of making it. It's not perfect, there
will be mistakes, some of those mistakes will bite me years later. And
yes - some people even do move faster then they can think with writing
code by hand. I've had to deal with that very problem in kernel
development a number of times. But honestly, even when that's the case
- I can usually work with the contributor to help change their workflow
into something that produces work that's easier for me to review and
get upstream.

But the amount I have seen people moving way too fast has gone up
significantly since LLMs came onto the scene, and it's been repeatedly
difficult to actually work with many of these contributors. Often times
they don't take feedback or learn from it, in part because they aren't
writing the code and are focusing on just running it. It's also become
dramatically more difficult to encourage people to try to dig further
into troubleshooting issues when I only have so much time available and
am trying to provide contributors ways that they can provide me more
information that lets me properly review their work. I've dealt with a
number of people who, even after explicitly describing the steps to
take to try to investigate something further, end up just asking the
LLM, and then giving up when the LLM can't figure it out again. And
yes, this isn't entirely new - it's happened in the past. But it
happens a LOT more then it used to now.

That is the social contract changing, suddenly someone who moves a
million miles per hour can drop an enormous patch series and either I'm
against LLMs for trying to put a foot down and say "There's no possible
way you generated tens of thousands of lines of code that quickly and
can still guarantee me you've at least tried your best to understand
that code." or I have to do that work myself. Even with reasonable
sized commits, I often am still left doing a hell of a lot more work
trying to get them into shape then I was before. And more often then
not, the person submitting them doesn't actually know how to do
anything beyond just prompting the LLM. This isn't everyone, but
contributors like that used to happen every now and then. It is almost
constant at times now, and it's mostly from people using LLMs.

And there is actually a pretty dramatic difference in the quality of
work I've seen from contributors who use LLMs in their workflow and
don't just copy paste the LLM output verbatim into their mail client
and send it to me. I know plenty of people who use LLMs very heavily
who I've literally never had a problem working with. Often times, they
also tend to be the ones who use the LLM for everything but writing the
code - or at the very least they actually take the time to give their
submission a major face lift before it comes across my desk. The one
thing that's in common with all these workflows - there's a clear,
stark effort to do their best to understand what they are submitting.
again, it's not perfect, but it's something.

> And yes, non-determinism adds a wrinkle to things and it's something
> that needs to be taken into account (and people often add things like
> explicit seeds to avoid it when they need explicit determinism from
> otherwise non-deterministic algorithms). So non-determinism is
> something that should be weighed as a factor against what else the
> tools brings you.
>=20
> But it's not actually an argument against LLM's.

No. It's not. And it wasn't meant to be. Please go and actually read my
responses in the future. This is a huge part of the reason these
discussions constantly blow up on the mailing list, no one is allowed
to have nuance with this.

>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Linus

