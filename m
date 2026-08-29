Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AE7423786
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 23:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788045589; cv=none; b=aUmaC5iSLZrI692EDkIUz0kPdbWwWypXV2fFPahDcF9aaNHxsdY6BnXOLxUnB3gfwzReOu/745BFz3fkH97HTzfdJdrOlGqv/TEi6B0ozkWA2LchqyR0DSxaq+75vhgZpUeGNfvKjrpW7xVpBVdi34jPCvuETOLDl44NaTR9Opg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788045589; c=relaxed/simple;
	bh=HbRzCv2+ARyfp2EH+BYFZfejBzqsMJfXVp3HUTqJ+zo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sxQtY1DHdqc6IkDdSyLkx6Tttja4eYUwAFc9h2gBZcmEPsRTrFJv5biaCVcOb2dngD6TZlk6m6/Rh9svIzl9Cq9aARg1mgppdUfPpmGj9rxW0370MTxV7OPKAGGPoYKN4UmvK3nY/sU3KyHl1FePJSBvl0jw9phlsldtMsConGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dK6wz9g7; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dK6wz9g7"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so1538625e0c.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788045587; x=1788650387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oyw98bpqsSyW8pfih3hJiVzxbTLln6IkqHBizB2Rt1k=;
        b=dK6wz9g75P4QPLza+eV8LSmNLh703/L3pVTko9v3p4cHkcF095tQauXqBR3gTq46BQ
         37RHox6zWzwKaDR8uAlpz5yll6GNBojOpAsM7xew0yTovo1+rcF5TdY9DmtLJ/3WUAAO
         03TjEEo7ZndZSCBFTJJR2LnJmbXEcWuQZh1cHrA453pYIBYCXB4bvYvwe9BkjA5uj3Jb
         KKmAaAeQEuCzi5YmyOp9y+1zr83AMA5PkWm9SkWNzE3WId9Y3KzoG+43XJPUEjACIowL
         P8ZuupjtqhijD1l5KPmFwiyrajosjEKcHduYk/FbtCT6VYY522452NC6Dl3cBXI33aDM
         beHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788045587; x=1788650387;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oyw98bpqsSyW8pfih3hJiVzxbTLln6IkqHBizB2Rt1k=;
        b=S5b12Bg672aFhEgcMMIbzAZ/GkE81zGOaVIxQKb3aQGQCmZ+0OvACEYq3AtDpbKY5k
         r2w7TcNlPYZEwgNmSFozaakzpulwxJv2sLf256id1lyP+s6FYBKcO5oNSA7LDxnrXYer
         KO5xFPmrT6n3nQsMnncyx7TKzvyedxUSDHe+tKRBlltepoDn21rVMu6aVTS20jGm6RuV
         +/TCDltCYdPIoTh5MLAK9Y2WYJRcd615ncZhzCUJ8Z8VQRG5cLzBN1pX+c1Qsl+vouNq
         DbxBI9VhbhovI8i/nl6PqjDyvlvhdGE0lpn8PdflN6TbNuhrmbHdShqN+kyu9k8VvPqP
         ATHQ==
X-Forwarded-Encrypted: i=1; AHgh+RoD0MbOc4LBtKcvYuILcCpnKFUQyxuX6t/RhXPXdDvtL7m2kkGQOaWDfzXCeID9GfS9p/XN3WyVY+nCb60=@vger.kernel.org
X-Gm-Message-State: AFuF++nKvai3rvRE/VIrkQI1SjX9/yFjqWDXK1s3oP3DrgbFxq2exKam
	ho4H4i2o87It3TlCIxm9ZjpLksbXVoLHXKuUdvgxI+lWu8113KzQPxfW
X-Gm-Gg: AR+sD11am5GhgPYWHRmQIVQvFXV4HZqoSv6Dm7FBqBk9mlDBoQGwmHCA6iEZfEgz1WA
	snQa9RoA1pUrJ08OOewe6ZFByN/mhR7dAclvA+8tGW4vCM83gHJoysD3nxnCdi5RK9KITfVKy1g
	oT5gBaY//djA2hziKkubWeJ7XXjX02bVWWiGHPowEanH5KPvQCdkzZZSXo5f7g5BoIE1KzXU8lU
	cUZx68Xy1QneLl4Tko6nP60qJEVGco6oIZXk8EkOaGp9F6ZNM7tqKvPgxM5Gdfy6CXHpNSGgmBo
	8iJg3ttyRhrosKgo7c1cwT1gPeC/r0Ji4wN0gkRgcPuzglCdfc9wkqhYlWob3xObLcNi0T0eYxm
	ukkZ0u/qjQafoK/im58TYSxJW74PDK88jqKAMUjcFEG16yN9DJ8xqd0i6h6+HHErg36a7AP4lQD
	8BFhRcTZtq3uyzGvIsZmtpjazwueMM7n5OePqv+RmeGohYSe9hSU1V0jKpnrt40zxE41twOu/4M
	rA=
