Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364640;
	b=IMPa8K5btRrMHpCsbg2FZpXJWhkBN7H8irwjyJWWnOB9nwq+YI4ZbX7YgHOM3Wlpgjyd
	 8EFn5iWvjXmMVUvOcyf4nu3ryYp/qx9OKREifaAoFWsVJBxlx2AevdjLPEEcJR27Tthkk
	 /+npN1Suz0iztvTRB/YGLQMCxJCnJ/7rvwuw2GydtkmtrhZxPR4HGVHvd7k9Af4Wx6uyf
	 nj6p/vAkhzir84Opuq66LBJQgO0OLn8T1dxPI/7T//usVi1hH0Zdc3L9exkFTRA4W+0ha
	 /zIS0Mt0svZpFUV70Sqowo/dvQySMSsJICwnSA5O4E4oiPzWmX0UE0wWedL9rbo6F3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FX9VeQdffmS4/jJpEL1BeyTCKEK291OuE2NXa5F9J/k=;
	b=rIs4yCh8sVz9uvbf8fnUR7W+JNgBJM8IWXp+bE4y9t2JWjJ3LVzOMfI737Rq+XRX0WPM
	 FRful4EfCZL9LVKMcFgpDzjDc70VGZ7iuQA8gDQLyozI4NLRWwiztvyMIvWDiK2gOoCNX
	 sXivJHhrFlwRYmn6hjaNCi/zowtlvV8rmWTCX1wH60QFoEVJJVdTRpyfjI/rdlSfAzl3w
	 ds4kOr4qugPvX9SzbzLl4d2nH+nqDe6M7wPhwjFXw0xG3BuQN1VQmb9aQWQglDGxUDKTf
	 va19Rd/ehc+1q2Ev/c8Mo2mCFQJWNw51qu+iDVrZy+2Y69pE/4Qzb3TgsYDSdavBeAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gzvB7Q2c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D1360A262F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D1360A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gzvB7Q2c
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so808666a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364639; cv=none;
        d=google.com; s=arc-20260327;
        b=TL6rACHIsyjJShURPdkxFeBYW/PJ4W6uGoCloVs3UMjKwspFGLSUwbysebYOz1V+gT
         YlWcxtLbKDyW+XLaaHaLRy0NT7LLr/aaW7r0TqqhyDv36EX5K2nPdcQMr4+Omon/dWdt
         gMbgR95wXzLucdkaGOOc2nH7h53xxpuNzF2QwC4ZEaTgcpZuuqSwu9z6XE7AAOOnGDCz
         JnEYXut4qv9+E0wdw3N1AAjFuemTvZJKmz5PAY46zCAhWNbEZVxJO7SYcCRne4KRcbXa
         fmMT/wmPfCMEzVSSdH6Gls56+g1yztpXT+XRHPoWQaQy1uyT6zTKfKjnbLMx2XoTBTl1
         GNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=FX9VeQdffmS4/jJpEL1BeyTCKEK291OuE2NXa5F9J/k=;
        fh=wEyDYz5Ky1vYBYSn8cYDEP2OT7KtKs+sNNVHBV6iTcw=;
        b=sajypF6Hxoyfjyb+8G3sVZEWTnpayCczUaf4/oAK/h0Kl0SReUwgrbcNgysmE3PSDg
         ZF/egjhy+3ey26p8GtGHXEDvMjn7bYcC4FfBnDK3cpTZZgQVXMgpJ56DiM6aFjw0erb7
         9fPimkIWl61p9BKK9DIJb75Zg7xYK+3TAhTknyfWxQx9vtixaI5NvKBKDDl6wJtCKeYw
         BaOXzoK+oYdbK2KDzdj1tGmlty3C86iB5jRzpuLjjaebK3ZXgns39kWi3xQvycNURRQs
         4fh9M+8hB7D0DxnW8yKxanvRIuqM28qt22W3qTg0G8ZHVjHnjgkyxM91CbsbaY6ivRtR
         cCZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364639; x=1793969439; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FX9VeQdffmS4/jJpEL1BeyTCKEK291OuE2NXa5F9J/k=;
        b=gzvB7Q2cgL2q3Vl+XRCARkd+b8/MLJdW19XBdqgep8Jjho8I5lxtNAS5pTKd2YSshc
         JNRJKELspYpcgwXEmwQpEdDmdNan4epNZDqVOpDxY0h+LRaRHJ0S5RNlsvBim8ymc9lt
         dQHoJdbiNxjRoks4lmOgYWdPzNhmDT9YBTdsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364639; x=1793969439;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FX9VeQdffmS4/jJpEL1BeyTCKEK291OuE2NXa5F9J/k=;
        b=0HcCn533xA60TlhHFabSlGPwyKE9fKbrPbj51r5L2Q/Bm1r8ICSwNFU7BesPp1TXz/
         ILABrmJft+o9iTECaaCmy+pngjkea5SA1b9dBNCwlLjsoZxOc833XB8V2Olw/tAAFyE6
         bxozfnE2LCbaYytkJBH65IpuUqdo9v68EKSkyqZzPI7i267OCHQ0pHvNyWQdGrbqLpvA
         /MBD4YmgCzrXsL0Y/AFzWibK9utFLM/XRMCdI4dgHNkfGuGISMc4iUjuFh0A5R+Uu0FA
         srnbsVbuohYPpRiCYJlKQ8BWYN44W+DaY3Hi2rapglbIUrjO8+k7oOiHUClYJrc6jk+l
         KqcQ==
