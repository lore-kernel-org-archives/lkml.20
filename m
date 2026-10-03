Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2E71F938
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 02:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.232
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790993563; cv=pass; b=byOOxc6CSvp05KViQinr2O1/m5tbJ2oAqDGwIqyT+GIFz7b4yA9XO9Zi3Ot1zGNM8y7p3Bm9pVu9qRjLPteiZgivl7Mh5a6PS4qaER3RE5EtK9MmAQ7CfgLT5KMkZ1s/zM+nd4AUj0dVI4RCsYGFx63HYPBKIzu4PzjeJqe+9v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790993563; c=relaxed/simple;
	bh=FDDJh3/TwT1rIjXnKgA+NQkpkn3a9oNIxeXkudsvOsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D30r5oOMyXa4hRz2C4KKJFGIij+9rhiwWltAlBt5N9+fpFY5rRbHRhx9YSIqf1kvtZ3zcdxPKtg9nn8d9IxBaNgI5vNoZT7ZhSuREjDjFkSQOPSjVGPpxXibHvJmmmwwshXJfBSVkEgceWqYIAzYfKFTqi3BJ0wllt61V9lGjN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJCm+sUG; arc=pass smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJCm+sUG"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93cc48a2aeaso13050585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790993561; cv=none;
        d=google.com; s=arc-20260327;
        b=cqmaDg2zmnKbEHrcTbkB3oSOauPiCAEfeqRvb4ZBKR/IWnizwl5/w7SEbrEXJhoDrq
         JHlmCpU5ewNzmJSAr4g5BlpV4Bq+LPz11vpekDvWN2qku1blTd/+yoZiuZBH3Iv7H9gw
         M+8hqeb99z8Dtb3+4QwOwOEJ20uOdOhGwEGKCJRnk/ycU8mBVhGNlkB7XFEdrq99IlZs
         Ft208WDZQNLEXhGoFiVM8Pr0JmEf1GtEQb8AryH3cochc1+kxUDy2XYdOvrGvwYgrHDV
         RZGDRecvnUY5Hg9jtFg1ZFBHz78QE5RPGlpauQCUNRvsJUucRLg+IvzKDUm3r/2A3bM8
         qnTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l1ocKnZnU5GnvYsBI9Avdj3Rs/aQ+o3p+drRx572zHs=;
        fh=J6LGCv8TOoIx5rZ2EIhl/hfON5sHLVpSJnEZxB/my58=;
        b=G6YAMCa/04Pl+wOCtDfEqKPkun/LnIsSCdHEKXLm9hpmZlHq6PTsSQk9L45BNOhida
         ktM86aW3H5i/LUMAstwVVpWHD0rg5e1t8X8LspQHuzVC/QR3FogLjKrQdgAVYjofChF0
         Iq8l1LDB2YT7d3jlD10AsnI33t9bOikUrlElxFjLfE3fdNO+AttMX7MLIJ6zcPkcioVx
         WJ3VUZTpfQ8Xa8Ao0n9oveldHuK4UgSE4ouiwRUU4GI6Nm1ZBGfjGMDh18P89vFrugh2
         1UzZPaz33L3CFt8Dp5Z7js6l6gKVsdJQe2ZV4dGEHmbw2aFtJgbaX/ERI1cBU+PbWMZD
         92qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790993561; x=1791598361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1ocKnZnU5GnvYsBI9Avdj3Rs/aQ+o3p+drRx572zHs=;
        b=fJCm+sUGPHkgIg2wfbK8CgJXmbAqC5KliBeURmq+JbFRzZ59PnoYBcDo2J/9vCAP1D
         AYXh1Q2t5U/wo4I3yi+l3DRCzkv9C1vtLL1J3ie02eLhq2phk/v4DNcV0w+d//mHZ0t0
         8860no42tdAT4HYxeRRNZX/vzNffxBdH2+DWldqwOFSqIhfAtwc8QXXwLx9Qb9IPf4cU
         OZmsggKIAKOrzJqS4OD+bsPiW5oQunbuQqSFk+0ymCylruRyQxDbSFldko3HuH2tIDBx
         WSWIPaJXd98kOkv6Kjc8nYhOvzcE0jUm3zbkrdogN2G7TryVnGD2HoMtHNJRxyThJWKR
         CGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790993561; x=1791598361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1ocKnZnU5GnvYsBI9Avdj3Rs/aQ+o3p+drRx572zHs=;
        b=OfG+QrVFSw4dBPyRdN6HsPMIL1a+sPl6aspAN7PGEBb3xBdhg7bcJejd+KPWWsta1S
         XSl/YBLroDH6xjUtXQsID7l64fNPD3RAAXQAf9FFrGoEONdyx6+d1jZino0w8kJoqOzI
         zWiZcY4WOyFBSbVj2TRVaMW0F+ueCpIVC6fmtaS/53TRPHmFqNxY1JT3Ga7Ob/fjS9G0
         YNW3qxlIDb+wSeKMqFw/Yg75dGiJ8OrN/XxM06wt4eFsFCPVrktmlo8n+f+EZ8dEjyRG
         tEgYJbi0CVfaR+Fi3BcmATQ0+xfsRo22bjo8LDOgSjWIOE/NpZlgLc3s7iU70UWCprcC
         k4jA==
