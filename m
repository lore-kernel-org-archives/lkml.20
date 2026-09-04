Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59098274FD1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489525; cv=none; b=ZTj2KGHOy5rSVMSm+WO1tS4Ax9QbBjsaL6Yl23D26KGdEhVnVaPXq6H+9AgFqUHOsS2BWe4GQtlNUlYkm2nTthVAil8hlT9pds6Z8smcK8IQQg6rU1MQrnjJ6fpHvlKSmDT3EvR2sUvwDzEZFjYm0cuTPOLpVsBSdIsZDBoZTn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489525; c=relaxed/simple;
	bh=0bGq7sU8qZSEyxyWfBBpggJ5z9LnMGTnpYkjjyeQWlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXDyXb8YEgo5dwLNGO43l8alxh596XwPglqNYPIuolpJaysCQW0vMzNO2+ljnBx6cWIh6PK+ZqgpcFOI6LKFjRufcAIrSEjsyuHSbbNqqE1/VAsaKL9RkQTSSOKUZ2aulCnmiVl++Can5kRVctCXUH/zaElWr0U/s5/+zqsWlzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fbj6maN0; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fbj6maN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=0b
	Gq7sU8qZSEyxyWfBBpggJ5z9LnMGTnpYkjjyeQWlM=; b=fbj6maN0czwt919mHo
	ISwaKZlydnTej9TxwCjUyxHqbkiYDqufx5gfR/iuh+xKOtHjsmo93C8FL5gyv6p3
	Rc/9YLb+A9eTDOR8s7wZr7Q0rj30Xc+6qgIfozwKfp4IvQLcXLIhBiI2WBN0a+Or
	rdCOHoP+p8E5xQbbAOkjVVjeU=
Received: from localhost (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBHE_rRLppqOkclOg--.47269S2;
	Fri, 04 Sep 2026 10:37:06 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: tj@kernel.org
Cc: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	jstultz@google.com,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/cputime: Account cgroup fields to the scheduling context
Date: Fri,  4 Sep 2026 10:37:05 +0800
Message-ID: <20260904023705.106589-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <apmuywWz3c0keI2i@slm.duckdns.org>
References: <apmuywWz3c0keI2i@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBHE_rRLppqOkclOg--.47269S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr4DCry5GF4DKF1kXw48Crg_yoWxKwb_Ww
	srtry8trWDAF9Fyw4IvF1SqrWkW3y7t34DWw4UGFWfZFyFkFyvqF42qrnxZFyxJa47ta15
	JrZ3ZFWfGwn2qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUULID3UUUUU==
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwhIBYGqaLtIzzgAA3A

Hello Tejun,

Thanks for the review.

You're right that cputime_adjust() reconciles the user/system split
against the total usage, so my description of this as a user-visible
cpu.stat inconsistency was too strong.

My patch followed the cgroup accounting behavior introduced by
aa4f74dfd42b, where cgroup_account_cputime() charges CPU time to the
donor, and tried to make the tick and vtime cgroup field accounting
follow the same context.

Following your suggestion, the simpler fix is to make cgroup CPU usage
follow the execution context as well, matching the per-task and
thread-group accounting. That would also let me drop the cputime boundary
and donor lifetime machinery from this patch.

Thanks,
Hui

