Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A403FB7EB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597358; cv=pass; b=jsWc8tymu7z3hv/bUlYas2REky3cO1ecu05ezjZnH61fPS5KGmmZTqbGxJRgWyEb323ybTwWR+6RGgfQ+tXaiKk9vXy4lFu6tpLv56ulNgBDOTUylLchuz/1ZXXvU9g+coMiGLCya9sbmESBaBgsXr4SlU9Cq2mB+hoMUpM5jTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597358; c=relaxed/simple;
	bh=FZunErYkVNJJQ11EF4YHuP0K++wAQpzXoBzPU2X8QiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERGBsV6xB7BpXNj6SZRgKzq+Tx2gs6qte0V1XcZ9rI0TR2bM+MlO6Zqil3MFl5W54XfVky+bkwkuV7ewklPsgHsTEJoIZqksydMv15hAHcGCRo5v2w+DszX0u64s6q8oZulULNO9AHebi/3JQmYkaZiG0xnoar7c21ZnYdiyrhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqcaPw3c; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqcaPw3c"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910ad20d4so363511185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597355; cv=none;
        d=google.com; s=arc-20260327;
        b=WzPdBV1hEWioX0k3znffY3yJ1XeDA7YjYFh88n8Ytht0s7MtE1SpTO6dkSsDcRx44g
         jnXufFIpHQifiQp/qCPSyGGRU87+BVAFYGs4HnsiHIbVGGOAUr1Mmurt6Yyc+ZxnNYUC
         4sfb6y1bPim/2F7gETZRA96BKzQybCOcRf/2R2Rf/axVmyUlzbU5JzuoRCQnRuLV9DIy
         R2J5rx4ocLRqFW8/sQXrZWmAYPEt3BAbnVuEkWnk3D1a5Ew1bse6lS346coCcrqlErb7
         BHfvccRFLyHGZJQO0ctQ0YQyHGhX/TbUMIVaWUyhEZgO3O2b1U4/TBpmzva2B+ZKnynr
         RMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y9WCKovXYLpnCkEW6JyFyhOGcsuRaT6I+sjr19qnHKM=;
        fh=XqtlSTPcTSYfXMmDztg9dl8Fq8aXo56Mx7hLyaRIxXo=;
        b=RJmHT8Ky4VGu05elQcyfqruoKwCrJ3XVECRv2uie5S/27iTDQjd0QjzFzVFYlf8DDQ
         LFTBEQVB7rTIEGNKWoutEWngnQ1pcfo1R9mV7ebUCGYvzK4/MngQWyFxz5v+NUvUzWpm
         1WJGtnf897IDzaYyzT9OkYxJGOq5iSUjIuNSm0ylQZRH/a2cK6y+SNu0jOXEmOCpT659
         aEsscK15JQEyTqUMzIIY7yvs9j0tl90z/1fARVb0XL87vSx8/ge+A6HLRRFYXJbQWs1u
         XQCfeSFgrWUfIoR9A2UNnwoir+T3hITVYAdz7E+ysqd6ZCdJTtP495CkGawXmHwRdL/T
         EoAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790597355; x=1791202155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y9WCKovXYLpnCkEW6JyFyhOGcsuRaT6I+sjr19qnHKM=;
        b=oqcaPw3cMzcqzvP/DQPDRTzelzAHrjE085JJDKG+6BfU0orPodMVlDNktzJHJB/yNj
         XnIVjhQ9Iyy29iq8kxD8yRfiy4DzuevV76hRd57Vo06HFzjbpVVN5HUCaX3Z9ukpSdpO
         EUAluZsWfNl10rUu507head6rMu/gv7MULmjkwu3tj+wLwlQ9/kxve3SxVKK9S/MwX3Z
         YNQjNxNdZNffyD/tWK5Z57Vpzynz/cXNO9ehBAM3IGfeV3sFLGtXv+qcSmWF6AN0maEl
         nB4kWTJggHCaOBgjkqKEKiXyvn2ln3OQT1Te0M0fc6lMxZxTkOJr1QeH87k2ia4scQdW
         9Vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597355; x=1791202155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9WCKovXYLpnCkEW6JyFyhOGcsuRaT6I+sjr19qnHKM=;
        b=PP+jyp7XvVKZVRm6Q2HBzNYh/7sTxQ5BmMjFwmf2xRbOES5pQDf7SE9DgIXNMtuWpS
         D8rd7OppwQ74B8S8cA0qUbtn4mPPPzbM/ZLsB6XuuUDcqalrteNQ6R4LsEuoSvDJmmOp
         N9Xv+9F6xvXs76FkLHSHpd+AnLoPHUZVwJIoxOiqbFUYUwCpxjwNIfFdrJhBOXrDO5nm
         kaYAT04R5XrmHvLAvsLrAXsnnst3hiQfIieFfpJafDl+2o6OLhpWpRfb5g+MfKRqI2q/
         qMf5LUDxezwB5wzAj9S9a412rtN9U3O6L8R4WnrMavbC7/YBrqHho9R/cLWpOKIHiWfB
         3AaA==
