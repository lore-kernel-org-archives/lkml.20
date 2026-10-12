Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6054827FB1C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791845461; cv=none; b=ucMImi6aXgiJ5NY4MOX2Eh4vXhrvMKt59ddB6LgfESFTSmQM76DQpHne6IASRDKXlEs8suPgmfgOm4lUZCIlu3fuSljgJEs6rMX4ZuvulGwAruvgYbSWJTKsX92na2J7zNmjOqkHiYmlGYCvuppplP3pNQ6zhEgM8chMj6RYDo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791845461; c=relaxed/simple;
	bh=NfwA6HwOKrESGHGLedUFXahLqGNv4PDozp7tZqXsua0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=UM17AYuMUOMbv6cWkG4S6ijl8k4zkeUa1KJFuaY5670sQFQIm+KxK2AbvgPTEs8hFw+6EYijTLxv3o3SsALXX5FgBHaqZL0G4QdETEuaqbJaoNGjHf6b3CjTJw9JiquBKQKmmNez8xVsen5Sx9gv/N9OH8xiaP0c6bUzJTWCMrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQYB0Gip; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQYB0Gip"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1196953eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791845459; x=1792450259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kS8ICr9lk4y6biHhtlX3SM1igmzmxcCufNZlzrQ83NM=;
        b=nQYB0Gipl9UbyhW4fhPwdGIEheNWxUSuxiYfYAi7G1P9YjQStKKnUKUzwnOD8erRxl
         ao7vsR9t6nJvqyQBJElkTEFq1pdEdu37KZF4hqhU5BQYaTdkGobE8yZJUcNkE1B9k/eV
         crfDg+2h/Opu9hCn3w630wk6rfIIlyxrzcbo/GrFEgWEf2jSkksKd7kO8mb9w0u15lL4
         uqHQGLGpABp2qTqPO5wsr8VNZZ89KJoZ6LSgzAEpeGHWArt55J8lypixO/FDlzcDH3dv
         kI5rBfrxnzyB/3Qey8W/07tu5K9Rnkb0cohelLWDiA4T4kVGNE9AEx0eNwjNrlCN/xNs
         Qqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791845459; x=1792450259;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kS8ICr9lk4y6biHhtlX3SM1igmzmxcCufNZlzrQ83NM=;
        b=DK7j5BJeDXBfMSasORZd6yDpeZPfKzdPpYPNEqVh4Hun9NLOIUq8O3tXhTjrCHbsyE
         XVrl/avpPr/AXHC+B8aeML2HHRQmZkcMIMk3GK+vvQ59yn9GO7KDZMO2tVxT8gcrggKY
         EIgy+jwatDPJWb7g0tuQGI317pmoHLvan00l+QQH7fHEkV/8jUoA75pPLLFzFP/gjaYo
         QcSt6FHhmRN854NyoeDYXno4peP295bFEuVLRz6lAR7DnQmub66FMTy1ok5cUVVNH4ZG
         fof5YlShwCS0JsUYBmCqWUWyXkQwvDrybQVTvFPZ3Vibo8+4P58ZK23kxXDr7E24zksi
         kHeA==
X-Forwarded-Encrypted: i=1; AKwUvBzwA8ykq2iwtzkvHJ8doPEwhPXAuuY5MhDMRtIsfyt4PQ4JDTbAjGrzW3MXo+VMg1nHVApScKi66iu0zNA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeMk2MDkK2+EFFWzNlNXTzTs3KF6SK9Y9fmSvjecZUa+KjTCKA
	HoGJQSZshAAEAawwDDhx1QTZieZhOYQLg8sIe9ZXPO/Qinn4oEkk5rZ2ogL8CfgV
