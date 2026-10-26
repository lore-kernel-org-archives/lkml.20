Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997617;
	b=BBwHcdrgzjJCjLYfsOs0kBQZ/s4nx/L6KlbsVB+5qk1//AXSUiwcxCyaP87SS1rrw87r
	 LUhe2LnZXKs6kGfp8edEVd/dT9HNMBNYQlDVrGnuKJgvJKp8v6VFc0KotPSvXOfMMC5aW
	 1pZfCYN4CW0IQyM1E5ERms05r6Xi++JUoRzGVqY8b1KIK6+uJ1Hkiv5BeVS/TNObHNM+y
	 Qhm7+DYI+QHR0TZf56/Qvm8We0THkchuv5diLvL7zzRpte5H2vZ+5OZBNGBZjC5M+0U+q
	 Y/JiwxWPaorOhLoNkJyfB/GatVTIBEcnYWL+aWS1Ceuh6zm0psRJN217V9rozbTuIhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997617;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:CC:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=SPMA29WPhhsjMxZvTRe+slSGiqdKLUr7sgp7elTz1pA=;
	b=T0RF0yr4nmqu+zuXMCKLRzjvFPtipJnaKjOaCbZ7WUbdI+y8N63IyN5c9pUY1JglGmVS
	 OhKTVHJIRwgDweJJXMyPs6Vx80WqvKxD0UCGSaTf/hcz8AR4GIYjbSXWihb6+clTjg4h1
	 QVbnkyPsnSezhh25mdeH4zYHFMZ2pAMyuSDET/zQ1Y/iwhwrUR2oMIQLkJ/wosRlr5jAc
	 84c24k90L1/sLtv+JNpN2NArHqJNIYvfk87HySH2ygMvIbI/9GEi4QTfXVJdepiRui+v7
	 sq3nBBSd3cWDLVI0WCTeIMoOYtWqCzDrpNp5+Rcfa2OH5mUna7NHfQFtghkuFp0Y7oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RnW3Yfdm;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE5F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE5F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RnW3Yfdm
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SPMA29WPhhsjMxZvTRe+slSGiqdKLUr7sgp7elTz1pA=;
	b=RnW3YfdmjVaoRj/dcdAYmw0sQp/hBgrto6g06vSgJHEMk5WtR02u8rgQUW/Ook2+F8BjlVz27
	Ozlh1tmJtnO1UzDU8OqbS7QNCKIxVe3/gv0IEEDPqVtEmXwJQcuGyJ3plsPbRilCrILn6NvRq0T
	OY8CTfbakkc/uOHZUiYAGeo=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jCkq34qGMz1K96Y;
	Mon, 26 Oct 2026 14:53:19 +0800 (CST)
Received: from kwepemk300016.china.huawei.com (unknown [7.202.195.98])
	by mail.maildlp.com (Postfix) with ESMTPS id B6B3040563;
	Mon, 26 Oct 2026 14:53:26 +0800 (CST)
Received: from [10.67.109.218] (10.67.109.218) by
 kwepemk300016.china.huawei.com (7.202.195.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 26 Oct 2026 14:53:26 +0800
Message-ID: <cf7a043c-384c-0642-204c-8f207eff3d42@huawei.com>
Date: Mon, 26 Oct 2026 14:53:25 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
From: Zhang Qiao <zhangqiao22@huawei.com>
Subject: [QUESTION] sched/clock: Potential timestamp jump due to inter-CPU
 counter skew?
To: Thomas Gleixner <tglx@linutronix.de>, <"John Stultz jstultz"@google.com>,
	<"Stephen Boyd sboyd"@kernel.org>, <"Peter Zijlstra peterz"@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk300016.china.huawei.com (7.202.195.98)

Hi all,

While reading kernel/time/sched_clock.c, I had a question about counter
synchronization requirements across CPUs.

update_sched_clock() updates the shared epoch_cyc using a counter value read on
the CPU performing the update. Other CPUs subsequently call sched_clock() and
subtract this shared epoch from the counter value they read:

cyc = (rd->read_sched_clock() - rd->epoch_cyc) & rd->sched_clock_mask;
res = rd->epoch_ns + cyc_to_ns(cyc, rd->mult, rd->shift);


If CPU1 observes a new epoch_cyc published by CPU0, but its subsequent counter
read returns a value strictly less than that epoch (assuming no normal counter
wrap-around), the unsigned subtraction would underflow. After masking, this
produces a very large delta and potentially causes sched_clock() to return an
incorrect, massive timestamp.

For example, consider this hypothetical sequence:
1. CPU0 reads the counter and gets 1000.
2. CPU0 completes the epoch update, publishing {epoch_cyc = 1000, epoch_ns = N}.
3. CPU1 observes the new epoch, but its subsequent counter read returns 993.

Assuming a 56-bit counter mask, CPU1 would calculate:
(993 - 1000) & ((1ULL << 56) - 1) = 2^56 - 7

Although the counter read on CPU1 is only seven ticks behind the epoch, the
calculated delta is close to a full counter period. Passing this delta to
cyc_to_ns() could cause a multiplication overflow or yield a completely
incorrect timestamp.

This scenario assumes the inter-CPU counter skew exceeds the time it takes for
CPU0 to publish the new epoch and CPU1 to observe it and read its own counter.
(All values in this example are hypothetical).

My questions are:
1. Are there hardware or architecture specifications (e.g., ARM64 architected
timers, RISC-V) requiring counters on all CPUs—including those on different
dies/sockets—to be perfectly synchronized? If skew is permitted, is there a
specified maximum allowed skew?

2. If the sequence above is theoretically possible, does generic sched_clock()
already have a mechanism to handle a counter read that lags behind the shared
epoch_cyc?

Any comments or suggestions are welcome.

Best regards,
Zhang Qiao

