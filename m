Received: from mta0.migadu.com (out-15.mta0.migadu.com [91.218.175.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F214A0144
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438594; cv=none; b=qbKypcdzi34Bbt+9OebecTPYqWqjKOXiOt5i6hU7hxajpKLvfKSYKLG8Uv0GqYaYp2bD/o9B4t5HSJAEVjGenH8chgULYYc7SFx3HxwnguDNq+sST/KcJUcFsPfUsC3ji4BDzZt0zSGKvr98q6aTHobNn/TSO0giVUyereErD9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438594; c=relaxed/simple;
	bh=6Nq0IWr8coVeXmYKR6aG/2ap5/Hef8LaBQg+isnGQ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOEfitqTJAopQZ3NuA3rSjbwCOWv4bwX8c4Li8dp/zkf3+aZkcS9XrLuKYNSKRmdabYnnG2iStnxYD4qrrl9I+og8mPj/N/UoWHXalf+HSfAblhZcKkY+e1weheybFmUMEVNQseLiOIyFEkINnCLi9XF5P+ssTGSBLAR7ldEbZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=eaowOj03; arc=none smtp.client-ip=91.218.175.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="eaowOj03"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6Nq0IWr8coVeXmYKR6aG/2ap5/Hef8LaBQg+isnGQ9k=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788438588; v=1; x=1789043388;
 b=eaowOj03aW82iPh1Wzp7Xs9C7mGygdUUbEJ7w43M+tWeUBKsEX3khEhNJ2cyGuJ6JDzv1ohk
 ptOemq0jF1ngn90k9R0OlF7ACRTgPmzAaNcxsOLESU0D4lD5hXo92U/eaY9MGopCwTiICx+VU+Z
 qJYfl+mJQiCHpGpQrcf2ZM7Ejn+p9pGADvuKs2U3+olI0yLrqyd+e40149FL5+dYslBHc3r8jPS
 ttajk9kkjAIqjwaTebpPvFNntzUoMrzlVqCUUJA9DJ10yCDhbzj5Xs0XOCkM3bVgVc2e8+77gM2
 KI3ZuZ3jtlaCIVo6pnanJBg/wvMJURdgpnQHa/IttWgLQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2ef090e33ad1ff1;
	Thu, 03 Sep 2026 12:29:38 +0000
X-Mizu-Trace-ID: e2ef090e33ad1ff1
X-Migadu-Flow: FLOW_OUT
Date: Thu, 3 Sep 2026 20:29:33 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Nguyen Duc Thinh <ducthinh100812@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Documentation: process: Clean up grammar, tone,
Message-ID: <aploLWg-i315frp5@wyuan.org>
References: <20260902084430.17248-1-ducthinh100812@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902084430.17248-1-ducthinh100812@gmail.com>

Thanks for Cc'ing me.

On Wed, Sep 02, 2026 at 03:43:58PM +0700, Nguyen Duc Thinh wrote:
> This patch series performs a thorough pass across several files 
> in the Linux kernel process documentation directory. The primary focus
> is to improve readability and maintain a professional tone throughout 
> the guides for a global developer audience.
> 
> Core changes include:
> - Expanding conversational contractions (e.g., "don't" to "do not").

Is this necessary? I'm not sure.

> - Rectifying minor punctuation oversights and grammatical typos.
> - Standardizing terminology formatting to elevate professional voice.
> 
> Extra notes:
> - I originally intended to send a 12-patch series to cover the whole
>   directory, but decided to scale it back to these 5 high-quality
>   patches to ensure thorough accuracy and a manageable review cycle.
>   
>   Also I want to know the current progress of the patch titled 
>   "Capitalize Git, Quilt, and Mercurial consistently".

It has been applied:

https://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git/commit/?id=4a0be1a25d98672391e8ad2a0802f08609397274

> v2:
>   - Resending the complete 5-patch series together as a single cohesive 
>     thread. (Apologies, the v1 submission suffered a terminal wildcard 
>     argument error that accidentally truncated the transmission 
>     after 1/5).

A better practice is to name it [PATCH v1 RESEND], I guess?

> Nguyen Duc Thinh (5):
>   Documentation: process: Clean up grammar, tone, and contractions in
>     core files
>   Documentation: process: Clean up grammar and tone in next guide files
>   Documentation: process: Refine language, tone, and grammar in
>     subsequent files
>   Documentation: process: Refine language, tone, and grammar in
>     subsequent files
>   Documentation: process: Clean up grammar and tone across multiple
>     files

Output of 'b4 shazam':

...
Applying: Documentation: process: Clean up grammar, tone, and contractions in core files
Applying: Documentation: process: Clean up grammar and tone in next guide files
Applying: Documentation: process: Refine language, tone, and grammar in subsequent files
Applying: Documentation: process: Refine language, tone, and grammar in subsequent files
Applying: Documentation: process: Clean up grammar and tone across multiple files
/home/user/Projects/linux/.git/rebase-apply/patch:72: trailing whitespace.
  License (about which more will be said below).  The author is not a
warning: 1 line adds whitespace errors.
/home/user/Projects/linux/.git/rebase-apply/patch:244: trailing whitespace.
Which is nice, since there is no more insanity in the form of fake-generic
warning: 1 line adds whitespace errors.
/home/user/Projects/linux/.git/rebase-apply/patch:261: trailing whitespace.
   rare cases, an AI assistant capable of finding a bug is capable of fixing it.
/home/user/Projects/linux/.git/rebase-apply/patch:262: trailing whitespace.
   Fixes written within the same session used to identify the bug will
/home/user/Projects/linux/.git/rebase-apply/patch:263: trailing whitespace.
   generally lead to better and more accurate fixes as the LLM's reasoning
/home/user/Projects/linux/.git/rebase-apply/patch:282: trailing whitespace.
- Within two weeks, a representative of this group will communicate the
warning: 4 lines add whitespace errors.

Should we handle with whitespace?

Thanks.
