Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3161E479861
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196932; cv=none; b=AnEt4qDso52gAscVmJ92C0itlQ2ngPu3cORo2Jx+V/Yhvvrd1jqBzIYNtgDvQaBQw+//7s/RePPowc/eg+4u4SFzhHbFgz/8Ckf6u0SIsortpWfAIvS3iIi7KhT1bmPw+bnKEc0iIHusX6w6OmfMBVVB7VktezF8WyhYlo/JVdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196932; c=relaxed/simple;
	bh=LSQXwuc/91Jq9M2oRXvArzk4lKHdqB6VXTG9KYDgn78=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QQ5KIZUmRnKw4RyDAAn34INqfucQ8xz0uN9nBhJluRd+NFSVXVDVijtja07iGM5LGHE7mpZxBdk3Y5UKm3AugB4IZo+Q3s0pUvaW9iVywcROXGp2EUGZgydq68InE9gAVMD7WmA6/TJW7TT2aVrSLaf2CNqUAib7DptoDZ+5f4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXC80dVc; arc=none smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXC80dVc"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4f20258a10cso420042b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196929; x=1791801729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mDdAj0bmi+Z2cA6z27B4wh5CNS9OF0FfOrosmrqHfMk=;
        b=fXC80dVcvbBTTORmO0O9BQojnt/8S/femV9i3h1Ul7aFMq9XIx1QPtWPoHM0PRMbsN
         ohJ+M6Xj6MhDuwnN7LUwb4xHdhDnBPeO+tkMfKm6+axULJ19rtGU6WbSDve1MIpEeIN3
         c+IO/6GuJayrSEomQEgXr6+8Z0ItydOaD2SPAZCVCeWLxGMmUdnShXNgV4YsP869213j
         bTnevSuXA+4Golo/Bf+wfrAo2UnHgwwrM9Ib5vcinY79Rhrjc5py0lv5hso5+ARXXCNy
         4/PHfvl/UjvMKWdxxej6REKaau2ao8N5JOkYQD/FWK5lXGQ/Q4igR66bW7ea7/i44ajW
         BtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196929; x=1791801729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDdAj0bmi+Z2cA6z27B4wh5CNS9OF0FfOrosmrqHfMk=;
        b=UWPILjnAOLH2gQVI93FzfqHnGNyikXYQrhyKS706Cwo9hX/J/6VcGbA9ElhMKavDRE
         l6IcjZlwzJpWPG9uQkzwN570AWL4xR6toeS//Io7rt4hMWdWABBjWT0ZZrGg9Abf5ONm
         BFqJFrAMPnzYpXIsmpeas8TYBfYcFSZQMIv1Q46bFH47+0LegyFQEbK5UNNhY/cGvSKN
         wlUsqFBnG9o5VG0qsnZaz0NevbgY6BoE/rF84yvXk5B1YHBYPOY8apHE50qwenTczCaT
         tLhUJYZP2VCwcGmmY1PYxYXbOY2fo8C6BiZs8oAn3/gZcZcN0sVWym3euQKY08gevVoJ
         sVgw==
X-Forwarded-Encrypted: i=1; AKwUvBxjURX2e2YTSv7kIURV/inPhTGxVzH+IlQwrIwS1hmfO5yvb+63bxh6CQ7YN7/Fs9E+Zok+k+LVkV8aLz0=@vger.kernel.org
X-Gm-Message-State: AFuF++lxFX/F/jav/hXQJXyRjqU/GMApu0Rnq0sdraL2TQc1fUuhd30y
	Ki39cyRkm5ZPOH9z3/ORWf9nYwSxfjPAe1qyZzXkb4+e9Y0cyzZEud1qxGDj71qu
X-Gm-Gg: AYBFou3HPco974W2Qf0dtaRJAKt8A1S9FImS8c9nRT0lKDT9SqzohE1Lbtho3GU1CV7
	KwOWxkPUSfIi4VX3Izo/8x0sLnz2WNCnwSuuNwgEFCyF2KvJ5r++q4opmQFnFDnEMILKDo4EOjH
	eAg6SPII/GiLI1lJ9+9kOiW53GHkK83ca20BRXWYm8cOcew97/EFzYthMOUIQrQ1lyU+J+USCe4
	GmoQnnEOlL1oKHRHRBSDiNtOWoto5kSegwI+IuNBDCE6HqTt0rWY9+V4mBAFkxgtovnGoq8l707
	AjMwtIJ4SscwxeTxBZPuRX9Ic2F/80gqSWbm62xjvWzCLDvZ2kVr5yUikUgNCOQ09NnWZ05/i9s
	+kni7Duz52H8YT7D+CKzIvQZ2M3SUD4WMd25nXu6hSVOvt6YKcvc0YuGFrSw2rjHOb9hrTMhjS2
	i5gzYRyB0beC4JJhqI8QedoWLEIyvpTHVzUUie6F2yDuH2ZD93oPzuiKTfOl7qV9WlpC9JKMnLZ
	9JzhnaXB+nU
X-Received: by 2002:a05:6808:14cd:b0:4a4:c95a:38d1 with SMTP id 5614622812f47-4f52694526amr5863845b6e.4.1791196928891;
        Mon, 05 Oct 2026 03:42:08 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f5249d7c75sm9588989b6e.12.2026.10.05.03.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:42:08 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] tracepoint-update: do not reuse section pointers from a previous file
Date: Mon,  5 Oct 2026 05:41:59 -0500
Message-Id: <20261005104200.1787946-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

check_data_sec and tracepoint_data_sec are static and set while scanning
the section headers in process_tracepoints(), but are never reset. When
tracepoint-update is given several files and a later file lacks these
sections, the pointers from the previous, already unmapped file are
used, which crashes:

  $ scripts/tracepoint-update --module a.o c.o
  AddressSanitizer: SEGV ...

Reset both pointers at the start of process_tracepoints().

Kbuild currently passes a single file per invocation, so this does not
affect normal builds.

Fixes: e30f8e61e251 ("tracing: Add a tracepoint verification check at build time")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/tracepoint-update.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
index 5cf43c0aa..4c4b66901 100644
--- a/scripts/tracepoint-update.c
+++ b/scripts/tracepoint-update.c
@@ -163,6 +163,10 @@ static int process_tracepoints(bool mod, void *addr, const char *fname)
 	int idx;
 	int done = 2;
 
+	/* Do not use the sections of a previously processed file */
+	check_data_sec = NULL;
+	tracepoint_data_sec = NULL;
+
 	shdr_start = (Elf_Shdr *)((char *)ehdr + ehdr_shoff(ehdr));
 	shentsize = ehdr_shentsize(ehdr);
 
-- 
2.34.1

