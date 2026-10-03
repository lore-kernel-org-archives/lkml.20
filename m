Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2962C11E7
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988810; cv=pass; b=HouWRoJtxnNZ3Xa8Lw4WCdJO6nObf+8fLGpfLd21KyfljKCyilbPxQ4W9hCLWy3pCOeg4WAuXiOGFPza+iBRETSKUoMMdXyfMZN+vNmjB4wsmTNfJtnJcUac266bez1HDHfpjTaFGrAdDA8BVCt8e8ezto7ajh1lZW6xvDpLMeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988810; c=relaxed/simple;
	bh=9671fBcw+fxf0lItIU8zIdDNJxy4W7vfPqUaYuQRpRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMK/VmvcNMJ2Y8gQlqDAQ6e+Br7fYwmIpK44+Z6gRJMoYk9U3OIWA0k8zBwIQCO/kff9F4J2M0P8oYxUuAHlLr6jd7/KlDNBi785H9rrdz1byfze8HD8Q5fs8hKs+uGXquEGI2w3MO3xXVdfq6K9paIu7la723k5ImPzGpwIrww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=utiGgJ4B; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="utiGgJ4B"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so12935ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790988806; cv=none;
        d=google.com; s=arc-20260327;
        b=phL+3xZK1k5zCf+uKe/da6r6Q6gxteVrhroDJIpOxMdpq3EDhNazHe1dxTaB3UPGhO
         4b0hXysO0+ZWehcknwyTWdTJRRwxW3pGCv03uFzHfhomm0XKi8DDaMotyyPIt6J8H+SO
         dwREqGbX5slsBtklnN2nyw3l5dTS+eiXLlAcJp59DbUa2o4cged6Oz6BiIY/9T/zo+ag
         d7kJj8P3bLBWuKj6i/amMJzmSTTT+1NS7GJf+XGo9PFLUFhJAZ529SyPTEfZ8DEdRTF8
         uGjlX6i+D7FidORgdBwREUWSMmlSoWqTvoVQ2jjEsojTU8RX3yg5dA0Jr1kbDCophnRJ
         v8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lw/QJIm9h+PtVPJ9rpycUDupDmU7p2Boo9EQVykvxQk=;
        fh=9+oe2ERIYmoib5Y+2cjhOoe9as3jfJaFAMGthcoeKSs=;
        b=NmDrOdZY+kywkMRdPvvSB1nxlwbny4lj3M0D5OHyANVIKBQHZoC8n3xlu6iIld7qy2
         jIff5ZikyNLNAjfcfkrNdoU4GRy50Nn4/PjLuf14GT1Isb4wkI5DUwzsx8d3pTX5Hu9Q
         7PvhrH+NUbBR7eczBJLN3z/JjuqzFs+gt1mz8u9Di7CSD91VU3mtTUSN8nkcSmgU4m1/
         X6+Zh36VBApIu+fYjQYMOenfkw7SRnBOIPIevAT00DXfW+awLThM7Z1/wDa3erl5rqFy
         msYwUXk7S51I6rX4CpvrOaF0p0+gN59G/wjvXFm1uB+CGDLCC7p5xrsjLRHYQtuk3Ldb
         XV4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790988806; x=1791593606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lw/QJIm9h+PtVPJ9rpycUDupDmU7p2Boo9EQVykvxQk=;
        b=utiGgJ4BYJa0YbloKNlm+fJKWs+f8ivcBTpWXyXknKUWNg23IlKJDf5d9cThw5zYb2
         p9QdhrkhpstBrEZAHUMUyGB3segBViSlHWZ7B75lYbO8wYdSCizXcTHrF3AGPv/nJ9KF
         fwkkyKs5A6P7Hm9+TkyMWcin6DRFQVc3lOhUj3BweJM76Oe54Gsry3DVlar0GfA7WY0y
         D1MYiPsDZt1R/XQcBjwrqeShkzRN2RfOhHunnPJmoQowAnY7tBPBMVUadB6C3kF0d+Lw
         0NgY/Bg/gIQpv/VeBwwVjGiPYmIiABwk9JYqIncKGhFFweda93VJMDhz+rMAUCn3xUek
         ju4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988806; x=1791593606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lw/QJIm9h+PtVPJ9rpycUDupDmU7p2Boo9EQVykvxQk=;
        b=PA2fnZnkNoPd26GNh9J7pM3fTN+mhbC0rjeIBpRCD774vaeiWMcdexBVYNatWlszW4
         ZD6iuDf6Tes6cdEWZK6kiZUqj4AHe1ZOUdxa8dPkFA/CAJZbvPxnTUo1qsOPU0v+X0XS
         PFAFAbFzCXfuqk7VwGePy00qJoXWhm+RpumU00xgBtibaIP8zcqWdPruHOe6thC62/0j
         u8wjyydQoV3TwOwQuIhk6LP6wtXF037pBb6mFRYiRZZdYKAV1ODYLC194Jmgi8074PwD
         Qg8iQ12WIhB0aVnVrpWh3LffxiCRM+jL9NAfKiLalzvNCTCy8UBFwUwLFly5WLWr81+T
         Wdiw==
