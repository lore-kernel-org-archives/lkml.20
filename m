Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794246483;
	b=Rm7sTvYgjkBn9Pm+tqtMkVGHiypb02sy3SqLokJ1ugfgzn9quHuhe/PX9lYAdiwOg3W8
	 zWl+/e+MtwZ6LdpYHJxjhyQoPjK46uZ6qyPBVKsiNNb9Y3JSF4pbPXYCGsKOccPUf5uf0
	 wJPvA404HN4Eo3EpvZrmk6i8ZwSUg0Ev6yaDKsP0P+FnPi727U779UjSTQ3bNBNWSFkDD
	 7BSVYEpPGkoB3+z6MTC+2x7roPIWWNBpWHrguEL0jNXryhOaaY6VR70ux/YR46eksofRU
	 8JZf5rfprDpXJl4mBxhGWxWcx0lBKldY9ODXFf5pVB3sySSiVNNgYJuxLfB7y1yffLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RHWJdH5skqZXvBWkiRsFGkN+eeAfmyFX8crg4i6q9fE=;
	b=N53sUw3EydoimoiKVCMHeJOV0pl138J/uugunws6XYRgZRusJ4126/bB8dME2clv1WRt
	 FSFKpC3at1tlMAZ3wL7ovCUsYHIxR8nw7qIyQnQiKcYZVieBeVjDTSMgTz2SU0qVAuk3q
	 st8e54I7vhIztbhW+rpPQYAChsPSQOYgRIVrOxAIVm+gvyJPKI9GwCRl6f343WFZ69nl/
	 1KbThpQxnhyXecc+Qcms9yg4KY2qW2oNDAemNCsJR3nGUt9WLXjLfloDCpbEV07KVBjLQ
	 Fw7ibKJ15vr2dwvP5h64F8RdDnsJ+8O5odY/zDfnB+UQ7wdinxZBQVl5UcyfxQ40zSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PlQzsroE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEB0606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CEB0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PlQzsroE
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-535f598d126so330051cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:48:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794246482; cv=none;
        d=google.com; s=arc-20260327;
        b=Mj60XyCOM5tZ5hrKsqSWbc3XDJ4zOnELkdqNPwo4V6b8I0EVWNXimm4b1FLh8EJgt1
         /NzUCogFcBF3Ig8uiJGfDXOUh/qkgAD4tQVDblO0NsbZEeY6BH+nLnrsqQ05XavH9qPG
         MqNwgjtxETrqaGx55VmHXqoAfdTkfmSLTRRCW1CZ26fJ7c9PZAmDW/Y9jD1GZIeg/89U
         5aiAB6nlcFARR7YRxAnaY4LEIiW1CXBdchrJRa1NFNXPiVjqlJcv4jo0F4cTTBOjv3TK
         D0ybY8X2bvQQmvSJISgxC4oXxpha6Ulmc9pLioic6F73jKrxOHSO9agyeyGNoOgtONr6
         KoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RHWJdH5skqZXvBWkiRsFGkN+eeAfmyFX8crg4i6q9fE=;
        fh=4PTXBFO/NlkLO2N5jgweEyTGZOaz0X8afgqCw5xSIMU=;
        b=dWh2MO+LtFYr4WoWzGrId5bodXVCs0bODs+9LyMiz9FJqM1DlEsfG/1W2PdbKwNerJ
         KrJQ7pcVzVV207fiDCT1lqbcQ2Zoi1H4hEeHo0hB+lyP8taSDiToerfR8+wylUXni8+D
         x8KdUu2SxEGnvNhtFIIIaXMTfpqzdyZBu/bQ9alWYTQtW+r4vrjitcfQmd1NAZuSgK2o
         CvRtcDllNryCX0GwPPdH4gn0Nkoanqe5RwOtulMnGpzu4vilZT/0j+wnO7fqRCJ0SFSa
         fHZa6t8RclHAWIr5e3ZvMvug/qkIQETsiABwp/hqLsBthA6eiyoX8vd7UoM+NpA3bAAf
         n60A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794246482; x=1794851282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHWJdH5skqZXvBWkiRsFGkN+eeAfmyFX8crg4i6q9fE=;
        b=PlQzsroEegMmRszghWrxWlR3+QriErwbvpJl+2oZLn31vLGOLbPs5zPKCk9NYunO9Z
         ZzajMoI2p4AhFYPnuQS5QJVyjcbpJGsatZg6H4wpzQW73ChBpyisgHcE3jhJEsSG9cK+
         fYBDZOl1IFev17IL99RP9TK8tWLrM4+rdO8nzshwFrzEf/hYrLw+tj2Ss6yYHJVIb7sZ
         3stB1SI8YVD1ovOSnsD6HoKXE+P/6Jgixvkm6v58qFpP6BI6jaaDM0cLlSh8BRnYxJNd
         8pbzw1QzfOrX3cL8tOR0KTvQ4pRpQhHzAdUA6RC8l2zfyZg90i7aDyxLlTS7SO92RgfE
         Ev/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246482; x=1794851282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHWJdH5skqZXvBWkiRsFGkN+eeAfmyFX8crg4i6q9fE=;
        b=XzJzOZQ2tWJ2XYfgC4bTGZhGjacB2A3lIhwdEcBmUjo3sFz5pZoW1XorYhYyP/PKeV
         +tZxo2N5StvhqKNlsrpAkth5P0/zOhW/f+6qUIgqR+KgdtOqCzdtIaP5qXHqZn+bjSwO
         s+R7ilvbqw0vs8VUz5wu9QVSPbkUPBFfKlVOSNz5NQ0dpn9Frq1fQt+ZTPssKhiMkibO
         MIHeMw1XpoThPiE4JOizUYnJM1+4gWjNDuX/glL8QbOOzccacxGsbQdz2UQb5XPLaOqk
         ze3PpxHzXXGgf9LcyczM4sH1xjUXaywF3Ww/P2IrPI7TRhkYhcXjIK1s8qFMPHPMIwVB
         gHcw==
