Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2AA518120
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790028403; cv=pass; b=oJYN0z0THBIb9vm1A1RAQS0/fhX4FXZk7BaA/NzjPnWLrhj3qpFEV8IqfEyZ3XMNTBNA1BcUO/q9hiy6WiStXk29N+QravHYFuibutu9/UyrqOWg/qsVZRM1eymEgODACf3D0xaNGfst+e0maEQ7SMGgUZ49YDAW54jmTIyu3Hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790028403; c=relaxed/simple;
	bh=1cCHGZg4oO6GfGJZo6/tDu3G/3YgfC3SD/e3SnMkwDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csbMxah4Z50Jmq/n8o8QTyprmpkE++tSYbRWOk/uIwzvUgLHCrHSEioR0Id2mMTb3stuRnSj2vfzZedrkGBAYckE/Yo3Mks3zppWGgtEjGrXYZb6r6hVlkB/he5qnF5uyEmppwlDCbnkXnFBCpWNHovgzz1A6vJitxBkBfDj3IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ9GQUvV; arc=pass smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ9GQUvV"
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso4123049a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790028400; cv=none;
        d=google.com; s=arc-20260327;
        b=YHlM53geLqa2Yq2SNDPY/zAkYz7z8Q1hA0NWj+SPe3PwW3z6dptTftuGeV7tgUc5tE
         SBNuYBhVKPNdlJWHHyOdfLyfnE9F7jrV99XR6LLvyeOFn4DVyiFewyoDiyByGpeGDCrL
         8Qklx8vTTsa0xcgSxURIJxhlVvRiD3Jo+yc4iD3u234XCIjj6AUa5qzJ12+koepfcy2+
         l1q5YjyuOYPxt1yWE88qnuOuPvaL5q/x3+B5tx8AYJ/iNN52lEQhNMzr8pSsHcS9ON3n
         DPj9nxtNmbEJo3QzwcydGfPZqRSAhOVl1EvozMjDU2q95P8XFbaXQFyB5fG1NsyrfO8x
         FF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=;
        fh=8vT+cnCn/jfdDe/xP3Yq6e7Og13zfco2F1ZpPGL7cRw=;
        b=ml9+uHFV0OB0AjF1qkrDQ7+OlnbElvIJVEv1gSKGIv1vav6ahNU9AgecNcyFZfloCd
         2k9O7CHyEiYKQUDFo0CzluJnDO+cMu32QutnthTnXQ/lxKJ2OEZYy1V4DtT2uwewevtw
         z8OTuPn3VyZ2jUPwdnuv5LK2KkP7/5LCg+vzRibte1gnuugJwbZdsCfXkmqIEmojiEcz
         m6N+YfXf7l/QuOr064iLHL+KEQ3nQ+Sevx4q592+g5qNOwggV629pjwoAhNJNWkoX8dl
         rI8YrcBIvaqGq1ynKra0R1IFdd7dT7ztSdLogOKqam1D/ITBJ/94VMM4RgFo7sIKaYDW
         2bAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790028400; x=1790633200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=;
        b=kJ9GQUvVZYDV0DiCOWUhPfvXSa8tNDCi0V3H0y9QYvJteNNyZr5tfDZjb9CfNZpUVc
         kuKD0WclDHViMj/HpUswF+rjyKAQIkacbXi3VRsloG5WQ4iCr5rQFQjge+R42Ob3cPDF
         SZL5OiupviioBAjfRwr5H8xS+yGsuvSHThXJsn3VGG8rUL5pG+uiBEB02sbPoGUdEK0Z
         EN3VFNz959tUzg91nJbTe7htjy+HMQRGt1+zeb1XEd0UlLLtLzIcbY9M+4rwQGayWS4v
         bdtpVvN8R886eMRJJ7bQzrcWpttXk+EtsVgSVye1j2sTmXXmuWUVbOTpR7dO2vCoj1nh
         o5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790028400; x=1790633200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=;
        b=mOz+RM91DJtP7gLTm73dO31rGP8ACBkr7MT09di/hIEavEDjdckFgy2fs0DJt8o2Od
         s1yXxTr2c7os5cyA3vcf6Gu3t5+IhDmEms6wn9rCZ8daaeRvea6heYwV+xFb+6FczuCy
         tJV1k5ARt9/lWWIdnEF6uMspdGHOcrkd2rFnRGQqjJgCWBQTG1HP6umFgcaxm6i3oYcR
         Pn1EzVCW7YnpgZqw4Tw/bIVEoL2TJ0VuHct+fhDHqCb5Y1Lhvuys8Hu1/QPkV35DmXtW
         sn6K5KvJUAzw4AlXsipYdQs+4ya9lajHx5wAAjQA2xnTAxqitcVcBNQoP4p5FZTEl7ec
         AwjQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7/1/EfznlNsON8gDFvdVkKxyQuPt6aS0atWwMnycPuYG7mQaBgox94dVptUYIAjvxOMt0c6t8+4tC95U=@vger.kernel.org
