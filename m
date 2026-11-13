Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547451;
	b=ol8J3JwYeOCpPv5DQdyVRqKphcF83Sopokfs+7bsMjW/oxr4AQ1PtxYdTex6nO38ZfFS
	 +ejnKGDjJU+4DXJQiyqsmtS8gTjVd70fXfiUWJ+2V6ATBwDKko/UHN9sG8WJb5T7SntFU
	 /9BNt/C6AmLL8tl82LbfKeGorBR3sRrEWeZvVABbc0suYxicq5KYcK9nilVY7dAch+o0Y
	 cGZF41SpPHfJG3RQ0GFEGRh+YpkOGCf4kTCXrWxyILY21obzxglBX2mtlLF7xhkwHVqcU
	 EAs1XgymzA0cS/yIWaVqW2qFsUROt/4cz1IKrTGqeaOBGh/VFWWqKrNAXUDlpBT+oBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JmKJsnJY8MqWcs4Bpm4VF6uZO2VAnwIaLQAzmFCdCwU=;
	b=R5gTXdFr7iEg1P95OUjcWZu1toWy6TvSmMBzpELepi79hc10yTrVLuESXMX2dRriAebg
	 DzvBr7YPfShFjs4BwSFDtLOmFta8tJECb0uQhJUbpVjG29WAGdVd3lOKSiNVlDsOIQDiu
	 1+9NIhLT1wS5tUxqdHnpVgiuGEbQXL/ub8f8jAV2FeV7wlgKQbp9mXdF7MsyEtafh6R+4
	 iFccolalALUHh5bKtEd7Ci5duVW4nGoim/ly9DUMzDeY1fnBblGX2LQElmU36zR1q7Hi7
	 aM//tievgMOA9a6HgifQiemKkmWoguIBRwIntIMQ0jOi6QteNxVUxxQrN1kOTShTf0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hJXZ6HW0;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044BF606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 044BF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hJXZ6HW0
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso104499266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794547449; x=1795152249; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmKJsnJY8MqWcs4Bpm4VF6uZO2VAnwIaLQAzmFCdCwU=;
        b=hJXZ6HW0Qm5kNZqRnnvGDZyf3eJmGj6QEU81Pibs6VimbDHzmLy/IVKnOO8Vkc2O4l
         5KbbkAyhAHM/kVajjB9aUC2mIOkdzmbcPUHkHnKLqlvWGtrQ7I4PAiTiv7TYv4lC/voV
         jDdggvL+J3ZHk5wSEXtJA3d/q4Hr2YfB4wPXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547449; x=1795152249;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JmKJsnJY8MqWcs4Bpm4VF6uZO2VAnwIaLQAzmFCdCwU=;
        b=06JTylDzg16b1SHdFKvN7tFw5SR/+Eiio1codMZCc8aKIkab21I6zMw68BmAWsFqNu
         qvQGmgZUML5uyI19zNMo0kSKeh02jAjREOEJfC7jQRVxW1eDKt87TnVP5hbYGhLpaXCd
         6frQZoA89UmASPi1UD1nIHtMG8joX8RkZQx9GoMq0iwCnLITQenVK02s/YcA23e2MfY/
         om60WtdQwjL6mIao0GF1GLNtv2UwDfN7HjgY/VulrGljxUUzpCNuLNqtpO/VfIvkz8Z5
         xcqB4yr5kJ070JqMuvitK1/CfPOUimotDQUBI7npgbKrw1I/D68/ITclXJIoaZEe973e
         daQA==
X-Forwarded-Encrypted: i=1; AL+hErHaSpf7PDqkhtM35+fwpJZoUH35vvOdkzBeFd9Pek4niQ06AsqkNTkb3TBCVrjbPT8zvvpi3MoF3Os1/h8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o3Xq7oyjGKkKcJazcQt+0qf9/kGDT9m4ZgCxqdYiCS50Yvhj3
	9DUdQWEB0g73Q98psbsZGXTTOAtB/IenYGxcYZOLewXYoAWHL1zhjYXUYuPbXR7dsDus5Q4mBz1
	9YW2E1kPn
