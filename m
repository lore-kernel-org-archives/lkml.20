Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB6F2E738A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904891; cv=pass; b=JaY7xCOySWQTUp7IsKRYDEFOttdP03YDvz4Tw5EZe8zFVt+TYvDRrJ/aTSC3U8FVoegEgVKMcyF4maWKVeEeGuFtnMRRIdCx7ZYrVpC6ME2Kj+5oPH7tqzmk6K2zsW9d9BPYMGEqm5tKj4HQeLh3WBaKTunm7pXCp95HEhLOfxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904891; c=relaxed/simple;
	bh=h1HCJLEQ9BLytabBFaYf/KMp8Qk22/B0BHdbzfQal3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTzAf/5KNWjf2CEjtPQqU29bKLFLGNT50eB1Tl75NR2NAEPmmcEWcUVCYajuGqXC3FCXN03EiBROEmNsUjVgBdTWY26fVEaGMsLf3mdq4Cy1hii4CAenTlqjwuCoYN6UDfnV7C9Bbrl0IPQhjLwbWccA7IsWQF7a/Hm7X3+o3o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ff70JsPZ; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ff70JsPZ"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910a0cefaso583754985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790904888; cv=none;
        d=google.com; s=arc-20260327;
        b=f5+5jGggyc4xADeBojDIg4Gq6F6Ir09lFYFWrL2dWRQlnl5+H1hFvjXRAL0/ZKUnJn
         Pb7XDx3d9RuwoKuJGHT8F6dEqp9iNujtsu2i6X1UrKtbAqMnnpWDMkRTFkImGiAkTTru
         cWKNd6HjPmQOOlLe6tqePCek1eaWroiMzZLJC08dpI9LS7WJKl7U1d5cxzwr+64+6mPO
         pJu1brLBFzfulwjJT/pFFKkT5mj5ZPlqZC/5OeWDGSzfO9GEoJntVIeZfOyLlVsym5WV
         gdE9OBHdyL5Ot3+JIBWWJyCURgvRIe6/aqaFVmHSRgAG4XPG72sElVVg1XL5bUv5L+gP
         yMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lEDPdlMl/L6EY8lnf4mx1o2V5MSP/DV5bHjALEmrNuk=;
        fh=h28ygmyWqMs1Ot0tuDWYUnWJs5tIJAfGoS6k6VEnoNo=;
        b=o4Ur+v2VOFtvX71qC1Rcir97X/igm+rbjH7i1SPODw63rNfKqKSr7UYvdSodHpdM69
         MbV2ekLeVPTX7s9AXjxzls+aVEp+Q63xczVkPF74NsMjovdTOWyWZtkfh0wzLRm7t8VA
         oRy+tfaosGpgNkHQlULil4LXpxHW7rAztWsn0x7ISnxDwvflJUn26YPg8QgqLfevPp/5
         8CLKKf99pPQtX9ls1MP0VJYPjzgMiadRRrh8OKOKE+HJhCQkOXRG1k0SUxqP7oKA2PG/
         UIjOeNYt6EZ6BRDtD7zafGDqVCwX/zN8tLbGoV3etFRH3aqaFx8d+JTGvVVG4nbkZbCf
         qG0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790904888; x=1791509688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lEDPdlMl/L6EY8lnf4mx1o2V5MSP/DV5bHjALEmrNuk=;
        b=ff70JsPZyvpqv54/nVvCcR2wnX4UVOoyv0DBHw8i9i0eu9cuQ/Ke2VpqohPAaPZmO8
         7aEzXz+HZsLr65dULT2vXGpTJisy7xroMQ2lCgRBfwYhKxbiZq6CeC+yhKUdhoMEC15W
         aICnSUfNnFWWJldxmN22Kkmpu3vVWdLAc7Ywy/2/I1xG5BlIQM+VNuo9T+a4qy+xD6mP
         uGZkQG5UDXzCd/htBlVT2fZrLCF4OTAfCacG8yqb2rekuwmWrEIL4ZWJUcHqhzs0cZgH
         TRpwscYS3I1Og+Lf0XpXa/kPoDbJevGBGDnWL2WXq5n1D+XqAGPNAkCKCDEzuLBRlZsH
         +S/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790904888; x=1791509688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEDPdlMl/L6EY8lnf4mx1o2V5MSP/DV5bHjALEmrNuk=;
        b=xSwQFlP5GJDSnKXnjQvdf20e1Tl+59gpUZhLRbpgX51xsANjsGMRpBRE5+9w6AFp70
         PWOsbDGSUIbnHXq+ppD4I3urx2fub+Q8QZtWeKhiEYsbfKgFbIlosi4PsiYVEeCXTJKL
         Y4C4k2Rc4MqURvckPI5MKyAwyNj/lllBCKNPllFb8iQoDvHJeGWSKnXa4JFOqeL03aPU
         l/lPUG6G/0qgt6ZPjPCkwOJllG9OKNezhN+XJ77pWuOHfewDSCiwxyLjgroNcgXs84VQ
         5lMjdahf5xZdGCXgUla+ogg/OfErh3rf9ySOr35QYmi2AiwayrQSSF4lFS2UyTS4G+me
         wzgw==
