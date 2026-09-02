Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79734A0F10
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358339; cv=none; b=SY8voLwFyUV3sQC+d1ayBrcLx2PZBfRQ2lQ0dOvYERat+4MtRtHjqD4YvKjBjNJTc73T4vDkeAf18eBJaHgORmL8poWEZzRYVzepT40F+g2ICMWBLmropCwYoq/cx4KFFsIBJV/4N/aQ1Y7yOwE5/VGJbNZNEbQubM30Uro6fDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358339; c=relaxed/simple;
	bh=W8xp2FSRu0yGVRvtO/3LO/NBdRj1+JbGtTTy71kMd98=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZR1ACBiy0FCUMJHJG4gyit0oLZN1dp2JnHTAA1xNjvvCx4PSI6h+vTF6gb4rIb9msmcdNVEAfXxU7yBmjj+GBKPxaSHCrf/8CwcL/A6fhR2SykRRV0KIodFwx/yaIRFSooWDogCO4okfauxnz50IgWVCm/fyoDEIziI6L2HM2Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QITQ+o35; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OOlOXFZM; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QITQ+o35";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OOlOXFZM"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788358322; bh=d8kFkmujZrpUwgirGTl6dX+
	HWf0NxWnLb2A7Abcnnjo=; b=QITQ+o35ZB1KAsPv1MkCi9ftVC1tuqwO6zm6G1o+hKqC7dYy+a
	Pc3TrbD5ZKWMkRvh326/uI1h3aaORv+MmmJ1FyGDI6tzaY7tXMaSBGlkOI2Jei6L81xjbImlDq7
	MKhf/CagPOhunT5edNFGlYshtZINhMuVfHOwHat5nG1g/y2BzM/i1OA/gg5WkC6culV3KEGK9kh
	A8dqzJxUfRyloGw1c8v5Gk+pTXQWsM56fCnMFDoAwwvWFsFXuCwSGsgPrp613NfvHIuCECwIBM4
	MDSGgiJzxv4UwBaVLY3T5tyVYiL6192QTGpe2cy10wl35KGLpEgsDVkFkOLZjlfzr7w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788358322; bh=d8kFkmujZrpUwgirGTl6dX+
	HWf0NxWnLb2A7Abcnnjo=; b=OOlOXFZM9DEJLIflQe329mQhvIRONCTwIPl8QI3sjwi88YOZpu
	xcZ0TnwpVmdPkmN/dp9z+CqWonlBhauvFVCg==;
Date: Wed, 02 Sep 2026 15:11:58 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Frederic Weisbecker <frederic@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>, Bradley Morgan <include@grrlz.net>,
 Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kthread: remove worker->task self-assignment
In-Reply-To: <apguAeUgLfOcHOdV@localhost.localdomain>
References: <20260829161150.16301-1-include@grrlz.net> <20260829161848.20635-1-include@grrlz.net> <apbI91PzT2BaRazM@localhost.localdomain> <20260901124900.GB687043@noisy.programming.kicks-ass.net> <CE1F7435-D872-4A3F-BC7A-50443BBE2904@mainlining.org> <apbb--idnSZMNLPU@localhost.localdomain> <131DD326-86C3-4E40-B1CA-959F3E79D1C4@mainlining.org> <apguAeUgLfOcHOdV@localhost.localdomain>
Message-ID: <902ACAD4-A441-4B8E-B4B2-F2E12E54924D@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 2 September 2026 15:09:05 BST, Frederic Weisbecker <frederic@kernel.org>
wrote:
>Le Tue, Sep 01, 2026 at 03:09:03PM +0100, Bradley Morgan a écrit :
>> On 1 September 2026 15:06:51 BST, Frederic Weisbecker
><frederic@kernel.org>
>> wrote:
>> >Le Tue, Sep 01, 2026 at 02:57:38PM +0100, Bradley Morgan a écrit :
>> >> On 1 September 2026 13:49:00 BST, Peter Zijlstra
><peterz@infradead.org>
>> >> wrote:
>> >> >On Tue, Sep 01, 2026 at 02:45:43PM +0200, Frederic Weisbecker wrote:
>> >> >> Hi,
>> >> >> 
>> >> >> Le Sat, Aug 29, 2026 at 04:18:48PM +0000, Bradley Morgan a écrit :
>> >> >> > From: Bradley Morgan <brads@mainlining.org>
>> >> >> > 
>> >> >> > All kthread worker users now create their workers with
>> >> >> > kthread_create_worker*(), which sets worker->task before the
>worker
>> >> >> > starts. The self-assignment in kthread_worker_fn() is dead code
>> >now.
>> >> >> 
>> >> >> How could it be created before?
>> >> >> 
>> >> >> > 
>> >> >> > Remove it.
>> >> >> > 
>> >> >> > Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> >> >> > ---
>> >> >> >  kernel/kthread.c | 7 -------
>> >> >> >  1 file changed, 7 deletions(-)
>> >> >> > 
>> >> >> > diff --git a/kernel/kthread.c b/kernel/kthread.c
>> >> >> > index 63beb59b7a3d..18bc702e8d2d 100644
>> >> >> > --- a/kernel/kthread.c
>> >> >> > +++ b/kernel/kthread.c
>> >> >> > @@ -987,13 +987,6 @@ int kthread_worker_fn(void *worker_ptr)
>> >> >> >  	struct kthread_worker *worker = worker_ptr;
>> >> >> >  	struct kthread_work *work;
>> >> >> >  
>> >> >> > -	/*
>> >> >> > -	 * FIXME: Update the check and remove the assignment when all kthread
>> >> >> > -	 * worker users are created using kthread_create_worker*() functions.
>> >> >> > -	 */
>> >> >> > -	WARN_ON(worker->task && worker->task != current);
>> >> >> 
>> >> >> Should we keep a WARN_ON(worker->task != current) here?
>> >> >
>> >> >I vote yes! Paranoia is good :-)
>> >> >
>> >> 
>> >> 
>> >> Yeah, but it *should* be useless.
>> >
>> >Famous last words :-)
>> >
>> 
>> Hahahaha
>> 
>> >> Do you really want me to readd the warn
>> >> statement? Maybe add some text, like
>> >> 
>> >> "worker->task is deprecated"?
>> >
>> >Is it deprecated? We still need that field for wakeup on queue at
>least.
>> >Don't bother with a message, it's only a sanity check.
>> 
>> Okie, I did convert all the drivers as you can see, if you wanna give it
>a
>> lookie
>
>Do you have a link to that?
>
>Thanks.

uhh, they should be all in-reply-tos, so if you search for my series in
lore, this patch replies to all of the conversions




>
>> 
>> >
>> >Thanks.
>> >
>> >> 
>> >> --- Thanks!
>> >>
>>
>>https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
>> >
>> >
>> 
>> --- Thanks!
>>
>https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
>
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
