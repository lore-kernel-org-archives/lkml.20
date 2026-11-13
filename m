Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540621;
	b=Yil50SygNtHQozDfPrE+U4xxVK9T1hBkMdk1vICcBRxRj+TfUH6K6W6P+xWj7SVU9x4N
	 8ObHoA5/zly6jTWL5morqpufCGyo6r5lYKOaAxsBfqbdxAqrlW2uctvNICzcmXE7YTCiM
	 7tmVpKsdOvgIQCS9JUcr3GoSrv+hDnXM2s3hQgU+v20giJ80EO4QyA7GgTw33SxXbuOQf
	 foOQT+NMkhOpUd+caR7Bspwu+R2KMxfwr+5Sv61jBxxUB29ja9jL92+/sPUBz1tm3C14V
	 YRV2NiqTXWD5qyvy7LapL4xMzmdm1wdh8ovOXunYSwpIzIUn0b/jm0RQ33h3zpcu9GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IyDgmHlGc2LlHCU+APm/SncKRB3P+rRs9H3SfqU7anQ=;
	b=Srh1s/N2qhBu0MgbbeETyYAqfQjjZ1nulYKLxyGMRR4+EldNSrVYtnPUdmG4w/SRbQHA
	 n2OFwY0BCUWnQmSsZbigVAM7V/fWorj+FZCccaabe13C6Na/85DY69zDJfCwsznWfN9+6
	 gACZ1eRrm1WmEBgFfn9u2u6wFDNwT4xT3mWQyUQazWcdoSURVZAilDCiIo7+G3X1bYcIl
	 Jvh6c0yUnusmCxmh3GN2cFq8iqSUzeS/nYsgRzDa16vvRO1/iV8ePhq9sXFlFseUZbAWM
	 m3A3SjYitMNQMRsGoWV3TfgG9fkP4aJ1eV8fnHnFhRarDtuLHBlaZu6uPrYf+mQwpKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L0Pn+CKb;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2131606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2131606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L0Pn+CKb
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso919875a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794540619; x=1795145419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IyDgmHlGc2LlHCU+APm/SncKRB3P+rRs9H3SfqU7anQ=;
        b=L0Pn+CKbyiPbbJaC4waQUdGx6D19J5UOBbnc+acGn/7HmUlK5gmp7HeheYtI/Q7dz9
         fCBUHZAfGdv0Y8ZewOdomfMQmS/TxwPLnrE3LMFpAaivi6w1yvO7Om8KVK3LRgyaKOI4
         l3wupdu5famo5ES2MgNzAEsNMW6l6VMbjjJzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540619; x=1795145419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyDgmHlGc2LlHCU+APm/SncKRB3P+rRs9H3SfqU7anQ=;
        b=LTVmM6edvQqrq1ZAQUAGvbNOExOLrGmZ+H2oRpHoQDGsF4XDiVZlMQoSGCfrFyXgZA
         4F82NljwebNzcMtCJOBfhUiByNDOzoEjN1srsWw60yEND+eSusQdQeHYGEZulqt+UMgT
         ATnGqPsAz+3MF0Jecp1Sh0LgpIXnyn2J+xKjbOl+HwcMw9rif7xL0EySsge53A6And4l
         AfdTTnic2ZSimcYo4nHfXwsLFZp+nGXFBHAVI5e4UHeKaPrJKo/kskFK2FARHt31Enmg
         HYdveKO9LTN+h9WIwGY9VEBBmS5nnvImxPBT3MyzofUqovd/SH26h0RM8bmFryvpC74o
         066Q==
X-Forwarded-Encrypted: i=1; AL+hErENf20MjjsjgFrUdS85exUSSRyQl+ZkY3sde+Qb1ohvVinDpHKECfmT2bnNyk29KWZvwJcNRzEyUBtpZbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ENrCJRYtZGY6g1VNXqO7N++ou7GnVKYQfJv+5boJVJvFqhb1S
	Q8E4IEJBvWy4ISFiw+7KrYXYuLWOFmCAjSVk3bUrP+TjdjVN4Yu4i19J8En4pvXkymIiQgXEzg9
	VI8YJiBOJ
