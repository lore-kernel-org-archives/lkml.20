Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792604036;
	b=O0XsE0sLFvuzBS2dAteOjcwpCJEtFbi8pRsxB3Thy3SyiRDbsvGuGy0w3nf3HP1YOx9U
	 DWC2SDS3a7dD8zBSPFFjp87CGxl/FighAe2K/jJ8PqrORH3IphpgD48nHQtv8EfVWlM9P
	 sxDxbSIPiVYdfq1lAZc3z4knUeAwp55DR72YBqN3ZnHhINjSqP8MX73c90PC0dBV0e37K
	 dcjgCWQpHs1eTTZ2xquqGsO1SDAinn5GBx438GgDzH4GgFM92EUB46UeMw6e8o91tGIzp
	 mpJSIxx9qJGd8aG7fFpzDxWhl5SsqL94LvDGdvvlFE/eh5mz9gGrcsEXGIPVaRm4o2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fYzql6JtcBCdC5nAto7ifDKMheFmAsIcDGbLFyc5YJI=;
	b=xEIUoYOA6tK2lVL6nPEUn08jMEvjNOCX7aDk6uC8ywEkGDgjYuIaYbRBWTAl8zZo96+j
	 3VaJEEkUn6Daiod4fvVgMs4IYJ5SXQPDIrCIeqzYaWVTPcDu1rXQyvKqI9wWY5SoQ07pq
	 E9ETSFerOSNUlKJ0YHCvdhp1hU3NlTFZRhg23F8m+9ezOdLa7r9vf8Jv1nXgmsuA435EX
	 N4XPR7m1pTyOKzBlV0X3mv7S+juwk9HZ8MzsE3wVwLOTwgDiBvscBuTDDZcs7vX81AToZ
	 um75y3L2Xnqii1uVNHsBEL+FbWS9BmYz+Uh6MHad6+2z/AKQu/kzdW1K23uvRMcR6Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nrTKkC6N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCE0606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FCE0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nrTKkC6N
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5337fa12431so16411cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792604035; cv=none;
        d=google.com; s=arc-20260327;
        b=lw4ddSsdPekfloaZpKfMytJiraA/4/1eXFNpqCWUPStiO/ICQ2Q013f1AuVsnAdZSg
         Z8Z9Z9NefoeHN9nEVYdDDZJyOkrDFkKCnXplQaMIqnccXiDTiNie1nO6bO0fIzxRCIvC
         7o4VfzQlRAU+46ej3DdiAYUL6yCxUPjsQQLrGi60cAXOsPDXCr1fCPax9r5ihWCSYQYM
         OvVy8U/9LHRdb2jeTkqvaRE6CfYzSJT2Fq/QxRO64BR7We3lkm75Pr6JccMdiyakYVnK
         VEKMCib2MfAoLw0Sj2SbnXQ4NdKPoJBURKKgAhivOBSaOj3bVtDYtSTpWtLFzj6OD7Gk
         L9ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fYzql6JtcBCdC5nAto7ifDKMheFmAsIcDGbLFyc5YJI=;
        fh=oEVmwfh6O897ljFOZXaCUfLewBiGMmYqqkrgkJ984zQ=;
        b=PUZr4i24qNHC8anf35WMyzEOdFHNBpfVmMz7IUZJUxrmlLxhpKIQ5VGU83mEpxbtCb
         Yy6G0xEKt5KSvmelswG3EgDKyFOJeMp+6Yp3hspJmbtPkFIRfa0pL6pOnoM6qqhcliD/
         gC0X8lMQhRLX7FGtGQCMjAeBEoHi2yM4TLaNjxSNYWz6rriaPUBUMesbjreApwsY5iVj
         Pzp7AsEoxezBLgMhbaesA/s14T/gtXCrkBWwqm/7TcOw8Oas8IKHsX43sIOlcWH0fzjx
         rARla+LcqeAMlhhQjbGqHyxNiM+/UgyNMjzdn5elgtaVi7lC6IcIbCgLpsC6t2eXiVWK
         TbAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792604035; x=1793208835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fYzql6JtcBCdC5nAto7ifDKMheFmAsIcDGbLFyc5YJI=;
        b=nrTKkC6NkaH26PIFkitl6KaUJ21cO8vGBSvjc93SO+hEBK3V1WmTyYovC6bh/7iuQ1
         p2g6s/w9443LVVjjwLJuKWPDV26pcUu12Bl+WBBLPsbufrPhMcujjd6YSpjQP9dHJUJY
         N3Rak/fAOla8e1uEvpwB5VK+w8fTB3JeYaicO94VBVlINKFNlDurY4zQrulW6yxQV8iV
         KbnvaFO78y4nw+OPSZsPSgRzWS2XNBvm1BKquxKkCB/8rdCP2vBu6lCZJdJ0CdDLoMEC
         cj72ZceVVKzi7uTeBra5zU8bkQykl/JXZtDaItR5az2rgmCHMXuF/PjQLrD6T6Q4+/KC
         mlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604035; x=1793208835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYzql6JtcBCdC5nAto7ifDKMheFmAsIcDGbLFyc5YJI=;
        b=FS5jTqbw7y90iZ3gFvKrMidgGgEeB6RzulM5ihJ5ZNl3tCzAElGykmPdjWwER7zrnj
         RIunsoeZF/YBsy6k3b8Xg4uVlxg7BcZKxeWAy9yQFhGRSZYL2bhuLj+g5Id/4/89li35
         yheRCsJadRbKY84usH3SjwvygSMWWqaGJes5mxrWL09cEwwGOrSMyT3bLpoXXltghnIk
         9eEiiPqBfoc5pX9HUNcoi8c7Uu81d6unQXawjJGBpzlsOxrhV5oCWKjDfz+4BdwVqrcC
         2FWjpTh1+MBPixVFrt1fFaW+MdMFxk6R/XR6+Kjt1lAmdDb2mWpTGut4fjtZji5Q74Xv
         cYTw==
