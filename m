Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAC13EF0A0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890862; cv=pass; b=N9RstiHKThAuNZ0s0f2P02amEtBWCj9xQ05zBW4yf4z4E18tHWaaatQvZ2L88GKoS5IKxd/BX9YgI2DfgI2A7xBva9CCSrKkCNJrSeh7o/Ce0f9d1NgvwTe7PoEKzbxPEKE7EeAHQZ4UGcxC7gZ3r5zUK9Rkb2vk7+LsugW6o78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890862; c=relaxed/simple;
	bh=mJd4W21ehe2gG1oPa82O4mkajM6Oekem7ACig6EyrCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=RPJL5VBjqzNz8IU6ExJjECFU0jGWhgIvRgBjsuAd/ctuREkGr6rbKfPrvEAEJDIs0Yuym/va4rBhiEpbHeWkgwccVYQAK7WGMahMjO0HZtGHFZUnI8SNRE0FSmmn+b3UgMEDROm4XircG6lGDVNB1eE9EdLsSdnEclJ7KieVatE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIRilmpZ; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIRilmpZ"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e227422e3so264632966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790890859; cv=none;
        d=google.com; s=arc-20260327;
        b=CrzdgGfU5zNFqQrUGzHrBuKRttgOhLpN3xXvy5P+no1+AgTrKEousQKEoJ84aUilky
         YUbQr0zpTVzC9l/Bm38E+5UKqz2u4c3JgMp5fF/h86L7ay4MHiau7pAjOmYWnSR3zXYP
         //cRrXPC6URZA6FKZX5D28FpP0hOr1zRCJ6rzxrn1z/7d3rUSyJZOb89GYSX0UvDIf/E
         JWL/3BLiuTaNYKkylPSHZ6mqeetIdhlWkvrIW6N12KZTb7tIry7klpCrU/yY3Apdyevq
         ebKkHgAY9XpPTA4Sa5SIuCmVtxhWsNIPXDkZ29kzA0evgTMCO4Sr92e8GTeYeij/8xai
         NURA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y5VVpxkCw2qSWatTTLuSmXtriX32bvao8AVsrJEur4A=;
        fh=zOraXkLFlA92r9TwNSYrP/JX2IFQmLe1ljlqOGHoiaI=;
        b=pcJM/Xl+ZSpbskgC4aiY0oD3IP4uSNUtm1aRVpD46/vJjXXqb6IZ8RRi34khK2eVwT
         uga9NR5oPscqnNpPQGaW3EG967Uin+5iLjuB/d3/zTFk9Yc36m4Axc1uUo9WflpsghyU
         I0E3eO6HSqpMLGHYJ+9j8nTTd3vjTxXdmN2ybvfcHoWrg7u2byfu7GQ92VpcWotZzhtR
         17zxHSYnis9OzAaLrPD+bh0dEZWIu5ydm1fcWE4lYjSxU4Ht4wv4KcoEelITXjjCOZUf
         hf72H9OYgOIpbE6hdMFAmA4WjzlxlwUPcqAp04LFUIBx+AfMLalm7VBt2zPfKsWasKqj
         WXPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790890859; x=1791495659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5VVpxkCw2qSWatTTLuSmXtriX32bvao8AVsrJEur4A=;
        b=eIRilmpZ1+1pJDgueE2ih52EynjguhuzFhTOWyEYeWQKV8VgglCclZSipRosZp8kBg
         3mVXv91RWMEgGn07d4cSCqQK6F+JKWbFeAzfVrZZHKt3Dq/XQ4JHRALtizpNUsP3wqFD
         qcydXo0Z1Mo2nDEwZX/WYRBvsnLLlGxqrx2KZxdREOmbcdNns4EBpzqq1VmrQ3aKCUMW
         aBb1w+vYuFd777wlbivLrxRRkZ8sDCMmV6R11Skv6zghgDxnEcBmURCahgHwyhdWxsrj
         f+wobHTbSY2ZHpHd42YkL2Pr7i7pZzxyaVPwfC4E6DwCQZUnsx6YI+7I/+z3uJD26Et9
         F0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890859; x=1791495659;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5VVpxkCw2qSWatTTLuSmXtriX32bvao8AVsrJEur4A=;
        b=CYJW83mXF1gi6EWg+Lg9o0X6ukpJ8zmjhZur5YXAO1bPOLUk51Qb2Ovw3yuSP/B2ge
         thB4Jgry6MCte0klmaZt40+1wzK1mAR4F61IcFToK6CM4Y9w5G9w3+Ia/XzWnqrPkZvO
         NtT7KYormLxOROlv1WmrzqfspOY7T2Bc1PK21dXbpzYeR842JjIOrDdnj6x/9sKKRKbg
         j4MPU++hUkHaFpeH3ZL8sQHorB1RWcoSmliOAdKBboq8BNLP2/0hUGgFqe1JiZ7itGnH
         nl4a1+b8l7HUUHDMqtgCj/bWc5nFboWXV8jYDAsw/kf259vj8baEsoCXASXBcwUxdcP2
         cLVA==
