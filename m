Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377934;
	b=SbEXel5uHf8FQaRVB6sNt27lXKZPUyyTo4KK7owI+4+DSWxn7mgEc5pmoOqGNuuCMDGW
	 4xhB5g/YmHCgZsfS1ZclfIe5/LWb1ADXUDi/XwLe9fk+Zyl4kxJ0/I9QmFo2i9f4q7h/Q
	 0XxJzWJCfbRPDleuTFmXlD6Vrz79YXdTIX2kM+mNpQWuLFV6aDHlNr/rVIgeZlUMtCcvf
	 cWurPC95QV2ycaAEiPfrfR/ktTWJ71NsAC/fnRoJma4VOKDSLbcqNtU7CMWnWQHHDsBke
	 h3ISLDDQCx2zEUBkfvXI3TCvTV/P4KzFgnrEJMkXc5QLDKyxEratdzJhwDzpAyhmyGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377934;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=Q3hWuY0n/HyANKWSzNqNRab0TPULld/Jg3zuybcMvq4=;
	b=i2BjPfEYPr7yi6aHvsV9RnafXow+GDxtNpbi1YNBUDmIF/WnSqNzik2Xf47M+0178/lp
	 e5MCvjrwtzvCauijjqYpqedayKDJaRjCXHDo2ouKolbv7nCqX7fG4Psyvxa1q3mTa75ln
	 mJCiyGfAjnwp/D1APZOruKL45nD5BET5gep3po22cQ/v/7pGcUiyA31bKaj153LWZ8eyL
	 AwEBeQZh/AeKNvzYsr6zSr3k4FhLGIb0LOipM+Op4g5tJhZWo7K+3xdKDWm50vHrZEbPu
	 4Hbh8Cf1cv2ZoGvIIKZifCqvp3HfrqyhkXkBcTi4cjVFlgzH039Xu+S7uwEMz680QGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.14
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2224F606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2224F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 8926B14077B;
	Fri, 30 Oct 2026 16:32:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 74C156000B;
	Fri, 30 Oct 2026 16:32:10 +0000 (UTC)
Message-ID: <1ad2ae74e3257578cac561f19af63ccb94fce85a.camel@perches.com>
Subject: Re: [PATCH] get_maintainer: lazy load JSON::PP only when --json is
 used
From: Joe Perches <joe@perches.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Sasha Levin <sashal@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, 	linux-kernel@vger.kernel.org
Date: Fri, 30 Oct 2026 09:32:09 -0700
In-Reply-To: <auTDEy_vyMixVRTU@redhat.com>
References: <auS7NOsyw7pJ7rbF@redhat.com>
	 <eb8d1fb4e2a8a32ae1b71df686ed65be800e2918.camel@perches.com>
	 <auTDEy_vyMixVRTU@redhat.com>
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
X-Rspamd-Queue-Id: 74C156000B
X-Stat-Signature: fc6nczt4irs695msydbzuxy9dykujrof
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19Ngc9tV9Jnao8SVBjdArxFkh+VTirkb1w=
X-HE-Tag: 1793377930-539499
X-HE-Meta: U2FsdGVkX1/dnLf6IWtRUOoq8bEK+2JAvewD+VY35LNbg3+ZDZCmeY7CG+kYNKICnnti8thdyfhKdjM9jjDSslyjubXVdXzy5joef4QM7MoLkyr7vi3rMWbM++HmksD4mHcIN5FhmeaoJLE0uUo15o/07q/rraZo/YyBIF1+x7yeUEfvld9h/raS6IWOiJiWYQ1W9RQJcHV0kaTgmlgKLB4myLZpbfWJQ7kLM7D86Rl2evTPpCxdiqvKi2JibG393xniDaA++Fjy7xrSJfXfJepOYrIZkz0yQMnvH7J5yYDiPvcyG8HeZluVCJ41AGP2

On Fri, 2026-10-30 at 17:17 +0100, Oleg Nesterov wrote:
> On 10/30, Joe Perches wrote:
> > On Fri, 2026-10-30 at 16:43 +0100, Oleg Nesterov wrote:
> After commit 09d8b39563e8 ("get_maintainer: add --json output mode"),
> > > I can no longer use get_maintainer.pl; it fails at compile time
> >=20
> > Just verifying that you mean when using perl directly and
> > not something like perlcc.
>=20
> Yes,
>=20
> > > if JSON::PP is not installed even when --json is not requested.
> > What version of perl are you using?
> v5.42.3
> > I believe JSON is bundled since perl 5.14
> Well, JSON::PP is not installed on my Fedora release 44

Hmm.  Odd.

> > > This module is only needed with the --json option. Use "require" to
> > > load this module dynamically inside the "if ($json)" block instead.
> > The patch may be sensible but could fail the same way
> > if you used the --json option with your version.
>=20
> Of course, "./scripts/get_maintainer.pl --json ..." will still fail
> the same way without JSON::PP. But with this patch get_maintainer.pl
> works without the --json option.

What does that failure output?

> > > diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> > []
> > > @@ -21,7 +21,6 @@ use Cwd;
> > >  use File::Find;
> > >  use File::Spec::Functions;
> > >  use open qw(:std :encoding(UTF-8));
> > > -use JSON::PP;
> > > =20
> > >  my $cur_path =3D fastgetcwd() . '/';
> > >  my $lk_path =3D "./";
> > > @@ -685,6 +684,7 @@ if ($json) {
> > >      $result{web} =3D \@web if ($web);
> > >      $result{bug} =3D \@bug if ($bug);
> > > =20
> > > +    require JSON::PP;
> > style nit:
> > I likely would have placed this require immediately after the
> > if ($json) {
>=20
> I am fine either way... should I send V2 ?

Dunno.  Depending on the current failure output
maybe adding something like the below is better:

use Module::Load::Conditional qw(check_install);

if (!check_install(module =3D> 'JSON:PP')) {
    die "$P: --json not available - missing perl module JSON:PP\n";
}