X-Gm-Gg: AYBFou1WUzD/HnpAgXEXPpr9fqhG3eRiEY3jdFsMbi9wFkZbrD/u6vvisDEALgM2vIm
	Bw8IUvTAUtz7d5M5ruhpfYtBViSty8KbU9o78nhKeWrohiutBWlmbF3C4NjojIBggLioFDV3qyT
	NOKszPKjClyo+U4ZFzHBgMhFQShhtR6yPvHMgMaXG3ZBD1NQbYBt8L3t9ImzQG698RZoTJWV/JX
	RCQwU8OT0eT6TQOt8FFw2+B/ZZn3lDHsxmOdos76UpKVtd+mK2FVadJ9gTfJldJP8z63qYo2qII
	jz3TlWLLnSNVT/lZElJVcCZbKns+m1wfu56ey0hG71o/LJzaRgth9KX1OInupobth5E4Y186OGB
	/D4e1mdtV9kS9HK7vQ/m5yW4CS22gsv7TC/eTdzO8pZe8BAbCzZtVnKpEl9JB+w3DYwh6NqH/Pe
	GidmRQyM3I0hskQYR8W9eXVCwT7HUmF+C7oD101Ro0A/Kj8qlrfGEHmwo6VaJp0ZNW/zg0M7q5J
	Fv3AUXLeUs2ldIP2Rj4c+qYiIFlON9FDgFeuVxkHp2qX1knFuTZkNnPy32IkXCCaWH2NzQPO2Gi
	JPDEJur4i7XC4JT7xU12GsADFHUhrL0wLJemHdiXxyNJ78/7DtTv7LlxIeJsq5XD/X4pmmm6EKC
	4YWspINeh1xd5Xg==
X-Received: by 2002:a17:907:9415:b0:c33:dbe8:291c with SMTP id a640c23a62f3a-c509634058fmr119729266b.20.1794547449432;
        Thu, 12 Nov 2026 21:24:09 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5a276sm50953466b.54.2026.11.12.21.24.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 21:24:08 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so3216825e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:24:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGqmOQP/Aq3fMkSNRLEXTSAG2q6MVAJFt7zQe/6H5i4IoMM6fnBXYGlzfSelkPu9tbujANzupoVEPW/C8Q=@vger.kernel.org
X-Received: by 2002:a05:600c:4e05:b0:4a1:6517:ccf1 with SMTP id
 5b1f17b1804b1-4bb55a44ff0mr28193205e9.9.1794547446523; Thu, 12 Nov 2026
 21:24:06 -0800 (PST)
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
 <20261101220224.1436242-16-dianders@chromium.org> <avUlA_KSHKmmSz5p@gractus.seuss>
In-Reply-To: <avUlA_KSHKmmSz5p@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 21:23:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WGTD8FtjPFE5mFSJP343Z9-2HNXHH3g4usqpWPVuwPUg@mail.gmail.com>
X-Gm-Features: AclHuK_4zB7NHPQo84upfuBk9JkbLknfTYjE74uvl8_8rHyRokZIvN2zJ3Vj3W8
Message-ID: <CAD=FV=WGTD8FtjPFE5mFSJP343Z9-2HNXHH3g4usqpWPVuwPUg@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] fdtfactor: Add compiled FIT factoring support
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

On Wed, Nov 11, 2026 at 6:31 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 02:01:22PM -0800, Douglas Anderson wrote:
> >  * `-o`, `--outdir`: Output directory for generated `.dtbo` files and
> >    `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo` files,
> >    current directory for `--output-base-dtb`).
>
> Even though one's a directory and one's a file, using different output
> options for the FIT/non-FIT cases seems kind of awkward to me.

Makes sense. In my draft v4 I've unified both into `-o` / `--output`
(output directory in standalone `.dtb` mode; output FIT file path in
`-F` / `--fit` mode, defaulting to updating `--fit` in place) and
dropped `--outfile`.


> > +* `-F`, `--fit`: Factor `/images/fdt-*` blobs inside a compiled FIT
> ...
> > +* `--outfile`: Output FIT path when `--fit` is used (default:
> > +  overwrite `--fit` in place).
>
> That's a lot of fiddly detail to fit in the description of a single
> option.  Maybe move it out into its own doc section.

Done in my draft v4 -- split the `README.md` options (and `--help`
groups) into common options, a `### Standalone DTB Factoring`
subsection, and a `### FIT Factoring` subsection.