X-Forwarded-Encrypted: i=1; AKwUvBzmqauhFMaWkOLv3tqlEpwvagyFUmKv5H/F1X9sBtnAO42dsk0Oj8KT6fdYDO/DOyfcxoFl/OomQPlTCf4=@vger.kernel.org
X-Gm-Message-State: AFuF++lriycnPHPgh2OQ9MZUwx1zz1rPoF/wqaHX+XMTqZiT5oT3D/aR
	CEkqbOgQQfaZ6o6kzfxmXPTh3znytogcjeQMj9ahtlqVdsbEFmmrMj1v3YwFGQVib4fLtxQAIxo
	LzVHXCXGrEVe4uJt+dp4qwZmlKgyZEGM=
X-Gm-Gg: AYBFou1eESg/dMup+rTYO13IcokmibdPE6fZzib5HBLGw1ZvsrcQLj1Vbi/Nt8hu1++
	ntHl6Kb/WaSehkIxX7njlBw2QMit/0urlBJCgB+P8FX/okToO8/zL6Qfek119YVtjAIWlQNaenm
	YBCCf0Er4/KA8wDQtFvK24PbJPc0K/SW6b5G0WOd/sq65OgPl7n0sDwhRnv33SHV5ELQH+5OEXQ
	M7aCSn/BeNEhUsLpw614m6ctX0JkhluPhVze9RYr66oXBP9hAcFrIbT/7LOFRozWxcZS3QzqNR2
	S+mM0tCTdJ5a6E1Mvjvnd6m+ZNKn06Mx3tk6gGzT5mCZVjMyCV25En/ni1vuKCBuDSeJb5ZsCJ8
	dD+ReKpCLrbHq0z+Q8jgsnLcptsVTsfnYl83JQKKSucxHrGusLdofmmYfbXkLP6u1pTSsKcOCau
	UnTUb7c0DS/vvDQPKUWbJ8OE5pTwCniSReFeOBEnjlAA+zHppgVsgquAvRF0EI1hrIhf++agN82
	keXB3K1OIl/Ver89KEEKN4n21kBvZY=
X-Received: by 2002:a05:620a:7102:b0:93b:d7a0:d9e1 with SMTP id
 af79cd13be357-93cf18c6308mr870174285a.59.1790993560415; Fri, 02 Oct 2026
 19:12:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926012718.15675-1-jain.sm@gmail.com> <00571efd-cc91-4ba7-a904-9ce183313f25@ieee.org>
 <CA+FWx=mP40LGSNxX=ivmam9d9i+JxtZBhuebGQHqyVK2Yeq4zg@mail.gmail.com> <0287908d-79a4-44b9-80c0-666b7ef6f639@ieee.org>
In-Reply-To: <0287908d-79a4-44b9-80c0-666b7ef6f639@ieee.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Sat, 3 Oct 2026 07:42:28 +0530
X-Gm-Features: AclHuK9gWYCU5RzO2wPKyczQuq-dBbPkfbu1M-sFE5dXbrvT_QPOgytykcSrDLA
Message-ID: <CA+FWx==H3G2Etg+bYQxOGyr4_R9hhjG+abuJV33EH0CkEu572w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] lib: parser: reject out-of-range values in match_number()
To: Alex Elder <elder@ieee.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Elder <elder@kernel.org>, 
	David Gow <david@davidgow.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

