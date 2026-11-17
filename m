Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932272;
	b=tfTo8KdtRX+s4CfvVVHwI1DnbZXjqt+vM+RxEIGa1USvrvbUBnwIee4OFAf1wR29MEtj
	 IOIpP5poSrDf2v+x7BpZnnEC3jd+m0SpqIA/bDwYX4j34oC9frsBVDHZEWEEOAd+AC6FU
	 l35U0fR9388pdtxvcLVO3fg56+Z+TAnREJXFZdP42FkRmJ1QeZuYiFIW5lqFX1Cx/2NCI
	 xLr/l0oruexH2Ke0ZMPiP7AiAusdmEu4mVjdmtQeznW04G1BRFmH+Y1J6yydD2vc3J7Ir
	 C0+c0uq4iDhWErsqyVzSRDyyQ+4+8OdVdzbCPb81n2OyNjUMlFy3m1uUkzPuXz/uHPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JRkNuO7f+W9Ho8PIBHE7MaDQUw/2iOTiv6p4KY7Nkys=;
	b=2mWVHqN/zE7gpqYyb52SbgdKw/s6sZHHPZoWA7gawllKiGJM6zKFI1gvRfZM1TtSmoUN
	 QRoQksUyrSwctfNRVWTR5jjcCgfNvTTLUxXp3B8FkAFZHxTobW1rCZpkemXB69AwZaReN
	 0HH6QdSrvnEizLxBKLPT/UZy9qCpkXJY0wunwDhre+s5tBxLiv0LB2s7NkfTUXxEigCh4
	 /GnzL9vM+7nap2gtd8QAoSUOcTTbYMtWsA9iyIy+8gtTuds9ykoiGO/o4QTipFLWidKtW
	 ge4nB+w+p70ShZIMqnYz67W60P8tKu++o8kiOqCzD9Rs5OUc51VKbJd1wEENhCW+iWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AVWu36Rz;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6A0606A339
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A6A0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AVWu36Rz
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso268686766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794932271; x=1795537071; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRkNuO7f+W9Ho8PIBHE7MaDQUw/2iOTiv6p4KY7Nkys=;
        b=AVWu36RznEuT6jve+Uf0YeSxubzwIcicora6tHDdqNO354mMOa3+1LxI7HhtjVtwVi
         QGSYRJd4yAp2GFgAlVWC/X2KwcGU9f6ojOpaaqbL5veKyndkWIdGvxQCPq64mJck3sYm
         DRTUcR2ufEDdwG/8eODdnDxfe2qAdpU4SXF7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932271; x=1795537071;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JRkNuO7f+W9Ho8PIBHE7MaDQUw/2iOTiv6p4KY7Nkys=;
        b=kUpTvE5BzRV/WqQ9voVuT2QAHRMnNUHxqM2ftjBgAKjhhwTafVVbf4OS0PB5bk8KdC
         Rm/0q3VLT3sfrj0YTbmpql19WhclAcsHQRO0NtTNe6vGBD7G9/LVhzT3vbJqfyKQ/3ON
         QA9Iz8/LiZ376OsPlxVzMZzMpZay2RqkX6BwPXjnTVRBWJ/SnUjvwJK+WUh4Xo06y9VK
         2eEOiDNtvKJDr0aCSXnMABvYRbO1+PfMhvbH+NcNx2eXRMjHiQuIwQvhmvO3o84hXHi0
         gADu7Uj67KP2mn0jrM0T+gQya3kcL90jemAxhJ1ii+UkSwch9m8GMVYpj4SnOdQSkbRk
         QEMg==
X-Forwarded-Encrypted: i=1; AL+hErFsOx5PT+mut8sKhc234edy0QBH3eZQgB16TcFgymWJ2uDc7D/yWQUXwLsKRxsq2VUbiGl3ZZ36hfnXrlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DlOAg4wUMHoHsd5OnU+lggmwJrfaIXIk0swm4+G0DdlcLVUu/
	Mo/IItbk6/MStMg5zeWyJ3AclmH3m4MYDuAjJZZhmW2Vy4aQnmouNNi+jHHPBZQFEfNTQ2zk0U8
	hK7dCHg==
