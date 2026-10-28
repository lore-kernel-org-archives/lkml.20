Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224720;
	b=SIXtS8BBWJf7nrylYDs1CII4z+U2yskNusGSUrRuUS7hcsMYiDyKbv10AaRelFRryQQ7
	 e4sT/eHcdSJ3Eh7xv3txujPPTsGNfvGSaPRD6PtxB3qq1LKTDZdzfVLIIwLuTUVr5Nvgh
	 7WdGLeNKOAfHSMCyOYeNEV8/apZo+Xlh5N95FuoOB/ODZtSKO9r4FnRbYMmjS9d+1N/Kn
	 HGQgbzpxyOuputO7ZPLmH4+AAGmBZ/fshDcynpnT35ycT73mDlaTXJIlKmj3F+RKF0YXM
	 psDOC8WYJThgmcljDKg1brP5lnVuyvwAPKmAxkeQ9d5jkmVfQ3i5GTw08W9jRUPlXHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yjBj6q9tc23c/gY7l0t6am+Be7ywusZAkkg+litsRmY=;
	b=he6tQ6r72eYBZfg1vvW0WBO0fCDjRMZ36RZaYVNPTbqRGzfTmj3lbj5yHyB12UtChGod
	 nwFN+v+uO6i2LlJrmpPHBivBGxw0muKdjxUKBmLLW9BRoTIdEY6bRbHIPmp/Vbeb+STld
	 AknVpeURDXOJ0BlMq/hhH2PSeVRo64GklDcV/4BuQL/DF/ee5htGC2Fzx7XLezEGDae2V
	 OPD2AH7ApYCsCtPdX9ZP/6WKj/fRQWDnvD8Y5U9amkOAZGZBmDSONH3XOOViyypEgVFzs
	 0aEePXorE5YzfEqBhfjAAPCAjjOInDQBKn2+JEBtMBWe7318y7CLkI7CxZYF4bZA4Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hZY5lVlG;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A37D606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A37D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hZY5lVlG
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c418e215671so192264166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224718; x=1793829518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yjBj6q9tc23c/gY7l0t6am+Be7ywusZAkkg+litsRmY=;
        b=hZY5lVlGh6o7TJ5roGNLjMtgNPp2FF4epdSqgQsS+bxJlntVfQpKnk2kKhQUj1ASwt
         7j5sBDwwI7ptHQ3kexsWdvgEKgRWMu++Ntl1xE3mUsv/4yOM1gwSnZcTnyMxaryvMrtS
         By5uTVMjXhNEpa9S4EoXe8rSaK/+yUCANZ9l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224718; x=1793829518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjBj6q9tc23c/gY7l0t6am+Be7ywusZAkkg+litsRmY=;
        b=wgE99nKK2g+w+bubnEqj/g24mCUPCsAnhYulTD/MnXxD5VCht3IA4z+h/sOqv/+ao3
         cP3MXuIl6DbR9+lVYQpJiveVcZrj5KonjwHZ71WCD8Ey4/cCzR2EP1/xDJ57CdcSrrqC
         R1hzrzZIRk3BW4EIpKgDnxgEqE4bVamkLQSRJWRcYRyA4a4FR3ljJlFVftVcwE+2Up2B
         2Tqzx2amo7Ye+bGNhIT10d4uX/JxKdA9CH5hWnRbGWkVAoP6RGM56zrvSCERcljCcoMH
         8XsFP7DaJjVPRg9fZ8zOtmHHuQfPBM4snIRYkStLnHg28j8Vh1td6LeEk6kpvnLH7yHU
         fuLA==
X-Forwarded-Encrypted: i=1; AKwUvBxXsZ2oFiy4YiZYwt1yCbfjEdPwbPJCV6xKMy17bJrJKe+VsjD+7L5l0ZgTh6FiPIYICI9Cuij+EJYGc5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjFfEkaGz6wRWbl7KB7I0eaiLgTd+0ibH5ecNXa0MzHvyfacvk
	c0W+dTjrvNpr8TQG+2eI3hLr2gBqip3xLSv4RVlpX/21fNhuJPIGdEPujoOZE8eHYPUCvn4VvFM
	itUpm996m
X-Gm-Gg: AYBFou3u+a4sV2+mb+YaOcdSG8d8bsPcgOg1rpiGGr6u5y0fDJDaDiIhSVmf/NMytfR
	MOL7iwn2DJeYJ4Dycg3U63HPi24s4C1LauvD+y4AgLOxayS5zCbYSqRlwySHUYvEdZFKv5KtKdo
	ATyo0BHHVaJJKcQ7BxO0hq8c1evRpLOxEEDaMejBQxVkOCl11l1nG4wT4/8t/JhkKuIMD0QN9lL
	pqIuWw6C3n3VqACPmqh0AXqf8Ot64ttXw/Wov2lThv9sayL5oNoYad+qHm2D01wZdkaPtHEnIzg
	dBbjqGrjF33Yz3RNLBBEURTtvApQpAdERpB54KZV3R06QNQ9kFh3BGhXbb15iuFLHJ61YxShEL/
	wsd0How8pwe5fdUZzafmD7w4/PC3d9feGOvva4xAcgbg2uCdV8Ra/kMr2gZmU+z6kbrIYz1lUbk
	5txcFutl+YrTWhEEQlaCYWP24wvCK5Df8mB8XLroK5SfLI8jOXqvd7a0uIlLLkPU8XtWSRdadBs
	yvODjI/7IrAjiDVdvci4daH/NICA+ySMTsouiRDRfxXHcqjWKewdTwM5G/vNp4xgV7t/A7iArnf
	O14ld/7biOnz/F0Q7zSnW1xEfZfnjonnyhjN+HB87/RofP8XCTNiyXFqq+TRF83e5W4F
