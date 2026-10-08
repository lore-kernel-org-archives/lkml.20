Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F493DD502
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444551; cv=pass; b=sOjDU3TegjJV/jcYLL91q2etb8YzpPBYdm1uocWwpMNOQ3PGUaeOyeW3hIFOAtYsW8uhUeykgbcwSwIFCr7KRU8IgAQU1D3dL8oxWZhDIx4oxk/QJ8fNiYAQ3O1Wcwg1ejnyqkIOKHA86WbhVMe3DN9xp71SrnXhPD4Qqn1sonA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444551; c=relaxed/simple;
	bh=UeBb5/Usyxx4tpcXjikXZiATTLeoysYCvbBWoXLg6pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQ8P/tTOhWmIXdldxKdeh5HsBSZv5MB8XcIDhaLi8rHrMDYmeeKfnszx7IktQCTj5JgGEEbKQazl9jD+0uJYwfLvMr1TAV7WHHKrsf0tUV7TZwIEIf3csChkSwIAjO89jWGY8vZKFqshDclAkBA9kENCqvHdYsDdzYvV+uyKAGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1m+at3X; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1m+at3X"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6af9f1ebacbso83075a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791444547; cv=none;
        d=google.com; s=arc-20260327;
        b=HMY+HhN9TqRYdKXJfHhd3MKm72XE0DSf0eXcL+TJ/YHFJhGpOjE7StT97N5FMYSAIq
         3C3x6meYmB3MQ4XzfGsK+rmcosxeoarHY+mAN3y5NkKVsQXaa668L7QsYhSChk6UKnvF
         1H51Fj9gizi6WoYcacmhy3unxTbw7W7B+qBCIdCmPx3mglG+aiGJy/CoZfyYRd/X1lT6
         5JQVkKHF62aKUQLFmbeLlb30a0HbCNxWeepUevxAJsUgwvqudf2j9Y9JAH7ZCTj2SMxs
         sCQveKFj5rxXCNxXz5ohCoFgkrgFe8OdyrEYK0/cpAWDbZTDCi6Xe0w7es8022rMOFbI
         td7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9o0oJaFKufMNjlilQDJWX/nZeJhX0+Oq7E8MvusdFBU=;
        fh=wEa3kqs1ipOOfWfkPzLw0oZRy1FQQ7YxD3kwlaEaNck=;
        b=kCRVCDhAkPlQjaxYoAlAAHp49235zxLlO5kCmJkHLdLP8o410R1P74zomTqnv8pJZm
         9AokjTMyPVch8zWCJ4MoVpzfqSPNR4OFUFa5cGVDLXdTpbzy/GE/J7TlVRFCM7UtLeOn
         e7eNJHczXL8ED5QTx4Md4HKtau6LoJbjcCrio6kmgwv3HAXwEYebCxMoqOy9buZ+yPIn
         SfBAAWBHKmQJRSS5UfOzjUo7T+Wk0Cy/t55WqmvyNkdmyNkep5aofrGpa/e3CZN5CeA8
         XTb39B+d0JGcCXkTp+wswOVNL7qBoX8J8K1lDL9yMoq0CXGYCzoTnmOgqmtFh3RyIQR/
         EyfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791444547; x=1792049347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9o0oJaFKufMNjlilQDJWX/nZeJhX0+Oq7E8MvusdFBU=;
        b=B1m+at3XgSsBEgsM4ST3zlmvvf1HVGEdJ2cakEhA6kzw8SlrVFy/OTljpWdHz7aK4k
         IzWfZR7Maq2TI8Bgr3wzxA5yfYIgha7zWk0Mb8KpvyrhhGvgNqmFi4wZl3xWYx6+tf4J
         SGt0TR2A/olVuKf37zIUD9/nSbSdY9/7MPU14PkD9zeq6m6/PR8vAgHTHxN/kG4u8phT
         5QYqmkL7jNd7f29ZCrsL4+Tw4tjVA6D55tvqlAcTeeFxVAAXWqva4I5Vk/mdLQDiwtZH
         dvVrU39H8Dr/LAvjbOGtE3aXlsAjv/c0zpM8InZHddYRBORen4qgzdxIrk6sf2f5BD59
         Gg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444547; x=1792049347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9o0oJaFKufMNjlilQDJWX/nZeJhX0+Oq7E8MvusdFBU=;
        b=mX+5CShbrPfX/tlQnm+/T/UNnkINgyxejHpSSKs5/tls0sCxgtP4VzirqSPq7qpJDt
         jzAjD8WumcN/cC0HfdgxSKaZd8O4aTU6bfHBsDKp+xxVlKsLlKWwcAcjeIqMYvw1Zgku
         wdPV9eu31jcSI8ilvBh2//lhySt5LhKD9XPUgh/sOANAN5/ovwdeey0JT20AGHC3oE0t
         5BJn4wz5pwPjbbci3992P8ZeYIFxj87faRo5V9p5SZzaGaHimGn7h9YvyQjfdwhEI9xO
         wtryRHANJvECmUIF7Ph4MX397L7obu2k/uMEDtfPw7qO/It5NcOskU04N0dp2TNSSn/Y
         jmUg==
