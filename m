Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911054D09F8;
	Tue, 13 Oct 2026 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897314; cv=none; b=ozYbSuvc2MNuqHwAnXdTmEWCyVcMAY/PuzlUK3z79HJoNGQJb+nNvqaf5W3uEZygB5fPdFhTd7RBdfEFuqmWX0tmsGSAtxCUTHnZrVzbgWTJOG8koiDw+rhtOX5c7RVKbl3hAYaf3J6YxpnnXvVI37JaxA+tTK1TJxKP2Y2jSRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897314; c=relaxed/simple;
	bh=0cRmbkSpWqtOkdLJMcGkz9vtYphpfeMhHKc91PFNl/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LelJ0vu8btEH9G/eaRRKJrhNP4cAK7a81htVCXG9Z6YsyW0xt9jCLSJ7/vIBGJUSf04GvGWaQJH6c+A7QHkQd6h23+lwKOh+SH62wqWKcpR/mw8Y6eldtKTR2X75Jly3JCeqM+ftjrFKs09H1QbsvpfspuEZULDpHGsGTvWwYBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VcHctNc+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcHctNc+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888561F000FF;
	Tue, 13 Oct 2026 13:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897313;
	bh=a3iCVAL8BhnB4sqclc4yd2J5otsrZl54zKQnvrRdjPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VcHctNc+w54BL+VCFquFWtEY3XTGhE3/2subBJif2ocq17rp+4V30Gi7SJa1jsJlE
	 SnIjvNo/1QRzf29yezjOc1/OQgTFZZS3FEKcZJSoPSe/lUj8hLn0eGPRSIIzDzHSLo
	 UhG2fxrDNxZpjSojqtccRGUuSLkRTmFn9HvpuWKFawZ7xPq27aa8ckZa3zm8qJtnEC
	 EPLK5Swld2vi4Ke1iEmnk2+kUCFVWCekG+OEnfp8V1C4Rp/V+Pk3JPJEntevo7URKE
	 XK/0boGZ9xoBSzozwJ/ah62y7xiWdeQbeJsKlC7YLdy0jHSNzh1TN8IgcT4MkqNknd
	 RRXbeATrncJJw==
Message-ID: <c18f2a40-53e0-4161-9c3f-6511eb5d811b@kernel.org>
Date: Tue, 13 Oct 2026 15:15:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: remove Assisted-by references
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Daniel Pereira <danielmaraboo@gmail.com>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 Dongliang Mu <dzm91@hust.edu.cn>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Linus Torvalds
 <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Steven Rostedt <rostedt@goodmis.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Kees Cook <kees@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
 Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>,
 David Hildenbrand <david@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Mark Brown <broonie@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Brian Foster <bfoster@redhat.com>,
 Carlos Maiolino <cem@kernel.org>, David Disseldorp <ddiss@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Justin Stitt <justinstitt@google.com>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <20261013121501.3738437-1-sashal@kernel.org>
 <d509cd9d-746c-42ff-97eb-3bddb889a78e@kernel.org>
 <04229bc1-f25c-4733-92f8-4508c1540611@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <04229bc1-f25c-4733-92f8-4508c1540611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 15:10, Krzysztof Kozlowski wrote:
> On 13/10/2026 15:08, Vlastimil Babka (SUSE) wrote:
>> +Cc ksummit per [2]:
>> 
>>> There was, finally, a suggestion that the ksummit mailing list could be
>> used more. There are usually interesting discussions there in the lead-up to
>> the event, but then it goes quiet the rest of the year; there is no reason
>> why discussions of that type can't happen there at other times as well.
> 
> Then it would be equal to workflows mailing list, no? We already discuss
> (or supposed to discuss) all process changes on the workflows.
Yeah somehow that list (unoficially?) evolved from the original "people
share their wofklows" purpose to discussing process changes. But I wasn't
sure if enough people are subscribed to there yet vs ksummit. Also this
patch follows directly from ksummit (maintainers summit) discussions. Can't
hurt to aim for the widest possible audience of maintainers to see it I think.
