Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B250457E5E
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726915; cv=pass; b=DFrmYPLmEcW1/bmX0c3OKk3xetWxMnleJeGQN+Y1HAecG5LWDvGsoVn3HgoBFJxlGpTqbLOucYX6JHwqkyU17Px0A4kO7jNISBvGvRZ/Xd0fsEfepj9eQEg8UWxrYrtAZ5/A427uek4iacvEk04NkN4VHpzn/9TXAcloUQvyg58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726915; c=relaxed/simple;
	bh=RPdJBjQS94rIdDl5THsCbJPnrtAJLZNHcWn57qXRaUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ntyf7M+XWyPTOm9UIaHsxEq4F9MFKYj7/Pohc/wxucrIHeZlg5o4CXm+JrzqakB1bZA8YFoyueXwPz69Yf1NL8lc6mmnxq3u8FcraQzjjE25p2cNb/deEocGcObkBBQl6/a8TXECHhdRcWNawxRyUiztLEE1zokVBfc9mLk1wSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvHigOoe; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvHigOoe"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35829219da8so1053566eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791726913; cv=none;
        d=google.com; s=arc-20260327;
        b=g6shGSA3sQlwlf/HnUmqrUZdCuc+oGMs00fOI5kaOLO3gYHwVcA1R2UfXU86wOl8XE
         iLOHTgSY4anxJHD1Td8UKHBOnlItrquItcHd/7xzUnwYcSg+u6zWNDWniJeQzguczteu
         sq2CoUFFMhBKd7a1EHuZDi6fV1qs3hJ5sOdz3uGs2zx4jHxkIWCDLiXTeyBM845eyDVb
         KQ5CZCah4CAs0BvoejRE31qPdjvEjWdXe8bhHAQ52iekRId91CoGylC8SBkNNBk5IJ/f
         aHyJUmdeGabKYy20PmGN3O5qtgo6SNXMslufcFmnvhYwpCNJ9xu6vMEvzZ5z6rMobxU7
         5TdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yzc0OsJfB0tmO67jDz0GOECRwoKeZWwFGcdPRYCLXGk=;
        fh=LDiFLS6lsocB9azte+jKBiEqAwxzonksN7LHv2Afi6M=;
        b=q5D9xbjKX0fwtmlmzjrWYTL5CGxyh6TfJOGAE1Z+U+Gd+E2EV066x6j8fgLmgbNCzn
         ILFafoSvFYH48a5mSKNSKHyYw63FfnVVMfIeFXiTgASIR6Dyc1KPyWQ04eRZBHhbmf8k
         WdqSHp0hMATx3aXt40JbihQopwAQOt/cbIW856ZdO6+OsBBWzjei2HATuvADRNqFNsoA
         le/ItTn79FPYL2tp0oZyNDbOzXaIf7ibFUzcCrP2V/+51MMQCA8WDxwtU0J9L0jm5ScG
         dcw0oLTs3OePgJc4Vv31Pbh0KrlNH7/ONyZxzSqQf0hxvQ/o2MBsuEfoO4aHTZ+o+KwP
         37oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791726913; x=1792331713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yzc0OsJfB0tmO67jDz0GOECRwoKeZWwFGcdPRYCLXGk=;
        b=bvHigOoeZ42WfySP5kE8X3ncfWw0x5k1rA/B9Kr/zfs8/8wB7RNB9YJyggYWKRkwhf
         Gb0dGSPBCmoHx1rWGZmuzYiv5nG0UwoOGVBqqTuiLrzLHW5v6bIl8iYXT2/y/YWZWMhd
         8PgGeFruFMyU9thriQ+YoQLLHMkpjEMMOrm5oM1Din9bqblFq6XP4gIs3OY3IEWO9dvl
         wCdDt+fmKCQbDt+NWoeAdm4vrhc9GIImxI+x2pjVv8Fa+LralsPFgKybb8yhBuHW1Moj
         zU+qNb67poGcYJ91Ve00b8mK4LBCTpqRzCKSdg3SMhh/iICo5RJgAzVjVd/YbstexOfz
         kBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791726913; x=1792331713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzc0OsJfB0tmO67jDz0GOECRwoKeZWwFGcdPRYCLXGk=;
        b=arXVLAkG95p51vFkd+R8ulzaYnKi2alKaEJZWAzKA/e+s/9M5L+lRP7FUH+nWsP67g
         JFMDWfu1d8dYPuZRrQAcIlQmvG+M3XnzeOgwbHHr4l5DlCQs9hLvNMXsCajCYGFfVQ7M
         9nTwidaIM/2Nc/IOVkohQSEPopqhT/qbmAxblZnj/i0KJw0EQjnRV14ZpNmyJVMQYHj5
         9nvNstkjGSg/j20QJNipxGuSPAsLoMOX0rz3JonWa2ca+3m48zl1yCx99zCCKS5romET
         J4mF4msPfTHxXCAeXdtTn6vp+BupuVpZTodjhybZlA+v5r5hkbyhLoFQioh5bIKD5D1J
         y4Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxTeQU+mhMVd4Jn4jJxoujm1qgtQd4YVDL7kv2PYs3cBWNSP/xfn3TX34YPVUz/LCl5i3jT+5m1S/bOJx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsGJ1xTY+D1DcR0LOD7F6Mz1VoOTqAsvFc4bM08L9CgPbxLwLt
	gBtuDRcCqGKSUiplA1dDA6VNwTVRIG2//4bjlKgWUT//ZRvimgfKvXp4fsJXYgS8CcaZDetOJz7
	VP6lgcqqP4RuON+MEdtm1H8UK9/VhFCc=
X-Gm-Gg: AYBFou10P29usjX5ZKhTicH3PPiDkvFF+IOLpvGjVFfD6ZQA4bra4pneHT4ePc+w/Ft
	9yQ8LmmN2+XSKnzO+HjN7yV2PvhOIjCwxuyYMNalDo3E44gWpFltMBTF1UbKlKag4KWutKkkkaT
	2W0YYUr4+8UEKt7IY278rgsnzB5dzJnOjpXx0UFN2/Futku7Iri1STjdtuK/tVDA7FU0bgsetpC
	m4RyKvsM85HbK8LgkcWe478wZQPReLlrV/BpHi5CauVWFgzlTk9gDZmRofrhTmKH3bZMLSp7SC8
	KDvSC3mRFxgOgtONlvP2vI4QU0biUMOTRWubrbwquQWBXSUs99f2MowYDCwrAwOoxH81Z0WdFZF
	pQykJf6wwFf11
X-Received: by 2002:a05:7300:ea85:b0:359:fb64:11d7 with SMTP id
 5a478bee46e88-359fb64144dmr1830270eec.11.1791726913446; Sun, 11 Oct 2026
 06:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007085457.98762-1-clamor95@gmail.com> <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
In-Reply-To: <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 11 Oct 2026 16:55:01 +0300
X-Gm-Features: AclHuK8-aWVSqr-fIGX2d6PvgsPFFBa82zkZg_sbnfasoFphZhxLtr43s7c_jd8
Message-ID: <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:2=
8 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> > Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Fla=
sh
> > inhibition.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >   Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.ya=
ml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > index a65d92522c9cf..596b5e284f44a 100644
> > --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > @@ -31,6 +31,10 @@ properties:
> >       maxItems: 1
> >       description: FL_EN pin
> >
> > +  flinh-gpios:
> > +    maxItems: 1
> > +    description: FLINH pin
> > +
>
> You don't seem to make use of it in your patch.
>

I don't have to use it in my patch. This change completes and improves
hardware description of the AAT1290/1270.

> --
> Best regards,
> Jacek Anaszewski
>
