Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794248428;
	b=GRMOfYcB+Q6CJyG3yQzsIy6xdhf+5aW5axih2rZB2n/y9wR3rqG8Ul0TTIspD24K9g7v
	 +I/6G1Z1z3FaA4+xJA2bTGqSfKbqIe6R0ZFrGmMTBTG6j96hGbbYNfuU0OOpaBiOpGGeX
	 08Dce+wDstxVtLOwqYAas//4H6jknT1a7QrMZcslv6iRmOgXZ0LgcP5ugtce9G1Dt7XEm
	 P4CR4a2wls6fYyugcZrQA1sdjNnPPBiKFgvQie/zZZ0mM2YyUa9lx4/LM3BLVeaRx+PZD
	 JNyD7WVk74LqexM7/8geN+QC5NkLajC6x92Q/6DpH34t8WQ5DrTN2e/OaioUaxjAq0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ec3rSrMbZ8GmXw0Jux1jLXyWIwWhDxqyeBtx6xUwW1Q=;
	b=NlUXFmDzqiBdR7u1yplX1hnmlNiwhvanfBFLyIlp/oWWvHQEjh6K0ffDkvaYD2RJd0qF
	 DWkpSxgBOj/yjuVKPkJkjCyDGo7JijOdaK5IRyeqdr9yZ7PFRlgol5zVa+KX/ot2vp8iE
	 3/SwRtoaGrq4f+TX/0QCu/6tMpLMGk33m8Vn6xw4SwRBWIXdqA85cwidAxdZNlIc8gFyu
	 OwAw9FRC6ExaoYp1Dd4yHdr04XjHDSZcM0s47tnHk3RRXvbaAqMp8Sr2DFuJo0wTn8RjT
	 ncI29OulHtPd4pyc6y7Gccqox0uYjbImoNg8jumI1ZsWj/4khY+eoOG0jPifNcjxZFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ReCZfeCY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2F4606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E2F4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ReCZfeCY
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-150ef97e790so536c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:20:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794248427; cv=none;
        d=google.com; s=arc-20260327;
        b=O63wCqJ91BIbUN5aKa10toWLJ4XCQ0GSV8231ltN6fcJc862UUYdyIVv1NN+xW06cU
         OB4dC3gf3kG0fi37jvRS+PxhzmEnp7nABznEv+s/cF5RchbGAljrlelTz8yTKgrN8FYz
         yOhMprvU/5wApM+3Ij3MEczKj5VH9lHn9kQ+iypjRF4xXnN9beeoKEd9LlCG3KCLOlJI
         gZyavpHu5wL5h4C7n6lLOEPP7Y9+278OmrIkA9NTsEynGd/If7YBBZTbg/g/BiFNPYrK
         5asAQASr8DbZLCNXydGaGAT8Q45n2zGBNbadOawXo7j2nsWF2RZvGdHuqO/GjKgPbj3j
         Yl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ec3rSrMbZ8GmXw0Jux1jLXyWIwWhDxqyeBtx6xUwW1Q=;
        fh=m2IsGdgG+gc5ofUiMaKxXfmBPXr2dZhIo59IMgmS+1A=;
        b=NuQQJQHdRuNN2Gf2VzwXIxCR0VMbrjqMnongTSmvcYweQU/y6E09aTTz3bFt0Gp+/X
         tkAMdgfjTfqG9xx//Ex9Z2evFlTlEwO0/ooS+t3BWbT99yYz4aCFkm4hRxE9oFLVXYyD
         I4VuewsuUlh1VzIW7u+FvMzJankj4cDXZpNrGs4VUoWNi50Fy6zgQBwK3TY9hI7xF+sd
         QghiA7MH8w3BQuoUAXh5STk1Sr9OFa2xiJIQN5amFeTBI4WV3mneREmoTFb55dqnbLyB
         6AuSsrYmIKFttUHZ1rEjfbcNbTQxI/UoQEOOHRlWV2E3Vcf35MI4nQ6nrr/JP1pYhDl1
         qWaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794248427; x=1794853227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ec3rSrMbZ8GmXw0Jux1jLXyWIwWhDxqyeBtx6xUwW1Q=;
        b=ReCZfeCYqVti3O0QIa3dt7iWC2SofmOK5kjoDF8z24TRxSi6mNrAHUxWKp6sSNjl4k
         yvvBWALZ0GKZfVIc/gUAp39v5gI0aQKkl8qIx/tFc4jR3CTFG/3GA12a2oMp2paoQ36x
         H0BvM+wWwOE6F5Hc13NZkjkREUieatT8mzc42BCcp0rf1SO9zMRj6VY1BppSq5yZiRfg
         MCpsc1tGs296couNuSN+BP8AnquY6mtuqFCZRoRklZKRtZFunzUvrWQVc+vAsio5OUnl
         VK5WzK19RnN1NTufVQz1+ppvjlObHtMHbSXqIy7GeIRIjmaoxxp/apdyaqMqnYBMVryI
         t1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248427; x=1794853227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ec3rSrMbZ8GmXw0Jux1jLXyWIwWhDxqyeBtx6xUwW1Q=;
        b=K3Vhx6P6qM+CFZ18kLDwsKcdQITubK0wDfESPk158oxSHrfeG86Lyo5GfHHyHuteLL
         4zBr5MbLz1+R3N6XhvtGwN5+lmmifTQNVpPxtwBu5F8ji0g6ZySHOF38Tq+DEkFHRKz0
         X4F9KqMpdwZKffuOpADsa3vAG5vm4MfdGxIsZsPevAAx8dY5ffs53aJqLQ2zinBIOuCW
         Om4nhy+OehNPJpwpKwmbO0zIpFC9I5wKTsLe1YNbbqHXXXOIMg+gnXD1uy2ekEMvfMb1
         qg/ru/Lv+Qyh9XxNm6F9ukZQUt6xze45RoGMBAk12CYe9pcIBi8Tp33r9iuzB2a2dD/M
         Vamg==
