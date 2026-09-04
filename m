Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461A31A9FBD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526436; cv=none; b=LI+ocU0GVtkkDb5V1xt5haDH8euRxZs8EAxNsL6M0h6bCPsGOrGZHrMG87BO5H1zYIPlb61/nPDofTPKh8j9ILWOZ1leGGOw0jutNI+vAkTinyfGwjlT1MEETeqaOeWTTpBrVCOdgSNRqwI0gDp7Bphut7izut7U1g/RL9S5OI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526436; c=relaxed/simple;
	bh=O5ksst4QO7T4APDDqPHlhvrKFXMgUKR+UwLxxyrNX5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BLqs01aYotYydcedD71NnSq8/CvmNq6OgHd2vzHhOP50lqiQ98gePmuHZIakrqZ/oTqgwNS+QoMNzWn3TiR7HFoiieRbebupf4vNkNHQB/KdY2Q8eW7QbwcFcFfSr3kMT3eCPJMPl6SFCHX9SIVrE3K1/Bp9MzTtorBdiESzODw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrWKVKMt; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrWKVKMt"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2d6fff25530so2808555ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526435; x=1789131235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtfqFnnJCmvt5m9gYRF83xYN8G70Rbo/ygcbT9Wtq5c=;
        b=FrWKVKMtlN3iBxWSJudnnRCUJXn65fla75ZO9mO9zaqmStkQZo5EnmNHi64INeI7zy
         bPaSq01gBjr/cazwkluzXdxqqtghx/KLvhv3UIkjifqCRlE6KofGZMngTiDIWoRgzZNC
         VbU5vAhbycaesGijYCEyK3Y5F1jQy5fqtshctz+mJj2NwWu26vxe8o6qWHwRotBdyaK3
         xkMtWoybUHEZzHaq3qMm23OJR92HeNzyVe9Tyis3WHGL6jhTeQM5xaynkaEjkiuIqNyV
         i9jaQ9e/PPtZbMVHKJynMP3vm76tzt3PyuQDxW+AyiPA8u5kCBd1Jq4xMY3EQCWzbHlo
         lbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526435; x=1789131235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtfqFnnJCmvt5m9gYRF83xYN8G70Rbo/ygcbT9Wtq5c=;
        b=XArtZkpuJ1Vc5IRTL2VeCVx492tMqGGE5iN/oU8+EWxhi5fAHx5d9R2KvejG72sF9h
         QWT2cfMwi8i3088uUjCs5fm2KugBacDEU2ZJt4LUeMOQ1PF4LbNbh2TH9WqCdN56RRtr
         l2X9UQe030Q5OmPAZOQYhjs8k/VKQhbFor43FEDAQbGH9ZYI+bQUGTCFXgB3bhXXEVt9
         UidaS1cbh/kPG7uJq4eLAisrQAs7rTxnSu0HW/HyhYnvQ323mrj09cT1rAHm5FbvIi8J
         igyZe5ivLD6SGayok2uy8F8Ny0ScQLcIyeZZjNnKuzPcKLeBWnZJZPbTwV1WzrW3OTCN
         FLKQ==
X-Forwarded-Encrypted: i=1; AKwUvByef5QhgkOaci7579/nj2CqwX/VvYUH704V+PgIrkeX6chxtW1++qN9JgazfJOn1er8nBmpaM/W+myS3+M=@vger.kernel.org
X-Gm-Message-State: AFuF++kvlCReq7uNPCrkKcrT1qYVW971gUUyxNXjvugCfqDoPuV7dKp8
	NR6ReQmXd5hw35/hiy+WBQLXAEmLJi9k+hfsICLvgS7lf1UsBVPSHE3t
X-Gm-Gg: AYBFou0TqMxeQsVDJfji2Tu+LdnxJ3nN3qQbBaX4rYLBFpZOy3bgbLLWFh9u8VhDAWh
	jRWmBm6XJ7xbaQwUIQZJJ8pJ3P/OBcufVtqZm/aUhrzM82T9NtJAUgx8a9FB9aM5H9K8EBIq+wx
	wQINJCVYH2wEkyv4xCgIbxctAgxm7za7y68DEW1nmcY33PAwNaIvrI9ttYaGHjk+eXnJ1aAR2Fy
	3PWZcALRm9r4b4LBTPQmaEWWaRQRw3AE0NRP1NoDldlu0gdBx3fqmNxM1cPJ6OaWUT25oT+9cC+
	t3YvYbT3mIvLdfX2V4mpPfmN2PTsMPHV6zU1WZI0PGtWbJsBg/XLGVIvCLkz/q+31qxQAZiY1El
	7vWKrCYWgTTE41r5SM/rDaN7L//q9meox8BQuWQKNC2ZboV6DUjc2JaF5xPRQBn7xS6e2gLPOd+
	PAGkACryUVwE9piY+cIV5DLVO5wwGH9BWa2uA+IvcAl3RDtRHoPNAnYQCh1BYX
