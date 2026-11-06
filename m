Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793994361;
	b=3EVZS/oDnrMpo+YbhakYrvWDHWK5+EPl35cUX1LsSE9rsgfb3aV/3aVTFHjadzktyy0m
	 GyvnPHlr5qCh8dOFKyjp6LctVNcozo/e7LkR+9MZi54yArNmG1r+9RgoEXRmdCQntqYd5
	 VZt+x9pheY96frw2+HuAY7b/TkFVm5tfhNdVHASB2XGQ6isj45LflnlBeYPUlCXytDNJI
	 2p27a2iFXsAS4HL7dEX2llFqqMyGZffUB7R0+Nh816yHhVF5Os+c4Kowvtvb4yM0ereBy
	 y4/THodSQ5uq5/AoKUDZw14kSfyi3UDnBSyo9nLSZu2LZ9lybVM3IiH7BCTwz5g8H+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MtW6cUlF0xWQVNMRbFIZNlbptYiDw1CO/QxWvZcoGes=;
	b=dmJ1QfSl47y0Gg9kj5zmDJ9lJQHtXc8dZTkg1imWzNQG7jKr/sLDxGqMp7vMkKZsZ5Nl
	 0V0ILWzJjlNg338So4BoDC1amS4y8BKVwTl92hOFiQNCWJH+aKvPgmWZRCnc6lLLjdMIo
	 6OMTUeARLz/pdcPEatynXYIXBRHtN4viReWc0mL1OavShW9AkdIvHZ5vZe9t9vTSW6N//
	 NqgLcvS8vxtGQnU37UVMbXcxwT4Pq3p7nL9UKSXxR9lITFAufQKAVOHbVYGYG7j5uAdV5
	 1mabftAJCsH2Rr+VhMgX2lzDGifH3Ih3sTAp07PmmsQVffacrfK/yIZZab9b0SSdlNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b0lSW8LL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9900B606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9900B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b0lSW8LL
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so304a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:46:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793994359; cv=none;
        d=google.com; s=arc-20260327;
        b=CwyuzhPpkuXlKHTeAuI5ezBn/37dwgLnpPFZ47e0hqtdJXoYgyeehn0AOwYN+IoNrc
         JX9Ci/heAaRoHEY9yl3LFT7VTVUvzy/o0476/OudLDs9rirUO6cGdHU6I/fYtEmZ8xrd
         PCZfsLqd7uZMHLx1Q5F8WBmSbjSHULAcHuSJpEWYBUEtQn30xNr+7bbOMBLquXJhx/cZ
         4cxOGdSrHQQlKFrJr2/LBQIHcNWx7rUReLDrMH392P3xalisqq1PtX4vaEPKJDjfOzOP
         uX6ibFoHeZRsijpzaDMmqThhMC25avoQcOWlQbcG8Uhtb+y01zZKm+BQEZPx/p9fumJW
         WaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MtW6cUlF0xWQVNMRbFIZNlbptYiDw1CO/QxWvZcoGes=;
        fh=YgyUFkubsrz4bGLtVQaUr1ZMMNnjbcMtBM+FTHIn2S0=;
        b=Vtg4uSGyxco2BYboTQB2brLEkHABLM4D47T/1xXNnRW3ZVZ8faXvvlsfkadYzm7f1b
         6QFKBrRVL/fGRSD1Ra7nh4KY/A1BXTgkfP+HBD2iBW8t4+iCtTGYtM6Q6bZRJCbmIjop
         2xmG0D9vitcLePoPz/ajUGFo0e2TiSy+YEev7oCle4CzWHchNZ2eEJvCn81JUQcNh4Ai
         58DjEVeJvqMao44vXQ4hhtZK1MtO3nkhcQ1WztVjVNlDd2H0ZSNqtaGm24P74cRTWTIY
         LCAC1iLVAvNHSsSNaO1SkUt/mi8lbvQNkUuxIohdg8E78KPa6FUseMRAtUegt7hitNkK
         aE4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793994359; x=1794599159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MtW6cUlF0xWQVNMRbFIZNlbptYiDw1CO/QxWvZcoGes=;
        b=b0lSW8LLban7Eer3WywvdFdQTbSrylW92pzpB1SznsBnaZEiz/E/mE1Ip9NJMfFT2l
         XjywJ0NDQ5ygvJ7ZXsfY2bkMJK18bVrY4MR6mWtzjuUiGOQauJxr54tkPLPipTCreCgn
         7+E7Wfev4B/SHsI6VGpf4Zfl0AjwC5Cg+74fNxZM1rk1oN8hIWWGUB/S7fy2mGS1l5uS
         moqnrQ2FWyXKqMHLqVC6QSNNKbcbqN+GP4/Syip1H9nFT4/PzdLxC80+nzHB69HS9dSZ
         eVxcLRFY+ZeyjSnuCy2tC2UHhrZ4xUKkftFfI+QiM118IjMWFAceDTjo5rzdOJAsyjCQ
         iPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994359; x=1794599159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MtW6cUlF0xWQVNMRbFIZNlbptYiDw1CO/QxWvZcoGes=;
        b=y6ME7PqU1+wdb4kDdzVRQvmpcCGxCjb76BVnTcozg/8M0TNRFcN8+tUP8jpUCEVC0q
         vl9mn+4p/m8+y1i6xL3vMZ6jCVEfdU6l4WfnH1rkPfMbmnU2+WxSu0eqqriLFN2+7kt8
         g32ZvIfUkQjx32GiY7PRFWw+SjVFcGDnxsncL2sH1zLjs02PNbhFP5okrK97lb6E88SG
         mLmERAxEhn8PQtSmiTf6ZPj7xERAIiGpzX+oBEEKutmAM8smZBN7UlziUiGYtaxF0p6m
         sMg00Z2Bn5diawq3UEDFXHQ2yKXlckNKT7gZW5uw+HkqUgdyXX4MDuJ68pQ3n9kY4lRL
         CNzg==
