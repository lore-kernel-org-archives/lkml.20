Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216540;
	b=nGxpY05Nms+XRA5I4GKwSIpk9choDVB9TYs9VduOxoHyNTCDycTrXVliTRir49LSwhUL
	 DrbBJvID83hTi5vlV5Jy5u1MXPGmJRhBHKFVvEMZ8YshYT3PMVZkawxDYYv5VQhAW1zAN
	 ArO0nFKLc6oCicDWHJ9cK8/fZyM6g3XbcX4f1FdgHbH/PIDRPHsvjYSgIsEAadAiy2ihk
	 dphuWIYhyamsdTLHXeOGOthGhawk7Rvgb5xn4sxhm7SBlID6ZK6NDeNbQX4P6oIxHxz7P
	 jSbxfCwA4GKIsw/X/v/5CJC2zncnmW2tyVcxmmKc7PFWBD37vge2NL2Upbpwp3yftUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216540;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=XspCzn9BoyOQXAEYd3QQ4epDbaB5ehVxdAUgzcJPk9E=;
	b=MnaHgqX19sB9hLKuKkJ2IPdx+wo+218w5PRkqnf0H67oliCxhBAxgNFQ/HLuLxaU7Erp
	 C/kPAi2fr4rWJWlWRTgHzMw8XRnxMVQ8FCxDQ9TrsxVU29BLiN29ydrkZdgSFLEYEtnDb
	 mynNjq1QzejSYJ1gUeyx6qLFK9etwN+KDRR0VUkCO0lbvJIWi3SKSx5ZJTfSeM6K3eVIE
	 SltyCFGU8RgpIhgxrdNTkDCce8PpanFVV0NOgGK+vgVybxT4x78D0O/WkuSP93onGJGKz
	 neGQ6aocINJe+0JdBqwBxxzNhj/dXSymrCKuvoakNO5qd4A9IPKPJpKYmC5uCXuTO2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Zsvm+0Fv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=R96Gmw56;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC4606D81D;
	Mon,  9 Nov 2026 09:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40FC4606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Zsvm+0Fv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=R96Gmw56
Date: Mon, 09 Nov 2026 09:28:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216538;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XspCzn9BoyOQXAEYd3QQ4epDbaB5ehVxdAUgzcJPk9E=;
	b=Zsvm+0FvqOFrAjfVZ5xNU4W04cval6NCuBMQQByMk/s/SoJniCruPkHXGMMyIS+yRbL+8c
	8nx6qZi5G88mNh/PFpSPef446G3C0D4Tjfo03+9xU0Ud6drUvWF5oVij3Xj53uO4DKxt+P
	iLHD9naOYvJDG+tMvsCeWvVl0HTi4GW7oPnEo6zM/wo/Az7Ba2aQzFOjSxCn1Djv7aClZA
	BPYvzCre1CnBlKAiIJ1gtUaBYKYT2b6ro8Xkw8Yqb/17FlWmCtTkTU+PWq1MMaNZQAN6nU
	HCGPbYDX6yemsoWWR80dQYPiT1qvRhDXwEUnx6wuhkOBznORUqkOAOuVJWSpyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216538;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XspCzn9BoyOQXAEYd3QQ4epDbaB5ehVxdAUgzcJPk9E=;
	b=R96Gmw563evyFap5VzShddz0kImglcBwmiCZMNvQQSFgwJJ9l/OJtuJ1ah1dToFpo8yndl
	KmaTRdRrWdB0j8AA==
From: "tip-bot2 for Zhan Xusheng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/cache: Don't use fits_capacity() to compare
 thread and CPU counts
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Qais Yousef <qyousef@layalina.io>,
 Chen Yu <yu.c.chen@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
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
Message-ID: <179421653682.2093942.9506608994284902524.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     78b47fb995b5f3e7e54f0bde365063b530299726
Gitweb:        https://git.kernel.org/tip/78b47fb995b5f3e7e54f0bde365063b5302=
99726
Author:        Zhan Xusheng <zhanxusheng@xiaomi.com>
AuthorDate:    Mon, 02 Nov 2026 10:15:36 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:09:27 +01:00

sched/cache: Don't use fits_capacity() to compare thread and CPU counts

invalid_llc_nr() uses fits_capacity() to compare a thread count with a
CPU count, only for its 20% margin.  Qais's series changes
fits_capacity() to take a CPU number as its second argument, and this
call would then pass the CPU count as a CPU number without a warning.

Give the check its own helper.  x * 5 < y * 4 is the same comparison as
x * 1280 < y * 1024, so there is no functional change.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
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
