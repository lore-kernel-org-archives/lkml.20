Received: from r3-18.sinamail.sina.com.cn (r3-18.sinamail.sina.com.cn [202.108.3.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6724638B148
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687471; cv=none; b=kNQrpfSzcC5eiUDtmG1cdJmbF9SeGR0j0+POZUSQGw5HdoIEElYgS/cmPRAFzUQVR5CU0CfqwT5hl6hJnW4RM4g2HX+SeJa/oZJ1jDslnVr1pO0eIGo6xV0k66u6ryt+GZDB7f14gL2Hed0pafeBElYUnibl4ptRTJQrf4WPOu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687471; c=relaxed/simple;
	bh=msz3+xFX24caStgtDJpepoAqwbL5PlRhKoxnmHd8PnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFenzBOE/VgMco/JsbKcML98pTJndrBM13AlNkSpVlrymZ990gqU/UC0dSnNkq8Wc9pGX2o1BGD5t3um9GzAVy83kl1j07FAzntKPCTCCvjTHXeRkeBN8B3yx1NVqfsBZeZCJqntTfYsnr12ormasp+dPesVos8KE0HCSfsoZrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=oXlZ9BEQ; arc=none smtp.client-ip=202.108.3.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="oXlZ9BEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789687465;
	bh=wD3ix+GkvvUDsItvPW+fTEfQlpnEcapDfRBp/Zp7cn4=;
	h=From:Subject:Date:Message-ID;
	b=oXlZ9BEQeYn9TduTq6XKalA9V/CyZVy7gDka7DjBY7qv+ooD5DZ502KxcS0r5oMfx
	 NJ3JZhw4FPVbO3VYdLK50N2wknX3oE26XlhA6XxAyz1anPcH9r4kPb8V2Hy2ppZmSB
	 Aps84zRGCMXCEHJo8A/EtymBq5OW+sJCqs/Eikzk=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.32) with ESMTP
	id 6AAC769F000043A8; Thu, 18 Sep 2026 07:24:19 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8797334456770
X-SMAIL-UIID: F722E39483804F05854D24E375EE6576-20260918-072419-1
From: Hillf Danton <hdanton@sina.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org,
	Baoquan He <bhe@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	lirongqing <lirongqing@baidu.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] mm/vmalloc: Use dedicated unbound workqueues for vmap drain
Date: Fri, 18 Sep 2026 07:24:05 +0800
Message-ID: <20260917232406.148-1-hdanton@sina.com>
In-Reply-To: <aqwdc7Oh24b_bxOQ@milan>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 19:03:47 +0200 "Uladzislau Rezki (Sony)" wrote:
> On Thu, Sep 17, 2026 at 08:07:37AM +0800, Hillf Danton wrote:
> > 
> > Given numa node1 including cpu8-15 without cpu hotplug cared, a bound worker
> > for cpu9 can not migrate to any other cpu, while a unbound worker can run on
> > any cpu of node1, that is all.
> > 
> Right. 
> 
> <snip>
> 	if (list_empty(&pwq->inactive_works) && pwq_tryinc_nr_active(pwq, false)) {
> 		if (list_empty(&pool->worklist))
> 			pool->last_progress_ts = jiffies;
> 
> 		trace_workqueue_activate_work(work);
> 		insert_work(pwq, work, &pool->worklist, work_flags);
> 		kick_pool_pick(pool, &wake_task);
> 	} else {
> 		work_flags |= WORK_STRUCT_INACTIVE;
> 		insert_work(pwq, work, &pwq->inactive_works, work_flags);
> 	}
> 
> out:
> 	raw_spin_unlock(&pool->lock);
> 	if (wake_task)
> 		wake_up_process(wake_task);
> <snip>
> 
> wake_up_process(wake_task) - this guy takes care about task placement.
> For us it is TASK_FAIR thus select_task_rq_fair() decides the fate of
> unbound kworker.
>
At best an idle cpu is selected for the unbound worker, but it may be
preempted the next micro second. Maybe you disagree, eevdf means uncertain.

Even given an idle cpu without preempt, it fails to prevent the vmap
work from becoming a wart, no?
