Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DD6415B6E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384533; cv=none; b=JmNAL814HwOFSExdDfmbbllslhUWJYIAqBhwN7Y+vJKdkgTPUTtnmTYz7Zj9cat5rGZuYdWhHm3VM7U+91kTJX9l0d90xjNUrPzRfNf93JM7TH/oO1nexs3vc7UvreLeZvfoJhv7kd7LtgFE40NV/GKB8/O6h5MyLxAGpCDhIc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384533; c=relaxed/simple;
	bh=7Y2j2y6ajaG/zDk1wERigWBnYImYN4e7RWhBT0nBLk0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=R4JoqJtcIlwW2l06umL8F/RW+yeYHSn+FNXzOVGFX5YuOJV7h9Tql2FlaEhQUTR2EmJo4RoV0SzchOy47MU0O62zRauFWe33MZQPFB1bKtM8DM7GVe6bTWzq802lAifDPZcePNDGulHsUS7JIjHd6ZnL3EcnF5HLQs/ThoKWzno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBh1OzzV; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBh1OzzV"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab432273c5so20726407b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791384529; x=1791989329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dfiB9VnO/q2CSY+pSu0B7BRn9rM8krRdw97n0xu/4ys=;
        b=iBh1OzzVt5rLZycOZGB+FE/Dx7KJ94fIf5Tln25acSfTQME3YfWMkMU62E6sKlVtg2
         GFzOTKFOECNZit0yflIkuVmPXI0twmZ3QVT78uj1L1UKiZrUiAO615JR42NZOVOCtOTi
         OmUMw4ddDMT3i/yomQAGbVrn9SyIUZaTSzjtOVzbAC7hanKHhf3fS0WmivGKRK+2y7Vb
         Xz9O3G62LOmHc+XTte+l0S5FXF/PzxW2O/OvE/Cwlt8xlwEyFBzBRNbowoF6IZwS+w51
         4U94T3pFA1sDXagXwi8coKdE2omF3Oyl4ak8VmA0G7pe65K98ARH/VCUv0TW7i8GCRLx
         plDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791384529; x=1791989329;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfiB9VnO/q2CSY+pSu0B7BRn9rM8krRdw97n0xu/4ys=;
        b=mOsOCBul+WGsoAWzBKc/rjf1y2Kaj36bi651m3ZTCC7It9cu/xkuKgmImoDYqg8Ahk
         bXk4iec2BAqH9Zu3lA3jWrKZGSEIwICAYnH+2tbu/+qtkXjNev+2osohaBvVB1v8QyAh
         r4G25hzhduIgGYUFWZ6Zn9Sl6YFzJQOW+yjLqUp1AncdySd21+PouCwmYC8bhXBUz8eu
         z78ZC+q0CUB6BAzMTw+NEgWcll20vYAmgQIdxPx5D+LAWuglXyOjB/b1/cfR6jcy1b7o
         pPVtQ3wBiWZawZzhMM0NDXSHjUdQVkAEFwiBcfti0PWa5pHR1oOclELNf86I9wEI73EA
         bg2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx4Z1NpuvnfLnCKK41km3k8OfYkRt6dE5l9WxzZlLA3UBhysR9NLEpOl2a6R2M23NKWo7ab/Na8n/F1Vuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPqz4PkDbhSpkTk91hQm7VxBYeOlAPZjUFwQmmM47SmDt4+AEB
	GX8WZOr84ODe7d1o3BAus52mMkaBnFE/j8GVBfr7Q6kte+Kk98fYNu4v
X-Gm-Gg: AYBFou0iQEmsRRL4y6njq39BHEMBPvfWe59fekCKnY7d7c5slIH3Y2KvYBouTZh91oo
	FTtppFnBVxFzUQxUKVw1gZXVcdv6MV74ZzP6q1KOV21MWDsBXg+7uFIuM0UG8LbgVYJrmo9Lfkh
	CbtCH6qiuIpjJH4ApjkfPm8uvrD0+wECcbGI8Uxcmqf1gTMatVVI01GiVqxiCUrQV6T1AfPA6eS
	k9QzkZrBWuMzG2PytU8C6cKKn9iLSuOorJHVUY+EGXysjnjyryl+lSUAl/lz/OtuEYTubFa9jYh
	em2beoHChfZzMmlOcajodAh0V+fi3PV7hp/oQduUhskZxJIrPho3+7rd5lRfU6FeC6Rs1OTl6oZ
	K/siH0mhy0sajTUMqzYHJOCq4f4M8T1lygFJXHZrSpUs4AY8ud9egjNnlj18Y/W9VaO4kwfP3M3
	jotIDJ1C7rj/NKrtVAd1ERDmqvMWTOXy9lE2HWKle19T6dYrZ763yLKUe0JdjcTlAndnWjpEezD
	DxnRX82V6LVSj58g0lkZd+WIyCnvqENZXnUqVsv7vB9wMCeeksAUvcxnQl98JX0p0NAdlzJpLGh
	TxMQ688RNEzlrw8K8k2EvjdDL/bYW96FGHzcRg==
X-Received: by 2002:a05:690c:ec6:b0:861:a2ae:8c6b with SMTP id 00721157ae682-8b05ac458e3mr23348817b3.2.1791384528499;
        Wed, 07 Oct 2026 07:48:48 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05abda9ffsm9529857b3.39.2026.10.07.07.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:48:47 -0700 (PDT)
Date: Wed, 07 Oct 2026 10:48:47 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Josef Bacik <josef@toxicpanda.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Kaiyuan Zhang <kaiyuanz@google.com>, 
 Mina Almasry <almasrymina@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
Message-ID: <willemdebruijn.kernel.140f4eac91ab3@gmail.com>
In-Reply-To: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
References: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
Subject: Re: [PATCH net-next 0/9] net: skbuff: convert most BUG_ON()s to
 WARN_ON_ONCE() and an error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Josef Bacik wrote:
> I'm going through and reducing BUG_ON() usage in areas that have created
> the most problems for us.  89 commits in the tree quote "kernel BUG at
> net/core/skbuff.c", 31 of them since 2024, and some of those could be
> triggered from inside a user namespace.
> 
> The first patch is a fix: skb_copy_and_csum_bits() leaves stale bytes
> in a buffer headed for the wire when it hits unreadable frags.  The
> BUG_ON() conversion of the same function needs the same handling, so
> it's here rather than sent separately.
> 
> The rest of the series converts 17 of the 19 BUG_ON()s in skbuff.c.
> Each one becomes
> 
> 	if (WARN_ON_ONCE(cond))
> 		<error path>;

Good idea. I was thinking of doing exactly this sweep after addressing
one case recently in commit ee1972def665 ("net: downgrade BUG_ON
EIOCBQUEUED in sock_sendmsg_nosec")

Instead of WARN_ON_ONCE, which still triggers a panic on systems with
panic_on_warn, DEBUG_NET_WARN_ON_ONCE?
