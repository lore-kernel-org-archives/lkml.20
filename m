Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793650973;
	b=Hp+X4eF527rROa6ony3IeEmC1hnd+JlSiJOHxlKZ72bXDrQwAih3x+O03AHP9k07qN1a
	 +K3FROEN3pJkYtQsSOxvMui1V0ERU6DuTfTllPH0C7ocUInUSGwHVRtdSHy0Tqx6bsRIa
	 soajsbW0MKhjaqvVEQuu8MrIz0qVy7QZ0gpnzf7TWThFEXFKe5KxhgVlKrulkuBJXzriG
	 lG66tVIZ4KdXCTfYhEG2xPBfxaBQHQwAVDf/PjXNnXFt+I1wTCJszmEaLEeYNCREAxZKr
	 gX+Y/oscXSmwGLH+6bfn8ztCMeozHEods//AkQljDkYE149emPHHNwq532YDwBJS/ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nGgNd76Kt0jva/qUzoPfHVBqT3P4/TT41j1U9WFJiKc=;
	b=X9GhxPvtEJLFfAbtiyr80FVMC/GK9DuPq/aewOOSoyS3zAJ+DFZK+1TmkN/is1rMszqL
	 WmEcwhk4fjJgqC52EQ6gndGnzlevhh7hQfGsxScsJNZ7GgcBqm+Gi0xIaet7DwfksNUCq
	 Z128KyHOKhUwwO32SL3aGPVpIFM0f047gCwdSJqnrSUuxFkZ/osvpJb5BhBHXWrZrKexe
	 SbWIOOtbq85Y6Ii87Vsn1QaVnQvgbmoaHk9BaN8ZxLuLJKAlYjNV4gSin4tigRho8Z4l2
	 yhtV3TIxLpbT3pmZeKSncl9es1xGGUYa1dPcDRVYHV4SWprovYApge1lR9EnWRd0tTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Xuj0cyZ4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DCC606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42DCC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Xuj0cyZ4
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1651a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793650972; cv=none;
        d=google.com; s=arc-20260327;
        b=nNpoc63Krn4LNjIvuY11Avh0WkQbAuGPteDSoyuCpuSHNBeuZNaO+Z5liGGHZEc7NX
         gL6HE5I98d2ymWTsLO3y+CHtOhU8Gahd2NuScwoY9U8t50oeiJwic4eCGGk0WsGRWgXL
         Gd52aa+CzEBzuUQ83VOJ2aTsAUH4SiIVZOJ2ZOalDdt1Iw7QsqfKMxLPRQI9YpIO0ct2
         5fHj34AlEXj8thxiL2t6X1L1X0LJI7nZv2RpSSzq0V0c3zn9pI+0/C3xUn15uEJRjX2/
         VN2jpVM42jeEufQQwo18+3i/v2TwDyjRNFoTPhWU6FfFM/hzMKtgQbaRshWEEN3aShO5
         PbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nGgNd76Kt0jva/qUzoPfHVBqT3P4/TT41j1U9WFJiKc=;
        fh=uYFvQBTKe9YFNR8wFj60dlauZ1YuySlhqimkQmxHBlA=;
        b=XC1G6tc+R9odEvVFt4okA/4JX/0/FbgiWBQhVB3jSmcFsCKtE4vczswifPzPTztyRW
         2BfXBjLaQKqSM9HnEX/C4p/7kWmBu7ZSbtpuBJUcPpMIL8czUGPwoPj8rTWfWMiI48tl
         Zr1K+4gFCKQOXRkCLxSzIHEcMAWdvGDFCfcBBO9ryXTMVzVpFiPnDxfB2LS5MoZbTW7x
         Wrw/FndXFJR6MQfW4iibZwr38c3v24mfVBc7uy/7MjaZNXdLaAcs6+qr1UY66PClM88i
         k/cuuBaXpOQzPbnmjucZ0FA32SamEyjMvEcBrTimiXpMucAJjHzU9WUmUbduvKZboxEh
         OmJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793650972; x=1794255772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nGgNd76Kt0jva/qUzoPfHVBqT3P4/TT41j1U9WFJiKc=;
        b=Xuj0cyZ4emQb1iCBxP+MN2UJGJzsbWOms4z/k2g2RQzUR0FwAme4c5ZkYjCgOB2CU7
         iMeBNnzO9gjmOq3gRDuDFcNiXWDfChvkjvK3wfirDwEPKD+pdNpcVXwwF/ZC9DO6Afxr
         o5sPOMnYusljsvrxxu5b9Lq/8FpYF1Ka6bLAEWcZlRzMIQe2xe56by117331u530ceb9
         cHxgyIQ6hUKyUrgJCUfeyP7MyIsw8Sn4fRgo7SLgeEcWb5DYvaKFnFZinrrDjo0eS31t
         y7kLbmugsHME1CI/r+BjLGWUS4a66mt16RN+QagEcXFyq/NIiGYkBVaG8bqCWz35Fk+c
         2URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650972; x=1794255772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGgNd76Kt0jva/qUzoPfHVBqT3P4/TT41j1U9WFJiKc=;
        b=ZjSFAz/LJN2wBI4go1FLDMspovof/Z6KliFSDq3FyOe5gAKODT9lDfopGegMi2uhJG
         30b8kV+2Plta1E6ICFyzZNofpWTbkHRSLpRBOIym59KKNNQoifRSPRMfkHHBiAz8VNqL
         8uIS6O7PiXlSq3cTmRl2MvhRCRJg6KiuPbxLxmphwMzaPMaepdlBuQXW+kmIdGp9Y6au
         736qeklhXWfd/Wumy21/iV0deKf+c5222daTaEItmAi0J0vIVKUjVCvPgxQs/oRB+xE7
         pEZZvO3f5c6Kl9xskbQhlBRGOfRPzUqxNkYF0Ochc5tP+fhVdC99iS5XYhcetSNV/LuM
         PdrQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/uxBQpdRLoWtxFfzTCPQMXktXYGD3r0CuFzUFddLWAhZvFIRIEPE0V63sP8XcksvCQGPIbLVNDBQG/8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DdE7yHo8kE7tqEfvsoNigAJdE0t2veL0/9VJfGLj7E5HztqKS
	vXtIdPpt1VLtBczOPAj8DGKzvnp2a+KtIz99jxMAAmdnnYefFN8N/o7zNqTSfQhB449lLEFm8K+
	pUI9HJ8cHHmqgLzGb7f0wB1VCBKohi7TYggvTSVBY
