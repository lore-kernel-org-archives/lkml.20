Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794519192;
	b=tnVjWrhVLMXwJI/MGrbVBzH8T8wzMpAyKg5PEQmsjnLXe2MM3gcgElJdUJSMW2M0NGs2
	 3GaQOQdSfP4lOzyTC8r5thThn8tvNdcbK9RH8Y0SoiSqyq/KWWLDYLZsk9bz21hNGDuyG
	 KBDfO4XddVj5zHFZKg5VUzaSsSYz9XxnArmTg4P66GSUnJFShGNcQ7B5eSYbKg0wOf8C8
	 Nb6NcLjFiWgaX+tw2nIrIU83fum4Ebvg1OdLGdlS7QA57OQqVKJm9nc3yZa5PmIH9D/AZ
	 XezYcN5Ku1O4WcEROQGWqLSAtOSY90ikR2Zy4IdcrpH/3RaPemK55I1eswBFVPLsb9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=prF5tjXqgroH+cDLlU5bcd95xTZWZ1bQNjqAX/0GDh8=;
	b=viUUPrqtpnQgwrGTnlMqXTMRy3zMwjhR1IySMvKe50/tfkmQ2aIIlEndbS4PHTvNAxG3
	 i19prucbt0dw4s9QGnd6KR2lVi1/PwMLxtGL4A7lAFrpC1alw21ZUD9tpLHHpSKNqcCa8
	 k3gffxOrEFywI7IB08MwB4MWFwGMqPIPYjhDm855MrKwM3gEOuacivUFgp5JaIh9L6uFg
	 n+OZL7q3eZ4C/AgTvn6JoVMyuM+P/w8EKv+g/+SiHKrBdFllZDAKJ0tjDFZawXE36tbr1
	 SV5pTnhWraDunPO8aT1BUZlAKMC+sig/+TGbOieyAePoyQo3L7Y0/bgqqs8dWo9MQ0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c+r70Miw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE51606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE51606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c+r70Miw
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so39751cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:33:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794519191; cv=none;
        d=google.com; s=arc-20260327;
        b=W/w/v3zyAR6TOJ3gvQ1lL9leANIx2dmzdA3ug7kwjWmeJ3I1HR/5r0VvW5TqVIoigh
         ZKHDTFjLvr6UMs0YPFoEkR4oiocG6BeM8Q4vdtkU3y/gs+x5mixDwQTXxp0vKArKoXDW
         34GDNiAyfgaQ5eTtPorfGWIAfvdCnHLcuZVT/TmUdeLRVW+XVVNq+oNxBll7dQC5BDn0
         TMg0W5Frbb4HX/Zp4pTfjjaDAaKqu8BY65XU+oWKMJZkDDl4leMpE7vj/0Ww4SfdY9A6
         1iOq6JRjgcvuRHWNJkDRcWJzBxQmfXnDLSSrP7lVbm4QDzdJLgWmZOAn7NF+RLANTQWx
         TpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=prF5tjXqgroH+cDLlU5bcd95xTZWZ1bQNjqAX/0GDh8=;
        fh=WRpKnHmg79JUd0SUvOvm9rftINcyUCSc0gyZDoW5HkE=;
        b=U6kTXSAp3JyKZAE9N/JYNHGSJ5a/z6tUtLrNb6SdlT+1pFVU/8eg5zcvDLWRauSIfn
         9E+4DbDKBENfmnHbWlnCm8i8vSCSappSOI5KDtzvyKUfLnFg/XY/D5UbOhhOd6gbXIay
         LyMiJKYWBq/KOlVVbobypdqYgmVLbzph7T8Z7tYTC1amdujvD7lkZGANn9rik4LsR9U0
         DbQoLjyXVzY3MF7y32pIvDHHia5nMAkyOI9CQPfbNiHljizkoXX8IAfLXJQsq06F8paG
         PZz8tQ0Qu5q1QoNDtHj/XwYIwekib20af7z+zSktMe9nJ5DoPHSaKdRTMxLOmWQF+UP8
         OxUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794519191; x=1795123991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=prF5tjXqgroH+cDLlU5bcd95xTZWZ1bQNjqAX/0GDh8=;
        b=c+r70MiwL5ihIwSFWBN7qSBDWPpBrkCxc6G8ewKG5Ylo0ToK6UNLaaaYAAA46JNOan
         4z7xWO4AMdQ8dbi4747cL9NCLq+mfA2JZiVgB73FJlId3AOE4H9GAbbd877tRR5ikVGA
         ysi5pkoASc08N7066rqoHHNWRREgldfIpcMm45xeZ+lfxiRAPyhmSFxt6QuV2Ue0t3Gq
         r2N9D02E35cMcEW1drj8gI27mUhM2EjbEA+U7VjAM7GodRJgyDzse1hZAWv3i6kGysRv
         tHRs9FYf+1SSvNQpUaHqCA8ogUc0hmy7NFcrf8o0GNjhsIqC2gAQxXKMEELoQ+LJhVMS
         Js+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519191; x=1795123991;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prF5tjXqgroH+cDLlU5bcd95xTZWZ1bQNjqAX/0GDh8=;
        b=S5IxWl7H5u2SU/QLQRrb319/bJAPYQ58xxInI0lrY/POLbOOJGQhxJ+YcU0gzwOMST
         /qBvk79o7RPFYRJ7tSUZrW8mSQ+goNnwRK1O+SWy+G/vkAuDM35/XHp6EgtGpobD/44s
         vtPV9n3kxEFsDF857H8UkD0rXdxrejR0HHmaFfi6jQ0e3L0pbceRlwUo/pD6Tc28lfHQ
         Sc4hVdpSIIiRY7zUj1rOK7NF28kavhYGhi4Kv9mAA09p1OWUtQJPuM2VbhYHeh+zjT3z
         rFnvVbs/8L+1cnaLRqL+GOoNAZysfryvoVMb25fc7Tk6gwD3rx03g581WUjWzzXYcpAq
         PY4w==
