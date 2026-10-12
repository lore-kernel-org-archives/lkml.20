Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5915326D4C3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838856; cv=pass; b=PlC6Ulqkep6BJyYPvp+tuQoxNC+/0zoNXLw5FpJ1U9AzVSVUVnqmIEZsFOvPTIoCNHMdKfo/hvgVmMBbV9lfBqgcX+a8Xk1oMCQmCq29YkcvbQeHiBG+1fllUefqjPMzJOo6cD8b5TvQUwVlzc1D7aJ/bbsUarPeIDArTK9642Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838856; c=relaxed/simple;
	bh=RPWn2ag572L5mE8SLg4IzDataxoyag1Rmk6FWVBoUgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWK5Xp0EybAXYZJIeZdx6hkfDfYNqibsrkO7o4ppLsID34qfC6Fa8zzi6k3XCtZ4jNE+1TcF6WCtIdHIaykDubu5MNis+IinyjFrTKSEPGKbweXYoaLywElQhMZAtAVZktAumg11ay4529qvWpuSGWQnTIvRVbr0GrznokAWK6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fKIOnrTj; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fKIOnrTj"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533202fe429so533011cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791838854; cv=none;
        d=google.com; s=arc-20260327;
        b=cGCRBIHaeOyK2lI6zLRVlZNlElpO85Jm4TNPxrSoL9Q0R6pa+is26FazeYRxzTUHPo
         iDwdBE3A2CU90hHtF2o+CwqX1y3EcLqOA5khtdOZySHs+eZWt3f7OGqTRuSz6Kkt7vge
         L/3XC7+CL1qw/Tbin7kZEAa2mVToELyCIoGGGK6uN6cWaagSty7va1RPpj9dDzKwspYg
         hMoNZAG3cNO6WeBMO+vi9k7MbhNac7KS9rGi+lcMhqxDyQ80KjvmRGbqL+SUMey56Piw
         jQVM4xb172pHs21srf6gsIwK7xmhvxJ5AbgWZa4Lokgfx/cmYjJAPK4GHqNQvPJLjXwP
         pbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=clWRW9vCkWtW4QnqRq5GkeFZYURlC39kF4dyGW5O0So=;
        fh=aFs2XmHmls7gZAwnwRzgQ1VSKwiTfNLAh+4BrbAvaWE=;
        b=ISRW2DGv1Q+lCKVXC2e9JtkhXD0ibUXNPITveNprFDq1cKEcvnam+iEoD8Wb+pDhcK
         kLNB6lXCr4gzgV1P8Vj5ArKy3h/J1DGhk52xpp31JNYNM5HKKBLL2T3QBlvG5NZfqLiO
         1naDCrMmeLeD/mxVrTtWi0nNLhcoGTYothjpIqNuDC38WWjDoUyMimQKguxs1LQovARE
         XwHyl9+gwWsPqLyTZY+Osw8owlmrL/Jh+I6cmxkzLVcz5k6cMpkCEAnQj5qtIB68+h1Z
         A+GMse3/d3YBaBO+9ZuQVraKV4NIxwIfHzBtX7jCwRZsSdE4Y2Ty+ELAgXb89IK/nbgF
         7FOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791838854; x=1792443654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=clWRW9vCkWtW4QnqRq5GkeFZYURlC39kF4dyGW5O0So=;
        b=fKIOnrTjP6jCQF1JZu/2cHlt3bL5cn1FbJgakxda5336Xu9UiqGbX9FaL5BWqNLYWb
         E14Jl1yUxKI9G9T3RyHZLXuErX6CQjyhUVpUAHeT1zoTX5aH41AP1NIKo9M8x8zRK8fv
         OZtRvVVwj0OiiPMgLVNNvyQEdiB/STxgkpyP4rpMTgSATHKtS5VrqwRh8jzOom5+mGdp
         Fgp16Au4LckcpWgnJT/WHK7F1/QIdFjnT1yHbMXeNXUXj+FqJhvSJjAYzvAVl/cKVZ9I
         Pm2UO5W4j4BzVVi9wteg8qk8YVJkOTfbGjsYNkwWwpE/cCpxZRA73FuHLvNbE29gMG+f
         YaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791838854; x=1792443654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clWRW9vCkWtW4QnqRq5GkeFZYURlC39kF4dyGW5O0So=;
        b=c6RF1bQsQ7Bl2mvM8J7v1p9IaIGPTqNot7gvoHurMCeW/rXoOVocz6xvPQYbf7413Q
         yEqWgZmt7jpFXd3VZr1sRvSxpt2eSLnTdiNLzHbU3K48UWANPla+t6c1Rrb5d/Z4thX1
         ff3AukghMEn5LeHosauEwGYYcea88O+OIZlH2Ymz1flidRKReSp4pda0xTbwRAWnNahL
         vXGcTN/UKlptI2mvV/WZi/3i5SrZAfGczL5ck+OTZ8UkBrSAu6LnlBFCB2tSEmchME9z
         Rlyx4tSLmMex0fqZVvyQnpPa2tCPau9Kf6NN6IC4mmkTxi4XLRvmYEj1ZlvaYCK/s+Ow
         6Nhg==
