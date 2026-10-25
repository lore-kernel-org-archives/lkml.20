Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965313;
	b=hiENa8B6C0TWKYr4qtzHOq0Q+yvU16B6yL6XY6nObKpO8pN4Vv9A+PjIqDwW03x8hZIz
	 CT811sNRQ57jbk2Hu1gdbfbz9KCt1/rbhzh9csuF6lR+dmDsKolj70MMSkv7nEjkAM7dx
	 33WoZShoYi+VB9X44b4mP5+SN1jK8heuuqQACZr+gLq0k9tKHt6AGAYv2mdZpoa7/mysQ
	 ArRIK3YQX+HjEhvhYIh8jXj6acV6wcPSphKnJXFTVGc8fNfsrxvZsLJU1T7EuH/InWIaB
	 YlFzNK9J9C6/7PQ3EdrgNDFwREPal3ZwdROA6KbvQpsOT6VcDKF62Gwwr/cdO4DB0mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Content-Type;
	bh=Zt7QpncNg8RgMDpa8gtNEv/aMDccF33cLy1R11uT760=;
	b=0WUdklAF/X8uGd4KqGx1F9CSUwqpwUXk/MmUmDpHcmw/Vu4dlXDLYbusBovufKi/8/wm
	 4yZ7axbY/Tc5rrG3Zz8hlFceD5G2sWc+SXcVRvfxysqNbhL13nqrmGpEWFffWuGO7N2OL
	 iTc+K6Dje/+A9Ag2gsDLfLDtOJKSuah7nmw8PqinX9BaWkJ3k7hTtH8G8/zeq8y8qH0HD
	 lEk7HvIviaCkSCh+HDKANWC2Y0olOSly4EYshhx6Vrg52P2jHF/0wwlJSa0P/GDE2D4ET
	 K2GHZR3RsNTyH+Df1tmgaDU+WCKNLaBRaC0sTd2g8+gPcbfpr0wU/hL3yW0f8VQSTzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QK9pL7Po;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8309B606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8309B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QK9pL7Po
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so3826439eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792965313; x=1793570113; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zt7QpncNg8RgMDpa8gtNEv/aMDccF33cLy1R11uT760=;
        b=QK9pL7Pokm+Dr16jmVw+fckfMh7IrOQTGJYQHgRFKgn+qoPBYNzIV1kr7LgemD5w2G
         oQCEE/eENURG4JP0BAe/uGqnpu9sDhyqsWA2d8YzLCjvdaJDgVWP2ivwNZ5fss48HWpz
         b6xiCrqONmQzzUqhwkHr0/fb8gZDPuzkvNwIE0y0b0f1VH5OQCfIeIW5Y0SYjqq+BIqN
         rGVET2A3C8DiB40mw6ay+S8gISusBgr7odUZC57LZgK/4bHqsE23i4znfCUODXZcXrqM
         Q3QEz4zzcs5U34P14xyRVUYdKayMguiY3IyYJ5TvUtsFfVXixv3ch7fDg97Wu73tHpmu
         5+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792965313; x=1793570113;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zt7QpncNg8RgMDpa8gtNEv/aMDccF33cLy1R11uT760=;
        b=Ip8/eze+XRSHqumWcsfs/bd+D/103qkYeoZn5iL45ZRC4dGJreZv3+yZqR/6gir/Re
         MGgC1U78vXhMqRYaDdD2Unk3HbEtY1o1jOdSV6b24NHyK5u6auK4A3pUWlVbVetuCv/5
         N0THrbQtHBBJFTC1GhvlpprH8hS3KF+kJbwiZePy9Sw3BplCp0cNyfn6Gmrfnc6w1kFC
         0x9FHr2Ga/U0dy7D2yvgDW+iNsRb7QyflODiFmoUFW/E5e5Bq791BYs6pqKBc2SVeV0B
         9IWNJMojomCTe0rdfhbgFi89OpUtCg8Pq9L686zUYigLGEcCb7VMRpRs+7v4xB9xFbbi
         enKA==
X-Forwarded-Encrypted: i=1; AKwUvBwhobewylouqjdIuQvvBSxghUWElngrdBVp/nBKKdjPaTS9vJRNyMy2EqV066KcPaHq3WYjsO7+0+AYvvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOx4zhkA574v6A+FnlRYYSBqE3Gs2vAiBOpDCNeSePQaBLBnic
	B8uX/YNyvs0D4ZCbOXKkMyahfOmjiPfnPk811w3mt6pluk6N3mWGel2hxmmulzz6Ht74clcR05w
	xULm2kWyHsg==
X-Received: from dlbou3.prod.google.com ([2002:a05:7022:1103:b0:19b:4a9b:8cc1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e803:b0:16e:4723:5f86
 with SMTP id a92af1059eb24-19936a60764mr8643547c88.29.1792965312166; Sun, 25
 Oct 2026 14:55:12 -0700 (PDT)
Date: Sun, 25 Oct 2026 14:55:07 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261025215508.1237480-1-irogers@google.com>
Subject: [PATCH v1 1/2] perf/core: Include attr.defer_output in is_sb_event()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Events configured with attr.defer_output = 1 receive deferred callchain
sideband records (PERF_RECORD_CALLCHAIN_DEFERRED) via perf_iterate_sb().
Include attr->defer_output in is_sb_event() so that such events are
attached to the sideband event list even when no other sideband flags
(such as mmap or comm) are enabled on the event.

Fixes: c69993ecdd4d ("perf: Support deferred user unwind")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 kernel/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index c4217c996f5a..b43883a42566 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5347,7 +5347,7 @@ static bool is_sb_event(struct perf_event *event)
 	    attr->comm || attr->comm_exec ||
 	    attr->task || attr->ksymbol ||
 	    attr->context_switch || attr->text_poke ||
-	    attr->bpf_event)
+	    attr->bpf_event || attr->defer_output)
 		return true;
 
 	return false;
-- 
2.56.0.307.g5fe7bd680c-goog

