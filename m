Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794779232;
	b=xEKF2LeilLhUGKQnNb4DiUGbnpwgi76EsapAZ8hNhJHEff7bGFYcZoahGN8JUwFZuPJv
	 944UyAr3ZW9tHIxOVmRBRtyAs9rr1GL9d7zXB0Yse6TvC+tmLRCKMGKnGfigC5/Z65QeD
	 PVfFL2NpfFUIhmUyoOnWoZGk0s0PYUj55OUwz548uBjhbzKVcO1v0vJx7cqO9IhHsAKdb
	 X7GRc6eqKToB6QgVpCfuSFLeNT0atVVbX7BrDGCV7I2WtdLhmdCwUdXePHMo10eYK7MSC
	 OZokAPketaWItuWOUUF1371sxsI88WJF82n5XNhD4SCxD3UuCH9Le2okHAGlVo3X+YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KY524zcDaF9JzpVhBPlIGXmBZ70a6nSskpmzif1Nzw0=;
	b=Q5w0th0XxFJNFD0uSjP3oyun4a5wviBhJhKOkpiiCisxkr17kFDPPD6jypeIQAq1XDvn
	 S6S7g4GCnQIHixpVJV+WAmweD6qTAIS4ReRhfpTNxiobw1d6HSNtJ3OvN2fWYIJatGSPt
	 BDjvOEndKoRBFui0V72CFynGxt70MXSV4tqgyJC2yHrwfFejszujLzy9SES7T6M+BCqID
	 V7KwJvGgQpqfShoPbxxL1J4iStqBUX33YWaN+uqpuDg6v4Z0V3IlnBGpKD7rKl332G535
	 j57/Tnhufq0UYYNKvSos+m3F9asvEjySnUZj/6mqf1T2qO+tOT6/4D0HqygOHXnBYaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ITMNhRTT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2ED606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB2ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ITMNhRTT
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55c7445cf85so208461cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794779231; cv=none;
        d=google.com; s=arc-20260327;
        b=YXRUK3177gOmu5+a19LgpuVVzdug5pJRc2jYkUWs5JCK3pDVEH+mBOrTBWEQJFAAta
         0FUdnns8yKZx693ynBMQh1gIxV34icxH2r5ADgZgknvQvLu7mh5Zjqv4OCAbwdMoeno5
         6jpcBOTB+eC6TtbHXtwD04mV4Ho1/gVSAtBSahVzw+Y7dv7cZr+8/0s6reWDZJRvyYy4
         DmXNLOFzvmTGhARxaCEqpChvsGh86Ke0K4z4UT3Y6OIkqoNw8mA1wc9X0BtEoUEgibbX
         +kTsnryAGL/+/vG2zw9t4PeQJdmSwO/BX0Mwfjeea1Pqw5jXjyFw71kQLLjLcYYeGYO/
         4O2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KY524zcDaF9JzpVhBPlIGXmBZ70a6nSskpmzif1Nzw0=;
        fh=x9eNMXBEOTuXMPtQlSwC2Wpi501agl7P4s/tH3C6+OE=;
        b=Rq6HRkQy6DXb4M/2YJ1Lw3FxDUfQ+fuoAo0Pkn7A7/u7+LNcts+cwZgvy9JWIJdJJM
         erMvMg+gG9Xfi3JY+EyOoeFvOLLDWg4aVU5rlnEtVNhLivJnpoAaedlpeaCG1o98hLqg
         i8oFEgIZhd+NEXadooaz2IIXYqnwufCxyyUQMUB0cvvSONu62bFc+szcPSi4WMRrh4Li
         wl7SzA699UBAyFdN53O+N9Qzv4C8foutXOATTFyrb/lk9BjRFZQPL0W7W8JWebm+wf7i
         iUoVltwtQUMJSx+awfU2FCxdQ10T7tk0dah3CWr8gsB7fDFvFGBvj3Kf0e4P7KxsU4+a
         6AXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794779231; x=1795384031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KY524zcDaF9JzpVhBPlIGXmBZ70a6nSskpmzif1Nzw0=;
        b=ITMNhRTTLZ90oDqyrVkePblvLODyiBaBeHrSEx00EZMVhstHaEmfFoW8Sej7KYziCX
         AK/TDM6xxtwVf1o6d0Ulqip2gnuT0YOr77Y5CGGBRaHMc14MG3FVdkMTo1ebuujQWROl
         Y1AMZDYDVdnB60tDgbADaO+IJI7a25hVOV/yyDIrK6+5AQ6O10lL0tPHokSl29EYs5Ek
         7K4WDWwBSdNdVHfTfmJm29XBpG2dX9pK9jI5ekUKqYHtvm1YVONF/fSpEK8T5WyxwY2B
         zbVqY7T3mC70r5GMlKPVorn0Lf4EgXKntTY6raM0Y2i16QVlF7PauJUoxYIQ1BB0EmtM
         YAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779231; x=1795384031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KY524zcDaF9JzpVhBPlIGXmBZ70a6nSskpmzif1Nzw0=;
        b=ivgnTJfdy+yZaz/reNQHa6XBmPzxy1XOpI7bHJhG+GRRkx9al3Y8njlFkNkxW8DZRI
         08abYk1vKxqUCgobFkBeTMEU+bcVeEaCJ+FTuLJfh2PGarcbWo2CA4gVybao90zoOcgq
         Z5BDY6R/Te+mrjpvHyjFZgewMGQkbwmLNFjydOIy5OE+Yl2YYgweUbkd6Il4X9UedHVT
         K56/PHpyWC5/mBob05hzd516UsNlFCraY3XBIfsZniIou1EpYl2MCpTc5DrKr8XemO6t
         GNbDArhJzG59cbI7SI+yUhGYhBqIY5fqbOXpn1eBpGMRJOdp6/X1AQpxaW9GOnO+xbPo
         Hn9A==
