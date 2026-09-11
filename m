Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236164AE131
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150579; cv=none; b=QqAeXX30OMtMZ72WGRvGYvlW0nolLoXTOvO2N6Vr7kdRnrPBYa8l8g0mZqYxDuj1xv3W35eeL/akfLpWxHk5XAk9sj2acPZeoyY50DS9EIXAKBaf7AmdJv6wAlLdWkTeu2rteSaHWkxgE+WTVeiD4SSnob4uyZrAYhXO/i2G+dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150579; c=relaxed/simple;
	bh=NrZ5b8u0NqcUgB9oWXPsc1NC/hDu7tqOIfdEUu/Ai38=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=FgRXoMxwKgeu/VXsyt/VWQsAjnDqBu5N80v4+UqPCrEiJj38VjceJdmWCJebApTLVhsVXkNmcKTNMd5c7f5XHdrChBT+kFVJyCNKGNXxDK0/68cVM9RRFQ9BFaxspgN0MvTpvgM7awqfboYdlWS4w38n6xIGFe8MgXGsBixSeAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxAGRHdr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxAGRHdr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430BD1F008A0;
	Fri, 11 Sep 2026 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789150569;
	bh=kQr4SbF1FOn5RnIQA+hQDigs2DAnSLpJ7VoUlffjF+U=;
	h=Date:From:To:Cc:Subject:References;
	b=kxAGRHdrjuQVwyZ+aRQd2bctP3i5IG5hdtcsrYK3iJ0X37LH0Q+Z+0wD9oJBtmM5e
	 CQqo5Jqs0DqmeBO4tglCU5iCZrVK5Zyx1IUCQEP1ulUIA8MOac6j0xrb1pRzxP8zWh
	 5i7EY1sHK5SeFEIuMxEm7f0itKK9l0iOLNTYWs9XXoXPBnurCky8kGgo7xCZ3xmiYq
	 RrDMbs4VjR3NvMIe5dWWl915ohXCxgyTXjDLv4SP3HHyd7OMbrt9HOpyM7K9kaXSbh
	 BOVQgAwSQQhs3C5+H9FTqICTXk2yNfQUKTNZ2AzqndRe27pV45pRAJ3JFyj2yL0eqV
	 OOOftenieFNIQ==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x55oY-0000000950c-2dDN;
	Fri, 11 Sep 2026 14:17:30 -0400
Message-ID: <20260911181730.441310379@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 11 Sep 2026 14:16:47 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Hemanth Selam <hemanth.selam@gmail.com>
Subject: [for-linus][PATCH 11/20] tracing: Fix typo "preceeded" in comment
References: <20260911181636.485043797@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Hemanth Selam <hemanth.selam@gmail.com>

Correct "preceeded" to "Preceded", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Link: https://patch.msgid.link/20260907065607.36615-1-hemanth.selam@gmail.com
Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/trace/events/timer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/timer.h b/include/trace/events/timer.h
index ca82fd62dc30..3aa0608c6361 100644
--- a/include/trace/events/timer.h
+++ b/include/trace/events/timer.h
@@ -302,7 +302,7 @@ DECLARE_EVENT_CLASS(hrtimer_class,
  * hrtimer_start_expired - Invoked when a expired timer was started
  * @hrtimer:	pointer to struct hrtimer
  *
- * Preceeded by a hrtimer_start tracepoint.
+ * Preceded by a hrtimer_start tracepoint.
  */
 DEFINE_EVENT(hrtimer_class, hrtimer_start_expired,
 
-- 
2.53.0
