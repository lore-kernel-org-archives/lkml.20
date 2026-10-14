Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E26E4E4C43
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971129; cv=pass; b=siwD1RGuAGAAL73AOAGG3n0u0rcCjmr0XlCL46u/zwb0NQN/WB6CfDS9hVjzvNXtZibJ1QUdE4eHdgIzifuVar9AMXYm9iOg4xfmJFY7jt+psydfbyPZkEjxR1wiYPBfNXkVjLws+FFvQxkkhKR9nRfaq1eQWeR/U5nHBzwv3ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971129; c=relaxed/simple;
	bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgA1bJD5pPqTD5L9zY0Fb6Ij9mYshAogOVv5dZg6bVipJmCp1XTBT7IzUegngKFNrQAfFm4jMZQhgxi4+3dgqkMnhUgRITjO13PDN6cc4PyvBMxAQcVyVhIqcuGLFaABpUK5fOwy/WtXhiLEU/OwrZblle37BJhU0y5mHkJdEYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=PK1r923x; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="PK1r923x"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-87ab6e5f91eso25138407b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791971126; cv=none;
        d=google.com; s=arc-20260327;
        b=sGXCouhmAHY2YWyALM3DWcRlqOJRBVwugokn5CGb6+KxOBnw0IkneWVrwCAk0GZ2LM
         ekma5INNCm8fLC54UfkSHFs3YXiTa2jvYrQKqZhAsTWqolCSL/XzGT7zaFK1YwY73gmm
         /b9XUIuvQZOsqWQZnmapP4GY6ortVdQn0dLjS5uwpuxTT2nVazEPbTpgPUHBznHI/mj4
         hZNPnBGZTIsKf074bsFw5o4FKprSRrwD/zzrpqnSw0nSbv8zerOKrsEMAAUGDYGv/m5v
         xxVw4WLYZYyIWOFZjurUpyw9sGyjteI4IzNiz+g3/ejYVzGXGCBIDBLxqFG0OoYsMgMD
         4ljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        fh=ypUgHu/QsmdoOQ+khK+DGi3qXLE0y+YyU6zYsIhVXPs=;
        b=eJjPBHLSYBvmVRM/+9C/ITq9GEoWEOFbq9HXEOO6VBGN+xtrlWuQKkwdWrd+XIXBpl
         4rzNXTBHxZJOpPT71l6grAi2LDZiRGtPPU8wfYD3KOMJec3YsZ6WiqA9QKHGo5d7IZrJ
         HacqDoNO2peYCFP+ETyIbvLFB/wXwyq8P7+9Wx0Nk0h+kVodhnBkTwNwQ6Tn1DcO2/CF
         lcayF2JGaH9FpqPzQMUKUc3I91ueiod+EZCnbGvAmcSMg5hG4qPiIjal7uezXnzYRD70
         6qG5iNVzPDqxWFcfxQaElJ8YV6eOk7+LVBoNsrdPCKg0WDaAJV0xsgf0f4/9wP1lFJCn
         qJXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791971126; x=1792575926; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        b=PK1r923xhU7qDZUbZmXe0yFUiSBca3J8XHIHs9qS+//TYB4Fft+Qo2Ljqk3oG6sPvs
         ExQCXNC1AHfaOK+vCwWLnwkjAKTf2UBbROgtrQXr86a/xPPl6cnW8uxv3/TF1HaeunIL
         WDiDbbme6gyhDZGG95JeVXsSEylcaz4DknthCfgSWs5Ausu5ByUHgSsm7wIUQRywIF7U
         6L6dKDQwf2C+Dc83KQaib+KmDPGD3y03epzqW/Cg6zX34bmKNG+1EutwDxzYAA5TyPdM
         vvgnoK8SarlTBCqLg0ZTdzmtuFchV5igeEa4cykI2Ygktz2Ux2qUDOT2+uGnWf2ewKNE
         z44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971126; x=1792575926;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        b=l+Rm8qELwJ4MnUXqzgXef09zz9jbS5frf10rbtyhWkX6Uiudlo/ZYiE4P/NFv0KBSE
         D0nJz33mgFA6NPMW8dIsqnEJ80mZtJsPZYfP7v8LKpE70F46tchTh7QkNuE7PevxfQh7
         k6Il/osHTO9irfA8N4nYKLV6sOO72eQsLSqskAsdPxXI7vz9VVWHMNu8ivR12LNApYiG
         LkMFJ0ekiIg8MWn6rclVJsnr8UyFb1gCE1psPc8RsDPEzaid6PVfJyBmuiLIkOJUPMMH
         DF7erdfRV6ZORd7mSW+MtNqr9yPvg5Gno/+TyFlk/sKaqqpgNeMOQ0w/zZiYJ247ONRf
         F1KQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrhBGjl1sKEsXCXmWRswol5kram+osKR88vHIXVfFF6E4Y40h4ygJo7j4Hz/xGgPdxEXFPJWKQJav+xlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJYAvCmVcuac8r5G/N4S755UQjhe6kYTmtglmwzghAqwiTOOZw
	WKDAu7hmZBxtf7ZGMbCNYFK5b2OyKpR1V1yj7O1vHcSvcYve8OcMrryyRSElv7Tmkt5ngW3cCqC
	6rpsMVB8VlSQVWxjneW/uOv3d1ULFZLXXTdCDHDVT