X-Forwarded-Encrypted: i=1; AL+hErEq5VtfCYPTEgUluW0/FCuYJmQaIavD/u9WgPeiN++29keamCc/DxhTEm379GSO4Xlroe7rGAI2ob/zd3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fz5j+bSiiUpESZUniUKv0J60Y3bkRu6KOYM2HZ1qdSetvOo8T
	wDw6iYXRJHVk9ZPtQ2HwlZWm0SkNyaDbRbZzM7oEszEvPqaKABLa5wVfcuUre+5sJwfNH8iw97Y
	ZB4uysQ5fJLXBvv1OnXAghDXTxnrZC5KPlrqBl2h+
X-Gm-Gg: AYBFou2N0fexrm3a3jV0KDhEoaS5bVyS4+2TYBoXDLoksaBwa3VMMoITfi5K6mHboLZ
	QqaYmKYz99KSh5ql5vlGTm7LgTA+TaSiU25yLUferkRfZGoTUEAsBgDT4MsMPTrw5/JfizUFfwd
	KK9M+Kon9Yo7p9RWr/UBJRNhCOBiYAhdq9/1tbkL8eymh1diy1hTFmdkWZ25IrY9gaikyDIBlZ1
	sGLOvTQJaCVlGRCOatrSHjSro2F7zfpyEI3piT+4nF26+JB/e+gh1SBhShWV4vlECzhK5aSrtU1
	LYX4ZKm2vl6+MUoYdrAbDclMX+TjDeyB93cegfrKJ8+lgS0s0d0nbUC9KRdeKKJ3AthpH95RM1T
	un/yFnnnuBtWD9S2R5Y3ombgMbiWmXNnppox9
X-Received: by 2002:a05:622a:5917:b0:54b:648d:9ab5 with SMTP id
 d75a77b69052e-55c67bc6fa6mr24530791cf.11.1794779230155; Sun, 15 Nov 2026
 13:47:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115014102.2879372-1-acme@kernel.org> <20261115014102.2879372-7-acme@kernel.org>
