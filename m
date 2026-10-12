Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED832F7F19
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791779265; cv=none; b=pCOd46zDpC5RAgFG6lSaH/NTeDQrc7qeX7dygDcxAvVtmrEaRe0OrZGKIxoQwwJbsQX8yfaXgFe8e5AXLrV5N3er5EBvXul13hgTTv+10fWai35zsm9yIYLaz0FQun5jOt8pA3QC93KwlmMp0vSQ0hX5qgfkAelDSfN86NVahJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791779265; c=relaxed/simple;
	bh=19giI5Yzj5bZnhKSwT8PsE1ZuN3v8+Flg24fTD9VPoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0xR8nidxZ8RsjVXq+N5KvWkhTWX/56z1wyMpSLZr3JQCD9h8lLLEAI7jz+4r4IxuEXQa3HGoXr3B11vLXIAJtQ9dwa5GMHuqv1sIQn7IFBJPnPCAtnQI1XtTyWSNtgdvQOhtL2vCjLDx29d7skhLmkfwkZwDIWGEAwmSbYo/Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EsMMWHZN; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EsMMWHZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=19
	giI5Yzj5bZnhKSwT8PsE1ZuN3v8+Flg24fTD9VPoo=; b=EsMMWHZN2AnKkNh0hH
	tJ/CZ88wwmGDkolKm1IkH2OxVBvDRjqeqHLngJyvE92UHJUpExNwl4Kijgk2Rc92
	bxiOBrtZc1mGQCeqHSFdPq/aAI64k4GPlXyjIdPF+NJTZOtIBh6ZVda4SXOgFUIc
	/ak/RuJcUzZSBEcL5V4J579sQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3f5VuYcxqEzBxDg--.3129S2;
	Mon, 12 Oct 2026 12:26:23 +0800 (CST)
From: albin_yang@163.com
To: peterz@infradead.org
Cc: mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	chen.yu@linux.dev,
	kayracizmeci@gmail.com,
	mintaohuang@tencent.com,
	linux-kernel@vger.kernel.org,
	albin_yang@163.com,
	albinwyang@tencent.com
Subject: Re: [PATCH v3] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
Date: Mon, 12 Oct 2026 12:26:22 +0800
Message-ID: <20261012042622.1488555-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260922082432.2987855-1-albin_yang@163.com>
References: <20260922082432.2987855-1-albin_yang@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f5VuYcxqEzBxDg--.3129S2
X-Coremail-Antispam: 1Uf129KBjvJXoWruFyDXFy5tw4rury8Aw1fWFg_yoW8Jr1xpa
	y5Cr43Ar4vgF1Fga17Zr4fW3429ws3Xr90gr1rtryUZw15JrySyr1vvay5uFZYyrsakF4a
	9F4DXr97CF1DZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUseOQUUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbCzg9B42rMYW-AbwAA3k

Hi Peter,

Just a gentle ping in case this got buried -- it's been a few weeks since v3.
Happy to change whatever you think is needed.

To recap: proxy exec does seem to have the same re-arm problem, but I don't
think t->is_blocked can gate it -- in ttwu_runnable() the real wakeup enqueue
sits inside the if (p->is_blocked) branch, while is_blocked is cleared
afterwards in ttwu_do_wakeup(), so !is_blocked would suppress the very re-arm
this patch relies on. And I don't think task_is_blocked() can replace
se.sched_delayed either, since a delayed sleeper has no blocked_on.

One more point: the bug predates proxy exec -- DELAY_DEQUEUE landed in v6.12,
proxy exec only in v6.17. Coupling the fix with task_is_blocked() would tie it
to infrastructure absent before v6.17, so it could no longer be backported
as-is to the v6.12.y..v6.16.y trees where the over-count happens.

So I'd suggest taking this patch as-is (delayed dequeue only) and handling the
proxy exec side separately; if you'd rather cover both here, I'm happy to send
a v4 with !sched_delayed && !task_is_blocked(), though I'd want to reproduce
the proxy case first and re-check Prateek's Tested-by -- just let me know.

Thanks,
Wei Yang

