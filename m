Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A4A3AFAE1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788111236; cv=none; b=QpbsIJq9nTFCCRXjqvpEFlsbD3fVG2qNj8LC1qHxPAIeqe4wyry4jhU5+HbeMiI2qSHTeEHv8hRErIj8TDR0WFM0xfe2HetrIZW8kuBD8cHzXe07nT5RIv+i7aR3NxgGkY5Ck0FYWMFwYd/tCZcBPUHJHZbfrKo7A5vm3RZQI44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788111236; c=relaxed/simple;
	bh=9+d50aJS4yrHmVYywdbowmC008hb2YhVKmPkK2viC28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XW14wQRsVKz0cT/WoBV/jubqtEJM+63ip8W7tb01G5qD+0MTmCe2GA76TB/MkicwToEek/vPZndIdfIUjy4SRfXftPPDaLlT7n7MHSPernNm24dTe/iYXVu4BQt/K8gglEwMgyu3hi3PReOH+nvu/vdS5JJNnY/RH7z6G43pY58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2wtXCYr; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2wtXCYr"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so1945599a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788111233; x=1788716033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aae9jrrTwCiQuXGOwqRy4yR8oXohuqBow9xps7fLUpg=;
        b=q2wtXCYr4shP2l9wTaEKAuy9bwwOKR0fFDvJdswC2V6FzaonPv6/IxDL+4pjmOSpa5
         eJGNf63SqmTAr8T/UV0QIbiK3Ucee4Xz0p2CRY5t3NGsNxcOs7bgDUay+CSb896DDfrN
         GyM7cStJnYAwPLivXkg7BOurezfCHL21GYePPVUKEphY/0ixe2osFHGWEZgifMaSWrvo
         6a3ZavbGpVFB6jZ32s5tLBbg+1PTPhLZ4LiFYc3pJcB8qgqI2LcOe1JULvePL3GSPnoe
         S3hfv9WFyoLHQ+PQnwAPsHCSiKAUFs3W3Ef8dkCDVMxOtG5cLiZDydNR9Kz7iyTD7voN
         cAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788111233; x=1788716033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aae9jrrTwCiQuXGOwqRy4yR8oXohuqBow9xps7fLUpg=;
        b=a2sbSeBgB4SD4h+MFFoQBE8NvlP3zAjF5BG3UlbZcl7pMlq/f7c8/RI175Z3Cz+joY
         wiVLvBWdz+3JCyx6KdyV0AH892FCffZ2UeGSTKaNClyqIXjxx+CrU61D0CJQqrc3jXW6
         oVjFjcnQt1ZQjq41epkrGhHjq783N3i9uRbTbbyGv7dWpvaUyfn9hXBGz8lR56FInEn5
         1nU6K9hmX8Wc1B9rfrWhGKHGdEuWMxFoo4WYh8Zk9R/1xbcniuOdnEVRo5FBImIdGp45
         kymakaSgksEVK1G9ErU44JPAUuV4G1I5rTJCfqAngaUF6HDKvZDwWCRImqMDCEU3bPcM
         /yzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxPTKWFDih6JrMfl2bCX+WWc0TuktWk3Lz3/CNdUfWaODeqYgdMTAwQ7c3krBePjdJl07HAgVYWY9XsYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mXkyk7n2nRLVDTYxCJh6+nr7zOmo1aT4cQW8Y1F7ZVMIVXKNul
	NREW6bfb2rX90wiwHi4ecea9TpUeFlHCU9AsdlbHJH1bbXzCzNA3u9Oj
