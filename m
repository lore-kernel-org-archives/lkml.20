Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565202;
	b=NBe0SB23aFNNgIlTyWy2I8lcvncs4MlWQrwTf0rVLaqlGMfSs3Kmh311X/0p+mzCdD26
	 1D29Qy+NmbYDjI2WOPOL4AhOQrd1cA69KxTcyLKWCSb3ZHnKpAiLEowG02z5R2jMwaGPb
	 d+abty15qMt7B92g0ClpCmRqpwQhyplcOveoO6qCVCdZN8HjpYvhMqng8laLH449XfqJT
	 mkLvYa991cD00MHWAhZr4u7DDwRa9uYhRds8I86abpKSCsBmNJV5mYsfAlISoftQVGFjJ
	 yAakfljl7FzYssMHdmZOKo6JgSgR49lBSF9r+l2gQTkMSNBXGkrbkZUb/iymgF02MGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
	b=eUGCplFSs5oXlLtSnjwVoySs6tpRhBfJkbZdaEMsomlV9pKDVNKZ5rV5JwrktUaG0vy8
	 tvCUUrmj4szgxkbqtK2QrZ84RFTpEVMpQYoIRyOvs/Q0rihOwyBgM8CgZ7DfFkX0l+Q8D
	 hnDLJYidiSrMMGA0s1LKcp+qV9UhwUBhb8z/2sqWGe03VRbQBbTDuIoWv2iPTpHUp+8Pr
	 cWPEz3RsWWbuazSzR2kpYfRF75eC8DWsReHHmxj87cm/Kno0LmCAWcsw2l5GDKY3ls87c
	 LQecEbX2tOdxZFTGx/cUcG35vlr8HrfQhgl4aS1f1e5j2ZzdwPhGPcqzbuFB/ntXB4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhmxhi0T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C584F606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C584F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhmxhi0T
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35c76e9614aso705234eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565201; cv=none;
        d=google.com; s=arc-20260327;
        b=XX53hBuM1LlAua9dK0b0jJiUl2k61otjuiDL7EQl7OwN5eJZK/jOlfh2if/YJqvr5z
         HUh+T6zdpPj/wxrDqVuthLvBWqOxwrFj4v0L4OP5AtWOADoc2SDJP9u6+RtSJR5z2Gdy
         zXacXVcXdb9wSU4SrSihOh7cO81Crcbye9T235oGVa/X7/aLidYJrzNNqXZLgMhoNgWE
         HAmvv1GCULmmkRexMBrex0ZLNzJfPw10NRaXe7bgHkomSHa0iLxiVfD1GVGlDGCbcnQN
         K/xUuyRBB4oAk5wtmtRhJ9bUrgMfizT0LcYN+HjDQsncxBqhxK4b9nEekrOIRhOCSHtl
         v5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
        fh=S8QLcv1PQRkU4P1YUWO7Ojy/EsxZQiPuWFHDAKLP0uo=;
        b=nuKRcUvJ6h5nRNeDwtTUAXmYVfn9h+bdGGdAGKD1M75GTELpCh5vbom29+9eM9ydN8
         bTsC97nU3Ia+f9TfrrgfOiSApy5ddNdSSknzX95BPrM7VZ3qeZSNrveCcBtZLtiIxks1
         mP8q7kVh3ypvoY6cVCkrRoXMQFRx7keJv5+FQVo9il5SPRN+i4iOrSsirUH+CGWi+tMN
         SkPPG715pASLjlwyj+BJuStE78ugW24jMB9WRduanHmGee92ixzRZOylRgf4dgxc7tTa
         lp3wmrj1aZpArgxwQxJoLk697B5PARFLc75c/SBTTKNj44P7DpDujMmhNyVgsF3WTlBJ
         W9kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565201; x=1793170001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
        b=qhmxhi0TbMwtXBvTVlFY4f2LPpHPl8poznD9dAUHw8+/Z9wZhQBqqYwfND7kTtB/dj
         BDT7fy1OHPOT3SsXcIJoCO2P5QWvHhSGsWpWrDlHwCxU3wdGdBZJo+CJDKK8hjNN6KtJ
         ZTBEpRPZ/CzppBKznbLND/WVtTUpHxpIjv8l4Dszl6GShVbqspGQMSfdEn1YLZCusCt9
         8XZUeUrLgiEXnrc9s2V2o2rhr6TPF2UsE6frYfs2vuDhFHmb1RIg6wUfaQGU2siObxeN
         QZxhnIASpBqZUpMRUn6UfJAhdRPi9Cf8ml1LkjDPLUFZ1OJH0H7A3t4eraOGGpReFZps
         J94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565201; x=1793170001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
        b=wkRiJdI81JkFB46LEwTePNaUWaToH32jrQfpqo9R/Hru4PNguHrjUPjBl1OES8C54k
         3Wm3iJthyFOXda0/YXNIdC8DF/xtY4c4rV0wQ5ZvYyeW7pbPUBlnCLwIIK5TJaJHEZZ9
         y7/q+8KbUJxCTeopaoIsUU3prPbgYeYf9Ezo89Uo7FniS7b0NLZxq8GUALyNvpG3g6aw
         X54YqfaUuPvxH5/oLcVD8Hmfm/XYr06OEEz1HUgjtL2IUtCJWsxDa+jyiRJVpb2+sPpx
         tcLDXmMdyF0GJjk2s0OgM8oG//5dP/Xl8GApwJGrhKZGQoGa8ehk0a/yzFFfnzR4fzOv
         0i0A==
