Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D349415B92
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423095; cv=pass; b=TnQBOt2JUgPPYcOl/tlIZ2BOjCK39So7JQV8zmzsTzrcbRC6ZrknxNdMDUKXMUmTIs1AZGdIwkxi4GFjzZL+LJ7RJxNT8lHPA3Hn9Y0UDxHE2pHMocAH8nS55tMOwKePKxq8rRivhT7duhd0j4vNL2B8tv1oRAR1Guxd2BaMOGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423095; c=relaxed/simple;
	bh=2oucmxVLZzpsHl2bsclPjBym6RGzyC0ruoTEA/sa9F0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcM2AAzd931C3vAh4xlTJDXcXBnJGAkVPPPaU53d8rpa8Q4fpvCb1cC3qX3DMptTojRLaalVQRFJqKCxiT1oxrvrzla8p5SS8YAhWGrJDzjN/9GjWdQ0LZ4Lkaj3A45QW3nego4IXurttYO38TuWgf8UUZkicJfNpjmfwJWm10Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZORgcYuL; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZORgcYuL"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a613a6bcd8so622a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:58:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789423093; cv=none;
        d=google.com; s=arc-20260327;
        b=db3Uuqb4VC3dmvvLB+mR1BIyM7GIbUO+rWnTC2Wh/0zotQRPd+5k02a4feWJUuF67L
         raqinT5ZytuEJCt30zGRPEtZa47A8y1fSoaZONG3u6KgI9rRWROsYPn1VtCX3N2cZIJc
         q5LVqZ1pXiBbDfWLk5B/3/OnTImAD6bkDVUyMy5rS+VDHKe80moaawmqlkVf3lQMXCnK
         BAUgI4/Rsb4FbnxJL6PLx6MqeQgl4Czw5HmnQJeGyrS5MwUhuqtK2hvHu3vJ9G7axhtW
         VGh1Oj3U13L53vI18r8kIrMppT3UeVuVb11moM7Cn3uWD0oqgWDDbfYYx1QZ7+sKxmjd
         YjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GBcZvsPwFZfbhRFR+qKliCsigQ1sOEsYBMsUSsjWMHo=;
        fh=Bc5XXAkQwf300JOBDB3vcTX2LoTqg0Rtbbwujc7ek04=;
        b=BJsl3ZHiJ5qspxeKmTFg4SLhdEYZX2CiGMPOI17ilnV6ndG8QsE6fyUwzz6eP361c1
         E1fZxPw+FPHA/dqWRuTQTQt3SANFJa0ki/O/GLM28oOd27ycWpFgyZYG1FKRHJIIriXl
         HrajvBIu3fczUn1Dqd6X54GYgGrVyMfoS4xANnH19AyQ3NWSMqmfrHJpkJmHN9Y/OUl7
         wwHxKDPUp30wU/SjyOc89TPO7EtGa541vw0fAwkkl/RTAhfGA4cbxw1yOjb3ClFm1rdK
         /O3lv6CBwvvNtJjZhYrcf325Edm0PZFiT5YjSJ/EMYd+POcmOG/MKvZzC6zeyMSAgSA6
         suAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789423093; x=1790027893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GBcZvsPwFZfbhRFR+qKliCsigQ1sOEsYBMsUSsjWMHo=;
        b=ZORgcYuLNvNKXCEhnZfOKd6D7GpPOg5whryg4OtY/+RutO2b+NQGqoq+atw+x9mRi1
         ZaViyaw1WRZpjPBNUturDGpRZ9RJKDySZwN/kKx2RgKj6JtqbKSpAKEzyhRG52RZJUqy
         6zIC7oKd0HUlXkX5gzbpiosGpXZ2pjivGmoHfENg13FVIgJHd/Z5i4epnf/xQ4zXSi+r
         5V+OUW5Rp1q2lh9+6Lp8WI2lwE6TP1FuygGY3RCbd+ePZwjdiV/1RuBzsnybTOhJOmmV
         y/yTxyEGi0ZF2adtrie/UuKHCfQkbwA5B+YSRm8lUx9tEUKm2HdcfyIM6k5syHCzefpR
         9GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789423093; x=1790027893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBcZvsPwFZfbhRFR+qKliCsigQ1sOEsYBMsUSsjWMHo=;
        b=Z3iWYKytnecEtWsfwGJ450UBooaTqy1EPHVZUOp2oPMnflt4SEDFRqItqI78jMyuLB
         Jb5gaLYrcG/HfRjSRrcEUElAFkdecQk2RRNYw3OSBjVw0Ntj7LH2OO4TCfG7VhLfZsF+
         lkaqODT+9CuCLc0UJHnIRvT9Ow4Jgi8Fd2LMr2kkvcgV5ZWHMO5UPY9SxmRRtR06YmAm
         hczXAwu+ASnSGN9MF5b1Scdnz/3O8vJAjIIbMrNEE2HbkHIlGrSFZ8dAumVzx+g3NOWe
         OdS2lOCnQXHGL/2IxEHl6tkUfYxeuXX4+Vx62jHAKIksWZNYiVToTraPYQUSRzJ5BQdf
         L3nA==
