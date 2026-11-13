Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588133;
	b=jLuIkiEaHkEn2qWoE6ymNvqBnB7lPGkamu4U7IHANDwXCUws5jpOOwJz4Jy/wjtwbdlu
	 kJupYwx2UMlBzG/IyB6NpsMpDdfxQuf5KsAaQMIn8cS1fEEVyCSDnXrQc7RXUi1VAo4Qc
	 jrzBnC58xSsita3Ns7O5A82ayRBkK/HI6BW2qpoE69DYk0pO1/M2brgTabSpCHWArpZQL
	 FuS+DkT+7ImYjJoiRTgE92vHXRJaxorzVqmBH4TDRy/MgBJrgojiGUc6uDXth7sMP/fb+
	 +1RofOxECrW27rt7O9UYlAyOg5FcDcZi3FxsopI29f32YPELzFaAmlgk5zcuB9jT2fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=gRNK11YgcY8cyMOB0/Yo8DNfUbiIMkO6zRKLCyKH5W0=;
	b=YsvLbKuXdwkMLktGCU2OY7kAuGgIGq5fTVMwflVfqfS/4pKBaY15a+JMUIynGShculw0
	 kX12TRocDIGNCpozcqTt14BED6w/H5qngRv09EmmyjpLCmYCaUvL0thPRbqpHTPBO+CjF
	 i9C10pkvxvo7RIlDpQtkK6Tq02njrVV+m2qOe1ITrD7UXFD7W1T2mq8YjV91CDYweqUAz
	 A9DQ1SNATa4gFGFnpBwkAdVppn9B5H2Scoiztsd1kO7nN3CtsKhzMYuCOmVI5xKyB9P7c
	 jbLjhAbSCRI3LxUP8T2Bq3/hXEYwMCnoi6ctkB7CydZQ1Edga7NAYRppZFLZo+oxVyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="M8GJH/mX";
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDDA607CD51
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DDDA607CD51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M8GJH/mX
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab260600easo3302573b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588132; x=1795192932; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRNK11YgcY8cyMOB0/Yo8DNfUbiIMkO6zRKLCyKH5W0=;
        b=M8GJH/mXE1apwTAgwYqEvSjGZI+Njr/XTb1bVarppxB8TEpMv3WDPWzrlmz7lP2nIH
         vgDFrEt0nx5ggbgsDRy2qSYGc433nmbseSZ15/gxZrcl5iYGFC9ZThEvfyu9aP4ksXoh
         vz6HesD3syUlsbi/BHzpAeyyUWM+o6WJDNw0yFowjm144IUL6zkFnFCwpBA9YSwg0BH0
         pnWnZS4YlGADbwfMFyHiYTWnK6OzFbYmLqbQjVh/tVDKFyofrJS8JQc4/dkZ2Eyi1A2j
         NXHEaDIGcwLtuc8BRqAGl9JoeF+/3GF+S6zJC25hzGWzp2Q4U94zU9ytASLtnfUToLVU
         XPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588132; x=1795192932;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRNK11YgcY8cyMOB0/Yo8DNfUbiIMkO6zRKLCyKH5W0=;
        b=GEHUVvlIy3NQy+RS1rlXp18DGqy1Ef7rNbBOh3lVLEVcKLlUXpnG34J5v8GmQ6V07o
         bULBiP1ctdnyidFYY4TC+gA+c3LqTFLA6BEOwC968FeXbBbOcl6RDG0o8WqAA4lI6lBu
         Nq5Jmtw2ia6SCVXe44nlEYNuRwiDQHcQ0ygZXPXg32ZZEgCk2pneYySGhXqmXk/wWMZ0
         51G9sqM7tEpJQrycOOIchP+Kn8Q2qxhHsZEp8LbDEGYlPJT1NIWe41jEI8qQGJArRJpd
         tLLtQa0p0dG1gH5OfPPcrtAK7V/XZDZf0FXAe4ekiUx4Sqp1U7N3+NOdKYNf2i7+XCQw
         ZBsw==
X-Forwarded-Encrypted: i=1; AL+hErHebnJ0T5GV97ODm28RHv7LZkSeb+aeChMnq6YDW2Fy+iMAr4HRqCfHxqTjxKo0amdCm3/F2wd8sYmFsQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y5OJbvB6JgI0wTWBVfbzaMyXplX9DpanzfZAVxyztWr7JBukB
	/dJSO7OEOB74kKiWv2q04nk0SoyHOQQ3xiAZeLcACJMNqfx0XkLlTh9Gzh3wRltlaL6gP+WfGeM
	yOxCFzgKEJA==
X-Received: from oigo25.prod.google.com ([2002:a05:6808:8899:b0:4f4:cb57:f881])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:670c:b0:532:6c52:9778
 with SMTP id 5614622812f47-56e6520fd22mr1905058b6e.20.1794588131968; Fri, 13
 Nov 2026 08:42:11 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:37 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-7-irogers@google.com>
Subject: [PATCH v13 06/21] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/comm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 6343a3c9debe..9fc4e91a36e9 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
 
 static struct comm_strs {
 	struct rw_semaphore lock;
-	struct comm_str **strs;
-	int num_strs;
-	int capacity;
+	struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock);
+	int num_strs __guarded_by(&lock);
+	int capacity __guarded_by(&lock);
 } _comm_strs;
 
 static void comm_strs__remove_if_last(struct comm_str *cs);
-- 
2.56.1.703.gf848ed807c-goog

