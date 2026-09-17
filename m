Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE4644470E;
	Thu, 17 Sep 2026 22:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683057; cv=none; b=PF073dGxfY6TUoD+JXEnZhdTcvygo9dstKoP0JKiSIFtxcsdlrV5ECnVXNz4TLLJAEnUgSJwX/OPEJtxsnrqCrDipLJm6FHNBdVlo0bsdyjGLw7VbIdpM7p8bZaxd6xjxdTTffloYLbNvVh6f8Bo7jefjEMeDmcQN3kkfli02nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683057; c=relaxed/simple;
	bh=cM7LXzY/KGPME5J+mRrtRkF0NI3utk1cOSA142rVDEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nf5D4/zrnDqJNya6Psn1amGPPwG9Tr1gdoKeVdF0fuT2eLIjZAjcfBJvPiNkSXJ4dGGCijwE1K+MrWvXU4gwGef4VzDQiawK4G0n9ayV4FLBEAfhdUXIlWPyLxCARh9vDXgj/xqhX3FH+ArlZHhOKDAsmoWqefjSHbmN6Itew6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkYlB7cA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkYlB7cA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F082E1F0089B;
	Thu, 17 Sep 2026 22:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789683055;
	bh=uAFCops9AjEdn+AgQKpAoDwx2IEBXFVaVXoi0wLl/CU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gkYlB7cA4c6FOosBjPSsYpFvZ2hZHLlLGUj9BKzFJIG9X0hKbLs9Q3WlU7wfZe+Cw
	 XrRra8s1NSaedC+Hpv7xmUjhwm8DDjMzegqYx/aIe1ifWVc6y1y34WrP/JmuM9svpf
	 /c3Q32KBbdkQ1QIqwKcNQbibtNB+oZqIInUy3QzJqf4II/kcMLKA3MjywxD9IDya/0
	 rbTC2F3Kd9lIRsRmLRRe/q9roND1tsWhEFC/agrVK/HWVl+SkiQgw6um2w7ciJhgKB
	 tzomNSp/NtUG6bFb9LwfM5uRZFr6hKq0t02xbMOVIHpzhnIrOz6HSZFEv+W6rUxPvS
	 kciFKPAvDZbxw==
Message-ID: <d885255a-c3f6-4c96-8ebb-f611ffa29418@kernel.org>
Date: Thu, 17 Sep 2026 23:10:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: messaging: fix leaked PM vote on tid allocation
 failure
To: Zongmin Zhou <min_halo@163.com>, srini@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <20260827021409.24500-1-min_halo@163.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260827021409.24500-1-min_halo@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/27/26 3:14 AM, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> In slim_do_transfer(), when a transaction needs a tid and
> slim_alloc_txn_tid() fails, the function returns directly instead of
> jumping to slim_xfer_err. The runtime PM vote taken earlier with
> pm_runtime_get_sync() is then never released, leaving the controller
> permanently powered up.
> 
> As txn->tid is still 0 at that point, jumping to slim_xfer_err drops
> the vote exactly like it is done for other failed transactions.
> 
Patch itself looks fine, was this bug hit on real hardware or is this
generated from some AI.

How are you testing this patch?

> Fixes: d3062a2109309 ("slimbus: messaging: add slim_alloc/free_txn_tid()")
Missing CC stable
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> ---
>  drivers/slimbus/messaging.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
> index e2dbe4a..ee127ef 100644
> --- a/drivers/slimbus/messaging.c
> +++ b/drivers/slimbus/messaging.c
> @@ -139,7 +139,7 @@ int slim_do_transfer(struct slim_controller *ctrl, struct slim_msg_txn *txn)
>  	if (need_tid) {
>  		ret = slim_alloc_txn_tid(ctrl, txn);
>  		if (ret)
> -			return ret;
> +			goto slim_xfer_err;
>  
>  		if (!txn->msg->comp)
>  			txn->comp = &done;

