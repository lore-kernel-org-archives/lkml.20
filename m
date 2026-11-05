Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891609;
	b=teB3f329jqUoLISwHbMpLjj2YBsd8y9sZOyPhRiTGmQIRzA86u5mHfOloR0l7zcPx8UA
	 wLSlZWmbEiWu2nwbRXKmRwYxpLONryBogVS2CzkiFt5+YRO+kJo5v7nYjDSg4XEurdD/r
	 WVaFcbi9Wac/+h89UlFaTQzuRUdaFL4OTx0wmI6dw1s9CKQ1OxC9/dHhpeJa935u8TO+d
	 hq/jphE9vha+yRJ7f71xenTav04P0HvQKrwNdMAWr/y8UfiQOls4A8XvGsoqsvqjWA6f8
	 zzdpnNkS+3e7XH1NgjuiT5JHSjsMPE/LWGX8R0vBpxbiazAjIXMeGdNcIC7jf57WKUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3EntorAO6uGRZa0XmiRAoxNunW5o1VJzJz1CYc+fDIg=;
	b=MNpvKzKVTxFFW09QwFYeYw3Uq+vFNEyVp0EPIhX1gx6t3KxLMoAg0y+Ps5mtBmgQIrgo
	 kPvN5A6S+4AqtPUyYtwByoNA8tB2eyF3bzDaWtueJXTiCE12WeZd+Baz2q72OQ6PqRgjk
	 r15yfuZVDw26UAtDv8VGB2J67Xc2gOwnzFdYeYu7ft/Y+ybfCpDdCL0fuuArjZ3m2kdSS
	 zSKXtUM50Zp3suQF3L1ute6nFAdMC2lhnkoGxuDeLlg2Q3G8Hcru5l8EOmcaZqMBhD+sb
	 wRe5nhcIziYcQ42BKEvsszWHqDyHB66X3zBrc9YwADFsluFOJPyAoToL9dwczEi4rew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hoykBM8z;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CB3606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05CB3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hoykBM8z
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67c08c7adadso600688d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891608; x=1794496408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3EntorAO6uGRZa0XmiRAoxNunW5o1VJzJz1CYc+fDIg=;
        b=hoykBM8zoBNM3xS79z2oaGRpmQ8DP66aiJndj5FeffpBvuhPGe7H41Ui66UX4iiXTP
         qF/mo5pCvIBzND5Kbbd/9GbTt56HlAnOG/L2VdXfVzY96SVheILe+1pVVV6c+4pzZ1Ki
         bYpDRMcSQUgO8K/cvjlUF5NzlGe2/8hb1g5Tkh0BKnTxzHmVGSHiR+Liw/L7l1MxWmYe
         oRApjycvW8W1eLJV9xaAvpJVa3YDqgIC7SX6/G9jfx3XG961pftSiQ2cT5a6AZRqtOhv
         kisF4QZQQ0pcbf9D67kNeatTwfYAyWSDqZycUUsiBLCjbxTZsDK61oqWRGtZwxaDGpu/
         rQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891608; x=1794496408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EntorAO6uGRZa0XmiRAoxNunW5o1VJzJz1CYc+fDIg=;
        b=JUAH/uj8MJlrR4E+AYbebQv8JFLhiRH1OOMQF5pXj1D3zMGiMfcHMsaIqbenPrctK1
         spxm0AuM9Rrtr9UsMv9VhojTrMTJY79+F65z2eVyPnBLB/2zWxHff0KeGrdS7Hy0XJWH
         az3CFu8QYxIpykObPXagAdbMygeRuqbdc8h7ufCIqvCm0IeP41G/OBwm+d+kr/OZGw4P
         yof4+MY3ZohsUqvT10EyNkBxVgfXOumenTlOME8yUuJyLZXGdgzRicOnszSc7gCdZDBK
         91RXrIkOWr9eRIhPftVU/qshqjIf+wBSRGvXbSAiBNDGiodUJtqNBPey8xWeEysCdJxI
         5VrA==
X-Forwarded-Encrypted: i=1; AKwUvBzWtccyac1W5Zf78fDQPEZOXszqJoJKDln486oJzVTZNerDxm6rggLDuyYcytV4O3tRshRu3mU4j+GJTlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y7ZUapM6t1rtvmlS18w1ltMJ+vNvd4INI3317zxILu/yBX1uN
	YzDx8qwbJhbMaVQ2YuJPIeLnCyP9JyPheeUzCz/sHCbAJEOBvGVSPY3vC2VAiWjysO9DNMxJ4se
	fEZ/mbIg=
