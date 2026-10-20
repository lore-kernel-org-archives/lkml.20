Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498812;
	b=RUU++2YlWeAOjF0K+nSRdsodZ13+ugvP9T9SrfUBncX4eZ0L/DA4Rlwo271mAgxNKDKM
	 UZ7c0ckvkfVhHxUTC7Cb11mWQZpKJxTcvh5lfyBSxVxKS5GG0BynJ2//CT1YO9u0Olu8g
	 CP9vieqriBn0vnMsPAZ1crAv8HkgW2GBjFiICjHE7caYaQ06D7zM00SysE3iRKr0fluwa
	 5aBdL5dMJiciHsPvrjy5OZjBLUYCpnTUUfjllm54YAqpM/hx7m7dmVhgG3fsxf9Gh7W5b
	 Q5HCwHAL4DobbThU2ZMM+aBo1fBGPEU5zDU/GdWcD1tUm78VU4kGsvE0135AlxdLnPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498812;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=sSPsOhCdlkkU7oqaveAthEmqWklYxqGvWCj+wkCOtJg=;
	b=LLdWPNPTYMJyfz8cNOrYN77ka6xi3+tYc3vZESTDvTWoOfsRShkrF6tfdmYyn8AkmvCQ
	 3YfzB99N+tzx0lIO7HTzTgyOopxCU47JozGTfMVzwhz6XaZrJUSlwHlOCJmhpOp5T0w7N
	 dCUSVgpMQWCbFnOAywF0WYHVOjyxnDlXeadFOsMo+nk9YPpnAcJnT70Ng2Jfk9bk2hsk+
	 YaBIxkQ454TN1sWpUMNpvAdnhNZvuLpFAROtfFv6VWN+Mb3/dRIZ3Lq7JOssne3VFrHaW
	 04v7eXgqD5UfCFRFaUbTnvplzCwuBBNqBvuUQ2G2QlB09fUPesy//HuGajFAOpbKJwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cg/nvNRh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEA960A2605
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cg/nvNRh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8B61F000CE;
	Tue, 20 Oct 2026 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792498812;
	bh=sSPsOhCdlkkU7oqaveAthEmqWklYxqGvWCj+wkCOtJg=;
	h=Date:From:To:Cc:Subject:References;
	b=cg/nvNRhycPBhA1lj6WVAOpaS2VARwJjxjvbe6GSigHB/o92kxaVJMVjvNtPF/u4P
	 nrR1RR6vCPJbduNPoeWWqNH6Wj1N+zfqVTbzFZVLhv5kA+NtD2o8xK+yi4iLYE+ddO
	 QzaWN3/kJQxosAkrTJp/+Igga0XpIjYLwe6kTaYXLoi9dszCtG3DiC73JjXI3x8rcn
	 1VfWeqjLfu4TwGUxCJgVj9yg2s2rGAcJh5sPnwvoweQk6abIGkC+Rgx8v95CAtlS4y
	 30hYmAk2GWM3tMX2fiYUvdJeBMZB3K69TlsfGWWyMPFKkDQFTiXrDcAKRIujFqsAz6
	 835Y002yEWtDQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xJ8p9-00000001y4V-3e0Q;
	Tue, 20 Oct 2026 08:20:11 -0400
Message-ID: <20261020122011.676328446@kernel.org>
User-Agent: quilt/0.69
Date: Tue, 20 Oct 2026 08:20:02 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [for-next][PATCH 6/6] tracing/osnoise: Add __printf attribute to osnoise_print()
References: <20261020121956.600452831@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Building kernel/trace/trace_osnoise.o with W=1 triggers the following
compiler warning:

  kernel/trace/trace_osnoise.c:96:17: warning: function 'osnoise_print'
  might be a candidate for 'gnu_printf' format attribute
  [-Wsuggest-attribute=format]

osnoise_print() forwards its format string and va_list arguments to
trace_array_vprintk(), which is annotated with __printf(3, 0).

Add the __printf(1, 2) attribute to osnoise_print() to silence the W=1
warning and enable compile-time format string checking for its callers.

Link: https://patch.msgid.link/20261019205344.190022-1-adriangarciacasado42@gmail.com
Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_osnoise.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
index 0e1265acd1cc..995da9e0b548 100644
--- a/kernel/trace/trace_osnoise.c
+++ b/kernel/trace/trace_osnoise.c
@@ -83,6 +83,7 @@ struct osnoise_instance {
 
 static struct list_head osnoise_instances;
 
+__printf(1, 2)
 static void osnoise_print(const char *fmt, ...)
 {
 	struct osnoise_instance *inst;
-- 
2.53.0
