Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B254C6811;
	Tue, 22 Sep 2026 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070399; cv=none; b=ViZ8D1dlWVEkAJDVHLq01RkUyjIkYPG2jpTIpHrNxv6IG7P9dPQtAY13fryrsPq6xgPUaJluKY1AZNKKQ7jn+UL5VIaknIrguVMu0882WyCNG49XhuWNO6QQH7mhIcJHy+6yXQiPXoaBUDotHTZTJOk0/gQ5HHBIkJItTib8Rz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070399; c=relaxed/simple;
	bh=tgOndVYKcSb6AuO600nuUUXDfJ2h+6xZjlKWMl34dJs=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=OJTm3oeuPgp2GJBheYWcVOP2eYGjFyj0k1RYYva4UMPWgVh0UzNlBDy3m7gKgn4RCTvBPD+p9K+A2m2dHAwexiHIGBeKL2S055UyjrbqQFpKM6WbML2R7N9z9pRBIKOByAFx1xegCystD2vkfJVBE2O1rLKAP4LxlylACJL80Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=byvVJy6Z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UnUMeQjL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="byvVJy6Z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UnUMeQjL"
Date: Tue, 22 Sep 2026 09:46:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070395;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JB/b54mBUfX/lnip0tuyQcmD9wDA4sxwjidrLyUT/jo=;
	b=byvVJy6ZRCSvWAUyDYUEK0t5TbEboIe/tCZQgbpon6JqHt8WBijlmNv3ZhPVGAq1/YLd+L
	EQgQIH/DmTs8WEII5bthKPBHQw0S+aRPLamtCptBpRux4tYLXfCsTUTzxZBx02XFMD0Zsp
	SLuilNXFtHj8I8jPxwHBoY5BJ93pgJWsrZ/enXAFmg31oHPyxcug7qgvLZDVTQegl8Afi0
	nPlUQH5EGC9/KmWRHB28UMGbDrwuC7KXG4mpYSyuW1yeogSZoklOU2aoL+RHVI6FYoNM8f
	KeMyYXLc8jwi8VAliMqMWdh3uPfbZTq6DOfMj3vTUM3meI52mSirWHgZpGPm8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070395;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JB/b54mBUfX/lnip0tuyQcmD9wDA4sxwjidrLyUT/jo=;
	b=UnUMeQjLmWXMR0HAzWEHMgeUGyD7P1tu0OrrDuUGjPfPh97u5i8CkqBWWRga0ldR2zJ3Gp
	u5GeZmMHa1FSFGCw==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/x86/intel: Update arw_latency_data() mem-op
 direction handling
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917015234.981153-5-dapeng1.mi@linux.intel.com>
References: <20260917015234.981153-5-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007039423.2819794.3315650483510324112.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     335b0642812ee0f2b7798b634ce507b8b7c9fe0c
Gitweb:        https://git.kernel.org/tip/335b0642812ee0f2b7798b634ce507b8b7c=
9fe0c
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Thu, 17 Sep 2026 09:52:26 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 11:19:35 +02:00

perf/x86/intel: Update arw_latency_data() mem-op direction handling

Align arw_latency_data() with other *_latency_data() helpers by
explicitly decoding LOAD/STORE event flags when setting the sampled
memory operation direction.

This keeps the latency data path behavior consistent across platforms
and avoids relying on implicit direction inference.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260917015234.981153-5-dapeng1.mi@linux.intel=
.com
---
 arch/x86/events/intel/ds.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index ea5b331..c0004b0 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -538,7 +538,11 @@ static u64 arw_latency_data(struct perf_event *event, u6=
4 status)
 		val |=3D P(BLK, NA);
=20
 	src.val =3D val;
-	if (event->hw.flags & PERF_X86_EVENT_PEBS_ST_HSW)
+	if (event->hw.flags &
+	    (PERF_X86_EVENT_PEBS_LDLAT | PERF_X86_EVENT_PEBS_LD_HSW))
+		src.mem_op =3D P(OP, LOAD);
+	if (event->hw.flags &
+	    (PERF_X86_EVENT_PEBS_STLAT | PERF_X86_EVENT_PEBS_ST_HSW))
 		src.mem_op =3D P(OP, STORE);
=20
 	return src.val;
