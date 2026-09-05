Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD7B337BA4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659054; cv=none; b=fXGWpIvLKbA6hEXTFlhH2WUxYp3cr4NoOyajg2UNt9Z2RfuylUrpq3C2TW2721cWaWmPvf627STrZ6fvPakwsP9vVCAKUPD5KM4t6L+TCTvqHzi4+fXFxMe3Yg/26/Xb7d4f+XB3+qUqcC2DuIDpK5GOvJQQaHvwKmCj8eadtb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659054; c=relaxed/simple;
	bh=seoBvo7fTTRH4weJ9hmbvv6nuBcjndCagbe16XTPuhw=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=CToplHlCUIps3n0IMcbVjjw+XRbObiyKCYgG43QG7VscVOw5vzzr54Q3ih1y8zJ21jC+YEWqzqXlEHLbfsBIQ7aoKmREPvcxxMDgOFSD3+oY4P7vZAZdU/VY2j2i5JRiblhV8OWjzDY/InzIfX3kdR1bEWRLxmUlPjGWCVUmgoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHctnYk2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHctnYk2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665761F00A3D;
	Sun,  6 Sep 2026 01:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788659053;
	bh=1XbNGsPvuLsPJbCOotGpbVqbsKtkw9+ECgLpRwY2MC8=;
	h=Date:From:To:Cc:Subject:References;
	b=dHctnYk2CtyZluxbjHOro6TgftNg4OzmCSO+xra7KSW/4COSngeTjN5gHx1dzy/jm
	 Qjm5I5zLT21FiYpJ53v0pfrtDgz2imLWPEDFwxyTgB1RqcmQYejepqAZx4Z8eSUwoJ
	 Rr0JGcWJgVubxy/oFFe3EtYifgKL6Y1Nor1niPOUTEOUbJB9k2nfv5IEr3JxvtA68m
	 8DbKANWxTImW6kALeN6QJQEKW0FiP36Z54kC1L9Bs5m8dnBGbS2NpAjUb7q8wWasjC
	 if04Sk8AJiBzuRnjV+GaBB88sjkL4WAr+XM5J1otkX41qOmyu7ibRUyBtnzgmBCm7m
	 Yoym+hVzJ4wRw==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x2whQ-00000006JEB-3CJi;
	Sat, 05 Sep 2026 16:09:16 -0400
Message-ID: <20260905200916.632947591@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 05 Sep 2026 16:08:39 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 12/12] ring-buffer: Use a macro for static buffer bits
References: <20260905200827.773347757@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

Instead of hard coding 30 for the number of bits used for the static
buffer ids in two places, create a macro. This way if it changes in the
future, it will change in all the locations that use it.

Link: https://patch.msgid.link/20260904151641.17eae0aa@gandalf.local.home
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 220b8405adfc..b88c75b52e8f 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -335,6 +335,9 @@ static __always_inline unsigned int rb_read_page_capacity(struct buffer_data_rea
 	return (PAGE_SIZE << rpage->order) - BUF_PAGE_HDR_SIZE;
 }
 
+/* The number of bits for static buffer ids */
+#define RB_STATIC_BITS	30
+
 /*
  * Note, the buffer_page list must be first. The buffer pages
  * are allocated in cache lines, which means that each buffer
@@ -350,7 +353,7 @@ struct buffer_page {
 	local_t		 entries;	/* entries on this page */
 	unsigned long	 real_end;	/* real end of data */
 	unsigned	 order;		/* order of the page */
-	u32		 id:30;		/* ID for external mapping */
+	u32		 id:RB_STATIC_BITS; /* ID for external mapping */
 	u32		 range:1;	/* Mapped via a range */
 	struct buffer_data_page *page;	/* Actual data page */
 };
@@ -663,7 +666,7 @@ static unsigned long rb_static_max_pages(void)
 	 * Static ring buffers are using bpage::id and must account for the
 	 * reader page.
 	 */
-	return (1UL << 30) - 1;
+	return (1UL << RB_STATIC_BITS) - 1;
 }
 
 struct ring_buffer_iter {
-- 
2.53.0