X-Forwarded-Encrypted: i=1; AKwUvByWEWyTVAQmYTHsXAJajP1i1to9i2cxsDwXKq1Sb5BNDdeYRkhJB7crwStjJxnb5PIiWprDZQlD5m3iX9s=@vger.kernel.org
X-Gm-Message-State: AFuF++n3jMrG9V98wAlYJokg1z4k9j8nNOWr0G7LwdQ4XKWLOIsd3S8f
	KQXea5rcZHqw7a0iRTsSC0z/xID3iNzuyFFZNLI8vt+btp478oFtb3YblbBHVCVUDU1ZjEJ7+6F
	W7dQOU99pSM4xaeCt6CNOZCLGkn1dgCDb6CD6ceeW
X-Gm-Gg: AYBFou0aIjVwP87FLHS1fjbSr2oZfafC47BAoyqgmwB93IrUm4HukI451CzbEg/oUc+
	/84VqOr2p+09u4dxrv9LuJ654s4Y34lYnoWvb9RYT1cI9CS3OKAgW+fxaBoNmYdtqhl37Y9pOms
	YxiPTZ2+F6mLzT7/EwEG3EqIEYm5NRD+Es4qhvgqsuXOl7EPVuradGqRVp9vwktFu4MpeyYJt6T
	hI1mZVu++e6tiMfqgHWRVhakk7qQqarz06T4ESh555uySP7cjvoV/FQVDeOzYS2FrmPo1wLFywv
	7j8FwQsOcVUBj4+IYD93pEe29yHj+TlvDKWn3hBqTN5d1mhuU0ilolw3fSI8QqvtVxxeD+9xMo/
	VVhbmuqI6AS8=
X-Received: by 2002:aa7:c38f:0:b0:6a7:453c:a166 with SMTP id
 4fb4d7f45d1cf-6aa0749c8f5mr8562a12.1.1789423092200; Mon, 14 Sep 2026 14:58:12
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911154555.739041-1-sdf@fomichev.me> <20260911154555.739041-4-sdf@fomichev.me>
In-Reply-To: <20260911154555.739041-4-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 14 Sep 2026 14:58:00 -0700
X-Gm-Features: AcwNN1U59Zp0E6Rk1J11A4UKHaujiQuHE68JQWx3v-cvFCDxZxawq-kyicBT7r0
Message-ID: <CAHS8izOSaXtZy98UB2ye4-+59JujNb+SyBp+EO=YjnDvYLr85A@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: devmem: batch net_iov allocations
 into the page_pool cache
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me, 
	bobbyeshleman@meta.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 8:46=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> Rename net_devmem_alloc_dmabuf() into net_devmem_alloc_dmabuf_bulk() and
> make it refill page pool with up to PP_ALLOC_CACHE_REFILL NIOVs,
> similar to io_pp_zc_alloc_netmems(). That should amortize recently
> introduced freelist_lock.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  net/core/devmem.c | 59 +++++++++++++++++++++++++++++------------------
>  net/core/devmem.h |  8 -------
>  2 files changed, 37 insertions(+), 30 deletions(-)
>
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 7949f8425bcd..a0dcc896dd12 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -58,25 +58,25 @@ void __net_devmem_dmabuf_binding_free(struct work_str=
uct *wq)
>         kfree(binding);
>  }
>
> -struct net_iov *
> -net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
> +static unsigned int
> +net_devmem_alloc_dmabuf_bulk(struct net_devmem_dmabuf_binding *binding,
> +                            netmem_ref *netmems, unsigned int count)
>  {
> -       struct net_iov *niov;
> +       unsigned int i;
> +
>         spin_lock_bh(&binding->freelist_lock);
> -       if (unlikely(!binding->free_count)) {
> -               spin_unlock_bh(&binding->freelist_lock);
> -               return NULL;
> +
> +       count =3D min_t(size_t, count, binding->free_count);
> +       for (i =3D 0; i < count; i++) {
> +               struct net_iov *niov =3D binding->freelist[--binding->fre=
e_count];
> +
> +               binding->freelist[binding->free_count] =3D NULL;

Nulling is probably unnecessary?

Reviewed-by: Mina Almasry <almasrymina@google.com>


--=20
Thanks,
Mina
