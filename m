Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85A53C2BA4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791352700; cv=none; b=A78cDJ7IbMIRHZJYhnbxz8qVgIu27jfIQJ/nL5a2H3beDbvHGMSYudU5vBrPSZFMIV8zMA3UbsIQ3DwdNmSc1JwJdy17Snzi9nwuRuIqtytTMJogJnAhhfLPEMY68MOkTqJPa5jW8IAoRmn6KSOQt+BS4s8V7Q3SBm1qKJ73kS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791352700; c=relaxed/simple;
	bh=Gt7TERJi1K3SB9YhF4GeO9loSl23F5cbQ2rmS20vgow=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=jldG6MknR82OLhTjBOvncf/izh4qFjMyKR2HFNdBN0uej7nG7xD0eg333GurchtvH/q1RFCKjK3ar5WPdBqOQ3yuG61F9ZA8eBDCLBnOjwoOlVwXQ/UbtifWgVTi4SqlMKVZJZC78cQFMaAeZPPlW0G2SmdyBK8IkdK07Mu0PIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjYwni5k; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjYwni5k"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1175471f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791352697; x=1791957497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qlY3t16suadoXEY1qXDhukOrB9L0aD9CIyaQ8QOX98Y=;
        b=LjYwni5kxCW3lXa6obQNER8bQ66dBNcw+oFC+5fzCZds9vyYmbd89hLjuvLK16/Tlq
         FMguJlvaMyBejiuOfEOCGaZGetRmhL/nqigcQ/eukbp67SaNGV/ZbE3WeHjI82r5hL1T
         8fujOOzRJeUU6zOJurtW/tguxyaM21THHHMe9GrFRV4CT+wSswrjDQVoPX8rZDgzicEY
         tg04ATtrw0Ks3L9Y91GQ+PIzy36M8Sda99dY4GBY440D1V6k99srndANDnvaoN/tj3A5
         6mIHr4OZZ9uqpMUp5J1r19bv3Glph0h7qraS8bHj+mAM/NavYzgJFxagYL+djFtpZZno
         fFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352697; x=1791957497;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlY3t16suadoXEY1qXDhukOrB9L0aD9CIyaQ8QOX98Y=;
        b=UaQXLfocfEsp1pQhw7x1r7uhEdzx8VwCrih1nnwkVdHmISz69XHAX2gP4AC/H34cG/
         XTJVaMYcNuQDvEvQqh9B+O7Uli2HI2d3s1gj9lPZZw4uQCWWonDAEf9tyYc89EyBwWXn
         HOSw0oYZbVGWLaRvpYRJGwJ+dVi+IYbl6JviQ65UeaWsuJ/X5KqHtc+ZWaNXu5hNJEay
         Rya2Aq6w7EbT+8dBjOprrJDdPq3p4rBiVJOOoCuw0AjC/VJMfJFHdrL+gI41BQJAdsIU
         +fFsSxwbJKqxWsed9O5BUx6E8DbLCYaHyorDFOGKO7UkNHf6kIbmuYOKDG7DU7zjK4SM
         s6Pg==
X-Forwarded-Encrypted: i=1; AKwUvBxhrYfzz6zrwOT+P1BoXQ089T++cK4l8tpH4tC/LqGPVeNjj9lGJRs6Oa3atWU0hTlT6vDOC8UhTj+frxk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKydBsnE38bM7+Jp4XbcRLLXZCgyJtazwI/oDysPygvGMKS8M4L
	E+mvWdoO6R3EIYLf15hkwyh65lKj2bX5TRKP5PK4+gECtRM6YM+7Hxfo
X-Gm-Gg: AYBFou2nBuEnFjoyU8S7CSu6AJTCsONqBGUrEmoOyJd1RP32tcihI7+HL7KRgFhTeiP
	MlKHSoPbhrQKCUTLgC4WVw9ZlSbBYM8TVT83C0vY5NefYOeaJhtnr+LHjsmRdkjzcKlJ9udWcqw
	/p4ZTzh/BhrweOVkSGmQdzxGXtmBM4p/GMRxOiOxmOgxN7CGsLr8LGuU6goP0k4rtV59bhNC3ss
	jAWiS0SRw4t3++82PRoLTRZDOi/7x8P3iyeWUD9OzFsK1NnElmXvcqhdiiAY9HZZVEQ85q0j90p
	ktNVs66/xl1Gvo2KZSdV6hIulRXC2bG2qgF44nDEtQCRj8j6k8UMo7t44R0fzh9FYDzdlHoWuJ5
	O4PwrpO7fdh9IGy20oiEWVuzqCH9VF4LNTAl/5QAn9oyy37c1gMQe8gTeywHiQn4GJq74awcuA6
	Edj1zQqEyOCTZQG+eriaBa6zn8CBOhNJbpvwjQOCd5vELEZKkZaXGVQVZYEF7aFOdEKB64KkAnz
	jxB+ff82g==
X-Received: by 2002:a05:6000:46cc:b0:488:89ad:56b8 with SMTP id ffacd0b85a97d-48c72574ff3mr1486829f8f.0.1791352696964;
        Tue, 06 Oct 2026 22:58:16 -0700 (PDT)
