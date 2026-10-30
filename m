Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364621;
	b=EItr1EjB1eXlbyCx2mik2Q0kjt44smq+Yg9nqxAcxDtxS5iAyEvR75QCGmwusSLxdHH0
	 rIE2laGfZTs78hO9Ar7gGAY9hAUQs+E35gL9j7yPFm0I/bI6cHm1ePcnfyJKn6pCdl2Bg
	 QxsP5Db7fFH+K8EsCLoBh3IU8Ip32jELFJKQImHLPDh6XK52ViiZk5ncIwUkJDFS3ZYjd
	 Cy6aTyaca5rAGMPmplkftka31fYPxxcAWM3rYeHbr0HreHERuzd6ZYpTfdtghC7lTvMuL
	 t/t/9CX9sHr8vxj3oFzXV27VTUyEF3V3bM+C4afkOra+N2Nk1JQHpboGan1NnHwcgLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/oUT2RdfqgwVw0znIAiPdb4nKDAF+jAJWkreAbJJFok=;
	b=WTMJoFMmbA/snxfrMIgvlMsK0lCG0LesF56MmilJMSZt7pyi1/2Wzim9HaPHk9YBWWa0
	 rnunFcl5jTem/sGKRmoGPwx6eg/hQaEAnh6gxdceYBiH1LKqPw/2FUlQmzi7pCCvLkNMe
	 q7WIsUZxLbIH1CyFVOlfdpLH4GVSjoUZBMiBIcjPjmVGgIyoBPc1UlL8TedUyxnsRpfXK
	 QJBgVhn/qJKVMjz9vPLHCuV9EZMRCkqLPjdP88nGUi1FMwUN4VpWH/1P0Aq3SezNva7ro
	 5JdPdzkTheQeBcLYdmwVaOHwYNC/z0nDJlSVAKb2MsK8WgRdKWsctClz9tV5gIhvxuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I+FofQtM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A2060A2605
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A2060A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I+FofQtM
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so983444a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364619; cv=none;
        d=google.com; s=arc-20260327;
        b=d8191xxZR4qiEv1otL0sbultn5ziji86BbgR0j2Efyghw6Fxh9sVTO7MlcMmQPqHxv
         sQK2DofDzdcbTPKbzm+CxzVI2Imu7ZS+BC7BNsjLLjZN7zsQ4FaDB44GfHqMOEXM/bRA
         cj1GmdXzlm93BnbMzpY5P/9r9iANJLm2RFu4mHRjli+uC7t7UzRHKJ9+aP8U24rt3354
         3qNsQMOEc/V6f6nGkz6NJsEJgOq8bzq6fU85kuSy6Qt3BiCClcEB8gd+LihHJ9IJ+bGS
         R6GFBTHUCwzL2nT5TcHMskoqDYRwBJDCLDyYnIvNt2MQdAFhOSSoniPGT9P9K6PcZqL2
         KjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=/oUT2RdfqgwVw0znIAiPdb4nKDAF+jAJWkreAbJJFok=;
        fh=RcyDUt3uxXKhIUy293uz4FdMsZyNu1k3L/J7+893i5A=;
        b=A/W9YnagwkivfADd5EOJvY6cOJ+SIu0InX+WIUArDPt2rXBwMJl453YIkeWAlTKD98
         dznDEGCGv+ly5AchLKUjzIiGNGdGn/RtdNR8IAVFtLkclSbVt/JMCBiGEExIZgxXRWwC
         AAURlR1O+G/GdLLiWYl8pi5jib6eZYVtzMucrNLXhVqgbz10VxVoBLeGt1h1J0NKMZd5
         eeWfQS8My0BRGnttQ5FHTbQwG2JKAUX6yXTaFaHsYc4PpF67tUuURrHvs8IntvhkTfPV
         nIKZoLLUuE0CaLhytz/wGb/y/BGrFztu8PLgDQ08Io8RSNIk50zX/xlhs9/rYzuQRcl2
         MAog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364619; x=1793969419; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/oUT2RdfqgwVw0znIAiPdb4nKDAF+jAJWkreAbJJFok=;
        b=I+FofQtMgQ77mXWxB9P/o6VaZ9SgiHlw2mJo1Z8Gd2VJCJnu/5P/qYzuhj2rvHc3JR
         xbssqvKBORNxgBuzCMdgiYBkjzq4/3nJCB9DGT1W+lLS9QJnLbiLMg0BVAgrFwDViq75
         cpahk7dhykQ0z20aHWKziR0mDsUMRAcg19ktU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364619; x=1793969419;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/oUT2RdfqgwVw0znIAiPdb4nKDAF+jAJWkreAbJJFok=;
        b=QaJ7Im0Tcm8aHncYSEfzvkqO2QTKxEMWd+8/7qFOe0VvziTryqc75NvI1Vc6yDhrwb
         kN9LbngZBX1B6Q/eXqWecvy8mTDQLfyYg+LZi1apwvNPWlmyUisdDTNkjdtLRlOupxpA
         mudTafxJEE7Ch4rvzHwa8IIlV/rp4elBDmEOJhAJN7QotCJ6Ez709jK8F/LrcDYUYlNl
         sKQC3TYY67CfxzbWdlhgoIgQOT0KvfCnKdh+gZZOCHdoZMjH20d8xdCW2z08PZlLcKQq
         lqNCQsQaDhNdydqGJIOce9K04V3bkId1W8u3IoJGxIe/67qogqxIbQbWRNGFDua4kLVZ
         1FdA==
