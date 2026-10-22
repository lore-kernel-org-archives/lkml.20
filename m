Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792687598;
	b=QEQjc95mPYzXsT/ghsmV1iEZW3/ZMOEyk02umjJ98PESncx38AZEWFX5PcY3tKpuKivV
	 GnYRM3YX9y89A8hOWSZL5i3maFeUswd9uadRr4tB2g7tI73QXFe4BvJN+X2jR2yzZLr2g
	 GbXtpfgaesSAJq0RGAlo5Nk/9bwmJVxjBiSbgrnjoUqcILdra86LqynYrMWg9x3he9sp7
	 Ovf0VHbxwgvl1lqXK+XHoONk29FlRnq8H8bqIF3hAdIAtXaHziHXw742cqRvt0P/7Ixao
	 rkj1sU8x0ppCd+jYBRHbs69lF0f+daoSnf8VRcTw7ZxpqEPbxYXKTk8YaHfHKt+s2bQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uWReZSZPnxFWoJInKY4s3rEgmqruohf2mZWoSu7TMG0=;
	b=DSWtV8FXVSlKIt53W9GhZgGMGZdpAAQEqTAEgCKX6SNgQSPoDFtKbILToD7QoUbS7Ide
	 gcp5p6jF6Nj95iFQ/mt+OXC35hXg/+bmOXBAhpdXe5BOddJxelFbHEu84ZTbv0zByZbhB
	 +XWWNsXiW7vPUJ3FJU2n8tsPxud+kq/Saxj7k2itgCl0mJhqYJJhv2vNsH8+CVvjfkqX/
	 E2dHeV3gwXAbdlBZUsmWZr+OAy81aE4wLZZ43F/lMwsB3fQZZqG9iBOwLAQXGE8AwuC24
	 PDcRiEIT2PerNrlNQPPMUsAUfYZL07LssAx9xu8/ypPQ2BHwcdoZcp9MmnosP3yUfQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GwsFZfAG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2DB606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA2DB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GwsFZfAG
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so65915ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792687597; cv=none;
        d=google.com; s=arc-20260327;
        b=EjO0ycJ/6I/+xEvGm5UyUVEj56JDWOsu63NPIPeeVa+wFUV95bsHxGPmgg5yfXNgBf
         UuXg4d8Pff9Lrvgwr57GY1PXRuBdj7FPFNQSlY5GSEFzpnEA0/kdMQlJQW7gsSKb/Yn3
         I+RDFcqOHtMM3dCcxlAdCBo62nmmy7qC4P1a9RM2/hCcJSTq7CjOjknxcBZiFxEx7fBv
         NLX42dk1CFxz5arEmVIbqxgQ4LiCgGpFvvukFaB/lU8l5G+R3BvaHYGBwHAe1c2A/I/E
         mjFr9TWUmDNjXRqrSzP3PC4cI8hw/6JxGKhGUl4+Ac37Onyo1W4p4qn8XeHYaLH4TZNp
         ZEuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uWReZSZPnxFWoJInKY4s3rEgmqruohf2mZWoSu7TMG0=;
        fh=y+iY4WF6Aqg+lWJa/lerlr7A0vRlLgQ7Tal/XJCx1dk=;
        b=nLgMP9sxU510tJWI1t4BxVRUel9vyBDqQgzO+3/qy9vwW57rJeEh+Qbltu3d4JYfIw
         vHg3qB8sftXR2FlhCfCFD0nUPJsnsdIYQR8A5ytJyT6Y+H8Ia0pw67CzfrUoRlMRrYq6
         +VZOtypDImKNqEpRzr1BGJIUFLn+W+jr9C8RmhI0QMxiFQ64L6ykY3NoMhBl31XGRUFt
         cFi/Id+DrfyAR3PIqy/HTlAviMn2oGz7Mdj7hW7PqDNbP/xR3l/DKgFsOR0YM9D1e+ZU
         ftPSG9qH2RmnldgM4/lBdQZaJweCKT0PGpqy2SfVzHxzu7SGqk+gYb1rLbJ7OXqZJRP4
         dI9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792687597; x=1793292397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uWReZSZPnxFWoJInKY4s3rEgmqruohf2mZWoSu7TMG0=;
        b=GwsFZfAGN5WK9cknlncIZ+dExC3F9P6aYB8Y7HxgAhobV6QAQgPWZoSO354JKjEpvF
         FPWjKKUDWFpR/YFwVogODJfj5PyEUOMF2ed4wZsK6z0h0/jjE0OHp2Dne6/F0bjLNt4V
         X3UpSMUASG0FzhAq8jRMWIVOcqp0k6ZLrJ2KiPPyu1RNTtI+lXFv8RoRTXowpr3bE+Qs
         T2nwQWAFaJ/pzE9nSsvssHt7ZOMRI2yjJu1Foq78zmJdr0k4DBeOfbHt5rIHOZYLxSbc
         T22YUmHcNVpH9EqeeA3KGKLqdKdYuXVhf2cjKdTVXTRsMUbawAqtlBw5WxvgxN+WH6T0
         7aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687597; x=1793292397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWReZSZPnxFWoJInKY4s3rEgmqruohf2mZWoSu7TMG0=;
        b=iygNqhKG5y/oku9DDItYqZwg9xug3V5IiIX63abqqWIr7KCK+fr57fO7igflShpMO1
         yUHv75wc37UTi2cnkVOHvkXFNAniSfpH0lCln0x9CPgZ/AP95QKahC/aVMz2mqCyveXv
         akj9Nsq7g3k5aQJhDEE3YzkuJgnKxyjEwL6WJ6Sn1xajhqVdFoJq+8Mv4+FzKx9M2LJv
         Czgwnv1b1KQwBGqAhGH1KbFfRocO8J+zT4QQ3MpraJsgWsGzoor+Eg1whLPZfIv64qup
         wbN15G4hbWwhW9LZUi+eSAzl0CHxZSVdYNQhIbplaK7WJfrcANw2qHDc5K/EWxGJYLK/
         /gXw==
