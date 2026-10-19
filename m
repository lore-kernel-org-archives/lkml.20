Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1818F379C5D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792379741; cv=none; b=SVDbm5x+cdje4M4tDBhq4OM9RHtCvlo20o8p6WAYMOG+HeVOhxkrW7f5WWLXs2LAd/uaQNhbp7y5YbAB8tYPhLqG5fa8lfLYCdqiPzCxDLXu69c1VP4xN0esIiLzQ5STZeJ0+r+wDL3aefwByXCr20u2omxPdITpa8/EFgSj+yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792379741; c=relaxed/simple;
	bh=bdGfcucAiWw7jol+tlMNMZDMPnuOhYfQNvMnFv2+Z68=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=m6wSbGPEbne3AkcnRyyYAEAyPntgXGWYadzLTTVZaqs21mwl95BYgF0e4pd3YRsXNRsWBZmPNiMDHY6FrVqpPL+x2h+vD9PHIDufgRdC3kllvg0vgtHdXyDf9TAEv08kldWoTO0lRnmPN7b8JmcIAh03rWtEL0ZV7GngBIJtNsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1p9YLpeT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1p9YLpeT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121F71F000C4;
	Mon, 19 Oct 2026 03:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792379739;
	bh=kHRfflK+JeBKoM8boglU8kC3zJbIN9N75Z6QiHDkTXc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=1p9YLpeTOebim74GzqQgO/JSYfD0qidsx549ARU1z3ZbUSWPp5tvwfqKiGJnIDrul
	 TzjrGDlGgmF9XVSIGdws19OVOpIvUYX3AM6z0MJzKf/NExsGf+n2LgCJnkBhoSmrgp
	 P+lheZzrelM0gZBfu14xN7Td5QGNFkzRv/PZTr+s=
Date: Sun, 18 Oct 2026 20:15:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Cc: Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>,
 David Laight <david.laight.linux@gmail.com>, Rik van Riel
 <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@kernel.org, Mike Rapoport
 <rppt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Pedro Falcato
 <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>, luizcap@redhat.com,
 pbonzini@redhat.com, Tal Zussman <tz2294@columbia.edu>, Matt Fleming
 <matt@readmodwrite.com>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-Id: <20261018201538.d0957878f378a9821852836f@linux-foundation.org>
In-Reply-To: <atT5TYyLapHO5ZoX@pcnci.linuxbox.cz>
References: <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
	<20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
	<20261009090042.39ba9c06@pumpkin>
	<aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
	<20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
	<20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
	<20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local>
	<20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>
	<20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
	<atI_yuCc4BiweBQP@google.com>
	<atT5TYyLapHO5ZoX@pcnci.linuxbox.cz>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 18:52:29 +0200 Nikola Ciprich <nikola.ciprich@linuxbox.cz> wrote:

> 
> Hello Sean (and others),
> 
> I think I've finally found the (at least) one missing piece needed to reproduce
> this. At first I wasn't paying much attention to nested virtualization, because
>  we don't use it much (or so I thought), but I was still wondering why
>  why all of this seems to be tied to Windows guests. So I dug into advanced
> Windows security features and found out that newer Windows versions use
> something called Virtualization-Based Security (VBS), which relies on
> exactly that: SVM/VMX, i.e. nested virtualization. (I'm not a Windows guy,
> so excuse my ignorance here.)

Well we initially thought that nested virtualization was not involved.

It it indeed is in the picture then it might have been 55780d8a1dcc
which unknowingly fixed this.

Are you able to test that commit on the 6.18 kernel?

