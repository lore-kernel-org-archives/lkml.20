Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007940;
	b=kOxmEnvJEyuxzdzd0yVdjDO8QwPH5Ws53/M03oB9mytTp4rFr+CdXU0POXCL2IYAmv2k
	 9h0lIec1aTA3vJO81WwIATuJbrTl7SO4LE2seXUT7q/a5dwV7lbxeqBlBTckhnDyqQqz3
	 uyYS8lpJMIL18wX4NBXalTpBUTral3pRliZA+d0I+L6ohpeJQQbURDWKL+MR6eqXVtrMD
	 3XIk2I3otfKp7+AzHnezapn/LeHwAXIQbZstMzuhHAlaTzy64K4LI6Q7XbqHUy41t22S+
	 dgp4z/B27nzTbPFPTuMXseCy62HI9d0txkVu32LPOhwGgLNhoJhzfop3ST/2bBTmgzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007940;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=rI3RzBkwmwMUPJwwDJMCua6+rB1WJIJn2/Iy8r3VAf0=;
	b=Sz5pSmP4tS4o+yzBCfDRjTxjBj64MRFSWBU3cgi1zlyuPGRyWBZv+BpnkdYm8RF7dL0n
	 Q0whUOe/e4e1QkgtfQmskVjiZ5TfsgN20qvZIdP9ktvJQL7HwhIt763nr4ZN62HMdktQZ
	 fSfopoXw7clom129cSYJlysQAHuc5DNVFBySeImVbIy3nP6J0v3CCcjo09WW7LB1TuyB9
	 hbOppY9Ae9VlHOoUMyOpg2CU73oLFH161CMCNVCd3EwDSVMWPFPcYpWhc3qQGMOSuQvkC
	 LcY97xwCRx6/C4Hl+U2Gqy7/TyZcuee4mInFwlSm6x7rHQIGwLLykWF4uuOPoItCrMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=idVueJW5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37D8606A31E;
	Mon, 26 Oct 2026 09:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=idVueJW5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98E21F01828;
	Mon, 26 Oct 2026 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793007939;
	bh=rI3RzBkwmwMUPJwwDJMCua6+rB1WJIJn2/Iy8r3VAf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=idVueJW5zPd5L593UoFZIS50Ufe+nI0XRCHNlJg4J4T2+Z4GnV3LOPMJZ3QmqsyDO
	 bep15m7aA5a8MPsnqLzoEqDI68jd6T9e1/hoSeqwAHTtDvEKLwGVm1YrNdF6iRdVtK
	 xUdoUWCy9Xp/ioVkbRsEG5YisN7sinkVUSfj5JbLLSQ2rdSsOFFbgEfgkFvKNzP7q7
	 +48U3zDYQuN/3p8NoPzbRPFdJROwNPgwNjUuCE8K43UiRrtiAvy3JaF7ppyn9wwZn9
	 zWo/GRgVdqz19+kSbuaFm/MenghSO+l47ooWQyum4RuDXO5VhSNKYJ8pBuZHhKy04M
	 Xb6EztSj1wQBA==
Date: Mon, 26 Oct 2026 09:45:31 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>, Carlos Maiolino <cem@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Brian Foster <bfoster@redhat.com>, 
	Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, 
	Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <at8bmyc_iRmy6mo4@gremlin>
References: <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <20261013173240.GK4214@killaraus.ideasonboard.com>
 <atI_TSQXzAQFWBfx@gremlin>
 <20261020211532.GD15441@killaraus.ideasonboard.com>
 <atuDosjEibZI9exi@gremlin>
 <345522644.2279143.1792963950889@kpc.webmail.kpnmail.nl>
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
In-Reply-To: <345522644.2279143.1792963950889@kpc.webmail.kpnmail.nl>

On Sun, Oct 25, 2026 at 10:32:30PM +0100, Jori Koolstra wrote:
> There's a striking parallel with the mathematics community in this regard.
> They are dealing with a similar problem where the old way used to be you
> make a name for yourself by proving a hard theorem (Linux equivalent:
> you make a name for yourself with sweeping patchsets.) That does not
> really work as well anymore as a signal for competency (at least in maths):
>
> "Among the mathematicians I have spoken with, the prevailing sentiment
> is that this traditional mechanism of recognition has effectively collapsed
> in a matter of weeks. A strong mathematical result, by itself, can no
> longer be taken as convincing evidence of a student’s independent
> mathematical abilities."[1]

The kernel isn't quite there yet, I get to see a lot of low-effort AI
submissions and they are near-universally terrible, even if they fix a real
bug, for instance.

Personally, I question whether LLMs will ever get there. They really
struggle with good code, architecture, the longer-term picture, etc.

But predicting the future of LLMs is... unwise :)

> Would it be worthwhile to organize some sort of informal discussion on
> what such channels might be and how they can be organized in an
> LLM-resistant fashion? It would be interesting and useful to share and
> collect ideas on how the talent pipeline should take shape in the
> LLM-era, so that the community can ensure, also in the future, that
> talented and motivated people are continued to be brought in and not
> drowned out by slop or other unwanted hurdles, such as having access to
> very expensive tooling (a concern that I share with Laurent.)
>
> You and Ted have views on this; Shuah runs the kernel mentorship program;
> and I know Greg also helps people get exposed to the kernel through
> various means. Then there's GSoC and Outreachy, etc.
>
> I guess a lot of these people will be at LSFMMBPF?

I'm always more than happy to discuss things! And in-person beats on-list
every time :)

--
Cheers, Lorenzo
