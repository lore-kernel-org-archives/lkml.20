Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48C03845CB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362953; cv=pass; b=hz234IcXBPLLpEN0DaBVMuigzChFR0cHH5rKBKcaWGEJyfUZ5kdvbZ4+3WdDqz28373Dq5LDDnBmHpyBRSiIIZLrpeNpj1p6EBsAvLEZtkRwDhZp1n0zE6xG248vqcqXTnDk3CTvRrZbuwq0nzezTaBzQVcupXiP2Sstc9cFgo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362953; c=relaxed/simple;
	bh=PN6EPY1yryWW+YLFcjEUwHC1lGp1pOZRRH3avkGam3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7roEkiAEoxVmPMU5bcmcJIKLLsM9xp7PZDhFmUKMS7CBZ61p8uiH2zJlEpxG/Mp185+VvBScg1licyz2/pgK2ezqFdWnm8RBizIP8lYEObEwJyEOzsEshvwr54tBwXJXFMrx+mB2dlGaSJZju3bMZ0yyxQzl/Qmck5oAYEOumc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=tXr3ugRo; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="tXr3ugRo"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6d28aa26cso19359465ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791362952; cv=none;
        d=google.com; s=arc-20260327;
        b=JzViwZjVbaFCmCpa5tNonKSRyZiWEXaigC+R1YeOqje3N7MPUrNTA/L1LB5LDxBrwM
         OiH6IdrDUI021cr8L80k1A8CBVczn+uKKpIVUDBD9oZOjLEsDJQVnsVz0tIAfwQLifdx
         Bd3bTrMaV9oBbfie2nh6kikoTd0nk+ElA4qsF6HhdBqOdw6e5pQnaJvQ2qw54zPt+mRj
         s69OW1hV3vgZSdPK2Y/PxAYFdIFP1yMJBMrW5esXDA0mkw+Ka1ExOnuga2hDbD0oJFS8
         H7H8fx87LXeQZ39eMR4cyx6OGj0ff10AcKEoBnTiKGgqeoOi9rWvvPiCyYiPX32wPMUB
         S/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7mWXlw8htwSt3nqOewVTDtCFW9iqaV8AEvbO4v+RrdY=;
        fh=b2rwPhaYAbDFbI63m3OiGE5d6OnR79wDhwV6F0gmiXw=;
        b=fMy1Y76AxC2mdlUKy6G1kUKtYiJWdIkGg9R7Q+gjKnkgGRiGIBSSNcHHxbd5+mLhHo
         6GoQ4oiAy2nwj89gtOxmcOX4gozgWfsKZxspNED79RsAhUeY8tbphYZDR8D/+CHaNlXQ
         jzEZql3KOnYp66ELmso7plMw6KNyOeBcLtqSxpZruFbotadAs+/LVyZU7IQt3tPsaYm5
         DZbJaQFOd+fIL9yiq1eUcqKA+UUQm6F0E6yer55QfUx56JdetPwiTsliSyNyNeaBWZoP
         hH3cCj/ae0f1GEfP5ta7mWN7O4vqO6OVR7rHKmlT3qUYT/sDZ9JAoyZW2hQiDz2pPpM3
         7Okg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791362952; x=1791967752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7mWXlw8htwSt3nqOewVTDtCFW9iqaV8AEvbO4v+RrdY=;
        b=tXr3ugRoKe0hWT7LoaR2jZI9AFLFM8Ywg/XZtlv5uoGFG0/X5kVrerfFtPFhrztc9Y
         zXfZT1at1usZPohxymMMcmCWZrPioA0jzhtvI1Crs7WHaJnGN51lzo+n+r2OwSmH3crM
         KLpUN40rXDWUqYg2498yA5PhCbMBYiUZGeKnS0nnembaYf609Ug64r/OFN9G1hanDYfF
         2b75T4pUHs9kPBZKJl5XdT2k02epCtfvXg00a3NOSA3RlxzyPMgvAerdwygXVXYS2A3t
         C4AjsXtMH6K/bfW0Xg7utkV2l26mAhGI/cRRFPnDa9WhWIrkQ01CN2AAdBS1WCku+vjr
         qc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362952; x=1791967752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7mWXlw8htwSt3nqOewVTDtCFW9iqaV8AEvbO4v+RrdY=;
        b=OVe7VJXEZTO4CLGDd/qOGq68yrWK+ENb4sUjYaH2yAXv6UlM36C0e0RIVjAzEZRsfd
         JcLFcTM1LfbDRWCIAF01qt810Q8LbPx/2pnALuOQWjbzib3Hf6KDvBzc0H1sYziNMCZc
         oPiln5D2MKpJDfUjt9Be6OQw6drqByQFXiBgDzgWZNO+r+hYESK/dpbiQ/oE7/yg7YMZ
         6FiGQ/bKvD4U/oJReS0t/36nqZeJ558RGhfe6+Y74Tud8dyIVku2x+C+hQtvfDTuSjRO
         uPl0rSJ+d3v+jWCG+dXPH6E34M71At3PjptxqCqVpxpPRCFu0+668Zd1oWqTl18BcXGW
         X5lw==
