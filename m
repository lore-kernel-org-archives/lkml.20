Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547374;
	b=dsVoC7cT+PMwihplkn5lKLUjlA9XHhFnb6sY2jiD7MnVEGdLEFvUBGGwRcJ7boFDTpLo
	 hMVubRjwJDnh2XtuSVuHupr5ojcNWskBvGnKpXOKcjpn/xUKbYP+MoYWROxvbbGvZXriw
	 bzV53H/EkCrpm8QjJzlM2PNWSOtKYkfpJOEM2sT5wYIKwdmYMXS3ibWIOxOHTL/On4s0B
	 o4MwS2FBEqH+6qg6wAOk3nMh20gFFpuuabah4WhxoVEpks83DQsCLkHgiBSnNd42co4yM
	 dEhHL/7UP+fvSJUL9+pNZG/nEB8UEPPLJ/mDN2R+WHnSFttTbTA0cVl+Obu79Zwn+yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Ox4n6KYykVTZqhM4hkJTXpATyoWTeYxSGb9cMjYE3n0=;
	b=l9CXk0ejKGU36xyOFndIRKi8ufvseoaL983xnOgKzxB3Sr6sTmCRhK/3mjzxgpPV0F/a
	 dtECemAT+CZ6AV2fjfmVveVmxHpJsddDMQxtGZt9XVB3nLfAjPOmUfcXnMd1cd7KpmQiY
	 ZqPBYCwc8vPce149y5Mp28f5ioefBH0IY2JyURnllhnkRs07zNjeptepQrWqJdtkTbEE2
	 j/PmBFSiRCLtYRpXFHMVYem4f98xsXXvLIaXvoDKEWbhPgBx2SQdmHE742VSLYgilfyEx
	 YL7ja0G2miQFLgKe9AAtojJdwxYtzMASEfCK7m6t2JpvJXMYIDUieE5bDjp5GZPL8Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IKpf1jIN;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368CC606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 368CC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IKpf1jIN
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c468bd799ecso95430266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794547373; x=1795152173; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ox4n6KYykVTZqhM4hkJTXpATyoWTeYxSGb9cMjYE3n0=;
        b=IKpf1jINs8ZITU6IZxziDDL2xXi+aPd26IbGR6CqTg5uLARRiARBNHRXjcN/RdnUny
         yetrBC6ygWN1fUxH12UefKUlU/WjXWK5o/09+2mZ4EFS1bSi4H2XGgzht81HX3mUp92P
         XD1PrQO6uNorhQO3aCa1wu1F66lCGKsigKTA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547373; x=1795152173;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ox4n6KYykVTZqhM4hkJTXpATyoWTeYxSGb9cMjYE3n0=;
        b=OAV5ju8LmoVjpJkgJfxkEViGgBPuIySVJ3BKDgnuH4F9+fWn3lFDRWV4c60H4IHXZP
         Mn+54N8j4/soIgWyfFvTcd9ZqTk0b7BrdKG0Fe47ZCdBJh4zWohCxFaLPS+poR2N3gTb
         jCXNU0uHFxOczo0/aTIoQfv+rQGlveq41wNdQzn2mG/fLrRme6P/lraxps3Zc8rtpv4B
         /yEjeMkwjkl+DbSzNA633ezWlRRWmJ4gvrYCwX6uyDDExYFOL2qXNajEaEoeLf3oL7kE
         JLA4mlfEepDuNSMIHWrToxVZfl5S5WbOSQRx+6NKzV4us5xEFQyOb5Ow5mKjNtBR/seC
         KB2Q==
X-Forwarded-Encrypted: i=1; AL+hErF3GIPXRmNkFjPnhB9m3TpH8rUXUXq0sfCKfFjLdvHB4XcKU+Cm6E9eSSn1HNHzoTRRrc9AD2uzva6k2bk=@vger.kernel.org
X-Gm-Message-State: APuU4Z++2lOOPeTwu6pddyKfOqeUXTtRD6w6GHCHgqMhuSm+eMCYglDM
	4cexEPPy9/IGgLFarWLX6Fm11HrJg09adgs/0rYXJNWNlUsSXS8fpCPhfnXp8r47uzEePilAurN
	ADl1zuGpn