X-Forwarded-Encrypted: i=1; AKwUvBywl/P1zWgh97U4ot82484IEjcY3+9BlDYlHhPFobbotVrWGHrNvc8siuW5Vuv1MMy/E7zVkalkMnbm3pE=@vger.kernel.org
X-Gm-Message-State: AFuF++mKIbAtCJS4/k6q0UmVPbu4xR4hLOYp40wuLAKDvkfnRmUZPCll
	stL/qMvkyTHdhfX1YjwKNh5v+MhqfhYA+u41KwDY0rVX+dNB1OSeLcoVAuCdeNZ7nbBgtWKxtj+
	/3J54bwPQNvVu+6Tv7JLwvrzfuhd5DwU=
X-Gm-Gg: AYBFou2I6Kp3IsEa+WUjSQRr657jlLhaGq0YhXqDKaBsm/8+Z98yT0nLU3IQ0GfmTBR
	mQm/deg8sXa4cMD5Bj8UI3m/Ru2QGXLcJ1H5sjTVG1VeiYFb8qtKPgfY6w6KYL6GvfyC0cyIyPM
	hzwcvBpLOz8XnmmPNTuOXmEOC9tfntq54GexMGfW9pFNqHDAHwMb7rIRtVmPLnGv8U2aRzfK9no
	IPjFIuhKs4etp9XqVkDWgbS88LC/4rS6EkVrGI6mcJjqF1uGvpu6ZkojjRIsQUg4mx9jDPa+wUl
	FDqcmN7sq0ObJWoIbL+qkEtM3T7CDC3qs8BcIg2fkiSYkCcdjqUi/AMOxpqbl3C9uGhGJouOr6J
	3sgxXatQRsjnEwdwVjUjLl4tRl1kg4ROmwVgP
X-Received: by 2002:a17:907:3f18:b0:c2a:c793:bdfd with SMTP id
 a640c23a62f3a-c2e4af48856mr71023666b.21.1790890858948; Thu, 01 Oct 2026
 14:40:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927154101.122633-1-voytikd@gmail.com> <art6lF6jcHBNHCi3@levanger>
 <CAAX90H1Ma5TkiSSg0CB-Tb__G++h-_P=+kiJbaQ4DtS0c+kVRw@mail.gmail.com> <ar525jXEMt3ZecH_@levanger>
In-Reply-To: <ar525jXEMt3ZecH_@levanger>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Thu, 1 Oct 2026 23:40:32 +0200
X-Gm-Features: AclHuK-nO2DGm-gU5DRm9Y2ksUCS848YqU3yXcNvK5QLTtIvmU5910yu4CGwmdo
Message-ID: <CAAX90H0PEoaKWrtNBHuN=M-cgqbP0BX2xd7_vc1+3S30xa-fLw@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/config: honor $KBUILD_OUTPUT by default
To: Dmitry Voytik <voytikd@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Rong Zhang <i@rong.moe>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thanks for the review!

On Thu, Oct 1, 2026 at 5:06=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wrot=
e:
>
> On Tue, Sep 29, 2026 at 09:15:28PM +0200, Dmitry Voytik wrote:
> > Hi Nicolas,
> >
> > Thank you for taking your time and reviewing the patch.
> >
> > On Tue, Sep 29, 2026 at 2:05=E2=80=AFPM Nicolas Schier <nsc@kernel.org>=
 wrote:
