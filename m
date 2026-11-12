Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794515156;
	b=ZyLWeh8pKMVK8FVoF3/gXSLaaYwOUxxfrVBxUTSe85DzgznGdldazQdSoF5H1TfynMLZ
	 Gv+2kCwlxTscImPS04rIeYH2Gfg42TrBniLG6MjcgprEV6vCsu8PbBSj3LpMwpIVHWBdd
	 KVcwgVQqno3+B2uO7ZPtE3IOfk/P+FPj+vUw3IixSNIhQXC/OF2nzmSLmRDBYDesDSgM3
	 jFR7JsDX7h6G2WvXh2NIr4rSvJwJ3p+IbCuZ4P95nF4LO/TSnIGG4SybuQTcWQduhEZav
	 A9oMSNjjl2xUCM6Dd5+8+wMu0U2bJk21eEbqy0dbPnoK8O/fjNoDj70UP4YdjP7gE4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gxPsaAvTclPv8Bzbeb+6GCZ9smfJzSH01Ggd1jA3xgY=;
	b=pP/UexXuW2pBOltXlzJhO/VGAT3fnqI5nMsKtpehnHYgXDKfcGh2K1+C0LGQTiCuvzVM
	 2ISOG/JKTwDNvzUcqnfQyyEyJg0br5vTCkcUX/XqYUGz6f4dJy3X7pHsEXkFKatMUzOX7
	 YArjhgOvPBEVHe60CwLftFGZQGNWronwk4hrtnfzO/qr5fRUg5Ei7oq/cwZ3ErlP2an3r
	 GX5sX3t9QIxuZXXEaY/qZ1x6Faa00yd7h38NTo1cvZetzTj/xPDnTFYDeBYFuxgCwUOPH
	 ETT3debfyvXFuCIRas5H1QvZF+AK4bIIk9eMlTQAqmL6RDw/4MLI2uKwoABOPN2gAmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuwKRyjN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E99F606A88F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E99F606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuwKRyjN
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso221237a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:25:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794515155; cv=none;
        d=google.com; s=arc-20260327;
        b=sJwBzS6sd31qxh41P+qDyxSRrZK5k5P09X1fH5zfIM9QQl3v7VU/L5tmvbM9AQr6Sj
         czGaN5yIHbEun1kO9mpTHBJp7vFnamKa9cSv14oKIE+kyzmMWdFxaeXD2/arV3+pr5Hy
         0oAvW7uf7on2sJe2uCAu2Ov0ZKjaqcjCTUuFNrF/e5ik6yeUQIPdUWDo+JHv05UnT23G
         pTDrGCHfxtSiCqUpPYFKe3dc90rTKVGwNQHuIBhzovXk5th7qrVlQRdn4rM/D8JGgyHp
         11ByL6NpH1m5YrQD/MbYp+7hBLOptx8ckkbg0JczJg4pxvitoXjXcS61OSMjeLdFyYdG
         /Ssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gxPsaAvTclPv8Bzbeb+6GCZ9smfJzSH01Ggd1jA3xgY=;
        fh=ZkUrtA6mckIaxkfxxVDi1XyOCJGUgMqYKW4Y2BrB0WA=;
        b=rkVTokPnM17uB9K3HhPTCAAlVEioODPINPaU13v1jnQRJ/Ht1Q25bApgEHgJvKtpLM
         E6OdaNC/qeV7PTtpZ183Wage4tXk05BHcy0Sh0Gx/KqBCJLOp01nCnHIyd8S+oeastFF
         19Z5FuWJY1yRRopDr8fdJ8n5R8IyRxoZxxHN1QNeY0ke+dP/+BAelRME4pci6AdbLoD/
         TBn6K6WDd2HBDiOIO7XDoGYkwPhs2myI82dg4OJTSdsJiCyNgE3e0FEHHK/Ed10Wp/lN
         SptUt74ErFcJKnGyah7oMVrAhVxhkqc8x0A9eAnsT9o5nZIwSj9QeXpPBB6rpm0x9Kso
         5BdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794515155; x=1795119955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gxPsaAvTclPv8Bzbeb+6GCZ9smfJzSH01Ggd1jA3xgY=;
        b=cuwKRyjNEJPZuRxAUbH1GwuBLTQVJXtToKvJyi65LM6LXQQb5JS+TTPuGeR/SVDiCl
         dEQWa1G03Dgb3TecRWdmLlqHNYh83VMaydRsFrD/TOi9P/NcMHWAFbEcZDiFLzAuMval
         JrOxwCwccytHEFtnqCg+A3wP9fIwL5dDd5dLZO5CFq3Kmga5kCN8BsGwMlzDRzrxcfbQ
         V8vAMnmKEGw9Kj6k5i5NogYHnj+OWfB9bfgjISTP7cbmOFOxh/7sQOj93rFTbYX5Q0K3
         eUQzMaIdvrFdatjohAwfiSjRb3EUUqKfcJW62/S2mIw7SzP4betbqJuFKIv3R+L8dmd2
         kCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794515155; x=1795119955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxPsaAvTclPv8Bzbeb+6GCZ9smfJzSH01Ggd1jA3xgY=;
        b=UGKA7ZIc/oDEz188sv0f0NfQQF+FvUXwOMbm7MfHpp9KJHHG1MGhD1L0hqt4xoyUu1
         igG55f2b466wBRP/zeSH7XbsIFGZdWM2m7qXo6mYNhdnsherDevS5su6YbL8x4TKPuvf
         RbhWNtx+A3grkF82mE158RoPYPj6Vks7qxzgW0b9XTikyfAy5Hjr6abprmiK7mxzwk6E
         MJc5C5+tagLqpDG1zoApGvVAYD4qg2xfnVZ6bxUW3Dwtors9wBcYMWxKH4imOpcJnfOZ
         Med6p+oR+E/NgGkxmBzWWOXUflRPAL1sEeaNbnYJxRVcEqPBN4o0H2Iuv/rSh+XjdJ/V
         iWeg==
