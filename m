Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBA73932D1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709358; cv=pass; b=PF/Tq91eLdwlnMVE2ZvkURKKQWTV9HeAv4ZzA1dIBW5udv8IJRKG53BQV3RQdi2LVpvqBGK3t8Z6/SDyY0w1qkZF330YlWcpSakBkKu4VcLnEqFiHr+angzABrJTg3S4bk4tZkMtlVTi8i+a1F0FZ1oJYSnzUxT9XdyM/Z68Z9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709358; c=relaxed/simple;
	bh=V3u7iIRW+SXzbS6GvRRQpxd4ozwFgtSViYufwpoTtdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T52UENLRQDIx+xJxuzSUDf/vHcOP1LsmeNN4Q0KHPBYDJ50Pd0KeN+5edKx3AoccexfldT/FIzEO9C3BTDpq00Y8jQyB1rK5kzs+KCOXiefSFHPizLeD1DNaDtCMbxGfC+E38VP3JMjhb0+KE1d09c3nNwUSdycFKyzTtUCmnrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qslBokqP; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qslBokqP"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae359e2c0so6816004a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790709355; cv=none;
        d=google.com; s=arc-20260327;
        b=ds3vqXvsbiTSvn8mOZIWU+to+bK4vbjNe5vddMaCSqPD1pRS6vUZhkUOqHXquAhk93
         ksY4/yb478+3rKogBAcCwhv6UAMFWzXyWMIenyLDLYmKCjLYLWq8Wv/NEebSSnuZiA0B
         sXNJ0b1n30akEW9i8yzi09nFVGHbG6Bi432av5XwoSbKVPBtANvO7MF5gFYcLD7q34tR
         nNZRzWA4g0oBTW7OhodtRRcZw84h7UvEKdxKZOpR68FTAeVHUiquO8bIEZj2R2BMabIE
         /my5eTWewXzZ4JkqkoM6QM+e64wCGdlClHY3cv6uDK2tuTJ9iLudOo8rrpwklLjQj/fj
         6uuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R9/VRUhXxroLFk9m3E/XqlsvjwngRrUYtOD5JdsvCsw=;
        fh=CpTXRRX4ByZPw/eHykHknXv+qxlZLBxTdQZS17rziBM=;
        b=o9fU6q7H5sFvJIzwu00DIi/wM11wSTAsjjc3eavKZlGNeLpg6rP0VebIxOX+QxVAMy
         1m/xQ36usoMN2GchZmM9LB1sG4Er2546mE3h5UYeUDgjj/joO19zPPqJmv+rMaV6qE8a
         cygba2kynacf6z0u3j/mtWPpycZ9T8Ctr+zelakfiKSsTqB7cLfkrzLAC4ySjtZYf1Yl
         ydesG7J5wPCc552h9zgRUME5Op/A59OkdDE8U+zjpT+4A5PiZ7BOiitfX6CRI5I/nRdB
         srE97GpQh8RnPfc2ecXkH1nFWBxYF1I2x0wYZnRAbQEz7ER7SrRy+Zx3KOzT6Mp0BL+J
         5IqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790709355; x=1791314155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R9/VRUhXxroLFk9m3E/XqlsvjwngRrUYtOD5JdsvCsw=;
        b=qslBokqP82LRNNX6hIQZtgRhKdAYxxY4AMKVekyjD2NqxOsndrf/7nDfe2jzrOq05p
         Mt3Xwfi01eubvnjcheIcCTzsFDw7f1g1O5Th1JIGYARcaj2IPAYd9ZaNiyu9UDilMW0B
         RCLCiJ4Sx3iC2NTaYKp/8FGnkUfP1QuPkGIkAV2tkFvfed9jqfZ6Q5J1o5xUvlMNT7rN
         AdE/vebjSbtOn+9xn0juGtX0w366PmRBZTiajNzGO0OOCFb7eljdtS68OEXbUyxcGC4L
         1I/fFeR10a9R7b7x+Ehd1K9Ra3lar+ZCtfNHd1EIDBRfL07Tm8b94vNeZrcDGImnqfO9
         IbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790709355; x=1791314155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9/VRUhXxroLFk9m3E/XqlsvjwngRrUYtOD5JdsvCsw=;
        b=UNdjUgGbp+zH+mPk2W8SzUAlSxsRvDAvDPXZtNI5Yio5DXAPcRNVKVvFT/0KKrWV6D
         ZBYssfhid3tXaacnmou13c3IZeWrby+8Gx+c4233kGocLFLeEHgMTSoETJrYafRcuDOa
         5Wz1oWwKpqUFxq9S92mEIAOMRO4yG7EFhQeSG+MSAjMTu10rn0txLXq+5HLgfOnU+Vqk
         H80cGsUcmgrVXyEobpRLGJ/z7En/SNsDVviu6fVhutGQXJdRzuWgEQ2QJJZTM4IVL25W
         iii+QQQW83SSXjaojrLTvDCg2Y5Op3Tc4XKZZvDOBFbayW1h01gWdmpZ9cK+nRywrg5u
         +IbA==
