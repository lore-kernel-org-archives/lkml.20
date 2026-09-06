Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D53282F1C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659155; cv=none; b=kn/UqHD2e5DnqgJyffeQHoiThIUzlP9wrhU/jKyXP+iNbwxs1o6P8LkrszY/mSo3CtyN4XWSQae8VqVlmLXJklXUuJ+YmJm+mWCuVflI+j6akxikpfy7CrUbipa+S9s0Lxx5JKwWlGp1wud3Cf+2+AG9LDnCPMpY+JS6dFybPNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659155; c=relaxed/simple;
	bh=F6KQeZdbVNU6nqzdbwbqOcfr7MGeBxYJ/WbkW5sRG8c=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=HKo6n2kr8s8iLi4mLvAsLhU7lWZvW6dRVyOA7lfaxoscT8wMtXissrOzNS36rJ7JAzgy6Tm34VszKLOyxIl4RsSciuD+F7X6nLIuMTiHJiEzJ3Ahp0fvdMKlSuSAgmvUy7LkSXq/wWEkcbSpnT27Qf24LmiOkN1MbVkDvnNw2QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CoHi1z+Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CoHi1z+Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC491F00ACA;
	Sun,  6 Sep 2026 01:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788659147;
	bh=zLOsuJy/tiOhVClCFWf0RybPYTPcY6Fl4v6aNVup9Uo=;
	h=Date:From:To:Cc:Subject:References;
	b=CoHi1z+Qxovjzof5XhSvjpGQs67mtSXap+BHU+7BI1yuF0SWmuR/YqWUxTEDaCBZL
	 GO4dBQ5dHXUm7TEM+aEcX3qQgcCaXViyW0lPXcM6zWM2yoXDsPvmgUQ0esO6UTXxY0
	 w+C6YxuuT0RcdKiIcqdstRUxJUSCCnZpKAKFiV9tUK70b1rVOaPQw55Ulg/KfHf2AE
	 n20G90RRGq9ST7HwJ4TUJTWXbMOMXcyYsZUYTklfa15Son2gw2uNCbZstiu3nJenzQ
	 wMzwOvp3Yjbe+hReG4UIJBgv/qTg6aR7aoBjaM0W1LRH8Eoh/tb2qJNJSDA+1p7Ml4
	 LTYzDf0ex3fZg==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x31yC-00000006PQ8-0mtw;
	Sat, 05 Sep 2026 21:46:56 -0400
Message-ID: <20260906014656.049956688@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 05 Sep 2026 21:45:37 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>,
 sashiko-bot@kernel.org
Subject: [for-linus][PATCH 06/12] ring-buffer: Add checking nr_subbufs to persistent ring buffer
 validation
References: <20260906014531.720267751@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

Sashiko reported that the code was using meta->nr_subbufs without making
sure that it matched the nr_pages + 1 on data that was assuming the two
were the same.

Add a check to the persistent ring buffer validation code to make sure
that the saved nr_subbufs matches what we expect.

Link: https://patch.msgid.link/20260903132728.7fb27d34@gandalf.local.home
Fixes: f5b95f1fa2ef3 ("ring-buffer: Validate the persistent meta data subbuf array")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260901164836.D962D1F000E9@smtp.kernel.org/
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 84fd4cdd486f..ff0a44aa578d 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -1856,6 +1856,11 @@ static bool rb_cpu_meta_valid(struct ring_buffer_cpu_meta *meta, int cpu,
 		return false;
 	}
 
+	if (meta->nr_subbufs != nr_pages + 1) {
+		pr_info("Ring buffer boot meta [%d] invalid nr_subbufs\n", cpu);
+		return false;
+	}
+
 	buffers_start = meta->first_buffer;
 	buffers_end = meta->first_buffer + (subbuf_size * meta->nr_subbufs);
 
-- 
2.53.0


