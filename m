Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC04C3AC0C1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704147; cv=pass; b=DnoptzpbBMrkiSvcpwDiMnYwRBqufisGiNtcGRAOeK6/XYd23T6qwRo37MWmcsto2f4TaNsAcFAn29sRYsxQ889IG1PSfzyph98jhwuBjEmhokqoMN8MX4jANQVgfyDwJAovMCOoY1YRbvCt/k1V4oOZYRKo4yt9GGG1/gL1hAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704147; c=relaxed/simple;
	bh=EgbFuS2Te6lm8qVRteJKBIzVGTmmynIix9CPN6Z3edM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGZbqRVXSed+8D4wecygee/CmXK4y+CjEczBRmjkM/gflVJ82IVIFBKxjSizTNe2CY3Nc9YaUiPDwMcLpA9AzchvMxLCV34886FErI1Xcq39HMqtrfJM4w9xAfvS52QwhJHTBMTYwrHVxL6W6TG0dqU5kuo/nuZ+Coi7/iqHqOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BjJk/HSI; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BjJk/HSI"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dbdcb4f59so477911766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790704144; cv=none;
        d=google.com; s=arc-20260327;
        b=BWTOyPjSWEeMSg0At40ZIo4G3nF6M69duJUluDfqWnB2VOMBBVZEs+BNM+B/BnOn2u
         bzRir9ZlpFd50iLCfJf1DEMMdcNdtvy7JfyMZqQ1PSpwgbbkVEXUejhmd7z6s4xU0rmX
         RppNTZIcagGRh32mAGjGhKMNOoDumA7TXbzaUyeRtlNIQlFzYesyrB1YOYGVGgKCEc5+
         gIY3kOZAqIkU2x/Qf67OQ2ugKU5EFvb0f5QNZJAMpOzVzTtCH5NIy4xHEoxZC5TkpN7T
         F8KvYcR36ZKK5v02z+rkWJ2rtoMClMphRQU2sw+vXZYCC9cd96O0gqB5TdmbFitvqH4W
         WaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ThdPZzLhMx2EO2ovYKz1eeb+03YA/YkkzTBKjXEislI=;
        fh=HbA7JxFKEMSzyr8Je43lTs4goSc7fUIiX4QuciercQI=;
        b=dm3byJ5rCwCeZ/QxcQBuVZn6MIVR73q+9qHw0hwgYBORgiHSwMkyDtLukr0RuuNI3e
         vah2ZoujHJfTUHhtERIg2oeBAFD47P+MqGrj3VHf29v2mU+uk+HMnYR2IEUX/OuHdYJB
         EPteHEWDsfc9xjuPgw5q4J04mBLdtMUsviSqMMZK/cGvJulrezznMxsyLirf6czy5+EX
         UAcQ92pec7+S72D4pfNR8YN3NWFDHaucZenemOSPRzvGJM/3TWMk64yOWkG/k6lco2iB
         pq1ADaeY3TrZW3MceFHHOlUKNr0213CB/6bx2p7LP33yj5Ja91td3wPuvgUvaAZsvSZn
         ijVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790704144; x=1791308944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ThdPZzLhMx2EO2ovYKz1eeb+03YA/YkkzTBKjXEislI=;
        b=BjJk/HSI+d90L8k+v3ogtsrpdBV9RBnS8n9GzfFAp2qbzia0SRN0MnUBBfbhTcD5bQ
         SKlFbDp1k3y4hc1U+ArLcT/CdMPQw9rDNtPllSD+amC96TQqeF36EtM+zHn16BWbFGQo
         v0YYl2anDZBgTxw2WKpOjBYmiZQkgZyjkQiW2hZC7677ZQaEhs1XMpoNUdlZ7pwRFczJ
         PtTN2FTUT+dqknbyhByvt9rPvNZF4KTFNegi8e3DNcGfF20nLlIS3EHgQvm9GDvyX7s3
         d7N+2F7wTDYiitczhVvx4FnL9GQe/QDPEqlpCEFIFWCOrSZlRyFZqvvnDXGwyei20/nw
         uC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790704144; x=1791308944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThdPZzLhMx2EO2ovYKz1eeb+03YA/YkkzTBKjXEislI=;
        b=gec6RIGevw1k3WmRepE/xlxZxOb1sNrZk1hevVhUJtzMJpZxUFQuQ+hla58TQ561V2
         R+VyEwZdTgR+CnEKucsMOoZCffEZBszKHsCd5pALNe6XUR8Jw29APkVBnFWRhvA64gKS
         VvG8mfyII5U/Bb9XOLWIdkoc+d9uhfq24mqEY0z2uTeTUzZfOMQ8Y2cYoyRgtuh1CEFm
         kR4h2ncXusMtKjFBXviR/1azttfG+9zNqc7UD+fhVmHCII+eefHDvpVZ/u9p6KETqAsC
         usVkq+dCTFbngQnK/oU6rpRFxsvTUpZ7MAPRhC/x+c3ZPZ2mtPIm5kwnMUCqWLdVKuyt
         FJug==
