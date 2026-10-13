Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1EF518148;
	Tue, 13 Oct 2026 14:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902484; cv=none; b=Q9Gfx0txlDOqVuZzPqqzJK+XVIiD7lmvvEjNx68sdP1MlYAu6+dxY1cpVaG/MmrUrH29QSAKiYe8Bsn14wxbiU5zRUbHpp/rn6d31TSp6tIGHTHy+RgwFDySFjlk78M4YUUcp/OAubysQH3CLPL4/wuXc64c0AhslyRqo3KTSVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902484; c=relaxed/simple;
	bh=qBlgvnh7S9cIR1gGAmDLyJ0aMg0GNcoA8jxjhlwLIgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cLprTmb9x0XKFD58maSUJ+6QgnJvAUbG3FGGx03tSrGWXoZ2C8SakG6JP0hjQer02urIQz9chs889ZU7iD5WeSBXI6g27b2lEHGPtGs8rhm2GRN5N102ryyK4roqIJqpi0no4XIkWlqz89+T/8L6lD4meDTv32RDOMIcuSxUqYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndn9Uc3H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndn9Uc3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826601F000FF;
	Tue, 13 Oct 2026 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791902482;
	bh=Eu8mGEHoNpGGmUTmXtJBSuHW5VuM1oWvJon9lweWLmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ndn9Uc3HW/By2MO/Ss9AhZ7bEWmBlJzEOG6nLCNsx62OghlLBnolcZ9swED3GULfp
	 pWwVc2PwTDCSkgof5Rl4QuEpSomZ3TFVfkt9UhchjHUsoU5PUT+5N52fGOTZ+e8rTx
	 yVZVEqEOLN12Uvyz9p+9YzBvF4mHWKiDtPjUm0weDYvnlnWn1xUQ5Ar09Bk759qYpa
	 RzXe7rtLtqexFsMyYu4otltcIwky0p1WxZa4BOHhoJN/K600e0ZhB5UlBteulUHykJ
	 sambZVJNfCoAQKs9FO////x6EjoQWFV4RcdXSNBw4gn+NbWM5sjngLT+Otx3pRiq6W
	 lQUfaVIrR0fWw==
From: SJ Park <sj@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Daniel Pereira <danielmaraboo@gmail.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Brian Foster <bfoster@redhat.com>,
	Carlos Maiolino <cem@kernel.org>,
	David Disseldorp <ddiss@suse.de>,
	Jani Nikula <jani.nikula@intel.com>,
	Justin Stitt <justinstitt@google.com>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: remove Assisted-by references
Date: Tue, 13 Oct 2026 07:41:14 -0700
Message-ID: <20261013144114.139856-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013121501.3738437-1-sashal@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 13 Oct 2026 08:15:01 -0400 Sasha Levin <sashal@kernel.org> wrote:

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

Thank you for the nice description of the rationale.

> 
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
