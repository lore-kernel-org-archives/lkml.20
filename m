Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591207;
	b=Xpb7R8PQb0ngpK+/wDlNc8DzT6bzpBBVwp03EsBoxuh26ZEMrd3BbzFJ/xIbCfBWpUSd
	 WV6XRVVqaI9QVm07Oj6/n+WHew+8Dpn4mGtth90B5B4DSD4yzGIW6RQu6qDlHWcEDshlj
	 BGnCR8X0JkmeRXkpGH8MjBTL5UGD4u846WjCMvuiLmeB3hir0wedjM4sAVFyV/t54264F
	 J16tL+fIvr5EoL202H7KtEzcPDFvFtr/Mx9tibPLvW6ITHQERYwjZQFGb9Xrba4HoN1O0
	 ghKHqd3ayw8GH3E4RqQZDb/YB/ekgkf6ExCIq+RAdJSRu0c+0R7LFYPNgimE9y8o5Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591207;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Status:X-Rspamd-Server:
	 X-Stat-Signature:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=WXR6W2h/dyZK+RmqaIFVqYmeYGQdq0lkqTNQeZO+uao=;
	b=dKH3Mk4SKXDUS7Vsvc+GSo5uc8v7oshnUm/4i9ToB+KTktDdsxMjTOnzBmDaPvflvo9z
	 dtTOI1MELnMl5w7ku4ahZ3hYUv8oynm3jqmGwSScvZ0/m36b6smBVpPrxgeq2FkouQbYJ
	 qVIinzz5/CcCtu745Np/+qI+Xjfd7BiycJc3uKRNmP/aFHk7vF6bIy+Qj0fnjMlLbllOe
	 Bmd8nsjj4hQtvJOWhy9QXbR9t0t1f+mlgCGmP5LitPpFCfrEUEspbBlKJHiwLuyZH70Jk
	 03C9xARLWh0Va5Fd/jnclU8sQYBfx10Lih/VhM84CYOt2yRe42q8rnnUqVW/wr6ru3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=vJDlW8Z5;
	arc=none smtp.remote-ip=216.40.44.11
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62CE606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C62CE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=vJDlW8Z5
Received: from omf07.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 04443160430;
	Wed, 21 Oct 2026 13:59:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id C73FA2002C;
	Wed, 21 Oct 2026 13:59:56 +0000 (UTC)
Date: Wed, 21 Oct 2026 09:59:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: John Stultz <jstultz@google.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Christian Loehle <christian.loehle@arm.com>,
 Qais Yousef <qyousef@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@kernel.org>, Wei
 Wang <wvw@google.com>, Patrick Bellasi <patrick.bellasi@arm.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>
Subject: Re: Uclamp races due to non-atomic static_branch_likely updates
Message-ID: <20261021095955.0d06a754@gandalf.local.home>
In-Reply-To: <20261021133430.GP2823843@noisy.programming.kicks-ass.net>
References: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
	<20261020152933.16989549@gandalf.local.home>
	<20261021113806.GE2823843@noisy.programming.kicks-ass.net>
	<20261021092136.249e2d19@gandalf.local.home>
	<20261021133430.GP2823843@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Stat-Signature: ue6xqu4z8gfox4pzawfb61r3pfysas3m
X-Rspamd-Queue-Id: C73FA2002C
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX183Q3TjqIpLggLVM1pINV6bZiqyyPvtDeY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=WXR6W2h/dyZK+RmqaIFVqYmeYGQdq0lkqTNQeZO+uao=; b=vJDlW8Z5lCC+qfvzev5BZ9c+GDZ4YkCPNIlocPgKnLr8/3Tz8bEw3pwpaqJLPgkXKVrzTIx1g0cHH5bAx4W/RmAGM/RPNtaNNrtJr2X6g3/GBgYM6Oh3yadHyRXN+H7iIIDa624aCX9bLxQEQH/wHkN9VvpzxdKi/o+qDSDrH+8=
X-HE-Tag: 1792591196-339773
X-HE-Meta: U2FsdGVkX1861IrJGKHJrw2YUaPAEp+L5jIF8Xes2eztiCZCrcW5nI1T+UayyKSJrzCKUOBCm/vLjjyOse14Li4T9MqGNicBvXmeC90QOZ28xh8dsIQxjo1OGZ3jeUxNQY5daAZKUHu3BMk253d5lrHSulnjiaoDelEuYpF/LE5k7AR558mM9VvOvBMz3hiAB8O6PmlPe8q9ZHuANJ71KuJs5TZAjxtsIj3jnAyQl/qF+roOK5pxz+lcF9L4mCSsr0Xk5HWgBefxOARZgje9oLUbunxeUfZa/7SKQOllMto2V/8ferq+z01v5FF4NUSljGtFt9GGsYkzkD9MYVt0tLDJ0m09zVVeJrETHLAhp7c9mdZgGws+wp/bAJ41v0vY

On Wed, 21 Oct 2026 15:34:30 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> That simply doesn't work.
> 
> Even *IF* memory stores would propagate instantly (they don't) you can
> still have the boolean swap while in the middle of this state.
> 
> ---
> 
> B = true;
> 
> CPU0			CPU1
> 
>  enqueue
>    if (B)
>      something++;
> 
>      			B = false;
> 
>  dequeue
>    if (B)
>      something--;
> 
> 
> ---
> 
> Will still be left with something unbalanced, even if everything is
> super duper magically atomic.

Fair point.

-- Steve
