Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17AE5012A7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982361; cv=none; b=MeHFn5nykky+zK4D39FQhvct6lBtpyWI55ThEvAzt9e43HVTBPO3QEmS+wp2jq/7QZ2bSC0OxhrVYy52b9okVIzb12NEH5H0D3YMAIzevqdSDARM3ksyc2S0aoStudyGLgU2VkI0YuxJfyhsEVedGB88K9/PISPb0Gm3HYXLtu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982361; c=relaxed/simple;
	bh=JHVx4PXMqJYlp8lW2UAdemmaCWI7bWUZI1+Vxrjerj0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/YP9aTIKTHUucfm8paVc+vMooxtAtv07fKsasS+Om3a6AinONBYuqntlx/WMXK+VsChR6+cjjh8Pf2ebaHS50+npjqTqQ2K9yreBxxyH+uqIKsAFKzqrAdwVce0Yv4bzZZsy8gBSDZBC7ZGLyc8o5ksQaT8Oy2z2oIfSwbP7IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRcyrkL1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRcyrkL1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so28662145e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791982317; x=1792587117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h2lXGRufG/CkzlVDEuwvfDVQ2gYthCpgB+y1GvWyU9A=;
        b=sRcyrkL1QvMCxpmrkoJxmjZrfWjWnmwTp/swz4YF5AxP1FZmlxobb1aVwq2ipFaAAe
         kVbje50RcdNSBXfUzbLDdtMaadvFz/G7KjFSZIOH3jkJR7VLX2aieA56FdJm2yQwGMhF
         5sl04lHWb4Nsh0LTHBmfjklx3grdRew1CVwv8RcsSs9ySYiDzBShO7j+FgMKAPXw6IbD
         oYSXHKv+KNAGpuszTYmtKIID7xdeZ/m6jNhLr5iiSuTU0h6Lc9yes7YgN3cYDMuwZ8xE
         6Q2+O5AER1C+S7NHEADtk5dCySAf1NWqPFsAPCCVQ0g/NjJkd/BvghIEmH92JOHhwHAZ
         +Y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982317; x=1792587117;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2lXGRufG/CkzlVDEuwvfDVQ2gYthCpgB+y1GvWyU9A=;
        b=YFyuLO35QO+ODdJ8Z13d1J7TLYF2o9jYYfqdRdD9dlCu0n1nyxh4i3iiN6tU1LHojq
         RoocIekvNepgFoQgGrJfgtD1id7k/4bDJIqHe5SP4/t/vnX2Ue9KcL0xPYR8UDrKlmaT
         Vxmg4eu51HtiI93b11JfN5Y5ClxvUOqLCpSZuXp6D7sLiTJNpiHs3GeygRkuWQnJKCb3
         PmsRdLhUsiFf+vs10iUrPSlcbgkKLMjjuIDNWF22jCjTVAtYdUT+oKSHM+hNE2x5tJGQ
         aNHdHqeE0lNfJfpKuSJpnhq2hXrkP2uKvQ1gk64TCfYULIydC2JO1CxlPFkR9HKjIYFU
         scDg==
X-Forwarded-Encrypted: i=1; AKwUvBzYoLcQ9fvvFd1KmRLBlrL3CjHJlrRenZ8i0wFPfpnVedaPU6v5LCTH+41klSsqFr1ymHfAzgKhVMqJtnE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLk84UdDdX/wbBLx0koV9aFtU851Dlya+Kgw9lDG60w954JB2H4
	1wKzvBzng7bT3hzPQSTHkfzIneEWNb/Z65Wp6HRKnayIYkExU6ovpiOT
X-Gm-Gg: AYBFou12fBFZglBBVxQdWwhFbJ/jILJ05s+uw+5Jc2p/IFKaIeW2dAOu5Y+I00f1Z4C
	ce9e3K/KeMWa6bZwLuR2b2YC7WqsaBJXPlPnypMBFPHNEd6zQVxb2tRpjFa8mwVYMYehdM4xEhL
	Nc+jxoGztv9zX5BRzE4FrdmJV3qNFpfwJ/lz3vhmUwwx8neiCaV6xpHIA9sc3i2xmNpGQESWoEO
	PUFBMaYZ+W8AChZmftr/VTLIMNM8gRJpLz3zLg+SrX/6UxQ3tu+WaK6eOFy1iIKVhXLB3dPvqbv
	pYcP5zKqHBUBNUYzfyoZVnurKgOFGlvRAv1s5CuTqcX9tgaBWwG564J75Z103fEPZV034EJKI6F
	zFRiKSs9LMQv3EJxtO4hdw5gTBd9t4HeTM34VYX9Jajz6KFCnVcTxcCip/dyuTPRRkz+OqqIUFH
	fiTiFF6TBbY3Yv89mIl65fEei0VDGRAcngzJSoGAdfQkv1LZr1DdF3v3v/l9f9xcV/gKDHj8PCS
	Bc2ocYoNPWAT1gECuuseB1WHxrkWsmU5/w=
X-Received: by 2002:a05:600c:3e16:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a1992fd259mr236072475e9.16.1791982316612;
        Wed, 14 Oct 2026 05:51:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf35930sm435944885e9.13.2026.10.14.05.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:51:56 -0700 (PDT)
Date: Wed, 14 Oct 2026 13:51:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker
 <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Olga Kornievskaia
 <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey
 <tom@talpey.com>, Mina Almasry <almasrymina@google.com>, Kaiyuan Zhang
 <kaiyuanz@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: skbuff: make skb_copy_and_csum_bits()
 report unreadable frags
Message-ID: <20261014135154.05de968e@pumpkin>
In-Reply-To: <20261013-b4-skb-segment-nosg-unreadable-v2-1-6c28d8ffa51e@toxicpanda.com>
References: <20261013-b4-skb-segment-nosg-unreadable-v2-1-6c28d8ffa51e@toxicpanda.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 18:02:44 +0000
Josef Bacik <josef@toxicpanda.com> wrote:

> Subject: [PATCH net v2] net: skbuff: make skb_copy_and_csum_bits() report  unreadable frags
> Date: Tue, 13 Oct 2026 18:02:44 +0000
> 
> skb_copy_and_csum_bits() has no way to fail.  When it reaches
> unreadable frags it zero-fills the rest of the buffer and returns 0,
> and since commit ab9414ed70bd ("net: skbuff: don't leave stale bytes in
> skb_copy_and_csum_bits()") that 0 is the correct checksum for what's in
> the buffer.  Its callers can't tell the copy didn't happen.

Can't you use that fact that the csum function should only return
either 0 or ~0 and use the other value to indicate an error.

ISTR this coming up before with the 'copy_to/from_user_and_csum' code.

David
