Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE93322C88
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030005; cv=none; b=jBxJeFspYzRfVvAsemIUO8PE7N4mGCWRiUqqvLuZ9C6BLzxCYDaywgHsy4V4qa8pv6P0Glru0HuatJwHnmHwYxOBvKI992cP9gq4HSltCOR21169csByvfQNvuNaY9ejAkGn/bJ0RLrEpcyIWlwOvsNdFluZ73dNvNV5sGD//gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030005; c=relaxed/simple;
	bh=hbUh3rQBfS0CEmvKw72oTQ12KrtwMOmgyVSeu+dRcrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fncH3XHgLRbT68GL+WKAJuYEts72TX948ZRKPTfik2ZqNOdHcmgH32MCbxqxZ5HlzVkhmlob2m8nx1lTRRXlKPsf842GK1uRvyWkRSRwjUph3NMxBsu2f1GTKhbNLRjS8znfNCXUgbc7COatmB+NOSCWeQrUtA7abyaEe37Shdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDEE6bFB; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDEE6bFB"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so4921988a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789029999; x=1789634799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FxV1JJHCtnNs5CLImEqWnGTFS1sK8xpOR5qbgGdf074=;
        b=jDEE6bFBxFtxXarQyvubqu3U8/G5/P0M3iZRLsN27mQhR1/Fj0LkIo9ULUq7kKFyUz
         TItNDZaSKbZSPJiqVD45bVG2MyjyfCXW1n2q/TL/R5Gq8uJ+uuM7WQAddsc66SrACn52
         7BPsZXYcKpp4KFeG+FovJ+upuZWdC2V3tJJ/xOuM8VgnR2C4OvVUOfWEQ0UYi5VFZmfP
         8q9EmpCZ0RAoShDCiN/8sFSj8GzZRuJtOb3hlxpzrbzn4Tq2GxVf20jZMSiKpLj8Txfa
         ah3FGwpuKbKGLbucQSRGPtlZFPl/qHE8x0xHiDA7HwAuZQzOAlylqtwWI1YDiDqsRh8+
         REMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029999; x=1789634799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxV1JJHCtnNs5CLImEqWnGTFS1sK8xpOR5qbgGdf074=;
        b=LPOxzXBS59oHA45dupA0N7/dt/JUiaix2Dw12fcLVjTTif3F7ZuhgAwwTaAAtLDaKh
         iL3tXqiVcL+3tcRb/BrEPHRH/KRevAr0t+fHXUmroHu+4OPbMrp3XwGszfgp0OD/ajlX
         wAF9pWndYjcanPaayn7sgJensy7UEInBjdWfCiM4fXEfI9xRCB81mrRqQOUkdB8FWCJc
         VELxbn9QpC6Y6A1sV5drjIYzv0nwqsIgNN3eUz/rfYF10ctg2xIFaGULRY/uC8cuOzzz
         Ky9Slpupv6+Oq5WxUXvtyQV/HsLoaFtlNXaLXd+5WktRwcDuRu6q8BQk7nTq2l/jaNVc
         rHmg==
X-Forwarded-Encrypted: i=1; AKwUvBzOF6oxIxsu6Oj1G/pngVALv5vUl4rjt9NC3LP8zsjrwYaH+DoCQPxs6pGBLBvdWKo+J7OgPKzE+j2HEpE=@vger.kernel.org
X-Gm-Message-State: AFuF++nib/00gi/9fnhDBQZfRki6bORVR/xy5otpYCCyUwCDUsX4NBoY
	Kn80VdrVlUb9xtIwdyQDKW6wO00gVmPE9nv0NNMG2Qx5EaT1JIwo2+0tQQr49Q==
X-Gm-Gg: AYBFou37w67MiVOFM9Y6uc21869TWP3oF38+mBpDg4FPTdhPR+Dxf9IbJOJ8YDRXnyS
	BpsxjDj+tkE9IJS4w/YzD/4sZ4VvoIq3tYExWdu+nNLuURYgmX2eimIN6o+ww6KojxR3jw/tbis
	jHEO+AZ95pC8u6uNxn27X7Mf9rBeKtRyIq6l+Nn4JUrjdL+zrx7Abbb7RBURuywOj6lOPX73IRk
	TiJyEMg7tlM/bQOdF0OFLpugtnY4iSDJ55Cr0xe0BAdBcnlsbeGIX5fPM/N5tYsqmVgaPTsisSL
	jrTzXO6E1+oDYrwoL5UnKg9VbIIiCLLg/e41F7PKha6cfpPq4YCIIiM4s8N45V18smvG9AEWLe2
	5phIiNIcQw/m1OBQ+AkNiuYLPPwS3of9KIEYPKuOl3p0JbC0SW9RwceEXiMkbWWUWAJGJd81XDb
	Y/W+TTSn6NceqD1Q5RUlIyuMpTP+k0zcvmdotOhvrNPVFmszn8MYwOMCPJWg03WV+VqjiSBPASS
	bnBScdDRZsSNWy18/+FwxB4waJ1
X-Received: by 2002:a17:90b:2687:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39b26277b88mr60867730a91.24.1789029999202;
        Thu, 10 Sep 2026 01:46:39 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7738f40dsm4551860a91.4.2026.09.10.01.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:46:38 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com
Cc: rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v2] srcutree: Add WARN_ON_ONCE() for atomic SRCU in srcu_gp_end()
Date: Thu, 10 Sep 2026 16:46:29 +0800
Message-ID: <20260910084629.3695383-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Atomic SRCU remain in the small size state, so add a
WARN_ON_ONCE() before the transition check to catch any future
code path that might violate this invariant.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
Changes since v1:
- Drop the !is_atomic guard from v1 and add WARN_ON_ONCE() instead,
  per Paul McKenney's suggestion.
- v1: https://lore.kernel.org/rcu/20260907075829.2073224-8-kunwu.chan@linux.dev/
---
 kernel/rcu/srcutree.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 84c022ec8e09..68441c32cebf 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -1074,6 +1074,8 @@ static void srcu_gp_end(struct srcu_struct *ssp, bool is_atomic)
 	}
 
 	/* Transition to big if needed. */
+	WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC &&
+			ss_state != SRCU_SIZE_SMALL);
 	if (ss_state != SRCU_SIZE_SMALL && ss_state != SRCU_SIZE_BIG) {
 		if (ss_state == SRCU_SIZE_ALLOC)
 			init_srcu_struct_nodes(ssp, GFP_KERNEL);
-- 
2.43.0

