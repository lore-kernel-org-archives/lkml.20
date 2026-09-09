Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77661563FD3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965898; cv=none; b=WyWOdk0muh3Ron6EZvynhkS/ujJJTPItSVped/bI187bVyDWe2gKSv8mROanzu0jXXj5qXcz6aaQu5apD+fGVQx3ggtzyAe/DrUhJoTCLZ94k0lpv2bIfDTbr3hP9p5p633RYbfOQcxYL8TTWkqvyYBR13kjN/BdgFoCTj1G0qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965898; c=relaxed/simple;
	bh=Xp6trsSh3m7EN8x0vMQH53fdSs0qEHtRyw5PiwATJbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=huFua5CyvCBrjlPkrqtPLUmOhxGHmqhRcRmnAyrmanpX/N/0fz9ynH8UhmswL/FoDGac7X3uAOaV+9UTJfTCkHfenWgGXxKWuXO5zyxD3K1UiNNEEaKpR+nPNCh2aI60Tp/XD/IXjMMPb7GeRwpwXpoX651nAt0p/lfRzMeA8Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RlNCVnj8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RlNCVnj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788965895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A1tBPoTvJJGWpoa2CB8H27NLTQGI80U3CaY+Um2hcGA=;
	b=RlNCVnj8XIS4E5SS7RwTsZn+iSGHeN+9w41me+kiISv3D1+EtlQ+Tr/AbV8C46g6Om3L01
	uXhO1dVOMrmDTW2GPGuezQPtSrr9No/dREQeY5HslkrsTmViDTcfVdl8wH7Dsky/6cT6Nl
	yxaf/JktcdfjuNuRqWGxO8Vmjo9NlAc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-331-jZzBZeYCMhmB25kHhIGhMw-1; Wed,
 09 Sep 2026 10:58:04 -0400
X-MC-Unique: jZzBZeYCMhmB25kHhIGhMw-1
X-Mimecast-MFC-AGG-ID: jZzBZeYCMhmB25kHhIGhMw_1788965882
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B7731954AED;
	Wed,  9 Sep 2026 14:58:02 +0000 (UTC)
Received: from [100.91.18.181] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8F7311955F19;
	Wed,  9 Sep 2026 14:57:59 +0000 (UTC)
Message-ID: <f702db47-7039-4bef-9267-ea83c0cb0b1b@redhat.com>
Date: Wed, 9 Sep 2026 10:57:58 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 next 1/9] locking/osq_lock: Add some comments about how
 it works
To: David Laight <david.laight.linux@gmail.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-2-david.laight.linux@gmail.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
In-Reply-To: <20260907084133.3696-2-david.laight.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 127.0.0.2

On 9/7/26 4:41 AM, David Laight wrote:
> No code changes, just some extra explanations.
>
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>   kernel/locking/osq_lock.c | 27 ++++++++++++++++++++++++---
>   1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> index b4233dc2c2b0..b17aa704c449 100644
> --- a/kernel/locking/osq_lock.c
> +++ b/kernel/locking/osq_lock.c
> @@ -4,12 +4,33 @@
>   #include <linux/osq_lock.h>
>   
>   /*
> - * An MCS like lock especially tailored for optimistic spinning for sleeping
> - * lock implementations (mutex, rwsem, etc).
> + * An MCS like spin lock especially tailored for optimistic spinning for
> + * sleeping lock implementations (mutex, rwsem, etc).
> + * Each CPU spins on a local variable to avoid cache-line bounces.
>    *
> - * Using a single mcs node per CPU is safe because sleeping locks should not be
> + * The CPU that holds the osq_lock checks the mutex/rwsem, the other CPU spin
> + * in osq_lock() until either the osq_lock is obtained or the scheduler
> + * requests the process be preempted.
> + *
> + * Using a single osq node per CPU is safe because sleeping locks should not be
>    * called from interrupt context and we have preemption disabled while
>    * spinning.
> + *
> + * The osq_nodes for the spinning CPU are put on a double-linked (non circular)
> + * list. The list 'pointers' can either be the address of the osq_node or the
> + * associated CPU number, the CPU numbers are offset by one so that zero can
> + * be used like a NULL ponter.

Typo: "ponter" -> "pointer".

This description seems to describe the optimistic_spin_node structure 
after patch 2. So should you swap patch 1 and 2 to be more accurate?

Saying that 'pointers' can either be the osq_node address or the 
associated CPU numbers is a bit vague. next is the osq_node address and 
prev is the offset'ed CPU numbers. It is not really either one or the 
other. Other than that, the description looks good.

Cheers,
Longman

