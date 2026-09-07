Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAB83EB102
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770565; cv=none; b=iqfcePm7HG9vs2sjS0yBumNOkO/RFYoc97FDJ3DYuUn8cnuOSIVgyulz402KnuAPCtPQ8DQNZ1t6JnNBIM1GOaOlQsZ9WLie9N9qJrzyAVeTkOOcUYTM1HMARutaTe6p4Vp5Vwm/wrAhbZL/7ilQVWe5bA5oi8Bakt3Mi61bs1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770565; c=relaxed/simple;
	bh=8vstMt/fxAgnN9Du+eQzLvJbYicuX/NvJg5yF+/b6Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oHMzxxigkE6xhrJColOg42RjisZyiwM/mw2NQOgFSIt7pyNnmb8rsbG1E6MLbHDU5ER3ETkF8BPpQrQnpV4CDnjdc+1NstpERDFgvgnKdHVeKwVtvN7VFJwcomo5Yf9Hu5+QrAu7IRGy29Aet0LEgZHwtzEpHE3YRhRMWL3hHjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKPYKML5; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKPYKML5"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so2635426a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770563; x=1789375363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WNalOX0xfMuYfJ3R8nNdE/5yHB2tJozrv9LQsSCEUqo=;
        b=HKPYKML5a8CqNswGLtz1jF/loQulvp482nppUXALg7VcQax1zFQsBxEUvchfRSk0Kw
         t1poeDIiVwkMNHhE+T1PVLXKEs06/VW34G9+EmPJrI+EMGQIhmumzbTwb5OGkOo4+W+w
         rCi99DM/aPAWqSP5b8b6kjiSSa/mGp6lId67SryB42elXJf2/53OO/gHXtUhECcSVizL
         JKpP+A6VIfqI1lkNk/bVrAFDTirAjOKti2JCbrWvNj9uezhJ8rygNVtj7OxP2G1xPPfl
         hBv0PBAVCrQBnAco28+kgm9tyWmgB9Omx2Qo2stsVFZNCG1Ab2kTf+FN+4mU6ozffJuG
         ntlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770563; x=1789375363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNalOX0xfMuYfJ3R8nNdE/5yHB2tJozrv9LQsSCEUqo=;
        b=WmJN8OjuModWmbOzGTnJtJFRf1yLN4aoOWvuf9m5EzSAe0KQebqTw4K2WIJ+uUPOVC
         3UuabxRhjbBVXB/X8C2QM5jidQOCeZarp7u/6xm55XgnYIi72SkOztOAUDwb2V7CXd0B
         Rp50aXxO3/IHhxDzg8s4vsYPoVBEqotf0oxWLf6NotTYEgOpiSfGwnRsAQGR0Jpn19Dx
         T27cvmQXwMI5DAm0a4hukRb4ePM+V/4eqSAVrIP+5uSjtPzBssCL7CAQQ3vZR/4scMy4
         M+Ed67eT9fSE3PUMwMh9t5BojtVel6qp4CoqeYzFuhtBaoWY/XJCGd4BJBY3GGOa6DQx
         leHQ==
X-Gm-Message-State: AFuF++kyCzoSPyYpaiFWZfhRdY8CydywJcwR5SH7BQuaoJbod7fduCXi
	+Z5Hv1J5Fp+4zfnKSqoBC5atY1cSMoKPCSgyGFfyGeFypb62zpUyBkM/VoC6QYgj
X-Gm-Gg: AYBFou3X+5ZGoQd2LgYACzWWEnppL+bWCy1xDoXVwrPgHW8g8vJw2JSawZdOBR9+M/z
	mXAkGZWGozXFekLTVTn7Ur6oVKPfb+o/0OTgl8JhP0UArsLcx3qEJDSgfWh0d/vQTpTX7kY83Yf
	rzFq25z3GTsr/UCK1ah12ndpxfpaoCGnzcba7lsYtowjzwXT8Y9xoVPVxLYkGCH0r0rCYkfQDyb
	sNZAm3K3t1KLVsLuHxPRMA+dNpXl9WTzpFzmVSQke/kCLotp5pPL+GZEyGmvFh4Ou4rXPZggRKM
	tmrYHppRUlDk6Yy4uSZvxyT4GL9VIsragsvjoKjCKOel3PgoLTGH9fMGZ7DjAEOP10xttLzQuXQ
	9PsS0ouJ3QvIEhQnaz7fQlhz5u746N8ElfmEwSGZ8ijiEc/OdlAiUCe5VWL2Px3Jwi9vNdVmaTy
	S2vJ6RKoWOx7CW+WlsxK41d9FvuJGqLKhJ/7tAK+nnhNuqTQVMw4oxr75U01GCrynpSLEScCF01
	w==
