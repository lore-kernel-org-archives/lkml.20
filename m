Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705816;
	b=WY1EkiI3ZVt4U9N4IzssODucPmCpNja49ouzPV8QIOT6LBWbywYSiKbQwogLwyyoJ5iu
	 iDEvldvMwM3cnBy7cOU23Rsg357w7Ow0xWdpKohG2EpBSV9aEtNu/QWsv31wUJDZG/2nn
	 y4EzuZIRoyDOJ6NsGKi0voBpx7T3+U0Ck/H1qhjNuF5/wGiIxcHqUVSHbFeaJ+cK2Dl3o
	 dmiG5jlPs5R80qLcSLL6j1zTc+ZY2fljtF0v6vGLO9ymma6EVXVlvVMyWe/77v33z66qd
	 DfMNDzN4gOQzg0tEeLGOVZTxcn0wCz4sWqVt4DGWsOEtAbrpcf3Orw1+HhtHG+J+6Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705816;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tP0eDm+K+Ts1AokzxU+OQjzFfPfzGLzzVFeOKFJstP0=;
	b=XJHGns3RuVN8xXoPGJ1d/ok1fvnZVA41xeOYT4I9NVfjC+q7dlcPzNxBcdtd4IisIF8W
	 oOUoEuUJZhK+BXhaWAZdtmR+D9srl8G4o6dqtMypOvaB4UNL+5NPnuWHGV2QE2TEE7AlF
	 RDX516Emqxqw7rc3yPPY2Kl73t4/T6OUb7uGPfaCZEBU7z6djaIjmuxPW5sp/tRuwvOPv
	 cU0KX42v4T4GZ7WhwFe+TLRg2LsrQnp2FoPIp8KxavdztW9Qj3jPyYarNt86DAsnYJ/bV
	 O6Wd+PpEwvODdgt8e/9t2FY+x7YOx2wSz8ajQjvIgfypBiIhYXt6MD3FbAKzOmrGvvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=A+AsFA6y;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA2606D80D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63FA2606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=A+AsFA6y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=tP0eDm+K+Ts1AokzxU+OQjzFfPfzGLzzVFeOKFJstP0=; t=1793705815; x=2109065815; 
	b=A+AsFA6yyhWIwKvxp9kD8jfPSj6GxBMTz+UTsEjZioton9vsFerthXTjgzou3GmatDXDSRzjHK+
	r2x3Z1n9qzZoJfpzmxhDNzRieETZ/aZyOkluDhX2QIVna63JVaj0/xP7B+W0aMxijEZvaLO1d4J5a
	KUuyy6vCFpOPga8z+06VWk7gGqm8SHOej3QzMO3pnSKDA2FpOOpJGdg1Y/fEpzgQtK5n/9p4ito2v
	M98SYZoBi6IrHGU/Fry7UJA23BdAeKWY7MVwZ2SoaHAlINyxrsoYSnLm+mXyQXYE/oxvt0osxz0dI
	nSRVhF4Fblzyx3Yy87YmNkEUyVvpLGKWxAiA==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xOCos-001AIl-PT; Tue, 03 Nov 2026 12:36:50 +0100
Message-ID: <9c0fcefa-a40f-4e01-8fab-c079d4697397@igalia.com>
Date: Tue, 3 Nov 2026 11:36:49 +0000
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
Subject: Re: [PATCH v7 3/4] workqueue: Add support for real-time workers
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Steven Price <steven.price@arm.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
 <20261022093848.5727-4-tvrtko.ursulin@igalia.com>
 <a3ae9a0f13e3972d0645f555bcc26f4f@kernel.org>
 <9d6add80-2ec9-4f29-a815-ad0e955f7b5a@igalia.com>
 <7fec5fa8362328bf3356a077a8bd9687@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <7fec5fa8362328bf3356a077a8bd9687@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 26/10/2026 18:37, Tejun Heo wrote:
> Hello, Tvrtko.
> 
> On Sat, Oct 24, 2026 at 09:33:42AM +0100, Tvrtko Ursulin wrote:
>> Can do. I'll get to it the week after next. (Tweaks to other patches in
>> the series as well.) Should I switch to a different base branch by then?
> 
> I just branched wq/for-7.5. That should work as the base.
> 
>> But if you are curious how much better strict
>> affinity makes them I can measure, it is not a huge effort.
> 
> Yes, numbers with and without strict affinity would be great.

Re-measured submit latencies on three relevant setups:

     us	   7.3.0   WQ_RT   +strict_affinity

    median    30      21          11
     min       2       3           2
     max     1038    941         108
    95pct    2384     49          28
    98pct    2922     63          51

I suppose we can interpret this in two ways. Plain WQ_RT is already a 
huge improvement, and although strict affinity is even better, the twice 
as good median probably isn't a huge selling point. So question is do 
tail latencies above the 98th percentile matter, or are they visible in 
the user experience. That I have no experience to answer.

FWIW I have locally split out the patch which adds strict affinity on 
top of WQ_RT so we can trivially go either way.

>> Hmm.. I could do that, but since the tool ships within the kernel does
>> it _need_ to have backward compatibility regarding kernel _internal_
>> implementation details?
> 
> It's just a nice-to-have, but other parts of the script already support
> older kernels, so falling back would be good if it doesn't add too much
> complexity.

Okay done.

Regards,

Tvrtko

