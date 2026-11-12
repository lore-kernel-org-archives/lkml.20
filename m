Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794486924;
	b=4A5ebC/waLc3pyGb508Qg6MvNgCuFW76PRN7to9yc5kj0mpih/Xb9Bde+hYha7H5eW/g
	 SeFsr9+rZpWlAjgqLkeEfdKz5bvMADMtT37cCJlhGPtxUINoYaB773ExqW3vb32ff3c5v
	 yaJGZA0Frhq3+SkR3YZn7WqwzC4ze4j9cF6WcmA8H9jVuR9UcUjQYfWKgiNgKmizUlryb
	 abyHOuCkDnhAkczO08bBZTk5h3PvV47UOaIoVFmQMAAr/9SMBAF+XXb781WBZnm9qF56x
	 JdemU80XnLMrpGC6dDdrgzC7qXjnk4Q4DxWmIcUgQBGEY6Z7WvAmgtTrNcygTbkWa8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gmfeXtI+tey0F/T6j/hOfxDyERZ2N7Ic5Vbc9BTsdyQ=;
	b=zvEuqMHfQAndyHXh2qct21W+dkxj3sk8jjY9B2TaEuxTbugNjeqSsoahUsiAyUE1j7V8
	 hU11FmeZ12ACpgiGUo/B0Efu/4oL7NjkzVbPtCPN8pExjFUK75EPFkRtFa5R9j3nW4w6l
	 VaRLhTLjN73d9x/SMWfHiIqIv9CKSK3rP2ec6hgrJDHFajUfa7tqCsRmd97QMHA85cPoC
	 8tpKBB+Uama5oMUsRpc94Wp/rSjnxZDHR9nRId8SJfICqPAro9W6y2H6Y5mPOeC1B6HCx
	 dJQJTsgtJ1Ao7bVVNm4Jzxe3MW+xR9ze3/89HK9HY3FQeMHuLOdlKPdCsiEcBZ+CtKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ums0J9tX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE995606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE995606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ums0J9tX
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so32425695e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:35:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794486922; cv=none;
        d=google.com; s=arc-20260327;
        b=gez8qv/g/qSVxEyyS9F4gO6DyEcYjihkredquHS0VgFfSosI9awFQUSPIY1XoI8TVK
         pTmnKAUxXUff/hZhN1aeK18aEHmG9Rcoc6LXrC4NyPac3hulfaDXHPreaEzIUQ6RqB36
         BDaOpTJgjom0iLzweX/unlQLPt+NHTzcxxYbk6ybFZBnKvsgqhn54jPENJrkUA+bGbwN
         4q4V9/Gc3NlBJ6Go+EwJd+wQGdz2gFaVxOeZcpi31vEa6ZZPSL0wqe5KTaNiVvrH2dT5
         qwtfv4PGHpWND25z+jvOxfTI+xL0h4hZ9T9UWIX2VQJXY2r1mm8NzW+p+x0TwSaiFOXt
         p8uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmfeXtI+tey0F/T6j/hOfxDyERZ2N7Ic5Vbc9BTsdyQ=;
        fh=ik7x6uQ51hpJSW5opbgl4SsorN1n5nC9e6XcE+W56v0=;
        b=qFcAgzwv9JCqMnNuEKNP/0V3gtvJG5OaIjGwuuMSxtY5SRYHC3q7OrSoM9DOMAoIhN
         A70C2Ttye9QpUZf7RZFKzR8KXvHllkBSRyL2UGCmv6iL56NA+foEpWOx9CW3upoKv60d
         UtMhOg5s7apoNm62TxmKikB5bMiVS9GyVKhthmxwrxY/ZPBUcFRHrLQQx0spztfFEyXt
         MMyl2DPTdpoVN9+ThHvA0VwI9Oe0y++6UHLklYWzBzqc2ULKNaye7X0rIogTpsFIEYuZ
         DLbNP5F31vsSghMFsxhXG9OBkAkGbPhlBzYv5t+FXFqoCwPbW24rYfLQB0FYkV8o4+mM
         +g0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486922; x=1795091722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gmfeXtI+tey0F/T6j/hOfxDyERZ2N7Ic5Vbc9BTsdyQ=;
        b=Ums0J9tXeHFKhdP+fol+vzmGnv1+Fue5K3B2lj8LLRXkHXY3JaZgN1a68UZDyVwlr3
         b+0TXQx6uz2DxdQO9FJRj6XA4Pwp5YiLBfzHunkAP5nZXfa20p8ohSXA/npzC9fTPsof
         YCI6CV0szHYmKPkXtlYqz3aToZBEJPSZnO3qJny8ZRSWwckefgqbggkEwAI5aEzUA0Vt
         ks8xjf2GELPaPEaJ0BQpF8FQOm3C6U7vbbVBf6l3M2MbyEnOxikMPL1dXYKfefIFcB7Q
         NDEggS0PaVnv+7mUAzLQBIW9SgIF2fBI7ZuxfzOOKngGjXrCabf714t5TK6zi46fwp+G
         FNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486922; x=1795091722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmfeXtI+tey0F/T6j/hOfxDyERZ2N7Ic5Vbc9BTsdyQ=;
        b=TyZTCB5OR7e51AKxQwB+F7xLar414X8qY572uvsBLD3ypr+U5nbdUnTEwoGxuPKFgS
         6CpIJWeAq1cYpDQwLy3JI+yger2yS3tZU8Eams7aUvkrcZi6jpCSNfjOfdbzOKf94Wl9
         Loq9iUBwGuQc9KiAI4Lfc+XZj8CHrzQ29ScTdGIciGX4RnS+JYk9KX63njO0nMhOgnSL
         JIl5r5HXDKJ2dLi5Tul+R3EjtUhUJVpNjm+UvQus2A8be77FDW6LIZi1E7E3//fBMb3s
         w15+fadkWsuAzQn+61iACUgNMIPL52rtonW5t42VSywVBSzXyaInYhZpbn0Om6g8VAUo
         4SWQ==
