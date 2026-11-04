Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766563;
	b=F7pUMFo/GsqHOxEi3+Lm/bKhjJcwZnDb6j5YC5NXnjNxukkeNml9gJqJHFI1wtMl44VT
	 Cx/R5Pe17DmuSumT+kdC9WCnsvwz9PkwSYMqlQyZo3NkkA2ioIsCOzar11WhZVqJt2F/f
	 X1A/0KRzLs2p5df/G5v7EmhHSfldm1QqE7cMrLgxc9baieFgZA5g+8fkgTMQ7aA281nsr
	 g0Bb3Urhk7FuyOG1YXmtJ8EDsWNawDFcep1UKmB3daVFkEHoVAi44ktb7YSelj/IIfo4k
	 vCw9xU9ymUNCpheFYv/sP2huPeqDVNenYzo9V2jZ1FPLL/XFmZr7OxE0gbie8ur2r7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s9VTcseFRjItBb8M0/dM+uCKSe8QR9zyb/UHNpdb02M=;
	b=IHmiXVRLDNyeeff79CxwaelkpFBNSh7u76XlzsvACh3iFMKOsliGtudqjmC1KoTkJ7r4
	 vXr/KbtfLc6PAscCDTK0KgRk/kxAXPQX8pHew804yHBXzeUDKwGBlm+lhcxYWZBBEl1jU
	 MAsQAhDGmpGaXU7uZACGylcHUlp+wViiDY/DxHjv+Qs8hIdlc2aOrAnRyo1INvhNtxigo
	 5iASbxN/0E80CKuQ6XMkHmAEO4qk0LgeNjIvYwNNiHbPBhFYB6jUdCgnAGEbskE2lKzat
	 d7UKs2bubI6eiVAEtMS8cD8RvdmvtnORq1H5pZqEoNaRWfMMvnX2sw5ByVrM4hUV4Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XIuWIcfq;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F5B606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3F5B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XIuWIcfq
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c45551fa84eso47548266b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793766561; x=1794371361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s9VTcseFRjItBb8M0/dM+uCKSe8QR9zyb/UHNpdb02M=;
        b=XIuWIcfq98WkZxctkWZHa+04rg82SxQvh1BxGIapWJoFcjHSAxJ8lxBNrL0ZJ7mO+s
         cta05rEB3B78Ksdg/zIXTdmJc1eIYJcOou84JqF665g51dZ/ltBZ2BsQhLH6hBTteNOQ
         LttrCSASJEf2EDlT27Sv1wkIiwpTY34ZG4jmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793766561; x=1794371361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9VTcseFRjItBb8M0/dM+uCKSe8QR9zyb/UHNpdb02M=;
        b=qj2Q63fh+FSHTRq6EN1MGMahSFHqO4Lqzds712114GvbkbPuT2EbuJv0LqjZ/P3IRf
         j7SFL7mpLn/9L6NgcpkiF+xk0N9TEyYj87+UeOt5wzE/F/EUkTDA4XZEBaViPGq4AGDr
         YpRfwUyCFjS958ov+g3YyYj2vdg9me3Gy1z7E1S9PlAnOWwzwCVmSvtdkmbRw5Z0kYzn
         HeT7zOBxcmM1oqlAy03DV+qDd6ywH98t1Bmp/Q+lON/dq9qcmDZ/UgSFq2Won05eGcku
         IwYmUpI2RyA7z6EOM8jo4Tv/fLHDPfVONyXEbxk770MGEapEiQjO/jSiGTo88qlH4j6p
         IdhA==
X-Forwarded-Encrypted: i=1; AKwUvBwdKyKOTAIsfkJ7whnqf8N8HIf3oAiCNkW7T6Ud2HXsR1ip04TCNfd5Wp6WXHCmCOwUzb9grsf2w+/6fU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OpNealSfyGPNVpToxeHlULinJmbsAhTMVnP/+q3DbISZ1ryBK
	5tZoSNNGERh93NKEssUpg20HA7KEogcGVcAfpMxnp5R6sA0flC4PrWnjqcZYL1f3McnkzxHltlE
	ZB252mA==
