Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A3343BDBE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293193; cv=none; b=sdDJE7/rGUjbOztVcw1YbDJj69EaBS56+uXTyzBobZLI6mBAJ4USkIeTybnffDBGwOV+8CxN2q9ESUi0jOHMH/1/w2Hnr58zXI3z38TOfL8ONicU59/2NrvWgeDJjlk9X6xvhzqwIoGxj50P6byvQOuVLxHdvDaFvgwdKUffeoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293193; c=relaxed/simple;
	bh=dvK/7qq0PvbUm5G0leIqI66lYNJgk8r5vzSh6nhg8EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpjNU5r21/+NW3lfdim9SIs3Hi7pdn4CwrR7ebIUB+K/AGhfNXVUTtJrdaXzVJ4IdapB2YNLzxEnlml1rtaC0wUTsS8NqNIWzWlzLPz4i9NvSTRuWArPMHp137KBnV3XmJNguw/sbFqz5auoj4vhTgttDUv1vzySWgdAiH/ydww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=zosOt4gv; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="zosOt4gv"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4hZH1g0MPBzlfpMJ;
	Tue,  1 Sep 2026 20:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1788293186; x=1790885187; bh=dvK/7qq0PvbUm5G0leIqI66l
	YNJgk8r5vzSh6nhg8EA=; b=zosOt4gvTN/UNm+TZCYETpwqDiNxEnQegmXsvif3
	9JMaarc+x+ragDV/w6Cnnp/gALpDayn/jqIQD461v8OI2gV7DlrLypnBIwxinKy5
	Ruqg872eJYKfv1QvlALxrw7V3ulbDkL2WOg9d0qh+dX1PLvygtj0gx9zf/Vl3Ip8
	RkgGJ/O/J8A84CGy+68dO1VWGGdXBejP/sXfp9g7O3lcjwxSjZxnjOQiFVzokHjf
	FwYfm8IQQ88stNaW536krKJ66e37foRmAOBj/oALu+0YmJca0xdIyNhAWkPUUdLO
	wqUcgAc9bQrWn4+qi1yUBFCas+buNFNB99OBysNmGgFGUw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ChZehgKpDaEm; Tue,  1 Sep 2026 20:06:26 +0000 (UTC)
Received: from [100.80.227.50] (unknown [104.135.182.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4hZH1W6st7zlfqB3;
	Tue,  1 Sep 2026 20:06:23 +0000 (UTC)
Message-ID: <07dcd177-bc20-416e-accc-9c137d70a5d6@acm.org>
Date: Tue, 1 Sep 2026 13:06:22 -0700
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
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CAHk-=wiZog53-M8--_2m7HRk4XOQ+_jkh1XVuyQXXJgSwooQng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 12:35 PM, Linus Torvalds wrote:
> Does that tree at least work for you? Maybe we can convince somebody
> who is a better maintainer than I clearly have ever been to make my
> messy branch be something actually palatable...

Hi Linus,

With the master branch of your sparse tree
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/sparse.git/)
sparse does not complain about the is_signed_type() implementation.
Please note that I have not tried to verify whether any false negatives
have been introduced by sparse commit 32eb1e2c4fa0 ("Allow both regular
casts and forced casts for restricted values").

This makes me wonder whether I should switch from the official sparse
tree (git clone git://git.kernel.org/pub/scm/devel/sparse/sparse.git) to
your tree?

Thanks,

Bart.
