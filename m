Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793994273;
	b=Q9n8RR5rnlLiK5IKUBGE54axqckqJMKDC0J47F2sJB8vcTMUDTuJtrO+JlQjItT1e9Vx
	 kMlqYNik98SQuHDoA40Fr9FNemxxySCxebfDX4FSrK6Z+SONO/ABjDNZpPuCYWlRse/gG
	 fuxpUCb5nN30lmGKiq6iakvjMCFbnzmMfMBYMuNPerNtJPabUl6AlUIpwhJV9QDk/I0DP
	 QMSntC9GZZwWRjF40QVWfzx/XScL+/t0OcXqm9fHL6MrKkcdNe1ZxknQYPYX6J82BmtnG
	 QtanB5Ritjp+XHNUFGU2UDzKiGLYbm11Kn1/oEdy1D6wzohzX7dE0xBL7oDq3IdOMsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
	b=FN6cf/ouUwFEs6YigX71zBg9NG6pyEm3nlyZKRul11Vh0kmkjLTfXj0x3TH/MCnWG9Cq
	 bxIgCIkbjp/SYQS6+rwx0gsgBbftgs1XyuPB6pl+6rSNk7cMJAYcMSgxWPD49kSkyHhXL
	 YSDt3tLX5IwGIuuQ85PQ9UCzW3kZoequ8zgi/Zr3WBAbPKNwU9TanlRu8zmEoGVqsadyj
	 ef45fUHsW1D+NmP1qvhBmWHmOJQQhX3bkKkM5tevC9Ib6m64miUvO5fgAqlXARSFHtKIe
	 6ZRls03v3fYs0UqIJrgdpHylzAcmSGaEAYDuP548QE6tjOzi5MG271OFACqwxzIDBzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gvGiICTn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD81606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAD81606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gvGiICTn
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491971ac844so920272f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793994271; cv=none;
        d=google.com; s=arc-20260327;
        b=jWJ8xSXkp2cTITbrLLpSp79OYFtmzqPvO56P9FzbO/dff67XyZlql48cpVRN5Ka3HS
         qapErYggLYBvKb21p/QZhICLe9QsDStkEZTPz0qjA3XzaLKeNENA3XmoZb5SV2Ip1i+z
         oEOKqU5xwWxWERy7TIkvxRaotkHL7yPK5lirrMyNe4UlsZ/wvoU2SASOqzBqz3aiOApg
         HxP/Z7m5R/b8/8kk2zSACx+Tb5S5gqy85pzXHPbbt/Cgr3fsgpLDDxjXPwF9EtUB8tEq
         p65XZlT9/gUPaUUPMLdtCKqslvDP7Ke5z5Rf5dAQi/yA86CdJnAnKCEgIXnxU7HAvmq6
         TL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
        fh=plQ/6ivPILrVrrYov/L4NbqVA29qq4HBqmKhCIlwCtU=;
        b=Y8t157oiwmq5X5w48K/KiIdgvlN5fWG8ZYFjn5BkX7TisKyKWRN3kh99YV6wu+xJ5M
         pmeEAwQoZ8LU8tVwp4lCJvjSQX/2x78imxd2J8MZYKCQ/MpBugWgNmhktNkynjEVoEQB
         i6OCtNWQnJx2KXXCgIkjmciJQUnhjHvzuAv2lMdfAXeBllguzyRfrKldJWRP5bA1f+ZX
         drEqcXa9sSp4yGnzMR2l5lj2/qrpg2kQO8LT9M76TKeDYNv8VxcU0VUxL4Yt4sB0qI1v
         8esLsdQkQ6gX+TkvY+O2AbLJN6iCUrj3ja7XTbyuC5uhZExeKiWTUmlvh3vlXSQQppeU
         8kzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793994271; x=1794599071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
        b=gvGiICTnzCxuHUkMAvPjSTuWZIiFk8Swusu09/AmeTF8ZvFuXrcJhRLIcY+x3exYoW
         F8yUkxYY+efm/EEK1BYsyPJ8L9glXj9FOSUpKm6oIgqo96gg2B/tprxf7Zo+1nuwhQPJ
         6ijZt289CT0AhkP1KSZvtHAyYuLOHjwMjMzs8+ueD8xOqWSBMa5UKbQa8iANDPRMBhpP
         wKRy68tVmylxxmXKurkJkSeJUoYdTEE+gS5K04l3rvighmiI1bQyPSntaJhmORJBJysp
         +4rchM83WXR83dhu4E6bcHxEb4rCuQE23qiFaf6WcTXAmLpRJAsHpZkRzfGuHtlYZw8K
         6MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994271; x=1794599071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
        b=ZHdA/9JxfVEqCRwqxP/Foygj9CIlUPkyRimg2A4qRYtRZ74ZBqmbDA5/VFMtspYRQu
         Z6rDwOJuZfBffBAEmtO/k/m/jpB8fjGRA9WxdgGGN2UrjjVh7DJmfv/WCpRYa+bC4Fpv
         t5vTnJoxrV+DGfyZpmAJ0aaRZ7vjxkyos4VLhKzMkDToXkrFkRnAdhymYjQsxPjvZZy3
         ObDaDjr928KsZW85Q4O8qsMmB0j9VieJUJ4nwT0SW8MjRKrT/gY9KfglY6I/xVGzLe4K
         9n+c8GuVRFDnSUYSsrfW8EyulKpjbrRg7MAOVtLpa9snYRcAMXT2mQytLkXcYWrjqgmS
         XDRw==
