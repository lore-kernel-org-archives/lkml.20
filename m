Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F96D4BEE4E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007026; cv=pass; b=YPovnS0Q3LBcTphs0ON/ukQMMZkEWhM5mFevJNCO9r4Y++AnHAV1UREGHAtJLuRvN2XCFrzmdFZG0MyMCy3M0QcmAKQrVgKH2610iWI8yheogUyhbzdtMh2VzcruPWnsxJp1B0GTnNCPZ1y0o8D7Mr+if4cXOk1F9+b0IFxiUR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007026; c=relaxed/simple;
	bh=1nYc5ep613UZr/Xla6mXj1IFA1gfO2wtQb/LxLCCTHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ua+yIwwEh05itdorRgUIzQesKSK4fDHQMfUls9blWUTC95C5KEC8YRisPdqxy+J4JRssllJc9rX/NwBZFckELr2GNdXoWdY33krHKbJksRdumam//eOsK19j7tKB0SEwHnvSSydUHYRrdk78C+PPn9ZsJ6weyuwBPeOGHXhiyUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fr0BGzJ5; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fr0BGzJ5"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52faa58bff5so456261cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790007023; cv=none;
        d=google.com; s=arc-20260327;
        b=k9+TPsxnP+riDdBnKFC8qpWL7IApzVwfyci9SXF5gZ/6ytUIb1UlHa/bfy2sIs2puM
         rPJC/7H9XBzvJwTEM9DyMyi5IUco0L1Hnbt5x95qngSAxY/ssZfof98Q9aSTX1InA0dg
         bMTXvQkQRdkQBkdhWoiTuJTZBAKYaJqCecS0s0Ft/oPbq6fIRcnyu7T9I7mUJPBjOrkz
         zySCB2Ct/17hh7AwhrLnbpoUdkK0LnOvSzE/WloB0XqpaHcBgdBYQPVPuR2hhyupDwSL
         zz0tKDydfHzwLJEoEdH/6JVU32MtAEIdF2S9sPbF5jeyiTZn/5Q0VsUSTyMkmMd3q/d+
         YsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nppgfPtO7aYwkfOWgYtcD6HQ+Vg1u+o5brUp6DN+HpM=;
        fh=F4+Err7wwMovla10Zr6yzTZBmovxr+zy96NmCjTyERU=;
        b=GvrTHjf3AhsH0Ee2osEGEXrmjrIyY52FMqrhhNUZDOtxm04eNDvI1+WFigyCWiOdJw
         3+AXZbFvUZloIYyJ/cMj1QtXk8JBcZwSYMvca33abodVbIZ4psdZ6+wCUYwDa8Ltv7Q6
         Kaq9/gV0xcLgV+4ccwnWrCQunZmMg9BmcavChG2QXUa43WwslvG/AgKFyWGllBKmqYzi
         UKP+ZQesUMyCKNPF+zQXI98VrdObxsbAMi0VtfqLVGlU9b5hnAeXwPpTlOYHj98E1s2k
         Z3R2Vxmdlpr07AHlht98qiIivONrJ57RgSwy1TFD512k8RCbRFnscHTFWM+bCzpIm8V4
         zljw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790007023; x=1790611823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nppgfPtO7aYwkfOWgYtcD6HQ+Vg1u+o5brUp6DN+HpM=;
        b=Fr0BGzJ5KTT5n2pl5b8YFkiSbIke//ocwhfx9ZytcKEROWpfBXTW926/cye5LEnNsG
         7d7B67Gc7WSp9LbEIP159s8uuNrgUifkouxIZo7dxLqSfyz1qdWRR9rds13qSD4JoKck
         ImR8Pbr2JH3R7aIfB+egQTQBEKDazk/EGdkeoXMSTmp/uwBOxQVH0TpbhY/MlKV1DAjq
         Hf13y53hAcnNoPgM15GlcOXqt+hOEmgqxUm0RK3zzOs4A/hckjZBP8bQwQLptIWXV/jF
         jd0Yhuw0g8in70feSMtvVtnJBQVmmZ1W8Y4632Yisf5SZ5FkTrR9BA93/l6hJey8GBp8
         ExPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790007023; x=1790611823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nppgfPtO7aYwkfOWgYtcD6HQ+Vg1u+o5brUp6DN+HpM=;
        b=chJwkEPqzsy/MRsJDRhhqehXbkCFYZnTsBrLk6BDy6rK5nDlrnnw3YHDmo053ZudkF
         kR4iOK0bVxeMfeLEDqIV/1ZcnJ2AVGwxLT7lY6e+jrJAnuFvwkpfLaX+eKbJ8rR8bwBh
         rtmb7kl0oeDNhCTUYq1Zti5LlgG0PQx2RP5nOiG3Wx5YMAHTNMEVlmP++WQBlOs5pGzE
         QeumVeWxp4Eg0Uyo5JiPG4sP3/SGRyet/+Wa3v51EyR7dc0/G95/WE+N6CtqMvNLA1+w
         mS+sS7r8PregxmLAP3+NkvskqMTncNxf63zZ0MmO4uNEdimpEtol3YDhnznawmhk7CKi
         neqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGi3fnKxmxBidvZu8yyx8W1VoUKrpih4kmOOP3rMpANUkAYu2LeTIRrALmmbvjvbfX0UwL81RogLb///U=@vger.kernel.org
