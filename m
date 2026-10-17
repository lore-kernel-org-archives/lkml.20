Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6BA4CF470
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225893; cv=pass; b=hsV2l7Ipxz4vvv36Vx9uGnFpeSeXDybgQC7pCNRC6Q1ixSauVBdTBOHj/OZJiBVY9MExVly29maIMWuHljXvSIv/oA5v5YdU1L9yDDi+QbK1FZnqpuX3AJX61Z12XXR67eTnmjtrdaqqXrJ9i/8yvA2iG30/AV5WtH/X7L4+rf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225893; c=relaxed/simple;
	bh=2hvL9G0iUMxU+dx34qh/lZYVi9WfhKgM9zRxemLC0CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptt+ud7uWER3EVKkfFoW02IqWpLTv97fBumLrOIkuE1XfX8pM4Eji3Am6EENK15xArV0a573065O6np1eqw4P7HIpfGy8NOhX39l5UVuhHyfrVWNfnGxEKuJAK55eckywKDxTdYpCmofN/h01dkN0HoBygYlism6vKvbOg7xyuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/i6xrEz; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/i6xrEz"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso704059a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792225889; cv=none;
        d=google.com; s=arc-20260327;
        b=dTodqL7YsdQzhzwX0ks2dng8osrn1MGA7zMA0ZmMLaq5qSlIIXZnan+nhW9MMPFbfP
         PR1mOvbYoSsgvAFnGrY+8bRKBlx+MJagSjNty3rIsGN0oXQevqMsdNobsFP51h1S5bla
         E5bjapnDZB/uvhoxWKC1g6bQ1kDbS1XGdCoOb5TNBEGYzeei3r5ETlXIVPvwDNON0q8p
         fJAEucVkU2/boBoHJEjgM6ehmxk9CJXMbeTM8cew8fHXT0zGC0Rs8EmlTahF04BbEf7S
         zTD3lhTEoCyOXnDY8pYvN0XW3sbsA4NbalAtdwzE4zUiJrLCTZ1o6TONHWWinzu5g8If
         A2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VEum+lArOfGjD+3/r6eLfaoLMgK2123Y1ak1ZUBNHUw=;
        fh=sznjWP8RDqSFfH3e4p6vNWxwzMBYU+Gf4Oe2fYtl6ko=;
        b=qUrMYYQZe+jX8RWOZlyIQvF3YsLtiFfQeU/Uy3vHKmExeFi22c1wpz8fx8/kOg5ayw
         c3DP30ai3b1mL0Qxw3A17BpvNQEdKhEKUHQcKPScTzGs2/r024m2xGOZZhmQ0KJ37yW/
         vpD1GxD3Ge5PqQA7VJgwCYklbONtL9JOuKgI4ByO0f4wDMTaqaFTaermJpypz8PkjVVP
         B/5QrZM62O/Cb3UsLj0CLic0Ks45NuOjXexlqqqOFNtNR3PYYZosk0nBFQTRZ4vPBkrb
         xPmHfOdAVIC/xt2FvczwAOcIVT7WdomTIWM9TZBouN/YUV8mZ7y0wKniiDkbvggcmuOz
         AR9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792225889; x=1792830689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VEum+lArOfGjD+3/r6eLfaoLMgK2123Y1ak1ZUBNHUw=;
        b=M/i6xrEzDl6zLbgLMcnEsPYO0ETLg9DDQNwSKxyKQBB+1QNaGMS+5QGZe8j1bid46x
         WlKz/s2RpX2mPGmeLhfyfHtKnzgcG8wijv8sPmlx6JLUVMB1gggxeK1GYfi0OHF/Azmt
         2xRjF2pkkDPjelHLfWaqcsHzq3MOreao0It+y2uzJZLSs2irPNoQzBDiIg50+3PH3lfA
         bITfrh33Cl3/muZSSWAvIFZ3ts9lvNT/lZ31p1QF6iuEsFRbqk9qwFfqJQFl6OyoOTor
         WC5o1f0hmAcIrMqBeNO93CdQdNnKc+TP3VESs7Ro/v/95PnVRc3yVlAygpvp0oFm0Ly5
         hkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792225889; x=1792830689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEum+lArOfGjD+3/r6eLfaoLMgK2123Y1ak1ZUBNHUw=;
        b=oRnlNZFIBjWx/nhiwcvTZ9k6DLARVxqaXedK/cj3TgiRy26FjfDOa/ooCS+x0ZZUw5
         XKJ8l1TDhZdrQ+Wwk8JILacpy0sWeV+We0eujpk7/dP8mdMyBQ+N7T8kklJDV+qwYrbj
         bq9cifz43l25VrwlbH+0TjYwhjn8icunSitdCvw33hwDD7thGLSOA/skhw/CRkbIXjlM
         92pYG88eEONVyo45K4opb4HMLmY/0LHt4OOtBYQmhozu36bzEzRsjx4l85xXa9BELrt0
         6U/+A3C9d/3OCGzjc2bnSrWi2DXSoA6+/zQdP6oeS5jYlx4s3Nu2MwxBpqogj6CbahTT
         wLFw==
