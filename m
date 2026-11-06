Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962117;
	b=xjdmk2T8UnuktwcuKjmIcoOSQxmZa7KedGeaNB1uwvmtPJuysybTNO1OQiI6s8xYwflC
	 zM+LNxnklh8Id/TIymbHLVylbJ7AKMEdPMsCZcWEwy0DNm/uDECu6fhOSJf+E+1yI87LO
	 oq1AziHj1TaOhpK4MhDTLnKXiEDnAUvMY7E7qJ637mQmBd5N0E+M2tdjAEQ61ia87cK0W
	 HWS/nC7lB4GzzsBmrVQbd2cImWblql9yCmtaaWcNWLl1dy++xz5d9SXh0w8Q9I7h5jh6T
	 t5zSgemV3iE+fpe1CVfhm9gaRgQ4Dts9EhfZAFmgI9gFAInzkZzi6LR2TeJyxCTV/xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=QPhlS7hNAGme7fTUkdKF49UIBocGWfyVeEHaKEHHT+U=;
	b=4LyuFsI+5Fbeg11i24r6byLEbEP3AC+wu8JF0/Te3qpUovgLmU8pcjg0g6hpasTUUvBT
	 r9kRWwQbJfBvWVQ0xS0UU3E/4S2+rnuQOiz+1U5+MSvZ4LlNPBAosWBW85g5AhW0tyClB
	 ferSHzUG8MvVBpDtp1vEuy+965Kr042+8JN3feNS/oMbAITX+HaGrpaFaT8SO44izUWst
	 j8q+GRFAPvHBJTt9oB4T81pFPkXs5mQ9eWhpNsYYyheDQbMqKtHf/X6/5z71dJSY1JbDp
	 LHmy47tI6MRMxTv9ejJ4ol4ahFLuq/buLtA3wBcsQZ1R2nc88ZwapZIuIDzpfb3Zgtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a7nNAOzt;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9DD606D823
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF9DD606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a7nNAOzt
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso2183615e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962115; x=1794566915; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QPhlS7hNAGme7fTUkdKF49UIBocGWfyVeEHaKEHHT+U=;
        b=a7nNAOztDIRAE0EaFYTkDJcetY/0vMZ8fv5QVLf5WAQ3Y7hpF+2H2986u3hs1dqCAl
         8JMPZtucl+vr1+4+XUPYD6pk8J4GFheRRdMSK5hEDKlD8X5zLaoUd3aL+DXG/ix2O6kC
         5O7Av9rGcjzD8dVi6YFTOPPSmrEN1L3jOb37UOMuGZ70gv4Qy0+/Bt7h88PvkjAHQobh
         7vHQdyNPgk+X2/zCbBa94ASwRIJ1MOq6XpedM6w8Uw6Elf7e3BaPucgQy5Pno0Lmf7QK
         3OokzOpOu/QYTUeAkDNtaR3SwHFDSBo6qYoJ5PTtfQB3UCzzT22jqTTmCs8XKoY23IpR
         7qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962115; x=1794566915;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QPhlS7hNAGme7fTUkdKF49UIBocGWfyVeEHaKEHHT+U=;
        b=HCQqEO3IEgikbNip4QSeGFU1K8HJEsa77O/riXIslPDR5zSK1CxtYak2EY8lFyNNWM
         cXPrVthTN7vL0IaAHIyXKc44dln+KESvtj4I1RdUD7hh2kKWI/419JpGqGu6k4/Qr1vq
         TjqJ3dWTIa4YBw/W/iXWquo5HDainEVgCiCAJ6R1JJUGtYaUGDwlYab8Y2H+emXqU22L
         whmv9QAwukSsw1T+0NtbxBwHzhni3spmkHiPdY9BV2bcjKxeHt6esIHmLgMnhTiVSNNm
         +wT++XPo5/DKstZWfdYUW30LCuIDNZVu90sa76xUc5HEYNyLDbKoyhCR+nF7+/8a1Qqj
         KUbA==
X-Forwarded-Encrypted: i=1; AKwUvByUL9KGpMq7bpIyasKcBDRMGkaqK3hl8bmNkGlvGJI5GqpTT0g8Jv9UNVoErDEkyKH16Oheo/L5OiwXfzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jLqVFw23nh5jIWWMFLxCtDBUhUEM43zgjXCRpfGqQJgMBgAfK
	zZDKKRJotXg1nHcnce6jKivhlTN3NuiNb4ESnZktXAJmRYKiBGmEVuG2XacRwMBxynA=
X-Gm-Gg: AYBFou2y5DkYEeFJmqDZ2na8F/4OUZRqia4UZ/QUOT2EUMJwFSUwri2Ka9ZNJgBqP04
	kbODuAZKZu8XLytJb+sbvvTWWUGbC8ykYXPbV5oP9STbG+sYncLSF63jgpLXCfOBaLFRUw8RrAT
	Jc/5+teXMtuC49z1nLY36ESo9Z+PMnIqp8KNZ5w6d8RNdTyQAIYkFbuU9JFAi2ngFpvBt0Hnjgo
	2LIIsYfm3I7Pxg3L9UKSVCJccJD95QwAXZeb8nbTmEeouUdqpvLNbH8UyC1nGNjU8W5zmUP9hhK
	3u2LebtFh9VlxbKBB9BSIf5rFWqk2EUva7QhoOvutQWY2cx9B+wWK/qOx3ccjXbDwQCLYkMklcr
	UuJwBYdRFnM8cFX4xP1iyPjqtWANFClaQSSfY9+WstvKNotE8ffXDfSa/hVyKjGmB9OEpT0m7O8
	ALAvH0rSEdSm90+VJMO0ZmUcw3qIK0eJrmDjP7mR4dvgaY36k5Q05f233aJdTK8tIqOy6Hwb5Vt
	YbYLPryGwths6ffQ5BQHAExrNSJ7Rt6lizcClobgGmyXQzTIw9dfg/qEIjTYZkZvoha420GJybV
	srcVRrtb8eKSphjmWo0WCfrdYOWDfO5n
X-Received: by 2002:a05:600c:4e14:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4b6df8c9443mr32392275e9.18.1793962115177;
        Fri, 06 Nov 2026 02:48:35 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63ae2sm3232248f8f.11.2026.11.06.02.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:48:34 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/4] perf tools: LLVM dwarf and flaky test fixes
Date: Fri, 06 Nov 2026 10:48:06 +0000
Message-Id: <20261106-james-perf-test-fixes-v2-0-9a912662f822@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAGaw7WoC/3WNTQ6CMBBGr0Jm7Zi2WFBW3sOwKDBAiVLSqURDu
 LsF49Lly/fzFmDylhiKZAFPs2XrxgjqkEDdm7EjtE1kUEJlUooTDuZBjBP5FgNxwNa+Ire5Upn
 WqWykgbidPO1BnN7KL/OzGqgO29nW6C0H59+7eJZb7+fQfxyzRIGiUvmlItLnVFzvdjTeHZ3vo
 FzX9QOtSMu4zQAAAA==
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
base-commit: 29fd95dbd25cda35ac1e38d096a85809e952274b
change-id: 20261104-james-perf-test-fixes-f72265531d1a

Best regards,
--  
James Clark <james.clark@linaro.org>

