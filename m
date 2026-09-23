Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5E952845C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171100; cv=none; b=OjQNxKdh4FUL7feRbmc7X3RcsxIzFh4d7WVhkHn/IfYhSvgWRKrwqKmkNo70zEfwxnoZY3r8jv1QToMb3xwmV4DBAGgBUl4ggk0DoyFWUTShu5lVzGTHtAIKvzkXqKrwilPVGt7IKUZVG91A7ps22M4UbYbb4wyVVSFlA/VVSD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171100; c=relaxed/simple;
	bh=8xatYH7BfSHPzqvqlKKUhUd8GijjRjk7MeIC/E/Bfak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kBDrTy7ISVPCH3xIsBgKIwyuNx1h+rTcDZYJm6a+8blF5tTa4pdskU7alw3wgyOAAP3AokxR9yqbCB4/+hOJHFmDAjXARz/T/Z6n4XhLeExz7ePJV6wYSGvG5EWq8s0wwGStmB7IonQs6z+oSYnjbQFaimSOfP9w4XGw+teDNYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Arv+KWJm; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Arv+KWJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=8xatYH7BfSHPzqvqlKKUhUd8GijjRjk7MeIC/E/Bfak=;
	b=Arv+KWJm4hNwtyBJUSe1PV83IFVcfHxHUaGEZzarzud1mLZF6XO/gur7vQaJg3
	H7dAlKS+tW/nonq+JWlkubD8SXK9spI4KtLotizW6bZRzLxVboeN+EVz/SNdzSVr
	7CdLI2GAx9gQ0Ga1cL99BvLZFBoMOSiOokYIuLk/rSKj8=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXn3k117NqHuBdAQ--.57264S2;
	Wed, 23 Sep 2026 21:42:14 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	vincent.guittot@linaro.org,
	juri.lelli@redhat.com,
	peterz@infradead.org,
	mingo@redhat.com,
	Michael Jeanson <mjeanson@efficios.com>
Subject: Re: [PATCH] sched/mmcid: Fix affinity-triggered switch back to per-task mode
Date: Wed, 23 Sep 2026 22:41:23 +0900
Message-ID: <20260923T134123Z.0cf608bd5d42e07f@163.com>
In-Reply-To: <10d3d3bc-ef34-4b48-8dff-f544266181a9@efficios.com>
References: <20260915155953.2856524-1-sh_def@163.com>
	<10d3d3bc-ef34-4b48-8dff-f544266181a9@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wDXn3k117NqHuBdAQ--.57264S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr47XF1xAw43tr43tw4rAFb_yoWfCrgEqa
	97KrykJr45CFnFvF4UKFsFvrZ29a17Kryjqw1qqw17KFyrXFZ5GFs5ur9rZr4Sq3s8Zry3
	ZwsIv3Wj9w17WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU9jjPUUUUU==
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwhaK6Wqz1zb-FwAA3n

> Thomas, I recall you had tests for those state transitions when
> rewriting rseq mm_cid. Were those local or did they make it upstream ?

Thanks for the feedback.

I checked the current rseq selftests and the related MM CID history.
Thomas' January [0/4] series mentions a thread-pool emulator which was used
to stress-test the ownership transitions. The series did not include a
selftest patch, and I couldn't find equivalent transition coverage in the
current upstream tools/testing/selftests/rseq/.

In particular, I couldn't find a test covering the affinity-expansion case
which switches ownership from per-CPU back to per-task. Unless I missed an
existing test, I'll add a focused selftest for this case and send a v2.

Thomas, if that emulator is still available, or if there is a preferred way
to exercise these transitions, I'd be happy to use it as a reference for
the selftest.

Thanks,
Hui

