Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019425;
	b=DiRXOkR/x+YTNuvSmiAJXAr1o2FTdidiYkHPDD3z3U1amZyKTYIQBwrVFCC1pROPeNGD
	 CFMy2bX5j8PCo2M5DbvvL8MBp4zmgzsx4Br2uIJcSTEgR+T2XTsX0xknzql89b8u8tPU1
	 PemNRxuxxKxL0KhbDlrQjcAR0NYr3fIxGnEZB3wJMD48co2BGsdXaS4F53eWwQElfOxLY
	 NIaC/rD3doizrXQv6JQ7W9bY0aVLQM3wl+rwPsoQLqAesQGoQpzvNY3r+ig9wkPj0reIF
	 t83uuwUU6Cx6ik3v+VVCoX1syw5tJwUmt6gJqhpr6N02maT5dBcu1rqfcaBD8xbEQyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tMihTp7k9HfQ/8WT1EdahC/mJogWkkiaf1y46HrJoVo=;
	b=q6w32Nirl1IyE9+MVIiWuvuIruVJdVrqLpWtbhfEi9bnXY3VXolAQRCflEAO4m6P5vxX
	 Kac2aGFiTvUhNFku9//wcRKoS8AEYNMWROanwyrmQO5m0cxCOxxR+415KZSGRkQIFC7il
	 FMw5KoSTFVmaGre6xCCWqR5TXY+qdpwyPMddD7GV+wgLx1YB8oinejqfLqVYkFgdbyWyR
	 ptit9SRgi82aYAKx5X/NkGcLF2bKcIy9LBAF5AYSuCxzMaGYw4LZRzZgKh7M8FzVKNhv6
	 V+tNAcYzrou8GFgCQB5qGc1D4VmAtGEPzpHgzUsG8wLpT2FaOtoX1YKqpl0UZm9w1uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EjAT24e3;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389BC606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 389BC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EjAT24e3
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4697404c2bso158455866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794019423; x=1794624223; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMihTp7k9HfQ/8WT1EdahC/mJogWkkiaf1y46HrJoVo=;
        b=EjAT24e337qw6JucWjDsBdq2iOv2geDwtPqYSLEy6CZS/70DDfF1ci3aFQtBZ06XMN
         3M6QbbRUtihMUzbbgT9AM4qCUAb94qq1rL0L5kG7rjgScXswQptYA/kanHDijUA7iB3L
         HbjV9FIutPbUol9nbvcmKZjlm9nme85v7sIGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019423; x=1794624223;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tMihTp7k9HfQ/8WT1EdahC/mJogWkkiaf1y46HrJoVo=;
        b=ZLbUStZBPic7di+6/LzU2SsoOaHt4roYOJVIkTzv0/Rmsxz7oYKKUI6IUam0Xyhqek
         6JVVTmCc6IPG6lZRtMLj36SM8QYhcyzhOjDy7H8USRJ2zKUvTLVeHERlRrIQ6jAuPTAu
         UUg3MaYT50IlUE3S4fhjhwpDBC0R9NmqVjJDECUFg+sS6KYVelaM8npFidtvnjUILlQj
         vUvzGkswmH44yPfOnc8FEkEeaNBLhNqlyKbF2ohrWCuTvC68OlAyQKiljCmiGOG4KM5M
         xVHUCr+susyPXoJ2Fho4dZ5j2jh6nCq36Qx9wLlZaB6RUsJFz5eRgxJsgDEcnhoQpOa6
         UQog==
X-Forwarded-Encrypted: i=1; AL+hErH1vH4Zl/0W/v2DhhtjqdaYC1cgFT0fN1YPK0SDKsdUMJWK86zdtXl3jxe79+J5Vg9wTytrjgtmDW2x7XA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sIbiR8xtp+3x43TZTPFAq82KuMRzKAFoK/wn8DHRGq1ijEuue
	oqf/yeeLy1Id2opXqlTLT+oUAWCGTlVRe7y++vl4Xl941KiX1iSm06xDbWyNkM9sbe53cDlAlha
	DRDqrGrN4
