Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722AE447805
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504718; cv=pass; b=r0PcjkA3TJwFlrWAPfHlj63kYUx6ruDuZ+AQ2kgZfmEMxHaOnfk1SzxP3fGOGRUhViDH9WYaEkqafD/5VsjkYA4JM5LE0Y2Dq1CqGa3/J3ZrBtCyG9Uqlh2epeCuHXlNVP2FtsA+9BOExAyIurvyAo/GedPbxVFWRO3UmzwzVYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504718; c=relaxed/simple;
	bh=q0uhT8XiQAbMWjxV732u9cL+aV/tNoUWOtyJHrk/A68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwS5Vs/Bx6sP1Ol+TLgaE0MBx+er3pgwHULYoOABFQhvdNpWf11YXaxkHqr2nxtVcR9rOWArbO8tEyfFg1G/aeUtUT7a/yXyvCWVa8rNWpDxjZ8E6/yc/N0pGjzKZ0APUVzjy+FcojRDhTW4U7vJ0XyEVobxvzxmQQhHRPC0354=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aIUdFJCZ; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aIUdFJCZ"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so17201cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789504715; cv=none;
        d=google.com; s=arc-20260327;
        b=UmP9Ynk7fxRa9tEpkb7iRHHxFGEN1HGF0IlxJOZ2AcYbhLSUiakevqjYiIR4/WjUJQ
         6eWwZ65FB7bNzHnejiQs6cZXzlS+J+rC6XG05Q8GgCo+i4LPGa1BqterPTcwoGInfAdg
         OjSPW+UO4VDuFFLHhrOKR2BAYjnVsL/PdNfxvcp8cEgaxloqbxlUS/QF9ePfyuOZEfEN
         d+Kx79fQIXX7ZDs+jSjNZlcDLHcCZwKKmXSf3HcqsRrrIM3b7xRgaR+Uw10QbSl1ygMz
         qn5fYrf8/ywP1OiXTN0X59jnAwSdOJRHbjfVhBbCcRiOXGScuHksIkpZ9jRL4pCp021D
         Upkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yi9YhsgJxg5RwheIV2uUP3vETgnxDCzaYZNW3S5FHwY=;
        fh=InZWKb1n+tIdbwLDIxA+c2jPfgfPC6sWzp2k3jBfzvU=;
        b=ovWsTkXzTfTsoXyjyKbqjFVnluK2sDfxAMvpW94itD03+w9sI0T5cj3cq0NuwAQfs4
         AA1S1nr3X0JcGMOLvnoc3Fbt/2rjp31EIFkLq5M24IvvqiBhb3Lgj+3TnfTu1udHGQPf
         brU8OBVLGgqhwrCK+aUP80YCNcxZihaz2fyKmbSAntuN9fxQviNrXd8oj9BMMaIV8hCd
         zfsceO8bU4hvs9xNf4aKlMiW1mxYKJP/a5O7PPLGUKqenLbKhwvLa8FQo1AC+JjD9ooB
         Xjy+dxE8LFCrzq+4MNceGipSUMC2EN5nmktP1pYMVrOYD1WG2uKwFb26XGDKR7LQKYzL
         PrlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789504715; x=1790109515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yi9YhsgJxg5RwheIV2uUP3vETgnxDCzaYZNW3S5FHwY=;
        b=aIUdFJCZHLXll/Q8tG6Ko9HzZqfspNX6GjUXKQ5LS8M3/+nHvcVYXbJxL3p47YG2jV
         u3Q4QtCSp/PZG1r3ltIqSWmhCch+cjxGSTwJfMUxOQJhX3aITdaJWPJe86GquUan8vbH
         IelokXPB6BSOH7FphVyKBO9dG+LOi9vn6oHr96La+XOXFxITKZPVQ8KfP6uWQzXcYK56
         obNvUo2BGbbb4KstDbdd3bOheDoloqh9ExxanDj9KwK4PZ0lqyeiQ3xP0NvoZ7ILYmDX
         9WdIpiARxWDiGp/V0ApU2lLUUNSrwd+vJwsLjphDyOskZzbBuPX/U5Pn1PT3MzpQyD7I
         RQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789504715; x=1790109515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi9YhsgJxg5RwheIV2uUP3vETgnxDCzaYZNW3S5FHwY=;
        b=t6eAwc/+3cIDnRttFXJPsLnWFE9VDNKWsXUQioeURdq7SW9Yq5wFudud8MeKKU05tR
         u0c9gdL3+q9KZAe96jrqXkuYfRJsRaYucqA02STXriqF8++PjBzCgDGqC20+EHbKQ1fK
         Gn7PBN7Jc9zNrd4yHMtHgsFI+xTYw3vbstwSPFsw8dUxIiZLoi1004QOAndDPArLnoRl
         vY2VQq+F37E94fH21dfjPb7h+GbNE1px1pQ8Qyisu73O7+nKxQeRnq54GdqvreDRldp5
         J1cWbr7p7n5WV7LC8+xx7c95y9/q4QpbQdXfOhep1PDuiWKDmqmUlJTPsTKrJrVFSJGB
         jjiw==