X-Gm-Gg: AYBFou0HqTz82rV6113jRR6qRaOSxF6yI94ZHOLgoJHuODUMJqp+QpnV21WcuQlXQjq
	cC2SMqG1ci4vT56rfFaP2XtiZ9nDEgJQxqQG/bbRUVuyV/PYlIA6P3eWqZIZSrRvHruaKmJz/FV
	Gfg0KwCPH+8ArU22BxzR80Cqu3YfEtx/iHSXZfy/U0iTxlosh/1Cq0Hb3bLgN6y+3cO4D1vmW22
	0mWeFL4V+GutRocTp1wOM9GPnYoYMs7Uv7EazV4w9omTwP7SOuNyonTIo/z2zuoovROsXBERmKx
	FqRqKFlQbx4Lcr7cGZfRuaUHk95xpebZr6ScIRPs+zl4y7UsDp4GY4Aa0U3o1Nj79xq5T7JrQ4Z
	nOyhhf0FvNjCLkHBR/ou2FU44Oygs0U+nuyTD+7MwiFhvVxwLE0WsNApr50t3VxeSXoU9tQeoZx
	LDEMXfaef95A8sjwSOHoaRPn5sh+WlTg67LB6hNzkE3jqlWmisE8x7ZevM7GzXJ0IL3KGFnvwK+
	Kf4m5Nn0cYryb8sJl1e
X-Received: by 2002:a17:90a:b8f:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-398d292ea0emr4173955a91.24.1788111233151;
        Sun, 30 Aug 2026 10:33:53 -0700 (PDT)
Received: from localhost.localdomain ([2407:4d00:6c05:13e8:a91f:d3ab:5c4:f6ed])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186809dsm17237749a91.10.2026.08.30.10.33.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 10:33:52 -0700 (PDT)
From: Harry Hsu <x90613@gmail.com>
To: pmladek@suse.com
Cc: jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	joe.lawrence@redhat.com,
	live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harry Hsu <x90613@gmail.com>
Subject: [PATCH 1/3] livepatch: Fail object initialization on duplicate patched function
Date: Mon, 31 Aug 2026 01:33:06 +0800
Message-ID: <20260830173343.52759-2-x90613@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830173343.52759-1-x90613@gmail.com>
References: <20260830173343.52759-1-x90613@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several symbols can share one address:

  ffffffff8ed7fef0 t __do_sys_fork
  ffffffff8ed7fef0 T __ia32_sys_fork
  ffffffff8ed7fef0 T __x64_sys_fork

klp_find_ops() looks the ops up by func->old_func, i.e. by address, so
two klp_funcs of the same livepatch naming two of these symbols resolve
to the same klp_ops and are both pushed onto one ops->func_stack.

This breaks the assumption that a single livepatch contributes at most
one entry to any func_stack.  klp_ftrace_handler() picks the entry at
the top of the stack, but when both entries belong to the same livepatch
there is nothing that says which of them should be used in the PATCHED
state, and the UNPATCHED state has to end up at the original function
either way.  klp_check_stack_func() cannot tell them apart either: it
asks whether the preceding entry is the original function or another
livepatch's replacement, and an aliased sibling is neither.

Patching two aliases of one function from a single livepatch was never
meaningful, so fail object initialization in klp_init_object_loaded()
rather than leave the redirection undefined.

Fixes: 3c33f5b99d68 ("livepatch: support for repatching a function")
Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Harry Hsu <x90613@gmail.com>
---
 kernel/livepatch/core.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 28d15ba58a26..0dd8cda5c9b8 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -866,7 +866,7 @@ static void klp_clear_object_relocs(struct klp_patch *patch,
 static int klp_init_object_loaded(struct klp_patch *patch,
 				  struct klp_object *obj)
 {
-	struct klp_func *func;
+	struct klp_func *func, *prev_func;
 	int ret;
 
 	if (klp_is_module(obj)) {
@@ -888,6 +888,21 @@ static int klp_init_object_loaded(struct klp_patch *patch,
 		if (ret)
 			return ret;
 
+		/*
+		 * Aliased symbols share one address, so they would resolve to
+		 * the same klp_ops and stack up on a single ops->func_stack,
+		 * leaving the redirection ambiguous.
+		 */
+		klp_for_each_func(obj, prev_func) {
+			if (prev_func == func)
+				break;
+			if (prev_func->old_func == func->old_func) {
+				pr_err("'%s' and '%s' resolve to the same address, aliased symbols are not supported\n",
+				       prev_func->old_name, func->old_name);
+				return -EINVAL;
+			}
+		}
+
 		ret = kallsyms_lookup_size_offset((unsigned long)func->old_func,
 						  &func->old_size, NULL);
 		if (!ret) {
-- 
2.43.0

