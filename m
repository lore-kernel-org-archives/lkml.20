Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364629;
	b=RvagjOfdB6SjfPaekwDxn1RrXI3OeXS/kagRmq3AKtJmOPVCtGNqgKJ6Y9MZn4iWhaWW
	 D+zepe+Lagy+EbZId+zxEN8+lLz5xhajL+HTbqc8pytKP3JQ0bMCjDRXWswPjYrxWr9RY
	 J89ZdvoLssp5cmaURMbyIy+eH0BnviBzIbHB11CpCU7g7gq7eo4T2ME4x/ANH1OPK6Vqk
	 EW8z+cS32V5dES1unn/QFKLD1WE6vpsLrmC0fBMrnyDiONCuvcExiOU5qU8Li+vSZulgP
	 q3eZXjkyeAqSeVDldfXD6SOaEmMkdy/Mc+uDpxIb0BnSwpEbqCv+HM8S6XIygLfcohA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=apsqo/umYNQ4NLY3kr6+1CRtc6C+cK0QqTdi+p9pSSQ=;
	b=kExTYR3GWg3Qw6NBzM9mLVsydARLKLGtMQAswTXn05WSq6zq8wqLb81VqboYO6dA752y
	 ONz3WQ/TiY7oGMzghbuqxI96FqOdQ0vefHKIjh7p0OT7dLXoPWpCpFKumiCGBYvSw2NWu
	 /37DOb/peraQFvzejro9C5ARnbh1gZrntxMcETRnu/bOlsGojTBuggUUzlrx7WOJ40wDS
	 o+7uqcBV4ArL+rd7sNCJVbN47dV4vCXLcKGzc/1ufnYGNGqncc9lbq+zAtSLPMniqjnDM
	 sBB3XyEf93HG79BjBZfNQoTvfd11xv5unydpqIZ+9QlqCA+xxE2gZ1I7PCTI1+QWR4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Jj9wHGbo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605C460A2627
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 605C460A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Jj9wHGbo
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso850257a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364628; cv=none;
        d=google.com; s=arc-20260327;
        b=haH74ukkWAa+T41ohoKe4SPooyVGW5m9tjCdezI2XzvFNFvYE5PptAyzIwibQUez0D
         iK2k9D/90t5qw3z1TCOrRWvJJAl/nbwic8Xqi2i7/zFxmBRUiysuAzJIGTCnRSqnXRXl
         t9+HJJzf4B4jydeqYcR3n7LqwTZbj3K8pIWAdiJzru30/cbrOQQoeQWM8LNsh2Dkelmf
         jZit1W433DvduYzbuyC6Enl9SJMnEQUx4Mdwc3liPiMrxdPvazlN95Y+CIcSqJm+WGgK
         uczdv+deeUwbQCDI8BT1MwWsFAAAtV4QIi+SOfzhJkMzZ4a0zCm1BjWUHObIP3CUIbmz
         1b2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=apsqo/umYNQ4NLY3kr6+1CRtc6C+cK0QqTdi+p9pSSQ=;
        fh=IB0Ozf5l3SuYxjARWpuzZwUS6zGU7W5t9FtxPcHfX80=;
        b=KHt4QnYSKcWX+cYoahrWbZxHya8wOyfRkRBeN3XmgeULaAKoYeZ6GpL+AzKJ55W7lL
         uDNdbuM+OuXF8aKc5GKv+9v24nXXS6truSUgpd9gd1GnyVYdiDqMViiNsQVV6rpu9GHD
         pQTcBZyr95nOO2MS0GOe27sMx2BN6Es8X1P3rtYkkbg4631NqLtxR32Q1+S6TK3YD8bv
         jiLOf8IE1w64UL8y30/7Do2inEbfcoEEo77S/jWAJaHYOburyYbeZT+7mE9SeVpjD6Y7
         RIKCBmR0XimlXGtCGohEMn0gkp7ykDQoAre54/D2Y7sYF6fW/diaCdbWd0cMJ8KtVGvq
         wMvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364628; x=1793969428; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=apsqo/umYNQ4NLY3kr6+1CRtc6C+cK0QqTdi+p9pSSQ=;
        b=Jj9wHGbo/QDEQzjCYIErEejQnWr2dSfwImTX+2pg7uc/ZobTx7hM5Wmeye4LaTU9Ov
         DrbBOAB06J4r3OQGWY0ocJgidwc8fVNk3FoYZh/3A4+lerqVPnmUOVeF6ebntdWgg0a6
         y2kgkoZmmg6lzF4GQQvUXYPwo46uNBXOCLWsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364628; x=1793969428;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=apsqo/umYNQ4NLY3kr6+1CRtc6C+cK0QqTdi+p9pSSQ=;
        b=kapOtGbBUrg7evb7By45fSUzJRp4bc0C3I2xUgn6BXvlL0pa8tFgepfv+NMlyDrnEB
         9BMf3QUSY1OdRvy9I35U0sHAc6CXmu0opn6gP8DR40Rggdn7YtmMOCvlzUTsHtkrFDCm
         04D0CGxP28G+RdvJkBPYMSY7buO7OH2ku7iBVaCDMuzG9gLSzJ0/j0SrXK2nYMicqDHS
         TmZ9ReDDESv3qwcSPG65XBa0SnuOwKG4vU1MF0bku8+KFjYFngNywlGcidOZZRQzXTz5
         TcLlWOV18onPIIsrsIRbZN7QfnOuCSwt6+2rwm7YgFyXRbExS8jQs9JTZSn8xbZM26Ww
         t9jQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+70oFwhGGjYJCuk0U+XA7AC767Pq6YaVIWC2FO9lcQkLMXVl6YOXOQ5BeEd8sBDys60w0mBF0tIAZRtE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcsqUaBeoyxYit7zwG8rdTUoT/CkM6bakNXb0AEZPau1vI5SRR
	S4uithLa2jVFefypYLPjYfMd94NI1Pe2Y5IBjpGP/gIjJxmABQBbsowSfFCpHLolorvXaG5WZFS
	hUF3QMDM9Rzc+ndfb+DJBuDFkM+U1Tuetw3QpgObC
