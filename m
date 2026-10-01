Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5143815DE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871636; cv=pass; b=ugzyElB7b0ElXcwE/o1ovOxS6HxgoOwhh1G8gkEpvvnzHOQ7K01GCqFS24iotKQkTc997sM14BIRdgvRHC77fn4sjYbOIcGdSWnH46jtu8/1Ayj/629vm7FcCD3/KpPAa1pAvu9x/x8a+FVH/dOCy/WFScqDIycxoW5IX8ceGoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871636; c=relaxed/simple;
	bh=Qa+5hWTznTrNX5yYAyqwHt/uL7jqwnxHvtU+t8XbxdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUl7tdHQdwIOZ/ViLY9cAl/bdFxWc9D0M63p2jhyiMNbHBaNnworwT9cMGE52WKwJO0LBEhvHy+YigudLZZdhg6NqcpjjBgbD51UycvLzofhikzrZ9axWEQfw8CWFNzNw9qR4w/FOKU9K2C4dfjFI+nVoHZ8YAy80mN4cf5YLSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h1GrSLHY; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h1GrSLHY"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so399501cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790871633; cv=none;
        d=google.com; s=arc-20260327;
        b=QefnveW0As6BUS5RLUHoBUZ85pzKeGF7vfNSkWFHvW77BDI9XbslTqUIhWWcrRgZJH
         vL6htwtjF9jTG63DfyivkIAQqg31l+S6TnP+KDoieQgidd1KrH/2Auyh7MuivElw/w1K
         +RF6UTNpUpplQkUyiz2qHVK2roAjMn/6iaCRzZuhiONxD24Z6oAVxX/VBkTWz/jN8ah6
         nWVCKDajLNshd/RyacjsTyvdqQjeVXFiTnhHrUCcS2SDmZ72CXG11N5fHicM4+9BXuMH
         d3OhT0UUXZ+nSKA4cxViDJt9FBLpQieLbd67TIGlcMg3gZdWPavumPYqYq81YsQ5VEgc
         uR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1sQEDjtk6s8Jnt1sf6zxyPM70VlZQFrTlfpc8yCXSOY=;
        fh=Bo47ak+9tGKfdJvNY/urYmLxkHlX+YHtxi+f06HWrvM=;
        b=pFPBw2QUOUmkSWMBnfyMyrQEjSEH1FrhkGoGpAC72dKz+7yT+xpVMZ45Ok59FMWXYL
         hDIvPhXrNRtHLKXQZ3fivc8z9Gh8ANvs9mQ6MA3Oz6P7l9bTK05Ws+VfGZpmOaKumOY3
         gX996xWN+5M9Yevv1LrIoZIV1/zWBohCd8SY4bXW0Ug4ouJQ1xmT+idjYWo9V+WOobD6
         8mqXwopb08uIUoVEFQnnqCMbHrNy6xEMk3wRBYgwa67P89Byv52R6b1RqkpdDHlbpiqB
         O9Mw2i5ThMPVYSvBL6QUBec3AQSr9o1/S6Aj0Hh38efTScM9gt2iuOBOBfMuMr9ZKhp0
         +teQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790871633; x=1791476433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1sQEDjtk6s8Jnt1sf6zxyPM70VlZQFrTlfpc8yCXSOY=;
        b=h1GrSLHYmx5Accc8KQ6kIWiljurkIi246+6nz0i/mcYRl5rcE7PmKoIMTMGEbPAlFf
         0Jbr5d5wjLVXWZOxx3du5Sln9aaVp8WCkHyAO1UthPrrFUr3Bw8RKppTc0rCuy181Shh
         Gv+Y4b4BYWpCZT5vPEOZ1KFvfSgBQJqmE+wXGbMfZfFF0fZlEJMZ5px0rCY+1yrYarvv
         EBdUhEIxmQyjJLlK9KTBUeSmt16LyMm2/+p//rhJnOWi8RaKRHSFyW+CSi7/J2nhOGFx
         79W9YSrUdzh4hYdirHf09q5H1KmDp10jr0kS9ez+CGs6/uwGEWvQBR2fvw//CgkSZCPK
         Ihcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871633; x=1791476433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1sQEDjtk6s8Jnt1sf6zxyPM70VlZQFrTlfpc8yCXSOY=;
        b=bKKNK5Et1K2NA3pywX1269XS0uP+TelbJAjw51KEQkn0rYlie5bS12p3dJHQeJVRzP
         7rnSFfffJioxACHih72kMnhMEV9dpbaPC27KZrH/HZCIX/OGK3Vt5tqMiAuGRHAO/XZr
         d4Z6TC4ZciudkmpvqK+vVp6kDNhAQvcIO47X5segpg0pP78jU5dxWtOO9eZC1U1/uj0X
         4w8X50e71zkRoenWuI4Avk82CU/V9ShWvdHetbqkiLcGesPYzKpDk5yO93M1IvTHfXxD
         c07oeVwbV+bIK+pruySxhBR002QrC89Grmil9Zrbqxy+t2HI3norSSQYBDFNVryKxzLe
         dlMg==
X-Forwarded-Encrypted: i=1; AKwUvBwdtZT8NOneOsZJTT9fSL2oF4/ZjTrDbQzPzWJp+qDxvB3Zsq6hTBt9L04wqIYG8pr776ivOKVpCSpHeKw=@vger.kernel.org
X-Gm-Message-State: AFuF++kOzeJmF8Tg3i5+OA89e8lmFMtPmTgoGy74uUUWNTdg8dU2IcSd
	0K7WZBRbLYEpYJBXeD/nNULNZ66q1NwqWrgZHTZ/b6mdySN6WiF5+86+i2mgoz2uQnaUm/HSx4G
	0CznZSIf+Q+mXfcw97xT13522AzVX7xEGTKHwHO2a
