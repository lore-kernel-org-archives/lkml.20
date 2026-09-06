Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn [202.108.3.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9694A23
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 03:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666661; cv=none; b=YIOe7O+PJCWJGE2b/+xy2p/C93GsCuXi4byH2rP/zlfPPFNtOx3YI7OUGQ5IxtziaEpMpeL3pP9VeJHy/9beWcsRHMSVJ+9zRp+u7W1l7n8QSObVv7kBjRN3ZuFEqXY4RtzgqCWR0JinnGp3GlP7/7VU1OFHqwNIHB5AnB/NXek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666661; c=relaxed/simple;
	bh=U8xHrBZ7Q3BQXgnr2L0uMBgk7gt6wGxE+ax6mXKRsWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mphFIKt/Qe3EaixxyK/AGHfSf75YvqQW5WKddJ4JQ3OaHxlATdwJZQ4i0rvYqJOSyv7HTmoOjs6KGZvaNcNU85q3q1X9tM+9bpOi3mwUsCBX3H7oLcBVrtZfLKHaz6qB6LYMB4sa3A/phM9oZyzgwBzZUniWuGJxmZgsdRHb2P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=JN/5gj5E; arc=none smtp.client-ip=202.108.3.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="JN/5gj5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788666651;
	bh=PQxvNMzas3x+IlCCh6neBcmKorR8pDTgu0p5/v3lP/I=;
	h=From:Subject:Date:Message-ID;
	b=JN/5gj5Eb/xmgetxCpF9/zxwdSUoRmba42u/q3L2Y/M4MgsRGtoKG7NkNPZeTaEkH
	 N1iD3dk63nL/qyFj6IPbu5vJ6zHo2TAGGWjxhoNRq99sIySsfqEYEtvz8i9uhHjBra
	 RR06aYgCYuUb9Xz6fTpbBDCFtfts0djB46Z9uStc=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.32) with ESMTP
	id 6A9CE30D00007E2F; Sun, 6 Sep 2026 11:50:40 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 6954354456958
X-SMAIL-UIID: 553362F731704953BFFB61FDF2BADA41-20260906-115040-1
From: Hillf Danton <hdanton@sina.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: linux-mm@kvack.org,
	Baoquan He <bhe@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	stable@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>,
	Ye Liu <ye.liu@linux.dev>,
	lirongqing <lirongqing@baidu.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] mm/vmalloc: Use dedicated unbound workqueues for vmap drain
Date: Sun,  6 Sep 2026 11:50:24 +0800
Message-ID: <20260906035027.2106-1-hdanton@sina.com>
In-Reply-To: <20260905152717.11711-1-urezki@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 5 Sep 2026 17:27:17 +0200 "Uladzislau Rezki (Sony)" wrote:
> drain_vmap_area_work() function can take >10ms to complete
> when there are many accumulated vmap areas in a system with
> high CPU count, causing workqueue watchdog warnings when run
> via schedule_work():
> 
>   workqueue: drain_vmap_area_work hogged CPU for >10000us
> 
> Move the top-level drain work to a dedicated WQ_UNBOUND
> workqueue so the scheduler can run this background work
> on any available CPU, improving responsiveness. Use the
> WQ_MEM_RECLAIM to ensure forward progress under memory
> pressure.
>
If the dedicated worker will run for 4ms on CPU2 before the tick irq kicks it
off cpu, the system event worker on CPU2 has to wait at least for 4ms to handle
200 events for example in 1ms, the net effect is the same as the current scenario
where 200 events wait for the drain_vmap_area_work to complete on CPU1.

Different workers does not help to dramatically decrement the micro seconds
the drain_vmap_area_work takes.