X-Forwarded-Encrypted: i=1; AL+hErG1rQYJrD2m0ex01im8QA9bw6IunWgjJJxu5GgZBI/Svz7ZyQ/KBUODrOa3ocJdY9vJl2r+owoAt8mrX9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d2/NhPqE5RM0MPgM3afk0njx3hjhMl7rCQFaaBX4lLqAgTcIE
	okpU2nIqU6qye08x7tQ8HRTtXS0BUvJmhERbDa8NRAYvR2lxb0PEs+hvOVLeSg7rOQLGGfJrwdw
	G4UbWvaVGs3cAHulKcjng/XEaZ6z74gA=
X-Gm-Gg: AYBFou3BHXlmG2o245cSX2da+I2HHswRufO1bpexHOqoXN6IUi5GcxfFWJV2wTqKaG+
	+pstmoK1SzZZFHTZHwfuxcWnHj8VkVI9fbDNakyM82GB+a97u+w6tWP/3Y+7jIzPpeRIzlcW5z8
	eDL1BGJCz8E4Go3ekpvEmxMWJFj8p+MbM/53iG9T3lwtfB7NB8lSmvraUOLGusb6XValVJ3zHBK
	oAFB2c+u03MksQTEcxXjU9loIkbtmwVxE5Fy43fyAPWM45m0dD7ZYe4MpUtUzYGJYW9ufiXtNBV
	hF2Irhh+g4c/NB4C3g0M1BiB5tPzFd9OkdmeUAJPycI/8jgiXSs5uBCD4dbmII7slNsYifLl0ER
	zJk7vdVKXeVcifbTWbUd0m8h8Ds1/Y3iR2iMFzi7Be0HVVGUEHp97dsocB0hAODlkkywMGQgfsO
	EjfHJhVwg/S5WKfuD8cQ==
