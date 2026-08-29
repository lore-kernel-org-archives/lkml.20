Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1371F3624DB
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787993814; cv=none; b=mZndofrqw01OXqyRAsD4O9WOYGAqIRNMLNT6fRvw+E8JpJT/R8BuD/KK3m1/ldJyC/3uWtDU8706ttAX01hzrJmhiTy0pyQqzs4zdTxsvCBoA4KBEiWI0ASGWXA1uRZ5dyGOOO4sGY4yy0LvsB5DoquveZB5SErX40MqcSylY5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787993814; c=relaxed/simple;
	bh=ltGi5MoC4EqeGkD1f/psn6+vFglQOgPgyI7woW41wpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BmiKHdQfB7Erm0rAvSMLeNYVmfkX4xsKW5uAnwvEdOBFDufwBgFkJTjyFi2M5bT1YO79p1/3nFcThYdUb2e+A2rTS/0zN6Dq68Hfi9nEFoXI51aahBY/ARullOaUm2+/A2AMuYRgcgXJKAiUILXrNKGPKo4qNR6Aw+cvvGzOtCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gA502XLO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gA502XLO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fd4531020so1010752f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787993808; x=1788598608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2/Zp6NA4HAJ1jDSITO8e+fRzaCcgFllUHQXoAMtqoM=;
        b=gA502XLORfJXeysWAdJE9JYNlCfDN1frWUzWkvrETnXvcg07xtAQiyG66WjCFeiDwB
         ZvAhs+AEpEjWk2svMROTcT3Qi6O8opfeM39z2PCIL+ZqbIQjMl0LglRcHkEoCO3cvu/Q
         EGPDl2/l2NPhRKbfV28wWhnuf7CPdEEwLq46mJorRMy2gxrdojrH9tCb8t9ayWPnqAX4
         VO2V/XNdKk4HW2E7LB6bnxMzy7RTr4oYvLpwp/Zbk+uCpy1dVNWqaQaw5+bOc+tkVhy1
         Co/bvoD0HGD3nBaF6lW/+FgI1GI2BlPlQmmQ6cdOeWyWJvd24nbsNq7t9INVOXK0D4Us
         xLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787993808; x=1788598608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B2/Zp6NA4HAJ1jDSITO8e+fRzaCcgFllUHQXoAMtqoM=;
        b=HWbXyB7wcBFRgri1/3qp/HdA/By4aqRz0fYn+EdqKdsMffQV7d2YYEeS4vcBPWez1x
         NQBJXydF+M2xNkNQxF1KudibIp0J/FuSS7F7U2UQ/LQlmPFGhuiJCDCoDC7caUfn2C74
         c/QplVdv9gdJA4IYSsYD8LBVnNi2fCQu7bosxy2a4uokVppxwfahgzdgLyYA6B6NWGHb
         KHaa1zKOfOvKSCdgX73dvG7vysB7X6EaNhhQf3eKxBO1wMhbg/Sm6s0yAbSzLWimya8c
         DIFupllFdHP2DhZKIV8RpTY53771JEYLp9MAQdmoYKacY6GnDmSYRWxH5amkbuxZGIFt
         HovQ==
X-Forwarded-Encrypted: i=1; AKwUvByGBjuQCXAzV7hJJhcKOVEZnlEe9eSftheX3HiGWmW0RrBGbgUrYQSTI55Qf2uVhvkOJ68vx5qlrMqbUjE=@vger.kernel.org
X-Gm-Message-State: AFuF++k2tW09dnzqOlEFTQSo8AoWyth/fP4+vHLX7BM9zTHoSUBff3sD
	N1PiPSshJfVg5hB1loxMMpQvCejnlrU394g6qSVQJ0L/TmMuxo2sbPbC