X-Forwarded-Encrypted: i=1; AKwUvBwZWG6FH9Cca3v5OIb4GAco+8DsRcaag08HNzbrEhTePsG7+pBuDgJRoNoXyb1mSu8FZgVznD0nw6EC+vo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAxuAHyVzjB2LKJigRxPR+knSfaM/l/2uZXvVleRD5lwpOKPnO
	AFs6Ha7j/POZYsSNIvZwxS32Gd0dR6mAfTMXGfTQNDj11PfmtB1lXVsJ7wf5FnhK1A8bdfbv36p
	6lwo3OGmbhSbPl6qGSO6/wUb/V3dBe58AHlitq4MU
X-Gm-Gg: AYBFou2unOp/CdiQLSZVyk+Edm3/kCmiK78HAl92sjQa6AFKLtYCbCasXEe7bODz/xK
	BjSADnl3ib9XhjvmBBhOnBsAI21GTGIGkzx7WSodltbH+y/5JTG+LyKf+PTp/6fnNhmW+Qaouuj
	zz+CaGvNaF3q1B5S1bD4QP9sHPjt7voZgBt5+3Fpn+cCzWllT+7QLJQcql4uw7c2GJaPzbTJTOI
	mczTxkUjaZhHgJyn0LQxl0tSH5yT8oIV9rBW69O+DuxgmR3s/dROidEQgtL1AaoGjLoBOpdN5Jr
	FdVUmYXj2UtuDu7AlCoIepKGQ8i1qrh2oeLFGr6UfwPO3OU0osEI2zzc5PP0as7sWMeCwis4+tV
	pQStCr7/S+V02S8Ehp6Kx+HyX4QRh1bJhu5PUIa5YvFSRFxfed5SUH0oxK5N2Whb2VTgDfOp2gj
	HOPbNsB56juRphTF8pDkufeg==
X-Received: by 2002:a17:902:db11:b0:2bd:3bfd:74f1 with SMTP id
 d9443c01a7336-2ea63088254mr5085175ad.2.1792687596491; Thu, 22 Oct 2026
 09:46:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021162538.1852602-1-mic@digikod.net>
In-Reply-To: <20261021162538.1852602-1-mic@digikod.net>
From: Jann Horn <jannh@google.com>
Date: Thu, 22 Oct 2026 18:45:59 +0200
X-Gm-Features: AclHuK9zuGI6ax3vqvDDohM9t-hsk36f5joo8NmHv8Bwy_LXI-q37xMxgIQtv9M
Message-ID: <CAG48ez3Rptvjvt=t_YEcBHHwYGD4zmPtc6tk+gPLtorZY7WEFg@mail.gmail.com>
Subject: Re: [GIT PULL] Landlock update for v7.4-rc1
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Haofeng Li <lihaofeng@kylinos.cn>, Paul Moore <paul@paul-moore.com>, Tingmao Wang <m@maowtm.org>, 
	Wang Yan <wangyan01@kylinos.cn>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 6:28=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <mic@digik=
od.net> wrote:
> Jann Horn (1):
>       cred: clarify that task_struct::cred is only for the current task

FYI, that already is in mainline as
https://git.kernel.org/linus/b030ffaedc1d638f232f6992406cdcdcc82d5602,
it went through the LSM tree.
