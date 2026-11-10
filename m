Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794329361;
	b=RmtiMHZqtP6zuXkg6+xFlZB6WSW4x/I86Jk1y3kCHBIufAHuBxYte7o3/8zuZXHKqzqh
	 T00sy/2QYvkeB/8wIYTUChJa0vSwnMLDwOp6/CO6OI4YSCNuHCRQruQK5KyQK9WIujixw
	 EKOCLX5VeGMczDIBL1nFl+KO+HrUsZbtNjKt5y8xy4dM7GB9IU0Yn9BBBliMKO65TArXK
	 o56OJFdXryRt/G1wtYagBRMxEqkpkksfwWJufjhraHCGSPbkafDmyehrxKDdQmvL76vOO
	 O+fyiPp9Lqlm82TlAL+SDgBjica/Oc4Y+aWG5Abo6gI/Kp6yui5Jgmu6tESj33t7b3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zlvgwtkrRqBrKyD8hhuPjHxDMNdzszs/sF7zsrz6Lcs=;
	b=t3hzBHpzsJgApecdWZCubOSKuaUp9Vebhmil3lV+vzXhjXj4eI1oS4LqkuBuaw2xO29f
	 5OJM1uImKaf9TZHSjiFL24/v5dZ/+9nOQiWGAWhtv8FK5LVNHyzMFwYvOV33yxelIHFcu
	 pNOpa61GRnE5JIe13cbiZJ3IQ0VCT2leVmu5PsCtya1OI3XbgYTgGoHx8svU72A4uw8gf
	 jfaZ2QG2OnBh1baly8ohT7Ery3AOgqo6I4rZBphQ61oX96ziE0WDfdhC8PFkU2AAuxK6m
	 kc4uRspduIdp8o4LGA6NyeEb/0XORaPmjMKiblYrT5EmvXWYdngpuWFdAF/plLaeXog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wrwwb8RZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABC5606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DABC5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wrwwb8RZ
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-535f598d126so308911cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794329360; cv=none;
        d=google.com; s=arc-20260327;
        b=qp+RmTsifeg8+XSFozKXykVzPhWWW+lF7EkDcn+/02JF8WwRMTOPAT4MksGuSbVjIp
         7b0ZJlpXgGMZWYflwRV1/BFZeS9kDvk9zGjVNml1xHJDA+EW0HlkQ/wdAsM/CGnJAjMD
         cG19WB64xboxSfgk8Vp7mDvC0B8uIZYIhWiySJxo3sPMw5QcRIJji+bAa69DSpt6bN3y
         AxHthYABxHbsGTk6GBhffy82SNnwS3qUjYBjGfClVrkoCEzDTwMV2ZDP39BO5vITjcZp
         GmEFYv41eQ7/pIg0Myj2m7Xp0zPoRPkY7EyJaImm1XYjizvk0fYpk35Yn5EHKRMd3Efu
         zNbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zlvgwtkrRqBrKyD8hhuPjHxDMNdzszs/sF7zsrz6Lcs=;
        fh=gap2mAG4KxZL0Ng7i9H2x2JX+vguvUnMV0WcObYFFwA=;
        b=V1919rgtJQTt2pRA/doYvcZY9CHF0Jew+GWx0c78ArwdzeODRxAZ75JSXkhOlWD1hg
         JIU5NFiW8kePHTGN8JYXCDpssQ+RjlomiNtj1xpE9q+stzrG0lW8l31LyxhBwj7HFKGQ
         /Nla6meG+i24LkFl0k7Jm5usO84ngMP4NTiRieZwNNaEkbvVgdQNDk+N/7PxsyXX0M4E
         yQXu3u4NUR0g+5Urd2rOHs9rRfMxxpkkAYah1X6dngFWZGlnXmvYNxrkAFvX7DQ4Y0dH
         quh/bF0oSBvfKhg3N8kApy2jQTyq+Uw2fwknot+h/mARwdKq0EVZCkh9R56MLJGr58zX
         hsLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794329360; x=1794934160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zlvgwtkrRqBrKyD8hhuPjHxDMNdzszs/sF7zsrz6Lcs=;
        b=Wrwwb8RZMcN+OuQWx3WQ2ei6Vk4em051JvTzan5xfnnBa+3Hd9Vzt3whmnlZXMvJmr
         CM/WMppNYR1MYm6O8gO21DkXr4qr+mRQ8/tBRigH8fFZ7NBw+juEgAbxJOPXw0i6zzor
         MTB7V3OBgWmFL5S4pGfVPiqLBiFuN2sI3GOa5uNdbMNKXqzQAbRf2+9k5SyXB98a9W9m
         y66jEDPD/4InIauMucDL0w2B4I/xXO5RffedrVMzGmz10kZTE5ioYYP2Ci2AWFuHCgMH
         EP1IC0WbOOs9ASzH2EXPtCGUlKHZMo+mg0Rz1DZjaU7SHevMI1mVn26tJ4OpzArwmC13
         Amxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329360; x=1794934160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zlvgwtkrRqBrKyD8hhuPjHxDMNdzszs/sF7zsrz6Lcs=;
        b=yeh703zSxZCAa/ESw/wG3k3OjET+7D7M5tNsja+IYlHpsrK+zY8VhbdhoxRE0CE52f
         U6f75dobzAdw2juxgVBS6jHct5v272MQX55Nom6c6l7IAYFs/lfgsV91dvMZQy2xaaBD
         BSZ+qpM85rBex2i+0rWKeQtPZpTCr7C1DBEP4hrhtSXV9S84bHdqQvZUsLGBO3L/lZRC
         hvUV1t71RJaIUfcGaIoTidBQG8Cr2CyOD5YKaUMoAVzgX8At2KEYnV5qqem4KN/2E/lO
         miu+VejrOGI65vaTdRXzx/unG9yidga55z5sf+vCRC77oEpBYy+qbZVDlcl7KEFGUdat
         NSzA==
