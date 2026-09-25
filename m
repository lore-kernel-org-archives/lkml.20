Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0102F3B0590
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319404; cv=pass; b=ZB52qlDc7r14faKgtFCzrRqaQmUkeS0lbZ9C2KkL4sNhTCm7vlKBgwQS71cwjFT1qztr4lmglk1x7RoR/KD9wbRYnzMP2JChEM67hlQFYkAzgUpGQXKmpUi/l2CT7krX8XESIerV/aS8xcB0f0vP16cx/n/W6AgnMrZizcUrNVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319404; c=relaxed/simple;
	bh=Yxg642/tgxXz9z0zhYxgkEY/BcDBUgzpcz5icK1lUIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=berjap7SkRXTiAXgBwW3EdIsj+fCFZ90lZo5GCpcDQg2rA3SQhGx+1xEeTwUUyQVotC20UAPVnbz9zLpbHqikpVJVMvS8MgW2hsl4VLi8sFYPwoutUHYjr06gYhp3lZM5eGDr7b7rODkv+G1WU3Dtywe/O7WiLH6GN1dWR7qw6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lmQ144tL; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lmQ144tL"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so6920a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790319400; cv=none;
        d=google.com; s=arc-20260327;
        b=H4kMsAQPGSsFeAzWsE0CG4Uisf/fWYA/s/5f7N8n8QuoaFnNHWUD2BnBVTscplz7PV
         TuolRxhnwbtlfAgX+RHXmOgRg8PMKQxebg7IZA9n/bsYSYi7R8Oxx6PVQpSHKz05RAGg
         VT40arDbMVjovGrI2gswFt9douCQUMd/atFbwBhXS+cXVCf8oAKHWbqwutmK+/SsNTOx
         99dPN1dB2CeJjv2UavWy92trkli+/a1t2amHwAhXv7ndZPhgh1ISj99eO0uQx/mE9NeL
         MubVH9c2BP+wWfG1TB+4HicQ2BL9rFX0RiWsyYpY8vJ6zQclWd01rGXVGO17p6gnIWzv
         qgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hMRCfhSqScqxBhP4aDfFnaxI/bmtFUNufAnnugoLKdU=;
        fh=M8QMj5tpXZkC+sPSd/GyNfnMjQvX7g15AKE3cCYkJCU=;
        b=jRLY5G0UIyNF4kf0HNSRvXNi2V6vjo4tIc1PRPHRs9nbYPrLay40yxOVGFrQfVFyz1
         8GaW/LsEREoERrpVCCXWd8JSufBF6D6NOfzXggkAcqbyLAXrzCCSaMmCO5sc/jt/jx30
         OQs9A+ZyKD4Lp+9uqpQMGocgvx79mAtVPIqb1lsW5jRwPho+U130mGlY3qzY6v1jGmUQ
         lLx53CYRr74rvi6L58y7F48AsXQFt9wfRlEWJwKfXvYeu687XfV2KMMm+ayPPehSkQy7
         4VmTuL+grnhY8cIEtrW2/3C/kVsn8+5UJuOE5L+E+5jUMGfF4STJqDLx9Y5IzmZ2SJVb
         9vgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790319400; x=1790924200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMRCfhSqScqxBhP4aDfFnaxI/bmtFUNufAnnugoLKdU=;
        b=lmQ144tLY+UQxvqhAQhtPDsmvb90+S3XGtjxsQ7XNa13MF1r+mYR6JbaCy/b126SiV
         j3LDsednueoLhowbgWxKfl/MJXwvYglXAcLf2PFwNup7tmB9dVojhBfjbSlpkbrOad8R
         MUcHG2ZwqSP4UMJnGBFJtzZ4Ox3KBP81FPHeOyWQCoDZV+Bd9niMIOJAwyV98q+NFpU2
         4+pg7oZpr6AK+KQWcChW4ma+9gLaU3ZwfSiwjR6+Lwxy/6zz8cu/zp6QvEABNEx8yqHs
         sdEI5fS4XVocVdpP7GEtFmySSZ7ctvPnpcacI5DJT1KlfoyjQSKLBp2gdZxnfHv5K+th
         wQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790319400; x=1790924200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMRCfhSqScqxBhP4aDfFnaxI/bmtFUNufAnnugoLKdU=;
        b=ZUkArlfcsTRoUvDzYmGWLglIlO2LITMQejVH5JpiG6DPtxt+yL4EV87uKOffs6oYYi
         BwWSSwp0MggE+l8GwXRWjrV/rO2tYyCqkaLrFyHDHuYGq76ONgqXfBw/DRj4D4QFS7i+
         hcCGbsS4MtvJu8SnbDB5o2GQOgaRnCuFnzCKRpnZMa8mkfb0Mcjk5/szkRlcWFCRY04i
         03LiT/lxg/3nQSmAT3S+GQ9lkdCp/x3wz+bN30yeAWQSm6NCdtAs6eI8HrJe3b4ib13p
         RWOSp0biSxZjZ51CReIDE30tA3NSUuRtkTMdxWQCZVNrrAW8iZWyLw2oMF/5OK10TwJN
         UHGg==
