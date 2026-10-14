Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F04D2EC4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983332; cv=none; b=e4tcmEeRij6n0+SDYE7ian0jdzx8fOjIi8GERXgTyBtaIi61SzJJHF5qu4xamZa14iMVd4EWXjF/1wWTVP9KDk3SEtbuLvGcL2ffRERFibEDENVL+mo//EFBJJsyoX81wp1yfvlBuSOz9OKaDQOsrfsYr0EEfYkO6MdTd7kYIfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983332; c=relaxed/simple;
	bh=zJyJwbqrIMCMA4hiRo6sDHUm2ZUNcy0WbKdZ2AnkuKA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=mXvb2lS3rlA6LsPAFn5GsMa9xjAryWi0eB7COV3Q04DM/yK/Qwk/QQs0DFFA0V8T7ynvE5RPzJbmSBlP6MjeeARvbvZRvHbwdhMSVuzpFMalTZiISVOae0bezVe/docS8IVRqIMVuDJqnKHlfu0sX+6XbmSRvNqVQDYcxHYVCrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=i7FInNFO; arc=none smtp.client-ip=195.121.94.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="i7FInNFO"
X-KPN-MessageId: 60149d4e-c7d0-11f1-a5a4-005056994fde
Received: from mta.kpnmail.nl (unknown [10.31.161.189])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 60149d4e-c7d0-11f1-a5a4-005056994fde;
	Wed, 14 Oct 2026 15:08:40 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 60125701-c7d0-11f1-a0c8-0050569981f5;
	Wed, 14 Oct 2026 15:08:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=oR4mGO5dXvh7uKRKRY3Q/50+aTcyc5zgByMmdRWQX9Q=;
	b=i7FInNFO3Xb/ksxW4x8osITtPT4xSz04pTlwnYTx7E4hW9ztYG4GXo0yWPkII33k4rw4rwAtCseEG
	 LuHgylaHq0usb47Ib/WrBBThh4ZfumoAByo5xMmMaUUhM5AG18TrbiPXc/9DVpX3QqlTOmjPhhmj+O
	 LfLJ6Fjr1ppGXg6PguVYKrV/TvG8AQ5x8W4QA51S45ZkJHuAsNPPTqXYrU4jGbHZxtCvNvbhozrCcp
	 OtcSfJ2FIwFWFlY4KNffHq4otolwWbzabvRGK9SK4bQscVT/E/44WjwNCsNaUxV+faHz5oHEeC6gxF
	 HHkFmHCc+8BF4kJF/D/Cy1/cKnouO5Q==
X-KPN-MID: 33|tlWIlI8UH/nPAUmArasZsw+htSSBd38ayYa+8PbDpIYyisi933DreQF95HlN+/K
 j++w9V9/D953sD/QQ6ZekmQ==
X-CMASSUN: 33|8ilib81BGiC4Ogwbb2AYB7SCHM+Z9biBi7EbLayFamokYY6B9feuzD6Q667AspX
 h6S1+pwsvA643HRJXfC72Ig==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh01 (cpxoxapps-mh01.personalcloud.so.kpn.org [10.128.135.207])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 60076661-c7d0-11f1-8edd-00505699eff2;
	Wed, 14 Oct 2026 15:08:40 +0200 (CEST)
Date: Wed, 14 Oct 2026 15:08:40 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Theodore Tso <tytso@mit.edu>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Message-ID: <1759910011.895530.1791983320339@kpc.webmail.kpnmail.nl>
In-Reply-To: <as7uqZn9rQ52USwy@mit.edu>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin> <as7uqZn9rQ52USwy@mit.edu>
Subject: Re: [PATCH] docs: remove Assisted-by references
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal


> Op 13-10-2026 23:23 EDT schreef Theodore Tso <tytso@mit.edu>:
> 
> 
> This isn't actually a new problem.  In the pre-AI era, we would
> sometimes get marginal patches, and there is always a question of
> whether it is the maintainer's time to try to engage with a new
> contributor who might turn into the next valued senior contributor and
> reviewer --- or who might be resistant to education and/or who might
> disappear very shortly.  AI makes the problem worse in that there are
> many more newcomers with new contributions, but it's really not a new
> problem.

This is aligned to the point that I was trying to make, and I believe you
it is not a new problem: how do you identify these "next valued seniors"?
What pipelines/processes does the kernel community have to identify and
grow these people? Just showing up regularly on the list is becoming a less
clear signal because of LLMs. Not because no useful contributions can come
from them, but because a growing part of new contributors is of the drive-by
variety. Jon recently outlined a case of someone submitting dozens of patches
in a single day. Obviously this person is never going to be a core kernel
developer, and the tool we have now (explicitly) is to ignore/deprioritize them.
Zig took the approach to just disallow LLM contributions, Linux is explicitly
not going down that road.

This hopefully tackles the burn-out part of the equation, but it does not
per se address the pipeline problem. I suggested maybe it could be addressed
by simply seeing people at conferences (and I have a hard time understanding
how one could grow into a senior without going to any ever). I imagine this more
or less has always been the case anyway. It works the same way in academia,
or really any field, if people don't know you, you likely won't get your paper
published, savant or not. There was a time when kernel programming was fairly
unapproachable, so that just the fact of submitting a patch was a signal of
commitment or at least effort (and as you said, not even then always). That time
is no more.

Yes, Hardy would have missed Ramanujan now maybe. But we also have the kernel
mentorship program, and the community can think about other ways as well.
As a senior kernel programmer, do you have any suggestions for this? I
would be really interested in your take,

Best,
Jori.
