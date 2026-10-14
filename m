Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D28312836;
	Wed, 14 Oct 2026 17:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997492; cv=none; b=atC6YSSiK0BgncEGfCxCbB+gGdnVzTxDOzRehGXvV+j7O+HtZzOIwXWctPymjULSxNfB7qJAI4bsZWWZHpiAfqvGKkf1lsOwBQrXXujrNBeaLwzsALj7Dk2xN8sw8Ho0m++JEMmlBTODOXHMPoScx4ZulXArWU9q/2y4Kvq6m4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997492; c=relaxed/simple;
	bh=cbWIOMLPu4GZ6t8lmnclk8wgm1707coq6u+L9fTOSBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7ER+/YMEWRE2aD+46rXkVFB8E2LMCbT2fMM8eY4odTMYwMENwg5siUa5QX3uetnAV5bb7HVSvngKgQ4kmLKutXelH1bL1RodRw9yRmtlMZOGN5svbrEaAV/lA7Pw2GhKBq5TMu3FRCj/PdCgc1dJZLW0UhAm5lZmUajwkP1Q9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUbkQwzb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUbkQwzb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B011F000C4;
	Wed, 14 Oct 2026 17:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997491;
	bh=oW2RiTusgu3aUd2jIxYNuj/f8Ya175NlwybAIfZ6qts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aUbkQwzbQPgO853M1pVH4G1XZSuBylxfWnPidNRcQ++E4s4h0RrfpIae+zrIPsjpJ
	 d06dTBNfWIhZoRkQ5ygS1O5wclhaH2iUob8Kg1Id4rzT11EUFTVdo7xUsp6ktmwlfR
	 JCw/Kuc/4Usohtoc5oADen5bq2iARUbrRAUQ5AIwtYWoZ9AQMzWUKHC4csD736WBpH
	 aIJ2UCrGlrvueMQMtifSDEFMs2PPYP9SrQDKRq21e20RbYyW09qiXg8Kf6PgVl+XeI
	 bm0rf98oQpd1aYUeG7UjndRNPmTX5LEjXKGraEwxFilf/YR9MISP54V48wmtOf0lex
	 Mxtola8qD6YcQ==
Date: Wed, 14 Oct 2026 13:04:49 -0400
From: Sasha Levin <sashal@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Daniel Pereira <danielmaraboo@gmail.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Brian Foster <bfoster@redhat.com>, Carlos Maiolino <cem@kernel.org>,
	David Disseldorp <ddiss@suse.de>,
	Jani Nikula <jani.nikula@intel.com>,
	Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: remove Assisted-by references
Message-ID: <as-2MbhDdCN2trMe@laps>
References: <20261013121501.3738437-1-sashal@kernel.org>
 <87o6cww7c1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87o6cww7c1.fsf@trenco.lwn.net>

On Wed, Oct 14, 2026 at 10:54:54AM -0600, Jonathan Corbet wrote:
>Sasha Levin <sashal@kernel.org> writes:
>
>> Remove the Assisted-by sections from coding-assistants.rst,
>> submitting-patches.rst, and the Italian, Brazilian Portuguese and Traditional
>> Chinese translations, and drop the handling of the tag from checkpatch.
>>
>> [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/
>> [2] https://lwn.net/Articles/1099594/
>> [3] https://lore.kernel.org/all/2026101327-cupid-legal-6cf6@gregkh/
>>
>> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>> Reviewed-by: Kees Cook <kees@kernel.org>
>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>> Changes in v2:
>> - Expand the changelog with the background and the Maintainers Summit
>>   discussion (Laurent, Krzysztof, Greg, Lorenzo).
>> - Rebase on docs-next and also remove the Assisted-by sections from the
>>   pt_BR and zh_TW translations there.
>> - Collect tags.
>>
>> v1: https://lore.kernel.org/all/20261009083137.3-1-sashal@kernel.org/
>
>OK, I have applied this, thanks.

Thanks Jon!

Also ping re: the AGENTS.md patch. Without it, we'll get very mixed results
with just this change, where agents will pick and choose different policies
around Assisted-by: because nothing is pointing them to the actual guidelines
we have.

-- 
Thanks,
Sasha
