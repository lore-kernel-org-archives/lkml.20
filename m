Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933134;
	b=X5n2e32hXGuQEAB25iY1ZNGqYM0sDAyPcqAwW5tu6gXG571jt93nI7Hp/qd45Yz8QU6u
	 g0JuEMYBsyzeJSHsokrF445F2a91L24AYAbrlGjwUl33FXuP3hkGHFhEqnc9Dh+ZB0mVL
	 16doCQFXk4iDGti895gdyf2hOCaSAk7AJ87W4+dvotlG+qWsPdQbNFsXlLGTbHfV3+yVc
	 0zat3tHW3GGxbh83fDB9a7XwEiciWaeiOZpMK0QCviNGGEufHfZyj7cnmwBRzZMU4X3Ga
	 OwpZdJlc2UDiUWE2Q8t3kgxsewsABV0fVvkd8VGK2pwbktdAdVsMdhvqW58+VToH1bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=J5x6mKugMf714+VHypmEFD70gWUfW6DIZ+hE0K1SzVc=;
	b=cL1g9CSV+b7AfuNrCloMHgSo12NE4Lge8bcBRfNHfEJog/no5sNH2axwxvEYpppXx4Dh
	 /mSYo0fdt+XresGGfzrW7BQLtiaZY+Dzrpi2aY9vdGnh1rdUEqZdADmcdZD9voDpbloGL
	 thiV5fDexjynQkdr7aU5eNgGWYHPbH7B5szUfmD5aKlabaKl8Btca7+5BpiWYcb/Kc8LC
	 CMW66IfeUsgzKdF0hVQFbVMrZXp4Gfs79ePXr27THsAZuqpd/CjJxwH0/hirQJLOsLG76
	 2fsJLDkR+4LYadS0uiU8Ha0qmTDsqpaMs0U1nRht7avPA9s1Q9IjX3cJkYq112BPC7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=HUjz1fUP;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FAE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78FAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=HUjz1fUP
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jTVct0553zlg7KN;
	Tue, 17 Nov 2026 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1794933132; x=1797525133; bh=J5x6mKugMf714+VHypmEFD70
	gWUfW6DIZ+hE0K1SzVc=; b=HUjz1fUPEKZRPP6742NaIwiyY6qob+3Oe6yfxtsg
	uvDZ0sKK/EV7KABbXzQVIhKAj8ulv2OypNcbgzo0+1cWe2QjZVbHwztbiYmeOcuZ
	UFiTxkbMUn5uW8+TNfLAqCBI+WKnLk5jRQxa78o5OvGeDieRVBMbCtGCsyW0AlRW
	XNiaHjr14Zl4LmBII1Ks9wGbWBJnAfpl2ddeqDUMBe9psnKjR02QRw4qQZ/wzP5n
	d9NoTpxQYCGUCI/wCyMMyp/vElTiTfzfPR57vXNvzUHpoMy2QWYzfm5peRYeSb5A
	3J2WXCj6rQrnL3hM4aYheOv8UFZn60zLzCMitSgYKHJaUw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id PLDqLh22iEZU; Tue, 17 Nov 2026 16:32:12 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:44bf:cc75:7d8e:9159] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jTVcq6KMDzlfvpy;
	Tue, 17 Nov 2026 16:32:11 +0000 (UTC)
Message-ID: <fb66a344-b688-4660-90e2-018d31c2a482@acm.org>
Date: Tue, 17 Nov 2026 08:32:11 -0800
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
Subject: Re: [PATCH] compiler.h: Support 64-bit bitwise types in
 is_signed_type()
To: David Laight <david.laight.linux@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <4002a78c6bf1fa4fc96d089bd6a704bf77e2e060.1794867767.git.bvanassche@acm.org>
 <20261117080621.7ca022dd@pumpkin>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261117080621.7ca022dd@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 12:06 AM, David Laight wrote:
> Don't the trace definitions need fixing?
> The trace code prints the numeric value so you really want a host
> ordered value in the trace record.
> 
> An alternative view is that even asking the question 'is_signed_type'
> of a bitwise variable makes no sense.
Are you perhaps suggesting that we should tell ftrace users that it is
no longer allowed to declare __le64 fields, something they probably
would not consider reasonable? Please let me know if I misunderstood
your question. Below is an incomplete overview of the examples of __le64
tracing fields (__le64 typedefs have been ignored):

$ git grep -nHF '__field(__le64'
net/ieee802154/trace.h:74:		__field(__le64, extended_addr)
net/ieee802154/trace.h:367:		__field(__le64, addr)
net/ieee802154/trace.h:386:		__field(__le64, addr)
net/mac80211/trace.h:2507:		__field(__le64, twt)
net/mac802154/trace.h:191:		__field(__le64, extended_addr)
net/mac802154/trace.h:272:		__field(__le64, addr)

Thanks,

Bart.