X-Forwarded-Encrypted: i=1; AKwUvBytz6ZZ0XFQm6z9O7KHI03V2YJ74t7RbaLY+n540vGjJnqNOsvShxNw8l/6t6ZUwwOy1cq1CTsXLSOgU68=@vger.kernel.org
X-Gm-Message-State: AFuF++kTlxlo+F7OxGQR90T4yx+W8IvuFQISv8EwCz2OUkCrXbS++H8v
	kSgNa45G0QJquzi9Gqlo7FE8SE/jN2fW2qetHbNfag5johtmR4KfLm3nzCRuvQlI/3dEAbNhQ7o
	zpAfyxb2KNGnuaWxVhjRMVe7/QAFYWNc=
X-Gm-Gg: AYBFou0XJwhaWC0hW1kMr/Avek5kaIf/1brhR7XPI2gWLvTxwx8cFHqZRvVxmzcWrzI
	Yonzwh1aGDYPrVp9C2Y7/GfA2Ei/CEqZqoAe5/6j/XGwMKJorVmZfRTVcshDMGbrnhg0skkXaSr
	viWa3+waLYVKTmpg4aAw1J3G/z61jQH7nGGsQfvVzYtJpu4wsw3aWhWR9Hpx6sJp+Sp9mxUmEr+
	N7eIwKBiCIjqOr2i3tJ5gowCSoFScMoeGvjGo/lBznbun0kIOn4qjws+1e1O7be0aU9Q3Qs6b95
	Xaum+EIQcvVaiumCcm/Jgb2w63Gykan9XHyGJUSAXhe1jk9uyQ7tnqm+3LneDiGOUlahiKwJ5C1
	S9WJfsNnySnCz/jRgqZMN2O0uBkWVby7MEt5jT7YZ5ylnCdFRzJoF+n9vyjow6WoMUE7UYTEC+H
	lKrNROFC7b3550Qsq42X7yP6SgbsmA2pE/mHQxTpPN72e/RhHCDgMJDrDGcwC0OzKu/Hi/YtWWz
	rPHRIeWVxFuEmF/Qd+0sYiIvcFSlI4=
X-Received: by 2002:a05:620a:c52:b0:93a:1ca:f14a with SMTP id
 af79cd13be357-93ce8d470e8mr201779085a.17.1790904888195; Thu, 01 Oct 2026
 18:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926012718.15675-1-jain.sm@gmail.com> <00571efd-cc91-4ba7-a904-9ce183313f25@ieee.org>
In-Reply-To: <00571efd-cc91-4ba7-a904-9ce183313f25@ieee.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Fri, 2 Oct 2026 07:04:35 +0530
X-Gm-Features: AclHuK_bf5QN5P9pAa3ZDlIljiJE9FgQcsE7or19anZYBCp3aSBZAP0Jgaq10oE
Message-ID: <CA+FWx=mP40LGSNxX=ivmam9d9i+JxtZBhuebGQHqyVK2Yeq4zg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] lib: parser: reject out-of-range values in match_number()
To: Alex Elder <elder@ieee.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Elder <elder@kernel.org>, 
	David Gow <david@davidgow.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for looking at this.

> The result is still placed in memory referred to by an
> integer pointer, right?  Not a long long?

Yes. The interface doesn't change: match_int(), match_octal() and
match_hex() still return an int through an int *, and the accepted
range is still INT_MIN..INT_MAX. The unsigned long long is only used
while parsing, so that a value outside the int range can be detected
and rejected with -ERANGE instead of being stored as a different int.
By the time *result is written, the value is known to fit.

