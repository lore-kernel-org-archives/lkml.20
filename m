Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216521;
	b=nF3xGa3S0sFNpCP98Pw83Z2oNS/aeduDY+ifYhnixWPYmoyTMX+3hYl/MSQ+Nk6kw8Wt
	 Mu/7JTqgXnk1volkGN9FPlY3Hszr0GcfsgvDPAO7PjQaGqGFqj2WXDMB5Vp8PynkGqrSy
	 KMUQNWyVAXsHDk6J6siZOUdvspqz3gXiHugjgyEJ6T1bRAXpsIrx6Wo6KL+wlalYP7bYC
	 QAg4dkzdA2pOY5sm/q3Grmw8bx4R6NqbhpAXInQ/W1zWm9GZ/mFZ0vBcYhtaUQwaVqWyr
	 SfN4LLB9Np2Tb1aKqo3WvQ1NDqcuUkJJhyQWBhGiESw2qhIFMDwTpbMWjH2+wQIraCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216521;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=RLIUzB3eWmy5Tq8khxYQAkONZ0ioTc5FrpAKWX5yXJQ=;
	b=zeJIsoYQ4vBxKOlr6CKTA/tQtxe4swQXY+WppF6us3px+POnllbvl4ef3nL2J8fAHE8H
	 f/pHPBPkwq+1F1V7dcgDeZZLTn1jUfqlujznSdRdEd6XwGMo0GLw9m/l7nfqHWE7jaZ/H
	 G8+fl0lvAFfdiIeNIPXf63UjJUsI3oLCKgeJYf08ENXxUgwwJJs9FW4d+0TbXPGKWDMNN
	 wkGuY9old1wZc//qa+DXLesTS54R2r/r/RVIryWy7cO68mQ9BPry5Pb6JW/Ig7UQhAtRL
	 rtygZl7vbaCG/M0J2IvFcX0ikDtPxsGUwp/5cz5TdmkKowOMMAkwILnR9FCqHqc1MSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tu+On7FO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="Z4p/ihvS";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11665606A33E;
	Mon,  9 Nov 2026 09:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11665606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tu+On7FO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Z4p/ihvS
Date: Mon, 09 Nov 2026 09:28:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216519;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLIUzB3eWmy5Tq8khxYQAkONZ0ioTc5FrpAKWX5yXJQ=;
	b=tu+On7FOVFD1EgoxIY4r9I7VntjYU0XVwMMG0CiNFaKwscb/06w7YQz1YyogIlvCv06qsU
	PA2U28DE1VCWkIeDQ34jT90NmaWibG1aBE+pmRRwymnq47Z5+vVNHX5+XG4t4mtSJ5p1xx
	pYFOaCfONWnAXqEwJt1bi3BUP1o9GK772KkF3Ze6+y4DByyvroJtFETne6D8Q63OJ+S1ak
	WRSALpa/aVGKkxrARPUnQ0plWJtlkW2ZTFer7WrT0fyxXtjWo4e4uhsrBu3igNO2EtjnJT
	L5gyIeVk8+oGSafLrPX2mfYaG6mp3eJXLIINSet8Z+nHLBQyF2dfSX0tPoX/BQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216519;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLIUzB3eWmy5Tq8khxYQAkONZ0ioTc5FrpAKWX5yXJQ=;
	b=Z4p/ihvSA3l+01btVnx6/UZxNN7uadWWFXbFu8k46T1GlTM7EYt/3enj3rPZUMBMXFV8c7
	uuR3U/UG24zS25AQ==
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
Message-ID: <179421651800.2093942.14148413791803216183.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     64352f46f121a0103eec2e0aeaadad411825e0d3
Gitweb:        https://git.kernel.org/tip/64352f46f121a0103eec2e0aeaadad41182=
5e0d3
Author:        Yury Norov <ynorov@nvidia.com>
AuthorDate:    Mon, 26 Oct 2026 13:12:51 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:24:01 +01:00

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