X-Forwarded-Encrypted: i=1; AKwUvBx+ckhdZCKglqv5neJ5SbLy7f+MSJNLrOPRML73DFavp1E4s12K78IvR0evvtqhpBrZkKhmky0CUxdB2pk=@vger.kernel.org
X-Gm-Message-State: AFuF++lahzJd79a1ggXnKVF6gHdT0G6bOCoHFxERKylhIkImwz+7lR9q
	4VMgcMQgxyPQJSAcwMpUwKo1YVaJxPXghpyVHYt57W5Bn3RTcthi5Iz57XYqVOUySdWg27BBFnx
	66pnx0AP3oQ5qeIL4ZzpEKyJWR6qdTa0=
X-Gm-Gg: AYBFou0a3d/4rFZJAeIl+Qcq7BJXRGmRr0ZER3TCx7JmCrttr8RqVG3eaDWawsjIPbN
	9kgZIK1iXIE6X4gu4UbeBHtaiN4N73bjTEOy31E3uNVeOsD60+JluGY+VOeeKvRb/HPMaZZ3cXT
	aA68JOjrurd8DbVYKt8PMDPaOXkxjjAPs38UiD4c1Ngua0fCHDj7NbsxcbfxXuHtiMy4Zsykl30
	qtIpHwTNxm9m1sCCBizjc2QRZr79v7ul+exgCkCe+Fbde8CmsMVQo3qzhTG+JqgbdXYLGEP0qd1
	3QcVlmcx5URH216kN0PevzKW6/xqUdSibUf2SHn+e4hqHwusis0oDcx47YooDOyh+8KupwVCsfY
	WCIPGuo6tIENL9V6c3vljah1S/MdwQxANvzvtvM4ZRIfnjGs=
X-Received: by 2002:a17:907:d716:b0:c29:45f6:6a0b with SMTP id
 a640c23a62f3a-c2e164a5084mr28126066b.34.1790709355254; Tue, 29 Sep 2026
 12:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927154101.122633-1-voytikd@gmail.com> <art6lF6jcHBNHCi3@levanger>
In-Reply-To: <art6lF6jcHBNHCi3@levanger>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Tue, 29 Sep 2026 21:15:28 +0200
X-Gm-Features: AclHuK8VindsUJVuOx3tG9I4lHPb0qjYshyVqVxUDEBQ5F3je96HCCV6NbeCaHg
Message-ID: <CAAX90H1Ma5TkiSSg0CB-Tb__G++h-_P=+kiJbaQ4DtS0c+kVRw@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/config: honor $KBUILD_OUTPUT by default
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Rong Zhang <i@rong.moe>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Dmitry Voytik <voytikd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thank you for taking your time and reviewing the patch.