X-Forwarded-Encrypted: i=1; AL+hErE+7E9gzm1gwrk4HzQJxUjJMafcOUlhZzE0SrS6R6frlrypNlhKwoaZbeho0oek9T2Kkz+W654djm9dj7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R1Q23SiSQsG8NAsEeXFEy0zoVTuhBN7ljP6sADXj2/ai62eyb
	n4DYes0BRh6s02aa3oWrZI6OhO4VB5enj6Dq3Ht6Ys9Hpk9wUo4uzeXS57BlInLBSIVL4ei3Z/R
	CgrHFuzRxlpI4xikj6IZKW3Y95LXIvAOrlwzTLHGB
X-Gm-Gg: AYBFou0ernnllUCtXVmPnYdQUNobyamqN6J+rqyqmC3Rho4+pOpf0+tMYwP1kKRXkdl
	Z7VCa2sN6oQbglc2ZYK2lsbMBbD+y3pU8XkzJD0UzHPOMIByDfLVWakQGIBDKYV/lD7lpjNOwwN
	ueQ3JC3ZGiGrTxXRgT/3ntM4aJjZ20zO17muv6qax1zyTAhi0wtk3rRai8css6q0A9hojdDNQUI
	LDy/CfVgTvRnhu7OxXyB6akTuBPwTpNI4JpXCC3mhUTZ1XAY80wfCtLMiNHBn4S3XpQ/sY9RxCM
	UlgtS3wRr9nwakHQDybG1mYMFQ4X0wf/YaVR/Tjf4QeiTt10mXkqxIFB+gU1rZwMf8oR8gVQ3c/
	zETN3YiZSjWJSD1zIwVUOPt+ebPZukseuOV5mRvjRRqeQTX91N3S0o8ppBR63KVfu2UA=
X-Received: by 2002:a05:622a:1e12:b0:536:6ae9:f55f with SMTP id
 d75a77b69052e-55afcae990emr1186911cf.7.1794519190580; Thu, 12 Nov 2026
 13:33:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAcuPuJUt=Qf6uuTVv63jiY_iCjsvjso1T=WYSFQB=i6Wzb2Vw@mail.gmail.com>
 <CAP-5=fWYxRTZmFQZZECLapQCUug-bs3cwTmwYA5SxBy0=0bKdQ@mail.gmail.com> <CAAcuPuLkaC_=c4NPxNmO3HK8dw8j=cH6M+nyfzYERMfZOKh8tA@mail.gmail.com>