X-Gm-Gg: AYBFou183epHFcBnbwNWKVGIGU0ELhtPOvXjdABM1FWm5BPGxEi03lds9dsXRgiYZSo
	HBlHgtTPwmVR4FwZAo423UGDbZHQemAPwUJO+hSQp18JMpprX5tAbYUZTaH0JRSUK0nGaCXcbqI
	ovfRa+ITAJ6+TJ4AYd1Fjp5Xgr6DQ27mWc3fGX8hqffMhP+f7CyIhXplaJ+GAxkHtqD3KtQUGiq
	WYVOJselO4De16qoK54c376BivNJtXOxmR1Fhwx+9Oxj0zo6ZYpj8BRmX8Hqjj0XM1QA5zx1wYT
	JQBlECvCFfKqHt4BQEXg76JBOQTrALp87JtNvs+aKR8qtQwoV20Xf6A08ZzS5Kf9F1aigakXah5
	3RECWYrOoI2E0qoOcJLld/r7TphsJfYUbuc4atAb4Owmwiz5h5fCd0i5W1ihbUmWgW5+fvoFJFH
	p5NFMuVAIOlukzwpG1ki8ECPAz/o8VNkGs3odmiRMA4aaVQDo/VzXbazpcyVDFSoDFc2PpwyNaf
	ukNfLzB4GHdJ7FW8oOKSWAco2hPLu+1XgMk0Ny851ssSaEYGunegGr2vM40S4A/tC0tMZjk
X-Received: by 2002:a05:6000:481a:b0:47f:f43e:f0cd with SMTP id ffacd0b85a97d-482f7977a45mr20810773f8f.4.1787993807937;
        Sat, 29 Aug 2026 01:56:47 -0700 (PDT)
Received: from drago.hgw.local ([2a00:1d34:e90c:f900:e29d:3a79:ac40:9edd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb28276sm10109373f8f.29.2026.08.29.01.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 01:56:47 -0700 (PDT)
From: Deniz Aydogan <denizaydogan1902@gmail.com>
To: lizhi.hou@amd.com,
	amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Deniz Aydogan <denizaydogan1902@gmail.com>
Subject: [PATCH v2] accel/amdxdna: fix NULL deref and GEM object leak in error paths
Date: Sat, 29 Aug 2026 11:56:44 +0300
Message-ID: <20260829085644.38103-1-denizaydogan1902@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829080016.10002-1-denizaydogan1902@gmail.com>
References: <20260829080016.10002-1-denizaydogan1902@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amdxdna_cmd_submit() does not set job->cmd_bo for internal driver
commands that pass AMDXDNA_INVALID_BO_HANDLE. When such a job hits
an error or completes normally, both the submit error path and
amdxdna_sched_job_cleanup() call amdxdna_gem_put_obj(job->cmd_bo)
unconditionally, dereferencing NULL.

Separately, amdxdna_cmd_set_error() acquires a GEM reference via
amdxdna_gem_get_obj() when handling a chained command, but leaks it
when the subsequent amdxdna_gem_vmap() returns NULL.

Guard all three amdxdna_gem_put_obj(job->cmd_bo) call sites with a
NULL check and release the GEM reference on vmap failure.

Fixes: 3ba13f5e7180 ("Merge tag 'devicetree-fixes-for-7.3-1'")
Signed-off-by: Deniz Aydogan <denizaydogan1902@gmail.com>
---
 drivers/accel/amdxdna/amdxdna_ctx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 31a414c3f..a806702ec 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -183,8 +183,10 @@ int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
 		if (!abo)
 			return -EINVAL;
 		cmd = amdxdna_gem_vmap(abo);
-		if (!cmd)
+		if (!cmd) {
+			amdxdna_gem_put_obj(abo);
 			return -ENOMEM;
+		}
 	}
 
 	memset(cmd->data, 0xff, abo->mem.size - sizeof(*cmd));
@@ -575,7 +577,8 @@ void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job)
 	trace_amdxdna_debug_point(job->hwctx->name, job->seq, "job release");
 	amdxdna_pm_suspend_put(job->hwctx->client->xdna);
 	amdxdna_arg_bos_put(job);
-	amdxdna_gem_put_obj(job->cmd_bo);
+	if (job->cmd_bo)
+		amdxdna_gem_put_obj(job->cmd_bo);
 	dma_fence_put(job->fence);
 	mmdrop(job->mm);
 }
@@ -676,7 +679,8 @@ int amdxdna_cmd_submit(struct amdxdna_client *client,
 put_bos:
 	amdxdna_arg_bos_put(job);
 cmd_put:
-	amdxdna_gem_put_obj(job->cmd_bo);
+	if (job->cmd_bo)
+		amdxdna_gem_put_obj(job->cmd_bo);
 free_job:
 	if (job->mm)
 		mmdrop(job->mm);
-- 
2.55.0