X-Forwarded-Encrypted: i=1; AL+hErF35ibBrJaIQlNTblalaAmFQsRotBHqd8HdtdGw01cprMYW7MOOSjB4FXiRn929n+LhEwtjsE1Mc+7ztf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pPH+vA84lczEsEaj8gryqGxrIbrzPTI7dHLJKGZ6lSFdgw3pc
	6HOjK8MmadfvPUfy4TIWHEtER4TK7GNlTzXoXFc5fuN1/gfrWh9KzTh77x+Fm25RyT+FNOe2BS5
	Z4xFJ8vgajn2x0sYJezzn4LHT1dkQfYPgZRj5p+WN
X-Gm-Gg: AYBFou0DPalHuYgjkhLnEp8DFMMF8IZpKu6aCr1niXA5vSAn2Dj6l+LTs5Sd4gA19hS
	riYeOLyZFYWO89nvYNT/1SdKh8Gv9rcfMxz5ZvmZJb5R9Dyb/9QsgvOc5Wr4I3627HlXD+qjWS0
	G4DXlOuKCtIFE0sbzmbAFwwlICo4YNih3YOXmX2/EfLvyt460FcvcD+aVmHa+m2H/WlCAK37jaH
	BDE9x4G5IpQ1/CHfVrFgUt3bjQrbuHM461P5LdPqrDj69JqOBu81Zo1bBXLaISOFYbxRLlXqSA8
	n0oob7qi7buXbltaY/vm8ucVS5LgW6BacUhZO2XpW+EPXHBfNGSNtqw1upbuz8UpUmcCMAWFDES
	205ilqlujaeb/nltli42T49veCTKw6ptoFhZb8HXsH4KIu+E6AKgbh86sMxKjuAh4Txm1qHWqbg
	mRXcyaq/BlLig+GSYoeHN73bqUGJxpQjPONLzMDCjeU85Piv1dtNdN1W2FeU0h9ngDjk3T+Hl85
	8Bik4KBxhHY88sww5OE9VSKE9PUWatOKpLScQ==
X-Received: by 2002:a05:6000:18a6:b0:492:8dd4:baf8 with SMTP id
 ffacd0b85a97d-4928dd4bbe5mr7282358f8f.6.1793994270567; Fri, 06 Nov 2026
 11:44:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
In-Reply-To: <20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 6 Nov 2026 11:44:18 -0800
X-Gm-Features: AclHuK9lc1j_hydZKjHRaIqC6GPhtItrfzxvxTIux1kraqJqkaT_i4EQKE6q_vU
Message-ID: <CAKwvOdnnonRfRPPv8cJU5-n_N4JpJLsVixyTYOtmgMjWyz2LDQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Yabin Cui <yabinc@google.com>, 
	Han Wang <nesthanwang@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Snehasish Kumar <snehasishk@google.com>, stable@vger.kernel.org, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:38=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> automatically passes -mllvm -sample-profile-use-profi whenever
