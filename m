Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B483A4F50
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846702; cv=pass; b=uyfz15yVHCE7eTdnBOnG2kFQ5cU0iYs2S63KYJLua0ExMj9pD8izD4CCc6xaqziO10khggF8l0MsEjTE5Q6EXSO9qyHiJ1PI+O51EhL0isXW3gRwdfcQqIg5Ov5BXTsK42c1c/BUbxENBNXaHKAf32HOjS3BpOk2ZoCHugi9hHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846702; c=relaxed/simple;
	bh=0I5bVHaxUWjp+7O8jDMkRiFwwFDI/695iS1DgzBz72s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWioOil/o2StWtKBKlMh0heSMykjX37VxzrDzCiCfwOtmPA44LGw1RHADQlDVyO7KDHfcf0kLvtaOmDHC4MTjxTKFljLuoDFPP06FPLerDOmuSf1E26jPwULKSEJ3Bjb2Qt/JhdFfke9+a9uQOF7nEnIzAqWppg4FC7nkIlkc20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vyRsoyoZ; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vyRsoyoZ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so560371cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791846699; cv=none;
        d=google.com; s=arc-20260327;
        b=ZCmU48OzacnpIAWXNSiAWxD0iki+DJH55w7b6kzgTDx2ZeAd/gyH+0swfSrnAnUqfk
         DbmFxzWNAJ86stTAWifOsVlr7q8QHDIqR6Ou3ZcYc6ogZh/3B9Srei9o/HaTF9ziKoSa
         T4GPz2fhwFTNPMuwieG/GVEwfrSTO4zMs4QgQnzMGkKxRnMjxlLczB5sWmtx/WvwROmV
         Z6rljfCKzIr53fcKP7Wf2zMXFoaQtdVd4kFErduxLZ+p4hKZv/lJZQfEdFeFdCG0Wb/B
         I2/LswViO4lh6RLNURUdbi3am/ESWrUPXNddypdzqhrM2eKETSXIJGN9uo5Vrn+c1mzD
         XW2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u+bMsRouJZQukERfob8EiKwLyBg/G62Htpbl7G33MJs=;
        fh=MEhas5FdfAVcM9YyMptfRBpIJz4ZgX7oQh+cweap1HM=;
        b=gjfieYpuXXFMUfhbMuB7dqfkoywgp+RfgBagPTmPLosvh3S3k52sQ0L86wJzkX3or0
         IcJVXYlBhZgIAW0AHHV8hbnB9ZrX+HXjnT/NqhsChSt8xKYpr7KQcYz9bxjwd9glxrqc
         dGUOyaNqSN1J103tpR1Mv/gNrXOlgQI4ife+LXrQzHL0lFAfOnaHDwYHngK2ZrBom6ko
         O0QM2x7nCA3Xuir3rHFlnQonwI6G5CvaRj8MTzUXIyYWUrsxES6Zr8g5irEnYdQ19LF0
         f7mfmXmIPPdSIl4d+gFbja3627AX1KVa8l/NvnBP0hUwCKuHG8+2a/q85lZakGw50iSd
         B+Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791846699; x=1792451499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+bMsRouJZQukERfob8EiKwLyBg/G62Htpbl7G33MJs=;
        b=vyRsoyoZGBOuJ4GEU6AIHLAIQZiddpBjMXQN5MLzKbW3f8ULrhdgNUgSjXTF4Sbblk
         lSy3lAah82aSKt0DmKlmu/plRPf4DVqUkEJPS2x38WETl7bTCQwjrrZcixSBsz6gl5lf
         bXItZzQ1nMInBrqA/I7p8Mfbzq/HezWTFqbPQNp2XdQeqKFUmlegmxE2b8NTfZ3YYWSU
         7ZuzEm1N4PmKAWDngP1GrvMYdGThPU/TKZWL9tEJVDEeEWUIb+saVg5+og44m+OiJwog
         rS7OstiKWu6/TY4hyDHDJKuBdYe1B2oMsfHle8KwbQ4clb1ba/VjMwEbtzQS1FrQe3JR
         VADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791846699; x=1792451499;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+bMsRouJZQukERfob8EiKwLyBg/G62Htpbl7G33MJs=;
        b=2GHYcPJKwepNWX94wjawN5jeol5OdRP079IrDf4Aoxy+81pCyeCqrKQNNFIKdhYdHA
         wqdepWF6v5U+txXtweOQZyVqbRkRZXV9UeFwYwULGJ/6W2X7K3yGwDs8TKyE+8YL5sae
         Vy+gL4wCOv4JeVg3KmT2Cqy8cTl6/6i6743WrK62c8uPxBT1yJzOiBU7/PrKifnz7KHV
         7v+/jSQ1ZvWaKGBV03zwGOnYn+VBhgXAqGFaZyg9HOX+F19bD2uKPrJkv2T/Sf3/XqYj
         F7HNd7X1MdLveheSdN3rMxr97CoPZTY0f1RypJEcwrzjLGlcggJ8cFws4N4GF+w4sSrX
         x7ig==
X-Forwarded-Encrypted: i=1; AKwUvBwXN5OC0uob/8MWZQZtwjlBhQsjBdh4IRLovyMycncSD8zdmhaWa09OT6kKx+SWGFZRGkavLUCrdJR6nyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4l9tA2Auz7qbvotqf1GPySbdYHOfvV/CgYiCvPwA3b5E7uqyy
	IJ3oh5F5MvO2H5pfnxZnLyLLMj2+G20fQZOLm3Km1e1jrrKL1ZJrMhzuWpn5u/8Xnfc5s+YIawn
	J9urX6CFmhRKzr5z4yIaBJomo1lnwloSKEDsOgz3WB6E1JtZG2NAMBkney18=
