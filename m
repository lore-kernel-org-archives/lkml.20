Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213497;
	b=QgbjTGQyQIXFzXFPA3+Zu63bRUYDa8JSs7yasJmOdZiEA2vxPoNmugI7UPWigN+3Sk6Y
	 5kg1Rc97nzBD6USW5iD3YTGDzJxQjXPwELwdZHKCaUQjwhqyCWWt5veb6BeVyWlI6fvpG
	 tva6rh0F+Ih4BzkbgFlBw4MG9mqOO0nYZl61hWUDqF5oTiBdO1jd0B2AnZSx7743gjzBh
	 XUYsi3j66V7B738YxOwXUNbTDYTxy+0sBvymQzCBmHp4FlD+YAUN4uctSlrmuNvxT1WKX
	 5St/M1KD8I+DNMAeep+vWYA5LaWcssCWhN9X8hN22mYNYIr42NrKgAcn6taQt61waMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213497;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=eFV68eOZCZO54NZIe5cjD9+0c/EZCdShDkoNbJMg7y0=;
	b=tht8cLGgf3BEMK8XTmvXrZw7Z4X1RCt7R2Tcu2GK5NH0iOWO/l00cHB24upV8BxCEbxV
	 bWXja9PbHmIx+wkAgnJHcTeFdHFQxC7PthKlgAXY6Avy36yq/MDJhm8K/wu2wm5D5AfME
	 hKbQB+O1rFsZJv2oPGWCMX3UK5Bh4wGS+5marI5StstESNrg5TD0prAEbZ8pcov/0U0NB
	 EcWdl83As5FSJGzwYxs7wSYDyWIA840VR0Od5B12h85h71c7UJ/ULbyo9ymBVB/SRoqB7
	 HZPN4DqSc6Q/uFIdMgd2sh+L7KIdKk2gCNfaLdwOwHpAJ+gWf9avwTVsAVABg/xT2RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QVY3w271;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=48lmc6Kv;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B6F606D834;
	Mon,  9 Nov 2026 08:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B6F606D834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QVY3w271;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=48lmc6Kv
Date: Mon, 09 Nov 2026 08:38:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794213495;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFV68eOZCZO54NZIe5cjD9+0c/EZCdShDkoNbJMg7y0=;
	b=QVY3w271u+vOmG9oEJZAy3byA1g6ijoX/EQkhz047PxfZNawfgPk4halXd0saecBc2AGtL
	GjzcDlFb3yWhMneZV/8dRpEQJSYHojnhxHkzCAnU3HTWNot0f4/xKJZTVZUNVTKhRnNVVB
	L9gOE4d3LBNTzO72a1qOqux16mzfHakmQJ3MMjXRsNRyw6uYr/KqGB5cXycD43XkfpmVTb
	bwPT4ayIw46rSoLaw/NmYm3pA6tz61CpEZYibqWmuXot35900jFLpyKdN7qLV0S2J4XVp4
	zH5yxeNpLlfT2MfRa1kFsljOKd8SkLJpoQD/T9k0f2tb0Np7esXhTe0nf0v8bg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794213495;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFV68eOZCZO54NZIe5cjD9+0c/EZCdShDkoNbJMg7y0=;
	b=48lmc6Kv3H1s0LGnJEPc8/n2XR7S4n2vd1mH1ecG0LV4rR/nMWHyK6oPeOokw6AjEIK8U2
	D113J2DVPFGQJBAA==
From: "tip-bot2 for Zhan Xusheng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/cache: Don't use fits_capacity() to compare
 thread and CPU counts
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Qais Yousef <qyousef@layalina.io>, Chen Yu <yu.c.chen@intel.com>,
 Tim Chen <tim.c.chen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
References: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421349366.2093942.6331246254188179230.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     63e5dcd44ded2c83b468417381c3a5987a8f66d1
Gitweb:        https://git.kernel.org/tip/63e5dcd44ded2c83b468417381c3a5987a8=
f66d1
Author:        Zhan Xusheng <zhanxusheng@xiaomi.com>
AuthorDate:    Mon, 02 Nov 2026 10:15:36 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 06 Nov 2026 11:45:18 +01:00

sched/cache: Don't use fits_capacity() to compare thread and CPU counts

invalid_llc_nr() uses fits_capacity() to compare a thread count with a
CPU count, only for its 20% margin.  Qais's series changes
fits_capacity() to take a CPU number as its second argument, and this
call would then pass the CPU count as a CPU number without a warning.

Give the check its own helper.  x * 5 < y * 4 is the same comparison as
x * 1280 < y * 1024, so there is no functional change.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Qais Yousef <qyousef@layalina.io>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Link: https://lore.kernel.org/all/20260504020003.71306-5-qyousef@layalina.io/
Link: https://patch.msgid.link/20261102021536.1026143-1-zhanxusheng1024@gmail=
.com
---
 kernel/sched/fair.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 79f6b3a..0c8af1c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1469,6 +1469,12 @@ static bool exceed_llc_capacity(struct sched_cache_gro=
up *grp, int cpu)
 	return false;
 }
=20
+/* Are the running threads (in SMT siblings) below ~80% of the LLC's CPUs? */
+static inline bool fits_llc_nr(u64 nr_threads, unsigned int nr_cpus)
+{
+	return nr_threads * 5 < (u64)nr_cpus * 4;
+}
+
 static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct=
 *p,
 			   int cpu)
 {
@@ -1485,8 +1491,8 @@ static bool invalid_llc_nr(struct sched_cache_group *gr=
p, struct task_struct *p,
 	if (scale =3D=3D INT_MAX)
 		return false;
=20
-	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads=
),
-			(scale * per_cpu(sd_llc_size, cpu)));
+	return !fits_llc_nr(READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads,
+			    scale * per_cpu(sd_llc_size, cpu));
 }
=20
 /*
