Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164816;
	b=gRa6zSjOt8V85Juf5XQxeWx9+cpS2uqt1K/aEj19jIHeWcP4O9DmJl6GDBidd/PswK0Q
	 /icPdCeo2R9Uz3BM7u1cfPHVc66h7/X2ZEqKKCA6WiSzysTuElGz5bg0/k/oGTA0Yjvy/
	 XYMGHpaae+X3wqd1uQjSZQgHZQ6d7rpm94sbWX+0zFa2xlKXlfGzSgihPMxUalxgc3Ocs
	 wG+E5MMZCIhFKOM3rFvFW+uVYols99/nhiXqxuVzcKvDb3bYA7dnr5LD368tcumeCQuII
	 LbKmK+dEi7krn6JYbE3tbiNaGGZJT1Tt2Rzuwqd27O4FsWbuhbk6ulhzruz/cVjcsiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164816;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=Y4jPp9juh/bkku9sMbXXDzIqa6m97fcDaqqiz1Aksw4=;
	b=VGpr3kiKNRY7l0ZMkkxZyPxfde+Mhxpvr7sY6kH2NHInZDu+113EE85plQa7YFsMFVeH
	 gXri7x8D0gqkL+8WMretByo333QEn45ZInAEUo5i9vJHTHCZLpXQTOsW78k2PFihlzfL6
	 F/Y/rrvQhogSEXhvYJH2W3wAFaZ4+Gk82p6Edk9j24EJDYQshJU68KiI91p3u8bcWxkrp
	 gIrbV/04TXuRtE+TBuaEISVMJHv2mkn3OgPpYLA/iLDLoZRXUrV/8PjmOrvTj9oFPsx6s
	 0FDOT9dtyPLZMqMFvHTH+eImEFUO/tRFaIP6KiJKV/Og0KolDFvPf4GIbTtXaCWrjng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8077606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8077606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794164809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4jPp9juh/bkku9sMbXXDzIqa6m97fcDaqqiz1Aksw4=;
	b=NrdHTtooAs6m1/SmOz3PGy17hflYTuvCck1aaYxJid0a81n2cSU+T1CJY4DDYLJ91l2jYt
	Px46hUUR7jOTK9YPbS/cWb4bW8Kq4GzAp/2RWosZsEYvzBVk0CtiWqTzcoXvFaG/kYDidM
	ztu4nBghzODDtx9IZL+fRIoArxHlev4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-44-yKWDWf4vPNqt_xUOfT2J6Q-1; Sun,
 08 Nov 2026 14:06:46 -0500
X-MC-Unique: yKWDWf4vPNqt_xUOfT2J6Q-1
X-Mimecast-MFC-AGG-ID: yKWDWf4vPNqt_xUOfT2J6Q_1794164804
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F3AEA19560B2;
	Sun,  8 Nov 2026 19:06:43 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B73F63001DA5;
	Sun,  8 Nov 2026 19:06:41 +0000 (UTC)
Message-ID: <a7919797-0146-48df-8549-fe36f7024e60@redhat.com>
Date: Sun, 8 Nov 2026 14:06:40 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] cpuset: empty sched domain with isolcpus=domain, panic at
 CPU offline
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Guopeng Zhang <guopeng.zhang@linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 Valentin Schneider <vschneid@redhat.com>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261108145744.1532128-1-mathieu.desnoyers@efficios.com>
 <12cb0bee-57aa-4609-bc2e-77806e0b6805@redhat.com>
 <20261108184620.1548615-1-mathieu.desnoyers@efficios.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20261108184620.1548615-1-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 11/8/26 1:46 PM, Mathieu Desnoyers wrote:
> On 2026-11-08 13:35, Waiman Long wrote:
> [...]
>> Yes, we are going to add the check to make sure that there will be at
>> least one housekeeping CPU left for the top_cpuset sched domain.
>>
>> See
>> https://lore.kernel.org/lkml/20261105130344.664336-1-guopeng.zhang@linux.dev/
> Thanks, I had missed that series. Refusing such a partition is a better
> fix than giving the top cpuset no sched domain.
>
>> This patch is correct AFAICS. I am not against it but it may not be
>> necessary after we make sure that there is at least one HK online CPU in
>> the top sched domain.
> Then I will drop my patch and rely on Guopeng's series. I can test its
> v3 on the setup that hit the panic: 5 vCPUs with isolcpus=domain,0,1.
>
> By my reading, your _cpu_down() patch covers a case that cpuset cannot
> fix. With no partition, the last online housekeeping CPU could go
> offline. No partition could then give one back.

Yes, that is the point.

Cheers,
Longman

