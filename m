Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794309998;
	b=t9ufJAd5waAWYurMTbWETyz/D/P0E4n4hRrIZ7m0kVlBwzkA4giaj7nZ3ZTrMLW7qPBT
	 cYkvjfl2v7nINYUMfd0MpZUPW5hdtNUV2pJ5BK0MEfRiXTe1CwbnJmB4wZw2T4KBvEifI
	 r27MhEfVXIaL7OdzOqke7kuLyROwpAkvK8IbgbKhm0e2xHlN1eLhESkec9iBe0fY34vtc
	 KgHDoZgJW9hqK27/yw4Pofcr4MKcEC0PsvPMTZXztd+jSX87rz8MuL2DNqZxBf1rhK5ks
	 rjGzy4QLGEIYqUGrmKeJUBcWeKuzRxB8zWfDRmiBvlWZXQXwBZIHzlcUXpprnvgynng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
	b=JBOJfQ+7LuEZczKujc7DNKfq+yIvywLISC9/uwJIUgH89NPyQVHenb2shJgZt16NB4ZA
	 m8zdGn53pGRPYva+u4fHEX0QJmy2w1PYHXTwND+KkV7e6c5xYa439/rT/4aYfAZ3EYXIx
	 GQfzo5cw0YkzPq/aLN9HdU2T25TcccyLZG5kp9P5mE8fkrhEMBI9D6P0oxyKommkscEQ6
	 TYBxrga4Yk/lCftAf5e3/etKGal8xM9hMJAhzcejq5+/r8WRMsRSl8lB9QMiiiSMYOygq
	 /popE9dZOish/YlIfEFoAD5oridJG9h3J4COrpHlvZQEL6lrhoJVEI8XjUkW/D69CTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O8QUX/jx";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4948A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4948A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O8QUX/jx
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b2d14968c9so20607637b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:26:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794309997; cv=none;
        d=google.com; s=arc-20260327;
        b=KNaiolEbwIZOWFBDRXQ7ASaJ8H6/qXOSlnZ1dGjGlvyamM46acr1pAYoDGZRvZmh31
         91GVe7ifdNJPSWSDftwy5g3bKmbXkH6h7bS+BdSQN5AOfQMZxcRi1zoNrZJwf0idbpXw
         JRm+bNQOLqUOqcNNJSDmIKHXQWO4s0POOLir135NHDLybtd7O3eu/MWJ2taSyrwCWegB
         TDVimoVZ3bYoxVhxZeC0dQZvmvRyeNInnJ1QxtsxKK3pmrWSj6gELeYpNTpBJPMjhU8D
         AItUqMfc5zf/mEvD05lm8HHvQ+CcBbeCjNHZG+8EZcHFSXKYV20If1AiqiHaBGS3ZQSX
         Zl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
        fh=HnjQ+Rt+aQtnmWU3ijtJXnb20BJONrGhqOYcJkhMpN0=;
        b=jVrKflkt+NqKusEf+eS2GeVGUhfB5Ab/kALGEynU3IkX0m10mFCz3kmXghkD5pC8wt
         FFaNN6NN0PWVLdO/ocKlZzbDq9zTjhjm738ZEYawf6Cym0Zl//snCot2Pa9tY9GvWZIp
         To/tNzDLdOGpcJWaLMaLT6GBvqmWm5luTk2l5IHe1tvzj0SSaM2WqnPTi9NcK6oQvSVk
         nlBJgAWBvWgj6D3DWJhZA3G9n3VecvEpbtg63R1a6wop3bpbSePAc1DXTx53RV3G5sTd
         RmB8jnlaQogORp6TlBUyPq6kW2cU48hgSE+y1WP2f/VfIc0W4yWXSACPFzhYHU5FWEQq
         M+LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309997; x=1794914797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
        b=O8QUX/jxibFeXJZFXp3x9ekr6Hb5ZyG8ENJYU/s24eioSequ3810kAvz6PFc/NR+b9
         2wgMS4nzsryX7Ryjx85SwvLOAFbiCNUBrbN8yXToI4x3Ui9XtYJb3/WysQxwd/G5OfPv
         0F676GV8BgNIp8SP0IuEPdpG4sjqx+Lv7pii9P/bgfoj/l4HSzlbqnlZv4Yx25ZReLS5
         ia9aHbmJ8mHx/M5K71HC8fgNRYBKSiNQ0FEkFRvQ0ZQinORZ6Bs0B5l/JoMwVNI815PP
         RJU5E3Q8caUSx78qX5nas5C6co5zsxOYb6RQPwgHPO/VumJXOqiSu1LRROhe+SSSfrH9
         7J0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309997; x=1794914797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
        b=tpy89jIQtNXv2+xTyvXPgaurtW9PKgKnyyafVOm4Zz9isBTGOrOQlB3B9YX4eQGKtx
         MZHBParlRz0dZa6jHDYFsawY6woAXrE4MxF6NvnlmvyItUVmmgzJPFC5rOqkL/2FvVkn
         PF1OxmUePx30p06cJudsZSJsCYj9LbUd+BSGN9Iwb4IbZn87IU8TLzjKobIHCoPd+Qy6
         X/hdlgCryTR+3ajIo9Hm2kux1lhbuFzNrV3CbOYC2LWFZfeEetdkWVF9mIJFGfSQOEjp
         B3mLLldrOtGEX3IfzIn8u3EEKQt/1PDnZbRg14IF5OhtxZC6vC6QXe+Dbo74NxYJPwa2
         K5Mw==
