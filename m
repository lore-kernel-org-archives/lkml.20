Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401374A2A7C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789760528; cv=pass; b=dpetkeDbyn5xdURvX0Bz24FMafpdeu8Qv90JnTYgswC24cD0bRdg1AX32Si3B0Hzdj4dgo+3m1JISDyKX9g94OkINbam+Kr8wtFDTZpQb0GQw62CXbbhWWj0epU9ZyXBR2ieEHicHaQ5xwnviZeCH0filBmQDDaRCvwybaQtaPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789760528; c=relaxed/simple;
	bh=FciYpfzLKANxNupwU3w7Epq7qWdhQfQ2fn9tImiDYOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGY+Bo0xsa4KLEEVc0SsH+jogWU3mPzVUocslX8n/d0F718LL/aQIx0b5o7DvMcMCEkNHPqyQrVrMZSo1liBAj/GkRsNzmJ5hQ55Y1vdokzP3sox5iRd/e6wJ8c9R5jaxRnHMK2jAloYdFz/iDQCLbdF5bjd5D5YvtJiUR8xYs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jUGoa5HU; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jUGoa5HU"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-530f6bcc301so38011cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789760521; cv=none;
        d=google.com; s=arc-20260327;
        b=r6jX1cq4TaUAdqdCVvM6ofA3Tcc7NuREzfWbXKaLwAM03zG34G9wGSFyZz74q8JpqO
         TTTN7xnB6+XxG6ee7aUr4IgJH+jjpqTfiCHws5CSteJcTDwjDZun/mylJCfuL0orI/fY
         CxAZYU7TCQbm5eQ8Hp0ibjzwQsIJkeXGDwvgiwTF0FICj9mxfYD1pyh8H8WV9x7/V8Lm
         zBDDauOyCvtB831XcyWvW9lFEzY3LOnwCXFVpnX8wAwUPSGOhvePxt3gUQbJKTbUCgzp
         IDosjXWbsT9XQYKVvGJbRfAWCCQUaIHfXauQaQmcA6WToPiBRbsMEMJeHRmgGU0w/rDj
         7MnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TCH7p85Cm7cElO31LspfZMTcJ2Lo8qhjOuojMqh9w6s=;
        fh=Gcn09aiYGKBNpsayGRe4udn3JVox5toKUl5r4AQp4rw=;
        b=DHRVakW2sPI8uMohT1altU0evxzKNF7WrGdnfJMQarbED4XeUhtgrEPB+StaK/sD7b
         NCtbU4rCfpUBfR58iW6WobY6ixIamgwJ2IOUloQ4bdGyw7GhpIeccXkGVDkv91KS1BTr
         i+69GRkTPagd1ohuL/lGUVkDmMSsyfidbB1swkAx+PCP2DMSeR1rWGJmwY3aXjMs69Dw
         qiK1LYyWlbL/VczGu5pRbO05JZOh4XVDODtRJk7aAb9HQamKn1Slcy8Ac0ueGxf14jKO
         7+xdNayfuzzSQp+4Cj8Li47PyD+v5MJvPAFhmJOQtYJe+opBv+52l/GdGUjwjnDNHae7
         RWgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789760521; x=1790365321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCH7p85Cm7cElO31LspfZMTcJ2Lo8qhjOuojMqh9w6s=;
        b=jUGoa5HU/vNuc8F/pwa+jvfY7AybeMM5t7s7Cz0jArL9EYmw8nCxDKpwEeuccvaNwz
         /SWjCtI8aB/zdRdYlVX/4jiRK0LpmDIUbnQmbayzwHpUfHae3xEwPebCcvrGpZCnqWbJ
         7vBV6YLHcTJGxUFWYBXGUo5gEOX0LoyLT9lGYqRGWMQgT8ULaz7Gso3azB0+vIcUCHtQ
         f8ro7vFYNoic3XuqODB/3KQS5OI5YgSX8sIrcyVNj0BgEuhLlUCwpnsLnphJfgpcDMps
         aYhHMqEbH4TwJ2eN3Wvil+kpFPhgtXGBv45ev7lIVG9ze7zVSKivnUMBBJx/k2tqYnI/
         CmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789760521; x=1790365321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCH7p85Cm7cElO31LspfZMTcJ2Lo8qhjOuojMqh9w6s=;
        b=BCb2fpSC9yKWntvhIuYXE1jKUnBpewAmuFMJf0/kkT95qKgIAl9/ntDVIzjwItfvMT
         vZlrODsIU3yIIGhVdarQzRmK8grocHYqAy9VJM9BHfCoFdEGe/4fMzMulD5BytaAW6EI
         YkDzRGLk5QeroYWZrLWAekJboE5K5tY2kq6qeDZmLF0hnW57oS/M5mh6AcYZX1OBPq5k
         2L3HZGrvNyPg2lDZtvUC6p2dQk7IvIoXtlUkXvmzdPyKkvApZyPyyUFmAwhoEqqrFHOm
         UyAjAuRKpC9nuEePhREMcPNeQIIXBakU9dcShT6U0mGADMB5gojgtqrwIxf41JgkJS4Z
         Zusw==
