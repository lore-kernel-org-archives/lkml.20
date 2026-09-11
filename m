Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFDC4A3F0E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142063; cv=none; b=E6BU4EbCum6GMmvH8r3OlFdUYFc8MzXkkDwMz/IggZa1QVF4SRQmh3SrTAY47wk10Dxvqgl5dQVkCfJu3V6PFifm6xITujFZEL5O6bxx5AVtXxdzSv0JfQU4Nh5Ys++fv1kaPsSFs4f1Fji8HYe39EpwFnA0XQdiTIuKO2OADqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142063; c=relaxed/simple;
	bh=MlSu2nJlbYyfxk7BMx8+WDtlqdis/YNMIYzk49A7XOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=razOAe4O+S2g0X3Um5PY+ROgSg5Ljhpt63Mo+MXWp6T1v1Lj/U2wxFHY7g4XE/bErvhn3b/KarukUhEsKVU+tONMkIe5CsIpEP2K42b+2rE5oSwZhmyap3/qm8LpWUHX+gchBUVp7bWjmUNpldTHaHF0CFe6PkVqzv1Bt5U5lGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=GcCPlHa+; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="GcCPlHa+"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4hhJxx5t3Sz1XM6JR;
	Fri, 11 Sep 2026 15:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1789142049; x=1791734050; bh=UL4rz3Dp1dxdqh5XlRLxO2w8
	KZdpSKIZ/ir0ogZ9gEU=; b=GcCPlHa++r6ZGY3y4uEJ3VW6xi2qlN/q3p6meP2C
	ggiQHvRwSByHzXkbEM2Ia81pSU4fwGWUK/lGrFn5dLbu4fDXeSpOOcHO7M16K51q
	s4FdxfUyeMKqXqROk4Xhik9UBGHRftvuGTHS23RpB1SFTFxGyUuvBcYGz7EFKMW3
	OECqGsFmbZuNkt95VI4CgagKP+X87yhxwhSQ3KOQ34V3jqbSydpXHcuqMvJZEVTP
	gFPHKnc+Zo3IY9cu7BFpucLEmDe4rAj2pI+jaTZYlKTUUENdNqLQZ7iyscL5ygVd
	KKdGGl/rQZwaZ9fiuzD0iSBfGQ7/p8pvUv7iDTi0ZVMfHw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id CqqiMtyO1ZuN; Fri, 11 Sep 2026 15:54:09 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:b591:e5fc:52e3:a430] (unknown [104.135.182.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4hhJxn2Nc0z1XM4Sx;
	Fri, 11 Sep 2026 15:54:04 +0000 (UTC)
Message-ID: <b99d5e6d-0233-469e-873e-64fcbe02df6c@acm.org>
Date: Fri, 11 Sep 2026 08:54:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] mm: introduce for_each_process_rcu and
 for_each_thread_rcu
To: Steven Rostedt <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ye Liu <ye.liu@linux.dev>,
 Marco Elver <elver@google.com>, Ye Liu <liuye@kylinos.cn>,
 Yi Tao <escape@linux.alibaba.com>, Tejun Heo <tj@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-2-ye.liu@linux.dev>
 <20260904122536.1079b279@gandalf.local.home> <87ecf87m31.ffs@fw13>
 <20260904190742.7231d56e@gandalf.local.home> <8733vo6tui.ffs@fw13>
 <20260908083817.GN4121339@noisy.programming.kicks-ass.net>
 <20260911085456.171fd087@gandalf.local.home>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260911085456.171fd087@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 5:54 AM, Steven Rostedt wrote:
> On Tue, 8 Sep 2026 10:38:17 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
>> Right, so GCC will accept and miscompile jumps into a scope. Clang will
>> warn/error about this, so this should never happen.
>>
>> Aside from the ASM GOTO issue, there is also an issue with computed
>> goto, those don't work either.
> 
> So should we have Sashiko stop complaining about it?

Yes please. I don't like it that Sashiko complains about regular goto
statements inside scope-based cleanup code.

Thanks,

Bart.
