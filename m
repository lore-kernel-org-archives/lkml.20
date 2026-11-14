Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699445;
	b=VFWS1jp/HV9LTAtuZeje6h493gTounl8XQwRj++9tIrmfjAadq6IktvZAXc5WQblqCkr
	 0bpU8Sx0w/6OskDEbJfI+24A7DJR6IcR238tjnw8Yk8WkFNL/ozTj0qS94u4g6sYec7Kb
	 S7A69EKJnj5LehHWH3sd/YPAiD4KOQT1Z+UIMITI6tLCK/56JDy+GM8pEduVxdWyutse4
	 yhtB3DpZJ1QRd/xVz1lGv1hy7THCWzC8vtDjyzCWdnB0TcW5vHeU24m2F5n87JZhTQBsp
	 YYDT2gbOQuPD7bUbPoL1HdQYeRd3fZtkBInZNxbEgBAgGHQRvSUWhkUrms0UFfrajWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NqFBf9Iq5XfpNzEQERkV/UyBTQGdOGc36+bRwxXe9UI=;
	b=yju59Q8Gkf4ZIsdf2R34v6kMbQdTbFb5+XVw+OLEifzIKmPsImuYnU0sRJ1ioKctP9tS
	 XPYuFt5JQEHzgwTrRxglgFTnQFqGBR14swBXGorF2kuZW+Srnj2BQNSJh1RKRCCyeatOU
	 TbvzLGt9IC9otLAjG8yiuZY06sORyOSvtcnB65XFfNO7+6PtDVPdpbJO8EZStHON+22Ui
	 ekp5FlZYku5fBCLzGkKCt6ozwWFnc8Dsf0DbZqaG82DUxvsTmd55NEen5bvtr3/kVK+6i
	 Xc6Wh7OWKPgaPtvqbTUnmdCn6OGn1qP+YSB4eaY81VXBZWdqQitcjohY2twsS7AECnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmaHf8KU;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C19606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C19606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmaHf8KU
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so885902a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699444; x=1795304244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqFBf9Iq5XfpNzEQERkV/UyBTQGdOGc36+bRwxXe9UI=;
        b=MmaHf8KUq5AIhEzi+DqfX5tHF5/BQAmuFYd5HbFZ35qCF8G1MD2b4r1HkiXs/wmbJk
         TLHjqASWGiYG5vIM481HsaBYGD6KCX0wRmO2PZFmxwbAAFGwBJUZOlsFRgD+BmXKlglD
         2LjOBCaTN/X3uEz5FAghenKgOewqdZpMmsrrVHC9aylgbiKxFYwQHWy9z3+BFrqsq6Hl
         2nfFVzVHG/wfObJARs0K9QOXTkfCWxAs8Lm4SqesVYWgoCpWofPUPASxXoNwxwjK3G4A
         P0g8Ol1fpGOunlJj/KW4yNPvV3TNbBFRkDPNyf5ht4NZQ6mgSqi19vjLAugL0PQKiMOM
         JB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699444; x=1795304244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqFBf9Iq5XfpNzEQERkV/UyBTQGdOGc36+bRwxXe9UI=;
        b=c8dssg30jcoTrW2KcwFJRxLkUBwtAVxN7+5m57wMHA2jAOAzLYYdAFOQtgRmPn+EaV
         LllFWnL8aSnt1il0mlHiREOfCD4pWwiLbPXqlRJQuGXpbBRiZOFLcQJibjdenNe6CBj2
         SHbZlS2O5TI9peXmquyMevPQGC5BRrKAlnonJnuvnW6wtRPshHvZB3GtXH//+6FxqPf6
         0rd2kZOBxsJHiHOgzyAR2iLnFAXCGTx7wdYoUZrJ0J2wuQptaZQX9h+Wf1cTKalTeByd
         cDSN1qBzqhTvhJhOA0+rjRAun/4MHCPfXtmviyfdhbQD0FctBFG00l8AOPCksBbEWHDw
         pvWw==
X-Forwarded-Encrypted: i=1; AL+hErFGIqGLfFQsyZlBLvHsiquWinoNgyfnW717Z3bQYXASkjdo5md3LzTBBHQBgIPmKsjeP/AVO308B9zSYdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z81ZzGk+aEYhzUhOjiwWrA30Iz7cHDUfoJ6P5mo/hfFAVB64Zpc
	UCecDAg/VXUCUb2ckabS47T5AgP/MMuY3dWzFovxHfqlsKpykxOhHguv9scU2g==
