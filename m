Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700288;
	b=rBCKfKTlhgX8KCUIkQtXjoOxD4ShdSQ6defdRRqLakeiou3cF8UEp3vO1jKlXlzWLe+v
	 Psb7OlKzk/K26GaQdnKmSqckam5ZA916y7Urs/U4CDQ/gUdSEsZy4qkbyC163U3QZk8Tu
	 gmaorFZfjfFaCp4HXU/2q5fYIMPT1QrDovCAlfja6flC32TqkK7SUalsTO0TOfgOxwJhB
	 8Xwa3GuHLLl+RX8BLtcsydWuqQzRuW+vnedwYkDKIhFdzllLm6Dgy4lB6NJNYRcx7oJOB
	 qsfpB3Qu9/sg0ybiSHnl9R+vcICp1njYgiVq/QNZVN/WkqRGrpvc+rXZvyTxUUGFDnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700288;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Stat-Signature:X-Rspamd-Server:X-Rspamd-Queue-Id:X-Spam-Status:
	 X-Session-Marker:X-Session-ID:DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=JmVfj8qCNfkVJqvMp4Xd+mBMt7zsHzkK9G0+QXfsun4=;
	b=b/KrET8NLsh2+IUJ4kpKaYQa2tbKeFX2+2zMkPkHw72Lfk4pkRO7sX1YXgUt6chSqns+
	 kNmdDLjnpQrQCsbD26tYoGAsTcQ2JrECl2X+qmsxA+Y7jbKIA52aKr1U9b5kN3eX1AtM2
	 1NE9uz9xPbHapkz7H3+RMELUwO44oGUMGORJlK6hrzC0ZnO6UNtNxfcCWq/apmr+mRr8j
	 /bhWE1bgoBgVVNUPCe5wjIVVRxpxw/4LAV/SMo4J4zbQv3bEBuD1ptsX7ztuuGa0w1GXF
	 IpVj7hJOqjKOZeeNm7C88DO2UAf1OUt/zuG9HXzVorQmTzeFsccK/KV0kIHFx3VfelA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	arc=none smtp.remote-ip=216.40.44.11
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2220606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2220606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id AF7891202C6;
	Thu, 22 Oct 2026 20:18:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id ACCE51B;
	Thu, 22 Oct 2026 20:18:03 +0000 (UTC)
Date: Thu, 22 Oct 2026 16:18:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Donnefort
 <vdonnefort@google.com>, David Carlier <devnexen@gmail.com>
Subject: [GIT PULL] ring-buffer: Updates for v7.4
Message-ID: <20261022161802.6d512bac@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: wh9wepsogemuxeamqf1rfq8sgce19dno
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: ACCE51B
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/tR23VH/W8YpqMJ50W0c1ABEeNEwvI8yI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=JmVfj8qCNfkVJqvMp4Xd+mBMt7zsHzkK9G0+QXfsun4=; b=XHaGkt0/8GVSmg/MtzgpKN7bQzPIWtYfpCi/lLgw0tyPjNv+W/WoVl3xMyN1cGQRrrLrwgJT6xzv/OF6OzaB5QENb+mKb22j9J9U+VkAQlC6nRW65mTuPh30Rv1o/B6DpF0dkdURhCm7ZUhOjg4lkIJQP6PLeV+D9CRjSKRSBDU=
X-HE-Tag: 1792700283-452362
X-HE-Meta: U2FsdGVkX18IxcdmWxbcA5LYUA4OiLhTNxcuUBimeqGNud4CiOEIGl63dWJrDfh6jdfWOC4qU0xhzEpRpE/iyIAAZ7PHPbQqrbxDtMAsL0Rie18WHFiNgruV4yaKhOmk2G91lDQZ1LFTre5faklEOPYry3Sg7jQ3aLsA5lSfHY5aW8lKEwtfdO7FkYHiNS6oq27XZMSY4Q6xOr33MNiZNZJkuoIEteh7qphI0MxN0NABPCkolH+GERMHjvV+xALJZwhImFvKjpMXGRGGbcsNtXgexEzTIDCxGSTeKQ0spMzgSTv5FpMh7pw83VEhz6NUQw46+wJGeEFDBmLm/lG9MNwijgx216zs


Linus,

ring-buffer updates for v7.4:

- Add Vincent Donnefort as ring-buffer maintainer

  Vincent has been doing a lot of updates to the ftrace ring buffer lately.
  I'm going to start delegating updates for the ring buffer to him.

- Use RING_BUFFER_MIN_NR_PAGES instead of open coding the number 2

  Instead of using the number 2 as the minimum number of pages that a ring
  buffer may have, create and use a macro RING_BUFFER_MIN_NR_PAGES.

- Clean up the resize_disabled_checks

  There's duplication of code to check for resize disabled. Create a helper
  function rb_resize_disabled() and use that. Not only does it put the code
  in one place, it also removed a redundant check.

- Remove unnecessary cpumask_test_cpu checks

  The loop for_each_buffer_cpu(buffer, cpu) only loops over CPUs in the
  buffer->cpumask. There's no reason to test if the CPU is set in that same
  loop.

- Take cpus_read_lock() when changing the subbuf order

  A CPU coming on line for the first time allocates its CPU buffer. But
  if this happens while the subbuffer is being resized, it can cause an
  inconsistent state of subbufer sizes in the buffer. Add a cpus_read_lock()
  to ring_buffer_subbuf_order_set() to prevent this race.


Please pull the latest trace-ringbuffer-v7.4 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-ringbuffer-v7.4

Tag SHA1: 7e59f123fcd352799b04cc706463f8db0fbfd86e
Head SHA1: 453d0f47b174cac387af48d303c503b84f82212e


David Carlier (1):
      ring-buffer: Take cpus_read_lock() when changing the subbuf order

Steven Rostedt (1):
      ring-buffer: Add a MAINTAINERS category specific for the tracing ring-buffer

Vincent Donnefort (3):
      ring-buffer: Unify ring buffer minimum page calculations
      ring-buffer: Clean up resize_disabled checks
      ring-buffer: Remove unnecessary cpumask_test_cpu

----
 MAINTAINERS                       |  16 ++++++
 include/linux/ring_buffer.h       |   9 +++-
 kernel/trace/ring_buffer.c        | 102 ++++++++++++++++----------------------
 kernel/trace/simple_ring_buffer.c |   4 +-
 4 files changed, 68 insertions(+), 63 deletions(-)
---------------------------
