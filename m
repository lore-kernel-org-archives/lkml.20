Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792963963;
	b=reChDM6y+eIbC3AFkmp5Kxbr62qR5/V+floH75fNTOYvPBsqzLH03LZnmkcon0upJH8F
	 WrCzFd1m7NDzqteUj2lqi6nk7xKwcRBFqL6mw0z7OsU+W1YuETS9bPd/2A2iGVyAF2aTZ
	 063GzT1aCBJloQf7ToUeDQKXQmN2TgUMV0xEbEDOMsHK4zq2eqtmnLuEiwfLTyPMg+Y6S
	 hgPQs516NgnlO2xningUHBjOyxgH4l+tnNQMA0O9BvvIHQL+sgcFA1sIl7r0d8XMHEGp/
	 H9id6Iw+WemhZopmwwhFktJam7FflJ+7ALlavfPmwp2K6R/zDEn5vJf4XgNIJiJmT+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792963963;
	h=DMARC-Filter:X-KPN-MessageId:Received:Received:DKIM-Signature:
	 X-KPN-MID:X-CMASSUN:X-KPN-VerifiedSender:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Priority:Importance:X-Originating-IP;
	bh=5vuSnrcKwQeIRn0wbWhYdGvFkzDXojcWcGjlh6QDcMQ=;
	b=lEOqwpuUL7uzQKSNMn74uLXFlK0udutcuDo6Ft0JvNZj8eY4nVICZGw+XXr+m2a1JQ00
	 zSk4WLlVIBVefdO4N6CvgbPEUokMFjC6DUL1HkA2hYyf6KsYzCh1HvRCkgA2W+jV6bzW4
	 C/suXEkXekmKcUtGqvfZ6owis5E+eNSVyHJHHAiqyP3DdhsVJxrIAmF61CoBkJmnfgEcI
	 GCIcRbIJm1tgdnJochA4pJiLzHSJ8oJEZ8GVhjtPnihpizrlZi99znKnfOS+ThJGcZB00
	 hDHuxy0cMkrofkj50ZeXXLk8VdhMOTFnT2fEq7NW0lInsbFDF8Y9rKH0c5orJDcdDRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=H3Lyxcaz;
	arc=none smtp.remote-ip=195.121.94.186
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F63E606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F63E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=H3Lyxcaz
X-KPN-MessageId: 957011bd-d0bb-11f1-87e5-00505699b430
Received: from mta.kpnmail.nl (unknown [10.31.161.190])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 957011bd-d0bb-11f1-87e5-00505699b430;
	Sun, 25 Oct 2026 22:32:30 +0100 (CET)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 956ec94e-d0bb-11f1-a8ab-0050569977a2;
	Sun, 25 Oct 2026 22:32:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=5vuSnrcKwQeIRn0wbWhYdGvFkzDXojcWcGjlh6QDcMQ=;
	b=H3LyxcazLjO3BsnaA/eVkplsL+87/CmawTLYkHaxYk/dFOV0AArOCWWmMM9siWMYX+QVYW4fXMdoz
	 n+y1CYUr1kLJkx+afjXan79gwEP+f3Bm7qLWvdmwa/QDJr7qtNZPa3C5OF8NkySQjjmSyTr1pkuu60
	 fJWOZT8Lq4Yi+M90VWLg0k2yj9eZtQoe0R1V6XKXzSwLKHwt5LiEuzrDP3IganmEq4SrfeGHfVHWpn
	 y07BfxOnHxLL9fTdYZcSjRwa8xmGSuRYdHeTh+IE9423XM8ZY4olu3EHPioZc8kgxs7Zff0hO3BNYE
	 fn5gf0VyY/TowodKJaUzqb7pBjHgKFA==
X-KPN-MID: 33|ewbb4jy8pZhqwJOE/4BRNgw3degIzkXnoW8litV1V+IUNVtk2goIwP9dd+dxvN0
 3wsQCfDGArapfOl4Vp+ZnZEJ/n2ql7zr+sPIY5GEKWPU=
X-CMASSUN: 33|sa/DoRaLLkvYyhWgxj8o6+RtIBFbDgoUcwEDZcjXQXI5rhTaWxTQKQX6mY0/ihE
 XcmKn7Ys1ssMhmsXjlSQamw==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh03 (cpxoxapps-mh03.personalcloud.so.kpn.org [10.128.135.209])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 9562e720-d0bb-11f1-90df-00505699eff2;
	Sun, 25 Oct 2026 22:32:30 +0100 (CET)
Date: Sun, 25 Oct 2026 22:32:30 +0100 (CET)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Message-ID: <345522644.2279143.1792963950889@kpc.webmail.kpnmail.nl>
In-Reply-To: <atuDosjEibZI9exi@gremlin>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <20261013173240.GK4214@killaraus.ideasonboard.com>
 <atI_TSQXzAQFWBfx@gremlin>
 <20261020211532.GD15441@killaraus.ideasonboard.com>
 <atuDosjEibZI9exi@gremlin>
Subject: Re: [PATCH] docs: remove Assisted-by references
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal


> Op 23-10-2026 12:44 EDT schreef Lorenzo Stoakes (ARM) <ljs@kernel.org>:
>=20
> Again, to me, it's just a scaling issue - nobody can read hundreds or
> thousands of mails a day effectively, and maintainers and reviewers are
> past capacity even now.
>=20
> And agreed, we need talented young people coming up and it kills me that
> they might be discouraged both by 'AI will take over so what's the point'
> and the hordes of 'competing' people sending slop.
>=20

There's a striking parallel with the mathematics community in this regard.
They are dealing with a similar problem where the old way used to be you
make a name for yourself by proving a hard theorem (Linux equivalent:
you make a name for yourself with sweeping patchsets.) That does not
really work as well anymore as a signal for competency (at least in maths):

"Among the mathematicians I have spoken with, the prevailing sentiment
is that this traditional mechanism of recognition has effectively collapsed
in a matter of weeks. A strong mathematical result, by itself, can no
longer be taken as convincing evidence of a student=E2=80=99s independent
mathematical abilities."[1]

> Perhaps there are ways and means of getting talented new people involved
> via side-channel, though.
>=20
> I did the 'eudyptula challenge' many years ago, which was a sort of boot
> camp for kernel developers (with a lot of 'are you patient enough' bits :=
)
>=20
> That can't work in identical form anymore because of AI (sigh), but perha=
ps
> we can figure out some AI-proof version of this?
>=20

Would it be worthwhile to organize some sort of informal discussion on what
such channels might be and how they can be organized in an LLM-resistant
fashion? It would be interesting and useful to share and collect ideas on
how the talent pipeline should take shape in the LLM-era, so that the commu=
nity
can ensure, also in the future, that talented and motivated people are cont=
inued
to be brought in and not drowned out by slop or other unwanted hurdles, suc=
h as
having access to very expensive tooling (a concern that I share with Lauren=
t.)

You and Ted have views on this; Shuah runs the kernel mentorship program; a=
nd I know
Greg also helps people get exposed to the kernel through various means. The=
n
there's GSoC and Outreachy, etc.

I guess a lot of these people will be at LSFMMBPF?

Best,
Jori.

[1]: https://terrytao.wordpress.com/2026/10/18/will-it-be-a-golden-age-or-a=
-dark-age-for-mathematics-and-science/#more-18496
