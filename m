Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793574975;
	b=OluPMXw5x+oH4wLD/nEnIXJr+4qQ58QJ9qQES2r26CelPgHPBIIDgMCfzU3Yxpipjtap
	 8fnB+VsKqx86APQqVmKEQtN8rt+KWtZ8Nv5ALrCwdkgRYt7uYOJwMlYONcfC/2dRrgXr7
	 +YEDhhivF2/qO3fYkiIKDy2vfRbH5+6BG4r5NxDkn+2u3XAQKK1V28rzd2QI1HSY1bSnd
	 RWOY2tiNTCmTIYd3i0U16lLCTB/0LgI7n6PR4UAZWTE+K9d+ozRUQpRjyuGLR6lV/qohI
	 C9pI/mpDOarv+8jFW0tICU5+vUcYX0/MZZ7Yt44Zu0VaVIrdgl/U0EeqZjcQ/MA2piQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ioOyb4xG66q2fTLfsGfTYAyFHyWO5rhiglb9JNcxXHI=;
	b=WjGKz1oHpuACyMMm/UMk/1tTI4bGmB3tcVgEYNl3CIIBx2VHMlJxahpMPk6dyma1H3YA
	 9mnamuwsw2JzDNazdOBSfRmlP5veWuf53Le++k+ONBs9E/W9mLuC1ZnTHfK+ZUFcoCexc
	 vxFFt/JdznkYeX+DphgEDhXagig6kZqOLfkBzcOWtVCMP9mLBl7Y4dWyC4FhVITLp2bOd
	 U9g6nHJWLS4WtuV435vEsDq9g4Iob+JS2Mi7jiFT8dK/ahO/eitDz2R6H9gyiYTwa6Ye5
	 +VfB8EU882J1tugyAFKaMJxYl99xqZKdhchMCFRWfgqa4LS/kiAI5Sv4AF+HXMrDMbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="B6eD/wO5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C40606A32F
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89C40606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B6eD/wO5
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so9324a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:16:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793574974; cv=none;
        d=google.com; s=arc-20260327;
        b=od6Lcpd4siLrGOl67hOcZM78bFW/1txcpO/zZx9eOKOptR78cwZaiP83KRRkTrFT9v
         4qPGYA52F7HwmvW5+G+IwX8uKseC7GxDNhn09Q3Nv/+IjCt2RXR9Sx3ATz+9u7jPFU62
         a22ZUy809v6USZu6RiJjejeMk0WWS4eYxmlxf890+3L9MoVf8s/97cC1QngAEBpSr3S9
         XIifBeJ/DEix0zFSIrUPHvoERCUMZHy0JPFvTJQD7KoqVg0aS5Bwr0bVEeXbUdg+c301
         K6WWB4h93w7Tv1ViJQ1jnPBqR5JMTAdHaSNfXhPt64HlaGEEfgzfhD2mr2LiGwnIa2VX
         mM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ioOyb4xG66q2fTLfsGfTYAyFHyWO5rhiglb9JNcxXHI=;
        fh=yrgV6JpjXbDja7gM1gA/VvPt9dy8ub/y0CEYGg/p4to=;
        b=b0N1Wo1vunq4d7poiuJTprnRUml4f3hw1QSR41lOTQ0NpZPp5LanH0+Iz5uFNNPAH5
         kEb+o03C/mIfpwYK32VWLw5DULOsaFi8zmaBMl+zMdgq6UDRyWwuBh75ccysEupq6VTq
         j/N//CKqf23IQ90mtDqYQxy33ZvBpOyA+Stkessxs8PG5J/NxaGbmhYUQqG638oYNZ3y
         7TF2OILWsWYZl8VlnKGdWgbFX4lSHnskclIXLcaX1m39fLDHMvSxRc/hSuPUUD3GHcqh
         nycgJMQFbQvBjJOxA60uSpjRtbI9lQniS6iyRcFLevcHQNVr8ndLMNVlEc3/uNDMMaR5
         FObQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793574974; x=1794179774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ioOyb4xG66q2fTLfsGfTYAyFHyWO5rhiglb9JNcxXHI=;
        b=B6eD/wO5t7w9cr5msgMFDILth1F5IYv2yTF+M3oN3LY5yBUCf8LbsX8b/EG2x90vMc
         o1ifbd35SU/EjpMruPB9UPjK5pHCrRD2cuHlsD4MZZQaolUEBfaANH7GMS3ZcR0cBYfC
         Pn/HQAGHTRAxbdUurIHjZmgux4R8Hl73PetNQjifvN5ayQO7L1PgUm3ExnpeEepNgAzg
         UDBfzpgqcd5dTvc37HDnF2segKwhVXFd4tJrk1GoygafHDKHc4yY44rDa2sFoitlIrgJ
         WnOMy7XyDHGR7QjkAlpTH09T83L+F3uzmZZLwA7BBZZ4ZKX06XcjrBbyXWiLg2e0uuom
         V+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574974; x=1794179774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioOyb4xG66q2fTLfsGfTYAyFHyWO5rhiglb9JNcxXHI=;
        b=C+DvCnJJDEdyizuLLF0oI0NO2JNAc3pEdUIVTxhz9va00AaPKL9a8T3ANHf0TxoKUa
         acITLVi/7k7/Vuen3epSS6x3SgauXJEE0o7LOlHObJvOu2FwfT5ngQYtjY3j5ANeTIVn
         wy5LqmCyICbcpaja5ZRJuaeVaVZQxjlF+ETptnIPfblyU6qiQg/vpdR6TG2kfh1pJgj2
         MOuE87Y2vHpDBT9xH5KcmPYvlSmWEfD5WQhYJ12vlt/YuJTkBUA98kh14Q4uJFyTv0Bu
         ZMPIJWWKrw9SXdBIqpPdmE7Jsgunv8wFveKGvT/PwMJZ9LJZYBzdYP8Goxfe6cO6ySPI
         t68A==
