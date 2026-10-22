Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792671494;
	b=gRJBjtskUsq+owXBNySqzFDOoISMUkEwtSa64jKUDQK8lmNkQTSAwmN0qf1RaA9zfbpr
	 omapcbaYLi0+8jsY3XSHEAgneyGd3qlDSfFM2H/vx3ki6HCQPFZ0i+CXI6VdH82iGaQSK
	 StFHFwSiMRRi1E9vYxZxaAsQUli3XHpF1/auesSyD+enb4aN9AYHQfxeAUAhd+hTr3UOf
	 gQWD5pwmqJVr/8CnOPv4tpfBx1s/K4NL2uJTFA7sxjfQr1EwC4kBACSfoEIvc5EaPz9TW
	 kJvT5QLk4FKukQPZ5J2xJm4ljNJjfFoXVOhjYhNcLT1yap93KmFoPlhdOR2GIUWgZzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s9csG9KWZuFtxhPYz4DLhAe4WCwNkF/v5W58eA6JDUc=;
	b=I1KXqwfeN7yeWm32Bb32bkldZU4lL7gjqwXjeZSLtJVnVKsMcPc7fNS4BrVhhTVcXJzH
	 s6H9IfEXMVtXjWXcU89jxNXDC/n6Fa3rRcl8RMgwPNytjvkSZt3WtH9haV9pfCfILNqmt
	 iO9NkyGwnjjV7EBuc7SSdRVDW4LsH/xcgZVoo+PFV0/dPWtAKqPWKSuc5ZZyrEw4ldX02
	 ePJi3yhiHlyJ9Qh06nmKjHRZXeeWbAJuysbEUSGp15CM7lgxLarzN338zhcGg0BLqxq2z
	 fYlN92q8gLqcXxe2Qus0V1mWYuGzEiwShQ+x8az6uAja+jpVnRd5uO0Fa8x3NGgsZpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nfo8KPDj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B00606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B00606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nfo8KPDj
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-917ad52d7b6so18043996d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792671493; cv=none;
        d=google.com; s=arc-20260327;
        b=RgX+XvoRtX9hWYjOKAyylMF0ZFqICNIgVlQYmRh8lS7B28IxdNiU2ccMrpc5b+GLew
         XXa6SWSOq24TztpgtlMY0hETHdARk3qoN7mH9Yz+ayiXk0FYZprzxCAq6eH4X3gtrBZf
         dLF8RLSjdNfuZuO9KP4qhVF8HWdvOF9ir2DiUWkoXF46IrcTcP2fsJ9aKuAc9ck8+zrp
         lScG9oypzPubYhEB9PxiW8Fq1XJxKX1evaSUkEVDAXi4lmvfsTbyLZm9c+hJGssyQzaU
         lQTvvoizg9a1PFutvvP8AZ4000AXW35Ln48OlfOS3IcPPkIAnu3AXRXNTPyTXgkx3ePl
         N8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s9csG9KWZuFtxhPYz4DLhAe4WCwNkF/v5W58eA6JDUc=;
        fh=EIw6wdkJJhgjKvG3yYYyR7Or2W2CbDB64UhPVvCRxDA=;
        b=Rjx9qtHXd1clh+qWDDpW5LeVXVVkRXadG1amRf+NsCQz9xW8jKXYGGOGMNt7I/zB7t
         hKdEnUYJC5mivRZSK+yYtt5IaYeAz8DI2EVtV//BmPQgSWVsae3rftUHB+xaw8RPMVn/
         qwWOyleG2mg3laP+V9YxvOAXUpgU7EqsovBKDMfJWDnYbLxEYGpm+gauh68e9VPzZVod
         OgIDcI1HnImQLYRmHQYaDFWLxLAzAyabepzQZsbeyqGJZaXMVLI0glFrIYPyGjQQRS/2
         HxHAvwdxDcNNxKbGRsI3pXVgH/u25yrekVIWFHbyeIEGgvnmRVzH804KcyDCicas7G/Q
         L6rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792671493; x=1793276293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s9csG9KWZuFtxhPYz4DLhAe4WCwNkF/v5W58eA6JDUc=;
        b=nfo8KPDjyKEJpgzULPrceeBYWsK9Ok38Hs4nq02eAW3+P2brsvGKOT1ZuW4AeDiJfI
         5W/NAiNtHcQKXeKJz8ouhNGxB8ays7SFK03TU1KU3uVamTn8YyHKfpUOJaH5hPpIE5EY
         dSsRN8jxdow30RgCWkQsGmH/dVXjRufDV1+SUZO8ZA00HDYMZd4Vmuo+dg8uNaOcrHBW
         OFmr92ZogU1/M+hE9nm6H3jGCHVbfSCTG7nBiDp+TOXEEa748pMeTt5z1I0Q/r9EgvIL
         cpqLbNcpXp2i9JZe02yeuYGWgBNy6CPJTRf0ZHiDLjdwZyzT1fG5nb2QcpgRBFsuzIM3
         cSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792671493; x=1793276293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9csG9KWZuFtxhPYz4DLhAe4WCwNkF/v5W58eA6JDUc=;
        b=h5NlgkxS2OUGXGnNPws46GvHyotNeQwPdH86y5hlC4GbqV8TfPbMav08LILPj7UbHc
         uizq9vRCFAC/Ae579hxqq7WRbbxuEV3ctbIr/RfhJvh1ChkbA4wxKz57/ghu/2P6w+Tb
         ig+OLSP5uy0DmMgVuQcYHPnIlSIK7awhMGTM55GdtD2dLA+537+lv4tuQj3SJyKQeFy0
         H1ttwZ7rDTqZlQWmE9VfvVnQ5I0P0Qh1qhQOHAa9MyqS0qZwLKtShhttn0G47lsRTFb8
         44NCyNXGzUU165bjwzx5SzJ3oTsR65z/OqfG1rgeNpCuhzaYqfEmmnG9eEZHurO1Rzmq
         95lg==
