Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571671;
	b=NcwQE6HclcK16wpWC1U93MhfOUyol2CGrqrET1P780HdNSNvRrH2XElaHPICg1PfEutr
	 x4sEe8jITL9Rjc5J07xQm88TACFBmHjV7btkZXarx3FqQYI8VR56kkdvYoNa42+IZ7u11
	 HfGLfa1J45MV3q/Qb0z/v3nHvM+O/eg0EqIUXem2DIjccL2Cqk14mVpG6LXg7mHAFCHoj
	 xXyyVIpQm6dWQZWxrERDu6s2qbKR40TVwlmfi70x6Pc+iEx233bJ5uO6/qN8lGB7EtJN1
	 fbpMeavhU40MLX3evVvxCAsZyHmnlS1i5HyMJPUf89l2+BQDG5SyQw6tMEA6fTo4NCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571671;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=zhfoN8norVHiHI9bD4jaoMKp9FFXhFPanvK9fbLLCgQ=;
	b=n7HEFRun/qzCoWJGV4i0nW+Yau4QssTjLVvPFRxvjGzJWkjD3CxgNpYGLexo37VbwiSD
	 nM/wPOkYPZJI1q90HuYKwXn8JoZ15viTngmunpflmxNzR5Ai3LlSf59KXkIHSNYAubb0L
	 s1ieD5HypwVjc+UJW9evWLz0OZTfCR2nb+CRjH+YYC0MvtYPSG2mH7RhWUMUw+Oer/dnw
	 aT6HmKhjQKNomYpEaOA4cXC8/B6NG5lzBhYTDjx1jBdIzLwQ3Sl+318Lkl0yiL0A7pg+t
	 AL3zWsc084Q06TgbxTT7wJO9c1fKIuRFMX5fJV22zLO9SotvWSvUfZt8e4hbTZYs8Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="c/g3guVI";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=V0lO6HQJ;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59D3606A8A6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B59D3606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=c/g3guVI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=V0lO6HQJ
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794571668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zhfoN8norVHiHI9bD4jaoMKp9FFXhFPanvK9fbLLCgQ=;
	b=c/g3guVInrZ62aChjGsNMm6JqaNL5J1eyxwZDMGrTRB/uJYOJePAg5LbcLhe4lVYp+IsX3
	Kb7O82eVNIadsA4tHVXFryRE441Ug1MHi9ysQcUoSO84+5qmKfVw7rPDE39SUJ0A15Ce4y
	jw16R5sdtgH5NSb8k+gk6z3OQjthz5990prLRgpiMj7hlRHAV4QrIXN87yofITXQCSqO7u
	IgtJg482+4aeARircyUSxJu3Z6pQ6JFu4+6e5KhH2TC0AcLdHhHl7S3vZTN0/CNQLCW7Gf
	mfizeyMX4ago6ymjIXP3sTQGkBOubd8rZnILIT0VOCvS9nC2MYstabLE2LvB4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794571668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zhfoN8norVHiHI9bD4jaoMKp9FFXhFPanvK9fbLLCgQ=;
	b=V0lO6HQJZ9EbUBg4kZ4FRlJOFSx4C7+0ZUjvbqNU81iZYzRm3DQjOqGeuUReizoVofefUE
	Cxyid5vnVS8VBlBQ==
To: Zhu Jun <zhujun2@cmss.chinamobile.com>, pmladek@suse.com
Cc: rostedt@goodmis.org, senozhatsky@chromium.org, paulmck@kernel.org,
 printk@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhujun2@cmss.chinamobile.com
Subject: Re: [PATCH v3] printk: ringbuffer: Annotate speculative record reads
In-Reply-To: <20261113075039.172176-1-zhujun2@cmss.chinamobile.com>
References: <20261113075039.172176-1-zhujun2@cmss.chinamobile.com>
Date: Fri, 13 Nov 2026 13:13:48 +0106
Message-ID: <87tsllvsrv.fsf@jogness.linutronix.de>
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

On 2026-11-13, Zhu Jun <zhujun2@cmss.chinamobile.com> wrote:
> Readers may copy a finalized record while a writer recycles its storage.
> prb_read() checks the descriptor again after copying and rejects records
> that have changed, but the plain metadata and text accesses still trigger
> KCSAN reports.
>
> Annotate the speculative copies, line counting and length read with
> data_race(). The descriptor validation continues to determine whether
> the copied record can be used.
>
> Fixes: b6cf8b3f3312 ("printk: add lockless ringbuffer")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>

Thanks!
