Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834482;
	b=flxSEXNl7uH0RE6mGleCrdbc78dF6xPGxMCEh15/RhaWFx+dUF6NZgw4KH9fi0KYgx32
	 ir61Kt9fCmU1uHKrVQRhq6WW9wRMQrWcIOuMjx2mrK5xHwohv1NKLTC/jXnpejqyJawiH
	 yEODICQVVIAk18arMnaZNENhrXQL6MMEvslQof9QnRvJQe59OIpF4X8vBe50nMJ+zsRIW
	 DYHePaEYS23hHb42ZjcnjDBQlBPK8AK7E5uYoCiuAhNuChSQloHKGST1yXrGGQnq+rfD8
	 3N7JxUlU1NNHGp0SGRDBs+3QntKtFcCIHGVZbvw4dIkEtS/2xl3pAsPqp0OceAV8byQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=itR1YfXdw68plWLAJU8qPrVZYvCmpJpw3Vk4YT4jpd0=;
	b=N/LmDLZdOZvQDPwSSYL2xVMBzBCcsvTtkatz4I9iJsdLNduzplQ7GYX5potKR36Mf14Y
	 uI9hlsbe0z+RDzaii3b8cB4Z/0VMYWmlJ9FoEhmYyvWnhbLqV5Wn8x9xZVulyjmhNnZp3
	 0uM6oEwG8Z0kSBbDtJvl6s3BuGTKPv1Vfqpx8rDZlWXIrWCmxIWtYcdeiPqwpFYF1CEYU
	 7+Em5IvosjNvFXxWoq1TYro1oJGwMBC/qRxcrsS3fL8C79tZnJZ/13DB0YBFzJFzryvD/
	 Sfeh+1J7BE/ZF3YxwXvy5HfeKA68RZAx7lGKZGT84Mqd2sLMS3qzZ/ovocBwXBO9v4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hd8tSodC;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA69606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA69606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hd8tSodC
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso1700011a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794834480; x=1795439280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=itR1YfXdw68plWLAJU8qPrVZYvCmpJpw3Vk4YT4jpd0=;
        b=hd8tSodCq01+IdEPKWUqexRLHxVzMeBwxDmelh3sZ50m3fMepbts1xTYX1exooWWwn
         eYiIODXqCvooinEafeo5uX/A0dOIlZXZ4R+oI4W9uN0oH1jQ3Mw0JRKNpIf8ncj5D9XZ
         bDID7lTxxiNdMJI90O/d4/Gnhg7wvhTv67Q9RO67pEgRjjOgw5gVG0tidoSXKNIUqG3A
         1uyrITTGCANcDRdLpvVMZHHS1SdKYPoxdPKETqSv69hngcjc/pKfBXbNiwJXN/lBjv3v
         89/WZAHJGxItG9v8fg7IMH7la1nC87rsOn/Hrzzp2b/3Uaf7pMMN89A6QH9F6Io7mSKd
         MEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834480; x=1795439280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itR1YfXdw68plWLAJU8qPrVZYvCmpJpw3Vk4YT4jpd0=;
        b=zwdgtiyUdZNKCj8BFisLM+xcAMd82F+bmJ56rKy5brkptkb7X33wpYNnNra/kPWgog
         33qXFaUi984cCP9I+FTkGlRdzqO3QBqOYi+a3H4IT5RQ/l/KksoQ/5xmpMKlLRECJq9U
         aU1NTiuvasC+T5AQ1U2GgF+tTuA4dSoYlWCUPeVGgwEeS2/sWDcBIjDskYb0cIB+tAud
         0v/GgeVv+EQm+a+nlrizD5upxoMriNIbzx9TGSeU3w4UM4CiXp4mCW4BTf4fDT7oDMe7
         csf6kyUKW4ZruGjI4Lvr1JgBZTm76/y3IzhvyEQQwqFvKd4AOCqXZLgfG47/IZLgJar5
         b9Sw==
X-Forwarded-Encrypted: i=1; AL+hErHiSPC8IBPKU9IJpKwPjE7mVCXB7yktlMgbeishkBOBjYX96YXMwPYv23C2NSpob4XZxPNhm2mf5fxX7e0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YG43tJnvWSNWse1+Lt8/9EvfWeRC0Bc2hNiTUvvuHaEhIpRya
	ss3AwUdNWjVvcRlh5ZGGG8CJmnaY+6lLcVqt3juAL3tmth6kkb1z+XuEbms6MT262ds3KRTN
