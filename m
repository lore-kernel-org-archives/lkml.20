Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499658;
	b=m84KgjGtxBZPQ2Jn450WqypdMTgdsPgKVlD+vAzqCRSzqUKGTZkrGYDEru5kEBJ0bbE3
	 dY9nXtafUZppNoB+IuniYB7B/3vCJRv2IG5eRrrZyhNmcWuSZmNHfNHRkWMvuuydlfqSs
	 bvYrRU7e0zg33WFu1k3bxEfGZQsxSebSdYKQSqLtMkZsH6tbXplbJ8KdmxdqEc+uk0OHU
	 4ZzHUatEhEhRW/SxvnUnGBxtuPaZl0v41my6o6eYDVWq1txzxdG2+wzDL1z5Vlcbpa7xm
	 glNLRf9coeOtld6ECl5g/uIT/SWuZTnfxNckw4g9sI0YgNEurgbqGTA8FnUamXfi31w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499658;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=ucjrn9mQAcAGfdoLop5hn5qFz37ncGRH3deckCQ4o4c=;
	b=wGrjCMLKSRnylS1Ll+g8YMlcFikTWPKYcwYkmQdGFlOwAUr0QcNyb59UaezIjnoQDUOr
	 wgG5MTI89sH7WqAy1fpUSCa44EzqofWgfJ8BvPsoiKd/QO+5ITHCIxQTARAEYoECoKWU4
	 P6zBrfCbDRGQw2U41XINmJJxHZb4NorAYEvme6EcPi/8MDDw+h7Lw/dCckUsz8ri8xmt3
	 01GkMtu3mFQ2qSyWdu6sc0X3UqANTsKv9wp05bfIt/gMm1o1rLf1NwFzUjXnL49OAV0N/
	 iNDX8cpbXnp7E7WA0y8PNideK2s2haBmVDBuHWllvUYNCmTRytThrvYyqG821xmjU5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=hClylBL9;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FFE606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40FFE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=hClylBL9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=ucjrn9mQAcAGfdoLop5hn5qFz37ncGRH3deckCQ4o4c=; b=hClylBL9XaqiBunicTC2CxWbHQ
	BHlTOQea0K9VBJSGsgrZh/tTqxW/y9HOeg6KOorWpkWipfhuw8UIv+5MZu2dKEKsSdzFfTUqBHSEe
	hm0llLGtynYqN53XtGGKC6PxhyAQq39FMTs4KCbGgZOMkXZSgljZABFo/x4r42BptYoXFRP/QBxcJ
	SsnmY6EPZAMsw1DFBqIKhwP6f+pXC3F/rxH537jkXAJVfHqIZQBLbvAYxcnwj4agwRPP1RVzmyvjh
	Y8iqcDZt3D5BD5yQmWVRd/OCD2PmNHLqgeq1RCqJgkP8lbQ0FVYL8LPxADjOzJL9x4XWW/YzJvWY/
	Q0Xm33RA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRXKl-00E5PD-2l;
	Thu, 12 Nov 2026 16:07:32 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 12 Nov 2026 07:58:27 -0800
Subject: [PATCH] timers/migration: Read jiffies only when the migrator walk
 needs it
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-tmigr-lazy-jiffies-v1-1-6b7eaa38b0cd@debian.org>
X-B4-Tracking: v=1; b=H4sIACji9WoC/x3MSQqEMBAF0KsUf21BEgcwVxEXohW7xIlEpFvx7
 kK/A7wbSaJKgqcbUU5Nuq3wZDNC/+nWUVgHeIIzrrLWOj4WHSPP3fXjSUNQSdyXgwtFnRtTl8g
 Ie5Sg33/atM/zAiod7GVkAAAA
