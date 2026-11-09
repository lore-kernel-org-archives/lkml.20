Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232103;
	b=dPkKCDiilQfsZad+pNZeoWTWRMZ072krWtmmxFh0xesFu1Il5E9wCteBqfCDeJ2HU1Yh
	 ILhD6eip+ubiUSt17t+NzJb9wEyV7YpkpDYF5Fds0722T6bWQYTRCNP56xjI1PUKX2uml
	 dYlx6sUluewpRWkT3PBXEYRAMEirzXf3oewzUmEO4S0CqtbeThJnmUIUPh5rU3BVEsS1Z
	 kNUb28FJZQZnHaWpMlYkF5uHL+9LRRDrRCbdwwkzfcmQj7ATPGtIX3VIVf0CM8g+bugth
	 rTP2sIb5OoH7bQrhZNs3E93IeXbM/JMN6TeVZsugXLmda3KM/cwEhXk6LLebYAVSBTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=2xFblzM1dSzR/Kh3l6RiwUKC3aSm0Lww3LXjNnffbow=;
	b=tOyKZ9PufncAgwzSHl5CZxAY8iUQyLXucA4KNsJeYDdWux3e71k4rjODT3w5d9pWRdh5
	 TXz75aQY7Wfc7SDMCYh/QTCFQ1ylY/sy+DRqxYpALJyQkFrQERsWMhZqsBF4TgMs9uad8
	 TOGsfqBDNxD/cg7pnrT358/Um+cRVjirSkI03TIxuObMp7+OC9OMPkOehtBlK8dMzBS8j
	 YElaqadF/5uPCoKkWmnylfrOQaDTDZ80lVqmbTd+rqLi3scyoFpvm19ieNkiskcljn1b/
	 yEf+Ux8kFrKUpRG7BQmViwruYvz4q0+3BQo0px2mxDOovoa2SlOq/RJMXtGSX5EGFoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LuwJxS0W;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B01606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B01606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LuwJxS0W
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214af2076so6364775e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794232102; x=1794836902; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2xFblzM1dSzR/Kh3l6RiwUKC3aSm0Lww3LXjNnffbow=;
        b=LuwJxS0WW1EpJ45qqhmjeMoKS+KeGs6OBOKD25AdVoZ7hmTx9JNOSapXm/pA+abz55
         B3zD3MyB+swCViEi9CuJQoNniMI6hYQsrsd2ize6DNka5kZDiet4m9hbXxPYaZ6Jm0xA
         WAvVMuET5F9Fs589JOnIykSJ8v7EcRa84JW5ZQx0J2Utz7saAQnTZ2JK2zu8v0aFPfpD
         FY9jP1vwsdPUYE/Fq91Nf4BwHJoCKZsaSjt3LGDHIrwHlDeYxaCW+onzkczZZuvBLnWg
         m9w1kmiCCVYuxMB6CLBCAXpQj2M7PYShNcEUFLwM3hK2yxnRAxzJ+6QXyO4rlt+jw9cw
         cSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232102; x=1794836902;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2xFblzM1dSzR/Kh3l6RiwUKC3aSm0Lww3LXjNnffbow=;
        b=US1YuuhjpS+2kk83+fWRiRYl66QMnaswEmTrZMHiSds+TSyivbgZF/43HrG/X64dzS
         DtubWc2yQNwOQQld170bhQJ0h5OuCzipUTxZ+SIJP+aPLvBZ2pGHOt1Z1wJfStIlFZhy
         saNwQXPUAY/hVkLbLRDyUOl+HRhLBkAQzPGhw4PRdpE0RZDTKU63i11yGUPvotcA+WJG
         EDNbAZiVJaeUx2WM+gxfaEzMYJjB2dHvToxDuIE1VrJCQ1U+YNIsRdPSo7vbOM1Ngydl
         SB4HyXVVy3IwBuwQAcLI9nnRl6z1k4pUduZqpLKeS5wFzBSq5eJAN5Bv2etGRaDwht54
         3AKw==
