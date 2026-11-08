Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794118922;
	b=RpQDRZEm+8Xg09mMRvEjsq+Wquys0Nm8OX52uTRUU+C5tPX4rgZ7zsNdn8fL9cgg8hcX
	 EYBaSAajYdFGzNIRo6smmaODPP3lntC/YS66CepYpyBJG7MHs9qjBti/n64otuWQEDXrN
	 EUR8y7WQKnGP9/BAYoWUyNt6GdirzpSfeJkbfe1yge+Ooq+/Uzuhj9a6GxFykbQI2Jh15
	 wIvJmpq/4R7fK+HlOKjEm1wQMtzBKtqttGdA7deQaAJ1bOB9bdCqsEY3fHt103cuYKgE0
	 XevgSF0NgzBmgnS13zJZhAOfnqVKdhQ47/ZIASHN3RgHdwFRHMsrPA4RlA3xd+D+uHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794118922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v2XprYGCXtRTCuqB4/wKtddK9ZYd1kM+u1y6WT6JlOc=;
	b=Zdg57mjdBjq/r0nVTRfpdTEgYEpkeW9HLm1TffIOAOxP1ernu1WXyKGJxyjGgl7U0WCg
	 e0/4OGKAXZTORNwx1mOfAfwU03hpUk0hITeOIxh0ZrlQnbWPjdbJ9gv0FKOkBS9xIEqQd
	 1So/BziRYXNrTJkcyxR+YShcPu+xdToNuS5KrUf0oN6WdpVwN0U0fYmke/Tid7P7GChMN
	 IksWb5bcASGpG6KrkStfrxDSuc4mw2h7+Zh4mbacpM10/TJaU8EMYB4+zEUVV9M+joxkH
	 Qz9gfmOjOpx3nykuN1pPgU6Hz3xrXukOU/+ZEOTHDLKW8YBLk7BmN91//KcB5+ZKwGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hUgHyzbh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E869E606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 06:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E869E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hUgHyzbh
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso139a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 22:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794118920; cv=none;
        d=google.com; s=arc-20260327;
        b=RFCAUjTcTV2d/VgfBgz4Vg0m0zvT4/c77Zm1q0TsnFXtmZ3zK34vp7c0b6lTKHwjUC
         iEZnrWQ9HhDC8DpmjGkQXD97syFNT6sJo1+0brsU4jnJs5bTc46pb1UNSR6EuOPsE3j+
         GBub9tW7EKIUbUIiGGRhgC/emxWIushqGhCoCgH36Yj95pnHbeZIpqa6sPwwUuA+TlBW
         I9L+NRh8e8784nMwyIkEBqZft9rz2rvWcRJkyFyp41V5vCBIdVT2N6Y89l8Tn3P4s4n9
         p/R/aLYD1ANArKawSXvbiWBC8KWLVoEg6rnZbIFGyRB20ywfvlrikSDfh3IVazlVgW/n
         3raw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v2XprYGCXtRTCuqB4/wKtddK9ZYd1kM+u1y6WT6JlOc=;
        fh=7dl+acw/9PmHUJev6381f2FQiH5b5QUduPfOimXPTe8=;
        b=jzrD6Bkw6os4pCov+lIu3jhidPBzSNDxQuCIy0NunWWDzPW7nleGX+7WrDbp1I1O1Y
         WEKwovsO7qIsR2ZjC+9xS7qakOqXMxIZlJtPWUFW4+XmvupKlK+/h0yWJ6GBvK3ZJvPo
         Qj3wFy2mCE/3QSsUAzzacKX+BTWEJW/q3T+ylHgQZebVaFYA9fr+fRYBp6v5Btgsgibk
         tKOM0O1l0TfNvI0q6daOxFDv5rO1Rf9mvaa7bDZ2uXhDGUXOaBp+FJGeBYaDxZvkB71P
         /OUhqOycl2zBB0dMyNaNgyQ6e2wX5sV5xwlp8So8DkG8D11qTeL32HAdSa5SV/Fm4dne
         g4AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794118920; x=1794723720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v2XprYGCXtRTCuqB4/wKtddK9ZYd1kM+u1y6WT6JlOc=;
        b=hUgHyzbhHHaa3x0MGZHtZ50WogQLFlCdZt/lmpI5crcqaTYEzBLVvoJT+z9qJrP+mN
         2zbgqjLjweGNemctefm1fEFSRBhgSp3oao5JaYrbL794p9RQwLH8IbD03A1vfK9G8Hgn
         xU6BgmL/ohZrkZkQyqHOCeP1wKoEuHAy+mrlzWmeCsJ2azmakD7HX9Dv1qYjRCWTRvml
         +A31W1Sdhj137368ySt2DvScSVHTeX6n1V3A5imgT+udmv2EDO5fo8gOJEOirBFNfme2
         CiOhPNFnNc+LyuKNTbG/oQjABYDT9OeAE1XRKctqmZGWr4uzP4FMUjddZw6ab+cFyo3z
         Mnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794118920; x=1794723720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2XprYGCXtRTCuqB4/wKtddK9ZYd1kM+u1y6WT6JlOc=;
        b=CORgSdYEqE7PxdCFU7/0ET+5byb0oMyE7az87t2qGNGMmSFiFJiXKAUA0xxG6jHx8d
         6vk8W+88sJRvRxqDj6HqkO1E87zhdSjTx7YVhryMvqYU3srek0GjyJQ4ay0abIOUKLeQ
         ZpQ/18FpAkX12Ioyzl2nuqFANTfnGviIo5PtOKkPbE0qSxNwhmLjSvmCWBGxDawU437s
         jzHaAOlUl/H2Hnm6tJIPE5BAHjH9f+LgwOqDW8anfI6B9zDL5Ftn8wsbjUNVE4BdSzhw
         N6Xg8LbacFvq7PtvW862v7tTbLsi23q4sXVdQOCyaft8dbw03FGJe2wKHFLVhRc+8TQx
         1KMA==
