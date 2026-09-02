Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BBC3E49E2;
	Wed,  2 Sep 2026 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335707; cv=none; b=NjxlhzlhndcOMPiZ1DvjQw1R3bd0De+28xPZgkAq6dhoDTodiP5rztBi432SYLc5pgnO998nmlbbAiRE75+uKK1LFmJ692zZzYhNtC5YH0BcNqdTTM54KayTToH92QdyT3YJFotIcRygX5SNt8/kFWLIqTWnWL9BZRJXhqPhCW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335707; c=relaxed/simple;
	bh=7bKNmX+kDtRbShyrcmKlDElgz2k2tKD9wffcng2ARbg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=nhUnF4bVKpQYY/MJmb9nfKuweSUsnWfrsWO4lOh6R6v8T/FdW4/a6VE6qjjW/WPx2u1+hbA0lBRe/D71wm2k5NCqecrOaQWC4nCSWxoiIfSYtmmyUm6AVOHYQyMe4HlcRVODEorsX9LZkFzYr0TZGFm+nszbiiuRvj6c5KCQduI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RsN97bqJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S7m5/e1W; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RsN97bqJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S7m5/e1W"
Date: Wed, 02 Sep 2026 07:55:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335703;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2tTnZKGhvg9mtpCn8dvFykmsek9kYeo0XFMSidq0GGg=;
	b=RsN97bqJlGXRy1J6DQGhIgYbU8uQncbT0z3cwgJ/Wycdd1YZvb0EpR0s7cHzF9yZTzIDhl
	RwenMtjI/CVAXXBWeHSJyfInL5YYCOTINc7fmSFoe0iFscTSv6scmwVkAM7ZhrwFSNaocJ
	TsNV+IYnLdyz7zga3un+owQJYqAbt06AfH86UXHmfb3RHk4M1yZS13QnNmxXkmd2YR0fWO
	OfS2iGbqdfKmfzI1bosD7RufGw/S6Z7cGWbFIlR7HB5uRI8oUf6/RMdtwdheAJ8wLESNyF
	zcjoGcF2R6K88iRejomvSJeYPCEdsryRf55fGmMO630H0iTbV+XQ4lyFuLfLFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335703;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2tTnZKGhvg9mtpCn8dvFykmsek9kYeo0XFMSidq0GGg=;
	b=S7m5/e1WoudhspQUabFgg7T0mBG5aUxqliaYrzU3b1I2GR6nlPZGMLLNrNCaDfHSkB6Hpg
	K7y7q8MQ32blEvCA==
From: "tip-bot2 for John Stultz" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/core: Avoid migrating blocked_on tasks
Cc: John Stultz <jstultz@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260807035232.1881495-4-jstultz@google.com>
References: <20260807035232.1881495-4-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833570234.3717435.8767763400681840457.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     9be817f991e2eba140669d350df2a07d81f26fc8
Gitweb:        https://git.kernel.org/tip/9be817f991e2eba140669d350df2a07d81f=
26fc8
Author:        John Stultz <jstultz@google.com>
AuthorDate:    Fri, 07 Aug 2026 03:52:09=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:20 +02:00

sched/core: Avoid migrating blocked_on tasks

Its not useful to migrate blocked_on tasks from other
runqueues as the proxy logic will just migrate it
back to the owner's rq. So skip blocked_on tasks here.

Signed-off-by: John Stultz <jstultz@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260807035232.1881495-4-jstultz@google.com
---
 kernel/sched/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 7adbdcc..0f06f8d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6512,6 +6512,9 @@ static bool try_steal_cookie(int this, int that)
 		if (p =3D=3D src->core_pick || p =3D=3D src->curr || p =3D=3D src->donor)
 			goto next;
=20
+		if (task_is_blocked(p))
+			goto next;
+
 		if (!is_cpu_allowed(p, this))
 			goto next;
=20
