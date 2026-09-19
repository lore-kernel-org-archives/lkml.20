Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0BE19CCF5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789789087; cv=none; b=ZG4hbr8+5KMD70xT+oCHZ8UrutQYfE3GyQs9qNWtifjCqhGgxD2c71XlIXNQnNegW1bgfcMeWHd3wge2dWNC2NImkzHKPj82zxBgjvfklRS7HWxYIn3pBoZWGe15FDKmnuifFsSX4WT31hoUtVKjBBqxRk5CEge5EVTXkyuwgXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789789087; c=relaxed/simple;
	bh=FMt0XOomiTagVFipc2yHyS4h5R4Qp5CWcryhQPqabX8=;
	h=Subject:Content-Type:From:Date:Message-Id:Mime-Version:
	 In-Reply-To:To:References:Cc; b=KGXrli1Toah6lULaV1nrSPx1iIvnmFWMztGUNr8CCKAZ6JXYcgkt3/ylwuBFhhoWdibuHwgXt5SbstVi4PpxmRVrs1PE7P4AyEGkWFwXlYd2sZvoN2xMi7oakIHGK2fLJYGANWPJTSIlSiVZBtYpy4LhnekKbRK+IO3+XakygeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dW7JjkzY; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dW7JjkzY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789789080; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=sgWKI1y5XLT4ulSXwOPuxJWMC/sDZ6Am6sYFd61oFM8=;
 b=dW7JjkzYUWJgkk1vQ06fHqA2F4cq4wT+s/L3qae+mme89lZGfoB0NQV7qRfFOErEPHFqRO
 bGYBwNKoVjlL4mlc6zFxmMI+jkySodTqytiaQNyknFgYsKaq88aONSEzsy3fI6z3WFqxka
 IumFdHIDrwJKQMIO9CiJIoTzYkaL4w0uJXSDa4E8cD7xrIF60F7LDvIX31KRtvR24eR89q
 2Gure92PBt2n/B5jO7NpK7wtV4dq9AqD+clrrqzoi3V6xLizrvId82+StKlPXPWbTlANzF
 DpMlj9NyeZ0S3Qjqd54eWvYvMelLq7vff8XcyefqrUPVlhGARhspq7XNqG6beg==
Subject: [PATCH 1/2] ftrace: Clarify function graph retp identity
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Sat, 19 Sep 2026 11:37:25 +0800
Message-Id: <20260919033726.1361382-2-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26aae0397+feb30b+vger.kernel.org+qirui.001@bytedance.com>
In-Reply-To: <20260919033726.1361382-1-qirui.001@bytedance.com>
To: <rostedt@goodmis.org>
References: <20260919033726.1361382-1-qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	=?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
	"Chunyan Zhang" <zhangchunyan@iscas.ac.cn>, 
	"Guo Ren" <guoren@kernel.org>, "Jiakai Xu" <xujiakai2025@iscas.ac.cn>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<linux-trace-kernel@vger.kernel.org>, 
	"Mark Rutland" <mark.rutland@arm.com>, 
	"Masami Hiramatsu" <mhiramat@kernel.org>, 
	"Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>, 
	"Song Shuai" <suagrfillet@gmail.com>

ftrace_graph_ret_addr() does not dereference retp. It compares the value
against the retp saved by function_graph_enter*() to find the matching
graph return entry.

Update the documentation to describe retp as a return location identity.
Most architectures use the stack return address slot, but an architecture
may use another stable frame identity as long as its graph entry path and
unwinder use the same value.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 kernel/trace/fgraph.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index ed455b53513b..f95e2a9ed352 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -946,7 +946,7 @@ unsigned long ftrace_graph_top_ret_addr(struct task_struct *task)
  * @task: The task the unwinder is being executed on
  * @idx: An initialized pointer to the next stack index to use
  * @ret: The current return address (likely pointing to return_handler)
- * @retp: The address on the stack of the current return location
+ * @retp: The identity of the current return location
  *
  * This function can be called by stack unwinding code to convert a found stack
  * return address (@ret) to its original value, in case the function graph
@@ -959,7 +959,10 @@ unsigned long ftrace_graph_top_ret_addr(struct task_struct *task)
  * will be assigned that location so that if called again, it will continue
  * where it left off.
  *
- * @retp is a pointer to the return address on the stack.
+ * @retp is compared against the value saved by function_graph_enter*().
+ * It is usually the address of the return address on the stack, but may
+ * be another stable frame identity as long as the graph entry code and
+ * the unwinder use the same value.
  */
 unsigned long ftrace_graph_ret_addr(struct task_struct *task, int *idx,
 				    unsigned long ret, unsigned long *retp)
-- 
2.20.1
