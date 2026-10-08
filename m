Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2EA472F6D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448434; cv=pass; b=jicMhV9SBr2SyErpPb6Zd+9Kot0G7+aTwRGQ74Le4ErPLT5jtFnniVFt7pego6Ba0t+bCaQ39uPC/0m3/JkyNZ0lC0J+GE6TrmZfjuKqQkEFCKr5W1CAUuYMeN4m8wfNgP8lFHJVl73kU07vvB9pAgtTfv5TPe0Vuf1o6DEd8LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448434; c=relaxed/simple;
	bh=ZLv7mndY62+Es2DZMTILbbLAyosW2ZzatKjypIyEaX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPN4/lrMP/uFmhe2e1h08ZWQpBdu/Q8VAjO6k6nNjTjMKykpJAk0ordtEKJf8aNTIbBVCRu25S6qoYsHqR1CLVkj95AbdZyltV2c3AgrnInUN8iP6i9jd2RYOVLLIcalR5NBoAvFyQuQuJxdSycSdNbrSqU2qE2zU+LmRahIHtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNzhiKGF; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNzhiKGF"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-888cbacf70eso41273987b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791448432; cv=none;
        d=google.com; s=arc-20260327;
        b=Lt5IO7foq17hj3yLfbqBEvjaAIh1ALNkbqQcAXz7HIcRNdfr4qfeu3WyBrEgAI9JWo
         piSvwZvWF713XBMrXXOFMoKgX2CeVxkoM6AgitvYOIO7OKi5uGv/IRwKuv307NGiyTv2
         E4PkANnsBlZsJPTlEidkJ2k91mrgkD/vlhNGeIL8Bio1KNtuLO+SR1Kh1lwZyndc27sP
         gu9r1nR5jR2YR3S9V5jYsEdWB9tDiGezskze2m7XSe1x2x3hlpEtFJy0CV9exsHCP5/R
         v9JoV+peOQ1VKx0yoQSs/W38i9355K8Fo+7yLdoi2QpL3LGsRSxzs+J2g5JC+8Ijo4q9
         z73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLv7mndY62+Es2DZMTILbbLAyosW2ZzatKjypIyEaX0=;
        fh=6bvzUiu9tdyKp5HRb/+1uixDwSnW167Xf4dVt2dIRs8=;
        b=oDoqj46kfpnG+ubfSpGTFXAKQ6YtkAapmJFwSNXk+h9H1fal/RgQNjE4oEiBqtrdvC
         2CBK0f1UmsFzKjWiFlVgc23fvGyqDKIxtU+BX05mO3voqCRyk+/NAhUm1NNPYrbHSdfl
         cMbCCuoXi3DR5m9EDcP7GzqKC8/Zogufa/OTrt1sGKxx23Odiv5GkpeZrI2kWvIRBdxe
         9/XUfiEMYVpeb59IM4aXvmaIANBH2utyV9UqwfOinLy9a5tMrOUMLcTXt7NGK7hFBV+K
         sUeVEG0SIMc/blGlVIBBjx2sP73nosYCFL6M5wT6A5TONAomRnlpdB7z0DywaV0iZx+c
         pSXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791448432; x=1792053232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLv7mndY62+Es2DZMTILbbLAyosW2ZzatKjypIyEaX0=;
        b=dNzhiKGFKsA4ZhqoMJWpdkuBvGZ1agHvI0oqhIyld1y5bEnIQApaF3jTBj+vwYRq1E
         UtNDAW805d7+LalB/Xt8Nrqjao8pyjO3WR1SOFcjjYpDDjYXtiLevbfPvQimksaU3LMt
         QMQrw97bbmafgX5KbgDXREEvoqL5bv1jhKrUyK0N0N7SN9rm46xkgobtKGXnLQWnQqoR
         19NnDmdOdw0jl+BZLWWmntHy/1KyXDpH3cQF5mm6qab9+VPTaN/d9MVL1gcdqm9WZIFV
         yjJT2cEpzfXRyogfP6xsH//WnE9Ct0CCEYIBEGNzorBcc3b+aJFpjF5ynLVqqQfT/JWJ
         g5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448432; x=1792053232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLv7mndY62+Es2DZMTILbbLAyosW2ZzatKjypIyEaX0=;
        b=vZVUfu2+rram1Wnmx89SzBlBa7G7shJGPVbz5PlB/IkDFQzOXF4VarTdeTEzvgKLkL
         T3HdLAybICfUQNngoQ0oi7l7J+I7ssmzMJshB2WLn/wBkwvz2gwygzG3tl9AGZEDSR39
         LOrqqPt2BvHClSv5NpLmGJn2ax7Mzf/NXZyeiBgAB4qKYUtUp34a4vpI2/v4RmI/Cicp
         KC2j87XL9Gb01ifkxuONvAOmEtyFOx9hO3NMi+vXXFFhX3a+mznwGdDSM0Xl3MCfceeX
         oQy16mppZVjTGXD/BXf1VqptmpJR6RUqSpnL4UPJohiM2rn2O1cIrYinqb51aCIf2iR9
         H+4w==