X-Gm-Gg: AYBFou0xuXMlscxkKBDC5h1NLGepkZznlbeZO5ezlW4oA3pg/a8zGWvv+PiyHFIhQCR
	8sprKj2vepOGwgfsiN4Xn2o4k4s2t2JUfGaNlESjWDNKPsnuYhJym2S/zxJpYB+UzNuaV0SwRSw
	Dbn/q8u5SVNqGlKP/VugvKP3jepYqW0Dcq5XdB43ls6kcY56slDueLRquQ0G+N9thayKhPLanrA
	hFGLrN0XRzoIZpjf9RkxvBjqHwzBXpT/LwWFTRlt342yf79fW1Dk8yor11XpKlSBRDaDzopmP7S
	ooF8FJguQq3/wBC0SzBlhEGVQbRcfzJUBHn6uKAvfZdtqfg1lhPZ5oK4xB1GnxRjN7MZspekLNf
	VvdKDHp08igQgzjHEF7uQmCcYboNZRLwfwNUgGISac6xkrGkOjGK/aIoyU+ic6xJLDvuhMWvq3s
	+KzzRj45wQRdWs4sgwOyaRiFkysz5DOpK322eU3tCVXoSHx2RaDu3hitEisL2t/CMw+mRlFJ4yK
	Otf+rDeJL2VFYFQ3Bd90P+iMI8YOg8RaKtNAEXuLlmtd6xnT1U9ay1qT/4/5h0E84U2UqygETQQ
	FACwrj7wWAs58A==
X-Received: by 2002:a05:690c:c4e5:b0:8b0:9e22:2651 with SMTP id
 00721157ae682-8b09e22273cmr36219317b3.7.1791971126209; Wed, 14 Oct 2026
 02:45:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004171636.3545085-1-julius@bairaktaris.de>
 <20261004171636.3545085-2-julius@bairaktaris.de> <b4aa46a5-dd8a-4520-8574-d008a3877f28@nvidia.com>
In-Reply-To: <b4aa46a5-dd8a-4520-8574-d008a3877f28@nvidia.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Wed, 14 Oct 2026 09:44:49 +0000
X-Gm-Features: AclHuK_at13xJpgBNhwlZvLzlUVxJXDvkN0LGkLWSuS73Rn7U8oFN9DIXlg-t_w
Message-ID: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
Subject: Re: [PATCH nf-next v3 1/3] net/mlx5e: Ignore FLOW_ACTION_PRIORITY on
 flowtable offload
To: Jianbo Liu <jianbol@nvidia.com>
Cc: pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, lorenzo@kernel.org, nbd@nbd.name, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	rdunlap@infradead.org, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, saeedm@nvidia.com, leon@kernel.org, 
	tariqt@nvidia.com, mbloch@nvidia.com, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2026 at 03:17:00AM +0200, Jianbo Liu wrote:
> The handler is only in tc_acts_fdb[] and only accepts flowtable flows,
> so NIC mode and tc flower rules are rejected as before. Looks good.
>
> The comment says what the code does, but the consequence is worth a line
> in the commit message. Because the action is ignored, the priority only
> reaches packets still on the software fast path, where
> nf_flow_offload_forward() sets skb->priority. Once the flow is offloaded
> to the FDB, mlx5 forwards it without touching skb->priority, so the
> offloaded packets do not carry it. Refusing the flow to honor the
> priority would keep it in software, so ignoring the action and keeping
> the offload is the better tradeoff, it is just not obvious from the code.
>
> I checked this on ConnectX-7: with the series the priority-carrying
> flows stay offloaded to the FDB like plain flows, and without patch 1/3
> they fallback to software.
>
> Nit: "prio" already means flow table priority in mlx5; skbedit_prio
> would be clearer. Not a blocker.
>
> Reviewed-by: Jianbo Liu <jianbol@nvidia.com>

Hi Jianbo,

Thanks a lot for the review and for testing this on ConnectX-7!

I will send v4 with your suggestions this weekend.

Best,
Julius