X-Gm-Message-State: AFuF++lX9TEXQGOioN2iHDPi7MnqEeRkqY0RhGQWfCPrWM7jaKwsIPNR
	aEhPTW7cEiwegMWiEIvF5XOu0W2u+CWziKIWO0c28AB0Ekf51i5wAr2Bk0GH/HO/gEp4hD1x+UA
	HEbl+ERb6xgLpvgM1CzfUSKj6W2rokoHKnrRGZ9c3
X-Gm-Gg: AYBFou1eKte3I1p/toghebTWOcDtkfTzYys746Vjgk2g6/YDIYfcj+iGwZGyF2KO7AM
	6ERT7dD2n+fxKHEhikxuYzl3DJ0Q1/Iwuivywy6KNpSPT7SIlBd7iVm35YvDM6M0cF9xrdYpLq9
	7emWPy7qijaKZX7+YlT838XMJEKB7O8kD/9GtYkRw8uOGJLLWC2bpbd5CmeFTOlNFelFzGLBj6C
	0eothULhRDsLrlJNrJkvlYv2rU10cLgdgHLpkI+39Uhvhb8CN2cZUnv4c5vtTqT4qqVS1o7W5Xz
	39sDKLcji6O/PN+L5E5ePopAsm0aCUJR3p0qi+GZf/mVZl81fpdF6iJPswh0fcvXllo2LgwyX4V
	JJkn8VnV6
X-Received: by 2002:a05:622a:191c:b0:532:d36c:7094 with SMTP id
 d75a77b69052e-532d8d416cbmr4401251cf.4.1790007022511; Mon, 21 Sep 2026
 09:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912031112.1814574-2-sh_def@163.com> <20260912051747.2215776-1-sh_def@163.com>
In-Reply-To: <20260912051747.2215776-1-sh_def@163.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 21 Sep 2026 09:10:10 -0700
X-Gm-Features: AcwNN1VFYDNRyA9SGd-GBHc_mhmR2tes7V3feOK9W5A-Q7WXP7CKaiBbOyoYb4c
Message-ID: <CAP-5=fUxHz=mp=GOkZsAoXYuayYS60TKBgafTBpRjkMJU5goBg@mail.gmail.com>
Subject: Re: [PATCH v2] perf thread_map: Deduplicate numerically equivalent
 PID and TID strings
