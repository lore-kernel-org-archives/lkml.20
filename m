Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880FA1397
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787871446; cv=none; b=Fk++naLKa6ZmM2TvRvAn8CV/M2sbUZTsWDaPBLzGONYllx2/ppZgO3NbVyaHHlmDqGxPkqhFGL+vUkQEoStp2C8cwxZLiz556RZgOUurgVCWTSOeohQd+Z/LAYWmhfedpvxgZULAGrLhdB5FomucGDQ0GZjadaPFUQ+/hZtOpBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787871446; c=relaxed/simple;
	bh=0rQlmWb48qg1FLxL7kMrunYWl3aCOOYwTo/IgDl+Pcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkOh11RDH65jP1Jv/6CT3GS+pCB+hODg/Wjs6hEY0ZANFmEjYGpS4MyrQ8XSSPv73gCr4bz2ZLETsg3Q7eR5Sza+EfCB5kCAw5Z/j+Yzw/MfZ9bdc3Xa8ddZeCrEVQevKjenFwl0oja7CPcuOeMCjJKVHEH4Owcr81hEgFJW8MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Sy1eUNWZ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=3rQqS7mO; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Sy1eUNWZ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="3rQqS7mO"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787871428; bh=c6LxvFs9xBBNjJCXxznrnse
	Rf2yTQfBsJo74ixLKPy4=; b=Sy1eUNWZh0agGURJWx/wKmMkawTgwPWYw1xC0a5kW6ryyqlZym
	4L88Sk5el0/Vvr27/1Qxg5ZigjsU2eBYYZAWAauccHmrKpl1c5VImF4cLM+gKbcaxFINOVCBrqB
	p7l3VWqpmrWNylEZEELOcopsNomW/4EiSV/WJTrwdzBswnMUOupMe5kIjrkgfm7xjqhWu91o/RU
	l+wa+Cqf3Qauqp/bGuy5DAcf4KTNzq9HISD7XYM6M71clmGgzAG7HBLH5tZiR35vNf1y3ef/u/A
	Drp68tH4GFkYnvomhqmpMYUnZ/QZbEzZo747x5xv367q1G7oi9YpK9XpczOccf49SJQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787871428; bh=c6LxvFs9xBBNjJCXxznrnse
	Rf2yTQfBsJo74ixLKPy4=; b=3rQqS7mOZt86Qf4FZ4q1K/KGn7Uss35uJcVNmWFPVc7mPVDL40
	Rk1TnQjTKpDr9dkqKs1OZ4rz0NvK/sOEGOCw==;
From: Bradley Morgan <include@grrlz.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH 2/2] kexec: log the task that initiated the kexec reboot
Date: Thu, 27 Aug 2026 22:57:08 +0000
Message-ID: <20260827225708.6831-2-include@grrlz.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827225708.6831-1-include@grrlz.net>
References: <20260827225708.6831-1-include@grrlz.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bradley Morgan <brads@mainlining.org>

Give the kexec path the same treatment as the reboot syscall.

Log the comm and pid of the calling task after kexec_in_progress is set
to true but before kernel_restart_prepare() shuts down devices, so the
message survives even if device shutdown hangs, e.g:

  reboot: initiated by systemd-shutdow[1]
  kexec: Starting new kernel

The existing "Starting new kernel" line is left untouched, so anything
parsing dmesg today keeps working.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/kexec_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index dc770b9a6d05..d940b0c29f86 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -1189,6 +1189,7 @@ int kernel_kexec(void)
 #endif
 	{
 		kexec_in_progress = true;
+		reboot_log_initiator();
 		kernel_restart_prepare("kexec reboot");
 		migrate_to_reboot_cpu();
 		syscore_shutdown();
-- 
2.47.3

