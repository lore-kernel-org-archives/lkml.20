Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028671;
	b=yrfAKa2u64B2Wsm4R7AT7TW0f0ZDripPZCpaEJHHY4qmlpGpzsTupY5j3j2ShdQ45UjY
	 WtrDg3n3ynkNvZxcmKHsnmK6w0eIIrYKCIMZQJoqk5y4nedUB37y17w0aQaUPZ0NxW6xg
	 u8ED4zKjXejSkmPVqWq2D953/6JDpep+chadAsMhH22pzXMNz791XBm2An22N7OFxhh1P
	 QtMFjcgrJB0krlhmSYecC8MIqX+BFcFTBDdxWJe2HBJQO1EmSjazNrXTWQGrm8//n5sS9
	 E6aeQb+ypTQRYIOnrkIHD4Hd6FcBbVmq+LPxfz9KFVaAQh4ivzAkKbju4iEAZnhOJpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ByfudzbZBmPdop+tQLUNKnJBViZnQ8X/fNaZs09u0EI=;
	b=vaNL6bj9MxY6tfC4bN+/31c7X65dghjGFP7KrODrPvysH+oNThfi2HEBmoiWxCM4i2Jq
	 OJXU03MW/+vdAetPasLhsR0cBLJhUPm5aYFIOW5+0ItkOX7MUX+S7JuIXMab2zWQ6MJAb
	 MkO9LIVenX8w+iMahGQepZeI7Fu5fsZdbvxQJ0nbGQrcUdjiRnKc7euvQWti0fDu+rMg5
	 O2yNj0x1aWC95OZc6Eh6sJqs1KEyO7yK8N6bSNL53huuVXnzRoDGP6LtgKQGHt/hgbgkR
	 CvwzFfZGCNzij27X5jbbK+httandChEbIM8zBqGjvfk/AIFggsf1XH/lRDM0tGf5KtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eeUdTxWj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ECF606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37ECF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eeUdTxWj
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so4930218a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028669; cv=none;
        d=google.com; s=arc-20260327;
        b=BE8YAlK22jK6UnZoHcqm+S9/ARESxPn34HJqZghrcD8iwZ0Xjm1giAd8QWGCUI8POQ
         5PfAUQ8nzV/XqFcq4ix851qi8XzdgMsKr+pBA84Ooit+pA1ANIgu+A50aReU9BLM4ELc
         lYSLCi+Y7HjmtQuThzuLBqwyelTFlE15Qo/PMTy+nHU4n255LGoaIqf07xQechDsxmSR
         Ogq8vMwR9h98RzFEHvvFIns5N3uur4c9rGrJND8skY4cw4Aa8nB6c9ekwmokPopmCEuR
         mgEoA6DJGMPhaN7UDFeBBtxW4AZm/o3n4wyRwwJ1eVxyqC7WncxKsHjDkVLkF5JMcMN4
         4ECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=ByfudzbZBmPdop+tQLUNKnJBViZnQ8X/fNaZs09u0EI=;
        fh=5/rKmrdZYTgmYluWTZIk3WgB1xTPyO8ucz26ME9fRaU=;
        b=XnisfAACoB6X+9Anq1PTq41mszU6kHylfGj4MBlwfktVSyPRYCJXnq3rolnGkxnOI3
         +Av+4jnhUR6+/6u9x5yfEmdeADX3r0eyaK9LvAmjh17EW68ePay4bYVmjp3rgYAh8kTJ
         rGKk5ZCd/BEHLL1dxuD77sJ+i3h0l60O76ndD90UJ1s8PgAM/NdCefJNNHH9yUjXKAhC
         F3TlQ/C/DpMDHXj8IXBrm1u7prU/m9ZsiM+1YhHe7oz9A5hqPshcXGNy61neomyash51
         a+/0BpZmVE8KFZrT+9Zxu0olc51NVc+4xSOHIlx0mbVVOsMOLnlqrOcvT6TIvXd1mJ/q
         7ccg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793028669; x=1793633469; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ByfudzbZBmPdop+tQLUNKnJBViZnQ8X/fNaZs09u0EI=;
        b=eeUdTxWjeV2BMSDF3zCRg8gyP/54wUE0FH/JBsVDPCFxWA3XTNI7gi7qh9YgME7uU5
         etrQfmFijprc9k9xLYqu/fET30Z1Y6yi8TPbaDsiaGPcG4bC9dVPfowrQL1n4fKVAeRT
         LkxdATPlmVNernKWJEUhyH/Jn70atejAFfMYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028669; x=1793633469;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ByfudzbZBmPdop+tQLUNKnJBViZnQ8X/fNaZs09u0EI=;
        b=XOjmuS6RdeeEnFY72HKKfyAYIgialwmY+XIO4YZ1Da5cW8klAvSSMNvYMDcIBvE3hk
         DJtuQ7cnSYKFtLHBMxvR5czg/SgreEu9KsawrBBgDzAJL65YsX5PTGjfswXraLTHJIGZ
         T2xm+JpDfjkHLsFHtf6o+aGcFFmXFUFvq12j9NB/b7OjBk521NvVu4xgx9STZHdRYcgw
         6IRi+i5L+vsOgWxt7ZGI+f5fZWeYU7/mraeKARp7+MHHuhC+TVNJH8jITRdYZZEBLH7D
         2D4Esut/yOOKsmRVekY41NCnOvZ0kPIF/fVtkiqYFCGBZg816UV7IuofUIvjXZn0csJb
         3wHA==
