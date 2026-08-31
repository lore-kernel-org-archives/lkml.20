Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC13A3FF884
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179416; cv=none; b=fwXj6DKSPjV/NxQQa0ogPBBR52zHLk2nBLMsIlbF2zKITbhEuexj5NhjQd8d1wfEq1f+yco0zZQnrwHYFil9mLTeLPX2DZR9IdwJlL91oaEleelM7isRAOKfQ4jXVhxJC8Xr+SgT+po2UXPXzyXdW8O2QWn3LGKLnLHj9Y+UGjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179416; c=relaxed/simple;
	bh=+h8gWFCkmjX1wvvaiU1/0ONginGv3uAdCI3Wd1mXI0A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l+hPEE+77HmIpzqBh+B5cltyQL5YDeAQ/emYcvxS1ynzCCgaTpbj4LGhYW76ZLQj4iGVTI01w5F3ozhom1+HhKKjHoyX0XW05pG6xioINoWQKrV2OZIs8vSd3hVr67S57tkgK3r2jU+J8qg4rkneEmUTByGzBZwie0T1pxS6qrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k+bEYLpw; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k+bEYLpw"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2192261d79so342512066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788179413; x=1788784213; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WoUOaDHWtX81/DV/3Bz9tJZGph8DpiKqGhnhSMcw4pM=;
        b=k+bEYLpwOKYZqKdEWCxnPJ40CERjZ0YdOeDT9jnCdWOaqDm/BmPqp0GZlPabSsNxZY
         LCfv8eePPLW0ykpCddH6tMLAgx5wAz1u1DAlPeOUaVfbuNESw+OPkcOsIXRLmF+tlNp3
         tqyLiAi2U9n2iNm9PgunJ9YC2YP7fzUpPFUZD7h05FmWGxIyQN08b6dWhjSXOinutkol
         ewEFP9RbOyMEIpQteU9qpy3b810UfTShH7TURY5KUbhalMI/VawA5ha7eA/DaPXKRTyh
         FJNSLMJy3b9JhDAx06Sp22nMLS8dalsAZyCGjD7Zbs2MEo3i7cL1C+U5ARptQxgxGyZB
         zj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179413; x=1788784213;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WoUOaDHWtX81/DV/3Bz9tJZGph8DpiKqGhnhSMcw4pM=;
        b=jSZB5fsgs6fF2KfgKjlFBnVPdlcFQjxOkEIl+Gyc6WUviOXTyfyjQt+xXWuunHlJRM
         TaQPFOUwjhCouYzIwjihfL7AclvWi3R6yXVtR06a8bF6e3tjOty/CUFJBIbzSqoqMxRk
         WsQSdmWkJkb/t7VELMlVNR26CBncUbsK6cv+2/bMF9DyqKtUIyXL0fLuAQP+4rl9RTBw
         toh/9cGoHcXC7jKNWuoBSfud11smihR0gT/JwOVE9nRCUt/9WQinJD0c4ZylqAvNYsQh
         P8ZCL10q03F1myUYRjNOiTO7bMrX0um0ANfi+9o41ILBLFFdANP5vlSP0G/g5zHcDkkC
         zW8w==
X-Forwarded-Encrypted: i=1; AKwUvBzWrpz+Vn8Eyy50mXgPuc6eCf8eMksYyXSP3rzKmDTl2iDreRpwWYlN4lp+FBdOoHF1w8ezrsTHfUaTXRc=@vger.kernel.org
X-Gm-Message-State: AFuF++kbQmC9fs1pLraTR9Mh/BuTtU5UY0qK8Fu/PVuaDPd7Pp0QiXm2
	SEFhhyfDR8+bZWg143OjbgXtN1k/nf7TyXFtZvH7uOpCHe9A+fiDhxJveWL7tAZo4+ohLN7xkCV
	FBtqUqkotp7hyAsVHLg==
X-Received: from edi22-n1.prod.google.com ([2002:a05:6402:3056:10b0:6a6:42ef:3e5f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4041:10b0:6a6:432a:e439 with SMTP id 4fb4d7f45d1cf-6a6432ae561mr4418498a12.6.1788179412692;
 Mon, 31 Aug 2026 05:30:12 -0700 (PDT)
Date: Mon, 31 Aug 2026 12:30:09 +0000
In-Reply-To: <20260831052635.42417-1-nenkov2004@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260831052635.42417-1-nenkov2004@gmail.com>
Message-ID: <apVz0SFGOLbhUc2O@google.com>
Subject: Re: [PATCH] rust: binder: Use lower bound for node debug lookup
From: Alice Ryhl <aliceryhl@google.com>
To: nenkov2004@gmail.com
Cc: rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Aug 31, 2026 at 07:26:35AM +0200, nenkov2004@gmail.com wrote:
> From: ChrisX101010 <nenkov2004@gmail.com>
> 
> The Binder node debug lookup currently walks the process node RBTree
> from the beginning until it finds the first node pointer greater than
> the requested pointer.
> 
> Use RBTree::cursor_lower_bound() to start the lookup at the relevant
> tree position instead. When the lower-bound key is equal to the
> requested pointer, inspect the next node to preserve the existing
> strictly-greater-than semantics.
> 
> This changes the tree lookup from a linear scan to an O(log n) search
> without changing the returned node semantics.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1249
> Signed-off-by: ChrisX101010 <nenkov2004@gmail.com>

This is a duplicate:

https://lore.kernel.org/all/20260814215145.2050599-1-rafael@rcpassos.me/