X-Forwarded-Encrypted: i=1; AKwUvBwKK9ZZ+71LYuKjYOEfUjKYOw/vuBb7i+eUs8+rKzIDCPiw1J3ZZbKGTVj1F4qkH7lhhMps3imSScgAHWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVparZMSmvTTo//xfAhpSVxZKKc+5M29kcN0YYQoWgbBLPrv+r
	oshVnlBDGvDLGaECu6sZoTa0vJbtIiRaRdI94csia5YNc0i7fXxNYoREbcL55r1PyFRG9kB3CIS
	uSfTxgit8et34OmsCc4X1Y5oimzNBovQ=
X-Gm-Gg: AYBFou2kRSKrdRExoJa/C1IcMA3Hy7N5sXFY2HaXp7ikLANs7HTQzkLy38ZDfp/J57K
	Pr5NvnKt3/FtNNMWz0O2XWVIKBw++cWjUTb6NqCObGf5qaEjxic8+k6g2g2N4WeNWk7FihF6Xi7
	x2jnV/BE6kUJU8FO43VdL9uW7iuXsb2IcntihStJ/rg6DWneM3clXlSH69+8CbUra7z3MUzmaEk
	CUrZs7h5UGLqFWEDDgzyPZ3TJ87JcpDZ8LktW2RvZj5a3qmVb6rHTQiv04hTbnR3mjPKvu/w/EA
	3RZVmhOY5oHBBJobosQoKOVOFYagKWYlNUcvnzkMoV9D8Y3hIp6I2U/E8o1jtuVbbTCkeGAHX0r
	MJpxH4nOrglWpHTxcqz7XqT830mFcoXNxPJRK
X-Received: by 2002:a05:6402:13c4:b0:6b1:d2ee:392f with SMTP id
 4fb4d7f45d1cf-6b3a81a7587mr1047248a12.25.1792225888276; Sat, 17 Oct 2026
 01:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015135752.17028-1-vngocvan@gmail.com> <20261016012148.GD3329673@ax162>
 <CAJavoFk+zgySyNps5tuKmntmvuAyev=kKL640TFrfCc-njeWBw@mail.gmail.com>
 <CAJavoFkpO29P_oD_YLBkkp6_k080mN-ctRPXSvB+oj_-vpcR0w@mail.gmail.com> <20261016-fast-lyrical-frigatebird-dcd303@l-nschier-aarch64>
In-Reply-To: <20261016-fast-lyrical-frigatebird-dcd303@l-nschier-aarch64>
From: Van Vo <vngocvan@gmail.com>
Date: Sat, 17 Oct 2026 15:31:16 +0700
X-Gm-Features: AclHuK-zaTCBGyUNvXbb2Bqdj4_ImmceC6g3HmNzsMzh7zeoqvdlAmSTAUd-ze0
Message-ID: <CAJavoFnW4qF6biAyzL1dtf=ErNmbK87zG8nhCwR6ggqiFw8Z9g@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: honor the build directory for modules
To: Nicolas Schier <n.schier@fritz.com>
Cc: Nathan Chancellor <nathan@kernel.org>, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, masahiroy@kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

> So, if I get youre reply correctly, the issue this was not discovered
> "in the wild" but can only be reproduced by manual use of
> gen_compile_commands.py.

Yes, that is correct. I found this through code inspection and reproduced
it with manual invocations, not from a failure in an existing workflow.
My later test with Kbuild-generated artifacts was to validate the path
handling; it was not a failure through Kbuild's compile_commands.json
target.