X-Gm-Gg: AYBFou1kwZBJetxD+ESM0cT5caN6f7UMwPTw2yIMDnobadCQCkgkxzD+qoKqYmlNmNX
	fHVdOhzpcurUgvRDr92z/KM4IWeNnJTRO40FgApe7hBaeBR2dp4i0iGmyUL+x9p3FQFzjq8L5oF
	fHFKyjIp2keKs9YFQ5MFrtb3x7WvX7Au3QzwEcSuBM52xDsUpxi6DJWOJqyh5BjAR0choO3n3bR
	wNj5bwXS3KhV8hbaJEx7R7ET9XvuPbN3cmQXEqA5yG8Sq+3qEX4X8jtcS/bXIm9gInbT4eM7CRV
	3tLwlKUsyU1mQYttI+eDJBxPgI0RNrW2IZr7mqDBsail9SGQLL4G1h+1EWmG8koHikm879vGbVu
	fsSPz88Ix3ZAFshwryCiwlh2utG692uzFqW5kIB5jy5PTRxKOEBfSFtIN6jjyvDl+78cE1bimUj
	qKgmX1mzHVUXCeu3ymFandgTnpKKpvgW7rF4NTwi71kkx/2WHV4RN/DQ/YHmNMa+/Ig+ycegI5j
	VwGGONoCDTsDzw6pKZPaKBFRtCof+yf5YLhySKPjxqOnC8yySKkQmnmceSBHXE+cJqQLheQ3XKk
	JVmYPr4tX2MGZM8Qnz8sFCgTMuRf1mg0iYPFASd+4SF1nxRsN74s5WCl9uyD1Tdz54Y=
X-Received: by 2002:a17:906:c143:b0:c46:c3ad:e1ca with SMTP id a640c23a62f3a-c4ca7a0996cmr1290856866b.9.1793766560947;
        Tue, 03 Nov 2026 20:29:20 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac835ccsm331139a12.30.2026.11.03.20.29.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 20:29:19 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so1732995e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:29:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw82+Dbhnd3fJ5LkgoisO2cpeKSA2I3/BKdVNk4rwJWCgJEQfjzGuoTQO7QaRYLYqYqFyas1EXwWJgicDA=@vger.kernel.org
X-Received: by 2002:a05:600c:350b:b0:4a3:2f35:38aa with SMTP id
 5b1f17b1804b1-4ac1932bac0mr304971575e9.29.1793766557744; Tue, 03 Nov 2026
 20:29:17 -0800 (PST)
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
In-Reply-To: <auhYb6FV2dPrbVxB@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 Nov 2026 20:29:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com>
X-Gm-Features: AclHuK-EI94Ty2au4xO-ZKZ76QhCMiI3A7chng9xu_64EGkNq0XD6rjuoimiGkw
Message-ID: <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
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
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Nov 2, 2026 at 1:31=E2=80=AFAM David Gibson <david@gibson.dropbear.=
id.au> wrote:
>
> On Sun, Nov 01, 2026 at 02:01:14PM -0800, Douglas Anderson wrote:
> > diff --git a/devicetree.py b/devicetree.py
> > new file mode 100644
> > index 000000000000..198ab73eda88
> > --- /dev/null
> > +++ b/devicetree.py
>
> This should probably go in a subdir, since it's not part of dtc
> proper.  I think putting it in pylibfdt is ok, even though it's not
> technically part of pylibfdt either.

Sounds good. For v4 I'll move `devicetree.py` to `pylibfdt/devicetree.py`
and update `pylibfdt/meson.build` and `tests/meson.build` accordingly.


> > +        node =3D cls()
> > +        for prop in fdt.properties(offset):
> > +            if prop.name in node.props:
> > +                raise ValueError(f'Duplicate property {prop.name!r}')
> > +            node.props[prop.name] =3D prop
>
> This is, technically aliasing the Property returned directly from the
> flattened tree, which seems a little risky.  Or at least it does if
> Property is mutable, which it appears to be as a subclass of
> bytearray.
>
> On consideration, that kind of seems like a pre-existing mistake - the
> way we use it, I think it makes more sense for Property to be
> immutable (a subclass of 'bytes' instead).  I wonder if making that
> change would break things.

Note that `fdt.properties(offset)` (via `get_property_by_offset()`)
already allocates a fresh `Property` object with copied bytes on each
call rather than aliasing the underlying `Fdt` buffer. Even so, having
`Property` be mutable is definitely footgun-prone when `Property`
instances are stored in `DeviceTree` or shared across nodes, and making
`Property` subclass `bytes` instead of `bytearray` has some nice extra
benefits:
- `Property` becomes hashable (can be used in sets/dict keys) and its
  byte value is immutable.
