Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEB54A0EED;
	Thu,  3 Sep 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440605; cv=none; b=nnJJd+ggwbmIsEiXho5Fmb4rC6FBtn1MD0ZrFuBFiELeiaj4LSwAwM+VxKJdYxPPLknl8pV+B22HOAoFkZo/+LmuH1Eyx0gY1X1OkpxRO+NzwGnGNKRiHdZpj+fbaXrS/jTo5Z/07X6htROyA3Nsz1b+YTWyfxKKYj7BIccdCdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440605; c=relaxed/simple;
	bh=Td1Urn08V4hMFoUy9hxq0Ce9TBdbXzM8BC2rJ140rSg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fh0bg2EebSoGzMQN4RM5JecAz5MEQYiWvmYJhHGB/meg57brZwexSZMA/17s0f9NG0Q/sWTSy15i3ZUlWNqCbcCO7JCjyYhn5l2IynmM7khqWK/0r+LcpJU5vs9l2/UjavjCnahguXfqY3dU71Yqa8ZV84Bk6oc96wZwH08Jx9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JftMvfMo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JftMvfMo"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2F5D6408D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788440589; bh=gZWVL+as3sL0i38cJG3S0neGMCKfaDMHpJ+EGysOhnw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JftMvfMohUf8pIgHrEcmN03l2LAS3CUSxRX2tJ9Kd+P6Z0V0LH5T9D4Wbbaxdpm94
	 7v3/Gb4/xKKzH/ZZLBDyMBlJ36AwJUO7Sj7lrOzGwHTONeFlD8gwQOVxvjTEavAHon
	 h+uHbbW2x7CuW6fTXRquZt+EfPrGtZWtBcGgLOIUkS3E9zrVXaLQ0pcBOyxus78KOf
	 xQB8bhxHR5B6q3zkaK468T4QQ1mJdxIEznqU3m3922yRza2j1lTEOB04MKqR4KRNyB
	 WNvh6buydXGmsRpmo2RsTJONinyiN3LQYGPXmCvUzWOup7PqK844pnbbL5dICh6V87
	 A7CESBdSeVmZg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2F5D6408D3;
	Thu,  3 Sep 2026 13:03:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, Manuel Ebner
 <manuelebnerli@mailbox.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: verify/bisect: fix typos
In-Reply-To: <e93cd824-4115-4bc1-a702-04f92794924e@leemhuis.info>
References: <20260902115121.687986-2-manuelebnerli@mailbox.org>
 <c6487243-0cf6-425a-8992-399aa802ed1a@leemhuis.info>
 <101613e024851e419e2e19c433a50044ed75b466.camel@mailbox.org>
 <e93cd824-4115-4bc1-a702-04f92794924e@leemhuis.info>
Date: Thu, 03 Sep 2026 07:03:08 -0600
Message-ID: <87zexy7aib.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> On 9/3/26 10:22, Manuel Ebner wrote:
>> On Wed, 2026-09-02 at 18:30 +0200, Thorsten Leemhuis wrote:
>>> On 9/2/26 13:51, Manuel Ebner wrote:
>
>>> For typos and grammar fixes there is not much to say, so maybe just
>>> state that; but you might want to look at a few recent changes in
>>> Documentation/ to see how other developers approach a situation like this.
>> 
>> That's a good idea. I did only find slightly more verbose than mine, eg:
>>> Fix 'hay attention' -> 'pay attention' in file.rst
>> or
>>> Replace "an a few" with "and a few" in
>>> Documentation/driver-api/media/drivers/zoran.rst.
>
> Yeah, maybe that slipped thought; and if it's just one or two fixes
> okayish, but after that a vague "Fix a few typos/mistakes/grammer
> issues" becomes better I'd say, unless there is something more to tell.
> Hopefully Jonathan agrees with this.

I do; repeating the specific typo fixes in the changelog is just
redundant.  As always, the changelog should focus on the *why* of the
change.

jon