X-Received: by 2002:a05:6a20:7490:b0:3dd:85a9:55a4 with SMTP id
 adf61e73a8af0-3f7a72caa82mr291436637.29.1794515154647; Thu, 12 Nov 2026
 12:25:54 -0800 (PST)
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
 <CAP-5=fWYxRTZmFQZZECLapQCUug-bs3cwTmwYA5SxBy0=0bKdQ@mail.gmail.com>
In-Reply-To: <CAP-5=fWYxRTZmFQZZECLapQCUug-bs3cwTmwYA5SxBy0=0bKdQ@mail.gmail.com>
From: szpuszi <szpuszi@gmail.com>
Date: Thu, 12 Nov 2026 21:25:42 +0100
X-Gm-Features: AclHuK9RaTEfuL1gyCuuJHx3CDkOCgXc4BWu8UGRwo2z1iefsrjrDcHQZcC1XcQ
Message-ID: <CAAcuPuLkaC_=c4NPxNmO3HK8dw8j=cH6M+nyfzYERMfZOKh8tA@mail.gmail.com>
Subject: Re: [PATCH] tools api io: Return high-bit bytes as unsigned characters
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ian,

`tools/lib/api/Makefile` does not set -funsigned-char, so building
libapi standalone (`make -C tools/lib/api` on x86_64, where char is
signed by default) hits this directly: `filename__read_str()` calls
`io__getdelim()` -> `io__get_char()` and silently stops on bytes in
0x80-0xff.

Even if perf's -funsigned-char is also passed down to the libapi build,
`io__get_char()` is a `static inline` in a public header
(tools/lib/api/io.h) with fgetc()-style negative error/EOF returns.
Casting to `(unsigned char)` fixes the underlying bug in the header
itself rather than relying on every caller of <api/io.h> compiling
with -funsigned-char. The `-fsigned-char` flag on `api-io.o` is just so
the regression test keeps exercising this path under perf's default
-funsigned-char build.

If you'd also like me to check whether perf passes -funsigned-char
through to the libapi build and send a separate patch for that, let me
know.

Thanks,
Wojciech

