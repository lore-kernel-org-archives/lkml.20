Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF12483BDE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843366; cv=none; b=Xoq1PzAR7Xrww7T40Z0DP2ow+MHd+dN6aU2NS9FRRXKRnHQ/2okSP5+4fkx2KPqIyoxzsI2zDsCOeuCc+LS8mxx4W74Diw/4qA5DvLF4rmnEUNNRTOKrg+9Dhp+PxxBPscfvquoQaia5/CURnJqXszdw7VfRG1k8IZm3p0oKXws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843366; c=relaxed/simple;
	bh=THvfUMg5TbfzBxeyN4QirCFqOs9S7SFIChRddP64VeM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=dTIcRFjJv89ZKJ4r2/BPbw7uwQGcKL6zdsODhFTWPOD0QADvybGVPtoS7nnEfeLywfWfrFcJ+osU6g8eH3DYGcvXRyjzrj2eEwKIzXHpMybKkS/moL8BVMEo6KjV0sRO9Kaw+WVX8nhqpk4bOBtuxTVcmJIRqfCwxGQZrG1hqLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3Xc6vnv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3Xc6vnv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DC41F00ACA;
	Thu, 27 Aug 2026 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787843363;
	bh=OoOb25/cKzKtyIcy2W/62Wt5IvtdO4qR8/ih5HeWboY=;
	h=Date:From:To:Cc:Subject:References;
	b=l3Xc6vnvOOfGj26hVfx232SQZA/YZYTqqyRxpt1Bn3+V65oE5hkIk8Cpedkm+gPhN
	 n4wG7gZvBxrUpranFA2Ftrq8nAsqJx9gyLznnKuzp2dO5pR+1a3SQzJ/FuQqCUwOxm
	 wRvJyZPZhqakZN0+/6WeqwmAL9ZmFQXUG7Vn05rSRmDcRIOyTyIAoOg/DmeQ+K7ld8
	 ldlNy39C7slc+HhD9NjSU/CE/wumj1fALa8MWGdtg+oJJCRiduh1QP6a/NDwXgznJ2
	 uScUv0i+u7/BOOM1UXpgX3yvQZfejsBwktSTSmlCPvP2TPIHsH/tvRtmdWVQ0EIP21
	 pyLCspLJTNEcw==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1wzbk3-00000008PGy-2onS;
	Thu, 27 Aug 2026 11:10:11 -0400
Message-ID: <20260827151011.539857810@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 27 Aug 2026 11:09:55 -0400
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
Subject: [for-linus][PATCH 6/7] samples/ftrace: Fix kthread_stop() on ERR_PTR in ftrace-direct-modify
References: <20260827150949.304280511@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Haotian Zhang <vulab@iscas.ac.cn>

ftrace_direct_init() assigns kthread_run()'s return value to simple_tsk
without an IS_ERR() check. When kthread_run() fails it returns
ERR_PTR(-ENOMEM), but init still returns 0, so the module loads with
simple_tsk holding an error pointer. On unload, ftrace_direct_exit()
then passes that ERR_PTR to kthread_stop(), leading to a
null-pointer-dereference.

Check the return value of kthread_run() with IS_ERR(); on failure,
unregister the ftrace direct call and propagate the error code.

Link: https://patch.msgid.link/20260826015034.10755-1-vulab@iscas.ac.cn
Fixes: ae0cc3b7e7f5 ("ftrace/samples: Add a sample module that implements modify_ftrace_direct()")
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 samples/ftrace/ftrace-direct-modify.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
index 1ba1927b548e..164d9dd6fd92 100644
--- a/samples/ftrace/ftrace-direct-modify.c
+++ b/samples/ftrace/ftrace-direct-modify.c
@@ -320,9 +320,15 @@ static int __init ftrace_direct_init(void)
 	ftrace_set_filter_ip(&direct, (unsigned long) my_ip, 0, 0);
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
 
 static void __exit ftrace_direct_exit(void)
-- 
2.53.0


