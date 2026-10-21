Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591015;
	b=2LdEgEkU6PofgaTsJS0roKJ5CvJyVhF2LE8mndz809uD79hy8jbHnMM41Eg+haUvR7Ex
	 SMLh3AL2Pjtdn76ItHI+5b5XiEram1Rce90iDS7Wv/M83REhoBf8gsJf+9R7NIMaPC7MA
	 df2dS0dtEoz2mwZKtApCUIGEskPUVM30PDMUDsOGJGPZUTCHEp+iCSzdGmxTaD45kCSON
	 xQtQC1N9lXMb6GHlBUvfMVexctkAgg6sG5Es7D1200lFMto7DSE9KYABvf1O81nWIuEPQ
	 CKdhE89yWTH8fS0PtHqNggKuf6yjQHx4cwrZviN2nXUNdoNOOLccNxDFZ01EakdF9lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591015;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Y6jDT1+Uf+NYmG4WR9Wq5wTWlOhPzPOvbHnwX04CA7U=;
	b=C7jCduPTxCbEHXs4jHnTVfMbFzxWaMI7Ox/7bW3sXP8ivOTvvru5/34x5QexrMpfJgCh
	 hxVUB9re2LIdBtWtZojNfByYOT+lJqRZ53pNbwx5LuCDbeWs7la3MpmzQWmHGAdCZlZ9G
	 zZ4Qn6ssNNoa6sX/KhwAr3JkaI0fm2p4ixjhGIWZGQgnlkxTAqQifwHrBrxfkj24vdpZ6
	 6AlcxcbIY9EEoUROkEtWiStWbpzje0ooZXYCpkdhZeQIo3zKwOiCo4r4jL6kbIbfUpTYt
	 q+jJ+r99X+OTVcF+xJTMlX4/YSOx9rp1ZZffMYNISNi0akWPdgyKFtBf5tanG3fPDVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5k610Af;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ABA606A319;
	Wed, 21 Oct 2026 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5k610Af
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53991F000C4;
	Wed, 21 Oct 2026 13:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792591014;
	bh=Y6jDT1+Uf+NYmG4WR9Wq5wTWlOhPzPOvbHnwX04CA7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F5k610AfzYB/Bn+C/Z6090ISaSjZ95g9I5zD9y0m1sc1sspIoh5pLoMNHuhtcV04F
	 zDsAHi1x1X5dFCk7xQhxdaJg/hzu7WWD6vDoUAjfoU569a8xnlI4xrwKvu9AKuYngk
	 XPP3LciDn3RCOcNoEtFaogHck4AO8/H8mxl+snoVXL7JJ6Rj5CE+U7V+CUjkDPXeea
	 VPxIEtbfDTLJ3WhGdx0sY8KAESptL+By1r7hEmdFMjZR2UfZpjo9sNlRxgX5rjvtpH
	 3g4XFCrwohJn43MBBt66jtcYVLe9D04zd04qDe+XnPf0eMnnN9YmJTIpkN4m5Ro98X
	 Iu4C9qjzs0YFg==
Date: Wed, 21 Oct 2026 15:56:44 +0200
From: Christian Brauner <brauner@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Daniel Pereira <danielmaraboo@gmail.com>, 
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Jeff Layton <jlayton@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, 
	Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>, Brian Foster <bfoster@redhat.com>, 
	Carlos Maiolino <cem@kernel.org>, David Disseldorp <ddiss@suse.de>, 
	Jani Nikula <jani.nikula@intel.com>, Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: remove Assisted-by references
Message-ID: <20261021-eisstadion-junitag-haargenau-af1082349d07@brauner>
References: <20261013121501.3738437-1-sashal@kernel.org>
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
In-Reply-To: <20261013121501.3738437-1-sashal@kernel.org>

On Tue, Oct 13, 2026 at 08:15:01AM -0400, Sasha Levin wrote:
> Commit 78d979db6cef ("docs: add AI Coding Assistants documentation") asked
> contributors to add an Assisted-by tag to patches developed with help from an
> LLM, and commit 816d9992d9ed ("coding-assistants: simplify attribution") later
> reduced the tag to "Assisted-by: LLM".
> 
> A proposal to drop the tag was turned down in July [1]. The main argument for
> keeping it was that maintainers wanted a signal that a patch was LLM-assisted,
> so that they could review it accordingly.
> 
> The tag came up again at the 2026 Maintainers Summit [2]. Roughly 10% of the
> 18,533 non-merge commits in 7.3 through -rc7 carry an Assisted-by tag, while
> actual LLM use is far more widespread. Some contributors do not know about the
> rule, others leave the tag off on purpose, and few maintainers ask about it. As
> a result, the tag does not provide the signal it was kept for: its absence says
> nothing about how a patch was made, and for developers who use these tools for
> almost everything, its presence says little more. The choice was between
> finding a way to enforce the requirement and dropping it, and there was a
> strong, though not unanimous, consensus in the room to drop it. Greg
> Kroah-Hartman, who argued for keeping the tag in July, supports removing it now
> [3].
> 
> Maintainers do still want to know how a patch was created, but the view at the
> Summit was that this belongs in the cover letter, where it can describe how the
> tools were used, rather than in the changelog.
> Documentation/process/generated-content.rst already asks contributors to be
> transparent about tool use and is not changed here. The rules on the DCO and on
> the submitter's responsibility for the patch stay as they are.
> 
> Remove the Assisted-by sections from coding-assistants.rst,
> submitting-patches.rst, and the Italian, Brazilian Portuguese and Traditional
> Chinese translations, and drop the handling of the tag from checkpatch.
> 
> [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/
> [2] https://lwn.net/Articles/1099594/
> [3] https://lore.kernel.org/all/2026101327-cupid-legal-6cf6@gregkh/
> 
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

Reviewed-by: Christian Brauner (Amutable) <brauner@kernel.org>