X-Forwarded-Encrypted: i=1; AKwUvBxSziVQSusOYNWNjBgZ77GYz5TIP73mmZUEgSIYDa0WdolMS11OQ8sLUwy86u3LEtWyhKmfUXw9XjxyRaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++laTBSKjXdak09V/ZGMkDIii/DcWRa6gITkF9XIBQUJEmIF0w+6
	4NTNyhM5JbvVYAIZI2OEysvz2u/4OA9igAuWVeyU+0CYaYzpvM55QA1Oa/N3A22mM0VhFHSDKtK
	SCrXRUqDOST62ztULjw03DxOuO2jJAHy49/nqQlxy
X-Gm-Gg: AYBFou2Cb8b587teM2oQXCPc+DagZ0RM5p+x8rnVmX+RRKiW35neMhz2L1IWrPBDwXe
	3Gh/sPoWsx2SjUprAWDho3O4I8Q2gX3srneqfgiSGlEt0lRwwtE56jg/oYCaYoV1bp0PT+BbQub
	8k5JhGysAcUuGrMaBxsJOYROlwLxfyYKwQ0MAzU/5cdXipTLgSgJkdWMbgR6Hz7gsW/2xWpuf1h
	tV0KmGMN+43l9JYHE6QLbr8UJaQJJ0EDdBnLaXrnRTGtGK4T3TncsdF5voGCSS+YRBwqLMuDNvj
	FZuC28ClOfcdYj4jYhVIEx2wDDnJeeMz29xLRzfIjAPGhsVmE6DJ3tqNl42wGC8sHl3cQlrSQxi
	RZ7s6gdubSvA=
X-Received: by 2002:a05:622a:4c16:b0:532:9cd6:2184 with SMTP id
 d75a77b69052e-532af5ca677mr3511171cf.6.1789760520919; Fri, 18 Sep 2026
 12:42:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aq2MQLKmyrxkFd0Y@eldamar.lan> <aq2O42fwBRdHELBC@eldamar.lan>
