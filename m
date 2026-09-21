Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E554BF941
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023871; cv=none; b=BHPd9D2Wmwl+TSA6DPwF3cXiLpREme4CtmmRZwV22Nqrw73RCgkacNHlYjHVaYQO5B8dUfS366ZY1TBzYxY6TVMOrHo26AmGMD9ty0WECrIaCBX3ufj89u6r7ClrqWulAmJVcgrW/jT/MtRtdUCncQ1ys1mStL9nBN/rugw6ZEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023871; c=relaxed/simple;
	bh=woHjxgbhlntc6UMVC2Q56QNtWFj9iT/K0HfOjx5NOsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kiosy3z/uKphXF/lP/NXF5/iL0MkyhhVC5Z0riXRjUrg1FZ2GW4WgaSL+fxCizw6ywAoinxAaY1+eOPqU9wLzMtbVymzYRPV+LSStR8FQSozSkXocROTGkjhmwnk/bJNaJCPYeXSfhmHVoZdNyS72Q7QWewxwhyGWgSuuFQA7ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5yOFMAm; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5yOFMAm"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-398e10200a6so2197660a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790023866; x=1790628666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7NpZW2QKvKVqZ103EWFAok1hCAUC6BJWKfN1Cb2G2c8=;
        b=Z5yOFMAmBgbOxFESNQ7dWTgY+0JmrHPmXtYezIV5EdJpEIiCWR3a9G9FkkA+ZUrLBg
         +2yR6lkcJQ0daoxbaYIeL2K8ZLHhgLAUvQw/QB3fdu7WTXwlsEMTw3ppe/qz+EJzZqI3
         GzKEbh90eDVrNVRnp9+CDW+Sr4GRFk5KvcfvpsncIlxD4Ql/jt6CC8UbhFiyMeE77XEX
         v19+oCnc5VcNL4x0XaVc8ck6NiQSQh72oQNQUKCtwsbYgdropgR48uUUmX+RXlRqk886
         6mkGgmFIPs+SWjdl3DeN6DGO/6omgrXmkkEiHQzn9+p2+2dISj3TFtHzpdaRaNu9oFyh
         0yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790023866; x=1790628666;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NpZW2QKvKVqZ103EWFAok1hCAUC6BJWKfN1Cb2G2c8=;
        b=xpxWA3og3luTIiFCsN68YJ1tnYe9YyUri00dIHP8sf+Bn3rSYwAoJXYz/rguvgWwH2
         XMbcJ2038kyYV2INYpalsZ+B/3spEJP5JhzYt5SB6pFCaLoPrKThFisOwUAi6durUinb
         qQm5uUsbmSNh45+531tx6x6tdwAPlpgjLGL21PZ/gYDw+UMeKXdwhu5W/Pq2zG3xZYLm
         1JUaVzGYXmtV/ICwepD2HOZ/j4QgkcfBXxOZ75fHpP8QKoEhmq+tk9l3hgP8zcOPuv7B
         rb3NCTGUNMx6AmujLJLvUdlZ2UgoGzie3u7rq75jDtTeUvsMpUBEsZXAN7ZNgRCIP+vV
         IroQ==
X-Forwarded-Encrypted: i=1; AKwUvBybIG4wVen9qr7sVapwOnE5RtazSYOwTe0li46DytQGVDCzwOAcHbHhf0SrIuP0CqkZl2oQz7iQPo/nqxI=@vger.kernel.org
X-Gm-Message-State: AFuF++nFZDXnuU3NoUo6cC320PUi/qgr2Ro52/sSJ1iDdfUeKp0Z3987
	4Uy34C6A5Fa7UJtwpmPTxCajMZuxB2g60ARMAz4Tr0V0T8qMDUTgXXQM
X-Gm-Gg: AYBFou22oO3iPQXVdA41X4BGsffLqdBHVg9JF5waPv/mY253ai4iIn3eKRD1WUzkJ2/
	iqOnEM8+8d9LZN68oWRa/b6Ib3aJcz4Um//OJiGlD9iQr7xFhntgLNbIi0hdP1Q7yYOp3PQzxjN
	KF5GIy8S/6A2mgxI6d9+1XH7Yo9pOVU89wIe80UeHZkxht9sEv6+qUExCUyloPseuJ/5Fsm1Z0M
	dgpO9lp9jzNXdaVzpXfDIrMbQu9+rmKN6qf8Sl0F/SPo5Mx38jWAnqysEN5mBHCMuCrveFgM6BW
	m8tKkaMJNhrEXa62fit45+ZQr5Gh2PsZyWtvR2909t7Mdc+k0gZlOVF7AYUuWIhIQ2W069edn/6
	S/k8Y1jGe5ARzC3VfVobN8zRERbzdvTsk58Howw+W2PftV/WwtmUud5bjHqR+c89QkrwiMTt2zL
	1NWZf9GeNwfpgJ8YZ52yTp5YuFpX+j90WqGoEXEmrXOIzJmZT3g7FJVQdNBVig9EqQuv7mLYeDg
	g==
X-Received: by 2002:a17:90b:268a:b0:39e:6c69:34d8 with SMTP id 98e67ed59e1d1-3a06afaaeb7mr156705a91.60.1790023866276;
        Mon, 21 Sep 2026 13:51:06 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:6::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0699ba81esm490739a91.13.2026.09.21.13.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:51:05 -0700 (PDT)
Date: Mon, 21 Sep 2026 13:50:59 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v1] net: devmem: document that bind-tx is
 unprivileged by design
Message-ID: <arGYqUOdDXccGVBB@devvm7509.cco0.facebook.com>
References: <20260921195545.493253-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921195545.493253-1-almasrymina@google.com>

On 09/21, Mina Almasry wrote:
> Unlike bind-rx, which configures shared NIC RX queues to steer incoming
> traffic into the caller's dmabuf and requires CAP_NET_ADMIN
> (uns-admin-perm), bind-tx only DMA-maps the caller's dmabuf so the caller
> can transmit from it on their own sockets without affecting other traffic
> or device configuration.
> 
> Add a comment in netdev.yaml and above netdev_nl_bind_tx_doit() to make it
> explicit that NETDEV_CMD_BIND_TX is unprivileged by design.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
