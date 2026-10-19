Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438426;
	b=5fs3CLNiJg/y9dnh4FTCBVFL79+am9USchbBTwZbt0+bNWKNS8+NOJhiWJM+oXTDlU35
	 Gp3/h2IzIvnsxDzf1QRf1o/7h/Un0g+gmetO/4QgdxRg/uTfOgbUV9B8src4XfA+y716C
	 h4jz/HObnStjuFy3O0e6tQlGOI/TgeITelPk1J/yo+tS0yq5dnRz4sl7mMeUNbSLDfjun
	 IvehkiS4FQju5bsqcV+ja80BWp/7SANnGpVrIpJsyEre9Y7sVTxJBuG7Uxi13JQUyQScM
	 poRTWvqrGuWU8SUfmPTY4RIyuGDKzPtw9ksWUdsEiWWAS5jZ/vkzPKtsZGl95Ne2nTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438426;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=0b5sTn4n4BuVxeXYJbDI+qsIf68gNUxTLUnFYDBsCbI=;
	b=W6S9KtRhG3BpvRBszP3JLNLEMXAH02aqk0Czp5MnVJsli/lvrtHZLqq1AeZLjMx8fbww
	 DxaBezrnx/ZWzqfaa/gNrPI6UMfJhKpfY7gvoMWKV2LbEDHVu0h7czqTWK7ZN7/WuZGFz
	 fXsqWf+xGWzr3iPCQkpA/CarmqvUaObiNC60EzqlnajQTsAJBfWahvRCpWFLR22ecz496
	 HLUMwhBPeseNjqTChHsemXdcs0XbEA8Ax1Imy8uhkpRSfiOUpl2Oqx45PxOQflFx4a5DX
	 1b3W2kPM0Hkv3VPO1HRiPucMQTn2gyNlqF3Fbqu5/JtJ7PHjjgSyIWS00unMbfm1D3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7Cq+LIN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E06606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7Cq+LIN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BDE1F000C5;
	Mon, 19 Oct 2026 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792438425;
	bh=0b5sTn4n4BuVxeXYJbDI+qsIf68gNUxTLUnFYDBsCbI=;
	h=Date:From:To:Cc:Subject:References;
	b=k7Cq+LINI60sCEi7ViWD+rgjwrkdfvtaSmu8U0hZ21jk8sYjO8o/3A1+3BxZqeWVV
	 j1m/UkqI+9kZuujxddlrNzfcr4sqbDcSpLkmm17loZpv//lPV+zqAjZKqW1uGfmorT
	 fJWmmpnyFccmkbYUkUO1TtnE+HXaX/oaVURHNOWap+pJ/30htKOyGV9ISAfTurjtT4
	 68Blauk0bHspoNRwhkLIeBAlqVmWTAG84bOT4nTilCjXRwPUto9AYQ86RdejRHrM6Q
	 Kt48AZa4dVwMF9VH8C6jJhJ4U4w73NfPzJ4rKnrB1RG7xYsSWNjoKCyHLYaNAhvvP7
	 xMibQ/sJigeyg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIt7B-00000001eeZ-16Kb;
	Mon, 19 Oct 2026 15:33:45 -0400
Message-ID: <20261019193345.069750367@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:33:31 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-next][PATCH 1/5] ring-buffer: Add a MAINTAINERS category specific for the tracing
 ring-buffer
References: <20261019193330.365764549@kernel.org>
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

From: Steven Rostedt <rostedt@goodmis.org>

The ring buffer code in the tracing directory has always been decoupled
from the tracing code. It had a clean abstracted API to allow it to be
used by systems outside of tracing. The API even allowed the ring buffer
code to be drastically changed without affecting the tracing sub-system.

Recently, Vincent Donnefort has been contributing a lot of work to enhance
the ring buffer. He implemented the user space mappings and recently
created a version to allow pKVM hypervisors to use the code to trace
the hypervisor and expose the events to the user.

Create a separate category for maintaining the ring buffer code so that
Vincent can become an official maintainer of it. His work has little to do
with the tracing code itself. In the future, he may even be the main
maintainer of the ring buffer.

Link: https://patch.msgid.link/20260908094035.0b180833@gandalf.local.home
Acked-by: Vincent Donnefort <vdonnefort@google.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..c29e2a4f1f69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27794,6 +27794,22 @@ F:	kernel/trace/trace_irqsoff.c
 F:	kernel/trace/trace_osnoise.c
 F:	kernel/trace/trace_sched_wakeup.c
 
+TRACING RING BUFFER
+M:	Steven Rostedt <rostedt@goodmis.org>
+M:	Vincent Donnefort <vdonnefort@google.com>
+M:	Masami Hiramatsu <mhiramat@kernel.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-trace-kernel@vger.kernel.org
+S:	Maintained
+Q:	https://patchwork.kernel.org/project/linux-trace-kernel/list/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
+F:	Documentation/trace/ring-buffer*
+F:	Documentation/trace/remotes.rst
+F:	include/linux/ring-buffer*.h
+F:	kernel/trace/*ring_buffer*.c
+F:	kernel/trace/remote*.c
+F:	tools/testing/selftests/ring-buffer/
+
 TRADITIONAL CHINESE DOCUMENTATION
 M:	Chen-Yu Yeh <chenyou910331@gmail.com>
 M:	Weijie Yuan <wy@wyuan.org>
-- 
2.53.0
