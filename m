Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364635;
	b=hj+R2B1hTc6gpaeQw0uZPT7u6neMblh1dXquGflPlaGMzstFwhFedCjkHwzCeAqi7tpM
	 1aKGict3GFuR34GAYpMgpACfWREwFBOnbH2RaNQZSeds/jscoB9T2bKG7qTv6uHN9xkgT
	 MIAEupSnM3+65aKqcU2JLgk7z57HWFPjh3L20Qm658Kmu2PThELmUXaow7mjqu7x1NvX/
	 AsALUPIHUBs7yqwJjUpi4AHIgh7Y5YT0WWhu2kpr+6iuV8pKNDCoh6WR3Tdw6nf4obkCD
	 EBpkbvGKzy4/bwiAWJyU4x3rMDzarJGHl59xwoKbjS2TiK/Dqxe4KDiV4D/nJnd/dvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Vmtd7JJoFGhykDhF0G/LsCU5RDkiJvwQnc8PEHADvFQ=;
	b=pf90HEHuxjfA7fcvFb5kDR/222T3dFw4UmIJCt7o53r05nP7wQvG6eHn2U85d/sWK8XW
	 PVaOe/mU/2NyRv+3cK87Vwh8DvKTZHLefBNvVNF1kVUm9JI4h5v4GtCAXqPn8FNm6NbRv
	 Az1enkFyHxWkOY0PL0WsiMZVlV/CPpoSZ8CX7wKVvrVENNuG3j7pFKDgKPkXqcEIjNPx5
	 dr4krwSMJPoafvean51XqhXijT3ndqf6+/rizU/WRRNccM2aQ0h4xw2V4UnEt0qT+rkCy
	 hVMtRe+a/ixeNsrDc5/LaxRStnnWO34qgOkstlgjfdjYOFn81oJOyTPAfX4QHpWHbuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SXJZT+d+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03AE60A2620
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03AE60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SXJZT+d+
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so964019a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364633; cv=none;
        d=google.com; s=arc-20260327;
        b=dvXlO85fCHNZ7zGyGZRRUAlGrNR2ebX0aruP0RLmozf8w9FZNQFT5K0K/Zlu728L55
         /ZYed52Y9PLt0Yt6eYJ509AaHz7aPU6gBG2ZYGPqd9XWEG37LGMxjbLzcICidG2FRwbR
         RDVsKoW8hZe0ZMhvSlJMhprhzj6z11knuTA5bcBfs5UnEMQQXDGsgaeFTLn+B1QaOFMn
         fGTQ8FM9zzy8YfVry20GIVzgI5NsywwvEJxq9SetrNb/CtXVSEfnSwtxAeOSH7G4n3Y5
         X/0XK10LQ8SwTCg999b9XAmVEP0D02HirprvOH6kwRYJUGxTo80OzbCetiToxznOb1V5
         97Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=Vmtd7JJoFGhykDhF0G/LsCU5RDkiJvwQnc8PEHADvFQ=;
        fh=lqd7cjYhHzlVrllNujexKkcLYHqU1Uj5GPzEI1r/vu4=;
        b=ryvuKtNOVf6hPQeuOKeGLA68b+stEfL5JQmLo61AVZZjY0jQsTuJj3uOI6O4c+g2Sz
         6QwwsNfYGUju44PmAPT+p37QsluOX4+zNekbMbr7+ROvcSe7lWzufoFsB0lpptKCki3L
         FVneThM9OJx0KhbGpHyY9lk6h1QQre0mH+C/lQNlT4IY+gNYsRRZRoi1SBGPcXc395RW
         L7eSFpvuV/HssIXF6j0uC2N1HfnnLcTOQxma6zg7a6ulxJbJ6Ytcw1/HzQooNmy8tyOh
         KcTnYuNBr69P6nwMJ7Kv4gHsVm6qDwB+ZJf0dQMEFeE2Q3bh5Qj1rQ0tU6vTLCrhpmE8
         EVsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364633; x=1793969433; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vmtd7JJoFGhykDhF0G/LsCU5RDkiJvwQnc8PEHADvFQ=;
        b=SXJZT+d+uaZZlF2rPrHT207P6kfJJZJDSd9/kfAJXowTchpwxDZ0iBAXspx9nhSLaN
         apKyQNznXrHhOYlHZ7DXhJ9tZ0plN9oQvAm+L7t9xu7p4NjfWcf7Zk+KXrakZhLyh0ar
         MAWkgS75WsxOLYHjTALeuDP8TEDTDnUiBGQyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364633; x=1793969433;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vmtd7JJoFGhykDhF0G/LsCU5RDkiJvwQnc8PEHADvFQ=;
        b=jsFg9yzkfnv0f4K05OGUcJmtUj++827nKgWY2AdCk5QyKhIALdi1fz49xSY59eRxrY
         idXCk4uZ4ocuZELHQ4XfXz7pnn7CvUoUDpqA8R07wZ0UFzX2H16GkrwyG6MYisSgQNrL
         8HQUl5qK0pcSYu/eZaJTlpi0NFRmc9B2RpInoVMVMgWZwO+5yfOe9GYrno9eLqGFSMdv
         4rPJF71XFdOnJnb4p5Siqydi8MM3E9vLdF30P7R+/J37TiKqJGgBrGkWbvbZPpG3eEBp
         RLjlHIdbM+opI2M/O9htCritN1QNFe6XEySZMbXChTwuZnV1Eo3ejnvzMFIL2VgxB0Tq
         bSEQ==
