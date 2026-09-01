Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8478395254
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299003; cv=none; b=Dbmp4lab8kX6r2QcIoHMjcBdRnXgFJpSq7WKoIG4cjfWUQE5NmNBf5qCdJE1f9M8DVC3ELPPRerNe4svczfxPvMLE6/m7CYTf2tDCbBSS2pX4eeZhQ4uL2Zzgy+m8q3aCblmFXu2x7tC5sa9uoZjwTXVKBW2oFZPRrZCS/zRQyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299003; c=relaxed/simple;
	bh=Vv+ls6uFyI2wfHe0582KHSHDpQnQP5wX8PXX88p1UmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aW/y6BKnf4brhRWAGWXAXO7uUQDm7pijddvGhXgAiOa9IEYeYm+Km2hXVS1T49pRXX9JlWx+hSvy+FCpcQsGbIo+V0rCJ4PGuKFNvGflxuwtsA7YloJueit3FEOdZsyGxuusrQ4f27S7Bh1UngQSqlY6zFVABNXYiI+S1HP1VQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=IKE2hnSc; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="IKE2hnSc"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4hZK9H0lMVz1XM6J2;
	Tue,  1 Sep 2026 21:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1788298990; x=1790890991; bh=Fre6qrrGl/lUya3IsdJWljpn
	G41r3pX4Xk5ypHy9wzM=; b=IKE2hnSc9WCXxvJ95FtNdyZnODvW09wNzly3VglQ
	EGRoUQjq3Ibei+ayjqJMnmyAA8eWPgBr496EmxQFgvl3TgxO5kI5k7qZbh+g2fll
	cUzOd892hdAlYDP0jI185/z0oW0Fe5ZSRZtFUn9MisDDUgVwkqfAfbOQH8wP+XIu
	/3VJC9hAFm6mhbVeD6p966AevMtxYbx/wGGyxOM12B8PFjXYeS+7WqBw1Kt6AMCO
	NBsBUWdeeBDhyc+DO+4uQ9xBcNEXnldC7WGHm8LQvoBpeo8ldyYhbwOWXBA4Jq0w
	LLF+9RnofHayWwnGIL9rCqp6GOVGl3A7MdWvX+T7ncMGnA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id RXPMj77jaHpE; Tue,  1 Sep 2026 21:43:10 +0000 (UTC)
Received: from [100.80.227.50] (unknown [104.135.182.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4hZK9763dbz1XM0nt;
	Tue,  1 Sep 2026 21:43:07 +0000 (UTC)
Message-ID: <1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
Date: Tue, 1 Sep 2026 14:43:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: David Laight <david.laight.linux@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Chris Li <sparse@chrisli.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin>
 <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin>
 <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <20260901222909.05d6239f@pumpkin>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260901222909.05d6239f@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 2:29 PM, David Laight wrote:
> On Tue, 1 Sep 2026 11:05:18 -0700
> Bart Van Assche <bvanassche@acm.org> wrote:
> 
>> On 9/1/26 1:20 AM, David Laight wrote:
>>> I suspect you need to change the TRACE_EVENT() calls to remove the
>>> __bitwise marker.
>>
>> How to remove the __bitwise marker? Removing the __bitwise marker is not
>> supported by sparse, isn't it?
> 
> Wont (__force u32)u32_bitwise_var remove it - you just have to know the
> type.

Yes, removing __bitwise is possible if the underlying type is known. In
the context of the is_signed_type() macro, the underlying type is not
passed as an argument to that macro.

The implementation in sparse of __type_unqual__ does not remove
__attribute__((bitwise)) as far as I know. __typeof_unqual__ only strips
C type qualifiers: const, volatile, restrict, and _Atomic.

The only generic way I know of to remove the __bitwise marker is by
using _Generic(). But that approach has been rejected by Linus.

Bart.
