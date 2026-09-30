Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC6E50AC16
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784761; cv=pass; b=cmYgL58GVQwtZbt/61tIJuJiyvJs+UOfxEfMk0knaxZaDfB3ZG6osphOI+xlz3fFbHIYHv0BMDpofOLi7VAuKTGqxgzqPUL7kTnuuAHr+snD3qTvn28BVnmHn9o7XCjMqMDVUt1igKVwpzZFJhU0eE1ZiDRjTTHVlM01DqsizSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784761; c=relaxed/simple;
	bh=7gqiQOM1qisNlj8JQPYTsymhakjhh1OHGQP9wdS9nLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQVvwIJAdArtkdZyx+wDgtwSLX6fvk12yGNeRt1SROFPLiYbRfvX+E3ZFHT4vROAzv4ZEUeFBZDrdIHQITfQEi5enT5kEj4ssAciFS0ESBwdTuc5oBA/Vr/NbUZXr1Rm0FJWpIhehgICyBXQYrXXA8iLgdKG9nsLDC+iLKRilAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bEjRPpal; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bEjRPpal"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso9120a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784754; cv=none;
        d=google.com; s=arc-20260327;
        b=bYKbiWhPYtvgVmvxpWnHaeTPhdpkPKcZiVApzw9KWpDFN5/fC7w+zmh9eG2G5mvekZ
         csfPvOeHpFbtEgPFY+M45f64picAsX2an3RwAimhe6XGQ4ogyNEmhEI5XiTtn2T+GfFk
         ACN9vneyQL06nxqti1A3f8wd/GrjNudwpkMmNQxjfho6oAg5EbZe5acoIu5A5a8X9IIw
         g7D3qc5CxuuY00Ho61/fGDis9puwpN8CHALp21hXKXqUD8bdQN4ONDl/ALiPxhRjmtEn
         CGOiNm2YBcdTVBOXz9A1OESnTteO46Q3P+ONXrju5Qscpc6IpnZf+CSY/kA4CHYsCRsZ
         VW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sKCqFzFBYqTrIG82wyOVYeMg1E+Z4esSyVmGkXm0A98=;
        fh=oRX2lIjZmVu3bppXhRmXjTBGJqe3hiMeEysvqz86p3g=;
        b=FBEHWCgybECt7dEyed8m5lJt6YLvYvSx5wbIYATRUupSY4KR0tb8w1za8zBp7NZsUR
         T1u4Lt72nVW/REzDgEj4emMUsE2ibexbIoCRQONmep8CmwTY5v8EQLX5r8Mtg9MuUT0d
         TM0oWqKWxCbGNeinNLELeTWmtFKiXj8pLFKiR4LlSlxnG69zFTjYBXj+0Rr1DfQOOZfP
         6I4gpCUnc3ZUS6YqJr6NjFLLFvi/DD9IrmX0xpG7Y67Dvl0YB1wrInWTOymHdh4mJ7Xl
         VbYrrm2YSYOA5rTwoz71JegAAlzVzwm8ekpLRm1ugQSzO850tJqadDog2URgPN7xzjPO
         WP7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790784754; x=1791389554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sKCqFzFBYqTrIG82wyOVYeMg1E+Z4esSyVmGkXm0A98=;
        b=bEjRPpalTxdDdMgHibqpAaNbPNBRJDrE73BGcSE29kN6dxT+muafGlzGVqWqMlWwUE
         FN4/f3/cNmb6O6jJWREkvRQUr4n6jT/MLK3JVzGORHPFt/ZYI2FsSv7UJn9CvLVod1M1
         weB2ifeAgLhGV5yFe1IGAFlxo9dPBDWMtLAviUZDsEN1IKMhOBWcMrWVQPvnY65etVI+
         YuC/fWPNBd2BK4oWH93ZDFd+HZ/MFOikJSMs0ISi1cZtmX3np4IHeClwKjMR7Uxw6Gqf
         if35Pt0LkbY7I32S1AKmZ2uhpsVVW5L9CTlpODNASMKpreDmcrEbUoUk/FDiXmNpqG/H
         b/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784754; x=1791389554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKCqFzFBYqTrIG82wyOVYeMg1E+Z4esSyVmGkXm0A98=;
        b=hTORcjHEBOfwEdlq10rm9ORJgAgMDFqaFvN/fyLHojYyHPBW0t/4MMxX6ouO7Pfwdt
         T2k0egs10X8Wnk7aBuwMMqlbaBvniIkphG5dD3K5/wpcEJk52bTRZKXTahWgCvlegB/6
         MDlLNgduy7up8OOFSRsaNw3DgnFkw1lgeGRcjbaTP6ShZH4inHI6i5b/RhIKwvpty68J
         mtEI4kKHmP/O9GtUw7Qq6Yz70+bk+57PzYymOwhyEl1aFUX46nzmUeDQOvVChivaS/5L
         8+RuSamS+nTv3RFZTJWMlJwp/i2AVvEpQUIg8bHUAs8qzp4r6DgNze2gdf/j+y5x0yBT
         x0vA==
