Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C9566C68
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999268; cv=none; b=IVdTau0yPtu2AJ9t+RrluZyV/2Xi1CLklPRcXvV/vxx6GDmf5sx+BWKpc10cMMhFEJ9giwn8LpqahkikS84V6unDVXkDF+5szi0WuVFDjOABjSvasJAqSrjtqPCi2h/gU4RX8rVM6ERMTihp4PwRe39uAEDbeWNoqnK9LfUUH34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999268; c=relaxed/simple;
	bh=HI2niRA90IKDKwvsHpPppiqbbhE7pSgFPWCVraH/PyU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PPK8rzMOSVtifZUJfshWNtiOMOW8jRHeG7Z8/bD7NXOq7bQkgDpkrezG2s+/5VNjB2vKI6ZEzTovlbdIM6vwmiUC05aw8/yi/6eKdwpo0wU8pxgPYNXkx92HM2CbHzRZFwZG8YwEMYFHDyrDr/HuO4VTS35KmJ3syCoidsD0T9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name; spf=pass smtp.mailfrom=intelfx.name; dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b=JEAUsAgi; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intelfx.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b="JEAUsAgi"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-486e70f2457so375608f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google; t=1791999255; x=1792604055; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/5P9b6OokIozv5Q4UiMUi/dV9UBgkDoPgxyM+sM9qio=;
        b=JEAUsAgiB7wcJRXcHiA7tQIiA0lpCUi9FmQiEBgaXSpvxwDH5c3xwqXjAjSPYifOsk
         YqD5JMsp+xzvpknEZIZj3yFhyJTeLHPw7beDhDFbv1lJxv7ZJZlHdEOQZvJ/JJS5XrtI
         5h/mKPtJ+hXDLrOpMtqVM6O5HkjR1iBjC+Y5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999255; x=1792604055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/5P9b6OokIozv5Q4UiMUi/dV9UBgkDoPgxyM+sM9qio=;
        b=Hrx6AfRxhPARtQ8DeWM++/zPLM8hexM9G8KdJBqKkspi82oyVM4WyXd1jjuydxWpKn
         /dpN13+pjZQ31oX8rLQ06Jk5qWcGv2rbuw+v+Ks+Oybboba2REYmyPz8etzqlgrbMhNm
         oKXLbDi2GuWCIrWGEpHp7TEJds2OIKpGHTaQhGrivHvUaLHiRL3ajcOGt51WFXzCyJ1I
         Vlh7bszg+5zvCKe3NXJLmfaY95l2x+rVbh5SkDUSkViIgNg6A70Isu4SfBKscDMxXP2o
         54f8Vj8xGYkRgEBm/SSrMHZonFwgn47hIZkchY2wt96hPQ8ZP+j2Hej5qd/KFJ8daS3F
         HqOQ==
X-Forwarded-Encrypted: i=1; AKwUvByJEQsJ9vd9CHjPJI+seyXB3sW41G9819IffrxsBYQzQw4NLGGP4idduZogHf+1mnse6EVrm1mbRZSND/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbV+kmbkOC4gLiPTSy4w188enjiR+Ormd0TZe1MQgcRL43yV32
	WbnOovKsM+OIlsQw+UzM2WRMEexRkdbFi7ReHUYdCQoLIEkN6T2Oqts14qOVmK0lYWg=
X-Gm-Gg: AYBFou2k0XxIbmCEfiA/WdTTTcn39xdBYDk6eWQEqmRDLY6SQ1UeWnijvBDWpD5KvtZ
	NHmdrrRZCF9pa0XHZlEiqx3I3lIy4l+yEo/9KmUZrpHGDVwQblclHIkj+gg6hIKCgOYMyvDDKuM
	RiT7t2NL6WzNPlgwFlHLj7pA5I7j5Wk6LBtsW8ZzZR0FLxrr9THfG8NQMjVBhz8pbFFONEaUMX8
	1WSKQ66OZnfRJVVQDJGJVq7FobmtTTv2wYXTgz0ATDSabqozTSFutUolnctezjVEodcEx1fgaWN
	gH/EXA9APCdImBQs/X//XYSmmiGwR/fWcn79vAZ11MU0ZmZXrzxY311dBrlllRUWQpWPM8xEzdf
	HuCdy28L3i4LotIuNFpnESuAudmMKrcyiwYCoBKiOVXaKeQ+RlhKFuewYc84ch+JdB6ANFlA5dh
	CXyk8U/KwB3dE1ecA08jlYa486UPHuNb3Nv6R0CBOclw6oSedkWJKDlZM4
