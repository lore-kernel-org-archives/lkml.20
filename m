Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498812;
	b=s/ZpFUD40mktq+WXVv6dYMBrbRzR6Qxp3wk7PLII6Mhe5viu7lTaL3rKzpPDzwwZhnWw
	 U9oakQYsPOxBI8Z2A6Gl6jeSckXzr47xEFTL5sAcwa0zips+XibRc7C3tWI58jlu/AaWz
	 w4XY5Ml3Wd6fIVfJeNIbjWwvD+at5wj2du46Rx2Fz4byEwq9PJMiXSYvYZl72bXQrO1Vd
	 /cfvY/LijtQCUaGCYPv+XLM5cC9qM957e1nRLXJ8YlPlpFTDndV18sP/+kiF60gnMZ9LZ
	 meO1khdTnXxpwv7LhEXVWAyP97J2/xgcbxtQ5CKwkYP2bkIEjGf8dNE/wsuynayLcaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498812;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject;
	bh=gWzdiouYAW49/k2MuyRbVWEZ3SR0v2qa6UfQif8vtIE=;
	b=5KI3bJgBOUXUGZQ+v+pFUJfz3X7Q9cPaQoj9+E5bF/wmYOJQ8MFa4M6QYCYA3qj0Q3WQ
	 XT7DeUHxg9nX2hFbKYIa7tN3o5r50UDO2IpzpoS+4enkTUcwUL/COPw4/xCxfF1Y8T9zj
	 cJIdEfQSWRLR1Q37Mvgk9cvivd8z1LUhiyBvuTwuRklUjAfRZuwNN8EYCLHk91MJ5wiiJ
	 6VWtUqJsRriyGe4QMv+uhl6UI2a3pQQoPnOh+2DylcwzeunJgepIPZ3g95Wv3O/MV9IQm
	 +9Djst9empJaw9UgZjlMnZ8gO256L0/cJ38b6BWb7iVQl2V9O99+j9WhnVnfD2Dk6NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AllmjxfX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12C1606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AllmjxfX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538A01F000C8;
	Tue, 20 Oct 2026 12:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792498811;
	bh=gWzdiouYAW49/k2MuyRbVWEZ3SR0v2qa6UfQif8vtIE=;
	h=Date:From:To:Cc:Subject;
	b=AllmjxfX0kP5RUozMUgitkfTcqfYKGreM8BqNx8aJcW1JlkPt6HAHMuwKA4XqGF5n
	 M/Jw4lU6qAj+4mrH0cX9oOYePwdeQ4BDZD4DpK+TnS2fvY1BTfKW1fUQ+5TPa5fb8K
	 j7vtq6KvH3e8X2/iC+CBsSLiwr+Mx4rKuLooQKl2Aj86T4AibP4OBJOdzZfwO6Axyp
	 3EKyhEaFEYNJIdm2dfYnUy329Q7OH6zXJKf0DX+IvgyvkU445VD04dfjJd5Myw8muJ
	 8hgODPZnCcdu3fQHVjfwUsoUp+QqDVLQwWtddSLadzpNvNf/3lcFfpPs1vO+NV6bTr
	 B/tJdFY0T3b4Q==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xJ8p8-00000001y18-2Pi2;
	Tue, 20 Oct 2026 08:20:10 -0400
Message-ID: <20261020121956.600452831@kernel.org>
User-Agent: quilt/0.69
Date: Tue, 20 Oct 2026 08:19:56 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 0/6] tracing: Updates for 7.4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/for-next

Head SHA1: f86641ffea95ee6f62d829929a69be7ab1496ce5


Adrián García Casado (1):
      tracing/osnoise: Add __printf attribute to osnoise_print()

David Carlier (2):
      tracing: Hold trace_types_lock when updating modules in persistent instances
      tracing: Hold trace_types_lock when resetting last boot data from readers

Donggeun Yoo (1):
      tracing: Save the event file instead of the compatible histogram

Haoran Wang (1):
      tracing/syscalls: Use copy_from_user for the faultable syscall buffer

Lee Jones (1):
      tracing/histograms: Verify event_call identity when updating synth_event refcount

----
 kernel/trace/trace.c              | 21 ++++++++++++++++++---
 kernel/trace/trace_events_hist.c  | 19 +++++++------------
 kernel/trace/trace_events_synth.c | 10 ++++++++++
 kernel/trace/trace_osnoise.c      |  1 +
 kernel/trace/trace_synth.h        |  1 +
 kernel/trace/trace_syscalls.c     |  2 +-
 6 files changed, 38 insertions(+), 16 deletions(-)
