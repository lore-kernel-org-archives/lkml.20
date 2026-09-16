Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn [202.108.3.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B44A23
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789517571; cv=none; b=cesZoFWiG+R8delhEWmqrdz5EIRjYZuqQy4Ax2cUdVcKffOyM/61qqr2fuwHovCyNwE/SjV+fx6dhMJfpRFF9TDCNH9XNZpMGcSN8Ch/PTtLr/PN+C4n//fol6CmkVC/X23ooNhdCT8NaJC66dXhpMn980Cdmw6xg+loZEz0S6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789517571; c=relaxed/simple;
	bh=+zezOdaVQZDUSDeTIXDTyQ5Babri8VTyESjstzjGPok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVA8Zv9YdwpDVgAuo1NMIQxRwlYDP7OMp26btjk2XA5qQWEzYQvJUHcPsbVjDEwjVWTqcU62Oz/BraHBMlf4sq5MQf4s+RvjWeuxplk3jUCEVvLKb+ljHF8aQEpb5EL4/8lhfXDrqiKsVUpeEZzsY5qXQFNRyJ6tMUlM5RfdhuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=RpsowUqJ; arc=none smtp.client-ip=202.108.3.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="RpsowUqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789517567;
	bh=GY582zb6QHNiPHqk891VTICodNqo3q7sniFUVog2xDc=;
	h=From:Subject:Date:Message-ID;
	b=RpsowUqJdADB3w/vIoWD4juCJIhyzympusWO0umL2+0tjbxSd71HsVw1r+vg4zJUn
	 Inil9sAJNDxjAZB8QLE15+Q9XaVTpETworqUNekLn/VA08ux55SEb7F9U7DnP+VUIk
	 mVjETozo8RwNHy3HcDbuL7ccrqOSXUQ+r9MHhCck=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.33) with ESMTP
	id 6AA9DEF600002A55; Wed, 16 Sep 2026 08:12:42 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2824336685594
X-SMAIL-UIID: D3AD1081AC674FDBBE6D223CF7F2172A-20260916-081242-1
From: Hillf Danton <hdanton@sina.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org,
	Baoquan He <bhe@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	lirongqing <lirongqing@baidu.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] mm/vmalloc: Use dedicated unbound workqueues for vmap drain
Date: Wed, 16 Sep 2026 08:12:27 +0800
Message-ID: <20260916001228.644-1-hdanton@sina.com>
In-Reply-To: <aqgnOoOjWxRtaqxZ@milan>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Sep 2026 18:56:26 +0200 "Uladzislau Rezki (Sony)" wrote:
> This patch does not use queue_work_on() semantic thus i do not want to
> queue all helpers on current CPU. Instead scheduler does balancing and
> that is it.
> 
[Fair queue in the Eric Dumazet accent]

+static bool
+schedule_drain_vmap_work(struct workqueue_struct *wq,
+		struct work_struct *work)
+{
+	if (wq)
+		return queue_work(wq, work);
+
+	return false;
+}
+

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/workqueue.h#n697

static inline bool queue_work(struct workqueue_struct *wq,
			      struct work_struct *work)
{
	return queue_work_on(WORK_CPU_UNBOUND, wq, work);
}

queue_work_on
  __queue_work
	if (req_cpu == WORK_CPU_UNBOUND) {
		if (wq->flags & WQ_UNBOUND)
			cpu = wq_select_unbound_cpu(raw_smp_processor_id());
		else
			cpu = raw_smp_processor_id();
	}
/*
 * When queueing an unbound work item to a wq, prefer local CPU if allowed
 * by wq_unbound_cpumask.  Otherwise, round robin among the allowed ones to
 * avoid perturbing sensitive tasks.
 */
static int wq_select_unbound_cpu(int cpu)
{
 	pr_warn_once("workqueue: round-robin CPU selection forced, expect performance impact\n");
}

> Or you prefer to tight all helpers on local CPUs? What is you concern?

Who blamed kswapd when it became a cpu hog, given it behaves the same way as
a UNBOUND workqueue worker, regarding cpu affinity? Given kswapd is acceptable,
why is vmap work blamed? Unfair.
