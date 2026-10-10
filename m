Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7004E13B7AE
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631884; cv=pass; b=UM3vvErlcj4B1OCr0AvM10BLiRJjGSrK5xiX3uww+x2kBBxBuxQy1QAfScknmawx2lzaVwrTr0M7UjtWKIgO0YRUCuELUZ5lDbHeWuXHSwNcbpSlHskophSe2bus/RGwisZfl2k6xG9Y9Ca55gE+wgRjHEAUd+I1u/qAnqWnmIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631884; c=relaxed/simple;
	bh=gv4uWDfgFmz9WVtkNmwJAWshwTrVyFn/VfmnlB7WXT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qg3ncFJ1bWE5KsrlKI7UIyXhuIp7DdNSL04WeW5rW/DwBiRlIcS5nD4VssIAeY11EK+MW5QaIgRLE+7vxY7uJePGbQuSNWE1/8D4iKJ4TAZudcj/AarmnNObsRPJi+Vy1vRC0rpXIvBPqfYWoqi+pPI/aoiE4kmMI4+EzeSJvn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty+929uB; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty+929uB"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6acba4bf65eso644074a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791631881; cv=none;
        d=google.com; s=arc-20260327;
        b=W8CCt8YPIo2FIFCRqEPil09IPd4Il49Bm+3tUb5VvOz09rM+bxTafG1N7QwpQhFp76
         AXuEH72fhhvLY6W0YX0dL2xMfdXHhdr74W5wxmnev58BYHAiGynUsZEkCy11P31WLYou
         1JxaB37nvRDZ476ygDxjb7eHvojzkz3O6G67UmzDa0XdbIWr3o6t9O5TBQ9/Imza5cOm
         eVfy2c339GgkyG0MfRTPxalwMUrsQd2NLyaazfhHATUDQqazOfF89FgSYLvDVe4tH3LI
         m/mbeiGDEqSkdqLiXMlxQVkzv0Lu2DM6KJfaSVHnSeSKbc12kjTkoFoNVIb2Ug685qA0
         rHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gUQ+lGifeXqqAlciKTopFGFnd8gQ9mlyrmzyDz9aPAM=;
        fh=/sBzfq/OwUtKnVYjoLikIl0rZrcD197+VtNkzp94YVQ=;
        b=ni6cMvWFqeEwujbQXrbVtK8Sze9aH6+HLgNAGqxx5IirsAStaFHoRR4Nhairy6qTHB
         PHnQ+V84l1BR7y3B/32WuY4+lP5o3PBSBF/BPzwAtqsMUGC1+OMcaUgRP0b2q0IFpIsR
         RknA08sJlMSv0U4jYMwp02vey+z3PfeC3xC2XqCo9cEvCYElgX2qcQhGp1bnMvpgL4re
         T+SSlFxKi5kyVskKjAyNMjhfNlEvjQWpUp4i0UL2jfRdmETpdBvK/B4tgSyQpDvH5tUK
         uwarRXWizPbn2dSF6+QoayCu/O4NIkOup2FGj4pGQF+oRGWgvdK7vm3IlIRWquKePJf/
         ffYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791631881; x=1792236681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gUQ+lGifeXqqAlciKTopFGFnd8gQ9mlyrmzyDz9aPAM=;
        b=Ty+929uBFE6ZVVF6ZS+zXaFPyt9i69Hh1w7OmIJOIg9KnXJ7USpRZkNTAp33g1wslU
         XsPOehdqC1fk4lPlGSf32B+J6tdsKmPWxbyJ1qJUTDfNcD2gsQQV7JxWqnmywrMRbUHv
         oz2qG3y9F2lkwMQeE+E2zTqteIvOYdAaHOrTVqw+d/b6ZCVfZeOPwxTXPlXrT+qkqxVs
         j2PMuOqOhBCdcX1A/3AyeTzMwPa8GQBqUdExTRQ2E3Cp3AOaxI6pwTJ1eJvHTsoNWeyu
         h54Q7AQjhdteX1QxjQYvF6RNw1rDsY30hIAmyxWQyJHxsQlUJzcyjdwRs1G3REwT4U6m
         UHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631881; x=1792236681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUQ+lGifeXqqAlciKTopFGFnd8gQ9mlyrmzyDz9aPAM=;
        b=lb8az0a68VLYNtbjUg71XlFP8I47WA9pw5XS1BXxMtrRPb/z0BZJ5yxOKr6e9kYe/e
         I/4/HXMDQoKRc74V4L9L53X7vGgfvqhmVSGb9SSmnWPIgn3EWmxY39y6OewKsWCaeGjO
         JCKjX9P5SDBl1rSb3m6gQA0ZSq95dlFIuiNLp+oTR1RZzuMiNXghCLSdljLed1b1URbB
         4Oa7LdtFjh4x/9BXnkwvhmXpQTUImCZF72W1Pyv15h41evJLjk0RjqK5bAKLb6XRahfl
         QmpakFDcSyAOfxLYWKzTHJOlHVQwvUSY8T2aCyHjLa53YzkBg5jIE+bcdOkzo4gbFm29
         wgQQ==