X-Forwarded-Encrypted: i=1; AKwUvBxT+FOf2NEp0FMZLUxwiHmmkl5CMPsaSG869HurFDQTmhCo3Te0y3wT+gg94US0vIMKc99Izf68gfuv3hk=@vger.kernel.org
X-Gm-Message-State: AFuF++n5H4nE5nyvH47V6h13MqTAMnet6EQ9coQZ4FATT9ucNoygji2C
	ZPnlKepIb+6vrwMPJhxSsxMDzkoi4U0d3/+1cKVuguLQtvT/okNJG8WG7lYW6HIt+CIZEJ67Yx1
	4JE4qaIvNxmW4XjD5n/cvmD4KSOLvekk=
X-Gm-Gg: AYBFou1jnhUhuxiTdXYlZS5l0NncsB8YKr+eoHewRUtiqJ3PhxMon3ZgvBtDC6+hhyz
	1E9nQMHBS8iZdBJ+WqQEFFZXIrUrLBcSmr4mr8JqLattLTRxnyl8eBWTYii8nA6Fm/B7IzfJzWY
	hAl4zvvXdceGvYkTUNspKmJrFJ64TFTGIUZ4BxQR1nXQXDnPQTVLqoGXvfV62YI45cs6I05OkwW
	eATzY56pya3yZAcLUUJKjq7qjTgfFG3t17elivJ5u1qUiek3k5tn5Ush4xo2hbN8jCuATf/LbYI
	MXEQbogC/++x0GLXDvfrZ0nWU9z/jgzNlKsJwTPzF2M6cL1LHiusr6VmI7VWPCpcZE3qEnETAmy
	wE5wb2Svtzv/IIb0y5vjrIkOormG50LFMuuLoRTIosZxqCbZRnSuz/R+CTQUGhuv+6SN8CVrkpl
	hGbG+Rh9iLXHLHzWejJ135kWe2oUk1D2ueTUTus355lFpyvg==
X-Received: by 2002:a05:620a:7102:b0:939:13bf:e861 with SMTP id
 af79cd13be357-93c474960a6mr1955778885a.40.1790597354929; Mon, 28 Sep 2026
 05:09:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928093601.79224-1-jain.sm@gmail.com> <20260928093601.79224-2-jain.sm@gmail.com>
 <imuoalnzhebreu6btt2qp5itwz67eckm5favcjrinb42lwrqy3@prd5dpnnt5fl>
In-Reply-To: <imuoalnzhebreu6btt2qp5itwz67eckm5favcjrinb42lwrqy3@prd5dpnnt5fl>
From: shashank Jain <jain.sm@gmail.com>
Date: Mon, 28 Sep 2026 17:39:03 +0530
X-Gm-Features: AclHuK8vlU04e0FRRCiIuc3C5ayin9-9M2vDVlCPJvgpN1LpF4jra_JHlmDlLKo
Message-ID: <CA+FWx=k6hON+wZY4KeQ4kU+0-f04uCtF2QRiyepC_MC8XOL66Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] time/jiffies: Don't saturate usecs_to_jiffies() on a
 truncated limit
To: Joel Granados <joel.granados@kernel.org>
Cc: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

Agreed on all three points. For v2 I'll split patch 1 into the removal
of the bogus limit and the rounding fix, drop the now-pointless
__builtin_constant_p() branch in usecs_to_jiffies(), and rewrite the
changelogs and the cover letter much shorter, with a table of the wrong
values as in Zhan's patch.

I'll wait a few days for other comments before sending v2.

Shashank


