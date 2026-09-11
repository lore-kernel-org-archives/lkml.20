Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B028024293C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088854; cv=none; b=PRbA1Bw7QiTC5oUzfvOLW65s4vy8MLBxL6LaxbjCy2u4l5yt8wS/tiAkdJfDJDF7xoDCJyJh1hYJAlfQhYGM/C0yi73E/gTAs3eC/5SuPYp2Bs+4WbI+uFEwnXiqyI8PzxbVDZezsW6DBnc97h//XZs5WQaYsglLhSZYEVG3hBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088854; c=relaxed/simple;
	bh=KYydOemXHyJ+yBcpl94qDH2hpFL82vxHytlW+Lb3cTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IiuVO1KKVmCBwB5F90MHMYWgUvcBSvA9FcX/nerWg3uxiHRCt51VVB2ZE7k01dJlA5YipHI0Nk5/noc91sbooaKSwuIukr7KoPDicy4W8PmEv5J7y1PYB4IVQ6YkgXv686U4KcOHw+OK4BGC2On6JQSCCqqIRQLjHnGFOeOpW+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZEIuoy1m; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZEIuoy1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ah
	MaGmoOhqBTn/A13RDPaVTtbWB6Mp/JPvZMx5/jlc8=; b=ZEIuoy1mFxQwQ6zSON
	n37MDrgsF00pgNFnHZbi+AFvq/7ondr0MBqmr2vRhLU0NCdsS36ELG/OnwT2wQHr
	TaKBSJO1R16LKC+BvjmTyaPcLsJ3BY577tk3jTwk4MMtSVxMW+OGSRpR9uZMb3U1
	F/bdX9oXoJwwyo38TqVWXUrX4=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDHEt4PVKNqmrcVCA--.41331S2;
	Fri, 11 Sep 2026 09:06:24 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: kprateek.nayak@amd.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	jackzxcui1989@163.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [RFC PATCH RESEND 01/10] sched/fair: Do not set_rd_overloaded() if rd->online != env->cpus
Date: Fri, 11 Sep 2026 09:06:23 +0800
Message-Id: <20260911010623.2425196-1-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7735bbdb-2465-4ed3-9486-be9b82f3f42a@amd.com>
References: <7735bbdb-2465-4ed3-9486-be9b82f3f42a@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHEt4PVKNqmrcVCA--.41331S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy8GFWxWF1xCF1DKw4kZwb_yoW8Xr4kp3
	yxKayagF40qFyFyrWDZ3Z7u3yxArnrJF4jq3WrGFWYywnxC3s3Xr1rt3y5urZIgrn5Za1Y
	vrZ8KrWDuw1Fva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU6v38UUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbCvxCcpmqjVBD5IAAA3B

On Thu, 10 Sep 2026 14:00:43 +0530 K Prateek Nayak <kprateek.nayak@amd.com> wrote:

> Only two cases manipulate env.cpus:
> 
> 1. LBF_DST_PINNED: The CPU doing the load balancing clears itself from
>    env.cpus since pinned tasks cannot be moved to it and goes to
>    "more_balance" but "more_balance" does not recompute stats and never
>    reaches update_sd_lb_stats().
> 
> 2. LBF_ALL_PINNED: CPU with no movable task is cleared from env.cpus.
>    How will rd->overload being set for a CPU that cannot be helped make
>    newidle balance any more efficient?

The effective range of LBF_ALL_PINNED is specific to a particular src CPU
and a particular dst CPU, whereas rd->overload is indeed a global marker
that affects all CPUs with idle states. Regardless of whether case 1 has
been processed, it seems unreasonable to me that rd->overload could be
incorrectly cleared due to case 2, because the scopes of the LBF_ALL_PINNED
and ->overload flags are not equivalent.


>  Since LBF_ALL_PINNED is known with busiest's rq_lock held, maybe you
>  can set a rq->flag and later consume it in add_nr_running() to
>  do set_rd_overloaded() selectively.

If the global rd->overload is incorrectly cleared due to LBF_ALL_PINNED
from src (CPUA) to dst (CPUB), it is possible that CPUB may experience
no changes in nr_running for a certain period of time. Therefore, I think
modifying it in add_nr_running may not be appropriate. I'm not sure if my
understanding is correct.


--
Xin Zhao