> So your goal is simply to return an int as before, but make
> the function robustly handle all possible inputs.  It should
> return a valid value in *result when the input substring
> contains a value INT_MIN..INT_MAX inclusive, and return an
> error otherwise.

Yes, exactly.

> Would this work instead?

Yes, and it is simpler. I checked it against the callers and the
test:

- For the callers, the substring comes from match_one(), which ends a
  %d, %o or %x argument where simple_strtol()/simple_strtoul() stops
  parsing. So kstrtol() sees the same characters, and the only
  difference is that it rejects values that don't fit. I went through
  the in-tree match_int(), match_octal() and match_hex() callers I
  could find, and they all use %d, %o or %x tokens, none %s.

- It also covers 32-bit: there long is the same width as int, and
  kstrtol() itself returns -ERANGE for anything outside the long range,
  so the INT_MIN/INT_MAX check is only needed on 64-bit.

- The cases in the KUnit test in patch 2/2 give the same results with
  kstrtol(), so the test doesn't need to change.

kstrtol() also accepts a leading '+' and a trailing newline, but a
%d/%o/%x argument from match_token() never contains those.

I'll send a v3 of patch 1/2 with your version (with "int ret; long res;"
for the two declarations) and add a Suggested-by: for you, if that's OK.

Thanks,
Shashank