X-Gm-Gg: AYBFou36NLRKW/iifhIyu+LG6X68KvMZVESbYCvkV6+Pri9tZ5OzB4l/xEoiEp8bsvz
	/q07j/AqohzFYHQMty5npJAg7DWSoMc6WxxQ6HnoYqkgYIUAve0UadXMOAnafS3G6oaRbNz/1wu
	tYc8VKE1HApAXBjRt35cr1uRLZTD9Tu/zqS/xZXHQXXtTwuDoA+0mdkxMhZy3DZSkdZgauJw7qz
	wllIIToRNMABeCntRppHDhzVk8BzemZrzqevaZ8kC5ABEGRn5CoZI5kZbaTAJpdaUfIRNoKEFIL
	dcFdlbfCZ4KJFpHn8bx3VDjBso19HiV5Hg9EAkyVYeLNMnnA01ZxLiVgYj66QQfKT7mefd+ByM4
	A99VQnoeBWfgN+e0KFwb3aFtt934F9uwCwzvqX4SRV/WkO2bd7G/3qOPIG5yZEE9W171aa1gzQM
	TjyNx7OD/Pb7S4Iv7K0eLDyTJaiXvUCxrZrJQL0uAXNpCMdVUqslHN2exKPQ0DNweW8PkUrMXDD
	GUTXX31VZrktA==
X-Received: by 2002:a05:693c:20cb:20b0:351:6f51:e019 with SMTP id 5a478bee46e88-3537e0a265bmr15424101eec.23.1791845459167;
        Mon, 12 Oct 2026 15:50:59 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:66d:701a:cb5d:9767])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm38020891eec.25.2026.10.12.15.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 15:50:58 -0700 (PDT)
Date: Mon, 12 Oct 2026 19:50:51 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Ian Rogers <irogers@google.com>
CC: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: [PATCH 0/6 v1] perf test attr: Fix the re-enabled test
User-Agent: Thunderbird for Android
In-Reply-To: <CAP-5=fURC_-ez2eNXjcT378ttO7iKMHhjrexxekqDEDU-suRpQ@mail.gmail.com>
References: <20261006161309.3078488-1-acme@kernel.org> <asWLmvF-3YtoKJ7j@google.com> <asYDREqTrh9ZDUhm@localhost> <CAP-5=fURC_-ez2eNXjcT378ttO7iKMHhjrexxekqDEDU-suRpQ@mail.gmail.com>
Message-ID: <EFC68523-B6E1-4CC6-9B96-93AB16E8D627@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 12, 2026 7:40:07 PM GMT-03:00, Ian Rogers <irogers@google=2Ecom=
> wrote:
>On Wed, Oct 7, 2026 at 1:31=E2=80=AFAM Arnaldo Carvalho de Melo
><arnaldo=2Emelo@gmail=2Ecom> wrote:
>>
>> On Tue, Oct 06, 2026 at 05:00:26PM -0700, Namhyung Kim wrote:
>> > On Tue, Oct 06, 2026 at 06:13:03PM +0200, Arnaldo Carvalho de Melo wr=
ote:
>> > > From: Arnaldo Carvalho de Melo <acme@redhat=2Ecom>
>>  > The test passes with 'perf test -vv attribute' on x86_64=2E  The AMD
>> > > encodings come from the amd_pmu_event_map tables in
>> > > arch/x86/events/amd/core=2Ec=2E
>> >
>> > On my machine, the current tmp=2Eperf-tools-next which contains these
>> > changes fails like this=2E
>> >
>> >   $ tools/perf/perf test -v 82
>> >   ---- start ----
>> >   test child forked, pid 931585
>> >   /home/namhyung/project/linux/tools/perf/tests/shell/attr=2Esh: line=
 20: python: command not found
>> >   ---- end(-1) ----
>> >    82: Perf attribute expectations test                              =
                   : FAILED!
