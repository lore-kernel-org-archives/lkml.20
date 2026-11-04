Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805252;
	b=Ia2/Yu9Y+Em92DDc/6TuBJMIktGirUnI8eHknl7ymFvoXwlqFd1nUnHD45c49ieZQz8A
	 23/oRVEWauYpMRe5p1gS9/Z0DoGn+sOfthHDj32DqpG8xowtCkS2oskpiyoiJu0KBksA9
	 FTtRuYe5nGCHJ9gKFn4s9ZGIlTt7FHszoXfFtA2p7KKRTpwPy+E3xwybqIu2p654F/GnH
	 dVmLL6ikkoWGO6eXpMIhGOU4eCrmFz3jy1vGmuKwZ5B16ySJJb6iq4q1vZBMBWWsC3WMm
	 im/tGQsoYcXTq2NgDL7V6xxDTWlz7eiraoUVt9VOzrQpv4tDQFbV8MN+Afnqd1MJwog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SZqVUJKXtA94P6bTEy16aUk/m/u6t0bulNqJn68FpE8=;
	b=QX9j/6mcmBpjjiVdvmKwXTWbWSDz33fr+WMYAu+yDmnM4BTOzee1kb8MOyTFaNmJeGwa
	 QvZ+9N/QFO0pGNhQWXhu81iv6Kb2JD82bTbAGmpGAob8bR9GVp4zultpfsC20uSUAgpRZ
	 pDntcUZ/cONsfCNgi+wGOdxJK5TGRBGrBSIoJbQz+Py4xKSnpugZIjSM4mJ9FFp2cOXjD
	 2GncBTtPyxrU2IJaLmROv64m3hLrq6JbiuF0WF+E76nNXBzI9NW9FR9dML9LsMS8EJnEB
	 J81PseIdqUXAJ7glH2gRJI/pBkW3YMmaWcW0jEGSlfJX0yRSjYlzKGfX6p+I8CWwyrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY6uYD1v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C60606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C60606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY6uYD1v
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so991268a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805251; cv=none;
        d=google.com; s=arc-20260327;
        b=BtXMA9VR1gdgsqEbVIWhBD0ZdIHCu7u0pwYWuSjRO3x1Run950UcAX1KvnraSTFrdN
         i6KMPPwfiNEwNGrXlYrxzfvub+NvXE+jtrHxxUgptP2YGyIVzucRwGsDMs1ziAWsEP1o
         FbKNHvDABWwrbMqFGgFD9rcyIEyOfsEgY30YQP38sCxsHEjnGw47wgnVOqTxVNwPYIXG
         0WJX1DypU5SeHbZVU3Fr2cSz2mZ04d2T51Z6lKIKnSW0nWI5z7+VxY9LL4L8Km1cf27a
         J5H4y0+PipK/wRMVLOLBEpT90BJYqilyXtejTi6pzefDUH1iTssMvEyNSlEoQI931x6s
         AWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=SZqVUJKXtA94P6bTEy16aUk/m/u6t0bulNqJn68FpE8=;
        fh=lfrunzIIVS4VAcbXFQhUu2Ml6EIig3qYpahmOz/u6tY=;
        b=Oyhaov1pHG9WnstWzxCU/3qfPCCX1ldJCVGOorX/FAdLd6Hz8BvDEJyX70+toenHxq
         3U1IaUZVCDd9W8q1F5qgZAf7nfsMaz4B8LJ1ABpX+3pNSuoryQyQ1Xd1heInJdPzvgzm
         ne7SwowreZXA0hg8OUsVkGwjDO6LEXH6+cQ/HBgYAmCMiOcAjoP3kiLcyk4tGcg5YAHy
         o2iYvoN6WHIGxexy46ymmriZmX7p1IFglCjSv/2pmxudfEFbLUqH6a8qn2hfNKs/FmTH
         78cfTNZKw8LvxswsX7ZQJ84tYvqP74W3zJHywiLFZekqfEWICNSYiVZ+J6KkCdALJAey
         0NEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805251; x=1794410051; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SZqVUJKXtA94P6bTEy16aUk/m/u6t0bulNqJn68FpE8=;
        b=HY6uYD1vf1uwS1oAykVnBMNefRlP9SRKy456fmWRVAduc0eIIowekPG6VSP+JdjZcB
         ofR2EZhvXZHo26kwsW2BTRqutYdKn0s2Mr6m6weOsEPyESVciF0qr21lRucAfrDmqg4V
         80AgomVczOt1SIo5GXdz3iKJqUbsqAwgFMKXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805251; x=1794410051;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SZqVUJKXtA94P6bTEy16aUk/m/u6t0bulNqJn68FpE8=;
        b=UNw6ea2NOYPLfyqzo7fdL2j387gg55XmhF4JWjRwjOMaEYDHNGsoTotX5rxXu9cqig
         eEIxagyv8YZ8u7vQ6ytVPqu6loiPOhI/BJQU2lVktkuzhew2auGbUXyDhrdY09fXJlki
         cG+N45CBp0eZVZSOrWsrcOogp800pYHk9ndPQWXwFiV7aeXmUuLvJHneCsLVl5VizXwu
         aQ4axBGNItrcV9lbcuSyX3cM0cMNFYUvQxbkp8ZSeCyiPJ7dRYmjiUZcQgwR45vauKjr
         QPCJfeGt8EcbNqkghCRnzc8XRFjKB0QbPOa62eGkHKlLJAs0whI2DJglPZ7lesvnj/3W
         xAyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlZNe45I2esjL8WSyXWUCbFjM4GhfxoPJWk2MYiuDrZXLGXnIgu6hlC6pq+cBmHHkNpMQ+gf/Unwkj9No=@vger.kernel.org
