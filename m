Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4023A383A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013681; cv=none; b=IC2biFd5OH71jHeK6KOgyUHV0lRj+2pHs7ZLv0lk/p3Ybd/RE9AMa6NGsWolScwvFocZbEEHLqx1weZtg8zOs5h3VfdwulncafdRuOz1/dytqJAuaiIZ1kU6SIFUvflcHeNDPY87EiGM95WIfVgjLk9X6qj6Ts5HrStVCPzewxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013681; c=relaxed/simple;
	bh=S6Q8iTTI0AR4jZVr4beCsVhRfm/G5hTDYV+GbdTaCbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIYO6ZvzH5St1Ufp6zk4lWQUoYtWxF/MwT/x0mFYmjGMCMufdyNx9PouxBaXhKho3ObdXhzciIDkeLZyInCW/i6QrLioD01s2PLt4OADgQRH3lC+7NJl9RNthvRV16dRbv7lrrpDomCD8J9T0JfGdMXDipHH2iiZ7y1XG/QUrRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5EvOzQG; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5EvOzQG"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25400so513255b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789013678; x=1789618478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pBHlDeFtR9R/kfv9cflPbv5Eb5RRc7n7ypcv3mdlfb0=;
        b=J5EvOzQGUVozpHX6M9eei74ST20jD4aSYWh6cqyrllsibyQAo1Bm6vxFQC6McxCrRm
         3QVH+rqEcXBi3aG7BvkVRb7bxINsoC8q+opIzRDrKCgBHyIZGuhL5inL74nd0NnSz+dB
         vf4i6unnIjooKesdY0s/UngJPJs/fNL+2CXySk3Fg0mCVuic8Bbn48ljWgyBmMPkidsU
         SNrYluJvdYx2qbkrguy5sRV89iYR6j/qHQP67n9XNM6Kl+VQXNa4uGin0etXoEbOZCXo
         MwPT3UV195AMNAIJD2yvbxunx+LZMFZU+XZEsX4OGJpCH1toNkhicuxgJhbww+o2wdHQ
         +Whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789013678; x=1789618478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBHlDeFtR9R/kfv9cflPbv5Eb5RRc7n7ypcv3mdlfb0=;
        b=BCbJS0ilKYuo0fZqSR50fxwXpKl3Fkc5ooVc/qadyhRYoXi4ne/Z3mf+YyzZ/zNuly
         UvqUWWRUbKKt/dya2D7ZazqIJHX4L5LRdIc/FRkT6eFBQvsMwlD9gmKENTHPmJcsfp0u
         pKJ9EQq4kBMHprCqv7iN6H2eCUp/p50oudGpQlVvlnZI2uNqlSnOx1raNgbrH6gYK67z
         0IfE+6N8mLdtCVtkiF4Qp8kcW9wWrjGodQsod7/q5Vtl9ynwbAgNfy2RFMAZWuAcidAM
         f5X+vpbhtkJoF0W1yCFBJ+M7ZBmJFlWyVf0erMjk07G+OeTEpbi72hls+3h29dwzpSJf
         jfBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzpLCPJ+cUDVmKcrBjlF9yKy6w0RicAYuUA0d2M+dZ1T0wt//Vy3JZIWjV+JoQ4WFWbquMtjNQqWlMR8w=@vger.kernel.org
X-Gm-Message-State: AFuF++mIJ5PB782HCKWrqvuQfNyBAgJzLmkNTzuZhVQrjm4o91I2jbB7
	XOMqH3GaThr1I1wTC644zSYJBJk1WkwmgYqKHSUYLBxPrDYOqxOL2bre
X-Gm-Gg: AYBFou2m7zfVnGDDLNbLGQNKbTonz5Qdn4uki1Dm2/cjoddGGLaIgDV5pmFwovfL4GH
	q4K8LGUP1aFQ8v+7Aux7dwQPCEeVbTk2Bw0rkref6IcV+QWt0R4JEZWEC8d58tYXdyOeuy1ghmq
	jJpvhB+HREKm3Y1NsLRzw8UBJ8QhOSMeZtuCpknRQ94M+AC3S9Kck5kS4hALdqPvNtn7QUolUKt
	B2lH1dvaR5G0NQh0Wiv1Sq7L/f7jbTFmPrXfwVGikUsNDQyIn+wVNpYU6RQNn7pxxF5L0UmVOWv
	8kpHNO5KYPbo77B5I/yZMEAJjXq/ThiySI3Oz4XKDr1alp8y+PTuN0WFNoCv9T2914Fl0VLSqPN
	xf6QDCerHaERLzf9onZlisFop2RbHiCopYbTvdk4rVeLr2CeCJUGTQAJYX3IDP+W8VU42NghETy
	1fCITN6nIz8ceplfjQGeeuDQJdPk2R74/n4WymlHN/CkUfcxR5TyWlUN/F+nDkZiMiLig+GSzMX
	d1mzPGvQ+XpcvHc8Q==
X-Received: by 2002:a05:6a00:aa85:b0:857:7384:b5fa with SMTP id d2e1a72fcca58-86948928444mr4650612b3a.22.1789013677382;
        Wed, 09 Sep 2026 21:14:37 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868c7a9e789sm1364304b3a.3.2026.09.09.21.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:14:36 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com
Cc: rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH] srcutree: Skip torture to-big transition for atomic SRCU
Date: Thu, 10 Sep 2026 12:14:27 +0800
Message-ID: <20260910041427.3579817-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Atomic SRCU does not use the srcu_node combining tree.  Exclude it
from the SRCU_SIZING_IS_TORTURE() transition in
srcu_torture_stats_print().

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/srcutree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index d462102c6bb6..99d11fb4123a 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -2421,7 +2421,7 @@ void srcu_torture_stats_print(struct srcu_struct *ssp, char *tt, char *tf)
 		}
 		pr_cont(" T(%ld,%ld)\n", s0, s1);
 	}
-	if (SRCU_SIZING_IS_TORTURE())
+	if (SRCU_SIZING_IS_TORTURE() && ssp->srcu_reader_flavor != SRCU_READ_FLAVOR_ATOMIC)
 		srcu_transition_to_big(ssp);
 }
 EXPORT_SYMBOL_GPL(srcu_torture_stats_print);
-- 
2.43.0

