Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD85361945
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411191; cv=none; b=tx1QDw3n2Mvsd4s2TV2olv/KKWnKxnlNvDiccsUPBScIDpZEoOuZpyxJ8zGvtra2nqzj2oth8Dod/q7G7grMny52mwrHoexTOdrM6DFru0WE9BPz8ujjogKLUz7e43SKezKYHs7Pkl4b2ULj7Sw69fGV2s+GrPDjH12kClM8FXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411191; c=relaxed/simple;
	bh=a4kgsg87uvmv7g8ehi6JSpMoPxHezdxag86R+xd/hvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bfl7/sebPFGbGLsvGOt18Q/SFDoAbE92H//lWlbWCZol29CBf/KZ7+GVrkTLgLLwG2+i/NLPhjLmEsZlCCcuH4Py80duhEwT9dujW+xEWO94YV8UK49Q4aUv0+cNa3yD02SKpSMcsdDcLQS+8ktqbDwlwvld3jaEuMCGZM93iTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RM7ELfWj; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RM7ELfWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=a4
	kgsg87uvmv7g8ehi6JSpMoPxHezdxag86R+xd/hvE=; b=RM7ELfWjYxR7qJxg47
	3ZIgsfJq7aZ0RW04GmJ64NLOgAkGvjw3alZQU+lcXwl8SsZPE34Rn1UGiKGYLhad
	1i3NSZ9Q01nUPP+EuHBpqeX+l/LY+7rbOdzvx+5HOVV2INkH+h/KA5rOh3v/nUzT
	7vzD1Eef89ajXwSgcn2rSyXhI=
Received: from localhost (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBnc7_v_JhqT1KQQg--.16166S2;
	Thu, 03 Sep 2026 12:52:00 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Hui Su <sh_def@163.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	John Stultz <jstultz@google.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] sched/cache: Drive cache task tick from execution context
Date: Thu,  3 Sep 2026 12:51:59 +0800
Message-ID: <20260903045159.2576853-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2bd1be66-25c6-455f-94d7-a44a147dba9a@amd.com>
References: <20260903041154.2479761-1-sh_def@163.com> <20260903041154.2479761-3-sh_def@163.com> <2bd1be66-25c6-455f-94d7-a44a147dba9a@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgBnc7_v_JhqT1KQQg--.16166S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRN2-nUUUUU
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwRA8m2qY-PBp9AAA3V

Hello Prateek,

On 9/3/2026, K Prateek Nayak wrote:
> nit.
>
> Might be worthwhile to extract the above into a task_tick(rq, curr, donor)
> helper instead of duplicating in two places.

Agreed. A helper would also make the scheduling-context versus
execution-context split explicit and keep sched_tick() and
sched_tick_remote() in sync.

I'll fold this into the next revision, keeping the donor scheduling-class
tick before the fair execution-context NUMA/cache hooks.

Thanks,
Hui

