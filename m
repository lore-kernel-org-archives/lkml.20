Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091E24078E5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526240; cv=none; b=iUiBnLkcwpTifoLiGo8mIqsbzyW6njlD3m6QCh1zq70JfWiMn0wPbRRjqWhDn8d0ga94932ejwIj52RuZZXdQWTSqLQ9GBHluKbHoj+RTRpDIJikXSkELHP6iSkCRWLy1exKgktr2yoGRAGJaMEaZlbQq7dDiUlsJnh3YgQwMCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526240; c=relaxed/simple;
	bh=xcZrFMRxyivjhnUKIbVy0g7EcVK4pKTeo8ZJaHotOEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQxNmAIJDmaG6c+Zvbxm2+3gsL3U6wcQOsTEkL0hueRsrhFxPXpi95T0Q9+ULWs0wocNce8qdGgUWDeAzpbhzpxJR0EboOzH61E5YtDdDlYvDAzBpgjnZ238njgDzsFx7pyzmAz4rNWR31YNFFT/iRLbpDR0xfC2ECuZ4mqzJww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYI0RK2f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYI0RK2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE73E1F00898;
	Fri,  9 Oct 2026 06:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526238;
	bh=Bnt9ePZGN5hBqrnLAmtnR+vNRgS1zeRKnODE66mwB2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YYI0RK2fKOWNLtf06iFFTM/c2Swa7r6ktaEWLBX37GtHtm+y8br8hoXW8SfoxMD6X
	 p9wwdbmSNnqM2lgVvUavLWls7JV8YBJnzcTAObR2B6/3NGPzfKRZlggneb/4qyzH/0
	 CoxZ6wIcuBTRLLWoKx6C7uL1/xm5WloPiQJaFIfcdO7BFq1wxH/Ct4E75Uiyt1NsGj
	 bbeJ0vC1Zjbg2mKFXXQ4mQgI1vsLFusKoul+oAph61wmotwXv4atCQF3uK4cJB1jZ2
	 GvypOvn8fWj2Dj8X/CjV6Or2ldbcBTQV9snCTrkkecd925NqZoZjp11i6AKUoOH5qf
	 L+0alVP96hUeA==
Date: Fri, 9 Oct 2026 08:10:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Hari Bathini <hbathini@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/opalcore: fix device node leak on incompatible
 dump node
Message-ID: <20261009-lurking-curvy-piculet-ba68dc@quoll>
References: <20261008190549.2800467-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008190549.2800467-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 03:05:49 +0800, Haotian Zhang wrote:
> opalcore_config_init() gets a reference on the "/ibm,opal/dump" device
> node with of_find_node_by_path(), but when the node is not compatible
> with "ibm,opal-dump" it warns and returns without dropping that
> reference, leaking the node. Every other exit path, including the
> adjacent of_get_property() failure, releases it.
> 
> Release the device node reference before returning from that error path.
> 
> Fixes: 6f713d18144c ("powerpc/opalcore: export /sys/firmware/opal/core for analysing opal crashes")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  arch/powerpc/platforms/powernv/opal-core.c | 1 +
>  1 file changed, 1 insertion(+)
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




