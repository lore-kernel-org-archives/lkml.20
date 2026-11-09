Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794233680;
	b=PqBfMz7D/8+udtNYlc2/aspAJJNM832gsfDiY5jFKtDK9CsjiaxLsgyCfD0N6VuJ0A4J
	 dWwGG8sakWXURpRaLHPFVsJYbtfsW0grC8rxoWH/WKT8Z5H1zA2arycGeQgcEIAgI+JQY
	 oAbhgsfzVGvd5Zp+GwWO09yBzdIpxvULK31J9F4xgfqBEdr6x0dGj4dTPem5CXUkUj+8j
	 pWCFYV/mb72J5kMvVOwtA9GBq9ZtQbcvlv3qzEH8tR101wcWE8RokxhAJeZEC/Oq0X1sl
	 b6AqpiUxNRtiOHj+EaRyPHbQ0dnm5+qBfR1QjdvczqsyLyrzgQ03oMAqjwrHfmCL9Vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C9mUjzXalHv94qx96P0J3reYmh+gRnmsVzt8eaOGm78=;
	b=yUgMCzPpycSx2RQsUl/pGut2o6CdjvfLxw6c1FdDDs41AJ8Ay9sPUoiwZunfMDa+mseJ
	 LOuNi7n+3tNTOx4iOv5CfT7yNymrlynPBCnw0G9sQl0X3o6WblIDRfEBH1LSlPCExkWof
	 jwjilrUy9ln2UplqV++/8u64mmyjTyS5sJ7w5REQ4pXo1uEHFsdwyN5ndTFk4FvUOYVti
	 MTEjz/fdz/bLNouxySpDTaNsfxyaONQCd63T3ZgCC3PSNZeY69F2vPxT3/3hoMh942VPj
	 7Wh681cXQmtM8fWn0jcRC7OHY/QoLK3dtT8VcN7jqijMsA3OGynIoF/BrOhB6pzvKCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W1FZi+2c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177CB606A339
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 177CB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W1FZi+2c
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso293634e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:14:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794233679; cv=none;
        d=google.com; s=arc-20260327;
        b=YYRjxN4ZWIZkmY3Pr/gRz20xLdHKAa04I4EvKfIwM4euazZMYHVtx0sm3rhLMB4OS0
         xGuzNElk6Ey+NamYgrJMHisToRLkfhEQKVQ8YF5Om4lhhzAFH2KAZEjKSNccnBh+VzV6
         8wvv/xsWdLQrqwgQ7fJ+V337KQuE9X9Hx9Vqzb4Yy6Z8ZGW6y/S6BmGbpOjK8f3ehJvm
         VllZZDYyh8SjxMla05JOUvPYnMmYJ4qiXLgC0Qs8kNmrsjI4YvYg3uODE1ml/PACm3/h
         B4EGvh4Lfz1BAMkGO9N+DmD5utosAZHHKbzFz8+CqXWGeglZP39pFApmPEYmdb1DzpRI
         6Pcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C9mUjzXalHv94qx96P0J3reYmh+gRnmsVzt8eaOGm78=;
        fh=4uoyUSYJaGX2QvUmdrNaHgkGyYskCXOpSXBjU38CQNQ=;
        b=eVjo+mES1oZPBM8CpPsfQMgB38KEFsty3hAtvMzIX9cKmW5gPQKqA1F3lGCeSzJcDS
         U/KlJNbzjJVCY/RqbsW/4bxij2mEyh1C0uAd4sbO2mqTa4OVKdqXA6Da2tWNVa/n4Vye
         3MTJMf+SzdHQcfBInjlCocM2MALDI3+Li1yfTf3VetUY+/6tbVbKkieXOHv3Ami8Hd53
         gi8fA8b922Oxe08rafRUB8NWb5g3OvPy58CpAZxsD2cx4AWq7HATgWIhEpUCz+kVKMB6
         8SLecSw8CWPRwJFcF0J5iJMuvyFn+PSbkblGlAnnrgOBOKb6UWcq84ueNN8kO1+6YwJH
         NGpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794233679; x=1794838479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C9mUjzXalHv94qx96P0J3reYmh+gRnmsVzt8eaOGm78=;
        b=W1FZi+2cjuJ/Pd5UY7IKO1Q2TxqG6+Wimax/h1l7sNRrlCVEqwNPHbl8D/GreBLxU6
         /v9GOPr60u+hW2mo9LBUmFNVLSUC4tKj0E3UCldtVynb3rtpfoImhFCbCJJCCFSvaNCm
         3ycJwOCfXjuy35io4Y5gAXXa+/DH1w6XAgtTqbNrLuOlrwxy023k/ZG2GgIYD6jjxmfh
         9d43WO+UNJ2n4dyEqsQlcDCt5CPhTISBP0G+J9HpaI58Drjw9tHvPX7zzGNETTF+FZPR
         5PVnzRi+Id6uR9XjSfimvZDbqFIB2/jgvV0Dfd+sZRAh35KWVtWjPJIY1spbfSkcqJFb
         Jrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233679; x=1794838479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9mUjzXalHv94qx96P0J3reYmh+gRnmsVzt8eaOGm78=;
        b=FOma9dxne7HQXHCeYw/Glu5eFXYdtSt7IVbBUDIwEc23xANO1jbKUa4XyORNhtrQ0q
         h6iB++DOh0HzWMNaMPEx/eiMJQ49MPeezoLhEg3E/XrAqBOo/c30H028IpwYP21VOgeq
         erJI7Pze51FWvBSXp6LE3B4uUZWgVl9AxDE9NC5E3OUXoZw51yg1KkY7hNLrVs9FfqGV
         wsjzEtn4l/Z9cojIX/0QGRmnoJbUJgO+7OhjWaqUJcF+MyzfH/vdMVAro5cNz/4KVaaT
         RzO4nccMgpDLuvNV5wL+yhRck4cTI7JMCfm1cElt3sEAO30gVMEnGVBHbbAZZfRL4qOT
         BU/w==
