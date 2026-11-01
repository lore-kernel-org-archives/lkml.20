Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570698;
	b=J9ZaXhtDbNY9f0//9/JAEAAPutqs8+8MAPXQhmk7uykzUUg3xeB7P52MFGoJqLcOIJxC
	 JbghOzlj/IG/dFvrvSJCY/HqQMyTKbegjsbZ5WNJ0XRmtbF8QHdc9e4U4NU5W5xRiT83H
	 Z5QUcO/dlvCofA8MPswNtHcWf3d4e2I8Z6SkiR0+Ry5adQqI4ToKKzdiJzDhFpTv+R+rc
	 cQhDaujnQ5ZzpD/sYGi0FdFsu7/nAMcmlRadVi4y9SsUqdNKAOM9EucOIlcREzlZakWJA
	 qQzR/SDK+VNLjspFRMfP1rQ1tYDUWJTC3tHJz0MyZ/JnK3jv2mLz63z6O2Fx+I/uyJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Y9FalgqvOBxKMHjv7jEesaNhOq3+IVDOmV3JOVqLntg=;
	b=um9pS7flN5NpkbTETmCN6VoKebf8sgqACn26Gg49TWfXloj0fmtKyS0UG4YUSu6u5/Oz
	 uvMCHBPtqAdgXNKL0Wmli7wcmVRlN5Z0t5okRxWFdGaMHvaXX/PIJ/UsourtsWC5W9oV6
	 Vh1uCodhFdPXsMODkqlkclvuKWf/pcxNLH2qhYf+LZAQAg8slKROF79MmypsL+VFOrfKO
	 i+kuFdY/Kebbo4N8pOvHQAi98bt+npxcOSq/eYhFJwlNwf914P49EReh3huiImBwcTuKk
	 +gHNy+bB8VYiOC53lCl4kYy0Qnll4n9H1qo566LuPtM9AJO11nGsaODS+Hqkzpq8XOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YN6dPr6Z;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D487606A334
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D487606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YN6dPr6Z
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso5561396a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570697; x=1794175497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9FalgqvOBxKMHjv7jEesaNhOq3+IVDOmV3JOVqLntg=;
        b=YN6dPr6ZZFSs7eJDLsE9h0zSl//JghxDFrGD6eR3ERreBvIcAB59YdYjabx96krnVE
         UEUwk9CMvSOoWy2qWa2aehaLnMzjEZOF3eHH3szNy+crHnaJKUWP6xPzirYePJMnXEai
         WvHQhSZpHcC0+vWRrjP2K2Mg05U9nnsQcdbhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570697; x=1794175497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9FalgqvOBxKMHjv7jEesaNhOq3+IVDOmV3JOVqLntg=;
        b=gtDPgEO+VPoKvhSbeyuqe1lvlUUpP7SMVHclH0XIscm9vtowOHsK+eBPHgiAJt3HeN
         KGloBvnKDWVVFFwL4IWGA2MUMAXMG6JHhIE5VV83LF5LrSbjiYpkBGD6WwNqIgYt5Zdz
         snFXyyWUYX/VhI7Cc/GuSOElgNKEJyPqSvxzXFfvlEjTe4uWr1CyDZ+93jFXjurZBCLt
         shwhvdmjB9vN0t5ixbK1eVQUanjqUtQuVCsl1L2DgpfLC7b6oNaUpZRMv7eyYKFMIZy6
         ps6VyvFPRe5U+3qBj/eHR5p9FtjWIdxCs9/n72fcjBlhPG3Xf7UqVWOyR4KbPWEaxF8j
         kebQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNrMQTAbIH/G1wcbhG3PH9EQ6/WMC0xqf6GeSESW73s71Pq0yWgftovbrnCHVbCtr/3B48Yd+nyDKKI7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCKkXVW8Zg0H+sLXqzpIy2iw4hEfHUwF2K7YzrRa6oitn5uQR0
	M95CP8XUUbtrxvx9RD9BzYcSdYjV2WZBdrfv6R8gojSMIEbMiy3uK1BpWz1Js7dXgki9t4HOpQR
	BmN+C6Ow6
X-Gm-Gg: AYBFou0uRiAzYnYWE3SArizGM6razrPOk/6Ta1ucRJ0RaQ3/282tpaVK7w/9OisWBYC
	mS8tJ/u0KC00+/r3u4oIV34AoXjXoVX8JUqGPPIj6I/LSI0EbsTmdgUkQnMAjsPIjoC08OjoT5J
	SOUAMdD2P+/mX6ogYbLTGq5ki3gBf8kkauuUhDNhVWUV3s9dVVM4aiayzb4JsGSxRpIwbaMTF8l
	XWKnwjtZfWBNpWui5mjZ94m1+J6qcYJdKxdll9qErEOEg+lgMmwRW//asefkckdnAruuzavOmsa
	+41eNC00OmXAUpOeBr/mMtiddr1/ld0gfM9u6NYjknnrr8tLjebllwEwueytS0pNq2ylngNW3Ch
	DSQN91gGA2KCvNZq3kBq9mdbrFzuEbs/w5d8lE4xYsXc4jXWW8OiUC1QijS9aQ1Q++2tAbHEkeU
	lNhfRvuVMGwYAnrJ7jZ//jRE1v8XS9HQecHa2xIYHisFNr4EtGDY5J/B2lsaA+Bzg8sR/zsDU+f
	THIKKh2PwDY9guHgEHPTbdO3rY2DLIFm1SaGT08RtE1TA9ayiA40DXDuj3ydb/gdnOXbi0QejhG
	nHz8Omcoh8xiuyHiOCt+hMTvOmkAovGDwxpeMNhGsNyB+E/9DUpA7CrRFBACBw+Pe6M=
