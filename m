Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362925;
	b=I6MLVRWtAXvvp5TDOw/utbQcumv6HKvtsKdy0rb1X1niE3hccdUN27ores9EEc05flp8
	 djfrE8B2szZrYV7ncxk5iRVU11QagrCVcQ0d8B8ilS+xRLMCB1rdILx1mb99E9Q+0BtLj
	 TqegQcMaQmB6SR3TdeVVoy1PkgZ2za9HTDT9jewnwY/eb4ik/+TkQPjk8xOmyKGDHt921
	 9XRAJBfw78VqvjFbQQnp+OrpNfOsS8OdTSAAKip1z/a1pMTEw4yOz/ANnms9/6bFsLGAg
	 2ZBV7nKa8J7vspmyRD0yyy9S9zpGpIe8eWACBN5cXyMuGQVszQ3pTg15kxQF0M1bWUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IqRkQAWA6x79NK/foSAYp+LfNrOBVrF5NDpnzdsePVo=;
	b=syz2t+hBac0vTkZNVarC2ShuNOCKo8rfgcjlopNbLGmPLUkNJYweFtH0cXqCDUEu4O2D
	 RbTGf8KUAf2A0y6SzTw+sCkno6PMd3cS6L1tx3EnAcvbhihpGGD3qkRZWlcRjKlLbjbr2
	 LwVYE9843Us17MzXDjEwsGDUSB7WjzsgW+sxl9kpbkYj2BlGptXUQYMwLxZLDKtXqvjRT
	 rJ1L938xjoXzAfBtS67wvAKMVbBn41y2pp9wOfVtvocg17S0fwAaqwjhvJ+5f87c9ikWR
	 RT9GOAbXlbfgo/TJNOlyRAVarKLzCEmg57ZYefHkWkc/GKut8hkqbUascZBL5KCjpAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Y/RzuCcz";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5A8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y/RzuCcz
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36d1b3b9974so9834eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794362924; x=1794967724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IqRkQAWA6x79NK/foSAYp+LfNrOBVrF5NDpnzdsePVo=;
        b=Y/RzuCcz11gPiJ4voG226bkg8toO3K9UlJWCo6HoE5c4W9tW4fL1ED84UmKoUc8Zu7
         tBfUzu3oObPhDBJOUpY1HzB5owa8Tz9wFdmGoOo9aga8JPTAxoLQoMMNwtizl0iHD/dI
         L2UAyV6V3DV5OtOq1K9ZQRqdMUqphgZu5u850yXGYA4wUDn/ajyvB9ZbveC10Zp2pSve
         /eULW8xTqz3yWc4EQoVlhFXMbQQBVbjQKsvqnesPnHzzf8A5aUWG8keijou05OsplmCf
         2ckmmhCAIuU24zVnf6llkJcprGLCjdw3uPtvgjjQyK37KX9BqUNkNS6a7fJkHxr6iKzX
         A59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794362924; x=1794967724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqRkQAWA6x79NK/foSAYp+LfNrOBVrF5NDpnzdsePVo=;
        b=omoC8rMs2YJ0fufJDGHIifhu9hLkkEa9Tpq/0vqdUfv2RbArSgvd38+4F+xGSGZlud
         iY9ro+cGJ7o8tEMcy2zgobELaL3IYDvKqF7TUjR0b3eNKWSghOmO5WbHBgzlHtijUiHw
         hkLFldtiZr6DWv6nP5lJVBrcK5CpDXsTs8NA5PuhDNDaiiWd69CNdYFODKQEPTYQ76hb
         EbSx5EAs9mEV6Su/7OrS/fnWgCa+ivP2XwUz2bocU3j07uqnlQVoT4bDowmeeIXTJheN
         ykddiZAc7v61e5+JsXTpFGEYF1+IKfJZxfruNmNIvgAkpRtS1KuafSZxkAwx9NZEUaHh
         hXew==
X-Forwarded-Encrypted: i=1; AL+hErGj3obUSDXWKmld4ooLuoWzqDRe97hYUSnrwZ/idge9ksF0ew41BCVwYpaFGUqMRnRccnzZkN/rCceAtX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CTTTj+0cshOWW2F1stGHigveYo4KXfiZl5d+J5LtiJQgA6v/c
	MAj10+Xbld5IrFRhptuP10u2+lVc7F0MxNUIJcDwxcpDaYeSImS2ypna
X-Gm-Gg: AYBFou0g8Hh6P3BUt38q3FTn0cVn4FidtBeUhhBorDGPkIOfWglhHjwBks/0/JIw9UR
	XgnmkDypK9gHBk9F1xGXZ3vl74UX2uze05CQsJ0kW2B00tHAn1waO9onLcgq8pBW8znb8vmYOSY
	AMdxsQz9RoaqdtNp5ve9hyETwJuDB50SGjTe3oYUnFd3CDihhALw7lex+Pmqaxy81lVqhudvirR
	q164QjJ73khM4TqzfsVlLSE5dT9UV2D+MbUCiu1S3tX4EVYFWRe0yNsfh7NW6+bVrFXgqxvExHB
	pSpFcQHe9g4Ya4qBH1STye6qwzry3yOVoeliixJAayjawhhzQZQHCsFQU2sQo+6iwHvew6XXmvm
	yuNKryMozxST/H5C4NagYEEuTpt3ks3xOjWr1hOFa4ibgO9KmZtxpAE/MB1SIekJXKx3mD98Sdr
	mawkR2ZL4eXi3HE2r4R2yPhgSy1DX3+I7iBG6nAyi6Ot9Dlz61wufhm+QcGJNc71f4Au3ayihaw
	rJbGiZv9iuJKWFWJxWX7gv1aeg6fggGyoVXpdpchQJy4Lq9fY7MmQ/sOEBQMqateIVVZiGxuwmD
	CFNyXovzRxSkrNT8qr0BICXjwtex5Q5lZY0iJzbTWt6xSbrLyImGFVU=
