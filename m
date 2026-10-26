Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028664;
	b=wynF2e5e9Exr2Ih2FByzRp/RmS2i2WXUf94VtECbZoKm+54vt16K10TsYD5xT/TpPgDZ
	 D4sCCFBxw0zDnDFSnBc8rCcFfQ+AlwMXfI/8MbdLfbEZrsAxuIDd1XfGSKcXolNasc9TD
	 Tm8MgbE4BxD27i0sV03aHinNl9ZLKdfWw7p7NQNFa15QpzKYkDOcYFPch7zvAD3T+TIu6
	 wx6ZsdY8roAHFxETNn237AiRRz4KRbHe7hX3RDeomKrSggk/AW5I/aNECGXTZwJsDvbir
	 rkrdMVAAJlLpBdFr3iO1lM0skcZDo77rERSHSNcpwN4K2LFUXFTiRTyCU8EJmCMRXgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=e0KtBigF7UvCI2ryoJ1gV+l9mkYBR8ADXnTrlQIGx8w=;
	b=r+ZxlMOMbB1quxb+oDYYmPYaX02MhRQRT5JMi4KqETFLFIYqFJzEczsOwtdMJiaVw5Ew
	 i0JusPVMzeZO+4Vznqg473XWggqoIyscjta+ci9RcasYnsSeRRlFK0FTpE7FQdsv39ZkV
	 9SpilSWTqYG4XstPC3SRxr8YJ1+/WHTFddN4UwJ2r3kVSNCmdFwDj2YXLfkjCdiP61wza
	 5iO9uw+It2yjrijODKfLXUBiVOtzgoZdyfYwevCGTowienOsvOGfSW7k7hMg8FQlyhoFz
	 BZnExdxoEAqTyuHXlYgf+6Vhxp/NBMXS7A7A0hrh8IBb3aWtvzQEBDpriQKMtDUwHzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mDd8v4IT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3207D606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3207D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mDd8v4IT
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b40fc523faso3392625a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028661; cv=none;
        d=google.com; s=arc-20260327;
        b=W/g6NL6A7czbfNz+2EHdGfTdTGfOwJqANjlLIY0aTq4e0g7f8CuZam7RfEkFMXZaH9
         +3ubI8E46nV6yqe3V0GxK54R5vKIkEcCvd6kMp/ITCT+OSZl0jk3aon2TGFs4xX4Aa07
         JhImUIkMChp4DPQj2AxCyJi4WWPcMC66u+A25+7kMttW38KlOIRCxT3ShOk2jjUYPAF6
         60eIQapZoBvrX/hgKTMsXeff9gbwSq1Oyk2QtfCIa5AsyVsWdlumH0Ztyg+GIn6kqWFi
         ocRLRMOHYIYEfdq2EHlK/bOxAJwMozIUg4isRjq5HlHaJtvdqVwc3bp0pm+UA4/Y21TS
         tS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=e0KtBigF7UvCI2ryoJ1gV+l9mkYBR8ADXnTrlQIGx8w=;
        fh=eopslyTMBpQWTm3/qXbXztMlKAgVGrsm9TKMqgJErJE=;
        b=VJCzjInnJoGiAyStCKbsW7/N7+rUGyJJctZ2t4QJHatVV3YlDDeW40TNSTudR5e5oI
         SeneKFZybTVrvIoJ88Q+M1gFHojSJNgOrZFzwzOATnl68PSyv561pc578hEYUbQiZu/t
         3IquKU5yLRPzdHNdvVTIp8ITHWzplYv+0pO+JaHT8H537cJ5I0A6HNPXmKfsey3u0LiP
         hGAgvK5Dxb48517oTiJzQ7SQpjTg2fgfsAmImb7K4srP+5PtcsNqLWUKhLMHA+JKeRXv
         yDlszInW4gVvCtFggY6Q8l8/vRdnwm0/isoVu+vVKwz9NMD9AQ64T9uPrGaKZKsVfkiU
         7oNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793028661; x=1793633461; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e0KtBigF7UvCI2ryoJ1gV+l9mkYBR8ADXnTrlQIGx8w=;
        b=mDd8v4IT6VFBAIB7TtOKg2pYotKeCNNkjmBYZR185vQbjGNR1IxvPRkjDaqYUMCfNh
         UTdZA8GuWilc5PfjzMO7rAb4T5MHm5Qws7m1B7Km4/Zg5kenF93kqnANUK7N3Cci5nwV
         P4fV6Wd4U6YQUkUU3DhmMDlOODa8K68ubRgeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028661; x=1793633461;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e0KtBigF7UvCI2ryoJ1gV+l9mkYBR8ADXnTrlQIGx8w=;
        b=KdKnwDsgaXuxwNPSTsZY6jtfpHDM9h47ad7lecfQl+vfqcjDGBBac+9Cs6gE7RRuia
         ChUldr5goCEnlUClmscg23e1wDsb3qT8qFhNzXY4SGtlJx0N5ziKRL2il0MVbwzTEjp9
         NrTd6dYDvkmn+KG35gvEd69sY6LtTTRI2dwKBOBZr1nn4vqdoAxIpP/DLsSAHGdXMiSh
         doa/u/sqS27xrbLDYMIA97uth0O1WifKXCXuh08R/DMZzD/JPfjt3eqNL8dxWqCx6GWp
         veKF3RG1ASIAReWCqM3mrrNpL2I1Uc6cGRfBEVznDulfyw8qN3Y/UtnninQvcqG+QxJM
         bD9Q==