X-Forwarded-Encrypted: i=1; AKwUvByfSg3QQxESaq5PUUTYK3u8XZR+1gNGUBuDO42LVIe7kJ1WypYoghVlbkmoIGwrFS7fyfqW4+kDuaN0Zyg=@vger.kernel.org
X-Gm-Message-State: AFuF++n5572lMD6+yjlxvRbLFV+ujH1kFT4Kcl9EBaJjIak/ZLLMNHTA
	enikQGm7zeqhlbz3sSs6PTDNWOt7KDWCOyJt+Tt0tTNoo19nKjI+AeuyRuPlCIwyNDpLj5q+JOf
	xlXgNReKhhP/IdxWMECn89UUa2TH92ppdQ3daZbvx
X-Gm-Gg: AYBFou2kv+K+wutuDx5lTDNvLt8+/hTKcUVBEMWpuD2XMEq1j79mLLpKWORaT9hlALt
	KbQyynptZedpwJjhsF9MjxFYtBJnSmGzw7O+CadSpCM+Ax8CN+YjCTl0sAdjQqTh22PRdx4zFgM
	WBxwDVu+xOULS/64Hb2m8fgF3e4qUPNjB2x5JEWa9sacwsLRafrrX+cQurkKFDYlvtgQyubpmjy
	UXt+Mcl5TWnKLQSsntg4yFNbk6Ou3Z2gfKBeLSfKC3fnDmHCMYD+ebLwsLaLjKcaYQB0Qp3HzUy
	67h6MTLMKr2g+HckEQLnXVUfNHIC4dsIe9pzv9almoiWxphcORpxpIBo
X-Received: by 2002:a17:907:7289:b0:c2d:e067:275d with SMTP id
 a640c23a62f3a-c2e15c0da9amr18432266b.2.1790704143373; Tue, 29 Sep 2026
 10:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922194533.631387-1-joshwash@google.com>
In-Reply-To: <20260922194533.631387-1-joshwash@google.com>
From: Joshua Washington <joshwash@google.com>
Date: Tue, 29 Sep 2026 10:48:51 -0700
X-Gm-Features: AclHuK-4Jen_xaBqivrTS2m8jiJGtwTSvDPOut6gW97lQXY41zUzIIPLnIv2r1s
Message-ID: <CALuQH+VWjT2VZTOUjseLfcON4=Me6v99KyW=k=Uh2Y1dvpNkcw@mail.gmail.com>
Subject: Re: [PATCH net v2 0/9] gve: various XDP fixes
To: netdev@vger.kernel.org
Cc: Harshitha Ramamurthy <hramamurthy@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Jordan Rhee <jordanrhee@google.com>, Willem de Bruijn <willemb@google.com>, 
	Tim Hostetler <thostet@google.com>, Ankit Garg <nktgrg@google.com>, 
	Eddie Phillips <eddiephillips@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 12:45=E2=80=AFPM Joshua Washington <joshwash@google=
.com> wrote:
>
> This patch series includes a number of XDP-related fixes, both in the
> control plane and the dataplane.
>
> A summary of the changes:
> 1) fix an issue where XDP packets weren't being counted against NAPI
>    budget
> 2) fix an issue where XSK buffers that have not been processed are
>    leaked when disabling XSK pools
> 3) fix an XSK buffer leak when an RX error descriptor comes back from
>    the hardware
> 4) fix a NULL dereference due to incorrect registration of XSK pools on
>    queues not set up in XSK zero copy mode
> 5) fix a deadlock introduced by attempting to acquire the netdev lock
>    after it has already been acquired
> 6) fix a racy NULL dereference due to DMA umapping the XSK pool before
>    queues are fully stopped
> 7) fix potential data race on priv->xsk_pool when the field is set while
>    NAPIs are enabled
> 8) attempt to register memory model in all cases when disabling XSK
>    pools
> 9) clean xdp frames when tearing down DQO queues
>
> ---
> v2:
> - introduce 3 new patches (7, 8, 9) based on Sashiko feedback
> - corrected stat counting for packets according work_done behavioral
>   change (patch 1)
>
> Eddie Phillips (1):
>   gve: prevent XDP frame leak and corruption during DQO TX cleanup
>
> Joshua Washington (8):
>   gve: increment work_done for XDP and error packets
>   gve: fix XSK buffer leak when rings are stopped
>   gve: fix XSK buffer leak on error descriptor
>   gve: don't register xsk pool on pre-existing queues in RDA mode
>   gve: fix napi_disable deadlock when attempting to disable XSK pools
>   gve: fix NULL dereference from premature XSK pool DMA unmap
>   gve: disable NAPI when registering XSK pools in QPL mode
>   gve: ensure XDP mem model is registered when disabling XSK pools
>
>  drivers/net/ethernet/google/gve/gve_main.c   | 153 +++++++----
>  drivers/net/ethernet/google/gve/gve_rx_dqo.c |  31 ++-
>  drivers/net/ethernet/google/gve/gve_tx_dqo.c | 256 +++++++++++++------
>  3 files changed, 314 insertions(+), 126 deletions(-)
>
> --
> 2.55.0.1082.g2b9226bbc0-goog
>

In the interest of getting some of the more trivial fixes merged, I
will send out a v3 with only the very simple fixes, and continue
working on the more problematic/invasive changes in the background.
This will include patches 2, 3, and 5.

-- Josh
