Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DF4483BFF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843366; cv=none; b=L63VxuRmVt39gh4ew7M15Po+gJbzbbFT1NOZp2Zc+cUl1d/JKaxWyDaXliWGgdr+bZp2Ux1dxI+ztViXrDKWVMEdi3uJ6HzCn6hPozKqTnmjTDVe8xqNsaggCJk7w7HtXIc8Jtm4xYDkWRif8XDy9eFrbjZQkcH1NeeBWtH5biM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843366; c=relaxed/simple;
	bh=/F6DF9N6aI26k2SDHGgLnmmPKxBwn4ZVAH11GI8tveE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=dUyWCyRYjRYtq6m6lydqIjPAQyKOieNta3lE+2AQu5k8fAZjuzoP+a3A2ewtKHmOH1KA5a8DmqdTCdVJRryDy82v+Iz6LdJ6UbiCi+KZsqR2UKNaLLJq31CCvBKLHeTWH6FxDExAOSCWiWIlgcAzAPuX5CULr0nosawy84bpDSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVwm26yt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVwm26yt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1201F00ACF;
	Thu, 27 Aug 2026 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787843363;
	bh=b9FCRmxqVb1GJL/GzWj6/s/4yvGvvUOtw/dfPPgDqJ0=;
	h=Date:From:To:Cc:Subject:References;
	b=aVwm26ytG5vCtBjhbP4WGCbepn+mVciOnp2gejjpx6ib2uCPVtzharPqBH9i9pEFm
	 BYMKUanTVW6sq7JptmoDDatIiEtfUlrNzd+SliMzLv0HYawdYrgwTNXt1k9rfFE6Dm
	 K3iGT4SMJfnv7plQZdCFugOKWw5oXgWOEtw/VnMz7vAuGvdkYYXsGl2khUIfLP4q1W
	 2yUuadg0FZnHsSjd0ZeE6czeus0mcNQusV0+fSJGqlRPQ++r8pN5+0Qql942U/9iTB
	 agVa5yPJqIkKs/gZH5gW4umb8Gv0bhoDbSnlaq8SiJr3tMKaaMgaVRNr62CS1+qCv0
	 tZgbyRCp20oIQ==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1wzbk3-00000008PHU-3RVF;
	Thu, 27 Aug 2026 11:10:11 -0400
Message-ID: <20260827151011.689123441@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 27 Aug 2026 11:09:56 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Deepanshu Kartikey <kartikey406@gmail.com>,
 Haotian Zhang <vulab@iscas.ac.cn>,
 Hui Su <sh_def@163.com>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 7/7] samples/ftrace: Fix kthread_stop() on ERR_PTR in
 ftrace-direct-multi-modify
References: <20260827150949.304280511@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Haotian Zhang <vulab@iscas.ac.cn>

ftrace_direct_multi_init() assigns kthread_run()'s return value to
simple_tsk without an IS_ERR() check. When kthread_run() fails it
returns ERR_PTR(-ENOMEM), but init still returns 0, so the module loads
with simple_tsk holding an error pointer. On unload,
ftrace_direct_multi_exit() then passes that ERR_PTR to kthread_stop(),
leading to a null-pointer-dereference.

Check the return value of kthread_run() with IS_ERR(); on failure,
unregister the ftrace direct call and propagate the error code.

Link: https://patch.msgid.link/20260826015050.10772-1-vulab@iscas.ac.cn
Fixes: e1067a07cfbc ("ftrace/samples: Add module to test multi direct modify interface")
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 samples/ftrace/ftrace-direct-multi-modify.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
index 7a7822dfeb50..b03766c6217b 100644
--- a/samples/ftrace/ftrace-direct-multi-modify.c
+++ b/samples/ftrace/ftrace-direct-multi-modify.c
@@ -364,9 +364,15 @@ static int __init ftrace_direct_multi_init(void)
 
 	ret = register_ftrace_direct(&direct, my_tramp);
 
-	if (!ret)
-		simple_tsk = kthread_run(simple_thread, NULL, "event-sample-fn");
-	return ret;
+	if (ret)
+		return ret;
+	simple_tsk = kthread_run(simple_thread, NULL, "event-sample-fn");
+	if (IS_ERR(simple_tsk)) {
+		unregister_ftrace_direct(&direct, my_tramp, true);
+		return PTR_ERR(simple_tsk);
+	}
+
+	return 0;
 }
 
 static void __exit ftrace_direct_multi_exit(void)
-- 
2.53.0


