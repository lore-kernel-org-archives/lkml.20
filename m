Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E912E44A3F4;
	Mon, 28 Sep 2026 07:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578881; cv=none; b=Yr4Gj+8OA3hDKKCO0if4XethGP2HN0PBtrAKqBljBYzfmpvdgAh+dBIxUghAomXFYODf6FLyXnuaPy9sOKQGETLA2uRb2eMPH7KA5+KZLRzMMNlYwudBQuQkZEylYfz0TwdC1aqWMsZfkyBnDCwptn62tLNwNuyfBX6vn09tggo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578881; c=relaxed/simple;
	bh=Nc7Anw82WSD10+zc1fiEUBIReXLtJNiTSGagWRA+6K8=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=GowHi2LzcrSdbuxCT9yW8SGCvN8BR1lcpeYXbrQG60T/NoSwFz5I608oCE8DVdZHcirvUaq2rOn32Q++SWJ3fgiBxYu4tEmkQ3UEFvLxNLSc5WwmdGnnagOWpkazDdLGxwuTAXP3NYqig/gb8I0mkfYOou8DdZqneB5cs8rZdSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1Co1boi0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8YHUMQt7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1Co1boi0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8YHUMQt7"
Date: Mon, 28 Sep 2026 07:01:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578878;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRWQ7vIG6r6aNOD3c6ZpWsO42rASOzfwmkT0FV6DoO8=;
	b=1Co1boi0yoTnJmWH7YhuWd+dHTg2+4MYzo8czvCdIyEFcxPFwt4Z5gvh7Cvv2T7Or1+MBc
	BkneDY/s95Ns3eG0cSQpUu+lgwR/MbBFNn0rdeR3NdR9saxGXeYPTf/jRQgI/szsOLoGih
	dW8ooQ30EolUw68H2D3Vj6Dl+k6Wvq2RL90ubnyM3L6NvkSkeknywtbhthj/Nlvn3M0AqI
	+IZmcDC0v4fAYTBYotjxVakfWkZatGBYNt7TsCxcMDgNOdX/i+cYQOWaC8LpP7lY2ONW0a
	ckq4wvfhcO9kk+JspLymheXdkdMc0itp5W34114WuaZX2OMGyUbX6XJ8u13p+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578878;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRWQ7vIG6r6aNOD3c6ZpWsO42rASOzfwmkT0FV6DoO8=;
	b=8YHUMQt7ono4LZ1k+tZqtlfLoFFJ2EM/vR5OS6P/kpsUXvLk7XGN5nPEE15+LbwOxX0Uh6
	krY+mSizLPpUk2Dg==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] virt/steal_governor: Add control knobs for handling
 steal values
Cc: Yury Norov <yury.norov@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-12-sshegde@linux.ibm.com>
References: <20260928053728.797539-12-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057887651.3910103.4094740511363051817.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     4b9302d494fffee7318bd9cdd2021198b6a7badd
Gitweb:        https://git.kernel.org/tip/4b9302d494fffee7318bd9cdd2021198b6a=
7badd
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:26 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:43 +02:00

virt/steal_governor: Add control knobs for handling steal values

These are the knobs to control the steal_governor.

interval_ms:
How often steal governor checks for steal time.
(Default: 1000 i.e 1 second)
This controls how fast steal governor driver reacts to changes to
the contention of physical CPUs.
Can be set between 100 to 100000. i.e. 100ms to 100seconds.
100ms is kept as minimum to ensure few meaningful steal values
accumulate even with HZ=3D100.

low_threshold:
lower threshold value in percentage * 100.
(Default: 200, i.e 2% steal is considered as low threshold)
This determines what values should be considered as nil/no steal values.
When steal governor see steal ratio is below or equal to this value, it
will increase the preferred CPUs by 1 core. Having value as zero
might cause oscillations

high_threshold:
higher threshold value in percentage * 100
(Default: 500, i.e 5% steal is considered as high threshold)
This determines what values should be considered as high steal values.
When steal governor sees steal ratio is higher than this value, it will
reduce the preferred CPUs by 1 core.