X-Forwarded-Encrypted: i=1; AKwUvByBOwAe6qFU0hQW4rbxTMxJpbrekWWN7PnSxzUDfMySY0ob/+mdtT9Qhtl57iDQ29n6H3U/91PblLjoXfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJICSycb92dBMxPYbzXetfnVIkhUXeeDi30ugi/UmCv7oFnngYm
	jdg3JBBx8UwRU/Y6uaVuft3BB6ZGWpc8RcLWiygUD4HKlgGojKZVPIKHFf0v9UmWbWLYFVsYoBp
	yR+ijrp6xPaE5hF3QrGB857zIjL8ok9sWx9Cg9xEi
X-Gm-Gg: AYBFou0/GN0auBqGpa8GykkKvCbagIfMtw72/LXoEqI1GCmn2vfh2SngOmCXswBwzXg
	3kBJND3M2QUL47v9npvD3eBP8y4A2KrTGEg8avDI3Cq756Ikkk6AivTVkz1XjiC4IjrH/o4Z2xn
	EkkZ+D+bEnurVNSUxDREozabukBWqFucLH/WlgEhc/5MJgT5DfQmh93/bgoMaoB7HUnQharsII1
	6+9OleYBjNinEfa+ePtzbgkKlQPd8O72naSpGH6OrayOH22uUXGK+tSAyKTCe1V0rUUJSfI9yoG
	bfKKaprLZ2hwi+2INObVWXnhwsQsDrJ/V71ftigMnve2sSMR/WMvML5tg5zT/CbUAi1h2AHXNZU
	c7lmLP+zu4nXMKXjUE/+DXo28dR1RU3ZH1WY=
X-Received: by 2002:a05:6402:4013:b0:6b1:ca87:c588 with SMTP id
 4fb4d7f45d1cf-6b443110cddmr8166525a12.37.1793028661578; Mon, 26 Oct 2026
 08:31:01 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 08:30:59 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 07:11:51 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261015182221.2931742-3-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org> <20261015182221.2931742-3-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2026 08:30:58 -0700
X-Gm-Features: AclHuK_nmjXBTCXflkgiPN9ZyiZhrkAUaOG6cYGE-6f8Kez0RNoxM0wmLg5pNsY
Message-ID: <CAFLszTiCTnpbmcGcjE2oWsY1UpyXd=8QFm+uuVBQTLw3-u_pFQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
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
> fdtfactor: Add tool to split DTBs into a base DTB and overlays
>
> When shipping a single firmware or kernel image that supports many
> closely related board variants or SKUs, bundling a full compiled .dtb
> for every variant results in substantial duplication.
>
> Add `fdtfactor`, a Python tool built on `pylibfdt` that takes a set of
> compiled device tree blobs (.dtb) compiled with `-@ -L` (`/__symbols__`
> and `/__local_fixups__`) and splits them into a single common
> `base.dtb` and per-board `.dtbo` overlays:
>
> - Common nodes present across all input DTBs are placed in `base.dtb`,
>   with each common property assigned the value shared by at least two
>   boards that maximizes byte savings across overlays.
> - Using `/__local_fixups__`, phandle references inside property values
>   are normalized to target node paths so common properties referencing
>   common nodes match even when numeric phandles differ across input
>   DTBs.
> - Any common node that carries a phandle in any input DTB receives its
>   phandle in `base.dtb` so overlays only emit `phandle` properties on
> [...]
>
>  Makefile                   |    2 +-
>  README.md                  |   58 +++
>  fdtfactor                  | 1218 ++++++++++++++++++++++++++++++++++++++++++++
>  meson.build                |    1 +
>  tests/Makefile.tests       |    2 +-
>  tests/fdtfactor_board1.dts |   69 +++
>  tests/fdtfactor_board2.dts |   73 +++
>  tests/fdtfactor_board3.dts |   96 ++++
>  tests/run_tests.sh         |   61 ++-
>  tests/testutils.sh         |    1 +
>  10 files changed, 1578 insertions(+), 3 deletions(-)

> diff --git a/fdtfactor b/fdtfactor
> @@ -11,31 +11,195 @@ original device tree.
> +    if comp == 'xz':
> +        return lzma.compress(raw_bytes, format=lzma.FORMAT_XZ)

Python's default integrity check for FORMAT_XZ is CRC64, but embedded
xz decoders often support only CRC32. The kernel's lib/xz is one of
them, which is why scripts/xz_wrap.sh passes --check=crc32 to xz. So a
firmware-friendly .dtb.xz input could produce a .dtbo.xz that the same
firmware cannot read. Please can you pass check=lzma.CHECK_CRC32 here?

> diff --git a/fdtfactor b/fdtfactor
> @@ -1167,20 +1349,24 @@ def factor_dtb_files(args):
>                  d, base_dtb_blob, dtbo_blob, args.strip_local_fixups
>              )
>
> +    base_dtb_file_bytes = compress_blob(base_dtb_blob, base_dtb_comp)

If you keep --verify in the tool (David suggests it belongs in the
test suite), it would be worth running the compressed bytes back
through decompress_blob() and comparing them, since at present only
the uncompressed blobs are checked. That is cheap and would catch a
problem with the lz4 command or the compression options.

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> @@ -1147,6 +1147,36 @@ fdtoverlay_tests() {
> +	    run_wrap_test $PYTHON "$FDTFACTOR" -v --verify \
> +		-b "fdtfactor_base.test.dtb.$ext" \

In these tests the base output always uses the same compression as the
inputs, and the input extension always matches the file contents. Two
extra cases would be good, perhaps as a follow-up: a compressed blob
in a plain '.dtb' file (to exercise the magic-byte detection) and, if
-b stays, an uncompressed -b alongside compressed inputs.

Regards,
Simon