> >          if _is_dtbo_overlay(fdt):
> > -            raise ValueError(
> > +            raise OverlayBlobError(
>
> This change seems unrelated to the rest.

In a FIT `/images` node, both full `.dtb`s and pre-existing `.dtbo`
overlays use `type = "flat_dt"`, so `_extract_fit_fdt_entries()` had
added `OverlayBlobError` to catch and skip `.dtbo` nodes while letting
other `ValueError`s propagate. Using an exception for that control flow
was clunky, though -- in my draft v4 I've dropped `OverlayBlobError` and
check `_is_dtbo_overlay()` directly in `_extract_fit_fdt_entries()`
before constructing `ParsedDtb`.


> > +        algo = sub_node.get_str('algo')
> > +        sub_node.props['value'] = libfdt.Property(
> > +            'value', _compute_fit_hash(algo, data_bytes)
>
> This assumes the FIT naming of hash algorithms is identical to the
> hashlib one, which seems a bit risky.

Agreed. In my draft v4 I've replaced `hashlib.new(algo_name)` with an
explicit `FIT_HASH_ALGOS` dispatch table mapping the standard FIT `algo`
names (`crc32`, `md5`, `sha1`, `sha256`, `sha384`, `sha512`) to their
`zlib` / `hashlib` implementations and raising `ValueError` on unknown
names.


> > +def group_fit_dtbs(fdt_entries):
> > +    """Partition FIT `flat_dt` entries into compatible factor groups.
> > +
> > +    DTBs are grouped by `(compression, arch, load, entry, boot_cpuid_phys,
>
> Why should compression play a role in the grouping?  The internal dtb
> data doesn't depend on that.
>
> I'm not sure what the 'load' and 'entry' fields do, so it's not
> obvious to me whether they make sense here either.

* `compression`: Agreed -- in my draft v4 I've removed `compression`
  from grouping (and from `--single-base-dtb`'s compatibility check),
  recompressing each overlay `/images/fdt-*` node according to its own
  `compression` property and `fdt-base-N` according to the group's first
  entry's `compression` property.
* `entry` and `load`: In the FIT spec, `entry` is the CPU entry-point
  address for executable images (`kernel`, `standalone`, `firmware`) and
  isn't meaningful on `flat_dt` nodes, so I've dropped `entry`
  completely. `load` is an optional physical RAM address telling the
  bootloader (e.g. U-Boot's `boot_get_fdt_fit()`) where to load the base
  FDT before applying overlays: two `flat_dt` nodes with different
  `load` addresses can't share a single `fdt-base-N` node (since
  `fdt-base-N` can only carry one `load` address), and `load` is
  stripped from the `.dtbo` overlay nodes so a bootloader doesn't copy
  an overlay directly on top of the base FDT at `load`. I've added a
  comment explaining `load`.


> > +    mem_rsv)` and node-path overlap (>= 50%) against the group's common node
>
> Overlap >= 50% seems a very arbitrary condition here.
>
> > +            common_nodes = grp['common_nodes']
> > +            union_len = len(entry_nodes | common_nodes)
> > +            overlap = (
> > +                len(entry_nodes & common_nodes) / union_len
> > +                if union_len
> > +                else 1.0
> > +            )
> > +            if overlap >= 0.5:
> > +                grp['common_nodes'] &= entry_nodes
> > +                grp['entries'].append(entry)
> > +                placed = True
> > +                break
>
> Reimplementing the common path analysis, rather than somehow utilizing
> the calculations you already implemented in the factoring itself seems
> unfortunate.

The usage model for `group_fit_dtbs()` is a multi-SoC kernel FIT (for
example, building `arch/arm64`'s `image.fit` across all enabled Qualcomm
or ARM64 boards, which bundles hundreds of DTBs spanning many distinct
SoC families).

Looking at your two points here, I initially tried dropping the overlap
percentage altogether by running `create_base_dtb_and_overlays()` on
each candidate group and merging whenever factoring reduced total size.
Testing that on a FIT containing all 438 upstream arm64 Qualcomm DTBs
was much too slow, though: rebuilding `base.dtb` and every member's
`.dtbo` on each candidate check (`O(N^2)` `.dtbo` builds) took nearly
90 minutes.

To address both of your points while only building `.dtbo`s once per
final group, in my draft v4 I've:
1. Replaced the unweighted node-path overlap check with byte-weighted
   overlap over `ParsedDtb`'s already phandle-normalized `(path, name,
   prop, fixups)` properties, reusing `select_best_candidate()`'s
   `_prop_byte_cost()` calculation directly and picking whichever
   compatible group has the highest overlap.
2. Added `--min-overlap PERCENT` (default `50`) so the overlap threshold
   is configurable rather than a hardcoded constant.

Testing `fdtfactor -S -F` on the 438-DTB Qualcomm `image.fit` finishes
in ~12 seconds, grouping 426 of the gzipped DTBs into 41 `fdt-base-*`
groups (leaving 12 single-board SoCs unfactored). Compared to a
standard `image.fit` built without `-@ -L`, that shrinks the embedded
DTBs by 61% (9.27 MB -> 3.59 MB gzipped; overall FIT 22.48 MB ->
16.81 MB including the 13.09 MB kernel).

-Doug
