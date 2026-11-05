Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879132;
	b=iSlMBNbBgRAC+buMovuXZLke4c59Id9m5b/cDCI+rb/803GYHRZKpiDdVWsJbXhTyJO8
	 FyFt/hwRz2ljKYaq/Qwlv/zs/VB3Jv5zGKyC7FSV0OKNtDlpA0BapMJLEd76LaCgKLxpu
	 err9MeIiFENt1NQ9YBefFIIAz0WPXf/86tXwUv8cpEOqCYbXNQm/6XImyQcuksBpBOk+K
	 hMUHSSg0QdH512le72oYUY8h0KIP5TydQYA2tOKA3CEa12X6G6YBtYFl0z6+VsBMk7JN0
	 jgetNiVXqlCHXuZtrmev5EGlwXkxMQkxW9dbNTsuNqaTsU2aCE1ZtN1yQEdeD1KXACg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=z49MEnSEMTTPulUvnX3mC1j6+RjZ98X7wWOuw2hUt64=;
	b=zIdMlouv5h+u2l0/NoDK8w5+IRqsauHhfOcm8RhI9HOJS/WFtrP+kG8yAH/1MrHSvlfP
	 XxcG8MpYy9aaI5W6FWIlA6J/il+WgL7GnONf4os6te6fQQ6FfwsaghtaOY+wE4ev3o6LA
	 zc/RG2ax93PKni4uxJeCwXV2npxDlCvLY7GBXo7QlodShH+dfbJ/GqvMd2SPlnWjJsjqf
	 B7OucV4KQ1zjJD6XIh7dmHiidqkUiFdcoVJ6cAqa/a3RxcmUZuuUKkx2QHfA094+miCbP
	 2SEETugw0qNmCXs46An0/3c4VC1AaWZgT8aAfezGWvAFUyLCMbptqDzd9HiVGjy/jJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yILaHeZc;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570D160A381D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 570D160A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yILaHeZc
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so10752605e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879130; x=1794483930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z49MEnSEMTTPulUvnX3mC1j6+RjZ98X7wWOuw2hUt64=;
        b=yILaHeZc6PMoxawalEI2guQkSUg2FMKKo5Cp/DrUT2PIApDrUgx3D1dK02yTVA6C2x
         AmNBh2iGE6RidU1GP2wSWZcmfi9lWE1XETgYPPHCX3f/rmgnP9XR69UtHvWzy7AAnWgw
         NLrwh9FAIM5ntGj/x1V77QZGv6DoLDTxED/l/RhCA90JIL4EDtoSwIq1yh+xFLEDVq3E
         vvTkP4dbciCHCDu/UzsArZww27OYuuMrulZhNwY23B9fSKc9pzAYs5souOzEQqEFrqSI
         RKrXWWp4ZF1L6M/HYavQobB0xU72oPgjasPU1RyLF87EvMLfZZGtez6+WPWmmFKvJTo7
         owUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879130; x=1794483930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z49MEnSEMTTPulUvnX3mC1j6+RjZ98X7wWOuw2hUt64=;
        b=sJtXSQlFGM4//DR7Aa4TLJF+gVEXRw60rJSlzUfWIHmkhyQVL28MrvLK9t2TsDgPfT
         aPK4PAxhNIkFw6peuOcmhnPrDNRchZ/W5/xjk9wKCCIWsg3gvv1Vtf3rm02s/6FKkbXk
         ewuvXX7YWSEKDEYpE1aOX1q2TXooHmysceN05h74cHcAwu/IkxLtbZKCFoxS8g4slzhv
         xaEr0YrOyy7RVOs/bTOoEflF1MI0NjJjqzZ1g1Ip6g018MnqyaESPCjOIKkL6OTa3dY5
         HnkR+yrTquRRzM21bod0MlaPRzs1s+k0wDdpIvz3bWPO2X6YBZiV5H+KqGhw9LP18wxV
         RD8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzlh4MFO219psjsPOmXIPmpxkD34kic+j8l0wAxkVZ4BNsIND9+nR7jLJywgQ11zcuwj+3RWOqgy+vQePs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wsWzezSywQvM/AryGkS1z9vHtDJ36sGNtxlMt8LlJs3oltouZ
	zyXSqRAM0heCVRWUAHb3voEphkK8q2iS98oB9hjgkWlcToXLg+NCdy4uG0Xeq5YcC8Y=
