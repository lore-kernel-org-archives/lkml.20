Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794327111;
	b=FeL+6GsVWXkx2k99fw5FHOM/eUxMoFjI7h88nWjTwOeRH99CxqgQfH7ualWnXs2J3Fjw
	 931SPsdGMjoNZwsDDEymi629QEPeBtoGIeRNx8+0lOER8rCpsQPSqZS9Cl66ctwJx5Uo5
	 8Hi6oKOCQGLd8PjHb9CY6Ytk/VvvyCyJ5+6m98ln59pQ10SAfVZYm1o2nqqEyaQlF0a/K
	 SDuH0tUcd3KH8ey1aI+UVhts5j3PYqag6CA7K3P5KNCHlAjw8NBzgrVNnz1g371Fg9ZFS
	 zScmaJ9Ad3eoOLtnzNHQYrixWlqZF+nWiPJy7NR+uWRCZlsmYsjbG7pbT22wpMwH/PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Bvu8fH1m1BZ2sQQoPyfnhre5VWvJqEOu2Sa0mYvTTis=;
	b=uvRpDGH6gpwYyYmG3wDP8E6fEGVseR27FOnRve/jYP7zd/iZ/ZPMODNumQlYTPIzpp0J
	 SHnl/LxxZ/qUy4qdzweHpP4vcei4CKGxxitw2PUaHw74Wo4qo1pGLKeFmxLT311FpzNIw
	 BA6qGosnBP5HswLSw7JoxpHumjuAmhO/uu4ETcMj+9xQcb0SadNZs7S6VwNzIuGQoDebd
	 csjF4Q31fYQtyLxov73GGPFG1ZXw49GGJ/HcKuZSxSG+yieFvY9sZPkqI3LtoE7SvWEzB
	 TeDnhbJmjSED4BOBXNvNP3qeSsTymQzWeQISuDkPtui+7wGL78JcAws+PnMXEvvPV7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XnbLYiH/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.139
Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E39C606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E39C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XnbLYiH/
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c504b4f2b6dso42020266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:11:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794327109; cv=none;
        d=google.com; s=arc-20260327;
        b=hwIQEVHrPInEKcLQtLxyJ/7nYymVFm45rdhCaKsSAEndd2jy+cgau1ZfO74nMU8t+a
         a92ThDWblcF3QayLxB/kDzuY2SjHlU1BlDtGDdo0sT8pPl2tzRZfVJtSe/93ZHgvZPE0
         sYy00JsD7i2cuq6rPRE6bkm/xHU/H56hEc10uWCWlW6mvgFBUt6iGrQdXnh0Uqo8TrMu
         0FxSqx4KmmPsWXJnXSNz6W++Sr3b6yc9fC7O69kvZVtMPbR7X4N3vyhoQfJAxVHX4K8+
         G0DvCKa7DrUxDYDaeAEvRouMS3xjq64Zv6jfmFHbPNMtxJqBAnnzJ4AIgij1hYmy4dBX
         x7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bvu8fH1m1BZ2sQQoPyfnhre5VWvJqEOu2Sa0mYvTTis=;
        fh=H7z8rd3zR3HQ6NLNyszwoJ1TDtlrCpCMa383WA9ETGM=;
        b=K062zmth0f8qIO2IFvXrz49ylO3E+hzth4E7ksO8glvCv+IuAY4uGoMikwzKW0z0VY
         nHLbcnkbM8uIlDbp8cHas/phggVf4a2v/MF/losQYQfOzKHSbpFNaCT4izcS96dCnaSl
         mK9fO+e0R+yWx+qopxpy+g+UHEFeUMlSBRGE4eTzUO2Z6fpfB+ra2sSd78LjQrPAd7Dl
         z3y7m65EJgnAvGTe1tKIRvwqkAQOOMvXVESh9zJoqKA2DKbzgG9TgJuds6KrSYsV7Lr7
         gGkt1kUxHOKWISyHEnpejrMcuxYni5pmcFTDxJs1DtD6WKGDh8sbZizMEG/z5zeHaBrM
         Ph8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327109; x=1794931909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bvu8fH1m1BZ2sQQoPyfnhre5VWvJqEOu2Sa0mYvTTis=;
        b=XnbLYiH/BEhso9UcOwBEMSmuHcO7oYlTWKU8OtykCgMDUGTV71MZHPgFznVu/FF3Lx
         eYn7nIzUbe4btbN1pwn1AVC+TgOLlu06/5ulCjD28TxM6gipf5iwX5IWjGs1zC1l0nhV
         XPjfqa6SWsCKcU0rRUy7M511R90KLD84/UqZOxQ0omw9soKuSfqHsCaYRnvaQTNgi+la
         Rjl2qqHS8ayFnhKOC7Dk7lua7qh8sUWgDTmCEucqdAwnxGo0KtSXTIxpqN6R3sLydW9b
         y25+v6SXahDFEcz4bq3qVBgjEOmu/gDHLG4JxOiiCjOAGCXtPmr0jTj+X+rQNEB4CTMf
         SwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327109; x=1794931909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bvu8fH1m1BZ2sQQoPyfnhre5VWvJqEOu2Sa0mYvTTis=;
        b=vqTz+YQ7YngVIGd49FmOLWCVRQBbmxi0m+ameYpXzJuZfyC9mLOMOhnMrwUQZE2gfS
         dVvYloQInSor7dg28YvOil9fX78mCTtAHEmWDr1XGxEpRs3wIr7QQzf0+JQzMuxg8IeK
         1m8SbXKxhU8yMfhFyTOl4UfegxZIUastaxnKNDFstWSf3zNTeFLy5UfTaautfjE2nNjE
         d2l1WsSIO+kHg1TMpJ5CrGPI1MM9YGwImyS4KDqBSwF1Nd3yEHzayQurYMu05UX7upJw
         +E4Hrf1m3LoqWbOedbG2NQrlLA75U59NzHlKPzCk1ceBN36FEphm1I3BLcmYK0YolkOU
         WQRA==
