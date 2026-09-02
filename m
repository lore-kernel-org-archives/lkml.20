Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07F32264A3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343746; cv=none; b=DuI5nG8Qp1obPyK5xdJDWTq3ptDd76myd4vNXDVk20KfnlAIQWP2bAY+9h5/k2YWcninFOVEwp3V4uYxdLLjHSoSKWYr8ncGfbtCMNnAZpT/CEM9f36QRlOMo57TJiB3uaZByJFrM7SLgDta/5+xK5iAtZvJkgiTN2Ww7CqRTUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343746; c=relaxed/simple;
	bh=EwnPd3MrHhksOyO6NW9kMCNJxkHaajehypePPFb8Ee0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYa+28nXqgnAUFsSt/+co/47NOGVvHDZSIwyDkb0Yv4jO3yjcbnAwaRzsZbEp5EXOMQ7orQ6R+k40Q3FinP2bB9CAogtTqH/UQtkJRpCKQWy9y1G06fd7nTmY3Iohn5dHScbqr88IahRGV8k2yehA2ZTMoiK4jruug+ebPFwawI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=D7k5zw+f; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AloGDmX+; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="D7k5zw+f";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AloGDmX+"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E27927A00A4;
	Wed,  2 Sep 2026 06:09:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 02 Sep 2026 06:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788343742; x=
	1788430142; bh=4eyoVhARyY8c3ayX2oU65ovPrzRBc+wnZNVAdNtoY/k=; b=D
	7k5zw+fM+2d7gTzK+knYjEyKFgO+t4i3nbQB1NkKrqhA3ShTf9d0JTvbbcKgDPp0
	EqGjR1TD16LYwOXjpzwu3LWzZXSV+FwDXEMD9w6xnjXUVSdASkTivh0v8aowNKgx
	M2oo0XwGPwMDsfKXl8N2XPpQCMENc9xBr5MGX1PNV4FSF/UybxhFTvsy1dtDp6R2
	w3xdc9Gs4C/2/RKhreXpLMm23E6ckKGf/u6vWsMnV4th1CWUTqhegQ03QtWge9p9
	H2n58GQVCbIc+bc6ludWIr/elkD77NXHSmkwuRb6tWjhkXtYFhfWUbtzuNL9snYL
	HeKSEnl7MKUR6PFNGRAaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788343742; x=1788430142; bh=4eyoVhARyY8c3ayX2oU65ovPrzRBc+wnZNV
	AdNtoY/k=; b=AloGDmX+5scehhG/OaJSz9eOQV6ApCNfPYb2xbKPoi7qCeebhh7
	ploKYWcPRMZK6H+jDvOGltUwL0nE7xpbMxn21xQOXDJeKUB2T654v0hPGNIxtaqt
	aIx9ERdgZBFD9BRu1WRYICsMTcr1UzFlO0V/HY/CGUR7FlYHASvzajEJdD7ryAFz
	ZEjal+y0BcOcGA7mnR4FpmJ/FGovSANdiTmpbZbUC6n3/n2mtZC0OPhxuEIh43LF
	VuJNgRoaAtylzwrcFpoTlqsGQ/rL5dihRYkNmfEWhqMFO+HzfF9Pl6ivHgSxQbHt
	ubEK/F4+276TUN7/dlcCPAdPfZXpc45jylw==
X-ME-Sender: <xms:vfWXavnvofDXd6N3zNSIndXutDcTMaf074qX6qMT5u1Epf-z9z5q3Q>
    <xme:vfWXaqnWnsmlJS2gnif68Qc9V-8k4G09T7ysF8Kd374DODY9fauT6Kp41p1DRtFCA
    uch6mnff0KLYxWqZIb-ABkeL13MSFHYnEX8XiJOLUcLAfuiwR-TLBw>