X-Forwarded-Encrypted: i=1; AL+hErGaE59keCYtyZ/13VO3fa/vB5Fl5EYsYg0aWgiTPN5zNLK78hdD5akDWVUl0DJAHcVw5icCkqEJfUrFGK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g3eLXumrG1zqXE1r8b56panRedf0FycXmx3ODAv5ozNUDY7M/
	T3q42jaLfCQPRcS6rPKcZyuGOo5qSfpSxazhjT8CfsZfZRQUdRtUdili8mY93xTjG7v8t9wB5Mg
	g09Gpb7N0mnX2tIwwgZFVMt/4q5tinvKR1OFtRteX
X-Gm-Gg: AYBFou0a3PqJbk4JZF/WBNHgU2gN7DF785wiXpBaJk3J4PWa1PenL4MDI1zB+4/wVOV
	gy7Hj7adqapCSfXNp6ZhZ0yDQE7REa7RjkL0Dz8RE/IpWgaREOzUhJSmAd8AUUNQIMALlyc2D5W
	LRtBoQK0Nd/oQ7J+YCFgDsTZ3Shd/KKOLPfbZ1JGVcEUCcP5a7/lP54XunLK50hJr7IrETgWIJw
	UxoZ0l81bKNO3kf4Y2OARdBZKkaiKaKnxxq39GZGXhTTB7iAsSqnMzqOKMPmlyJmbr3OkWneglK
	4IhZrdnl5RT6nTyp2jsxKPW+R+Qxmu/O1e9VdaaI1ycqQYWyh5qbwDeq6Yip6xy+kKN99ytnfty
	6lgN/9O1E1oBfOJj0qJAIPz5ECTXgNr+Y7kEobpQ/B5ROQwOzvAzSMJYFjUL1PLGKWNU5
X-Received: by 2002:a05:6402:424c:10b0:6b4:597f:50ed with SMTP id
 4fb4d7f45d1cf-6b6fad61dcfmr562a12.5.1793994358649; Fri, 06 Nov 2026 11:45:58
 -0800 (PST)
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
 <CAKwvOdnnonRfRPPv8cJU5-n_N4JpJLsVixyTYOtmgMjWyz2LDQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnnonRfRPPv8cJU5-n_N4JpJLsVixyTYOtmgMjWyz2LDQ@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 6 Nov 2026 11:45:45 -0800
X-Gm-Features: AclHuK-y7Snn7fa_RHpKW_RqOSo_pYKXo3yMIDsQSg8EuPiGD_nqwOFftAAYja4
Message-ID: <CAF1bQ=SFw4GR3_HagE6k08ipFebgmxqE8UDJGmOQq9u3-0ZOnw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Douglas Anderson <dianders@chromium.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
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