X-Forwarded-Encrypted: i=1; AL+hErG7rAgWeNqioBiJNF1tI7zx0exH/aNSrdI/TOekwclMR2IUoXo0g3q5wps/Chv6xXtVEojH0Vy0vu1uDmA=@vger.kernel.org
X-Gm-Message-State: APuU4Z80s2urcT9l8b1Dhm3Dsk5CGrWwswCuPfNvxBBQTO3dmRiHSLjE
	I4VuRh/ppWzf7sjwCoQywgklXDq8Uyvb3mCwjpWSZlEuaPY+dxV5PBTZMyMIZAYk61fd4LLHoR7
	pHXtt2e03DDwPbvkogyoFQ6du1JytnNY=
X-Gm-Gg: AYBFou0GA7QWdLsLGdRUA+88PSfCEj8sTFL1AkhmcVSJaUn4YJpQm9Lpq66hpUz2+M8
	hnWaqzZsshUjnmZQI7O9cPRgOSX1Ze6Yoa8t3nR7zUmTi7T2haNm48duURIXrKn9c1PidasgJqp
	GnumZ5vBtm+I88ia/tAAyfRWxILQL6RE0wZyrfko/W4h5ZYEp8MkhcaN+9tKl+HK0dE8WRa/SSQ
	3KnCtSIyiXmbRimY74Pi5rSM6pWHZJbFVjxCOffsKISJVA70phYl0S9Lqg14oSUZL698IR8UVIT
	0UZBWmO62i6ONdEH4/J0HFPEv1U3yZLNFxb+7/mbm65fRbNS1hJ+RDnvpKukXbKZ8WGkIIqE1fT
	luvxUeOqZ0XgoePHwxM+1NekoqTPZnwIwBGGSuIkk0Wi/ExpfULoZkKMqnm+5vn3b4KTbGUJ0tv
	rK87YDq2DVzEASQjCfEE8QQkmbjTxn1x3C+IpgOSDXr0bezhT3x4MDUAxxX6n8sMoR1fG3i3jdq
	p+bkTqdUbUIx2H0f2Eb
X-Received: by 2002:a05:600d:84ca:20b0:4ba:493b:3401 with SMTP id
 5b1f17b1804b1-4ba493b3412mr59282305e9.9.1794486922109; Thu, 12 Nov 2026
 04:35:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261104182105.1102555-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261106154454.GA3654918-robh@kernel.org>
In-Reply-To: <20261106154454.GA3654918-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 12 Nov 2026 12:34:56 +0000
X-Gm-Features: AclHuK9CRcx1aTAbEKf-B1mAZlFhg1ndxA-uzYSl8n-I7fAtC3zV5PucT1NF8gU
Message-ID: <CA+V-a8uN1D7CQmKtAizY40NUOXHDLO2VG8JiAiLTyNb6uG=9jA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 05/14] dt-bindings: net: dsa:
 renesas,rzn1-a5psw: Disallow ports beyond port@4
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thank you for the review.

On Fri, Nov 6, 2026 at 3:44=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Nov 04, 2026 at 06:20:53PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Restrict the A5PSW ethernet-ports node to ports 0 through 4, matching t=
he
> > hardware configuration of four external ports and one CPU/management po=
rt.
> >
> > Although the schema pattern limits port nodes to port@0 through port@4,
> > additionalProperties: true allows other port nodes to pass validation.
> > Set additionalProperties to false and explicitly allow #address-cells
> > and #size-cells so that ports beyond port@4 are rejected.
> >
> > Existing in-tree device trees describe only port@0 through port@4 and
> > are unaffected by this change.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4:
> > - Added reg items validation for ethernet ports
> >
> > v2->v3:
> > - New patch
> > ---
> >  .../bindings/net/dsa/renesas,rzn1-a5psw.yaml         | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5p=
sw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > index 9c477ceb170b..250c59e58439 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > @@ -63,12 +63,22 @@ properties:
> >
> >    ethernet-ports:
> >      type: object
> > -    additionalProperties: true
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +      '#size-cells':
> > +        const: 0
> > +
>
> Drop all this.
>
> >      patternProperties:
> >        "^(ethernet-)?port@[0-4]$":
>
> And make this "^(ethernet-)?port@". Then any node will get the 'reg'
> schema applied. That doesn't check the unit-address, but the way to
> check that is comparing it to the reg value (not yet implemented except
> for specific buses in dtc).
>
Good point.

>
> >          type: object
> >          additionalProperties: true
> >          properties:
> > +          reg:
> > +            items:
> > +              - maximum: 4
Here I can drop items and just have something like below:

         properties:
+          reg:
+            maximum: 4

Cheers,
Prabhakar

> >            pcs-handle:
> >              maxItems: 1
> >              description:
> > --
> > 2.56.0
> >
