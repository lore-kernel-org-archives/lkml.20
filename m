Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820221FB1
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 01:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791076476; cv=none; b=EgDa1TzQWNUV0vcbLrNlDmOLVrrULtw5ne/Tj09gMlylsG2h4th7O68QDjGsRQzfxsbOFJ2CVjmHzxXu6yn/xFv3ZDSEgbCXnbU+boCWH91AcoHjFVcPDGlkz+PtfFC4+B+XCME+kBcrcUx+AFN8ve7AUavQA/vjSvJdqV2C1+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791076476; c=relaxed/simple;
	bh=xzgGogefLIBOk20OTv5qxBNFZ6L0cQ+BPs2rO/PdlZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OEY5Tm0I5AmwS6jX6P76bYqE5HPzMDkRXn8uffUyPl8d3gTQA5M8quvXZc+/j11voTtcF9NfAS65FxYPqbblb7VD6a3A8QvfNhihplO0wbVkuqtX5ZTyxM1PS1aICSbF6EbWXICfG9gkEGcKxZ9hxIImN49JHTVdp63fWmGXPAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHpd3tM3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHpd3tM3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e2e064b932so3410215ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 18:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791076473; x=1791681273; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=afo71om4JzqVHMhk3du9qO8MnTFC19axaFER2aBsyXU=;
        b=MHpd3tM3hgdqVns1ivtwIK0oNZs5KIVPwYRIahLi5Dj2cB/zOlOYLg4KYBlUYoMutD
         qwZK7ozm/WmKBN0cXMkCtPmKY3GbYXCPDZglaA7eX15nYtrIa/VOtr4aGvQsJzASMqgF
         5lJ5jeYVoap2bx4ZBXX9d+oVV+lsE4TOemDmpTTzI55JG9Ac6i/Gx3zX1Mf9Nfd21/iT
         ciXiTsNAkdKwAkXn95BF6tCFnPKb0ncaD6QGPxEg+O1NIqPG9XclN/08w6zrnNY3Qitz
         lyMV3XNIghU0O55ddU1Ei7npoOxk+HEpNlJCc2a1SoxQ/3b9oP71t6yLSxycO2nZRAe0
         yC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791076473; x=1791681273;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=afo71om4JzqVHMhk3du9qO8MnTFC19axaFER2aBsyXU=;
        b=PXCC0oPOlVOM5BV9hf7/e/5Wmo5HdnI1Edu7nEGFW39fyyCiuPzBcumsaGybONAVx6
         l10wWzASCtGWqQLhWnBwfVkdo49NH2EgiSmV2lTmcZogde3TN68AwqpwY/xigjKv8uHk
         NvjehkMPOhVkxQEB3gmEcMpW2L8XJ4ILoD9Fsahy0eS2rFoWmWF1Dyyd02u8IacTGATq
         lY5KhOrUYQcK3CXtu0+SuW6A3ZEA6uzZjj4a9kO586lkr9TfPXy8Wbkodp4LUmppKXFL
         igeYlUp53RCdCDFP5fBBNM4eWLKLtRW3x3P/cIW/tm9QrfUu35BR1PXXu5adIZcE6JpM
         lqrA==
X-Forwarded-Encrypted: i=1; AKwUvByct9UW3hKme4DPw8P4EGaap9lnJ7o4thy/+upUDA33xhR/KpXqT3g4YSMU2LD47INxhxGleDHY15Zp1DM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIv74VWONpbmfnPR1kD3ZM0jURQdeYNhSwSf5BZBTdAU+zf8u/D
	xCyzdC4SEFAk/Y7v+DDnKxGdch1CnEQGVFp6zpo+dT2XiZn16h2rd5nt
X-Gm-Gg: AYBFou3OaQuurAMBCh89YWlk8O0Bs64L+/WKTaxKV0gebPcMzugoYXA/b7AaBWuABap
	PSC3ExZfMvP3QskGDGIxbF3XIXMW5+pmSKo8KmpqBDhXjJWCEv09LoL6Csxr3M3wPgI5Ed88b58
	ZvtEsIQTjZvmze2ZXh9T+qGDWobMWUByHnWbfE8SYNwlSQBuv0iB+s4hl1wU4rzf3/oQI8gQbyw
	xyLmZ4POxQGSX/BxWo9GoKfxdI1MCqRuOOedMfm1/8ZVu981HqWDOIDbAZnYnr4pMRYeyVRdWYp
	vSmo55JXYLX3WE7Dm9KFnrBA4dEJy4ck70Tv8JtC5IZ1Uea+K/YhDyiON7MuyL5EzcwHQVjcl9+
	mbboZ8TIc2HtRIjfmBh+yPHA/S6Fa7mTMNmDSPn1om3E42rNsJLO76gsw1O5urfwc6ZW5AWQK/w
	odRLvA3IsGOEpSPiAOfWQebFfUzrlXlirKV2m46vKYq7RSxVsBP6wxGItl5oC1aU707dHe
X-Received: by 2002:a17:90b:17c9:b0:3a7:250:3342 with SMTP id 98e67ed59e1d1-3a7873e0180mr3135688a91.43.1791076472717;
        Sat, 03 Oct 2026 18:14:32 -0700 (PDT)
