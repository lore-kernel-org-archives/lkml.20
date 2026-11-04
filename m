Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805246;
	b=wqula8clZ+HqV5rYy8Q0ishrVoDkGyL0BhvnCPf9RlAvQixvDFh/2jsS17fFcNZGrUpo
	 bVD8eMPlIzyop8HGeX1v9vnVrvx5HDEgNgY/ZOrFT8pLEoFHchgYvbNsIA7L8VHdVWtdG
	 kK1VVyiOfiAPmystFHUNAnnrhqWHjaltl3vxf+XuOMDVFOwKnckUEr8UOgseFT0UJThNi
	 plNNtz0uU57PsoQJGAjK7JEhO9mCUs8Y7CE0Tuw9wrNS6qHTFBRe6ZN1etWTlRIVMXbJv
	 pgYQ+ug+hbje7LH2Va8iFU2ZYkZbl3qqfyuqU2ESJOG6GSYc5ZIf8OVTw/WeiOiWZ8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=31BxSQYAW5ZMPCncUBLLTzDH5bfjEUxJIn838ijIhQg=;
	b=4/f8C3bLYW2x5lsZvOOek+NiiB0rUkTSOgra14tLJlyb1BTAkak//qZnlLf023BGWtwo
	 zIf48inTftRJVWdbmWYfMy7VIxqf5tb2pABMoi0lcLRJY+xgxf6LtxDhE5AJ/VoQKxm3E
	 bNaeiCDPCx2X4p7FeGmry+nTXm2v8QFujP3zgTFk08cvjRAeaGkEyeaegOHh3LVHV5NUG
	 4LoUTlWucNCDKe6asDrb1er9B802wWkLnGVajR88n6/rm9pkIcRJ2lTzIhX/cy2QHvyKi
	 amyer9Q2cIatjIT8QgVocy3nRXFg3FmmJqzhFfNhkpjdhJ3MVQxJwAmD+ew5HgqUUVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L3SsD3xG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01DB606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A01DB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L3SsD3xG
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ea7987517aso4761865ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805245; cv=none;
        d=google.com; s=arc-20260327;
        b=eTNJ/5kj87mrUuHb3di0MA9LHJl9XAtIE05WczVXec2oUB8TydPDrjJ1D2ykm3md5+
         5nX5+fOURU6+Y9zJjFWCVGQrC7zcOXqKp8nOtI/BD3pJYR46ZHIG7Icd2XOI3yDfcPnF
         6TuQeN9UHaVPw9N+sWGp/l4nFZIvq0SkiFuot6RI2nK4G5UXcDVVSREjeV1Dg1PU46O0
         28zAl8M2d1F6Jr35BGNzFA2K4R+0Via+ZnsLrBdnSNS4/cTtS+Oy3Q+x7MbYwKEfFz6h
         rOXIR8fHhBGBeA4ZM6mC0OcP0Qz6rcKNT835gUATh/mUHPcQpTWPTGaFMiwH92JLNK1C
         KcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31BxSQYAW5ZMPCncUBLLTzDH5bfjEUxJIn838ijIhQg=;
        fh=v+yl0fOS8PFMZUEb/c7XLcpdAlBXagGLJCQFdEIBpDU=;
        b=HZXUnMR3yZEf5YO/lqfCe2EHY+EmgMC91/N4BMmzHqLqHO4B90slroKlIlNsatFnVx
         NiJzRIIp7luFZJOVEpG/mzRTh4d/YRpduCE5EOYdEznbjT98TiwTCWRlXWTFhVEzkJ5Z
         I7W0pGCtXa8P90o3BkPwDJj6YtiM1kFNw+mzklu0hmG+3YIpersLJDySgnwsMrXvyTOR
         rCdKZ6cvf9WwHyU/eSwGAaFmpZ/5VJxws69Gm10d8MoeVFptGqRu7rSX2KhwPAdGrfzu
         E0RNcm9DNhbsYib0d/ygIZyRnj5aGq0wcywUnLh2PyCpMjk+8A6BOXiaPvw9kihCZXN6
         NO5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805245; x=1794410045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31BxSQYAW5ZMPCncUBLLTzDH5bfjEUxJIn838ijIhQg=;
        b=L3SsD3xG5SOidLmQYqEWQcwn5xhv0P2KXGVdZg+G8sH1N2teaQP1fxLlOqtZN8X/mM
         hfJNZ4wgXN+fe8NuGmZhZSzvTbzlvaoWiX1aBqoOuIFxdCuf/ggirMCBjJfJh9fJ2HK3
         sIY0Otq/orLQVX+ZSilpbVJa+TBrn9zEUAX8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805245; x=1794410045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31BxSQYAW5ZMPCncUBLLTzDH5bfjEUxJIn838ijIhQg=;
        b=ILsM6eGOiltx/fx42N8CaflDbQMUrNxwMg3ijbtyJscsyT22QaaU0Xp4R9g/jQK9rk
         UXpVj73HUVVL2p4FnS32l9lPBG5yTGcbZH3n8hpArfB6pQRzd8/bobzDqh/RWB9VjF8K
         Izn0KyrN0NwiDrxTygsI7nYBJ5zZyS+3qPNeAYlS3wsxUah90oTQAaQQwHNwUA2/Apnr
         yWkYyDR2IPN7LfBMo69r1BIZaOJxDKRMuYBdHlLEDhoiQ3udd8BySonfK3Wj6RwKxZRe
         c/X8CsOKMSOq2Dhr0Swiwx0Um1cFpH2dJ0qzbzY3kw+1VNyc+K9/G0teuMLEtQsL9amK
         azwQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+JVn5c5tP3OVAxhSDdoIvE63Z+2h8UsNuTbJhBq/5LXwewYXTpE/eaVKgnvnPdiR7e24196l4l3ZlSFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ao2N+SodtBDIeAtVijQabjaoDQgJChyoSrlVk+jAmCyvGEauW
	rck2DzlNyt+/Qatns3mxVciDfQJ3hO9WCps62UI/SpD3o0BChKkUMq5Nw4+0T3lZBwb3YigZ1rf
	/exkvjhlhDpj5dhc8TWqpSHiL+b+7kI6e/4ehGi0G
