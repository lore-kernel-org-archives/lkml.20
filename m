Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ED03D75CE;
	Wed,  2 Sep 2026 07:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333730; cv=none; b=JCmr6Zra5SFnRff9W1kLHaCT07XO96IAOWz4p49nIH5P8GyPNyVK7B5s94KZGDLLjN+Txz9qaIxcEvf0I33IZ9F3+8odcl25Y8vIsyfOfrpj0oJnJhYKHmRYoQat3ZROujCpWTvmItT1xvtwbcLeGUNODvZ8sHCmTBLna7R+kyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333730; c=relaxed/simple;
	bh=KhA8W/yfIg8Q9sZlfFDbIqpEOgFkXlIyIdGNNsqCKCg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=gSWum1V80ZcoizpGhm3Wl871djFFCp/H8UZiGZbPbnKRYDGeCXQByMvYghAu7F28rMs/NkKvV0yNHH12ISPg+NZfgk5DxNtQYVLCZcoFJ/SetBQ5ZEB83TUDr0ZTAnmODdTOEB54AM8ugn6wLLUlLsr9/QhYVZvaEZ/2GsMxsbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XtOqC3N7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=InPzT629; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XtOqC3N7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="InPzT629"
Date: Wed, 02 Sep 2026 07:21:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788333720;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7O0HnFnku2LTnN6PiDSj8GRoTmCsN1O44aWCdFyoQX0=;
	b=XtOqC3N76jtVK8U+m20QdH0H7P03t57MltiXobis6DWMN5ZJkeD1hEGYE9uuq34YC8qvyK
	XfOVOy5koyPNrRdQn8AHzZY9kXrDV66bUVn7HUSRV/JyGHX0QWnV9XhUMw8H1csv9xCfcY
	UHmYW0JCL/xUoxxixxiq//kbmi0HcT4Rn8gxzz8aqeU8qtI/GE8gu7HLTD5IpV0wStxn60
	KtknNmjAGkp4B/9AvM9UfMe1aoTOkaIBxxbEHovLyxohD3Ehcu8VRpCOn4ilgWPo50dHti
	FigV601LNW9Iy0WH2qJe3x1U9Smcca+Eh/wqG+lBwOqWi2EsK0xRI/7dCzNsMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788333720;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7O0HnFnku2LTnN6PiDSj8GRoTmCsN1O44aWCdFyoQX0=;
	b=InPzT629L/zWPwoDDnge0v1XCbQym+IFbFPTo6YsyE/ysJGYUNXmwgHyrYTa0j80ATkKUt
	KGqmwuGbBP4WPwCw==
From: "tip-bot2 for Wanwu Li" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/fair: Use cfs_rq->h_curr in
 distribute_cfs_runtime()
Cc: Wanwu Li <liwanwu@kylinos.cn>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Aaron Lu <ziqianlu@bytedance.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260831101141.391382-3-liwanwu@kylinos.cn>
References: <20260831101141.391382-3-liwanwu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833371909.3717435.9905002541865201334.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     b038383526d8c7883ea0486dd1911102b6dda414
Gitweb:        https://git.kernel.org/tip/b038383526d8c7883ea0486dd1911102b6d=
da414
Author:        Wanwu Li <liwanwu@kylinos.cn>
AuthorDate:    Mon, 31 Aug 2026 18:11:41 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:17:50 +02:00

sched/fair: Use cfs_rq->h_curr in distribute_cfs_runtime()

distribute_cfs_runtime() refreshes the rq clock and accounts elapsed
runtime with update_curr() before redistributing bandwidth, but gates
this on cfs_rq->curr. Since commit 85570f10a4c6 ("sched/eevdf: Move to
a single runqueue") cfs_rq->curr is only maintained on the root
cfs_rq, so for the cgroup cfs_rqs it walks, the check never fires and
the refresh is dead code.

Use cfs_rq->h_curr, the per-level current entity, restoring the
intended behaviour: only refresh when something is actually running at
the throttled level, i.e. within the deferred throttle window.
Without this, runtime consumed by a still-running task of the
throttled hierarchy is not docked before redistribution;
unthrottle_cfs_rq() catches up unconditionally since
commit 28ad5427682b ("sched/fair: Call update_curr() before
unthrottling the hierarchy"), so this is not a correctness hole today,
but the refresh the check was written for is gone.

Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
Signed-off-by: Wanwu Li <liwanwu@kylinos.cn>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Aaron Lu <ziqianlu@bytedance.com>
Tested-by: Aaron Lu <ziqianlu@bytedance.com>
Link: https://patch.msgid.link/20260831101141.391382-3-liwanwu@kylinos.cn
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 73797d6..97021a5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7192,7 +7192,7 @@ static bool distribute_cfs_runtime(struct cfs_bandwidth=
 *cfs_b)
 		if (!list_empty(&cfs_rq->throttled_csd_list))
 			continue;
=20
-		if (cfs_rq->curr) {
+		if (cfs_rq->h_curr) {
 			update_rq_clock(rq);
 			update_curr(cfs_rq);
 		}