X-Forwarded-Encrypted: i=1; AKwUvByzeMo+IeliCgSoRemsLxBX/nwJChX65o7lo2CS+38/gyLeDlGXJXTeY8C7u8nmpio24CoML/Un5h+c58c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7JvE3ptsXcBWyPDRUNGkoY6O4ZIDAbGPD4ntA8In+j6dQf0+R
	g81vigxwTq6gRtJzV6EsDZYWSO51gtZUjGn9pyS40cTvUnz0eCPWSEgfIw+UIc9nx9/WPptLwJz
	HLlUERf+gQTlBkVnj3IV49BahM9dd6D/42CFhct7y
X-Gm-Gg: AYBFou3mNwoxw8FYe4f6B+rw8+KKmiLLs5mxYYi+WTwoqbVStgZPRx8fnnlMOJIXyB/
	fPVF9D+ZKDk2JTs4n6xgZY3R6qX7E6vPed+d9SRZnHj8poDn9CC2wINACGbUOZKJk9RL3jvvpEQ
	CMw+IKdiTwSwrejlqC0n7kL3f4cnJA2hhq7x9nnQ2zqnWHEYyGoWvpWQRX4Rgg5P0lJaiRMyJWX
	dQZGimXfwtoFFk40aCnnF+8wTfZRFVs+sWvosdzGrf44gy4BPv/dIBUUipEsnFBT7Fe+7tlltlf
	sgtX8Tsa14+uR879l2mVxypgt2Hnf5U/v6PDuY2Bx1Ad3HtF4k9CX0aGIZINj4ZT3hTA592Fatv
	zYpQxGaj1OQ==
X-Received: by 2002:a05:622a:413:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-535b325f8d9mr39764741cf.5.1791838853558; Mon, 12 Oct 2026
 14:00:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791791463.git.sandipan.das@amd.com>
In-Reply-To: <cover.1791791463.git.sandipan.das@amd.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 14:00:42 -0700
X-Gm-Features: AclHuK9NIwJE_wp5nropDNhRmE-lrZW-ykVRU2dyouDnk3qNOnHZwmVvrdG_4VU
Message-ID: <CAP-5=fV5523WDsHvzAXcjk+-H3ANbFm-nNTxvooJr+fJY2T8kw@mail.gmail.com>
Subject: Re: [PATCH 0/3] perf vendor events amd: Add Zen 6 data fabric events
 and metrics
To: Sandipan Das <sandipan.das@amd.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Ananth Narayan <ananth.narayan@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:55=E2=80=AFAM Sandipan Das <sandipan.das@amd.com=
> wrote:
>
> Add data fabric events and metrics sourced from Volume 3 of the
> Processor Programming Reference (PPR) for AMD Family 1Ah Model 51h
> Revision B0 processors, available at the link below.
> https://bugzilla.kernel.org/attachment.cgi?id=3D311021
>
> While at it, also clean up redundant attributes for other metrics.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> Sandipan Das (3):
>   perf vendor events amd: Add Zen 6 data fabric events
>   perf vendor events amd: Add Zen 6 data fabric metrics
>   perf vendor events amd: Remove "PerPkg" from Zen 6 memory controller
>     metrics
>
>  .../arch/x86/amdzen6/data-fabric.json         | 1542 +++++++++++++++++
>  .../arch/x86/amdzen6/recommended.json         |  107 +-
>  2 files changed, 1640 insertions(+), 9 deletions(-)
>  create mode 100644 tools/perf/pmu-events/arch/x86/amdzen6/data-fabric.js=
on
>
> --
> 2.53.0
>