X-ME-Received: <xmr:vfWXakNiu-LorlGAwXak0MeyDfK1i6EtPq75uSmqZHMd5gw3_I33XMUTjtU>
X-ME-Proxy-Cause: dmFkZTGiBOszArCTT2ozfuuyGlET3SfJvgjhWow2cvI0CQD7KlUc0CYYimZ+3biXlQ4u+o
    KkvVrtlzvvlmfVoFFsV65PGXjIqzFf5nke9m9kK3RXhiZtYJtCz0PCNVQfnvyPFa4Qer5D
    YtOVw8gzpti7+qerlsizop8o3vQXpE5UNY/3VRMnBUu8CSJdFqzDYjU+YNTfCavzDXYJmN
    2kFQi3rPCwyuxUv9fsTbXOcTsjKWuvfL2j9q5TEzRYefKOwHSZtijnINSdJB6vzZShbVcP
    5LwryAPF+g8abOVvLOba5+BQCt/u88dABujx1bIRJu519slcLGDrH3N8+P62ffTsPbTIQK
    LH2SO/+8pDrkXdVNo022U8jR7SkEIiSOaP0mmJXkI+18LxRAVFjGncD4hz8porf+ug4bgg
    1+24bEBdG/q3ggOtHO8Gze0FsouKTN0t7nwwF1gMuvv1YwOcjewYMYhuRzI4CkEICzEnBv
    6CYybZDUQr2MjRbnSOBWcXnCyJl3MyK5Hg+gLOd5sWvV6m4PQiEv3SLIs53PSLyQWzBdZo
    AKm6kktafDiFyG2aFFBuJrQDd46UAWzAOE1whPy+lvxwzB1dAV3KZCwmM9DHxZ3R2HEpdY
    F4bNAwQ2EAKlf1vhC3de9bpF5uHcA56ejrsMbeK5M5fEMO9ULcamcRJIHf2Q
X-ME-Proxy: <xmx:vfWXah4KaI0LNBlT92aNSPwDyRf2sJI3YMizd-k586F8yamPlUsSSw>
    <xmx:vfWXahvuy5FWv7vcHXuIiYQP1XR_RpTaQYSX8NxidJPeURV2E0idDw>
    <xmx:vfWXarOsF3j5jEs0pXyUvPeYn0SFMacE2B_hlsaTBr1BHhz42raYog>
    <xmx:vfWXatqJBgS9Yc0-jhe1XH_BgEOSI3C-MtDDDoAbYVb5NOBV5aM2eg>
    <xmx:vvWXaqGerQgwiEPUXIcctFF336lajwgi2xTi0kelKEa1HcADuPppzQoO>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 06:09:00 -0400 (EDT)
Date: Wed, 2 Sep 2026 11:08:59 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
Cc: Lance Yang <lance.yang@linux.dev>, david@kernel.org, 
	baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, ljs@kernel.org, ziy@nvidia.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-stable] mm/khugepaged: avoid unnecessary checking for
 swap entries when collapsing a mTHP
Message-ID: <apf1iWLgwMUxnHp5@thinkstation>
References: <d02405a5-1d0d-49d5-9056-1a34ccdeef10@kernel.org>
 <20260827121151.7837-1-lance.yang@linux.dev>
 <apBB01VBbmV28gWP@thinkstation>
 <apXHC7uYXE99ZgPp@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apXHC7uYXE99ZgPp@fedora>

On Mon, Aug 31, 2026 at 03:53:34PM -0300, Pedro Demarchi Gomes wrote:
> On Thu, Aug 27, 2026 at 03:07:10PM +0100, Kiryl Shutsemau wrote:
> > On Thu, Aug 27, 2026 at 08:11:51PM +0800, Lance Yang wrote:
> > > For the candidate above, the loop only reads its PTEs and returns
> > > SCAN_SUCCEED. Pedro's bitmap lets mthp_collapse() determine that upfront
> > > and skip the walk.
> > > 
> > > Emm ... as I asked before[1], any numbers showing how much the extra scan
> > > costs?
> > 
> > With the win being only some scan cost, I don't think it is going to be
> > measurable.
> > 
> > It can open a path to future work. For example, we could find fully
> > populated mTHP windows in a PMD that is not eligible for collapse
> > because unmapped > max_ptes_swap. Right now we just give up on the whole
> > PMD in such cases.
> > 
> > But there are more wins to gain there. Just saying :P
> 
> Hi Kiryl,
> 
> I devised a patch based on your proposed future work idea. If you think it
> makes sense, I can send it to the mailing list with a Suggested-by: tag.

I am not sure it is worth as the moment. There's lower handing fruits in
khugepaged that has to be addressed.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
