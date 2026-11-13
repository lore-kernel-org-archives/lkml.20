Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794612847;
	b=RMYJP3z3d+8+gVzHfoOLzTEWCFCxWvUrPLPfTVfOLqNyEfhZKTNAUjKsEkCWbQoMN0Rg
	 9g5cjS+1F+XQa4p6QLpWHHvwr+NHiaeCp0lY4wUXVr6+GFJ/P4F+3U8nstHOEUqchAVSz
	 p8Ayve242C1krnsbEVR7cMRPfRkdk8nVzczU34d4FbiDIDoTDVSa6h6jc7XMNBPOYF/Kk
	 l/O9iB0wsYV+SuJECC0K2O2/UyQ5YeavYLv/Hfw18hh/3vx5REIzz51Dz54nlBwU/jH5g
	 WbCsW6kj5PgU1+gd6hvqssK2+4qWADefr/jehTnyIdAVb9CCIMwYsIWQpXa5jX9dMGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YtlPe71UsmVz9h4+BFpDabZxVBkWd1duDw8VtWzU01g=;
	b=ob2rDSzsuiTKJptOQXhjLaqXSEJe66IlgZkFU6fjukx4AzeFRFMpSWHb51f8TZk1LW1C
	 FwGLXYo8YzvL67VviNm653NHh6egt4tQ/o3m2L54w1vwFXEbAioYR2jF2xZuOqisk0u63
	 3MgMRYO+Z2cafngfsTBcfKr5pGKmpon64m3oGuEPvOj1qjSt+ssjXcQg4qwg6r1R8sst8
	 yRqVK7V9lVlKXc0ekK9ZpnErCQzhGEXqSGxWrqypfzDodaR9Tu0t/FKXJ4M3z1KWgWkFn
	 4ov86PxusIQylldyv/NlXHwTSGys3sg8zDH/65F9fj5uaTEkDolCs9bcYrZBtdX+29A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tACVrlV8;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100EF606A882
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 100EF606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tACVrlV8
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2903147eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794612846; x=1795217646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtlPe71UsmVz9h4+BFpDabZxVBkWd1duDw8VtWzU01g=;
        b=tACVrlV8XJeZsjfryb//f6qThpcS2cr5CPmVJSIUKq6P8bH5fo5gZO44daC4NdXhFT
         d1abIWSJRrZ56MtxEXnJFckn8bM9+vrbUJnw5b9iE1p17AYCSzO3fWLeCo6LBp3RYP5Z
         iO5DNTyHUxDctkK1mGgP4eYDZHXUt4q/BrqTa0AkuxIL7zFuZnETldAFbbslNegko9q8
         dxwB5OsFyrEYwUiiJ+SjXtal/X47hI2OV/t6aXJK3asAIqlAJP0RFQf68xARsZmzQc8k
         xDN+kw7riRQngvEcj7KueF/7yHCBglad8AD8oRMgubnfg6ApQeWxwUKzcptAo5j8kMZB
         MOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794612846; x=1795217646;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtlPe71UsmVz9h4+BFpDabZxVBkWd1duDw8VtWzU01g=;
        b=2npPn1h12NxuHV+e92D4Czm25lhP9x7y3OiqVJq5FkrvZlhEiFEaa522hXpDwi3M2d
         PCBuFFNl5AOvy6jrNJvjRgtqIructC96aDH4hJ6nXL/DOwBauKxR5joM1Th/IcHAxbgJ
         w+LPCW3ctJpZUCVb3lWcwsNsliIWfopdyQyVF3n3LWCqq2f/jurfLjxZh8IpFOlMkS2g
         e9Tfmuur6LP6cYYAPXyh+1fTIE0y3hhaQ54APEL2BkEGvx5L2XVk5Lv5unoCRNVhjyFK
         ShMrixAZLuuoRIOT82aP8f6Kpz28VWVDqowlt/9J8anBO7qZq0bzFsF2wwt5O4P+d7RT
         EoPA==
