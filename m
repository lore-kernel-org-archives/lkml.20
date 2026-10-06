Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C5B3D6487
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327174; cv=none; b=ZjXjlGo2fMESsnKJX47MeagSgzzqN2sqvQ+usQjCSKo8q2mFmE8R+ha4AwxpN1HAilK5sPLK3/O6MzgpgBwjBUHXZiDdpaoR7QrseVwLzgDkxASpTDDQGS3w6O/w/ESY6xb0z1hl2HPFvArqip6p6Zi9faKhvfWNNpRyjiOM2Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327174; c=relaxed/simple;
	bh=Z8J2I/kWX0GLRrAqLmLPVXnsmDJxut8j0wsvCdk6c18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BveAPj8tupXj5Q4D03MmVZkz14WcN56Z1lKduJ9SViiA7RfQyDj66q7/a90Hpss+XJWqcFa3FzzhRWFqXD1WLmbd7ifi+4rwTO0hfcThm4oC3PN5+Cd3+1TIY0pzu6vpY38xJjPg260rNVhBt7uQoYJ8SvEG7E49H2jkHzUrPG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=OWxWSGUw; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="OWxWSGUw"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-483c607ccb4so1835006fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791327173; x=1791931973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVtFONvI1ZARq4YZjRy++svMx2rYT3eTVyRGWJwZNjo=;
        b=OWxWSGUwsSzCrbQQiINOJ8fIH1rjZGBQL3zzzo6rcU/qAoc2FQVO8SffmWcdIlaGiw
         l8wrKpb19l99/0y+Oj5eIdzAJTUczUj9diKu8+HUUtq//UZNWhzJjFD9UNt7O5X5mb+1
         jYV9z5Rb2PnOw80/Sdp/NcI/2jUUx+7lX1JbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791327173; x=1791931973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVtFONvI1ZARq4YZjRy++svMx2rYT3eTVyRGWJwZNjo=;
        b=2rh2A12nIQtaiOp47hmzHaQlHClCuUis3+J/3rrgPuGhOn+NhYDYJpKrm6dtc+C3y+
         LWYXDI9PK+T4DiIorL+/C3+68XgRqcO4TLgUPSolZZ5dRv3VFaAT1m5qciKHF9Q5IxLe
         zOgC7rCk/h5l3fChIY3OUgcetO1+Jo4Z/2mFGWqK1fhioQ1t5nIonbVji4fwfbAD4HkQ
         cZlvUUM43yKF0N/PnBxWn+F+sW9B/Mo7F4okgG/rSgznUYe7JKMQc7U9E/LLNeYkZENn
         dRfGhY9fBcA2EzA3iW0yPRPAadofAGXpOoiZo1q2rysoClIY114rxIwKFYyahuhoCy8f
         NDNQ==
X-Gm-Message-State: AFuF++mSWn5HYce2zo8yYXrUjStTuqTNkWsL/FUrDYBCtxcMlJRoTk+F
	bzIRgwsi+LqA4Dr0lHqKkoPhf4eT5mx/1uJqmfMNaKLbS9UcwagcnRXwo6qlV5Zdz74=
X-Gm-Gg: AYBFou04VU6z2AcE7RvVZ+fQQM9mFAOCu7Q/obwdhN1TYcvyao/3n7vSCu8S4xDPWev
	Ctsw10gZSU7wWXHzTFEMw1DRsJ3liiKAUGasZ5PFHVy3y/cghlOfWsbd6NPjSFhCCdVq295to74
	naqZIEakFJLKGuWFtWdVhqfU/1WN8LPCyS69Qg5f7ejR/6uaGXtYkYae8S0l0ebVYR06aD3M13/
	RXiyFnHcUNkFaHj47NCMTcPgv+9pIw+v+Dw6BR/M4vsd6hFtr4cE+eMqTA/mnIinJcJmhQMVYHS
	0Gfs1DuELGBJPqJE2jz9WELro17GvOH6/Gdn3PxJ9S6x46Wgf377fovImyerQBZYJhsVZEt5Eqa
	XflUFXAg+vRwcrZj2QG9CBnGTkqoMcpi3bIpN5DAeSOvryNwX37tBy4qVMajJmL4IQirpYksrh+
	Y9KvQ3hWYTKXxYilK0dzCbrEpufyDj0iGO7lMtpBLUSNyuJqUJFupIJjmFtMeLZ9nzWsx5oNzRa
	V9Mq18YAJV0DMSdRIIZ/lJv4/yjvdqgciE6Z9nQMgL18B+sEggOYMtn4Q5xFVUmc+YQdBqOQRI=
X-Received: by 2002:a05:6870:891d:b0:48f:e0f6:bd5f with SMTP id 586e51a60fabf-4a2596f651amr488425fac.48.1791327172838;
        Tue, 06 Oct 2026 15:52:52 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a256da012dsm736585fac.1.2026.10.06.15.52.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:52:52 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH] perf/core: Check kernel access for text poke and ksymbol events
Date: Tue,  6 Oct 2026 15:52:48 -0700
Message-ID: <20261006225248.54708-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PERF_RECORD_TEXT_POKE contains kernel text addresses and the old and new
instruction bytes. PERF_RECORD_KSYMBOL similarly exposes kernel symbol
addresses. Both records are delivered independently of exclude_kernel,
but perf_event_open() does not check kernel access when their respective
attributes are requested.

With perf_event_paranoid=2, an unprivileged task can therefore open a
user-only software event with text_poke set and observe kernel text
patches. Opening and closing permitted counting-only tracepoint events
can produce these records through static-call updates, disclosing
relocated kernel text and branch targets.

Include ksymbol and text_poke in the existing perf_allow_kernel() check.
This authorizes the source event before allocation, also covering
inherited events and output redirection, while retaining the existing
sideband behavior for callers allowed to observe the kernel.

Fixes: e17d43b93e54 ("perf: Add perf text poke event")
Fixes: 76193a94522f ("perf, bpf: Introduce PERF_RECORD_KSYMBOL")
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 kernel/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index db7b76d6b68a..7301b320f746 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -13946,7 +13946,7 @@ SYSCALL_DEFINE5(perf_event_open,
 	if (err)
 		return err;
 
-	if (!attr.exclude_kernel ||
+	if (!attr.exclude_kernel || attr.ksymbol || attr.text_poke ||
 	    ((attr.sample_type & PERF_SAMPLE_CALLCHAIN) &&
 	     !attr.exclude_callchain_kernel)) {
 		err = perf_allow_kernel();

base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
-- 
2.53.0

