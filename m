Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496763D3CE3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334308; cv=none; b=iwi7Tdj1nXO9WcCIEnY37zJ299XFHrKydjM/beWJk3wJd+sS+iVijeA97iUzYRdoYzUwQdsC9puoPL0JwHDRZR+wANpcxJEeFuQddx1KI406HMSBzdtJ1l00ZOAqLL0hE4KU6lQWiG82Go4WR9seS1WhCMbpvGOkXqQoGNNmu1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334308; c=relaxed/simple;
	bh=9U7SFbOWxiBjZFiG74OiemBYU+Y1rr027ZcAM1kmflM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwxj4WufZhuGTbRh6fd216MOw4/EM22EB1tALEohWI5hDq6XNNTRvXfT1HSv7bBGFw3qxDwIObitcxBWDlyItKLnfoP8rZSxKZXGoiv3OSqsowrT300pyGg4VjkUySnJzR8cXEhaUkTJujCYXP5Z3XYYwEnqCCJuAiW3yFBlxNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=l6L6BbD8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="l6L6BbD8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so7797695e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1788334304; x=1788939104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e8c4SkCGLeuEZ9G0EExuH6ysXn5V6G5CGFTzY2i788M=;
        b=l6L6BbD8wgO5O9+LF/aDfHLEGVq41SggIr6mlywtJA4hy13WZmGtR4drLqQ4NBfTfs
         KgzBQA60F76thk4iCbZr6SRTAj7xRZnkt+x5451IGcCVkcJDbqYYwBqJ6NJrteR8SPz1
         BzxU4nV47ot3raFP32qQOTQHB/p9sI4WzKQFWrLTAe/RSgyhcSRYtLPepZkUiLOjyZXR
         nKhInaAw+4YohTQQShFHw8n7yomYvFVPtqXudlX56zyKpGN3uSMLvjUAFvnKBp16tPf3
         7c0XgCoLlg+djaKT7ic8dkHQmit2Yelw2UPrawTv0l0Ruj4n+xnDlqBymPfIGKPhGfYE
         r0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334304; x=1788939104;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8c4SkCGLeuEZ9G0EExuH6ysXn5V6G5CGFTzY2i788M=;
        b=k6JgC4Bxm5/F3IfNFETI6WtmvU871NJLcVvJ+bbnY9LGQLjs7/Tvk7s0sojC9xkJNb
         5GYZUvloAk+O2yBzicEWbQ1cWunfb/kapmWIWWBG8mfLZhH/zgdkBqVutbvzseh50YeL
         v365UQxONOAtqVmfWy+XlbCrq9w+WhgaTq8XGYVjrQTv1QYT2PMpRDtpqHBFuYUXYcrs
         d2Zv2qVZvE3AHo60SwdxAzM0xsjGv9zt2f7eqSpcioEOj/OSq5FKtD+JMERM9MJMDS+w
         XTWKoy2Epw0Sg9coVaEkRNaJ/Ul9OAALF12Xxgj1UjHX1Q+8aj0Q5XvmgfkDAQKAW+Z6
         9TrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIGfWJ2oMTMy73YDe3mLf8gInL7A7m1D6Sq+u5g26L3siVJoDD981IeoQ3UvQMw6DjKQVzHnwhX6S96Io=@vger.kernel.org
X-Gm-Message-State: AFuF++lUrJjaQDJY1zub1myxTmqg9D+M4P4trswN7tlaDVEhbjxJFV9L
	qLiRMs5RLAjbqAbO4cEdgEOIQT9rKVmyiGmraTKN/NN4RxZqjM4Yf8KwBz1Lm2dd5mc=
