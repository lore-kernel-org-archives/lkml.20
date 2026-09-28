Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363184E4C42
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608022; cv=none; b=Ir+VmCjsAXvmWTFkm5/gowkkc+IuWuf6Nw/NDMnKKfyIJLRaX0Eg+7xWQoHNve+4BkWGXt71zSaFkiutM+0bo+O3Dl8TkcF/4LdZIhuMNfQdkA6IltIBi/3DqzizIOts9SNK/1CFttsNaVDkXT6wTrzxGvm6cKbbfUE07PqXZv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608022; c=relaxed/simple;
	bh=1jo+fybYBboF3419Ow6OR0p+7eZHDPsCvCZN+n6IwwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6Zn7w2YjgRQBD1w4soDOiVcSvyt7MWrzgZKt7yvmqGaRuFao0Ep5O8AZecM+ASLaWDKl47VM7JVCMnjx04PGmN8WykqZg92iDT3XAJbb8lGMk/Y3sZdbCZh2nNtdTHiggR3DJUwm/k8G/1zgxQyrn5ioy4ONqxhNftI6drwvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEfzoT9P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEfzoT9P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7611F00893;
	Mon, 28 Sep 2026 15:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790608020;
	bh=pdaf0FQ30g0zD0j9dALtzclRPy/x07xaaFy8X/gBwYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DEfzoT9PtlYn8foW6UidpY6h/EFtPzGXSr5IBEM6s+1E13y8kzjYjwuO8fe0yCdwB
	 klGBLB6eUdKFQzCjy9tbMmy3Yv8wyl3W7CWaZS5jfTU2W1mOAAeRqUgVswqrCWh6Jw
	 MsWxlcA/P3xlNt5UwqU2aP9doFZ1T2TMtkxAvjvpvbhgM6bdKgmwdcjhqGUndUb9LA
	 baIkicrg4RDGzTP3f+C8QGi7MOzy+zPfo2RV2k80LvBgOAc9mEW1fQ6L8cRUrAdPfI
	 SOQ9S4uD8pDH9xp4BKMlJGJZMqTR0JNijnYJEztDvmvaHDP3lrecAYCaiQvjKv6pqt
	 3aFnZePtW9anA==
Date: Mon, 28 Sep 2026 16:06:55 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Deng, Pan" <pan.deng@intel.com>
Cc: Pedro Falcato <pfalcato@suse.de>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "liam@infradead.org" <liam@infradead.org>, 
	"vbabka@kernel.org" <vbabka@kernel.org>, "jannh@google.com" <jannh@google.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Li, Tianyou" <tianyou.li@intel.com>, "Guo, Wangyang" <wangyang.guo@intel.com>, 
	"Zhou, Zhiguo" <zhiguo.zhou@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>
Subject: Re: [PATCH] mm/vma: avoid redundant file rmap tree re-insert on
 new_below=0 split
Message-ID: <arp_gP_o9eacNXre@gremlin>
References: <20260924054301.2330822-1-pan.deng@intel.com>
 <araI4WsI0XMXOR10@gremlin>
 <araVBBBVY-jafePL@pedro-suse.tail5790ac.ts.net>
 <arab1d8-4b3SzoI6@gremlin>
 <PH8PR11MB68327CAD97AC4E0B161BB997968D2@PH8PR11MB6832.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH8PR11MB68327CAD97AC4E0B161BB997968D2@PH8PR11MB6832.namprd11.prod.outlook.com>

