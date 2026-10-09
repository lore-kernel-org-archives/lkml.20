Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DA73BA225
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526029; cv=none; b=ADPdqgspcG+oXzk+mcIziXDlEh+V06JbaUo8Y4rnY/Loo21Zn3uT4pqda/ElH7wICSGD6BzgOxTe6UK9WNkgJghJUQFwbFtngoA5zwAJSPgHYq45TKXn7rqv5kcZYDwZlXFeh7/Lba1BnW5R85Z/7eAv04V6C20QE+a3DVHvqLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526029; c=relaxed/simple;
	bh=bs+H3pfeuvduBarR0IofEA87LpsohPYzcS+X9GRkT5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDUMqNDx0vCWprm/g0RwZIxSRYWTTEpnhyBJ6UFqs0Y6p4hKPqFHkC+zJze1DMpBusJv77bGZgALBzCzTNN6VRyMK8GtMsdZG4RrhxNF5qe3x4upeMbSpfL/hH+ssHXVNsW4qamNCC6Ikrm8SFsNpgkKquRBav707s3TUtOi48U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJn2rdhh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJn2rdhh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9951F000FF;
	Fri,  9 Oct 2026 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526027;
	bh=/du9wEuofXf+8NbTewi6KKBVFh5WF8XdhjIfsLZhNPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZJn2rdhhDpXpLRyXCcGSYUFO/xWY5xiZdafVQU1xOzhsoWwUAkE7qApwY0rbkTBQo
	 7vNmfT4A8ISrIKc7VP5ODQFkITYw2+h61ovVyxopBilrL0H+rbDIvOZoD3jNjoI1t3
	 AFcNV0RCk81mpQcDL/Mex9farBXuY5MHc7tA/gOZ1v813oGm3pOSTsqduCMD25YPZj
	 2tEzVXH/3tygzuSFHZnvzo/o1s/VU/EyEKHe7lKokp9hFxK+rFam01Z3rqP6TnyLWK
	 K+bIYmQ/yyHq7F4oXZuAGpqo4oESvdE6t85AgcEYs+LtPPaQzMwjaMHnYgT5SbGmyV
	 iAUfzwcY6PAQQ==
Date: Fri, 9 Oct 2026 08:07:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	Qiang Zhao <qiang.zhao@nxp.com>, Herve Codina <herve.codina@bootlin.com>, 
	linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: fsl: cpm1: tsa: fix wrong clocks released on cleanup
Message-ID: <20261009-serious-jasmine-bumblebee-10ae3d@quoll>
References: <20261009053720.3146117-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009053720.3146117-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 13:37:20 +0800, Haotian Zhang wrote:
> tsa_of_parse_tdms() gets and enables tdm->l1tsync_clk and
> tdm->l1tclk_clk in addition to l1rsync_clk and l1rclk_clk, but the
> error cleanup path releases l1rsync_clk/l1rclk_clk again in the
> l1tsync_clk/l1tclk_clk branches. The tsync/tclk clocks are leaked --
> never disabled nor clk_put() -- while rsync/rclk are clk_put() twice,
> underflowing their reference counts. tsa_remove() has the same
> copy-paste bug.
> 
> Release the clock actually held in each cleanup branch.
> 
> Fixes: 1d4ba0b81c1c ("soc: fsl: cpm1: Add support for TSA")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/soc/fsl/qe/tsa.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