X-Gm-Gg: AYBFou0i41HzAy3R96tV/b427P/2BckA1oRASVbA+tyR4e84Acq2mfu1VD4ISw48YOF
	pvC3d8+j2hmF80exGxFX/i97ankhyJGAWbSCbu5f5csu6WWzVqLlVgiy9aPHYncsVrSVd7yWum+
	Z0wfWXbjNy1Oh4sBE80kDxjne5rgWZcELH2LF24R4hvo8S0qZAbW9JUjCfeCwZJhpoGQoQgq/OE
	LdIaFfF1O4SFtd/iLVFD8nOWHnOgzKfp74wL7VMhe1/ICz/0J7Qg32B98yxAxAeXzCk6uJuCZ5s
	xjGnOm0kM/rDgziSvrR2P3l3QJjagsN6qrmVAoLy5Rwia9jfZjinU6JJtMpg+d3mawNxQ61MDC0
	tuTb7celJoXn7eDboAsaSbaffYOuC2co1Zql7FEveYZt2Nyye4cgPhRetMfXVCHKzB+nnKcodv3
	suPPnNhuhdL1TOpXo2fJww5dnoVd3OpCcgTu813owNgGmP3y+dYFlJhqeQpKEvFxPyp1A/J5G9L
	n5M7HYOV5SG1XpuQo+FUDxHNIVGTO6dWuyELuR5d7A1CQ6Nv9NWpqb7bNrUFRWzycz2WLQwMuqr
	r9/rY0evrLK41Fc38oBPF3JdT0AK8Ydnaw9IJcKww4Wiy0c3Eaeawt3RBlK5DQHvt8xw
X-Received: by 2002:a17:907:d402:b0:c40:d920:747c with SMTP id a640c23a62f3a-c509614fbf8mr106442866b.7.1794547372350;
        Thu, 12 Nov 2026 21:22:52 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c00fsm52081566b.3.2026.11.12.21.22.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 21:22:52 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so554293f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:22:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEbtN0ljo93re4bcXkmg1Y8MmIlnj2lDQkCAkj/3VkR5hYsvaWk9YKAuDLXvjul/XUHKRjdhAQHKjWe7zY=@vger.kernel.org
X-Received: by 2002:a5d:4f86:0:b0:48d:f831:2681 with SMTP id
 ffacd0b85a97d-49c71f334a4mr2062026f8f.38.1794547369976; Thu, 12 Nov 2026
 21:22:49 -0800 (PST)
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
 <20261101220224.1436242-13-dianders@chromium.org> <avPsIBLWNrNexcbt@gractus.seuss>
In-Reply-To: <avPsIBLWNrNexcbt@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 21:22:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uy0dxbzoMN6hA7FY3R6hyqcL2j8d2-YeivS=_+dA7NfQ@mail.gmail.com>
X-Gm-Features: AclHuK_tr2qaJcNGS3TJ5jGwHVn7SwIIvG0pdGd-5SNir7fQgEzYdizCECgdiOU
Message-ID: <CAD=FV=Uy0dxbzoMN6hA7FY3R6hyqcL2j8d2-YeivS=_+dA7NfQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] fdtfactor: Add tool to split DTBs into a base
 DTB and overlays
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, Nov 10, 2026 at 8:16 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 02:01:19PM -0800, Douglas Anderson wrote:
> > diff --git a/README.md b/README.md
> > index fcfc2e55d804..61fefc4424fe 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -112,6 +112,49 @@ $ meson setup -Dpython=disabled build
> >  More work remains to support all of libfdt, including access to numeric
> >  values.
> >
> > +## fdtfactor
>
> Pre-existing, but it would be nice to have blurbs for dtdiff,
> fdt{get,put} and the other anciliary tools we already include.

Agreed -- in my draft v4 I've added a preparatory patch adding brief
`README.md` sections for `dtc` and the ancillary tools (`dtdiff`,
`fdtget`, `fdtput`, `fdtdump`, `convert-dtsv0`, and `fdtoverlay`).


> > +        self.filename = filename
> > +        with open(filename, 'rb') as f:
> > +            raw_bytes = f.read()
> > +        self.raw_bytes = raw_bytes
>
> AFAICT, self.raw_bytes is never used again (unlike the raw_bytes
> local).

