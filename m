Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422263E7BB4;
	Wed,  2 Sep 2026 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337988; cv=none; b=X3FsndsF6Ln4glYjDmneGBzUtJgapLX5P2RFhY4QMxPEqVOKTkHZ+vf9YcPj0vxP9iAYWObe51KAnUjnQsIQmfvVUhcT9rfBFuewlUBZl5BAlLDLJr4D0KWwu7XKHDL5Jh66H3hzyCLkNl4w3zfG5YQv83vmxC2PPYMVBUFKv90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337988; c=relaxed/simple;
	bh=W+k4dgsSF7zQrAmSrm+uLdgG8K/VFXeFcLLD3pEQWSc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Ik/jaRcj7ek29VieE6xO+yvrojFLvZezaD209lbYPxPC4z7zD3dhy4vaDekeUCPRh7GHmPzqQD06C6gNbpUvJf+Ue4bmTUUS4QyR8I8TIxpjUq4Wkekltj3nbpBUMZlbIF2halDuDFEIrRZ1Ox9FdlTPmMsWhzm2Pg4HtAmOk1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pp2q7Hx+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xsZFuKcc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pp2q7Hx+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xsZFuKcc"
Date: Wed, 02 Sep 2026 08:33:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788337984;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJnJQNqB3HGH7mse+EsYsOQ25ELHGLxvRmyDiJEpaw0=;
	b=pp2q7Hx+SB53lmRHA2/aeYAYZZP0LQO3SUttHveHPBPIWUt7bMdljDt6M0Z+jeWGjws9L7
	TI5+QDuefyasjEGYAQSIbzBAfxDmb7V8pD2lZdgK+qW93WvZ/Q2stlv7dyXXQ5qnCfl5dS
	/7oZjcrJOctims8qErioURaKUOpBk+jxnWWS1O/YQ9LV/WiKlPEpOb4IqNhWv7UPp7CzOm
	NfxbJX9jzNFF1bRmnNGolO3xFAV0tWsNj9x0wHLG82QRlrhpvC/9MX2jush7sHOUog9LWF
	xOzJ4xTr4axpsNHx9yaLkO+8Zh759soOTm0/fY/GodMZbDz5NhKXV8GFUx6NHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788337984;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJnJQNqB3HGH7mse+EsYsOQ25ELHGLxvRmyDiJEpaw0=;
	b=xsZFuKcceMWOrXtwuP/1aA/aA/jXtMhuHmUYlBZdzzP5XS04HR09S5beZkVcS9HNuJki18
	wnyABpbA5FJAEnBg==
From: "tip-bot2 for Hongyan Xia" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/feat: Use the new static key API for sched_feat
Cc: Hongyan Xia <hongyan.xia@transsion.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260819081312.12447-1-hongyan.xia@transsion.com>
References: <20260819081312.12447-1-hongyan.xia@transsion.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833798278.3717435.7817097970740592420.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     2a672daa4b272d092e193eb40376b4a8063e25fa
Gitweb:        https://git.kernel.org/tip/2a672daa4b272d092e193eb40376b4a8063=
e25fa
Author:        Hongyan Xia <hongyan.xia@transsion.com>
AuthorDate:    Wed, 19 Aug 2026 08:13:14=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 10:28:24 +02:00

sched/feat: Use the new static key API for sched_feat

Both raw static keys and static_key_true/false() have been deprecated.
Migrate to new API.

It's a bit tricky to convert the sched_feat array to the new API because
the new one has two different types for true and false keys. Use a union
to wrap it.

No functional change.

Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260819081312.12447-1-hongyan.xia@transsion.c=
om
---
 kernel/sched/debug.c | 10 +++++-----
 kernel/sched/sched.h | 19 ++++++++++++++-----
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 72236db..9883e4c 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -73,13 +73,13 @@ static int sched_feat_show(struct seq_file *m, void *v)
=20
 #ifdef CONFIG_JUMP_LABEL
=20
-#define jump_label_key__true  STATIC_KEY_INIT_TRUE
-#define jump_label_key__false STATIC_KEY_INIT_FALSE
+#define jump_label_key__true  { .key_true  =3D STATIC_KEY_TRUE_INIT  }
+#define jump_label_key__false { .key_false =3D STATIC_KEY_FALSE_INIT }
=20
 #define SCHED_FEAT(name, enabled)	\
 	jump_label_key__##enabled ,
=20
-struct static_key sched_feat_keys[__SCHED_FEAT_NR] =3D {
+union sched_feat_key sched_feat_keys[__SCHED_FEAT_NR] =3D {
 #include "features.h"
 };
=20
@@ -87,12 +87,12 @@ struct static_key sched_feat_keys[__SCHED_FEAT_NR] =3D {
=20
 static void sched_feat_disable(int i)
 {
-	static_key_disable_cpuslocked(&sched_feat_keys[i]);
+	static_branch_disable_cpuslocked(&sched_feat_keys[i].key_true);
 }
=20
 static void sched_feat_enable(int i)
 {
-	static_key_enable_cpuslocked(&sched_feat_keys[i]);
+	static_branch_enable_cpuslocked(&sched_feat_keys[i].key_false);
 }
 #else /* !CONFIG_JUMP_LABEL: */
 static void sched_feat_disable(int i) { };
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 81f17e6..6c3ad70 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2447,16 +2447,25 @@ extern __read_mostly unsigned int sysctl_sched_featur=
es;
=20
 #ifdef CONFIG_JUMP_LABEL
=20
-#define SCHED_FEAT(name, enabled)					\
-static __always_inline bool static_branch_##name(struct static_key *key) \
-{									\
-	return static_key_##enabled(key);				\
+union sched_feat_key {
+	struct static_key_true	key_true;
+	struct static_key_false	key_false;
+};
+
+#define sched_feat_branch_true(key)	static_branch_likely(&(key)->key_true)
+#define sched_feat_branch_false(key)	static_branch_unlikely(&(key)->key_fals=
e)
+
+#define SCHED_FEAT(name, enabled)			\
+static __always_inline bool				\
+static_branch_##name(union sched_feat_key *key) 	\
+{							\
+	return sched_feat_branch_##enabled(key);	\
 }
=20
 #include "features.h"
 #undef SCHED_FEAT
=20
-extern struct static_key sched_feat_keys[__SCHED_FEAT_NR];
+extern union sched_feat_key sched_feat_keys[__SCHED_FEAT_NR];
 #define sched_feat(x) (static_branch_##x(&sched_feat_keys[__SCHED_FEAT_##x]))
=20
 #else /* !CONFIG_JUMP_LABEL: */