X-Gm-Gg: AYBFou2i78j0U40DytnujCy6gcM88NyL0R+yMUlfx+RA4M8H/glPfCNI+4xG3cfBozN
	dPeFq8BSCB9XJF9OCOuMsT1AuDvD3gHv7Rv0Ndu4kbrAQHx6Wk3F8T7zFqJ190X6EeOspYAg8tb
	X1U+3hI8Uf7wKCp7vB+31DB5K1zgHDI1A0j2xamn1Q28cZlb/XqjyTyxnBAGK5sLVjRyXF3hnYJ
	ttY0Bk5pnnKaE+dwvoa6liw73R5kGPHMYmZMOyk6w4YFbI1+JCOP2F1zOm3+jzZBOOmVu6/fvnS
	1oXzLA7Idqug/YDs2RUGLl+V30JWYPDcaX0jyS5qqBgdpcPb3R2y+NJTmmFYm3SKgXUP5OHmSHc
	sR3RLJRfh2zr79ekxwek0ayJ8S/TTPQZrC9lciTd9v/ElNzAmppKHsaUFNJf7Tp0uDdfxmLBjV3
	5+KKWTiQs8MUD2pz4A
X-Received: by 2002:a17:903:3247:b0:2ea:1b9b:b946 with SMTP id
 d9443c01a7336-2eb3649bbf6mr162205955ad.14.1793805244873; Wed, 04 Nov 2026
 07:14:04 -0800 (PST)
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
 <20261101220224.1436242-8-dianders@chromium.org> <auhYb6FV2dPrbVxB@gractus.seuss>
 <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 08:13:47 -0700
