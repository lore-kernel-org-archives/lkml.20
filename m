Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422550;
	b=EFsbos9j5AYP7RUufuJUywsQxAA9+XOAuzmIfbwMg5m2jAhEk+jr9TvBlytHL25mOEum
	 5prGQ/tElKUzcdHlPNfE1V4OUnxwI/m1UfndXANeRsoKNRb9Nk7XsES8J7Rzap4LxZCbK
	 ShEiCmD0lvBBJ6fOGb9syPwFJIt+teAH0qDuz4xphWaHs5jy0mBPUcxaQeMxmEAZ2X9CT
	 oNbtxrNbR+xIk4lGL239cNI5bT8to4Kw40xcfHRBT7sKa+1NdYBCus7QQMGv6/ocwI2Tn
	 GP1FUIn74YfZH3ejdvfC5edR2U1h+CGcSFTs7dj/C2OkUEyHLarLQ3OMFrfW+1hvr9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422550;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=OpGtpRe3PDwE0TpF75JebLJBygVriDdxLs7RdURsK+4=;
	b=JWqxQCKtD6jizafPWNpuvzes9Y9UCVXX7dAwTvIVZF0lh8k42kaUOpCjHbndOxpv3zWC
	 3mXw7ksKDbvlLPd3BioaFSlS5XR06SseUN0lv14WzvaMmsw4B/vz4rn+yMQTuHNMH1ab8
	 PAuQh/IhlHBC5M/9uGNJuPympltPLj8ijTK0Tmbmf/wfMazzHg5Y8B/hNbgZG1lET3Hum
	 nV3FKI0I3AiaWXv7gGlyAooo7NoawWvX4xCoNKy3PcIqzV1E77UCMAyYbmFy1sKkr/9yp
	 NAFt0hQnclby0GDnQCXLLAP/jChrlReT81oBBDHfOSocVgTVA0OWcR6ZK5YqLGKVIgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Z+3njHN4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=haUOTJMd;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E666086067
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E666086067
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Z+3njHN4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=haUOTJMd
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792422540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OpGtpRe3PDwE0TpF75JebLJBygVriDdxLs7RdURsK+4=;
	b=Z+3njHN4+Wrivh+EZ+KE10BKGifjCgslIJ3pwMtIKSRK3KO6aewW+I9ILn5REcW+CbFtNP
	2qtGbZuJbjSaKfpWu1EQIhVAUykcWon2XpHBJPPyo9u32icpSt6wY7rBFtsABP5IJWD/a1
	BOZc7VDsAjGJQ5SaXoMtj9eab3flJYMyrNlFbRuh10lTfiRhQZkSMf8D5YdM+cNYC8bUIG
	pk9Uls0vnj+IH9MhE71nZvW5Km4RBycG+ipS/8DN1nqrj8uVO6lnHkMvEpi1JW1AeT9a/H
	/D5oYJvNtWiZHeKhe6xxx/akUklSvuILcfZgAAyq8n5MXRO+QMYZbJBOHf4n8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792422540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OpGtpRe3PDwE0TpF75JebLJBygVriDdxLs7RdURsK+4=;
	b=haUOTJMd4U3S3cdhp6RPPO4SJusTcEWYj9U0wCFl2PY5TtUZOiYtb06Nyxs5FExkaDLhbc
	HBuELag9u6FsOOAg==
To: Wang Wensheng <wsw9603@163.com>, pmladek@suse.com, rostedt@goodmis.org,
 senozhatsky@chromium.org, d-tatianin@yandex-team.ru,
 linux-kernel@vger.kernel.org
Cc: wsw9603@163.com
Subject: Re: [PATCH] printk_ringbuffer: Fix space_used() when blk_lpos->next
 overflows
In-Reply-To: <20261004075755.363989-1-wsw9603@163.com>
References: <20261004075755.363989-1-wsw9603@163.com>
Date: Mon, 19 Oct 2026 17:14:59 +0206
Message-ID: <87h5ihpw1g.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-04, Wang Wensheng <wsw9603@163.com> wrote:
> Since commit 67e1b0052f6b ("printk_ringbuffer: don't needlessly wrap data
> blocks around") blk_lpos is treated as not wrapped when blk_lpos->next
> overflows to the start of data_ring. We use the indices of blk_lpos->next
> and blk_lpos->start to calculate the size of the data_block. This computes
> zero minus a small positive value, resulting in underflow and an
> unexpectedly large value. Simply using the original lpos with wrap-counts
> solves the problem.
>
> Fixes: 67e1b0052f6b ("printk_ringbuffer: don't needlessly wrap data blocks around")
> Signed-off-by: Wang Wensheng <wsw9603@163.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>

Yes, this is a real bug and this is the correct fix. Thank you.

Fortunately the bug does not cause any problems for the kernel because
setup_log_buf() does not actually care if the "free space" has run
out. And if the ringbuffer has filled, then the free space is 0 anyway,
so even the reported "early log buf free" is correct.

For that reason, I do not think it is strictly necessary to backport
this to stable kernels. prb_record_text_space() is not exported.

But still, this is a bug and needs to be fixed.

The bug is easily visible using the kunit test by applying the following
trivial patch.

Before the fix I see max sizes of 4294959248. After the fix I see the
correct max sizes of 280.

diff --git a/kernel/printk/printk_ringbuffer_kunit_test.c b/kernel/printk/printk_ringbuffer_kunit_test.c
index 2282348e869a6..d100e6bd79120 100644
--- a/kernel/printk/printk_ringbuffer_kunit_test.c
+++ b/kernel/printk/printk_ringbuffer_kunit_test.c
@@ -113,6 +113,7 @@ static int prbtest_writer(void *data)
 	u32 record_size, text_size;
 	unsigned long count = 0;
 	struct printk_record r;
+	unsigned long max = 0;
 
 	kunit_info(tr->test_data->test, "start thread %03lu (writer)\n", tr->num);
 
@@ -154,6 +155,9 @@ static int prbtest_writer(void *data)
 			prb_commit(&e);
 
 			wake_up_interruptible(&tr->test_data->new_record_wait);
+
+			if (prb_record_text_space(&e) > max)
+				max = prb_record_text_space(&e);
 		}
 
 		if ((count++ & 0x3fff) == 0)
@@ -163,7 +167,7 @@ static int prbtest_writer(void *data)
 			break;
 	}
 
-	kunit_info(tr->test_data->test, "end thread %03lu: wrote=%lu\n", tr->num, count);
+	kunit_info(tr->test_data->test, "end thread %03lu: wrote=%lu max=%lu\n", tr->num, count, max);
 
 	return 0;
 }

John Ogness