X-Gm-Gg: AYBFou0ZTfXnuken52077mJ0krYyogzw3E+IngaylGoQupfd6FpIImXRVLvr8qy0C/H
	OLgE8R5RdW5v51XksVBTUEBf5B/6C/fYNBWIS2mF32QEh7j+CcM1XR48iWtA2mSuHT5DQ0R3A0Z
	aDwfMGTcwDaBvdhP2xmHLPiP+aT8T/t+z821NZ08Qzu+Z8a0mTywEWT9HJPuAgm7nLGS3CXl2mt
	1e0OHVfXOh86IpHOhDh9NF6+NXp+lXvYokARlrL6Bj0KWDUuUq8Jr0P/ACAq7RUAbokN4E++Q1y
	xxu14/FVgnRrCgNLe8QSIHGkc2az5JZ6nXW15VTX2qxYWsssGqsCoJn/n1khTSy0cg6A9GaHUQ+
	dz0Pbo5dzzmz9QC2hJxAJEUfikAvhaRmKUZUaBeaiM7Ha0puZL5ULVk1dJn7K4GfZNGcVLBbVDx
	jCrpLMmQrMp78yuP07VqEzosddau3JB91seYpVXo0l7itiOoc0puVpUes1ard6ZEXKmmSRhykVz
	ZK7p6VMhmKHCpJy268KFtWLQ5PhOgwCb93aOSNVFcKn3TaYfho0i/T6XWQstHg+ieWJsJNTH2H2
	M2kmdwaphD8yE7nCpHdHvLS70TIdFkMVe7hwEZ5mEFZ38lvi51dB+42IJqhtP4MDSMA=
X-Received: by 2002:a17:907:d03:b0:c46:7fa4:9224 with SMTP id a640c23a62f3a-c4d34a649eamr300811266b.8.1794019423505;
        Fri, 06 Nov 2026 18:43:43 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356c60b0sm118048466b.69.2026.11.06.18.43.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 18:43:41 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso13576535e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:43:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByGH3nScBPOQPuoLnjQN+6po5761AwaEYOFMx5o3yQAaGFA3PPlK4KlvOZWTpYf4c/GcaYxqN+3I5RqDTk=@vger.kernel.org
X-Received: by 2002:a05:600c:1989:b0:4a2:397:73fd with SMTP id
 5b1f17b1804b1-4b6ddcf58d4mr71646075e9.12.1794019420156; Fri, 06 Nov 2026
 18:43:40 -0800 (PST)
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
 <20261101220224.1436242-12-dianders@chromium.org> <CAFLszThLk8zag3CK6FD2-vbGD1qiWoAXu9AturXgWbJS9vQ=7w@mail.gmail.com>