On Mon, Sep 28, 2026 at 5:08=E2=80=AFPM Joel Granados <joel.granados@kernel=
.org> wrote:
>
> On Mon, Sep 28, 2026 at 03:05:59PM +0530, Shashank Mohan Jain wrote:
> > usecs_to_jiffies() and __usecs_to_jiffies() return MAX_JIFFY_OFFSET, an
> > effectively infinite timeout, when
> >
> >       u > jiffies_to_usecs(MAX_JIFFY_OFFSET)
> >
> > but jiffies_to_usecs() returns an unsigned int, so the limit is
> > MAX_JIFFY_OFFSET microseconds truncated to 32 bits, an arbitrary value.
> > With HZ=3D300 the out-of-line jiffies_to_usecs() also overflows 64 bits=
 in
> > j * HZ_TO_USEC_NUM, and the limit ends up at 1431649098 us on 64-bit an=
d
> > 1431649781 us on 32-bit. Every timeout between about 23.9 and 71.6
> > minutes then becomes infinite: usecs_to_jiffies(2000000000) returns
> > MAX_JIFFY_OFFSET instead of 600000. For instance, a PIE tupdate or a
> > DAMOS watermark interval of 30 minutes never fires at HZ=3D300. With
> > HZ=3D100, 250 and 1000 the limit is 4294947296, 4294959296 and 42949652=
96
> > us, so there only the top 19999, 7999 and 1999 values are affected.
> >
> > The check is not needed at all. MAX_JIFFY_OFFSET is at least 2^30 - 2
> > jiffies and HZ is below 12288, so UINT_MAX microseconds are far below
> > MAX_JIFFY_OFFSET jiffies for every supported HZ. Drop it, update the
> > kernel-doc, and add a static_assert() for the assumption.
> >
> > The bogus limit was also hiding a wrap: when HZ divides USEC_PER_SEC,
> > _usecs_to_jiffies() rounds up with (u + USEC_PER_SEC / HZ - 1) in
> > unsigned int, which wraps for u close to UINT_MAX (usecs_to_jiffies(
> > UINT_MAX) would become 0 at HZ=3D100). Round up with a remainder test
> > instead. The reciprocal multiplication used for the other HZ values is
> > done in 64 bits and does not wrap for any 32-bit input.
>
> Looks like your fixing two things in one patch. I would suggest making
> two patches
>
> >
> > Values above the old limit, including UINT_MAX, now give a finite
> > timeout (at most about 71.6 minutes) with every HZ. No caller uses
> > UINT_MAX as an "infinite" marker; the callers that clamp to UINT_MAX or
> > range-check the result (TCP_RTO_MIN_US, TCP_DELACK_MAX_US) keep working=
.
> >
> > When HZ does not divide USEC_PER_SEC, jiffies_to_usecs() is out of line=
,
> > so the check also defeated the constant folding: every
> > usecs_to_jiffies(<constant>) compiled to a call to jiffies_to_usecs()
> > and a compare. Those now fold to a constant.
>
> This commit message (and the others in this series as well as the cover
> letter) is too verbose, hard to read. It is not obvious what you are
> doing and why.
>
> I suggest a table of erroneous values. Like [1]
>
> [1] https://lore.kernel.org/20260923134237.3628505-1-zhanxusheng@xiaomi.c=
om
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Assisted-by: LLM
> > Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> > ---
> > Checked in userspace over all 2^32 inputs, with the current code and
> > the code from this patch both extracted verbatim from the tree and
> > built with the generated timeconst.h, for every Kconfig HZ value (24,
> > 32, 48, 64, 100, 128, 200, 250, 256, 300, 500, 1000, 1024, 1200),
> > 32- and 64-bit. The KUnit test in patch 3 fails without this patch on
> > UML x86_64 (HZ=3D100) and on qemu x86_64 and i386 with HZ=3D300, and pa=
sses
> > with it. Prepared with Claude Code (Anthropic), model Claude Opus 5.5
> > (claude-opus-5-5).
> >
> >  include/linux/jiffies.h | 22 ++++++++--------------
> >  kernel/time/time.c      | 10 +++++++---
> >  2 files changed, 15 insertions(+), 17 deletions(-)
> >
> > diff --git a/include/linux/jiffies.h b/include/linux/jiffies.h
> > index bbd57061802c..d3f2663e4435 100644
> > --- a/include/linux/jiffies.h
> > +++ b/include/linux/jiffies.h
> > @@ -575,7 +575,8 @@ extern unsigned long __usecs_to_jiffies(const unsig=
ned int u);
> >  #if !(USEC_PER_SEC % HZ)
> >  static inline unsigned long _usecs_to_jiffies(const unsigned int u)
> >  {
> > -     return (u + (USEC_PER_SEC / HZ) - 1) / (USEC_PER_SEC / HZ);
> > +     /* Round up without overflowing for u close to UINT_MAX */
> > +     return u / (USEC_PER_SEC / HZ) + !!(u % (USEC_PER_SEC / HZ));
> >  }
> >  #else
> >  static inline unsigned long _usecs_to_jiffies(const unsigned int u)
> > @@ -589,14 +590,10 @@ static inline unsigned long _usecs_to_jiffies(con=
st unsigned int u)
> >   * usecs_to_jiffies: - convert microseconds to jiffies
> >   * @u:       time in microseconds
> >   *
> > - * conversion is done as follows:
> > - *
> > - * - 'too large' values [that would result in larger than
> > - *   MAX_JIFFY_OFFSET values] mean 'infinite timeout' too.
> > - *
> > - * - all other values are converted to jiffies by either multiplying
> > - *   the input value by a factor or dividing it with a factor and
> > - *   handling any 32-bit overflows as for msecs_to_jiffies.
> > + * conversion is done by either multiplying the input value by a facto=
r
> > + * or dividing it with a factor, rounding up. Any unsigned int number =
of
> > + * microseconds is far below MAX_JIFFY_OFFSET jiffies for every suppor=
ted
> > + * HZ, so, unlike msecs_to_jiffies(), there is no 'infinite timeout' c=
ase.
> >   *
> >   * usecs_to_jiffies() checks for the passed in value being a constant
> >   * via __builtin_constant_p() allowing gcc to eliminate most of the
> > @@ -611,13 +608,10 @@ static inline unsigned long _usecs_to_jiffies(con=
st unsigned int u)
> >   */
> >  static __always_inline unsigned long usecs_to_jiffies(const unsigned i=
nt u)
> >  {
> > -     if (__builtin_constant_p(u)) {
> > -             if (u > jiffies_to_usecs(MAX_JIFFY_OFFSET))
> > -                     return MAX_JIFFY_OFFSET;
> > +     if (__builtin_constant_p(u))
> >               return _usecs_to_jiffies(u);
> > -     } else {
> > +     else
> >               return __usecs_to_jiffies(u);
> > -     }
>
> This effectively becomes
>
> if (__builtin_constant_p(u))
>   return _usecs_to_jiffies(u);
> else
>   return _usecs_to_jiffies(u);
>
> What is the point of this?
>
> Best
> >
> >  extern unsigned long timespec64_to_jiffies(const struct timespec64 *va=
lue);
> > diff --git a/kernel/time/time.c b/kernel/time/time.c
> > index 079ab34f61db..470195e88ca0 100644
> > --- a/kernel/time/time.c
> > +++ b/kernel/time/time.c
> > @@ -591,16 +591,20 @@ unsigned long __msecs_to_jiffies(const unsigned i=
nt m)
> >  }
> >  EXPORT_SYMBOL(__msecs_to_jiffies);
> >
> > +/*
> > + * UINT_MAX microseconds are far less than MAX_JIFFY_OFFSET jiffies fo=
r every
> > + * supported HZ, so usecs_to_jiffies() never needs to saturate.
> > + */
> > +static_assert((u64)UINT_MAX * HZ / USEC_PER_SEC < MAX_JIFFY_OFFSET);
> > +
> >  /**
> >   * __usecs_to_jiffies: - convert microseconds to jiffies
> > - * @u:       time in milliseconds
> > + * @u:       time in microseconds
> >   *
> >   * Return: jiffies value
> >   */
> >  unsigned long __usecs_to_jiffies(const unsigned int u)
> >  {
> > -     if (u > jiffies_to_usecs(MAX_JIFFY_OFFSET))
> > -             return MAX_JIFFY_OFFSET;
> >       return _usecs_to_jiffies(u);
> >  }
> >  EXPORT_SYMBOL(__usecs_to_jiffies);
> > --
> > 2.43.0
> >