X-Received: by 2002:a17:907:9606:b0:c41:e75e:5889 with SMTP id a640c23a62f3a-c49bdf2edb1mr321453066b.33.1793224718450;
        Wed, 28 Oct 2026 14:58:38 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7975b2sm662919566b.73.2026.10.28.14.58.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:58:37 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so16606565e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:58:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx8cjaegKj/ovy8VQ7KiUfPcnybX6G1ZuLBnsInzn1Pgapc/m77oXqpBATXvN8HjFy4gWOouXlnLG1xvBQ=@vger.kernel.org
X-Received: by 2002:a05:600c:6989:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a9647aabc3mr76897285e9.2.1793224715600; Wed, 28 Oct 2026
 14:58:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-5-dianders@chromium.org> <CAFLszThA+Fau4_0NEhXA3ntUmPB8wnuaabVvzNU=CMSpoQQgkA@mail.gmail.com>
In-Reply-To: <CAFLszThA+Fau4_0NEhXA3ntUmPB8wnuaabVvzNU=CMSpoQQgkA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:58:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WacyUDJWaH0W09BVBkhFGabUZ3SJ+6L386QHQLhrE9QQ@mail.gmail.com>
X-Gm-Features: AclHuK-VauY5jFIV9iZhwrCVa183QIFYKTVeSrQKaKqMsei3LLLan46HVAC43ng
Message-ID: <CAD=FV=WacyUDJWaH0W09BVBkhFGabUZ3SJ+6L386QHQLhrE9QQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] fdtfactor: Add compiled FIT image factoring support
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Mon, Oct 26, 2026 at 8:31=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blo=
b, dtbo_blob,
> > +    dtbo_comp_sizes =3D []
> > +    for entry, dtbo_blob in zip(entries, dtbo_blobs):
> > +        img_node =3D entry['node']
> > +        dtbo_comp_bytes =3D compress_blob(dtbo_blob, comp)
>
> One thing I'd like to check, since the README says this targets
> U-Boot. In U-Boot, boot_get_fdt_fit() loads each overlay with
> FIT_LOAD_IGNORED, and decomp_image() skips decompression in that case.
> So a compressed overlay goes to fdt_open_into() as-is and fails, which
> means the lz4 FIT that the test produces would not boot with U-Boot. I
> suspect U-Boot should be fixed. Until then it would be worth having an
> option to leave the overlays uncompressed (they are small anyway), or
> at least a note in the README.

Added a note in the README for this.


> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blo=
b, dtbo_blob,
> > +            for sub_name in list(conf_node.children):
> > +                if sub_name.startswith(('signature', 'hash')):
> > +                    print(
> > +                        f'Warning: Stripping invalidated {sub_name} su=
bnode '
>
> This only strips signatures from the configurations that are changed.
> But the whole FIT is rewritten with FdtSw, which lays out the strings
> block in a different order from dtc. A configuration signature also
> covers the strings block (via 'hashed-strings'), so I believe
> signatures on untouched configurations break too. The user has to
> re-sign with mkimage after factoring anyway, so it might be simpler to
> fail when any signature node is present and say so. What do you think?

_extract_fit_fdt_entries() now raises an error if any
/configurations/<conf> has a signature* or hash*(1) subnode or any
/images/<img> has a signature* subnode


> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blo=
b, dtbo_blob,
> > +def _derive_base_dtb_description(entries, base_dtb_node_name, comp):
> > +    """Derive a `description` string for a factored base FDT image nod=
e.
>
> This is a lot of heuristics for a human-readable description, and the
> results are not obvious (e.g. ['sc7180-trogdor', 'sc7280-herobrine']
> gives 'sc-base.dtb'). It would be worth using something simple and
> predictable instead, such as 'fdt-base-1.dtb' or a description listing
> the images it serves. That would also simplify the tests.

Yeah, makes sense. Done.


> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blo=
b, dtbo_blob,
> > +        placed =3D False
> > +        for grp in groups:
> > +            if grp['key'] !=3D header_key:
> > +                continue
> > +            ref_nodes =3D grp['ref_nodes']
>
> 'ref_nodes' is only the node set of the first entry in each group, so
> the grouping depends on the order of the nodes in /images. For
> example, if the first board in a family has many extra nodes, its
> siblings can end up in a separate group. Comparing against the group's
> common node set (which is what ends up in the base) might be more
> robust. What do you think?

Sounds good. Done.


> For the argparse description, you really have two completely different
> cases...I suggest the FIT part of it should be worded differently so
> it is clear that the result is an update / new FIT.

Reworded in v2.


> mkimage uses -F to indicate an inplace FIT - with -f used for the
> source .its file. It might be better for your tool to use -F instead
> of -f, and then -O (confusing for dtc?) or --outfile to specify
> writing a separate file.

Done.
