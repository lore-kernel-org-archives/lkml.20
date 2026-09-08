Received: from mta0.migadu.com (out-251.mta0.migadu.com [91.218.175.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381B632E13B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788838760; cv=none; b=IbftC1Y9CtvueZNEiQuzAmsD1aQH7vLVdCHSMmTnAiwSARzmmFPTkg6LzzDjMSmgJwruY3Yn3bzuYGWnVQoi89lhNFY+HekGhB5GxJ649Fv0/PKWgdHh6p5FUuvio9qsY09lM+Wc4aWmk1OX8ZtSMV1ZytuUYnb88pTb/Hl6xB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788838760; c=relaxed/simple;
	bh=yhK03DuTQi1iPHr6VnhteNT4zGo9XBaXI4LIBpf19GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTRiCOz6LEblDivzY29U65kFSi40nvMPasyUqaiHNw+LS6ojOOiZwIkClpgjqlcilxyA5O67YsDMzWI+DUoIBMuqioBhki30NkR34hrf/9cCSsLrmhGHhFSnH4lfdPDIVhCa46TyZ+LwPzcman4frj6SB3u3vCTJ1DHSqc93f/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fiwCzG6q; arc=none smtp.client-ip=91.218.175.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fiwCzG6q"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yhK03DuTQi1iPHr6VnhteNT4zGo9XBaXI4LIBpf19GA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788838729; v=1; x=1789443529;
 b=fiwCzG6q5l2EK+C7ceQ7vW42PJuwLirLfMD6Kt0zDudO2PT6n3IXURopkigUDUXnCUWRp9Ro
 iV7/a2fdjhtITqGk8gIKIqDcriwLoi2NlEgDwCrHFiImUxIP4C/Nb5PMrVKqodq8i1rLCy1edQn
 88G3ZvN9Fk7e1RhjnE9tfMpc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d4daba85eac251dd;
	Tue, 08 Sep 2026 03:38:39 +0000
X-Mizu-Trace-ID: d4daba85eac251dd
X-Migadu-Flow: FLOW_OUT
Date: Tue, 8 Sep 2026 11:38:36 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add Baoquan and me as MGLRU reviewers
Message-ID: <ap-DPHiQEnfp8hfw@fedora>
References: <06e20ef4f603a4ffeafcdbf623ce2936281457bf.1788831480.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06e20ef4f603a4ffeafcdbf623ce2936281457bf.1788831480.git.baolin.wang@linux.alibaba.com>

On 09/08/26 at 09:42am, Baolin Wang wrote:
> Baoquan and I have been contributing MGLRU patches and helping review MGLRU
> related patches for some time. We will continue to follow MGLRU changes, so
> we'd like to be CC'd on MGLRU related patches.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4d1ff4c76496..c558d5370dd0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17242,6 +17242,8 @@ R:	Barry Song <baohua@kernel.org>
>  R:	Axel Rasmussen <axelrasmussen@google.com>
>  R:	Yuanchu Xie <yuanchu@google.com>
>  R:	Wei Xu <weixugc@google.com>
> +R:	Baoquan He <baoquan.he@linux.dev>
> +R:	Baolin Wang <baolin.wang@linux.alibaba.com>

Thanks, Baolin. 

As Baolin said, I will continue to follow MGLRU, actively review patches,
and participate in the relevant discussions.

Acked-by: Baoquan He <baoquan.he@linux.dev>

>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
> -- 
> 2.47.3
> 