X-Gm-Gg: AYBFou3eBmzxV6YEkdJFfpKrtTFs2uN5IamxdmlNVH4ponKYJ0EaWQR7K2rg6u7+too
	Zb2uYaGeVVH5/AnBvhxVAKgvi/X4pjKrVIF7nHcGUWr7R+sgOuD8Upx4YkT10zVenXd27UumqNb
	3x4RmQjtMqjhhnCf8va+/J/DlLEtHMworoOSinql4X9iT9vjRXH9d1nOapQ0VD2GrHtR0Xw2ojU
	bNzxCeLcd9lD5q1kRtCSE0ianG4WlpF6oy3c2TEBIiQc8RIYdDsSou18aF29+F0RMf/swzCE6us
	uNilIddUJxB435mxoGCQlskqeWLvTOb54UUK+DmNyW5JA7/RFW1ilD/rbi0Rrj0OJjDu4sa0LTw
	fPrc9gvQIjEGENQYd2B4qPmDSvh5SwzJp0xpZf3dhy7A8OubiBliWAKfoDhQ8PS9LSDsr/SZ+
X-Received: by 2002:aa7:df01:0:b0:6b4:2aa6:2c01 with SMTP id
 4fb4d7f45d1cf-6b4d4388aa5mr1133675a12.10.1793364627770; Fri, 30 Oct 2026
 05:50:27 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 07:50:26 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:39 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-7-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-7-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 07:50:26 -0500
X-Gm-Features: AclHuK8L6meqwjbfB-L4EcqmtNeCHqn056gMpoY369WMlqost4cGNB_3vwZ7Avo
Message-ID: <CAFLszThT8vt_C+UCbDXO=Yxx=zK04g+6efRb+Ji5MLyj53UCvA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] libfdt: overlay: Update base /__local_fixups__
 on apply
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
> libfdt: overlay: Update base /__local_fixups__ on apply
>
> When a base device tree is compiled with `dtc -L` (`--local-fixups`), it
> contains a root `/__local_fixups__` node recording the byte offsets of
> all phandle references in its properties.
>
> Previously, `fdt_overlay_apply()` updated the base tree's `/__symbols__`
> via `overlay_symbol_update()`, but left the base tree's
> `/__local_fixups__` untouched. As a result, applying an overlay to a

