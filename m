Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036750;
	b=zC3/IHw0+K3e6mavOHHZqq61fvtrUCCLzyPwxA9txE16fgXtwPWxbc0DXi9dCNXs4QCH
	 0FxP+hgGYK2reaylTjYnEP1KwcvxKZH2M89zpM98424TOVbDz+4np8/4S1df3+70gPBFF
	 sJU77P+h6YiW0h4Kaby2yEPDFy3EYFfDk8uYV5x8QdZO9PQrpe4Z3/LsIiiko8WoLb8ac
	 2pss4k1gzLVeEI/Y3n8MOopVHZvW3I41vbY6ODrlOY4NYKZoUFv9j2bj4qS0x8+2iyodA
	 NTBLJu2HMjInjG/0yjEao7Qfc/o32j9xJemv6StZDPpWNRffpAtAdEHM1Eu0eCV6j/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036750;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=EkPvFgQc8FbM9LSXUf6KgPjczi0z70sToct6/kDqPXc=;
	b=L0+RWDnmw48UgnAiH9MJ3u8qdNhjXJF9UYgigca+1d0nAAqORY/CNCzwBKodWLXp0Yko
	 B3m5O2dklkI+NNv0pEFYXXYXJaTaP98NE+t5/DPPHWBa9/0ThMNhMwTvjlTyJA3W8IosM
	 J1eGd9+gVAITjmIwcKEjlkUbXWH9+7RZ9ru2EX4bLHHlibPZKfTID+JrL/TT9Nz2gFeta
	 0z0P1YeB0Luu+INLSGidi3xobLiO+NsuuCimbAulUcx2FFAkvTwT0f3RQZuiFleV0Nnuw
	 jpBPbiQTrTgE2oqFAqX6iRTFAbcKWPDYsGXyUlWkDnkDY4q6Fp0gWnjm7srfTEgTWQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Hi90HxGm;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B81F606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B81F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Hi90HxGm
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1156250a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036750; x=1793641550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EkPvFgQc8FbM9LSXUf6KgPjczi0z70sToct6/kDqPXc=;
        b=enHvcuOJVhtnQmNEsKEvPr6va1HUffp9L/QUSiQz7YaNzjUTq0Va1DoAERruc+E0/u
         y37adXUQU+MyrsNFH5Q4wbT5vCfiCNLFUKcHKGpsnuj7sXvBFWDQl+o8FETwmGfCtAzB
         foR7N/bCgKhO5Gf+FvyDzQDaruwysXW39PxqedNDdyKhfZngr9GijBAFXdYWgwyWz/QH
         00sf09LpOVeK8fqwWxL/9OfEmwKjHxIH6pEnSCjg4YLCHEPIghHntkEs6WB0tyANz9kC
         IJSSRpztvaVRmlooUUYVspt9lSFjDFf056QY/NgSWk7VcHKCNFXeVR6Um3+g0lUozmIB
         wlzQ==
X-Gm-Message-State: AFq9FYLCLIORc/rR8qfVGuUwFacrlxeWkrtS9kqlkPiP4Qcqe0C5/m6q
	TEdWphCOx2K1kNiNnagBkim4oFA5lmjqJ+KjtsH0v/U7XaMjlS1JzEvP99RzVYZJ3XmcqTdq172
	yFVG9YyO7jdr1WXFUdtlT5f5olcZRl0PSGoE6zpngGm2PoOvliUks6ZIJ9XQlKuoZoTaxrsv4ko
	IlQBVKzhxU/YWKfnsVmGbYDkDCETAWbyWwlTuM9e8IcWe/RmGPR0mDp4RlV7QWfkzuz425jptC2
	E2sr3FMLBRDaN/VX/w6y++5m9E=
X-Gm-Gg: AYBFou1i/OHnvZuMgL1PO8p0lgBYX//AamQ8cXhgGsXRiSyz156m918HstYbr6t4Kd9
	rS9W+CQ8jkwEm5FET18zcCV1irvj6YGBW0saXH1kv02x6cI9AraGNXlUW3ytMOVKsFz/UwwqeW4
	PNizopgufxBWxBukdn4QZ0ST7pfBkldUnIAs7XFOWehEhGxBb4oS6nkh9zwhFmxGYiciDy+0dyi
	csK0NmgXX/EI+uOz01H9XIlw/GCIRLNevBelJQqS6BgnR891zRXmJt/1s8kjEvWnxLMv1UKdM+d
	Nh7DVUfdMr2NWORx9gtNGCEsSLiKzpKGJvOuOBy5dGAXOOqSDoZ1ZHQaP94JhE+K79NBY6v7/UR
	gJdWltG+HwplC3GKL9YDVZ7AxwhN1WBKiMwR1J9qA2yW1EwwxNnadRanVXUHEX30PLkizBecitC
	HA4XrTU05dVOL2Xr1PrHY/F/sLfjC4TX75ARHOIU/T
X-Received: by 2002:a17:90b:4cc4:b0:3ac:b197:1a37 with SMTP id 98e67ed59e1d1-3ade9b2d399mr6229299a91.3.1793036749542;
        Mon, 26 Oct 2026 10:45:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae4063d1e9sm182555a91.7.2026.10.26.10.45.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 10:45:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-18b5ee75447so3080698c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793036748; x=1793641548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EkPvFgQc8FbM9LSXUf6KgPjczi0z70sToct6/kDqPXc=;
        b=Hi90HxGmwFReqqAgsF/9ATlmlNRol5IUELd2Wm18czE0Jy0ZPhvjbR/u5wj6Dzc7XI
         WSXfWxXdgj1HUMHwAdAvMFtWkVoGKHXSaIo6/1G9kqhv7jhd/NUsPyFUx+CXYZCUr6kW
         t6eiGbJeCLhuc6loJ1tRJ+x4n/PZqfIcltju8=
X-Received: by 2002:a05:701b:230e:b0:167:d73a:e994 with SMTP id a92af1059eb24-1993658f1f8mr9164895c88.24.1793036747873;
        Mon, 26 Oct 2026 10:45:47 -0700 (PDT)
X-Received: by 2002:a05:701b:230e:b0:167:d73a:e994 with SMTP id a92af1059eb24-1993658f1f8mr9164844c88.24.1793036747049;
        Mon, 26 Oct 2026 10:45:47 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm25820555c88.1.2026.10.26.10.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:45:46 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
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
	Andi Kleen <ak@linux.intel.com>,
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM)
Subject: [PATCH] perf print_insn: Include sys/types.h for ssize_t
Date: Mon, 26 Oct 2026 10:45:31 -0700
Message-ID: <20261026174535.3157580-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

print_insn.h declares fprintf_insn_asm() with an ssize_t return type but
does not include the header defining that type. This causes builds where
stdio.h does not provide ssize_t to fail when compiling util/print_insn.c:

  util/print_insn.h:21:1: error: unknown type name 'ssize_t'

Include sys/types.h so the header provides its own dependency for ssize_t.

Fixes: 218c200f677d ("perf script: Consolidate capstone print functions")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 tools/perf/util/print_insn.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/print_insn.h b/tools/perf/util/print_insn.h
index cefa5c5f246e..3de9438af9cd 100644
--- a/tools/perf/util/print_insn.h
+++ b/tools/perf/util/print_insn.h
@@ -4,6 +4,7 @@
 
 #include <stddef.h>
 #include <stdio.h>
+#include <sys/types.h>
 
 #include <linux/types.h>
 
-- 
2.53.0