X-Forwarded-Encrypted: i=1; AKwUvBy4niT+YBSoRGeRwPvkvhKuePMFgmNlv3J4inlVJPV9emIq7sIFsDtcFVoLiOHPJ8ll0hrrX86mY4ZNLl8=@vger.kernel.org
X-Gm-Message-State: AFuF++mue3s2RCHJo/IIuhJNShFVSzK+xHmuJU/1SIGiOg+1Yzk71Lp3
	f/0maJEoV3wZdRwYNoQYc8F+4Mn9SnvbmYvKZR8wTGDaR6aObkB2agLP5SakP/itNZjG+LethMv
	etHpjun9H+i2j7t94+Ic4GXSu9s4SmyYE2f5qPTMW
X-Gm-Gg: AYBFou1/oBuBWh2RtB/aFV8V6hwMPU7u4FMwHwPh+YXNACdmpzlXTvqsV5rT7oVg8Gm
	Ts/w3tRuPavXa24atFqIiCLNwNL6+SsuvQs2J/iTbcXTcxd/K2Z50+La3PbJcaKMZOsu1tQY41s
	IFxg9MtTFt8xCQJ7pjvEnjKyVo0y+gCHaFS02WSdzbC4JwYBOdjq7fkLzjdCL9Ws6GuICvojTAv
	7PrHhZF9BmevZ2gHmd51wLV9LSSmVR7OO6tnOV0kFgI5cReCkLPUGUkD6zSDJVo0y6NDth6XueP
	WruL+E5MNSN4qeOtSeHIXzgsEGq4C9GjEqSRBnVXZv0nKyp0JCf6OIwHCSr7FuiKQ/h8j8zA616
	suGcWF4Owow==
X-Received: by 2002:a05:622a:260f:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-5325087c7f5mr3564871cf.12.1789504714348; Tue, 15 Sep 2026
 13:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178003738371.62097.10360938456907564684@gmail.com>
In-Reply-To: <178003738371.62097.10360938456907564684@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 13:38:22 -0700
X-Gm-Features: AcwNN1UXK9UtE6mV4KOXzn7kUifeCNY5PJcwT2rEeTndVdIHwQO0dV89bOJN7GA
Message-ID: <CAP-5=fUbwmmuRj6p94+M4k869nHPXuNBXyvtizvgdjVG46w8MQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] perf: fix six memory-safety vulnerabilities in sched/header/subcmd
To: Wang Haoran <haoranwangsec@gmail.com>
Cc: acme@kernel.org, peterz@infradead.org, mingo@redhat.com, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:52=E2=80=AFPM Wang Haoran <haoranwangsec@gmail.c=
om> wrote:
>
> >From 9e71ffe9400fd54c4fc958b16229e5628271e4ad Mon Sep 17 00:00:00 2001
> From: Wang Haoran <haoranwangsec@gmail.com>
> Date: Thu, 28 May 2026 15:21:08 +0800
> Subject: [PATCH 0/6] perf: fix six memory-safety vulnerabilities in sched=
/header/subcmd
>
> Hi, I found several vulnerabilities in perf module.
>
> This series fixes six memory-safety bugs found in perf version 7.0.6,
> in the perf sched stats subsystem and related infrastructure.  All six
> were confirmed via AddressSanitizer + LeakSanitizer with crafted
> perf.data files; the reproducer files are attached to the individual
> patch emails.

Hi Wang,

Thank you for the contribution! Since there have been similar fixes in
perf-tools-next, could you rebase and resend this series. This should
automatically trigger a Sashiko review, which is currently missing.

Thanks,
Ian