On Mon, Sep 28, 2026 at 02:44:14PM +0000, Deng, Pan wrote:
> > -----Original Message-----
> > From: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > Sent: Saturday, September 26, 2026 12:09 AM
> > To: Pedro Falcato <pfalcato@suse.de>
> > Cc: Deng, Pan <pan.deng@intel.com>; akpm@linux-foundation.org;
> > liam@infradead.org; vbabka@kernel.org; jannh@google.com; linux-
> > mm@kvack.org; linux-kernel@vger.kernel.org; Li, Tianyou
> > <tianyou.li@intel.com>; Guo, Wangyang <wangyang.guo@intel.com>; Zhou,
> > Zhiguo <zhiguo.zhou@intel.com>; Tim Chen <tim.c.chen@linux.intel.com>
> > Subject: Re: [PATCH] mm/vma: avoid redundant file rmap tree re-insert on
> > new_below=0 split
> >
> > On Fri, Sep 25, 2026 at 04:43:37PM +0100, Pedro Falcato wrote:
> > > On Fri, Sep 25, 2026 at 04:27:44PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > > > This change skips the re-insert for that case.  vma_prepare() no longer
> > > > > removes vp->vma from the tree; instead vma_complete() detects that case
> > and
> > > > > only recomputes shared.rb_subtree_last up the ancestor chain.  Everything
> > > > > else keeps the remove + re-insert path.
> > > >
> > > > This could really do with a diagram and a simple explanation.
> > > >
> > > > In general you should rewrite the entire commit message yourself and not
> > > > use the LLM output at all.
> > >
> > > +1 on this. Even with the Assisted-by, this needs to be understandable by
> > > hoomans.
> >
> > Yes.
> >
> > > > >
> > > > > Measured on v7.3-rc4, on a 2-socket 192C/384T system running
> > UnixBench
> > > > > execl (384 concurrent execve of the same binary), dropping the redundant
> > > > > remove + re-insert yields ~14% higher throughput by shortening the
> > > > > i_mmap_rwsem write-side critical section during the file VMA splits that
> > > > > execve performs on the shared libraries.
> > >
> > > For what it's worth, I'm vaguely accepting of a similar change, but this needs
> > > to be _really_ well commented out, and ideally in file rmap code, _not_
> > > spaghetti'd in VMAs. The interval tree is complicated and some bits are not
> > > very intuitive. This needs to be robust. Not LLM'd into existence.
> > >
> > > This also reminds me that I should reboot the sharded file rmap effort...
> >
> > Indeed, which is why I'm treating this as a report rather than a patch.
> >
> > A member of the core team can do the actual work.
>
> Thanks everyone for your patience and time to review this patch.
>
> You're right that I should not use the LLM output for commit message. As a non-native speaker, I used it to generate commit message and comments to make it read more natively, unfortunately it had an opposite effect. I'm writing by myself, from now on :)
>
> I just saw Lorenzo has picked over this work in https://lore.kernel.org/all/20260925-speed-up-inplace-rmap-v1-1-babc48ce7c83@kernel.org/. I've read through the new patch, which extends the scope to anonymous and covers merge and shrink scenario, more complete than I just sent, it is great. I fully agree that it is a very subtle and fragile part of the kernel, I did spend time and struggled with the patch, very appreciate your help.

Thanks :) and thank you for your understanding.

If you are able to test that locally with whatever workloads you've been using
and report back there that'd be helpful? Thanks.

>
> One last thing, and please read it as a question rather than a request. I read submitting-patches.rst, and it says "Reported-by" tag is intended for bugs. While I wasn't reporting a bug, so would you consider "Suggested-by" instead (or even "co-developed-by") if you feel that describes it better? I'm fine with which tag you think is accurate, and I'm not trying to reopen the decision to take the work over. Again, very appreciate your review and looking forward to your help in the future.

Yeah it's not quite the right match, but often the resultant final patch is
quite substantially different than that submitted, and Suggested-by generally
implies:

Person X: 'hey I want to do ...'
Person Y: 'have you thought of doing it using <great idea>'
Person X: 'oh yeah great thanks will respin with that!'

Whereas in this case where it seems it's end-to-end LLM, none of that really
matches.

And if any tags are to be given then Reported-by, Closes is closest.

However, since you're explicitly asking for it and the idea itself is nice, I'll
ask Andrew to switch it out :)

(One small note - please wrap your lines to ~75 chars in emails makes life easier!)

>
> Best Regards
> Pan

--
Cheers, Lorenzo
