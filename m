Received: from out28-4.mail.aliyun.com (out28-4.mail.aliyun.com [115.124.28.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614F3ADBA7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491509; cv=none; b=VwyJHzboaiR4hmWiRSgIEM2AyjTtpvHQQXZ+Qx0IE34MxDVARIRtRkXwdRth9vMALsdUJSq7xPINZFzF+vUlFhP7r/EgCxgv4pkRwpba9tTGepf5geX3KveL++QJof+3zXTsF0YNsYn2WUsZGOsxV5tqyyF5jQJKZCs4MSqUe+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491509; c=relaxed/simple;
	bh=5LfwsCJPtyahMaZAzJf/H7V3qhyO6tYux98c8XU4RPE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f1j8bpuWXhqJUNv7RauiewpfnQ6jNPQBUrVLzoJI0v/RhkXPB5VM+SY4oD3xZrT/+ZsF0qVoCI8RZW+X25ITDYwAl58Eufhy1EhIwn3NJfhu0Nhsk/p34FvMIURjp12BbDNWR+ikrECu4qyMKIHZ4GHyH2oT9rITsoesD7htfJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1299369|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0134151-0.000775871-0.985809;FP=12090291487539561935|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam011083013073;MF=fuhao@open-hieco.net;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.j54tmqc_1788491490;
Received: from higon..(mailfrom:fuhao@open-hieco.net fp:SMTPD_---.j54tmqc_1788491490 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 11:11:36 +0800
From: Fu Hao <fuhao@open-hieco.net>
To: puwen@hygon.cn,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com
Cc: linux-kernel@vger.kernel.org,
	tingyin.duan@gmail.com,
	Fu Hao <fuhao@open-hieco.net>
Subject: [PATCH v5 3/5] x86/cpu/hygon: Remove Spectral Chicken for Hygon processors
Date: Fri,  4 Sep 2026 11:11:23 +0800
Message-Id: <538d6bb1809d8b9c63f1be93dd5e5600c17cbc41.1788404433.git.fuhao@open-hieco.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1788404433.git.fuhao@open-hieco.net>
References: <cover.1788404433.git.fuhao@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's no need to set the Spectral chicken bit for all Hygon processors.

Commit d7caac991fee ("x86/cpu/amd: Add Spectral Chicken") added the
spectral chicken bit for AMD platforms. There was an inquiry about
whether Hygon platforms also require this chicken bit. Hygon has
confirmed that it is not needed. Therefore, the related comment is
removed in this patch.
Signed-off-by: Fu Hao <fuhao@open-hieco.net>
---
 arch/x86/kernel/cpu/hygon.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
index 64f9a64c3..eea9e36a8 100644
--- a/arch/x86/kernel/cpu/hygon.c
+++ b/arch/x86/kernel/cpu/hygon.c
@@ -177,12 +177,6 @@ static void init_hygon(struct cpuinfo_x86 *c)
 
 	set_cpu_cap(c, X86_FEATURE_REP_GOOD);
 
-	/*
-	 * XXX someone from Hygon needs to confirm this DTRT
-	 *
-	init_spectral_chicken(c);
-	 */
-
 	set_cpu_cap(c, X86_FEATURE_ZEN);
 	set_cpu_cap(c, X86_FEATURE_CPB);
 
-- 
2.34.1