X-Gm-Gg: AZFdTZfBMKTQDdJWooJv2OBc/VBCKOT3PQxJyZsL/2+5EmY/9+LZeQbI9y+Ahwg04Kw
	iqXeC7AfpGYw6I1ePdYSayjYDvvBMzbQt3qPqlMcUQP2JLsldxMD6pG33TU53ec3YR5SAIIyN/8
	4JFl2UAsa+DLafY/aMkmh2IVKQaIYxdnoEAxepuqqfvSgweE/3N6Et/WIQ0ulR2lKF3tuaD8joy
	AHflhJ1krEUSoct/yiU7M8F/z/ykXKpJg9EvyXLFKJGXRCQNbZ5YxglsQ+SpU4WREQGKt0PFJO9
	pNzILuRhZu4vL6nCQxo/MIAeDdFHXLAYJFt0bxOtWjebeyWUhiPvBQtQP4gpxoQp+gii/VqjE8n
	vCj2euUrMB59S3GneYlIIAQvv3IgwxLEYyC+XKfqAUSfZ/J0LqpZ23e3d7kH3ONqFBZIw8k49DZ
	hc6VRqVququbWM7aPydUMsva0IWgyaa+JACWG2mCub39KY4p1bpOjrEV9okTMOu7TXV3DE/Plp0
	XiI6uMOt20pjIGLERuFvDZX+3HTkqU5Mb8lG+dvMpH4ifg5BRqWdJhdfi/NAY4XRK/JeC8sxJWQ
	dhfwdTBbjikPZJz+wiuVPFFHpZkdJYjxJCXh2doVr21oN/ZWZ+r/KqoxKux9qKuwnihe4VwQ9cK
	tpes40aXBKpmX1tcK6INu1UFBmxRFpma2WLeaPfsWKSQVUJWXhUPQNL85PLOwAHF4pJBl9B4T85
	O0RJbDD2bgITr6geNIRkkLxS/nSoMUkKTkodW5i7/3D2S0mMQh/HQPHU+wmNRLXU3gugOhCJC4P
	1bvYDAfyf3QQh0mX789M2cOOqp+SAQbJ77+JOK+YvTxovVx6KhxbyqsxaSx1aKdFY01Vq3h4PqY
	4DH73T2LiA==
X-Received: by 2002:a17:90b:4a45:b0:3ac:af8b:6f3 with SMTP id 98e67ed59e1d1-3b1b0b5e4bfmr9173020a91.52.1794834480402;
        Mon, 16 Nov 2026 05:08:00 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4352sm4494530a12.24.2026.11.16.05.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:07:59 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Aditya Chillara <aditya.chillara@oss.qualcomm.com>,
	Jun Yang <junvyyang@tencent.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf: Don't read the original event's pmu_ctx in inherit_event()
Date: Mon, 16 Nov 2026 23:37:35 +1030
Message-Id: <20261116130736.32585-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

inherit_event() walks @parent_event up to the original, top-level event
and takes the PMU from its pmu_ctx. perf_event_init_context() holds the
mutex of the forking task's own context, but that original is attached to
the context it was opened in, whose mutex and lock are both unheld, and the
fork is not in an RCU read-side section. The move_group path of
perf_event_open() drops that pmu_ctx with put_pmu_ctx(), which can free it
through call_rcu(), and reinstalls the pointer only two loops later:

  G: perf_event_open(group_fd = P)      M, a child of G: fork()
  --------------------------------      ----------------------------
  put_pmu_ctx(P->pmu_ctx)
    call_rcu(free_epc_rcu)
  [ grace period -> kfree() ]           inherit_event(C)
                                          parent_event = P
                                          P->pmu_ctx->pmu  <-- freed
  P->pmu_ctx = pmu_ctx

The value is used as a struct pmu. No privilege is needed: a software
leader, an inheriting hardware event on the caller's own task, and a fork.

Take the PMU from the event inherit_event() is given, before the
replacement; it is attached to @parent_ctx, whose mutex is held. The result
differs only when the group was moved after the context was cloned from it.

Fixes: 4b9ce6719606 ("perf: Make sure to use pmu_ctx->pmu for groups")
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
Cc: stable@vger.kernel.org
---
Tested on mainline b3dfbde62cf1 (kernel/events identical to v7.4-rc2),
x86-64 with KASAN and lockdep, as uid 65534 at perf_event_paranoid 2.

With synchronize_rcu(), rcu_barrier() and msleep(3000) after that
put_pmu_ctx() to hold the window open, and no patch: "BUG: KASAN:
slab-use-after-free in inherit_event", freed from an RCU callback queued by
put_pmu_ctx(), then an oops in perf_ctx_disable(). With the delay and this
patch, and with this patch and no delay: clean.

Not tested without the delay: only a task whose own context is not the
leader's can race it, since perf_event_init_context() takes the forking
task's ctx->mutex and perf_event_open() takes the leader's.

4b9ce6719606 is in 6.6, 6.12, 6.18 and 6.19 stable. Jun Yang's unmerged
"perf/core: Remove group siblings before the leader in move_group" reorders
that block; it shortens this window but does not close it.

 kernel/events/core.c |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index f5f2261f1fe..544a2c10409 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -14974,6 +14974,15 @@ inherit_event(struct perf_event *parent_event,
 	struct perf_event_pmu_context *pmu_ctx;
 	struct perf_event *child_event;
 	unsigned long flags;
+	struct pmu *pmu;
+
+	/*
+	 * @parent_event is attached to @parent_ctx, whose mutex is held, so
+	 * its pmu_ctx is stable. The original it is replaced with below can
+	 * be in another context, where perf_event_open()'s move_group path
+	 * may have dropped the pmu_ctx and not yet installed the new one.
+	 */
+	pmu = parent_event->pmu_ctx->pmu;
 
 	/*
 	 * Instead of creating recursive hierarchies of events,
@@ -15003,7 +15012,7 @@ inherit_event(struct perf_event *parent_event,
 	get_ctx(child_ctx);
 	child_event->ctx = child_ctx;
 
-	pmu_ctx = find_get_pmu_context(parent_event->pmu_ctx->pmu, child_ctx, child_event);
+	pmu_ctx = find_get_pmu_context(pmu, child_ctx, child_event);
 	if (IS_ERR(pmu_ctx)) {
 		free_event(child_event);
 		return ERR_CAST(pmu_ctx);
