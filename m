Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376336;
	b=Uc+FOUPHUNsebpqsM58PFwXu/MDigAL8a4IQ1sOQTcPWfA002mg3ak4Jm07B3iElM0Ku
	 v94ptMW2DBT/EFn72dPIcKaymvWDfYnJ3gKa54KAgGnkZ7wi3et1zMentvKB9ej75MvuF
	 K75nr+3gJoZP+YF7TYSSuJxBtQr2I8sBTJk08Qw9QiYOzfYtIUyBtABF5VT04k6MxhaFW
	 8kU4hPpN4cFRAlwxK9q5HtEz7+PMFv/7nRrTHmKT8YhpcwzFO7MkR3bj7PCJX3Dr7b8By
	 wSm8MYS6b5Twqs/Lx8dHl5DprnXqhSFdpzAzASnGlLNrue3mbs7HWJnNaIza9GeOWqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=UVN9g4RWdwp5/he8LF058qsOA18MIA0nq3SVY0VenDU=;
	b=U/HgXFN5gFIxDXM5DHhTUnLPdpMkRZjxKUocxubwnh6FtYK6Sc4CEMVrJL+IoCt3hIF0
	 CVSTzEatJviZOwVKkKshCLzstu/9rBvNKGR3RAgkcZIAyuhthF0MNFeHTKxoa/U8hwhnk
	 oHV6EWvmLU8pT96zUz4cTxSUfLUZbsPYiAwBxPDAYuft1jjVsjgG2N7eN2pdcbIy8/exv
	 VukIx9lAUHiy9bL+V6GzhkvUqCvcwicJbxHvx9XbfeQzXA7PLGXP2/GQLX0M34121dgFV
	 bphtO1ntUeZrzwYqsDtxWA+uegjgF3Jp/ZsVVHKipEHjnqCNFgvkmYy+dhdb7hQpuGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g/b6FOCz";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D239606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D239606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g/b6FOCz
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c5358fc28so703044f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793376335; x=1793981135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UVN9g4RWdwp5/he8LF058qsOA18MIA0nq3SVY0VenDU=;
        b=g/b6FOCzOFlOpRQPAWM7QQdQwfA/v+03wjKewq/H51+O3q089hlqictJUYXPfi7F4t
         fON86ko4exfQhOzHAkWFRwIZplM7VlN2tpOEkLMCOIThqhO0XVrMoGcXlIVpPT5+cdkc
         sV3GACLdrhk3fr8IOW00299gkrCyhuG15mrAFWXCnMDnfjt6bAHRLiC5LLDxebhHn1fd
         vuE28u2nYX55IGHqqO+55MqcAWtlefC5QB83vV0XJz3k/6d12b9W9QoZyagAJ6v3FKQB
         HaTsvZCQ4UgcxryKdADU+XTi1uvu7lcSz8VrD1CKxf4pnYY2yhQJ61ZAJJgi6szEgZZI
         idIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793376335; x=1793981135;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVN9g4RWdwp5/he8LF058qsOA18MIA0nq3SVY0VenDU=;
        b=sNBmprsdXCaxznS6ocKrBwzMaY+3AgEE96PJ5gWEtOWlXPXq8cylYfv/rdYC1/TXjd
         HfWkXuXgr3hu78Phi6r4LjBDZwNhDoLhEO19SaqZKo/CEe3LfY+GN01eTt5vKSJISD2j
         YP8TeUHPgqSgbwkgyaRUnLXwyknmHQgYAV2pT1OpyXsqUOzCX+1H3GizQV6K4m5emD/5
         Un8nMlQaKtn0GvgrzOEdhlQ1h3Sj3fLl2oG/6ffzYOComYCAWx2vfNONpp/1IDujxT0m
         diZY7XB08VQhOQ78Tw8l1hZENa+Mc/NPkNAODPLmOTEWD6ldbCQAJRYK8OcibwromcIx
         FhQA==
X-Forwarded-Encrypted: i=1; AKwUvBwIYkZoPm35RBPJI9Vj5AT1ON0gx0J9+mEYDLalxb9tojPLQCrYw4FUROI/V8K403XT1pnliyQa37Y/IzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDcmfU7zBL91PSr82aT03nqCDDUqB6rRGHmtomOlNA7GXCsXvu
	p8R+5zz6rtTX6UE+cPQXzB2ZIo0Y28uZ8ABBDVz8emD5o7s9b4nFSxGo
