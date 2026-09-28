Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D439175A64
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557360; cv=none; b=iktAznTi5eUsPjNLnHsVhAEaaSbfaxDks2MhfMoqFmBNwtTP8ewsyL8c7N+dHsVZz8DIjk0VEw2AgYiRoazYHl54EzUBJdfRW4XCSgpvflKwu+7OUR9r2Fe1jP6zq+euHgVhdXQhP70Wpy+Xx5zl7XOyC4wtoVWxOQMrCxwyTUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557360; c=relaxed/simple;
	bh=0HGVRBoBA+cAb5XHvSazxK+ojIOUqwhndVb/HVGZFaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uxSQHB7nMp49t1lY0KZd5R8549IfqrZ0VcvzEHGjKgkTaQUVDbnGOLhWZLWqY5zfFkdV3QB8SJV1GGBWKWK2+D3HUqk5CqY/heeN8oCobdW/uINxfqmj/R7eBj00nF+i4/4bpL/NDKMJs2EncCLh89GmZJBw8wUvwjwSOW3f+xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6SnFbOG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6SnFbOG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so12821515e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557357; x=1791162157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PjDyytdPMTn3M/DYdmyBBAX6C8pTKorMCooRZjrTuVs=;
        b=D6SnFbOGUSxmkstJ89+FQ3/sxpNiiDNeCP4F0aEhRkvc5jCqxUROCheiWt9cba7luA
         MsHmf2IIrnOz03mllpym0i3ylk0xuAn+SaETrVXj1ae7xoc0JHSbaEkjdyN9OTG8qI5n
         mdFXNLsfRuu2bTfWnB4cSRmd54P9xJWnZ79HZfB/xm4yI/ZV41MeRu6QLdCJ1/dmlzr6
         AqaO3/2JuF5/sdw+L5VoaCkoD2xIn24RxszpfmfYCFwDgpgB9Vwo7hpa4urFMnSdDv9M
         jx0IQ/pPCWBZLYweNqglxgWc0b3cFcQpeXqRJxBMwmzn7LgLoY6S6WTjpLfUIzOmo5R5
         z9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557357; x=1791162157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PjDyytdPMTn3M/DYdmyBBAX6C8pTKorMCooRZjrTuVs=;
        b=N4/6YYxhMqVkO3JtP4qoN2fv7C1BTmmLJKbJ+Fha6lJNBnmSXaWV42O+k+nDiyoiRJ
         KRgeYowia1EnFZwgT3Dz8BbhY5+hwyPyDuDqKB1YdM8GwMm/yPuxTAUCbqkAvuXG6mBi
         8kSGT9YYOIqR2cyignKXdBJ+DJvHEhplTD2pLXuGzcTy+yQpX1lsuEdtwb8hCCRMCO2E
         /kqHLz5/mHEWKIfAe0Rd/kyyyYcK2h5qA4654p8CJjROVGnxKctuTO9V4g4NRiDxx8aZ
         AJ8BgcthAOdqhxeU5vbzNYyBlAtYDtdWlsQ4nw2mUQsEsSr/7t+MlkBqMgq+ZfVcwcFq
         9CKw==
X-Forwarded-Encrypted: i=1; AKwUvByJBWxr4ID2AycBKytLbrEf/4McIE3aY/6kBK10ToQZWLaqtKLD4edd9yuiANgII1bdwYrElF34c0eezSk=@vger.kernel.org
X-Gm-Message-State: AFuF++kxutYcchSgsC4s3YU6dTAxSrC8rM3M6PvM3h8z3c71Awvk4tVS
	m869HJ8sRP0JRLNUCxjM38+RkPEZ+GhhMr47XrOwBxCTUq8IWKtr1oFB