X-Gm-Features: AclHuK_RYDf1j3dx8AHaIWkRXR_-cIM7g_DbJzBvHkjrBLyz2M8C5fF_K3GaKhk
Message-ID: <CAFLszTjdx2YB+ingEx7HnmNabLBE1Japjg8kjwWwvm7DuZFqSQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: Doug Anderson <dianders@chromium.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Tue, 3 Nov 2026 at 21:30, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi David,
>
> On Mon, Nov 2, 2026 at 1:31=E2=80=AFAM David Gibson <david@gibson.dropbea=
r.id.au> wrote:
> >
> > On Sun, Nov 01, 2026 at 02:01:14PM -0800, Douglas Anderson wrote:
> > > diff --git a/devicetree.py b/devicetree.py
> > > new file mode 100644
> > > index 000000000000..198ab73eda88
> > > --- /dev/null
> > > +++ b/devicetree.py
> >
> > This should probably go in a subdir, since it's not part of dtc
> > proper.  I think putting it in pylibfdt is ok, even though it's not
> > technically part of pylibfdt either.
>
> Sounds good. For v4 I'll move `devicetree.py` to `pylibfdt/devicetree.py`
> and update `pylibfdt/meson.build` and `tests/meson.build` accordingly.
>
>
> > > +        node =3D cls()
> > > +        for prop in fdt.properties(offset):
> > > +            if prop.name in node.props:
> > > +                raise ValueError(f'Duplicate property {prop.name!r}'=
)
> > > +            node.props[prop.name] =3D prop
> >
> > This is, technically aliasing the Property returned directly from the
> > flattened tree, which seems a little risky.  Or at least it does if
> > Property is mutable, which it appears to be as a subclass of
> > bytearray.
> >
> > On consideration, that kind of seems like a pre-existing mistake - the
> > way we use it, I think it makes more sense for Property to be
> > immutable (a subclass of 'bytes' instead).  I wonder if making that
> > change would break things.
>
> Note that `fdt.properties(offset)` (via `get_property_by_offset()`)
> already allocates a fresh `Property` object with copied bytes on each
> call rather than aliasing the underlying `Fdt` buffer. Even so, having
> `Property` be mutable is definitely footgun-prone when `Property`
> instances are stored in `DeviceTree` or shared across nodes, and making
> `Property` subclass `bytes` instead of `bytearray` has some nice extra
> benefits:
> - `Property` becomes hashable (can be used in sets/dict keys) and its
>   byte value is immutable.
> - `fdt.setprop()` and `sw.property()` C SWIG typemaps require
>   `PyBytes_Check()`, so previously passing a `Property` directly to
>   `fdt.setprop()` raised a `TypeError` unless wrapped in `bytes(prop)`.
>   With `Property(bytes)`, a `Property` can be passed directly.
>
> Looking into compatibility for external `pylibfdt` callers if we switch
> `Property` from `bytearray` to `bytes`:
> - All existing tests in `dtc` pass without modification, and U-Boot's
>   `dtoc` (`tools/dtoc/fdt.py`) immediately converts the `Property` from
>   `get_property_by_offset()` to `bytes(p)` anyway.
> - Indexing, slicing, `len()`, iteration, `struct.unpack()`, the buffer
>   protocol, and all read-only bytes/string methods work identically.
> - Equality comparisons (`=3D=3D`) against `bytearray` still work, since
>   `b'abc' =3D=3D bytearray(b'abc')` is `True` in Python.
> - One subtle difference is that `bytearray` has a `.copy()` method
>   (`prop.copy()`) whereas `bytes` does not (`b''.copy()` raises
>   `AttributeError`), though we could easily keep `prop.copy()` working
>   by aliasing `copy =3D __copy__` on `Property` if needed.
> - The only things that would break in external callers (and can't be
>   shimmed on a `bytes` subclass in CPython) are:
>   1. Mutating a `Property` in place (`prop[0] =3D x`, `prop.extend(...)`)=
,
>      which seems unlikely since `Property` is a disconnected snapshot and
>      mutating it never updated the `Fdt` blob anyway.
>   2. Explicit `isinstance(prop, bytearray)` checks.
>
> In my draft v4 branch I've queued up a preparatory patch ("pylibfdt:
> Make Property a subclass of bytes instead of bytearray") that changes
> `Property` to subclass `bytes` via `__new__(cls, name, value)`, updates
> the `fdt_get_property_by_offset` SWIG typemap to return
> `PyBytes_FromStringAndSize()`, and drops the redundant `bytearray()`
> wrapper in `FdtRo.getprop()`. Let me know if that sounds good to you or
> if you're worried enough about compatibility with external callers that
> we should keep `Property(bytearray)`.

