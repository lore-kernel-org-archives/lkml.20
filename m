Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E473A370D5A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860665; cv=none; b=p87N9SluSQBqzBu/dhgY29dATB0qxFitmTki+JOVxC4gRpOgaQn2e2ETZwKoLMK/ZfLKuiGgkVEdTi+BdE750z0Tjhe2YOdz7Mi0KNHh8cGnOtxpCCqqlQx0rlVCdDBpCDNiBOlKPqhoSxUWxwi/RfAOxrjD3lf5oFu0E053E2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860665; c=relaxed/simple;
	bh=uZUSyCjaL6sHNcCYjgc/CVgib4kgFbFfTTOwh7PS34k=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mqduUOpEKGyGex3l4AA5FiBcqVnbVpeU49E5or7iOYZwi5MeJPjoshKhtV3mKQRVXnF+gMsC2hpXqe7JuKkP99A1eIHh2cH0yUUX1PTthOyJshFLXtInDRqgT1VSTn7ClkBFLB8fSdeZ+X3xwaGtpqkzy2UHXJLO13vhjun/ivg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Dp4DZu0m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Dp4DZu0m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8261F000FF;
	Tue, 13 Oct 2026 03:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791860664;
	bh=CMbR3+Id05Igky4vbLXfR35xZqtM1S3j3pEibVOVSNM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Dp4DZu0mNxJsBrW2q9AwiSYaTa11YdXTJtcAdopb9fOXfo+IK7LV+k13Ha2frsOm3
	 By2LcBQJ01isDRZknmRU/PVfJavmgaWBhanCKMxBGFRair98CrWQpNTDwqj4GXBSBw
	 HAGDPR2eDnVShv6WJ/21DuHvUjQe4f/yUjRtWrYM=
Date: Mon, 12 Oct 2026 20:04:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: syzbot <syzbot+9d97402eade2fc0c065c@syzkaller.appspotmail.com>,
 david@fromorbit.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 muchun.song@linux.dev, roman.gushchin@linux.dev,
 syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] possible deadlock in igrab
Message-Id: <20261012200424.0c88c16c44059a8c7ffd86d3@linux-foundation.org>
In-Reply-To: <103d5ab1-b9b5-4cf6-bf87-87771b91eea1@linux.dev>
References: <6acd315b.8cdf6287.1eb53.0133.GAE@google.com>
	<20261012185640.5568805f927f4de127bf0f28@linux-foundation.org>
	<103d5ab1-b9b5-4cf6-bf87-87771b91eea1@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 10:17:47 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:

> Hi Andrew,
> 
> On 10/13/26 9:56 AM, Andrew Morton wrote:
> > On Mon, 12 Oct 2026 12:13:31 -0700 syzbot <syzbot+9d97402eade2fc0c065c@syzkaller.appspotmail.com> wrote:
> > 
> >> Hello,
> >>
> >> syzbot found the following issue on:
> >>
> >> HEAD commit:    b01868671970 Add linux-next specific files for 20261007
> 
> Looks like this doesn't include my latest fix patch in the testing.

Damn, sorry, I forgot about that.

> Fix patch: 
> https://lore.kernel.org/all/20261011045956.30277-1-qi.zheng@linux.dev/

And this has 
Fixes: b9b1861d4f7a ("mm: shmem: make unused huge shrinker memcg aware")
so all looks good.