X-Forwarded-Encrypted: i=1; AKwUvBxRJPRM/dXndzZh4kYe5slREGRNkjwtGZnA93Z7cCwmRPs/J/APC4IRfm4ETvquFscmKFQUfAlrPg7TX5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mRDPCWX7rSjSZS7mFg8OnZvlIXx5356NCBhP1mhMHkVESTu9PW
	UJl/hG2ToLAYzNeMz+gnfqAhmpu0M9WA8uMBAR4KHfOkiSSFc3ubcl/OO0w8Cvm40OgkvKcm3+o
	KR4FVdVL8gEsCmuMgOx+Bo+jAbR3bop+yXb7M9reP
X-Gm-Gg: AYBFou2B7GIRLiQBzbd4hYpPiR57P53BpL6oQnm6uZlquqeNyHAFaWaPlPa12u36rzY
	kghC8BkCMvyI4e3Po2WGPVSbq80bPo9Tp+suJ8hVDArb6iqsETzpgVXz9CbyBZHmJOI2lE0Udvn
	/kDk9ye+fC/tvr2NnSjMU11wWTC7fbJ+ghBV2UnoVYpN1yqvhpsBolcFi6zkMxyrRWLMJ3JJK1Q
	jf4Ry75EK1CZy5iDeg13VKoYMWthsSphdNVG5U2IZ3R2kdB/YK85oW1n4Jy86iy9cvLFfOVW848
	Y7mXz2loCcHYE1wUd0SXEOIZ7y1RqTxfxCNe2ahgWEf4vyF/J7A1nA==
X-Received: by 2002:a05:6402:22fc:b0:6a6:967c:3186 with SMTP id
 4fb4d7f45d1cf-6aae4729c8fmr22579a12.2.1790319399533; Thu, 24 Sep 2026
 23:56:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903073523.1055584-1-cui.tao@linux.dev>
In-Reply-To: <20260903073523.1055584-1-cui.tao@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 24 Sep 2026 23:56:24 -0700
X-Gm-Features: AclHuK9BeyeLhIY8ZYCf_4qATP9Z8RSM3Vf5oNRgdLU1izjw_2AxqCipUULxLJo
Message-ID: <CAJuCfpFevJweUFNEuKzZrVfs-xhhqhWGW2veNwGXWD2oBySS+g@mail.gmail.com>
Subject: Re: [PATCH v6] selftests/cgroup: add PSI pressure trigger and
 validation tests
To: Tao Cui <cui.tao@linux.dev>
Cc: Michal Koutny <mkoutny@suse.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ziyang Men <ziyang.meme@gmail.com>, Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:35=E2=80=AFAM Tao Cui <cui.tao@linux.dev> wrote:
>
> From: Tao Cui <cuitao@kylinos.cn>
>
> The cgroup selftests have no PSI coverage. Add test_psi.c: per-resource
> trigger smoke tests (one trigger per fd, IRQ full-only), a
> cgroup.pressure hide/show toggle test, and two CPU-pressure trigger
> tests using over-subscription: one expects the trigger to fire at a
> tiny threshold, the other expects it not to fire at a whole-window
> threshold. Skips when PSI is disabled or a resource is absent.
>
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>

