Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803036;
	b=Z30bWMswK/lBdGE9a1jUxLFyixAgiDdQ/Hh8g7V6VNr7GU0ZgPhvj809vE/Wc7eIVmF9
	 z+Z5ckvJI0jYjXA9RYjo6Dv/BCiFRWhgouMiVSq0avdZ+0C+9UuP0+ogc6L2uJ3Pn/JFP
	 cB1rjiBfvBPQK6cFCZexn7Nr3mfqEnTiV/xscTqrxkNFHWt1RTeeoyhW3UWBcpwyg+MbH
	 9tBwInN7ZONcF9EX56LpWd2B+Y8L7yLT+wc+aGvs31np7BBSZfIffqcs/tV0DhhMtuAOv
	 2cwtuzuLqX8bnovtpwgHuKo5D6HFZ73OlxM4XnvTa/ZlWfYohwiGiyjsDnb9Ru0hbVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803036;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=e3UcveHoQqPimeolAfYXMQqEHdltGGQYld23yroQv6s=;
	b=5jiPhU1iOcwGCKDIkEw4x/a1prpRs7StxzZOfts7Qat+e3/gGi/Sqi2tvehK0pht8M24
	 rE8jdPxS4hC54yWztoSecU/SrreFYSNHvOxrgckyI/UgDbKnrjEUtK5vo/GkytI+BbnXK
	 i9h6zZkVBBTOoVtK/4w2LCWybilfrfjjQQ2PTFsHiGz3HX3WarLce1dp4HhIxGqRKFChL
	 gAAra36g6BjD9cCupAZ23eJtBJK83ltm8kBbwfG63ZrtN9Q8wvXQOBV709vWtCvnEaYgp
	 BckppCRW+NO7ykiwioA+GEJ9kstnnlQrz6cNoCSAcQy+ceozAxsPGWZYo14RuIgsoNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0CgMX19;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B901606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0CgMX19
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B791F01829;
	Sat, 24 Oct 2026 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792803034;
	bh=e3UcveHoQqPimeolAfYXMQqEHdltGGQYld23yroQv6s=;
	h=Date:From:To:Cc:Subject:References;
	b=g0CgMX19mzC9KC3g7M+e7wG8SMddC8iyeUr6nU5PJL5PWGcWCmgMp38LRFp7DTv2h
	 2dEeBukl33AvNiCFRnMM861u4myAJZVnqFv43PQfWEZXBhO00NOX7gbZRby33Gajsu
	 7lkxXsvuEZZTgHLGZTGPZoy9xGT4FhGJnn+rhPYWwSbwxCPGHu3FYBtmY3J1Ji01iZ
	 xTSpklrfPTT95Dp9Yc7cjTR7DTJ0LETgYZo7lWgh7ZL0Nql/JPjlkvPhO++haxjiLp
	 ZVeEmpR+H/WL/jKaWI1WXkqLTI5sPenJvTu6uaP+Q1hzlobDAvsJup0eih1Q4mO6vn
	 lwK66CvSRH0WQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xKPxy-00000004gMa-12Ir;
	Fri, 23 Oct 2026 20:50:34 -0400
Message-ID: <20261024005034.059024288@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 23 Oct 2026 20:50:14 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Haoran Wang <haoranwangsec@gmail.com>
Subject: [for-next][PATCH 2/3] tracing: Guard trace_event_get_offsets() against an empty fields list
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

From: Haoran Wang <haoranwangsec@gmail.com>

trace_event_get_offsets() dereferences the first entry of the fields list
returned by trace_get_fields() via list_first_entry().  list_first_entry()
then returns the list head itself, and tail->offset + tail->size reads past
it.  The corrupted result is used as the BPF context-size bound in
__perf_event_set_bpf_prog():

    int off = trace_event_get_offsets(event->tp_event);
    if (prog->aux->max_ctx_offset > off)
            return -EACCES;

so a context-reading BPF program that ought to be rejected can instead be
attached to a zero-field tracepoint (which still carries
TRACE_EVENT_FL_TRACEPOINT) and read adjacent kernel memory when the
tracepoint fires, bypassing the verifier's context-size confinement.

This is reachable through user_events: a user can register an event with no
fields (e.g. `echo u:my_event > dynamic_events`), which leaves user->fields
empty while the event remains a BPF-attachable tracepoint,
trace_get_fields() then routes through user_event_get_fields() to that
empty list. The corrupted
result after list_first_entry is then used as the BPF context-size bound in
__perf_event_set_bpf_prog(), which lets context-reading BPF programs attach
to a zero-field tracepoint when they should be rejected with -EACCES.

Add list empty check to fix this bug.

Link: https://patch.msgid.link/6ad1f2ca.6048f038.32d739.a530@mx.google.com
Signed-off-by: Haoran Wang <haoranwangsec@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index a1ac2a02f4e2..6afed2091e19 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -246,6 +246,10 @@ int trace_event_get_offsets(struct trace_event_call *call)
 	struct list_head *head;
 
 	head = trace_get_fields(call);
+
+	if (list_empty(head))
+		return sizeof(struct trace_entry);
+
 	/*
 	 * head->next points to the last field with the largest offset,
 	 * since it was added last by trace_define_field()
-- 
2.53.0