- `fdt.setprop()` and `sw.property()` C SWIG typemaps require
  `PyBytes_Check()`, so previously passing a `Property` directly to
  `fdt.setprop()` raised a `TypeError` unless wrapped in `bytes(prop)`.
  With `Property(bytes)`, a `Property` can be passed directly.

Looking into compatibility for external `pylibfdt` callers if we switch
`Property` from `bytearray` to `bytes`:
- All existing tests in `dtc` pass without modification, and U-Boot's
  `dtoc` (`tools/dtoc/fdt.py`) immediately converts the `Property` from
  `get_property_by_offset()` to `bytes(p)` anyway.
- Indexing, slicing, `len()`, iteration, `struct.unpack()`, the buffer
  protocol, and all read-only bytes/string methods work identically.
- Equality comparisons (`=3D=3D`) against `bytearray` still work, since
  `b'abc' =3D=3D bytearray(b'abc')` is `True` in Python.
- One subtle difference is that `bytearray` has a `.copy()` method
  (`prop.copy()`) whereas `bytes` does not (`b''.copy()` raises
  `AttributeError`), though we could easily keep `prop.copy()` working
  by aliasing `copy =3D __copy__` on `Property` if needed.
- The only things that would break in external callers (and can't be
  shimmed on a `bytes` subclass in CPython) are:
  1. Mutating a `Property` in place (`prop[0] =3D x`, `prop.extend(...)`),
     which seems unlikely since `Property` is a disconnected snapshot and
     mutating it never updated the `Fdt` blob anyway.
  2. Explicit `isinstance(prop, bytearray)` checks.

In my draft v4 branch I've queued up a preparatory patch ("pylibfdt:
Make Property a subclass of bytes instead of bytearray") that changes
`Property` to subclass `bytes` via `__new__(cls, name, value)`, updates
the `fdt_get_property_by_offset` SWIG typemap to return
`PyBytes_FromStringAndSize()`, and drops the redundant `bytearray()`
wrapper in `FdtRo.getprop()`. Let me know if that sounds good to you or
if you're worried enough about compatibility with external callers that
we should keep `Property(bytearray)`.


> > +        for suboff in fdt.subnodes(offset):
>
> So, this can be a later improvement, it doesn't need a respin, but
> this is a pretty inefficient way of unflattening the tree.  To get
> from one subnode to the next subnodes() needs to traverse everything
> in between in the flattened format - which is also what the child
> unflatten()s do.   So on at every level making this roughly O(d * n)
> where n is the number of nodes, and d is the depth of the tree.  You
> can unflatten in a single O(n) pass over the tree.

Since I'll be spinning v4 anyway, I've updated `DeviceTree.unflatten()`
in my draft v4 to unflatten in a single O(n) pass using
`fdt.next_node(offset, depth)` and a node stack.


> > +        fdt =3D sw.as_fdt()
> > +        fdt.set_boot_cpuid_phys(boot_cpuid_phys)
> > +        fdt.pack()
>
> The pack() is harmless, but probably unnecessary - fdt_finish(),
> called from as_fdt() leaves an already packed tree.  Unless something
> resized after that point, which set_boot_cpuid_phys() shouldn't do, it
> should still be packed.

Good catch. Looking at `FdtSw.as_fdt()`, while `fdt_finish()` packs the
FDT header's `totalsize`, `FdtSw.as_fdt()` currently doesn't trim the
backing Python `bytearray` to `fdt_totalsize()` (unlike `Fdt.pack()`,
which runs `del self._fdt[self.totalsize():]`), leaving trailing buffer
slack in `fdt.as_bytearray()`. For v4 I plan to add a small preparatory
patch ("pylibfdt: Trim Fdt bytearray to totalsize() in FdtSw.as_fdt()")
so `FdtSw.as_fdt()` trims the `bytearray` to `fdt_totalsize()`, and drop
`fdt.pack()` from `DeviceTree.flatten()`.