> -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> inference algorithm (Profi) by default.
>
> However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
> flow-sensitive discriminators (FS-AFDO), and Profi has known issues with
> FS-AFDO that degrade runtime performance compared to LLVM's original
> profile propagation algorithm. In addition, Profi's min-cost max-flow
> solver (applyFlowInference) can hit pathological compile times (30+
> minutes or hangs) on certain kernel control-flow graphs when profiles
> drift slightly or when combined with GCOV [3].
>
> Pass -fno-sample-profile-use-profi to disable Profi and restore the
> original profile propagation behavior that kernel AutoFDO was tested
> with. Guard the flag with clang-min-version 210000 since it was
> introduced in Clang 21 alongside the default change, whereas
> CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
> used to probe for the flag because cc-option invokes Clang with -Werror
> but without -fprofile-sample-use, causing Clang to fail the probe with
> -Werror,-Wunused-command-line-argument.
>
> Although SampleProfileUseProfi currently defaults to false in the LLVM
> backend and is only enabled by the Clang driver, explicitly pass
> -Cllvm-args=3D-sample-profile-use-profi=3Dfalse in RUSTFLAGS_AUTOFDO_CLAN=
G
> and --mllvm=3D-sample-profile-use-profi=3Dfalse in KBUILD_LDFLAGS as well=
 so
> that C, Rust, and ThinLTO flags remain consistent even if rustc or LLVM
> defaults change in the future. Unlike the Clang driver flag
> -fno-sample-profile-use-profi (added in Clang 21), the underlying LLVM
> -sample-profile-use-profi option was introduced in LLVM 14, which
> predates the LLVM 17+ requirement of CONFIG_AUTOFDO_CLANG, so no version
> checks are needed for the Rust or linker flags.
>
> Cc: stable@vger.kernel.org
> Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> Suggested-by: Rong Xu <xur@google.com>
> Reviewed-by: Rong Xu <xur@google.com>
> Reviewed-by: Snehasish Kumar <snehasishk@google.com>
> Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef=
25522aa17c2a71003 [1]
> Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMAoW=
h-dqLHii3Nig@mail.gmail.com [2]
> Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Maybe we can credit a few folks with reported by tags, to encourage to
report issues upstream more in the future?

Reported-by: Han Wang <nesthanwang@google.com>
Reported-by: Yabin Cui <yabinc@google.com>

> ---
> v1: https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65=
fea2e1bafce6370@changeid
>
> Changes in v2:
> - Explicitly disable Profi in RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS
>   as well (Rong Xu, Nick Desaulniers)
>
>  scripts/Makefile.autofdo | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 57a3aba6ffc2..55fda66ad960 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -13,13 +13,16 @@ endif
>  ifdef CLANG_AUTOFDO_PROFILE
>    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PROFI=
LE) -ffunction-sections
>    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno-s=
ample-profile-use-profi)
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_PR=
OFILE) -Zfunction-sections=3Dy
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
> +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-sample-profile-use-profi=
=3Dfalse
>  endif
>
>  ifdef CONFIG_LTO_CLANG_THIN
>    ifdef CLANG_AUTOFDO_PROFILE
>      KBUILD_LDFLAGS +=3D --lto-sample-profile=3D$(CLANG_AUTOFDO_PROFILE)
> +    KBUILD_LDFLAGS +=3D --mllvm=3D-sample-profile-use-profi=3Dfalse
>    endif
>    KBUILD_LDFLAGS +=3D --mllvm=3D-enable-fs-discriminator=3Dtrue --mllvm=
=3D-improved-fs-discriminator=3Dtrue -plugin-opt=3Dthinlto
>    KBUILD_LDFLAGS +=3D $(call ld-option,-plugin-opt=3D-function-splitting=
=3Dall,-plugin-opt=3D-split-machine-functions)
> --
> 2.56.0.455.g6c5a503b38-goog
>


--
Thanks,
~Nick Desaulniers