X-Gm-Gg: AYBFou3xBpJuw4+tu81Mi+th4n+D0YHE2/M5HWS46/kW7uJnbIxFZ2hf9yKWq9Bj2A/
	AguNI6wbfmEMbLtC2LvhUNxI3Oi+L6invxviPc5htw/sgU0Vg4weoN8wtTUqDAVBURm7v5JOhPP
	tO2yd/JBtHYLSFsoIhUEUlyMktrCbCsrZQcqgXjKXBjO/yEvHF09udhETFa8VjjeKKRqm9EUJJI
	AARRzP9pu6FBm0wr2LQUh/LZQphtAe0m77KUIyjO2N9qSjVxvocSK9HtpTWZ43DyHB3LwGr7NZ0
	LMLOKSAtjERMYyP5v6uNiDtoXWC3Z4jrfVUYUnZ3ttfjrbiz5FJc80MxGoJAWaKTxCe9Xp21HnR
	q2D+zeav6z5QskNOpZ94oBzKaLpMpx/NHhL1Q/LzpfoKgG3sy1v57BVBrYPSAhJzWlBFSDxUheh
	YA0zbXOFiG72u90FczJFtHDF3WF+zaV2viRi7zcWSgKcA2s+HvtLVM6VlO+rC6jjJvahekvRVG2
	2zBDm4p24mLaTwd3405EclxqgbK0lWM1+24dGRCUhmyFje7/hAHxn82nhNQS/oR1NCsRgl+sxJY
	KBFZDYP0r5L48pOLba4tUMIXfd8yjp3O35mjAVM5v4LR4g==
X-Received: by 2002:a05:690e:488b:10b0:67b:ec5d:4ac4 with SMTP id 956f58d0204a3-67bec5d63f6mr1835180d50.15.1793891607899;
        Thu, 05 Nov 2026 07:13:27 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee202c7asm3588018d50.6.2026.11.05.07.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:13:26 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:28 +0000
Subject: [PATCH RFC v3 36/90] cgroup: fork a task of a cell into the budget
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-36-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890933; l=2212;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=aghM9m8AJxdVBWbbIIBSJs8ZGBiK18GQhS+/zAhLPFM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFPWcYa90YXI9Ef1XT//sBpt2wNn+pGzGCM/QC9BceQrmWDdppLW9c4764qCBaK6M54GuxtXwY3
 RaS3rMwtNWg8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A task that is born in a cell starts in the budget of the cell.

The spawner is not checked for permission to put a task into that cgroup.
That check was made when the "budget" slot was filled, and holding the
cellfd is the authority to spawn.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/cgroup/cgroup.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 051b220e2850..3869cfa6af50 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -28,6 +28,7 @@
 #include "cgroup-internal.h"
 
 #include <linux/bpf-cgroup.h>
+#include <linux/cell.h>
 #include <linux/cred.h>
 #include <linux/errno.h>
 #include <linux/init_task.h>
@@ -6905,6 +6906,41 @@ static void cgroup_fork_child_unlock(struct task_struct *child)
 		up_read(&child->signal->cgroup_threadgroup_rwsem);
 }
 
+/*
+ * Fork into the budget of a cell. The cellfd is the authority: whoever gave the
+ * cell this budget was asked everything cgroup_css_set_fork() asks of a caller
+ * that names a cgroup. Consumes @cset.
+ */
+static int cgroup_css_set_fork_cell(struct kernel_clone_args *kargs,
+				    struct css_set *cset)
+{
+	struct cgroup *dst_cgrp = cell_budget(kargs->cell);
+	int ret;
+
+	ret = -ENODEV;
+	if (cgroup_is_dead(dst_cgrp))
+		goto err;
+	ret = cgroup_migrate_vet_dst(dst_cgrp);
+	if (ret)
+		goto err;
+	ret = -ENOMEM;
+	kargs->cset = find_css_set(cset, dst_cgrp);
+	if (!kargs->cset)
+		goto err;
+
+	put_css_set(cset);
+	cgroup_get(dst_cgrp);
+	kargs->cgrp = dst_cgrp;
+	kargs->kill_seq = dst_cgrp->kill_seq;
+	return 0;
+
+err:
+	cgroup_threadgroup_change_end(current);
+	cgroup_unlock();
+	put_css_set(cset);
+	return ret;
+}
+
 /**
  * cgroup_css_set_fork - find or create a css_set for a child process
  * @kargs: the arguments passed to create the child process
@@ -6945,6 +6981,9 @@ static int cgroup_css_set_fork(struct kernel_clone_args *kargs)
 		return 0;
 	}
 
+	if (kargs->cell)
+		return cgroup_css_set_fork_cell(kargs, cset);
+
 	CLASS(fd_raw, f)(kargs->cgroup);
 	if (fd_empty(f)) {
 		ret = -EBADF;

-- 
2.55.0

