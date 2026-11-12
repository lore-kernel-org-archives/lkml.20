Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794527435;
	b=X0Vyf12ZAOiXOpzKM5PmDldvfr24I814BufwAFIArlT4o0A4rT6/EqR8/rJpHEfSM13T
	 mGh2TNv6vkDzvvwUI0kSkEaKQKfpHr9pZD/iEcoUv4ONxd4ab+xKlEE1h/h/oZ9jUMpXB
	 zb2JhRfhaqctuX79E8WGmAGR9u9t7Xyos1VfTLWlzBUB3HWs9MpIwEoFram+ttfOMZWeD
	 UldTWtCDrZMxO4MmVIgwvUcTjHqLNb6cf5/b2D9GCJj1OfZeHEVo1aAV7sCsUKsSU2lEB
	 49JycEt8iAHfgnXFjWnbJSow42++t62T987lH+fdS57sUE8WuM0lsYOg261SHCNZuig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794527435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q1kvRgKeqJR6EuLY1yBynSJtWsSukBAUvLh/S9hCbu4=;
	b=GNr4/LznhOS3limB5GXLOVCAHZsvwmCuudlJWbRq3DYXUKCYNhfKsvxTlU6KyC1SDT/Q
	 f6KxNyyhHF4cEbRkOBahAECmI7+m/TkCdoiJuvWV1GI9CrRIEuz7qdpHIaZtMSDkBCyjl
	 rlaatPqNaPAWwpqFXfrTtdt8DeMpa/BFqvR2T27au4MwbiRQDvQX+hUk5YM1XfZDV2OKd
	 Utcn3f+f8VTbrL117NJXijGQJuGfHF9WnfNlwDLqOqdT+S0YNZDDLkccjFyYHZ79KTohU
	 DNScO1SaK+vuHwTTfMKn+f3mRX6M6ni86rcIEmH0PClDgTUnhzNxJQerBTMt7bci+3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rXZleSVo;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E3F606A338
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E3F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rXZleSVo
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso248968a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794527434; x=1795132234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1kvRgKeqJR6EuLY1yBynSJtWsSukBAUvLh/S9hCbu4=;
        b=rXZleSVowkCYrx5PW2Wk6LwW1c+xXl7XUq4Z+rZPI3RX4Hptd1Hh4fEQ3QpPlNUojY
         AiRVQUP9ui5ADgaUCGwJGxf0kqvWYffgzQBsWA9W5Z/dArNmXW7QoFiglHkcbuY8Byzu
         HCoNG5ii/SdPvS+h4DiA56nJDccBa7Q8rdDB7B9nQ709LGyfSJ81XDY7rVSzbNoOdFw8
         SFoBPspRD/NDApuF/0e+fmaFgia0kPri/PS4uQgR6cogQhdaE1WfLfgnIosZtv5fTv4L
         JZhBj8sAy8/1NFlpbnrYCfNqWklJBUABZ8EixuPUAaLDqnnufc7HeoJo7uJeCc6yg9N2
         FxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794527434; x=1795132234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1kvRgKeqJR6EuLY1yBynSJtWsSukBAUvLh/S9hCbu4=;
        b=iNHF36Fm+4FKy2Ap+AE1Vkro43vxap6BMeE9DWDg/1lD9PSF0TC6Y/l3sbCDI5JsMw
         6t9gozPysa6CkVbwMX6rtV7R1zgDUF/gS/WVOa9scJ3lKYc6f7I1qUsRnKEljK4w+CdQ
         Qfc5tiBHVIh7VfRPUQqoCRjnDMksomjr3tIxgvwgHOZV6OOC5wAcdChnScmBFwAfPmyj
         vz9Id4jn/aJd79o6wZHnUh+uvlIUAw6Kzu5aVlbqZdefTnW0iaiueSwTQ1i+5ovQMErq
         x/TxqsR8lTvDaSwS63QJQiJS75vQk+wNISmz8tymDmTF/mih3jwYSsX+SKCYpRs6Z25a
         Vgag==
X-Forwarded-Encrypted: i=1; AL+hErESZgfCJHcd6hTKx4ZK4VLk9fPeGx3NqhyTo6DV/Gj4I1VHEHBoBemtO1E8an8HtOZIKlx/PmQ21Dwquwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Ca49hsnkd1waFq+PhLawWbTM4Mau73R/JvNWgwA91D/kFt0K
	fuuUB6G9j70S5393FzQWosEsje9CDLQnL8Q+IFj6yMdTXmFQHCi9KSXM
X-Gm-Gg: AYBFou1sdE+WJLRkkM4hb7fdy3a61yGJc3h4mhACnCcBL6ip0VvO4tw8MxC1oun1dn9
	zVmwb5qCyk4rRILoJX09KMwpdhZcs8OA5WxSVdUXHKmansYv+1dGMcuJfvXcvoyuRlX2cnI3UHP
	MQ5UvPiLMYj1hP+RIs4FbD3nzL+kbuwO+OOAsUj/DUg7zEdPjggRCtdW7H8yTZCAfu/q3f8iznE
	OAgfGeTdYs/QvG5tJjedU7eTT2umCUbUIhXH9Q283qXETCDsIA+uCJfaneED4q8AlejRnhYrAmy
	+WSg5st3wUMeKs1T521i1Mt5DW61tzXxLX0gz9WZIWEHop13O2R1UuWR06UpYPZx9PSCJmlDltg
	+0rpTFurWIKHSvklfDQLg3pgABaGxAY6hunPWsV+aKG1ssvnJ67UwxZQYIkkn8QlbItGG7v8V/F
	z5AlhvejZrxh6hKgNyDQA9rsfu2eEY3r+yuWabtvJ9CO1YvT04a4lMYV9RKpmpnzpZQgpD1ZDLn
	YIcJ5ODIWHjI1A7GiGe7oRSHUim1EI/sV9H6FpN7PCS06NzJAGhg02iLnBB/joEcDmkj/TtEIZr
	i/ydaBCRQUI5bUqW
X-Received: by 2002:a05:693c:6293:b0:378:314:4033 with SMTP id 5a478bee46e88-379679e29f2mr632919eec.32.1794527433890;
        Thu, 12 Nov 2026 15:50:33 -0800 (PST)
Received: from evangelion-g ([2a09:bac5:40e4:11cd::1c6:8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm3842976eec.8.2026.11.12.15.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:50:33 -0800 (PST)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH 0/2] perf/x86/amd: Check CPU hotplug setup and unwind failures
Date: Fri, 13 Nov 2026 05:20:01 +0530
Message-ID: <20261112235003.18608-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AMD Power PMU and IBS drivers register CPU hotplug callbacks during
initialization. Both paths need to handle failures in later initialization
steps.

The Power PMU change checks the return value of cpuhp_setup_state() and
removes the hotplug state if perf_pmu_register() fails.

The IBS change checks cpuhp_setup_state(), removes the hotplug state if
perf_event_ibs_init() fails, unregisters the syscore operations registered
earlier, and clears ibs_caps on failure.

This series makes the initialization error paths unwind resources acquired
before failure.

Ayush Yaduvanshi (2):
  perf/x86/amd/power: Fix missing CPU hotplug setup check and cleanup
  perf/x86/amd/ibs: Fix missing CPU hotplug cleanup and unchecked init
    return

 arch/x86/events/amd/ibs.c   | 26 +++++++++++++++++++++-----
 arch/x86/events/amd/power.c |  9 ++++++---
 2 files changed, 27 insertions(+), 8 deletions(-)

-- 
2.53.0