X-Gm-Gg: AYBFou3YAWpWiphrYj0m4FR/uVxZGyLQQaZKniFIIq6CMi6CkSFq3Km7pipNb/Yz0LU
	yvutHASl97mA7ZgorPZY0b0PowX59KQI4+bZrIxUuBFg+OW2TWN1GkyrjfF7muu04TgfCIdYRor
	1othQfnlJHlBeg9oNgvKctAFaBT/U2cBWARbDnU6p4YJ/el7Uu6jxdv0V9c4E06RhX5jFispJmt
	Si/dgTkmwQXwSSPiVHu0Bq+FzUqt0aYTlbCmwPaxOFsU+PvNtosyeNTFkzPiEAq+bWiITV5vHKt
	Pcc0NKlCXe/Z3gafMfB4a7TiZj7j3htFtMS1SEriQOqZIBTTso1pG1v31Hnh+t4UAqfCHeI84gd
	OR5u30OdEW5q8mKQhkCHvbeu5nCVd2Dii8WyrR/AK6icIajs64TXVlPlYaRi6yqrIqGNrtb2P+Z
	N/Qfbv0pATEXmtgYXlpUxlclH2Dv+W2mMWMTIgGSJg0Qq5trh2xIzrEBjr71qjot+wPoEA2n2T5
	hrzsu+VV4OyI7SjCdsrcZLdxqcd0RobfEKghTvgp7Lg6NI0aGkTvkMNNmzyiG8aKbWpSfm1NBWJ
	9jWWbK2kqSK8BC0vuhdLZGaosapIEXR5lLn4HvNZJJgvpCUhPY5HuJI+U2igAA==
X-Received: by 2002:a05:600c:348a:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-49fe6705942mr195533945e9.30.1790557357518;
        Sun, 27 Sep 2026 18:02:37 -0700 (PDT)
Received: from mikebook.tail5724d6.ts.net (83-244-142-114.cust-83.exponential-e.net. [83.244.142.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017652d1sm144207825e9.5.2026.09.27.18.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:02:37 -0700 (PDT)
From: Michal Pluta <michalpl2003@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] perf symbol: Speed up demangling of long Rust symbols
Date: Mon, 28 Sep 2026 02:02:22 +0100
Message-ID: <20260928010227.1903673-1-michalpl2003@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dso__demangle_sym() demangles Rust v0 symbols itself instead of using
a helper like the other demanglers. When a demangled name doesn't fit
the buffer, it grows the buffer by a fixed 32 bytes and reformats the
whole name from scratch. The number of attempts grows with the name's
length, so the total work is quadratic. Rust programs with deeply
nested generics can have very long demangled names, and I noticed this
as real time spent in perf report on perf.data recorded from launching
Bevy and Typst.

Patch 3 is the actual optimisation, doubling the size of the buffer
instead.  Patch 5 moves the Rust-specific logic into its own function,
matching how the other demanglers are called.  I think the cleanup is
worthwhile but I understand it comes down to personal taste and the
patch can be skipped if maintainers would rather keep
dso__demangle_sym() as is.

I used an LLM to review my patches and find the issues with the
demangle tests and the unterminated buffer bug.

Testing:
- 'perf test' passes, including the demangle Java, OCaml and Rust
  suites (patch 3 adds a case for a symbol that exceeds the buffer
  limit).
- 'perf report' output is unchanged before and after this series on
  every Rust binary I tried it on.
- Built and tested on x86-64 with a 7.0 kernel.

The series is based on perf-tools-next, commit 0ae6fc78c5ce ("perf
timechart: Remove the unused use_old_power_events variable").

Michal Pluta (5):
  perf test demangle: Fail when demangling fails
  perf symbol: Don't return an unterminated Rust demangle buffer
  perf symbol: Grow the Rust demangle buffer geometrically
  perf symbol: Shrink the demangled Rust buffer to fit
  perf symbol: Move Rust demangling into its own function

 tools/perf/tests/demangle-java-test.c    |  1 +
 tools/perf/tests/demangle-rust-v0-test.c | 13 +++++
 tools/perf/util/symbol.c                 | 60 +++++++++++++++---------
 3 files changed, 52 insertions(+), 22 deletions(-)


base-commit: 0ae6fc78c5ce0dfd18d8712a50f0fd4602eff103
-- 
2.43.0