X-Forwarded-Encrypted: i=1; AKwUvBwZy/1MNXYm3yqvNGeL6MeTLZNXWbbCXtv/yTFb309jh5O0sKv/Uw0v/spuwVYYSFiFUhHJig9zJVRqB+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF/H48h7XARGRS0PZ04q0erqL0t69qLyQlqutUXRm65B6qMory
	djNnMJh9VRgegFpmIlbZQlchl/Cd9Tb+refkSucr4mYoK3tB+M4jtxNkwPlL4s4rcqhhM5mo1iL
	YpvCiOJeV13mFavUwhZ6ZKn0eP35jdSk4RBfS7XYU
X-Gm-Gg: AYBFou1d3FUdYyDR0Stu8gqOMTVMlyqT/4mz2ouM/bTI5WeoFVIDiG4HixKYurRk42f
	Ix8FFuSk1PCeuGUop/p4lJNF7nfRG0ysPq1NSk0ujfmY969i+0huhE30IyCWvK21TJxSyr/LtzD
	gt6GfwKCjlaPKObTacxEs/FzZLALqvLPPHfGNUopSSDddgm+az5pOx2ZC0Cf8wLrOxv99buDaTX
	V4PmVJC+EyNQtWhXE+v2Pa6+uRchHHRduU2ANFf11mwtam+ClHs0+zMRZN5B+wGHH0EBpSWS/GS
	SjY1MQIkvwrQnvSnmfwwWZNZH5309/kU+tDvv7iL1zdV1J02aI/86GdPBsjkOsBfV/6kmUseVc2
	XzI4kdahBWwp8uY2BFUGmBwvKSW67fJDbJnkS6+e431gl2tnczhxG+a2tuQB6tWAzpQ==
X-Received: by 2002:a05:622a:a889:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-53684a855d1mr49880921cf.0.1792604034206; Wed, 21 Oct 2026
 10:33:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021141736.2414170-1-nigro.fra@gmail.com>
