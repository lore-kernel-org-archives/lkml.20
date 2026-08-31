Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9BE390CBE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211158; cv=none; b=U/igrmDTGqnpePV/zh6W4A4HVajSs/qwk/Zu2JSryDwmsryVGDkJ5QhWPNmIfeIq+zXKI4YrdW/1Jrmt9NmNg1NGsnaN6AfRatqAqsyQjwcj7dRuHDbaxNPm6wYoZHWKEV2dHCUoA2jAkcACZG8/ZV0w5Pk2uiqCe+8vZt07vSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211158; c=relaxed/simple;
	bh=70VyKXH/L0VLnwlQfhE/tKa3samdo7W2fwCA7wFjnOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjGVQnkwU0fcGyq3lBA/dqIeYi1ZKVEeLorizgJbaGFSwEEK9XNcCdqNzSEX9mFe8jLMxMy4z9KzC6PVX5yxO+kRtfZRxe+aQiNbDChPV1cBRUjsYb/RT7VOphp8w8M1fJyO4bldl84b7VAdOe+uNFB9G+7BBlf5Eb5aKc5nt4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=QwZ2o1Xk; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="QwZ2o1Xk"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4hYhh46nfhzlfsXm;
	Mon, 31 Aug 2026 21:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1788211153; x=1790803154; bh=INsb+qeKddITDc1dd+P6hXmo
	tsg6izQh2A3IoMh+cQE=; b=QwZ2o1XkKrLN1BDC3YXRS9AolTysTtPanPjminRj
	8LCaYmJy4oLjgiIXkHl58smsXXFDyoTJq/MEn8LK8KIW1X4FK820WSyLv/L/9zs4
	VV9Do9OKG7A1hV8k0iUBci9XD8U3IHqoZ24ygNPP1MD6Rq/jC9m1K4tbHl+7YU+S
	KgN0meyFCpPhVhoLF0OWAqbWXRe3GhRi4xBgxIi/QaxyYTKAL45IfK20LkjowiEr
	goxSQGspUu9MCnopThtxd/k8c3ou60KLi+cfno7Rj/EnOzknhu0qHXPsgBDEv6ka
	aTOxOXjUqsxmEE0zML/oP8HLYEl2eTtphDx+XhUSZ3lWnQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id iAxg8-U40vOu; Mon, 31 Aug 2026 21:19:13 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:a104:ffdc:9983:687c] (unknown [104.135.182.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4hYhgz3wQ5zlfvps;
	Mon, 31 Aug 2026 21:19:11 +0000 (UTC)
Message-ID: <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
Date: Mon, 31 Aug 2026 14:19:10 -0700
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
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260831214437.15d6ad34@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 1:44 PM, David Laight wrote:
> On Fri,  7 Aug 2026 10:00:56 -0700
> Bart Van Assche <bvanassche@acm.org> wrote:
> 
>> Using a __bitwise type in a tracing __field() definition triggers four
>> sparse warnings in stage 4 of expanding the TRACE_EVENT() macro. These
>> warnings are triggered by the is_signed_type() macro implementation.
>> Fix this by using _Generic() in the is_signed_type() implementation
>> instead of an integer comparison.
> 
> Does adding __force to the LH cast remove the warning?
> Is so that would be a much better fix.
I have tried this, but unfortunately this doesn't suppress the sparse
complaints about the casts in the is_signed_type() implementation.

Thanks,

Bart.