X-Gm-Message-State: APuU4Z81y/rv2vLOkdUOETKcvmGJvu7ryJfNkA1iM469xrcCnw9UOxMb
	TUCGKlUc+oRPA5a4Miqu/dgxisYo7JJHKeeXUY9NVqcXwQpsy+AXzL+COwNp+bj6HwhPLSYy4kq
	76bXvZvB8NEF8q7YnxGS40sTWtnOGpn3CJaw4KhUC
X-Gm-Gg: AYBFou2ugb7y5BUTNtQz/JW5L9BSH8Qw+W/VYz45JlA0L7+Xr8NqOUyHft2/zRL8O4s
	RrEhIqG1AiXAnJFIlPgIwy0qoEejvTQbFak4cpKX8JvhsfppWtNG8UOa6rNH5jVBd/5f6zgVqSy
	yzUZoZkirIHJ1Th8MHCu4SrVCrW/oh1VlJAFAebFJ63lcti27L4uGsYBxRrI/98hdzD9j9qgY8y
	T5C+aaqW4zEgKR4PVadvWkCvIWZ0L+DiTvvcI8o/iOpvcWA5mHxo4WvHUe7vevDfOX9fTBEgTso
	7+s3oRKkyIlhe4nr3ri1xHHxppXvZKzwTaEIDKWK9nfzIIFvr0lHcykHedPHz20pNgxjCErewqt
	EZCTHk9Q46cfqDKWMUIDbtNrt3gXmyzvT9ezCfo/oVFv+xz0aO+9t6D+XSTaFKNtNVrp/dfM=
X-Received: by 2002:a05:6402:1ecf:b0:6b4:be8c:325b with SMTP id
 4fb4d7f45d1cf-6b4d3285c72mr12781754a12.0.1793805250703; Wed, 04 Nov 2026
 07:14:10 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:09 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 08:58:47 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-8-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-8-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:09 -0800
X-Gm-Features: AclHuK8zRxeH5csXFpoD2u-FiyL3vbkKclLgEtNnscyWzGd1u0WrvcYL68ykwns
Message-ID: <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
> devicetree: Add DeviceTree live tree representation
>
> Add `devicetree.py` providing `DeviceTree`, a non-flattened in-memory
> representation of a devicetree node and its subtree:

Please can you start with the motivation, i.e. why a live tree is
needed and what will use it? The list below mostly repeats the
docstrings.

>
> - `DeviceTree.unflatten(fdt, offset=0)` builds a `DeviceTree` hierarchy
>   from an `FdtRo` instance, storing `libfdt.Property` instances in
>   `self.props` and raising `ValueError` if duplicate property or sibling
>   subnode names are encountered.
> - `DeviceTree.flatten(mem_rsv=(), boot_cpuid_phys=0)` serializes a root
>   `DeviceTree` back into a packed `libfdt.Fdt` object via `FdtSw`.
> - `get_node()`, `create_path()`, and `walk()` provide path lookup,
>   intermediate node creation, and pre-order traversal.
> - `get_str()`, `set_str()`, `get_stringlist()`, `set_stringlist()`,
>   `get_u32()`, `set_u32()`, `get_u32_list()`, and `set_u32_list()`
>   provide typed property access and mutation.
>
> Add unit tests in `tests/pylibfdt_tests.py` covering `DeviceTree`
> unflatten/flatten round-tripping, duplicate name rejection, and helper
> methods.
> [...]
>
>  devicetree.py           | 276 ++++++++++++++++++++++++++++++++++++++++++++++++
>  meson.build             |   1 +
>  tests/meson.build       |   2 +-
>  tests/pylibfdt_tests.py |  77 ++++++++++++++
>  4 files changed, 355 insertions(+), 1 deletion(-)

> diff --git a/meson.build b/meson.build
> @@ -125,6 +125,7 @@ endforeach
> +  py.install_sources('devicetree.py')

I'd forgotten about this but PyPI has Zephyr's python-devicetree
[1][2], which installs a top-level 'devicetree' package.

I'm not sure what to suggest. Would libfdt_devicetree be too awful?

[1] https://github.com/zephyrproject-rtos/python-devicetree
[2] https://pypi.org/project/devicetree/

> diff --git a/devicetree.py b/devicetree.py
> @@ -0,0 +1,276 @@
> +        for suboff in fdt.subnodes(offset):
> +            subname = fdt.get_name(suboff)

We should try to stop on a corrupt tree - so I think this needs error-checking.

Regards,
Simon