X-Forwarded-Encrypted: i=1; AKwUvByFoCzfHm5rGgwpQs56voVjwe9XpG5oftnoM6RAS0SUpN5ujMcHvzx6GZTN+jdawmoelq0QAy626DQ3g8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoribjr2Kqd1jaxMbQShRMIZbuTsWRWcSR//oHirYUhhUjpnmD
	x4YHNAusiHdywF8UrC83OZdcVVUEGwev52fmGKwootrOS83m8gQhVTj+ZiKhGNamVKdwFYRzGi6
	hl4cWI/wfsfNQOdXbBkIjA+rCOZtylCD0KasHWLh8
X-Gm-Gg: AYBFou0Ji8tsYaJVks1zgADcruTf3NaZ5AwKXq79LBs47dSy7tlp0q2VdOHCyPpR5wi
	nEYi0zInCk8nTeMwsYMzDquD8fCbZicvw7nofdDRRVXdm/q7AXXC/ECO2H5LUxhLH2Ek2680xeG
	STlML/chxvvEtnluYDUI63LNsQV/bdkQhj6JQ6TyE3i/V1ciWBgLRsG+2gMRdDvMXucAGQznWjL
	aB3AxJeIZLLthlrycAQnVai5Zn0A5/FV1ROf/2/61oz0405CtnXPojT9W+4+XdlITX153JkJNdC
	dwHwyopxyq2m5kWLM4+hpRlFQpYL3as9rptDXVku1rnZI1YRHvFqKWx1eu7iEmDGhk8DL76k1h0
	cjXE8jlrETyw62F8FXlbcgepv+tKbYz0ZTFHUuPoX8BMmCv4yt005/kQjzb7zGWL5JaDz1pQ=
X-Received: by 2002:a05:6402:c2d6:b0:6b1:ef5a:6720 with SMTP id
 4fb4d7f45d1cf-6b4d497c52dmr1137228a12.16.1793364633266; Fri, 30 Oct 2026
 05:50:33 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:31 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:41 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-9-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-9-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:31 -0700
X-Gm-Features: AclHuK_Ix-y3tb_fdHHUHOXuGJaiv5uFLJy8cMpdGuMAdrZfprBlED_NL9u2V2s
Message-ID: <CAFLszThZs9Qx6c_qff4LUXPNpncUAO7LGygkyv6FRtGcxU88xg@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] fdtfactor: Add -S/--strip-local-fixups option
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add -S/--strip-local-fixups option
>
> By default, `fdtfactor` preserves `/__local_fixups__` on `base.dtb` so
> that when `fdt_overlay_apply()` merges a `.dtbo` overlay, the
> reconstructed device tree retains full `/__local_fixups__` information
> (for instance, if an OS kernel wants to know which property cells
> contain phandles at runtime).
>
> When `-L` was passed to `dtc` solely to help `fdtfactor` locate phandle
> cells at build time and `/__local_fixups__` is not needed at runtime,
> retaining `/__local_fixups__` in `base.dtb` wastes space.
>
> Add `-S` / `--strip-local-fixups` to omit `/__local_fixups__` from
> `base.dtb` (and therefore from the merged device trees produced by
> `fdt_overlay_apply()`). On a set of 47 Qualcomm SC7180 Trogdor
> Chromebook board DTBs, `fdtfactor -S` reduces total uncompressed size
> from 7.69 MB to 634 KB (91.8% savings).

This compares against the unfactored DTBs, so it doesn't show what -S
itself saves. Please can you also give the size without -S, so it is
clear what the /__local_fixups__ in base.dtb costs?

>
> Add a test case in `tests/run_tests.sh` verifying that `fdtfactor -S`
> followed by `fdtoverlay` reproduces DTBs compiled with `-@` (without
> [...]
>
>  README.md          |  9 +++++++++
>  fdtfactor          | 34 ++++++++++++++++++++++++++--------
>  tests/run_tests.sh | 22 ++++++++++++++++++++++
>  3 files changed, 57 insertions(+), 8 deletions(-)

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> @@ -1234,6 +1234,28 @@ fdtfactor_tests () {
> +    # Strip local fixups (-S): verify that merged DTBs match DTBs compiled
> +    # with -@ (without -L), and that inputs lacking /__local_fixups__ are
> +    # rejected.
> +    for i in 1 2 3; do
> +	run_dtc_test -b 2 -@ -I dts -O dtb -o fdtfactor_board${i}.nolf.test.dtb \
> +	    "$SRCDIR/fdtfactor_board${i}.dts"
> +    done
> +    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_strip.test.dir \
> +	fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb

This rejection test has no -S, so it checks the -L requirement from
the previous patch rather than anything added here. Since -S could
easily be read as 'my inputs don't need -L', I think it is more useful
to pass -S here, to show that it does not relax that requirement. The
plain no-S case could then go into the previous patch with the other
rejection tests.

Regards,
Simon
