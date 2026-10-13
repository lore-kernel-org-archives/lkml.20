Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130262E06E4;
	Tue, 13 Oct 2026 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896383; cv=none; b=XQPyHagl6BQ48PSZmrGn34mSc9nT75fh+Rq4iiBi+B+PmSEPCx3zsVFvS99uTEMpoIt5zDquB+rrC0CbE5F3WeqQ4SQh+GbKqmqDWRoHfotBAy403vxQlEHRQnUU/BkE6UEN0elcNWAFcQ6LJqCIN5UqKuzIp9oXhBDyCePgAnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896383; c=relaxed/simple;
	bh=EXj0j3Kxq0vVidFgwNPz2X59Vb/3rf0mRYkOJ1R4YCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7qNgJvY+7rdNaOSVEb8+S2tFC5I3f0I+zxpOxFHk1sPGe7nF+5lDHqxhbVtvjBJb3lxQo2Jdi3YPErSmgSWO9J1hwxlL6Tlc2/h4lXRwZxB9T4Os7p0b3l9+3imjnoGyqjhIGCZVGTafj3IxrIV8Af4mSmOK1NvBoYGf5pN/L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZioYJ4BX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZioYJ4BX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FE81F000FF;
	Tue, 13 Oct 2026 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791896382;
	bh=EXj0j3Kxq0vVidFgwNPz2X59Vb/3rf0mRYkOJ1R4YCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZioYJ4BXlOOxW78poqtGa8fwhWyZSCSvFTjA7F0h2lgeq+j8GN4+Qgl4QjELUgluO
	 bAXTQ5I3zATU/9pmhngV5HNP99LAVb4HQGbEWXtkPCmlkxOXAL5BvRmGV1fDfHHPmr
	 yfmhO4YkFAiIxS91G1OAgZwfIUdswvWS5d7d1O4D7oBr07tsWXdykTLDEkd+Y0p4GZ
	 GfSXL02y5sRixSNj9vquSTKvvdi1jhHJ9h3EPcaYQk1Wkez35EOWjeV7q96muC3TIX
	 h53DvjaPvNc1qvTGMC5zWMLTsCCz8eKCCS7VEDA3CuLYXMXzrYjURNgyvkOm6UPOvD
	 y17pOjup9m2ww==
Date: Tue, 13 Oct 2026 13:59:33 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
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
Message-ID: <as4pAEnLd4H68W4W@gremlin>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013123132.GC4214@killaraus.ideasonboard.com>

On Tue, Oct 13, 2026 at 02:31:32PM +0200, Laurent Pinchart wrote:
> On Mon, Oct 12, 2026 at 04:42:46PM +0100, Lorenzo Stoakes (ARM) wrote:

> > The tag's useful for push back on review,
>
> That's the point I raised during the maintainer summit. It's actually
> the *absence* of a tag that helps me push back on review. It allows me
> to ask submitters if they forgot to add the tag, and in many cases (so
> far) they simply don't reply.

While the tag's useful for pushback, pushing back is the issue.

The asymmetry between submitter volume/reviewer bandwidth is the MOST
CRITICAL issue we face.

If reviewers are required to reply to all of these people, the project's
dead, AFAIC.

Ignoring is the only workable long-term solution.

The issue we had before was a lack of a CLEAR and LOUD 'yes ignore these
people' from Linus.

We now have that :)

--
Cheers, Lorenzo