X-Forwarded-Encrypted: i=1; AL+hErEW5M8XReNRS3iOVpfYmGz+QYb0Z9kqsThQGpI6JNjMXyj0hmyOKNLsCJ7dPO4teV1QS465lxRMSe5Et/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SZ6Ulvn25MJEtnAYB0sZqRlBvuF79XAn9oZ97cWJD34XlV8v0
	kTtmGT52XH2jVEXP/QxR0xRsSnykvYPjE+VIp7eB9pryjHJ+9tfS9ghSrqrRoUzyQt3xjELQ4Ca
	4wkoe5yk5rn1e9UqjVRNuCy34musJM+lLgJQJh9UB
X-Gm-Gg: AYBFou31fc2pYsO6+sRo9Go8JxoJD4Q3efJuZjyClyE4/tN6dfZWgnfnkCQwFTBfvNS
	yDZbUg2FzkW6unOYVKUM9NXHJHBGFZaVXzxtl0HT9gzsAu0Kkii1n4Dqqm+or6s0gEahTWUVaBh
	++ytpQiFcc5LNDnYTDwHVq4Pr726uBo7v9llezWzAw6EQy9ikjjA/4jwsG5cxcrMd1sRsUqJr5r
	pIxNlo43m3VgYDYT8BOVHGy8DdVJwobu3aMt9E7Vm11/c0IJ0nRXdAW8hn8bmLkRAH5K/Av+xoZ
	KoyFfQ6bd9roYg3xtrQB+TFrpkUsDPIsyFUYQDrS/gp+KhxKJJ+rHmtlIqQDTWYOOjr+Y8WyJxU
	Atg9DV+qPXsdzoE/3KLVCmPqoWjTcyp9dTGPBJzfTN+B1IM9auZgfQpOnyA==
X-Received: by 2002:a05:6402:c502:20b0:6aa:128c:36ad with SMTP id
 4fb4d7f45d1cf-6b6fef8853fmr25733a12.10.1794118919631; Sat, 07 Nov 2026
 22:21:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com> <20261020121858.3b9107c5@kernel.org>
 <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com> <20261021132304.23e0a4e7@kernel.org>
In-Reply-To: <20261021132304.23e0a4e7@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sat, 7 Nov 2026 22:21:48 -0800
X-Gm-Features: AclHuK84A9Z4KJMCekRVvO906KgemJ7leA4F7qgUGSEUquHWR-U_KufDY8SuGMQ
Message-ID: <CAHS8izNTbs8ONvjhiw+6cRkZQq+cX3t=BZK9aCr39JNkVbY9gA@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 20 Oct 2026 23:17:34 -0700 Mina Almasry wrote:
> > But on the other hand the test coverage is nice, and maybe one day if
> > we add enough devmem support in netdevsim we'll be able to fuzz the
> > data path or something. Is there a way to get the best of both worlds?
> > Like put a comment on top of netdevsim that this is test simulator
> > device and any missing functionality and/or bugs in it should be
> > medium criticality max or something? Or is it too much trouble and I
> > should drop the netdevsim support and tests?
>
> I already strip Fixes tags and apply the patches to net-next.
> But it's still a burden. If you're signing up to fix the issues /
> review the slop we can try.

Hi Jakub,

So I started looking into whether we can improve test and fuzz
coverage with an improved netdevsim. My LLM prototyped full datapath
(with devmem) and offload support in netdevsim so the hardware
selftests and packetdrill run and pass in a plain VM without physical
NICs. I posted the branch at:

https://github.com/mina/linux/tree/nsim-devmem-rx-tx

The main problem is the total LLM generated diff to netdevsim: 62
files changed with 5,525 additions and 672 deletions :( So it's a big
change.

But with this, we can do pretty cool things:

- All 36/36 drivers/net/hw/ tests, 18/18 drivers/net/ tests, and
164/164 net/packetdrill/ tests now pass on a linked netdevsim pair,
without needing real hardware. This is significant because a lot of
these 'driver' tests also actually tested unique code paths in core
like devmem.

- NIPA can now (I think) run all these netdev driver tests and
packetdrills without real hardware:
https://github.com/mina/patches/tree/nipa-nsim-hw-and-packetdrill

- Packetdrill can now run on netdevsim:
https://github.com/mina/patches/tree/packetdrill-nsim-default

-(best part) Syzkaller can now fuzz live devmem/zcrx datapath &
offload netlink APIs:
https://github.com/mina/patches/tree/syzkaller-nsim-full-net-coverage

You asked me to do add syzkaller devmem support before, but adding
devmem support to netdevsim was too hard. With LLMs, it's almost
trivial, but it involves a lot of generated code.

Do you think this (or a subset) is valuable to post upstream to add to
netdevsim?

--=20
Thanks,
Mina