X-Gm-Gg: AYBFou36MPzXQZnlNmJCSTk8H1pABCWDl5oVbRPC+0GFDo8wrsM9Wuij3Hxp9uVql20
	QM0R5VapS8c6f+NN7ujPnrLytdrOnFjP624eCBZtrOwVNqxew/erUrtguNGgIqjEk19gwCJJHey
	s5/846/+nBM7Ut/thEOD3NWWpxOH1oMI41Ubv9bZgCQOpchbsxHnUhg67SLoYqzHVsKV/fpbvQT
	oF0gKFtzZg8KDL9T7iYDzHoCq6P2WiV28TBLsnX4li1+4bbSMAR45UNj+yidXVtmIMZK1vpkt2c
	lmfC7QXnvYK6ER35yucBR7wip8oE1f3BsXU1ONF1hbNVSWUXOmmpiEIPx75D6qYF5SfVzKu6hCK
	rxA10ABas7g==
X-Received: by 2002:a05:622a:1f0c:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-535b4eca219mr39913141cf.8.1791846698966; Mon, 12 Oct 2026
 16:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012053013.14378-1-namhyung@kernel.org> <20261012053013.14378-4-namhyung@kernel.org>
 <CAP-5=fW1SSoyGKjaujZewF=b3rJ-0vp4kJ-friWNzOQWk+ki5A@mail.gmail.com> <as1n8CgDZxYlQkSK@google.com>
In-Reply-To: <as1n8CgDZxYlQkSK@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 16:11:27 -0700
X-Gm-Features: AclHuK-HHukluNicUj8GP7CFFxMUgqf9ZaEpkGApcagQdUXfvb0VwJu2TGe3iKw
Message-ID: <CAP-5=fXeufoS36+660zMnWksONa8UzbUo_MXyVzDtSDXVnWbfw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] perf test: Update PE file test for other locations
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:06=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Mon, Oct 12, 2026 at 02:51:52PM -0700, Ian Rogers wrote:
> > On Sun, Oct 11, 2026 at 10:30=E2=80=AFPM Namhyung Kim <namhyung@kernel.=
org> wrote:
> > >
> > > The test__pe_file_parsing() expects the test is in the tools/perf
> > > directory, but it could be root or a separate build directory.  Let's
> > > update the logic to try other paths like in the shell_tests__dir_fd()=
.
> > >
> > > Also add some debug messages to inform users why it's skipped.
> > >
> > > Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> > > ---
> > >  tools/perf/tests/pe-file-parsing.c | 13 +++++++++++--
> > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tools/perf/tests/pe-file-parsing.c b/tools/perf/tests/pe=
-file-parsing.c
> > > index 3979f38bf127c218..78dae7e43603b9f8 100644
> > > --- a/tools/perf/tests/pe-file-parsing.c
> > > +++ b/tools/perf/tests/pe-file-parsing.c
> > > @@ -74,10 +74,17 @@ static int test__pe_file_parsing(struct test_suit=
e *test __maybe_unused,
> > >  {
> > >         struct stat st;
> > >         char path_dir[PATH_MAX];
> > > +       static const char * const tests_dirs[] =3D {
> > > +               "./tools/perf/tests",
> > > +               "./tests",
> > > +               "./source/tests"
> >
> > I'm not sure where "source/tests" comes from?
>
> AFAIK it's set when you pass O=3D$(DIR) option when you build perf and it
> points the source tree.

Ah, Andi's change:
https://lore.kernel.org/r/20240807231823.898979-1-ak@linux.intel.com

> > nit: could we add the exec_path case to the list?
>
> It's checked right after. :)

Right, I think you can avoid the duplicated logic by having tests_dir
also have path_dir as the last entry. It'd mean always doing the
snprintf but performance doesn't matter much in a test.

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > Thanks,
> > Ian
> >
> > > +       };
> > >
> > >         /* First try development tree tests. */
> > > -       if (!lstat("./tests", &st))
> > > -               return run_dir("./tests");
> > > +       for (size_t i =3D 0; i < ARRAY_SIZE(tests_dirs); ++i) {
> > > +               if (!lstat(tests_dirs[i], &st))
> > > +                       return run_dir(tests_dirs[i]);
> > > +       }
> > >
> > >         /* Then installed path. */
> > >         snprintf(path_dir, PATH_MAX, "%s/tests", get_argv_exec_path()=
);
> > > @@ -85,6 +92,7 @@ static int test__pe_file_parsing(struct test_suite =
*test __maybe_unused,
> > >         if (!lstat(path_dir, &st))
> > >                 return run_dir(path_dir);
> > >
> > > +       pr_debug("cannot find the tests directory\n");
> > >         return TEST_SKIP;
> > >  }
> > >
> > > @@ -93,6 +101,7 @@ static int test__pe_file_parsing(struct test_suite=
 *test __maybe_unused,
> > >  static int test__pe_file_parsing(struct test_suite *test __maybe_unu=
sed,
> > >                           int subtest __maybe_unused)
> > >  {
> > > +       pr_debug("libbfd is not available\n");
> > >         return TEST_SKIP;
> > >  }
> > >
> > > --
> > > 2.55.0
> > >
