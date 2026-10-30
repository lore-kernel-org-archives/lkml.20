Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364622;
	b=Z34tV5YWYLgsaTFJkAgwn1M5HI2uqQjE9rVXd08xfpnL1ZO1eWpzgDedAg4hYU3vp7Gb
	 s9EU3HakjbeG2PatU2HVVsXO9+RiNSMZpSPA0SkjArlyyZ22z//2m8sRO7CTCnJi96QJm
	 haLY880o+B5BE8WKvEzo9b7VSZLwPe7jSznSKggthJCtHMQyYu+3ivqIUHHXo1yfGD23d
	 RcvItEBrIasVnmr0/x5yUnTW80Ph1yC8y+DNo/eDfMgECTsVMt/6VXjOSorK7NVoH6rIM
	 Ge7byJZbG0AeaIcqMVp/1bvkBOP9uD8A8FI0a0gHl3ktI6anwAMT+exWTb8OCM3t0rQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=t8bRsjAT3AdjzhLPogNnMwZmSFERnjnulF5It7XvgSQ=;
	b=Jtooy2OT78YtoSt90XlJicgRYzA9uoY6nZOFSHKHDELWXjlI86/HWBhURk5ZdLLJL3qS
	 bTySDWs1b+GpkHfNPo9VN6Yb+OsNsSb8dBKDgrZWDF77TXT6AmKCqCl7+lYAN2Tbk4rPJ
	 nmcTRgR3NTDRSsWRD/nZYJ7mg0nLoXPsHm98gNfpun9aSYNXVR3jG8PQflWA9OXHKc1pX
	 fWRfV+93kXNg91MWindcRV8m8arfNWqI61iyH5Yx4zIcrl36U/qn0roxTC5hx2plrIAaK
	 +CRCSBKIvthyioFA4i1G/1Gv0IlVTx3Znwk6GXDR+UsVRvsgGTGcW9sBua2Gm8CLelA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QHrlIIjP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCAB606A335
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BCAB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QHrlIIjP
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso854909a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364621; cv=none;
        d=google.com; s=arc-20260327;
        b=SQn3IImAmaR/O4R1Bm3eoQKeFUS8uTgqE7lT3HOL+jAbJc5tN+/x4u8khHwczfOyw8
         rwpAnK3YAoeHaz2PHn8BUpQaFoI643gIm3OZ3rABr3yZx1cOvk9eIjmcsBJp8RUJPbEE
         Ei+kEt/SvbWVXYZMVZ+deJy0j4vy35idsb+gVFihRrRlFV8oLFXhPHxBugfrcCj/x0hR
         BvFQIVXP45p8+uPJQd/Y0TOvdWX+wL25/6B0Wdlsu91YpOxNGaeawkzRjdt2KIRPmz8s
         o+mQU/sa3II7KhfZcO/eBzvwt9HfDWH0Ojj0ZXo+GbkdApcWsXUQRAYfG3ZlaE/ynPxt
         VBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=t8bRsjAT3AdjzhLPogNnMwZmSFERnjnulF5It7XvgSQ=;
        fh=1xFuZvY54nUrTqgumFulq8mm2KTvuLF3p7LQFiE5rUc=;
        b=J53Dn061wy/RFFLBpbG5HpVnnOPNM+wHrlYv2TeJa9VaqF+u+AbTRGQJfHsmfLgAoK
         crn4iU7HL85YDo3Z0gYZc1ES0H6SeVNFYiDuD0n6x1U6bR3iWTvVTEDy84oP/w4QOWF1
         Rln6R4KuE6UibZjXc37N+CruBtURmf2CxrVXTEV4BIl87iClNeCdahm1dTlcpHqHCVmi
         Kq9hsMuaHdtI94Zc2xfDkcb4vft7S3uXgRSZ040CU8daXUMrds9yUaaiSYhLIaFDJXb5
         WpVVIWe3J5CScdUhkvJ1Uheqr6qHfPOkEQ266mScgKZWAvc5laScTKNI1vqeoecjmd92
         x0Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364621; x=1793969421; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t8bRsjAT3AdjzhLPogNnMwZmSFERnjnulF5It7XvgSQ=;
        b=QHrlIIjPYRpyvppFPBu8+5vfCTAFEeBT02gaKSYxL7dgK8lo4tdAzO7fwvBEqG99z1
         XgorNXrxNiIcXvim5XZdlbG86BCc2jiApMfdqY6bN8FzNmjqQgEWd3DO3w+vc6ZLMXsi
         8BYhGzf+Fv27F3YR6Y+2yrh/QYWKVzIsoHOgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364621; x=1793969421;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t8bRsjAT3AdjzhLPogNnMwZmSFERnjnulF5It7XvgSQ=;
        b=CfECAYQxZX8hxs71Ize5hpNlNffRBEWkvl/o5rGnZbvzUep8bxs55R2AJ43abiUBuL
         8MGMIGTam+4F+vOckJaVYKxX/OVwNdHhVcz02kqOr+IiZY/UzOpzJJfJGcwtvAnhntn2
         v3J1WisGqOVB6HspQeBlsJVyOnRkK7gr3H1EY71OQIHZ0psYWSqsY3+Fq4T68heaEcZW
         IIFQPqMcEaXmFCc3M1N3FdronEXPT1+UYAbMrqYFRv7Rw93owbWSQq8FM8/Kj/7yR9/O
         4S9pLwbWFPEgc+OJeKLfP5ozgU0MS9QAjFt66hs75xKpbOoVeP6ARfQYTE/DvPSoyZg+
         N/Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwQWwcJ5tjQ0qG6xQoWYTavrWR7PLw99yocgQirKU4Jx+KN/kQM1WfeuHKZiX7vyvhb2foVbhkX8gSaw2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1sWiqUJCySlp74QSrDxK8QbK2jqQKYzvcv4u1Tg/+V6Vyflh/
	bd63FQyQeUa8fPFLfa4Rnoh4Ff45w4a/v5FdzcZYKCJNT3FNY/UCW7mw176uJs02eQNnETfVUGL
	jU7gM7gHRWBfMVwnGzqUOeQCEdOS/LyOdDCX2TTif
