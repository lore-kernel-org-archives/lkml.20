Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A253330F924
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271062; cv=none; b=kGHpL2LYb9ldxcpgF8ifyoDsazrwKQ8yYmTzHeCCax7AbjC2pbbnJNSHGZbvUs182+5Mc3QRIMaQlEQACYL+IZ7EPFhyOVLgZ5sJGLuLgrz3vgec4Ul9f+Ixpe40Yu8GpngMjh5TNIu2mT04NJlsTct2cChd21+X43sl2j6qCPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271062; c=relaxed/simple;
	bh=ixbe243tF/MNSDUQ1+kzhmz2XEO/t4i08MEXWZ4CvNQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=kOiBy2Qz0539fckCtDQlgMCT5ZX4WFH5QqwppQvG1Sq9HZngPt+yZckqA1p651s8O3JgJhtawb4sT91TumTPJ+j5bqzQrXxR9hXQKH6cngTeRZvWkWMTwB5I1tPqvzSQw2a8zqDe5yZXvwY0H1Gltq/MGFBoRv1bbZUzIE3b1JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=W5LmyIIT; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=x3p10RnB; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="W5LmyIIT";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="x3p10RnB"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788271058; bh=hoyoj8aPMEJe4KNOlusVGJK
	W0kv72ypFecXyk9jVpAs=; b=W5LmyIIT5hVXPxyib6jRhDmF1RwI5YD3sM0eGR0AfcgQHvA/a5
	11KAJwA7JJfxLIoaK9TDNEndA9cl4RFbzjdU65n4n6ew7Q2F28BgO7CW13ohvVg2FYI+x+Bgh7T
	35Ber/kVkSDuB5K0cz5Ag/cplKcIzB9bWWdAStWD0H9VdsPqRSWtgef2iWC/9/ttCLB/RsnI4b0
	yNnLzx1pOFI9APkPX8vP5X32EVfO6Ptf60mHoprKD8PCYL8sy+jVp2gtcOOpCErw9azTm81XzYw
	I5ogkF9sBYytwE93GKz5rbjnALqwqjPh3Rib3eiCKH0N6pVL5heUh9LlezIHXb8kQPA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788271058; bh=hoyoj8aPMEJe4KNOlusVGJK
	W0kv72ypFecXyk9jVpAs=; b=x3p10RnB9shJWJgG/ZRgnmnnyf2I4/oruGGbIp0uKbIreCX58t
	AqxTRydbYdcRUjL4Ez+9Bf0gQfhU4Iv/CdBA==;
Date: Tue, 01 Sep 2026 14:57:38 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>
CC: Bradley Morgan <include@grrlz.net>, Tejun Heo <tj@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kthread: remove worker->task self-assignment
In-Reply-To: <20260901124900.GB687043@noisy.programming.kicks-ass.net>
References: <20260829161150.16301-1-include@grrlz.net> <20260829161848.20635-1-include@grrlz.net> <apbI91PzT2BaRazM@localhost.localdomain> <20260901124900.GB687043@noisy.programming.kicks-ass.net>
Message-ID: <CE1F7435-D872-4A3F-BC7A-50443BBE2904@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 1 September 2026 13:49:00 BST, Peter Zijlstra <peterz@infradead.org>
wrote:
>On Tue, Sep 01, 2026 at 02:45:43PM +0200, Frederic Weisbecker wrote:
>> Hi,
>> 
>> Le Sat, Aug 29, 2026 at 04:18:48PM +0000, Bradley Morgan a écrit :
>> > From: Bradley Morgan <brads@mainlining.org>
>> > 
>> > All kthread worker users now create their workers with
>> > kthread_create_worker*(), which sets worker->task before the worker
>> > starts. The self-assignment in kthread_worker_fn() is dead code now.
>> 
>> How could it be created before?
>> 
>> > 
>> > Remove it.
>> > 
>> > Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> > ---
>> >  kernel/kthread.c | 7 -------
>> >  1 file changed, 7 deletions(-)
>> > 
>> > diff --git a/kernel/kthread.c b/kernel/kthread.c
>> > index 63beb59b7a3d..18bc702e8d2d 100644
>> > --- a/kernel/kthread.c
>> > +++ b/kernel/kthread.c
>> > @@ -987,13 +987,6 @@ int kthread_worker_fn(void *worker_ptr)
>> >  	struct kthread_worker *worker = worker_ptr;
>> >  	struct kthread_work *work;
>> >  
>> > -	/*
>> > -	 * FIXME: Update the check and remove the assignment when all kthread
>> > -	 * worker users are created using kthread_create_worker*() functions.
>> > -	 */
>> > -	WARN_ON(worker->task && worker->task != current);
>> 
>> Should we keep a WARN_ON(worker->task != current) here?
>
>I vote yes! Paranoia is good :-)
>


Yeah, but it *should* be useless. Do you really want me to readd the warn
statement? Maybe add some text, like

"worker->task is deprecated"?

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