In-Reply-To: <20261021141736.2414170-1-nigro.fra@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 21 Oct 2026 10:33:42 -0700
X-Gm-Features: AclHuK_UYGv8nDj4Bju93TcWqWdyNwDgMYSd0AQrKP5LC5Z7qQiDvO_lEJUZrc0
Message-ID: <CAP-5=fVB1LWLfvXm97TpjjKL6037mHZW0GzuR94wSaOOoGR8_w@mail.gmail.com>
Subject: Re: [PATCH v2] perf test: Add test for events re-armed with PERF_EVENT_IOC_REFRESH
To: Francesco Nigro <nigro.fra@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	kan.liang@linux.intel.com, leo.yan@arm.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 7:17=E2=80=AFAM Francesco Nigro <nigro.fra@gmail.co=
m> wrote:
>
> Open a sampling event with sample_period 1, re-arm it with
> PERF_EVENT_IOC_REFRESH from its overflow signal handler, as
> self-profilers such as async-profiler do, and check that each of 1000
> events delivers a signal. One case uses a software event (page faults),
> the other the syscalls:sys_enter_getppid tracepoint. The signal is a
> real-time one, so overflows cannot be coalesced, and the page fault
> buffer is marked MADV_NOHUGEPAGE so that each touched page faults once.
>
> The tracepoint case fails since
> commit 18dbcbfabfff ("perf: Fix the POLL_HUP delivery breakage"):
> only the first overflow is delivered. The re-arming ioctl succeeds,
> but the event count stays at 1. It passes on the parent commit. The
> software case passes on both.
>
> The test was written with an AI coding assistant (Claude) from a
> standalone reproducer; I reviewed it and ran it in QEMU on current
> mainline, on that commit and on its parent.
>
> Link: https://github.com/async-profiler/async-profiler/issues/1813
> Signed-off-by: Francesco Nigro <nigro.fra@gmail.com>

Thanks Francesco, testing locally I see a failure on  7.1.6:
```
$ sudo /tmp/perf/perf test -v IOC_REFRESH
Not taking turns using the perf mlock budget: nothing can exhaust it
20: Event re-armed with PERF_EVENT_IOC_REFRESH                        :
20.1: Software event                                                  : Ok
---- start ----
test child forked, pid 187381
1000 events, count 1, 1 overflows (1 POLL_HUP), re-arm errno 0
---- end(-1) ----
20.2: Tracepoint event                                                : FAI=
LED!

=3D=3D=3D Test Summary =3D=3D=3D
Passed main tests : 0
Passed subtests   : 1
Skipped tests     : 0
Failed tests      : 1
List of failed tests:
  20.2: Tracepoint event
```
I believe this is currently expected until the kernel is fixed, which
is somewhat unfortunate. The code looks okay and the build isn't
regressed.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian



