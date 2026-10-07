Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF2A4AA594
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384672; cv=none; b=bWRHw89h1jo7LFHMAmhJbi3wo7RyFJruej0000IWlnvah/8Amr4JzyZwEiCIIDrcz5FR67o0idcl00o1esFHaz1QIo7fTrWYH9e1fP0/qCC6L9VLL1IB4xuA3kKODigVYqQJEF1xqln35PN5rWUmXXy8BzwZkoCUGmyiC5j+fps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384672; c=relaxed/simple;
	bh=zg/uWw1C9tuSxeBV3eFBhNDtdmOBp+EfUsAftSVbJTc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=En4kGsHV8igXUdWs1BkMLmxjml84dBQqw9/hOgdid44/1DImx1CgwhDui7YlyXBAKeo4hrOgRlGxjtJbYbLSst30TtcCu/SVETWnigcOYSBDnrGuSsf3QyyFxuPFmjH8ACfs9aO+zuqzB9LhsKMvqv1J4wn5O7oIhvUFRbX0Zpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c61zuYBY; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c61zuYBY"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-677c1fc082bso3558531d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791384667; x=1791989467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YACwyXnL3UskMX5dK960KQ1iZfinHNnmBFhBCvvDh5k=;
        b=c61zuYBYytyJwqC2tJKeP6CGunPFCSNS5tS/mzIXaXxDHHi5/vQ9ceqV/PSyxVYZwI
         Wks4N4Pt5n/kv2/Xhbg7Bdqedo+3vITLvw+1wwnM/mKFKc774lPO7rg6SMEmbQrnrXQa
         GLEo+4AAy9AbGgnAtK8FdZy9NBJD7Xog/zqZCN2hDXdMmjJ/mcA1D8d/ZMW0zK3msV+7
         f9zMHJDp9C2m8Jng6c2DHfWj9BoeAV3QJX9C9xLjZwUQLAixt/7YTld5bP4u0q5tPfgr
         btMR/En/i/NnvvyyCV39B3FCi3GEUKe4nK+XT+YC90xvLPdgb4XH+Q5xZac6ZvCwvqjK
         KNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791384667; x=1791989467;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YACwyXnL3UskMX5dK960KQ1iZfinHNnmBFhBCvvDh5k=;
        b=KhSt07BTHWdXhpwnh9I/KwWVKWTf0zx4glpEdbZ/PmFXrlp0SoRf9D1LJUrdSVlwxP
         Tga992nWfJrfMtTYSGGoSzi9+Du5VvGxznVtKHXzs9zG5zjk4SmSIqt2cCA3LYdlMZEn
         dkyvM8IYedc6rAlBlOkhgBhzXS5BrTdA38rWQi0vykbDgBPplhalz/+R8h9jMsub6dfl
         Is3r8G43Goi4CY0zB/+2wMKjmng5uR6YCZtu96iP6OST0joZIVuMhLeB+Q8MZ8DdDw/E
         d4yOzyBkCMQT9NaGzvtO0fpBJ9vkNnTJCY5K1tsjolDNpUGV2ecXAULK/PCalJ1mkblV
         G5UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxF4tix8qlZCWzINi7qheu6XfZ6QTlYlbld4rGquirkYVrEnGVp3SLftTfWWO8MTT0Ib+4B+A8I1U3TC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRq1/fUtAD+PrqD/IMKApTbachOS188bGgmmMfaqdVu5K2hEDE
	4XMh9ifIWRH9AzVg5jPy+zoLa+X2/rxvElz6m0/X/fnkPVD9dQV6g9Pr
X-Gm-Gg: AYBFou02yv9Zhw+9TAH9d6hXmS19F90wvmgB80E6bBhFSmHZ3X2fmNiGb0WCrgepk9i
	l/88HxPRmzIiUQoaTv5kAYDEV/XpDjF0HfvoK3XNoPXEVUTxpHCtXC8uJ55w4hCtLdATyMDXD91
	yDNBa47towClVyMnRf6avQXxVB9dUXCW6idYIsxxUbaioehXHwRa5vN19K19q8wvmFE3IWpvw1h
	Q+Iio8sMgTf+N9MvAv1JE+aVNYjC9mJazd9H7xcktakph4kCiD87+7IvV1tEV/GBAssMpt6nVh8
	0fdlPw//5jL1ry4P2TzK28qPqNlp+TbSA5X/K17NCt/xkpDK6cyJmOQ/4zYyTEpnmNmTTMWliwm
	1LQChtVEfQnoR8yVtxq1jtBcFoIMieBaTE80WyR4w98vvtKZAYg6EgPlOUDYu3Si+bVAV0jhp6w
	oPdJkR5adNDxtJuGNClBLr8ZCDki2tF58pYUJ+T6XrzGMKDKnEMPmKAV0wHDtWdYuQ0QcYOW3zO
	RlG5GmTDr65GiYLtruY09siHGVEN7MfcAZig33EfA/HFG1tEacuHgyfvf5DAv2++cY/jBdu9ur8
	j9IvOlv2He0qk7LG4bgivyw8MdiDQ/S+pkJknREj3UPlcl5T
X-Received: by 2002:a05:690e:4893:20b0:66e:5e37:2ff2 with SMTP id 956f58d0204a3-6790a0d5b89mr877402d50.4.1791384667246;
        Wed, 07 Oct 2026 07:51:07 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6791afa71ddsm163923d50.4.2026.10.07.07.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:51:05 -0700 (PDT)
Date: Wed, 07 Oct 2026 10:51:05 -0400
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
Message-ID: <willemdebruijn.kernel.fde28dd15d34@gmail.com>
In-Reply-To: <20261006-b4-skbuff-bug-on-v1-2-1b4434c5357c@toxicpanda.com>
References: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
 <20261006-b4-skbuff-bug-on-v1-2-1b4434c5357c@toxicpanda.com>
Subject: Re: [PATCH net-next 2/9] net: skbuff: don't BUG() on bad arguments to
 pskb_expand_head()
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
> pskb_expand_head() BUG()s if it is handed a negative nhead or a shared
> skb.  Both are bugs in the caller, and both keep getting hit: commit
> 2cbb259ec4f8 ("bpf: Reject negative head_room in __bpf_skb_change_head")
> and commit 64e6a754d33d ("llc: do not use skb_get() before
> dev_queue_xmit()") each fixed a crash here that took down the whole box.
> 
> The function already returns an error that every caller has to handle,
> and at this point it hasn't touched the skb.  Warn once and return
> -EINVAL instead of crashing.  Anybody running with panic_on_warn, which
> includes syzbot, still stops right here.
> 
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  net/core/skbuff.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 512ff9cfa269..5d856948cef9 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -2303,9 +2303,11 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
>  	u8 *data;
>  	int i;
>  
> -	BUG_ON(nhead < 0);
> +	if (WARN_ON_ONCE(nhead < 0))
> +		return -EINVAL;

Another option besides WARN_ON_ONCE or even DEBUG_NET_WARN_ON_ONCE
when returning an error is a net_warn_ratelimited for such cases.

>  
> -	BUG_ON(skb_shared(skb));
> +	if (WARN_ON_ONCE(skb_shared(skb)))
> +		return -EINVAL;
>  
>  	skb_zcopy_downgrade_managed(skb);
>  
> 
> -- 
> 2.55.0
> 