X-Gm-Gg: AYBFou138yUAjsRSzhxmtbAMFhfYb7pWiTR4upKbYIt42be/Kg3PX/PCHcCcZST+MJU
	WPOqEmTFMsSGI76mJZrp19N5QqF2L01rwVXJbpZQ699skzFG1fp2RjuHP0B3e9jOC056Ys+LifO
	o7akN/H1w31s+OBYIvFI0JsVH0u3SDXJ1vkAmqRiaV0LqevtU0y1shDwuS7rw11s9/zsLKDHNH8
	dwzTHiphQ5DbJ+xT0tGSlwBL1hlYDf70gv0YvUw0u46AlQG1/2rTEM3FH1Xx7IUSYNGpZHPOvzT
	6m6KtVEZEv0TqmLuI6QzyRM4eVw3tC7UBakkcFVXWbfngiIS27F8EF5KFoyg5e3tPQwnPz2SQFg
	8zCP6cv58QiBFzrFAsmSOBvF7mWq0TMpm79LiRs0av/9Fu3FKfSxO/bG4uckOcZGSLtA4tfPhFQ
	El88nW3csAcE8oH81UWKbP+ugPciRBknbCNO0jrrGLpahqfwjo9etbdwY5CcQFJFETnSMnEHSg1
	AqoTydbKTpa/7VBqKuPWAhpvGYaAehXpC0SkOjgLhwnrJmpiaw0CXUqAgLsK1fIVJVKZhakiVkA
	gGThLM0XEqZo+k/foXPqMqqoqiRUX3MVLJPhDhJAU03wA88dImtB5EV6hLl7Ko2/Vr9j6GpJd4d
	gy6ta7eFBNJs8BJycpGppWsJJcrJu7YGqWuuOCipwo7n6DORO+E8Qy5HxkGz3nuz2MB52Hxg7O/
	6XvQ==
X-Received: by 2002:a05:6a00:94dc:b0:886:a52a:316f with SMTP id d2e1a72fcca58-8beb2e7e862mr5911125b3a.4.1794699444046;
        Sat, 14 Nov 2026 15:37:24 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2d0f473sm2306372b3a.53.2026.11.14.15.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:37:22 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Radu Rendec <radu@rendec.net>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 0/4] irqchip/ath79-misc: probe as a platform driver
Date: Sat, 14 Nov 2026 15:37:14 -0800
Message-ID: <20261114233718.86520-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The MISC interrupt controller of the Atheros/Qualcomm ath79 SoCs is
cascaded from a CPU interrupt, and all of its users are platform
devices. It is still initialized from IRQCHIP_DECLARE, before the early
initcalls, only because the MIPS perf code asks for the performance
counter overflow interrupt, which goes through it, from an
early_initcall.

Patch 1 makes the MIPS perf code look up that interrupt when the first
event is created, which is when it is requested. Patch 2 makes the ath79
MISC driver create the mapping at that point. Patch 3 then converts the
driver to IRQCHIP_PLATFORM_DRIVER with device-managed resources, which
also fixes the leak of the register mapping on its error path. Patch 4
adds COMPILE_TEST coverage, which a platform driver makes possible.

Patch 3 depends on patch 1: without it, perf would ask for the interrupt
before the controller has probed and would lose its overflow interrupt.
Patch 1 touches only arch/mips, so the series could go through the MIPS
tree with an ack for the irqchip patches, or through irqchip with an ack
for patch 1.

The other users of get_c0_perfcount_int() (generic/GIC, Malta, Lantiq,
Ralink) return an interrupt that is set up at boot, so calling it later
does not change anything for them. The perf boot message no longer
prints the interrupt, which is not known at that point.

Tested on a TP-Link Archer C7 v2 (QCA9558), with the device tree from
the pending series that adds it: the MISC controller probes as a
platform device, its users (UART, GPIO, watchdog) probe with nothing
left deferred, and perf record gets its samples from the overflow
interrupt on MISC 5. Each patch builds with W=1 (mips, clang), and
with patch 4 the driver also builds with W=1 for arm64, x86_64 and a
non-ath79 MIPS kernel (Lantiq). The v2 change has only been build
tested: no QCA956x or TP9343 board was available.

Changes in v2:
- Patch 3: keep the MIPS timer interrupt enabled in the MISC controller
  when probing. plat_time_init() enables it on QCA956x and TP9343, and
  the driver now probes after it, so clearing every enable bit left
  those SoCs without jiffies. Reported by the review of v1.
- Rebased on next-20261112.

v1: https://lore.kernel.org/all/20261112224445.213324-1-rosenp@gmail.com/

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to write
the patches, test them on the router over its serial console, and draft
the commit messages and this cover letter.

Rosen Penev (4):
  MIPS: perf: look up the PMU interrupt when it is requested
  irqchip/ath79-misc: map the performance counter interrupt on demand
  irqchip/ath79-misc: convert to a platform driver
  irqchip/ath79-misc: allow COMPILE_TEST builds

 arch/mips/kernel/perf_event_mipsxx.c |  30 ++++---
 drivers/irqchip/Kconfig              |  14 ++++
 drivers/irqchip/Makefile             |   2 +-
 drivers/irqchip/irq-ath79-misc.c     | 120 +++++++++++++++------------
 4 files changed, 98 insertions(+), 68 deletions(-)


base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
-- 
2.56.1

