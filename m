Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793402278;
	b=cZ1CqYKEG9rb/r2CAjEijEfQT40sFG+NWBqihLHgtUb9+6lfkbIRnRgR63w2Hy1gxJSr
	 8m8TkqsNtyHwgmJqSNEeSnoE/+SXzXR5VP5jovH4C/5TAr3VEbJXZ0225lhlGwBodOK4F
	 KMxBh28F1zBBvcjm9fz52JcSeJ27UBBFuT146bqaUzQiXHk0pxpQoEHSrcJeP2MixsnKN
	 +n5sY55BLQKdgi/cCHnXuSYZ1SpdroKS+svOup1FjQTnAF2xRYiqdqtiesdadO1h58NYG
	 wFcRDXEqOdRMRhPgWmMfL5lpaBqYsmfd9iYEQXx2Gz7FGt7bnB2X+CBtI0fOHVxekfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793402278;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=Uq6JLHRUfgxHzl85YBfccLQuoc+AAumf6EP3zf42RpI=;
	b=ICoVAWDoH7JZBFx53uYhwDcFtFEY45LE4mU84qJUFnV7vRzW9xnJq2bx/9E0lVgDWZnY
	 JnwZgpJZxUVyCusNePOdQlV92lEGIZ6oJ59g8jHBJGzAPa1N7JDsUWHqeiToeJzm89vBr
	 tLGaHTJhJ7VPG6PGF8urG37aKhbF++4cQdTBGVYRQvCKyIJG5bM0l7FP0wLABDX25dfNg
	 Op9ncwf+yVXihd1Fz6BKYrzV2Vqoi0uH6dvRYQhOqdHJJwtR11uH+lq/gqiOF1/FbpM4r
	 X/cLDUpEaqmPw52Q7G4s8qULIzeUzQcxojsprwp6WDJLb2n3XG5awIWBWGCFSJeI7DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.16
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF140606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF140606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 4428FC08EF;
	Fri, 30 Oct 2026 23:17:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 3E6A920025;
	Fri, 30 Oct 2026 23:17:49 +0000 (UTC)
Message-ID: <9ba498189291b99fe18d3a8ac32722495fa3227d.camel@perches.com>
Subject: Re: [PATCH] get_maintainer: lazy load JSON::PP only when --json is
 used
From: Joe Perches <joe@perches.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Sasha Levin <sashal@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, 	linux-kernel@vger.kernel.org
Date: Fri, 30 Oct 2026 16:17:48 -0700
In-Reply-To: <auUgX2kp9psrvQ6x@redhat.com>
References: <auS7NOsyw7pJ7rbF@redhat.com>
	 <eb8d1fb4e2a8a32ae1b71df686ed65be800e2918.camel@perches.com>
	 <auTDEy_vyMixVRTU@redhat.com>
	 <1ad2ae74e3257578cac561f19af63ccb94fce85a.camel@perches.com>
	 <auUPo66ISiR2gzmi@redhat.com>
	 <e184b73da5229fa387074fce2d977994f6464f1e.camel@perches.com>
	 <auUgX2kp9psrvQ6x@redhat.com>
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
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 3E6A920025
X-Stat-Signature: stno5xjewk166m64wtx9npufpf97ppdq
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+wT2iXEwe1rNO+A5mtn6Q9B+fo6cnRo48=
X-HE-Tag: 1793402269-718518
X-HE-Meta: U2FsdGVkX18lz55g5/JCTfYFeGEPiFI3PCc87cc4ovq5jkz/nuZi2ewI29+5ZZqWK4xt+ib4CxOh7OIh6Im4fmreJ1tKmzDuQM74EN538M9CjWn5ZG5YmaQ1zbwFyv9iWPGVv2/6BrKZ2m09bSKsBN9aknUDDVxLQopAFRvQ3zTr2agf4eQSuZjLQey8isHT5FyBg5Jz0veBdTi7Ukp942S6wvHSRZeZ7H6BQXXFMZNa+eLmvduD5ZyEEJQeu6xZK7VsJmQKo16CSthPM8hfhWwswl4lzc2uiT1hK4vWUQsLy6QNeNckPGLXPM8jzKya

On Fri, 2026-10-30 at 23:55 +0100, Oleg Nesterov wrote:
> On 10/30, Joe Perches wrote:
> > On Fri, 2026-10-30 at 22:44 +0100, Oleg Nesterov wrote:
>=20
> Dunno.  Depending on the current failure output
> > > > maybe adding something like the below is better:
> > > >=20
> > > > use Module::Load::Conditional qw(check_install);
> > > >=20
> > > > if (!check_install(module =3D> 'JSON:PP')) {
> > > >     die "$P: --json not available - missing perl module JSON:PP\n";
> > > > }
> > >=20
> > > But why? Why make get_maintainer.pl depend on yet another module?
> > > FYI, on my Fedora 44
> > >=20
> 	$ perl -we 'use Module::Load::Conditional qw(check_install);'
> 	Can't locate Module/Load/Conditional.pm in @INC (you may need to install=
 the Module::Load::Conditional module) (@INC entries checked: /usr/local/li=
b64/perl5/5.42 /usr/local/share/perl5/5.42 /usr/lib64/perl5/vendor_perl /us=
r/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at -e line 1.
> 	BEGIN failed--compilation aborted at -e line 1.
> >=20
> > Module::Load is a core perl module since 5.10 and
> > I think you are using a broken version of a perl installation
> And how do you think it is broken? my laptop runs the fresh Fedora 44.

It doesn't include perl-core ;)

> I used ./scripts/get_maintainer.pl many years, almost every day, and I ne=
ver
> needed to install the additional modules. Until ("get_maintainer: add --j=
son
> output mode")

I think that was added in Linus' 7.2 in mid August and in -next since April

> > and I think you should:
> >=20
> > $ sudo dnf install perl-core
>=20
> Oh. I LOVE perl. Damn I still consider myself as a perl programmer ;)

:) I don't consider myself one...

> But why do you think I should install the additional modules (which I wil=
l
> never use) on my machine???

Just like you have to add development-tools to that install.

> Again, again, again. AFAICS, this patch makes no difference if JSON::PP
> is installed. Please correct me.

Why?  You're not wrong.

> It just allows to use get_maintainer.pl without --json in the case when
> JSON::PP is NOT installed. This is the ONLY difference afaics.
> > > And for what ???
> > My idea is to make it more obvious _why_ something fails
> > and not like get_maintainer itself is broken.
> Good idea! But again, again, again, if JSON::PP is not installed, then th=
e
> failure message is the same with or without my patch. Just get_maintainer=
.pl
> does NOT fail without --json.
>=20
> Although to be honest "Can't locate JSON/PP.pm ..." looks very clear to m=
e,
> but you can make it more obvious with or without my patch.
> > > If we want to "improve" the errmsg, we can use "eval { require JSON::=
PP; }; die ... if $@"
> > > but this looks absolutely pointless to me.
> > We disagree.  I prefer output errors to look less broken.
> less broken than what? see above.
>=20
> It's not that we disagree... Worse, we can't understand each other :(
> Perhaps is this my fault.

I don't disagree with the concept of the patch.

I think we understand each other fine, you just care less about the
output error message.  What gets output now is from perl and I think
it looks less like get_maintainer is working properly.

cheers, Joe