To my mind it is more important that we have enough tests to cover the
cases we care about and other tests to fail for unsupported cases.

Immutable seems safer and I can't think of cases where we want to
fiddle around in the middle of a large property, so that the
efficiency might suffer.

>
>
> > > +        for suboff in fdt.subnodes(offset):
> >
> > So, this can be a later improvement, it doesn't need a respin, but
> > this is a pretty inefficient way of unflattening the tree.  To get
> > from one subnode to the next subnodes() needs to traverse everything
> > in between in the flattened format - which is also what the child
> > unflatten()s do.   So on at every level making this roughly O(d * n)
> > where n is the number of nodes, and d is the depth of the tree.  You
> > can unflatten in a single O(n) pass over the tree.
>
> Since I'll be spinning v4 anyway, I've updated `DeviceTree.unflatten()`
> in my draft v4 to unflatten in a single O(n) pass using
> `fdt.next_node(offset, depth)` and a node stack.
>
>
> > > +        fdt =3D sw.as_fdt()
> > > +        fdt.set_boot_cpuid_phys(boot_cpuid_phys)
> > > +        fdt.pack()
> >
> > The pack() is harmless, but probably unnecessary - fdt_finish(),
> > called from as_fdt() leaves an already packed tree.  Unless something
> > resized after that point, which set_boot_cpuid_phys() shouldn't do, it
> > should still be packed.
>
> Good catch. Looking at `FdtSw.as_fdt()`, while `fdt_finish()` packs the
> FDT header's `totalsize`, `FdtSw.as_fdt()` currently doesn't trim the
> backing Python `bytearray` to `fdt_totalsize()` (unlike `Fdt.pack()`,
> which runs `del self._fdt[self.totalsize():]`), leaving trailing buffer
> slack in `fdt.as_bytearray()`. For v4 I plan to add a small preparatory
> patch ("pylibfdt: Trim Fdt bytearray to totalsize() in FdtSw.as_fdt()")
> so `FdtSw.as_fdt()` trims the `bytearray` to `fdt_totalsize()`, and drop
> `fdt.pack()` from `DeviceTree.flatten()`.
>
>
> > > +    def get_str(self, name):
> > > +        """Return property `name` decoded as a NUL-terminated UTF-8 =
string.
> > > +
> > > +        Args:
> > > +            name: Property name to look up in `self.props`.
> > > +
> > > +        Returns:
> > > +            Decoded string value (without the trailing NUL byte).
> > > +
> > > +        Raises:
> > > +            KeyError: If `name` is not in `self.props`.
> > > +            ValueError: If the property value is not a single NUL-te=
rminated
> > > +                UTF-8 string.
> > > +        """
> > > +        return self.props[name].as_str()
> >
> > Rather than having wrappers around all the class Property acccessors,
> > would it be simpler (and only slightly more verbose) to just have a
> > property() method, returning a Property instance and use its accessors
> > in the caller?  Looking up properties with __getitem__ could also
> > work, although maybe the fact that doesn't get subnodes would be
> > confusing?
> >
> > I guess that would also require a bunch of new class methods on
> > Property for the set* side.
>
> Yeah, that works out nicely. For v4 I've queued up a preparatory patch
> ("pylibfdt: Add Property.from_*() creation methods") adding
> `from_cell()`, `from_uint32()`, `from_int32()`, `from_uint64()`,
> `from_int64()`, `from_list()`, `from_uint32_list()`, `from_int32_list()`,
> `from_uint64_list()`, `from_int64_list()`, `from_str()`, and
> `from_stringlist()` classmethods to `libfdt.Property` as the
> counterparts to `Property.as_*()`. Then in `DeviceTree` I've dropped all
> the `get_*()` and `set_*()` wrapper methods and replaced them with a
> single `DeviceTree.set_prop(prop)` helper (which stores
> `self.props[prop.name] =3D prop` so callers don't have to repeat the
> property name when setting a `Property`).
>

