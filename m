Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364628;
	b=Dr+UDZn5zdc97HwfYt9lCh0e0GedHkTf5wvIN0V6QM98YLSCFFxIg2dcK2BuC6ju9z5L
	 oo/uUWTFJfG76DaIBMSvmqrn25/2OxTpKzidM1tSXzequ/5u6lDmI5w/Kk17U3f4XIUwD
	 c4FqerC8g7zvcr0njkO0bFs+ZSWtI38UdMTJ0k04XMeNcw0ZlU278Y/f7gnmpw2M4gAGs
	 Cvl+OYi6UVlrprneswA0KPBXiYoR9LmjOghOkS7xQd2ze30JgDKFLCbNVTHcv8yhumA3P
	 P/IZa2ZLBG67M8rXj39e/yUisvFvMbmL6SJkw+lEzXBZfAFAi9vg4bHcTgd44qtYULg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MWgaFQdz84PZ77In42V5nEZI1f8wkYnG4LxFEebl6QI=;
	b=by9y9TsUXMv0903mIjwAc7x3k+Kxo9PteozBz0noEjcJ4Yfu9LTRguNV44o/Wp2psOcW
	 anZklKbjpNtnSmL2UCr7SyNBLxapegVlVrsxRqd+08KmAnnpWeQVNZ3J/pHu8E296yNo1
	 a/2nXNX1HWWl0SNdv+vyUAHIhmUtOExlq8sZ2EuD7LbR9Bnve+DT0dXcKxi6o51CmOucC
	 iPn3WIJ7j0KYePysRiSd2BWBfH62VSvgQsuejWSRzJ1e6QpkillmMNekorZ2nEIFyfffg
	 qZyfU1GwShCfzGjuLQAldhEGS3ruKWwP0Vyz1I7kkEA6ogC90+mbCOBGQI1GVNSkoqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y6yM4Ygh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4D860A2603
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4D860A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y6yM4Ygh
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so697966a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364626; cv=none;
        d=google.com; s=arc-20260327;
        b=oCkWFMndSaQN4nQksWZIPJBnL0ZMhHG8AVPvRXK4ciMmHQAXKDP5aW21XYHmOYDBz1
         NuWTwz3XEtqShh9K23UZH0tj6fNPkRYWqh4oGc8NWdVAaTtkDULvkm05uGax6sQTmXxw
         tKlnX9sPxY3nuQXzZgZ18+HuRgevrrIp90SI05+G3zc+4H2oNXcEnpUXHF+zxK+X3s3n
         C5E5NFDy/7aLkSV+AcIBSIhxURdZunwthC9T/ROO669lElNYqcWf9SFblzSf0gznIa1S
         Sp/0VRsLDoDmwZsj+vb5NzB80urdtXDp4+3Df/Low40GRbmHMrxlRhN84W6CACZEz2Ka
         ypwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=MWgaFQdz84PZ77In42V5nEZI1f8wkYnG4LxFEebl6QI=;
        fh=uLBwhfa6rVEagFTU0Lgq33MrmuI/w3Lsomgi+UToTu8=;
        b=F389YzRRp+R50XDhauoaWekeJwu8TJFdc9FYnvhoqKWEcT/nZGmKR2/f1/4T9sBofr
         NQ0m9+MMlPOZ8YE/EQ9XGBR+Wqr6PaTiJTA8hdX12nxhgrRnnFSE9higYwsa785FBDjv
         hzUMMAzO/HMmmg3b+tDyHuP9ab+ERXeiM1+n69jeRRfsBoWNNzkJ9AKKZ3KLhA2Vhri5
         asyqbUx39oVFpHQ7yUEy4c/1aJxJyGMdEqsop8q7IDsNF5KmSa3r6Z9xWXuXqa+czo5p
         4/f8DPPMv/9l7uHtO8aGXnuhxyxxFQ5xz+58SCXwoDd3d6FBq+mun4kqVApNhLRbIERA
         XGEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364626; x=1793969426; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MWgaFQdz84PZ77In42V5nEZI1f8wkYnG4LxFEebl6QI=;
        b=Y6yM4Ygh95EQyk7nS0DTpUwb4geT2z/o4OpZRImZB1ihU07qct1QP7RIZt/KzB2+lc
         PfU0ZeJULUrrU6qgoOqVglqXZYmvOtWZqUPWiwYXjPyeaJRZLs+ZCKdnun/XZ/D3Ey+q
         qET3qyABbYLuIr0PkeCYAzixw2sJPZ68ETzL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364626; x=1793969426;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MWgaFQdz84PZ77In42V5nEZI1f8wkYnG4LxFEebl6QI=;
        b=MyxB9P4yXI0TxV86HIIRFuKXGaP2z4q2O2MncaI4dK1U87uWYz1K/vir+wfV+JQ597
         9tesKasgB/4RXhLjBci/vZ1GiGWMRfpjAu0eQVC/J8FygcY5IbH5aNLH63YNwQuUx9eE
         Xf6bg7pDWoNCD0RnJfISAWicSLqF8XQHcuQhd++WT7fcaJiEcUoWDMuwtBTn30mJGJEH
         guVt9w5nBH/dS4abIRuxm1JPfzkPgfMjt2j+otiPYQ4Oo9yNeRv4BhcBAUOzxNR5BvJm
         n8tB6hvDT9VB36ZJyRKe0wER6REjDtqZfGojASKZoIhtFhE8Q8Q8h2HsYZS24QfBkw2y
         ErCw==
