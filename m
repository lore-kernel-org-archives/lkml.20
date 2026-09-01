Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703074CCDE4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302814; cv=none; b=EvoT6QZJDPB98SqJjFkUBAnK+U/ps8npD0ODhhzRcJ36F7Or/xbJhVAWXEVsnKMaRtLpEhK/bOBWX4348DmMaWB6rHYg6YrdFG2tH9qfL34n2MO7QotFfn822xtfvftHsnBmuzVHLMI3jVae9gvmUXnoNg6Nu+rJhwKFo/aVn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302814; c=relaxed/simple;
	bh=Mkw5q/HNtXXho+hpQuUUFYWhDUWGXG2a+bSB9a0y00w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kf2ARzkYnXVRGSUzYDw/EMSrIIsh9n/bJQ8OYTFjB5Jn0VJtFVmJ/6tnw5Tyq4vxR7AD3teCTHukQft2AX2sqk+qnjrIhiRAznx8I3v8OGPsxvkvOkGjxIJINNfLAtPgFNI7zhQi4/FRZV2XDy+/0eoncwcYn2ZBDjiUBqfrhdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=rJ9FShs1; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="rJ9FShs1"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4hZLZh68Srzlfq9P;
	Tue,  1 Sep 2026 22:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1788302809; x=1790894810; bh=Mkw5q/HNtXXho+hpQuUUFYWh
	DUWGXG2a+bSB9a0y00w=; b=rJ9FShs10Z+ITPwEQGPLMTWHSd6fIpdA6GJ6rhbi
	2C2qcSv94Lql+bZqQunk9hvRkXoNxz99+4L4nTxcdv0V5ItDJwompREv9B/bKL1r
	pgqzvd7Gqy40B1ZlihKnt+uY+Ud5D/g/2diIAu56Vgk9TXn86vUIxnYj6Nq+mwcH
	4jaJaiJ5SCjjh116pBG3R2hUTR+q7XSC6RnsXNUH/gA8JvvLq9zURP7JniHAx6ez
	0EaiPWp7sUnIRPQCZSkgVeuj5nyNv71xHSU9uoe6WnTQC7DuAL/1Xl9B2sqh2sPr
	G+o1tJLi96PKGm8CWKzxbkxuI4oD892rZTxY/wo2h0yIzA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ybiG_2rWYGAP; Tue,  1 Sep 2026 22:46:49 +0000 (UTC)
Received: from [100.80.227.50] (unknown [104.135.182.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4hZLZZ4VtgzlfwgS;
	Tue,  1 Sep 2026 22:46:46 +0000 (UTC)
Message-ID: <d5c64d53-1d36-43c5-9122-8a57b4bda9b0@acm.org>
Date: Tue, 1 Sep 2026 15:46:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Chris Li <sparse@chrisli.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin>
 <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin>
 <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <CAHk-=wgFEG7ZVaFAbo=bWWfsSh_weA4cOh6BV-xHWNSn6SwNBQ@mail.gmail.com>
 <737a4f62-f50a-40bd-a94a-1f42e9f3f54a@acm.org>
 <CAHk-=wiZog53-M8--_2m7HRk4XOQ+_jkh1XVuyQXXJgSwooQng@mail.gmail.com>
 <07dcd177-bc20-416e-accc-9c137d70a5d6@acm.org>
 <CAHk-=wj1rTtCXQVf-_doFT0KbnCDObvuoG0yEv8eH6V+Yq4=vg@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CAHk-=wj1rTtCXQVf-_doFT0KbnCDObvuoG0yEv8eH6V+Yq4=vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/1/26 1:24 PM, Linus Torvalds wrote:
> This is partly me fishing for some poor soul who actually *wants* to
> maintain this.
It is well known that the official repository for sparse is
git://git.kernel.org/pub/scm/devel/sparse/sparse.git so I think we
should keep that URL. Pushing changes to that repository requires a
kernel.org account. I lost my kernel.org PGP key about nine years ago so
I will have to create a new one and get it signed again. I will let you
know when my new PGP key has been signed and when Konstantin Ryabitsev
has reactivated my kernel.org account.

Thanks,

Bart.
