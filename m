Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793494679;
	b=0obPXM4Md4w9UFozxaGWKEpNmEFDIwN8WFdsnyw7+y8/cPFM8CvPS2OXDuLbAe512fHM
	 D3SArSxroNo0/m/L17nTX2V8eQ95DaQrxWpUihDY3PWCyS7rOuqUnYQf2GzqMLz0tP3+f
	 ziRcPeqRrtdLqkac1P4WzBhq8Bpgc5FyySpbLmqKKfcjnySLFkcVvBLgy//wtGSV4j7k8
	 roDbctXaWygNkO3WGMEYLkYMmPcM44THA9+CHGnkQui3OTNBG/83OVFFyJ765Z+hcLCjZ
	 rxJOlRDVBPB6ZSmrCw1uDIN/32X2oJ6euxrrhR3sJHH2khnsOwboNuAkBPbZYOrTa8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793494679;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q6fE8kOUfPwHars9Ij5u7T6rP6kRUxK5TfbYZ8UEU9s=;
	b=VDpML8FrLi3BLctNdeCrfJJrRE5AVD0aXMv0AHcWBtGqdSLDzXtcxANa+4TFqXbHlEdA
	 gzjiZDSyNwcdaCL6Xz+IeYP3hYsEAh6HJ80wAXap3pD77lU5jG4L7Rh09f/+zoH19BjD+
	 bYfu1aJ8FLYliPQuyHTlBubmyiOJGFv8tRCCWCG324bAHPkjo9C9QJDzbM+zQcyMzhEhB
	 K3KwIF5MgcAwZOFawP82MeUuM0btws2YN2I14vZ72iG1rXKRUwC1o0nW8PN7N3ggmocXn
	 M7oibPtbKoMcn5KLiorc/g/LyoPTA2E315xT7CVRJS0dbL2LWbZFr/47ufhp5yp5YHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b="Zv/xFic8";
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=CVW9Fbbq;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E63606A320
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 00:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E63606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=Zv/xFic8;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=CVW9Fbbq
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793494671; bh=q6fE8kOUfPwHars9Ij5u7T6
	rP6kRUxK5TfbYZ8UEU9s=; b=Zv/xFic8praFCA/Yp4j5FYvhmTduBAMexe0wbVYUsnUSR0p6DE
	jowYaUMGfR4LpuYpLAkXxLyAR/JtlbFfVJEOK4tm3/uqY2qxn+mjQb2vu6NXQq9GaxSqIOwb/7z
	y13/6LKJOTjHCorri3pkjyVQwYcA85YzNMCZHY1M8SkvrQtZcA1MIbUdDhXWM6GF/WpYWFUUmSC
	lGSOL8P/js2ZUaXjaqFBwc0VzHOAqATtBhahKtg634we9MsMW+QkRHyFxbY59iaj6S0dtUhbk/6
	9MUuyJPYRDQtz2FjLAJfDo0Xp08+8afXWM62pg/s9iiS1j5/Jkg/NK08XPcx5lG3vkw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793494671; bh=q6fE8kOUfPwHars9Ij5u7T6
	rP6kRUxK5TfbYZ8UEU9s=; b=CVW9Fbbqf3N3VqPBFEKDBZq4+NwCZVYkcJGkihjsgL0A8VH/nu
	hl3TO1AHLa6mYctIl/5/Xc6Bmi999//nhXAw==;
From: Bradley Morgan <brads@mainlining.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH 4/4] taskstats: use div_u64() for the elapsed time in tgid_stats_add_task()
Date: Sun,  1 Nov 2026 00:57:43 +0000
Message-ID: <20261101005743.3022780-4-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101005743.3022780-1-brads@mainlining.org>
References: <20261101005616.3022705-1-brads@mainlining.org>
 <20261101005743.3022780-1-brads@mainlining.org>
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

tgid_stats_add_task() converts utime and stime with div_u64() and the
elapsed time with do_div(), two ways of doing the same 64-bit divide four
lines apart.  do_div() clobbers its first argument, which is the only
reason delta needs a statement of its own.  Both end up at a native
divide on 64-bit and at __div64_32() on 32-bit, so this is only about
picking one.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/taskstats.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index 9e11f92216861..2d4ecb9a89a91 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -226,8 +226,7 @@ static void tgid_stats_add_task(struct taskstats *stats,
 	/* calculate task elapsed time in nsec */
 	delta = now_ns - tsk->start_time;
 	/* Convert to micro seconds */
-	do_div(delta, NSEC_PER_USEC);
-	stats->ac_etime += delta;
+	stats->ac_etime += div_u64(delta, NSEC_PER_USEC);
 
 	task_cputime(tsk, &utime, &stime);
 	stats->ac_utime += div_u64(utime, NSEC_PER_USEC);
-- 
2.53.0
