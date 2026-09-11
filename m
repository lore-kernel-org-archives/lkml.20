Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50331A683E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789086247; cv=none; b=i9bRc2NuUdk6OzYfazGhTJxM9pqtffwC+mELPRjWM/Cnmy11EfSZCqRzLC8BEMKVeCqWORZgjfTLGczrsoRyNfxKPQBvJ8/I1sHoh8ItErhJwzU12sRZYfWIbzoEVlVv7xUAayNz7HFssrSyLxsEe/9OB+G/KnbPllH2RWU6xuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789086247; c=relaxed/simple;
	bh=aua9Yu7SayJpim7fAwEjumqUNbkjJe+ppwr7D4GF12s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TGkEIyjktUHaWOHIflbV0q64fbgOTssKcmbR6m3WRwhRt2eDSRrWoH71LZ+z+3egHB/BhKoJXWJUyhttgLPgUCpSeuqwqHwX1CEBbcUZsMQutrQM/p9vaOVkIxwATo+eoAQ8/mCkPm8jmSVM8foDvB0dXh/6Kc+kbcvcb9gRPMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YhKPQUpE; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YhKPQUpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=SK
	ivwCDQNWgzLDy1pDaCpR/DCgIFMGknQ1v8E2Xu5yM=; b=YhKPQUpERjDNyc/UJ7
	xt1DVZypAykD0/5co2R9IYJC6ApgwkqHLCurQL4/uPNzzhuS1o6uU9r67ZA3Kcf1
	SEpnYn9mh11owROn1FlcjfnOJFnxGpb0k1PKtC3wAm2smJQheUVk61O/FUUjAjGW
	D3ihLBxsTC9i6NTEqtND1F98g=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wC35kTgSaNquU7ABw--.29703S2;
	Fri, 11 Sep 2026 08:22:57 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: kayracizmeci@gmail.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	jackzxcui1989@163.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [RFC PATCH RESEND 02/10] scbed/fair: Remove duplicate check for busiest_cpu in active_load_balance_cpu_stop()
Date: Fri, 11 Sep 2026 08:22:56 +0800
Message-Id: <20260911002256.2398467-1-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910114109.1207170-1-kayracizmeci@gmail.com>
References: <20260910114109.1207170-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC35kTgSaNquU7ABw--.29703S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WryxXr1UCF4kWw4ruFW7Jwb_yoW8Wr48pF
	W09w4a9w1kGa4Iq3s3urW8Xa48ZFn5Xa17JrnIq34a9F15ur18KFWSqa12qFWUGws5Cw12
	kayqvrWDJryqv3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRdu4UUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC5wEOGGqjSeEnoAAA3W

On Thu, 10 Sep 2026 14:41:09 +0300 Kayra Cizmeci <kayracizmeci@gmail.com> wrote:

> > The check for cpu_active(busiest_cpu) already ensures that busiest_cpu has
> > not gone down. An additional check for busiest_cpu != smp_processor_id()
> > is redundant. After this modification, busiest_cpu will no longer be bound
> > to smp_processor_id(), allowing the active_load_balance_cpu_stop function
> > to accommodate more scenarios, such as preempt active balancing feature
> > that will be addressed in later patches.
> 
> The code is complicated and I usually not come near here.
> 
> But how did you reach the conclusion of smp_processor_id() check is redundant?
> 
> The cpu_active(busiest_cpu) just looks at the CPU mask of the given CPU or busiest in our case.
> But smp_processor_id() doesn't performs the same checks. And even if it's doing the same checks,
> how are you ensuring that it looks to the busiest CPU without even getting any parameters?
> 
> For your conclusion to be right, the busiest CPU must be the CPU that smp_processor_id() looks
> and the cpu_active(busiest_cpu), smp_processor_id() needs to behave the same.
> 
> And please add some details to the commit message why smp_processor_id() is redundant rather than
> skipping what smp_processor_id() does in any case.
> 
> Please notify me if I'm wrong :_:

The active_load_balance_cpu_stop() is executed on the CPU busiest_cpu where the
stop task is dispatched. Therefore, unless it is during a special time when the
CPU is offline, busiest_cpu is always equal to smp_processor_id()`.

--
Xin Zhao