X-Gm-Gg: AYBFou0BxN25aggWmh97snw3J69JOBR4dFRCMtvpMpuSUsL2rtQTf0NyWCGUbb17T25
	vNvDcT3AJdk5JEocfOB8Oy1ngWZBOSsFRdZ9UAvIXiUzj0ZAsMRQcdUmwY5ZzwPx5JEmUrwt4ac
	rHnzh9a8pqMQLInkDJnDKMswxM2jtLalKBa4FK9SKhTT3RmWJTYFM3x89+fkOA9MrNPICzACK7V
	8FYKBvQM75nwjgHyq5MWTpPOvs4RC/nmK4zq4dVfSj9Z0+xJIGHipj4XvHERSax1No9AtIUGiuk
	mG036NWurdFO0KZ/8Tf1W/n44zxDFY3EMxTQ+Fp6kxPWdalUCHnvAtfbKAeQC2UcOwF3crT4dLW
	VTklCdBDg1Y3WBq+RzBlkMZC29ZKIaYp8sCmEPbIY14I45tLcA2WP/De+2pkBSxNKztdonW3fJN
	TyaOCSajWtRp/TlLxJ66BhGZRV/yLWfMJfq5L98cEmv85mXLZT5ylEJKfdRDeq6GJy5As6ZJx4S
	eXaPqJgNtd8BCynLeUQaDs+apJByZdqLa8ZJZkKHoHPejGJ6COx6Ot2wzlAJVuYUW13gD0wxqa9
	DzyH+kTwk/1wgw7yHvsRg+dvc9vavCJK
X-Received: by 2002:a05:600c:83c5:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ac1970b976mr357815775e9.33.1793879129751;
        Thu, 05 Nov 2026 03:45:29 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:29 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:56 +0000
Subject: [PATCH v4 08/19] perf cs-etm: Use instruction length in
 disassembly script
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-8-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

The disassembly script adds four bytes to each branch sample's IP to
include the final instruction in the range. For an exception sample
whose IP identifies a faulting or interrupted instruction, this
incorrectly includes an instruction that did not execute.

Use the decoder-supplied insn_len to calculate the exclusive end
address. This preserves zero-length exception entries, includes executed
syscall instructions and also uses the decoded size for Thumb
instructions.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/arm-cs-trace-disasm.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/perf/python/arm-cs-trace-disasm.py b/tools/perf/python/arm-cs-trace-disasm.py
index 5a7daf927bea..7cf0af5d2780 100755
--- a/tools/perf/python/arm-cs-trace-disasm.py
+++ b/tools/perf/python/arm-cs-trace-disasm.py
@@ -315,11 +315,12 @@ class TraceDisasm:
         #     [ sample_prev::addr .. sample_next::ip ]
         #
         # sample_prev::addr is stored into cpu_data and read back as
-        # 'start_addr' when the new packet arrives, and sample_next::ip + 4 is
-        # used for 'stop_addr' so objdump includes the branch instruction at
-        # sample_next::ip.
+        # 'start_addr' when the new packet arrives. Add sample_next::insn_len
+        # to sample_next::ip so objdump includes the last executed instruction.
+        # The decoder supplies a zero length for an unexecuted instruction at
+        # an exception entry, excluding it from the range.
         start_addr = self.cpu_data[str(cpu) + 'addr']
-        stop_addr  = ip + 4
+        stop_addr = ip + sample.insn_len
 
         # Record for previous sample packet
         self.cpu_data[str(cpu) + 'addr'] = addr

-- 
2.43.0