X-Forwarded-Encrypted: i=1; AKwUvByRV0iG26BTmYdfEXt8ywRoeKZ1RVu25t76jelEF9RvPZU/6F0i6L25POhFRfuczQQMuRIbb+FFuLXTIXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoRqS43fAQDoOblIcXwR/tvRLM7AKIA8YSQPnyZg/2/cqDAPIi
	lUI5bxtjnnyEbPPiCnxF+vroPpxOWKCpNfu6fS3ZzZC8B39MGPIB6YdWSpa0GOm53pydZ74FnkX
	ergFx14zD4ePofT1KljJp5Ks+B2P1XzxXFYz3dwEq
X-Gm-Gg: AYBFou2R7TLWVpJwm7vBnR+HxiyJbxBF11m7r/ZvMYWkdqcfeSsHZXEQuYLNlz9CP4U
	N5yCF2zEGPsj424R2ZCcJkJ6cAaasc+T3cRotqexDvy42PV3QSnOPeU4HBgzY5eKeNSEqNhR2Tp
	GlpDeOtHN4Wt5pXku28B2VWrOudOss3lW6uw7zVTBJafs46REW+4tFaTOg5CRDPeEV0+KZqeguM
	Zhq8Ip0kGuipwF/LHDYrTev3OMUky9BCNY19V3/1h+fUvZ5QcJTHZ+tCRhXrUWp2BwkFIkX24Gp
	somLc9cM1e9f0ZUUsva7Rs1S8AY11wNG+nwO5Hlt1MNW4VklPhgUy/IeUJpxi6s0cYhHzpOe8A+
	mM8G9vzGpB3XwqhN/RrRNcbwYDh40UyWjJYRK47M7dcUuhIlU3DZnrjQ+R91dwyNLxM2yMqM=
X-Received: by 2002:a17:906:9fd0:b0:c46:74f6:e149 with SMTP id
 a640c23a62f3a-c4ca7a54f72mr199779866b.16.1793364626163; Fri, 30 Oct 2026
 05:50:26 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:23 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:42:20 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-6-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-6-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:23 -0700
X-Gm-Features: AclHuK-zd-T9RiVPbSUhy4wWMPK5g5MD6u57BPXZqy6Kk8GLjau3Um9JLEY-wic
Message-ID: <CAFLszTjbOnchP71O98H9zTMiPar33Fpxj47uhdTLY_dCegEpmw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment path
 helpers for reuse
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
> libfdt: overlay: Prepare fixup and fragment path helpers for reuse
>
> Clean up `overlay_parse_fixup_entry()` and generalize
> `overlay_split_fragment_path()` in `libfdt/fdt_overlay.c` so both can be
> reused when updating `/__local_fixups__`:
>
> - Change `poffset` from `int` to `uint32_t` in
>   `overlay_fixup_one_phandle()`, `overlay_parse_fixup_entry()`, and
>   `overlay_fixup_phandle()`, and parse into `unsigned long` before
>   validating the range.
> - Require `*(sep + 1)` to be an ASCII digit (`'0'..'9'`) and bound
>   `poffset` to `INT32_MAX - sizeof(uint32_t)` so negative strings (such
>   as `"-4"`), leading whitespace, or large values cannot silently
>   truncate or wrap around in `fdt_setprop_inplace_namelen_partial()`.

This is more than a clean-up: it fixes an existing out-of-bounds write
in fdt_overlay_apply(). With a /__fixups__ entry like
'/fragment@0/__overlay__/node:prop:-4', strtoul() gives -4 as an int,
which reaches fdt_setprop_inplace_namelen_partial() as idx =
0xfffffffc. Then 'len + idx' wraps to 0, the 'proplen < len + idx'
check passes and memcpy() writes 4 bytes before the property value. On
64-bit, '4294967292' does the same. Overlays may well be untrusted, so
please can you split this into its own patch at the start of the
series, with a commit message that starts with the problem so it
doesn't get lost under 'Prepare ... for reuse'?

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -398,15 +398,17 @@ static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
> +	if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
> +		return -FDT_ERR_BADOVERLAY;
>  	poffset = strtoul(sep + 1, &endptr, 10);
> -	if ((*endptr != '\0') || (endptr <= (sep + 1)))
> +	if ((*endptr != '\0') || (poffset > (INT32_MAX - sizeof(uint32_t))))
>  		return -FDT_ERR_BADOVERLAY;

The real cause is the wrapping check in
fdt_setprop_inplace_namelen_partial(). That function is public, so any
caller passing a large idx hits the same overflow. I suggest fixing it
there with something like:

    if (idx > (unsigned)proplen || (unsigned)len > (unsigned)proplen - idx)
        return -FDT_ERR_NOSPACE;

and keeping the digit check here so that '+4' and ' 4' are still
rejected. The INT32_MAX bound then becomes an early rejection rather
than what keeps memory safe. What do you think?

A test in tests/ checking that fdt_overlay_apply() returns
-FDT_ERR_BADOVERLAY for an overlay with a negative or oversized fixup
offset would also be good.

> - Drop the redundant `*sep != ':'` checks after `memchr(..., ':', ...)`.
> - Generalize `overlay_split_fragment_path()` to accept a length-bounded
>   `path` slice that is not necessarily NUL-terminated (using `memchr()`
>   instead of `strchr()`, and keeping the NUL-terminated property check
>   in `overlay_symbol_update()`) so it can also split `:`-delimited paths
>   from `/__fixups__`.
> [...]
>
>  libfdt/fdt_overlay.c | 46 ++++++++++++++++++++++----------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)

Regards,
Simon