> It might be better to define a new function that expects to
> produce (up to) 64 bit result values (signed, or maybe not),
> rather than changing this function.

For callers that need 64-bit values there is already match_u64()
(match_u64int() with kstrtoull()), so I don't think a new function is
needed. This patch is only about the int helpers accepting
out-of-range input.

> Or... maybe there's a simpler way to catch a too-long
> input string.

I looked at that, but the length of the string doesn't decide whether
the value fits: "4294967295" is only 10 characters and doesn't fit in
an int, while leading zeros make a long string that does
("00000000000000000001"). What is needed is the overflow indication,
which simple_strtoull() drops (there is a FIXME at that spot in
simple_strntoull()). _parse_integer() returns it, so the patch parses
the same way simple_strtol() does, keeps that flag, and compares the
magnitude with the int range.

> This matters because match_number() calls simple_strtol(),
> which is implemented using simple_strtoul(), and that is
> implemented using simple_strtoull().  So if a very long
> numeric string is passed to match_number(), it will be
> misinterpreted as something that overflows 32 bits,
> which will end up having a misleading (but essentially
> valid) int value.
>
> Is that correct?

Yes, that is the problem, in two forms:

- On 64-bit, a value of 2^64 or more saturates to ULLONG_MAX in
  simple_strtoull(), and simple_strtol() turns that into -1L, which
  passes the INT_MIN/INT_MAX check. Values from 2^64 - 2^31 to
  2^64 - 1 wrap to small negative longs the same way. So match_int()
  returns 0 with *result =3D -1 for "18446744073709551615" or
  "99999999999999999999".

- On 32-bit, long is as wide as int, so the range check can never
  fail: "4294967295" also gives -1, and "2147483648" gives INT_MIN.

In both cases the caller gets success and a different number from the
one that was written, for example in a mount option. With the patch
these return -ERANGE. Values that fit in an int are accepted exactly
as before, with the same result and the same syntax.

Sorry the changelog made it sound as if the result were becoming
64-bit; only the intermediate magnitude is. I can reword that in a v3
if it helps.

Thanks,
Shashank