While looking for earlier reports after your reply, I found Omer Zalman's
RFC dated 28 September 2026 [1]. It describes the same failure with -d,
an absolute modules.order path, and .mod paths resolved from the caller's
directory. The author also used a fixture and explicitly had not tested
that invocation against a real kernel build. I only found this RFC during
this follow-up search, after submitting my patch.

There is also a real project wrapper in DRBD that invokes the generator
directly with -d [2]. It scans the directory without passing modules.order,
so it is not evidence of this particular failure.

I do not currently have a report of this failure in a real-world workflow.

[1] https://marc.info/?l=3Dlinux-kbuild&m=3D179063910090741&w=3D1
[2] https://github.com/LINBIT/drbd/blob/6d3787572ac95313afe7d139df7b24d589a=
00a6b/misc/gen-compile-commands.sh

Thanks,
V=C3=B5 Ng=E1=BB=8Dc V=C4=83n

On Fri, Oct 16, 2026 at 8:42=E2=80=AFPM Nicolas Schier <n.schier@fritz.com>=
 wrote:
>
> On Fri, Oct 16, 2026 at 01:25:33PM +0700, Van Vo wrote:
> > Hi Nathan,
> >
> > > How was this discovered?
> >
> > This came from code inspection of standalone use of -d with an explicit
> > modules.order argument, followed initially by a constructed reproducer.
> > It was not a failure encountered through Kbuild's compile_commands.json
> > target.
> >
> > I have now reproduced it using real Kbuild-generated artifacts from
> > 0fcb05b72344f40806cbe810de8872f1698bf053 on Linux/aarch64, with Python
> > 3.11.13 and GCC 12.2.0. This was a partial lib/ build with CONFIG_TEST_=
LKM=3Dm.
> >
> > The following uses a disposable source tree at that base. The guards
> > prevent overwriting an existing output directory or result file:
> >
> >     (
> >         set -eu
> >         test ! -e out
> >         test ! -e outside.json
> >         test ! -e inside.json
> >         make O=3Dout -j1 allnoconfig
> >         bash scripts/config --file out/.config --enable MODULES \
> >             --enable RUNTIME_TESTING_MENU --module TEST_LKM
> >         make O=3Dout -j1 olddefconfig
> >         make O=3Dout -j1 V=3D1 lib/
> >
> >         outside_exit=3D0
> >         python3 -B scripts/clang-tools/gen_compile_commands.py -a ar \
> >             -d out -o outside.json out/lib/modules.order ||
> >             outside_exit=3D$?
> >         printf 'outside_exit=3D%s\n' "$outside_exit"
> >
> >         inside_exit=3D0
> >         (cd out &&
> >          python3 -B ../scripts/clang-tools/gen_compile_commands.py -a a=
r \
> >              -o ../inside.json lib/modules.order) ||
> >             inside_exit=3D$?
> >         printf 'inside_exit=3D%s\n' "$inside_exit"
> >         test "$outside_exit" -eq 1
> >         test "$inside_exit" -eq 0
> >         python3 -c \
> >             'import json; assert len(json.load(open("inside.json"))) =
=3D=3D 1'
> >     )
> >
> > Kbuild generated lib/test_module.o, lib/test_module.mod,
> > lib/.test_module.o.cmd and lib/modules.order under out/. Both .mod and
> > modules.order contain lib/test_module.o.
> >
> > The old script's invocation from the source directory fails with:
> >
> >     FileNotFoundError: [Errno 2] No such file or directory:
> > 'lib/test_module.mod'
> >     outside_exit=3D1
> >
> > The same artifacts work when the old script is invoked from out/:
> >
> >     inside_exit=3D0
> >
> > The successful invocation produces one JSON entry for lib/test_module.c=
.
> > The patched script succeeds from the source directory and produces an
> > identical entry. The old script also fails with absolute paths for -d
> > and modules.order; the patched script succeeds with those paths too.
> >
> > Only the standalone generator invocation is outside the build directory=
;
> > compilation itself runs under out/. This is not a full kernel build or
> > a boot/runtime test.
>
> Thanks for the detailed reproducer.
>
> Quoting from Nathan:
> | How was this discovered? This cannot happen within Kbuild because this
> | script is always invoked from within the build folder, so was it a
> | manual invocation or something else?
>
> So, if I get youre reply correctly, the issue this was not discovered
> "in the wild" but can only be reproduced by manual use of
> gen_compile_commands.py.
>
> --
> Nicolas
