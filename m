Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028666;
	b=232/hxSncUXDqotPPGzpemhunJOrPDumERinA/N7HqXZJjm7joPKp8eWEKyApyEXC1G7
	 jFq9ds2oTT8sXMfI4IU4UXWCUZzaC4EuzQfSD0eB7TvrAyYKDTPXW6Xkj/TmQXtY8HEw0
	 zkPF9DWQwtMAq/unCyc1HrScNkcmhDkbEi1uZLwk4sF/nEqxXaGBjrXaAw9VuUwo8MGE9
	 aSk/Pa6obJaNXTaLez5BrHZR0cydu/KaswIJZD03aWMaQaSPdHLvhMOw2r/m9fONXF6eE
	 HCcve4SfLUij4vPOxn2w83eS5+yqId4fWOUFYd9DAaAnnAiqBuvajmiXeG+bPATk+gQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IpCrhhdrQggWiZdXpuqOx7Kbrnng8aqJZmk22MF4PNA=;
	b=XwO178LdaPHqi8DNl3P/lTNrDzZ3JGov59kIE0l+m7R/A83MrnIQeU3wNxJTRupilUSS
	 YXRYD0KkwhR/4df6MdWN0Q18MoSyPnKXTlZEBFr075ecgSHxcUtae6/FLZFD8utGe/Hvj
	 Q6WmcZ38KDt0yykd9QWQGs8VwUdu4kgt/McfQbpxjxvb9prqLkO23LpCRN7sdVYtRES1D
	 H25bUxyH8V8Z3U/gUqdatUV2TbsTiHd3s0z6l4Fi+Pzhg6nASy7WHvVbLkbVp2aQIv/m4
	 Ngvx4TVl54DQVSd7KeOjp+GJ6P+tYObY7K+et1SVS5tnCRsgrHKQlAvH6Fiz6UvGXRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Za13/Bq8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06C1606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B06C1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Za13/Bq8
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so6188144a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028664; cv=none;
        d=google.com; s=arc-20260327;
        b=c4NJtIqNNwd62lD4rYwOW0Dql0qwsXJLgjwO/a4qjh16Hd52WXICdj/DS5/DsF33BW
         VLU3OOViEB6C/Uc8ttHtLnMTs/bf6KuDVbt12O1esfo47oQFf2fIcBh20e/XPIOq15CS
         cWRO4o+fUiViBAzEgcuN5WAsMsgqZcdEHdBTPPZQjVWvY7hsItTEx1IIL4LjBPSn8mOn
         soa86UW/zoSKFhPoLIqP167zF8isjImq0GMu+vb91KKzsVQG8PZaC+eCdqaWNwDWVrm2
         sdzyM9vjW50cU1m51wmsA1sr0kIlXwwtqdkPhkiSr0x4NhT2a0SSd2XrKME2TB4arcZj
         MepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=IpCrhhdrQggWiZdXpuqOx7Kbrnng8aqJZmk22MF4PNA=;
        fh=rLzKgeg8VbDZHPCAQEBEPNpBfI9e3wDEzWOv+XxZAL8=;
        b=Z6tb9Zk14V/CXSnSFw5HxgPNaxsmdYgkR+WimmnU/rJjQCZ0+CkwskEBp6FqXCCg9F
         WxvpRz2aY6nNFnDXwas+ZhkymerGjDHoq6oUy3Y5Evr0AQ1G81a6GVquLEZ+i5p17ZtK
         Ei55XiPbPHZZeDBFQ/N1M1UV4/Db+OsxqAsBu2PgbB8jh8QvTpN+qQy8vGTfVq4YK/aU
         ZGNXOKhhTT5q1rtyS/V0/WUT8ZMvblF1F7GjRw5fNY6hvCWFJDLNhN1mcy7/oAKf+tTb
         SkydK+YPi2fXuR0+yB76l6Pff40yyTm/hOj6eF0MjPQwDr7FYE47NJU8UzknfIogTw8M
         OaYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793028664; x=1793633464; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IpCrhhdrQggWiZdXpuqOx7Kbrnng8aqJZmk22MF4PNA=;
        b=Za13/Bq8Yi/UnFcjNR5tbGFu6kj19LhC3A9gx1tmwCDExrLmn1zErs+eDYhHxp9+j5
         3j5JlknAT+0EZg6ehVMZjvqzpyyq+PC3nAmWP4Ze3hXIDLwFkM6PwYR5T2jAAFq+tlNd
         br/Buw7D5rWdgMJaHj1hlo4Y0RHJs1g224bkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028664; x=1793633464;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IpCrhhdrQggWiZdXpuqOx7Kbrnng8aqJZmk22MF4PNA=;
        b=o8/DfPZ8z2UPjX6GHC9F6Cw2mcXLNQUDKHLUiwypKQ+8kR1pik5ZNVIYXUrIWlCdly
         PymFx4vSoAgjxDmZC1dCj2nOYEHA9hnik6kLtCHbx3jSDZDEltvALXTWH/hDOdZV0QkU
         gv0KHtt231A8um1+yq47jthCtexMTODAuPrNoMf6AnEUskkifRo2C4MX+QRIgCcDVW+c
         A3eRFmLmWScvQ+jLM9FSM6xIsnl6ft7sCrBl5z0S8SiStl6XmXzcGA8EnvYmT3nf+010
         HufILa4ArnyeO6trd4NI+P7eQu/+UyqQt5Ngu1UkGLaIdi5/dlLoXkCunGdAgDWza/nh
         b8VQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvBGH2J6zVK1Jy7WY+w5gQmJaebiDctuSyY1AJeq1mDApt2Eoqw/dviELk8UvKcOt+tZam20e4YMgnrNA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy8vZypbL1SW5gpFsc8BWL3QQlwD79x9cHs4tvOnJ0aha8yTEh
	tbP3jOmcz40E+1ZRIBNzeblRAy9K8XikSu9gFBMV6psiF8zG3jIRloPQyqvP8tpOTy8eS+FPy1g
	yQOA9bSyxspL3wLwv/F7K4W2Qy+OWG3VenhKS6uPE