X-Received: by 2002:a17:902:c944:b0:2d8:d4ce:9f33 with SMTP id d9443c01a7336-2db12756abcmr85940795ad.17.1788526434436;
        Fri, 04 Sep 2026 05:53:54 -0700 (PDT)
Received: from hyperV.. ([2001:268:73b2:7e:a03:6b27:c6a2:6f2b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497d9f9sm9036475ad.32.2026.09.04.05.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:53:53 -0700 (PDT)
From: yangfeng <yangfeng.lucky@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	linux-kernel@vger.kernel.org,
	yangfeng <yangfeng.lucky@gmail.com>
Subject: [PATCH v2] irq/debug: implement missing FIXME in print_irq_desc()
Date: Fri,  4 Sep 2026 21:51:17 +0900
Message-ID: <20260904125205.15311-1-yangfeng.lucky@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original code ___PD(f) left a FIXME, so fix it.
The maximum length of a macro is 19, so modify the printk() from 14 to 20.

Signed-off-by: Yang Feng <yangfeng.lucky@gmail.com>

v2:
  - Implement missing FIXME in ___PD() with __irqd_to_state
  - move the define of __irqd_to_state before "include debug.h" in internals.h
  - Adjust printk() width from 14 to 20
  - Use full legal name in Signed-off-by
  - Rebase to latest master

---
 kernel/irq/debug.h     | 13 ++++++-------
 kernel/irq/internals.h |  4 ++--
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/kernel/irq/debug.h b/kernel/irq/debug.h
index 8ccb326d2977..451439135bed 100644
--- a/kernel/irq/debug.h
+++ b/kernel/irq/debug.h
@@ -3,10 +3,9 @@
  * Debugging printout:
  */
 
-#define ___P(f) if (desc->status_use_accessors & f) printk("%14s set\n", #f)
-#define ___PS(f) if (desc->istate & f) printk("%14s set\n", #f)
-/* FIXME */
-#define ___PD(f) do { } while (0)
+#define ___P(f) if (desc->status_use_accessors & f) printk("%20s set\n", #f)
+#define ___PS(f) if (desc->istate & f) printk("%20s set\n", #f)
+#define ___PD(f) if (__irqd_to_state(&(desc->irq_data)) & f) printk("%20s set\n", #f)
 
 static inline void print_irq_desc(unsigned int irq, struct irq_desc *desc)
 {
@@ -39,9 +38,9 @@ static inline void print_irq_desc(unsigned int irq, struct irq_desc *desc)
 	___PS(IRQS_WAITING);
 	___PS(IRQS_PENDING);
 
-	___PD(IRQS_INPROGRESS);
-	___PD(IRQS_DISABLED);
-	___PD(IRQS_MASKED);
+	___PD(IRQD_IRQ_INPROGRESS);
+	___PD(IRQD_IRQ_DISABLED);
+	___PD(IRQD_IRQ_MASKED);
 }
 
 #undef ___P
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index 0ce21dd45404..43fe07a25b66 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -77,6 +77,8 @@ enum {
 	IRQS_SYSFS		= 0x00004000,
 };
 
+#define __irqd_to_state(d) ACCESS_PRIVATE((d)->common, state_use_accessors)
+
 #include "debug.h"
 #include "settings.h"
 
@@ -215,8 +217,6 @@ static inline class_irqdesc_lock_t class_irqdesc_lock_constructor(unsigned int i
 
 #define scoped_irqdesc		((struct irq_desc *)(__guard_ptr(irqdesc_lock)(&scope)))
 
-#define __irqd_to_state(d) ACCESS_PRIVATE((d)->common, state_use_accessors)
-
 static inline unsigned int irqd_get(struct irq_data *d)
 {
 	return __irqd_to_state(d);
-- 
2.43.0

