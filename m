Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794779149;
	b=MRcPR4iYMr89Z03umyAOl4ezOsH8WFKnYLjDJ84IllDg/BMuV7o4AR/1sTPY3WuRGyU4
	 bOlTK+8ped/zFGcM7kLLaQ9hd/3t9Qqx2MwzNcyXTzwOcl/cv6Ikq5GcbOxHGFnqdBq6d
	 XNtMtatf0vVRonCKpMBScAb8Hb/D6gC23pgugR0ObDqFN/tItyYIf4s62/rl4yi014wSG
	 d0LnmfdBnvUo12yFkGw2jkHAn2RqhFZnYS8D15Xb05I2AHGDtrgce1jWE0JeFdQpIExmi
	 MSXwTkYlO60UsR9UvhlX6v6s5sE0Qp2SFHMInV7c3QHL/FwyBhTCQLZiRY+/lZf09iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Yu/mwnlh1+tlXjcPePSAJCAcRFJjqqArEI26Dps0J28=;
	b=v5IPvm9zHbUkpOzG7mtz46bLK5MKDMkRcZ/K+JhPM1JY7XdoHFAfcfDd9ijhSH6z3N0W
	 4VlYdHjdWXok3Agvm4t8a0gRlMphjCUuKiuqKu/zCKcDPawMYBxHoHnnI05/ma/WoDd0e
	 jUB/6i8p4v+QV2KTLGcZwhFIvCoB/SZLhvWlmw2lj68Z+1LId2muFSLRYQrefaLmMdaQG
	 YWLYdkQnxfRrpwU3eINcoxTb9+996RNqlwrR3j1pxoZQXv4nMDJZs5pYLDaEF4KESfCMJ
	 aLY9iqqqb+PRV8OEeTHMzUIQgJT1lUVYifP9AvlGkWKtIGFlImkfFrJelk/5buA3eVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AqsbNkYO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A19A606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A19A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AqsbNkYO
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55c7445cf85so208071cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:45:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794779148; cv=none;
        d=google.com; s=arc-20260327;
        b=VVuBjlOKv6JF9PM9SmZCqfbjfk2ScF5/PBVSlXmpFbyDK7H1vtN9VGfiRqypO3ThPf
         vf5H0ODtW1a7A5hIygaWoY/Oa6IR5nbCoF/IEUszFOyVeCNWGh024lga0pQtjeQhxsh5
         Zlv4FOR4Q+Agg0EMfeuPeyWZlG0zKHHHT+uzq32JnM8iFKXy7sjb12mzk/kZAllifCvT
         V8nWjYX4ngd/oIx4wsRXN7MNTfkCEU2JTlNlGsSOhibdIqaM7GaHxR9MyRuxZJ7QJGuI
         Z8MaINGEQmvzk0YOHeyBM5UhKCxbfslVa4/gVSVc0CmnkRUDofH7+1gurORprGA7rPI8
         AGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yu/mwnlh1+tlXjcPePSAJCAcRFJjqqArEI26Dps0J28=;
        fh=b9VLdndSNOzJNqs0ZxhUOP1yNu84+oyQpvSp7NX9VsI=;
        b=hJLPn28+xNzF0noc5IYY92pHcY2N/xNPbRUn07cUE05f7B5NOFBMyTkw60GTNVxxVb
         2jI4tJq6H/d82BbbNkOfpsNUsaikOBeKSpbBBalct8O6XTpnEhIkAFlShD+NirZ2lRrk
         xxjNv9DBXtGuZ7bxOVyS6b0r39F7Vs09O3hYrzKitw/EFaoUaE6/u2hMjrS2T2Xsz6KS
         Hlau3dCWOToDwc/BWwWV3QVqqT7N+2uwQCxwHWY5AgyFOKaAYz1RnYrf/pPQ05awRIcT
         ekFx9qOCTFo4rSKL9AcMCqMj4Y3XwgS0Cv6WD25gPPZgdINXC2X9weRy4V8ZHZUdSaRL
         N+0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794779148; x=1795383948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yu/mwnlh1+tlXjcPePSAJCAcRFJjqqArEI26Dps0J28=;
        b=AqsbNkYOJNKCCr7jmy8b4WakApka7vt0Mi7qhptnnf5Cw+PCI0wxjPJPPBS7qZjMkG
         zEbYH94y6/iorO7bJ6ulZNNHj5ts9KLQDFKLe2HZqZOK8BKEv3JWGtp4Bad7fAKdB6rm
         6zS05yBsMUOaHNgNIuL4JC/jv+xQMNwNGWiIhZKXN5AlfnvHMl5WbTs7G47pY8uWeS0P
         qFaYAWqg3ro6IoLBkzRvVxyVcqBptNXD+jNBB5BJs/Jh3okOxPQVUi/wnOe+bx8WU6Zx
         Z+sQolMu0kUcv21FX1pyQCXaQEnKenqgp6+GjKrwF4UnSoiRM50h7w6uGSCnGbu+iywf
         KxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779148; x=1795383948;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yu/mwnlh1+tlXjcPePSAJCAcRFJjqqArEI26Dps0J28=;
        b=gFuJPcmoMi4jaV+qr3BIvMVmD9HomV2RURne39y5tcqQFY0KCI/0wEmzIxqH08OGLA
         0PLS+Y/iMYVTWtgC4EBBT4nRwjFZjP37c7iRtSnkqd0P058wnJ+9UOH4Fats7PqV4vFK
         RJ+SolZnRFcsXVU01vn4BapC90lu3hYUqAesQumwQqv2zl8EtCOB9FU29MtAxE+BgUU/
         klUGgsfQsOZ1L3qkaU4f3enVSqHXeXn5ObtfJtaiZ+K4I2UGMcJnhP8fR/ZIXF2ICXrC
         6328gYKWjuDoiaoomhqexuNXUiBLsgvqxSoaZtg7g8i+ND5IZovecFtkOgylVw1x4cBU
         IpIA==