X-Received: by 2002:a05:6000:29ce:b0:488:5852:6ee3 with SMTP id ffacd0b85a97d-48dba9dc7b6mr24650276f8f.34.1791999255646;
        Wed, 14 Oct 2026 10:34:15 -0700 (PDT)
Received: from localhost ([2a00:1358:e0ce:6800::3db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa9f9sm13417135f8f.19.2026.10.14.10.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:15 -0700 (PDT)
From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: [PATCH 0/4] perf: support zstd-compressed kernel modules
Date: Wed, 14 Oct 2026 20:34:06 +0300
Message-Id: <20261014-perf-zstd-v1-0-9652727886fa@intelfx.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBBA0V+RWWvSqVf4FbHwGIwF0ikR4t8Vy
 5Pc3AuELJNAEVxgaWfhZfbAMIB2rOeBFHfeYLRJUWOsVrK9OsV1ymS5xgx1Qk0Evl8t9Xx8r7L
 6LVszUeveAdz3A8B5zPdtAAAA
X-Change-ID: 20261014-perf-zstd-279017105eb3
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ivan Shapovalov <intelfx@intelfx.name>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=intelfx@intelfx.name;
 h=from:subject:message-id; bh=HI2niRA90IKDKwvsHpPppiqbbhE7pSgFPWCVraH/PyU=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0did012TXdDVVdHM2x2aGVTbFF6Mk1wO
 VdTR0xMTzcrVmZ0V2JmbjRVWnluRk1qcHZNZms1NHRQOUt3NmRICnEvOU0xejZ1Y2U5YzFZbmcx
 UjJsTEF4aVhBeXlZb29zdSs5UEMzczBkNExTSWM4TnVUQnpXSmxBaGpCd2NRckEKUkd4VEdmNW5
 USXF1bHhEYkYzUDVxdUs1a0xaWVZxWEE0K3VtMWs3dlRZMWxGL0c0SWIyU2tXRzZVSEpvVDloaA
 p2eTFTUjljZG02L2FXdlRzR2dPUGpOL084amRabTdwM20zTURBQT09Cj12S2pRCi0tLS0tRU5EI
 FBHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=intelfx@intelfx.name; a=openpgp;
 fpr=04DEA27EEF682F17083D892295D5D5F5A5A5E5E5

This extends in-perf zstd code to add an interface for streaming
decompression of an entire file, and uses that interface in dso.c to
support handling of zstd-compressed DSOs (e.g., zstd-compressed kernel
modules, as shipped by various distros including Arch).

Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
---
Ivan Shapovalov (4):
      perf: zstd: zstd_decompress_stream -> zstd_decompress_buffer
      perf: zstd: factor out zstd_init_{c,d}stream()
      perf: zstd: add streaming decompression and format probe functions
      perf: support zstd-compressed kernel modules

 tools/perf/Makefile.config |   2 +-
 tools/perf/util/compress.h |  22 +++++-
 tools/perf/util/dso.c      |   5 +-
 tools/perf/util/tool.c     |   2 +-
 tools/perf/util/zstd.c     | 188 +++++++++++++++++++++++++++++++++++++--------
 5 files changed, 183 insertions(+), 36 deletions(-)
---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261014-perf-zstd-279017105eb3

Best regards,
--  
Ivan Shapovalov <intelfx@intelfx.name>

