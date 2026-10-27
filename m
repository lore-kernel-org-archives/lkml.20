Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072762;
	b=q/zu6FoDFU72/Nmfj1TF8uexJaAuTTYyoUmVT2mA28t/Wrk+0OyJ1nC6Br45r3Ik47YX
	 MH65z5KOceoN4mz2/6GL9duyz1pqTmVboRsb0hWWM87oPfscVOLtimAKKACfnrmLgDmzS
	 y3cRfNA8P1ohOSwVmepwkYoHpOuAQBQOekwlZQLhharjwuVQ7e4ul5lrxulaE78Dv/wPS
	 WBojpnKEJjY/Vux7FTONAo+Vn76QKmnOyCTcFPx488qlSFs81wSChw0+1/AX3HpZIrRDf
	 ikB5FHZv49K13ebdTSsYibyUwsPwH039Ct4+orWpXQD9YJ8WPH0vlLmksyxrYPma7kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072762;
	h=DMARC-Filter:DKIM-Signature:From:Mime-Version:X-Mailer:Date:
	 X-Original-From:References:In-Reply-To:X-Lms-Return-Path:Cc:
	 Content-Transfer-Encoding:To:Subject:Message-Id:Content-Type;
	bh=IU6VHGahaQUjfrcJ3t0CrfGoXgu1vrAKIBCseES6bf8=;
	b=oULbUoktHdZVJUMKcamOQ5wi2esQBEhrGLeLhDSZlfpH5tkh8L1QJlARxAasbkwXGQ08
	 0h1csleQ5lQnMWIiK0CoYzlZYe0TB2mntRRrhS+9pTjPuYtlQr8fL4jGU3wk/sS8xI+xf
	 J/tsVJ0vRUlHQXdTrx1qq64P3dD5CVfGBkL6a8hPraWcvHf5fox8kMbJm6yQv7oRiXhsC
	 g/T4tHOYF5aE8lhcyNhT+QN1VGvKYIxMgdbNgljU9NdVSl4SpUkFM48vP5FRzJcYDcMKj
	 ff4HMXXDR0PQBgEzJ7VXu1LltPspFhQvTfYJbW87A5rqBGHXguOMqtHYYYpphwA3JwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=BXQXAwmn;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7C5606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A7C5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=BXQXAwmn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793072757; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=IU6VHGahaQUjfrcJ3t0CrfGoXgu1vrAKIBCseES6bf8=;
 b=BXQXAwmnrK+4EbP7eIcaZpgDPDo9WqPpY3ycHdMWr80q/YjYP144tXRbrWdKpQ5OsUGC8O
 WrB4V4GzI5Wx+s6Ytoy+U3viwbD/fwE6kbbZ76PC6+Fh9UI73DXU0SyXte+M0Z8S+DysFp
 K8vRNsyiXZc2TOXYyENk7LXQ6dOfB30a+PTcdFNv8gc/pQ1Oxrp9L7sMq6t9zAPJ9imWnv
 xoC5TSQr+bB5L5aCpMA07U32fGSdaR11L87SLLwwiDRaA3ysMyoV0GxUGzYUygalQQam6G
 7EcSyPZJW0AlO95LnO10LPlIJH8C0Ct60nmxntYjQWlqJtyIZP30Pal9Imo4Yw==
From: "Guixiong Wei" <weiguixiong@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0
Date: Tue, 27 Oct 2026 11:45:26 +0800
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
References: <cover.1793072271.git.weiguixiong@bytedance.com>
In-Reply-To: <cover.1793072271.git.weiguixiong@bytedance.com>
X-Lms-Return-Path: <lba+26ae01e73+bfd9c3+vger.kernel.org+weiguixiong@bytedance.com>
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>, 
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, 
	<chang.seok.bae@intel.com>, <shuah@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, 
	<stable@vger.kernel.org>, "Guixiong Wei" <weiguixiong@bytedance.com>
Content-Transfer-Encoding: 7bit
To: <x86@kernel.org>
Subject: [PATCH v3 1/2] x86/fpu: Fix memory leak with dynamic fpstate and exec()
Message-ID: <f6c7690f8288ad9e95996e0cb37fc4c385df9ee1.1793072271.git.weiguixiong@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Message-ID: <20261027034526.O2Lc3xqfhBd9oRvpPnyQJEr0fCrAmaviMM91u5SO4q0@z>

Using an XFD-controlled xfeature can allocate a larger fpstate. On
exec(), fpstate_reset() replaces fpu->fpstate with the embedded buffer
without freeing the dynamic allocation. Once the pointer is overwritten,
the allocation cannot be freed on task exit.

Free dynamic state at the start of fpstate_reset(). In fpu_clone(),
clear the pointer copied from the parent before resetting the child's
state, so the parent's allocation is not freed.

Fixes: 500afbf645a0 ("x86/fpu/xstate: Add fpstate_realloc()/free()")
Cc: stable@vger.kernel.org
Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
---
 arch/x86/kernel/fpu/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index d1aeecd57f5ed..dbe6696fdf8cf 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -594,6 +594,9 @@ static void __fpstate_reset(struct fpstate *fpstate)
 
 void fpstate_reset(struct fpu *fpu)
 {
+	/* Free dynamic fpstate (if any) before resetting pointer: */
+	fpstate_free(fpu);
+
 	/* Set the fpstate pointer to the default fpstate */
 	fpu->fpstate = &fpu->__fpstate;
 	__fpstate_reset(fpu->fpstate);
@@ -670,6 +673,8 @@ int fpu_clone(struct task_struct *dst, u64 clone_flags, bool minimal,
 	/* The new task's FPU state cannot be valid in the hardware. */
 	dst_fpu->last_cpu = -1;
 
+	/* Break the link to the other FPU's fpstate: */
+	dst_fpu->fpstate = NULL;
 	fpstate_reset(dst_fpu);
 
 	if (!cpu_feature_enabled(X86_FEATURE_FPU))
-- 
2.55.0
