Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352875;
	b=bkwvR2NmiGzZGV+KwtSnD9XADtXfyhxNlyQxxURNARqMygKothd5vXP76U4IKD8VN6lx
	 kvvjatH+vXac2DfLXWiTOPcfsi+KiuvsupAlF1vCirGy3lnq69ZhmY0a/5fkqJWqGZKEU
	 F+JZLEszt8NgC7OLSDPopzkMbFwPDbwvXSNGKlU4vevvoIQURL7Q4CYP2kGnto4afL63M
	 bGyp600qIcS9dU4waFVKE9EVb1JcCvF2W8hNIxXE9+2TVYYXtVeOhdkhWmKIowdcRqPvq
	 Pj8F/GW6ZGMKG0KWDJEAoUt28eeDyb4CxCLgXWQkeNl9mJxqaxtHllwE27UshEbSdnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dmjEUol2qh+/Kf+BAZYRdZvYZ50LeNOIlSk9Quu1FKU=;
	b=o6CPNLnqCISK/tRGf1uCMj2jgMbBisiLLsnDMlIErq7UCmdpJ8o+OQqtMFCIPYuRL+P/
	 UdYI6kmnnjccXMKmb6Td6m6kPUMqWUubdDnQKjXMEJ7xkmYRDYEAOOp4EEUWSvn7YDFOw
	 XfAJjllLI+S9VcKTwFPfdQt+FMnYET1uClANqXWSPipuJcMYWrdSnLG+fccTKZBGzW3dE
	 4j75ostNczzNdSB2G5nND+i5ypJUye/vqNRUT70n11pqfj518bRcj4nhI7cN7ZEfx3fnE
	 Co/4IjX+6/Xg7ldW+KDsKUzEZGTVwRAAyE37vm/SV0aXbmOMIaygxXntlHzMXfhRIYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ihJmqArm;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EAE606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3EAE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ihJmqArm
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9eb579c0eso14781725ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794352874; x=1794957674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmjEUol2qh+/Kf+BAZYRdZvYZ50LeNOIlSk9Quu1FKU=;
        b=ihJmqArmhhakMFCEzwTIjw/CEHNtN7ibidz+IQW+Zs6SdfWUceC9QePZqpzX8L6jgI
         q2fIUwMTkq9BjGo/g9JF7U0ThMCM4KSMaC+JpiOlUv8xUsZnjMgyTXUMtYwbAZ6GOwZP
         hUPGyQ7Fuay3QW4X1y2qW9MDLjghavNwl0FKVz5+vuL+Rkkq+JcOq+R5TR61/sl9gCR7
         GhH7y4cyRDFqe5NpyFy5R0RlW2hFyjYtFJJkRTorvcoNMpVnunc8C9I2/ACKrMgVPFyG
         EpTYeQsDXpReLgbY3r5W2XN0RozHUsGlvt/9RWYbBBMQ06wNaUSY46JplreNk+b9NjTT
         w5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352874; x=1794957674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dmjEUol2qh+/Kf+BAZYRdZvYZ50LeNOIlSk9Quu1FKU=;
        b=bHfzEdNVF4xEkbM1daT6AzTT92N8Ry47Nyf0dlYcj7oKXOFiNJjF6zbI4LFg3/KeAY
         IwK9s6VB5uq3dE4vI8KKkCUvXgBBmVMlsctQgJaAan+noisxt59vLh3YwzwTXaBQ1wta
         6S7hUO/bC3A46IDEfoBeoEmAPZnv4P21q31r5mg4mWkOfsWrA+U/ErQHa79JLqsWfVmS
         xUNgXKlzJdJifLA56LDJ0IgeLPOqaVbFhmS4vRsJThweHpzf91IfNKYhXXXF6V/AxjDv
         zINYvN9x2Dc1rO19qeKJgDfZulWHKNg4qEhzSRC/OYgTeFvSuhjRVVbKbrawa7W9XVaF
         F8Jg==
X-Forwarded-Encrypted: i=1; AL+hErGfSqkTMNdfzvGd+d4vEtPmJjZ5//pQnEl9YvAxsblV5at0yzLV4qUI4CddgL9lzgK3CCgkYmwjnPd43w8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f1kVPwGJbjUN/46J4YbdWyDTcc4f8A8K/Jbtxshpodzg2PvkK
	R4x3YaSIqOnglMWW016HJssWKVJiQfJ0j48yMd2kIkeRQTDyVZzCzK8cCR5VfKyRVQ8=
X-Gm-Gg: AYBFou0k9ZfZUgCYwHV051K1rjENaeN50CeR/x2aCPWO7c1p87ALz0vA1YRXLfdYLYy
	8t4EjP100HJfOhua/i3s1K/Rn+sWhOOfooogxh2t/v3jP0t1qxc3tVh94Ek0Yc3a9NNzLRdKlqh
	wLzg+ZDTSMLN/AVqaa+wowHp4gTvKRIzjspGbGpn6GKzlW87kEDf+1HNIhQEHt9LCOj3Gob5KGg
	lyJkfBXqjV/fKfCodbsvGASUEx+mXcB2C5KI3hpvTR8iitc+Medk21xXolXmSIiYobSHoKAWgQh
	dA3hrxy9oQd+DTIK30QqitHVChJgIYh7sc2DSjYtYM8+a06zhiVF0H8WT7qLXDCGwtzVZmT+MNH
	q/mptX8CKZIDHKoe2r5paXAkZq7iJR6MlAWmir+vZtfAUoZ3KmQ0YkcUp8t7IjIg1oxfEp4o8mF
	GTb3v+GDvdq3pWoNlW09F9OptDETtbxt/bth/YZPpEirZ/FLxZhDqsH5yJytAaNvzj/eQo1gJwh
	3CrL3p7i0H/trWOIQr7q5guUr1wYtz5e9bJF2NjvNb8okb0XUAkXE+HHnONJy9l1/Mb8QIQQLLI
	Bt/Nn+KVsUC3hyVgo9z9DhQtJkEps+qg9S5CGc313crHYcH9wvjHJkPKtqAQCHeu
X-Received: by 2002:a17:903:2f43:b0:2e2:cb65:a719 with SMTP id d9443c01a7336-2edd77694cbmr7109555ad.15.1794352874082;
        Tue, 10 Nov 2026 15:21:14 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:5f::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7a26e5sm1257643a12.18.2026.11.10.15.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:21:13 -0800 (PST)
Date: Tue, 10 Nov 2026 15:21:12 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>, linux-rdma@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next 0/5] mlx4: cleanup and doorbell fix
Message-ID: <avOm6IDyQokvMnc3@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sinfo@kernel.org,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>, linux-rdma@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>
References: <20261110231304.1859217-1-joe@dama.to>
 <179435264086.488859.12644173782807656441@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179435264086.488859.12644173782807656441@kernel.org>

On Tue, Nov 10, 2026 at 11:17:20PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

I ran this code as part of a larger series that also includes SW USO support
on an mlx4 machine.

The only fix in this series is the deferred doorbell flush (patch 5), but I
need the other code (patches 1-4) for SW USO support I plan to submit next if
this series is applied.

Since patch 5 fixes an issue I've never actually seen, I am sending this
series to net-next without a fixes tag.