> > >
> > > On Sun, Sep 27, 2026 at 05:41:01PM +0200, Dmitry Voytik wrote:
> > > > If $KBUILD_OUTPUT is set, use it by default if --file is not passed=
.
> > > >
> > > > Fix the issue when the script silently updates a stale .config in
> > > > the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> > > > to be updated.
> > > > The problem can be worked around with --file, but this is easy to m=
iss,
> > > > and is inconsistent with how the Makefile and other tools work
> > > > (e.g., scripts/diffconfig).
> > > >
> > > > How to reproduce the issue:
> > > >       rm .config
> > > >       export KBUILD_OUTPUT=3D.out
> > > >       make defconfig
> > > >       ./scripts/config \
> > > >              -e CONFIG_UBSAN
> > > >       grep: .config: No such file or directory
> > > >
> > > > Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> > > > ---
> > > > v3:
> > > >  - Added an example in the commit message how to reproduce the issu=
e
> > > > v2:
> > > >  - Addressed comments by sashiko:
> > > >    - https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%=
40gmail.com
> > > >    - use basename when --refresh is used
> > > >    - remove echo which can be misleading when --file is passed
> > > > v1:
> > > >  - https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail=
.com/
> > > > ---
> > > >  scripts/config | 6 +++++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/scripts/config b/scripts/config
> > > > index 32428ea909c2..cdee67157fe1 100755
> > > > --- a/scripts/config
> > > > +++ b/scripts/config
> > > > @@ -130,6 +130,10 @@ on_exit() {
> > > >  trap on_exit EXIT
> > > >
> > > >  FN=3D.config
> > > > +if [ -n "${KBUILD_OUTPUT}" ]; then
> > > > +     FN=3D${KBUILD_OUTPUT}/${FN}
> > > > +fi
> > > > +
> > > >  CMDS=3D()
> > > >  while [[ $# -gt 0 ]]; do
> > > >       if [ "$1" =3D "--file" ]; then
> > > > @@ -229,7 +233,7 @@ while [ "$1" !=3D "" ] ; do
> > > >               ;;
> > > >
> > > >       --refresh)
> > > > -             yes "" | make oldconfig KCONFIG_CONFIG=3D$FN
> > > > +             yes "" | make oldconfig KCONFIG_CONFIG=3D$(basename $=
FN)
> > >
> > > Thanks for attempting to fix the '--refresh' option.  But this way,
> > > this may lead to very unexpected behaviour, as it regardlessly modifi=
es
> > > the path to the config file, even if it was specified via --file.
> > >
> > > If --file is given, it should take precedence over any KBUILD_OUTPUT
> > > (or KCONFIG_CONFIG) from the environment and not be changed unrequest=
ed.
> >
> > Thanks. I misunderstood what KBUILD_OUTPUT really means. For some reaso=
n,
> > I thought it should be a filename and not a full path. The
> > documentation entry is a bit vague on it.
> >
> > > It would be a tiny bit nicer to just strip the KBUILD_OUTPUT path fro=
m
> > > FN, e.g. (untested):
> > >
> > >                 yes "" | make oldconfig KCONFIG_CONFIG=3D"${FN#${KBUI=
LD_OUTPUT}/}"
> > >
> > > But I am still not feeling happy with that.
> >
> > Thanks for the suggestion! So, what I did - I just completely dropped
> > the second change hunk, i.e. kept it as is:
> >       yes "" | make oldconfig KCONFIG_CONFIG=3D$FN
> >
> > I tested the following three scenarios and it looks like it works as ex=
pected:
> >
> > make mrproper
> > export KBUILD_OUTPUT=3D.out
> > make defconfig
> > grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config
> >
> > # test basic use case:
> > ./scripts/config \
> >        -e CONFIG_UBSAN
> > grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config
> > ./scripts/config -d CONFIG_UBSAN
> >
> > # test --refresh picks up correct config file by using $KBUILD_OUTPUT
> > ./scripts/config --refresh \
> >        -e CONFIG_UBSAN
> > grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config
> > ./scripts/config -d CONFIG_UBSAN
> >
> > # test --file takes precedence over $KBUILD_OUTPUT
> > cp .out/.config .my_config
> > grep "CONFIG_UBSAN=3Dy" .my_config
> > ./scripts/config --file $(pwd)/.my_config --refresh \
> >        -e CONFIG_UBSAN
> > grep "CONFIG_UBSAN=3Dy" .my_config
>
> This one shows one of the problems with scripts/config: while the script
> itself handles relative paths to --file FILE from the current working
> directory, a call of Kbuild changes the working directory to
> $(KBUILD_OUTOUT) and realtive paths in KCONFIG_CONFIG are resolved from
> there.

Indeed, with the patch, if I pass a relative path,
it creates the config file in an unexpected place:

       make mrproper
       export KBUILD_OUTPUT=3D.out
       make defconfig
       mkdir .out2
       cp .out/.config .out2/.my_config
       ./scripts/config --file .out2/.my_config \
              --refresh \
              -e CONFIG_UBSAN
       ls .out/.out2/.my_config

Also, apparently, the following test case with --refresh misbehaves:
       ./scripts/config --refresh \
              -e CONFIG_UBSAN
It creates .out/.out/.config :)

I decided to always enforce converting $FN to the absolute path:

       diff --git a/scripts/config b/scripts/config
       index 4e29c3084fec..0b28fc498195 100755
       --- a/scripts/config
       +++ b/scripts/config
       @@ -147,6 +147,7 @@ while [[ $# -gt 0 ]]; do
       shift
       fi
       done
       +FN=3D$(realpath "$FN")

       set -- "${CMDS[@]}"
       if [ "$1" =3D "" ] ; then

With this change, all tests pass, no side effects as it seems.

> I don't have a solution in mind, that fits it all.  But I think it's
> important to not make things worse (or more unexpected) than before, by
> accident.
>
> > If you are fine with the above, I can send v4 with adding the above
> > testing steps into the commit message.
>
> yeah, please send a v4 and then let's see what we'll do with it, ok?

I'll send a v4 patch.
Thanks for the review!

> Thanks and kind regards,
> Nicolas

Best Regards,
Dmitry Voytik.
