Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368677;
	b=JiujqPlDD6SF6BY734/l+vdTkRJa1s5nLiMVMXLUGrZEKNX53Rp5VdFReoIjSR2qt1pN
	 jPT0kRtVHQO+b9V9IvA1LaZ+UUJVaO5x7DS+4C9dF6PMdixLtwV3jV1kjs/D4SSdIZugV
	 gBPDRU0klRtsGw2/riRWJAqU7AnTVcAJp/2cEOPet+MVQMe2z6eYAEO2OeAexN1P1GcuE
	 QG/1e28w0gVaQ9O268AUmXvGdBKMFWWIZme+MiPAz1PPEODQqlGLNfhEIK9YocVtLnjxn
	 pAEOm8DCssPx2mkMkOPmJv37ZE6osk+Ka/y+g2jR7RncvVNg+0SxjMAYbyvFJ5f1Seg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7Rx2xMMXNqFSdZ4hSTTgyPdyZObPE5Ic1lNABuktusY=;
	b=TH6ruLhHLn8Ghalp4Y80pwz4JJ3Wv8t2tybdVMYxKYv9yxxqa4da9w4bURYiI1lf/S2O
	 j6bYlNimmnE8glMuWM6xHTdByBVktyVKB1BtS/hZwzHQU4+jOAXe8VndjaVTTW5AjvjjE
	 2jQjtEEA5nX3ah/+Fbd7JAPtcRX/J4RQ9Ir1WaKpdjipsrIim3Jl2pwG5ZK+UQ8+F3zYy
	 nviHhwnbitae1Tjep0zr4ojvVZOAHvx49a4pkf5fJxtngl1sQxy1s2DT2A5ir6DZvtDHg
	 nYUc6F6rzkhLSNAkPhRDeFLi5w9E3nD6Hw5qfyRs9JtuyAU0QOmUoddtLTu/3AjWPXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIyqBdXK;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC41606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EC41606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIyqBdXK
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so4725659c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368676; x=1794973476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Rx2xMMXNqFSdZ4hSTTgyPdyZObPE5Ic1lNABuktusY=;
        b=lIyqBdXKGql3khtJNo74Hqj4TjQMXuuoxuhrMpLFYWjnDtGb8b4AaaXgnFjsD32cUO
         dnt4b1XGFfw/q3SPZhnl4Myui4WbMv+Es2IswVTKSPfbg6jqmWQm/BqmjX4SB8p6CEI0
         Ogmg8yyzC/AlWcVbL0ML32c5HjiPzvp0vyVxrck36MfwfBxcc1xryewy0JbNVuNGYb2q
         CsU3rvFG4zL7scIGYU2C3N+svp9U8d33bp7zvZreYcS2EKZ+WZ2bL3WF617d+kb4xNcW
         H1VGxMeQfLJ+EtYXHiRa9ANbQB/ikMZG9+/1FXsIWt2LYqjcZoJ8pp/TiegEfcsyA6oI
         IOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368676; x=1794973476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Rx2xMMXNqFSdZ4hSTTgyPdyZObPE5Ic1lNABuktusY=;
        b=TBgc6Wy88lJxw4xKdARjpgLa47sU9zx3LSRhbfZtYBLlj1rt5/xExneeT2zE80PU7O
         qJtXp8hV+caHtDlI6jWM6deVh59DqC/z5xXrzGGtr1IW/J71Q5NYztUMbed8qzsO6AQ1
         G/KsBRnO40nalmedyDukooxKWNfF7X/i+OKlXfdvx1ImZm5vRdzzTRdGj/rOGP2gJFZA
         BA1VwJ0sagT3LLJ/ihgcnyU++cRnwCvjheSsGnoFNZ7K9meW0l4P5qOU/39d3CiR17Kp
         /oAKPS85NZsY8t2fgqcPo6GKIjDQuiMcvLLM16VADLnKw35IBxx3zUrqGvS7dVmIpATY
         t/wQ==
X-Forwarded-Encrypted: i=1; AL+hErFsTQQ+2M1fL78kGefnJGMEeZwMVlsYAf9lJmejgPoSFS32A28RgNFwBqMtkXwUNByZ51EHYgfLmvA/IKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MGVqq1hRGNDBKh3yPA+ekqb93cy5/a1B3o21y4hc9HcOVOt5f
	XZkxxyXQrnCjq5uyxHPh2r0qdNb62eeQu1A12iKhz/yS3YVXVl+y5qljArNH5gSg
