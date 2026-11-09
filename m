Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219451;
	b=HJverOeKwc3bm4rSxLtUh0QqWs38dlQLxHQRlqy/2xKf1rGohC20Ay94JuGM6m7aYKp3
	 boCtVs/Z3jR2y1nhpsJAa2CDmpt2FInjHafBhiLpfBqRS/0m3k0H3M2dWcm5aO5AfEL8b
	 kZtvU8wFWPJTIIcGrwPXE6m+fR6H+3PSGWDk5czdFUwxcYuouiVv/mAglPC4K/18Sje6H
	 bxnqACfxFsusESyC4qC5P8HnYLqdx4qRarcCDNTE0SylHYiWPSh6yImx6VEfUNTlFuUmi
	 nkUeaPZ++YmicD1aRvV0R/o8LlPXaVBH41JtKbSuSlBbS7vRdjWEMJoLtW3BCWKMHMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=TJaSvhKXpOs4hPW+qhrc6bZ76dM2q6MMdsGYOHYjFdc=;
	b=kIP72iwdDeL2TvQppV5FkKOU0p7m+bKXDxV/Zp/it3PdrQ6rB0WFNG8+PB4y2ofHGxIz
	 W5p7NgYygPSW4gqhTspubdvLPz/li3bK6T0jv/RwrzV5Q4JVqsLl7B1wr2enT5fsLtKn6
	 hdrLFy5AW2ESVN4N5z2bomHwHT0Jmh2cMbu7J5Xg31g+eUAY/cGYpKY9tfQwWgqYtFDxl
	 e8Ak1avjNVZ5KVEJHYYOOZfzX5KrWJeeINrJNH4bqq38svzTzjNhxyU+bXVjNLxGCAD4T
	 Ue+W4OHSHfKESVX+JA13XAlbi7FbZRocCNkcgJ6KzE7UqTnnfrJOFAcRUISKGEZ2Dfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jYWPiZtM;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CFC606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CFC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jYWPiZtM
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so7057155e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794219449; x=1794824249; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TJaSvhKXpOs4hPW+qhrc6bZ76dM2q6MMdsGYOHYjFdc=;
        b=jYWPiZtMTC1lB+9ahM3rmPP/S3UjVUcqZq+wKSDRfw9xU8z5bUcHf3zg+ZzIOD4+G8
         x2JstWyS8oD7Xq2AdE+5NJcGeeYXxdvhYAwKNYZ6XnEHaOXlW5FDzV2hqqqmdyzpz5GN
         3xeu9s/hssF7zfYabYFqJd3O5dZPsAGXaFd5DTHIkbJxAFnoat4N1VjvToYA+7V+iD7O
         dcl+TQsBl6itTT7g5hQcOhanKOu6+WZZ0z6eTQljil2zx54K8YZvgJk5damRfJzR54H/
         gvrcmaA+nIIKHTDQ08b6p4xZVWwp+GBLm8o22D974volh8lsKb1ktXUqsq+7EzMImENi
         QAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219449; x=1794824249;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TJaSvhKXpOs4hPW+qhrc6bZ76dM2q6MMdsGYOHYjFdc=;
        b=JjJcGfYypgQexC/d8CKFPK77ebc0CV0/lofn7gWIVZJ5Wxliz59+DSNtkvpe1brRaL
         AGXfdrCzHvdziKQQbTWT+CnTXTK4U43YBEq8wjf447nn+7BSzC234DZWsobUkYN9ICnz
         IX5ZgTUsp5/lci8jD20w2l54pbbuhn3JBaj+lGaCW6d64Yl+OCCit+Dc2L/2GO1Dp8V/
         T6e/7pz6I9IJnA8y6FBkw4lvotWDhgNHxh2SLFh+MNNlIU+PQsa3z0e6J0EpEV/kfK3V
         pVC+uCPX6SHnp6FcmwZsUN2uJFpfLGrREn1NW3LRVvMRzxzTiMr8wHWYbIgxsvnwhHLT
         6gyQ==
X-Forwarded-Encrypted: i=1; AL+hErEqx1YtlHlxsVsWEy43Xl1DkIpYQF5CiFZn20Tnk4TzjNPmwHTSTn1nHIsY2MkHh3+WFThPx/r+CVxYGJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WYHOksl0I6L/EnqL8Z7unudfDMUL4/JQQCd+78P99USrirJWJ
	42PfsHT9G9UaiiPL297vnfxDJzlP1ZBrcOjbnMaRZqOdhA0JcQav9N5Yc4Z2c/YwHZ8=