X-Gm-Gg: AYBFou0n7sGZUZsc3kRmeGFQJaaDEXmTFw048z9MZ7SoXGwofOAU3q/xLNO+nYFcTDP
	EM3vSOWFNCsg7bAiCdRtFhhuC4t8M7H57v1Cx04PMexDex9ij7TS5q4M8lOnhYHLqN/PDZSDGmQ
	QTbaKAX9Ybq/E6KTllz31Ph+zdmiVRdkCW4fLmtcOuwsRtXUlqi80DdYwB2crwD31hXSw8oZjtI
	Hb/HJ0JpgsqjXp2WfR8P5qpwSrpFXOyIT6RcHitqZSPUd2UJkR2cy06GToHcLsLLTF+fSJddqpa
	Z9kzxShJ09LNjtCXRLRr/MM4Beq+RSPAAlhj8k/3175QoIJ3DNxCng==
X-Received: by 2002:ac8:5fcf:0:b0:530:2f98:cebb with SMTP id
 d75a77b69052e-53388e439ffmr13627671cf.11.1790871632162; Thu, 01 Oct 2026
 09:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-perf_replace_optparse_with_argparse-v1-1-268b604f8e55@arm.com>
In-Reply-To: <20261001-perf_replace_optparse_with_argparse-v1-1-268b604f8e55@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 Oct 2026 09:20:20 -0700
X-Gm-Features: AclHuK-RqhHjCopnuIND1a7CQY4YSiIJ5E7S7Fp-2060jJ08nrkt19QGpjVcENc
Message-ID: <CAP-5=fUKDL6yDs0-7h7zz43BJ1uwC6Y-CiS5TMh+=F=iNc=7Jw@mail.gmail.com>
Subject: Re: [PATCH] perf test: Replace optparse with argparse in attr.py
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 8:52=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Depending on the Python and pylint versions, pylint can report that
> optparse is deprecated and fail the lint check. Use argparse to avoid
> this potential warning.
>
> Preserve the existing options and defaults, and let argparse handle
> help and unexpected positional arguments.
>
> Tested with:
>
>   # ./perf test -v 'Perf attribute expectations test'
>   78: Perf attribute expectations test              : Ok
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Hi Leo, thanks for the fix! I see Arnaldo already took this equivalent chan=
ge:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/co=
mmit/?h=3Dtmp.perf-tools-next&id=3Dcd116fcbc0bec7340a659e62210b963c49f93c1e

Sorry for the extra work, but again thanks!
Ian

> ---
>  tools/perf/tests/shell/lib/attr.py | 37 ++++++++++++++------------------=
-----
>  1 file changed, 14 insertions(+), 23 deletions(-)
>
> diff --git a/tools/perf/tests/shell/lib/attr.py b/tools/perf/tests/shell/=
lib/attr.py
> index 7f3d5b64b00dd7de45baff4f7d9baff89e003147..68f06df9565a081174c788b96=
4a5b051fdedf626 100644
> --- a/tools/perf/tests/shell/lib/attr.py
> +++ b/tools/perf/tests/shell/lib/attr.py
> @@ -4,7 +4,7 @@ import configparser
>  import os
>  import sys
>  import glob
> -import optparse
> +import argparse
>  import platform
>  import tempfile
>  import logging
> @@ -426,29 +426,20 @@ def setup_log(verbose):
>      ch.setFormatter(formatter)
>      log.addHandler(ch)
>
> -USAGE =3D '''%s [OPTIONS]
> -  -d dir  # tests dir
> -  -p path # perf binary
> -  -t test # single test
> -  -v      # verbose level
> -''' % sys.argv[0]
> -
>  def main():
> -    parser =3D optparse.OptionParser(usage=3DUSAGE)
> -
> -    parser.add_option("-t", "--test",
> -                      action=3D"store", type=3D"string", dest=3D"test")
> -    parser.add_option("-d", "--test-dir",
> -                      action=3D"store", type=3D"string", dest=3D"test_di=
r")
> -    parser.add_option("-p", "--perf",
> -                      action=3D"store", type=3D"string", dest=3D"perf")
> -    parser.add_option("-v", "--verbose",
> -                      default=3D0, action=3D"count", dest=3D"verbose")
> -
> -    options, args =3D parser.parse_args()
> -    if args:
> -        parser.error('FAILED wrong arguments %s' %  ' '.join(args))
> -        return -1
> +    parser =3D argparse.ArgumentParser()
> +
> +    parser.add_argument("-t", "--test",
> +                        action=3D"store", dest=3D"test", help=3D"single =
test")
> +    parser.add_argument("-d", "--test-dir",
> +                        action=3D"store", dest=3D"test_dir", help=3D"tes=
ts dir")
> +    parser.add_argument("-p", "--perf",
> +                        action=3D"store", dest=3D"perf", help=3D"perf bi=
nary")
> +    parser.add_argument("-v", "--verbose",
> +                        default=3D0, action=3D"count", dest=3D"verbose",
> +                        help=3D"verbose level")
> +
> +    options =3D parser.parse_args()
>
>      setup_log(options.verbose)
>
>
> ---
> base-commit: 705da5b15ab89ba97b11eedbe507c2fd83d31cb9
> change-id: 20261001-perf_replace_optparse_with_argparse-e7f51849a08c
>
> Best regards,
> --
> Leo Yan <leo.yan@arm.com>
>