X-Forwarded-Encrypted: i=1; AKwUvByd2ZzUEHjtzDYsoUmLSFNzcsfesei+wRVfWVzEcgCbO3uHqhQgqC7/3R5kHsEBa1YaBdWVOhetBRG8mQg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXb4ZYuo7+JcrbZ1egdGs6U7wFNe8622PspkHCnE5tnsj0oWUR
	GmUCIde3rDBG8dbnD5MIIBYrYjRH548Aqs7Dtf8lR++ke/xWQh/dPxkQl8cn8y8P+9ll4QHcoQE
	KLImMhPebmzVni63TTC3NwV2KHUQVEm0=
X-Gm-Gg: AYBFou1P17maigTNOPT+fK3j+cOt1IXCkfmYmJN48JEGu4AxY7c9PqOogA1sjDGf3gI
	L12AkcwwWgHHAyIkJGCkuCjnOydyuiKljezc+6IUy3womR5VcP8+nUe1u1WEjbRQU/r3eAlmK+v
	PtgV+4b3sO21EAjSkIzBhqfOsAXhhwiMJxd3fDStpv/QiR9LBVn7pudPqzh5mNNNuA1MwwprHeV
	qFtpGiT4Hq4wOfsm/lZkE3qjQEyRhBTn8YgVz47Gl03bVeiE3MHNUI6FlaQyj9ezZInn2098jV/
	l4QcPWjCmFlYNBa0h0IgNOmhUQKfYHkcDroGV98XYtru/dngxHUc/Oab4VrsZ1vDMEUZ64AydHY
	iYYZYdty9kMc=
X-Received: by 2002:a17:907:d0b:b0:c2e:e3c:ddf3 with SMTP id
 a640c23a62f3a-c3190945b02mr159128366b.1.1791444546597; Thu, 08 Oct 2026
 00:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926175209.2618167-1-nicoyip.dev@gmail.com>
In-Reply-To: <20260926175209.2618167-1-nicoyip.dev@gmail.com>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Thu, 8 Oct 2026 15:28:54 +0800
X-Gm-Features: AclHuK9EXpr0HefVuYLsA4YdaqlPkdVI9gNgl9pcgqj8r75fsnYM3PffrDC4sJA
Message-ID: <CAAo+4rX15W_cvz6VwDDrwkvvo34iSU0snkAuM00-geV0tD0J1Q@mail.gmail.com>
Subject: Re: [PATCH] netfilter: conntrack: wait for RCU readers before freeing
 the hash
To: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 1:52=E2=80=AFAM Chengfeng Ye <nicoyip.dev@gmail.com=
> wrote:
>
> nf_ct_get_tuple_skb() calls into conntrack under rcu_read_lock() without
> holding a module reference. CAKE can use this hook to look up a packet
> without an attached conntrack, even during nf_conntrack module teardown.
>
> nf_conntrack_cleanup_end() clears nf_ct_hook but frees nf_conntrack_hash
> without waiting for existing readers. The grace period in per-net cleanup
> runs while the hook is still published, so a later reader can race as
> follows:
>
>   CPU 0 (packet path)                 CPU 1 (module teardown)
>   rcu_read_lock()
>   ct_hook =3D rcu_dereference(nf_ct_hook)
>                                      RCU_INIT_POINTER(nf_ct_hook, NULL)
>                                      kvfree(nf_conntrack_hash)
>   ct_hook->get_tuple_skb()
>     nf_conntrack_find_get()
>       access freed hash bucket
>   rcu_read_unlock()
>
> The same missing grace period affects initialization failure after
> nf_conntrack_init_end() publishes the hook. During module teardown,
> KASAN reported:
>
>   BUG: KASAN: vmalloc-out-of-bounds in __nf_conntrack_find_get.isra.0
>   Read of size 8 at addr ffffc900012e2ae0 by task poc/90
>   Call Trace:
>    __nf_conntrack_find_get.isra.0+0xf87/0x10c0 [nf_conntrack]
>    nf_conntrack_get_tuple_skb+0x255/0x400 [nf_conntrack]
>    nf_ct_get_tuple_skb+0x75/0xb0
>    cake_hash+0xfdb/0x1e10
>    cake_enqueue+0x5cd/0x36e0
>    dev_qdisc_enqueue+0x40/0x170
>    __dev_queue_xmit+0x1e90/0x3110
>
> Wait for an RCU grace period after clearing nf_ct_hook, before releasing
> the hash table and the remaining conntrack resources.
>
> Fixes: b60a60405fb9 ("netfilter: Add nf_ct_get_tuple_skb global lookup fu=
nction")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> ---
>  net/netfilter/nf_conntrack_core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/netfilter/nf_conntrack_core.c b/net/netfilter/nf_conntra=
ck_core.c
> index d0d9e5ea84a0..b07e94e75d4d 100644
> --- a/net/netfilter/nf_conntrack_core.c
> +++ b/net/netfilter/nf_conntrack_core.c
> @@ -2455,6 +2455,7 @@ void nf_conntrack_cleanup_start(void)
>  void nf_conntrack_cleanup_end(void)
>  {
>         RCU_INIT_POINTER(nf_ct_hook, NULL);
> +       synchronize_rcu();
>         cancel_delayed_work_sync(&conntrack_gc_work.dwork);
>         kvfree(nf_conntrack_hash);
>
> --
> 2.43.0
>

Hi,

The issue still appears in the current nf tree, and I'd appreciate any feed=
back.

Best regards,
Chengfeng
