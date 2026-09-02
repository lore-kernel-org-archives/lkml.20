Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C48A3EC81B;
	Wed,  2 Sep 2026 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335708; cv=none; b=SmDGzpYLrQWAUYnROuk+5KpMHEvyitaYtGm+wd9eAeMh7IXSfbXT3PM3VcJjnO+/OHQrDYGzT1Tcqf7UdXHlzMANYY4BlzrziihUSLAKhWLPQUG0OfKQal5OxFtvfuV/apD9MQhjcIG44DEPJrG919tr60oGuVfvIMA3nCIp7RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335708; c=relaxed/simple;
	bh=tkCqm2URo3zHGJN85D/BUNyBpGH+qhvn+IQWGVUmH58=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Q3AP0Pv22wTIaZxESWF42c6D9JQ7CVDwY2OwQ8g9sXaQpSwC1lwgVYdvVtP0KX+IdyM7p2MnJs5v9RMJh8wBaj+9uE0DHoAmGs25eUO0YfbCRNnW6/hBvzz5WJWuE6uhFG2WJNSeA036367hnaX7gTwnyh+v/7S1ziicIbwmp0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X9hn4Gt1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FISPM0V/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X9hn4Gt1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FISPM0V/"
Date: Wed, 02 Sep 2026 07:55:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335705;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WlGzTXcdal5DoJT6gZixN3/+MdUghkT2bZ0Olj0OaKI=;
	b=X9hn4Gt1oRAzh/J+HkczvriIQXU5ipof+tn89PCg+ejRnjyFTIG6t9OfpxX8DKYzWKl5wE
	nv2WjJ86WkatLgJvnYTfeQcGqupRQymBYH6EeIP5WgJjkVwe4m2iFry8tyxV7ycoqZ01yg
	i9yp+BbhM5G24VgQ/+iXbQanETxQF53Fu5XolhBMYNSl2UFXdooT5B6/9QwL6rl6stg3Bc
	vswPZMvw3dZt4KfK4tsDfUT2CgeAnafMUH8XDTzaJHIjmbYtQFpfmyxA8ZViSNoMAi6hx3
	ytFfXo38Thj2JV/7xrk3Jt+iohoXkiCYZfxffJ6d0kcySpNKgLORMEVLEEw4DA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335705;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WlGzTXcdal5DoJT6gZixN3/+MdUghkT2bZ0Olj0OaKI=;
	b=FISPM0V/J6fyKoyWSvfPElHMyzu5xuNaojX4p5NQUKBfzMfkDN21fSEKRogJ47jCblA8Ci
	KjwJDepPqPJyuzDQ==
From: "tip-bot2 for Vasily Gorbik" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/core: Don't steal a proxy-exec donor
Cc: Vasily Gorbik <gor@linux.ibm.com>, John Stultz <jstultz@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260807035232.1881495-3-jstultz@google.com>
References: <20260807035232.1881495-3-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833570378.3717435.7645032389663532008.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     3dd95f077371f5def65a91c4bb13bd574a62bc3a
Gitweb:        https://git.kernel.org/tip/3dd95f077371f5def65a91c4bb13bd574a6=
2bc3a
Author:        Vasily Gorbik <gor@linux.ibm.com>
AuthorDate:    Fri, 07 Aug 2026 03:52:08=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:20 +02:00

sched/core: Don't steal a proxy-exec donor

try_steal_cookie() avoids stealing src->core_pick and src->curr before
moving a task with the same cookie via move_queued_task_locked().

With proxy-exec, src->donor is the current scheduling context and may
differ from src->curr. Stealing it migrates a task that the source rq
still treats as current, leaving src's scheduler state for that task
stale. For CFS this means cfs_rq->curr points at the stolen entity,
and the next pick on the source rq hits the WARN_ON_ONCE in
put_prev_entity().

Commit 7de9d4f94638 ("sched: Start blocked_on chain processing in
find_proxy_task()") tweaked the fair class logic so that the donor task
isn't migrated away while we're running the proxy. Do it similarly for
try_steal_cookie() and skip src->donor as well.

Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_=
task()")
Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
Signed-off-by: John Stultz <jstultz@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260807035232.1881495-3-jstultz@google.com
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 7472450..7adbdcc 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6509,7 +6509,7 @@ static bool try_steal_cookie(int this, int that)
 		return false;
=20
 	do {
-		if (p =3D=3D src->core_pick || p =3D=3D src->curr)
+		if (p =3D=3D src->core_pick || p =3D=3D src->curr || p =3D=3D src->donor)
 			goto next;
=20
 		if (!is_cpu_allowed(p, this))