In-Reply-To: <aq2O42fwBRdHELBC@eldamar.lan>
From: Ian Rogers <irogers@google.com>
Date: Fri, 18 Sep 2026 12:41:49 -0700
X-Gm-Features: AcwNN1Xo9CcFDvMIoZjCpwlNo4XAEGxqbdgx0v6feQC5GXfhUVaYP97hIbvrbVY
Message-ID: <CAP-5=fXL7comAJeMbcWKkT=Ju7NyEUFnWfTvY60SxsSeazWDLQ@mail.gmail.com>
Subject: Re: Please backport subset of 2f5d370dec3f ("perf test: Change all
 remaining #!/bin/sh to #!/bin/bash") for stat_bpf_counters.sh script to
 v6.12.y and older
To: Salvatore Bonaccorso <carnil@debian.org>, stable <stable@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	James Clark <james.clark@linaro.org>, Collin Funk <collin.funk1@gmail.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:20=E2=80=AFPM Salvatore Bonaccorso <carnil@debia=
n.org> wrote:
>
> Hi,
>
> On Fri, Sep 18, 2026 at 09:08:48PM +0200, Salvatore Bonaccorso wrote:
> > Hi
> >
> > Recently for v5.15.221, v6.1.188, v6.6.157, v6.12.110, v6.18.52 and
> > v7.2.6, the commit b02027776ac5 ("perf tests: Fix flakiness in BPF
> > counters test on hybrid systems") was backported, but it introduced
> > bash specific syntax.  For versions after 2f5d370dec3f ("perf test:
> > Change all remaining #!/bin/sh to #!/bin/bash") aka before v6.17-rc1
> > this is not a problem.
> >
> > The proposed patch is a stable series backports specific one, as one
> > cannot simply backport 2f5d370dec3f ("perf test: Change all remaining
> > #!/bin/sh to #!/bin/bash") without picking as well some other context
> > related changes to make it possible. So I was proposing to only change
> > shebang to #!/bin/bash in stable series were it is a problem, as in
> > the stat_bpf_counters.sh script.
>
> "Obviously" there was a typo in the commit message and a missing
> explanation, thus v2 of the proposed change as follows.
>
> Regards,
> Salvatore
>
> From 804ae26dab32c846467d7b7887d8f7dcd3348fa5 Mon Sep 17 00:00:00 2001
> From: Salvatore Bonaccorso <carnil@debian.org>
> Date: Fri, 18 Sep 2026 20:48:59 +0200
> Subject: [PATCH] perf tests: Change shebang for stat_bpf_counters.sh to
>  #!/bin/bash
>
> When commit b02027776ac5 ("perf tests: Fix flakiness in BPF counters
> test on hybrid systems") was backported to several stable series
> (v5.15.221, v6.1.188, v6.6.157, v6.12.110, v6.18.52, v7.2.6) it
> introduced specific bash syntax. For versions after 2f5d370dec3f ("perf
> test: Change all remaining #!/bin/sh to #!/bin/bash") in v6.17-rc1 this
> is not a problem as the shebang was already changed to #!/bin/bash. For
> the older stable series this introduced invalid syntax if #!/bin/sh is
> not bash:
>
>         $ sh -n tools/perf/tests/shell/stat_bpf_counters.sh
>         tools/perf/tests/shell/stat_bpf_counters.sh: 12: Syntax error: "(=
" unexpected
>
>         $ checkbashism tools/perf/tests/shell/stat_bpf_counters.sh
>         possible bashism in tools/perf/tests/shell/stat_bpf_counters.sh l=
ine 52 (bash arrays, ${name[0|*|@]}):
>                 base_instructions=3D$(perf stat --no-big-num -e instructi=
ons:u -- "${workload[@]}" 2>&1 | \
>                                         awk -v i=3D0 -v c=3D0 '/instructi=
ons/ { \
>                                                 if ($1 !=3D "<not") { i++=
; c +=3D $1 } \
>                                         } END { if (i > 0) printf "%.0f",=
 c; else print "<not" }')
>         possible bashism in tools/perf/tests/shell/stat_bpf_counters.sh l=
ine 57 (bash arrays, ${name[0|*|@]}):
>                 bpf_instructions=3D$(perf stat --no-big-num --bpf-counter=
s -e instructions:u \
>                                         -- "${workload[@]}"  2>&1 | \
>                                         awk -v i=3D0 -v c=3D0 '/instructi=
ons/ { \
>                                                 if ($1 !=3D "<not") { i++=
; c +=3D $1 } \
>                                         } END { if (i > 0) printf "%.0f",=
 c; else print "<not" }')
>         possible bashism in tools/perf/tests/shell/stat_bpf_counters.sh l=
ine 68 (bash arrays, ${name[0|*|@]}):
>                 stat_output=3D$(perf stat --no-big-num \
>                         -e instructions/name=3Dbase_instructions/u,instru=
ctions/name=3Dbpf_instructions/bu \
>                         -- "${workload[@]}" 2>&1)
>
> Change shebang for the stat_bpf_counters.sh script to #!/bin/bash.
>
> No upstream commit exists for this change as for versions post 6.17-rc1
> the scripts were converted to #!/bin/bash already.
>
> Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>

Reviewed-by: Ian Rogers <irogers@google.com>

This should have been caught by the perf tool build as that build runs
shellcheck on all tests when shellcheck is available. Maybe there
should be an action to run perf builds as part of the stable backports
when the tools/perf directory is touched.

Thanks,
Ian

> ---
> v2:
>   - Fixed a typo in commit message: hanged -> changed
>   - Explicit state to what shebang was changed for stat_bpf_counters.sh
>     script.
>
>  tools/perf/tests/shell/stat_bpf_counters.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/shell/stat_bpf_counters.sh b/tools/perf/tes=
ts/shell/stat_bpf_counters.sh
> index 76d4a7f15a43..c4f71bfc0fc6 100755
> --- a/tools/perf/tests/shell/stat_bpf_counters.sh
> +++ b/tools/perf/tests/shell/stat_bpf_counters.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  # perf stat --bpf-counters test
>  # SPDX-License-Identifier: GPL-2.0
>
> --
> 2.55.0
>