X-Forwarded-Encrypted: i=1; AKwUvByXC/AUdIgREAL9ZD6tjOCOuO4Yf1er00YiQPUyfCJWyV0PYsgJNkBDyrpWBzfTG7H1Mirbu+FK/imPiWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwUYSopFFUT5bPC9jNmiK73xtdBEfFemi08r9MuA+Dm8F3iwjJ
	3NZIayB4jpqNCY2bYNsKf9p4noBK2qMmsUjq6u786Jh0hEu6C6emgXBW/iqBGjZ162ZjKKhFW+6
	1QV60Qe7GobySkOCzgVgPDa20YDHkt1cXp1Tv4g09saaF39mjVpvn3w==
X-Gm-Gg: AYBFou1OFkm2W0VQIZwpS8ls5hWRQM5++zdv4ONrwEwQ+tT3hn440eeRNoM7Ztka0M+
	VYD3Bs/nNwQVprU9xQcaRcHEzo4OeDMICU60klRsiohggRkZ2Hsu0d5sPk+IovjNWvzZ+nOJqbP
	EHPXL+ONQdu88YEL9QqiRCsJQIZubCWz/wuKQ1m+kHGy/cSXYTGvElfuFY7YIfal4HfwuHU6oq+
	KPFONWHK8RTB6H2KOLBfzTF2oWZkwBZSqCW/sl3cNmrq2tq7TY9+ZWHZaSFys4KPHnsn5J5F9fZ
	GC1x94UQK/Vu8pmhrCmIoX16SlOY9pj9qx2jiiQW/RHMOwQDhzGkSz1jYPRB5qygahvQWkT9Iek
	wPWthrDGQyGPifJMB27YjYGpRJi6Sk8Es85c=
X-Received: by 2002:a05:6402:4021:b0:6b4:583b:daf5 with SMTP id
 4fb4d7f45d1cf-6b4583be5a2mr6346972a12.43.1793028668229; Mon, 26 Oct 2026
 08:31:08 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 08:31:06 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 08:30:42 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261015182221.2931742-5-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org> <20261015182221.2931742-5-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2026 08:31:06 -0700