In-Reply-To: <CAAcuPuLkaC_=c4NPxNmO3HK8dw8j=cH6M+nyfzYERMfZOKh8tA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 12 Nov 2026 13:32:58 -0800
X-Gm-Features: AclHuK-0mcpzVSbtDp10Qu2TQXFVJn9tlshi_Fs0QymOKakVYwrCs2-tCyKvVfA
Message-ID: <CAP-5=fVr+EHr_RpLiA45ZK8OkDNG8AdmgK+pz7kxd6G3zWXO1g@mail.gmail.com>
Subject: Re: [PATCH] tools api io: Return high-bit bytes as unsigned characters
To: szpuszi <szpuszi@gmail.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:25=E2=80=AFPM szpuszi <szpuszi@gmail.com> wrote:
>
> Hi Ian,
>
> `tools/lib/api/Makefile` does not set -funsigned-char, so building
> libapi standalone (`make -C tools/lib/api` on x86_64, where char is
> signed by default) hits this directly: `filename__read_str()` calls
> `io__getdelim()` -> `io__get_char()` and silently stops on bytes in
> 0x80-0xff.
>
> Even if perf's -funsigned-char is also passed down to the libapi build,
> `io__get_char()` is a `static inline` in a public header
> (tools/lib/api/io.h) with fgetc()-style negative error/EOF returns.
> Casting to `(unsigned char)` fixes the underlying bug in the header
> itself rather than relying on every caller of <api/io.h> compiling
> with -funsigned-char. The `-fsigned-char` flag on `api-io.o` is just so
> the regression test keeps exercising this path under perf's default
> -funsigned-char build.

It is only a bug if chars are signed. I thought by default it was
unspecified whether they were signed or not, hence char having 3 types
- signed, unsigned and unspecified. At least in the Chris Mason review
prompts we're pretty explicit that chars are unsigned:
https://github.com/masoncl/review-prompts/blob/main/kernel/subsystem/build.=
md
```
Unsigned char (-funsigned-char): Top-level Makefile enforces unsigned
char on all architectures. Checking char < 0 is dead code or incorrect
logic.
```

> If you'd also like me to check whether perf passes -funsigned-char
> through to the libapi build and send a separate patch for that, let me
> know.

So I ran a check and I don't see `-funsigned-char` being passed into
libapi in the cc command line. So maybe there's a bug. I see
Makefile.perf exporting CFLAGS.

Thanks,
Ian