X-Forwarded-Encrypted: i=1; AKwUvByfRKU3sTBptbktZRsT/+mUQod0PymsSZng6VatHpoyiAZPv8kqKu0Q8khg2Nb4sRC4b6VfkFpaqNsTvJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsl+LLTLvADCOnGYLoTXnGKyvfepMiw9pL9aQgqDFZKaHmh+/F
	81lF4l7nLRxuFwdXp7YIc4Uuz5L+RB9GbrO13fUf4uB7ReKP0KjYENLtrj6rTlo/VcZqeLaccDA
	uVfU/DtXGTtkDZLJM7WvqstCyZAbXvak=
X-Gm-Gg: AYBFou0a5+hQUIuP0X12FZLjOpzZay2uyAnMj20cX4towp+0r4tE1vUUBOGU0xCGHOS
	z3o7L4gsO1I5FBgBybmqdxeca9RLzhk9Fl5LcxG6BM5NmIJNrrEgJyQvX00z/Phi+Dx6ENH4/Mj
	V9cTU8s22Cv4ry5Gv4NJH/svV+eGljvbznmNT4SEDU5i9zRMZMTvKwSdhWAxWywDmahfFYWqs2y
	FNbqqyMQPS64lEOZzSU4fxVHB2KRrQJT3hIYEgnu3scFJyM3eu577CyjY6VuRfMi9p8aEF/zpTp
	UpNHp19HzXzIb5S/NML0nFjUrj8tRZ6FHVLkVrUgCmS7+7lPwhqIwERd+ZlNZ84xFgSZNiYxbHS
	ymf/aolxlqRRJBY/Yuf7LklBwP5a4wXGxd98n2H6xZw==
X-Received: by 2002:a05:6402:501e:b0:6aa:7ff:4ebf with SMTP id
 4fb4d7f45d1cf-6b17c23d561mr4283966a12.15.1791631881629; Sat, 10 Oct 2026
 04:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009092759.968521-1-linmag7@gmail.com> <CAEdQ38FEDRnc6DR0mTtiAfct2WwvSVjrFWtTzQrN-DtECaS-MQ@mail.gmail.com>
In-Reply-To: <CAEdQ38FEDRnc6DR0mTtiAfct2WwvSVjrFWtTzQrN-DtECaS-MQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 10 Oct 2026 13:31:10 +0200
X-Gm-Features: AclHuK-k44Zg3lCAgQHkrzNsPm8zibwWe2DLtPLR_2BC02_lZn9oOvK_TySUOe8
Message-ID: <CA+=Fv5QCu4W0msvg9Wx4koVtiiu6GKNWji1vJOmzveD6PX9hLg@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/seccomp: add Alpha support to seccomp_bpf
To: Matt Turner <mattst88@gmail.com>
Cc: kees@kernel.org, shuah@kernel.org, wad@chromium.org, 
	richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 10, 2026 at 3:28=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Fri, Oct 9, 2026 at 11:27 AM Magnus Lindholm <linmag7@gmail.com> wrote=
:
> > Skip the pre-notification signal test when /proc/self/syscall is absent=
,
> > rather than unconditionally skipping it on Alpha.
>
> Nothing in the tree skips it on Alpha; that was only in v1.
>
> > +/* Alpha returns positive errno in r0 with the r19/a3 error flag set. =
*/
> > +# define SYSCALL_RET_SET(_regs, _val)                                \
>
> r19 is still the fourth syscall argument at an entry stop, so this
> relies on the callers also setting the syscall number to -1. Worth
> saying so in the comment.
>
> > +     if (access("/proc/self/syscall", R_OK) !=3D 0 && errno =3D=3D ENO=
ENT)
> > +             SKIP(return, "/proc/<pid>/syscall not available on this k=
ernel");
>
> Alpha selects HAVE_ARCH_TRACEHOOK, so the file is there and this never
> triggers. I guess that is why you have 12 skips now instead of 13.
> Please drop the hunk, or send it separately for UML and friends.
>
> With that:
>
> Reviewed-by: Matt Turner <mattst88@gmail.com>
>
> Build-tested only, with a cross compiler.
>

Thanks for taking the time to review this, will put out a v3 asap

> Unrelated to this patch: with the selftest setting a3 itself, do we
> still need the fixup at the end of alpha_elf_gregs_set()? As it stands a
> tracer cannot skip a syscall and have it return a small positive value;
> it comes back as an errno. The r0 =3D=3D syscall_saved_nr check in
> alpha_finish_syscall_to_user_mode() has the same kind of problem.
>

Interesting, I'll make a note on this and look into it later, you may be
on to something here.

Magnus
