Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793404471;
	b=f0mri9whup+BwLmWhHF85Q9yTiMJPHtFdLOr0qKX6VNI6kT1fVDVYNmLiRoEsqi1fbYt
	 ZIlCaL8g20mIifZW2nt3dKFeRdQtsQADpiN6G9sB70s5tE1UrvACtqZwqeJkNq2fV9lYh
	 /hLJceWKn/6R3EAvb3BKCV8bTZVcCTQps/q1sxTpD8aWIa5KSYgwCGx6g9Bqda/adIKcl
	 z5wv5g4F3OS+6N1gu9d4vQh4uGTMZTOpHqFcouI4twYGhulwYpAo73xejnaUsp0MjPQ+h
	 Ggo5G/d9GheTco9GO+20X7vBrobo+6xQDwDISJJCJP0lY9WPi2C1lHq7fAnwS3hCKKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793404471;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Spam-Status:X-Rspamd-Server:
	 X-Stat-Signature:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 X-HE-Tag:X-HE-Meta;
	bh=xgxwRoaTlzr2lRRyHYemNn4UAN/1kvxamPcokqd3PEE=;
	b=el/jBrQiF/eXOiW+Wgc+uTrBl5t2hFGK5X6nsthqvbYFzIFnhJhMGomRzxo9/PnAxMbR
	 lHbO4hhV3pfwiTwZToYGu73/SZLLishV1+cfVMYy7+evo+RA8whedgNXlpZYWo27lqpY2
	 lJ/lS2bvi/Cr9AnDP6xYBcaHqfe+UQcl3i0BD60lSMY3g4Q3zaZuXFCABTX7AmnkePn4G
	 t3mRyqaqKoslNDhNcvtxmDfHB8RVI/2h+hxb6zcSMikuU3VAXxMyfWkiFk65UpF3bcd+H
	 LC9dqnKIogKU0+hNq8gBfMh5lsRDC7cKRkg0uiMD1+xnr1kuu2YOrvxEk1MrVA89skg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C8606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD0C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf01.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 6E1651A0847;
	Fri, 30 Oct 2026 23:54:29 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id 7AF4F6000C;
	Fri, 30 Oct 2026 23:54:27 +0000 (UTC)
Message-ID: <d3e29969aeaf10b654a3be87601adee6be89c9d6.camel@perches.com>
Subject: Re: [PATCH] get_maintainer: lazy load JSON::PP only when --json is
 used
From: Joe Perches <joe@perches.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Sasha Levin <sashal@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, 	linux-kernel@vger.kernel.org
Date: Fri, 30 Oct 2026 16:54:26 -0700
In-Reply-To: <auUps7Hy7W0SqWw3@redhat.com>
References: <auS7NOsyw7pJ7rbF@redhat.com>
	 <eb8d1fb4e2a8a32ae1b71df686ed65be800e2918.camel@perches.com>
	 <auTDEy_vyMixVRTU@redhat.com>
	 <1ad2ae74e3257578cac561f19af63ccb94fce85a.camel@perches.com>
	 <auUPo66ISiR2gzmi@redhat.com>
	 <e184b73da5229fa387074fce2d977994f6464f1e.camel@perches.com>
	 <auUgX2kp9psrvQ6x@redhat.com>
	 <9ba498189291b99fe18d3a8ac32722495fa3227d.camel@perches.com>
	 <auUps7Hy7W0SqWw3@redhat.com>
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
X-Rspamd-Server: rspamout06
X-Stat-Signature: 8ebsq91znhu96xxmkr51fojxw5s1hmkp
X-Rspamd-Queue-Id: 7AF4F6000C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+ohO4d+Vsnb1gWj5oEY41PJyTT0ROUo4Y=
X-HE-Tag: 1793404467-569245
X-HE-Meta: U2FsdGVkX1+RgRJMIh6vpLCayKzpaeBfOafdJdCJx8fzIToukV80fRuPXs/NSyjmTYeK7ZmQetuFLlvSb2rFBPF1zsIaWZO163rZBECSUG1Q2J4rfdIwy/Bwr0POVpJKKeN9m8mZGuG4kjstJGcGFapd7LqxsbFb0tDsnuLiYPrYnL5rzSElp/JRU3gdFa4AhvCGDbmQ7xaLQDpnQp6t1QwQv97yxHRj8vWVSZXOib9A9vV5uwij7ccVWd2NirWsodQHGwBj0F85jl+P9/xkMopi9xuukQzDkPQ4PQf/sdaWRNvnzu860l6hrVElUpkM

On Sat, 2026-10-31 at 00:35 +0100, Oleg Nesterov wrote:
> On 10/30, Joe Perches wrote:
> > On Fri, 2026-10-30 at 23:55 +0100, Oleg Nesterov wrote:
> > > > > But why? Why make get_maintainer.pl depend on yet another module?
> > > > > FYI, on my Fedora 44
[]
> > > > Module::Load is a core perl module since 5.10 and
> > > > I think you are using a broken version of a perl installation
>=20
> > > And how do you think it is broken? my laptop runs the fresh Fedora 44=
.
> > It doesn't include perl-core ;)
>=20
> you can blame the Fedora maintainers, not me ;)

<smile>

That'd be the same as blaming the Fedora maintainers
for not including development-tools by default.

> > > I used ./scripts/get_maintainer.pl many years, almost every day, and =
I never
> > > needed to install the additional modules. Until ("get_maintainer: add=
 --json
> > > output mode")
> >=20
> > I think that was added in Linus' 7.2 in mid August and in -next since A=
pril
>=20
> Yes, I hit this problem months ago, but didn't have time to send the fix.

Nor apparently have time to send an email to the get_maintainer
maintainer about it either.

> > I don't disagree with the concept of the patch.
> Great, then perhaps you can ACK my trivial patch? Then we can discuss
> the possible improvements.

Maybe when it's done without needing updates.
In the meantime, you have an easy workaround with dnf install perl-core.

> > I think we understand each other fine, you just care less about the
> > output error message.
>=20
> Yes, it is true in that I don't really care about the output error messag=
e.
>=20
> But then again. This error message can only happen if JSON::PP is not
> installed, and my patch doesn't make it worse?

