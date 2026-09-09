Received: from mta0.migadu.com (out-84.mta0.migadu.com [91.218.175.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E7B550DAC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956433; cv=none; b=oYQ9R93OCmM2IuazNNrgHYqk19+OXnCL+27bSGLWiX3/wLhwV13tP4g6cRZap5uG5f2a7j7DqgG6NZQpWxmmpHgjk0xOFXOCXfxHOaUCCwV1g9V7rX58AO5941uq74ZaOlaa/MEbUG/8u9q9uDz08aG20Y92lwelx8q3llXUXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956433; c=relaxed/simple;
	bh=DvN6ieXZK61nf4vXMKnWI+XqglFmplVl80eiQCsaIOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1HPSWA53mo295yUND1xfRPIAzgDkAUUPP0WV2XTtwz42P7zcrxJaE8WkZmDvSfCOf5/NjrbW1xrtVxoLwZ4kne7h8UiQTGqnhdO2BEKEWpCKc1pspyE9uM/g7Z9mXOGtwVb5NDXu/OE8UCiXGLUT2Z5RY1Yd/2WjxYLuS0j+OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=qRFNhpN2; arc=none smtp.client-ip=91.218.175.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="qRFNhpN2"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DvN6ieXZK61nf4vXMKnWI+XqglFmplVl80eiQCsaIOo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788956426; v=1; x=1789561226;
 b=qRFNhpN2/B37vRibK0TnNL14Az2f38ujoI7F4SLqn0qh2NMcCL9UXubHet+B3ZgN7KaEj6BX
 Jxg2rjq6o9rusW4LDFPU/cpvRW/UjRdY4ClzNzcPNTm08A7W+84oqrwSAwAxTayiTJG3UjQ3Slt
 xvE99E74nfUmmsqRgujpROGCVCRf3KBGyzl2kmvxY1RXEijpey1CKJIVCl2CVCQKm+aVecURfQ7
 T8d/WYz5DPG67KaZRlTYoJOmtaJzaTLeZ+A0fvU59SSRDoFDY3H93nYbWxzeAsUpi0usnAfE0LB
 orcCzmkhhmiHqXSRAJoQiXEG5crQEIX9CiVnf3tTjvuYA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d9cdd1849f173c62;
	Wed, 09 Sep 2026 12:20:26 +0000
X-Mizu-Trace-ID: d9cdd1849f173c62
X-Migadu-Flow: FLOW_OUT
Date: Wed, 9 Sep 2026 20:20:21 +0800
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <srcres258@furdevs.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Subject: [RFC] docs/zh_TW: defining a maintainable scope for the
 Traditional Chinese translation
Message-ID: <aqFPBQxq5asHzvtn@wyuan.org>
References: <CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com>
 <ap5xEtMdwXS8Pvcf@wyuan.org>
 <CAKspUh+=T_v1HpwRkA7OY1m8aU-kZgMviHxDrYpBe__8YYHQhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUh+=T_v1HpwRkA7OY1m8aU-kZgMviHxDrYpBe__8YYHQhg@mail.gmail.com>

On Wed, Sep 09, 2026 at 05:40:44AM +0800, 葉宸佑 wrote:
> > If the current translation quality is acceptable and it's not
> > troublesome to move it, I think we can just move it. On the contrary,
> > if the translation is significantly behind, there is no need to go
> > through all the trouble, just delete them.
> 
> I understand the appeal, and for some files I think you are right. But
> I would like to separate two things that are getting mixed together:
> relocating a file is cheap and mechanical, while deciding to delete one
> is neither, and the two do not have to be decided at the same time.

Reasonable. Agreed.

> The four relocations in section 2 are the cheap case: the files are
> reachable, they are not the worst offenders, and moving them is a
> rename plus an :Original: fix. I would rather just do that and revisit
> their content later.

Agreed.

> For deletion, my hesitation is that it is the one decision here we
> cannot walk back. Marking a file unmaintained can be undone the moment
> someone turns up to look after it; deleting it means the next person
> starts from nothing. Right now zh_TW has one native speaker, so
> "re-translate instead" is only more efficient if the re-translation
> actually happens.

Yeah, I thought of this point before, so yes, I agree.

Modifying existing contents is way more atractive to new contributors
than waiting them to start from scratch.

I admit that my initial insistence that aims to keep the directory too
clean was not conducive to our future development.

Then let's leave some less perfect aspects to attract others to get
involved.

> So I would suggest: deletion by exception rather than by rule. Rather
> than "significantly behind means delete", we name the specific files we
> think are beyond saving and say why. If you would like to propose a
> list, I am happy to look at each one -- I suspect we would agree on
> more of them than this exchange makes it sound.

Sure, I'd love to look deeper into specfic files. And take them for
later discussion. A discussion without specific documents is indeed a
bit vague. My bad.

> > Tricky?
> 
> The six worst are mostly two clusters: admin-guide/mm/damon (5 files,
> 55 commits between them) and arch/arm64. Those are exactly the files I
> would expect a Taiwanese reader to skip in favour of the English, so
> they are strong candidates for whatever we decide "unmaintained" means
> -- and, if you want to make the case, for deletion.

Yes, I guess nobody would read this? So I'm fine with both decision.

> > However, the former might be clearer and more understandable for the
> > readers.
> 
> Agreed, the notice belongs in the file. I will do it that way.

OK, if no other ideas or objections, let's do so.

> > And after process/, I'd like to do that part "Working with the
> > development community".
> 
> Good -- that is the section of the index that matters most after
> process/ itself.
> 
> Dongliang: Weijie quoted you above on re-translation being more
> efficient. That was in a different context, so I would rather not
> assume it carries over.

True. After your detailed analysis and our discussion, I think a simple
re-translation is clearly not comprehensive enough.

Thanks!
