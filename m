Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829828;
	b=nEddkNsCg/prajjte7+9yMpDbS+T0E8rvLneUAfhPiPCi3SQtA9kV2RqOmM3E8AfQndu
	 HlG5qZ9qdu+oUxrU296T8VFxeMAL3G7fDEMAJcgRRuEBHvOG+IFfXNZdrhQGnV3ZK98Hx
	 jtkcWYwbc5MPrK+EL4OtAZBOeW87wT+uC7tO7ALtq+x8JICk7l4aDSKSj6d8QczUZL7Ql
	 Naeq2Dmd2R6KhUwSAOdyB5LAxSBF6AMIq7PeCy94k1bbbiq3dxekz2uZGLmRNIpiXDaRh
	 QlIT4KUJiD6kRalmMoyeojf7ejdpy4O/R5e45+3PdgpnVDRwrKpYGKG4e27Vz3IIFBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
	b=MGRwpk7nKA1Q93/yPTx5FrQZE5jyEBJ9A/1p8VzS8V/la5Zdo4zWpgFORkLJnAyrGluC
	 uelYjlbr8heYWAAoA3QOHM57uf9Ow2OLXMJMVQ88C7SwQ9MeOU8NAR5WPpOOg6+1rD6fZ
	 6d0sgLHwnAWEtPqnxieNQRnZNkg5d/+jBkE8GRsD2+c5Sj5Ts5Z4j77J1jWjrc+g5c+T8
	 aivH0R5fziiFiR5lK3r7f0dAampvXE+M1dTOwKIt527hViXWjnrCsatgZdgmPzNutzq2L
	 3/+KzQ1wSNfeKZ88m8EQS1l1m7919OoblDZV0x84iWj6DPXBf+GWxNaWqfFs3qgxCdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="RQ/C/ciB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9A4606A32F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F9A4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RQ/C/ciB
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso2277225a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829826; cv=none;
        d=google.com; s=arc-20260327;
        b=Bg0h1AVgm6vVKGGCy/LquPNmug9w6+5cCFnAVDCYvMRfJHuqd3TAMMePpsf16+Groq
         0kd4h2XT/s8+LGd4HOxa7CN0zpeFh9E8PknetMT2hm/kr9FV9izwIhJP98cZBoyOQ26G
         /FuV7vAz4a/p+AntTvfqgAOK2/OEGOuwu/03KIThk9kapxE/fhRDet2XMMB9AVF6l1rt
         h8ayvLcQhquIHc1kHhbdoM2FTTZ8+LDOs3DlRZiFuWp3qO1riZ+i9sc/YRfOFvqUfnEr
         XD4u36+i/jX9zi92foegDelppUzP2hXoiE6c1pT3+b6t0TvHQ60D8kYu5NyJ9lTk249K
         /vOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        fh=rsZd2AmidMT3ES+w+jGe80hD2zVAVx35UvHl76BefXU=;
        b=O9qnLoaT19WtICbPCuLshPT+gZop41jp09JqDI0oRqeqC5Koz2qVbpAFIwlSBzPqJD
         MBrMf5xRV2iNqIHpDj8bLiC7IgrL3zA34sa9sb9wHslyJh64I+4BQ0GTUuGaVA2WKKqs
         jp/1r83zqNUYFNzXc6U03HloKGZdmn3+kd+L8JOGcngzKmUsCTU2/iAWRi4DKOQhQKtM
         owD7K+pvP5sZLrOoM6CfbKhvwH9szxboK4MvPrsAUejUm8wgFMBCT4Vfl2qMaYppk+ht
         v6W6PscCRImn8JeSbK6kcyYnBcj/pL4siwhrCoUh8TW1Vy/7Q3VUN4i9ixT+RRtgdVBG
         Zczg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829826; x=1793434626; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        b=RQ/C/ciBKZJHGdvCZm/dYrMbyOFdij4a0YW87tH+vXDq+9FS+P0+VhkPe2yvw8PouR
         1rl5NjCRsmehOHog4MCGLudY+nXK4o7aKeyawk/ABbhLZrLiG/YXwW5Ec453FETEL8A9
         gIgBxk5de6f7THQVvOrLyQmTAT4gg/7K+qaok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829826; x=1793434626;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        b=aX7XvgPdx045qWpLndtpBQm7Y+XZQThfLbZoh9h7rf8+dKISjZdLcG7jzT06sAt/tm
         xuN0WvYzoU2pxfuzyXD6RPIhu6H9FwhCiYdVcvjic4IMXXCu/ExgW1x+bdcG6px/pXQH
         APkPsWodbQ8XJa8Q2obBD/FacZBNSh5Y2RchLKc2zQaI38pLlUqoX93mUG7SfRWyWLYU
         qNon9oTOidjqDgIS8icpQyIBlX0XfN+jqXVejq2EPZ96DhVl0FBmbNC66Ucq0+rAUDhK
         MD17a6TWGHHZiVWhmlu1mLi6C2SSknECmCaObfs0ECtXq/AxBdrDUw5CbA5B525fU1wK
         qjsw==
