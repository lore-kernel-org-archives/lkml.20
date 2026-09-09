Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB265514771
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951416; cv=none; b=cy13h7S+9CjMazaH3WtsWQQnTa/Ai4w6fI309DQ0fdFQbxzr/hD2cde+w1RescEEXPe4eJi+HMX+2foLeoa9HNl981Dqie2pEV7UE5eKqbpQKCjpQE5lLOsABfKRJF7eTHuxZP2PGR8ubcP0e9lb0kSu9G9k1HQs6ZvW+vuSqEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951416; c=relaxed/simple;
	bh=sZRyE30VWiz+aBldMkzshTV1nRvTlNB2wkNjjAz+ww0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xh084kvy/MZWZ6heLtEk5i4ktDkmbITtsi3MLs4cyCQyfvf1Lv6ICqKSTwxDSqdhhnMKdZBcgi1T98Rp3pMGlVGGqrhboFAfenTDKl3EjEVswWmhpSXNMn5ejef5NUW31/nyN/EwxhbNLpc2LDd5d7SPQIme5t/03fnTrA54KhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XIVxtPrM; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XIVxtPrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sZ
	RyE30VWiz+aBldMkzshTV1nRvTlNB2wkNjjAz+ww0=; b=XIVxtPrMOdUS5S/3UE
	lJn6TjxBn0eQjgMZqUlhDLj1UyqpVzFuctSRyUfYQTd7QMqrfYEHKlqEtaWUr10w
	P44tmaFiybZLhlWRVW3qkSbLNQDpIvzgb1rIXygvtFvaaZ1d4yLlGGbyzoH9+XBR
	kNVS1X+moYlwFa0BecVMiqklY=
Received: from localhost (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgA31Po5O6Fq2zV4PQ--.27323S2;
	Wed, 09 Sep 2026 18:55:54 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	John Stultz <jstultz@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] sched/numa: Drive NUMA task tick from execution context
Date: Wed,  9 Sep 2026 19:55:53 +0900
Message-ID: <20260909105553.3158889-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e91848b651fbe163676813fffff76970d6895cf9.camel@linux.intel.com>
References: <e91848b651fbe163676813fffff76970d6895cf9.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgA31Po5O6Fq2zV4PQ--.27323S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw4kXFW5Jry3Kr4xtr4kCrg_yoWkCwc_uw
	n5CFykCws8ZFsrG3WkKF4rZ3Z8K3yUJF15JrZ5try7trySqrsruws3Xr93Z3ZIgrs29Fnx
	Grnava1fZa17ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUSdgtUUUUU==
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6hvfP2qhOzv9hQAA3i

On Tue, Sep 08, 2026 at 09:01:16AM -0700, Tim Chen wrote:
> I would vote for the real-time comparison. What do you think, Tim?
>
> Agree, I think keeping the real-time comparison makes sense.

Thanks for confirming, Tim.

I agree that the task-clock comparison is the better direction here. I have
incorporated it into the v4 series as patch 5/5, using the donor's
exec_start and a selection-time core_sched_start baseline instead of a
vruntime snapshot. The v4 series has now been sent.

This keeps the comparison in the task-clock domain and avoids mixing
vruntime deltas accumulated under an old weight with a slice calculated from
the current weight. The non-proxy predicate matched the existing
sum_exec_runtime predicate across the tested HZ and nice configurations, and
the proxy force-idle reproducer showed the donor task-clock delta advancing
while the donor sum_exec_runtime delta remained zero.

The patch is available here:

https://lore.kernel.org/r/20260909092901.2989564-6-sh_def@163.com

The v4 cover letter is available here:

https://lore.kernel.org/r/20260909092901.2989564-1-sh_def@163.com

Thanks,
Hui