X-Change-ID: 20261112-tmigr-lazy-jiffies-c5d2f4930095
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2641; i=leitao@debian.org;
 h=from:subject:message-id; bh=mNO+o+UTzSEe9x7vPgjH11r8BmY+TbyzpwHl0pJr0xA=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq9eRBDg2Zf40QoNHSMqbELFW0YQJPy0lpzJgGT
 XrW6okRMymJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCavXkQQAKCRA1o5Of/Hh3
 bWycD/9fsx9RnkbSWejYaALGpbqxp+mdXVNNqVhlvrBmB+vfb+l8qaZZXnIGopVTmK++ebq8kBr
 V47djYCtZGmYo3Sr7PXYbl4XZDGEPl2FaKl2IyDrMYK5YTPB4tl8kZxMTi4wYGW4OIcf0mTpDyU
 SI8LbRHbNpztKvwGfGruyPbYaiCKgPy7i8HNd9bIziJTgh5T4YT0SwdqUQw5dGbNHiNU2iQnZiA
 vUNd9Gf7+U3fUnZ953uu84E2H0XNgayEHMlxE1cFD/GmFRRpjfGdj5KgHmmXyNB8QKzBP2G3Abo
 N96Ifrg+e/04QDPWXYCkFRyJvCs1gR0vlIRQspcFlbT7cdljflSSJM03ApGishewsjvH0tfp1tS
 ctglb6oiFTB7qq52M9rZfsjiaD8yDCJEC7cTzz73wVdp8SNlqWCMSyVt60CpRDUCTSTUa66XX9z
 ZCrhWi2TpC9kOs3uod5LlUb/Q47z5YV2MroV81QPqELGOrirLFRnO3NNk3yvZGbYVdW6mTeVhuw
 XVdmvFiBBoE5GBRMMHZb8EgADscw1Mgsl6CqE8RM0tjHxroji/7u/EQ5WUEQ+zV3PqLBQS07upW
 8qPMLqw1RrM6pdzOt0O7wHzW5ckOswsCzHZGjECRZVpTu6WI2Lt6Xeszh/TSYFhjmBkisBJ+GbQ
 Io8iguIJxK1M7UQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

run_local_timers() calls tmigr_requires_handle_remote() on every tick,
and the function starts with get_jiffies_update(). That reads
jiffies_seq and last_jiffies_update, which the timekeeping CPU rewrites
on every tick. As the ticks of all CPUs are aligned, every CPU takes
these cache misses while the timekeeper is writing the lines.

For an active CPU the value is only used by the migrator of its first
level group: tmigr_requires_handle_remote_up() stops the walk at once
on any other CPU. With eight CPUs per group, seven out of eight active
CPUs read jiffies and throw the value away.

Check the migrator first, as tmigr_handle_remote() already does, and
read jiffies only when the walk is going to use it.

Fleet profiles show get_jiffies_update() at up to 1.7% of non-idle
cycles on the largest AMD systems, almost all of it called from
tmigr_requires_handle_remote().

In a 72 vCPU KVM guest (AMD EPYC 9D85 host, HZ=1000) with every vCPU
spinning in user space, get_jiffies_update() calls drop from 367k to
46k per 5 seconds. tick_nohz_handler() duration drops also.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/time/timer_migration.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index f920e73fff5112..dfa936bc485f59 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -1195,7 +1195,6 @@ bool tmigr_requires_handle_remote(void)
 	if (tmigr_is_not_available(tmc))
 		return ret;
 
-	data.now = get_jiffies_update(&jif);
 	data.childmask = tmc->groupmask;
 	data.firstexp = KTIME_MAX;
 	data.check = false;
@@ -1208,11 +1207,21 @@ bool tmigr_requires_handle_remote(void)
 	 * set only by the local CPU.
 	 */
 	if (!tmc->idle) {
+		/*
+		 * Bail out early when not the migrator, to avoid reading
+		 * jiffies_seq, which the timekeeper writes on every tick.
+		 */
+		if (!tmigr_check_migrator(tmc->tmgroup, data.childmask))
+			return false;
+
+		data.now = get_jiffies_update(&jif);
 		__walk_groups(&tmigr_requires_handle_remote_up, &data, tmc);
 
 		return data.check;
 	}
 
+	data.now = get_jiffies_update(&jif);
+
 	/*
 	 * When the CPU is idle, compare @tmc->wakeup with @data.now. The lock
 	 * is required on 32bit architectures to read the variable consistently

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261112-tmigr-lazy-jiffies-c5d2f4930095

Best regards,
--  
Breno Leitao <leitao@debian.org>

