Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679FA27E1DC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790038477; cv=none; b=XTQPro3Mla1A9eJ8f5sT1SO1RWdcg6gevZQJuh9mfiiHpo3SWHF3adQ1/R1Oucoz9l4Ff6Gg1FSsqjXlph76HuZJZauZbLkRLjDXyCidFFLHcB5mraj1x6xSrCsYXDPdftRzgVhB32SypaWI0Te8gaF7wI4Zr3Arv5SENR2WTaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790038477; c=relaxed/simple;
	bh=UGj3HUJFFDo/0hwedsheNhJfynkbrFLBTsxHzCIUxYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B5clyDo2B25Q94svE4A+/Z6lmJb7PsFhx9OXsgGwfCyTuMIkM6++/N3ZKSViE1UmNJmwK1J2k5SOLGsHAmSYTpzYF4XeKTH+vhmAT7Z4Te/NpFzczUgaB3dTwYYF59nb9bEfMEQ7mbtnJgYPB1Mk/SG6n8gr8KEqvWE7V4hHNsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CvEgoLyb; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CvEgoLyb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=gvq7bnmsMooHCZJmfDlK7HHwQto97pL9JPihjj4Hi64=; b=CvEgoLybVSkij1i3X2Ez7ip7VX
	nK86CjYTOP6laRihbUspzCDymENQ9OvCYut3pbtdr9AhazvPk0Aig8z/SAkm7l6R8x1pEyaJ/tf4k
	uLWJ2Zp8PB6ZYrQGRawB77eAnn+A8HqNOJP5n4r7UZ4uxeMNvyZLdf6c27clCMSLqAw0dBBMmpO7L
	DpNFKFZLP1X9SkWtPk+Zv6M5JRV/dceOzGVXldK/KLtNScmyLzmiIrf9jV+Po+g5/fxtL8JuiPSJ+
	mNBhsp7F+LSbpWPYKezXWHh5BzGF5e6vGOLgBRcBD5USysTsbAWKozGAaEEgiumCvf5TjtF78g4I7
	KfsBiHBw==;
Received: from [177.172.123.214] (helo=computador)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x8om5-005Mv8-N4; Tue, 22 Sep 2026 02:54:21 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dave@stgolabs.net,
	tglx@kernel.org,
	dvhart@infradead.org,
	peterz@infradead.org,
	mingo@redhat.com,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH] futex: Handle the correct robust list at compat_exit_robust_list()
Date: Mon, 21 Sep 2026 21:54:07 -0300
Message-ID: <20260922005407.522060-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

compat_exit_robust_list(), as exit_robust_list(), should handle the robust
list from the task_struct from the function argument, not the current task
running the function.

Fixes: 2cb5251d3d64 ("futex: Provide UABI defines for robust list entry modifiers")
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 kernel/futex/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index a061f54b606d..42014dcfdf0c 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1256,7 +1256,7 @@ compat_fetch_robust_entry(compat_uptr_t *uentry, struct robust_list __user **ent
  */
 static void compat_exit_robust_list(struct task_struct *curr)
 {
-	struct compat_robust_list_head __user *head = current->futex.compat_robust_list;
+	struct compat_robust_list_head __user *head = curr->futex.compat_robust_list;
 	unsigned int limit = ROBUST_LIST_LIMIT, cur_mod, next_mod, pend_mod;
 	struct robust_list __user *entry, *next_entry, *pending;
 	compat_uptr_t uentry, next_uentry, upending;
-- 
2.55.0

