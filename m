Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052974;
	b=z3SvTmptVVXmUm5tB5AAY1NwzG9onoWRi8H4QEqg5MNSZVF9r2FKsLmaIBJXH/6ugElF
	 ZrqcM8Fl0Iro3gPcgxG+89ZuLf9zIYF2WNxNk7ZkjDWDR/4Z6x2BHcUiPFp0AU1EYc5hQ
	 /QdfRX2EEBJTHjR9IB+U+l7sZcFAyDQXw/5Iv1BvB1hfE/Lar1bqiXsYv0i/AT1u5eDo4
	 xWeq8O+WIM+mAD6QUphFd3bIy3QGictAADIc5cFCrN7LmgLtVZUeCqI+N6Rg4oVHKwBX8
	 SkuBPieGt8ChfMA9WAJWKDI6fdH1ft0iC4yDzQMCoJIlSbTIMWOUdm2bpzwyxm0nj/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052974;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject;
	bh=K6tZF3VjI77tZ9R2ihUg0dh38dwGZ4SQdPM6quKiwF0=;
	b=0kUB/gUqgB5rIZZRuO+/e2wpoa8YOyKWZyXesrj2Uq7gWDESo3AUVXBsNW58jFoGoomE
	 JX0t9ZXU0bLIH+nPlFIPGpfaparj3Gxpm9IU1CPyfbZi065Onzl9KBhOrRC3RWsC5ZhUH
	 MBs7TJiCq9vMyEeWN9w9lIylozaCJNYsB+HydqvRmoq4iXUBSTGJceLeFvzl5XAbaq6YV
	 uHnwsglZieZBahT6V0TlByNPyuXMWPb/EQsu2QTZUucRoQWZBYIRVVK9tOpiiqo18h+AY
	 EnBp1jF5rkJBFkkSvaZPgd/QVCAA5VeyShnZlya9ezaPvftuccXy1ifBoefQkVjz29A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=WPfFPC93;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86432606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86432606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=WPfFPC93
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=K6tZF3VjI77tZ9R2ihUg0dh38dwGZ4SQdPM6quKiwF0=; b=WPfFPC93+MU8LMxI3+36IGB4nc
	xX/bW1LFF3P/Qqstkmt6nmtqsFYSIB15sOUocruOBnC7lO0NS45DTA4aI/0khPuhCVclQDpQLCk9U
	6nDcVMjb7+S+65mpmzMW4pSlIsBQfYiXggrS24PphrSuUGSHJqDfbCZWaJxB69b+/TB+272kcPQLu
	PLuECufJNmkZQljGV9d4K/MuTZe1XMF0VJHgj1Y2MJed1XcpKzNe3n7gy/die/CCXG8hqPzHSf0vG
	ArXC95UOdmuG221BCo8cmnb9rUTU8JYLQdLM+DoPqWHe2uVyNL2LmJ90Gu8D2VVpZQ+POvrxFf4n1
	RJwFCfdw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf89-000000008xF-2K0h;
	Sat, 07 Nov 2026 12:02:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 0D116300339; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107115913.261163891@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:13 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org,
 tj@kernel.org,
 ziqianlu@bytedance.com
Subject: [PATCH v2 00/12] sched: core-sched fixes and balancing
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi!

Previous version at:

  https://lore.kernel.org/r/20260828101659.812011872@infradead.org

The main difference is reworking of rq_clock due to TJ noticing the previous
one got it all wrong. The new patches might seem a little aimless at times;
this is because my initial idea for fixing the problem didn't pan out, but I
kept some of the groundwork for it anyway, since it resulted in simpler (I
hope) code.

Code at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/hackery