X-Gm-Gg: AYBFou1BMPrwStSrrCyjJAb6bvn/9iUpwEeNzFwGhBs0czbwwum93NxTQLYl9u3rqFl
	/ng+UfB+wt/i6fV6Y2mEFtSpts1VbqkJcsCbIx4/udYT+1ErHb5NGHtgK4Xg4RYJVC91N4yn+wJ
	n7HFdPHBwKm7zsCBKfzDEDDYjFP8GovHY7YFjPnFCA6dpTKlba/MvRPoayGcAHBcenCUJqzQK+9
	OJE2PtabiTTxps6P5LJBKhRdAVX7p4j6cYZ1wKhkGSX6riZvGvRZu1VAm4KhQ5rEvPilBGo5ATT
	Rf/lgeyTjTeNBSifNbhRT2P5n8oFzNpFqx30NM2OxLgOmp8Xo0AYOA6SGuJ4vJ8DYoSSNjE+tlB
	N/E6k6Rw97iZWU+FSlDhwjLYbfp9DYzzF0MOg7hEKwzxvl6c5BiX4U+7SOpc6CVyW/xkphu3i/x
	3c+FgICuTJm4cr9tnMshVBc88Hob01UZ9hJ8zWAZtUTdrsE+Y2a+RMZBLU5sHqFA9ISTDXVqFrq
	wb4MZyJc7GBtWbw9vuZUHGVesn1Qq2j5rg6ghdSQSixKQr+0qJCGXHiPbb663QTS/ZNAIN/HCkH
	AU92UxoqUF1EoYs8Zv2/yNCku/tWOSkeEzMrgc7EtCxk98PWIPLrxSv3EXB1+bkLS8d8
X-Received: by 2002:a17:907:d88:b0:c36:777f:824c with SMTP id a640c23a62f3a-c50f320cef8mr311735766b.4.1794932270500;
        Tue, 17 Nov 2026 08:17:50 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cb32448sm961766b.68.2026.11.17.08.17.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:17:49 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3edaso835450f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:17:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEz8WUP/3OOk1fYqWkBImFuPGfpTmUezhD2h9GO/WIicizFElMj/f92DeHtp28ObaLcYpCNfO2OdAjEsMs=@vger.kernel.org
X-Received: by 2002:a05:6000:2201:b0:495:728a:5f6f with SMTP id
 ffacd0b85a97d-4a36fc5d49bmr7617593f8f.19.1794932265537; Tue, 17 Nov 2026
 08:17:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-7-dianders@chromium.org> <avvOUIIn9t00XqY_@gractus.seuss>
