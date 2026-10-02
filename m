Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79723E2746;
	Fri,  2 Oct 2026 06:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922029; cv=none; b=gyvTYYritTfcqQrlz3vbAe6JfYhgdX9aPkQ2HqcM/0rLnLTfJHef6AJRWg7xdR5EM2yvByXFtiCxs6pZu1bvNFbWj63OMK8r7jVNR5uB7xyjE0Bh/hhFoHD+gU1H0WOKh4VpjbsdKpiKbk92Sna+wPdOLFs2u9Lcdt2n8oVPHHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922029; c=relaxed/simple;
	bh=N2xlH7moLExgSooszNWK9s90Q08woipaKqmmNrP7L1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnOkbqtkHLcdW4f7k3veWphHNA75Ha7Pd8CDcm6EvlKU0uoJ3F7KFnCbBMD6zvU3LuXFutv3Pp+j8S4PeUNAsaZXPDYQ0W49QUTTIWciQsRWNcBqXWxY1kMx9tIyyNt0bF9kNorjtNoioVjLZl9zCM1wTWfN+2Q0f/AY2tgn7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kPbE0rK/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kPbE0rK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B251E1F000FF;
	Fri,  2 Oct 2026 06:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790922028;
	bh=h+GNKfvT/CSPXWEy6/55Z2GIGxdBf9QnI6GN09v8VPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kPbE0rK/0hA5FMgw2EF3MoSynmMuGhoXduX8vKbT5W974H1Wu7IsMZ/gVkPjHl8EN
	 sYCaDNYvNWXsDuEhau0Irqc/BfbDhghszM+yUEW3CjU+7n6NTewZn8B9aRyCpzSDm2
	 tFg7e27GAz4erjq0GJZNzDBt3ClWimJHRiG6vjwc=
Date: Fri, 2 Oct 2026 08:20:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Release the TX descriptor on
 error paths
Message-ID: <2026100200-emphasis-overgrown-0a95@gregkh>
References: <20260820035203.7-1-bbnpreetsingh@gmail.com>
 <6c1c602f-2b6d-40f6-8cd4-617239554b15@kernel.org>
 <20261001232520.7-1-bbnpreetsingh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001232520.7-1-bbnpreetsingh@gmail.com>

On Thu, Oct 01, 2026 at 11:25:20PM +0000, Babanpreet Singh wrote:
> Hi Srinivas,
> 
> Static analysis, then reading. smatch flagged the txn->msg check in
> qcom_slim_ngd_xfer_msg() and while I was looking at that function I
> noticed the two returns between tx_msg_get() and tx_msg_post(). I do not
> have a SLIMbus target. The -ENOMEM consequence in the commit message is
> derived from the code rather than observed: tx_head only moves in
> qcom_slim_ngd_tx_msg_dma_cb() and in the re-init path, so a descriptor
> that is claimed and never posted has no way back into the ring.
> 
> Verification was build only.
> 
> On the stable tag: I can send a v2 with Cc: stable and the "found by
> static analysis, compile tested only" wording.

We have no context here at all, please never top-post, as my bot says:


A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top