X-Forwarded-Encrypted: i=1; AKwUvBxhBrEyoGcImCyCiFQbvefZESOISF46y+5Yz/SRwZUKwWXw5paLU/baPvW3MTyEv+So9nLYui6GaCa07kA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVwPbuKMI7a1BUpvZ2Xh5trNvaHlA0rcJerF5EJPg4vzNABwzx
	96ORYZvZegGEndu3p7x5PY4CV1qhzl5btamiKtj7QQJW6pB0Ck9VWNxBNJ6KmRh18SgVDmj6dwb
	rW6+LomxOcDswoC45Rgg9Ti6w+65HP/fkBx1P58ciNg==
X-Gm-Gg: AYBFou0HIQs91i3gjZBGeg+WgOdsLV9KsxaDUYAj+AQ/VqGYEcNlivxQW3xG7essZyC
	8C8+5PActDV47n/6Hw3pNMUKIgfzOfvLUlvHD7cZMzYMZRaAhOdz2iH3PCmc9U1BVNSZ3riGOGb
	vdF4sQJ1fQHqZsp1XyH8YTx6EDUU+zcs8pBuVBl4HBD+Zyhgn9s4omIUFJPAWg7Twl/9ZgT951u
	ln13wLqh3k1EioXBtWGPRi7KktUvOuWZLNSOQYfA0arIVSlggrdb9ggdbxxOmvzK+OKBHj8KSNx
	FryUY05Z6SxaAvNFa7oBe3kJUJOajfVRBUkJbW05NfuFvJ/JPe5mXvqIov2Rj1Hc8RU7XhLKTbM
	hwCwl/L+gDacOUcYYssQzmzOBl5dua/L1Hxc=
X-Received: by 2002:a17:903:2a8f:b0:2e2:cbf9:c250 with SMTP id
 d9443c01a7336-2e5ffaf23cemr14312045ad.5.1791362951863; Wed, 07 Oct 2026
 01:49:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930122305.293686-1-robert.marko@sartura.hr>
 <20260930122305.293686-4-robert.marko@sartura.hr> <20261001-splendid-athletic-coot-1bbbb6@quoll>
 <CA+HBbNEOiAw+_zzQco13nNzUPdGUgo+kjcRzLFEA4LmnzF8_=A@mail.gmail.com> <a2bcd146-0462-4ab1-b7be-93d6b4e05056@lunn.ch>
In-Reply-To: <a2bcd146-0462-4ab1-b7be-93d6b4e05056@lunn.ch>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 7 Oct 2026 10:49:01 +0200
X-Gm-Features: AclHuK9tvJ8qSGCNxCy6EHx93K-on75TQ8ncLTFdBZaNwxDWm7pb3b5jo-_JQ6A
Message-ID: <CA+HBbNGUbR3KeZMaWoBqEqMLMkELMLxuL4taCcOG7V03VsuUEw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: net: maxlinear: add MxL86211C lane
 mapping support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, hkallweit1@gmail.com, 
	lxu@maxlinear.com, michael@walle.cc, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:33=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > > +++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> > > > @@ -22,6 +22,21 @@ allOf:
> > > >
> > > >      then:
> > > >        properties:
> > > > +        maxlinear,lane-asp-map:
> > > > +          description: |
> > > > +            Mapping of the physical TPI lanes A through D to the P=
HY's
> > > > +            analog signal processing lanes (ASPs). The array index=
 identifies
> > >
> > > Are there other lanes as well? Not ASP? What sort? data-lanes does no=
t
> > > fit here?
> >
> > Hi,
> > I tried to keep it similar to the datasheet, but looking back, a more
> > appropriate
> > name would be ASP instances instead of lanes.
> >
> > I am not sure if data-lanes describe what it is fully but I am open to =
ideas.
>
> Analogue front end ports? Or even just analogue from ends?
>
> I do get what you mean with your current description, but i have more
> domain knowledge than your average DT writer.

If analog front ends are fine with you I would like to use that in
next revision.
Mybe keep the "(ASP)" so that anybody looking at datasheet knows immediatel=
y?

Anyway, I am flexible.

Regards,
Robert
>
>         Andrew



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