X-Forwarded-Encrypted: i=1; AL+hErHZwTydsn5NbXJ3vSH2qRr+fF7Rr5htRY7uKaMJk39HIn99g36tIQ6FcpK3wdqWj44zCEpqray0eeqmqJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UZppAeO+244O7d2ikpKIFla0fAoV6wCywP2sfz8R/4mtZjmtq
	Hpat5WM+avJ3togrAUhKt3pZgweR32GR6bL2IYACwwbSoKX7XbNP6TNoNrrakOeLVB9CXBw9/Wo
	/OUbDRlV1hixah35Y+sJ8GBvzdQuV6edTz6GHecMY
X-Gm-Gg: AYBFou3bZIwcFNB1R1NndctlUehXyntdyOfn48/wyyKcV8oGWB504uVcigVXS2pkU+c
	RVy9BRwFj6feTzfV+mkPabqMl8hmVFB4J2IWB5KaC3Mna4xHr5z0PscnV6V8CZSOLimriuo/SbO
	2ulYgd6zGHbPEpqk0RIv/67o6S67Bqq21hWdz+TwufxygepQ6fBVODhBpHJBTOFa/vHoQgo2S65
	PZOm/u4WPIjubCc2XhZvoj4sYiZVkee/JmgazlxOM0ER1OxvHVFv9Pf2gCh4Z0Ys7kvJTHV/Ud3
	MZsUIVKfqpMkWVDDYtazglm38ITXRVCBtDYdC2SJotuYnv4uk63rwg4ufYbplfEnirc+oR/m5jj
	a3eJA+iIxIc4FK3AKxc8e5lkQw4ICA3uEu0pUMkMQQbSTej8qy1SuiVkb8niAprU+3+3xP5Bmtm
	RRetsFMCm6j9nA
