Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493861;
	b=RX2C23SMAFqyxMQwNi78gZmT5666k0huNFloQGrfmPFu2cuHFAAvA4g6HYGdGzMc6lQy
	 se9L53g5QAjdHYv49/0qyGmC+Z7U71ZqCoI5BJyVbAttbcJk/yWhLa7pwg1YSQ5mSaPBp
	 DH4HFA9QzblaYSv3+K4yvJRD0zOu386fk2Dx4HW8UxD+CXxiBNB5RFGvFiE3sKloLQ687
	 gJO1034eZ9j5NsMBjIe27M+NPMibVt9xfTOeDS30CWYpsemmM2Q0IEhsn8YsDWBztEIkZ
	 lZPKmT4oUEwugw8E0NPa0UwbxjdkD/ofv57Ez6cFAZyag40GXIFVgerPP6vNf0N+d5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493861;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=wSnIb7upBpEY/eYc3ijipLppi9VmEuP2fQKeyCDNlzo=;
	b=LTqLtsqiEMevBwXk99Kql5oLoGQTH0qwuyQlOho1DgpI0FIMfZhrB38z4ZhSFZXLqc9O
	 IQE24SGixopPTcRGO12XrF0/0dB+vlmZxAaWtQh/Tas5ETowJ96WAwtohsMJy3UkBVTMh
	 inVRsUSvVro7VM+XngR0uIXQ7mYChq+iIol33Of3ofPAkLCnFY9ZnlgEwH1e56VqmcOrh
	 SZk8nH9jlUkAYvz791PG3JWSux5Jvx4yTtfNj4p9XBOo/AeoQ4DkezimjSboImS6zLBVy
	 vWLDdPYO+45qi+S1CVmhJkXyaCG0q8sxU9WFrcJvnw3MroJlvR0vWf71XYNZs9DvnKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5W1gkte;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE344606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5W1gkte
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E131F000C6;
	Tue, 20 Oct 2026 10:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792493860;
	bh=wSnIb7upBpEY/eYc3ijipLppi9VmEuP2fQKeyCDNlzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V5W1gktecp+JjOpMgu2G8S+FKs5td/FLxIxtpcn00fHEZw74hXCezETUEfVD4ju7R
	 PR97mwO2wWkfYgewh+ZUaIe9MUI8iN4fCaw7p16kahzVAMIyYD3eQgTzUwMKXv3Zl1
	 ccgN0HASBG6xglFO1pzW+e7X5tGF/e9P9tt5o5hoXEUvXaywWWq9hr2Pt6PcALupvU
	 ZnNETo6CXyMiQYuTtJkeDQ+0HphwcQDXVX4KWFrI9BN4BH0ev4xrPBEGHpsMinJEXv
	 UoHdArebb+8hupl7yMNyW8JXtXguQVkc4LTSOB6BlOZQ25ohEjmIRoK56Lkv1jWkaT
	 b1f6s5nCd+1NA==
Date: Tue, 20 Oct 2026 11:57:38 +0100
From: Harry Yoo <harry@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	akpm@linux-foundation.org, cl@gentwo.org, hao.li@linux.dev, hch@lst.de, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, nickolai@csail.mit.edu, rientjes@google.com, 
	roman.gushchin@linux.dev, vitaly.vul@partner.samsung.com
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array
 after concurrent resizes
Message-ID: <atdIhmwwhQxL3eG0@thinkstation>
References: <atTh-yyVIPQ-zNWJ@thinkstation>
 <20261018160315.1465504-1-vitaly.wool@konsulko.se>
 <atTv1tg9q9n92kZv@thinkstation>
 <F846CE95-6D2A-4D53-9C09-5C8630E2C8A7@konsulko.se>
 <3a034d40-e01d-42cf-9325-8c1e4a6db1b9@kernel.org>
 <2F07BE53-D6E5-4988-B1BD-84AD2A05DDA2@konsulko.se>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2F07BE53-D6E5-4988-B1BD-84AD2A05DDA2@konsulko.se>

On Tue, Oct 20, 2026 at 12:50:38PM +0200, Vitaly Wool wrote:
> 
> 
> > On Oct 20, 2026, at 10:27 AM, Vlastimil Babka (SUSE) <vbabka@kernel.org> wrote:
> > 
> > On 10/19/26 08:45, Vitaly Wool wrote:
> >> 
> >> 
> >>> On Oct 18, 2026, at 6:15 PM, Harry Yoo <harry@kernel.org> wrote:
> >>> 
> >>> On Sun, Oct 18, 2026 at 06:03:15PM +0200, Vitaly Wool wrote:
> >>>>>> How about we take my patch [1] instead since
> >>>>>> it isn't prone to this bug and is a nice optimization to the existing
> >>>>>> mempool_resize() at the same time?
> >>>>> 
> >>>>> It is not a good idea to squeeze a bug fix and an optimization
> >>>>> into one patch.
> >>>> 
> >>>> Generally speaking, yes. But that patch had been submitted before the fix
> >>>> popped up, so there was no sqeezing per se.
> >>> 
> >>> I mean the patch you've submitted does two things (wihch is not good).
> >>> 
> >>> It should be split into two patches that 1) fixes the bug and 2)
> >>> optimizes it.
> >> 
> >> I don’t think this is a fair statement. I would say that the patch I’ve
> >> submitted improves mempool_resize() to be rid of unnecessary
> >> reallocations and data copying, and that (improved) implementation is
> >> *not* prone to the race found in the previous version of this function.
> > 
> > But it makes the code more complex:
> > 
> > 2 files changed, 28 insertions(+), 16 deletions(-)
> > 
> > without an in-tree use case.
> 
> It does help bulk-zoned, e. g. on a device-mapper table change that grows the
> pool.

Please provide data, rather than a theory without data.

-- 
Cheers,
Harry / Hyeonggon