> Thanks,
> Wojciech
>
> On Thu, Nov 12, 2026 at 6:27=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> >
> > On Thu, Nov 12, 2026 at 9:06=E2=80=AFAM Wojciech Szpucha <szpuszi@gmail=
.com> wrote:
> > >
> > > From: Wojciech Szpucha <szpuszi@gmail.com>
> > >
> > > On signed-char builds, io__get_char() returns negative values for byt=
es
> > > 0x80-0xff. This makes filename__read_str() silently truncate non-ASCI=
I
> > > input in standalone libapi builds.
> > >
> > > Cast the byte to unsigned char before returning it as int. Add regres=
sion
> > > tests compiled with -fsigned-char, since perf defaults to -funsigned-=
char
> > > and already avoids the issue.
> > >
> > > Fixes: e95770af4c4a ("tools api: Add a lightweight buffered reading a=
pi")
> > > Signed-off-by: Wojciech Szpucha <szpuszi@gmail.com>
> >
> > Can you provide more context of where this is a problem? The code
> > builds with -funsigned-char :
> > https://lore.kernel.org/linux-perf-users/20260306191908.2065682-1-iroge=
rs@google.com/
> > and so we may be failing to pass CFLAGS through properly for the libapi=
 build.
> >
> > Thanks,
> > Ian
> >
> > > ---
> > > Tested on Ubuntu 24.04 x86_64, GCC 13.3.0: standalone libapi reads 0/=
4
> > > bytes before the fix and 4/4 afterwards. The API IO regression fails
> > > before and passes after. libapi and perf build successfully; checkpat=
ch
> > > passes. Full perf suite and kernel builds were not run.
> > >
> > > https://github.com/szpuszi/linux-perf-io-test/actions/runs/4325770722=
9
> > >
> > >  tools/lib/api/io.h        |  2 +-
> > >  tools/perf/tests/Build    |  1 +
> > >  tools/perf/tests/api-io.c | 33 ++++++++++++++++++++++++++++++++-
> > >  3 files changed, 34 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tools/lib/api/io.h b/tools/lib/api/io.h
> > > index 1731996b..25e2008d 100644
> > > --- a/tools/lib/api/io.h
> > > +++ b/tools/lib/api/io.h
> > > @@ -91,7 +91,7 @@ static inline int io__get_char(struct io *io)
> > >                 if (ret)
> > >                         return ret;
> > >         }
> > > -       return *io->data++;
> > > +       return (unsigned char)*io->data++;
> > >  }
> > >
> > >  /* Read a hexadecimal value with no 0x prefix into the out argument =
hex. If the
> > > diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
> > > index 58858f3d..c3ba1fca 100644
> > > --- a/tools/perf/tests/Build
> > > +++ b/tools/perf/tests/Build
> > > @@ -79,6 +79,7 @@ perf-test-$(CONFIG_DWARF_UNWIND) +=3D dwarf-unwind.=
o
> > >  endif
> > >
> > >  CFLAGS_dwarf-unwind.o +=3D -fno-optimize-sibling-calls
> > > +CFLAGS_api-io.o +=3D -fsigned-char
> > >
> > >  perf-test-y +=3D workloads/
> > >
> > > diff --git a/tools/perf/tests/api-io.c b/tools/perf/tests/api-io.c
> > > index 0ba3d5cc..f283712e 100644
> > > --- a/tools/perf/tests/api-io.c
> > > +++ b/tools/perf/tests/api-io.c
> > > @@ -98,7 +98,7 @@ static int do_test_get_char(const char *test_string=
,
> > > size_t buf_size)
> > >         for (i =3D 0; i < strlen(test_string); i++) {
> > >                 ch =3D io__get_char(&io);
> > >
> > > -               EXPECT_EQUAL(ch, test_string[i]);
> > > +               EXPECT_EQUAL(ch, (unsigned char)test_string[i]);
> > >                 EXPECT_EQUAL(io.eof, false);
> > >         }
> > >         ch =3D io__get_char(&io);
> > > @@ -118,6 +118,7 @@ static int test_get_char(void)
> > >                 "12345678abcdef90",
> > >                 "a\nb\nc\nd\n",
> > >                 "\a\b\t\v\f\r",
> > > +               "\x7f\x80\xfe\xff",
> > >         };
> > >         for (i =3D 0; i <=3D 10; i++) {
> > >                 for (j =3D 0; j < ARRAY_SIZE(test_strings); j++) {
> > > @@ -290,6 +291,34 @@ static int test_get_dec(void)
> > >         return ret;
> > >  }
> > >
> > > +static int test_get_line_non_ascii(void)
> > > +{
> > > +       static const char test_string[] =3D "a\xc3\xa9\xff\nnext\n";
> > > +       char path[PATH_MAX];
> > > +       struct io io;
> > > +       char *line =3D NULL;
> > > +       size_t line_len =3D 0;
> > > +       int len, ret =3D 0;
> > > +
> > > +       if (setup_test(path, test_string, 2, &io))
> > > +               return -1;
> > > +
> > > +       len =3D io__getline(&io, &line, &line_len);
> > > +       EXPECT_EQUAL(len, 5);
> > > +       EXPECT_EQUAL((int)line_len, 5);
> > > +       EXPECT_EQUAL((int)strlen(line), 5);
> > > +       if (line_len =3D=3D 5)
> > > +               EXPECT_EQUAL(memcmp(line, test_string, 5), 0);
> > > +       len =3D io__getline(&io, &line, &line_len);
> > > +       EXPECT_EQUAL(len, 5);
> > > +       EXPECT_EQUAL((int)line_len, 5);
> > > +       EXPECT_EQUAL(strcmp(line, "next\n"), 0);
> > > +
> > > +       free(line);
> > > +       cleanup_test(path, &io);
> > > +       return ret;
> > > +}
> > > +
> > >  static int test_get_line(void)
> > >  {
> > >         char path[PATH_MAX];
> > > @@ -337,6 +366,8 @@ static int test__api_io(struct test_suite *test
> > > __maybe_unused,
> > >                 ret =3D TEST_FAIL;
> > >         if (test_get_line())
> > >                 ret =3D TEST_FAIL;
> > > +       if (test_get_line_non_ascii())
> > > +               ret =3D TEST_FAIL;
> > >         return ret;
> > >  }
> > >
> > >
> > > base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