X-Received: by 2002:a05:622a:4ccd:b0:536:3d22:fb83 with SMTP id
 d75a77b69052e-55552e12e96mr17913741cf.13.1794329358807; Tue, 10 Nov 2026
 08:49:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-james-perf-test-fixes-v4-0-355ee6b81917@linaro.org>
 <20261109-james-perf-test-fixes-v4-4-355ee6b81917@linaro.org>
 <CAP-5=fX-AuoMOL+yPXw2FsdcC5Xg7qkb-Q038U3BeB+P+Rf_Yg@mail.gmail.com> <2c48c893-9ab5-4883-bafb-a2580b76c4c1@linaro.org>
In-Reply-To: <2c48c893-9ab5-4883-bafb-a2580b76c4c1@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 10 Nov 2026 08:49:07 -0800
X-Gm-Features: AclHuK-rdkjE7omauEbuYBY4u2l0UMkCaFzsGPJHVInYk0HsEdQiDpmKPGZHwgE
Message-ID: <CAP-5=fUEv49Yymvw+EOwQmmKyOHqSKhRexJG_PC6HRTtgCqR=A@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] perf test: Don't starve per-process tests with
 system-wide events
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Jakub Brnak <jbrnak@redhat.com>, Leo Yan <leo.yan@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 4:30=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> On 09/11/2026 17:47, Ian Rogers wrote:
> > On Mon, Nov 9, 2026 at 5:48=E2=80=AFAM James Clark <james.clark@linaro.=
org> wrote:
> >>
> >> Some tests intermittently fail when run in parallel, for example "Chec=
k
> >> branch stack sampling" fails with no branches recorded at all.
> >>
> >> The default event is cycles:P which there may only be 1 or 2 HW counte=
rs
> >> for on Intel because it's precise. System wide or per-core precise
> >> events hog the HW counter leaving other per-process tests with no
> >> samples. Rather than make all the tests that use default record comman=
ds
> >> run serially, just make the system wide ones use a software event whic=
h
> >> has the greatest possible compatibility. They don't need precise
> >> sampling or HW counters anyway. The per-process tests can be left alon=
e
> >> as their events/processes never run concurrently on any one core.
> >>
> >> The LBR filter is another resource shared by all events on a CPU, and
> >> the system-wide LBR test uses different filters to the per-process
> >> branch stack test, so mark the LBR test as exclusive.
> >
> > Thanks for deflaking the tests! Making the LBR test exclusive is
> > pragmatic; however, it also feels like a shame since recording LBR
> > data in parallel should be something we expect users to do.
> >
> > For PMUs that can have a single user we have logic which prints
> > conflicting users in dump_perf_event_processes:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git/tree/tools/perf/util/evsel.c?h=3Dperf-tools-next#n4519
> >
> > I wonder if, when we get zero counts or no samples we could perform a
> > similar analysis and report conflicting users=E2=80=94though this would
> > inherently be racy. If we had that, maybe we could just repeat the LBR
> > tests until there are no conflicting users and not need the exclusive
> > tag.
> >
>
> Yeah re-running the test for certain failures would probably work well.
> But at the same time if we know certain resources are limited and we're
> running per-CPU and per-thread events at the same time in a way that we
> know won't multiplex at all, maybe it would be better to re-write the
> parallel tests to only use per-thread events.
>
> Even when multiplexing works there can be issues. For example another
> flake I looked at was in the metrics tests. Some of them test that the
> ratios don't exceed 100% for example, but multiplexing can break this
> assumption if all the counters in the metric are only in a weak group
> and they aren't always scheduled at the same time. There was a lot to
> unpick in that one so I dropped it. But it's a similar problem.

So because events are grouped, they should be scheduled in and out
together. Yes a weak group can be broken, but that shouldn't happen
with some caveats:

1) The NMI watchdog should be gone because the buddy watchdog is good
and doesn't take a counter. There's still tech debt because the buddy
watchdog calls itself the NMI watchdog in procfs and the perf tool
warns accordingly. Hopefully we're defaulting to the buddy watchdog
these days. Rather than a boot option I wanted the watchdog to be
selectable at runtime: none, buddy or NMI. Again, the hardest problem
in CS is naming things and the buddy watchdog people made some now
questionable choices.
2) The scaling of events on hybrid/BIG.little systems is broken. I
sent out this RFC and should really push on it more:
https://lore.kernel.org/lkml/20250716223924.825772-1-irogers@google.com/
.

So the value test should never flake, and the fact that it does points
to real bugs, both of which are in the kernel.

> I think some of the kernel PMU scheduling and sharing decisions expect
> that any root user running things per-CPU is "well behaved" or
> understands the impact to other users that their events might have. And
> we're probably not doing that enough in the tests to honor that.

An area I think we're bad on is BPF perf event filtering. The tracing
code has notions of instances, we lack similar concepts for perf
events, so one profiler may derail another. I think we can improve
multiplexing by taking inspiration from the EEVDF scheduler. Again, I
have some plans and paper improvements in this area, but the challenge
is getting feedback.

> Another example for this is with Arm BRBE. There are multiple counters
> on the PMU, so you can have multiple events, but there's only one BRBE
> and one filter, and the branch history is limited. The driver takes the
> union of filters for all the PMU events running and then post processes
> the branch buffer for each user to not leak anything from the other
> event's filter. But imagine that one test gives a certain restricted
> filter and expects to completely fill up the branch buffer, and that
> exact full buffer is required for the test. When another root event runs
> in parallel on the same core, the filter can be widened and the buffer
> gets blown up with other branches that weren't interesting to the other
> test, and are filtered out by the driver anyway making it fail.

I think we should avoid system wide profiling for the tests, that
should mitigate issues like this. We need system-wide profiling for
uncore events.

Thanks,
Ian