X-Gm-Message-State: AFuF++nRDiMxiQfzHUJfdr9yazoaFc4R8O/yeIVXnyZtnBV4rdLsS+/L
	mlZMHEW1RAn6N8SqZmn9eG3rKulJgCSoP8a3M/I2IUZCVH0yc1jWOzivYaLqIBsDSLdafPbrFPv
	Wdk9w4Z7zMZZEZpmV1E/PV0RNi6mvzhLBcHmk
X-Gm-Gg: AYBFou0mbCgiuDSVIIV/HxLclg0pbyg+xahX3hOBnbHOqX8GEtekVipZ7KRsRRLZCj/
	C/9Dp4Dkqcmgr03Hd9xbgxcxtrfYw4M+N6r3ps5byBLatAo9xIfAFGPAYvyj2h5jxJ4VvCB+FR5
	Y5Mp0wXvQC4QbqeCneXBOZKxVfToIgJ6+vHd6c9yP5MTXqd/n4Fhcy+19GeXYwQ9+jXnGo3tVfg
	0N+M9PN93Vz8IcacZOeEprCdukdDigc6pViiPC9MVNLwDoctOrGSfjWqs9RT1GiUk5HiWvwNvdE
	DO2GRu0L2/kWHvK2FezGr5Eek1I1JhCHFFFmPdSoYyzPgjU/xdBsmiiaBJd9xza136LXyfIlutU
	9ooTXOX1FiNOMKvdFzymgip3D4LqC6Mo/7C8VLXXevtezIOT/EG+2Um0jgVTeXG6pOTm28uIPxE
	c1sbYdtHCVdAhBZ49/L0r5M1bsfDvs3nqcJu7DYBzOYEIrnInEDE10mTrIKFo5WEDGCthF+dfqg
	0Uz
X-Received: by 2002:a17:907:9813:b0:c29:f5d5:5a90 with SMTP id
 a640c23a62f3a-c2a15810476mr995533666b.26.1790028399498; Mon, 21 Sep 2026
 15:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921214133.16519-1-rosenp@gmail.com> <20260921214133.16519-2-rosenp@gmail.com>
 <7980fee5-f70a-426d-8cdc-d51e15323852@gmail.com>
In-Reply-To: <7980fee5-f70a-426d-8cdc-d51e15323852@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 21 Sep 2026 15:06:28 -0700
X-Gm-Features: AcwNN1V2KB9rme8n-5tyXAxXcXiv23teUPiYe9CAfdPv50-_aVX1j-Zp6NK4YGs
Message-ID: <CAKxU2N-5E=GJF1PkcKzXJaj=kzf7duHnu8j=KZ1akgu+6Qg11A@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] usb: bcma: add regulator support
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 2:59=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> W dniu 21.09.2026 o 23:41, Rosen Penev pisze:
> > @@ -411,6 +422,14 @@ static int bcma_hcd_probe(struct bcma_device *core=
)
> >               return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_de=
sc),
> >                                    "error obtaining VCC GPIO");
> >
> > +     usb_dev->regulator =3D devm_regulator_get(dev, "vbus");
> > +     if (IS_ERR(usb_dev->regulator))
> > +             return dev_err_probe(dev, PTR_ERR(usb_dev->regulator), "e=
rror obtaining VBUS regulator");
>
> Did you test this for DT without VBUS? You seem to *require* regulator. S=
houldn't you make it optional?
Nope. Confusingly, devm_regulator_get_optional returns -ENODEV if a
regulator is missing, which means probe will fail.

I could remove the return but then I would need to guard all
regulator_en/disable calls with IS_ERR. Much cleaner to have a dummy
regulator.
>
>
> > +     err =3D regulator_enable(usb_dev->regulator);
> > +     if (err)
> > +             return dev_err_probe(dev, err, "error enabling VCC regula=
tor");
> > +
>
> Can't you use one of devm helpers that get and enable regulator for you?
nope. devm_regulator_get_enable_optional returns an int, not a
pointer. This driver requires management of the regulator in suspend
and resume paths.
