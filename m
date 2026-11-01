Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570697;
	b=oV7NejSxKrBAqCi5oGgRi1qpOPf6rssA8WZN2yNLSwbjYx4wgQenbNMKwOfiNPdOe9Sv
	 Vk9CEbVE2pEbX1cRK1GRBZGSPcQMZVaJUzj2WuhuAP8tvQcyTe7oIk7fJT+NBtPwurV60
	 12WXErzvnyULUqxA9rcXdHWXPNK1HQX03lNaARJLHUKhhwcFswRddObESjqFq2h7D1oJd
	 WI21BD5LW+HnhoxqYHtg1ceeL3jFitiGCOzA+f/PvPn2XgDRVhJgsbBH3t7VmuDdUMr55
	 4DpGm8udkNh2C5Fff1A9amX2uf1vk9mY3aX+kZMBat3fas8codZToeBsuUV1Xd6bc4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GfITPaw+ci0cbhGP7Wv2b7wNe84LbJlDz+5I1hOer3Q=;
	b=o8o3utIdXj9upJnocKsJnnjCKwF50ITX/O3UDmZ2pC6rwhVlU312N4uCn8FGXl2F0gzE
	 fDVt6+O0ENFsMCxFyXM90pzz3oIfg4v8w6Bt1y0Bd/BVwWKLuar0tj/uYz3oswB7CwHIu
	 uEdSfeLg9lRz20G0ocolrqajPfzkHEtjqSsyyi7v51pZvX68zZXIhwfaVZ3sFOcHFhOjg
	 kL3LjJ5npseKPodelZk03JdgvMo0Imh93qQQtoJClAEZJ336KZrOCmz1BzuG5WF9RuMxn
	 5+duif6rjg6jIKutS95gyxgP598o5p/m6LrL/U2/vCYn3wJX6zGpz5+oYAdW5fAmFYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Phwdp3Cf;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB04606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB04606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Phwdp3Cf
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b4e814214aso2463919a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570695; x=1794175495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GfITPaw+ci0cbhGP7Wv2b7wNe84LbJlDz+5I1hOer3Q=;
        b=Phwdp3CfLTcmoskef6yy6pEjAkuT6NhGpi4cX2b3LTnz4yf7iHVtlrNa84K+qNMy5K
         cDKy25sRiAIVqmFCfQNv0B0aGCTbucfSq6pHByMJMYw/4oo7/UaFvzYPQnTxRXyz77+U
         C9jknQaskJWNDFIkgllFBRHp58wikbFXEAk+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570695; x=1794175495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfITPaw+ci0cbhGP7Wv2b7wNe84LbJlDz+5I1hOer3Q=;
        b=dxPpvqmPNpqX6suV74KIg89B0JD4XrNdbRmfB9DMDBauXhU69wDSVJsotGumXVKFee
         BNijNh+KF5bzJFXh9ett2phszhjduVAn3K9Fkcfibvfz2ohWLl6rKayJyQkRLQo/aC2U
         v+lH1UvfTsLhf6Dcnu+uRPe3q4yYo0zHV4vQwzN8N2xBdBbwZaUdcdmkmZh3Xq2JrphD
         vIF5W1z7UQIauzxuEjllEacPz3ZUgJAyzlswv+Tp7S2aIJjHMFcTpVOuI1GNhQzIXdtz
         UwoRshHkuMbJPYAehqZWtGGp63Z6w3GDAnSopUxf4L4sWEbDU8Z+8tb6yW7r50+jkzM6
         rpzA==
X-Forwarded-Encrypted: i=1; AKwUvBx3KWEIdcBUpeBEo3HLtNqrYLLdW6lSuMsREZ7+fDm/eiFLxvivrDJ6OZm4qzwa8wBIsTvCiDoS94xd8Co=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cD9xiOUgLA8oqx0IuN3TGcFUfLu/SUfG/FxGlyPMW/rPy8HFR
	T5mUUPLWVLHSyOS2nZ8Lef8zdMRsMr2mIpVN4zgAjI0suMd970XiE3k7GBxt7hLkjLMMY02aHBu
	iIGYpQ8Xk
X-Gm-Gg: AYBFou0qC+uTwSWktp91SIfz/PKalEEHlIEO4I1OPan5OhCS66D2MhzZCSBIaXfMYa+
	FBYpbEbdMhVOE/W9Su9Uph4q8OeTaAHIDExQ3h5l3sWhlJtDAB96uQs0A+8zEz0v/VuvLVs1tGL
	cYRaDaAfBqNzMoPq1T4yx9g/NFtS7gJoVunGRMKs42YTnp8bw7rtb2suZsV8HcMoZam5Js/VKkS
	j/u34u63HISm1Vrvxyi8qbE6Agwq2FsSo25l5lWKLD7Vs/ed7EWw+A1eF/UIPHlX+1i+O00Z6e/
	ZcoJUq8vFMFajvTnK+p0SFFXFZanh9ciDfwrBHHTPOmrX+30JudbWOlT7o+b5ZO9PcQGolcJ5Nn
	AePHo5MjAU0m7Pwoxo9DxXlJxHL/SUCBk7DsG1QZ8RWzPy/kXdcr1aPveDXTWs5UdNotfbdBqQd
	9b19TqK/D4RYtZrCbO3+9CCWZAwSZNONcLwZHN1sXWm5nhNELnv2dPX3MxVxCTZVNuzBuTC791V
	T02Bw1JSUGAwxIJbJYyyIo9uiq837qNcHhOODYbFhAF9+tz/cqNeixHnc9Hp8XGBBNxAXg2KCaV
	eGSgPs0KIkFB6M4QCsX2pEpTvRwhna5vgcdR9y6inboN9cWbaz5oaVux4rv63tC8a78=
