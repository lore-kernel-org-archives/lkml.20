Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEDA42F6FD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074769; cv=none; b=G13se87D+RZ/BOYttL6uAws9dlL3sI/OPhHkL2E2lojNAskh/IRE/wIRezK/VTYI2gDlcoh74tsq87vDJq9J0Wc2zLJ5VfyylIwDp/zZNCsxdHq81kgkoPo5o0E4cKJFrsnxUyM6Xy4Hl0Cs6IjugJaZvKasLXQl+rHAhH3P1TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074769; c=relaxed/simple;
	bh=/EzAoEUS2YE8bsBvoGE3Tm/8BjynJFrFkU9MDyxB9Zo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=OtFgcS+X5gf+4M4WVQs5MXJNZ3cfLHhL+K25zh6InGFFlD+pT1hjBtwsUR1L9SN5zJCTKW8AxkgaUEYYrO8Qg04NGNd9DtLjhdk/ZP+Hy6QqgDZLWE4R9WIQkrunWjXJEFdmEHKHCzf6BbzaciIg0WK/TTdL7//wmBf9InmuSEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e4yspzZf; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e4yspzZf"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso324984a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789074755; x=1789679555; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tr7m1319nZL5iERS06+kdvt+gsbg/YAeXusZ5Kgx2bw=;
        b=e4yspzZfHIlNEPoOJtGJp+NTRzzz6b0aMqy3sSWTovQGomYSzyG1FV+WO0Nkstnb2o
         4zgXUZT/PLqrCPvWQCMFVY94EqE9yrIQKh2AElnYhIPkPV0X05JDPq9adfrZLlnvx10N
         J7keGd70FfUt7bMj0C9EYj6osJYywH5V7H8w/HCczKV8l/JWyehcf6xhDXNX7VlY7ykG
         PxW6PAAHrUdNQ645hs+mGPUcKt0QnLXT3KQx0/3eq7nuJLtulfcQVeL7dhlatJWfmJbt
         x7Np89RXdl1HV2verdDUUjdIV6Dt7ALbm80tllEp/WWfTieW+hCmhM4NXZ76zFdTxZhY
         iICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074755; x=1789679555;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tr7m1319nZL5iERS06+kdvt+gsbg/YAeXusZ5Kgx2bw=;
        b=JYYx3GI1UTHc/hnXu+ngt3ObhCtmZR/UnaKeHWJio5mqq1pFTuEOwk9LvI+S4MD0qY
         CvxvSjjEboJ2GR1m5HYDyKKtqNrG2qpqtsjOzz8NalfSm5kzmqF/RRdDz+McEhNpXzEX
         q2GRw+ENoxalyVHjh16T756QhMMGrNWJMRKrRCRCAseRSs0yNRcXeUIqRyQLWePPQftJ
         SMUFTPHQGcyWwyt4+W1LkmtpsPKgs0yLHPGYFO9DaUd4gN3YGTUZTN1JLAlQZX7yHBQV
         9/KA5OfDDUpSDlhTEWb83CSIUI9GCecFWxDFhX+4tcFy2JCkEj4vAtaVH02fbCp/vIVw
         3uzg==
X-Forwarded-Encrypted: i=1; AKwUvBzCbLyUCP90IGpHGGFflS2VFcRG+Teeb3iMgKW5571geQID00tzm2u+EshBsDZ6U+RWlVoTmWMOkRJXSfc=@vger.kernel.org
X-Gm-Message-State: AFuF++ncHxkT15HL4ZO1i6G9XeNow5fm0jdqx2W8xJwzdnwDDWUmPYhF
	hC9Bcq82tC8LLr6IcR00c8+ABV8x/TZwtswcHIawXT3Jlj4TdHsrYTahmZXXhQNi3sisL285oxe
	0QxSsH+U94w==
X-Received: from dld34.prod.google.com ([2002:a05:7022:322:b0:13b:2a9e:ffc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2741:b0:393:19a3:4f1
 with SMTP id 98e67ed59e1d1-39d9bdbb0e4mr920398a91.6.1789074754460; Thu, 10
 Sep 2026 14:12:34 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:12:17 -0700
In-Reply-To: <20260910175634.3014018-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910175634.3014018-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910211221.3154261-1-irogers@google.com>
Subject: [PATCH v3 0/3] perf header: Fix memory corruption and unnecessary warning
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Some minor fixes that have shown up during testing.

v3: Fix Sashiko include nit. Accidentally posted wrong 1st patch in v2 (sorry :-( )
v2: Fix missing newling for pr_warning:
https://lore.kernel.org/linux-perf-users/20260910175634.3014018-1-irogers@google.com/
v1:
https://lore.kernel.org/linux-perf-users/20260910173715.2996571-1-irogers@google.com/

Ian Rogers (3):
  perf header: Fix HEADER_COMPRESSED validation for comp_mmap_len
  perf header: Fix potential memory corruption in cpu_cache_level__read
  perf header: Transition WARN macros to debug.h equivalents

 tools/perf/util/header.c | 122 ++++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 48 deletions(-)

-- 
2.55.0.1007.g17ff1f9808-goog

