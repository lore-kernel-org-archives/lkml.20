Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3FC4AA588;
	Mon, 12 Oct 2026 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819777; cv=none; b=iu3+Ewg9eMEHjgpAh93uKU4dAcOLt+PU0YiNat6Q43cktKqAH8ESyubxiR+0aEDeuGJQNfh6q8KxYOwJ05SgvbA9Jd81Sk4PrmB0dHWjF6fw+jGyf2KhV92+VRAwWe5EgpKyrBtRjcG9Ciu9yJHIHKFR1Xyan42vNLfw8Arx82I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819777; c=relaxed/simple;
	bh=X2iOuKDIcM6P2f2Dk/sgBqtjQv8dg3hwr0i+5pVjRAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0T/sI/+wRAV1a/fbVfyUmF4qnOG3dB3JzTD17GY2GonTuNnKTgJuoazsF6lt8nyQr6uFZeOsDbKotFuPxHd4xGNuFbWsJNNkB6D1TlbQggWS7AK1COEuvOqyDOAsaZLdXXM8nl7KGZEJodB3heqIWCgb0Pr6LyrxiRnOZR4Ok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fum2f69t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fum2f69t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21091F0089B;
	Mon, 12 Oct 2026 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819776;
	bh=X2iOuKDIcM6P2f2Dk/sgBqtjQv8dg3hwr0i+5pVjRAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fum2f69tIVeQQmSs7POwa1MxF+0wWWGv8G69k/QhPJ9lSQHCmOuWSTyG/Pq2hdV+8
	 cncHcCWMPkbBv7WZ9lqtI/oL4OuOivKbEaxIPAg4z67WIXCnCO4BuxHV06J7L0orrd
	 BJOgvIodRsZvb4NQQzoTcR50kobo5lTBcF02I4EL289Kg7mk4P5gQ7gd8Z1EubNHGR
	 JrRIyfEvLf/vubqflmFPRdGTwe/xEEyEs1cM0lS8+hTkBFlO3cLBIUNM8M4KJ8KD2X
	 b1J/AfGyMr4zUXeZhgy0te15G2no/tF1OYoFo8oa38c78VNTgpfJEuWfcPtlaAiQJr
	 f2KddCPBZoaKw==
Date: Mon, 12 Oct 2026 16:42:46 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Justin Stitt <justinstitt@google.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <asz9AeFe3CutP73z@gremlin>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>

+cc the participants from that thread FYI. The original patch is at [2].

On Fri, Oct 09, 2026 at 12:05:06PM +0200, Krzysztof Kozlowski wrote:
> On 09/10/2026 10:31, Sasha Levin wrote:
> > The Maintainers Summit reached consensus to deprecate the Assisted-by
> > tag. Remove the documentation requiring it.
>
> Please provide here some sort of arguments used in that summit
> consensus/discussion. This basically reverts/changes previous consensus
> [1], which is fine itself, but it lacks reasoning.
>
> [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/

Thanks for linking that! It is important to ack previous discussion on
this. Also LWN article is up now at [3].

I'm less bothered than you might think by this change.

The tag's useful for push back on review, but the only long-term strategy for
slop is to aggressively ignore it.

Linus has made that clear that that's fine.

What kills the project is having 1,000 slop submissions that 2 or 3 people have
to do something with.

The only long-term solution to that is to hit mark read 1,000 times :)

Sasha - maybe worth linking the LWN article now it's up in the commit message
and adding a little more detail around the decision?

Otherwise LGTM:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

--
Cheers, Lorenzo

[2]:https://lore.kernel.org/all/20261009083137.3-1-sashal@kernel.org/
[3]:https://lwn.net/Articles/1099594/