X-Forwarded-Encrypted: i=1; AKwUvBzi7O9jCdLdYyC+bT170P63O2/3bDMTnNjXMhDqMwnB60QLHGB2z9Clfld8wdgDCuA6WaeyZ1y9r3PVEPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqB1wKaYgsMQFxFUFUbzHJc2sEliUv1ZOkUvK7/2eGmk2iVLNF
	hqTkFIwebf3wE//rj5Uvg5mZStHZk/SzTTA7H/2+r3MsiZLDtCU58Mi9MMi2XZmKV0wtg17rAfe
	U4o1iYc0rlbZAkbEy88967aJWZcAxFHI=
X-Gm-Gg: AYBFou1W1+2mCUx6TjvMveHimnHWZ4kQQcQhNfdMvx/DUFOzlNC5me54p3m9I12c3Pg
	jCnB71FW7vUpHPpZWdfF58VaGzPCeNyERhBeYhoMJzdcWKsP/MYrYWwzss2SEdtzaNVpuQt1rBd
	LZ8r1sSUuQUn66t+GzRbBs8R6ZOByBUOa3wT/gpzwvt+GB1qQSP7xfIHSujzHFwlDmOiobuxVPL
	yZNCpIxDEGVGnlQey+XUL/oU1mDDevO2UwYO2Kj3pveUyrQdSCvtpsgVPYZAW7hXS2dTZFZdHcN
	QZhKPk338FyMwJyWRnuOQW0Py/snhHSeUYVqx7+5I4lUd2kTP5sHG/M2Qre4Er1Aq9qQwPMdiEs
	XMkFnx5K1H3KDwVqvnp0oEZBbJpAp9bm0Zt8Ayjjz8eM9Bl+k0URk4g4PLqDtCw4e3bz1zBB1TM
	+8xywAtTuRl5oIfdM3LOdJ1gs6Jt94/wHZq3GvR0WA+KQnHLJb
X-Received: by 2002:a05:6214:2506:b0:91b:549c:562c with SMTP id
 6a1803df08f44-91c12dfedc8mr84841876d6.6.1792671493137; Thu, 22 Oct 2026
 05:18:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020010421.77388-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261020010421.77388-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 22 Oct 2026 09:18:01 -0300
X-Gm-Features: AclHuK8uc0Pdi9GgPH6cqCilUnGisH2EujO3679uE1lxCkMR2VbSk610iugPnpo
Message-ID: <CAMAsx6duwRdErofO+NHGbZ0crCCU+rrc+2BL31eQGRrDZMVsLQ@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate programming-language.rst
To: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, randy@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 19 de out. de 2026 =C3=A0s 22:05, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> escreveu:
>
> Translate the programming language guide and link it from the pt_BR
> process index.
>
> Assisted-by: LLM
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>

The "Assisted-by:" tag is no longer necessary, so please drop it
in the next version.

I also have two small comments, both about labels that clash with
the original document and should trigger Sphinx "duplicate label"
warnings.

> +
> +.. _programming_language:

This label is already defined by
Documentation/process/programming-language.rst. The other pt_BR
documents use a "pt_BR_" prefix, so please rename it to:


> +O kernel Linux =C3=A9 escrito na linguagem de programa=C3=A7=C3=A3o C [c=
-language]_.
> +Mais precisamente, o kernel costuma ser compilado com ``gcc`` [gcc]_
> +usando ``-std=3Dgnu11`` [gcc-c-dialect-options]_, que seleciona o dialet=
o
> +GNU do padr=C3=A3o ISO C11. ``clang`` [clang]_ tamb=C3=A9m =C3=A9 suport=
ado; consulte
> +a documenta=C3=A7=C3=A3o sobre
> +:ref:`Compilando o Linux com Clang/LLVM <kbuild_llvm>`.

> +Consulte Documentation/rust/index.rst para mais informa=C3=A7=C3=B5es.
> +
> +.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
> +.. [gcc] https://gcc.gnu.org
> +.. [clang] https://clang.llvm.org
> +.. [gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-=
Options.html
> +.. [gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
> +.. [gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-S=
yntax.html
> +.. [n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
> +.. [rust-language] https://www.rust-lang.org
> +.. [rustc] https://doc.rust-lang.org/rustc/
> +.. [rust-editions] https://doc.rust-lang.org/edition-guide/editions/
> +.. [rust-unstable-features] https://github.com/Rust-for-Linux/linux/issu=
es/2
> --

 Citation labels are global in Sphinx, so these collide with the
 ones in the English document as well. The other translations of
 this file prefix them (it_IT uses [it-c-language], sp_SP uses
 [sp-c-language], zh_TW uses [zh_tw_c-language]). Please do the
 same for all eleven citations, e.g. [pt-c-language], and update
 the references in the text accordingly ([pt-c-language]_, etc).

 With those changes fixed, feel free to send a v2 (with a short
 changelog below the "---" line)