Looks good. The 'from' indicates immutability IMO.

>
> > > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > > index ae46b29a8f5c..cfdb8f5749b6 100644
> > > --- a/tests/pylibfdt_tests.py
> > > +++ b/tests/pylibfdt_tests.py
> > > @@ -11,6 +11,8 @@ import types
> > >  import unittest
> > >
> > >  sys.path.insert(0, '../pylibfdt')
> > > +sys.path.insert(0, '..')
> >
> > See above about location of devicetree.py.  But.. for that matter,
> > with the code in a separate module, it probably makes sense to have
> > its tests in a separate file, too.
>
> Makes sense. For v4 I'll move the `DeviceTree` unit tests into a new
> `tests/devicetree_tests.py` file and run it alongside `pylibfdt_tests.py`
> in `tests/run_tests.sh`.
>
>
> > > +    def testDeviceTreeRoundTrip(self):
> > > +        """Test unflattening and flattening a tree via DeviceTree"""
> > > +        tree =3D copy.deepcopy(devicetree.DeviceTree.unflatten(self.=
fdt))
> >
> > What's the deepcopy for?  You're not retaining the original
> > unflattened copy.
>
> I'll drop that in v4. (It was a leftover from testing
> `Property.__deepcopy__()` before that was split out into its own test in
> `pylibfdt_tests.py`.)
>
>
> > > +        self.assertIsInstance(tree.props['compatible'], libfdt.Prope=
rty)
> >
> > I don't know if directly accessing the tree's internal dictionary from
> > outside is a good idea.
>
> My intent was for `props` and `children` to be the primary public `dict`
> attributes of `DeviceTree` (rather than internal/private state), which
> keeps property and child-node lookups, iteration, and deletion
> (e.g. `node.props['compatible'].as_stringlist()`, `node.props.get(...)`,
> `del node.props[...]`) idiomatic in Python without needing a parallel
> set of dict-wrapper methods. Dropping the competing `get_*()`/`set_*()`
> wrappers on `DeviceTree` and adding `node.set_prop(prop)` makes that
> model much more consistent; for v4 I'll also update the `DeviceTree`
> class docstring to explicitly document `props` and `children` as public
> attributes for callers.
>
>
> > > +        tree2 =3D devicetree.DeviceTree.unflatten(fdt2)
> > > +        nodes1 =3D [(path, n.props, list(n.children.keys()))
> > > +                  for path, n in tree.walk()]
> > > +        nodes2 =3D [(path, n.props, list(n.children.keys()))
> > > +                  for path, n in tree2.walk()]
> > > +        self.assertEqual(nodes1, nodes2)
> >
> > I don't think it's guaranteed that walk() will get the nodes in the
> > same order each time, so you probably want sets instead of lists here.
>
> Will fix in v4 by comparing
> `{path: (n.props, set(n.children.keys())) for path, n in tree.walk()}`
> (and using sets of paths in the other `walk()` test assertions).
>
>
> For now I'll hold these draft v4 changes in my local tree. If you have
> any feedback on the responses above (or any other patches in the
> series) I can make further changes before actually sending out a v4.
> If you'd prefer me to send out what I have now so you can review the
> latest-and-greatest, I'm happy to do that too. If nothing else, some
> of the changes we've made to how DeviceTree works here bleed into the
> other patches a little, so sending a v4 before you review further
> could be nice. ...but I also don't want to churn the series faster
> than you're ready for it. ;-)

Regards,
Simon