To: Hui Su <sh_def@163.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 10:17=E2=80=AFPM Hui Su <sh_def@163.com> wrote:
>
> thread_map__new_by_pid_str() and thread_map__new_by_tid_str() attempt
> to deduplicate adjacent PIDs/TIDs using prev_pid and prev_tid.
> However, prev_pid and prev_tid were never updated inside the loop,
> making the check "if (pid =3D=3D prev_pid)" dead code.
>
> Furthermore, even if prev_pid/prev_tid were updated, strlist sorts
> lexicographically (e.g. "010", "011", "10"), which means identical
> numeric values with different string representations (e.g. leading
> zeros) are not adjacent in the list and would never be deduplicated.
>
> Before this fix, the new tests fail at the first duplicate TID case:
>
>   $ perf test -v 35
>   35: Thread map                                                      :
>   --- start ---
>   test child forked, pid 363297
>   FAILED tests/thread-map.c:63 wrong nr for duplicate TIDs
>     (nr=3D3, expected 1)
>   test child finished with -1
>   ---- end ----
>   Thread map: FAILED!
>
> Replace the ineffective prev_pid/prev_tid check with an intlist seen-set.
> This ensures that any numeric duplicate PID or TID is properly
> recognized and skipped, regardless of string formatting or order.
>
> Add tests for numerically equivalent PID and TID strings.
>
> After this fix:
>
>   $ perf test -v 35
>   35: Thread map                                                      :
>   --- start ---
>   test child forked, pid 363650
>   test child finished with 0
>   ---- end ----
>   Thread map: Ok
>
> Fixes: b52956c961be ("perf tools: Allow multiple threads or processes in =
record, stat, top")
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
> Differences in v2:
>  - Explicitly include <stdio.h> in tools/perf/tests/thread-map.c for snpr=
intf.
>  - Link to v1: https://lore.kernel.org/r/20260912031112.1814574-2-sh_def@=
163.com/
>
>  tools/perf/tests/thread-map.c | 34 ++++++++++++++++++++++++++++++++++
>  tools/perf/util/thread_map.c  | 28 ++++++++++++++++++++--------
>  2 files changed, 54 insertions(+), 8 deletions(-)
>
> diff --git a/tools/perf/tests/thread-map.c b/tools/perf/tests/thread-map.=
c
> index 877868107455..690ccae17c31 100644
> --- a/tools/perf/tests/thread-map.c
> +++ b/tools/perf/tests/thread-map.c
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> +#include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <sys/types.h>
> @@ -56,6 +57,39 @@ static int test__thread_map(struct test_suite *test __=
maybe_unused, int subtest
>         TEST_ASSERT_VAL("wrong refcnt",
>                         refcount_read(&map->refcnt) =3D=3D 1);
>         perf_thread_map__put(map);
> +
> +       /* test numeric deduplication of TIDs */
> +       map =3D thread_map__new_by_tid_str("123,0123,00123");
> +       TEST_ASSERT_VAL("failed to alloc map", map);
> +       TEST_ASSERT_VAL("wrong nr for duplicate TIDs", map->nr =3D=3D 1);
> +       TEST_ASSERT_VAL("wrong pid", perf_thread_map__pid(map, 0) =3D=3D =
123);
> +       perf_thread_map__put(map);
> +
> +       /* test non-adjacent numeric duplicates (strlist lexicographic: 0=
10, 011, 10) */
> +       map =3D thread_map__new_by_tid_str("010,011,10");
> +       TEST_ASSERT_VAL("failed to alloc map", map);
> +       TEST_ASSERT_VAL("wrong nr for non-adjacent duplicate TIDs", map->=
nr =3D=3D 2);
> +       perf_thread_map__put(map);
> +
> +       /* test numeric deduplication of PIDs */
> +       {
> +               struct perf_thread_map *base, *dup;
> +               char pid_str[64];
> +
> +               base =3D thread_map__new_by_pid(getpid());
> +               TEST_ASSERT_VAL("failed to alloc baseline map", base);
> +
> +               snprintf(pid_str, sizeof(pid_str), "%d,0%d", getpid(), ge=
tpid());
> +
> +               dup =3D thread_map__new_str(pid_str, NULL, false);
> +               TEST_ASSERT_VAL("failed to alloc duplicate pid map", dup)=
;
> +               TEST_ASSERT_VAL("wrong nr for duplicate PIDs",
> +                               dup->nr =3D=3D base->nr);
> +
> +               perf_thread_map__put(dup);
> +               perf_thread_map__put(base);
> +       }
> +
>         return 0;
>  }
>
> diff --git a/tools/perf/util/thread_map.c b/tools/perf/util/thread_map.c
> index 48c70f149e92..7b59b3f7f2e4 100644
> --- a/tools/perf/util/thread_map.c
> +++ b/tools/perf/util/thread_map.c
> @@ -10,6 +10,7 @@
>  #include <unistd.h>
>  #include "string2.h"
>  #include "strlist.h"
> +#include "intlist.h"
>  #include <string.h>
>  #include <api/fs/fs.h>
>  #include <linux/string.h>
> @@ -163,12 +164,13 @@ static struct perf_thread_map *thread_map__new_by_p=
id_str(const char *pid_str)
>         int items, total_tasks =3D 0;
>         struct dirent **namelist =3D NULL;
>         int i, j =3D 0;
> -       pid_t pid, prev_pid =3D INT_MAX;
> +       pid_t pid;
>         struct str_node *pos;
>         struct strlist *slist =3D strlist__new(pid_str, NULL);
> +       struct intlist *seen =3D intlist__new(NULL);

Why not parse the pid_str into the intlist and then remove duplicates?

Thanks,
Ian

>
> -       if (!slist)
> -               return NULL;
> +       if (!slist || !seen)
> +               goto out;
>
>         strlist__for_each_entry(pos, slist) {
>                 pid =3D strtol(pos->s, NULL, 10);
> @@ -176,9 +178,12 @@ static struct perf_thread_map *thread_map__new_by_pi=
d_str(const char *pid_str)
>                 if (pid =3D=3D INT_MIN || pid =3D=3D INT_MAX)
>                         goto out_free_threads;
>
> -               if (pid =3D=3D prev_pid)
> +               if (intlist__has_entry(seen, (unsigned long)pid))
>                         continue;
>
> +               if (intlist__add(seen, (unsigned long)pid))
> +                       goto out_free_threads;
> +
>                 sprintf(name, "/proc/%d/task", pid);
>                 items =3D scandir(name, &namelist, filter, NULL);
>                 if (items <=3D 0)
> @@ -200,6 +205,7 @@ static struct perf_thread_map *thread_map__new_by_pid=
_str(const char *pid_str)
>         }
>
>  out:
> +       intlist__delete(seen);
>         strlist__delete(slist);
>         if (threads)
>                 refcount_set(&threads->refcnt, 1);
> @@ -219,17 +225,19 @@ struct perf_thread_map *thread_map__new_by_tid_str(=
const char *tid_str)
>  {
>         struct perf_thread_map *threads =3D NULL, *nt;
>         int ntasks =3D 0;
> -       pid_t tid, prev_tid =3D INT_MAX;
> +       pid_t tid;
>         struct str_node *pos;
>         struct strlist *slist;
> +       struct intlist *seen;
>
>         /* perf-stat expects threads to be generated even if tid not give=
n */
>         if (!tid_str)
>                 return perf_thread_map__new_dummy();
>
>         slist =3D strlist__new(tid_str, NULL);
> -       if (!slist)
> -               return NULL;
> +       seen =3D intlist__new(NULL);
> +       if (!slist || !seen)
> +               goto out;
>
>         strlist__for_each_entry(pos, slist) {
>                 tid =3D strtol(pos->s, NULL, 10);
> @@ -237,9 +245,12 @@ struct perf_thread_map *thread_map__new_by_tid_str(c=
onst char *tid_str)
>                 if (tid =3D=3D INT_MIN || tid =3D=3D INT_MAX)
>                         goto out_free_threads;
>
> -               if (tid =3D=3D prev_tid)
> +               if (intlist__has_entry(seen, (unsigned long)tid))
>                         continue;
>
> +               if (intlist__add(seen, (unsigned long)tid))
> +                       goto out_free_threads;
> +
>                 ntasks++;
>                 nt =3D perf_thread_map__realloc(threads, ntasks);
>
> @@ -251,6 +262,7 @@ struct perf_thread_map *thread_map__new_by_tid_str(co=
nst char *tid_str)
>                 threads->nr =3D ntasks;
>         }
>  out:
> +       intlist__delete(seen);
>         strlist__delete(slist);
>         if (threads)
>                 refcount_set(&threads->refcnt, 1);
> --
> 2.55.0
>
