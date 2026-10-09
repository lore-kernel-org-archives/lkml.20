Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DC240803B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526042; cv=none; b=hAEd/glSLCH0qVb7S+riWvyrZlb5ZEovK2Mav02VkZsM8xbrUIWEvpJQFcG1DZwWPeqe7SNbtvuFTJeJNBTY6dC/tqN1GyUk56SYL72VwjI6VgTmOSrmQTvCxRz6kzPeJqcetOrXsYa2P64fbvH58OnXn2dk6TqRHjoDFgtDQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526042; c=relaxed/simple;
	bh=ucz54He50teWdkvD3Snqc8YIYro1LUAPY8BIylS3u58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQEYyjgieIxdWTE+JM5dOM2ofxgwpozH5S8fMp6j4SijE3dXKJqGCJKzk9kYZM55mSCGEM8LIJDj+E726jyeGRF+TStC5vWlBJT2KYtZ0WTwMccN7xTLFAaESEIsqg357r9/6DcjL1YdWB5h3QRvxxTzVeDeVaQfbskn2lQGN5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooQmuCRr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooQmuCRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69AE1F00898;
	Fri,  9 Oct 2026 06:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526041;
	bh=B7Ii4YlWHCyeaKp0gLPF5MWlKWp8ViEZqDPsU+H/HW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ooQmuCRrCE5aFUD4BZwQcK5zAfOLDk6hyyXYVa8dSCgbAC8devBKiuhNYYLFobljP
	 tNborRn0GcIdyIxURCKpcZX87MdXTOHE3j2FtGFSptKa5nBegyIX6meRjLnY+16zIs
	 YXzlghEH3o14P+hj1HJkABfg7kFlI1UZhOeRk8wH+WzyAK6wqb0Ld+DvK6cWcck0xT
	 JM54oCdJHOH8Bn74cKWbhHLxmKNGj0kXt7yrumrVFxQ+0KOM43mOSvWVmvuWqtjgkm
	 4KEUmwFGOEQkuUlff3wS/9KI8BKwCcONyAbNeWVC3ZNsCZsVuJnXVm9RBWklTyHBSX
	 0Ehm+Rl84tEOw==
Date: Fri, 9 Oct 2026 08:07:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Gavin Schenk <g.schenk@eckelmann.de>, linux-kernel@vger.kernel.org, 
	Thorsten Scherer <t.scherer@eckelmann.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Uwe =?utf-8?B?S2xlaW5lLUvDg8K2bmln?= <u.kleine-koenig@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] siox: fix memory leak of master buffer on device release
Message-ID: <20261009-evasive-caped-oxpecker-d1aa06@quoll>
References: <20261009045626.3122539-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009045626.3122539-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 12:56:26 +0800, Haotian Zhang wrote:
> siox_device_add() grows smaster->buf with krealloc() when the first
> device is added, but the buffer is never freed. siox_master_release()
> only frees the siox_master structure itself, so every unregister of a
> master that had at least one device leaks its transfer buffer.
> 
> Release smaster->buf in siox_master_release().
> 
> Fixes: bbecb07fa0af ("siox: new driver framework for eckelmann SIOX")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/siox/siox-core.c | 1 +
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




