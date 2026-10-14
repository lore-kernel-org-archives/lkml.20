Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DBB52F26F;
	Wed, 14 Oct 2026 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986195; cv=none; b=mC3HtD998iFONWjTtDjFJeC4C/3oZRYwP0VCTjHDG2z+bAnuDGX3cf+PX7igtsQwLhSAq3cbKfyOj+tSwhRGg4iQUPGe8aVyPIu1eQH+eH6CFoZTd+Vhd/1r0BthLR6qiYeTqHN69kEq++EdWV/bAxO6hrFRTr5S3aHmP5HnnzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986195; c=relaxed/simple;
	bh=9wH24lS/DUHKt+iBUsYkazNAzuCCa+PwBEFcGNU7IVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAvi/QDmA5kBwOKdc6ygs/v4ihwVizdEHO/1KJ5D8q7fQ5J4ttfqm8NcWegnkTMi6uZO6z5Yu68lp7LPVjhFQ2U46UIhFIim4mpyQwtBqyHEuNYHPkFpOdSaXbPZTDzmCXYZfdi7w0BKBU+S9MAN7VvATDdoZQj4Iq1GLtIZpzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/AhSll2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/AhSll2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0631F00A2F;
	Wed, 14 Oct 2026 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791986191;
	bh=9wH24lS/DUHKt+iBUsYkazNAzuCCa+PwBEFcGNU7IVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S/AhSll2Yt7U7qmot/n7kSNd3j34r1D0eTJPXlry5v3EGMoO3NbJ+ntoXNFVA6SGe
	 mV2yOM0SV3xWkd7YiyKqxQJp3pzr6aMAUJx31ZwKtfG5/vtPFNUK/twlRkF2MFCJKJ
	 EH+QG0Y7sNHlz0m37JvMqq0NuMqYwsOzgmgT5i0aL72H1wlD1q2QfX+5f87TyQ/Z7d
	 Z89xiHem+kfyrvtrj41GGWmfYskQoGe4xw3Ix1L2YjfwdKFKLePbQpmVWLPJlR8Gw9
	 zEQxa/zjmhL5DUg8rao/J2XyWuqVkXx77YFvONxabqQTWjcLG1gbnJdEH6xCQXyJaW
	 bEUQBDKNWIWLg==
Date: Wed, 14 Oct 2026 14:56:22 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kees Cook <kees@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Justin Stitt <justinstitt@google.com>, 
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <as-Ino4KNmaG77_G@gremlin>
References: <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <FAD7F1E6-5FE0-47F5-8D10-40473B39A2D8@kernel.org>
 <907933931.787284.1791903485683@kpc.webmail.kpnmail.nl>
 <202610131000.43AB316FBC@keescook>
 <20261013174243.GC178151@killaraus.ideasonboard.com>
 <202610131216.C841415F01@keescook>
 <20261013201628.GO4214@killaraus.ideasonboard.com>
 <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>

On Tue, Oct 13, 2026 at 01:45:09PM -0700, Linus Torvalds wrote:
> The kind of expectations *I* have is that people do their best and I
> expect people to understand what they are doing.
>
> But that understanding has very little to do with what tools they use.

I think that's the crux of it. Don't send stuff you don't understand.

And if you do, expect to be ignored.

--
Cheers, Lorenzo