X-Received: by 2002:a05:693c:20cd:20b0:375:f846:5b3f with SMTP id 5a478bee46e88-3767fe8f34bmr2355849eec.0.1794362924193;
        Tue, 10 Nov 2026 18:08:44 -0800 (PST)
Received: from mi-ThinkCentre-M760t.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm12644625eec.14.2026.11.10.18.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:08:43 -0800 (PST)
From: Wenwu Hou <hwenwur@gmail.com>
To: linux-trace-kernel@vger.kernel.org
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	frederic@kernel.org,
	Wenwu Hou <hwenwur@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] tracing/hwlat: Bind the sampler kthread instead of setting its affinity
Date: Wed, 11 Nov 2026 10:07:55 +0800
Message-ID: <20261111020755.1422284-1-hwenwur@gmail.com>
X-Mailer: git-send-email 2.43.0
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

start_single_kthread() sets the affinity of the kthread it just created
before waking it up, but kthread_affine_node() overrides that mask on the
first wake-up. See commit 60ba9c38b931 ("kthread: Comment on the purpose
and placement of kthread_affine_node() call").

In round-robin mode, move_to_next_cpu() compares save_cpumask against
current->cpus_ptr, sees the replaced mask, and switches the tracer to
MODE_NONE on its very first iteration:

  hwlat_detector: cpumask changed while in round-robin mode,
  switching to mode none

So the tracer no longer migrates across tracing_cpumask. More importantly,
tracing_cpumask is not honoured at all, and with isolcpus=/nohz_full= the
thread cannot run on the isolated CPUs it is meant to sample.

Use kthread_bind_mask() instead. hwlat requires exactly the CPUs in
tracing_cpumask, isolated ones included, so a hard binding is the correct
semantics; the PF_NO_SETAFFINITY it sets is precisely what tells
kthread_affine_node() to leave the thread alone. The in-thread
set_cpus_allowed_ptr() in move_to_next_cpu() keeps working, since
PF_NO_SETAFFINITY only gates the user-facing SCA_CHECK path.

The mask is now computed and validated before kthread_create(), which also
avoids creating a thread when tracing_cpumask has no online CPU in common:
cpumask_first() returned nr_cpu_ids there and cpumask_set_cpu() then wrote
past the end of the mask.

Tested on a 4-vCPU KVM guest, bit 0 of the mask is CPU 0:

  mode        mask    before                    after
  none        0b0101  Cpus_allowed_list: 0-3    0,2
  round-robin 0b1111  mode -> none, no migrate  migrates 1 2 3 0
  round-robin 0b0101  mask 0-3, no migrate      migrates 0 2
  per-cpu     0b0110  2 threads, cpus 1,2      2 threads, cpus 1,2

Fixes: d1a89197589c4 ("kthread: Default affine kthread to its preferred NUMA node")
Cc: stable@vger.kernel.org
Signed-off-by: Wenwu Hou <hwenwur@gmail.com>
---
 kernel/trace/trace_hwlat.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/trace_hwlat.c b/kernel/trace/trace_hwlat.c
index 3fe274b84f1c2..65e184d800ff1 100644
--- a/kernel/trace/trace_hwlat.c
+++ b/kernel/trace/trace_hwlat.c
@@ -423,15 +423,12 @@ static int start_single_kthread(struct trace_array *tr)
 	if (kdata->kthread)
 		goto out_put_cpus;
 
-	kthread = kthread_create(kthread_fn, NULL, "hwlatd");
-	if (IS_ERR(kthread)) {
-		pr_err(BANNER "could not start sampling thread\n");
-		cpus_read_unlock();
-		return -ENOMEM;
-	}
-
 	/* Just pick the first CPU on first iteration */
 	cpumask_and(current_mask, cpu_online_mask, tr->tracing_cpumask);
+	if (cpumask_empty(current_mask)) {
+		cpus_read_unlock();
+		return -EINVAL;
+	}
 
 	if (hwlat_data.thread_mode == MODE_ROUND_ROBIN) {
 		next_cpu = cpumask_first(current_mask);
@@ -440,7 +437,14 @@ static int start_single_kthread(struct trace_array *tr)
 
 	}
 
-	set_cpus_allowed_ptr(kthread, current_mask);
+	kthread = kthread_create(kthread_fn, NULL, "hwlatd");
+	if (IS_ERR(kthread)) {
+		pr_err(BANNER "could not start sampling thread\n");
+		cpus_read_unlock();
+		return -ENOMEM;
+	}
+
+	kthread_bind_mask(kthread, current_mask);
 
 	kdata->kthread = kthread;
 	wake_up_process(kthread);
-- 
2.43.0