X-Forwarded-Encrypted: i=1; AL+hErHetUEPenJtA084D5gazOq24Hlf/BUzUbbJUJYUVGt9EyeQ8TTJmLM/nFc/zSamYDYwcmmYbi71p2TzlRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z90M33rH4AUyvXAl7IC12GHJytcpPtP3VJmCVsEUXxCUr9SaQGR
	PwFRUoSH9+7+Yt3YR710z6ligCQ09K1Iz8gcCjAwyiRLi7wG5KMIfHy6kLVMf7FEY4lsn/OMzDO
	eJohvupUmWcmSsQZ4aCV2gDbPIBL70/ILcWFEYPWL
X-Gm-Gg: AYBFou27mtIXj8CXMbwHoTKrDLnrEJuNHLSn3P3lCFTVjRt61pEbuSfLcvCi97hIPQq
	x+aj+g/3J4oQVtJkFdgs+Jz3h7rHDshEExZwsZIOWMPffqLgBxhcQY1Q8ml4fdzpPrcH9xAg/j+
	1p16GwHlWSocoyxmNJZ9tbum2XtNbhp3FzrcIzKaamnbyQwHaLp1y3VDX/pUSZij2rGEyWucNLj
	mX8rAUzNONSVA3/GiPGWSKMRuCnfZDKvmOGBCaL2nxQaUNgAZpp4EBP1ftD9/bTlVZ8jIK9UG/O
	TtXz4Eh8cX0PWOkuU6iSqDaWjY/IMQMfbC9TsmnV8+OOpU8wZxNWiLtt0uiiTy9MVuHV2No6jpC
	Ypyh+mptK2Ih3CHyUX2KG6ianDtv8N7pw7Rv7ko1aQd6pmkldrYi/dQcE0nCmWrptnWQ=
X-Received: by 2002:a05:7022:ea8b:b0:14e:e4bf:7974 with SMTP id
 a92af1059eb24-1b3b66842a4mr9502c88.4.1794248420013; Mon, 09 Nov 2026 10:20:20
 -0800 (PST)
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
In-Reply-To: <20261109-james-perf-test-fixes-v4-0-355ee6b81917@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 10:20:06 -0800
X-Gm-Features: AclHuK9DNekpxwBEfz2zjyCpyugGoj1l-_2rYK3b_X2Xz0sEkpkfXtYjLA4ppIM
Message-ID: <CAP-5=fWpnzp4O-kKqToP0Q7WVp1dcPaUH1MgPNiL__MNJKZ7hQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] perf tools: LLVM dwarf and flaky test fixes
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
> Running the tests on an LLVM build results in some dwarf issues that
> need fixing. And there is an easy fix for some flakiness caused when
> tests are run in parallel.
>
> Assisted by Claude Opus 5.5
>
> Signed-off-by: James Clark <james.clark@linaro.org>

For the series:
Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> Changes in v4:
> - Remove unused add_probe_vfs_getname() argument to fix shellcheck.
> - Link to v3: https://patch.msgid.link/20261109-james-perf-test-fixes-v3-=
0-e8d0a65e618a@linaro.org
>
> Changes in v3:
> - Rebase to resolve new conflicts
> - Link to v2: https://patch.msgid.link/20261106-james-perf-test-fixes-v2-=
0-9a912662f822@linaro.org
>
> Changes in v2:
> - Break perf probe line (Namhyung)
> - Use a software event instead of cycles for VM compatibility (Namhyung)
> - Link to v1: https://patch.msgid.link/20261105-james-perf-test-fixes-v1-=
0-0b279bee5830@linaro.org
>
> ---
> James Clark (4):
>       perf libdw: Find the CU by iterating all CUs when aranges are missi=
ng
>       perf dwarf-aux: Support DW_OP_addrx locations for global variables
>       perf test probe_vfs_getname: Fix missing debuginfo detection
>       perf test: Don't starve per-process tests with system-wide events
>
>  tools/perf/tests/shell/lib/probe_vfs_getname.sh |  9 ++--
>  tools/perf/tests/shell/record.sh                |  6 +--
>  tools/perf/tests/shell/record_lbr.sh            |  2 +-
>  tools/perf/tests/shell/record_sideband.sh       |  4 +-
>  tools/perf/util/annotate-data.c                 | 27 +---------
>  tools/perf/util/dwarf-aux.c                     | 70 +++++++++++++++++++=
+++---
>  tools/perf/util/dwarf-aux.h                     |  3 ++
>  tools/perf/util/libdw.c                         | 19 +++----
>  8 files changed, 90 insertions(+), 50 deletions(-)
> ---
> base-commit: 13a8d580433a3b72b10be34f0e26787fe5659d3c
> change-id: 20261104-james-perf-test-fixes-f72265531d1a
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>
>
