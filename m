Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437842;
	b=png7od8kNPu7kQUneGyEeNMChwLaa88u/1mUxdxDtPK/NF5zrOV5dAiRIaUI5giNN1NS
	 SjKH6sQJG4Ed43PKgPzKtdMr/UQd4ZyPgGBkfzRlaRqtryC/9rcpZvRZMjVN7m+eh6EvH
	 exIizMId/srV179+EpTR/Aeeu1w59yVkyAOCwYCAcYkCdhpv/7pK2UYD1O/A1K0MPEm5Q
	 EA5pVyVtxI9IXH+yoKNF9hBCaBhR0S+C6bj1dxW75cOlSlMC2UWJ0v1I1VHOHnlM6a8QM
	 s8MDBgYAuxLV0najU/6szqcchUGH+YEaT331aENIHGuPNeMsERr3y1yZ5DQJtPZsp2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437842;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=D5EMBg0yFAsjzF5u6524tsQy+DPfdwUCB1wOpFzqON4=;
	b=PW3XYJ2CxBrdCLzqFJEuNN4WH4zf493dGM4N0Q2m/SWjm2xLlLflFYo2+2xQWYX3KXoG
	 ndCwuQe7rezsuDfE5nfbPsd6bKaXOY8hSTY1/8gv16K6+GmRtm7Wt4llNsAJXEM3Xlu1I
	 zSyJJi67h16+mWoMULkQq2r/n7HzA9u1V07FF3jVXmZ30EOe/17CqmEsd++qsA54AN2Ux
	 8GGKU0LJ9FNAexUb6EzHYpr3OcrqiHBo15zqwFVPoXGNlinMfWaf5yGW8JnW2VpFj2rgH
	 rjpp9qaOvduwEi4Zumnfv31aZ6BnXNmzLkGBiCEdIXb/KVaYZPLP/iv9NXreaQrhqTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tk4pkUxQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506AA606A334
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tk4pkUxQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3266D1F000CA;
	Mon, 19 Oct 2026 19:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792437841;
	bh=D5EMBg0yFAsjzF5u6524tsQy+DPfdwUCB1wOpFzqON4=;
	h=Date:From:To:Cc:Subject:References;
	b=Tk4pkUxQ6JX8eETd6igIiyyzdnT9rdrftr9Tx7gZw2gKgW7+TPp7OwzZYofg+Jrab
	 jud5wKGELpdxBEwo65bTXnY6Htjt/AozRvRGzOO052TcfSAPEzIoHVg/aK/QYCkVx6
	 eyrOFmGdCJ00KrmnO8Q/CExEy19taVls7Ssni5k/nBmfuafN4YXfikQNzXYBdmivZd
	 ALzVFH105scdgfh02WLV8dfxtQTi9DF3dCpAASw4Z665q0R576q7q+reKvq5u7w9h+
	 yLuyA/0l1YS0D2yYC0/4Gii1cVI404vXIkZDRfT8yyCwbtuHmVXqjJ5GSTbi7gMVyn
	 6JdKdsFu0L9IA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIsxk-00000001eIg-2LHP;
	Mon, 19 Oct 2026 15:24:00 -0400
Message-ID: <20261019192400.380770681@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:23:51 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 sashiko-bot@kernel.org,
 "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Subject: [for-next][PATCH 7/9] ftrace: Do not leak a modules empty page group
References: <20261019192344.004592683@kernel.org>
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

From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>

When every mcount_loc entry of a module is skipped,
ftrace_process_locs() leaves the module's first page group linked
with no records. ftrace_release_mod() matches a module's groups by
records[0].ip, which is 0 here, so the group is never freed. While
it stays linked, ftrace_free_mem() reads pg->records[pg->index - 1]
with pg->index == 0 on every later module load, as lookup_rec() did
before commit ee92fa443358f ("ftrace: Fix invalid address access in
lookup_rec() when index is 0").

Unlink and free the new page groups when none of them got a record.

Link: https://patch.msgid.link/20260924-b4-arm64-callops-kcfi-v2-1-587865b6d991@linux.dev
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260904013350.5141B1F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 98535f5533db..c8f8dd1cb92f 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -7720,6 +7720,20 @@ static int ftrace_process_locs(struct module *mod,
 		rec->ip = addr;
 	}
 
+	/*
+	 * ftrace_release_mod() finds a module's page groups by their first
+	 * record. If every entry was skipped there is none, so unlink the
+	 * new page groups and free them now.
+	 */
+	if (mod && !start_pg->index) {
+		ftrace_pages->next = NULL;
+		mutex_unlock(&ftrace_lock);
+		/* Need to synchronize with ftrace_location_range() */
+		synchronize_rcu();
+		ftrace_free_pages(start_pg);
+		return 0;
+	}
+
 	if (pg->next) {
 		pg_unuse = pg->next;
 		pg->next = NULL;
-- 
2.53.0
