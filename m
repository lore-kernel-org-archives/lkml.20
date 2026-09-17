Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844D94A262C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636996; cv=none; b=I79tzJZXie+sxE8NEJvGYTp6vNKu870xBFEzyC1LkvgNsimJpiBe+FiB72IW7k79i4tk7YMKYQOALAcsMjv73bt5xm4w9n79NFQD6Z4H8pQ72uJyCuWoqmPtJNmIRfiNDAtGPdxhbycBpeTDcWO95jV9vVJCLISbrGplMg+KUTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636996; c=relaxed/simple;
	bh=vc0jvIu5eHQis5IMnEqgaPUxYaDtNaEZQL9ygDGtJC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gtuuriRQ3fjwEYrXCE4pYvm23WgwHP9no97lXXR8bxDj2AEnepqQJOX9t/ECMBan1A9y2rAkAYNaBWN9EztNm7OiAYqHFR6ME9YKJ230ot2bCXaU8IsG4rPjPCufPa1TSHv9Aq83IrqS23ikjupHKpDaoYb9Th9rR0SK837LmqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Cr9YDxsQ; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Cr9YDxsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vc
	0jvIu5eHQis5IMnEqgaPUxYaDtNaEZQL9ygDGtJC0=; b=Cr9YDxsQ6kRhsBKHfe
	27Pey4S037LNw2q2vRQNethNmODxQV4d7Hvc1LoQq8lIqWJGqpvZYTreUVR63JM6
	oXWugcocmhYnRA7xyU7IPc3gSlVEXz3sJBpmwZY6Ca0Sr18eMSA5j1v8SQBQ3uSH
	DNRBhU0Jj7KxsDKQg2I2RFp58=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3vz5bsatqDbesBA--.15189S2;
	Thu, 17 Sep 2026 17:22:35 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	syzbot+917245f59371bf1d27f7@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/2] locking/rtmutex: Handle empty waiters tree in try_to_take_rt_mutex()
Date: Thu, 17 Sep 2026 17:22:35 +0800
Message-ID: <20260917092235.388996-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d582de03-b483-42ef-8ae0-f8d94fbccc58@redhat.com>
References: <20260914120931.63940-1-quchaosheng000406@163.com> <d582de03-b483-42ef-8ae0-f8d94fbccc58@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3vz5bsatqDbesBA--.15189S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy5JrWxArWrCw1kJF1rXrb_yoWDXFbEgw
	1qyasrCws3CFs2qrn0kF1FvrZ2gay8uFyrXayrZw43t345AFZrWFyqqwn0yF18Jw48Kr1a
	kas5K347CFWa9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjQeOtUUUUU==
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-xwJfmqrsVxJlAAA3l

Hi Longman,

Thanks for the review, and sorry for not answering at the time.

Wording: fixed. The comment now reads "The waiter could have been dequeued
while the lock was dropped", and the v3 I posted carries your suggestion
plus the Fixes: tag.

The double send was my mistake, not intentional. I sent the pair twice
within seconds because the first attempt returned an error from my SMTP
relay and I assumed it had not gone out; it had. Both copies reached the
list. I have stopped doing that - no patch goes out twice now, and I check
the sent folder before retrying rather than assuming a failure.

I know v3 is not an ack, so I am not reading your "looks good to me" as
one. If the v3 is fine as it stands, a Reviewed-by would be welcome, but
there is no pressure from my side.

One more thing I should have disclosed: this patch was prepared with an LLM
coding assistant and should have carried an "Assisted-by: LLM" tag per
Documentation/process/coding-assistants.rst. It did not.

Thanks,
Quchaosheng

