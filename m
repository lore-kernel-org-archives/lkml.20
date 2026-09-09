Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn [202.108.3.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD472C21DF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916158; cv=none; b=R0507+hItnOy6fWYxMvMupUdzx2m6iYFZ90++FOcXDhb1Gueav6GvSwiif7DTDa+SRieX3IRu94nEfVFTcSLwj1fMr5XjdxOwRcovY7DpVcNi13IUQrO5ZpXxIRfnhq/aOBPFqDSeOWOB4CYcFmoSE+RxpqgvEr8hFWNV6A8Ncg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916158; c=relaxed/simple;
	bh=aQowoTGQqSyOF/Tyb4NHF8n4jAPlDJP3PbL73wQE+pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bSWrYo0HKWLKhoZulojYTv2qq3gcD6lDpsWrsWGV2RhjQTTtPLNLjZKqwCWKs47indK2RhEOCebGtpXFSVzO1RAeSdzWTfCC68XFz8+oPnYjKz+8rBczP3a9ro82k9T8Ky4iNGLG18rOgPPFriDnDtO5/iumf3xxvxlkZBblFqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=jghY2Nfp; arc=none smtp.client-ip=202.108.3.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="jghY2Nfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788916153;
	bh=aHVS8CUETuqc99kyRiaPpcp6T76S/sIyd8jzjUtNfVk=;
	h=From:Subject:Date:Message-ID;
	b=jghY2NfpEoAd/ZtwMAWsGg4ZseZabbNokR5y0Rss1i6qQwIVvl0tNa9AZnOkcSb3/
	 DBnX/UvHE3aN19fSwO2hbe+gCxdTtoB/cyk+oyWF3Hv/YcoWbNuPrcMhx0XqHLzVNA
	 ucK96ITCPFOmxZJU5V0k7RjtpAXdvqebb2cp/tSg=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.33) with ESMTP
	id 6AA0B1AB00002892; Wed, 9 Sep 2026 09:09:02 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 6773796685274
X-SMAIL-UIID: F295AA5A7FAC4670AF833F38B4C45503-20260909-090902-1
From: Hillf Danton <hdanton@sina.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org,
	Baoquan He <bhe@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	lirongqing <lirongqing@baidu.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] mm/vmalloc: Use dedicated unbound workqueues for vmap drain
Date: Wed,  9 Sep 2026 09:08:50 +0800
Message-ID: <20260909010851.613-1-hdanton@sina.com>
In-Reply-To: <aqAZ4H8mauWw4JVM@pc636>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 8 Sep 2026 16:21:20 +0200 "Uladzislau Rezki (Sony)" wrote:
>On Sun, Sep 06, 2026 at 11:50:24AM +0800, Hillf Danton wrote:
>> On Sat, 5 Sep 2026 17:27:17 +0200 "Uladzislau Rezki (Sony)" wrote:
>> > drain_vmap_area_work() function can take >10ms to complete
>> > when there are many accumulated vmap areas in a system with
>> > high CPU count, causing workqueue watchdog warnings when run
>> > via schedule_work():
>> > 
>> >   workqueue: drain_vmap_area_work hogged CPU for >10000us
>> > 
>> > Move the top-level drain work to a dedicated WQ_UNBOUND
>> > workqueue so the scheduler can run this background work
>> > on any available CPU, improving responsiveness. Use the
>> > WQ_MEM_RECLAIM to ensure forward progress under memory
>> > pressure.
>> >
>> If the dedicated worker will run for 4ms on CPU2 before the tick irq kicks it
>> off cpu, the system event worker on CPU2 has to wait at least for 4ms to handle
>> 200 events for example in 1ms, the net effect is the same as the current scenario
>> where 200 events wait for the drain_vmap_area_work to complete on CPU1.
>>
> It is scheduling decision. We do not want to tune any prio here.
>
The difference your patch makes was checked without prio cared.

>> 
>> Different workers does not help to dramatically decrement the micro seconds
>> the drain_vmap_area_work takes.
>The problem of current approach consists from at least two problems:
>
>- doing progress under memory pressure;

Though in general a long running workqueue work is a wart, exceptions exist when
mm is tight. Just like kswapd that becomes a cpu hog, it is the right thing to do
for drain_vmap_area_work to take more than 20ms.

>- do not schedule all workers on current CPU and let schedule to find
>  the most attractive CPU from its point of view. For example: less busy
>  RQ, less energy consuming CPU and so on
>
Nope as UNBOUND has nothing to do with cutting the micro seconds the
drain_vmap_area_work could take.