X-Forwarded-Encrypted: i=1; AL+hErHaqT6DVjyA/s17HZ6atT/B8L8WYI1YjVyvlmt62nDXOkZI3sNlnqy07yv4eDiJARA0RtFwN+im5CsuO9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GFBYNPion0TKXSwL2F9bE9lvwYJoiZ4PlfGA4xRUPX3kZlhy5
	/+J+ZJszSQQ61dj9TFGRO8GUJSiD922U6NfkHwCDGvdsncIPmVm1kEhXuGF2W2TdPV/rulY6I3F
	OJjaFdepd/zFBDp/DgXg2Aw38WLcVDa3stne9l43S
X-Gm-Gg: AYBFou0pjqpjFBY3kTz0AmypZ4/KmAs9o/vbaSWIeKAAC1G5qZ5gQtWBEVEi5Lv680h
	GoPUinLL10PsbG9AniJ63yVilEufA7B4w8hOs1eb1TH0VYUlqkByw6EP6vKjnmvYUzAdcg82WzN
	gQELbb8e2SQd0vpDhvkOv5IhtHU9lnxEBY16iRdPOi50LRnizma7hpEYuu9ejN3Ed3P3HcGEFxJ
	5bkV3BKz7vw9lEZ1Tci3mIwi2TBqsptaQezxVC8Fb/ufi/8SF8ld+YFRaHLsLn9VxPTOySabu+a
	JPqoCpoRlZ7BiGjs9XAuXXN/HKm+qJhhQQ7ve9MVXFXKmiXU2r+DL4WtorFj2pH0K+F+FWHVLBe
	nEn8GkqV7RLLxlKRPONyaqXaJpdGymZX28/dC
X-Received: by 2002:a05:622a:681c:10b0:55d:3243:574a with SMTP id
 d75a77b69052e-55d324358d1mr7746991cf.3.1794779147434; Sun, 15 Nov 2026
 13:45:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115014102.2879372-1-acme@kernel.org> <20261115014102.2879372-5-acme@kernel.org>
