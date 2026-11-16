Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814893;
	b=WOIr+2+h/wsJdn3zUbuAu5A3ORcADsejpTksR9F3LbXXIrwbFLkl0cYHgE3VXTLOwQnD
	 9D4mqLBt53mVo70bCF9xyNEuqcE2t30eiae1ppYeGm1es0EcDg7fJXI3ECeW4JAbRzZnR
	 EZiRkPDJLwoAp1BUgEgTTgfYJPVmsH2bhaWEnu5dlIiwv57n04KOr+Wnk8tt+GrFXdiQs
	 Bnv3dKJFpBjeNBYTFHg1FwPg3KZbGWa6aoBLjRreYkRh6/Tjkl3rhiZwnCqokmh6Eb8Co
	 9Zhx7rw4MdSIqsL2q6XD2eSn+N6Hsfe7ZMOf2koZb6kSHVTkf53UqbI6ieN1R2eAQqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814893;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=MN2Q31ZBwTxSB7BpF4qizypCnzz2jwe96k4GDB7Z73E=;
	b=qOuYBlNhAUvmle77+IV2xB/RUd48OR06FeNxJZd6bIHAiY1VzYvu1+EO2aC9VNDz1OGa
	 66F6LIo1WE++kfNkDyGCL5opyrv6CxFznxHNou0V1Xe5MXcTZqu2/wDzOeOOpoy02+Cpa
	 RWao+IVV8hANrKXQ9btEkuE9jRLIDg3zcCZyL6Ln/PFl48hvzYnffCUGLywm5kFa80JX0
	 4mlLN0oPDV8Vr1HuJTWOi6hYB3i1JHf82S9FAZjK9XdSIJAnT5Tvsyt5C/lzf4UmIWDNs
	 GqTXtNumK6Hmoq4dqKZqZ2GcyuUDKjanK+dI8/XxFrvp74C+Mz3qemRaG5zizTZ8OEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kS4RN9rx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kcKJjymV;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B218606A899
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B218606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kS4RN9rx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kcKJjymV
Date: Mon, 16 Nov 2026 08:41:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794814889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MN2Q31ZBwTxSB7BpF4qizypCnzz2jwe96k4GDB7Z73E=;
	b=kS4RN9rxPU1n/+1+WYs3PmL7nb2luyx0bowGdZidk0jDvrwPGU9Fbq6sSJmURyKd7AXhgl
	4OMIMNdBQeYOYugHShQeeyHeNIWH8+EhAD+n5qfWLJxbTAKoNGA9hx9ZC45ZW+AkGqwnUb
	Z+qz3oLMyv9U6HBDY1NO7gV6rqa73f9U5ozrsCJF9R9vEX0zH1l6nBgW6FrwTQ+cCmd7gr
	cQQ841xNaxiLKkvvfFzdw2Qc6MqqZNwRECD5lQumWDhuJV6P73ays/9O5Di0laWcyn+YDe
	p19I7UhOSwn8wWGNStkJ3kETzi5ejZKaODskvXhiGawMMykM5V+k6QmtMhgF+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794814889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MN2Q31ZBwTxSB7BpF4qizypCnzz2jwe96k4GDB7Z73E=;
	b=kcKJjymVOTjCBVCTSqcHyrzaE9NKNAMZpRzmwj/98K3Rti1Z/0+ogVk6PbKUE6yyvFiT5p
	Nbxc51YOwsHHNuCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jiebin Sun <jiebin.sun@intel.com>, dennis@kernel.org, tj@kernel.org,
	cl@gentwo.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	linux-rt-devel@lists.linux.dev, tim.c.chen@linux.intel.com,
	tianyou.li@intel.com, wangyang.guo@intel.com
Subject: Re: [PATCH] lib/percpu_counter: allow concurrent sums with an rwlock
Message-ID: <20261116074127.XigdFZzW@linutronix.de>
References: <20261116015655.2744577-1-jiebin.sun@intel.com>
 <20261115191636.f18859e4dd5f58b9a33e7814@linux-foundation.org>
 <20261115194404.a8d751a7c17904c756b16b61@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115194404.a8d751a7c17904c756b16b61@linux-foundation.org>

On 2026-11-15 19:44:04 [-0800], Andrew Morton wrote:
> Modern rwlock_t does implement queuing, so the writer will get in
> there eventually.

On the queued-rwlock implementation, if a writer blocks on the lock then
the readers will wait until the writer is done unless the reader is from
interrupt.

There is also seqcount_t where the reader would be fine as long as there
has been no writer during the read and plenty of readers don't block
each other. It might take a while if the writer performs multiple
updates and the reader can't query all CPUs in time.
So it is not easy.

>                    But nothing is simple any more - there are
> complications with rwlocks on PREEMPT_RT and with interrupt-time reads
> (do we even do that?).

There are a few users from preempt/irq disabled section on PREEMPT_RT
which mandate something like raw_spinlock_t. The rwlock_t will break.

Sebastian