X-Forwarded-Encrypted: i=1; AKwUvByipc+TyrNiONLbTbY3fcSCw6cPSH7j8LeLC8xbhBn6czY8aWKKuxcrP8oEUsroyydOlnTRHs1Cur0A/E0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLk3JTrzFgGhQj1JIkhCzksUO7WmQ7kSmTp3mnoOjfsQJp6Vvky
	jdwdasgKwQ1CKUkvTNePw64djr56QpRrmIeBvmKB/EUY6fJgipoZkYuhd0sTKU+u7mI/h/Jto4D
	6W3e9pI0yXfpkY3eUuYxdxJ8wjmxL/kc=
X-Gm-Gg: AYBFou2GCW3rv0GSBiXDqvPz+kiQiiNoMpjXRz6tcb7iUtrJlV7r8qi0ExLJhW/QSNY
	9uwndg/DOybmnk/v5to+Jf7fFlPSSog3XW8lWvF3A9Ysr6WxQb7G6fGlSamBP/p+YCCHAr8XPnn
	/XQnS+YXt9Njg5/r3k1KDfSUAv5K0AAANaV8MJHAzktYKeBGPNH5NKPidMt5JHreSpq4sQn07mw
	laT3f/Ku/S5jCWeFusKm5ylQeIeNEzFVCpbYCKytacKjTnGLDx2TqIB5FV8fuls8pT/+mHz4lW+
	yu6fgDB7tMSnCHn1ILknIB1z/GNTEIevpV5bK9Sq/eDydVAZPX3xrvU7Iw==
X-Received: by 2002:a05:690c:e3ce:b0:8ab:56b2:8111 with SMTP id
 00721157ae682-8b05b07d7a6mr29202687b3.39.1791448431675; Thu, 08 Oct 2026
 01:33:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-ip-core-objects-candidate-0002-v3-4af089192b0b62b40b9c@gmail.com>
 <20261008073001.GA1257678@shredder>
In-Reply-To: <20261008073001.GA1257678@shredder>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 8 Oct 2026 16:33:38 +0800
X-Gm-Features: AclHuK-MXw_G0Coo3lKPdsQ0QDQq6I5kCxMiGwC3QXXfBm4YpKcReQYWJQK8FCs
Message-ID: <CAFRLqsUD1RtmK-04_E-xCGnmn7JKxX6h9tbVFdTO0U+1FPSkTQ@mail.gmail.com>
Subject: Re: [PATCH] ipv4: Serialize netconf GET requests with RTNL
To: Ido Schimmel <idosch@nvidia.com>
Cc: dsahern@kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, 
	jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ido,

> The correct fix is to use refcount_inc_not_zero() in in_dev_get(), in a
> similar fashion to commit 0e243671bc7b ("ipv6: prevent in6_dev_get()
> from resurrecting inet6_dev"). Please base your v2 on the following
> submission and the feedback I provided:
>
> https://lore.kernel.org/netdev/20260815172032.79740-1-baul.lee@xbow.com/
>
> And please read:
>
> https://docs.kernel.org/next/process/maintainer-netdev.html
>
> Notably:
>
> 1. "designate your patch to a tree - [PATCH net] or [PATCH net-next]"
> 2. "don=E2=80=99t repost your patches within one 24h period"
>
> Also, trim the traces (preferably decoded) to what is actually useful:
>
> https://docs.kernel.org/next/process/submitting-patches.html#backtraces-i=
n-commit-messages

Thanks for the review. I'll fix the reference acquisition in
in_dev_get(), returning NULL if refcount_inc_not_zero() fails, and
keep RTM_GETNETCONF unlocked.

I'll review the linked submission and your feedback before preparing
v2. I'll base it on net, use the appropriate subject prefix, trim the
traces to the relevant paths, and allow at least 24 hours between
patch postings.

Best regards,
Cen Zhang