X-Gm-Gg: AYBFou0ltO7ww8+v8CF9aGGrbLMshf/Sku0MHXucRCCt4t5RobgLBk8l9yV7steHpzj
	1UDitDlaWZ5VZ+SyosKxhE9FhQp5MC7eqfNm8SZXTyXOqOk7NuSyIyfKnBdKfSMtFErFyvO0WBC
	7nQf8hQ9cjM5pi2QEMc2gqphW7CmED8ldmEuuuXwOSaUJxVtIxbdd7hD3cCpiBnEUOy8GAJMn9a
	WjG5f0iQFaWKpTPchmCS7pZlpuylg4rwzUAMjQV1aY4qs6K3kxBpi7heATqCd7cyfBC2pheIsKs
	FtWMJNzBPLH69EkRaLIVePTJYK2xmlcExk3K+SFflt0kMCN1e/F0I2QHp4Tk3+liIP8qzQ2KzeW
	YKfmxsoL4bEVOObaBz/XuVD2x8ived3898KWL+WsuL7FMv62PszaD8yo21fAp/3acOHE=
X-Received: by 2002:a05:6402:15d4:b0:6b1:aa31:a627 with SMTP id
 4fb4d7f45d1cf-6b539cf5521mr2845a12.4.1793650971061; Mon, 02 Nov 2026 12:22:51
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-3-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-3-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:22:39 -0800
X-Gm-Features: AclHuK-QodshQH_GCQKz7_frUweWOEIBaSlwEKwxSIRLVgKwE5w2Aav3CTXsWCY
Message-ID: <CAHS8izPefhGytGNeDWZzgZOi=gLeigZ63nFnkq1ERXXGwrNkeg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/7] net: devmem: charge the frag length to TX
 skb truesize
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> truesize isn't well defined for devmem TX frags: they point into a
> dmabuf which stays mapped for the lifetime of the binding, and freeing
> the skb releases no memory. The charge only feeds sk_sndbuf and TSQ,
> which limit queued bytes.
>
> Charge the frag length instead of PAGE_SIZE:
> - TCP uncharges in bytes (tcp_trim_head(), tcp_fragment(),
>   tso_fragment()), so the charge must not be smaller than the frag.
>   PAGE_SIZE only guarantees that while net_iovs are PAGE_SIZE.
> - Frags shorter than a page now count their length, not a page.
>

I don't know about this patch. The justification reads a bit like.
"net-iov charging is weird and broken anyway, so we can do whatever we
want. Charge size instead of PAGE_SIZE for no reason."

I agree that charging for net-iov is extremely weird. Neither of
today's net-iov types actually allocates any memory. Of course when I
was developing the original infra, I took every shortcut I could and
just charged net-iov as regular memory, but that doesn't mean we can
do whatever we want.

I think either:

1. say net-iovs are not really occupied memory, so do a global cleanup
that charges 0 for all net-iovs (optionally making it conditional on
the net-iov type, so in the future someone can easily add a net-iov
that actually can be charged)", or
2. change the net-iov size to be actually size instead of PAGE_SIZE,
and keep the current 'we charge net-iovs even though they're not
really memory', and then this patch makes sense.

But I welcome disagreements.

--=20
Thanks,
Mina
