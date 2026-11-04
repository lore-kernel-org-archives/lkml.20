Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805262;
	b=jmPdCXMX6huqBrckWzHF0iEpyXnn3gJyy7uMLswLSOx35bWBNwMVxZ5tg6ApUBEOtTYd
	 H2uCNyZt3+z7VEGOGvCV47FUCqy0Yx3+I0Yt/r/5HfIXbrvG2kCgfaKJL6lHGR7ldei5+
	 81GAchQuYppnbImaQ9v5+DuwainvcNxLQA2wSnXNVXTvUZIPTcWwh9xdU61TZV1GPWA3Y
	 jS2BNVaKxFlhYBoYOAMZqejg07G9C82MwyEGWxcE9LNKNFl/SJRScc6W84r6rCQk+3Ijh
	 NlzQp8jKSMnPLhMn5oAwcdZpxP6IdmwAnxFv/QTzD/TEzzhS8ioY1eeFQ+5B5oHXWRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mq2xmNaUh2by6AqrAmPxCFK3z7fzGjmGK56NnFUbbQo=;
	b=RjZWlqWxvZFbWa6/6YzLr0HDzoqmyQPfQriGv51bMPZOcZl83VCG7UzrNVjKWMzHtvGv
	 i5XV7FEq6tKCiN/WUuFlyhLF3QruLmnO5UVZF207iyyohdPPR7voXLb8p1E+4MBVRr6+/
	 u5v2DThVDc5wxw93yqHeWJOXEoKhAiaMj0FT0CxJSk4k/sDbRXjPuPASQXrKGjgc4vTOC
	 vmpB62yWgFHHjv43iMYjmqfl1YCOkmgPpH+n897A828i5hAVaT/DXQqYfUI4aL9ZO0H8J
	 UT4+lAuoyfGQTbpTBUMNZsoWS6OWdK2Naj1ULtrkQNPfFcDDvfKCcbkwERgQDxfHm9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YQ6wMMsG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0B1606D819
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E0B1606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YQ6wMMsG
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so1215114a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805260; cv=none;
        d=google.com; s=arc-20260327;
        b=G3my9Yo2GhIKUQMvzJFDrCaug/kF7fJBpUAu7+Z6sv2w+I1iMyCKH3PWqEjorMwHu1
         rvaYN9QrfHU1CbTLylWf26gRv7ZzoBd4AZlfRxIzj1y3OtpGj9j2kjQ9zFzxVKqAaFkq
         UkfLjw1kPaA659xK95PlIQQo6RwzC2JUIzKzhThRxRMYDNvag5pxiZoGNgzaXXpmtrWy
         08dNIwRrwVrNnyJlyzz+PU98f7yZTRmtNIo0x8H5zRF70BQ5jgCm8onfD1+4+VM+U+P1
         xQvC8oipJRReTbR9LvvdFdf/yTiDfne3sRIC1nUYMg4Rl9wDAtW/IOMB1zGXCjzbXcAT
         SfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=mq2xmNaUh2by6AqrAmPxCFK3z7fzGjmGK56NnFUbbQo=;
        fh=zZPfU5DGyRHJ7fNA+Ok+AqQBkODbpxetvmufcyR9yx8=;
        b=opZY+v2QdQLUK+dPf4tYTRXpDUyxoqrd5FgcGR+yynUpKFxhLEo1b/fSoZjyT4WNcF
         mRpOB5o++1JGhoABnzxzrvjdxfdvohc2VRYgJ1t8mGhoSZkOvdvEzTk1zRhc2W/OyNO9
         pacPEvXbe3jEBSfgE4OPBHqS6JxoWQxoZ70w6l8KsMHjA16g+rRsOMrtkWLsQQC1wpFB
         z6S4Jbd0VVp3OYF/SahHPshjtE7aFY6JYy/fuoHF6EE7QwXhaSwkVqvieJyr/UWilW7K
         h2WnAU/MKks1V4BHiLv8vJtTaST+natLTmUwsbQSns/dAsWzgSEZkxqToSk0zrJ9N3V/
         f5UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805260; x=1794410060; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mq2xmNaUh2by6AqrAmPxCFK3z7fzGjmGK56NnFUbbQo=;
        b=YQ6wMMsGBsQPo+F1c/0iM9292MWRRRqOc2Ys4vqqsUkmFM8CQzcH+G/eG0+UUNaWMX
         CiURxuJq5Hi8mWJ/PKKiOi0zj2HaopnbY20+WoMYMquZBJjzeJteLOrJpoDB8U3t9skf
         hPT4/waxCbaubuo1soDK7gkDX9MK84WldFjzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805260; x=1794410060;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mq2xmNaUh2by6AqrAmPxCFK3z7fzGjmGK56NnFUbbQo=;
        b=WeQ7Wm9Qjrg6Bg+YmF68v8wMY4gweJJcqfMfFvLfaDvDPXlHUzCmkg2AsLXWXnU+0m
         RwctxgC/k1cjrnQp2v0wsAX2aqTASuk6YqCt7Kh/TuG8/RTy5xRjjQFJj3z9iCDApsJ0
         HJ+dWQpEXxPobTQ6MFqjbWLlxaX2jaHkXcjcQpzQo0dKmUILQM1zlh3pqMzR1bNqZHbF
         MSMNK3lSWu3igsPpwN6RtSv2kbAz4E1ft7EaYO75fS7A+GwM8jRSziW6VZN/XAlfgGgh
         7hu7qc9ovaXG7lROmS61rDpPCpU1Oea6M9DGsstNWgZdmRXP5o8i1Z8bR5icPWXQHgQZ
         UsRA==