X-Received: by 2002:a05:6a20:a11f:b0:3cd:9bb1:c6f5 with SMTP id adf61e73a8af0-3da39cf4739mr30756902637.10.1788770563062;
        Mon, 07 Sep 2026 01:42:43 -0700 (PDT)
Received: from localhost.localdomain ([147.136.157.3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc46b4cd51esm2519652a12.2.2026.09.07.01.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:42:42 -0700 (PDT)
From: "brookxu.cn" <brookxu.cn@gmail.com>
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] lib/group_cpus: sequentially bind CPUs within node to groups.
Date: Mon,  7 Sep 2026 16:42:38 +0800
Message-ID: <20260907084238.101618-1-brookxu.cn@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chunguang Xu <chunguang.xu@shopee.com>

grp_spread_init_one() tends to bind adjacent CPUs to a queue, which may
leads to performance regresstion in some case, such as SPDK, business
often need to  bind SPDK to static CPUs to poll data, such as 3,4,5,6,
this will result in some SPDK instance may only have one queue active.
So I think we should tends to spread the CPUs within node to all queue
sequentially as what we do before.

Signed-off-by: Chunguang Xu <chunguang.xu@shopee.com>
---
 lib/group_cpus.c | 42 +++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/lib/group_cpus.c b/lib/group_cpus.c
index 18d43a406114..b40e885f6fbf 100644
--- a/lib/group_cpus.c
+++ b/lib/group_cpus.c
@@ -11,19 +11,28 @@
 
 #ifdef CONFIG_SMP
 
-static void grp_spread_init_one(struct cpumask *irqmsk, struct cpumask *nmsk,
-				unsigned int cpus_per_grp)
+struct node_groups {
+	unsigned id;
+
+	union {
+		unsigned ngroups;
+		unsigned ncpus;
+	};
+};
+
+static void grp_spread_init_one(struct node_groups *nv, struct cpumask *irqmsk,
+				struct cpumask *nmsk, unsigned int cpus_per_grp)
 {
 	const struct cpumask *siblmsk;
 	int cpu, sibl;
 
+	cpu = cpumask_first(nmsk);
+
+	/* Should not happen, but I'm too lazy to think about it */
+	if (cpu >= nr_cpu_ids)
+		return;
+
 	for ( ; cpus_per_grp > 0; ) {
-		cpu = cpumask_first(nmsk);
-
-		/* Should not happen, but I'm too lazy to think about it */
-		if (cpu >= nr_cpu_ids)
-			return;
-
 		cpumask_clear_cpu(cpu, nmsk);
 		cpumask_set_cpu(cpu, irqmsk);
 		cpus_per_grp--;
@@ -39,6 +48,10 @@ static void grp_spread_init_one(struct cpumask *irqmsk, struct cpumask *nmsk,
 			cpumask_set_cpu(sibl, irqmsk);
 			cpus_per_grp--;
 		}
+
+		cpu += nv->ngroups;
+		if (!cpumask_test_cpu(cpu, nmsk))
+			return;
 	}
 }
 
@@ -97,15 +110,6 @@ static int get_nodes_in_cpumask(cpumask_var_t *node_to_cpumask,
 	return nodes;
 }
 
-struct node_groups {
-	unsigned id;
-
-	union {
-		unsigned ngroups;
-		unsigned ncpus;
-	};
-};
-
 static int ncpus_cmp_func(const void *l, const void *r)
 {
 	const struct node_groups *ln = l;
@@ -320,8 +324,8 @@ static int __group_cpus_evenly(unsigned int startgrp, unsigned int numgrps,
 			 */
 			if (curgrp >= last_grp)
 				curgrp = 0;
-			grp_spread_init_one(&masks[curgrp], nmsk,
-						cpus_per_grp);
+
+			grp_spread_init_one(nv, &masks[curgrp], nmsk, cpus_per_grp);
 		}
 		done += nv->ngroups;
 	}
-- 
2.43.0

