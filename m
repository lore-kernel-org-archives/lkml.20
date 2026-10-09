Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7370409E12
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526216; cv=none; b=QqTU83rF7lvcflsNjYYv5HCoqCCF2c7JABWC1yqqdaE01H+q3fxlu5m8LPzia2/Wn2wtN7FJrNw11skLk5VzFV3bowJYt4Sl8xUW5OFR/o7RDmvkDelm27U/P34Buc1AR9mgoeb0Po3s1nH6qY/lFbSWNS1Kt8tHo9YPnvWZucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526216; c=relaxed/simple;
	bh=Uun+gC2AtO1CHHyThqQeKh0pYD6m1fEcrc7dabT0JGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBF6fWPq2BhJGST0QuWH5IAJq8R445F4bQcRcqZjHjOPQsJRs80pjKzbSRqeEHTiVxp3KZ2+UG5qRoySa0kzPIt1y8czgNVeM8H4c0VQIoxtYV0UHEGTH0FCh5SCAxqEoUAXojeSmkPa8pXuudSHyXoYLHfnhZtUlYK3I6GiQjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cuPLDbsq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cuPLDbsq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9939F1F000FF;
	Fri,  9 Oct 2026 06:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526215;
	bh=1l5hIGSoizBJ4+ECoX3r7MfK+993Pnzr6WRToZvHfW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cuPLDbsqxxrWPpjOtxYva0hqHGIOsTqPhuw0K3MrIPdTBtW2XYREqvc28E/7r4f25
	 AaCh3+hEo+OfBSjJNgMDBTojJxsHb36GvRaLW4ELkXyvJpitzZYupq3mw31apvOqVy
	 rXIplgrkBnVkZsilwzYtlPHxsu1046VN5hDZ7tvR2fdvTtbTTT5N9mTt4ZZrg8KJxY
	 afcE/AbFHac4MVldmoM77HxmY1v7yjpSkCU4RETytekKZVyasSJwSuASaPJJiE+OFb
	 n7R9LIum9vWm/b6yEKJdoOeCFmgpfsgz4pcQSPT38TC4ZMKcp5n1Nnnx5WtD+oMS31
	 +yy8/X2N9mBGA==
Date: Fri, 9 Oct 2026 08:10:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Michael Bringmann <mwb@linux.vnet.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: fix device_node leak in drc-info lookup
 error paths
Message-ID: <20261009-proud-dog-of-stamina-476677@quoll>
References: <20261009035445.3079660-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009035445.3079660-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 11:54:45 +0800, Haotian Zhang wrote:
> cpu_to_drc_index() and drc_index_to_cpu() acquire the /cpus device_node
> with of_find_node_by_path() and then walk the ibm,drc-info property. When
> an entry whose drc_type is not "CPU" is encountered, the code jumps to the
> err label, which is *after* the err_of_node_put label, so of_node_put() is
> skipped and the reference taken on the /cpus node is leaked on every such
> exit.
> 
> Jump to err_of_node_put instead so the device_node reference is always
> released.
> 
> Fixes: e83636ac3334 ("pseries/drc-info: Search DRC properties for CPU indexes")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  arch/powerpc/platforms/pseries/pseries_energy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
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