In-Reply-To: <avvOUIIn9t00XqY_@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 08:17:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WAWUn4t8nyjyFP1if=i1ik1uQ4w=w=28i2MKPr=zsvXg@mail.gmail.com>
X-Gm-Features: Aa3M54oBu4xzuKNJkEO-tZuQ5G1JdKIa1DFQA984jaIf5jsKQ9Mw1Z6-99t_t0I
Message-ID: <CAD=FV=WAWUn4t8nyjyFP1if=i1ik1uQ4w=w=28i2MKPr=zsvXg@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, Nov 16, 2026 at 7:47 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > On one stress test (walking all ~573k nodes and ~2.06M properties across
> > 438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
> > ~1.8x.
>
> Hm, optimizing pylibfdt has never been a focus, on the general
> assumption that if speed is really important to you, you shouldn't be
> using Python.  I'm happy enough with patch 4, because it's a speed win
> with a very small and simple change.  This optimization is a much
> larger chunk of code, so I'm not so convinced this is worth the source
> complexity we pay for it.
>
> That's not an outright rejection, but I'd need convincing this is
> worth it.

Right, if we're trying to get the absolute maximum speed then of course
we wouldn't choose Python. For a tool like `fdtfactor`, speed is
certainly not the top priority and Python is the superior choice.
Writing it in C would have been a much bigger pain.

That all being said, just because speed isn't the top priority doesn't
mean it doesn't matter at all. When I started looking at optimizations I
was seeing my 438-DTB run take ~25 seconds, which is just a bit too
much. With all the optimizations I ended up with ~12 seconds. That's
still a lot and it would be nice to make it even better, but it also
starts getting into the realm of acceptable.

`FdtRo.properties()` stood out in profiling because
`DeviceTree.unflatten()` calls it on every node (~573k nodes / ~2.06M
properties across the 438 Qualcomm DTBs). In the pure-Python generator,
each node makes `1 + 2 * num_props` SWIG calls (~4.7M boundary
crossings, each going through Python `check_err` / `check_err_null`
wrappers and generator suspension/resumption) and allocates a fresh
non-interned `str` for repeated property names like `compatible`, `reg`,
`status`, and `phandle`.

Below is a small standalone script (`bench_properties.py`) that builds a
1,300-node (~140 KB) DTB in memory via `FdtSw` and walks it 400 times
(~520k nodes, ~2.08M properties) with patch 06/14 applied. On my
machine:
* Default `meson setup build` (`-O0`):
  - `FdtRo.properties()`: `2.52s -> 1.50s` (1.68x faster)
  - Full tree walk: `3.35s -> 2.25s` (1.49x faster)
* `meson setup --buildtype=release` (`-O3`):
  - `FdtRo.properties()`: `1.76s -> 0.98s` (1.81x faster)
  - Full tree walk: `2.24s -> 1.43s` (1.57x faster)

On the source-complexity side, roughly half of
`fdt_node_properties_stub()` in v4 is repetitive `Py_DECREF`
error-cleanup boilerplate -- using `PyObject_CallFunction(prop_cls,
"Oy#", ...)` and a single `err:` label trims it from 55 lines down to
~30 lines. That said, as noted in the patch notes, ~1 second on a
400-DTB run isn't make-or-break, so if you'd still rather not carry the
C helper in `pylibfdt/libfdt.i` I'm totally fine dropping this patch in
v5 (or trimming it to the ~30-line version if that tips the balance).

---8<---
#!/usr/bin/env python3
# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
# Run from the dtc repo root after applying patch 06/14 and building:
#   meson compile -C build && python3 bench_properties.py
import os
import sys
import time

if os.path.isdir('build/pylibfdt') and 'build/pylibfdt' not in sys.path:
    sys.path.insert(0, 'build/pylibfdt')

import libfdt
from libfdt import QUIET_NOTFOUND


def old_properties(fdt, nodeoffset):
    poff = fdt.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
    while poff >= 0:
        yield fdt.get_property_by_offset(poff)
        poff = fdt.next_property_offset(poff, quiet=QUIET_NOTFOUND)


def unflatten_walk(fdt, props_fn):
    off, depth = 0, 0
    while depth >= 0:
        props = {p.name: p for p in props_fn(fdt, off)}
        if depth > 0:
            fdt.get_name(off)
        off, depth = fdt.next_node(off, depth)
    return props


def make_sample_dtb(num_nodes=1300):
    sw = libfdt.FdtSw()
    sw.finish_reservemap()
    with sw.add_node(''):
        sw.property_string('compatible', 'example,board')
        sw.property_u32('#address-cells', 2)
        sw.property_u32('#size-cells', 2)
        with sw.add_node('soc@0'):
            for i in range(num_nodes):
                with sw.add_node(f'dev@{i:x}'):
                    sw.property_string('compatible', 'vendor,periph')
                    sw.property('reg', b'\x00\x00\x00\x00' * 4)
                    sw.property_string('status', 'okay')
                    sw.property_u32('phandle', i + 1)
    return sw.as_fdt()


def main():
    if not hasattr(libfdt, 'fdt_node_properties_stub'):
        sys.exit('Apply patch 06/14 and rebuild pylibfdt first')

    fdt = make_sample_dtb()
    offsets = []
    off, depth = 0, 0
    while depth >= 0:
        offsets.append(off)
        off, depth = fdt.next_node(off, depth)

    iters = 400  # ~520k nodes, ~2.08M props (similar to 438 arm64 DTBs)

    t0 = time.perf_counter()
    for _ in range(iters):
        for o in offsets:
            for _ in old_properties(fdt, o):
                pass
    dt_old = time.perf_counter() - t0

    t0 = time.perf_counter()
    for _ in range(iters):
        for o in offsets:
            for _ in fdt.properties(o):
                pass
    dt_new = time.perf_counter() - t0

    t0 = time.perf_counter()
    for _ in range(iters):
        unflatten_walk(fdt, old_properties)
    dt_unf_old = time.perf_counter() - t0

    t0 = time.perf_counter()
    for _ in range(iters):
        unflatten_walk(fdt, libfdt.FdtRo.properties)
    dt_unf_new = time.perf_counter() - t0

    sz = fdt.totalsize()
    print(f'{len(offsets)} nodes ({sz:,} B) x {iters} trees:')
    print(f'  FdtRo.properties() old (SWIG loop): {dt_old:.3f} s')
    print(f'  FdtRo.properties() new (C helper):  {dt_new:.3f} s '
          f'({dt_old / dt_new:.2f}x faster)')
    print(f'  Full tree walk     old:             {dt_unf_old:.3f} s')
    print(f'  Full tree walk     new:             {dt_unf_new:.3f} s '
          f'({dt_unf_old / dt_unf_new:.2f}x faster)')


if __name__ == '__main__':
    main()
--->8---

-Doug