X-Forwarded-Encrypted: i=1; AL+hErF0Jl3pYzI3CX+b5x4I9ncydRv1sqjkt1Ve/GvoMRp+WYQbPwHFioSnTJYjCKuCHYhWmfR938np7j8HBRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DVOSkmheaWpJgKEUGUqo2sjkRL4NiCqt9QPmV2f5xaEPxk69g
	2P/zt4IX7XtF3jUhWOYd5Nh47Iv8hkDzLH8oPHnJ+i08/RAiayjh6CB3z1PtZHmbFTU=
X-Gm-Gg: AYBFou1gOHPjBdtJbcGo7bkxbC+P5RBJmcMri1CcoE3mnNBSVSTBse5xFfcTDm77Zmu
	7kRgbrc2OvkMekfObmfRsLB4o6O8Tiqr/SzQZo6pxpvmyJWyZ/wh6vrH7ryRY5+tsZ+t3X67spG
	oI3sLPWcjAxIfEVUzr8IDgpTfSXJi/jkquAtM+0jSrMpE0KHL3ACkxRyUeDeCIGHCaVZyaOGIY6
	wBdDZhkqpl1XZpq5fyw8LBKOpRpyHvOxClTylswpOaWZW0EqoDaW3OfqIGJHWJEgmJ+GOiryrvQ
	KmcdDoHMQfOAojqsm5y9iv8dm44xmFEpzUvyAyyIJIJDRPDJ3QJe9YmTKyVt0i2k1zkX9zaOS3c
	8HDFND22pDXE7R2/ERrikcY6dkgPS4RAO19yNW26WWqGevX4R7yWfPQHDTZ7ZDWrLm/AD4sv7QJ
	aSpVs2utnvqmLRV/u2OLEEKYaC7QIGsRfTOZNoUvrjx2fQnGeE5Lhlhcf+/nUwvvWCA4oyVDp+n
	8FMqEaNZ8j3iMK6nqkbIeZw+RptBehPL2Y44A92hX/PirS/g2x2tl18zvRj7zShDVPDMxlVbGj4
	f/+ZwvK9ySd8Eqrn1WIXI2zahRlKU4idc+htI5g7AWuCxg6pEUyQ9w==
X-Received: by 2002:a05:600c:8b72:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4b963c953eamr76345915e9.35.1794232101787;
        Mon, 09 Nov 2026 05:48:21 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm98522045e9.0.2026.11.09.05.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:48:21 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 0/4] perf tools: LLVM dwarf and flaky test fixes
Date: Mon, 09 Nov 2026 13:48:07 +0000
Message-Id: <20261109-james-perf-test-fixes-v4-0-355ee6b81917@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIABfP8WoC/3XNQQ6CMBAF0KuQrq1pB1rAlfcwLgpMoUSBtEg0h
 LvbYkwwhuXPzH9/Jg6tQUdO0UwsTsaZvvMhOUSkbFRXIzWVzwQYSM5ZQlt1R0cHtJqO6EaqzdN
 nnQJIIWJecUV8d7C4Hnz1cv1k9yhaLMeAhY/GuLG3r3V44uHvuyF2NiZOGWUFpHmBKLKYnW+mU
 7Y/9rYmYWSCLSP3GPBMrnIOUoLOAP6YeMvke0zsGcwqpqRAyTP1wyzL8gZmUBJTWwEAAA==
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
Changes in v4:
- Remove unused add_probe_vfs_getname() argument to fix shellcheck.
- Link to v3: https://patch.msgid.link/20261109-james-perf-test-fixes-v3-0-e8d0a65e618a@linaro.org

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

 tools/perf/tests/shell/lib/probe_vfs_getname.sh |  9 ++--
 tools/perf/tests/shell/record.sh                |  6 +--
 tools/perf/tests/shell/record_lbr.sh            |  2 +-
 tools/perf/tests/shell/record_sideband.sh       |  4 +-
 tools/perf/util/annotate-data.c                 | 27 +---------
 tools/perf/util/dwarf-aux.c                     | 70 ++++++++++++++++++++++---
 tools/perf/util/dwarf-aux.h                     |  3 ++
 tools/perf/util/libdw.c                         | 19 +++----
 8 files changed, 90 insertions(+), 50 deletions(-)
---
base-commit: 13a8d580433a3b72b10be34f0e26787fe5659d3c
change-id: 20261104-james-perf-test-fixes-f72265531d1a

Best regards,
--  
James Clark <james.clark@linaro.org>

