Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634A4EC659;
	Thu,  3 Sep 2026 16:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453230; cv=none; b=NS3ALhR+vst1X6YtfV28q7LUTcLh3Zm2d2qjSg9iahM1SoK1FOJviBKOnQkrAfZWIs0pmu9XZ/6UXjCFBYm5U68HeWXnXGcT694cPFSV7H8yhDWBHusIkilCwK9On/+fATRfWiGTCGrh90FqLPSWeyC8VlSeE6zXRejAwxzNqi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453230; c=relaxed/simple;
	bh=4vALeppUB6b+IJEWEdpE0sKGSOqHZR1+kVSi++luN+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDq+hMLEpptR4/cnqPrwzX3Nj019Yy3U1utEGKbHGAxow3xJ5ZKkrqxswIvUwVto73obzXqVSrxAWjozK87eJX3ON2QQjYNFs/wNz4LI1aYGIcb4TDE/OPDTuXnM1569ilDMkYp7bgRG/b36iakE/yyj71BbRMxOf6AqLYy7PM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uBRU+c4/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uBRU+c4/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=BvmPIK9NpaBNLg9nUaIuSfLLYPm2dUGyP0JB65LG+70=; b=uBRU+c4/TDmoX3LEiQ1DvMkI64
	HVVmmzmRDO1ZT0FnKn87SiqnaieUa8/89FseGbCG+izj9hU2w6jIw0lKuzxh+9A4OiWzCPGu9DlA/
	sck0QMVjJHh7uk6LJoL6q+bLYmmRXDsIcjlygc3tBAg190czzkjHcrbYpObkri7jTJ9vXwONXr77C
	/DVPIjUKazfZvhUGgBRjp4idWUlNUtwi4dj9gW6dOn5J4/rgDKxQpx5JdLYq9DsxA/p6yeEY20MXh
	kXfo4SHjubiqyvQ1KOlAT3kvgp+uWVsN/SesaSTSs3D0YgdyXLOO5cjV2lMrmuBT04Ac5h/M+4QCy
	mG5RTFWQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ANn-00000000BCS-0of6;
	Thu, 03 Sep 2026 16:33:47 +0000
Message-ID: <5efba8f3-ffb0-4e1e-8057-6946e1e96db8@infradead.org>
Date: Thu, 3 Sep 2026 09:33:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Documentation: process: Clean up grammar, tone,
To: Weijie Yuan <wy@wyuan.org>, Nguyen Duc Thinh <ducthinh100812@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260902084430.17248-1-ducthinh100812@gmail.com>
 <aploLWg-i315frp5@wyuan.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aploLWg-i315frp5@wyuan.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/3/26 5:29 AM, Weijie Yuan wrote:
> Thanks for Cc'ing me.
> 
> On Wed, Sep 02, 2026 at 03:43:58PM +0700, Nguyen Duc Thinh wrote:
>> This patch series performs a thorough pass across several files 
>> in the Linux kernel process documentation directory. The primary focus
>> is to improve readability and maintain a professional tone throughout 
>> the guides for a global developer audience.
>>
>> Core changes include:
>> - Expanding conversational contractions (e.g., "don't" to "do not").
> 
> Is this necessary? I'm not sure.
> 
>> - Rectifying minor punctuation oversights and grammatical typos.
>> - Standardizing terminology formatting to elevate professional voice.
>>
>> Extra notes:
>> - I originally intended to send a 12-patch series to cover the whole
>>   directory, but decided to scale it back to these 5 high-quality
>>   patches to ensure thorough accuracy and a manageable review cycle.
>>   
>>   Also I want to know the current progress of the patch titled 
>>   "Capitalize Git, Quilt, and Mercurial consistently".
> 
> It has been applied:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git/commit/?id=4a0be1a25d98672391e8ad2a0802f08609397274
> 
>> v2:
>>   - Resending the complete 5-patch series together as a single cohesive 
>>     thread. (Apologies, the v1 submission suffered a terminal wildcard 
>>     argument error that accidentally truncated the transmission 
>>     after 1/5).
> 
> A better practice is to name it [PATCH v1 RESEND], I guess?
> 
>> Nguyen Duc Thinh (5):
>>   Documentation: process: Clean up grammar, tone, and contractions in
>>     core files
>>   Documentation: process: Clean up grammar and tone in next guide files
>>   Documentation: process: Refine language, tone, and grammar in
>>     subsequent files
>>   Documentation: process: Refine language, tone, and grammar in
>>     subsequent files
>>   Documentation: process: Clean up grammar and tone across multiple
>>     files
> 
> Output of 'b4 shazam':
> 
> ...
> Applying: Documentation: process: Clean up grammar, tone, and contractions in core files
> Applying: Documentation: process: Clean up grammar and tone in next guide files
> Applying: Documentation: process: Refine language, tone, and grammar in subsequent files
> Applying: Documentation: process: Refine language, tone, and grammar in subsequent files
> Applying: Documentation: process: Clean up grammar and tone across multiple files
> /home/user/Projects/linux/.git/rebase-apply/patch:72: trailing whitespace.
>   License (about which more will be said below).  The author is not a
> warning: 1 line adds whitespace errors.
> /home/user/Projects/linux/.git/rebase-apply/patch:244: trailing whitespace.
> Which is nice, since there is no more insanity in the form of fake-generic
> warning: 1 line adds whitespace errors.
> /home/user/Projects/linux/.git/rebase-apply/patch:261: trailing whitespace.
>    rare cases, an AI assistant capable of finding a bug is capable of fixing it.
> /home/user/Projects/linux/.git/rebase-apply/patch:262: trailing whitespace.
>    Fixes written within the same session used to identify the bug will
> /home/user/Projects/linux/.git/rebase-apply/patch:263: trailing whitespace.
>    generally lead to better and more accurate fixes as the LLM's reasoning
> /home/user/Projects/linux/.git/rebase-apply/patch:282: trailing whitespace.
> - Within two weeks, a representative of this group will communicate the
> warning: 4 lines add whitespace errors.
> 
> Should we handle with whitespace?

No, the trailing whitespace should be fixed (i.e., deleted)
and then resend the patches.

-- 
~Randy

