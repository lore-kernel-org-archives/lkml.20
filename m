Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596108;
	b=zRok3i8vOlwxJzF3LcWyekmPQ2+kei3bB/3rBUZE9HMeWT+wieLgtu3XfUFe5NQgX7B2
	 VlKOTFLmYIy8P1SdpiW2/WY6qcC1B/l/6BHkeOtWQHxMARWvQ0KXX6p8y0qnvMMcIAz8U
	 0bTuwnWMhHz53cJ7ols2Xn0jZC9lZ5V/XToZFwBqLyzXqlPXplpgp8MyXQ6Ye+4gb1vfh
	 hiy6IXDXVNrnWiD9033dd9UuMQq9ErcNHiIWtnIXKOx3Wm3WJjI4hbmFxI0xbvUgJmstV
	 F7PJ/BA8HrOhLvrKOgypHZI7xAC4pv5Du4lBmyVOqi88Znp0XyEan84AoXZDM2V1utQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596108;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=BcrLf+fKvCDZLJVHwxWDNcg9lI0S80RxQeTmRhxWCLQ=;
	b=qvkkdPoIl8cXYb3/uEhMDN7t5eFuQxu1FUkKt1ytX16CCxv5CuesqCehDhGPQcYgixqA
	 i4YE0qLH4EQDaOFjJNdQvzqBqBPa2M5yAyBzhczydecGtUMLeAX/rqummGThlAVLHM7mz
	 J/ISD8e57/zjhIRV3EfyAlNBbuSYJi1TbW88WZ8OeSdEjO7K1qhavbp4+QtY9MlFgipCf
	 G6MutX1PIqiwAfHrub3amdt0mKYxHviRHNjJ7Yw7j8kS+Nm+YO19NW+OJxMG1AmT5vsg7
	 GwyAsPSguclgS4QvaJEVz5EC7KFF2/aQvbMW+LF/krgOFClp2IhZWpUSQjKUa/cO2zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b="T/I3v9sf";
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22A4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=T/I3v9sf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1792595544;
	bh=BcrLf+fKvCDZLJVHwxWDNcg9lI0S80RxQeTmRhxWCLQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T/I3v9sf6j6ushbTNZ/sKNbAKC/1/PAV5wnjfhydtJHIL2/nkLnssiFuOfnAKJFVi
	 CfvTLXztYSmxGWa1jROLtp/AY87dxcv34kSpeNNCzEOOh0VuErTx6nk7/1mESgoZ0b
	 sTY7xaUBLjFTeGTNu3LuDxnHKENiTJAh8RDzCkXU=
Received: by gentwo.org (Postfix, from userid 1007)
	id EE131406DB; Wed, 21 Oct 2026 08:12:24 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id EAD624014B;
	Wed, 21 Oct 2026 08:12:24 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:12:24 -0700 (PDT)
From: Shubhang <sh@gentwo.org>
To: Christian Loehle <christian.loehle@arm.com>
cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Juri Lelli <juri.lelli@redhat.com>, 
    Vincent Guittot <vincent.guittot@linaro.org>, 
    Dietmar Eggemann <dietmar.eggemann@arm.com>, 
    Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
    Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
    K Prateek Nayak <kprateek.nayak@amd.com>, 
    Connor O'Brien <connoro@google.com>, John Stultz <jstultz@google.com>, 
    Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
    "Christoph Lameter (Ampere)" <cl@gentwo.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/core: Use the scheduling context for remote
 ticks
In-Reply-To: <a6c27dc2-ea8b-4c33-8c16-088d7501f9ac@arm.com>
Message-ID: <6acc6595-60aa-94b7-6316-f82ab635f985@gentwo.org>
References: <20261016-remote-tick-proxy-v1-1-272757a50a07@gentwo.org> <a6c27dc2-ea8b-4c33-8c16-088d7501f9ac@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Christian,

On Mon, 19 Oct 2026, Christian Loehle wrote:

>
> The sashiko review looks legitimate, mind picking that up, too?
> https://sashiko.dev/#/patchset/20261016-remote-tick-proxy-v1-1-272757a50a07%40gentwo.org
>

Thanks for pointing this out. You are right, the full-nohz interval
sanity check also assumes that rq->curr is the scheduling context.
Under proxy execution, curr->se.exec_start can be stale before the
accounting path updates it.

I will fold this into v2 by using rq->donor for both the idle check and
the exec_start calculation, along with the nit fixes.

Thanks,
Shubhang Kaushik