X-Received: by 2002:a05:6122:6848:10b0:5c6:6da6:7ce with SMTP id 71dfb90a1353d-5c681407236mr6110025e0c.3.1788045587048;
        Sat, 29 Aug 2026 16:19:47 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:9594:e2f4:cf97:54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c72425c2besm4787609e0c.13.2026.08.29.16.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 16:19:45 -0700 (PDT)
Date: Sat, 29 Aug 2026 19:51:19 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Namhyung Kim <namhyung@kernel.org>, Jiebin Sun <jiebin.sun@intel.com>
CC: acme@kernel.org, mingo@redhat.com, peterz@infradead.org,
 adrian.hunter@intel.com, alexander.shishkin@linux.intel.com,
 irogers@google.com, james.clark@linaro.org, jolsa@kernel.org,
 mark.rutland@arm.com, dapeng1.mi@linux.intel.com, thomas.falcon@intel.com,
 tianyou.li@intel.com, wangyang.guo@intel.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/4=5D_perf_c2c=3A_Add_funct?=
 =?US-ASCII?Q?ion-view_stdio_support_and_coverage?=
User-Agent: Thunderbird for Android
In-Reply-To: <apM7dIdexptTo-1M@google.com>
References: <cover.1787283281.git.jiebin.sun@intel.com> <apM7dIdexptTo-1M@google.com>
Message-ID: <DF86375C-B678-4A90-AC35-0E11F9414A09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On August 29, 2026 5:05:08 PM GMT-03:00, Namhyung Kim <namhyung@kernel=2Eo=
rg> wrote:
>Hello,
>
>On Fri, Aug 21, 2026 at 01:56:07PM +0800, Jiebin Sun wrote:
>> The recently merged function-view series added an interactive TUI for
>> examining the c2c data as:
>>=20
>>   read-side function -> contending writer -> shared cacheline
>>=20
>> This follow-up makes the same view available to builds without SLANG an=
d
>> to pipes and scripts=2E `perf c2c report --function` now implies stdio =
and
>> prints the three-level hierarchy fully expanded=2E It requires `iaddr` =
in
>> the coalescing fields and is rejected together with `--stats`=2E
>>=20
>> The first two patches fix adjacent pre-existing issues: the documented
>> default coalesce fields are stale, and a workload recording failure in
>> the existing c2c shell test is incorrectly reported as a pass=2E The th=
ird
>> patch adds the stdio function view, and the final patch adds automated
>> coverage using a separate contended futex workload=2E Systems that reco=
rd
>> no contended samples report a skip for the hierarchy checks rather than=
 a
>> spurious failure=2E
>>=20
>> This series follows the function-view work merged from:
>>=20
>>   https://lore=2Ekernel=2Eorg/linux-perf-users/20260817094623=2E3288456=
-1-jiebin=2Esun@intel=2Ecom/
>>=20
>> The series is based on perf-tools-next commit 9453bc6a69ef ("perf vendo=
r
>> events arm64: Fix Tegra410 Olympus event 0x0197")=2E
>>=20
>> Tested with:
>>=20
>>   - SLANG and NO_SLANG=3D1 builds
>>   - perf test c2c
>>   - perf test 'import perf'
>>   - checkpatch=2Epl --strict on each patch
>>   - unresolved-symbol checks on the Python perf module
>>=20
>> Jiebin Sun (4):
>>   perf c2c: Fix documented default coalesce fields
>>   perf tests c2c: Report skip when the workload fails
>>   perf c2c: Add stdio support for the function view
>>   perf tests c2c: Add function view stdio coverage
>
>Thanks for doing this!
>
>Acked-by: Namhyung Kim <namhyung@kernel=2Eorg>


Thanks, I'll try and process this RSN so that the other patchset that Namh=
yung mentioned may conflict this can be rebased=2E

- Arnaldo

- Arnaldo
>
>Thanks,
>Namhyung
>
>>=20
>>  tools/perf/Documentation/perf-c2c=2Etxt |  14 +++-
>>  tools/perf/builtin-c2c=2Ec              |  85 +++++++++++++++++--
>>  tools/perf/tests/shell/c2c=2Esh         | 114 ++++++++++++++++++++++++=
++
>>  tools/perf/util/c2c-function=2Ec        |   9 +-
>>  tools/perf/util/c2c=2Eh                 |   1 +
>>  5 files changed, 205 insertions(+), 18 deletions(-)
>>=20
>>=20
>> base-commit: 9453bc6a69ef43755f1c28d5688cacdd69fa16bd
>> --=20
>> 2=2E52=2E0

- Arnaldo 