X-Forwarded-Encrypted: i=1; AL+hErEai+f8lfmiiqggSUTb8W5/7X1H1049R0HBcJv9s99NNiF0VEzO0yBGUCPSmOWcKKzjuvgsROy+gmLZWUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CtdI7in45B8/sQTZLf1szgBGrPh8eU/C/nYTmJZU54K/j3Nx/
	v5+Zf7Z38HygNAS1NgMKLai/0KNZX3Nz05jsx4JgzBGxDLzTMxy/MsvnUyEKuMnM45SAOwVbHs7
	q2br9riCsdhRWoJB0S+Py9RT2TMTCOuQ=
X-Gm-Gg: AYBFou0S5CdBg5hbgx+4m2Tnxlzp6FX+tU68jhd2mT1e3koLw7KQ8CsvqNFtcFDyYPG
	a7raOwa1pRmCGTkYhQDENM1FskTRtl3B1nRJ3gWjzGeSYc+aCHSN49zmbWPrHGtDFoY251mkRde
	KBGQCRNN4CIAPvYoA7gKos1s9p2Nu2jB3qgaawCdCKCbP7rnPAoIhum3TtpG1A7065H8ruIbjpw
	fkfW93CMcyypTaYvEkWyvbtp1GZGOWi1DD9WkGtdP0jT4fmaamhhE7kD7C1jRwEIBhDageLS+U6
	FvjKVk4pGPayvr8dhD0QCJNHeS9zEBa6qQF2pf8eZWClJBuE9cciOWN6YJG3IEyzGO4BmI5uGKC
	BgFexDja8BeA/sO7Ck+tVZXpIFwo5XXkIYPTwfyw3/sPoCB5uDaRNhvqMObVBhbYvWcbrfx5y5b
	1ZvylUmsAnMwJrhsm9xmUJGgMr6BDWaxf839UAwUqnMCHqkBI=
X-Received: by 2002:a05:690e:4506:10b0:67b:e544:7adf with SMTP id
 956f58d0204a3-67c567cb670mr755726d50.104.1794309997113; Tue, 10 Nov 2026
 03:26:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
 <20261108-b4-apple-mtp-keyboard-v5-2-e2c97b82669a@gmail.com> <20261110-accurate-unselfish-cockle-3a39bd@quoll>
In-Reply-To: <20261110-accurate-unselfish-cockle-3a39bd@quoll>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Tue, 10 Nov 2026 22:26:25 +1100
X-Gm-Features: AclHuK-5Sr8Vu0dogwKG9EMBtjFYwuxFFj20UBqhmDk8dxo-p_0NSr8q2RJWh1g
Message-ID: <CANpmGNufv4_PM=1D1E-KRNQOuCPj8k+sGUJ1Y2HkkAtoSuL0Ow@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: input: apple: Add DockChannel HID transport
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Just an enum instead of items and const below.

Thanks, will do in next version.

> > +  apple,has-stm:
> > +    type: boolean
> > +    description:
> > +      Specifies that the coprocessor provides STM device and serial
> > +      number query endpoints that must be ready before registering HID=
 devices.
>
> Isn't this implied by the compatible?
>

No, it isn't, because whether there's an STM or not is decided by the
type of trackpad
used, not the SoC or even the MTP coprocessor itself. My wording in
the description
wasn't great and I will make that clearer in v6.

Rob suggested apple,has-stm as feedback on v4[1], we used to have it
as a separate
empty node.

Right now, as a heuristic SoC works because the only device to have the "ch=
eap"
trackpad (and thus no STM) is the MacBook Neo, which is the only
device with A18 Pro.

But that isn't guaranteed to be the same in future. I don't think it's
right to base STM
presence off something which actually isn't the actual determinant,
and just a byproduct.

> > +
> > +  hid-country-code:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      HID country code for the keyboard layout variant.
>
> What is the meaning of values? Do they map to any existing ABI? Like USB
> HID? Otherwise, why country code is 32 bit integer instead of ISO3166
> codes? As pointed last time, this should go probably to a common hid
> schema.

It is USB HID country code. I will specify that in the description in
next version.

Would you like me to add it to
Documentation/devicetree/bindings/input/input.yaml,
or make a new hid.yaml in that same folder?

>
> No default? Not required?
>

I will make it have a default of 0 in v6, so that way it can be
omitted by the Linux
DT. The intention is that the bootloader fills/adds it.

> > +            hid-country-code =3D <0>;
>
> Which country is 0? Isn't this just a default?
>

It is "Not Localized". As said above I will make this the default in v6.

Thanks,
Michael

[1] https://lore.kernel.org/asahi/20260925-apple-mtp-keyboard-final-v4-0-30=
4c267518f4@gmail.com/T/#mc53edc016ef1484c18e217b941b927bbf86f2cea