X-Forwarded-Encrypted: i=1; AL+hErFrqwrt+pRtexU+MT1BXK6Lv3VnRNmG29lXswQaVIDBxhf+mG+Tk3RY8yYdkVu/BgFtH/gkFl3fXHegGOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cGRPIyxF4fa90EIEJ6La0EJZup/SCP+k56Ky8WDQkzFR2nXNI
	Ge94vNp06KQ2vpVdXicAKdv5fjMt3PunrrC2ujkVI+Oy3BvyAw3vWT1Aod8LQFoaJN1VG2tfBno
	fdSD7p7A5H0ihB2guIRYuMr2jqolz7v9FNjc1KaA5
X-Gm-Gg: AYBFou1+BIOOOzVzf6UnHm3b2ffbAbgMKbWqdyz9K2zD4Uls6LYIkik9dYMyQIVdQBe
	jssE00VhIwLcy9S2pImYE3PcRCiGDbtu3F+E5/wI/L4rjR64RO9QR+YMFlgQRXhzJy164Mc/aBB
	ZHXDdubScrpK/ZXT5//6pLjqYCt0vsAJulJuM3/hvS1NTn09A6r07OCcdXtbiWSNHjkAigcQAtw
	F/1bZsjRSoYVlUF7ZQ1fBKhNmX9coRN/aw9GVH9Jn3guZ1n8JYGwmSS4eP8f6NgYvV6ZyZ6AjxK
	720GF6sXyaFbwImgcpZKGPa8ABszUWziWCddnNuB5hv/JPlbbLlYr9n1aTHbwWSWbLMuofp2SA1
	ob8uyDgD0WAA/8h3ylpsCFgMqR1MaRpolQB+Te9R6o+ugFSU0tNcpGXeFFXfTdiRPt64=
X-Received: by 2002:a05:622a:a05:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-55517715f34mr1531781cf.3.1794246480432; Mon, 09 Nov 2026
 09:48:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-james-perf-test-fixes-v4-0-355ee6b81917@linaro.org> <20261109-james-perf-test-fixes-v4-4-355ee6b81917@linaro.org>
In-Reply-To: <20261109-james-perf-test-fixes-v4-4-355ee6b81917@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 09:47:49 -0800
X-Gm-Features: AclHuK8Qp2Cv9kN48IExBwB2gdj912t_RB5Gh3vuokUoac-1DxjpaOwzjPM0dOs
Message-ID: <CAP-5=fX-AuoMOL+yPXw2FsdcC5Xg7qkb-Q038U3BeB+P+Rf_Yg@mail.gmail.com>
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

On Mon, Nov 9, 2026 at 5:48=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
> Some tests intermittently fail when run in parallel, for example "Check
> branch stack sampling" fails with no branches recorded at all.
>
> The default event is cycles:P which there may only be 1 or 2 HW counters
> for on Intel because it's precise. System wide or per-core precise
> events hog the HW counter leaving other per-process tests with no
> samples. Rather than make all the tests that use default record commands
> run serially, just make the system wide ones use a software event which
> has the greatest possible compatibility. They don't need precise
> sampling or HW counters anyway. The per-process tests can be left alone
> as their events/processes never run concurrently on any one core.
>
> The LBR filter is another resource shared by all events on a CPU, and
> the system-wide LBR test uses different filters to the per-process
> branch stack test, so mark the LBR test as exclusive.

Thanks for deflaking the tests! Making the LBR test exclusive is
pragmatic; however, it also feels like a shame since recording LBR
data in parallel should be something we expect users to do.

For PMUs that can have a single user we have logic which prints
conflicting users in dump_perf_event_processes:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/evsel.c?h=3Dperf-tools-next#n4519

I wonder if, when we get zero counts or no samples we could perform a
similar analysis and report conflicting users=E2=80=94though this would
inherently be racy. If we had that, maybe we could just repeat the LBR
tests until there are no conflicting users and not need the exclusive
tag.

