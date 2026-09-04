Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54EB222597
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543384; cv=pass; b=UO6Qelwqmp8P3qnSBc5f0wPiJRuuRklrBY8E1Bm2wYG2ED4xphlvnpIPsSArzIvCSpVpFbYjNt29EWVQVpDcsC4irHZpOIQsVALl230ZK21L97PXKEE3XViieZEBO5Foi1NUPHBBEjhgVk81bLPEBcg7O2+kIpNutCsA9nQt3z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543384; c=relaxed/simple;
	bh=kN18nX/SOnR/OYASsq4/LUm0pv6VHY1nlyDuL5HOo2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vl3R75eaavcwbeyXl30dNlQ1TWdPvx34O23sRuuhQ5c7eu9SBYEDfSUoTJ6OClqLj3lrqFcaknhIjiB1+V1ZLRfGSvrmjxgpDRxP1ZDExubCqihU2p3TyoHAS6I3PacEnRli4p0BaV2s+yWCcvAUGTkGUJPxOCaJoXKa1ER7gVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZsmxUVjK; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZsmxUVjK"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so282451cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788543381; cv=none;
        d=google.com; s=arc-20260327;
        b=q6yOUhWF3xPiOa0kXMzxkwEn4vAcSGYcy0uIDBs9/YZFG4A+My6DSPcL3lASAcUt2W
         L//4t1WPpd8E7ioPsYqzbtD/uu3vMx08D8BRiJUdPTpe4lM1do5I6nRewBpGdKN1BfVc
         mjuPQ4vfPIYfnRhEzUXMzhzryH+yqzVDEznuk6s35TR2su0FhLK0D1ZImBNlc+se8Tyr
         PWASMvLR291jO57rwUDX6DeUykazi/XGS1QGdb3G9xoB4c0JFaWbHnCC7cbpae9Rd+gV
         7mpNZ6w0j3/l3//0Bk7H4RcrQm7/tUdKUgSsgK/XNs6D6D0NtCRULY6kGYOqtF9WwlQd
         8qBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vvwnlLSpY2UR7TwM4xfNn+7t55Ks33lFeG6Z0EyOl/M=;
        fh=4/C86+4ucPatAdA6xlnBlvjG4z0+zb2jqyGJDQ5flH8=;
        b=JupWvFejfBpObq5bWJb0LHskR+Z0DMs/TYZ030bXManGyCq1Rx4ouekex9xonxqtoA
         6ziufLsiTL1S4ivBIGEq+BGNEYhNTiwjTGoxy8BqStv6vXltml08++J5r8lSG9GbCt9+
         hLM5tqJxlmO8fk4WTFvu93o8PedkDLxU1OSN5At58w+5hz8wefRq8c+lcjdMoZRxbijt
         /gHtcJ9y3eO8C6bP+wfcLlvNPEbCTfctahwnAkbCjMWz+lKZkgxoSJLbAEWHBEhy0GRN
         lu3OwwmWYkXaGajYv3Op8zXHJvISl+U8/6G6b2TCC0Oqfa5ySd2w6qb9/n1Bntx8rcbr
         9UxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788543381; x=1789148181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vvwnlLSpY2UR7TwM4xfNn+7t55Ks33lFeG6Z0EyOl/M=;
        b=ZsmxUVjKdtI73eSZRJ26U0Se9QoLl98w4wYaYeWggoeUNXlZ6TjwbS15fnw0fcdqcW
         j7Nurvml0Us7mfw26YWj0B0vpQIocHiKBEHdjX9cnvRqwRx1ecBj65ezUWzsflld3T/X
         pquEz4Jn6iWwnuIIp7efLQJmQjlQ1lovmiLPHhubduy0FdGwJlCh2c0VO9xmMNXpCx5A
         oBqOL55HO3yeHql++5mxo9iPxyQ6u2uNm5DYgLycEwXx7SBuZpIxmnJRdx7RWfzX/j8y
         4O2nlLBwBiiYV9NFgucEggL21ppJaIIctWRh0jaTmWWVyqVEJkq93bmpWdft74DexGKh
         hwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788543381; x=1789148181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvwnlLSpY2UR7TwM4xfNn+7t55Ks33lFeG6Z0EyOl/M=;
        b=jSe7/TtjY5/okZFHRacZBRdOHYn9/qIC+QgNw34IwmCo5dObgijxgwfIYewJHOhU10
         iApwXvgqjPg9F1JzyyvOn8BI0xAS+xBJrjj5d7B3B+2WceDmEJ/Vn0b1h2ZSJpDC7cHD
         z+wLuZ20otGZrsXYV8aA2SgSvyzNU5SkpXHUVeI67dC5ML6CJkEztbIm/nEJGJv0l6VA
         q5WL2TFCTr1F8Xype0TIQSHI1V6R1HeU6HZIe3jMOTpP0AWfj4o8kOyi95LiMadaOjUi
         wGyxG3o3ImfvD/Gkg/21zX/9vaTHRgnh4zf2CXqic0Q0QWtCRxRLPzFFG2pdlW3R7Fdw
         /gaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiO7pXMX28NC0oFeIiRCPm8zGJumPw7sNtNOeSZaYvxy3Av84MXlh3Rg4GmTQs3XCl3etRj8Pw4fDYH34=@vger.kernel.org
X-Gm-Message-State: AFuF++kffzCO2YNL02yP1i2qvbjE8WRAM7tRRIPpkGnSecCnh4G49CS4
	tPB2Wsl1B4oKl0IgbOGA/p/Sr/jHIufKKkGnGSv2sWPfCdx4PUb4cazgJ8w1eqKbWaVbb/a7mQ5
	h5oAWH0WWqENdrwUYMZ9jslsQRau4EJrhvv71oB6w