>> >
>> >   =3D=3D=3D Test Summary =3D=3D=3D
>> >   Passed main tests : 0
>> >   Passed subtests   : 0
>> >   Skipped tests     : 0
>> >   Failed tests      : 1
>> >   List of failed tests:
>> >      82: Perf attribute expectations test
>> >
>> > The below patch fixes the problem=2E
>>
>> still without your patch:
>>
>> root@number:~# perf test attribute
>>  82: Perf attribute expectations t: Ok
>>
>>  =3D=3D=3D Test Summary =3D=3D=3D
>>  Passed main tests : 1
>>  Passed subtests   : 0
>>  Skipped tests     : 0
>>  Failed tests      : 0
>>  root@number:~# grep "model name" -m1 /proc/cpuinfo
>>  model name      : AMD Ryzen 9 9950X3D 16-Core Processor
>>  root@number:~# uname -a
>>  Linux number 7=2E2=2E7-200=2Efc44=2Ex86_64 #1 SMP PREEMPT_DYNAMIC Mon =
Sep 21
>>  18:25:57 UTC 2026 x86_64 GNU/Linux
>>  root@number:~#
>>
>>  I reproduced the build failure in an ARM64 Debian Trixie machine,
>>  applying your patch to try again=2E
>
>For the change to use PYTHON:
>Reviewed-by: Ian Rogers <irogers@google=2Ecom>
>I think we can fix the attribute test expectations separately=2E


I fixed then already, will submit tomorrow morning:=20

=E2=AC=A2 [acme@toolbx perf-tools-next]$ git log --oneline -22            =
        =20
 b8d6660fb3333fe9 (HEAD -> perf/alta-test-evsel-fix-and-mlock) perf tests:=
 Mark the shell tests not mapping perf ring buffers                        =
  =20
745ef567f0fe5705 perf tests: Mark the C tests mapping perf ring buffers
ebb8034d6627621f perf test: Take turns using the perf mlock budget in the =
mmaping tests                                                              =
   433379c85c0affc5 perf mutex: Add a robust, process-shared mutex initiali=
zer=20
52277c8f4bc4a5f8 perf tests: Introduce a 'needs_mlock' suite flag
7be6c60f58acca20 perf test attr: State, spelled out in a line, why a test =
is skipped
2a6b500277a921d1 perf test attr: Ignore the group read_format bit the PMU =
count can remove                                                           =
   392722445f2b0a15 perf test attr: Ignore the dummy tracking event and the=
 terms it carries                                                          =
     b4631e5b762de4a8 perf test attr: Accept either sample id bit perf asks=
 for =20
b2a70402b56b34e5 perf test attr: Introduce mask_bits(), generalizing hide_=
core_pmu_type()                                                            =
   f6711283e99de095 perf evsel: Don't dump probe events to PERF_TEST_ATTR
13b60625f92619aa perf test attr: Ignore the core PMU type perf puts in 'co=
nfig'                                                                      =
   394bfd10f1923f0d perf evsel: Mark the event as supported when retrying a=
n open
50a76fcdb7321c57 perf test attr: Relax group checking for ungrouped expect=
ations
0887d3cc78ca9b69 perf test attr: Fix default stat metrics expectations    =
  048fe0dc4cc566f0 perf test attr: Fix legacy event encodings in group test=
s
f1f3c53b46c5da4e perf test attr: Allow tests to require a core PMU        =
 =20
75929770e7f9a907 perf test attr: Fix record dwarf sample_type expectation =
 =20
d4c243e294dee22c perf test attr: Fix wrong size expectation for events    =
=20
16e6b715c7ab376b perf test attr: Propagate the return value from the test =
to the wrapper                                                             =
   74128ffa6d71a0ef perf test attr: Source setup_python=2Esh instead of cal=
ling python                                                                =
       1dc462fc21490767 (perf-tools-next=2Ekorg/perf-tools-next, five/perf-=
tools-next, acme/perf-tools-next) perf test: Add a test for perf timechart =
--tui     =20
=E2=AC=A2 [acme@toolbx perf-tools-next]$

- Arnaldo 