Please can you put the motivation first and use the present tense
('fdt_overlay_apply() updates /__symbols__ but leaves
/__local_fixups__ untouched...')? It would also help to say why anyone
needs an accurate /__local_fixups__ in the merged tree. Patch 8 gives
the reason (an OS that wants to know which cells hold phandles, and
the merged tree matching what 'dtc -L' produces), and that belongs
here, since this patch changes behaviour for every libfdt user.

> base tree with `/__local_fixups__` left `/__local_fixups__` missing the
> phandle references introduced by the overlay (both from the overlay's
> `/__local_fixups__` and from its resolved `/__fixups__`), and left stale
> offsets if the overlay overwrote a base property that previously had
> phandle references.
>
> Add `overlay_local_fixups_update()` to update the base tree's
> `/__local_fixups__` whenever `/__local_fixups__` is present in the base
> tree:
>
> - Remove pre-existing `/__local_fixups__` properties for any base
> [...]
>
>  libfdt/fdt_overlay.c | 621 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>  tests/run_tests.sh   |  19 ++
>  2 files changed, 636 insertions(+), 4 deletions(-)

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -1122,6 +1121,616 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> +		next_lf = fdt_subnode_offset_namelen(fdt, node, name, namelen);
> +		if (next_lf == -FDT_ERR_NOTFOUND && create) {
> +			char namebuf[256];
> +			int old_struct_size = fdt_size_dt_struct(fdt);
> +
> +			if ((size_t)namelen >= sizeof(namebuf))
> +				return -FDT_ERR_INTERNAL;

I can see why the copy is needed, since the name is in the same blob
and fdt_add_subnode_namelen() may move it. But libfdt has no limit on
node-name length, so a valid tree with a long name makes
fdt_overlay_apply() fail with -FDT_ERR_INTERNAL, which is meant for
libfdt bugs. It also puts 256 bytes on the stack in code that runs in
bootloaders. Please can you either avoid the copy (e.g. by re-reading
the name after the splice, adjusted by the delta) or at least return a
proper error code and document the limit?

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -1122,6 +1121,616 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> +		if (old_len % sizeof(uint32_t))
> +			return -FDT_ERR_BADSTRUCTURE;

-FDT_ERR_BADSTRUCTURE means the structure block is corrupt. Elsewhere
in this file (e.g. overlay_symbol_update()) a badly sized property
value gives -FDT_ERR_BADVALUE, and if the property came from the
overlay's /__local_fixups__, -FDT_ERR_BADOVERLAY fits better.

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -1122,6 +1121,616 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> +static int overlay_validate_local_fixups(const void *fdto, int ov_lf_root)
> +{
> +	int lf_frag;

Just to check, is this needed? overlay_update_local_references()
already walks the overlay's /__local_fixups__ against the overlay tree
from the root, returning -FDT_ERR_BADOVERLAY if a node is missing. So
by this point each /__local_fixups__/<frag>/__overlay__ is known to
have a matching /<frag>/__overlay__ in fdto. If I have that right,
this function and its call can go, which also helps with the size
issue below.

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -1162,6 +1771,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
> +	ret = overlay_local_fixups_update(fdt, fdto);
> +	if (ret)
> +		goto err;

One thing I'd like to check before this goes in.. this changes what an
exported function does. A base with /__local_fixups__ now needs more
free space (so it can hit -FDT_ERR_NOSPACE where it did not before),
and unrelated empty nodes under /__local_fixups__ get pruned. Please
can you update the fdt_overlay_apply() comment in libfdt.h to describe
the new behaviour?

Code size is also worth a look. With -Os, the fdt_overlay.c text grows
from 3040 to 4904 bytes on Thumb-2 and from 4770 to 7983 on x86_64,
about 60%. That code goes into things like U-Boot SPL, mostly for
boards whose base has no /__local_fixups__ at all. Could this be made
optional for size-sensitive users, or at least slimmed down? What do
you think?

Regards,
Simon