X-Forwarded-Encrypted: i=1; AL+hErGeRzeLi08OXjb8Wk5jmHyA5Xb5V7z2A03tBufmBvrk+IfZI+NBBADzdR53spMBLdFStvVapC6EzyFqq4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iVi4fmTAh6zraWxdHwP+L+MnH8CHkjGvGVz8bmm0ITgJiZqW8
	TvvyAwF+2BlvdLKMZ7nl8PegFM/WlnW+/ZE4socyaee5yOvkrjpdRPwroMCCMPxxJuF5gWiN2xb
	RsuMrodNe3NCjGaZI51LS0ErhQw35XEzNDI/mwpE=
X-Gm-Gg: AYBFou2wOaWA4ldMcKAp5lrhzG80CavTE7gr1TCooWJ50/UgTO1OQvheElyQYRYGxwL
	z6VPkxSveCoUT9dwAGMRnBGQhQI9O3bqMtEoVzd2cUDJPrJmkBIZsrOnqhLxihL6wyZPss4IOAj
	xRdVpAlw/gklTm69CYg6wE1k4SkY/x2au6PKVPhhsDL8VcsxtSTZg+g/Obm9A6kBCqqeTOmhM0o
	abQweXeMuy1CV7WNxjtTJYLiJKavjJKYJ6f5a8DPEPgGwMyLNSFOGKclV2ITdmRuWOmhJRXA2qD
	QWIKZ86lXItYFvIpvT1t3WnJ5MAaEX8pqYJjkONTkMAsICsp7JXoInbxq8r9p2qFh5JhaF4TFEz
	I4DpKo9zcQumeGLTOyLzBUsBLMmLG3QtBiITaqrJ0roFUVcXk8m9liXdhmnSnsx7TDu+ow5l0t5
	wtNifC92sBrIO/SzVm4YSmPYA=
X-Received: by 2002:a05:6122:20a9:b0:5ec:b4ec:e93f with SMTP id
 71dfb90a1353d-5ece7248b4bmr1176604e0c.10.1794233678355; Mon, 09 Nov 2026
 06:14:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <20261002124226.435265-1-morbo@google.com>
 <kcqbiis4m7zqlm6nzpacx6fkbycyy5gjz5nnhtlxlhzxn3tklb@d7j7ciafnpew>
In-Reply-To: <kcqbiis4m7zqlm6nzpacx6fkbycyy5gjz5nnhtlxlhzxn3tklb@d7j7ciafnpew>
From: Bill Wendling <morbo@google.com>
Date: Mon, 9 Nov 2026 06:14:22 -0800
X-Gm-Features: AclHuK_MqeRDtoqTOgbcQ-UKaELZDMLvDZbLcqrG79GD9Nb9csHUyVNFVw5OyLA
Message-ID: <CAGG=3QXfNQtgp1CqD-56x-nvnqZumcejBKqcgeaNZAj=ftz1Dg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 1:21=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, Oct 02, 2026 at 12:42:25PM +0000, Bill Wendling wrote:
> > The 'data' pointer field in 'struct acpi_gpio_mapping' is associated
> > with the 'size' field, which represents the number of elements of
> > type 'struct acpi_gpio_params' allocated for 'data'.
> >
> > To improve bounds checking via CONFIG_UBSAN_BOUNDS and
> > CONFIG_FORTIFY_SOURCE, annotate 'data' with the __counted_by_ptr
> > attribute.
> >
> > Analysis of allocation, assignment, and access points shows that the
> > pointer is never accessed before the count is set, which guarantees tha=
t
> > this annotation is safe and will not cause runtime panics or
> > false-positive bounds checks.
> >
> > Cc: codemender-patching+linux@google.com
> > Assisted-by: LLM
>
> This can be dropped now.
>
Okay. Do you need me to send a new version?

> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > v2: Undefine "__counted_by" and "__counted_by_ptr" in the EFI stub
> >     library as it doesn't need it and Clang is missing a flag to
> >     enable them.
> > ---
>
> Plase, don't send new versions of patches as replies to previous
> threads, this confuses tools (and maintainers).
>
The "v2" is NOT the version that should be integrated. I said the
original patch. "v2" was sent as part of the discussion we were having
how to solve the issue that cropped up, and not meant to be the
defacto version.

-bw