X-Forwarded-Encrypted: i=1; AKwUvByQKRSTsZlGGnhIpiOhB8Ser0Z+RlIdClxjMYyOfwhrlFlvI44kckopFNtlJapcYJw1Mz+K7FL2iv7yoNY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY+HzR4VGf5dbuSjRVXESLDMYCCnK/wvl6m74QmUOtRWKGKTwl
	WKSltoiqZ5w4Zp9lUN2aTwwn/uwKGDHHDfUhCt8NS4ZON0uB3lz0mt+8kUIP5rC90ItxGb2oIs3
	4i8qM9+tBctFkXuihzZLbImQ59Lhq/I2W8qHSYRBW
X-Gm-Gg: AYBFou2TWHAAMWoayxHQuUuA95MbPK8nD93B71cUWSEXA5idBH1cRj8WfHD0MkEeTvT
	VTiAQ7pOR6P6vYqxRKrixVavFPq384VdjyocA9t38phn6J00myhRZLvmS3gPL4MDOd3385iKb/8
	M5NgFLm3q7uYMuWpEKpDVaY/221JDrhg+9HnWuFaZqqloBJjr037jRtJpHb7xDC9d24N3gJvd37
	cdWYl4GDfFqCO6mpThsOwnAxq1fRZd+VDQ4N3QStqFqVMwa6MZ2juPMPmGLb7DqfdyGJ4NrAB16
	4Wu7VqHho26YPCn6hJ3bgYG2hAJRnxQ8j+M01rAeqKC5bUtHrN27iaRzQ6US9Izg1a3bFN6ceoW
	/Yz1oH+DTl+8BguDZ3c5wUVh55adQ5yyt51tBSuqD52FRQomfgESt4Zp+3HH6NhjHarq40Vc=
X-Received: by 2002:a17:907:1b0e:b0:c46:a5bb:5740 with SMTP id
 a640c23a62f3a-c4ca7935979mr211532566b.5.1793364638552; Fri, 30 Oct 2026
 05:50:38 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 07:50:36 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:06 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-11-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-11-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 07:50:36 -0500
X-Gm-Features: AclHuK8TuSBAtrZecOD2tH8pJthaXl3o4LfHFWTO4xNv6q-hCysffxjLZ6tbXlg
Message-ID: <CAFLszTgXZ8fcHuMbMAorsDaebj43gU47bS48pO8dKtnL0JF+Fw@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] fdtfactor: Add compiled FIT image factoring support
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

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add compiled FIT image factoring support
>
> Bootloaders such as depthcharge on Chromebooks and U-Boot use Flattened
> Image Tree (FIT) images to bundle a kernel image with multiple board FDT
> blobs (`fdt-1`, `fdt-2`, ...) and per-board configuration nodes.
>
> Add `-F`/`--fit`, `--outfile`, and `--single-base-dtb` options to
> `fdtfactor` to factor a compiled FIT image directly:
>
> - Parse non-overlay `type = "flat_dt"` nodes under `/images`,
>   decompressing their `data` blobs according to their `compression`
>   property (`none`, `lz4`, `lzma`, `xz`, `gzip`).
> - Reject FIT images containing `signature*` subnodes under `/images/*`
>   or `/configurations/*`, as modifying FDT blobs and configurations
>   would invalidate cryptographic signatures.
> - Partition the `flat_dt` blobs into compatible factor groups (by
>   compression, architecture, FDT header fields, and node-path overlap)
>   so a single FIT image containing multiple board/SoC families produces
>   a separate `fdt-base-1`, `fdt-base-2`, etc. for each family.
> - Support `--single-base-dtb` to force all `flat_dt` blobs into a single
>   base DTB regardless of node-path overlap, failing only if their FDT
>   headers, architecture, or compression differ.
> - Insert each `fdt-base-N` node into `/images`, replace each factored
>   `fdt-*` node's `data` with its compressed `.dtbo` overlay, recompute
>   any `hash*` subnode digests, and prepend `fdt-base-N` to each matching
>   configuration's `fdt` string list while preserving all other
>   configuration properties (`description`, `compatible`, etc.,
>   populating `compatible` from the board DTB's root node when omitted)
>   and any pre-existing overlay entries.
>
> Add uncompressed, LZ4-compressed multi-family, signed-FIT rejection, and
> `--single-base-dtb` FIT image test cases to the `fdtfactor` test suite.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  README.md                  |  17 ++
>  fdtfactor                  | 588 ++++++++++++++++++++++++++++++++++++++++++---
>  tests/Makefile.tests       |   2 +-
>  tests/fdtfactor_lz4.its    | 109 +++++++++
>  tests/fdtfactor_other1.dts |  33 +++
>  tests/fdtfactor_other2.dts |  33 +++
>  tests/fdtfactor_test.its   | 109 +++++++++
>  tests/run_tests.sh         | 158 +++++++++++-
>  8 files changed, 1018 insertions(+), 31 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

BTW, 'FIT image' actually means an image in a FIT, so I think you
should try to call the whole thing a 'FIT' instead.
