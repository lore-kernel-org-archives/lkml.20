Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958640;
	b=VNmMAdtH+I5z77A623W7DWmGJPGEZVrt2N/yUuhyl8ZSyW3Y3GkW19vFToHYyy/EbTBI
	 HnWQrvQmqUatwKopogQ/L78ZyXdJ31wQWS727lsMr4cAChy7VRbD3OEya7py1v5eK0y8C
	 /L2MImID+lhZitWYPs35BNWYZa5WwaJWRTV2QEVxqFIm8vdMEp0jJjwVubPs51LFzZW+j
	 xnP/TCGzWUD4WG5i83uS5apx2KZbN29V8Ng6M0ypsAhBoPhXM6cwPjwd/VoIqT7bLZU46
	 8fMKmTL8Or260Op/bugI4UVMzZcvf058snKVB/4Au/CGlzmQ3xRPabZxNkCyMwYeL3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958640;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=/pQlGhK6CYx6P2hTmWSLcfB18T0asnjVw6C5OdqmUZk=;
	b=oT+4WyOfqDNBia5Ksi1gvuXG/BQoaOWyX3aKeic+SZt1czSnGgJisfRTqd8LJqVSij9m
	 QFmCTSVZyoiipO2bs5FYvQKzCq2tCMFYfUR12qIAJauz1Sror4c8XNe8/tq2E08xWZOeK
	 CMRT+wuPK4gBFD+cXnhtGLOdR2Pf6onYHIz1PxydGe5qkldgF975E/RCvznshjY+wTcAS
	 lfTdr7kWIHYmjci0tlWXI18bekmhLJjEfuhFFuE5JQC9OF6X4H3sBij4UwR63MXc6cEoM
	 5yjtL/ee+3Cl0pvarWOVtMB6+NcKeRV8xW/z8jjcOLv+sgfgdrp2MbK7dmyRCpYlI9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YkzsfePT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=w0vt9IxV;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F6F606EEB6;
	Fri,  6 Nov 2026 09:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F6F606EEB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YkzsfePT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=w0vt9IxV
Date: Fri, 06 Nov 2026 09:50:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793958638;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pQlGhK6CYx6P2hTmWSLcfB18T0asnjVw6C5OdqmUZk=;
	b=YkzsfePTtO6v+1njPyo7opMf2fztJyPi1uqrsDHXeLslVejbvJ9MWDXJoKsrkd2gdGZWx0
	3T9g7IshkgZo3YncI5QH5u5ZFuEc3E6kgRridlCfve1/b7XliKOHTfrOaLzc32XzrrrEAU
	uYYmULIl+8LVziNqCUoQUE6nJrmq+Pn2FFuM+KdSjvKB/NQ3Rp2KuIJpwjf9SXhaFdSzem
	XxnXl5LiueLpE8dk8yCKz7lJrOvGKLV3mfgortfIG5i9otMVmCHGxvqa0z6smo+0NOFSZ0
	z39lbGo0mi4hpBw6CMU7oXbwDqFtiH5jhTa5UNZ+7yXf9EV7Rw5d1g9FpNWRIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793958638;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pQlGhK6CYx6P2hTmWSLcfB18T0asnjVw6C5OdqmUZk=;
	b=w0vt9IxVCLGWljmHrdo7w/R7PxJJw6WbNhmh4LavqJ6y5+2gYaxukk2y2kw+UJM9dhMhCP
	QEMvzUGQnmWASzAA==
From: "tip-bot2 for Hui Su" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/urgent] sched/pelt: Fix u32 truncation of the PELT period count
Cc: Hui Su <sh_def@163.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>,
 Kayra Cizmeci <kayracizmeci@gmail.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261023025207.2967903-1-sh_def@163.com>
References: <20261023025207.2967903-1-sh_def@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179395863661.1009794.3409769608044766882.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     a0c755e574e37fddb59edf175f27dc3877e7fe23
Gitweb:        https://git.kernel.org/tip/a0c755e574e37fddb59edf175f27dc3877e=
7fe23
Author:        Hui Su <sh_def@163.com>
AuthorDate:    Fri, 23 Oct 2026 11:52:07 +09:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 10:04:11 +01:00

sched/pelt: Fix u32 truncation of the PELT period count

accumulate_sum() computes the number of elapsed PELT periods in a
u64 but returns u32. When the count is a multiple of 2^32, it is
truncated to zero even though the PELT sums have been updated.

The caller interprets zero as no period boundary crossed and skips
recomputing the averages, leaving *_avg stale relative to *_sum.

Return the period count as u64 so the caller can test it without
truncation.

Fixes: a481db34b9be ("sched/fair: Optimize ___update_sched_avg()")
Signed-off-by: Hui Su <sh_def@163.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Link: https://patch.msgid.link/20261023025207.2967903-1-sh_def@163.com
---
 kernel/sched/pelt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
index 779eb58..d10d57b 100644
--- a/kernel/sched/pelt.c
+++ b/kernel/sched/pelt.c
@@ -99,7 +99,7 @@ static u32 __accumulate_pelt_segments(u64 periods, u32 d1, =
u32 d3)
  *      d1 y^p + 1024 \Sum y^n + d3 y^0		(Step 2)
  *                     n=3D1
  */
-static __always_inline u32
+static __always_inline u64
 accumulate_sum(u64 delta, struct sched_avg *sa,
 	       unsigned long load, unsigned long runnable, int running)
 {