X-Forwarded-Encrypted: i=1; AKwUvBwwG/jW8dCAJhKD2xOS96IuXstwDLlxbAn4VRbQ+iRYuD0K+FezUpvz3MFxcpjQqynzEFkTT1Y0XV/nQ5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0Nzx9eMjSl1ugc6kkF9UdDAPyQdu3GGVd5PuheYVuiVXx88fd
	+D9da8hq397hwhs3eZ8YdhMRuYAv97HoTd6IqTxrU9S+YpTKC1hRjQYKhriPnbqezH+NhtD49j+
	4HSTOQ8FInAfKdeoZo37J3VtgMpU2t97fwdyVJP0B
X-Gm-Gg: AYBFou2iVakl2s7hzqJ4WlA8qamp+qKT12b+2Fx3uUrLUHcRFWc5g2CMo+fyHgiGQcR
	87I7z3JJAfajh/6/+c1UDwNfS+fqoU/YzmYWXli5/55X3uk75kGzbBDImfF8nAP3JWHjYawBLyM
	HYuzjfEq23/isPypqbYfYTU+WiKESiCag4twpMSJ5lJU5dd5xE3nZ2ja3w3Qe44RsguNpihbeLe
	KnC4lSph2SeJtvSQhhIsBkcNd7rWs/QZ1sb5VItBpNt0bTx6/Qdh+VQfUuOSWVYjPFH8SbAwTds
	GFq6SVATyRGGchmX0DVqocsn+RheH3uPmxmN50AmHrcZXDVxviKyalJqNAK4vUWeX8pyMeY+2l7
	mpEfXesiB+9Y5GEa2g6XiT7NfsAfz7pIm7Fw=
X-Received: by 2002:aa7:d6da:0:b0:6aa:e46b:2ca with SMTP id
 4fb4d7f45d1cf-6b442ff19aamr1213416a12.30.1792829825967; Sat, 24 Oct 2026
 01:17:05 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:01 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:11:00 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:01 -0700
X-Gm-Features: AclHuK_qmQOwk_OOKs0VN1cm__skt9GZJUv6Fec-Si_oH1IGjBDYDz8yVEqOjak
Message-ID: <CAFLszTidu1NFSJ9dprCHts0-XY73gk-ZPAhz0V9BdYPoCcXmvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
>
> This adds the following commits from upstream:

>
> f3451d12532b meson: Only take the version from dtc's own git repository

The script builds this list from the last sync point (v1.7.2-69), so
fdtget.c and fdtput.c get loads of changes beyond what this lists.
That's fine, but you could mention it (e.g. the new -r and -d options
in fdtput, automatic growth of the blob, long options, strtol()
instead of sscanf() for parsing integers, fdt_pack() before writing,
the libfdt iterators in fdtget)

I built scripts/dtc and lib/fdt_rw.o at this patch with no warnings,
which covers the in-kernel libfdt now that fdt_setprop() and
fdt_setprop_placeholder() are no longer inline.

>
> f3451d12532b meson: Only take the version from dtc's own git repository
> 7a1e01792600 libfdt: pass sources as keyword argument to library()
> 8c37c14c95d9 fdtget: Use libfdt iterators instead of open coded loops
> 89c99ce78ac8 pylibfdt: Add add_mem_rsv() and del_mem_rsv()
> 3750493c8b0f pylibfdt: Add address_cells() and size_cells()
> 0748c384fde6 pylibfdt: Grow the FdtSw buffer geometrically
> 5008d1d6a356 pylibfdt: Replace removed SWIG Python 2 compatibility macros
> 66e1201c3775 libfdt: fdt_check_full: Add can_assume(PERFECT) check
> 214372a27398 tests: Replace trees.S/dumptrees with treegen for making test dtbs
> 4df9ca4c8ddb tests: Add treegen, a pure C replacement for trees.S + dumptrees
> f116f4800edc tests: Dont have test cases link directly against example dtb data
> 9b53b9a4c2f9 tests: Add missing unterminated_memrsv to dumptrees
> 5f919a25d71b ci: Merge make and meson jobs using build matrix
> 6c1426dfa963 ci: Add macOS support to install-deps.sh
> 23fd89bc8ed8 ci: Move FreeBSD CI from Cirrus CI to GitHub Actions
> 3ad5ebbdd9d5 ci: Upgrade actions/checkout v4 to v6 for Node.js 24 support
> [...]
>
>  scripts/dtc/checks.c        |   2 +-
>  scripts/dtc/fdtget.c        | 207 ++++++++++++++++----------------
>  scripts/dtc/fdtput.c        | 280 +++++++++++++++++++++++++++++++++-----------
>  scripts/dtc/libfdt/fdt_ro.c |   2 +
>  scripts/dtc/libfdt/fdt_rw.c |  41 +++++--
>  scripts/dtc/libfdt/fdt_sw.c |   3 +-
>  scripts/dtc/libfdt/libfdt.h |  70 ++++++-----
>  scripts/dtc/livetree.c      |   2 +-
>  scripts/dtc/version_gen.h   |   2 +-
>  9 files changed, 391 insertions(+), 218 deletions(-)

Regards,
Simon