X-Received: by 2002:a05:6402:1f45:b0:6b4:59d0:7294 with SMTP id 4fb4d7f45d1cf-6b4d4c6fdd6mr5621695a12.31.1793570695205;
        Sun, 01 Nov 2026 14:04:55 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcd6fsm2457635a12.21.2026.11.01.14.04.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:04:54 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so18948315e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:04:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByObuDs5c+lUjaoU2wrburGrT8oemReXx+A84PZlfL3zZ+lv7ho9YphmX7zGr4oOQmkEnZ44O4IIE+GWLY=@vger.kernel.org
X-Received: by 2002:a05:600c:848c:b0:4a5:dc5d:20f7 with SMTP id
 5b1f17b1804b1-4ac175669d8mr216663905e9.14.1793570692011; Sun, 01 Nov 2026
 14:04:52 -0800 (PST)
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
 <20261028215600.1713475-4-dianders@chromium.org> <auQjnZ6rd4wqoORz@gractus.seuss>
In-Reply-To: <auQjnZ6rd4wqoORz@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VnZH+bBom69RSVT8kfuP-XO_6mVArUQ=ORJagN3m9QTw@mail.gmail.com>
X-Gm-Features: AclHuK_fDlaJvBpebQfnxbn9UYLGLnZlO-sk2Sumr6YeHeQumNhOKE78u883L_8
Message-ID: <CAD=FV=VnZH+bBom69RSVT8kfuP-XO_6mVArUQ=ORJagN3m9QTw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pylibfdt: Add NodeTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Oct 29, 2026 at 8:55=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Oct 28, 2026 at 02:55:53PM -0700, Douglas Anderson wrote:
> > Add a `NodeTree` class to `pylibfdt` to provide an in-memory live tree
> > representation of a devicetree node and its subtree.
> >
> > While `FdtRo` / `Fdt` / `FdtSw` operate on flat binary blobs by node an=
d
> > property offsets, tools that inspect, compare, or transform whole devic=
e
> > trees are much simpler when manipulating a Python tree of nodes and
> > properties.
> >
> > `NodeTree` provides:
> > - `NodeTree.unflatten(fdt, offset=3D0)` and `tree.flatten(...)` to conv=
ert
> >   between `FdtRo` blobs and `NodeTree` hierarchies.
> > - `get_node(path)`, `create_path(path)`, and `walk(path=3D'')` for path
> >   navigation and pre-order traversal.
> > - Typed property getters and setters (`get_str()`, `set_str()`,
> >   `get_stringlist()`, `set_stringlist()`, `get_u32()`, `set_u32()`,
> >   `get_u32_list()`, `set_u32_list()`).
> >
> > Also fix `Property.as_str()` and `Property.as_stringlist()` when called
> > on an empty `b''` property so `as_str()` raises `ValueError` instead of
> > `IndexError` and `as_stringlist()` returns `[]`.
>
> Thanks for splitting this out as suggested.  However, on
> consideration, I don't think it really belongs in pylibfdt: the "f" in
> there refers to "flattened" and this is, explicitly, a non-flattened
> data structure.  I have sometimes thought about adding a library for
> handling non-flattened trees, although I wasn't thinking something
> Python specific.  I think for now let's move this to its own Python
> file / module.

Done. I've moved it out of `pylibfdt/libfdt.i` into its own `devicetree.py`
module.


> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > index 09fa5fb9ef3c..874a03a3c749 100644
> > --- a/pylibfdt/libfdt.i
> > +++ b/pylibfdt/libfdt.i
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
> The two hunks above are good fixes, but unrelated to the bulk of the
> patch.

Split out into a separate patch ("pylibfdt: Handle empty properties in
as_str() and as_stringlist()") with direct unit tests for `Property`.


> > @@ -1214,6 +1216,261 @@ class NodeAdder():
> >          self._fdt.end_node()
> >
> >
> > +class NodeTree:
>
> Maybe class DeviceTree?  The "node" doesn't really add any useful
> information.

Done. Renamed to `DeviceTree` (in `devicetree.py`).


> > +    @classmethod
> > +    def unflatten(cls, fdt, offset=3D0):
> > +        """Unflatten an FdtRo subtree starting at `offset` into a Node=
Tree.
> > +
> > +        Args:
> > +            fdt: An `FdtRo` (or `Fdt`) instance.
> > +            offset: Starting node offset (default 0 for the root node)=
.
> > +
> > +        Returns:
> > +            A `NodeTree` representing the node at `offset` and its des=
cendants.
> > +        """
> > +        node =3D cls()
> > +        for prop in fdt.properties(offset):
> > +            node.props[prop.name] =3D bytes(prop)
>
> Since we already rely on class Property from libfdt.i, it seems like
> it would be a little more natural to have the dictionary values be
> class Property instances.  Yes, that technically has some redundant
> storage of the property names, but we're not particularly concerned
> about optimisation for this Python library.  Plus, Python's
> assign-by-reference should mean it's generally just a duplicated
> pointer, not a whole duplicated string.

Done. `node.props` now maps property names to `libfdt.Property` instances,
which also simplifies `get_str()`, `get_stringlist()`, `get_u32()`, and
`get_u32_list()`.


> > +        fdt =3D sw.as_fdt()
> > +        fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
> > +        fdt.pack()
> > +        return bytes(fdt.as_bytearray())
>
> For better symmetry with unflatten(), I'd suggest returning the Fdt

Done. `flatten()` now returns the packed `libfdt.Fdt` instance.


-Doug