X-Forwarded-Encrypted: i=1; AL+hErENMQBP8DtpJTqwzffMGveHU11q3G4eA8MUZHNCgKLEiidn+Cp0zb+ziMsH8I0256cEurxMZb1Yk6Plgbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RK9G4wiepfPEKBggEvRqMvekE/xeEZKPt7RA68NB9neWMcGlt
	jrnLgIk1YNay7Gow1rRDpKdk3pJ+K61QyKLvqD5+UDTZcD/iemHH1yfB9Jorcgt2ZebJ0z6LNxj
	6AaGj1QWSmDuQg75XMg+J1pR56Qin7ZE=
X-Gm-Gg: AYBFou29JfgLayIX/XQqQSMjyhlVr7y1c08KOGKrwvuXrYvGU3E9XWJ4PnCB62OWJx0
	TBx9RTp8hOnG/5U1U358+51CQ/mtPjIIep7xRkwAdsBFUeELtxdJrNlAGtGc886gmA5Le6a7sFP
	x6YzWRJk629z7OjUjRrfmSs7iWBILUz7u2k/h57Xaik4aELEPoYkvdA3ctoIVYGl4PykXtHVrGs
	6QqQXyQSDK7xQ41kSjg9vvUD1CN0B+t+BbOoVzD94jCO7AnxV5gJ8giSkjNHE9Z9zCLj1zMaB/3
	3Cn4jEQF7g3sXZkZcQRpPrmBuz/m93Ho+qXmijn0ks1i09IpTGGb5Uw1e/jZ4O1hLOSO3gLc1+Q
	aIhWCipj03kTFIRgWz9M8y5kjJV2Z1CBapx+K04fi9cDG//kH4jg=
X-Received: by 2002:a17:906:194a:b0:c41:266:68a7 with SMTP id
 a640c23a62f3a-c504952c255mr192385866b.10.1794327109186; Tue, 10 Nov 2026
 08:11:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALj3r0ijsuzadYoi0NPkSpT8smRyi607APfxLS8_u3JSH3+dPg@mail.gmail.com>
 <20261106115040.1199269-1-amadeus@jmu.edu.cn>
In-Reply-To: <20261106115040.1199269-1-amadeus@jmu.edu.cn>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 11 Nov 2026 00:11:35 +0800
X-Gm-Features: AclHuK-W_aGhTciJcK2jT1mQzUOxx8a9MsoP2BEfAZfP7jfpZyRRqnBuAfsnq9g
Message-ID: <CALj3r0hOjksUtYg+qLqPU9kz4w3SAqGvSmFFi9YBXNGiEPEZSw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on
 Photonicat in battery mode
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: bigfoot@classfun.cn, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chukun Pan <amadeus@jmu.edu.cn> =E4=BA=8E2026=E5=B9=B411=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=BA=94 19:51=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> >    (5V_BOOST and 5V_OUT). Adding a `vcc` prefix would break the 1:1
> >    mapping between the DTS and the schematic, making it harder for
> >    anyone tracing the board power.
>
> I didn't mean to change the nodename, but rather aliases.
> BTW nodes should be sorted by nodename (placed at the top).
>
> >  ... However, 5V_OUT
> >  is a distinct net in the schematic. Keeping the node makes the DT
> >  power tree accurately reflect the hardware and clearly documents
> >  that both the USB VBUS and HDMI 5V domains share this OR-ed source.
>
> It is not an independent network. 5V_BOOST and 5V_OUT are on the same
> VOUT, only separated by a diode. The device tree describes the hardware.
> 5V_OUT is not a regulator, it has no enable control, so treating it as
> a standalone regulator is incorrect.
>
> >  ...  For now, chaining
> >    `vcc5v0_usb30_otg0` -> `5v_out` -> `5v_boost` is the most accurate
> >    representation.
>
> Adding a fake regulator is just a waste of startup time.

Hi,

Thanks for the feedback.

I understand your concern regarding 5V_OUT not being a standalone
physical regulator. However, I'd prefer to keep the node for two
reasons:

1. Consistency: The DTS already models other always-on fixed rails
   without any enable control (e.g., vccin_5v, vcc_sysin, vcc_syson).
   Keeping 5v_out is consistent with this established pattern in the
   same file.

2. Accuracy to the schematic: 5V_OUT is a distinct net where the
   external DC input and the boost output are OR-ed together. Keeping
   this node makes the DT power tree a 1:1 mapping to the hardware
   schematic, clearly documenting that both USB VBUS and HDMI 5V share
   this OR-ed source.

Regarding the startup time, a fixed-regulator without GPIO or clock
controls does no hardware I/O during probe, so the overhead is
negligible.

On the node ordering: the node is named `regulator-5v-boost` (starting
with 'r'), so it is correctly sorted after `battery` and `chosen`.

Coia
