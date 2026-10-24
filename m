Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803035;
	b=ERM0NS/cquLMnO5UVC7yUQyGThpx6+SxTQ5RuL1TjV/y0PmNsOw1uvcOcjM2Pzd2KzpL
	 DcRp7CIo3LIV5Si0CrUCeHdjEYOnYavEmvXxSTTgqE/uAdYgLdEuYlnrUhXYM7SjRWcpu
	 mmvypS89aPxt7LjZ2XJpMDN3C+JnPN1N65xP5g3IX/QvjZeyquyZ1ta40NlABOmhLjDJs
	 FT+wI9c4VnKcTAuLol9654WcpEOvQ5TYCgK8sEN9fdsjR/NOZEjEEOBO3R5LCsfpZsL+U
	 6vUY2URenBC37mzSQcyYq42ZkCkX09q46pzjVvfMAuWU3QmsV2DYQGPwY1V9035hspA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803035;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=jzhGMBbVXOXYrd5W3JnC1i8eKyGwYmflGjIr8tyzGaI=;
	b=wSIGt+ojairAT4HZo77tX4ulBq0tiH62yLoD+nvwoSkVxGQLdsm/VNOBX5XEKzDOG6xB
	 9AJjTJi1y1cV6Xo4zmmjpPMDGQKjMHUYilQySfdRWl6LW6j6w6yIe9Nh0zaIpF99dw0zy
	 TyX/+6eC2WnH8p9AAanLydnLccwxGywEVdQmujuU++HZl7OKjhs5uU/AcvQv78VvMqiR1
	 gMuRVSZAs+uZ0HRt7DDwlB/tF0Ky1JNgykmDn5RyhyLuYluQd78Gw0TCP80YLymApcD5q
	 Hp37UXOfdaqHPO+DQL0XBOSL60VejZlBop+5iovhb9CWX8bJE1OSBqQiMSjiUHhiW8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rms3rdiP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7FE606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rms3rdiP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84E71F01825;
	Sat, 24 Oct 2026 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792803034;
	bh=jzhGMBbVXOXYrd5W3JnC1i8eKyGwYmflGjIr8tyzGaI=;
	h=Date:From:To:Cc:Subject:References;
	b=Rms3rdiPn8qdMdDB78N0NEhnnK1yJ4mD/jiDVU9CIRafvq156y1vgPFYq31CaztIs
	 RJuRQqxM/sM8bH9FeCicERAwgdVN2W9pakHV6QxoAVGuTXamWJrNvCejPhp6+4o6yg
	 E6ZvizZUog2pRNR/FT6xy8ch98OwWAAdlwOkm4UTiaq2zQPHe+7yV16JrPrszL3M2k
	 cvbFark0Kn966+Z/cE1onfE4st8WgR6NpMVmx5vCNPmE2velOLwU8MISChOSj/6evf
	 ewHEVclK+QfvbH6DQDg/py0kD4I1ExDSyOcVGsozRKwr/rJP8ot5KfDXm4G1/HDh4C
	 0M9f+FvZuEd9g==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xKPxy-00000004gM2-0AEn;
	Fri, 23 Oct 2026 20:50:34 -0400
Message-ID: <20261024005033.846783616@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 23 Oct 2026 20:50:13 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [for-next][PATCH 1/3] cpuidle: haltpoll: Only define guest_halt_poll_ns tracepoint when
 used
References: <20261024005012.676772644@kernel.org>
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

Tracepoints that are defined take up around 5K each, even if they are not
used. When a tracepoint is used only in code when a specific config is
enabled, their definition must also be only defined when the same config
is enabled otherwise it wastes memory.

The tracepoint guest_halt_poll_ns is only used when CONFIG_CPU_IDLE_GOV_HALTPOLL
is enabled. Guard the definition of that tracepoint with the same config.

Link: https://patch.msgid.link/20261022153359.2433474b@gandalf.local.home
Fixes: 0da11bf0cab90 ("cpuidle: haltpoll: Add trace points for guest_halt_poll_ns grow/shrink")
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/trace/events/power.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index 370f8df2fdb4..4d17eb307b6a 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -497,6 +497,7 @@ DEFINE_EVENT(dev_pm_qos_request, dev_pm_qos_remove_request,
 	TP_ARGS(name, type, new_value)
 );
 
+#ifdef CONFIG_CPU_IDLE_GOV_HALTPOLL
 TRACE_EVENT(guest_halt_poll_ns,
 
 	TP_PROTO(bool grow, unsigned int new, unsigned int old),
@@ -525,6 +526,8 @@ TRACE_EVENT(guest_halt_poll_ns,
 	trace_guest_halt_poll_ns(true, new, old)
 #define trace_guest_halt_poll_ns_shrink(new, old) \
 	trace_guest_halt_poll_ns(false, new, old)
+#endif /* CONFIG_CPU_IDLE_GOV_HALTPOLL */
+
 #endif /* _TRACE_POWER_H */
 
 /* This part must be outside protection */
-- 
2.53.0