X-Gm-Gg: AYBFou3sdFFas7nYZZiYIG27jZbjvDg9f4PIW6Cs/FaBx0i5BcaJ49WQNTrfRXJwF/x
	sQCbwue0XjE5JeEfzlKCpjKaYB43PttcghaHVfw2JcEJIeUh57V7GXfKQalUcB9tVBZEaHZhFvc
	y/pP6d6/mDKyOTJ7CZxf16jPqKK94lxx/NxQoCbIgXm16kbXADAjKaYVk1K23CRsiV/9zkzGvdh
	JeCLJmh5wX7woBI0O0PD8vSzNQr2N2Bo9gdNjSznEbpmI31U55nTeAlQwzU1+hUeLevKqVO+gkg
	v5XBL0ehqz/lsQEbhPuEBw/OB9umvmt1xkPHHXp19dsbDMNIZ7d+MYrDQ/UJ6npIAHyNjONJL+0
	DnKXKnjJl4x0xcOMqck5gpaguI/JLZPKg+5RR/muuq06v/NQPoUceOKFEn9xX9hyBefMbCl3KwC
	F428ESHVXzZAqE95dLlfyGO0FvXwH0K5JJlfPfLaK9eQuwjIY0ck1LqMuFImiX4ZvHkOBnp3Gw7
	z5WRt8JpalQwUTHGs3mJ9PWYQcyUeGFS/eO+snAL8Z1rghU1fLPdhf05dFjCn0bVOU2k/9X/HUO
	4yUxxasqUG0FANdaEaDlWSjR+bS4Rpgx
X-Received: by 2002:a05:600c:c4aa:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4b963c8c64dmr68512305e9.28.1794219449235;
        Mon, 09 Nov 2026 02:17:29 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm121575795e9.5.2026.11.09.02.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:17:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 0/4] perf tools: LLVM dwarf and flaky test fixes
Date: Mon, 09 Nov 2026 10:17:00 +0000
Message-Id: <20261109-james-perf-test-fixes-v3-0-e8d0a65e618a@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJyd8WoC/3WNQQ6CMBBFr0K6tqYdpIAr72FcFJhCiVLS1kZDu
 LstxkQXLl9m/nsLcWg1OnLMFmIxaKfNFCHfZaQd5NQj1V1kAgwE5+xAR3lDR2e0inp0nir9iKx
 KAFEUOe+4JHE7W9wOcXq+vNndmxFbn2TpY9DOG/vcwoGnv0+j+NMInDLKGijrBrGocna66klas
 ze2JykS4Fsj/mkgampZcxACVAXwo1nX9QXIOfLcFAEAAA==
X-Change-ID: 20261104-james-perf-test-fixes-f72265531d1a
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jakub Brnak <jbrnak@redhat.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Running the tests on an LLVM build results in some dwarf issues that
need fixing. And there is an easy fix for some flakiness caused when
tests are run in parallel.

Assisted by Claude Opus 5.5

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v3:
- Rebase to resolve new conflicts
- Link to v2: https://patch.msgid.link/20261106-james-perf-test-fixes-v2-0-9a912662f822@linaro.org

Changes in v2:
- Break perf probe line (Namhyung)
- Use a software event instead of cycles for VM compatibility (Namhyung)
- Link to v1: https://patch.msgid.link/20261105-james-perf-test-fixes-v1-0-0b279bee5830@linaro.org

---
James Clark (4):
      perf libdw: Find the CU by iterating all CUs when aranges are missing
      perf dwarf-aux: Support DW_OP_addrx locations for global variables
      perf test probe_vfs_getname: Fix missing debuginfo detection
      perf test: Don't starve per-process tests with system-wide events

 tools/perf/tests/shell/lib/probe_vfs_getname.sh |  6 ++-
 tools/perf/tests/shell/record.sh                |  6 +--
 tools/perf/tests/shell/record_lbr.sh            |  2 +-
 tools/perf/tests/shell/record_sideband.sh       |  4 +-
 tools/perf/util/annotate-data.c                 | 27 +---------
 tools/perf/util/dwarf-aux.c                     | 70 ++++++++++++++++++++++---
 tools/perf/util/dwarf-aux.h                     |  3 ++
 tools/perf/util/libdw.c                         | 19 +++----
 8 files changed, 89 insertions(+), 48 deletions(-)
---
base-commit: 13a8d580433a3b72b10be34f0e26787fe5659d3c
change-id: 20261104-james-perf-test-fixes-f72265531d1a

Best regards,
--  
James Clark <james.clark@linaro.org>