> > +    def get_str(self, name):
> > +        """Return property `name` decoded as a NUL-terminated UTF-8 st=
ring.
> > +
> > +        Args:
> > +            name: Property name to look up in `self.props`.
> > +
> > +        Returns:
> > +            Decoded string value (without the trailing NUL byte).
> > +
> > +        Raises:
> > +            KeyError: If `name` is not in `self.props`.
> > +            ValueError: If the property value is not a single NUL-term=
inated
> > +                UTF-8 string.
> > +        """
> > +        return self.props[name].as_str()
>
> Rather than having wrappers around all the class Property acccessors,
> would it be simpler (and only slightly more verbose) to just have a
> property() method, returning a Property instance and use its accessors
> in the caller?  Looking up properties with __getitem__ could also
> work, although maybe the fact that doesn't get subnodes would be
> confusing?
>
> I guess that would also require a bunch of new class methods on
> Property for the set* side.

Yeah, that works out nicely. For v4 I've queued up a preparatory patch
("pylibfdt: Add Property.from_*() creation methods") adding
`from_cell()`, `from_uint32()`, `from_int32()`, `from_uint64()`,
`from_int64()`, `from_list()`, `from_uint32_list()`, `from_int32_list()`,
`from_uint64_list()`, `from_int64_list()`, `from_str()`, and
`from_stringlist()` classmethods to `libfdt.Property` as the
counterparts to `Property.as_*()`. Then in `DeviceTree` I've dropped all
the `get_*()` and `set_*()` wrapper methods and replaced them with a
single `DeviceTree.set_prop(prop)` helper (which stores
`self.props[prop.name] =3D prop` so callers don't have to repeat the
property name when setting a `Property`).


> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > index ae46b29a8f5c..cfdb8f5749b6 100644
> > --- a/tests/pylibfdt_tests.py
> > +++ b/tests/pylibfdt_tests.py
> > @@ -11,6 +11,8 @@ import types
> >  import unittest
> >
> >  sys.path.insert(0, '../pylibfdt')
> > +sys.path.insert(0, '..')
>
> See above about location of devicetree.py.  But.. for that matter,
> with the code in a separate module, it probably makes sense to have
> its tests in a separate file, too.

Makes sense. For v4 I'll move the `DeviceTree` unit tests into a new
`tests/devicetree_tests.py` file and run it alongside `pylibfdt_tests.py`
in `tests/run_tests.sh`.


> > +    def testDeviceTreeRoundTrip(self):
> > +        """Test unflattening and flattening a tree via DeviceTree"""
> > +        tree =3D copy.deepcopy(devicetree.DeviceTree.unflatten(self.fd=
t))
>
> What's the deepcopy for?  You're not retaining the original
> unflattened copy.

I'll drop that in v4. (It was a leftover from testing
`Property.__deepcopy__()` before that was split out into its own test in
`pylibfdt_tests.py`.)


> > +        self.assertIsInstance(tree.props['compatible'], libfdt.Propert=
y)
>
> I don't know if directly accessing the tree's internal dictionary from
> outside is a good idea.

My intent was for `props` and `children` to be the primary public `dict`
attributes of `DeviceTree` (rather than internal/private state), which
keeps property and child-node lookups, iteration, and deletion
(e.g. `node.props['compatible'].as_stringlist()`, `node.props.get(...)`,
`del node.props[...]`) idiomatic in Python without needing a parallel
set of dict-wrapper methods. Dropping the competing `get_*()`/`set_*()`
wrappers on `DeviceTree` and adding `node.set_prop(prop)` makes that
model much more consistent; for v4 I'll also update the `DeviceTree`
class docstring to explicitly document `props` and `children` as public
attributes for callers.


> > +        tree2 =3D devicetree.DeviceTree.unflatten(fdt2)
> > +        nodes1 =3D [(path, n.props, list(n.children.keys()))
> > +                  for path, n in tree.walk()]
> > +        nodes2 =3D [(path, n.props, list(n.children.keys()))
> > +                  for path, n in tree2.walk()]
> > +        self.assertEqual(nodes1, nodes2)
>
> I don't think it's guaranteed that walk() will get the nodes in the
> same order each time, so you probably want sets instead of lists here.

Will fix in v4 by comparing
`{path: (n.props, set(n.children.keys())) for path, n in tree.walk()}`
(and using sets of paths in the other `walk()` test assertions).


For now I'll hold these draft v4 changes in my local tree. If you have
any feedback on the responses above (or any other patches in the
series) I can make further changes before actually sending out a v4.
If you'd prefer me to send out what I have now so you can review the
latest-and-greatest, I'm happy to do that too. If nothing else, some
of the changes we've made to how DeviceTree works here bleed into the
other patches a little, so sending a v4 before you review further
could be nice. ...but I also don't want to churn the series faster
than you're ready for it. ;-)

-Doug