Look good to me.

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Fri, Nov 6, 2026 at 11:44=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Nov 6, 2026 at 11:38=E2=80=AFAM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> > Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> > automatically passes -mllvm -sample-profile-use-profi whenever
> > -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> > inference algorithm (Profi) by default.
> >
> > However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
> > flow-sensitive discriminators (FS-AFDO), and Profi has known issues wit=
h
> > FS-AFDO that degrade runtime performance compared to LLVM's original
> > profile propagation algorithm. In addition, Profi's min-cost max-flow
> > solver (applyFlowInference) can hit pathological compile times (30+
> > minutes or hangs) on certain kernel control-flow graphs when profiles
> > drift slightly or when combined with GCOV [3].
> >
> > Pass -fno-sample-profile-use-profi to disable Profi and restore the
> > original profile propagation behavior that kernel AutoFDO was tested
> > with. Guard the flag with clang-min-version 210000 since it was
> > introduced in Clang 21 alongside the default change, whereas
> > CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
> > used to probe for the flag because cc-option invokes Clang with -Werror
> > but without -fprofile-sample-use, causing Clang to fail the probe with
> > -Werror,-Wunused-command-line-argument.
> >
> > Although SampleProfileUseProfi currently defaults to false in the LLVM
> > backend and is only enabled by the Clang driver, explicitly pass
> > -Cllvm-args=3D-sample-profile-use-profi=3Dfalse in RUSTFLAGS_AUTOFDO_CL=
ANG
> > and --mllvm=3D-sample-profile-use-profi=3Dfalse in KBUILD_LDFLAGS as we=
ll so
> > that C, Rust, and ThinLTO flags remain consistent even if rustc or LLVM
> > defaults change in the future. Unlike the Clang driver flag
> > -fno-sample-profile-use-profi (added in Clang 21), the underlying LLVM
> > -sample-profile-use-profi option was introduced in LLVM 14, which
> > predates the LLVM 17+ requirement of CONFIG_AUTOFDO_CLANG, so no versio=
n
> > checks are needed for the Rust or linker flags.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> > Suggested-by: Rong Xu <xur@google.com>
> > Reviewed-by: Rong Xu <xur@google.com>
> > Reviewed-by: Snehasish Kumar <snehasishk@google.com>
> > Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48=
ef25522aa17c2a71003 [1]
> > Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMA=
oWh-dqLHii3Nig@mail.gmail.com [2]
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Maybe we can credit a few folks with reported by tags, to encourage to
> report issues upstream more in the future?
>
> Reported-by: Han Wang <nesthanwang@google.com>
> Reported-by: Yabin Cui <yabinc@google.com>
>
> > ---
> > v1: https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b=
65fea2e1bafce6370@changeid
> >
> > Changes in v2:
> > - Explicitly disable Profi in RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAG=
S
> >   as well (Rong Xu, Nick Desaulniers)
> >
> >  scripts/Makefile.autofdo | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> > index 57a3aba6ffc2..55fda66ad960 100644
> > --- a/scripts/Makefile.autofdo
> > +++ b/scripts/Makefile.autofdo
> > @@ -13,13 +13,16 @@ endif
> >  ifdef CLANG_AUTOFDO_PROFILE
> >    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PRO=
FILE) -ffunction-sections
> >    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> > +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno=
-sample-profile-use-profi)
> >    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_=
PROFILE) -Zfunction-sections=3Dy
> >    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
> > +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-sample-profile-use-profi=
=3Dfalse
> >  endif
> >
> >  ifdef CONFIG_LTO_CLANG_THIN
> >    ifdef CLANG_AUTOFDO_PROFILE
> >      KBUILD_LDFLAGS +=3D --lto-sample-profile=3D$(CLANG_AUTOFDO_PROFILE=
)
> > +    KBUILD_LDFLAGS +=3D --mllvm=3D-sample-profile-use-profi=3Dfalse
> >    endif
> >    KBUILD_LDFLAGS +=3D --mllvm=3D-enable-fs-discriminator=3Dtrue --mllv=
m=3D-improved-fs-discriminator=3Dtrue -plugin-opt=3Dthinlto
> >    KBUILD_LDFLAGS +=3D $(call ld-option,-plugin-opt=3D-function-splitti=
ng=3Dall,-plugin-opt=3D-split-machine-functions)
> > --
> > 2.56.0.455.g6c5a503b38-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