In-Reply-To: <20261115014102.2879372-5-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sun, 15 Nov 2026 13:45:35 -0800
X-Gm-Features: AclHuK87ku3Ic3VwqaHoz4gZQLMSdOPP2my3uM8kg5YJavnqSFb7CuULDms5lgc
Message-ID: <CAP-5=fU3Zix_mZcT8LURFwUZXH9EMGepdXmhn+PaA9Z_uiegxg@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] perf tests: Exercise the flexible array member path
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
> No test covered find_flex_array() and get_flex_array_member().  Add a
> flex_array workload that keeps a struct with a trailing data[] behind a
> global pointer, and a test that checks the accesses past the struct size
> are resolved and named after the flexible array member.  The test skips
> on 32-bit PIE builds, which load globals through the GOT.
>
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/builtin-test.c               |  1 +
>  .../perf/tests/shell/data_type_flex_array.sh  | 70 +++++++++++++++++++
>  tools/perf/tests/tests.h                      |  1 +
>  tools/perf/tests/workloads/Build              |  2 +
>  tools/perf/tests/workloads/flex_array.c       | 54 ++++++++++++++
>  5 files changed, 128 insertions(+)
>  create mode 100755 tools/perf/tests/shell/data_type_flex_array.sh
>  create mode 100644 tools/perf/tests/workloads/flex_array.c
>
> diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-t=
est.c
> index 299e07bd16a5a53f..18311673b231e657 100644
> --- a/tools/perf/tests/builtin-test.c
> +++ b/tools/perf/tests/builtin-test.c
> @@ -200,6 +200,7 @@ static struct test_workload *workloads[] =3D {
>         &workload__callchain,
>         &workload__false_sharing,
>         &workload__global_data,
> +       &workload__flex_array,
>
>  #ifdef HAVE_RUST_SUPPORT
>         &workload__code_with_type,
> diff --git a/tools/perf/tests/shell/data_type_flex_array.sh b/tools/perf/=
tests/shell/data_type_flex_array.sh
> new file mode 100755
> index 0000000000000000..8d6b277991aea96e
> --- /dev/null
> +++ b/tools/perf/tests/shell/data_type_flex_array.sh
> @@ -0,0 +1,70 @@
> +#!/bin/bash
> +# perf data type profiling tests for flexible array members
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
> +# 32-bit PIE loads globals through the GOT, which the resolver does not =
follow
> +if [ "$(getconf LONG_BIT)" =3D 32 ] &&
> +   [ "$(od -An -tx1 -j16 -N2 "$(command -v perf)" | awk '{print $1}')" =
=3D 03 ]; then
> +       echo "Skip: 32-bit PIE uses GOT-relative global accesses"
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
> +if ! perf mem record -o "$perfdata" -- perf test -w flex_array 1 > /dev/=
null 2>&1; then
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
> +if ! grep -Fq "# data-type: struct flex +0x4 (data)" "$perfout"; then
> +       echo "FAIL: flexible array member not resolved"
> +       cleanup
> +       exit 1
> +fi
> +
> +echo "flexible array member resolved"
> +cleanup
> diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
> index bbd23dd7e0455a9d..f99910b0f8d93a82 100644
> --- a/tools/perf/tests/tests.h
> +++ b/tools/perf/tests/tests.h
> @@ -273,6 +273,7 @@ DECLARE_WORKLOAD(deterministic);
>  DECLARE_WORKLOAD(callchain);
>  DECLARE_WORKLOAD(false_sharing);
>  DECLARE_WORKLOAD(global_data);
> +DECLARE_WORKLOAD(flex_array);
>
>  #ifdef HAVE_RUST_SUPPORT
>  DECLARE_WORKLOAD(code_with_type);
> diff --git a/tools/perf/tests/workloads/Build b/tools/perf/tests/workload=
s/Build
> index 03017aaaaa0bec32..74a0cbe49dc93533 100644
> --- a/tools/perf/tests/workloads/Build
> +++ b/tools/perf/tests/workloads/Build
> @@ -18,6 +18,7 @@ perf-test-y +=3D deterministic.o
>  perf-test-y +=3D callchain.o
>  perf-test-y +=3D false_sharing.o
>  perf-test-y +=3D global_data.o
> +perf-test-y +=3D flex_array.o
>
>  ifeq ($(CONFIG_RUST_SUPPORT),y)
>      perf-test-y +=3D code_with_type.o
> @@ -37,3 +38,4 @@ CFLAGS_named_threads.o    =3D -g -O0 -fno-inline -U_FOR=
TIFY_SOURCE
>  CFLAGS_callchain.o        =3D -g -O0 -fno-inline -U_FORTIFY_SOURCE
>  CFLAGS_false_sharing.o    =3D -g -O0 -fno-inline -U_FORTIFY_SOURCE
>  CFLAGS_global_data.o      =3D -g -O0 -fno-inline -U_FORTIFY_SOURCE
> +CFLAGS_flex_array.o       =3D -g -O0 -fno-inline -U_FORTIFY_SOURCE
> diff --git a/tools/perf/tests/workloads/flex_array.c b/tools/perf/tests/w=
orkloads/flex_array.c
> new file mode 100644
> index 0000000000000000..20f9b0ec17969909
> --- /dev/null
> +++ b/tools/perf/tests/workloads/flex_array.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Flexible array member workload for data type profiling: the accesses =
to
> + * the array are past the end of the struct, where the resolver has to f=
ind
> + * the flexible array member.
> + *
> + * See tests/shell/data_type_flex_array.sh.
> + */
> +#include <signal.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <linux/compiler.h>
> +#include "../tests.h"
> +
> +struct flex {
> +       int len;
> +       char data[];
> +};
> +
> +static struct flex *gp;
> +static volatile unsigned long flex_sink;
> +static volatile sig_atomic_t done;
> +
> +static void sighandler(int sig __maybe_unused)
> +{
> +       done =3D 1;
> +}
> +
> +static int flex_array(int argc, const char **argv)
> +{
> +       unsigned long sum =3D 0;
> +       int sec =3D 1;
> +
> +       if (argc > 0)
> +               sec =3D atoi(argv[0]);
> +
> +       gp =3D calloc(1, sizeof(*gp) + 4096);
> +       if (gp =3D=3D NULL)
> +               return 1;
> +       gp->len =3D 4096;
> +
> +       signal(SIGINT, sighandler);
> +       signal(SIGALRM, sighandler);
> +       alarm(sec);
> +
> +       while (!done) {
> +               sum +=3D gp->data[3];
> +               gp->data[5] =3D 1;
> +       }
> +       flex_sink =3D sum;
> +       return 0;
> +}
> +
> +DEFINE_WORKLOAD(flex_array);
> --
> 2.56.0
>