On Fri, Oct 2, 2026 at 3:07=E2=80=AFAM Alex Elder <elder@ieee.org> wrote:
>
> On 9/25/26 8:27 PM, Shashank Mohan Jain wrote:
> > match_int(), match_octal() and match_hex() store the result in an int
> > and return -EINVAL or -ERANGE on failure.  match_number() checks the
> > range by parsing into a long with simple_strtol() and comparing against
> > INT_MIN/INT_MAX, a check added by commit 77dd3b0bd17a ("lib/parser.c:
> > avoid overflow in match_number()").  That does not catch every
> > out-of-range input:
>
> The result is still placed in memory referred to by an
> integer pointer, right?  Not a long long?
>
> It might be better to define a new function that expects to
> produce (up to) 64 bit result values (signed, or maybe not),
> rather than changing this function.
>
> Or... maybe there's a simpler way to catch a too-long
> input string.
> >
> >   - simple_strtoull() saturates to ULLONG_MAX on overflow and
>
> This matters because match_number() calls simple_strtol(),
> which is implemented using simple_strtoul(), and that is
> implemented using simple_strtoull().  So if a very long
> numeric string is passed to match_number(), it will be
> misinterpreted as something that overflows 32 bits,
> which will end up having a misleading (but essentially
> valid) int value.
>
> Is that correct?
>
> At this point I'm just trying to make sure I understand what
> your intent is, because I'm unsure this is the right way to
> achieve what you're after.
>
> I guess I'm stuck on match_number() expecting to produce
> an int result, and your discussion talks a lot about 64-bit
> values.
>
>                                         -Alex
>
>
> >     simple_strtol() simply converts its result to long, so any value of
> >     at least 2^64 - 2^31, and anything that overflows 64 bits, ends up
> >     inside the int range.  On 64-bit, match_int() returns 0 and sets
> >     the result to -1 for "18446744073709551615" or
> >     "99999999999999999999", match_hex() does the same for
> >     "ffffffffffffffff", and "-18446744073709551615" gives 1.
> >
> >   - On 32-bit, long has the same width as int, so the range check can
> >     never fail: "2147483648" gives INT_MIN and "4294967295" gives -1.
> >
> > On 64-bit, values from INT_MAX + 1 up to 2^64 - 2^31 - 1 are already
> > rejected, so for those this only makes 32-bit kernels behave like
> > 64-bit ones.  Two callers store the result in a u32 and so accepted
> > such values on 32-bit only: the legacy NFSv4 idmapper upcall
> > (fs/nfs/nfs4idmap.c), which falls back to a numeric id when the lookup
> > fails, and rd_pages=3D in drivers/target/target_core_rd.c, which also
> > ignores match_int()'s return value.
> >
> > These helpers parse mount options and similar user-supplied strings,
> > so an out-of-range number is silently accepted as a different value
> > instead of being rejected.
> >
> > Parse the number the same way simple_strtol() does, using the same
> > kstrtox helpers, but keep the unsigned magnitude and the overflow
> > indication, and check the magnitude against the int range.  The
> > accepted syntax, including what counts as "no number" (-EINVAL), is
> > unchanged.  kstrtoint() is not used because it rejects trailing
> > characters ("12abc" gives 12 today) and differs in the handling of a
> > lone "-" or "0x".
> >
> > Fixes: 77dd3b0bd17a ("lib/parser.c: avoid overflow in match_number()")
> > Assisted-by: LLM
> > Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> > ---
> > These patches were prepared with Claude Code (Anthropic), model Claude =
Opus 5.5
> > (claude-opus-5-5): the analysis, the Lean models used to find and check=
 the bugs,
> > the fixes and the tests. I reviewed them and take responsibility for th=
em. The
> > trailer only says "Assisted-by: LLM", as Documentation/process/coding-a=
ssistants.rst
> > requires since commit 816d9992d9ed ("coding-assistants: simplify attrib=
ution").
> >
> > Changes in v2:
> > - Resent with my full name; no code changes.
> >
> > v1: https://lore.kernel.org/r/20260925102334.49693-1-jain.sm@gmail.com
> >
> >   lib/parser.c | 39 +++++++++++++++++++++++++++------------
> >   1 file changed, 27 insertions(+), 12 deletions(-)
> >
> > diff --git a/lib/parser.c b/lib/parser.c
> > index 62da0ac0d438..30fdaefe4957 100644
> > --- a/lib/parser.c
> > +++ b/lib/parser.c
> > @@ -11,6 +11,8 @@
> >   #include <linux/slab.h>
> >   #include <linux/string.h>
> >
> > +#include "kstrtox.h"
> > +
> >   /*
> >    * max size needed by different bases to express U64
> >    * HEX: "0xFFFFFFFFFFFFFFFF" --> 18
> > @@ -137,22 +139,35 @@ EXPORT_SYMBOL(match_token);
> >    */
> >   static int match_number(substring_t *s, int *result, int base)
> >   {
> > -     char *endp;
> >       char buf[NUMBER_BUF_LEN];
> > -     int ret;
> > -     long val;
> > +     unsigned long long val;
> > +     unsigned int radix =3D base;
> > +     const char *cp =3D buf;
> > +     bool negative;
> > +     unsigned int rv;
> >
> >       if (match_strlcpy(buf, s, NUMBER_BUF_LEN) >=3D NUMBER_BUF_LEN)
> >               return -ERANGE;
> > -     ret =3D 0;
> > -     val =3D simple_strtol(buf, &endp, base);
> > -     if (endp =3D=3D buf)
> > -             ret =3D -EINVAL;
> > -     else if (val < (long)INT_MIN || val > (long)INT_MAX)
> > -             ret =3D -ERANGE;
> > -     else
> > -             *result =3D (int) val;
> > -     return ret;
> > +
> > +     /*
> > +      * Parse like simple_strtol() does, but keep the magnitude and th=
e
> > +      * overflow indication instead of truncating to a long, so that
> > +      * values outside the range of an int can be rejected.
> > +      */
> > +     negative =3D *cp =3D=3D '-';
> > +     if (negative)
> > +             cp++;
> > +     cp =3D _parse_integer_fixup_radix(cp, &radix);
> > +     rv =3D _parse_integer(cp, radix, &val);
> > +     if (cp + (rv & ~KSTRTOX_OVERFLOW) =3D=3D buf)
> > +             return -EINVAL;
> > +
> > +     if (rv & KSTRTOX_OVERFLOW ||
> > +         val > (negative ? (unsigned long long)INT_MAX + 1 : INT_MAX))
> > +             return -ERANGE;
> > +
> > +     *result =3D negative ? -(long long)val : (long long)val;
> > +     return 0;
> >   }
> >
> >   /**
>