X-Forwarded-Encrypted: i=1; AL+hErFQBY2NHcQZXriHOsYPmDR6LZMden3L3/4EOIBIw+8zgCX6LhX6AWbVDLXBC3OCQEgoYUInxuLYxogdRg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9a3FLYLrK7xcSsYfscGlXGGay3uyrFN3KQLTD2gcegJ0YqEg+
	fCA2JzDSPaVqSJntMYHMHBhzYOZ1K2dqtKelpe0fabKdZkzUYCaecQwG
X-Gm-Gg: AYBFou3IFS2NSMfXRRTAQpNZlxe0SRtkzPtn77y9PIPQUPHKU/UJwt/alcZx/uV+KCJ
	2Esc5je/wfMKV07uP2o9R4XkujRwKiWDd8wfPitFvZncq6/zuzeon61T47cXRa5E09Bg7Z/+x+N
	mPLQ6v4OcNZKJmEtpkpihMDoBJkL8iUifcmXKTpnFNX5cS1SZz99JV0L/efaPu4RuJvecoM+T/H
	Pt1/9cmOqP7k442ZPYXT30VCH0gAQT47agBvfDzMVQosqAFJGgdNlimL+bcsrgtXHquxXNZ479p
	X7ypgB+uzBznMunxCCSJ22/87ruex834cq3jxol6BOoFSZCqlZx/SuHcxbbVNee4wMaA6Ymh44m
	r8dR1sGXEelb/hFXTB6hVt0R/ZnCPYRos23UfPYSN4bBhQs1MEoFgiGfSEF43SocQMPgrYlModi
	JcmjeWaSCwelQA6uywmWYup+21EtPDRwkF5YKetsj4tUS4xWPT7QAedsm8M6zFzKsz2MIO5st2n
	bZWR2+B44I8jCB1KdT+Oeqv+Y4nXUAS5NBG3GwpQ3NHWEMIchnRrhAQafVwEoFuSsr3Aw2vXktY
	UFzi8LxQ
X-Received: by 2002:a05:693c:8208:b0:378:314:402c with SMTP id 5a478bee46e88-37966e3806bmr3520013eec.28.1794612846033;
        Fri, 13 Nov 2026 15:34:06 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm10726041eec.9.2026.11.13.15.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:34:05 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v2 0/3] MIPS: SiByte: Add HW PMU support
Date: Fri, 13 Nov 2026 15:33:53 -0800
Message-ID: <20261113233358.538698-1-f.fainelli@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series resurrects the SiByte HW PMU support which used to be
supported with oprofile but was later removed.

Changes in v2:

• Preserve usercopy fault state during callchain unwinding. Save and
  restore current->thread.cp0_baduaddr so faulting unwinder reads cannot
  corrupt an interrupted usercopy’s recovery

• Balance PMU event initialization cleanup. Release resources exactly
  once on initialization failure and install the destroy callback only on
  success. Also check event type before rejecting unsupported attributes,
  allowing unrelated events to fall back to another PMU

• Keep disabled PMU interrupts masked after EOI. Add an SB1 IRQ flow
  wrapper that reapplies the mask when interrupt work disables the last
  event; the generic CPU IRQ EOI would otherwise unmask IP7 again

• Fix a documentation heading underline in sb1-pmu.rst (Randy, sashiko)

Florian Fainelli (3):
  MIPS: SiByte: Wire up the CPU interrupt controller
  MIPS: perf: Add SB1 userspace callchain unwinding
  MIPS: perf: Add SB1 and SB1A performance counter support

 Documentation/arch/mips/index.rst       |   1 +
 Documentation/arch/mips/sb1-pmu.rst     | 162 ++++++++++
 arch/mips/include/asm/mach-sibyte/irq.h |  10 +
 arch/mips/kernel/perf_event.c           | 110 ++++++-
 arch/mips/kernel/perf_event_mipsxx.c    | 397 ++++++++++++++++++++++--
 arch/mips/sibyte/bcm1480/irq.c          |   7 +-
 arch/mips/sibyte/sb1250/irq.c           |   3 +
 include/linux/cpuhotplug.h              |   1 +
 8 files changed, 666 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/arch/mips/sb1-pmu.rst
 create mode 100644 arch/mips/include/asm/mach-sibyte/irq.h

-- 
2.53.0

