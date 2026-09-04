Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA3B3F822F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510794; cv=none; b=tjipb3YQLiv/w08MstQrcMQk1t+DJsOnw6ylWIVrW/uheOeS9Sj0nfZnOhDm7mEm1C+BxIluWgIpRewdXfM9QNHIwXkqKGHEMa8X+RInb+X33b1abNPzuPJZBo12Tr46VUTHOBbspN5CkQnyDe4WlV0Dg4cMmcT47fIVmzLAp/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510794; c=relaxed/simple;
	bh=mwC1ICga22Zc2xfvj93G5tNhKOC0G5Ue413VLSM52f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iwfxq6JqyZax9FAVUQ+R7y5R+UO+RaP2/+qkYPD5u5bpp1BtcSfYwsLQ1GTKG9PhopUqf1nCtjdYAffD/KvD7ImyWy6eYmC8NFQUD4D/y6qBGVGXN2PvPcHDPOmSa59m4ZJuQewHOFRyQbMWcVxjar3m8cn8ihpIv0geiYmx6hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFuM/UYp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFuM/UYp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6725D1F00A3D;
	Fri,  4 Sep 2026 08:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510791;
	bh=ETKNI/IpkSSnsMECm9EG9QjOb+xlfBKEXA9cJP818KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hFuM/UYpg3SXE/ato62fHdtigTsp3Cc0rUmMy1HIBJ4vnkm6YebGN/7/hvz2l+roM
	 zmVbUhxnm8sqTaKbvGv6zdPbNNHawiTv73KnodE3yBk7ww5BQHkW5O89B8TN/AKpup
	 itFvYb+E52D/0nr9L1bW3qcKexxTMGN/FtHwu1OaHJup182fcPJdtBQnoY+5L+yPt2
	 E5QOWsQHf00NAFsrWg8mdBIEfT0g9pL4ooTIaw8zgVFxGvSf3t2yiLPSQbY+N4Co4/
	 EUElo/6RL4X/qHe1X9uEHysAimCmQ3m3DvaYsAnZtqBBtve8ypWfQkqGA2kC0x8NHR
	 5fDb01hQpYNuA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x2PMD-00000006kqL-006Y;
	Fri, 04 Sep 2026 10:33:09 +0200
Date: Fri, 4 Sep 2026 10:33:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Yang Zi <2959243019@qq.com>
Cc: Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] greybus: operation: fix NULL-deref on short request
Message-ID: <apqCRJXccCSZEMrn@hovoldconsulting.com>
References: <tencent_1CB189506DEFA4B38099D654FE6C2A2F2E07@qq.com>
 <tencent_617A1B9F1DCD78A45A65AB7AFD8AAD84460A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_617A1B9F1DCD78A45A65AB7AFD8AAD84460A@qq.com>

On Fri, Sep 04, 2026 at 04:08:20PM +0800, Yang Zi wrote:
> gb_connection_recv() accepts a received message whose advertised size is
> smaller than struct gb_operation_msg_hdr.  In particular, a header with a
> size of zero passes the incomplete-message check and reaches
> gb_operation_create_incoming().
> 
> The subtraction used to derive the request payload size then underflows.
> When gb_operation_message_alloc() adds the header size, the result wraps
> to zero, bypassing the maximum-buffer-size check.  kzalloc(0) returns
> ZERO_SIZE_PTR and gb_operation_message_init() subsequently dereferences
> it.
> 
> Reject advertised sizes smaller than the message header.  Also check the
> payload size before adding the header size, so that the size calculation
> cannot wrap and bypass the buffer-size limit.
> 
> This issue was found using a locally modified syzkaller.  The
> analysis and fix were assisted by GPT-5.6.
> 
> Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")

This one should also be backported:

Cc: stable@vger.kernel.org

> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Yang Zi <2959243019@qq.com>
> ---

You should put a short change log here (after ---) when revising
patches.

No need to resend this time, but keep in mind for the future.

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