X-Gm-Gg: AYBFou10CQ/oCLMWT2hcTelyEIkIQB+sNCX9dukpci9Gqn/2J+/uQqPQyc1MPAazzCe
	SaW4QwOwMzgEscLDpfQi74S0F6YQXSzJs3Duzvoj520OoaATnlTt2Q/6+oLYgVs+vouEV5DdeoA
	Q/nQpqSMpvCKpfFsJyijn8goMzNE2kuRxoOC1ZfJwibxAtnEXs9TZGaTUPGcqMVeQnCijgTY8eK
	YhUEkmpsq8geECYA393Bg5Vnn2Gz2GFIJCoSriHK2sMVaiCUCIjBgVhjJUUiZIn7wQq23hQ/7LK
	jhLp+2S0FdUS2DdFQePsWbWJlwyEUyUDpMqUBM0coKD/c8tT0ufivLIXlpNRhpP7laC/ZZR7xRV
	9RmXDrq9mpo/sDlIZQm9py6cJeCVsjEEOU++LTJEtWl3COSBJQThnZrUTvH2KXiHmj2Ps6DOLoi
	gJUkf7eIHYUtzYKtvTjOG2xKLnRp0NZVcRRl3xzMALkhZcIicBVZp1tvZomExtKUBOea9J4e2/5
	q2Alt4gbjOKEpWc0TEX9IXdI1qVncxerQ2HxNeTZglM3nQBGZ348eUdOH0suE8B3I7CEW2lBiRQ
	xGgED27HJGwiNHDmDIp3VHQHgXk53/KodxLt7oGSFV34hb3DzgVqqH95+oZNPXWKzUN++GdDfIz
	9uun/GO4aj6a1Tw==
X-Received: by 2002:a05:6402:540e:b0:6b5:6c41:2508 with SMTP id 4fb4d7f45d1cf-6b7c0c725a1mr1149173a12.36.1794540619155;
        Thu, 12 Nov 2026 19:30:19 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c25df671sm457548a12.32.2026.11.12.19.30.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 19:30:18 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so3227875e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:30:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFvbD6TvKSWnfdnOYoPHmcXgL5XsffnAKyETwQn6TbyX1zBAseavIuxKql/uYXzGXnptlrrDSNAC8hF1qc=@vger.kernel.org
X-Received: by 2002:a05:600c:6912:b0:4ba:59fa:510e with SMTP id
 5b1f17b1804b1-4bb55ab411dmr22862225e9.23.1794540617960; Thu, 12 Nov 2026
 19:30:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
 <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
 <avPZeSgU8ABix34f@gractus.seuss> <CAFLszTiUYv2rx2OzvLR6UyO-uoya0WthPsr+oohQtCa+_itZsw@mail.gmail.com>
 <avUZ-uqxLAu2ICyJ@gractus.seuss> <CAD=FV=WAAk7ddDM3Uq8fRVYF4fCEDnufDbCiVgHfH2cwLqrT7g@mail.gmail.com>
 <avaDbTmhq1NuTKJr@gractus.seuss>
In-Reply-To: <avaDbTmhq1NuTKJr@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 19:30:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V+iLQQvUi3g7+JED0S=8ksup+59rNxrqAnXtHjXc+AWQ@mail.gmail.com>
X-Gm-Features: AclHuK-aJhOTg1eK8SFSLRiauTt_F0qspaiN0WNuraPul_eSmwqC3QJG2lM2xV0
Message-ID: <CAD=FV=V+iLQQvUi3g7+JED0S=8ksup+59rNxrqAnXtHjXc+AWQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 12, 2026 at 7:26=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Thu, Nov 12, 2026 at 11:28:29AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Nov 11, 2026 at 6:31=E2=80=AFPM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > >
> > > > > > > > +++ b/devicetree.py
> > > > > > > > @@ -0,0 +1,226 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clau=
se)
> > > > > > > > +"""devicetree - Non-flattened in-memory device tree repres=
entation in Python."""
> > > > > > >
> > > > > > > I'd forgotten about this but PyPI has Zephyr's python-devicet=
ree
> > > > > > > [1][2], which installs a top-level 'devicetree' package.
> > > > > > >
> > > > > > > I'm not sure what to suggest. Would libfdt_devicetree be too =
awful?
> > > > > >
> > > > > > Right. I'm OK with libfdt_devicetree. David: do you have any
> > > > > > objections?
> > > > >
> > > > > Don't love it, but can't quickly think of a better option.
> > > >
> > > > Would libfdt_tree be better?
> > >
> > > Not really.  The problem with all of the above is that they're making
> > > this library which is about managing a non-flattened device tree a
> > > part of the library/project/namespace that's explicitly about
> > > flattened device trees.
> >
> > Personally, I kinda liked "libfdt.devicetree" that Simon suggested
> > (though my analysis says accomplishing that would be difficult).
> > ...but I can also see David's objections to namespacing this under
> > "libfdt". Does this mean "libfdt_devicetree" is out, too?
>
> I wouldn't say it's "out".  Both options are adequate if we can't come
> up with something better, I'm just not enthused.
>
> > One other option is "dt_livetree". That matches the "livetree.c" that
>
> Again, adequate but clunky.
>
> > already exists in the source base. What do folks think about that? If
> > we switch to this, should I move the ".py" file? In my draft v4 I
> > still have it under "pylibfdt/", but I could move it to a
> > "pylivetree/" directory...
>
> How about "libpydt"?  I'd prefer to reserve "libdt" for a hypothetical
> future cross-language live tree library.

It's fine with me. Simon?

-Doug
