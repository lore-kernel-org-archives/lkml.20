Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB6943CE7C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767961; cv=none; b=CHz+Wb63zVjwTA+ba3LvlFVprcc/S9+XecBKL5LLuE6XRgnCLBUE7fFsqXFnyOQZvB2O+Bh4hK9wome6AVqj/+msP8865BRgZWB+GvtHcw/6ZqJ4dpwNsFw5RnE8CtL2065u+Ji7tz3O3D0H+F/3EA3z372nGZ0a/0e2hQ5S9gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767961; c=relaxed/simple;
	bh=RzK7kMbyNX0ub/uYwf0yfYkwe5IMNl40/Xs6NO4qP68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAIrsaSrO8SVUIB5Iq2jSPqAkV5IIHsPe9f98lVhSxbuuXrt58uCsEB1t0oBwNr6Lhr12e1OiVqRxK7LzxFlJ09p7ox5CZfzSr/IHW8PxngX4+gMMQhFqDYsJ2Vcv89MXiRdBAXUFNlpWFuJbVVWcfGZ5Wjxuv23LZLQ/vu7Q+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjoTBF35; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjoTBF35"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2db18e5cb56so29079355ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767960; x=1789372760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKFw3PpfzfMC3bCjGChjW74mzAGePmhCsoG4uFIYkwk=;
        b=DjoTBF35k8pJoY/itnQ8weDS5Uya4GAjLz5kc5MU6G6/RELaAPf+poWX0MjouRCgMM
         RMEPIeoPXXeHtJis8HbZZ3cVDTzGQ377RBrafGgece9eUR5oWDj+fot7YH5yOUl6ZzIK
         Gq0Zdy+cuXzRYnGMMJYVqnRIgixD6n/StoNU13J8oiUdVTCP5XCv/2meiMAMaNxL0fPp
         sg2HXmU0d19sWhn22FTMmk8yuQPVz+UT0fWRo+z0wcKJMvCJEqwQTKCaLn/GL1+aYvER
         emVF37/ZpJzfvuKdoKo6fqY0QoSMcxFpFRSbs/aFL2wqFbWEWsfT0A4jG+myytNsqGeZ
         ZH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767960; x=1789372760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KKFw3PpfzfMC3bCjGChjW74mzAGePmhCsoG4uFIYkwk=;
        b=CkIe3hgQHu+03kVywvE82+t7/4oZGnpdCoW+ed60AlNpAdruK520IVdj3UteIanvmE
         nmqal88AafIRq4IUwuB+TbuH4ik6uS67UwRmQv2pfB6jhclEXnJLKwl+AuvhIGtLItLa
         D1wOP2+xNR9wh8DQ0yAcd2iOoopJ6CPZHtPLcuHTgg4bCXD5KVsOjgBKD521AzoKnRXp
         Y8Frq3cwvLUwMrcCF3oN7tKmDXtXFLL+OC9E1tLZ3BUwqtYKygToIagOh53qTR63x8+X
         dkOujoPYYqREA4343bSYv+BvLcR3gnaSovRVqlwjlQd23AOrliNmVlELV465nFOn7Ol6
         nlHA==
X-Forwarded-Encrypted: i=1; AKwUvByg5vAgIqX3KW+W8lZNNskZO3Rnu8cjiEhjSXaIjQgjhboDPG5kx+XvqZrK8JL6D1+/V9AY2ZZwXOOK3MY=@vger.kernel.org
X-Gm-Message-State: AFuF++kTZ2gICkdFD/5qd/0xItZToUMO0+pFoXWUEYBLVsxvQ0BOCoZf
	8Ib+Y39ViXJh5fwBIzKv84ru+xuY7GRO+aUYwjd8e1s0EC3ts/fs6IoN
X-Gm-Gg: AYBFou3647FwgnP/FmhnsePyatIT4o38N/Ly91DxoHZT+vKG149G3EPZmjLlgxpxpvn
	FrsTr5O4jTjHaf6QiH9QI6oPRWZc+vKNVdg01Gh2By6RKzuS7WWzKHN2UzJdmMgePaIw2VkM74V
	QTK0rz6cin9XQ1mvIgDVNeA/F93PXNx0c8MIOHzIUjGL8c2r2QBMCMmO1v2FjDs+EiqhfTy3RLc
	13zDNqsKmbmr901U6dC3EmSJLrg3U8AgAmiUzC5M2wshzeE4VoVJFfpCHqbTQYlEg75Mr2+lHPd
	bL4hYYgZo+unN9RTybb/GmDSiDS+RBdi3pWBbA5bx5xF60tzBk1XUTACxEK9eN/9r0THP5Fepij
	daV2obX9sxnVAoM78dtm5DV+ii/zIKcoxUUEyFV3miW1pzmWiYSkg9Xq+y++yQg+ij/rwAcFuKE
	0zeFNXvVSiBgwGxVOpi5viErLrFJbWPIpGJ0J2UtCHAroxiAUiP2ou7LLABQi3U0VEBsSxUNXQb
	2Hoyso=
X-Received: by 2002:a17:903:1acc:b0:2d8:d4d0:7931 with SMTP id d9443c01a7336-2db128bde59mr303579055ad.21.1788767959527;
        Mon, 07 Sep 2026 00:59:19 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm40945595ad.79.2026.09.07.00.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:59:19 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 10/13] srcutree: Skip callback scheduling for atomic SRCU grace periods
Date: Mon,  7 Sep 2026 15:58:26 +0800
Message-ID: <20260907075829.2073224-11-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907075829.2073224-1-kunwu.chan@linux.dev>
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

call_srcu() is forbidden on atomic srcu_struct, so srcu_gp_end() never
has callbacks to invoke for them.  Yet it schedules callback invocation,
which for atomic SRCU's SRCU_SIZE_SMALL state arms the boot CPU's
->delay_work timer every grace period, only for srcu_invoke_callbacks()
to find nothing to do.

Skip this for atomic SRCU.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/srcutree.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 2d2a12f86115..c19f59725706 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -1018,10 +1018,10 @@ static void srcu_gp_end(struct srcu_struct *ssp, bool is_atomic)
 
 	/* Initiate callback invocation as needed. */
 	ss_state = smp_load_acquire(&sup->srcu_size_state);
-	if (ss_state < SRCU_SIZE_WAIT_BARRIER) {
+	if (!is_atomic && ss_state < SRCU_SIZE_WAIT_BARRIER) {
 		srcu_schedule_cbs_sdp(per_cpu_ptr(ssp->sda, get_boot_cpu_id()),
 					cbdelay);
-	} else {
+	} else if (!is_atomic) {
 		idx = rcu_seq_ctr(gpseq) % ARRAY_SIZE(snp->srcu_have_cbs);
 		srcu_for_each_node_breadth_first(ssp, snp) {
 			raw_spin_lock_irq_rcu_node(snp);
-- 
2.43.0