X-Gm-Gg: AYBFou2o78ujGfnP18Rex2RaoDKxocUltXut1Oh67YxmFuN4ns2oeMGHSzIi3eCf6Iw
	Je+IauZhvi8+zqmvvHme2Au71sdbGR4r09gRYLN/JWU5pHbDSZlJH7cjrUaHUTBElHgtA2jsvxl
	oxYuovOyAKXi5gO+XSRAiFvNpF9hKP4gi6UL5J/RnXy12BGwrYI9mEW/MabroMHijo6UjpNZDdA
	9NiOVZXJoQRHxrkJvrX2FPF55j1CDTkWInqRf6hQzlnwKf0aX5hozTMWynQBTK8W1gL/+bVYH7O
	y3nMdnJaRTfwKXWPBTC1lSms7Lcgw/d5d9ZTkcrebBs/zUndeW3S0rkJ6wlyZp625tsKFwKwnfJ
	lpDvcxnn6YCnWi/YaGKpKDJteXlhNpV6dj43B0uLHvanmrKvkucxQ2AfPJlx2lPN5lgW8cdTV57
	KcvSd4IWsKCDRcaaHb1iW4pvM9Kl/GiDuZ+/A+tS0+WWNsEzK7muV+nonN015yz561hZL1eBflg
	YCp9m1FtZH/6qnI6uElRMB0G8col4hJzUcKZ7PBG4dfBdQEwrMVApVGHLmNBaXFgMe+AGRKieje
	mzg5zjHdAZ3uE/LcPBQu
X-Received: by 2002:a05:701b:261c:b0:1b2:46ca:242e with SMTP id a92af1059eb24-1b3c02f34camr1200137c88.14.1794368675565;
        Tue, 10 Nov 2026 19:44:35 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm23664862c88.10.2026.11.10.19.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:44:35 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v3] arm64: perf: Drop the example the userspace counter section points at
Date: Wed, 11 Nov 2026 03:44:32 +0000
Message-ID: <20261111034432.2020955-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111023550.1971639-1-takano32@gmail.com>
References: <20261111023550.1971639-1-takano32@gmail.com>
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

Documentation/arch/arm64/perf.rst points at
tools/perf/arch/arm64/tests/user-events.c, in the text and in the link
target, but that file is not in the tree and no commit in the history
leading to this base has added one.

The section already describes how to use the libperf helpers and points at
tools/lib/perf/tests/test-evsel.c as the example, so the sentence that
sends the reader elsewhere is redundant.  Remove it and the link target
rather than pointing at another test, and move the instruction for running
the example into the How-to section, next to the reference it belongs to.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: drop the reference instead of pointing it at another file, and move
    the instruction for running the example into the How-to section.
v3: the v1 history moves here, so the commit log is the change alone; the
    sentence about the missing file is stated once.  Raised by Sashiko.

 Documentation/arch/arm64/perf.rst | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/Documentation/arch/arm64/perf.rst b/Documentation/arch/arm64/perf.rst
index 997fd716b82f..5b9cc2aeb642 100644
--- a/Documentation/arch/arm64/perf.rst
+++ b/Documentation/arch/arm64/perf.rst
@@ -131,7 +131,12 @@ changed.
 
 The userspace access is supported in libperf using the perf_evsel__mmap()
 and perf_evsel__read() functions. See `tools/lib/perf/tests/test-evsel.c`_ for
-an example.
+an example, which can be built and run from the source tree:
+
+.. code-block:: sh
+
+  make -C tools/lib/perf make-tests
+  tools/lib/perf/tests-static
 
 About heterogeneous systems
 ---------------------------
@@ -140,14 +145,6 @@ only be enabled when the tasks are pinned to a homogeneous subset of cores and
 the corresponding PMU instance is opened by specifying the 'type' attribute.
 The use of generic event types is not supported in this case.
 
-Have a look at `tools/perf/arch/arm64/tests/user-events.c`_ for an example. It
-can be run using the perf tool to check that the access to the registers works
-correctly from userspace:
-
-.. code-block:: sh
-
-  perf test -v user
-
 About chained events and counter sizes
 --------------------------------------
 The user can request either a 32-bit (config1:0 == 0) or 64-bit (config1:0 == 1)
@@ -160,8 +157,6 @@ userspace must treat the upper 32-bits read from the counter as UNKNOWN. The
 and should be used to mask the upper bits as needed.
 
 .. Links
-.. _tools/perf/arch/arm64/tests/user-events.c:
-   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm64/tests/user-events.c
 .. _tools/lib/perf/tests/test-evsel.c:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/tests/test-evsel.c
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