Thanks!

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> ---
> Changes since v5 (Michal Koutny review):
> - Terminate trigger writes with a newline instead of a NUL. The parser
>   (psi_write()) overwrites the last byte of the write with a NUL, so a
>   plain strlen()-sized write silently truncates the last digit for
>   privileged users (e.g. a 2000000us window becomes 200000us) and
>   fails with EINVAL for unprivileged ones. The newline keeps the
>   payload intact and drops the reliance on the undocumented NUL
>   convention.
> - Keep pressure_open() silent: the SKIP message already reports why a
>   resource is unavailable and strace accompanies these tests anyway.
>   This replaces the ksft_perror() added on review of v4, which
>   duplicated the SKIP reason.
> - Treat a test cgroup creation failure in FIXTURE_SETUP() as a failure
>   instead of a SKIP.
> - Drop the unprivileged-minimum remark from the fire test comment and
>   the duplicate sysconf() error report.
> - Add cgroup_trigger_no_fire, the false-trigger side of the firing
>   test: with the threshold equal to the whole window, ncpus+1 hogs must
>   not fire it. Under this oversubscription the measured cpu.pressure
>   "some" stays in the 2-17% range on 2- and 16-CPU machines, so the
>   margin is comfortable.
>
> Changes since v4 (Suren Baghdasaryan review):
> - Report pressure_open() errors with ksft_perror() instead of a raw
>   fprintf.
> - Create the test cgroup in FIXTURE_SETUP() so that setup and teardown
>   are symmetric, and drop the per-test creation and the NULL guard in
>   the teardown.
> - Factor the identical bodies of proc_trigger_io/memory/cpu into
>   test_psi_write(); the helper takes _metadata so that its ASSERTs
>   attribute to the calling test, following the seccomp selftests
>   precedent.
> - Drop the now-unneeded NULL init of self->cg and the stale stdbool.h
>   include left over from the restructuring.
>
> Changes since v3 (Suren Baghdasaryan review):
> - Convert to the kselftest harness: each case is a TEST_F(psi, ...)
>   with the cgroup root/PSI availability checks in FIXTURE_SETUP() and
>   the teardown (kill hogs, destroy cgroup) in FIXTURE_TEARDOWN(),
>   which also removes the "ret"/"created" bookkeeping.
> - A trigger that does not fire within the poll timeout is now a FAIL
>   instead of a SKIP: ncpus+1 hogs with a 1usec threshold must stall,
>   so a timeout indicates a real problem.
> - Treat a poll() timeout and a poll() error uniformly via ASSERT.
> - Check sysconf(_SC_NPROCESSORS_ONLN) only for -1 and report
>   strerror(errno); declare variables one per line; for(;;) {}.
> - Make hog_cpu() die with the runner via PR_SET_PDEATHSIG so an
>   interrupted run does not leave orphaned hogs pinning every CPU.
>
> Changes since v2 (Suren Baghdasaryan, Michal Koutny review):
> - Restructure the trigger test into per-resource cases (io, memory, cpu,
>   irq) so a failure points at the specific resource; irq is skipped when
>   /proc/pressure/irq is absent.
> - Spawn the CPU hogs with cg_run_nowait() instead of open-coding fork(),
>   and arm the trigger with a 2s window so unprivileged users can set it.
> - Address the remaining review comments on cleanup and robustness:
>   guard teardown with a "created" flag, use cg_read_strcmp() instead of
>   atoi(), report strerror() on errors, and fix the unused-parameter and
>   sign-compare nits.
>
> Changes since v1 (Michal Koutny, sashiko review):
> - Keep trigger tests smoke-level; switch the firing test from memory to
>   CPU pressure; drop churn_memory().
> - Keep the runner out of the cgroup; add PSI/IRQ skip-guards and a
>   .gitignore entry.
>
> v1: https://lore.kernel.org/all/20260724025826.504586-1-cui.tao@linux.dev=
/
> v2: https://lore.kernel.org/all/20260728083742.2359320-1-cui.tao@linux.de=
v/
> v3: https://lore.kernel.org/all/20260813133723.1663605-1-cui.tao@linux.de=
v/
> v4: https://lore.kernel.org/all/20260824085913.546741-1-cui.tao@linux.dev=
/
> v5: https://lore.kernel.org/all/20260902040725.877155-1-cui.tao@linux.dev=
/
> ---
>  tools/testing/selftests/cgroup/.gitignore |   1 +
>  tools/testing/selftests/cgroup/Makefile   |   2 +
>  tools/testing/selftests/cgroup/config     |   1 +
>  tools/testing/selftests/cgroup/test_psi.c | 219 ++++++++++++++++++++++
>  4 files changed, 223 insertions(+)
>  create mode 100644 tools/testing/selftests/cgroup/test_psi.c
>
> diff --git a/tools/testing/selftests/cgroup/.gitignore b/tools/testing/se=
lftests/cgroup/.gitignore
> index 952e4448bf070..ce2b907c57ea3 100644
> --- a/tools/testing/selftests/cgroup/.gitignore
> +++ b/tools/testing/selftests/cgroup/.gitignore
> @@ -8,5 +8,6 @@ test_kill
>  test_kmem
>  test_memcontrol
>  test_pids
> +test_psi
>  test_zswap
>  wait_inotify
> diff --git a/tools/testing/selftests/cgroup/Makefile b/tools/testing/self=
tests/cgroup/Makefile
> index e01584c2189ac..a8c69e37332a4 100644
> --- a/tools/testing/selftests/cgroup/Makefile
> +++ b/tools/testing/selftests/cgroup/Makefile
> @@ -16,6 +16,7 @@ TEST_GEN_PROGS +=3D test_kill
>  TEST_GEN_PROGS +=3D test_kmem
>  TEST_GEN_PROGS +=3D test_memcontrol
>  TEST_GEN_PROGS +=3D test_pids
> +TEST_GEN_PROGS +=3D test_psi
>  TEST_GEN_PROGS +=3D test_zswap
>
>  LOCAL_HDRS +=3D $(selfdir)/clone3/clone3_selftests.h $(selfdir)/pidfd/pi=
dfd.h
> @@ -32,4 +33,5 @@ $(OUTPUT)/test_kill: $(LIBCGROUP_O)
>  $(OUTPUT)/test_kmem: $(LIBCGROUP_O)
>  $(OUTPUT)/test_memcontrol: $(LIBCGROUP_O)
>  $(OUTPUT)/test_pids: $(LIBCGROUP_O)
> +$(OUTPUT)/test_psi: $(LIBCGROUP_O)
>  $(OUTPUT)/test_zswap: $(LIBCGROUP_O)
> diff --git a/tools/testing/selftests/cgroup/config b/tools/testing/selfte=
sts/cgroup/config
> index 39f979690dd3b..8a3ef479e83d3 100644
> --- a/tools/testing/selftests/cgroup/config
> +++ b/tools/testing/selftests/cgroup/config
> @@ -4,3 +4,4 @@ CONFIG_CGROUP_FREEZER=3Dy
>  CONFIG_CGROUP_SCHED=3Dy
>  CONFIG_MEMCG=3Dy
>  CONFIG_PAGE_COUNTER=3Dy
> +CONFIG_PSI=3Dy
> diff --git a/tools/testing/selftests/cgroup/test_psi.c b/tools/testing/se=
lftests/cgroup/test_psi.c
> new file mode 100644
> index 0000000000000..95dcb8a9f1843
> --- /dev/null
> +++ b/tools/testing/selftests/cgroup/test_psi.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define _GNU_SOURCE
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <poll.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <sys/prctl.h>
> +#include <linux/limits.h>
> +
> +#include "../kselftest_harness.h"
> +#include "cgroup_util.h"
> +
> +#define PSI_POLL_TIMEOUT_MS    5000
> +
> +/*
> + * The kernel parser overwrites the last byte of a trigger write with a
> + * NUL, so terminate with a newline to keep the payload intact.
> + */
> +static ssize_t write_trigger(int fd, const char *trigger)
> +{
> +       char buf[64];
> +
> +       snprintf(buf, sizeof(buf), "%s\n", trigger);
> +
> +       return write(fd, buf, strlen(buf));
> +}
> +
> +static int pressure_open(const char *resource)
> +{
> +       char path[PATH_MAX];
> +
> +       snprintf(path, sizeof(path), "/proc/pressure/%s", resource);
> +       return open(path, O_RDWR);
> +}
> +
> +FIXTURE(psi)
> +{
> +       char root[PATH_MAX];
> +       char *cg;
> +};
> +
> +FIXTURE_SETUP(psi)
> +{
> +       int psi_fd;
> +
> +       if (cg_find_unified_root(self->root, sizeof(self->root), NULL))
> +               SKIP(return, "cgroup v2 isn't mounted");
> +
> +       /* PSI must be enabled (CONFIG_PSI=3Dy, not disabled on the cmdli=
ne). */
> +       psi_fd =3D open("/proc/pressure/memory", O_RDONLY);
> +       if (psi_fd < 0)
> +               SKIP(return, "PSI unavailable (CONFIG_PSI=3Dn or psi=3D0)=
");
> +       close(psi_fd);
> +
> +       self->cg =3D cg_name(self->root, "psi_trigger_test");
> +       ASSERT_NE(NULL, self->cg);
> +       ASSERT_EQ(0, cg_create(self->cg));
> +}
> +
> +FIXTURE_TEARDOWN(psi)
> +{
> +       cg_killall(self->cg);
> +       cg_destroy(self->cg);
> +       free(self->cg);
> +}
> +
> +/*
> + * /proc/pressure/<resource> accepts exactly one trigger per file
> + * descriptor. Verify that a "some" trigger arms and that a second
> + * trigger on the same fd is rejected with EBUSY.
> + */
> +static void test_psi_write(struct __test_metadata *_metadata,
> +                          const char *filename)
> +{
> +       int fd;
> +
> +       fd =3D pressure_open(filename);
> +       ASSERT_GE(fd, 0);
> +       ASSERT_GT(write_trigger(fd, "some 150000 2000000"), 0);
> +       ASSERT_EQ(-1, write_trigger(fd, "full 150000 2000000"));
> +       ASSERT_EQ(EBUSY, errno);
> +       close(fd);
> +}
> +
> +TEST_F(psi, proc_trigger_io)
> +{
> +       test_psi_write(_metadata, "io");
> +}
> +
> +TEST_F(psi, proc_trigger_memory)
> +{
> +       test_psi_write(_metadata, "memory");
> +}
> +
> +TEST_F(psi, proc_trigger_cpu)
> +{
> +       test_psi_write(_metadata, "cpu");
> +}
> +
> +/*
> + * irq only tracks "full", so a "some" trigger must be rejected while a
> + * "full" trigger arms. irq is optional -- it only exists with IRQ-time
> + * accounting -- so a missing /proc/pressure/irq is SKIP, not FAIL.
> + */
> +TEST_F(psi, proc_trigger_irq)
> +{
> +       int fd;
> +
> +       fd =3D pressure_open("irq");
> +       if (fd < 0)
> +               SKIP(return, "/proc/pressure/irq unavailable");
> +
> +       ASSERT_EQ(-1, write_trigger(fd, "some 150000 2000000"));
> +       ASSERT_GT(write_trigger(fd, "full 150000 2000000"), 0);
> +       close(fd);
> +}
> +
> +/*
> + * cgroup.pressure gates visibility of the per-resource *.pressure files
> + * inside a cgroup: writing 0 hides them, writing 1 shows them again.
> + * Drive one hide/show cycle and check that memory.pressure appears and
> + * disappears along with it.
> + */
> +TEST_F(psi, cgroup_pressure_toggle)
> +{
> +       char buf[BUF_SIZE];
> +
> +       ASSERT_EQ(0, cg_write(self->cg, "cgroup.pressure", "0"));
> +       ASSERT_EQ(0, cg_read_strcmp(self->cg, "cgroup.pressure", "0\n"));
> +       ASSERT_LT(cg_read(self->cg, "memory.pressure", buf, sizeof(buf)),=
 0);
> +
> +       ASSERT_EQ(0, cg_write(self->cg, "cgroup.pressure", "1"));
> +       ASSERT_EQ(0, cg_read_strcmp(self->cg, "cgroup.pressure", "1\n"));
> +       ASSERT_GE(cg_read(self->cg, "memory.pressure", buf, sizeof(buf)),=
 0);
> +}
> +
> +/*
> + * A child that burns CPU forever; stopped by cg_killall() on teardown.
> + * It also dies with the runner, so an interrupted run (e.g. Ctrl-C
> + * during poll()) does not leave orphaned hogs pinning every CPU.

Did you mean to say "orphaned hogs spinning on every CPU"?

> + */
> +static int hog_cpu(const char *cgroup, void *arg)
> +{
> +       prctl(PR_SET_PDEATHSIG, SIGKILL);
> +       for (;;) {}
> +       return 0;
> +}
> +
> +/*
> + * Arm a "some" trigger on a cgroup's cpu.pressure, oversubscribe the
> + * cgroup with more spinning hogs than there are CPUs, and check that th=
e
> + * trigger fires once the cgroup stalls on CPU.
> + */
> +TEST_F(psi, cgroup_trigger_fire)
> +{
> +       char *cpupress;
> +       struct pollfd pfd =3D { .events =3D POLLPRI };
> +       long ncpus;
> +       int fd;
> +       int i;
> +
> +       cpupress =3D cg_control(self->cg, "cpu.pressure");
> +       ASSERT_NE(NULL, cpupress);
> +       fd =3D open(cpupress, O_RDWR);
> +       free(cpupress);
> +       ASSERT_GE(fd, 0);
> +       pfd.fd =3D fd;
> +
> +       /* 1usec threshold over a 2s window: any CPU stall fires it. */
> +       ASSERT_GT(write_trigger(fd, "some 1 2000000"), 0);
> +
> +       ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> +       ASSERT_NE(-1, ncpus);
> +
> +       /* ncpus+1 hogs guarantee CPU contention inside the cgroup. */
> +       for (i =3D 0; i < ncpus + 1; i++)
> +               ASSERT_GE(cg_run_nowait(self->cg, hog_cpu, NULL), 0);
> +
> +       ASSERT_EQ(1, poll(&pfd, 1, PSI_POLL_TIMEOUT_MS));
> +       ASSERT_NE(0, pfd.revents & POLLPRI);
> +       close(fd);
> +}
> +
> +/*
> + * The flip side of cgroup_trigger_fire: with the threshold equal to the
> + * whole window, even ncpus+1 hogs must not accumulate enough stall to
> + * fire the trigger.
> + */
> +TEST_F(psi, cgroup_trigger_no_fire)
> +{
> +       char *cpupress;
> +       struct pollfd pfd =3D { .events =3D POLLPRI };
> +       long ncpus;
> +       int fd;
> +       int i;
> +
> +       cpupress =3D cg_control(self->cg, "cpu.pressure");
> +       ASSERT_NE(NULL, cpupress);
> +       fd =3D open(cpupress, O_RDWR);
> +       free(cpupress);
> +       ASSERT_GE(fd, 0);
> +       pfd.fd =3D fd;
> +
> +       ASSERT_GT(write_trigger(fd, "some 2000000 2000000"), 0);
> +
> +       ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> +       ASSERT_NE(-1, ncpus);
> +
> +       for (i =3D 0; i < ncpus + 1; i++)
> +               ASSERT_GE(cg_run_nowait(self->cg, hog_cpu, NULL), 0);
> +
> +       ASSERT_EQ(0, poll(&pfd, 1, PSI_POLL_TIMEOUT_MS));
> +       close(fd);
> +}
> +
> +TEST_HARNESS_MAIN
> --
> 2.43.0
>