X-Gm-Gg: AR+sD10jGCVki31GihkP8G2P0mxM0RW9Q3mLlc44hIOvTZFFbaR6dm6DT7WTu6ia8QY
	XN1CkAnWrF6H1L6UAIRjfUMoUZmC5ltGFpF0sid0uuHhEqVxgVvf2HxTyNNBxGrvRw/bx8Oacxs
	tXMlptH0Me2WHadpllJSU0xD+cZh23z6PJ3ZDVbOx3AvTZddkttFngEkSeUr7hqNiJzF57ZkZsH
	q7VhYrEimGR/IMK7yfSETviuvmfgxBPWXBW0mvnhTlebK8SEldtuapltETkswfHoqNbK+zPtab1
	sSQo2nIhQBFv9/mTiosTqZApExMlDv/VN9ob9ZOrz+3JS3xDCUSXcQaILLhyPsCw5affQdOXznE
	Pvc+diYcjHtkbLGAWYYE6dBONnrv1H3G4UBqiNis6PNYJBHbU8tgEirSkelvEfClUFF3CQ4WjbA
	sObrU6rxi9DSdWlxFQGz8L/srFvtjsGd0X+kHk2sHgP1zN1+7CIWNhqmWr75q5yb3zx38x+pO7w
	HFHJYtrT8EdlUPokvU=
X-Received: by 2002:a05:600c:6992:b0:49a:a101:4157 with SMTP id 5b1f17b1804b1-49ce58034admr51656425e9.7.1788334303651;
        Wed, 02 Sep 2026 00:31:43 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e04csm121393645e9.10.2026.09.02.00.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 00:31:43 -0700 (PDT)
Message-ID: <a85105b2-a576-4702-a9fb-3d17ddf4d2a7@blackwall.org>
Date: Wed, 2 Sep 2026 10:31:41 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] bonding: fix slave_cnt leak on XDP error paths
Content-Language: en-US, bg
To: Hangbin Liu <hangbin.liu@linux.dev>, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jussi Maki <joamaki@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@kylinos.cn>
References: <20260902-bond_slave_cnt-v1-1-36e95bf4a6ff@kylinos.cn>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260902-bond_slave_cnt-v1-1-36e95bf4a6ff@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2026 08:21, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> When bond_enslave() succeeds up to the XDP setup stage, slave_cnt is
> already incremented. If XDP setup subsequently fails, the error paths
> jump directly to err_sysfs_del, bypassing the slave_cnt decrement.
> 
> This causes slave_cnt to drift upward on each failed enslaving attempt,
> which would lead to unbalanced traffic distribution with round-robin and
> balance-xor mode.

I don't think it affects balance-xor, it's using usable_slaves->count which is
incremented only for actual usable slaves

> 
> Fixes: 9e2ee5c7e7c3 ("net, bonding: Add XDP support to the bonding driver")
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
>   drivers/net/bonding/bond_main.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index 947d92a669b6..0305a017e327 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -2305,7 +2305,7 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>   			SLAVE_NL_ERR(bond_dev, slave_dev, extack,
>   				     "Slave does not support XDP");
>   			res = -EOPNOTSUPP;
> -			goto err_sysfs_del;
> +			goto err_slave_cnt;
>   		}
>   	} else if (bond->xdp_prog) {
>   		struct netdev_bpf xdp = {
> @@ -2319,14 +2319,14 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>   			SLAVE_NL_ERR(bond_dev, slave_dev, extack,
>   				     "Slave has XDP program loaded, please unload before enslaving");
>   			res = -EOPNOTSUPP;
> -			goto err_sysfs_del;
> +			goto err_slave_cnt;
>   		}
>   
>   		res = dev_xdp_propagate(slave_dev, &xdp);
>   		if (res < 0) {
>   			/* ndo_bpf() sets extack error message */
>   			slave_dbg(bond_dev, slave_dev, "Error %d calling ndo_bpf\n", res);
> -			goto err_sysfs_del;
> +			goto err_slave_cnt;
>   		}
>   		if (bond->xdp_prog)
>   			bpf_prog_inc(bond->xdp_prog);
> @@ -2348,6 +2348,9 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>   	return 0;
>   
>   /* Undo stages on error */
> +err_slave_cnt:
> +	WRITE_ONCE(bond->slave_cnt, bond->slave_cnt - 1);
> +
>   err_sysfs_del:
>   	bond_sysfs_slave_del(new_slave);
>   
> 
> ---
> base-commit: 70f3995830d3f1e79faa14eb0605914f778feca9
> change-id: 20260807-bond_slave_cnt-88e78c5f0ab9
> 
> Best regards,

I think we can just move the slave count inc after XDP setup when we can't fail anymore?
I don't see anything using it before the slave array update.

Cheers,
  Nik