Anyway, doing all of that is a bigger project.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> This fixes the "Check branch stack sampling" test and other flakes when
> a system-wide record from another test runs at the same time, for
> example:
>
>   $ sudo perf record -a -o /dev/null -- sleep 30 &
>   $ sudo perf test -vvv "Check branch stack sampling"
>   ...
>   Testing user branch stack sampling
>   ERROR: Branches missing ^brstack_bench\+[^ ]*/brstack_foo\+[^ ]*/IND_CA=
LL/.*$
>   ...
>   Testing user branch stack sampling [Failed]
>   ...
>   Testing branch stack filtering permutation (call,CALL|SYSCALL)
>   Testing branch stack filtering [Failed empty script output]
>   ...
>   ---- end(-1) ----
>   138: Check branch stack sampling : FAILED!
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/tests/shell/record.sh          | 6 +++---
>  tools/perf/tests/shell/record_lbr.sh      | 2 +-
>  tools/perf/tests/shell/record_sideband.sh | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/re=
cord.sh
> index 01dc3e22fa73..e4789e2bcf43 100755
> --- a/tools/perf/tests/shell/record.sh
> +++ b/tools/perf/tests/shell/record.sh
> @@ -388,7 +388,7 @@ test_system_wide() {
>    echo "Basic --system-wide mode test"
>    local ret=3D0
>    perf_record_with_retry "${perfdata}" "check_system_wide" "perf test -w=
 thloop" \
> -    -aB --synth=3Dno || ret=3D$?
> +    -aB --synth=3Dno -e cpu-clock || ret=3D$?
>    if [ $ret -eq 2 ]; then
>      echo "System-wide record [Skipped not supported]"
>      return
> @@ -471,7 +471,7 @@ test_cgroup() {
>    echo "Cgroup sampling test"
>    local ret=3D0
>    perf_record_with_retry "${perfdata}" "check_cgroup" "perf test -w thlo=
op" \
> -    -aB --synth=3Dcgroup --all-cgroups || ret=3D$?
> +    -aB --synth=3Dcgroup --all-cgroups -e cpu-clock || ret=3D$?
>    if [ $ret -eq 2 ]; then
>      echo "Cgroup sampling [Skipped not supported]"
>      return
> @@ -491,7 +491,7 @@ test_uid() {
>    echo "Uid sampling test"
>    local ret=3D0
>    perf_record_with_retry "${perfdata}" "check_uid" "perf test -w thloop"=
 \
> -    -aB --synth=3Dno --uid "$(id -u)" || ret=3D$?
> +    -aB --synth=3Dno --uid "$(id -u)" -e cpu-clock || ret=3D$?
>    if [ $ret -eq 2 ]; then
>      local logfile=3D"${PERF_RECORD_LOGS[${#PERF_RECORD_LOGS[@]}-1]}"
>      if grep -q -E "libbpf.*EPERM|Access to performance monitoring" "$log=
file" || \
> diff --git a/tools/perf/tests/shell/record_lbr.sh b/tools/perf/tests/shel=
l/record_lbr.sh
> index 8d51afeb437b..6b6af59db871 100755
> --- a/tools/perf/tests/shell/record_lbr.sh
> +++ b/tools/perf/tests/shell/record_lbr.sh
> @@ -1,6 +1,6 @@
>  #!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
> -# perf record LBR tests
> +# perf record LBR tests (exclusive)
>
>  set -e
>
> diff --git a/tools/perf/tests/shell/record_sideband.sh b/tools/perf/tests=
/shell/record_sideband.sh
> index 2182551873be..f16889e3fa9a 100755
> --- a/tools/perf/tests/shell/record_sideband.sh
> +++ b/tools/perf/tests/shell/record_sideband.sh
> @@ -22,7 +22,7 @@ trap trap_cleanup EXIT TERM INT
>
>  can_cpu_wide()
>  {
> -    if ! perf record -o ${perfdata} -BN --no-bpf-event -C $1 true > /dev=
/null 2>&1
> +    if ! perf record -o ${perfdata} -BN --no-bpf-event -e cpu-clock -C $=
1 true > /dev/null 2>&1
>      then
>          echo "record sideband test [Skipped cannot record cpu$1]"
>          err=3D2
> @@ -39,7 +39,7 @@ test_system_wide_tracking()
>      can_cpu_wide 1 || return 0
>
>      # Record on CPU 0 a task running on CPU 1
> -    perf record -BN --no-bpf-event -o ${perfdata} -C 0 -- taskset --cpu-=
list 1 true
> +    perf record -BN --no-bpf-event -e cpu-clock -o ${perfdata} -C 0 -- t=
askset --cpu-list 1 true
>
>      # Should get MMAP events from CPU 1
>      mmap_cnt=3D`perf script -i ${perfdata} --show-mmap-events -C 1 2>/de=
v/null | grep MMAP | wc -l`
>
> --
> 2.43.0
>
