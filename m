Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E80C30ACEE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276138; cv=none; b=ZieiHp+Ho+yxQJqQK965zi1sfyNo4xiYZ8+KNC2fxHdaStMwKrF0P0pPseqicqSh4J+rzVBrFMDbJ1PC2VtRLar/Z0lSje+dOtJ98h9N9xqxZ39NqR1uFYuQ7eKYAcvZ45V+5Y26GPy8J4fFsBkgIe03F2wyx7aTesceJCdMVsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276138; c=relaxed/simple;
	bh=CEPYJZ3jIkVHwYF3w/9XcB3PxmepmTehIoEbGFpjCUs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=t8JDbUrka8uckaEXo16zeoJJ24GVJX23RcJt6ivldlhBjhboS7akkVnaXIWVZR8GgUVys3qmBknGWyI1qtlO/Jf2rNHyYeSCRoY+i5xU4hdeFqcX30UBBoFCCnABLmRprQSjUULlXMrjkSwvH7M3WfZzYKkgnMJHH8M5vStkq9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--michalblk.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qDcOgaf1; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--michalblk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qDcOgaf1"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49ccfad90f1so22020475e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788276135; x=1788880935; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WB3gaqcty5uU3bUEOpuRwBi4dDMCMvK/Ic/DzXm2h4Y=;
        b=qDcOgaf1tTJSX/VjkD/fLBVqwqWDswBDWjUDriCRTfA3c8UuGDG+IJUYb5bbHLaMJI
         Yd1lgu5bk0HdFjReVeuUEtvem78uoSrsLmkD8oklBV/XULIRDckIU6pnYn1fEDrJ7d3j
         4OCrDO5tEqcTJT+GR3DrdzjEstmZD+SIp+O9O/VR+hJ9gwc3qO4i7n6HjnycJAL7qQX+
         m9baZQxCA2CrtmCSM1mmk906Pvfdq2BSppuyeKZMl/oX44n+2d4f5STujBLyCzUDsVim
         nX7gONmGkgjyv6gPSMlc5KdHT+qsfiTpm9U2b1gW17g+XFZcwxxDnnANFPNLLEmdhi2U
         Fm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276135; x=1788880935;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WB3gaqcty5uU3bUEOpuRwBi4dDMCMvK/Ic/DzXm2h4Y=;
        b=SkgJHcoPSB1eEVmETWbxrVh9TTkisEY8B9omkSKPahtDZX+wFF2dCTjeyXcOF11xKQ
         P1pH+duIpe6ODD9+ZlhtOQZJHSadVAibBA5HC45epJjYRjaPE3E9S4npx1cFqBbS9MLi
         x33iC8mSoxdqUsWi6O+siHfcgZU3D115YhMAUaR9DOgKHQkbdN8vu4RHi7b7jsPYX5zV
         60sPvDAmLCiVK0Eo/I5tvwNrkEXbY1JBY/ydhh7MZDTCX4GuWflPxQF3b1F8WtKkfg6Q
         R4stiUuVAJwQEEH9mvr2wZBIqYZsPfxne2miC9ptnKmiu2pSZK7PWyanIXXt2dvz/lYo
         Spog==
X-Forwarded-Encrypted: i=1; AHgh+Ro7zNotqGRLOQ1x2TuD61IEgS5jGwbhbvkba0PegscE4f0Y2OlRxnK/qUZtSvx1SPDD0rEiITacoA4dZBY=@vger.kernel.org
X-Gm-Message-State: AFuF++npI0DpHSqIdqdVCrEFX2BIBs3bsNp3YwV40n1xPSJ2q1ar6eFq
	qh5ivj6oBDmznbrUZLZ9ptRK0hqDfa7fOSk9h6dleqHJL8HmDhEj/wAMEoQwEh9EAYdhjQutIxz
	V1MJ4sBfKocQ5EzbJJA==
X-Received: from wmlf1.prod.google.com ([2002:a7b:c8c1:0:b0:493:bd51:5095])
 (user=michalblk job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d1d:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49b91c3ddbcmr440039425e9.10.1788276135254;
 Tue, 01 Sep 2026 08:22:15 -0700 (PDT)
Date: Tue,  1 Sep 2026 15:22:12 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901152212.1691696-1-michalblk@google.com>
Subject: [PATCH] sched_ext: Use atomic cpumask_clear_cpu in scx_idle_test_and_clear_cpu()
From: Michal Blaszczyk <michalblk@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Michal Blaszczyk <michalblk@google.com>, Kuba Piecuch <jpiecuch@google.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In scx_idle_test_and_clear_cpu(), the shared idle_smts mask is modified
locklessly by concurrent CPUs. Currently, the code uses
__cpumask_clear_cpu() to clear a CPU from the mask. Because this is
a non-atomic read-modify-write operation, concurrent modifications to
different bits within the same memory word can lead to data races and
lost updates.

Fix this by replacing __cpumask_clear_cpu() with the atomic
cpumask_clear_cpu().

Fixes: 48849271e661 ("sched_ext: idle: Per-node idle cpumasks")
Signed-off-by: Michal Blaszczyk <michalblk@google.com>
---
 kernel/sched/ext/idle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/ext/idle.c b/kernel/sched/ext/idle.c
index d2973fb3af6d..8985b48c83a5 100644
--- a/kernel/sched/ext/idle.c
+++ b/kernel/sched/ext/idle.c
@@ -104,7 +104,7 @@ static bool scx_idle_test_and_clear_cpu(int cpu)
 		if (cpumask_intersects(smt, idle_smts))
 			cpumask_andnot(idle_smts, idle_smts, smt);
 		else if (cpumask_test_cpu(cpu, idle_smts))
-			__cpumask_clear_cpu(cpu, idle_smts);
+			cpumask_clear_cpu(cpu, idle_smts);
 	}
 
 	return cpumask_test_and_clear_cpu(cpu, idle_cpus);
-- 
2.55.0.897.gb25b4bd76c-goog

