Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793025128;
	b=oYhToMw5tN4xlYiFaP6ZED2BLRVMr16re+oC+EkWMzc2Ly/cz5IgWEtGXxdorVQY/XM5
	 HcuVxvLaTuAw7MkQDOXLkFFG0BoB8uK0PiCS3UK89y7DF+Z3OKsRiegZeVJnctzovvdSs
	 YHrnURVwj7hzOH+eivrATD5ZXe4ZRqzFB4rWg9qg6Jc017NinMA9AW16i11DT6TEn4XE1
	 KU1t+X2yqh0zSLmDyBAh0mTgtHC9k7dSfMniZhwOa9l73I4CUNMiWrG4J5gl2nWo3UJ8e
	 9X7AKNOTT95yukq39wUusPHEnygWirpy5rnFCJrSKEpB7cLDc9+pjnXBgG30C1mom/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VMmBhwH3f++U+Fny1silggx8Fp4rLIZ5/kJA7+I6Zec=;
	b=mLT3TZ70F0yGP3iNo9Ft2Hfr7BuFqEfD2TI59go7vbFEq+DJQe9SOpuD6rVIyYQTE+KV
	 0b5ggT45FILnYX8t9CPDAlUgihObFjKEMWUQDLK+r9odVmrsUspdACdb6F1NdtU6ZDWoK
	 JLUDqtELfiCymf1uJ3eM38HuyMYWX/S2DTyGwqGjv+QhbmIbb0yyo9iQRAAwJDHg1cQgg
	 WgxFOA2T1cm0CyI0d3aAvHybUcaTJh71WuVWWEjpdtIWH4LykpL2LAcXbtEJpOJarQgRh
	 lrp+AHrVWgI1TKpypX/G+OSdZvM0Z4JZls7Dk7hMZuPG1R0nMm9RCi/p/n0L2qhhKrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fvFl2JqY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B07606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B07606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fvFl2JqY
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2191524a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:32:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793025127; cv=none;
        d=google.com; s=arc-20260327;
        b=lZgJUEf8T1OYxqFQgSb2hPKyo7Zy7Dh06ZtLdnLgiq0rUAuIU5mtKNguzbR+pYvMw2
         +dgXn3nXHqaRxBOKNnzy30/Zcv3odTOce5asE+ykVcg4qmSrlNEdTPa/Cd7JHPfm4kRz
         GyhuFhPhHRCHChn2NPLAjbPXRROeIlLnLke7jNEoonjJmEj96+XvgunX9wBPTUw2YxCu
         kytRFdgYNC2qJ167yqoiYj1sp/dXJHQvFb/1HIdbd5NHBp5YbxzXH643PCLWw1jKExoB
         Lw290DycvblY3m6zX/tIdVsfLb38Q00ZSs72tOmQuf/abBq+6ZxeC/QqY5lMiEzmGbbO
         79Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VMmBhwH3f++U+Fny1silggx8Fp4rLIZ5/kJA7+I6Zec=;
        fh=7uOvfeTrMQyQutFnTsxJPWDtY0sAjPZVoGQInIg+q7E=;
        b=GCLtzm4httdochT0D37meOHzdu/UWZmj+2UvqfDFzwCZgKEvMXAzoqws2GCZDnnyxC
         SEB5N1VNNEounR7HLWCeF173C199m0o5u475PUt2v7nt1HHnyKKXyMYtXIjcX2KTKq4N
         1p2C2oPx0RiVmTQxEbKmC/WH0PDkSRh8xNePSD5dp4ccLkgkqFCqE/5G2dh1JvokNLtG
         4GKCWeokFDgEMWtUmx/sZI3+Y3BTUe5T2sYh6XI9JGjpoH5g2KFXaVwnAhZ2/ugsTy26
         2ab/10HuuRIvXMBbkSDAz+2qovcOr54nZ29ZMRVmU4VpXvPXKI/6ruw26Dsi5YAJdURH
         QG5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793025127; x=1793629927; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMmBhwH3f++U+Fny1silggx8Fp4rLIZ5/kJA7+I6Zec=;
        b=fvFl2JqYiK++L9Zn0vfo8qjsAtt8ULXmy4jRMsZWyhMJnRIQKO5Rgi7jeprM6MVIy4
         /gpHjU/ILM64eE/DWyLU9CpYZROq10UOYB88q2H+bNRGWt/4itLRlgb7IHZmz254KEUJ
         uyBnRxmPFfHjF2N0bUVo2B5byPKdjvv7n7yrws+I97JBI3bkCFzeSNxO5vtbSRwE8MiE
         0HiZelCG6u9CtDzypVlb7C/Us/VsX4+woXWZYwOacQWphQIEBAJvEiYJ4K0eVNFK4BwU
         YE9lJnKghkc2gPV7RauLtKpoQWBEQz+XeynSq1pXEe+p1iupFPzxs9UqunTA7XvO5dcC
         ZFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025127; x=1793629927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VMmBhwH3f++U+Fny1silggx8Fp4rLIZ5/kJA7+I6Zec=;
        b=o15krgiHqddFNqBP1schrBPvO7g5KhsI1dg/5G2tPS/NbsEmX1PAJwWVhjOLd9FUc6
         v+cnvYx/Z9rXZy5N/DC859HZOYXKMqd8pnikvRYr15IrJmVc6osBDrUEfYNPU+Wy/MNY
         pzAg3oXbQ0E9KWK469n7oaWtPNMM+350vneO7eG2EvdHTIV0NQptCiJPqQlLRS8UsTZX
         +vJ6+s3X6QGJWnJUoqSniaEAtJUsx+iSwP1wDfhDdun8YF4l5Qe9R/1cHarDU3eMWohm
         5T3DZMkar2qGg5DA/oiso+Qt3OzH2QBCYJ3M1iIvTdNW9Ki29fES3fN2eu0iz8ozzknu
         IPqA==
