Received: from mail-ej2-f23.google.com (mail-ej2-f23.google.com [74.125.228.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82452F83A2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.151
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791233199; cv=pass; b=PhEAbHaiXMZ3/5+8hFyfNuLGstUfLm0NJLg3rKslTOUYfhMN/H8KykupTOV1y32CTPW/mQ9x9bjaks/d6robDTygho4/RSjlolhKqH0BZO3cQb8OgNCDH4xp3CJzOFuSmMBoiD3ki7mDcKMNTLDLkWBBCwzTKQX39cMLdQ5NoZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791233199; c=relaxed/simple;
	bh=DEruL27+IFVtkLRaDJJMO0Xo1R0/Z2wePzZBeSosWXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIVvpQcgeIv0ZcCg1TrZiAdyaIop7087LnHMPDlEmHhztvs0K4hbPHSkOTOZuFHV+p7OlsjpkcLdLROpTuCpBD2CB3H57wH5cB4UIXtwSdiODxjvkLGcSuBw/JRW2Lm2hmtrqM/SFX//QSPivWVHxZFT6zf5Zr8uLrUV+0hl/HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaicVK6Z; arc=pass smtp.client-ip=74.125.228.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaicVK6Z"
Received: by mail-ej2-f23.google.com with SMTP id a640c23a62f3a-c2e27d11f43so143345266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791233196; cv=none;
        d=google.com; s=arc-20260327;
        b=MgAD6LC5l4cBV31P5uGxNom8QuqOZVHX2INguwDg5FnLuUy9RSbANRLeYFe7TEahrG
         Frh8T9tQ/n7IvfUD4CpbHHLxnhXj6oLtUmVyrRMqbHwx4MsXTY74xIJPBI4QkQeQAuss
         8jOQNZYpq8F/DTOoGg74n6aRtTrHeeqJGeZQ+jHQuK9oPu9zXMxocUucRVrg5Z0h9FtE
         W5nxH3F1wmDPWjKKRU2fu5gJhQb9DsZvcgxIpz7CyOnKa25LnTNMUHDhSFXFaKRp8A7X
         i5zH9ayBu10y/SZgXIaARHRazp+CvksGh3jHshwrHi47FTh8dD7zluSE+kpbzUH0cGKX
         NnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FCIv6GW2p9XGUpbYf2mTV5AV2WWUQdSBwQvErpGpC3Y=;
        fh=4Ab8+gOKvRkDo1gygSksawI6rn69WDb0Mfo2rcszcXI=;
        b=NTqh5yN1NQK56pOUtE7lwNovkDGTwFvaqqgkryKs4sdjOQH1kEOmh/Xv+JtlQ4Im+1
         6UOEm0ZtAAz8F5AUauzPH0eUBOmnwLrScqO2vRPT2KzwB/IkpF2vQUkgW6Vh5rE6YdNc
         lYH6UQWKVYV8ygVyMD7h1Yvr2sZQIE3W3N9PDHQ6tiU9lqXtc77/54vhsMZi/YpaDnnO
         adm5H1rdtI/F9DFsDosig5pSi204E1cA5ZBBhvFJdOMGHkzNFrvv1kLSYcsDo5LlQYvn
         HqN5nUD7LEt9Ht19CO2t1xMbeGr3gO2rUXDPfzjDNqmqMKDusKr4cNqXBSIeTvTTX76Q
         19sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791233196; x=1791837996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FCIv6GW2p9XGUpbYf2mTV5AV2WWUQdSBwQvErpGpC3Y=;
        b=IaicVK6ZPhWMjoyWmY7L/klbnTeLyAKW/FFPiA7PzSORs5xJJeshRuncRS5dWbYrxs
         F6W+Ttbee+GJx+l81O/8IYqpluU3vb7FQVtV9Hw/k5zRWXlm0OlyYZbolmHlk0WXqoXp
         tiQB/pNhSN6555Dr0YigQD+OV4DLnj1Jwc3jsJykqzeGKgmBCXHheIX9JuPstqVJxZ90
         FoPXBK0QH2MTUBO2m6bGsUXIozBhcFYRRlMCEbQwfFlzEhbXN4bfTzV4mdQcv0t4N/tk
         HWXeMhrB3GNOaHj4uigjcBPdFaNb051MTC2YnFhlOLMw7uGjwtYKAXza2e1Dkb92FU3B
         dnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791233196; x=1791837996;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCIv6GW2p9XGUpbYf2mTV5AV2WWUQdSBwQvErpGpC3Y=;
        b=uROVYg8z6malHCw5DfEmmAjHQEte9MH64NtZv00QzUEUsJLrjLwHmdRlyxK9/TxGwB
         J194UAqTT+9tiWdQR/7cTMUPcUjlhBc4oQuvTojWwnHFqbQl0dfcn+B/xbHZRt4ksf/o
         fLoWn6fKwTgeQbxI5zAn2Y6BXi5BBS3XPDkHY7FFZe7/ab1izMn16oEy7qSBSu0Iy5md
         ssueIvQebxnTQlKvcXqCP9m/7/wpuBAP2K3HGVAahQRns+1twPqiykzunwVQ//mY+Mjw
         I2vBUD9aMUrRcBY3xVV+SdsQdCJrrZ+ys+G4qpYvBSsn495/VmZ0cO9+JSdNZ9ZJU8EZ
         WNQQ==
X-Forwarded-Encrypted: i=1; AKwUvBza9wtZV4G5u1WcVAbPB/vmnTuNS6qfUqYijVhIxUcDRFCnwAD2jcnUzo7twOUaF9TlX0cQWG22GbdKQTo=@vger.kernel.org
X-Gm-Message-State: AFuF++k/hNmMUVwgP43H706cudkzI/F8dwk4UUJx8BG+bzz+/MtpeUB/
	cxv2EriNDKiYc0zOa3wg/lZmXjIgqn2hub+qU4JQZpiclkcXya9KfPto5+Flra5AQqhKQ/mOtmR
	PZKO9HVRNReArm4woiOIyUCSQULQHpXk=
X-Gm-Gg: AYBFou3ZqLiHXKYK1df9rx4dab2tX1M/ZPSivNhx/aha0nLv3amwGIeg4sfPzviPwCJ
	iQK4fsiADomUYC9vWcpKhWOE2X0gGGP3yHv7FTXlSYUnZvOVCOi3+AYmLDW3sZeiS6O3qK6LIWI
	NSD4VbmywVtppVLdoEonaVxaQ2Ia7CEqaKLt+NkU/FJiQ8EBf9aXsNEBOak3kQsb9UU12R9G3XW
	GrRl3vqIkDuxTSTr3CcfhK9cX92UJ7yHv1xdJS/T8wkKHV09Pt/A9XmJh/V+MWAzi0xb/Zgmwjh
	87+GntDBuUVnw3qlZCR25jsfmRjeui6iyTAhcptAYQaPk7r3AUp9bTuQ61tGUxJvw00dPcaww6F
	QmOUwFo0SMCcyyKYeqUaaUnIiw7sftrtgHgECRBE32H+bJ95URqmImEEm7GjR5QpWYA==
X-Received: by 2002:a17:907:ea93:b0:c2b:ca98:872c with SMTP id
 a640c23a62f3a-c316107a120mr81401066b.20.1791233195884; Mon, 05 Oct 2026
 13:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002222119.393508-1-voytikd@gmail.com> <179121581235.2275809.12565811683284940522.b4-review@b4>
In-Reply-To: <179121581235.2275809.12565811683284940522.b4-review@b4>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Mon, 5 Oct 2026 22:46:09 +0200
X-Gm-Features: AclHuK9czbOG0vx54pwTE8cJeUjoUsIT1EZ3k56Y7E4gkp574ps6cHTUTHUObns
Message-ID: <CAAX90H3KQzPk2L5VX0evJVtpjtpzi+58mAqnpdiqfAh++mD1+Q@mail.gmail.com>
Subject: Re: [PATCH v5] scripts/config: honor $KBUILD_OUTPUT by default
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Nicolas Schier <n.schier@fritz.com>, Rong Zhang <i@rong.moe>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

Thanks again for looking into this.

On Mon, Oct 5, 2026 at 5:56=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Hi Dmitry,
>
> > If $KBUILD_OUTPUT is set, use it by default if --file is not passed.
> >
> > Fix the issue when the script silently updates a stale .config in
> > the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> > to be updated.
> > Handle properly if the config file is a relative path.
> >
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
> > How the patch was tested:
> >       make mrproper
> >       export KBUILD_OUTPUT=3D.out
> >       make defconfig
> >       grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config || echo "OK"
> >
> > Test the basic usage:
> >       ./scripts/config -e CONFIG_UBSAN
> >       grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config && echo "OK"
> >
> > Test --refresh picks up correct config file by using $KBUILD_OUTPUT:
> >       ./scripts/config -d CONFIG_UBSAN
> >       ./scripts/config --refresh -e CONFIG_UBSAN
> >       grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config && echo "OK"
> >
> > Test --file takes precedence over $KBUILD_OUTPUT and a relative
> > path is handled properly:
> >       ./scripts/config -d CONFIG_UBSAN
> >       mkdir .out2
> >       cp .out/.config .out2/.my_config
> >       grep "CONFIG_UBSAN=3Dy" .out2/.my_config
> >       ./scripts/config --file .out2/.my_config --refresh \
> >              -e CONFIG_UBSAN
> >       grep "CONFIG_UBSAN=3Dy" .out2/.my_config && echo "OK"
> >       ls .out/.out2 || echo "OK"
> >       ls .out/.out || echo "OK"
> >
> > Test --file can accept files with hyphen:
> >       ./scripts/config -d CONFIG_UBSAN
> >       cp .out/.config -- -my_config
> >       grep "CONFIG_UBSAN=3Dy" -- -my_config || echo "OK"
> >       ./scripts/config  --refresh \
> >              -e CONFIG_UBSAN --file -my_config
> >       grep "CONFIG_UBSAN=3Dy" -- -my_config && echo "OK"
> >
> > Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> > ---
> > v5:
> >  - Per Nathan Chancellor's suggestion, improved handling $FN path by
> >    realpath
> >  - https://lore.kernel.org/lkml/179097210878.309835.1052330726254457833=
7.b4-review@b4/
> >  - Documented the new test scenario in the git commit message
> > v4:
> >  - Addressed Nicolas Schier's comments - dropped the change how '--refr=
esh'
> >    is handled
> >  - Implemented conversion of $FN to the absolute path which helps with
> >    '--refresh' and relative paths
> >  - Documented testing steps in the commit message
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
> >  scripts/config | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/scripts/config b/scripts/config
> > index 32428ea909c2..7e84c3d4e621 100755
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
> > @@ -143,6 +147,7 @@ while [[ $# -gt 0 ]]; do
> >               shift
> >       fi
> >  done
> > +FN=3D$(realpath -q -- "$FN" || echo "$FN")
>
> Sashiko has some further complaints about this:
>
>   https://sashiko.dev/#/patchset/20261002222119.393508-1-voytikd@gmail.co=
m

I saw this, but I thought other *NIX environments were not supported
-- only those based on GNU coreutils.
Sashiko's comment on filename that can break echo was a bit contrived IMHO.
Anyhow, lesson learned, next time I'll make sure there is zero
sashiko's complaints :)

> Due to travel and Linux Plumbers,

Have fun!

> I am not sure I will be able to think
> about the best way to resolve this before I finalize the Kbuild tree for
> 7.4, so this may need to be deferred until after 7.4-rc1 is released
> (i.e., it will target 7.5).

I understand. Thank you for your work!

> One option that immediately comes to mind is
> requiring $KBUILD_OUTPUT to exist already and only running realpath on
> $KBUILD_OUTPUT, which would leave the script unchanged for the case of
> $KBUILD_OUTPUT being unset, which seems safer to me:
>
>   if [ -n "$KBUILD_OUTPUT" ]; then
>       if [ ! -d "$KBUILD_OUTPUT" ]; then
>           echo "KBUILD_OUTPUT is set but does not exist or is not a direc=
tory, create it before running $myname" >&2
>           exit 1
>       fi
>       FN=3D$(realpath "$KBUILD_OUTPUT")/$FN
>   fi

I like this approach. Let me try that. If sashiko doesn't complain,
I'll post a v6 patch.

> This would leave a relative '--file' value + KBUILD_OUTPUT + '--refresh'
> in a weird state still but it appears that commit f757f6011c92 ("kbuild:
> fix argument parsing in scripts/config") got that wrong almost two years
> ago so it doesn't feel like it is worth caring about that until someone
> actually complains about it (but I might be missing something).
>
> --
> Cheers,
> Nathan

Thanks and best regards,
Dmitry Voytik.
