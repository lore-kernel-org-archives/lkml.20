Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036967;
	b=02Pguy0RMHqEpuGCXj41cYoaE/z7n24umMSdYSu0GZYLF39EPLlTEKbO487ONeanUVPH
	 jvocsazltZY29wcaijvnIR6H6tmi8bu75FMljuykA/qGBIl0YGjyBZPntESSyapG+a43a
	 85x6cQlWYn/trrcZY67SrgihYYRmjcIULrnvF7jokpVnvNGpVnNGGDBWZEWZUWxZoXnI4
	 P2Q4YIOiM8cROBzDC12nP8qdXQvY447wBsHRiU49C+cJLEmUBAd7NO7dk5syjwgjYOfj/
	 Z1cTRbyyeZkSdQCMMEQU1Xkq7LtWRXhoAe1FV652bc405O8exzivIglth40XQ+1wwJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036967;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=9TTg9pb/7fpyUF/iQ6S1hdT7qvfB/N3V50wHOOlSh9Q=;
	b=c7/wo8xlnVSDoobq02EnJgFornmLhIEQo7+EFI2Exzr04YIDy9N9vuD8JEQnZ1zNv+ta
	 ChmS6BAW89HJsyJ3SrgZMhIRCaIKtzP5m1ujNnuqk7caGfdcB+wGqktP2gbujEhEvofuT
	 WUf0ydQjfoYx+231eiZmOS7v9RO8+c+4pCTjPAUVtJPBYKJqvEyoFYd+6dewVbkZ/c1/M
	 Q8SXXDmNnHtIkZhBDG/K+0njd7sSaC3b5eKFbk1FoH/r4uKF6P9GUmSuP0b+8nePBaF6H
	 /jzgsyFoxzuTFc+DO62Q62inrVgyBE8VoSERGhjAMXkowSv2s8oYs7hXY7unawQQKZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=baAAH+eI;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16239606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16239606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=baAAH+eI
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-93f30660e69so220039585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036966; x=1793641766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9TTg9pb/7fpyUF/iQ6S1hdT7qvfB/N3V50wHOOlSh9Q=;
        b=S4KlwVhcpTSaNwkGN1IYQRHezMet0Lf449VjvIjyw//dws6LT9szK57ldXMwRXBPXB
         FpPJuweo/12ry1uj3CQJdPC1zKWNZCHNTIM6sh8Pv08mOOgcIGsf4zSodfcErPODhANx
         heroumXSaf8dvgiZh9YkpCrr0GLYVe28CDeydzmDndBZ+TpKAWvjVydw6oo6886Bs+wO
         qnP79miPJE6hvjstsM3gVW8IFjqYzifN3K3+YkupTFd/tY43JYU1VO+1R+g6m+U03IsU
         tDJ287T+fOoKYl2tMbdxB7jFN1qzSI+DjRmT1Og33tTU62xupIyix2UuUvsYFxfKlSpt
         r8Vg==
X-Gm-Message-State: AFq9FYLDoftKN6jFjnFntnuBYtn1I3WfQ9fhjZ1xnsp9j0mBSzNNOaNC
	69d5y+fAgn+0e+n52s+JbFRcTNQDVQPB7bl8yJolagVK7WA38J26CAw6naHDO65H8+Krv2KMzi0
	Wc0rhep554CIzWZ8zxBt9/nFX3MSAfs4mvBmJ9atCBWcj5NyC5lJr7SgaTKhejUYmfCvaaYmDo3
	n+SALZ5v/SBs+/hOpqZJ1E1ArD0wgxxAExYrrWhGZ/vm6OEVktqIrQyhGR1x0YISrfIuVM6+DA8
	6+dJnfd1fUAO5Cll/3YMfm1X0g=
X-Gm-Gg: AYBFou3KQAWgTN1+1Mtsbk0F6puUeIG6hgl/X/lDSSEGM78bBmO3h2VkQ0PB5gjjcDt
	m9xrY14kFKI0gM2Ls/aKRfJTIYaxI8ElNTtJnSYYsf+L7Rby0dlwvY7PDGmrhB4GAToVhVEqyTK
	qorwQVIl7xxgFnjJnyfYnQPxqz2mG5Bx0xnwMr7OmHjzEh9Yh33BLBs165dyEvjeITdPKzBQS3F
	ihJZ4veDgR/2B35Yn9DPjBJfnKz34gCYD2esxjWZILUcpD/BfY3pRSE6QaAEXsYG78djiO+rbG+
	Upu8CksNqqE/Uivd1aYlCBE33IVRHseE4aDZnousHkABt53e7ZuV9T9UeCgesKBijD+nbHvDYoy
	DhCQ5OuMOJ8v4CsQtPUXcHPkKTn49n3LLFVAFp603QIlX2Nkfa9EyG74uP7Z3xnjzvAwIeatFWq
	wSbJN5HSYmXHHKTJMVv3cio9iQI8j9k9WCVmHu2rmiLt8=
X-Received: by 2002:a05:620a:6009:b0:93f:54e4:6d43 with SMTP id af79cd13be357-940ef7b5cb3mr1021891985a.6.1793036965899;
        Mon, 26 Oct 2026 10:49:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f0a77169sm114720785a.18.2026.10.26.10.49.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 10:49:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so2885194a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793036965; x=1793641765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TTg9pb/7fpyUF/iQ6S1hdT7qvfB/N3V50wHOOlSh9Q=;
        b=baAAH+eIxMFOkfImAOOiNtbNI5rQDl7ty14jT0BFQIbqlG1mTFKsbNtilKI6u7VvPZ
         Z4EEITA2ILcsnxHv4qktthQMdrhyDHhHgg7pfMiFBhXPGpW4UCi69ABJl9q7EguoNHZW
         6DcmRhs/ZnWpyWBenqEONx2RbkqpRwv6B5zBQ=
X-Received: by 2002:a17:90a:d406:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3adead4c656mr6303063a91.38.1793036964557;
        Mon, 26 Oct 2026 10:49:24 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3adead4c656mr6303022a91.38.1793036963981;
        Mon, 26 Oct 2026 10:49:23 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1210f0sm20400355ad.25.2026.10.26.10.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:49:22 -0700 (PDT)
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
	Thomas Richter <tmricht@linux.ibm.com>,
	Faisal Bukhari <faisalbukhari523@gmail.com>,
	Qinxin Xia <xiaqinxin@huawei.com>,
	Thomas Falcon <thomas.falcon@intel.com>,
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM)
Subject: [PATCH] perf parse-events: Include errno.h before kernel headers
Date: Mon, 26 Oct 2026 10:48:10 -0700
Message-ID: <20261026174814.3158229-1-florian.fainelli@broadcom.com>
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

Building perf against uClibc fails in config_term_common():

  util/parse-events.c:954:30: error: 'ERANGE' undeclared

The kernel headers included before errno.h pull in asm/errno.h. uClibc's
bits/errno.h undefines EDOM, EILSEQ and ERANGE before including
linux/errno.h, but the kernel header include guards prevent these macros
from being defined again.

Include errno.h before the kernel headers so ERANGE remains defined.

Fixes: 6b9c0261b3fb ("perf record: Add ratio-to-prev term")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 tools/perf/util/parse-events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index cc7ad331a49f..efb46ba9ba22 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1,10 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <errno.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/err.h>
 #include <linux/list_sort.h>
 #include <linux/zalloc.h>
 #include <dirent.h>
-#include <errno.h>
 #include <sys/ioctl.h>
 #include <sys/param.h>
 #include "cpumap.h"
-- 
2.53.0

