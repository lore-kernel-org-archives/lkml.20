Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CFD568FB5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177992; cv=pass; b=RP1Hav2X7v7dd5aenPUUsYOHWFj3+ewT9yug+U++OSdugCZO5BKJU2NrUYXQyiBj5u2wVTA6B4I+SKwT7G7ItB0IUGdibCovaKLQbxoi2teXgU3ATdPnl1ov/lToQgQnBcdC1NGk+dP5s0x0QB4llOJxWviU9Tivpcf+RBpJnWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177992; c=relaxed/simple;
	bh=AdYkHfJ2zDSaBM75Wmc+UjEZmUI3CCQP3TZvEyF+sDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXAyk7cVQsSN3TqJOYnLJHFD00WnY6mzEfK1IqDbTAMyZyRs8vA2lsyojTKFnRV/VNyvaOzRnYfVYVpoIKJySd8m7Qb4CvsIdZ/IuvLtvCb9oCKWj4aLELlGkGYeu7N3bAf8RiHOif13kQhl3tgrtcfEenO3riMhaxC6lMkBwZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d794Otf9; arc=pass smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d794Otf9"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4d42c137df0so131779b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177989; cv=none;
        d=google.com; s=arc-20260327;
        b=q4gJp5gsic0v351cEsgBDNiYccwND/KMaL1I01BAguFV5t1b+v9HYmS42D89+X697c
         EhN8zVejqAG5nR6qgtqY0jM64r4n+sXQn9ksTqO0xFzW27NkmNyOz4b/SDHiQe1RqZF8
         khJCk1cUNN90PS9k/J+k540YNXG1Xrx8/Rl6UCuEVL/fLxFgF44oParqDkg9szatGJOf
         qAuCpmfavuj90ygZ4Df0MXfi2ZMm7w2cd+n71katC9Yfa1mdYh0HzUw2dkMItqujup1E
         3zxnDZzgyhsS35KjTK4/NJOsyPd5n7F6Bt2ovJToEcM3KmGgjKzF1kU4Qgwjikzms5VV
         Meow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AdYkHfJ2zDSaBM75Wmc+UjEZmUI3CCQP3TZvEyF+sDs=;
        fh=Pl2ZcGcwzpZFn+T86led/Bdv8SiOk/MlxX3YIMZuv+s=;
        b=RE5qsO/AqK2Vb7Hvu00O4V8CIn3QxQkhr7bfbljXMWfauYycPXHY12UYNCLdIlxTVL
         60WefN0JEYFYPdlTIsA5ItovCT49QLbW3dlyQHwC2vnYpRhjPX7Q/HiWMx6L6YaFwitu
         9a3u2PJIYKboNb3MdzQ5JZwLvKZC7LRgHa2odhyFskCKR7JCJYOX9QnoKvf5mGbFkob0
         8YG0SvXrQ0sMS6uc77t4309JLvHZ1fwFpolkdBJw4nE5QjC6IlEmpSs0x6yW5YeT7h8z
         ZkBXwuIbdUcfbM7mk8Fw1o8yFeyaUnMoj/Xj50M6U8fsnNknqQA3nR1y6Pf1Tt2LqsFa
         5HyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177989; x=1790782789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AdYkHfJ2zDSaBM75Wmc+UjEZmUI3CCQP3TZvEyF+sDs=;
        b=d794Otf9N2nr7JynGRvuTcTvw6yB3KeB07VCCGBAknOphv9T0y6GE33VKjsGGb0SmT
         MEtlyTV6PonQ2qrBEOpVmMYtQND0dqkPprXpXw11N7PWQM/VJXgLQmewZwLxSiWa77jg
         ZsmnuQz0IpsMAP1EhDSH3FL9dWLVfIF21bUWRBtOPHhg7TfPGjjrFvW9Up3w0ggseCfK
         rILoT6FO/dp3QIKv6gaXDYu0HO193KKH37Pex+nW2ZEiwPHuob5iE4KRV69vVesmDuC1
         FUjX5SCzGGsRHz/LS3pxBMjyXqj0TMpbUY5VCkHfVQ5k/xlS2pzlR2wDySg8kJ7bG0vO
         ccFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177989; x=1790782789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdYkHfJ2zDSaBM75Wmc+UjEZmUI3CCQP3TZvEyF+sDs=;
        b=2FA1RsCbxHiKQf/3HVw9Wh7iVqEVYx7vvVtLLbQZhsVfTQwAKDBTQxoAflLsalJRqK
         jNagdjdIqWefTWTuiO75iCVaTPfuyT8Jw0BzBXvqLFEdjIX0k6moK+Uv9R5Z3Vgilqzb
         QlvOeSDhzr5bJ1y3C+NcrUIgph0dngBAHOG652+Z9XmGUAu82ximbp9dyXOrp7Z01qMh
         gX3jQz6aiDhoaFfdw2C2pS9huMmYFuNcBm2M4jxWBDZJXfGD+3iJZNDqCUiQueV2wuUU
         4C/OPpddRUqGH444ZI0sV0iypcRENyHqFs6oJEW+aeNxkmPWKmmle3Gyr5RQa6Rkl/Zo
         ubNA==