Received: from [127.0.1.1] ([8.139.245.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4262f0sm5185311a91.4.2026.10.03.18.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 18:14:32 -0700 (PDT)
From: Cunlong Li <shenxiaogll@gmail.com>
Date: Sun, 04 Oct 2026 09:14:25 +0800
Subject: [PATCH] rcu: Enable runtime reset of the RCU stall panic count
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-rcu-v1-1-3799a44367f1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHCowWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwNj3aLkUl1jc1MTS7MUc3MDk1QloMqCotS0zAqwKdGxtbUAfB2241U
 AAAA=
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, Cunlong Li <shenxiaogll@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791076467; l=4559;
 i=shenxiaogll@gmail.com; s=20261003; h=from:subject:message-id;
 bh=xzgGogefLIBOk20OTv5qxBNFZ6L0cQ+BPs2rO/PdlZg=;
 b=Q6r7VhPOyJfceqTfcsRg9PrNRI7EMgRT/GI7WL36MPoqD1HlsXqXftzEf0Roj8iAJQ2QY+0qF
 Y8RXcKww1LSCOy7f2pHzqZ1e2z5aPE2LLJb6S3B/+XqJjvyROd80yaJ
X-Developer-Key: i=shenxiaogll@gmail.com; a=ed25519;
 pk=gOfQfj+CDR8dO1uRGPprj8yMOyqeLaSs21zUJZXFJtA=

The kernel.panic_on_rcu_stall and kernel.max_rcu_stall_to_panic sysctls
count RCU CPU stalls since system boot, and invoke panic() once
max_rcu_stall_to_panic stalls have elapsed.  This count is never reset,
so stalls caused by transient incidents keep consuming the budget of a
long-running system, and a later unrelated stall can immediately
trigger panic() instead of allowing the intended fresh window of
stalls.

This commit therefore introduces the kernel.rcu_stall_panic_count
sysctl.  Reading this file reports the number of stalls counted so far,
and writing 0 to it resets the count.  This allows the cumulative stall
history to be cleared after an incident has been resolved, and also
allows userspace to clear the count periodically, so that panic() is
only triggered by a burst of stalls occurring within a short period.

Signed-off-by: Cunlong Li <shenxiaogll@gmail.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 15 ++++++++++++++-
 kernel/rcu/tree_stall.h                     | 28 ++++++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index ffea61d448eb..64fe2985e358 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -959,7 +959,20 @@ max_rcu_stall_to_panic
 When ``panic_on_rcu_stall`` is set to 1, this value determines the
 number of times that RCU can stall before panic() is called.
 
-When ``panic_on_rcu_stall`` is set to 0, this value is has no effect.
+When ``panic_on_rcu_stall`` is set to 0, this value has no effect.
+
+rcu_stall_panic_count
+=====================
+
+Indicates the number of RCU CPU stalls that have been counted since
+system boot or since the counter was reset. When ``panic_on_rcu_stall``
+is set to 1, this count is compared against ``max_rcu_stall_to_panic``
+to decide whether panic() should be called.
+
+Writing 0 to this file resets the counter to zero, which restarts the
+``max_rcu_stall_to_panic`` window of stalls. This allows system
+administrators to clear the cumulative stall count after an incident
+has been resolved, without requiring a system restart.
 
 perf_cpu_time_max_percent
 =========================
diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
index 091e7850ab6e..a80f03e1c7ea 100644
--- a/kernel/rcu/tree_stall.h
+++ b/kernel/rcu/tree_stall.h
@@ -19,6 +19,20 @@
 /* panic() on RCU Stall sysctl. */
 static int sysctl_panic_on_rcu_stall __read_mostly;
 static int sysctl_max_rcu_stall_to_panic __read_mostly;
+static unsigned long sysctl_rcu_stall_panic_count;
+
+/* Reset the RCU stall panic count when written to. */
+static int proc_do_rcu_stall_panic_count(const struct ctl_table *table, int write,
+					 void *buffer, size_t *lenp, loff_t *ppos)
+{
+	if (!write)
+		return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
+
+	WRITE_ONCE(sysctl_rcu_stall_panic_count, 0);
+	*ppos += *lenp;
+
+	return 0;
+}
 
 static const struct ctl_table rcu_stall_sysctl_table[] = {
 	{
@@ -39,6 +53,13 @@ static const struct ctl_table rcu_stall_sysctl_table[] = {
 		.extra1		= SYSCTL_ONE,
 		.extra2		= SYSCTL_INT_MAX,
 	},
+	{
+		.procname	= "rcu_stall_panic_count",
+		.data		= &sysctl_rcu_stall_panic_count,
+		.maxlen		= sizeof(sysctl_rcu_stall_panic_count),
+		.mode		= 0644,
+		.proc_handler	= proc_do_rcu_stall_panic_count,
+	},
 };
 
 static int __init init_rcu_stall_sysctl(void)
@@ -161,7 +182,7 @@ early_initcall(check_cpu_stall_init);
 /* If so specified via sysctl, panic, yielding cleaner stall-warning output. */
 static void panic_on_rcu_stall(const struct cpumask *stalled_mask)
 {
-	static int cpu_stall;
+	unsigned long count;
 
 	/*
 	 * Attempt to kick out the BPF scheduler if it's installed and defer
@@ -170,7 +191,10 @@ static void panic_on_rcu_stall(const struct cpumask *stalled_mask)
 	if (scx_rcu_cpu_stall(stalled_mask))
 		return;
 
-	if (++cpu_stall < sysctl_max_rcu_stall_to_panic)
+	/* A lost RMW update only delays the panic by one stall. */
+	count = READ_ONCE(sysctl_rcu_stall_panic_count) + 1;
+	WRITE_ONCE(sysctl_rcu_stall_panic_count, count);
+	if (count < (unsigned long)READ_ONCE(sysctl_max_rcu_stall_to_panic))
 		return;
 
 	if (sysctl_panic_on_rcu_stall)

---
base-commit: ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
change-id: 20261003-rcu-375496d7704e

Best regards,
-- 
Cunlong Li <shenxiaogll@gmail.com>