X-Forwarded-Encrypted: i=1; AKwUvBxLa0ZeUgQMJKT9VZY+W+zYUcCAFNk57zAOrqBnQhP4bvjder03cq/AjwMMp7hVdp7cyuEFr3XiDlMPJUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/UARBIq73/IH2q4dY3mWOKfq73+bzCc95s5pOc4himo1RqQgK
	ruLaSXX/XDHNPYjCSRPQq6B8D0jqIAEO5eIrs3buk0o5WogpxSMeZaZqfAMI24et73EJ/wXYpqU
	krGIr6Ptzu0i+Kl+taXPG08m+jVy2l3I=
X-Gm-Gg: AYBFou3dh38PBDm9LXkAXlgqyr6CI0gqWH3LgstJxwfDWAl18OIj0AtYxRNGyrOLoCq
	y4GzpOJhXp5TiToL2Re6Lll+BnerkCepo9ss4XO+S+CYsIp4kSPcR82tik8Z4xKO3vOjNg8UptY
	u/nYp1wGaF2CqDwkJ9GIm0Zxpw7eEz11n0Wh310EUmKOgZTEp6nrf97GKcOlKudUI8OVXP7KAOE
	jBl48CH4iYVXIb0uAfPVlrZcl07lsPEVaiR1Pt0tfm7wqeE0SV19veMqPVTurGaCNIGGuwbd9+e
	HFpweDVKGLm6VgQ9mbnLtY0AfYtUpRmOVFoF9/Zsj116Y2jouxrpdyut3WfOUxu1RZFA8I76t0b
	WHJv8AHO4cQDauDC+jIhl+SoN5cajIFoxEyDDn+0=
X-Received: by 2002:a17:90b:5644:b0:3ab:d45c:59da with SMTP id
 98e67ed59e1d1-3adeafd21a8mr5767380a91.40.1793025126904; Mon, 26 Oct 2026
 07:32:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024091256.17918-1-testwrzwrz@gmail.com> <20261024141157.59301-1-testwrzwrz@gmail.com>
 <20261024141157.59301-2-testwrzwrz@gmail.com> <at82NLzM7g8HGgum@boxer> <20261026142705.4564-1-testwrzwrz@gmail.com>
In-Reply-To: <20261026142705.4564-1-testwrzwrz@gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Mon, 26 Oct 2026 16:31:54 +0200
X-Gm-Features: AclHuK89CEpPcFuQ9Zkf80L7rIP62d6arcQxEpIyB7BJW5pfRLgwLFs5gMXbiL8
Message-ID: <CAJ8uoz0XZg8K2g3eBXOajV3TsA-1Sz3D6t-G2+BYw2YX7A4K=Q@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] xsk: defer software checksum until the skb is complete
To: Rongzheng Wang <testwrzwrz@gmail.com>
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Stanislav Fomichev <sdf@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>, stable@vger.kernel.org, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 16:30, Rongzheng Wang <testwrzwrz@gmail.com> wrote:
>
> Hi Maciej,
>
> Thanks for the review.
>
> Yes. xsk_skb_metadata() is only called for the first descriptor when
> skb is NULL; continuation fragments do not call it. So
> skb->ip_summed == CHECKSUM_PARTIAL means the first fragment requested
> the checksum.
>
> I'll preserve unlikely() around pool->tx_sw_csum like this:
>
>     static int xsk_skb_sw_csum(struct sk_buff *skb,
>                                struct xsk_buff_pool *pool)
>     {
>             if (unlikely(pool->tx_sw_csum &&
>                          skb->ip_summed == CHECKSUM_PARTIAL))
>                     return skb_checksum_help(skb);
>
>             return 0;
>     }
>
> For the drop path: xsk_drop_skb() increments tx_invalid_descs and
> consumes the skb; sendto() returns the error from skb_checksum_help().
> Since the descriptors are already consumed, retrying is not useful. The
> current metadata validation makes the malformed-packet path effectively
> unreachable, so this is a defensive drop.
>
> I verified the propagation in a local QEMU test kernel. For the test
> only, I temporarily changed xsk_skb_sw_csum() to:
>
>     static int xsk_skb_sw_csum(struct sk_buff *skb,
>                                struct xsk_buff_pool *pool)
>     {
>             if (unlikely(pool->tx_sw_csum &&
>                          skb->ip_summed == CHECKSUM_PARTIAL))
>                     return -EINVAL;
>
>             return 0;
>     }
>
> and ran test_xdp_metadata. It failed at the first generate_packet()
> sendto:
>
>     generate_packet:FAIL:sendto unexpected sendto: actual -1 < expected 0
>     Summary: 0/0 PASSED, 0 SKIPPED, 1/0 FAILED
>     TEST_RC=1
>
> The normal kernel still passes. The test harness does not print errno,
> so I can only state that sendto() returned -1; the injected error was
> -EINVAL. I restored the source after the test.
>
> Magnus suggested a distinct counter for malformed packets. I agree that
> would be more precise than tx_invalid_descs, but I'd prefer to do that
> in a separate patch instead of extending the UAPI in this stable fix.

Correct. If we decide to do anything like that, it should be a
separate patch for net-next at some later point in time.

Thanks: Magnus

> I'll address the remaining feedback and send v3 as a new thread.
>
> Thanks,
> Rongzheng
>