In-Reply-To: <CAFLszThLk8zag3CK6FD2-vbGD1qiWoAXu9AturXgWbJS9vQ=7w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 18:43:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UtOj+xxbdj=kCTmBLcUzLFiKnF3SR785-4VR7LHsjtPg@mail.gmail.com>
X-Gm-Features: AclHuK_xBMh5T2Ee19xsoScbltCMtlYr7_uxL9cseOpA5WDwtXTsMMp1O_G3SpE
Message-ID: <CAD=FV=UtOj+xxbdj=kCTmBLcUzLFiKnF3SR785-4VR7LHsjtPg@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] libfdt: overlay: Update base /__local_fixups__
 on apply
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Wed, Nov 4, 2026 at 6:08 AM Simon Glass <sjg@chromium.org> wrote:
>
> > +               name = fdt_get_name(fdt, ancestor, &namelen);
> > +               if (!name)
> > +                       return namelen;
> > +
> > +               next_lf = fdt_subnode_offset_namelen(fdt, node, name, namelen);
> > +               if (next_lf == -FDT_ERR_NOTFOUND && create) {
> > +                       int old_struct_size = fdt_size_dt_struct(fdt);
> > +
> > +                       next_lf = fdt_add_subnode_namelen(fdt, node, name,
> > +                                                         namelen);
> > +                       if (next_lf < 0)
> > +                               return next_lf;
> > +                       if (next_lf <= ancestor) {
> > +                               int delta = fdt_size_dt_struct(fdt) -
> > +                                           old_struct_size;
> > +                               char *new_name;
> > +
> > +                               target += delta;
> > +                               ancestor += delta;
> > +                               name = fdt_get_name(fdt, ancestor, NULL);
> > +                               new_name = (char *)(uintptr_t)fdt_get_name(
> > +                                       fdt, next_lf, NULL);
> > +                               memcpy(new_name, name, namelen + 1);
> > +                       }
>
> Almost, but the pointer passed in still goes stale (my suggestion of
> re-reading the name missed this). When /__local_fixups__ comes before
> the target in the blob, 'name' points into data which the splice in
> fdt_add_subnode_namelen() moves, so its memcpy() reads from the wrong
> place and can overlap the destination. The final tree is correct
> because this code rewrites the name afterwards, but the overlap is
> undefined behaviour. With ASan and -fno-builtin-memcpy, I get
> memcpy-param-overlap at fdt_rw.c:405 for a base with /__local_fixups__
> immediately before the target node, where the name is longer than 4
> characters.
>
> Please can you avoid passing a pointer into the blob? A small internal
> helper which does the splice and then copies the name from its new
> location would also drop the cast, although it needs care not to add
> size to IGNORE builds. Using memmove() in fdt_add_subnode_namelen() is
> the smallest fix, but it still copies a stale name. What do you think?

Got it. Splitting out an internal helper `fdt_add_empty_subnode_()`
in `libfdt/fdt_rw.c` (and having `fdt_add_subnode_namelen()` call it)
works really nicely here. Since `fdt_add_subnode_namelen()` shares the
same implementation via `fdt_add_empty_subnode_()`, there is no code
duplication in `fdt_rw.c`, and it also avoids repeating
`fdt_subnode_offset_namelen()` and drops the cast:

In `libfdt/fdt_rw.c`:

+int fdt_add_empty_subnode_(void *fdt, int parentoffset, int namelen,
+                          char **namep)
+{
+       struct fdt_node_header *nh;
+       int offset, nextoffset;
+       int nodelen;
+       int err;
+       uint32_t tag;
+       fdt32_t *endtag;
+
+       /* Try to place the new node after the parent's properties */
+       tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
+       /* the fdt_subnode_offset_namelen() should ensure this never hits */
+       if (!can_assume(LIBFDT_FLAWLESS) && (tag != FDT_BEGIN_NODE))
+               return -FDT_ERR_INTERNAL;
+       do {
+               offset = nextoffset;
+               tag = fdt_next_tag(fdt, offset, &nextoffset);
+       } while ((tag == FDT_PROP) || (tag == FDT_NOP));
+
+       nh = fdt_offset_ptr_w_(fdt, offset);
+       nodelen = sizeof(*nh) + FDT_TAGALIGN(namelen+1) + FDT_TAGSIZE;
+
+       err = fdt_splice_struct_(fdt, nh, 0, nodelen);
+       if (err)
+               return err;
+
+       nh->tag = cpu_to_fdt32(FDT_BEGIN_NODE);
+       memset(nh->name, 0, FDT_TAGALIGN(namelen+1));
+       endtag = (fdt32_t *)((char *)nh + nodelen - FDT_TAGSIZE);
+       *endtag = cpu_to_fdt32(FDT_END_NODE);
+       *namep = nh->name;
+
+       return offset;
+}

And in `overlay_fragment_local_fixups()` in `libfdt/fdt_overlay.c`:

                next_lf = fdt_subnode_offset_namelen(fdt, node, name, namelen);
                if (next_lf == -FDT_ERR_NOTFOUND && create) {
                        int old_struct_size = fdt_size_dt_struct(fdt);
                        char *new_name;

                        next_lf = fdt_add_empty_subnode_(fdt, node, namelen,
                                                         &new_name);
                        if (next_lf < 0)
                                return next_lf;
                        if (next_lf <= ancestor) {
                                int delta = fdt_size_dt_struct(fdt) -
                                            old_struct_size;

                                target += delta;
                                ancestor += delta;
                                name = fdt_get_name(fdt, ancestor, NULL);
                        }
                        memcpy(new_name, name, namelen);
                } else if (next_lf < 0) {
                        return next_lf;
                }

> Also, gcov shows that the tests never reach this creation code, in
> either direction. As far as I can tell, each target is either the root
> or already has a node under /__local_fixups__. Please can you add a
> case where the target has no such node, with /__local_fixups__ both
> before and after it in the blob? tests/overlay.c already creates it
> first in the root, so that ordering should be easy to cover there.

Done in my draft v4. Both `tests/overlay.c` and `tests/run_tests.sh` had
pre-created `/__local_fixups__/test-node` before applying the overlay,
so `overlay_fragment_local_fixups()` always found `test-node` already
present. I've added `fdt_overlay_local_fixups_create()` in
`tests/overlay.c` to test an empty `/__local_fixups__` (with no
`test-node` child) both before `/test-node` (`lf < tn`) and after
`/test-node` (`lf > tn`) in the blob.


> > +    # verify that /__local_fixups__ in a -L base blob is updated when applying an overlay
> > +    run_dtc_test -@ -L -I dts -O dtb -o overlay_base_phandle_lf.test.dtb "$SRCDIR/overlay_base_phandle.dts"
> > +    run_wrap_test $FDTOVERLAY -i overlay_base_phandle_lf.test.dtb -o overlay_base_phandle_lfO.test.dtb overlay_overlay_phandle.test.dtb
> > +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b a
> > +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b d
> > +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/c b
> > +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d a
> > +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d b
> > +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d c
>
> These assume UPDATE, so 'meson test' fails for me with
> -Doverlay-local-fixups=0 (7 failures in the fdtoverlay suite).
> tests/overlay.c handles each mode with #if, so please can you do the
> same here, e.g. by passing the setting to run_tests.sh and skipping or
> adjusting these checks?

Done in my draft v4: `tests/meson.build` and `tests/Makefile.tests` now
pass `OVERLAY_LOCAL_FIXUPS` to `tests/run_tests.sh`, and both
`fdtoverlay_tests` and `fdtfactor_tests` adjust their `/__local_fixups__`
checks so `meson test` passes under `-Doverlay-local-fixups=0`, `1`,
and `2`.


-Doug