X-Forwarded-Encrypted: i=1; AKwUvBxsWyRo51bxPFc3UxPsC8Zxv3alTz+BUDXX9wqSeVrrbouDwqi9qImy/Sbrjao/DfZo8xzHmD6zdnmJlzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bu33D1OQMD3cFhZfCE5NhdAVoL6MclyGiLmviuVxMRA9AYL4/
	lyTjR3PbwJqe9nSQSuAtjSo/UaloYmKMkCvV7fiqK8LC/nnN/fTadzp8uvPknwOuDjDPutOD1hK
	q2yWl/aQN2GzWPpdN7SmHxEd+QFlrHCG6XkI+1nNN
X-Gm-Gg: AYBFou39Xiw1LeRelYDrxsyrR161UpxjrEt3jzo6b/eP9sTv6c/DoU/ZLfA1/hHKjKt
	8GSfuTP4sq1UqXePIm33eWkpd2x83Z0bfcMGH3a/cxEkcLe2quh+INRjCKEiw1qBUcZTM9RKoPj
	Ijy3rmI2x56I+FpURII2OQ2uF1W3IZGqOWboh5ErlOVy6OocOBxmGyhfppGue5WU9P4t8uzCiLl
	zY6iv4oSZC6DxHx3+utBGhpdmFDZLjb6qN3l4OAEDEwXSSdXJDLcIgnqwrNUBwMiBkZWxREJnfO
	sNMbcgiUzqSHbm/zqRkX+ivHbiKmmOS3ShxjzSSN+NPWk3Ik4iXcS2Zs/URXXdRGTnAwP62ctTe
	82P1iftSp3Xzwu3C2FoTPGSR45jtTgSoBL0v6xGGHDg6YNvEH9wrA0wkoeyGCyua0tqTOIh4=
X-Received: by 2002:a05:6402:5295:b0:6b5:5fc8:9cac with SMTP id
 4fb4d7f45d1cf-6b55fc89e42mr1846232a12.40.1793805260561; Wed, 04 Nov 2026
 07:14:20 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:17 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:01:33 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-12-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-12-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:17 -0800