X-Forwarded-Encrypted: i=1; AKwUvBx+WOH1K/V695S3ZY4Rj2VkTH18K84bsYc7iCZTZT0Zl2uLnyHPnFwTnU0S6okHdxp5WFKmlN1OkG9Q1J0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOGWgVcH7ohAYkMtJdmJs5focqqrT2LPHkPpS5mHTcscqdm4Gb
	tBfiRA92aJwDJBeGTmCH7duPK0IVcWhN5S8NQ4LVWzGHVIfhF83aa1ErOmlx5O4oRhijvohLY4N
	y7NkeQYggDatgfN0HcAgDYWHkCwEJnwM5xMbD5s1c
X-Gm-Gg: AYBFou1MtMSm+/+y+Y2ZQjkipjz3tFk08TAySj/Odj8x8VsUCuT94JE8rAhtXz1G4+Y
	zc5LPY3XP0EfI3oafQbXDlnL93Dd02QKmMlT1W42Vy4vMxkH0kS5CNnvrzm6QmsbznzQDg966zk
	UKWaSbfDs//DohCSmyrV/KpfwhfeZbij8JT3iWpYqiV+4EJyNrpdMuOu5VlJkL2Bu0tvWKBa4qB
	30MAkYJwPTizUpMvbFjSLf+Yroy/U1UWMnrWyhIp5B2vgtJHjPDz+zZEgUg1fQ8KYQ9oNkiw08v
	tChzMSOBpneyxoIFcJPxcLmeTm3gFuBo54xs1Ai7OVe/GguGF/RgIpttugi9E0nd0e5ptv15bDl
	JvDMYeM06B8A3/KDNf+iyqGZvSzFumlzN8e1F4jHxhpVPKG1DUXt4pA==
X-Received: by 2002:a17:903:244b:b0:2c7:9e6a:1a8d with SMTP id
 d9443c01a7336-2e5339e22damr1093475ad.12.1790988805184; Fri, 02 Oct 2026
 17:53:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-linux-mpnic-v1-0-6422ee74233a@gmail.com> <20261001-linux-mpnic-v1-4-6422ee74233a@gmail.com>
