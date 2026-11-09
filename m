Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218525;
	b=UmAUiLyySOyOOsV3Up96HyWXySpGIaVYZV3U5DdZ+UmhrYMNy3n6HwQczdAozbKhQk9/
	 0iF6RBzPZev8O33irWrefKo+jfC9hdAIcbZrQ9THcIXziFz1wuiWlVCIgPqChXvzibBNI
	 SZwJpNghqgPiBhQH9w037p6FX9M7jSRTbxSakkYYkstAt5oglC+Skj+uWjnsijZAU2voV
	 lIOsLNCCI8Ggv+JLxUK+rnrEitpmVFSoZZe0W65dqvhjErwQNlKTCS9CgBAtfmf4lufgI
	 x0C2yy376eB4b4dZIYRjPxw86zsZ5P9EU/8+l7W7qBNJECe43vw95l5eqDhs7dVgEww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218525;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=/VYbQoDHN5JxEWJjLKcHZAFrB8RPCsR8XdtuPDWSAnM=;
	b=W2hecUOjW9qZsCz/32xEbAol+raCtbCnQJNVbZn6s80BtYFQY0E4CdXlK4Ke7vLz6D4F
	 XIbzXwKPxWVwDH4OSveFl8VNALpzU4HAfH4KJnMFvOYYlK0WEvsyWOwJSq7HEtB6KBrT/
	 pb9ZXWSoLXSPAOfByivthWzBEK616JSl20S+iM1EHNap1ND6E/vop5p/0SjBEEQyhEeH1
	 CBiVU2P33Y7eHsawa7ucljiA0N/rpzYMLEhLG+Ul6XqlkXE4ktqDng1Rqv/puyMmEfjOB
	 DhcqIolAdSe3O2SAA8sSJM5ANW6auQaplF2KjCtvw2REzeInEcmP/HopCK9sbv12LxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gLMXQeeO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BCJdphoz;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1B4606D805;
	Mon,  9 Nov 2026 10:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1B4606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gLMXQeeO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BCJdphoz
Date: Mon, 09 Nov 2026 10:02:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794218522;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VYbQoDHN5JxEWJjLKcHZAFrB8RPCsR8XdtuPDWSAnM=;
	b=gLMXQeeOx1PkiVVyWP2DnNivZAxOwfvmdZImAFgOUtexpfyR/ZpYso35C6Xm6xcTaDJXaT
	XJAncuD10HLdgxLtKF0NMHe1tTkc3aDtxagxSnnaXgXDGgTIOcVKQLY7jihcGr4wzqkHy0
	nXDfuAf0jIfj3qPj91SUuTGk7/j6DpHHey8/oZNt4IZTPBJ/lUr89Gb7U8vsyZA2yqtIlB
	dYNbpNLXjEYSxBdh6xTR9H8vSD36HEO6ToAAyEeVbl0sc8T/qvkPHVZ72cu2PeXTInx03P
	XMzt1GXIrBlS9BOPXAm04SRnghT5OFAta6MDNLEr7KnPGiXTsoSquFkS5dF7WQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794218522;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VYbQoDHN5JxEWJjLKcHZAFrB8RPCsR8XdtuPDWSAnM=;
	b=BCJdphoz1FUWjPz+btUxUmZiebuqhHbUuvl8G+Mfmof3OWo2yGjJuoTmQ/3IueE4zulTS2
	VPF5ekpwlywuT4Bg==
From: "tip-bot2 for Yury Norov" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] virt: steal_governor: store only the sampling delay
Cc: Yury Norov <ynorov@nvidia.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026171252.3860162-1-ynorov@nvidia.com>
References: <20261026171252.3860162-1-ynorov@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421852062.2093942.15767534565654453852.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     70fed49a29f0cf3806182f70dfbf450e5d5cbd4e
Gitweb:        https://git.kernel.org/tip/70fed49a29f0cf3806182f70dfbf450e5d5=
cbd4e
Author:        Yury Norov <ynorov@nvidia.com>
AuthorDate:    Mon, 26 Oct 2026 13:12:51 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:58:00 +01:00

virt: steal_governor: store only the sampling delay

The governor stores the sampling interval in both milliseconds and
jiffies, although delayed work only needs the latter.

Convert interval_ms to jiffies in the module parameter setter and store
it directly in sg_ctx.delay. Initialize the default delay to HZ and
remove the redundant interval_ms member and initialization conversion.

Keep the read-only interval_ms parameter by converting the delay back
to milliseconds in its getter. Use the same conversion for the startup
message. Both now report the effective interval after jiffy rounding.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Link: https://patch.msgid.link/20261026171252.3860162-1-ynorov@nvidia.com
---
 drivers/virt/steal_governor.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/virt/steal_governor.c b/drivers/virt/steal_governor.c
index 6e31f99..81e5089 100644
--- a/drivers/virt/steal_governor.c
+++ b/drivers/virt/steal_governor.c
@@ -39,14 +39,13 @@ struct steal_governor {
 	ktime_t			time;
 	u64			steal;
 	unsigned long		delay;
-	unsigned int		interval_ms;
 	unsigned int		high_threshold;
 	unsigned int		low_threshold;
 	struct delayed_work	work;
 };
=20
 static struct steal_governor sg_ctx =3D {
-	.interval_ms	=3D	1000,	/* 1 second */
+	.delay		=3D	HZ,	/* 1 second */
 	.high_threshold =3D	500,	/* 5% */
 	.low_threshold	=3D	200,	/* 2% */
 };
@@ -74,15 +73,21 @@ static int param_set_interval_ms(const char *val, const s=
truct kernel_param *kp)
 		return -EINVAL;
 	}
=20
-	return param_set_uint(val, kp);
+	*(unsigned long *)kp->arg =3D msecs_to_jiffies(interval);
+	return 0;
+}
+
+static int param_get_interval_ms(char *buffer, const struct kernel_param *kp)
+{
+	return sprintf(buffer, "%u\n", jiffies_to_msecs(*(unsigned long *)kp->arg));
 }
=20
 static const struct kernel_param_ops interval_ms_ops =3D {
 	.set =3D param_set_interval_ms,
-	.get =3D param_get_uint,
+	.get =3D param_get_interval_ms,
 };
=20
-module_param_cb(interval_ms, &interval_ms_ops, &sg_ctx.interval_ms, 0444);
+module_param_cb(interval_ms, &interval_ms_ops, &sg_ctx.delay, 0444);
 MODULE_PARM_DESC(interval_ms,
 		 "Sampling frequency in milliseconds. default: 1000");
=20
@@ -270,13 +275,12 @@ static int __init steal_governor_init(void)
 		return -EINVAL;
 	}
=20
-	sg_ctx.delay =3D msecs_to_jiffies(sg_ctx.interval_ms);
 	INIT_DELAYED_WORK(&sg_ctx.work, steal_governor_loop);
 	sg_ctx.steal =3D get_system_steal_time();
 	sg_ctx.time =3D ktime_get();
 	schedule_delayed_work(&sg_ctx.work, sg_ctx.delay);
 	pr_info("enabled. interval: %ums, high_threshold: %u, low_threshold: %u\n",
-		sg_ctx.interval_ms, sg_ctx.high_threshold, sg_ctx.low_threshold);
+		jiffies_to_msecs(sg_ctx.delay), sg_ctx.high_threshold, sg_ctx.low_threshol=
d);
=20
 	return 0;
 }
