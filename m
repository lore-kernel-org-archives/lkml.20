Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1332747CA9A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520380; cv=none; b=IBLXNMi8XcXw7sED+YOZ7S/Ob29YXGyGXuBa8wkqHQRlCBw9dON10EnXw8pSUFH3eDzPK/nHOqcEq1pYRuxhjcZzM5xrGjgCI4DR7yOZSPzQXgaSnC/h78ieIBC6Qy1mYBWMsffYgS+OkbvEpMnc/vVr4zqhn0mq1tBFoea7Lu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520380; c=relaxed/simple;
	bh=C6M5SoFonh7ApvA4HXNL8oFYpMxFScg+BWmne1IUBzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nsuosP6QdxhEUn6iPO/izdMB8nfrgNdN9IN62zknw5rYZJPS8dCYzRo/F1shX8rZq4+XlDsqzsdriylye0ONJqJz245OT7u2jDOfROh4WvX/YSTmeXFc4qYC9/WzoVZA4OtBfmV6kyXYRV9//UHXiM3/G5P/iB5gkCxRs+6LPss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joL9SPdb; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joL9SPdb"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-855d2bfae95so2429394b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520378; x=1789125178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WgjUHYUbY78egBBzqlYmmEYIG6lT3QAtzMkD4x2B3/Y=;
        b=joL9SPdbH0XugeVBuvLvMKm0RRzOFUXyFAgrCe8116Z3tr7n6w3Y40pTiNUFfBU/d2
         kNflg8EDMJph1xPz2AmFjoitWi7wWCakSWrd53TeXxGvMhqzoyGtaRzvoM+l2TQFPvzb
         EymcnRHDF68RWHGM/08eRFx15OYbuAhHbQmIbT5bAIGpzluc+NQGiVYQLDCU1Ix9c/oL
         ZnarWArlzkk3+MK4se9mdgZcWqJWs2bCSvspGCsVgHu5MB4C0tB4qRclDtgZ22GrnO0z
         Srl1pJcGvc5vKs89VjEZEtyMvu9jYTnnNVMqKLnqERsycEU5tE1OJ105cTtxeVFmCo6v
         YI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520378; x=1789125178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WgjUHYUbY78egBBzqlYmmEYIG6lT3QAtzMkD4x2B3/Y=;
        b=Uqes+q2VuyyBaX4r4aPi94NDL4XhDYoECD522hH6LP5GEcBV+g6zjmGtBT8Kr5eaVV
         fqMCi8G42HlMqZKy999S/3YYtfdCudsT0HL1R1w9HVA6suwtIQZWw0wVXvjl4oPjloMW
         gwRVXhunFavFFjM4C1Y5PpJFDvRjJQGaf6QexCgEnVEGvmFPDdjUuqMwc7GE/tFnP220
         lSlQRQ1Ax7oQ4fo8Gv3NH1zWLSeHUazqrLEqKqbY6cPgeoxEgu5DUZtNd2VB7/K14fq9
         sg3O8Fm4LdlTQE9/zICsaFCQgNEENPt5TT9wvzvBMAAy74yfh4mA7TuOmbvrGIifTcqb
         Dqbw==
X-Gm-Message-State: AFuF++lfqktcNZ07LcFAZf4Y8NDDmJ437Pmn43qLpt/w2yC6LtOa+RuT
	toTflkDvYY0oyoGrGoJ4zjCe2fm0Jc+7ipDBa+ILqkKtPd/o44dnFl6b
X-Gm-Gg: AYBFou2BSCffuz0ymcG6wnpdxhgXK7u6gK60MLOsXghudajWqx182gDHBGAoXmT48G9
	FPt81gCPo0hLOfDSvwnD5PURv6rbdtz4sJdBLrHoel12b2vNpmXpr03LFtqvEwA94TMduH/3be0
	nqcONO/prgB1zbw7Bvqqtj4MG6EUpRkwy9OgIV9pZUpVw7LYqkY9Nz3n10HqU6p/1ltKBSeLxp7
	/W43xbA5H+hkAIYqdBU//N8ltIO3/Q+GUs7QQvbKckZeO+3bi1MA803rOowmkLVyj+oY9DN7IaW
	FwqHdXTx9fp14XO6zzCgPpipyR47mYZRThOwZNvWcz7V/b780WwLJNTFo9Wtiu5TvLJb/ahul3k
	pQlHFwOHtfM+45hU1qy45dARv1i/jU4IbxslyMGGAYJKC1iDJGAf6mYrki3payOrBoRry7PF0N5
	IBzFLZurMHAjCgWoKAlBzsv7MYScts0Ca4XKFozN3gEewUQc9p1AGm89j7ZAigKZ3WBa1M+Uhh6
	4qPfkOuLr4LcPvMNp9Mq8JFll0=
X-Received: by 2002:a17:90b:280a:b0:398:cb8f:c308 with SMTP id 98e67ed59e1d1-39b076add5fmr14596664a91.0.1788520378175;
        Fri, 04 Sep 2026 04:12:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm7305785c88.5.2026.09.04.04.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:12:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 2/2] sparc: fix repeated words in comments
Date: Fri,  4 Sep 2026 16:42:40 +0530
Message-ID: <20260904111244.24636-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904111244.24636-1-hemanth.selam@gmail.com>
References: <20260904111244.24636-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/sparc/kernel/head_64.S  | 2 +-
 arch/sparc/kernel/traps_64.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/head_64.S b/arch/sparc/kernel/head_64.S
index b8db806ad760..dceec1f00c2c 100644
--- a/arch/sparc/kernel/head_64.S
+++ b/arch/sparc/kernel/head_64.S
@@ -35,7 +35,7 @@
 #include <asm/sfafsr.h>
 #include <asm/unistd.h>
 
-/* This section from from _start to sparc64_boot_end should fit into
+/* This section from _start to sparc64_boot_end should fit into
  * 0x0000000000404000 to 0x0000000000408000.
  */
 	.text
diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
index a69bc0dee6a6..0127e4739dc8 100644
--- a/arch/sparc/kernel/traps_64.c
+++ b/arch/sparc/kernel/traps_64.c
@@ -912,7 +912,7 @@ void __init cheetah_ecache_flush_init(void)
 	memset(cheetah_error_log, 0, PAGE_SIZE << order);
 
 	/* Mark all AFSRs as invalid so that the trap handler will
-	 * log new new information there.
+	 * log new information there.
 	 */
 	for (i = 0; i < 2 * NR_CPUS; i++)
 		cheetah_error_log[i].afsr = CHAFSR_INVALID;
-- 
2.48.1

