Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0924676D;
	Fri,  9 Oct 2026 06:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526046; cv=none; b=bDgx52QceDCbeGlehUjtt2R0e2aVlzu3QEq172f8IwAj2x0zSK2kHbOi6evGmJ+tHqqvbn17083J7JZw5OCM88em77cJ1r3d3T6PuRzKFGLGLhaXF4hczMUkF2zIc+PX+iMaBvEd7qlR2y2ELYstu4u7Rs1cnBpt/xtrCTgcQ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526046; c=relaxed/simple;
	bh=AD40QHPRM/uPwoHpI96Dy5bfJgcMMuQjmBqpRU26B8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7rZxG/DGP6LeHukjTI4XSE6XrbokaAMdnyzN/p5IZQf8WuZ8Ml/3a7A8oDHYctSnaZyBWFXV7FmMRLVd3EmRjckZ0P7cxlNQ9JzI0vBE6qXxqbIwstMqXiLFgVNe5NcUDWCCaPAN/gQ3XNorSRVMQIrRGfR7x8j04Zf+kvkZfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lsWXZLHG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsWXZLHG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0956F1F000FF;
	Fri,  9 Oct 2026 06:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526044;
	bh=nu+dGy6K2wM7mg9NfbX2EmyZWS9ACuR8SVMuMJ67eCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lsWXZLHGKW2d2+Z35HBZLV1PotEui8iEuqNVncbT4hdRK1ZrvjZk3AB0esw0+hC9/
	 StuOHgd0s59rQ+fGwUAmDrR0hKC3Ea23kQjIps1TJWCABjchlEFMzH092WkcZwODfk
	 wZ8t6B6oT8TuylWzF10VbSixCoZt7+E1JI3h6rqhg+zLBnTe8NE2gkUfPR9KJbygDk
	 UursROFQKY3C9aunlrWwN61gjCnzmzjgvbYzpMtiMBR7L6F9gnMXysFNnZAfcxEWB2
	 LG/jpYeqPejrrBKeAZCSOY2PZXGejFmW8f9+VvyyV1svJs2JOvWY+BWuSrGPmKp8Hm
	 mHXSZABNCu9fQ==
Date: Fri, 9 Oct 2026 08:07:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Mosberger-Tang <davidm@egauge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: host: max3421-hcd: stop SPI thread before freeing
 its DMA buffers
Message-ID: <20261009-durable-adaptable-bumblebee-a032da@quoll>
References: <20261009044431.3115704-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009044431.3115704-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 12:44:31 +0800, Haotian Zhang wrote:
> In max3421_probe(), the error path frees the kmalloc'd tx and rx buffers
> with kfree() before calling kthread_stop() on max3421_hcd->spi_thread.
> The SPI thread entry point max3421_spi_thread() immediately starts using
> those buffers through spi_rd8()/spi_wr8(), so when usb_add_hcd() or
> request_irq() fails and the thread is still running, it can access the
> freed buffers, giving a use-after-free.
> 
> Stop the SPI thread first and only free the tx/rx buffers afterwards.
> 
> Fixes: 05dfa5c9bc37 ("usb: host: max3421-hcd: fix "spi_rd8" uses dynamic stack allocation warning")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/usb/host/max3421-hcd.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
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