> Privilege note
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> "perf sched stats record" requires root to capture
> scheduler events from the kernel.  However, "perf sched stats report"
> processes a perf.data file from disk and requires NO special privileges.
> This means an unprivileged attacker can hand a crafted perf.data to any
> user who runs "perf sched stats report" -- the attack surface is fully
> reachable without administrator rights.
>
> Crash-to-fix mapping
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>   crash_err234_iter50.data  -> patch 1 (memory leaks in schedstat)
>   crash_sig6_iter840.data   -> patch 2 (heap overflow via bitmap_zalloc)
>   crash_sig7_iter210.data   -> patch 3 (SIGBUS via out-of-bounds mmap)
>   crash_sig11_iter2.data    -> patch 4 (array OOB in domain index)
>   (no poc)                  -> patch 5 (list_first_entry on empty list)
>   crash_err255_iter46.data  -> patch 6 (astrcat leak in parse_options)
>
> Vulnerability summary
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 1. Memory leaks in perf_sched__process_schedstat() / free_schedstat()
>    (tools/perf/builtin-sched.c)
>
>    Three distinct leak paths:
>    a) When zalloc() of the inner data pointer (cpu_data or domain_data)
>       fails, the outer struct is returned without freeing the parent.
>    b) In the after_workload_flag=3Dtrue branch the temporary struct and
>       its embedded data pointer are used then discarded without being
>       freed.
>    c) free_schedstat() frees each cpu/domain node but not the
>       cpu_data/domain_data pointers allocated inside each node.
>
>    ASAN/LSan reports 72-144 bytes leaked per crafted event processed.
>
> 2. Heap buffer overflow via u64->int truncation in do_read_bitmap()
>    (tools/perf/util/header.c)
>
>    bitmap_zalloc() takes an int but do_read_bitmap() passes a raw u64
>    read from the file.  If size > INT_MAX the int wraps to a small
>    value, a tiny buffer is allocated, and the subsequent loop that
>    reads BITS_TO_U64(size) u64 words from the file writes arbitrarily
>    far past the end of the allocation (heap buffer overflow).
>
> 3. SIGBUS from data.offset beyond file size
>    (tools/perf/util/header.c)
>
>    A crafted perf.data can set perf_file_header.data.offset to a value
>    larger than the actual file size.  mmap() succeeds because the
>    kernel accepts out-of-file offsets, but any access to the mapped
>    region triggers SIGBUS.  Confirmed with data.offset=3D0xff68=3D65384
>    against a 4760-byte file.
>
> 4. Array out-of-bounds write via unchecked domain index
>    (tools/perf/util/header.c)
>
>    process_cpu_domain_info() reads a domain index from the file and
>    uses it directly to index cd_map[cpu]->domains[], an array of
>    max_sched_domains entries.  A domain value >=3D max_sched_domains
>    causes an out-of-bounds write into adjacent heap memory.
>
> 5. list_first_entry() misuse on potentially-empty lists
>    (tools/perf/builtin-sched.c)
>
>    get_all_cpu_stats() and show_schedstat_data() call
>    list_first_entry() which, unlike list_first_entry_or_null(),
>    never returns NULL -- it computes container_of() on the list head
>    itself when the list is empty, producing a garbage pointer.  The
>    NULL checks that follow are therefore dead code.  A crafted
>    perf.data that causes an empty list makes these functions dereference
>    the garbage pointer.  Replaced with list_first_entry_or_null() plus
>    proper NULL guards.
>
> 6. Memory leak in parse_options_subcommand()
>    (tools/lib/subcmd/parse-options.c)
>
>    When subcommands are present and no usage string has been supplied,
>    parse_options_subcommand() builds a usage string with astrcat() and
>    stores the pointer in usagestr[0].  The pointer is never freed,
>    causing a 73-byte leak on every invocation.
>
> Testing
> =3D=3D=3D=3D=3D=3D=3D
>
> Affected version: perf 7.0.6
>
> Each patch was verified with:
>
>   $ make -C tools/perf EXTRA_CFLAGS=3D"-fsanitize=3Daddress,leak \
>       -fno-omit-frame-pointer -Wno-error=3Dstringop-truncation" \
>       -j$(nproc)
>
>   $ ./perf sched stats report -i <crash-file>
>
> Before the patch the corresponding crash file produced the ASAN/LSan
> report listed above.  After the patch the same file is either rejected
> cleanly (patches 2-4) or processed without any error report (patches
> 1, 5, 6).
>
> The reproducer files (crash_*.data) are attached to the individual
> patch emails; each is a minimal crafted perf.data (~4 KB) that
> isolates exactly one bug.
>
> Wang Haoran (6):
>   perf/sched: fix memory leaks in schedstat processing
>   perf/header: validate bitmap size before allocation in do_read_bitmap
>   perf/header: reject data offset beyond file size
>   perf/header: add bounds check for domain index in process_cpu_domain_in=
fo
>   perf/sched: replace list_first_entry with list_first_entry_or_null
>   subcmd: fix memory leak in parse_options_subcommand
>
>  tools/lib/subcmd/parse-options.c |  3 ++-
>  tools/perf/builtin-sched.c       | 32 +++++++++++++++++++++++++-------
>  tools/perf/util/header.c         | 17 +++++++++++++++++
>  3 files changed, 44 insertions(+), 8 deletions(-)
>
> --
> 2.53.0
>
