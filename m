Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B04294A10
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922463; cv=none; b=n4W/D4KGpJwiNDoUq7M4PGcDIJ3vV5DaQDJ0VOueldEXisihJ0WYEnC4mrbpGo+bbHsoNGtcF5+s+UVY2RA0zT9/DQ7PKi6S+XV/0smZ4QB6jglD2vc9IhH7Olgoep/wG2+EhPi+ffXrnsQcc0kZ57Ax5wTHdrA7nae1UMKFDnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922463; c=relaxed/simple;
	bh=FUGfd5XWuHkfusyRYub/b4fM0vweiRHOKiFa9PjAHz0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=p1xdoJPuLIc1EZjf9wzhDAEe1ChyBywpm9xVxLyQSyjcRdq3KeIm3dQO0FN6JwVt32Yj9auU9ZMdt0sYUb5R4pL0GgAd9sqp2DJ2ZMS4rnTOHO00Ss7EZv/MHSVfoCZyVMu2jiST3wcPHxPLm11fT6lRK9TgpO6zws4UKVrngK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AwGlbLg2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AwGlbLg2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F181F00A3A;
	Wed,  9 Sep 2026 02:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788922459;
	bh=L77adGrO+YLnIDMLbqVq3WjXkrZq6e7pkRIlmk3uZ/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AwGlbLg2cKsA86/YUdIRMXJZCaG67B++2lBKT0134dY4vyEt7LUemrP/hPQppBzy5
	 ME5FIXbl9rLktZSBWDe83M7akRVNmmjHhzN7Y37bu2/NiEnkd7E9P/Yjt76n6Jo9g2
	 3IWvJMbr0wTRxmdmA1p0gSTRA7lXmQ7tl5QjmMV8=
Date: Tue, 8 Sep 2026 19:54:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com,
 vivek.kasireddy@intel.com, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hongfu
 Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH v2] mm/memfd: fix hugetlb reservation accounting in
 error paths
Message-Id: <20260908195418.c5ef0f3fbc2b3bec405cd652@linux-foundation.org>
In-Reply-To: <638ae9ae-2cbc-47a4-85fd-52b67b74e351@linux.dev>
References: <20260903030134.7407-1-hongfu.li@linux.dev>
	<20260903132158.a2d6f965477220838d884bae@linux-foundation.org>
	<638ae9ae-2cbc-47a4-85fd-52b67b74e351@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Sep 2026 09:35:23 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:

> > To help people understand why we propose a backport and to help others
> > understand the impact the fix will have upon their system, I'll paste
> > the above into the changelog.  Please send any necessary corrections.
> >
> >
> > Please also update your prompts (if using them) to ensure that the
> > changelogging includes this info in the future.
> >
> >
> > I'll queue it for testing and shall await maintainer review.
> 
> 
> Thanks for the detailed explanation.
> 
> I've updated the changelog to include the userspace-visible effects
> and long-term impact as suggested.
> 
> Would you prefer that I send a v2 now, or should I wait for maintainer
> feedback first?

Well, it's been five days.  There have been 200,000 patches since then,
so this series is at the far right end of the asymptote.  Resend when
convenient, please.