X-Forwarded-Encrypted: i=1; AKwUvBzxu9ynQw3CNG/LnvJ2bFyEPHI80szDGaiH4QUidsbB8F1KFED23U0grB+5CtPq/jjw0KdVs/pTRVTLFHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mlxiZ+9kb6a9wmWRIextwwUxir2/UXFdP/TkLhwB0xP5mW/ju
	nN0V8k0Yr+XHN/X4atHZX/Erb3aPJsBrQ7wP2LKgEUekz1fefXPaFMuJZSXyX9E3qcG0T8G35f2
	rKbCdSHUl8uzB/BHgCI04NWqmH1Wv8PRNIoC1RLQE
X-Gm-Gg: AYBFou0T04sjesS1Q1muiwtdkjWXUqekOgzSdJ6Maj5sNRTt/8UPVubsZ9zf/zMLaeE
	5OCykpLmT/q1uR7D6eMVIJlR6wMLl0C0LkDagVSW23BwtUi/ObQgciszU20M09OzYbNCav0Nk2D
	VFJSU/zL7aP584nxhtUlB7EKjsmKqU8hTZk7kOLoKsxhbvEJpR9z22Zi32JZwfvMUR02ZKP3CQh
	2Ku29aj7UKZFBqOkBv4lDmp/BwISvzyszFS5ZKw1zTLrS7tFHreu0Hg1u4t7TBgSFbBE0qLma+x
	P5U99/Y1XFTom7dvf7ssGYG+9o4ddYdM6lMy8dciBDhwc3MfFEfktS09AyE66hERcDJiMnV8bh5
	JzB6HhmhHGKuUuyOQ6UP3qoIqJqoR1YDeUx2SmHw=
X-Received: by 2002:a05:6402:2154:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b4b42a63d3mr252843a12.14.1793574973443; Sun, 01 Nov 2026
 15:16:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083539.777877-2-almasrymina@google.com> <179357408146.3131.2882435952119280563@kernel.org>
In-Reply-To: <179357408146.3131.2882435952119280563@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 1 Nov 2026 15:16:01 -0800
X-Gm-Features: AclHuK_Z0S06xrAeAq_HAO4Ko_jHw-2goCa0w2rOFRiQDckpwHJNSPwxMM9jz2A
Message-ID: <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, pabeni@redhat.com, sdf@fomichev.me, 
	kaiyuanz@google.com, kuba@kernel.org, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, dw@davidwei.uk, ap420073@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org, 
	tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 3:01=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The dma_dev use-after-free this patch says it fixes can still
>   happen for RX bindings made on a virtual device that leases queues,=E2=
=80=A6
>

I know about the issues with leased devices. That needs a bit of a
rework, which I have done locally, and would like to send out as a
follow up fix.

 --
Thanks,
Mina