X-Forwarded-Encrypted: i=1; AKwUvBxRQwCV5ZYLXv3mp82YdvKu3Zt4ziJ2UKQAa3G7foeVep5dtuilnF/TD675WYvememyeYc8HetZZdUp3EQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwbig9ryZl57/m47JzY92ABCSHxrz2aOTavtnxT8uzbNXO1gcn
	AkDMbSQcL4NSh4MAKys94z7rMRBLiFnLwUDo+DPWDBkxNoVLZfYALdfh3ZAvXiswHoWz74Tkcsd
	VoyhZ4vIGPLX4ixgbs2tL/H71nVbr+KhLMYCkog3fksBH37sQ5n4klEH4
X-Gm-Gg: AYBFou08KJd97GZ5xm/TteMz24MKb6cudo0j8sOUYFQntbMyNWcf6DzQhfWTyi9JgGv
	iZnFuFPfTrdyowUAJZIfzBxA62qX68pUcHpp+n57oW7x9yFUZrTxlCE25CBOpyIu+I84WAkmcPP
	M3076ybxNsA10EjOsVY7IMA+ir6dRiuqMN15uNOEHqIpRPW1rvMNqsJIH87FkFAQCKr1g69XTF/
	wAsI5c7sR3na9kll4p/xiKFi5NwB1wxREWSSwNUoSNTjPKPB+MYMINSZ+BRSLrxd6SyRyKhXFfz
	hOLEZV/7KnfDhhQqaGHHMbHcoh074jc1rlKFXbYU3AzzFQ5YMd1Kl/2ZoXu4T//hRUITGLeOWMQ
	qh87TfTvI3g==
X-Received: by 2002:a05:6402:a4ed:b0:6a1:4eba:f09e with SMTP id
 4fb4d7f45d1cf-6ad59eff06amr46096a12.7.1790784753356; Wed, 30 Sep 2026
 09:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930102524.1659847-1-4ncienth@gmail.com>
In-Reply-To: <20260930102524.1659847-1-4ncienth@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 30 Sep 2026 09:12:21 -0700
X-Gm-Features: AclHuK8sXEfV_wKW4FGBJSbi9it2y76uzkVZaA-s7FwS1OnJPEJwdDQqQ9SxoiU
Message-ID: <CAHS8izPpY0F4nnvOdq-ijsa27oiLxNViBXXyS54HJuHOO8rkGQ@mail.gmail.com>
Subject: Re: [PATCH net] tcp: reject net_iov in zerocopy receive mapping hints
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:25=E2=80=AFAM Daehyeon Ko <4ncienth@gmail.com> wr=
ote:
>
> After copying a readable prefix, receive_fallback_to_copy() asks
> tcp_zerocopy_set_hint_for_skb() where page mapping can resume. If the
> next skb is unreadable, find_next_mappable_frag() passes its net_iov
> fragment to can_map_frag().
>
> skb_frag_page() returns NULL for a net_iov, but can_map_frag()
> dereferences it in PageCompound(). A v7.2 KASAN run on a connected TCP
> socket with 64 readable bytes followed by a 4096-byte NET_IOV_DMABUF
> fragment reported:
>
>   BUG: KASAN: null-ptr-deref in can_map_frag
>   tcp_zerocopy_receive -> can_map_frag
>   Kernel panic - not syncing: KASAN: panic_on_warn set
>
> The diagnostic inserted the net_iov directly because the test host has
> no devmem-capable NIC. Hardware end-to-end reachability remains untested
> and requires CONFIG_NET_DEVMEM plus a supported DMA-buf-bound RX queue.
>
> Reject all net_iov fragments before skb_frag_page(). This covers both
> DMABUF and IOURING net_iov types while leaving page-backed checks
> unchanged. With the guard, the same queue copied the readable prefix,
> returned a 4096-byte skip hint, and completed without a fault.
>
> Fixes: 9f6b619edf2e ("net: support non paged skb frags")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
> ---
> Affected since v6.12-rc1; present in v7.2 and the pinned 2026-09-30
> Torvalds, net, net-next and linux-next snapshots.
>
> The existing combined fixed v7.2 build was warning-free. No isolated
> kernel build was run. Tested config SHA-256:
> f992c9fdb881ca95c467896791c52554719f6204cf06268cd92ac37c14c14f83
>
> The reproducer is available privately on request and is omitted from
> this public AI-assisted report.
> ---
>  net/ipv4/tcp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index 562752352afe..87ef6d5cbfeb 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -1908,6 +1908,8 @@ static bool can_map_frag(const skb_frag_t *frag)
>
>         if (skb_frag_size(frag) !=3D PAGE_SIZE || skb_frag_off(frag))
>                 return false;
> +       if (skb_frag_is_net_iov(frag))
> +               return false;

I think this should use skb_is_readable(). But you don't need this
helper for frags. I wonder if we should add a readable helper for
frags? I'm still holding out that in the future someone will add a
net_iov type that is actually kmappable and readable.

But this is good enough.

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