X-Gm-Gg: AYBFou19IxDI/MZ/7MfPiMSRF/+f9oLiqj/jfMIS4EjhReoNa0jQuQH2qrFcQa3Wf4r
	njT2ng4t8+UV1DXKALatyVz+I2fo+QbGpw78B/alKVUcoMn6LDGR2VY0OhNlH2z8FQScGjV/POL
	l49FL2G1cjyK0i6wIT3DGcTaRFB738jRBfegHy0QzKm0ouUyPGwyvLZjywFiuso74ZQ2E38P3mg
	dt5JK+0K+Jk0wp57ipcwn98gqVHYMfu+pSHIEiSE9zjxezvLJ4XG+vuloamhrx4DGKdVvXZKgun
	7lTdt87i6n08+pYO08oYG8k8lVZKlR7me+fdmTikJvloGpsn8/VFZtc0tR3Eq4LvX4Ajh21n7dR
	XxPGBwnvcygmZj5lQWhtOAJ2tgOxOi0fsBlt9MhV62XGlsrzS4ZQx2MLwitDbGiS0Bfyj/QqsfX
	DyCXrvd3tEZ6KXNMgpdTSXDU3K1U7FcPtATJ4T/w2QCWiab5dq63bxKldkdSHosNNEXveHqzqWN
	8yU/ghbB2+uIaWRW4c/Y06f1JSSHatinzxdK0LWa253kPUSMn+0nTgUxN84BRaTdB6y5Te2PvjQ
	wWGHRD0P6rvc3sykcn7hFwk6yHLcib6TEgpTvMGhrx++EGHmb9R2xTIYglE1jhjZ7N7tLk2hFjj
	72N0vc4oxf8w=
X-Received: by 2002:a05:6000:4284:b0:48e:3678:5112 with SMTP id ffacd0b85a97d-48e6e2ef7b0mr6204489f8f.21.1793376334674;
        Fri, 30 Oct 2026 09:05:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b77f06sm3987846f8f.21.2026.10.30.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:05:33 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:05:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Zhou Qiuyue <n0ps1edzz@gmail.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Hangbin Liu
 <hangbin.liu@linux.dev>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net v2] ipv6: raw: fix use-after-free in
 rawv6_send_hdrinc()
Message-ID: <20261030160532.4832d994@pumpkin>
In-Reply-To: <20261026044808.613-1-n0ps1edzz@gmail.com>
References: <20261026044808.613-1-n0ps1edzz@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 12:48:08 +0800
Zhou Qiuyue <n0ps1edzz@gmail.com> wrote:

> rawv6_send_hdrinc() caches the route before handing the skb to
> l3mdev_ip6_out(). The VRF output path may replace skb->dst and release
> the original route, leaving the cached pointer stale.
> 
> The function later dereferences that pointer for statistics accounting
> and as the output device passed to NF_HOOK(). Its RCU read-side critical
> section starts after l3mdev_ip6_out(), so it cannot prevent the old route
> from being reclaimed in between.

Doesn't it also pass the wrong rt->dst.dev value to NF_HOOK() ?

> Reload the route from the current skb destination after
> l3mdev_ip6_out() returns.

Have you looked at just saving rt->rt6i_dev locally?
The rcu free of the temporary rt_info is expensive.
Last I looked it has to kmalloc() a little structure and later adds
latency to the softint code.
The thing is some applications can send a lot of packets through this path
(and I mean upwards of 50000 per second).
So even a kmalloc/kfree in this function would be better.

That might even save the rcu_read_lock() being needed.

David

> 
> KASAN reports a slab-use-after-free in rawv6_sendmsg(), with the route
> allocated by ip6_dst_alloc(), freed by dst_destroy() from rcu_core(), and
> the related RCU callback queued from vrf_l3_out().
> 
> Fixes: 4c1feac58e06 ("net: vrf: Flip IPv6 output path from FIB lookup hook to out hook")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
> ---
> Changes in v2:
> - Rebased onto the current net tree at 7076f684d513.
> - Regenerated the patch with git-format-patch so it applies cleanly.
> - Corrected the Fixes tag to the commit that made the IPv6 VRF path reachable.
> - Shortened the code comment and added the required recipients.
> 
> v1: https://lore.kernel.org/r/6adad51d.8fc0b0c9.1ec657.1868@mx.google.com
> 
> Thank you to Hangbin Liu for reviewing v1 and pointing out the submission
> issues.
> 
>  net/ipv6/raw.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/ipv6/raw.c b/net/ipv6/raw.c
> index b965258cf..bdea82543 100644
> --- a/net/ipv6/raw.c
> +++ b/net/ipv6/raw.c
> @@ -654,6 +654,9 @@ static int rawv6_send_hdrinc(struct sock *sk, struct msghdr *msg, int length,
>  	if (unlikely(!skb))
>  		return 0;
>  
> +	/* l3mdev_ip6_out() may have replaced the skb dst. */
> +	rt = dst_rt6_info(skb_dst(skb));
> +
>  	/* Acquire rcu_read_lock() in case we need to use rt->rt6i_idev
>  	 * in the error path. Since skb has been freed, the dst could
>  	 * have been queued for deletion.
> 
> base-commit: 7076f684d5132e6a6145e1da2fa74771ecd052e5

