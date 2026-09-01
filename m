Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB8411A02
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271750; cv=none; b=XODzmfLH5pwHbI1POCgSGrFJu0iYQsxm5aAQegJfynSNLPUCpD2PjSm/QCX396pfe3muXKMn+70kn/LeVXEWjmqn0rCdz+HSXmR96k0lbEbEg84DrUBld7Jbc4Eqd/fOjXDbLmEFdGESnbQKwefCpojlpVQ+sunl0NYsfhcfjmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271750; c=relaxed/simple;
	bh=FkjQ11aPc4ogEwGrxY1eOOlM78hvk0jZEuMzP9yUx24=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=laN3TcD2AdepUu0geVPwKLbXeWWRYPy5SxyImTpEuyUEIgS1+o2lCqmVA5pBWoOpEcBzacReewsPBJBE9KEN3z4c8yb+1fODsI655zSFbIcQVpebq7IzfXXLWXQ48tDqaRwybV17ofon26E/0BVsTI2rvoc2wYaTyNAtznGIrmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hHitjPMo; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=0/sM9MTw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hHitjPMo";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="0/sM9MTw"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788271745; bh=F87KvfN8gTAMs61cmM4FJcb
	IFa8qHGQ4IEksV1dDXUk=; b=hHitjPMoJ8RKhXpTuDEXzuLkVxSiiq5CedvdE3rRbldeDHzH/o
	s3QBwuoz0HlzkCIhnr+xJvoP7aF2lfZhnMVWLJSlHto3KzwhJjxykC7mtETlo14BPBarRGmeph9
	ojXbQEdo7kf58Tq6msdUdWxuivKtaV3+pVwn6iZXuFOvVT+bejIDXmfksBjRuIMhBOOb7T0E396
	6NlyS3dp1n23+WK3J3Ax+walH/LIWbEjMDe7gvACPnDCxTJ1W0MWzkTNfYvBJ6ROucQsuR+72V3
	5D4QR1EwIFChb1y0tGrhwIsqU+o370pMb4rEsQH6lKRPIDv/e1e2Y+idKcOoZAGV47Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788271745; bh=F87KvfN8gTAMs61cmM4FJcb
	IFa8qHGQ4IEksV1dDXUk=; b=0/sM9MTwX/r3oBB9R/HNfG6ls6qO6QJrd/7/P2zhdcHFvh9zpE
	pKnGlm6u9rfHb/SY3yqzVmlVrzV+hjWaYQDA==;
Date: Tue, 01 Sep 2026 15:09:03 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Frederic Weisbecker <frederic@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>, Bradley Morgan <include@grrlz.net>,
 Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kthread: remove worker->task self-assignment
In-Reply-To: <apbb--idnSZMNLPU@localhost.localdomain>
References: <20260829161150.16301-1-include@grrlz.net> <20260829161848.20635-1-include@grrlz.net> <apbI91PzT2BaRazM@localhost.localdomain> <20260901124900.GB687043@noisy.programming.kicks-ass.net> <CE1F7435-D872-4A3F-BC7A-50443BBE2904@mainlining.org> <apbb--idnSZMNLPU@localhost.localdomain>
Message-ID: <131DD326-86C3-4E40-B1CA-959F3E79D1C4@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 1 September 2026 15:06:51 BST, Frederic Weisbecker <frederic@kernel.org>
wrote:
>Le Tue, Sep 01, 2026 at 02:57:38PM +0100, Bradley Morgan a écrit :
>> On 1 September 2026 13:49:00 BST, Peter Zijlstra <peterz@infradead.org>
>> wrote:
>> >On Tue, Sep 01, 2026 at 02:45:43PM +0200, Frederic Weisbecker wrote:
>> >> Hi,
>> >> 
>> >> Le Sat, Aug 29, 2026 at 04:18:48PM +0000, Bradley Morgan a écrit :
>> >> > From: Bradley Morgan <brads@mainlining.org>
>> >> > 
>> >> > All kthread worker users now create their workers with
>> >> > kthread_create_worker*(), which sets worker->task before the worker
>> >> > starts. The self-assignment in kthread_worker_fn() is dead code
>now.
>> >> 
>> >> How could it be created before?
>> >> 
>> >> > 
>> >> > Remove it.
>> >> > 
>> >> > Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> >> > ---
>> >> >  kernel/kthread.c | 7 -------
>> >> >  1 file changed, 7 deletions(-)
>> >> > 
>> >> > diff --git a/kernel/kthread.c b/kernel/kthread.c
>> >> > index 63beb59b7a3d..18bc702e8d2d 100644
>> >> > --- a/kernel/kthread.c
>> >> > +++ b/kernel/kthread.c
>> >> > @@ -987,13 +987,6 @@ int kthread_worker_fn(void *worker_ptr)
>> >> >  	struct kthread_worker *worker = worker_ptr;
>> >> >  	struct kthread_work *work;
>> >> >  
>> >> > -	/*
>> >> > -	 * FIXME: Update the check and remove the assignment when all kthread
>> >> > -	 * worker users are created using kthread_create_worker*() functions.
>> >> > -	 */
>> >> > -	WARN_ON(worker->task && worker->task != current);
>> >> 
>> >> Should we keep a WARN_ON(worker->task != current) here?
>> >
>> >I vote yes! Paranoia is good :-)
>> >
>> 
>> 
>> Yeah, but it *should* be useless.
>
>Famous last words :-)
>

Hahahaha

>> Do you really want me to readd the warn
>> statement? Maybe add some text, like
>> 
>> "worker->task is deprecated"?
>
>Is it deprecated? We still need that field for wakeup on queue at least.
>Don't bother with a message, it's only a sanity check.

Okie, I did convert all the drivers as you can see, if you wanna give it a
lookie

>
>Thanks.
>
>> 
>> --- Thanks!
>>
>https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
>
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