X-Gm-Features: AclHuK8qa3D63ZO_9r8BX5LxaLgLW4FwLJ9apCehDmSsDt5GX7DSX6uYUevIrMw
Message-ID: <CAFLszThLk8zag3CK6FD2-vbGD1qiWoAXu9AturXgWbJS9vQ=7w@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] libfdt: overlay: Update base /__local_fixups__
 on apply
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Douglas,

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
> tree matches what `dtc -L` produces).
>
> `fdt_overlay_apply()` updates the base tree's `/__symbols__` via
> `overlay_symbol_update()`, but leaves the base tree's
> `/__local_fixups__` untouched. As a result, applying an overlay to a
> base tree with `/__local_fixups__` leaves `/__local_fixups__` missing
> the phandle references introduced by the overlay (both from the
> overlay's `/__local_fixups__` and from its resolved `/__fixups__`), and
> leaves stale offsets if the overlay overwrites a base property that
> previously had phandle references.
>
> Add `overlay_local_fixups_update()`, controlled by a 3-state
> [...]
>
>  Makefile                 |   6 +-
>  libfdt/fdt_overlay.c     | 527 ++++++++++++++++++++++++++++++++++++++++++++++-
>  libfdt/libfdt.h          |   7 +
>  libfdt/libfdt_internal.h |  21 ++
>  meson.build              |   5 +
>  meson_options.txt        |   2 +
>  tests/overlay.c          |  80 +++++++
>  tests/run_tests.sh       |  19 ++
>  8 files changed, 663 insertions(+), 4 deletions(-)

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -1135,6 +1134,524 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> +			next_lf = fdt_add_subnode_namelen(fdt, node, name,
> +							  namelen);
> +			if (next_lf < 0)
> +				return next_lf;
> +			if (next_lf <= ancestor) {
> +				int delta = fdt_size_dt_struct(fdt) -
> +					    old_struct_size;
> +				char *new_name;
> +
> +				target += delta;
> +				ancestor += delta;
> +				name = fdt_get_name(fdt, ancestor, NULL);
> +				new_name = (char *)(uintptr_t)fdt_get_name(
> +					fdt, next_lf, NULL);
> +				memcpy(new_name, name, namelen + 1);
> +			}

Almost, but the pointer passed in still goes stale (my suggestion of
re-reading the name missed this). When /__local_fixups__ comes before
the target in the blob, 'name' points into data which the splice in
fdt_add_subnode_namelen() moves, so its memcpy() reads from the wrong
place and can overlap the destination. The final tree is correct
because this code rewrites the name afterwards, but the overlap is
undefined behaviour. With ASan and -fno-builtin-memcpy, I get
memcpy-param-overlap at fdt_rw.c:405 for a base with /__local_fixups__
immediately before the target node, where the name is longer than 4
characters.

Please can you avoid passing a pointer into the blob? A small internal
helper which does the splice and then copies the name from its new
location would also drop the cast, although it needs care not to add
size to IGNORE builds. Using memmove() in fdt_add_subnode_namelen() is
the smallest fix, but it still copies a stale name. What do you think?

Also, gcov shows that the tests never reach this creation code, in
either direction. As far as I can tell, each target is either the root
or already has a node under /__local_fixups__. Please can you add a
case where the target has no such node, with /__local_fixups__ both
before and after it in the blob? tests/overlay.c already creates it
first in the root, so that ordering should be easy to cover there.

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> @@ -1141,6 +1141,25 @@ fdtoverlay_tests() {
> +    # verify that /__local_fixups__ in a -L base blob is updated when applying an overlay
> +    run_dtc_test -@ -L -I dts -O dtb -o overlay_base_phandle_lf.test.dtb "$SRCDIR/overlay_base_phandle.dts"
> +    run_wrap_test $FDTOVERLAY -i overlay_base_phandle_lf.test.dtb -o overlay_base_phandle_lfO.test.dtb overlay_overlay_phandle.test.dtb
> +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b a

These assume UPDATE, so 'meson test' fails for me with
-Doverlay-local-fixups=0 (7 failures in the fdtoverlay suite).
tests/overlay.c handles each mode with #if, so please can you do the
same here, e.g. by passing the setting to run_tests.sh and skipping or
adjusting these checks?

Regards,
Simon