X-Gm-Gg: AYBFou1l0U5UTd8qw5qHcyYl8U4LJ8X3h0xVIiJh551AQdOKfox9ooFb9mfxEhC7jLx
	YIRt+mSQWgdXIW0bBE9n9MH4Dt6kXNzzCMK8KwaCuMFKSempvjafF0U4772Os2S4pSeXTq2Xqa8
	7olVmtzA/WVkLp0rIusxAQ8FgYr1LuqVP8rY/XKvfDQHg009gXJdiUTkczCkoyOdz69J27NYip7
	0BBgzTRIGLPJAoEQ/lXcF+gsVvSN29xdq0WNt+6rZQDbUOKtFHijBFDCtPgAw3JE0Qo5LATaEZR
	XRsO9dufdfXwEwKchtmeLP/CyLcL8NeHCTbcFYHUYcxYSUOgG303Iy5JRXRkjFKEc1aI57c02jB
	CQOsP8XLmURfqAy7ZCVThaRX6Txz0/1yowx0=
X-Received: by 2002:a05:6402:1356:b0:6b1:8316:ba32 with SMTP id
 4fb4d7f45d1cf-6b442ff2d2bmr5868656a12.17.1793028664145; Mon, 26 Oct 2026
 08:31:04 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 08:31:01 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 07:12:00 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261015182221.2931742-4-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org> <20261015182221.2931742-4-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2026 08:31:01 -0700
X-Gm-Features: AclHuK_hy_WTcUcfTQINhQj2aXPqXOcXmBmhHpzgXfBxsWcmA5gscgp9ZGWx9GE
Message-ID: <CAFLszTi-j8HmVy8u3gtH-6YCigakX5CNeqZ9sVc5ksn7q3NxaQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] fdtfactor: Support compressed DTB inputs and outputs
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
> fdtfactor: Support compressed DTB inputs and outputs
>
> Firmware and FIT image build pipelines frequently store device tree
> blobs compressed with LZ4, LZMA/XZ, or gzip (e.g., `.dtb.lz4`).
>
> Extend `fdtfactor` to detect compressed input blobs by magic bytes or
> file extension, transparently decompress them before factoring, and
> compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:
>
> - Support `.lz4` (via the `lz4` CLI), `.lzma`/`.xz` (via Python's
>   `lzma` module), and `.gz` (via Python's `gzip` module).
> - Preserve the input compression format on generated `.dtbo` files and
>   compress `base.dtb` when its output path carries a compression suffix
>   (e.g., `-b base.dtb.lz4`).
> - Report compressed size savings alongside uncompressed savings when
>   `-v`/`--verbose` is specified.
>
> On the 47 Qualcomm SC7180 Trogdor Chromebook `.dtb.lz4` files,
> `fdtfactor -S` reduces total LZ4-compressed size from 1.71 MB to 213 KB
> (87.5% savings).
> [...]
>
>  README.md            |  16 +--
>  fdtfactor            | 267 +++++++++++++++++++++++++++++++++++++++++++++------
>  tests/Makefile.tests |   5 +-
>  tests/run_tests.sh   |  34 ++++++-
>  4 files changed, 284 insertions(+), 38 deletions(-)

David is leaving this patch until patch 2 has been reworked, so these
are just two things to carry into the next version.

> diff --git a/fdtfactor b/fdtfactor
> @@ -11,31 +11,195 @@ original device tree.
> +LZ4_MAGIC = b'\x04\x22\x4d\x18'
> +LZ4_LEGACY_MAGIC = b'\x02\x21\x4c\x18'

Legacy lz4 input is detected here, but compress_blob() always runs
'lz4 -12 -z', which writes the frame format. So a legacy-format
board.dtb.lz4 comes out as a frame-format board.dtbo.lz4. I checked:
'lz4 -l -9' output starts with 02 21 4c 18, while the compress_blob()
command gives 04 22 4d 18. The kernel's cmd_lz4 uses 'lz4 -l', and
lib/decompress_unlz4.c only accepts the legacy format. So a consumer
that handles only one of the two formats cannot read the result. This
doesn't match 'Preserve the input compression format' in the commit
message. Please can you track legacy as its own compression type (and
pass -l when compressing), or else reject legacy input?

> +def decompress_blob(raw_bytes, filename='', comp=None):
...
> +    if comp == 'lz4':
> +        try:
> +            res = subprocess.run(
> +                ['lz4', '-d', '-q', '-c'],
> +                input=raw_bytes,
> +                capture_output=True,
> +                check=False,
> +            )
> +        except FileNotFoundError as exc:
> +            raise RuntimeError(
> +                'lz4 command not found; install lz4 to process .lz4 files'
> +            ) from exc

compress_blob() repeats this block almost exactly, so it should be in
a helper. If the helper takes the filename, compression errors can
also say which file failed.

Regards,
Simon