module_param_cb methods are used to do the validation checks.
This helps to ensure one configures sane values.
Since low and high are dependent, that check is done at module init.

Notes:
- Parameters values can't be changed at runtime. One has to unload
  the module and change it. Hence recommended to build it as module.
- Default values may not work well for all configurations. Tune it
  according to the system under test.

Documentation is available at: Documentation/driver-api/steal-governor.rst

Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260928053728.797539-12-sshegde@linux.ibm.com
---
 drivers/virt/steal_governor.c | 73 +++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/drivers/virt/steal_governor.c b/drivers/virt/steal_governor.c
index 2320cbf..27f53ea 100644
--- a/drivers/virt/steal_governor.c
+++ b/drivers/virt/steal_governor.c
@@ -40,7 +40,11 @@ struct steal_governor {
 	struct delayed_work	work;
 };
=20
-static struct steal_governor sg_ctx;
+static struct steal_governor sg_ctx =3D {
+	.interval_ms	=3D	1000,	/* 1 second */
+	.high_threshold =3D	500,	/* 5% */
+	.low_threshold	=3D	200,	/* 2% */
+};
=20
 static void restore_preferred_to_active(void)
 {
@@ -51,6 +55,62 @@ static void restore_preferred_to_active(void)
 		set_cpu_preferred(cpu, true);
 }
=20
+static int param_set_interval_ms(const char *val, const struct kernel_param =
*kp)
+{
+	unsigned int interval;
+	int ret;
+
+	ret =3D kstrtouint(val, 0, &interval);
+	if (ret)
+		return ret;
+
+	if (interval < 100 || interval > 100000) {
+		pr_err("interval_ms must be between 100 and 100000\n");
+		return -EINVAL;
+	}
+
+	return param_set_uint(val, kp);
+}
+
+static const struct kernel_param_ops interval_ms_ops =3D {
+	.set =3D param_set_interval_ms,
+	.get =3D param_get_uint,
+};
+
+module_param_cb(interval_ms, &interval_ms_ops, &sg_ctx.interval_ms, 0444);
+MODULE_PARM_DESC(interval_ms,
+		 "Sampling frequency in milliseconds. default: 1000");
+
+static int param_set_high_threshold(const char *val, const struct kernel_par=
am *kp)
+{
+	unsigned int threshold;
+	int ret;
+
+	ret =3D kstrtouint(val, 0, &threshold);
+	if (ret)
+		return ret;
+
+	if (threshold >=3D 100 * 100) {
+		pr_err("high_threshold (%u) can't be more than 99.99%%\n", threshold);
+		return -EINVAL;
+	}
+
+	return param_set_uint(val, kp);
+}
+
+static const struct kernel_param_ops high_threshold_ops =3D {
+	.set =3D param_set_high_threshold,
+	.get =3D param_get_uint,
+};
+
+module_param_cb(high_threshold, &high_threshold_ops, &sg_ctx.high_threshold,=
 0444);
+MODULE_PARM_DESC(high_threshold,
+		 "High steal threshold. default: 500 i.e 5%. Must be > low_threshold");
+
+module_param_named(low_threshold, sg_ctx.low_threshold, uint, 0444);
+MODULE_PARM_DESC(low_threshold,
+		 "Low steal threshold. default: 200 i.e 2%. Must be < high_threshold");
+
 static int __init steal_governor_init(void)
 {
 #ifdef CONFIG_XEN
@@ -60,7 +120,16 @@ static int __init steal_governor_init(void)
 	}
 #endif
=20
-	pr_info("enabled\n");
+	if (sg_ctx.low_threshold >=3D sg_ctx.high_threshold) {
+		pr_err("low_threshold (%u) must be less than high_threshold (%u)\n",
+		       sg_ctx.low_threshold, sg_ctx.high_threshold);
+		return -EINVAL;
+	}
+
+	sg_ctx.delay =3D msecs_to_jiffies(sg_ctx.interval_ms);
+	pr_info("enabled. interval: %ums, high_threshold: %u, low_threshold: %u\n",
+		sg_ctx.interval_ms, sg_ctx.high_threshold, sg_ctx.low_threshold);
+
 	return 0;
 }
=20
