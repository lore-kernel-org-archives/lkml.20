Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D35559300
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711199; cv=none; b=UHgKzGNWKzoH4Q2sr8RnWl+4+q3paJDmHlyiIueWDR78jx3x9xxUJ7V812koYdKI8Nd3STuA2ykqlzcU/1GUcSmGM20sGMCB3NXuMSVzE7oywJwuNSqNHhfS4WUoa2WN42A0+26NqHe1qXsF0unGIedKuzsh3h4YqzoM+7D27nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711199; c=relaxed/simple;
	bh=oBHP03uaAI4xE9Ucw+ZO1sn0UOMOxyOoZZqxP3Mxonw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFXXTq16CHJbCqcSUXC4UmiPdy0w7OF99mL9fjtOYO9YcI7vTxTHQEjSDiQlt1W/te5soDtTqoaqUa1lbHOQICawqURvOnuRyK+SB4JjsooYFhlYftdt8UoDcdLq+jynGnUc3HZPlrvNGNdOEVhtF/S2jiXbgpPfYdLwbx6wp28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gMXe3AMJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gMXe3AMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790711197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F6Bhw/LhKNlT8N8V5TmexdXj2GLS7KtsaEL7tMX2/dc=;
	b=gMXe3AMJbY63uXMHBx+Jb6j5slZyBwkldcnwbQXHM4Jy57AkJxJg6B86+KBI1CaixNuPWu
	oxUheQr9CNoZ/33UCz4et7ssVAPpJz0cmregy0c4doK7ui96yTYeoB8CYjCwhqNs2SLmep
	YgkU9o56qRiW6Kcplk5qyaN3i9n8yW8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-ugywx-MhNgiAfmrjfDG_Xw-1; Tue,
 29 Sep 2026 15:46:30 -0400
X-MC-Unique: ugywx-MhNgiAfmrjfDG_Xw-1
X-Mimecast-MFC-AGG-ID: ugywx-MhNgiAfmrjfDG_Xw_1790711189
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE0C0192E257;
	Tue, 29 Sep 2026 19:46:27 +0000 (UTC)
Received: from [100.91.18.181] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5EE631956047;
	Tue, 29 Sep 2026 19:46:24 +0000 (UTC)
Message-ID: <500cb19a-549b-4055-a807-c3c40da787ae@redhat.com>
Date: Tue, 29 Sep 2026 15:46:23 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] cgroup/cpuset: Protect is_in_v2_mode() in
 cpuset_num_cpus()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrea Righi <arighi@nvidia.com>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Tejun Heo <tj@kernel.org>,
 David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
 Ridong Chen <ridong.chen@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>,
 sched-ext@lists.linux.dev, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260929084124.626693-1-arighi@nvidia.com>
 <20260929084124.626693-2-arighi@nvidia.com>
 <20260929-making-language-254d9c6a6605@there>
 <af938567-01d2-4518-8f7e-974828e25d3e@redhat.com> <arv2-3-6-Ewv0gpb@gpd4>
 <b8f66cbe-bb1e-4148-b2e2-55bd95f1c8d1@redhat.com>
 <20260929190853.GE88198@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260929190853.GE88198@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 9/29/26 3:08 PM, Peter Zijlstra wrote:
> On Tue, Sep 29, 2026 at 02:10:40PM -0400, Waiman Long wrote:
>> On 9/29/26 1:35 PM, Andrea Righi wrote:
>>>> I think it is simpler to just change is_in_v2_mode() to cpuset_v2(). Almost
>>>> all the cpuset functions should either take the callback_lock with interrupt
>>>> disabled (which is a RCU read-side critical section) or with rcu_read_lock()
>>>> and cpuset_mutex() acquired. This cpuset_num_cpus() function is an
>>>> exception. Given what is said in the comment, this function is not supposed
>>>> to be used with v1 mounted. We should change it to cpuset_v2().
>>> The comment says that, outside cgroup v2, cpuset_num_cpus() falls back to
>>> num_online_cpus(). However, on v1 with cpu and cpuset mounted together using
>>> cpuset_v2_mode, it returns the group's effective cpuset count and fair.c uses
>>> that count in the default "concur" group share calculation and in "max" mode.
>>>
>>> So replacing is_in_v2_mode() with cpuset_v2() would change scheduler behavior
>>> for that setup. I guess we could either preserve the current behavior, fix the
>>> comment and protect the root lookup with RCU; or make the code follow the
>>> documented v2-only behavior. Which one would you prefer?
>> I will let Peter decide if he wants to support the cpuset_v2_mode mount
>> option of cgroup v1 since he is the original author of cpuset_num_cpus(). If
>> this is supported, we have to update the function comment as well.
> So I was not aware of this weird mount option at all. That said, ideally
> it would work in the widest possible setting.
>
> The main constraint is going from a cpu-cgroup to a cpuset-cgroup. It
> was my understanding that this transition only works in v2, but if that
> mount option is sufficient to make that cross-cgroup transition
> meaningful, then yay I suppose.

The cpuset_v2_mode mount option is only for making the cpuset.cpus and 
cpuset.mems behave like in v2. The cpu-cgroup and cpuset-cgroup can 
still be in separate hierarchies. If cross-cgroup transition is the main 
point, it won't work with the cpuset_v2_mode mount option. We should 
switch to use cpuset_v2().

Cheers,
Longman