> ---
>
> Notes:
>     v2:
>     - Mark the page fault buffer MADV_NOHUGEPAGE: with transparent_hugepa=
ge=3Dalways
>       the software case got 489 of 1000 overflows (reported by Sashiko).
>     - Use a real-time signal instead of SIGIO, so overflows cannot be coa=
lesced.
>     - Print the event count, POLL_HUP signals and the re-arm ioctl's errn=
o.
>     - Skip only on EACCES/EPERM, check the setup calls, accept >=3D 1000
>       overflows, close the event before restoring the signal handler.
>
>     v1: https://lore.kernel.org/r/20261021131006.2101248-1-nigro.fra@gmai=
l.com
>
>     To run it on any x86_64 box with virtme-ng:
>
>       vng --kconfig && make -j$(nproc)
>       make -C tools/perf NO_LIBTRACEEVENT=3D1
>       vng -- tools/perf/perf test -vv REFRESH
>
>     Tracepoint case, 2 vCPUs:
>
>       b320789d6883 (parent)  Ok:     count 1000, 1000 overflows (1000 POL=
L_HUP)
>       18dbcbfabfff           FAILED: count 1, 1 overflows (1 POLL_HUP), r=
e-arm errno 0
>       a804c5742bff (master)  FAILED: count 1, 1 overflows (1 POLL_HUP), r=
e-arm errno 0
>
>     The software case passes on all three, and on master with
>     transparent_hugepage=3Dalways.
>
>     Leo Yan's series "perf: Revert direct PMU stop for refresh limit"
>     reverts 18dbcbfabfff for a different reason; I haven't tested it
>     against this:
>     https://lore.kernel.org/r/20260512-arm_cs_clean_perf_handle-v1-0-75ff=
373ecd22@arm.com
>
>     #regzbot introduced: 18dbcbfabfff
>
>  tools/perf/tests/Build           |   1 +
>  tools/perf/tests/builtin-test.c  |   1 +
>  tools/perf/tests/event_refresh.c | 162 +++++++++++++++++++++++++++++++
>  tools/perf/tests/tests.h         |   1 +
>  4 files changed, 165 insertions(+)
>  create mode 100644 tools/perf/tests/event_refresh.c
>
> diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
> index 66944a4f4..199e10c8c 100644
> --- a/tools/perf/tests/Build
> +++ b/tools/perf/tests/Build
> @@ -23,6 +23,7 @@ perf-test-y +=3D hists_output.o
>  perf-test-y +=3D hists_cumulate.o
>  perf-test-y +=3D bp_signal.o
>  perf-test-y +=3D bp_signal_overflow.o
> +perf-test-y +=3D event_refresh.o
>  perf-test-y +=3D bp_account.o
>  perf-test-y +=3D wp.o
>  perf-test-y +=3D task-exit.o
> diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-t=
est.c
> index 4d0784b16..2b10f4d7f 100644
> --- a/tools/perf/tests/builtin-test.c
> +++ b/tools/perf/tests/builtin-test.c
> @@ -98,6 +98,7 @@ static struct test_suite *generic_tests[] =3D {
>         &suite__hists_link,
>         &suite__bp_signal,
>         &suite__bp_signal_overflow,
> +       &suite__event_refresh,
>         &suite__bp_accounting,
>         &suite__wp,
>         &suite__task_exit,
> diff --git a/tools/perf/tests/event_refresh.c b/tools/perf/tests/event_re=
fresh.c
> new file mode 100644
> index 000000000..726e5de4c
> --- /dev/null
> +++ b/tools/perf/tests/event_refresh.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Re-arm a sampling event from its overflow signal handler with
> + * PERF_EVENT_IOC_REFRESH and check that every overflow is delivered.
> + */
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <inttypes.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <sys/ioctl.h>
> +#include <sys/mman.h>
> +#include <sys/syscall.h>
> +#include <linux/perf_event.h>
> +
> +#include "cloexec.h"
> +#include "debug.h"
> +#include "tests.h"
> +#include "tp_pmu.h"
> +#include <internal/lib.h> // page_size
> +#include "../perf-sys.h"
> +
> +#define NR_EVENTS 1000
> +/* A real-time signal is queued, so no overflow can be coalesced away. *=
/
> +#define REFRESH_SIGNAL (SIGRTMIN + 1)
> +
> +static volatile sig_atomic_t overflows, hups, refresh_errno;
> +
> +static void sig_handler(int signum __maybe_unused, siginfo_t *info,
> +                       void *uc __maybe_unused)
> +{
> +       int saved_errno =3D errno;
> +
> +       overflows++;
> +       if (info->si_code =3D=3D POLL_HUP)
> +               hups++;
> +       if (ioctl(info->si_fd, PERF_EVENT_IOC_REFRESH, 1) < 0)
> +               refresh_errno =3D errno;
> +       errno =3D saved_errno;
> +}
> +
> +/* Count overflow signals for NR_EVENTS calls of trigger(), period 1. */
> +static int count_overflows(struct perf_event_attr *attr, void (*trigger)=
(int i))
> +{
> +       struct sigaction sa, old_sa;
> +       uint64_t count =3D 0;
> +       int fd, i, err =3D TEST_FAIL;
> +
> +       attr->size =3D sizeof(*attr);
> +       attr->sample_period =3D 1;
> +       attr->disabled =3D 1;
> +
> +       fd =3D sys_perf_event_open(attr, 0, -1, -1, perf_event_open_cloex=
ec_flag());
> +       if (fd < 0) {
> +               int open_errno =3D errno;
> +
> +               pr_debug("failed opening event: %s\n", strerror(open_errn=
o));
> +               return open_errno =3D=3D EACCES || open_errno =3D=3D EPER=
M ? TEST_SKIP : TEST_FAIL;
> +       }
> +
> +       memset(&sa, 0, sizeof(sa));
> +       sa.sa_sigaction =3D sig_handler;
> +       sa.sa_flags =3D SA_SIGINFO;
> +       if (sigaction(REFRESH_SIGNAL, &sa, &old_sa) < 0) {
> +               pr_debug("failed setting up signal handler\n");
> +               close(fd);
> +               return TEST_FAIL;
> +       }
> +
> +       if (fcntl(fd, F_SETFL, O_RDWR | O_NONBLOCK | O_ASYNC) < 0 ||
> +           fcntl(fd, F_SETSIG, REFRESH_SIGNAL) < 0 ||
> +           fcntl(fd, F_SETOWN, getpid()) < 0) {
> +               pr_debug("failed setting up signal delivery: %s\n", strer=
ror(errno));
> +               goto out;
> +       }
> +
> +       overflows =3D 0;
> +       hups =3D 0;
> +       refresh_errno =3D 0;
> +       if (ioctl(fd, PERF_EVENT_IOC_REFRESH, 1) < 0) {
> +               pr_debug("PERF_EVENT_IOC_REFRESH failed: %s\n", strerror(=
errno));
> +               goto out;
> +       }
> +       for (i =3D 0; i < NR_EVENTS; i++)
> +               trigger(i);
> +       ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
> +
> +       if (read(fd, &count, sizeof(count)) !=3D sizeof(count))
> +               pr_debug("failed to read the event count\n");
> +       pr_debug("%d events, count %" PRIu64 ", %d overflows (%d POLL_HUP=
), re-arm errno %d\n",
> +                NR_EVENTS, count, overflows, hups, refresh_errno);
> +       /* Unrelated page faults can only add overflows, never hide one. =
*/
> +       if (overflows >=3D NR_EVENTS)
> +               err =3D TEST_OK;
> +out:
> +       /* Close first: a late signal must still find our handler. */
> +       close(fd);
> +       sigaction(REFRESH_SIGNAL, &old_sa, NULL);
> +       return err;
> +}
> +
> +static char *pages;
> +
> +static void touch_page(int i)
> +{
> +       pages[(long)i * page_size] =3D 1;
> +}
> +
> +static int test__event_refresh_sw(struct test_suite *test __maybe_unused=
,
> +                                 int subtest __maybe_unused)
> +{
> +       struct perf_event_attr attr =3D {
> +               .type =3D PERF_TYPE_SOFTWARE,
> +               .config =3D PERF_COUNT_SW_PAGE_FAULTS,
> +       };
> +       int err;
> +
> +       pages =3D mmap(NULL, (long)NR_EVENTS * page_size, PROT_READ | PRO=
T_WRITE,
> +                    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +       if (pages =3D=3D MAP_FAILED)
> +               return TEST_FAIL;
> +       /* One fault per touched page: a huge page would cover many of th=
em. */
> +       madvise(pages, (long)NR_EVENTS * page_size, MADV_NOHUGEPAGE);
> +
> +       err =3D count_overflows(&attr, touch_page);
> +       munmap(pages, (long)NR_EVENTS * page_size);
> +       return err;
> +}
> +
> +static void call_getppid(int i __maybe_unused)
> +{
> +       syscall(SYS_getppid);
> +}
> +
> +static int test__event_refresh_tp(struct test_suite *test __maybe_unused=
,
> +                                 int subtest __maybe_unused)
> +{
> +       struct perf_event_attr attr =3D {
> +               .type =3D PERF_TYPE_TRACEPOINT,
> +       };
> +       int id =3D tp_pmu__id("syscalls", "sys_enter_getppid");
> +
> +       if (id < 0) {
> +               pr_debug("no syscalls:sys_enter_getppid tracepoint\n");
> +               return TEST_SKIP;
> +       }
> +       attr.config =3D id;
> +
> +       return count_overflows(&attr, call_getppid);
> +}
> +
> +static struct test_case tests__event_refresh[] =3D {
> +       TEST_CASE_REASON("Software event", event_refresh_sw, "permissions=
"),
> +       TEST_CASE_REASON("Tracepoint event", event_refresh_tp, "permissio=
ns"),
> +       {       .name =3D NULL, }
> +};
> +
> +struct test_suite suite__event_refresh =3D {
> +       .desc =3D "Event re-armed with PERF_EVENT_IOC_REFRESH",
> +       .test_cases =3D tests__event_refresh,
> +};
> diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
> index cee9e6b62..ecc25b5a3 100644
> --- a/tools/perf/tests/tests.h
> +++ b/tools/perf/tests/tests.h
> @@ -124,6 +124,7 @@ DECLARE_SUITE(parse_events);
>  DECLARE_SUITE(hists_link);
>  DECLARE_SUITE(bp_signal);
>  DECLARE_SUITE(bp_signal_overflow);
> +DECLARE_SUITE(event_refresh);
>  DECLARE_SUITE(bp_accounting);
>  DECLARE_SUITE(wp);
>  DECLARE_SUITE(task_exit);
> --
> 2.55.0
>