X-Forwarded-Encrypted: i=1; AKwUvBz4aBG5JL9Cu9/PXM73gSpeBTNaMj3GpstB94/4LmU7CXx2d7M7UL9ZoTiBMPRijt50R2flbLEIL7WHZ/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOBOTQ0bD9tfKbkpuOafLe+IJAx6YWwuuq2cziYZPYMS/J31gH
	xMf5MWeTdoErF+ay/p32tuDN8iokP6mQSKNrrzaOmZde6BCLfzd705euthyoS1qG9KicOjv3oDw
	cvhkx0oCIIHOCjY/GOc6L6ls6JJzEbqWueMYgiS35
X-Gm-Gg: AYBFou2ekf/wop1nKjKfNKdlMjqdLJVWSLgYmsHb8IgP8sXqsYkml5bl8v8nFpi11vD
	IzpioNHUWmsBaWY+zFQUP0qWAQEf6sIGpBJEP79oNxgRHs0dsm/Rfs2hpd4P52UDWkWdK2/VzK6
	I/DZ475VXkwJEeQF6fm8NxEVXq5v0DJHmutMOfOiAbNFYzm4/kB3gmd2LwEeqC8z208uoLsQg6D
	M1494+M0Srd9rK1TdhVnv78zSg9URVZx701OcKqIivt20CGhYOnOLrPrn42GaaRpWozLR3jzCpm
	2Vq4mBhRGL/UgSVdgNHPBZn9E5GKI5qJQhpkpXWs1FsgymC0c9WQXflMhHgXPzTC9lGVatBV7jg
	JGihBBtna1Hb0kmkY/H8b/KbND+9pOMgoHEtvmVaTcotfLl4nQYBjlAjtU0TmTaF4ZXsQAW8=
X-Received: by 2002:a05:6402:13c2:b0:6b4:20bc:f97 with SMTP id
 4fb4d7f45d1cf-6b4d4687f36mr1456603a12.9.1793364618460; Fri, 30 Oct 2026
 05:50:18 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 07:50:17 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:39:24 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-3-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-3-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 07:50:17 -0500
X-Gm-Features: AclHuK-5haYO3nWpUT-6WoE1n_p6LXGTVa69dgoVQuwfItbU4Tna_j7nctRDCbI
Message-ID: <CAFLszThVtOwXJ4GKv5fFPGWGy7EL63JrEU=yhByUccW6Vkq+=A@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
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
> pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
>
> Add Pythonic iterator helpers on `FdtRo` to simplify walking nodes,
> properties, and memory reservation entries without manual offset loops
> or `-FDT_ERR_NOTFOUND` sentinel handling:
>
> - `subnodes(nodeoffset)`: yields the offset of each direct child subnode
>   of `nodeoffset`.
> - `properties(nodeoffset)`: yields a `Property` object for each property
>   of `nodeoffset`.
> - `get_mem_rsv_list()`: returns a list of `(address, size)` tuples for
>   all entries in the memory reservation block.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  pylibfdt/libfdt.i       | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/pylibfdt_tests.py | 18 ++++++++++++++++++
>  2 files changed, 63 insertions(+)

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -201,6 +201,23 @@ class FdtRo(object):
> +        soff = self.first_subnode(nodeoffset, quiet=QUIET_NOTFOUND)
> +        while soff >= 0:
> +            yield soff
> +            soff = self.next_subnode(soff, quiet=QUIET_NOTFOUND)

Since Fdt inherits this generator, a caller can easily write 'for off
in fdt.subnodes(0): fdt.del_node(off)' and get garbage, because the
offsets move under it. Since David has applied this, please can you
send a follow-up noting in the docstring (here and in properties())
that the tree must not be modified while iterating, as with
fdt_for_each_subnode() in C?

> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> @@ -243,6 +243,22 @@ class PyLibfdtBasicTests(unittest.TestCase):
> +        leaf = self.fdt.path_offset('/subnode@1/ss1')
> +        self.assertEqual(list(self.fdt.subnodes(leaf)), [])

The docstrings say both iterators raise FdtException for a bad offset,
but nothing tests that. A test that list(self.fdt.subnodes(-1)) and
list(self.fdt.properties(-1)) raise, perhaps alongside
testFirstNextSubnodeOffsetExceptions, would be good, perhaps in the
same follow-up. Since these are generators, the exception only appears
on the first next(), not when the method is called.

Reviewed-by: Simon Glass <sjg@chromium.org>