> > Anyway, doing all of that is a bigger project.
> >
>
> Yep. and maybe something to keep in mind for any new tests or when doing
> further flake investigations.
>
> > Reviewed-by: Ian Rogers <irogers@google.com>
> >
>
> Thanks!
>
> > Thanks,
> > Ian
> >
> >> This fixes the "Check branch stack sampling" test and other flakes whe=
n
> >> a system-wide record from another test runs at the same time, for
> >> example:
> >>
> >>    $ sudo perf record -a -o /dev/null -- sleep 30 &
> >>    $ sudo perf test -vvv "Check branch stack sampling"
> >>    ...
> >>    Testing user branch stack sampling
> >>    ERROR: Branches missing ^brstack_bench\+[^ ]*/brstack_foo\+[^ ]*/IN=
D_CALL/.*$
> >>    ...
> >>    Testing user branch stack sampling [Failed]
> >>    ...
> >>    Testing branch stack filtering permutation (call,CALL|SYSCALL)
> >>    Testing branch stack filtering [Failed empty script output]
> >>    ...
> >>    ---- end(-1) ----
> >>    138: Check branch stack sampling : FAILED!
> >>
> >> Signed-off-by: James Clark <james.clark@linaro.org>
> >> ---
> >>   tools/perf/tests/shell/record.sh          | 6 +++---
> >>   tools/perf/tests/shell/record_lbr.sh      | 2 +-
> >>   tools/perf/tests/shell/record_sideband.sh | 4 ++--
> >>   3 files changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell=
/record.sh
> >> index 01dc3e22fa73..e4789e2bcf43 100755
> >> --- a/tools/perf/tests/shell/record.sh
> >> +++ b/tools/perf/tests/shell/record.sh
> >> @@ -388,7 +388,7 @@ test_system_wide() {
> >>     echo "Basic --system-wide mode test"
> >>     local ret=3D0
> >>     perf_record_with_retry "${perfdata}" "check_system_wide" "perf tes=
t -w thloop" \
> >> -    -aB --synth=3Dno || ret=3D$?
> >> +    -aB --synth=3Dno -e cpu-clock || ret=3D$?
> >>     if [ $ret -eq 2 ]; then
> >>       echo "System-wide record [Skipped not supported]"
> >>       return
> >> @@ -471,7 +471,7 @@ test_cgroup() {
> >>     echo "Cgroup sampling test"
> >>     local ret=3D0
> >>     perf_record_with_retry "${perfdata}" "check_cgroup" "perf test -w =
thloop" \
> >> -    -aB --synth=3Dcgroup --all-cgroups || ret=3D$?
> >> +    -aB --synth=3Dcgroup --all-cgroups -e cpu-clock || ret=3D$?
> >>     if [ $ret -eq 2 ]; then
> >>       echo "Cgroup sampling [Skipped not supported]"
> >>       return
> >> @@ -491,7 +491,7 @@ test_uid() {
> >>     echo "Uid sampling test"
> >>     local ret=3D0
> >>     perf_record_with_retry "${perfdata}" "check_uid" "perf test -w thl=
oop" \
> >> -    -aB --synth=3Dno --uid "$(id -u)" || ret=3D$?
> >> +    -aB --synth=3Dno --uid "$(id -u)" -e cpu-clock || ret=3D$?
> >>     if [ $ret -eq 2 ]; then
> >>       local logfile=3D"${PERF_RECORD_LOGS[${#PERF_RECORD_LOGS[@]}-1]}"
> >>       if grep -q -E "libbpf.*EPERM|Access to performance monitoring" "=
$logfile" || \
> >> diff --git a/tools/perf/tests/shell/record_lbr.sh b/tools/perf/tests/s=
hell/record_lbr.sh
> >> index 8d51afeb437b..6b6af59db871 100755
> >> --- a/tools/perf/tests/shell/record_lbr.sh
> >> +++ b/tools/perf/tests/shell/record_lbr.sh
> >> @@ -1,6 +1,6 @@
> >>   #!/bin/bash
> >>   # SPDX-License-Identifier: GPL-2.0
> >> -# perf record LBR tests
> >> +# perf record LBR tests (exclusive)
> >>
> >>   set -e
> >>
> >> diff --git a/tools/perf/tests/shell/record_sideband.sh b/tools/perf/te=
sts/shell/record_sideband.sh
> >> index 2182551873be..f16889e3fa9a 100755
> >> --- a/tools/perf/tests/shell/record_sideband.sh
> >> +++ b/tools/perf/tests/shell/record_sideband.sh
> >> @@ -22,7 +22,7 @@ trap trap_cleanup EXIT TERM INT
> >>
> >>   can_cpu_wide()
> >>   {
> >> -    if ! perf record -o ${perfdata} -BN --no-bpf-event -C $1 true > /=
dev/null 2>&1
> >> +    if ! perf record -o ${perfdata} -BN --no-bpf-event -e cpu-clock -=
C $1 true > /dev/null 2>&1
> >>       then
> >>           echo "record sideband test [Skipped cannot record cpu$1]"
> >>           err=3D2
> >> @@ -39,7 +39,7 @@ test_system_wide_tracking()
> >>       can_cpu_wide 1 || return 0
> >>
> >>       # Record on CPU 0 a task running on CPU 1
> >> -    perf record -BN --no-bpf-event -o ${perfdata} -C 0 -- taskset --c=
pu-list 1 true
> >> +    perf record -BN --no-bpf-event -e cpu-clock -o ${perfdata} -C 0 -=
- taskset --cpu-list 1 true
> >>
> >>       # Should get MMAP events from CPU 1
> >>       mmap_cnt=3D`perf script -i ${perfdata} --show-mmap-events -C 1 2=
>/dev/null | grep MMAP | wc -l`
> >>
> >> --
> >> 2.43.0
> >>
>