On Tue, Sep 29, 2026 at 2:05=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wro=
te:
>
> On Sun, Sep 27, 2026 at 05:41:01PM +0200, Dmitry Voytik wrote:
> > If $KBUILD_OUTPUT is set, use it by default if --file is not passed.
> >
> > Fix the issue when the script silently updates a stale .config in
> > the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> > to be updated.
> > The problem can be worked around with --file, but this is easy to miss,
> > and is inconsistent with how the Makefile and other tools work
> > (e.g., scripts/diffconfig).
> >
> > How to reproduce the issue:
> >       rm .config
> >       export KBUILD_OUTPUT=3D.out
> >       make defconfig
> >       ./scripts/config \
> >              -e CONFIG_UBSAN
> >       grep: .config: No such file or directory
> >
> > Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> > ---
> > v3:
> >  - Added an example in the commit message how to reproduce the issue
> > v2:
> >  - Addressed comments by sashiko:
> >    - https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%40gm=
ail.com
> >    - use basename when --refresh is used
> >    - remove echo which can be misleading when --file is passed
> > v1:
> >  - https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail.com=
/
> > ---
> >  scripts/config | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/config b/scripts/config
> > index 32428ea909c2..cdee67157fe1 100755
> > --- a/scripts/config
> > +++ b/scripts/config
> > @@ -130,6 +130,10 @@ on_exit() {
> >  trap on_exit EXIT
> >
> >  FN=3D.config
> > +if [ -n "${KBUILD_OUTPUT}" ]; then
> > +     FN=3D${KBUILD_OUTPUT}/${FN}
> > +fi
> > +
> >  CMDS=3D()
> >  while [[ $# -gt 0 ]]; do
> >       if [ "$1" =3D "--file" ]; then
> > @@ -229,7 +233,7 @@ while [ "$1" !=3D "" ] ; do
> >               ;;
> >
> >       --refresh)
> > -             yes "" | make oldconfig KCONFIG_CONFIG=3D$FN
> > +             yes "" | make oldconfig KCONFIG_CONFIG=3D$(basename $FN)
>
> Thanks for attempting to fix the '--refresh' option.  But this way,
> this may lead to very unexpected behaviour, as it regardlessly modifies
> the path to the config file, even if it was specified via --file.
>
> If --file is given, it should take precedence over any KBUILD_OUTPUT
> (or KCONFIG_CONFIG) from the environment and not be changed unrequested.

Thanks. I misunderstood what KBUILD_OUTPUT really means. For some reason,
I thought it should be a filename and not a full path. The
documentation entry is a bit vague on it.

> It would be a tiny bit nicer to just strip the KBUILD_OUTPUT path from
> FN, e.g. (untested):
>
>                 yes "" | make oldconfig KCONFIG_CONFIG=3D"${FN#${KBUILD_O=
UTPUT}/}"
>
> But I am still not feeling happy with that.

Thanks for the suggestion! So, what I did - I just completely dropped
the second change hunk, i.e. kept it as is:
      yes "" | make oldconfig KCONFIG_CONFIG=3D$FN

I tested the following three scenarios and it looks like it works as expect=
ed:

make mrproper
export KBUILD_OUTPUT=3D.out
make defconfig
grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config

# test basic use case:
./scripts/config \
       -e CONFIG_UBSAN
grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config
./scripts/config -d CONFIG_UBSAN

# test --refresh picks up correct config file by using $KBUILD_OUTPUT
./scripts/config --refresh \
       -e CONFIG_UBSAN
grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config
./scripts/config -d CONFIG_UBSAN

# test --file takes precedence over $KBUILD_OUTPUT
cp .out/.config .my_config
grep "CONFIG_UBSAN=3Dy" .my_config
./scripts/config --file $(pwd)/.my_config --refresh \
       -e CONFIG_UBSAN
grep "CONFIG_UBSAN=3Dy" .my_config

If you are fine with the above, I can send v4 with adding the above
testing steps into the commit message.
Thanks!

> --
> Nicolas

--=20
Best Regards,
Dmitry Voytik.