X-Gm-Gg: AYBFou1j/ZTmiJFOgdGy4ae8j9ezVJOaVgkjlzeBnGwMULRe4l2w5h99/WeTYF3mLKI
	R6TO+V3ogAf3L4vww9P4RXQPgKgsBLx9gXjZiDGFBhc9jbpgvKwANj2JinjltLLBiICKCP1pDGR
	FzcL7QxFQOWSdaMSuRqHOvCJIvp5l8yoV1m8p0khhFPtIP2Z3ePJmwJpUdwV6MaK95r6dBeujxy
	zsNnm7oE2knWBkuvPcUbMCqzKqyo8TxgCMJMjmJZvAVvxpDFm1COqf4zppr6Aw1wte4mFRbWm8x
	ApRKAXlLTKZp2UUm0md+5GnHsRM0tuILOSTNJ0SeQEZBW6MbJZNRvJbmFdOPqkfAORlYE6y7cjq
	RN70tBgP5Vgd81nH+AynDquukLvf2WdFQOAS9Av3HWUfYHUQyP0U9mQMJuzLTi9RCXytNtLU=
X-Received: by 2002:a17:907:2d24:b0:c2d:bc33:7be3 with SMTP id
 a640c23a62f3a-c4ca7b804abmr217479166b.47.1793364620924; Fri, 30 Oct 2026
 05:50:20 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:18 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:39:26 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-4-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-4-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:18 -0700
X-Gm-Features: AclHuK9XH5inA75nLtEVNACEt-kvj5ilQrhpx6qKrKd1EbyJPnQrCjVXnDxbS0A
Message-ID: <CAFLszTh+c8H6Xcz0LXGjO40XA4=y0jdyAFUr6ygc2OkS9GrHYg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pylibfdt: Add NodeTree live tree representation
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
> pylibfdt: Add NodeTree live tree representation
>
> Add `NodeTree`, an in-memory live tree representation of a devicetree
> node and its subtree, to `pylibfdt`:
>
> - `NodeTree.unflatten(fdt, offset=0)` builds a `NodeTree` hierarchy from
>   an `FdtRo` instance.
> - `NodeTree.flatten(mem_rsv=(), boot_cpuid_phys=0)` serializes a root
>   `NodeTree` back into a packed FDT blob via `FdtSw`.
> - `get_node()`, `create_path()`, and `walk()` provide path lookup,
>   intermediate node creation, and pre-order traversal.
> - `get_str()`, `set_str()`, `get_stringlist()`, `set_stringlist()`,
>   `get_u32()`, `set_u32()`, `get_u32_list()`, and `set_u32_list()`
>   provide typed property access and mutation (updating
>   `Property.as_str()` and `Property.as_stringlist()` so empty `b''`
>   properties raise `ValueError` or return `[]` rather than
>   `IndexError`).
>
> Add unit tests in `tests/pylibfdt_tests.py` covering `NodeTree`
> unflatten/flatten round-tripping and helper methods.
> [...]
>
>  pylibfdt/libfdt.i       | 262 +++++++++++++++++++++++++++++++++++++++++++++++-
>  tests/pylibfdt_tests.py |  54 ++++++++++
>  2 files changed, 315 insertions(+), 1 deletion(-)

> provide typed property access and mutation (updating
> `Property.as_str()` and `Property.as_stringlist()` so empty `b''`
> properties raise `ValueError` or return `[]` rather than
> `IndexError`).

When you split this out (as David suggests), please can you add tests
that call Property directly rather than only going through NodeTree?

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -1210,6 +1212,264 @@ class NodeAdder():
> +        node = cls()
> +        for prop in fdt.properties(offset):
> +            node.props[prop.name] = bytes(prop)
> +        for suboff in fdt.subnodes(offset):
> +            node.children[fdt.get_name(suboff)] = cls.unflatten(fdt, suboff)
> +        return node

If a blob has two sibling nodes (or two properties) with the same
name, one is silently dropped. I checked with FdtSw: with two 'a'
subnodes under the root, only the second survives. libfdt does not
reject such blobs and fdtfactor reads input it does not control, so I
think it is better to raise ValueError here than to quietly throw data
away.

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -1210,6 +1212,264 @@ class NodeAdder():
> +        self._flatten_subtree(sw, '')
> +        fdt = sw.as_fdt()
> +        fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
> +        fdt.pack()

This reaches into fdt._fdt and calls the raw SWIG function. It would
be worth adding Fdt.set_boot_cpuid_phys() to go with the existing
FdtRo.boot_cpuid_phys(), and calling that instead.

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -1210,6 +1212,264 @@ class NodeAdder():
> +class NodeTree:
> +    """In-memory live tree representation of a devicetree node and its subtree.
> +
> +    Attributes:
> +        props: Dict mapping property name (str) to raw property value (bytes).
> +        children: Dict mapping child node name (str) to child NodeTree.
> +    """

BTW in patch 7, fdtfactor adds 'phandle' and 'fixups' attributes to
NodeTree objects on the fly, so they carry attributes the class does
not declare. Since unflatten() uses cls and create_path() uses
type(self), subclassing already works, so a small subclass in
fdtfactor declaring these two attributes would be cleaner. What do you
think?

Regards,
Simon
