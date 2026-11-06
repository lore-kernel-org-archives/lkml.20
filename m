Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794006644;
	b=zWIfQQer0PVF9rno1c74yzYpt1JwVLuItMTfnF6TzzE+Zgbt90xZZHqYnrCGy++Bl23b
	 KN+7p1zTMK6bSl3wZt/TBkjs+ZGRDQ++KRdxlr+xkXvUng1F/iPnQV7MuI1qWmQvDzhJW
	 FAvYoq0QjkHWMDDXBoutv+EbTPF89Cay+46CWCyAe6IzwNOI7Q5t7/IxKlh6Cb/h2Mg4o
	 plLioDty/b65v8du2KrHdUaUMwCIh+LagpYAtzWbuPj0lriYD4T+v2osNpZrBIt7o+LDF
	 G06nDcJWjSVY6IDY68nu3Ssc+DAYkJxa4qrkXLx3BcACV37OK2Tsp5N62tRsa3iDwUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794006644;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=SSu8sahHYtJP4tYEpVQa1z5i0RcdS7+U4e1oKrlexBE=;
	b=bwdvrahkle/yfm+hzKCkCnS6g5UhNCKroI1gtMU3MKaTnFuoq7ziJYz+2H1IiMhX1B6V
	 2h9q4LtbIFP/jwWdHoSHGPYBWM0NgihYnz8YYUAehHxP0J11l1BgZbE95hYPcOXLbLnRs
	 74wQbsRdMjU1/SSwu77QKuJwyqM3i7TGX/msdD2xLc0RTEybz74bWXQiIyYrO8k2vxB3g
	 o1fysE5LrnPUm/j88g8WxHJZM5vH6OvfOd62aj8x3EUE5REymnquvVlppmN2KgUxqAjiZ
	 4qtWzosxj/waQqSwkxvQd8WsCgIccJuPFWb2zJOrRKMmMUOtyZtW14sacMscTzdGMYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QVdBHXCf;
	arc=none smtp.remote-ip=95.215.58.114
Received: from mta1.migadu.com (out-114.mta1.migadu.com [95.215.58.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D1B606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D1B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QVdBHXCf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bSp589ynlUSbkHZ/Pc8oj+44xLBN6TotbLXU3BpwP8Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794006640; v=1; x=1794611440;
 b=QVdBHXCf+YgkLKYumhrLD6fpuUKcp+E/ZAqbFq9mwZooLmomr5cTdrc4rP9finr0QLFyh2ne
 CHFzaErK1kkzmQMX9iLCJOvg8dXjH5A+LgjuIlEZCaje1eD93ZQkyCrW/+1Fk1R7XSi5/A6sWYc
 mOtLmfjd1H+usMO9Ytx58ofw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id f5adb69807cbc1e0;
	Fri, 06 Nov 2026 23:10:40 +0000
X-Mizu-Trace-ID: f5adb69807cbc1e0
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: netdev-bot+sinfo@kernel.org
Cc: alex.aring@gmail.com,  davem@davemloft.net,  edumazet@kernel.org,
  kuba@kernel.org,  pabeni@redhat.com,  horms@kernel.org,
  netdev@vger.kernel.org,  linux-wpan@vger.kernel.org,
  linux-bluetooth@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] 6lowpan: fix netdev_priv() type confusion in
 lowpan_event()
In-Reply-To: <179400615048.488859.9102835578031186781@kernel.org>
	(netdev-bot's message of "Fri, 06 Nov 2026 23:02:30 +0000")
References: <20261106225930.1379968-1-roman.gushchin@linux.dev>
	<179400615048.488859.9102835578031186781@kernel.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Fri, 06 Nov 2026 23:10:33 +0000
Message-ID: <7ia4fqxd8sk6.fsf@castle.c.googlers.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

netdev-bot+sinfo@kernel.org writes:

> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

I've a reproducer which I don't want to post publicly but can share
privately.