In-Reply-To: <20261001-linux-mpnic-v1-4-6422ee74233a@gmail.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Fri, 2 Oct 2026 17:53:14 -0700
X-Gm-Features: AclHuK_ridEYnSAvuKBNXkw0ZEQCvmwPGRhQzMH7rOZvbpheiH6O_c6u-_ITow8
Message-ID: <CAEAWyHdJQsKgHmZSAA3M12jpKhgb_pq7QmBRW59CU-Q_JT8cwg@mail.gmail.com>
Subject: Re: [PATCH net-next 4/4] eth: mpnic: add a NAPI depletion check
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: Alexander Duyck <alexanderduyck@fb.com>, Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 9:41=E2=80=AFAM Daniel Zahka <daniel.zahka@gmail.com=
> wrote:
>
> The Rx path can wedge if page pool allocations fail in
> __mpnic_fill_bdq(). The problematic sequence is: page pool allocations
> fail, bdq rings are empty, device receives packet from the network, but
> drops it for lack of buffer space and does not raise interrupt,
> mpnic_poll() does not run, so page pool allocations are not retried.
>
> To break out of this cycle, we can add a depletion check to our service
> task. The depletion check checks if posted buffers are under a low
> watermark, and raises a completion queue interrupt, so that mpnic_poll
> will run on the corresponding napi vector.
>
> A note about the lock free reads: We don't bother synchronizing the ring
> head and tail reads with mpnic_poll(), because a false positive signal
> would simply raise a spurious interrupt scheduling mpnic_poll(), and a
> false negative signal will result in a retry, where if mpnic_poll() has
> truly not been running, should then report accurately whether or not
> posted Rx buffers are low.
>
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
> ---
>  drivers/net/ethernet/meta/mpnic/mpnic_pci.c  |  4 ++++
>  drivers/net/ethernet/meta/mpnic/mpnic_txrx.c | 31 ++++++++++++++++++++++=
++++++
>  drivers/net/ethernet/meta/mpnic/mpnic_txrx.h |  1 +
>  3 files changed, 36 insertions(+)
>
> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_pci.c b/drivers/net/et=
hernet/meta/mpnic/mpnic_pci.c
> index 17eae5a9ba16..125fb26edf93 100644
> --- a/drivers/net/ethernet/meta/mpnic/mpnic_pci.c
> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_pci.c
> @@ -11,6 +11,7 @@
>
>  #include "mpnic.h"
>  #include "mpnic_netdev.h"
> +#include "mpnic_txrx.h"
>
>  #define PCI_DEVICE_ID_META_MPNIC       0x0014
>
> @@ -61,6 +62,9 @@ static void mpnic_service_task(struct work_struct *work=
)
>
>         netdev_lock(netdev);
>
> +       if (netif_carrier_ok(netdev))
> +               mpnic_napi_depletion_check(netdev_priv(netdev));
> +
>         if (netif_running(netdev))
>                 schedule_delayed_work(&mpd->service_task, HZ);
>
> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/e=
thernet/meta/mpnic/mpnic_txrx.c
> index 49061c7316d5..5495e9a9aa65 100644
> --- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
> @@ -55,6 +55,12 @@ static unsigned int mpnic_desc_unused(struct mpnic_rin=
g *ring)
>         return (ring->head - ring->tail - 1) & ring->size_mask;
>  }
>
> +static unsigned int mpnic_desc_used(struct mpnic_ring *ring)
> +{
> +       return (READ_ONCE(ring->tail) - READ_ONCE(ring->head)) &
> +              ring->size_mask;
> +}
> +
>  static struct netdev_queue *mpnic_txring_txq(const struct net_device *de=
v,
>                                              const struct mpnic_ring *rin=
g)
>  {
> @@ -1393,3 +1399,28 @@ void mpnic_napi_enable(struct mpnic_net *mpn)
>
>         mpnic_wrfl(mpn->mpd);
>  }
> +
> +void mpnic_napi_depletion_check(struct mpnic_net *mpn)
> +{
> +       int i, j, t;
> +
> +       for (i =3D 0; i < mpn->num_napi; i++) {
> +               struct mpnic_napi_vector *nv =3D mpn->napi[i];
> +
> +               for (t =3D nv->txt_count, j =3D 0; j < nv->rxt_count; j++=
, t++) {
> +                       /* Check if BDs posted covers a max sized frame
> +                        *  + 1 BD held by RDE as a spare
> +                        *  + 1 BD of extra safety margin
> +                        */

Curious how the "+ 1 BD of extra safety margin" was decided. I
understand the "+ 1 BD held by RDE as a spare" is because of HW
behaviour but wondering about the extra buffer descriptor - if it came
from testing or guarding against something specific.

> +                       if (mpnic_desc_used(&nv->qt[t].sub0) <
> +                           MPNIC_RX_HPQ_DROP_THRS + 2 ||
> +                           mpnic_desc_used(&nv->qt[t].sub1) <
> +                           MPNIC_RX_PPQ_DROP_THRS + 2) {
> +                               mpnic_nv_irq_trigger(nv);
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       mpnic_wrfl(mpn->mpd);
> +}
> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h b/drivers/net/e=
thernet/meta/mpnic/mpnic_txrx.h
> index 9397010557eb..767d87a36c35 100644
> --- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
> @@ -148,6 +148,7 @@ int mpnic_set_netif_queues(struct mpnic_net *mpn);
>  void mpnic_reset_netif_queues(struct mpnic_net *mpn);
>  void mpnic_napi_enable(struct mpnic_net *mpn);
>  void mpnic_napi_disable(struct mpnic_net *mpn);
> +void mpnic_napi_depletion_check(struct mpnic_net *mpn);
>  void mpnic_enable(struct mpnic_net *mpn);
>  void mpnic_disable(struct mpnic_net *mpn);
>  void mpnic_wait_all_queues_idle(struct mpnic_dev *mpd);
>
> --
> 2.52.0
>
>