X-Forwarded-Encrypted: i=1; AKwUvBy0X+YDHAWGTaNyAeDLfIgCk6a6uTv5TUk+Vx2BO2gNpaG5ADW1X/i5eNerMmOvqCoL18Ra7Z86V2j6PNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nA6x+hFZ+9uT2wf2xvgY6tphmRyW+wM5dyV8KYb3bteklv/4t0
	E+cwlTJADQFPyeToSMCmId62PhvaqMgsZbgELoSKCRdPv2DASIuy4zcbyIEXqgvOo1cxgs0+LoT
	DNnbWF4yFtTNgnG2nkvLhd4PoknU8mIQ=
X-Gm-Gg: AYBFou2ECipLXXzItkffCcX314m52iJgdkLgb95G6qeitT9oP2hcBqYWf/K8HG0L/zR
	ZCXLLOUPuB6izP8ILw2wUmhzEiuO1tY1YhJHb020FSb7eVCjUhd2uHkZEVLAW5ZbcmuAkcTw/m5
	T+85ESgG3VoCRgx+ibF0P3EX8E+KZX9Yaj3a9nTgdpD7lcqzElvaCTAh9ITXKiVIxJ07AlfIy3x
	vvM3rzVQ4y1IqaSRHIhZHDLXbJs2UeB06wJNMBGGJ3AZw9HB+aeRkIVeQQV30fnfUsA/Z8RFCbP
	87Y4zhGzcHlVYL2OIXY5xeqYuVF9OCiMW79qz4e5OOPwCKkHBvDm2Ii3+ldItOhsKYXnwkw=
X-Received: by 2002:a05:6808:f94:b0:4c5:f237:4521 with SMTP id
 5614622812f47-4d5ba9fd270mr3658486b6e.5.1790177988984; Wed, 23 Sep 2026
 08:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-4-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-4-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:39:37 +0100
X-Gm-Features: AclHuK-4_fTyXS4Sk79rrR4cNhFbQRH-gmM6U6Ove1uzxePDNMKXgCwckYn6xmI
Message-ID: <CAGSyskX-Xuiyrmd+z1Gs-eDwns8pfA4gGQHN+XepDreYsN=dZA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/5] netconsole: allow configuring the rate
 limit burst through configfs
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:10=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> A target that sets ratelimit_interval_ms runs with the ratelimit default
> of 10 messages per interval, which is either too coarse or too generous
> depending on how chatty the target is.
>
> Expose it as ratelimit_burst through configfs.
>
> Restart the interval on write, as ratelimit_interval_ms_store() does.
> Raising the burst of a target that has already drained the bucket
> otherwise buys nothing until the interval in flight ends.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