On Thu, Nov 12, 2026 at 6:27=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Thu, Nov 12, 2026 at 9:06=E2=80=AFAM Wojciech Szpucha <szpuszi@gmail.c=
om> wrote:
> >
> > From: Wojciech Szpucha <szpuszi@gmail.com>
> >
> > On signed-char builds, io__get_char() returns negative values for bytes
> > 0x80-0xff. This makes filename__read_str() silently truncate non-ASCII
> > input in standalone libapi builds.
> >
> > Cast the byte to unsigned char before returning it as int. Add regressi=
on
> > tests compiled with -fsigned-char, since perf defaults to -funsigned-ch=
ar
> > and already avoids the issue.
> >
> > Fixes: e95770af4c4a ("tools api: Add a lightweight buffered reading api=
")
> > Signed-off-by: Wojciech Szpucha <szpuszi@gmail.com>
>
> Can you provide more context of where this is a problem? The code
> builds with -funsigned-char :
> https://lore.kernel.org/linux-perf-users/20260306191908.2065682-1-irogers=
@google.com/
> and so we may be failing to pass CFLAGS through properly for the libapi b=
uild.
>
> Thanks,
> Ian
>
> > ---
> > Tested on Ubuntu 24.04 x86_64, GCC 13.3.0: standalone libapi reads 0/4
> > bytes before the fix and 4/4 afterwards. The API IO regression fails
> > before and passes after. libapi and perf build successfully; checkpatch
> > passes. Full perf suite and kernel builds were not run.
> >
> > https://github.com/szpuszi/linux-perf-io-test/actions/runs/43257707229
> >
> >  tools/lib/api/io.h        |  2 +-
> >  tools/perf/tests/Build    |  1 +
> >  tools/perf/tests/api-io.c | 33 ++++++++++++++++++++++++++++++++-
> >  3 files changed, 34 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/lib/api/io.h b/tools/lib/api/io.h
> > index 1731996b..25e2008d 100644
> > --- a/tools/lib/api/io.h
> > +++ b/tools/lib/api/io.h
> > @@ -91,7 +91,7 @@ static inline int io__get_char(struct io *io)
> >                 if (ret)
> >                         return ret;
> >         }
> > -       return *io->data++;
> > +       return (unsigned char)*io->data++;
> >  }
> >
> >  /* Read a hexadecimal value with no 0x prefix into the out argument he=
x. If the
> > diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
> > index 58858f3d..c3ba1fca 100644
> > --- a/tools/perf/tests/Build
> > +++ b/tools/perf/tests/Build
> > @@ -79,6 +79,7 @@ perf-test-$(CONFIG_DWARF_UNWIND) +=3D dwarf-unwind.o
> >  endif
> >
> >  CFLAGS_dwarf-unwind.o +=3D -fno-optimize-sibling-calls
> > +CFLAGS_api-io.o +=3D -fsigned-char
> >
> >  perf-test-y +=3D workloads/
> >
> > diff --git a/tools/perf/tests/api-io.c b/tools/perf/tests/api-io.c
> > index 0ba3d5cc..f283712e 100644
> > --- a/tools/perf/tests/api-io.c
> > +++ b/tools/perf/tests/api-io.c
> > @@ -98,7 +98,7 @@ static int do_test_get_char(const char *test_string,
> > size_t buf_size)
> >         for (i =3D 0; i < strlen(test_string); i++) {
> >                 ch =3D io__get_char(&io);
> >
> > -               EXPECT_EQUAL(ch, test_string[i]);
> > +               EXPECT_EQUAL(ch, (unsigned char)test_string[i]);
> >                 EXPECT_EQUAL(io.eof, false);
> >         }
> >         ch =3D io__get_char(&io);
> > @@ -118,6 +118,7 @@ static int test_get_char(void)
> >                 "12345678abcdef90",
> >                 "a\nb\nc\nd\n",
> >                 "\a\b\t\v\f\r",
> > +               "\x7f\x80\xfe\xff",
> >         };
> >         for (i =3D 0; i <=3D 10; i++) {
> >                 for (j =3D 0; j < ARRAY_SIZE(test_strings); j++) {
> > @@ -290,6 +291,34 @@ static int test_get_dec(void)
> >         return ret;
> >  }
> >
> > +static int test_get_line_non_ascii(void)
> > +{
> > +       static const char test_string[] =3D "a\xc3\xa9\xff\nnext\n";
> > +       char path[PATH_MAX];
> > +       struct io io;
> > +       char *line =3D NULL;
> > +       size_t line_len =3D 0;
> > +       int len, ret =3D 0;
> > +
> > +       if (setup_test(path, test_string, 2, &io))
> > +               return -1;
> > +
> > +       len =3D io__getline(&io, &line, &line_len);
> > +       EXPECT_EQUAL(len, 5);
> > +       EXPECT_EQUAL((int)line_len, 5);
> > +       EXPECT_EQUAL((int)strlen(line), 5);
> > +       if (line_len =3D=3D 5)
> > +               EXPECT_EQUAL(memcmp(line, test_string, 5), 0);
> > +       len =3D io__getline(&io, &line, &line_len);
> > +       EXPECT_EQUAL(len, 5);
> > +       EXPECT_EQUAL((int)line_len, 5);
> > +       EXPECT_EQUAL(strcmp(line, "next\n"), 0);
> > +
> > +       free(line);
> > +       cleanup_test(path, &io);
> > +       return ret;
> > +}
> > +
> >  static int test_get_line(void)
> >  {
> >         char path[PATH_MAX];
> > @@ -337,6 +366,8 @@ static int test__api_io(struct test_suite *test
> > __maybe_unused,
> >                 ret =3D TEST_FAIL;
> >         if (test_get_line())
> >                 ret =3D TEST_FAIL;
> > +       if (test_get_line_non_ascii())
> > +               ret =3D TEST_FAIL;
> >         return ret;
> >  }
> >
> >
> > base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
