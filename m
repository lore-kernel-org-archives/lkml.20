Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327043;
	b=Q9Gv4Zz/IJduUCNOhJNE4tq1ucDyru7j+kCmK/YX7PTUjeWRSL8J17OCDYRpSwEgOKOg
	 zgUQkqMtYoWPRkoUq2XyfOOJeiJfapWDeuIScn9Wcha8muIujvlEk5v75D/G+wQ7yUuC2
	 BRWd4sHW9VJFqBXXT4UqyuRlutdnFhwmL9gcNqnOP+KQuer6VphfsoCK34Cb5mPf58seY
	 uGR36IT9P3RZfgtap9DA1yF3IFCxmSLBm5wlUTSyQNfBsZVY2hyV0LS0ojLBcAVFwkKxY
	 CdIn7JdJEkOq/VWpMf2EQkWIVF750TcCUHoK5EKgwUsJPECgulaRzyrl7Iw8uNg8eGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327043;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cZL1GthlzVtU2QKypsvLAA1E2TIUdiH1wSAT/Ld8YiY=;
	b=jde03O1mQ+kpEakOzhK5twS+a9afPU3DJqvAWy9q1XlYz1yIyJTGUoOY1iPYLQAQ+Rmu
	 DNI9F8afEvIQ5nntxXoRBZ/mmyGIgqxX89EDx67aHZ9IugU9+0c8NYd6643sU1yHZapCb
	 As85UzddOj7zbY4IuZBB7fOAW9Xnna/G+1eabW11oA/yJMfpTdyQJnqafu+IBLPvt+Wor
	 saNQHt6cIr5PL4/+p/zxNOFN2rJ9ZafwdG1Dsrzn4X1LvYngsr64MdgKjYELjET1MP5GP
	 R57RPCmFEC/yde+kx0kFmeJD4n2B4bVF5DuSTU96xYXOYjQLuwYrynhCkl5pyRR/myg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0OBpzVC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680AB606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0OBpzVC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864431F008A1;
	Tue, 10 Nov 2026 16:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794327043;
	bh=cZL1GthlzVtU2QKypsvLAA1E2TIUdiH1wSAT/Ld8YiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l0OBpzVCZZWsZt2XAltyVbrbIzt5LGZb+Zels/WrgDajA7VfcwELTAKXHG0z6bsIy
	 EUVRe8qhbce+Y5D1s8r0lqE2ppx/pGp5vaWion6pjrOZnXOzyE5X031rJ27g+360LP
	 GCp32fWpsvktlMh1Wj7KCZ2FVT4KcxntUkPxc3C8mC83LNapHektuVVqCPiP1m0fFs
	 54Jxud/lxeNt8ejpg3FF5lCWK4FzMQc5QZ0RG4Uz83nDrLxHyVzsfDD1ajMdl9T3Eh
	 VP4wxU1bhehp+KZQRCJwImI2v0N00C7XCt7I3BtUeyCM6qg9ETYzjyZpunzWDYmTPF
	 uVz6ALmwcFVdA==
Date: Tue, 10 Nov 2026 16:10:38 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Zhen Ni <zhen.ni@easystack.cn>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/mm: add page_owner_filter to .gitignore
Message-ID: <avNBw8RTBOoEL9Vg@gremlin>
References: <20261109110139.216653-1-sarthak.sharma@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109110139.216653-1-sarthak.sharma@arm.com>

On Mon, Nov 09, 2026 at 04:31:39PM +0530, Sarthak Sharma wrote:
> Add the missing page_owner_filter to .gitignore in
> tools/mm.
>
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/mm/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/mm/.gitignore b/tools/mm/.gitignore
> index b4ac68a08e1a..2d08f713b664 100644
> --- a/tools/mm/.gitignore
> +++ b/tools/mm/.gitignore
> @@ -2,6 +2,7 @@
>  slabinfo
>  page-types
>  page_owner_sort
> +page_owner_filter
>  thp_swap_allocator_test
>  gup_bench
>  memory-failure/hwpoison-panic
> --
> 2.53.0
>
>
>

--
Cheers, Lorenzo
