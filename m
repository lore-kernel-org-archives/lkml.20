Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625423;
	b=nk0Jfd8iz5MWFDURgtIfKpCQFZuViFdK5LR9x9ML5Fec4bNgs7MfmRUVNpf7BW8bb2o0
	 Dd9huHVFGjDvbAzDnzawmQxLMY6gyltfhtPpiuft4DQUzmxGsqYpr22fHqD6OwtzzLupS
	 EVQh/uIiLj7Uzg3SaXRHrl1czVvnt1CvYGF1NcgPcdXWP2kP9H8SI4UNFQmmYvusw39FF
	 ZiQnpJOOBZXMPdvI4B8n0wmXBnQXrDdIzsi5JBDA+BDx3XM3RWdiQcLwnMiobAEiaRpAX
	 hm5mb8UUrxL6kY9P7vTv2c0mH1BG5iDF7xIhpVEuYAIjIKqhA4RAczcZuBRxRgz9AYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625423;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=c4K+MMBYl+1PUnm7aaBqRIW+g/QRIro5Cl62LG9r3dE=;
	b=JrG06trmIL6OF1nWRlxAnQ6pjMBbmDf5h3jLBHyAvOuVwpT9dyl6aOFNOLELZBd0eU+p
	 LkBhoa7uXU7+OVB7LbXppHATwDUd97OZa9A3af20rjm/Gha1xeECBgYBhjnfEDLL2/RzE
	 9ietok6F8mmmHHkuOp7yi8KidIrfLLQWANcScx94K6eiZ6H57Ax+ZcPB89JHzVJ9Vn4su
	 80sFrOYPwxAAHSDYxr4tC2+N7EfQnNqE0l5ZxlmTyRd45/GZ/4kKAnP9Lj0WEwNGOuHNN
	 iZkVBaqa9a6qro6UdV4t2gKtpnJcTscK2ahxUbGKGHkh6UgtiUw/ussjS7/EPy0jY4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FPrF9q1B;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20556606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20556606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FPrF9q1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=c4
	K+MMBYl+1PUnm7aaBqRIW+g/QRIro5Cl62LG9r3dE=; b=FPrF9q1B/rlrPic5gw
	mk9SsLsK1RZYLLsS9JGUcJgiVfDy+INbYBWRBeO7p6lwrIuxqu9A4F0nYNL6De/c
	AX3z6D00Kt6oQ/3royyL6rJrwki0LSujd/VuY2kVl3ohBMtoiX5ykhbMIuXZIfpD
	fk4zqow6sFJ6AGYe4Nsn7AvSc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3HwTujOhqus+bEw--.23094S2;
	Mon, 02 Nov 2026 21:15:27 +0800 (CST)
From: albin_yang@163.com
To: kayracizmeci@gmail.com,
	peterz@infradead.org,
	kprateek.nayak@amd.com
Cc: albin_yang@163.com,
	albinwyang@tencent.com,
	bsegall@google.com,
	chen.yu@linux.dev,
	dietmar.eggemann@arm.com,
	jstultz@google.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated blocked donors
Date: Mon,  2 Nov 2026 21:15:25 +0800
Message-ID: <20261102131525.1099362-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <audUyrA8QYYHKYPz@scheduler.schedules>
References: <audUyrA8QYYHKYPz@scheduler.schedules>
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
X-CM-TRANSID:_____wD3HwTujOhqus+bEw--.23094S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF1rJw1xuw48CF18Cw4rZrb_yoW8Xw1kpr
	9xKr13Xr4kG34DJwn3Aw4UXryUGr4rJ3y5tF4rJry8C3s5AryIq34xKr1rW3s8CryfAr42
	vF4ru3yxAFnFywUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUNIDwUUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbCzg8z1WrojO9RzgAA3Z

On Sun, Nov 01, 2026, Kayra Cizmeci wrote:
> IDK if you added the comment Peter asked for, if you didn't please
> add it in the final patch :-).

Yes -- I stripped them only for the email; the final patch keeps comments.

> It's up to Peter. Tho, makes sense to me if the other issue exists on
> older versions.

It does -- I booted a v6.12.115 kernel and ran the same reproducer
there, with and without the v4 patch already on the list:

    kernel                          run_delay delta    hit rate
    -----------------------------   -----------------  --------
    6.12.115, unpatched             147.98 - 147.99 ms  8/20
    6.12.115, + v4 (sched_delayed)    0.00 ms           0/100
    v7.3+ master, unpatched         147.94 - 147.99 ms  5/20
    v7.3+ master, + the diff          0.00 ms           0/100

Same setup in all four: DELAY_DEQUEUE on, two CPUs used -- worker and a
competitor on CPU0, main on CPU1 -- and main migrates the sleeping worker
with sched_setaffinity(). run_delay is schedstat field 2. The unpatched
delta matches the worker's own t_wake - t_migrate (147.99 vs 148.00 ms)
-- the whole sleep is charged. The reproducer self-checks (must reproduce
unpatched) and run_delay still grows ~40 ms per round, so the counter is
alive, not switched off.

None of this needs proxy exec -- v6.12 does not have it at all, so the
delayed dequeue over-count is fully independent of the proxy one. And
p->is_blocked only exists from v7.2: the is_blocked version cannot even
be built on 6.12, so with both folded into a single patch, v6.12.y to
v7.1.y has no fix at all.

The reproducer is plain userspace (no module); I can provide it if
needed.

Thanks,
Wei Yang