X-Gm-Gg: AYBFou2nEboO/gpIBgNfXnmNVHJqQ08s8zsJIuFTZ8e8p8WLZKXYfxy7JBPRI0POLra
	0uGCOqnNUeyZOjzgcLSyGWqO604/oMfEmjbJ7fG7r/dEy0IIPLclhPvIzodvkMYrNJHjgK3yKgc
	pU1vDTx76agMW506XR8mmfbivtbnFEM+lTGceYUmGK/bDCMiZmtkESil6ztyONOyDBwzm4fSfcn
	hC1CMyOpOR/lc4eQ7dUq5sBYx6jU2gaXwBSzrcKyDrp+GHTFa97v2H4SlT+LBatgZEaF5mNI0fv
	d0SEZ//P0qzlhEtx4dzkeuhyYBjPeNW3oe4QFMDxpG0fRoSFqw1o3hqRUDW+nhfkXvt9ONcM2gM
	=
X-Received: by 2002:a05:622a:2589:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-53065d7943emr566721cf.4.1788543379667; Fri, 04 Sep 2026
 10:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831063938.756610-1-namhyung@kernel.org>
In-Reply-To: <20260831063938.756610-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 4 Sep 2026 10:36:08 -0700
X-Gm-Features: AcwNN1XQImgI7VKpu9wx95am5mDKvgVk0WQfynEdEu2BFXHT6erp-E_6QoKxf1g
Message-ID: <CAP-5=fWenUPGqNjy6CdzEnti8czpJTg14w=FTbDrTrHb9APRAw@mail.gmail.com>
Subject: Re: [PATCH v2] perf ftrace latency: Do not read trace files when BPF
 is used
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 11:39=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> I've realized that it didn't set up the tracing files when BPF is used
> so poll() just returns immediately.  It ends up with calling poll()
> unnecessarily in a loop.
>
> BPF still needs the loop to wait for the target process exiting or a
> signal from users.  Let's use a semaphore instead.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/builtin-ftrace.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/tools/perf/builtin-ftrace.c b/tools/perf/builtin-ftrace.c
> index 4f881a40c311ae52..6017493ff179758b 100644
> --- a/tools/perf/builtin-ftrace.c
> +++ b/tools/perf/builtin-ftrace.c
> @@ -6,23 +6,23 @@
>   * Copyright (c) 2020  Changbin Du <changbin.du@gmail.com>, significant =
enhancement.
>   */
>
> -#include "builtin.h"
> -
> +#include <ctype.h>
>  #include <errno.h>
> -#include <unistd.h>
> -#include <signal.h>
> -#include <stdlib.h>
>  #include <fcntl.h>
>  #include <inttypes.h>
>  #include <math.h>
>  #include <poll.h>
> -#include <ctype.h>
> +#include <semaphore.h>
> +#include <signal.h>
> +#include <stdlib.h>
> +#include <unistd.h>
>  #include <linux/capability.h>
>  #include <linux/err.h>
>  #include <linux/string.h>
>  #include <linux/zalloc.h>
>  #include <sys/stat.h>
>
> +#include "builtin.h"
>  #include "debug.h"
>  #include <subcmd/pager.h>
>  #include <subcmd/parse-options.h>
> @@ -45,6 +45,7 @@
>
>  static volatile sig_atomic_t workload_exec_errno;
>  static volatile sig_atomic_t done;
> +static sem_t sig_sem;
>
>  static struct stats latency_stats;  /* for tracepoints */
>
> @@ -53,6 +54,7 @@ static char tracing_instance[PATH_MAX];       /* Trace =
instance directory */
>  static void sig_handler(int sig __maybe_unused)
>  {
>         done =3D true;
> +       sem_post(&sig_sem);
>  }
>
>  /*
> @@ -68,6 +70,7 @@ static void ftrace__workload_exec_failed_signal(int sig=
no __maybe_unused,
>  {
>         workload_exec_errno =3D info->si_value.sival_int;
>         done =3D true;
> +       sem_post(&sig_sem);
>  }
>
>  static bool check_ftrace_capable(void)
> @@ -1146,6 +1149,11 @@ static int __cmd_latency(struct perf_ftrace *ftrac=
e)
>
>         line[0] =3D '\0';
>         while (!done) {
> +               if (ftrace->target.use_bpf) {
> +                       sem_wait(&sig_sem);
> +                       break;
> +               }
> +
>                 if (poll(&pollfd, 1, -1) < 0)
>                         break;
>
> @@ -1852,6 +1860,8 @@ int cmd_ftrace(int argc, const char **argv)
>         INIT_LIST_HEAD(&ftrace.nograph_funcs);
>         INIT_LIST_HEAD(&ftrace.event_pair);
>
> +       sem_init(&sig_sem, 0, 0);
> +
>         signal(SIGINT, sig_handler);
>         signal(SIGUSR1, sig_handler);
>         signal(SIGCHLD, sig_handler);
> @@ -2015,5 +2025,11 @@ int cmd_ftrace(int argc, const char **argv)
>         delete_filter_func(&ftrace.nograph_funcs);
>         delete_filter_func(&ftrace.event_pair);
>
> +       signal(SIGINT, SIG_DFL);
> +       signal(SIGUSR1, SIG_DFL);
> +       signal(SIGCHLD, SIG_DFL);
> +       signal(SIGPIPE, SIG_DFL);
> +
> +       sem_destroy(&sig_sem);
>         return ret;
>  }
> --
> 2.55.0.897.gb25b4bd76c-goog
>