X-Forwarded-Encrypted: i=1; AKwUvBz9qGVsf6B/ac3DakbTbi5Wcw+WXRpVolmW+i6oCpOx/Cs9acfBmwsRF74Y4wwNmW43dxr2kaJkJyuLVtY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSejG9RnDqKtunNKyB376tLNKXH37qZUhhJDSMIUf+oDcW43Bo
	JQ05klY3NOZVkbRLe5tsHJDtMRwVVHhwzBiqeudAB14YASxdGfud7Dw+yiBVJS14+bkNS51JPb0
	ZIBlcVNB2Tje/Jtxo4LYvAU9NMK37fTE=
X-Gm-Gg: AYBFou3ixk53qNOyB2AQKillKP/2wv4pSj6vFiD/V8i1DsB4itQZwOUprUKbCnR2qUW
	g/kZwo5Ys1V3x8k2sBY0vWC3D3DJ+chgAXCffuYEfcUfIOlohyGtsRODMBR/a72e+/h16ES/4LU
	OOBq59oG+LtWxpjlDxCQEKC9RZmTCaFopW9Ep14voL4xMX28HTcSisHeIVHGiiZijCvdSzeRWgF
	Iw/q1uSxnCwi1YWL+ZauMFZ0TdCzCMaD204saY0FG3vlNsQ3/1gm4rYRREjYl/LOskgd5treisF
	1zVTUm1zyibFcjGm7Mza3D4/MF18RW39ajHo7OcaOv3KOrmGTn2cOweveBgRsJiRXGLIS+TtCNq
	qw7DGCECy7SGwsWKE4ePaRmK5xYB3QbLx41jP08G0IYpKWYzsinTjJE97lhA5xSJm7l2d2w==
X-Received: by 2002:a05:693c:88c7:20b0:366:703c:5f0e with SMTP id
 5a478bee46e88-3674ef1f33cmr2092100eec.35.1792565200654; Tue, 20 Oct 2026
 23:46:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-4-clamor95@gmail.com>
 <ate5K6ZdrSoBUI08@google.com>
In-Reply-To: <ate5K6ZdrSoBUI08@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 21 Oct 2026 09:46:29 +0300
X-Gm-Features: AclHuK9vSBGobmYgXVnmsJbAb2zJc_kKp_DYHLaIwx6A0bp9NGDYceSKiyk9FqE
Message-ID: <CAPVz0n13NFbY1ChZRkc8_2CQd8HfjahA-gcRWzxsv7KbAxf5Ag@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 20 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:0=
4 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Oct 19, 2026 at 01:04:02PM +0300, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Add input driver for ASUS Transformer dock keyboard and touchpad.
> >
> > Some keys in ASUS Dock report keycodes that don't make sense according =
to
> > their position, this patch modifies the incoming data that is sent to
> > serio to send proper scancodes.
> >
> > Co-developed-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> > +static int asus_ec_kbc_probe(struct platform_device *pdev)
> > +{
> > +     struct asusec_core *ec =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct asus_ec_kbc_data *priv;
> > +     int error;
> > +
> > +     priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     priv->ec =3D ec;
> > +     priv->parent =3D to_i2c_client(pdev->dev.parent);
> > +
> > +     error =3D asus_ec_register_serio(pdev, 0, "Keyboard", 0);
> > +     if (error)
> > +             return error;
> > +
> > +     error =3D asus_ec_register_serio(pdev, 1, "Touchpad", I8042_CMD_A=
UX_SEND);
> > +     if (error)
> > +             return error;
> > +
> > +     priv->nb.notifier_call =3D asus_ec_kbc_notify;
> > +
> > +     error =3D blocking_notifier_chain_register(&ec->notify_list, &pri=
v->nb);
> > +     if (error)
> > +             return dev_err_probe(&pdev->dev, error,
> > +                                  "failed to register blocking notifie=
r chain");
>
> I think sashiko is right that we need to register the notifier first,
> and in it check if serio ports are ready/registered or not. For that we
> probably need a lock and set pointers or flags in serio's start()/stop()
> or open()/close() methods.
>
> This can be done as a followup I think.
>

FYI, Sashiko likes to hallucinate. Initially notifier was registered
after ports, then sashiko suggested to move it before. Then in v10 it
fussed again and suggested to move after. Then v11 passed without
regressions and now in v12 it fusses again that notifier should be
before.

> Thanks.
>
> --
> Dmitry
