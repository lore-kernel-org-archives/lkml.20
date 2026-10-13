Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDEA4E4300;
	Tue, 13 Oct 2026 13:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896854; cv=none; b=e3vzAlZfZasp2w2B32r3i05Cgp6DsfXiZ7nqlY6u7jjVFtKR35O0Im4f6SUAdoAW1ZCes7iPx+xpvMKsQHa4Wtr2xnG4Ks+mguhRSTnWfBVtr6a+Qoql5zRZFIJEOe9PYZ1AD6dQGM/59Bh35JzMKuc/CFM5jLLukrxSTnl2lJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896854; c=relaxed/simple;
	bh=yImSNxOm/mWbtqz9ywKlBX/h2PudPleXwHqT+dJ9zbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gH3M+Gcva4Pzr5+2zvbqf/k7DNPNn4NfAfEWsVt/TTZDGEyu6O0wUMphsjTTNXGeICy138p3GkY4aFxcncUXBdJLiEF7fKxbEbCDFbG+P0n98qWRBU3nWq6jZ50hLRuRjN7S0o1VgyCxWQ17yN8Pqg2UBrnm1i+s7SyVNSZk4u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyL13qCx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyL13qCx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8781F000FF;
	Tue, 13 Oct 2026 13:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791896853;
	bh=yImSNxOm/mWbtqz9ywKlBX/h2PudPleXwHqT+dJ9zbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VyL13qCxx9F2GYIRkXtrA9S7hxfWu2gvZLmfVAv19+7tgf/LcbAKvYytFY/mqqKdU
	 yQiolGVDVWbwo6a3Relx0Yd3NMHDWq5/iSurASE5PKnx2quHV2XeRJwUSfTAmLKwqF
	 8+3PQI7xaPWZUjR8iuXJ/nJAefexMWTBBIVKf1SKdwqFWM4FrHgMYuVGUDmAL5fCIH
	 vzmTL3l/Wvpgn85uli7Wleo3EFQQaGklxG5Etijn5iltmCLquar+TjI1Pn3MVgb8eJ
	 TFSvwhUoSi/+FJki4HB8lNn6XBWy8YChmUq4ak8+L80ebhe20f/ep114hLA/emvM9X
	 Rdd0WbkrbY7fA==
Date: Tue, 13 Oct 2026 14:07:24 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Justin Stitt <justinstitt@google.com>, Carlos Maiolino <cem@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <as4squcShjtumzg_@gremlin>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <a296bc68-f36b-4db6-abbf-cf565c7cd3c0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a296bc68-f36b-4db6-abbf-cf565c7cd3c0@kernel.org>

On Tue, Oct 13, 2026 at 03:04:11PM +0200, Krzysztof Kozlowski wrote:
> On 13/10/2026 14:59, Lorenzo Stoakes (ARM) wrote:

> > Ignoring is the only workable long-term solution.
>
> That was also mentioned by a few people according to Jon's report on LWN:
> https://lwn.net/Articles/1099594/

Good, it's a relief for me, because I worried there was a lack of emphasis
on the asymmetry, and I'm very glad to be proven wrong! :)

(I did scan the article, will read it properly when I have a moment.)

>
> and I think I could agree with that "ignore". IOW, we should change the
> contract offer we give to people (see Greg's commitment in "I don't want
> your code": "Review your patch within 1-2 weeks") to "if I suspect LLM
> waste of my time, I might never respond".

Yeah, it'd be nice to formalise it in a document somewhere, but Linus
saying so is enough in general I think.

--
Cheers, Lorenzo