X-Received: by 2002:a17:906:9fd2:b0:c46:8b87:c212 with SMTP id a640c23a62f3a-c4ca7ad48eemr689012666b.20.1793570696772;
        Sun, 01 Nov 2026 14:04:56 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1792esm309233866b.1.2026.11.01.14.04.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:04:55 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so20632155e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:04:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy/ays+K3gd6NuNpc/5D+4bLwbzjuAC1jOh2NyIqQdk/vQwRjxGvIheziXqBk2R8Al6pmkjdzcDI5wLFQw=@vger.kernel.org
X-Received: by 2002:a05:600d:1a:b0:4a1:d49e:9ce with SMTP id
 5b1f17b1804b1-4aa86e16223mr268350705e9.2.1793570694243; Sun, 01 Nov 2026
 14:04:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-4-dianders@chromium.org> <CAFLszTh+c8H6Xcz0LXGjO40XA4=y0jdyAFUr6ygc2OkS9GrHYg@mail.gmail.com>
In-Reply-To: <CAFLszTh+c8H6Xcz0LXGjO40XA4=y0jdyAFUr6ygc2OkS9GrHYg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U2RO=3bnQayb34+PPD+_PHgeQApVaZv8Y5kc0Ot=O88Q@mail.gmail.com>
X-Gm-Features: AclHuK9dhvNlRKCOtArNyGs4fDmcQo0yhLCkGwe8OeUxFLPcZab45mJ1XIw39r8
Message-ID: <CAD=FV=U2RO=3bnQayb34+PPD+_PHgeQApVaZv8Y5kc0Ot=O88Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pylibfdt: Add NodeTree live tree representation
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:22=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -929,14 +929,16 @@ class Property(bytearray):
> >
> >      def as_str(self):
> >          """Unicode is supported by decoding from UTF-8"""
> > -        if self[-1] !=3D 0:
> > +        if not self or self[-1] !=3D 0:
> >              raise ValueError('Property lacks nul termination')
> >          if 0 in self[:-1]:
> >              raise ValueError('Property contains embedded nul character=
s')
> >          return self[:-1].decode('utf-8')
> >
> >      def as_stringlist(self):
> >          """Unicode is supported by decoding from UTF-8"""
> > +        if not self:
> > +            return []
> >          if self[-1] !=3D 0:
> >              raise ValueError('Property lacks nul termination')
> >          parts =3D self[:-1].split(b'\x00')
>
> When you split this out (as David suggests), please can you add tests
> that call Property directly rather than only going through NodeTree?

Done. Split into its own patch ("pylibfdt: Handle empty properties in
as_str() and as_stringlist()") with direct tests on
`libfdt.Property('empty', b'')`.


> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -1214,6 +1216,261 @@ class NodeAdder():
> > +class NodeTree:
>
> BTW in patch 7, fdtfactor adds 'phandle' and 'fixups' attributes to
> NodeTree objects on the fly, so they carry attributes the class does
> not declare. Since unflatten() uses cls and create_path() uses
> type(self), subclassing already works, so a small subclass in
> fdtfactor declaring these two attributes would be cleaner. What do you
> think?

Good idea! In v3 `fdtfactor` defines a `FactoredTree(devicetree.DeviceTree)=
`
subclass that initializes `self.phandle =3D None` and `self.fixups =3D {}` =
in
`__init__()`.


> > +        node =3D cls()
> > +        for prop in fdt.properties(offset):
> > +            node.props[prop.name] =3D bytes(prop)
> > +        for suboff in fdt.subnodes(offset):
> > +            node.children[fdt.get_name(suboff)] =3D cls.unflatten(fdt,=
 suboff)
> > +        return node
>
> If a blob has two sibling nodes (or two properties) with the same
> name, one is silently dropped. I checked with FdtSw: with two 'a'
> subnodes under the root, only the second survives. libfdt does not
> reject such blobs and fdtfactor reads input it does not control, so I
> think it is better to raise ValueError here than to quietly throw data
> away.

Done. `DeviceTree.unflatten()` now raises `ValueError` if a node has
duplicate property names or duplicate sibling subnode names, with unit test=
s
in `tests/pylibfdt_tests.py`.


> > +        fdt =3D sw.as_fdt()
> > +        fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
> > +        fdt.pack()
> > +        return bytes(fdt.as_bytearray())
>
> This reaches into fdt._fdt and calls the raw SWIG function. It would
> be worth adding Fdt.set_boot_cpuid_phys() to go with the existing
> FdtRo.boot_cpuid_phys(), and calling that instead.

Done. Added `Fdt.set_boot_cpuid_phys()` in a preparatory patch and updated
`DeviceTree.flatten()` to call it.


-Doug