On Sat, Oct 3, 2026 at 2:51=E2=80=AFAM Alex Elder <elder@ieee.org> wrote:
>
> On 10/1/26 8:34 PM, shashank Jain wrote:
> > Hi Alex,
> >
> > Thanks for looking at this.
> >
> >> The result is still placed in memory referred to by an
> >> integer pointer, right?  Not a long long?
> >
> > Yes. The interface doesn't change: match_int(), match_octal() and
> > match_hex() still return an int through an int *, and the accepted
> > range is still INT_MIN..INT_MAX. The unsigned long long is only used
> > while parsing, so that a value outside the int range can be detected
> > and rejected with -ERANGE instead of being stored as a different int.
> > By the time *result is written, the value is known to fit.
>
> So your goal is simply to return an int as before, but make
> the function robustly handle all possible inputs.  It should
> return a valid value in *result when the input substring
> contains a value INT_MIN..INT_MAX inclusive, and return an
> error otherwise.
>
> Note that the comment above simple_strtol() says:
>
>    This function has caveats. Please use kstrtol instead.
>
> I started reviewing what exactly kstrtol() would do, to
> see if using that might be simpler.  It looks to me like
> it does some of the same things you do.
>
> I'm haven't run the unit test you provided, and I tried
> working through what would happen with kstrtol(), but
> gave up because it was taking too long.
>
> Would this work instead?
>
> static int match_number(substring_t *s, int *result, int base)
> {
>      char buf[NUMBER_BUF_LEN];
>      long res;
>      int res;
>
>      if (match_strlcpy(buf, s, NUMBER_BUF_LEN) >=3D NUMBER_BUF_LEN)
>          return -ERANGE;
>
>      ret =3D kstrtol(buf, base, &res);
>      if (ret)
>          return ret;
>
>      if (res < (long)INT_MIN || res > (long)INT_MAX)
>          return -ERANGE;
>
>      *result =3D (int)res;
>
>      return 0;
> }
>
>                                         -Alex
>
> >
> >> It might be better to define a new function that expects to
> >> produce (up to) 64 bit result values (signed, or maybe not),
> >> rather than changing this function.
> >
> > For callers that need 64-bit values there is already match_u64()
> > (match_u64int() with kstrtoull()), so I don't think a new function is
> > needed. This patch is only about the int helpers accepting
> > out-of-range input.
> >
> >> Or... maybe there's a simpler way to catch a too-long
> >> input string.
> >
> > I looked at that, but the length of the string doesn't decide whether
> > the value fits: "4294967295" is only 10 characters and doesn't fit in
> > an int, while leading zeros make a long string that does
> > ("00000000000000000001"). What is needed is the overflow indication,
> > which simple_strtoull() drops (there is a FIXME at that spot in
> > simple_strntoull()). _parse_integer() returns it, so the patch parses
> > the same way simple_strtol() does, keeps that flag, and compares the
> > magnitude with the int range.
> >
> >> This matters because match_number() calls simple_strtol(),
> >> which is implemented using simple_strtoul(), and that is
> >> implemented using simple_strtoull().  So if a very long
> >> numeric string is passed to match_number(), it will be
> >> misinterpreted as something that overflows 32 bits,
> >> which will end up having a misleading (but essentially
> >> valid) int value.
> >>
> >> Is that correct?
> >
> > Yes, that is the problem, in two forms:
> >
> > - On 64-bit, a value of 2^64 or more saturates to ULLONG_MAX in
> >    simple_strtoull(), and simple_strtol() turns that into -1L, which
> >    passes the INT_MIN/INT_MAX check. Values from 2^64 - 2^31 to
> >    2^64 - 1 wrap to small negative longs the same way. So match_int()
> >    returns 0 with *result =3D -1 for "18446744073709551615" or
> >    "99999999999999999999".
> >
> > - On 32-bit, long is as wide as int, so the range check can never
> >    fail: "4294967295" also gives -1, and "2147483648" gives INT_MIN.
> >
> > In both cases the caller gets success and a different number from the
> > one that was written, for example in a mount option. With the patch
> > these return -ERANGE. Values that fit in an int are accepted exactly
> > as before, with the same result and the same syntax.
> >
> > Sorry the changelog made it sound as if the result were becoming
> > 64-bit; only the intermediate magnitude is. I can reword that in a v3
> > if it helps.
> >
> > Thanks,
> > Shashank
> >
> > On Fri, Oct 2, 2026 at 3:07=E2=80=AFAM Alex Elder <elder@ieee.org> wrot=
e:
> >>
> >> On 9/25/26 8:27 PM, Shashank Mohan Jain wrote:
> >>> match_int(), match_octal() and match_hex() store the result in an int
> >>> and return -EINVAL or -ERANGE on failure.  match_number() checks the
> >>> range by parsing into a long with simple_strtol() and comparing again=
st
> >>> INT_MIN/INT_MAX, a check added by commit 77dd3b0bd17a ("lib/parser.c:
> >>> avoid overflow in match_number()").  That does not catch every
> >>> out-of-range input:
> >>
> >> The result is still placed in memory referred to by an
> >> integer pointer, right?  Not a long long?
> >>
> >> It might be better to define a new function that expects to
> >> produce (up to) 64 bit result values (signed, or maybe not),
> >> rather than changing this function.
> >>
> >> Or... maybe there's a simpler way to catch a too-long
> >> input string.
> >>>
> >>>    - simple_strtoull() saturates to ULLONG_MAX on overflow and
> >>
> >> This matters because match_number() calls simple_strtol(),
> >> which is implemented using simple_strtoul(), and that is
> >> implemented using simple_strtoull().  So if a very long
> >> numeric string is passed to match_number(), it will be
> >> misinterpreted as something that overflows 32 bits,
> >> which will end up having a misleading (but essentially
> >> valid) int value.
> >>
> >> Is that correct?
> >>
> >> At this point I'm just trying to make sure I understand what
> >> your intent is, because I'm unsure this is the right way to
> >> achieve what you're after.
> >>
> >> I guess I'm stuck on match_number() expecting to produce
> >> an int result, and your discussion talks a lot about 64-bit
> >> values.
> >>
> >>                                          -Alex
> >>
> >>
> >>>      simple_strtol() simply converts its result to long, so any value=
 of
> >>>      at least 2^64 - 2^31, and anything that overflows 64 bits, ends =
up
> >>>      inside the int range.  On 64-bit, match_int() returns 0 and sets
> >>>      the result to -1 for "18446744073709551615" or
> >>>      "99999999999999999999", match_hex() does the same for
> >>>      "ffffffffffffffff", and "-18446744073709551615" gives 1.
> >>>
> >>>    - On 32-bit, long has the same width as int, so the range check ca=
n
> >>>      never fail: "2147483648" gives INT_MIN and "4294967295" gives -1=
.
> >>>
> >>> On 64-bit, values from INT_MAX + 1 up to 2^64 - 2^31 - 1 are already
> >>> rejected, so for those this only makes 32-bit kernels behave like
> >>> 64-bit ones.  Two callers store the result in a u32 and so accepted
> >>> such values on 32-bit only: the legacy NFSv4 idmapper upcall
> >>> (fs/nfs/nfs4idmap.c), which falls back to a numeric id when the looku=
p
> >>> fails, and rd_pages=3D in drivers/target/target_core_rd.c, which also
> >>> ignores match_int()'s return value.
> >>>
> >>> These helpers parse mount options and similar user-supplied strings,
> >>> so an out-of-range number is silently accepted as a different value
> >>> instead of being rejected.
> >>>
> >>> Parse the number the same way simple_strtol() does, using the same
> >>> kstrtox helpers, but keep the unsigned magnitude and the overflow
> >>> indication, and check the magnitude against the int range.  The
> >>> accepted syntax, including what counts as "no number" (-EINVAL), is
> >>> unchanged.  kstrtoint() is not used because it rejects trailing
> >>> characters ("12abc" gives 12 today) and differs in the handling of a
> >>> lone "-" or "0x".
> >>>
> >>> Fixes: 77dd3b0bd17a ("lib/parser.c: avoid overflow in match_number()"=
)
> >>> Assisted-by: LLM
> >>> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> >>> ---
> >>> These patches were prepared with Claude Code (Anthropic), model Claud=
e Opus 5.5
> >>> (claude-opus-5-5): the analysis, the Lean models used to find and che=
ck the bugs,
> >>> the fixes and the tests. I reviewed them and take responsibility for =
them. The
> >>> trailer only says "Assisted-by: LLM", as Documentation/process/coding=
-assistants.rst
> >>> requires since commit 816d9992d9ed ("coding-assistants: simplify attr=
ibution").
> >>>
> >>> Changes in v2:
> >>> - Resent with my full name; no code changes.
> >>>
> >>> v1: https://lore.kernel.org/r/20260925102334.49693-1-jain.sm@gmail.co=
m
> >>>
> >>>    lib/parser.c | 39 +++++++++++++++++++++++++++------------
> >>>    1 file changed, 27 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/lib/parser.c b/lib/parser.c
> >>> index 62da0ac0d438..30fdaefe4957 100644
> >>> --- a/lib/parser.c
> >>> +++ b/lib/parser.c
> >>> @@ -11,6 +11,8 @@
> >>>    #include <linux/slab.h>
> >>>    #include <linux/string.h>
> >>>
> >>> +#include "kstrtox.h"
> >>> +
> >>>    /*
> >>>     * max size needed by different bases to express U64
> >>>     * HEX: "0xFFFFFFFFFFFFFFFF" --> 18
> >>> @@ -137,22 +139,35 @@ EXPORT_SYMBOL(match_token);
> >>>     */
> >>>    static int match_number(substring_t *s, int *result, int base)
> >>>    {
> >>> -     char *endp;
> >>>        char buf[NUMBER_BUF_LEN];
> >>> -     int ret;
> >>> -     long val;
> >>> +     unsigned long long val;
> >>> +     unsigned int radix =3D base;
> >>> +     const char *cp =3D buf;
> >>> +     bool negative;
> >>> +     unsigned int rv;
> >>>
> >>>        if (match_strlcpy(buf, s, NUMBER_BUF_LEN) >=3D NUMBER_BUF_LEN)
> >>>                return -ERANGE;
> >>> -     ret =3D 0;
> >>> -     val =3D simple_strtol(buf, &endp, base);
> >>> -     if (endp =3D=3D buf)
> >>> -             ret =3D -EINVAL;
> >>> -     else if (val < (long)INT_MIN || val > (long)INT_MAX)
> >>> -             ret =3D -ERANGE;
> >>> -     else
> >>> -             *result =3D (int) val;
> >>> -     return ret;
> >>> +
> >>> +     /*
> >>> +      * Parse like simple_strtol() does, but keep the magnitude and =
the
> >>> +      * overflow indication instead of truncating to a long, so that
> >>> +      * values outside the range of an int can be rejected.
> >>> +      */
> >>> +     negative =3D *cp =3D=3D '-';
> >>> +     if (negative)
> >>> +             cp++;
> >>> +     cp =3D _parse_integer_fixup_radix(cp, &radix);
> >>> +     rv =3D _parse_integer(cp, radix, &val);
> >>> +     if (cp + (rv & ~KSTRTOX_OVERFLOW) =3D=3D buf)
> >>> +             return -EINVAL;
> >>> +
> >>> +     if (rv & KSTRTOX_OVERFLOW ||
> >>> +         val > (negative ? (unsigned long long)INT_MAX + 1 : INT_MAX=
))
> >>> +             return -ERANGE;
> >>> +
> >>> +     *result =3D negative ? -(long long)val : (long long)val;
> >>> +     return 0;
> >>>    }
> >>>
> >>>    /**
> >>
>