In-Reply-To: <20261115014102.2879372-7-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sun, 15 Nov 2026 13:46:59 -0800
X-Gm-Features: AclHuK9p5dgPwGyyxBwCuXNSFy44RKEFivTqM1rf_pMJqsUSRrhbOaxGt66nG_g
Message-ID: <CAP-5=fVAgPPC7UMo85udqK2zsT-8PQ6QRSOCikRwVv8eX7wXmA@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] perf tests: Exercise data type resolution from a register
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 5:41=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> At -O2 a struct pointer lives in a register and DWARF describes it with
> a register location, while the unoptimized workloads the data type tests
> profile keep their variables on the stack.
>
> Add a regptr workload with a noinline function that gets the pointer from
> a volatile global, which keeps it in a register, and check that its three
> member accesses are resolved from that location.
>
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/builtin-test.c              |  1 +
>  tools/perf/tests/shell/data_type_register.sh | 64 ++++++++++++++++++++
>  tools/perf/tests/tests.h                     |  1 +
>  tools/perf/tests/workloads/Build             |  2 +
>  tools/perf/tests/workloads/regptr.c          | 60 ++++++++++++++++++
>  5 files changed, 128 insertions(+)
>  create mode 100755 tools/perf/tests/shell/data_type_register.sh
>  create mode 100644 tools/perf/tests/workloads/regptr.c
>
> diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-t=
est.c
> index 18311673b231e657..b6d31f5f009d206b 100644
> --- a/tools/perf/tests/builtin-test.c
> +++ b/tools/perf/tests/builtin-test.c
> @@ -201,6 +201,7 @@ static struct test_workload *workloads[] =3D {
>         &workload__false_sharing,
>         &workload__global_data,
>         &workload__flex_array,
> +       &workload__regptr,
>
>  #ifdef HAVE_RUST_SUPPORT
>         &workload__code_with_type,
> diff --git a/tools/perf/tests/shell/data_type_register.sh b/tools/perf/te=
sts/shell/data_type_register.sh
> new file mode 100755
> index 0000000000000000..0b7cb4bfe0aacfbe
> --- /dev/null
> +++ b/tools/perf/tests/shell/data_type_register.sh
> @@ -0,0 +1,64 @@
> +#!/bin/bash
> +# perf data type profiling tests for register variables
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -e
> +
> +perfdata=3D$(mktemp /tmp/__perf_test.perf.data.XXXXX)
> +perfout=3D$(mktemp /tmp/__perf_test.perf.out.XXXXX)
> +
> +cleanup()
> +{
> +       rm -f "$perfdata" "$perfout"
> +       trap - EXIT TERM INT
> +}
> +
> +trap_cleanup()
> +{
> +       echo "Unexpected signal in ${FUNCNAME[1]}"
> +       cleanup
> +       exit 1
> +}
> +trap trap_cleanup EXIT TERM INT
> +
> +if ! perf check feature -q dwarf; then
> +       echo "Skip: no DWARF (libdw) support"
> +       cleanup
> +       exit 2
> +fi
> +
> +# No point in recording if the PMU cannot do memory events.
> +if perf mem record -o /dev/null -- true 2>&1 | \
> +               grep -q "failed: no PMU supports the memory events"; then
> +       cleanup
> +       exit 2
> +fi
> +if ! perf mem record -o /dev/null -- true 2>/dev/null; then
> +       echo "Skip: cannot record memory events on this PMU"
> +       cleanup
> +       exit 2
> +fi
> +
> +if ! perf mem record -o "$perfdata" -- perf test -w regptr 1 > /dev/null=
 2>&1; then
> +       echo "FAIL: perf mem record"
> +       cleanup
> +       exit 1
> +fi
> +
> +if ! perf annotate --code-with-type -i "$perfdata" --stdio \
> +               --percent-limit 1 > "$perfout" 2>/dev/null; then
> +       echo "FAIL: perf annotate"
> +       cleanup
> +       exit 1
> +fi
> +
> +for member in "+0 (a)" "+0x8 (b)" "+0x10 (c)"; do
> +       if ! grep -Fq "# data-type: struct node ${member}" "$perfout"; th=
en
> +               echo "FAIL: member ${member} not resolved from the regist=
er"
> +               cleanup
> +               exit 1
> +       fi
> +done
> +
> +echo "register held access resolved"
> +cleanup
> diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
> index f99910b0f8d93a82..6d284bc79cc31779 100644
> --- a/tools/perf/tests/tests.h
> +++ b/tools/perf/tests/tests.h
> @@ -274,6 +274,7 @@ DECLARE_WORKLOAD(callchain);
>  DECLARE_WORKLOAD(false_sharing);
>  DECLARE_WORKLOAD(global_data);
>  DECLARE_WORKLOAD(flex_array);
> +DECLARE_WORKLOAD(regptr);
>
>  #ifdef HAVE_RUST_SUPPORT
>  DECLARE_WORKLOAD(code_with_type);
> diff --git a/tools/perf/tests/workloads/Build b/tools/perf/tests/workload=
s/Build
> index 74a0cbe49dc93533..17189458032c0a17 100644
> --- a/tools/perf/tests/workloads/Build
> +++ b/tools/perf/tests/workloads/Build
> @@ -19,6 +19,7 @@ perf-test-y +=3D callchain.o
>  perf-test-y +=3D false_sharing.o
>  perf-test-y +=3D global_data.o
>  perf-test-y +=3D flex_array.o
> +perf-test-y +=3D regptr.o
>
>  ifeq ($(CONFIG_RUST_SUPPORT),y)
>      perf-test-y +=3D code_with_type.o
> @@ -39,3 +40,4 @@ CFLAGS_callchain.o        =3D -g -O0 -fno-inline -U_FOR=
TIFY_SOURCE
>  CFLAGS_false_sharing.o    =3D -g -O0 -fno-inline -U_FORTIFY_SOURCE
>  CFLAGS_global_data.o      =3D -g -O0 -fno-inline -U_FORTIFY_SOURCE
>  CFLAGS_flex_array.o       =3D -g -O0 -fno-inline -U_FORTIFY_SOURCE
> +CFLAGS_regptr.o           =3D -g -O2
> diff --git a/tools/perf/tests/workloads/regptr.c b/tools/perf/tests/workl=
oads/regptr.c
> new file mode 100644
> index 0000000000000000..d5d357b047e1cfd1
> --- /dev/null
> +++ b/tools/perf/tests/workloads/regptr.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * A struct pointer that -O2 keeps in a register, so the member accesses
> + * have to be resolved from the register's type state and not from a
> + * stack slot.
> + *
> + * See tests/shell/data_type_register.sh.
> + */
> +#include <signal.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <linux/compiler.h>
> +#include "../tests.h"
> +
> +struct node {
> +       long long a;
> +       long long b;
> +       long long c;
> +};
> +
> +static struct node n;
> +static struct node *volatile vp;
> +static volatile unsigned long long reg_sink;
> +static volatile sig_atomic_t done;
> +
> +static void sighandler(int sig __maybe_unused)
> +{
> +       done =3D 1;
> +}
> +
> +static noinline long long touch(struct node *p)
> +{
> +       long long sum =3D 0;
> +
> +       sum +=3D p->a;
> +       p->b =3D sum;
> +       sum +=3D p->c;
> +       return sum;
> +}
> +
> +static int regptr(int argc, const char **argv)
> +{
> +       unsigned long long sum =3D 0;
> +       int sec =3D 1;
> +
> +       if (argc > 0)
> +               sec =3D atoi(argv[0]);
> +
> +       vp =3D &n;
> +       signal(SIGINT, sighandler);
> +       signal(SIGALRM, sighandler);
> +       alarm(sec);
> +
> +       while (!done)
> +               sum +=3D touch(vp);
> +       reg_sink =3D sum;
> +       return 0;
> +}
> +
> +DEFINE_WORKLOAD(regptr);
> --
> 2.56.0
>
