Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910734;
	b=sYWlMa8Bp0n3vZA/+NJXnUQH8/h1GQ5gYqeLz1jwYdKCdM802kKKRIEGCrxObEb74Yd/
	 rqtHjK6KpIHxA+GlYgawgdw2RKY+Z2f/X29zy28CW6KLirUmAGAiT8zMQnbMKO+UF0huE
	 5smCIZFFim/umuBy8m96nVvuX57AV/GzGyVp5IfXAEj8pzMiEHwDWpHr9P6HMgwcOoqRz
	 +/+zoXhywQ58HHVLsG0RJES++SBeam1r+8es8NyGNRVK+XUHBGSBGC49aOdZGk7aSgLBg
	 uBSJcoVvXXehvzpbgPM1Gkx8OTZ0RQnmAgemByPtlFzvEZ0MI7j8oHZs+ZnHhgAV73w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910734;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=SLTuo8Bf8VesaAkT6DczV4E9wggKp8EAHDqnPASoGtA=;
	b=fnGRgPbUXaPq+lDdEcjB4ALcCiynPeogH6VVFmC7PTEh26Tjybpp56zRrq3/NkES/2ig
	 1pLMIMNaPwWnkh7Dx3pHdnd39G62XJL/AXRBWaEe7Dh5IXmIbR1e8pCizU26ZkrZW0jiV
	 kB8Al5BlReXkJZH0JySQNa7tm4fVpcRLeyqTSZMFPpx26KPmms6wX5TFVjsn3FoA4mHdx
	 HslQzmpC7Wd9wu7ur+wlhtexy4YtZIdfP99LFGWgWDaDeHR5BOP/Z5UpxSrhfPDYHv34Z
	 ZqH96Ko3ZNRrtB+lgRpQve5T9rW4fmoPJcKlwf8RjtDkLjMBjnjJG8bwK407l+4GEiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=0Anlht7c;
	arc=none smtp.remote-ip=185.125.25.8
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2352606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2352606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=0Anlht7c
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jTLL42hQqz3gH;
	Tue, 17 Nov 2026 11:18:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1794910732;
	bh=SLTuo8Bf8VesaAkT6DczV4E9wggKp8EAHDqnPASoGtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0Anlht7cBwcDE7mh7t0xXAm1UUfoYdtjYX1sF4fs81e2JBh4BnP0vHHpQUhTXwrdr
	 IqtVWphZGpxwigQjlCoYL9deAxxIGqn3eWx9WhkloHpuYSugoob3bogQnSaxlUHMgl
	 +/QflqEM2d1DsJ6/x/SIsxBmh5EAy2RiMwoNPkCs=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jTLL24YY5zBCW;
	Tue, 17 Nov 2026 11:18:50 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Casey Schaufler <casey@schaufler-ca.com>,
	Georgia Garcia <georgia.garcia@canonical.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	James Morris <jmorris@namei.org>,
	John Johansen <john.johansen@canonical.com>,
	=?UTF-8?q?Ondrej=20Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <serge@hallyn.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Matt Bobrowski <matt@bobrowski.net>,
	apparmor@lists.ubuntu.com,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Subject: [PATCH v2 2/6] landlock: Restrict capabilities guarding other LSMs' policies
Date: Tue, 17 Nov 2026 11:18:39 +0100
Message-ID: <20261117101845.2523770-3-mic@digikod.net>
In-Reply-To: <20261117101845.2523770-1-mic@digikod.net>
References: <20261117101845.2523770-1-mic@digikod.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

A process in a domain that denies CAP_MAC_ADMIN or CAP_MAC_OVERRIDE
could still use them for AppArmor, Smack or SELinux policy, and
CAP_SYS_PTRACE for Smack's ptrace rule, because these LSMs check them
with cap_capable() instead of capable().

Implement the capable_lsm hook with the same check as the capable hook,
so that such capability uses are restricted like any other.  The
following commits switch these LSMs to security_capable_lsm().

Cc: Christian Brauner <brauner@kernel.org>
Cc: Günther Noack <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <serge@hallyn.com>
Fixes: 97c8386f1d74 ("landlock: Enforce capability restrictions")
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---
 security/landlock/cap.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/security/landlock/cap.c b/security/landlock/cap.c
index c9a900888f3b..162edf689f29 100644
--- a/security/landlock/cap.c
+++ b/security/landlock/cap.c
@@ -91,6 +91,28 @@ static int hook_capable(const struct cred *cred, struct user_namespace *ns,
 	return check_cap(cred, cap, opts);
 }
 
+/**
+ * hook_capable_lsm - Deny capabilities guarding another LSM's policy
+ *
+ * @cred: Credentials being checked.
+ * @ns: Target user namespace (intentionally ignored, see hook_capable()).
+ * @cap: Capability number (CAP_*).
+ * @opts: Capability check options, see check_cap().
+ * @lsm_id: LSM_ID_* of the LSM whose policy @cap guards (unused: Landlock does
+ *          not call security_capable_lsm()).
+ *
+ * Other LSMs check the capabilities that guard their own policy (e.g.
+ * CAP_MAC_ADMIN) with security_capable_lsm() instead of capable().  Restrict
+ * them like any other capability use.
+ *
+ * Return: 0 if allowed, -EPERM if capability use is denied.
+ */
+static int hook_capable_lsm(const struct cred *cred, struct user_namespace *ns,
+			    int cap, unsigned int opts, u64 lsm_id)
+{
+	return check_cap(cred, cap, opts);
+}
+
 /**
  * hook_capset - Restrict inheritable capability changes
  *
@@ -163,6 +185,7 @@ static int hook_vm_enough_memory(struct mm_struct *mm, long pages)
 
 static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(capable, hook_capable),
+	LSM_HOOK_INIT(capable_lsm, hook_capable_lsm),
 	LSM_HOOK_INIT(capset, hook_capset),
 	LSM_HOOK_INIT(mmap_addr, hook_mmap_addr),
 	LSM_HOOK_INIT(vm_enough_memory, hook_vm_enough_memory),
-- 
2.56.0