Received: from ehlo.thunderbird.net ([193.86.28.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d10216sm3149921f8f.20.2026.10.06.22.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 22:58:15 -0700 (PDT)
Date: Wed, 07 Oct 2026 07:58:12 +0200
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: [PATCH 0/6 v1] perf test attr: Fix the re-enabled test
User-Agent: Thunderbird for Android
In-Reply-To: <asWQvXRdqp_RK85c@google.com>
References: <20261006161309.3078488-1-acme@kernel.org> <asWLmvF-3YtoKJ7j@google.com> <asWQvXRdqp_RK85c@google.com>
Message-ID: <EE4F4624-D728-4D59-A15D-70EEC29229DA@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 7, 2026 2:22:21 AM GMT+02:00, Namhyung Kim <namhyung@kernel=2Eo=
rg> wrote:
>On Tue, Oct 06, 2026 at 05:00:26PM -0700, Namhyung Kim wrote:
>> On Tue, Oct 06, 2026 at 06:13:03PM +0200, Arnaldo Carvalho de Melo wrot=
e:
>> > From: Arnaldo Carvalho de Melo <acme@redhat=2Ecom>
>> >=20
>> > Hello all,
>> >=20
>> > This series fixes the "Perf attribute expectations test" (perf test 8=
2,
>> > formerly "Setup struct perf_event_attr")=2E
>> >=20
>> > Patches 1-2 are Michael Petlan's prerequisite fixes that make the she=
ll
>> > wrapper propagate attr=2Epy's return value and correct the
>> > perf_event_attr size expectation after struct config4 was added=2E  T=
hey
>> > are included at the start of the series so that it applies cleanly on
>> > the current perf-tools-next (and for the review bots to verify the ne=
w
>> > patches); the new fixes are patches 3-6=2E
>> >=20
>> > With the test reporting failures again, several stale expectations
>> > surfaced and are addressed here:
>> >=20
>> > - test-record-graph-dwarf still expected PERF_SAMPLE_ADDR and
>> >   PERF_SAMPLE_DATA_SRC for --call-graph dwarf=2E  Those were dropped =
by
>> >   bdd051e249141c79 ("perf record: Split --data-mmap option"), which
>> >   decoupled data MMAP recording from the sample address bits=2E
>> >=20
>> > - The record and stat group tests expected cache-misses and
>> >   instructions to be the legacy PERF_TYPE_HARDWARE events, but since
>> >   b1c5efbfd92eb84d ("perf parse-events: Remove hard coded legacy
>> >   hardware and cache parsing") they resolve to the core PMU sysfs/JSO=
N
>> >   events, so request the legacy encodings explicitly with the
>> >   legacy-hardware-config term=2E
>> >=20
>> > - The perf stat default metrics open their events in groups and the
>> >   raw encodings of instructions, branch-misses, cpu-cycles and
>> >   stalled-cycles-frontend/backend differ between Intel and AMD, so
>> >   base-stat now accepts the standalone and group variants and
>> >   test-stat-default/detailed-{1,2,3} gained the per-vendor raw
>> >   encodings=2E
>> >=20
>> > - attr=2Epy no longer requires a recorded event to be in a group when
>> >   the matching expectation does not declare one, allowing the stat
>> >   tests to verify event attributes without encoding the metric
>> >   grouping=2E  Expectations that declare a group are still verified i=
n
>> >   both directions=2E
>> >=20
>> > The test passes with 'perf test -vv attribute' on x86_64=2E  The AMD
>> > encodings come from the amd_pmu_event_map tables in
>> > arch/x86/events/amd/core=2Ec=2E
>>=20
>> On my machine, the current tmp=2Eperf-tools-next which contains these
>> changes fails like this=2E
>>=20
>>   $ tools/perf/perf test -v 82
>>   ---- start ----
>>   test child forked, pid 931585
>>   /home/namhyung/project/linux/tools/perf/tests/shell/attr=2Esh: line 2=
0: python: command not found
>>   ---- end(-1) ----
>>    82: Perf attribute expectations test                                =
                 : FAILED!
>>  =20
>>   =3D=3D=3D Test Summary =3D=3D=3D
>>   Passed main tests : 0
>>   Passed subtests   : 0
>>   Skipped tests     : 0
>>   Failed tests      : 1
>>   List of failed tests:
>>      82: Perf attribute expectations test
>>=20
>> The below patch fixes the problem=2E
>
>Hmm=2E=2E even with the fix, it failed like this=2E


I'll address Sashiko's reviews and test this in more machines, Intel hybri=
d, AMD and arm64=2E

Will also incorporate your fix, thanks for testing it!=20

- Arnaldo=2E


>
>Thanks,
>Namhyung
>
>
>  $ tools/perf/perf test -v 82
>  ---- start ----
>  =2E=2E=2E
>  expected mmap=3D1, got 0
>  expected comm=3D1, got 0
>  expected freq=3D1, got 0
>  expected enable_on_exec=3D1, got 0
>  expected task=3D1, got 0
>  expected sample_id_all=3D1, got 0
>  expected branch_sample_type=3D16, got 0
>  FAILED '/home/namhyung/project/linux/tools/perf/tests/shell/attr/test-r=
ecord-branch-filter-any_call' - match failure
>  ---- end(-1) ----
>   82: Perf attribute expectations test                                  =
                                    : FAILED!
> =20
>  =3D=3D=3D Test Summary =3D=3D=3D
>  Passed main tests : 0
>  Passed subtests   : 0
>  Skipped tests     : 0
>  Failed tests      : 1
>  List of failed tests:
>     82: Perf attribute expectations test
>

- Arnaldo 
