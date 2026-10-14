Received: from mta1.migadu.com (out-221.mta1.migadu.com [95.215.58.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368213290C9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947527; cv=none; b=qL1Wkq04IZjK96PrnXapq2cOhqukejA5FqU36V2NpT4mCSpejmN9q6itp/lWabwE6+yHWMS+sVLzZl3gAEewLsltJdQp8tBheKvEEDcZqijDt2wD249S44Ef/CTTOa2Ipc7BaJyRVnkuPyFV0a7jXeGPq/BqIpGHWFuYcYit02I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947527; c=relaxed/simple;
	bh=loYkF41Uy03n+0MK5bjqWUlD6ePbTjgxrtXYT7g2Odw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwElnR/tV77RBNUudBRGqK/eJNBjjYuPtZJJFFmpdezNBllF48lFcbK7LotqlcENoB102t0OHsSlFj32Ve4dvflZShu1I70FmfHrvB6OPML8Z5TmKBH1eroRmm9KkYN8ONo5lhM2COVbFdKIpsDqKTD6iICjjR7d23znvzcY1zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=k5xoXJYE; arc=none smtp.client-ip=95.215.58.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="k5xoXJYE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=loYkF41Uy03n+0MK5bjqWUlD6ePbTjgxrtXYT7g2Odw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791947522; v=1; x=1792552322;
 b=k5xoXJYEZ7JyB7Z7DSAYcPrOLxeFaBO4NY0znrt4IwkcstGUFYg5BUyRVcfzks/0DuyRyx45
 5LI7geSYIG+X+Q563rfogZaFHDOUHNbj2yeuIWPPIvcyxSkIsyMNSDKMrVw1H3s0Dy2iS8bSu8Q
 c8IoCNe5ka8TReZbWE87Vip9f61pzj3U59N0eV7+yBIM27Lliz/94MatvSvPl00kCx6ERvnJbjN
 LNh8tuHdwVihXmQE+MzatDkVFxvx3s8K7S1vg71P1wVffGmxPoQEkl5YdKs6+zwiWrWL9sDNUsP
 TQgFfelmOHYOm8hF5P+ZBIdJ3/AJ1mrFCUREsFdtv9u2A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fa9852e4d2c6a547;
	Wed, 14 Oct 2026 03:12:01 +0000
X-Mizu-Trace-ID: fa9852e4d2c6a547
X-Migadu-Flow: FLOW_OUT
Date: Wed, 14 Oct 2026 11:11:56 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Daniel Pereira <danielmaraboo@gmail.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
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
Message-ID: <as7y_EKm-wP2QKK2@wyuan.org>
References: <20261013121501.3738437-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013121501.3738437-1-sashal@kernel.org>

On 2026-10-13 08:15:01 -0400, Sasha Levin <sashal@kernel.org> wrote:

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

Acked-by: Weijie Yuan <wy@wyuan.org>

Thanks!

> Changes in v2:
> - Expand the changelog with the background and the Maintainers Summit
>   discussion (Laurent, Krzysztof, Greg, Lorenzo).
> - Rebase on docs-next and also remove the Assisted-by sections from the
>   pt_BR and zh_TW translations there.
> - Collect tags.
> 
> v1: https://lore.kernel.org/all/20261009083137.3-1-sashal@kernel.org/
> 
>  Documentation/process/coding-assistants.rst   | 21 +------------------
>  Documentation/process/submitting-patches.rst  | 10 ---------
>  .../it_IT/process/submitting-patches.rst      | 10 ---------
>  .../pt_BR/process/coding-assistants.rst       | 20 ------------------
>  .../pt_BR/process/submitting-patches.rst      | 10 ---------
>  .../zh_TW/process/submitting-patches.rst      |  7 -------
>  scripts/checkpatch.pl                         | 11 ----------
>  7 files changed, 1 insertion(+), 88 deletions(-)

[...]

> diff --git a/Documentation/translations/zh_TW/process/submitting-patches.rst b/Documentation/translations/zh_TW/process/submitting-patches.rst
> index b780f1539b46b..4a7c046b23894 100644
> --- a/Documentation/translations/zh_TW/process/submitting-patches.rst
> +++ b/Documentation/translations/zh_TW/process/submitting-patches.rst
> @@ -503,13 +503,6 @@ Fixes: 指示補丁修復了之前提交中的一個缺陷。它可以便於確
>  的。注意，就此而言bugzilla.kernel.org是公開場所，但其中使用的電子郵件地址
>  是私密的；因此不要在標籤中暴露它們，除非該人在先前的貢獻中使用過。
>  
> -使用Assisted-by:
> -----------------
> -
> -如果您在建立補丁的過程中使用了任何進階編碼工具，您需要透過添加Assisted-by
> -標籤來聲明這一使用。不這樣做可能會妨礙您的工作被接受。關於聲明編碼助手的
> -細節，請參見 Documentation/process/coding-assistants.rst 。
> -
>  .. _tw_the_canonical_patch_format:
>  
>  標準補丁格式

Thanks for doing this.
