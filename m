Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A36551C065
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752964; cv=none; b=ZnaHKkm36wIL+SJuWSMZ/x9YGm8UTdEM39V+JzeqNOVk2DJvGumEuNhIOGePUWVVq793Ml2x1Qf/djdxWqlbTwuhtS2Zetmjh6nbjI2XnMreRpI8MyazVdDLAupk2A8tnztVBMBHnj73yZn40kD/KvIvK0cZ5euE+i57R2uA4C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752964; c=relaxed/simple;
	bh=s/nhuRlp4yxDKWWjYclhsUSG9rqWL5fQH2n/khGHRd8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=cjRJ0BIg8E8dZazqFRhC6R9afFcyohfeKN+usA0SL0Jhe6cLkqchPvMkqq5v2RFINWcXc8FBZ2e9OFgyZFuh/Jf4oIC3EjtefVRqH+Y59ARAm7fGrQ5NFl/cdNuhLjRa+j9Z7D6jfW084G6p15Sr5BiWRQwcw6qemdP8wYI6oLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=a9iMDKr6; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="a9iMDKr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:Message-ID:From:To:Subject; bh=YBc386ksOhTVi74
	e8wzGXeF03+MExlN3zVdgvS/zqmU=; b=a9iMDKr6/Pl9D9lZxnB5S+0fw8CD7Pk
	GP/8zvCECAoBxJstcaxtfiFZutYy8isk+5hN8yfs9ZPX20a7RyzFdHoRTl2zv40U
	pgM23JZCT+8mr5aWjdtS12Q6knEwZsSdsgIQVNeTXU/s8jlIDPbj1LCWOXf/bOIl
	dmcaFAZHt5YU=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3J50Zdq1q2whmBg--.18635S2;
	Sat, 19 Sep 2026 01:34:18 +0800 (CST)
Date: Sat, 19 Sep 2026 02:34:17 +0900
Message-ID: <fe5e2c51f5b90447bbedde4eabf4cfd4.sh_def@163.com>
From: Hui Su <sh_def@163.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	hannes@cmpxchg.org,
	surenb@google.com,
	jstultz@google.com,
	connoro@google.com,
	metin.kaya@arm.com,
	sh_def@163.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] sched/core: Account PSI IRQ time to the execution context
In-Reply-To: <20260918132915.1236312-1-zhanxusheng@xiaomi.com>
References: <20260918132915.1236312-1-zhanxusheng@xiaomi.com>
X-CM-TRANSID:_____wD3J50Zdq1q2whmBg--.18635S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUUq2MUUUUU
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwhqpCWqtdhqDMwAA3j
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> I did not construct a case where donor and curr differ.

I tested two proxy-execution processes in separate cgroup v2 cgroups.
The owner held a CPU0 mutex for 20s; a SCHED_FIFO donor blocked on it.
On x86_64 QEMU (4 vCPUs, 2 GiB), with PSI and IRQ time accounting enabled,
the irq.pressure total deltas (us) were:
  unpatched: owner 22,053, donor 401,127
  patched:   owner 552,740, donor 31,566
Both runs completed successfully, and attribution moved to execution context.
This exercises the donor != curr case missing from the original test.

Tested-by: Hui Su <sh_def@163.com>

