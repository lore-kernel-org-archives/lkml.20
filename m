Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232514AE127
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150579; cv=none; b=J1dwtZQO0zppy8UJLcCi02UQwlFWWAJ9OAFqSfGt0qUAwh8FlTRn8JXZcRgViN4rV2CDKTMvhVkCJLib5hq6e8ZjSbv8f0EZ6lgp2L5k6Izh1CdFSOPEyrBeEoPY8b4IOb99DM5+YT4swx/9SRU0Iyy5CzRqi+o5WMXhs13YFs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150579; c=relaxed/simple;
	bh=Zk3FXHniipjw/+WRbl891JFRUeMJ23lamGmrr6/Uwm0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=lcsr/IC5XoU/0J7skZw8UGwVVvaesJ6ustDBucP9JJ5HPaGJH0zjGUFzQ7vlqZJF8qWm/9qls7u8lKRbxlf2r2j3OodHkZhpLj2DbHvfQcX8I4lCEpqkHgGvu/AocuC1bg93qunYiLDO8sFupgTlWXAWiCpMhAw7tIzTm5N6lXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWyeMS5A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWyeMS5A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EB11F008A3;
	Fri, 11 Sep 2026 18:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789150568;
	bh=uexNQDNo7d7HNsbNZ2HKiPNKKIJxaV1+tpsEgCeUt0o=;
	h=Date:From:To:Cc:Subject:References;
	b=SWyeMS5AHZk/s8AEWmODv5LosyihSVkZn7XBk5HrayxVZU9nKbh7FAry4+H/arySU
	 RJxDgClJgbtdCKIPwF77k2OlNKFsfid/xZ9rGyLqwPqiIS76TkbXEMKa8LaNFqxJi6
	 mrfm3i+5ASIMSuM9l09AttNgrqRnsHpDX9FkJEmF3s2M4v+rxkQeehHqbts6Ct589e
	 Qr+Fs9hHFUxsMAU6qGbRAjb7vqHDyfzlCDvov9OgT4tXqvpRd+5V89BvNqFxhdLh3b
	 KSWGCA0MV1FYrHYvFMaajy2ic3wM8kS5BREsmPctBW38qGZn/QQ9cTdqsdOYvkT6ac
	 /dhTxvIzv9wBg==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x55oY-00000009503-1ksN;
	Fri, 11 Sep 2026 14:17:30 -0400
Message-ID: <20260911181730.228443484@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 11 Sep 2026 14:16:46 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Hemanth Selam <hemanth.selam@gmail.com>
Subject: [for-linus][PATCH 10/20] tracing: Fix typo "availabe" in comment
References: <20260911181636.485043797@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Hemanth Selam <hemanth.selam@gmail.com>

Correct "availabe" to "available", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Link: https://patch.msgid.link/20260907062608.13924-1-hemanth.selam@gmail.com
Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/rethook.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/rethook.c b/kernel/trace/rethook.c
index 5a8bdf88999a..87a27f3aa4a6 100644
--- a/kernel/trace/rethook.c
+++ b/kernel/trace/rethook.c
@@ -171,7 +171,7 @@ struct rethook_node *rethook_try_get(struct rethook *rh)
 	 * This expects the caller will set up a rethook on a function entry.
 	 * When the function returns, the rethook will eventually be reclaimed
 	 * or released in the rethook_recycle() with call_rcu().
-	 * This means the caller must be run in the RCU-availabe context.
+	 * This means the caller must be run in the RCU-available context.
 	 */
 	if (unlikely(!rcu_is_watching()))
 		return NULL;
-- 
2.53.0