X-Gm-Features: AclHuK8AS3l64pCtBVyQ04xvPLa_xotvoD7mTGNS-Ci5w-XHpRDF-10--cetNjY
Message-ID: <CAFLszThA+Fau4_0NEhXA3ntUmPB8wnuaabVvzNU=CMSpoQQgkA@mail.gmail.com>
Subject: Re: [PATCH 4/4] fdtfactor: Add compiled FIT image factoring support
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-15T18:21:33, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add compiled FIT image factoring support
>
> Bootloaders such as depthcharge on Chromebooks and U-Boot use Flattened
> Image Tree (FIT) images to bundle a kernel image with multiple board FDT
> blobs (`fdt-1`, `fdt-2`, ...) and per-board configuration nodes.
>
> Add `-f`/`--fit`, `-F`/`--fit-out`, and `--single-base-dtb` options to
> `fdtfactor` to factor a compiled FIT image directly:
>
> - Parse non-overlay `type = "flat_dt"` nodes under `/images`,
>   decompressing their `data` blobs according to their `compression`
>   property (`none`, `lz4`, `lzma`, `gzip`).
> - Partition the `flat_dt` blobs into compatible factor groups (by
>   compression, architecture, FDT header fields, and node-path overlap)
>   so a single FIT image containing multiple board/SoC families produces
>   a separate `fdt-base-1`, `fdt-base-2`, etc. for each family.
> - Support `--single-base-dtb` to force all `flat_dt` blobs into a single
>   base DTB regardless of node-path overlap, failing only if their FDT
>   headers, architecture, or compression differ.
> - Insert each `fdt-base-N` node into `/images`, replace each factored
> [...]
>
>  README.md                  |  15 +
>  fdtfactor                  | 726 +++++++++++++++++++++++++++++++++++++++++++--
>  tests/Makefile.tests       |   2 +-
>  tests/fdtfactor_other1.dts |  69 +++++
>  tests/fdtfactor_other2.dts |  69 +++++
>  tests/fdtfactor_test.its   | 109 +++++++
>  tests/run_tests.sh         |  69 ++++-
>  7 files changed, 1033 insertions(+), 26 deletions(-)

David is leaving this patch until patch 2 has been reworked, so these
are just things to carry into the next version.

> diff --git a/fdtfactor b/fdtfactor
> @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +    dtbo_comp_sizes = []
> +    for entry, dtbo_blob in zip(entries, dtbo_blobs):
> +        img_node = entry['node']
> +        dtbo_comp_bytes = compress_blob(dtbo_blob, comp)

One thing I'd like to check, since the README says this targets
U-Boot. In U-Boot, boot_get_fdt_fit() loads each overlay with
FIT_LOAD_IGNORED, and decomp_image() skips decompression in that case.
So a compressed overlay goes to fdt_open_into() as-is and fails, which
means the lz4 FIT that the test produces would not boot with U-Boot. I
suspect U-Boot should be fixed. Until then it would be worth having an
option to leave the overlays uncompressed (they are small anyway), or
at least a note in the README.

> diff --git a/fdtfactor b/fdtfactor
> @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +            for sub_name in list(conf_node.children):
> +                if sub_name.startswith(('signature', 'hash')):
> +                    print(
> +                        f'Warning: Stripping invalidated {sub_name} subnode '

This only strips signatures from the configurations that are changed.
But the whole FIT is rewritten with FdtSw, which lays out the strings
block in a different order from dtc. A configuration signature also
covers the strings block (via 'hashed-strings'), so I believe
signatures on untouched configurations break too. The user has to
re-sign with mkimage after factoring anyway, so it might be simpler to
fail when any signature node is present and say so. What do you think?

> diff --git a/fdtfactor b/fdtfactor
> @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +def _derive_base_dtb_description(entries, base_dtb_node_name, comp):
> +    """Derive a `description` string for a factored base FDT image node.

This is a lot of heuristics for a human-readable description, and the
results are not obvious (e.g. ['sc7180-trogdor', 'sc7280-herobrine']
gives 'sc-base.dtb'). It would be worth using something simple and
predictable instead, such as 'fdt-base-1.dtb' or a description listing
the images it serves. That would also simplify the tests.

> diff --git a/fdtfactor b/fdtfactor
> @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +        placed = False
> +        for grp in groups:
> +            if grp['key'] != header_key:
> +                continue
> +            ref_nodes = grp['ref_nodes']

'ref_nodes' is only the node set of the first entry in each group, so
the grouping depends on the order of the nodes in /images. For
example, if the first board in a family has many extra nodes, its
siblings can end up in a separate group. Comparing against the group's
common node set (which is what ends up in the base) might be more
robust. What do you think?

For the argparse description, you really have two completely different
cases...I suggest the FIT part of it should be worded differently so
it is clear that the result is an update / new FIT.

mkimage uses -F to indicate an inplace FIT - with -f used for the
source .its file. It might be better for your tool to use -F instead
of -f, and then -O (confusing for dtc?) or --outfile to specify
writing a separate file.

Regards,
Simon
