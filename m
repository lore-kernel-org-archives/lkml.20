Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649955;
	b=0iJOPDt5RTEbV8uum3cOV+LZu3NOZ6iXq8emqFs5bJeenNFx8n3teyeHTeQrBa+eUhAi
	 UtmCb2mg4j6OXXhHezSAJQnUu8kqFrimZ7mO2L8JnInmxxAWXvXMigwIEyWjh/lMHG8zD
	 QRDbNdsJSQwDsjv2l6RCBkge+5+erXx1fmKIye+/tckmLBebk7xwIiI9nh5lLSg5LMZxs
	 BG0m+v0gXKdkmc8OC5S9D2e3szweuaCdBSfgGXl+mxABVftDnIuB3iTpLR/VWxXvrCSsb
	 +bx5/IlrAfIKIZqa1bSY3MYFRwFErSm48RtVAHaHSq2LyRLY76E2bfPXk9/yNkXmNLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pqG5OpqGN80I+5svV7SvZDSCtbTwE/e4kVD6z9s+SSQ=;
	b=j4m7USGUe8YGCxDVuW7EzXPWeDWhToz/Jt8oZ4CTcYOkp0WtA96KbQ6MRfBwvWS7dnFv
	 xz+1nz58jCsg6JkM1qEey1mA6vtUqdmIPx2ey5oWSVOb+KPcDwSv+UX1wekqDYkXSo45Z
	 aPcO2hg4IPOtSBQ4qfnAYB8HZOcl4q2Jd+7P6Ul9DXoAMbs1D9KhGEC7WTt42W6jU/Js5
	 TmvwVDTleefVx9D76OaHDNrfXHetIm9BDI+ChkKcA3/VCDy2MY21xfjWvnz4Gb4Qi07j0
	 4hpF1OzFokyeqrH7UYfuXx5yb2z4SJVWQnkZ3vXKjWi9gXBxQ6VBx4Q7PZrHXm3ucSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=runbox.com;
	dkim=pass header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b="kq01Gi/D";
	arc=none smtp.remote-ip=185.226.149.38
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC91606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC91606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b=kq01Gi/D
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHp-00Cc8N-6J; Mon, 02 Nov 2026 21:05:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=pqG5OpqGN80I+5svV7SvZDSCtbTwE/e4kVD6z9s+SSQ=; b=kq01Gi/DraUrkscIXAoZKVQWnm
	6ZStFUzqZyvfAK1UR6WnhvGzTpVDmDJNqj8k89JS9rPIBKfDHL5V2qyGNTVpm+qSnQYCiug7p/whR
	iJ/VOI6AozG3nkeOOboGpxlNl62LtIA6Rccep+EhQgXXekVYmfhDHg3UFXLk5e46vE2rCLjFXiuBJ
	ZiSj37JwgQwJn72apZHvnhf90Dzxa2dp6WvMRYla6AEYY92vZzypTlkC39LLkB48wvmodioRvkXnJ
	3Ck6naDxWrtS9DeDAZZPc1WAF42yAWrrrkPlQ1G68yqjjF0IYeqPyNrZKcAXMgPmPofIJDUEt7Ltw
	QSs2ddwg==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHo-0002nB-MI; Mon, 02 Nov 2026 21:05:44 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xNyHc-00AUIb-H2;
	Mon, 02 Nov 2026 21:05:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Kir Chou <note351@hotmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH next 2/7] random32: Remove some unnecessary #includes
Date: Mon,  2 Nov 2026 20:05:17 +0000
Message-Id: <20261102200522.3337-3-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261102200522.3337-1-david.laight.linux@gmail.com>
References: <20261102200522.3337-1-david.laight.linux@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These haven't been needed since the self tests were separated out.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 lib/random32.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/lib/random32.c b/lib/random32.c
index 34f08f6540e6..53cb289a5db4 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -35,11 +35,7 @@
 #include <linux/types.h>
 #include <linux/percpu.h>
 #include <linux/export.h>
-#include <linux/jiffies.h>
 #include <linux/prandom.h>
-#include <linux/sched.h>
-#include <linux/bitops.h>
-#include <linux/slab.h>
 #include <linux/unaligned.h>
 #include <kunit/visibility.h>
 
-- 
2.39.5

