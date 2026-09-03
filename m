Received: from mta0.migadu.com (out-46.mta0.migadu.com [91.218.175.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5E54F053F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454657; cv=none; b=SNNOhSGM7BnO1yejxiz52+NkXYlmsZYNfQN+Vgq4pfeG0tOGrQa2T2tfkgW2OtgY9/b2TbMHZN1+C1Vp08tPT+emTIw4LWBFKsjOrg70B9m7lNY+V7RWXUdCfoyyPVV/rgyoqqK2at9dd3QKAsH6v2i0O45UOEWe1rW6zjvrPlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454657; c=relaxed/simple;
	bh=yrTVed2V76HIXyGCXgr8lE+QFhABBpHQFtBkdMn89t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jk64YwtC1Z2Dfbe8NrXwcEFWzf8Yn/92wY+Tx2BYNnoJq1SXT6+Kv5ZGExeTuNT3lnZbLnA4MpFWPUzs0igJ/n3Zmw2XlwN9oMaOq+EWnfAdbU3Oh9gUDmRWyD4WN/nCep1s6y4B3Hj0h69KJ7cWY9DfkRcgT1BTiWVoRpxgvWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=kxXmcYWa; arc=none smtp.client-ip=91.218.175.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="kxXmcYWa"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yrTVed2V76HIXyGCXgr8lE+QFhABBpHQFtBkdMn89t4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788454652; v=1; x=1789059452;
 b=kxXmcYWawqlTDsv4WOaVIoXC0FPaNsgUcPU+JiN5gY4pRwdjLVCAkccr0pmQZPG2ayAl/27W
 cpEwF9jTJ7m89l77+VlbkgIvefHJj/QnfPyR0cT3zEbky0wfaRcihuTsfiFqT6bQfGgYXsgm0GU
 Z2JhHuKbp4/S6nKND76Cu6Q+2fYzbejOEI2DLrmk7E8VcxxrOsjDjFdHEY7i1k/g6x/kGAnogCk
 gaNDTWgUuEMml4a4PKH01i2ZrhZENt/9ptlQe2kQmmeqQ2PUO/hFBe3m5tL4wZbxAComNia/B7k
 GSzRZjRdrow4IUtywLKsU3KjlKZZQ3h75PVS3TXrhJnjQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c26a59a5668ff9b5;
	Thu, 03 Sep 2026 16:57:32 +0000
X-Mizu-Trace-ID: c26a59a5668ff9b5
X-Migadu-Flow: FLOW_OUT
Date: Fri, 4 Sep 2026 00:55:55 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Nguyen Duc Thinh <ducthinh100812@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Documentation: process: Clean up grammar, tone,
Message-ID: <apmmmz0Xo6fXgFiV@wyuan.org>
References: <20260902084430.17248-1-ducthinh100812@gmail.com>
 <aploLWg-i315frp5@wyuan.org>
 <5efba8f3-ffb0-4e1e-8057-6946e1e96db8@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5efba8f3-ffb0-4e1e-8057-6946e1e96db8@infradead.org>

On Thu, Sep 03, 2026 at 09:33:46AM -0700, Randy Dunlap wrote:
> >> Nguyen Duc Thinh (5):
> >>   Documentation: process: Clean up grammar, tone, and contractions in
> >>     core files
> >>   Documentation: process: Clean up grammar and tone in next guide files
> >>   Documentation: process: Refine language, tone, and grammar in
> >>     subsequent files
> >>   Documentation: process: Refine language, tone, and grammar in
> >>     subsequent files
> >>   Documentation: process: Clean up grammar and tone across multiple
> >>     files
> > 
> > Output of 'b4 shazam':
> > 
> > ...
> > Applying: Documentation: process: Clean up grammar, tone, and contractions in core files
> > Applying: Documentation: process: Clean up grammar and tone in next guide files
> > Applying: Documentation: process: Refine language, tone, and grammar in subsequent files
> > Applying: Documentation: process: Refine language, tone, and grammar in subsequent files
> > Applying: Documentation: process: Clean up grammar and tone across multiple files
> > /home/user/Projects/linux/.git/rebase-apply/patch:72: trailing whitespace.
> >   License (about which more will be said below).  The author is not a
> > warning: 1 line adds whitespace errors.
> > /home/user/Projects/linux/.git/rebase-apply/patch:244: trailing whitespace.
> > Which is nice, since there is no more insanity in the form of fake-generic
> > warning: 1 line adds whitespace errors.
> > /home/user/Projects/linux/.git/rebase-apply/patch:261: trailing whitespace.
> >    rare cases, an AI assistant capable of finding a bug is capable of fixing it.
> > /home/user/Projects/linux/.git/rebase-apply/patch:262: trailing whitespace.
> >    Fixes written within the same session used to identify the bug will
> > /home/user/Projects/linux/.git/rebase-apply/patch:263: trailing whitespace.
> >    generally lead to better and more accurate fixes as the LLM's reasoning
> > /home/user/Projects/linux/.git/rebase-apply/patch:282: trailing whitespace.
> > - Within two weeks, a representative of this group will communicate the
> > warning: 4 lines add whitespace errors.
> > 
> > Should we handle with whitespace?
> 
> No, the trailing whitespace should be fixed (i.e., deleted)
> and then resend the patches.

Right, I was actually trying to gently point out that the trailing
whitespace should be fixed. ;-)

This should be caught easily by checkpatch.pl, or simply by running
b4 prep --check, I guess. Better run it before sending out next time.

Thanks.