`_print_dtb_stats()` actually used `len(d.raw_bytes)` further down to
compute `orig_uncomp` when `--stats` is passed, though nothing ever
reads the buffer contents again after `__init__()`. In my draft v4 I've
replaced `self.raw_bytes` with `self.uncompressed_size = len(raw_bytes)`
(pairing with `self.compressed_size` in the compression patch) so we
don't keep all the uncompressed DTB buffers in memory just for their
lengths.


> > +            if 'phandle' in node.props:
> > +                node.phandle = node.get_u32('phandle')
> > +                del node.props['phandle']
> > +
> > +            if node.phandle is not None:
>
> Changing this to:
> if node.phandle is None:
> continue
> reduces nesting and IMO, would make this a little more readable.

Done in my draft v4 (and did the same for a couple of other `for` loops
in `fdtfactor`).


> > +                offsets = sorted(set(lf_node.get_u32_list(prop_name)))
>
> I don't think there's any reason to convert the list to a set before sorting.

Done in my draft v4 (`offsets = sorted(lf_prop.as_uint32_list())`).
Neither `dtc` nor `libfdt` emits duplicate offsets in
`/__local_fixups__`, and dropping `set()` also means any duplicate
offset in a malformed blob will be caught by the overlapping-offset
check right below.


> > +    base_root = FactoredTree()
> > +    next_ph = 1
> > +    for path, _ in dtbs[0].root.walk():
> > +        if path not in common_paths:
> > +            continue
>
> I think this makes the loop equivalent to:
> for path in common_paths:
>    ....
>
> > +        if path and base_root.get_node(path.rpartition('/')[0]) is None:
> > +            continue

We can't iterate `common_paths` directly here because `common_paths` is
an unordered `set`:

1. The `base_root.get_node(path.rpartition('/')[0]) is None` check right
   below relies on parents always being visited before their children so
   that if an ancestor was excluded, its descendants are skipped too.
   Iterating a `set` can visit `/a/b` before `/a`, causing `/a/b` to be
   wrongly skipped.
2. Walking `dtbs[0].root.walk()` preserves `dtbs[0]`'s subnode ordering
   in `base_root` and keeps sequential `next_ph` assignment
   deterministic across `PYTHONHASHSEED` values.

I've added a comment above the loop in my draft v4 explaining why it
iterates `dtbs[0]`'s nodes in pre-order instead of iterating
`common_paths`.


> > +        has_phandle = any(
> > +            d.root.get_node(path).phandle is not None for d in dtbs
> > +        )
>
> I expect this will work in practice, but arguably the condition you
> really need here is whether the node is referred to by any fixup in
> any non-common property.
>
> > +        if has_phandle and path and path not in common_sym_targets:
> > +            continue
> > +        base_node = base_root.create_path(path)
> > +        if has_phandle:
> > +            base_node.phandle = next_ph
> > +            next_ph += 1

For the `common_sym_targets` exclusion (`if has_phandle and path and
path not in common_sym_targets: continue`), that's true in principle
with respect to `/__fixups__`: an overlay only needs a symbol in
`base.dtb`'s `/__symbols__` if a non-common property ends up referencing
`path`. There are a couple of catches if we tried to relax this, though:

1. Which properties are common vs. non-common isn't known yet here --
   `_build_base_tree()` decides that next, and its candidate eligibility
   depends on which fixup target nodes are in `base_root` (so resolving
   both together would need an iterative pass).
2. Even when no non-common property references `path`, `base_node` still
   needs a `phandle` in `base.dtb` if `path` is referenced by a *common*
   property in `base.dtb`, or if `path` has a symbol in `/__symbols__`
   (from `dtc -@`) so the reconstructed DTB retains its `phandle`
   property and remains valid as a base for any further runtime overlays
   targeting that symbol. Conversely, if one board had a `phandle` on
   `path` (e.g. a board-specific label) and another board didn't,
   putting `path` in `base.dtb` with a `phandle` would add a `phandle`
   property to the second board's reconstructed DTB that wasn't in its
   original DTB.

Since in `dtc -@` inputs almost every node with a `phandle` also has a
label in `/__symbols__`, checking `has_phandle` up front keeps this
single-pass and exact. I've expanded the docstring on
`_find_common_nodes_and_phandles()` in my draft v4 to note this.

-Doug
