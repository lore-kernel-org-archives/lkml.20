Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578647;
	b=incamfYjvTL2f8bqXIGAJBesyoohTOve+nyvMmgvLMkLq06PD/DEULeZelfGWTj7vUem
	 bRPzQS7EhXkPONNM4wy6W7ezrIZl94CE+OL4bdueqLb10THPq5X996le0ws1AHIh42vXJ
	 h2J7Qm8ilpTzrPVy0c1oCXGYgTqoVYVJv7Etys5SbHQeITsNmuCjbRgv/H8/ddIEGkrW7
	 gpKjxXKGNVt9S79RllZsbtLN1QcF55aJqP+5tsHziBK3R7JnMtYwVcEGTG8/Q2UHIlhON
	 GPEOnomMR4u+Z7H5T5HV+wLumGNZo3glJ/9v5axdp8BilgC+rGynNXiimZA2ZXQJAww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=y2MXVuSopof1u2e0UlPr5RPihuMcVA09Qb/rkeKWPFM=;
	b=lzI402L7/jvhsZ82lIiDLOANmLUXq1zYDDPja49+3rkUQGLb2SUASh3rodh3etQr+s38
	 9lSh0K0sU10FQLUWdLdiLnlJtI1M+ZilTCLip9u1lr9ZNBTFTYJG1X86t7xmRM6Pd+xgH
	 IWnmh9TM1p8RFH0kWywX2lJqAIs+K6QuB+vnOaun/Yd5lcie98FjWNM0PyTyqjhMdailj
	 kXsbWmN6GfA7iAZTayG47473wXYjecLDCIFGddvHVhxpRLrKFcsipscZRqZGcmJx1D2iN
	 Aqxt8j2C1bgn+eIJcr3elSislg0ewuPLOTgolZuORH/uKxRYkHbSe0agTOOoA5XK8+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NiN47LXO;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980CC606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 980CC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NiN47LXO
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f3c89594cso41764685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792578645; x=1793183445; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y2MXVuSopof1u2e0UlPr5RPihuMcVA09Qb/rkeKWPFM=;
        b=NiN47LXO04v4hyKr+QhytOE2XBZual7D7I4CjlAT49XnuIDnsILBroE+wzeG3RgHkf
         aKpPZ6tOC2iWHiRrGVpHjfOW9OWSe1El/yQ1bVWHaF68SnV7s2Tbz+Q9dGKuyBiCOOUI
         k1EfZRvJ+fJtsb8u7/K2kBo5MwX+4RKW+usn0kgiAOynxgT2NrGxhYERUWSTH2ttDANg
         pDNURVRkiKuubm2NanbZUE9zrgUoHUuCGWQL9bFZ3usxAgFGpoOnRfkifri2ViO14ywh
         Y8TVetp1OAUKuKxNbhcnCBmJFMoKFV6xHqdMK+03JZDA4b8Y1M1/rnfANyYCFSwODd15
         +htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578645; x=1793183445;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2MXVuSopof1u2e0UlPr5RPihuMcVA09Qb/rkeKWPFM=;
        b=Kl9I1kQf2+RpIMSfPlTt+pptareJ9AGUDj5qnfEiAiTEKPsNZVox4ZoJoAIj/D9gJH
         O03PpBZnmV8cCebMwIPM9rCD9vwlH5LjZXcO2VDN3SBb28su/+nuVJdNfdbC19WYhOSA
         AOdTPu47CmYrczH94KiBN2fJB3rqDbnN0n3SY1cKw/9r6u2GJ4TfdIuu3eqvvSIefoYp
         X7IZWSwxBN9Jaym5n4T5fdsZgk8vclRnDNjMfPIQ4uoapZH+DXjDOWt/e51/AL2YtBUf
         Lksc4V641Dajp5BM8sPT9i4uXoeGzRYjYE4Kezn4SgFoC6pqEvtdfASdRKlojbwk+FN+
         nKcg==
X-Forwarded-Encrypted: i=1; AKwUvByvbDSbV+aKAYtqvoa7LnAIB1hf7EgFRhSZDK00uvtnwQTy3tIqaHDf8JYcU7cbi1Jqnqjs9McgkZFJWfs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIqrhuMy4anZkOLWHTUAogjhfEjOp08vY431o9r0wO9yVIKi7o
	rzRrkof8c9kB8EoWCD34l6NF91wFW/fPtnuQsuiiGWkwNXbLa3MKpff9
X-Gm-Gg: AYBFou1F7ax/6C1tvfCTv8+iD6MZCeuDnJ/go/rtN3f2Yg4r2lD9R2ZuXKi6e+LX5Md
	bJhctwSuFqwSDQFaZ5c/K3O8TYxS/fAoelL0djnC9sPvd+3Ym16guzHm11IfRN5DnoqtnNSsLCo
	op/Lf7aqlR36l56VAAnVWoo98iDBzarc8loDlRQnBr/OchtKqw6Ko9MmywxkNgWDfoVyW5s++Yz
	rRut+Hpqtfxl3DeLxmYzEdFEQ7eRqZNZgO5f3kB+d8SZ2rKTjfruQA/OIsgtBB28sXKnDtM0qCh
	nmEPGZyr+l6zO1qyAzhE6S2MgT2JAZAvcaG7GXqFgypuldIXrHAT7z2RI7Q2c5wTXIJKL9uPyJM
	bm3WDZyS4l6gVglNcWEYSKB9nr2MzuwJk0voXJB8OrronfBMl0Arql9hzkPCkJyIOmjsI2omXAQ
	TVRY0G0R4jhwzYGZEpiZ10QMitfdWOw7NyPU3F8/nQ9zK8mH9wzUtnv/yeAlKIVZu1oWtKAf/Wc
	KuElf76r4KIp9SMi8KtcrJopv8gVRE6nOdcgagyvzZnFYMRfckryIuo6pAc
X-Received: by 2002:a05:620a:29d6:b0:93c:635e:6f3e with SMTP id af79cd13be357-93f57f1d225mr356392385a.35.1792578645233;
        Wed, 21 Oct 2026 03:30:45 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d9af50sm215318985a.8.2026.10.21.03.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:30:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 06:30:42 -0400
Message-Id: <DMAG3G194BUB.JJKBBQWZCU5C@gmail.com>
Cc: "Boris Pismenny" <borisp@nvidia.com>, "Cosmin Ratiu"
 <cratiu@nvidia.com>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Dragos
 Tatulea" <dtatulea@nvidia.com>, "Gal Pressman" <gal@nvidia.com>, "Leon
 Romanovsky" <leon@kernel.org>, "open list" <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Mark Bloch" <mbloch@nvidia.com>, "Raed
 Salem" <raeds@nvidia.com>, "Rahul Rameshbabu" <rrameshbabu@nvidia.com>,
 "Saeed Mahameed" <saeedm@nvidia.com>
Subject: Re: [PATCH net V2] net/mlx5e: SHAMPO: Do not merge PSP packets
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Tariq Toukan" <tariqt@nvidia.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 <netdev@vger.kernel.org>, "Paolo Abeni" <pabeni@redhat.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261021062805.3466208-1-tariqt@nvidia.com>
In-Reply-To: <20261021062805.3466208-1-tariqt@nvidia.com>

On Wed Oct 21, 2026 at 2:28 AM EDT, Tariq Toukan wrote:
> From: Cosmin Ratiu <cratiu@nvidia.com>
>
> PSP packets are UDP-encapsulated, and enabling HW GRO (SHAMPO in mlx5)
> makes it possible to merge those packets in a silly way:
> IP|UDP|PSP1|payload1|PSP2|payload2|...
>
> That happens because the HW GRO machinery doesn't know about PSP and
> considers it part of the UDP payload.
>
> Reject merging when the incoming CQE has PSP marker or the pending skb
> has the PSP extension.
>
> Fixes: 29d7f433fcec ("net/mlx5e: Add Rx data path offload")
> Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
>  .../ethernet/mellanox/mlx5/core/en_accel/en_accel.h |  6 ++++++
>  .../ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.h | 13 +++++++++++++
>  drivers/net/ethernet/mellanox/mlx5/core/en_rx.c     |  6 ++++--
>  3 files changed, 23 insertions(+), 2 deletions(-)
>
> V2:
> - Separated from the patchset.
> - Moved the PSP merge check into a helper in psp_rxtx.h, with a stub
>   returning true when CONFIG_MLX5_EN_PSP is off, and an en_accel.h
>   wrapper, replacing the #ifdef in en_rx.c.
> - Also reject merging when the pending skb already has the PSP
>   extension, not only when the incoming CQE has the PSP marker.
> - Fixed the commit message diagram and capitalized SHAMPO in the
>   subject.
>
> V1:
> https://lore.kernel.org/all/20260917175433.4090878-8-tariqt@nvidia.com/
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/en_accel.h =
b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/en_accel.h
> index 3f212e46fc2f..5a340f1435e6 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/en_accel.h
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/en_accel.h
> @@ -218,6 +218,12 @@ static inline void mlx5e_accel_tx_finish(struct mlx5=
e_txqsq *sq,
>  #endif
>  }
> =20
> +static inline bool
> +mlx5e_accel_shampo_can_merge(struct mlx5e_rq *rq, struct mlx5_cqe64 *cqe=
)
> +{
> +	return mlx5e_psp_shampo_can_merge(rq->hw_gro_data->skb, cqe);
> +}
> +
>  static inline int mlx5e_accel_init_rx(struct mlx5e_priv *priv)
>  {
>  	return mlx5e_ktls_init_rx(priv);
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.h =
b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.h
> index 2b080c39cc37..9fd1ee789de0 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.h
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.h
> @@ -85,6 +85,13 @@ static inline bool mlx5e_psp_is_rx_flow(struct mlx5_cq=
e64 *cqe)
>  	return MLX5_PSP_METADATA_MARKER(be32_to_cpu(cqe->ft_metadata));
>  }
> =20
> +static inline bool
> +mlx5e_psp_shampo_can_merge(struct sk_buff *skb, struct mlx5_cqe64 *cqe)
> +{
> +	/* PSP packets cannot be merged. */
> +	return !skb_ext_exist(skb, SKB_EXT_PSP) && !mlx5e_psp_is_rx_flow(cqe);
> +}
> +
>  bool mlx5e_psp_offload_handle_rx_skb(struct net_device *netdev, struct s=
k_buff *skb,
>  				     struct mlx5_cqe64 *cqe);
>  #else
> @@ -110,6 +117,12 @@ static inline bool mlx5e_psp_is_rx_flow(struct mlx5_=
cqe64 *cqe)
>  	return false;
>  }
> =20
> +static inline bool
> +mlx5e_psp_shampo_can_merge(struct sk_buff *skb, struct mlx5_cqe64 *cqe)
> +{
> +	return true;
> +}
> +
>  static inline bool mlx5e_psp_offload_handle_rx_skb(struct net_device *ne=
tdev,
>  						   struct sk_buff *skb,
>  						   struct mlx5_cqe64 *cqe)
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c b/drivers/ne=
t/ethernet/mellanox/mlx5/core/en_rx.c
> index 903af3b3e779..d49f26323b1e 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
> @@ -49,6 +49,7 @@
>  #include "en_rep.h"
>  #include "en/rep/tc.h"
>  #include "ipoib/ipoib.h"
> +#include "en_accel/en_accel.h"
>  #include "en_accel/ipsec.h"
>  #include "en_accel/macsec.h"
>  #include "en_accel/psp_rxtx.h"
> @@ -2268,8 +2269,9 @@ static void mlx5e_handle_rx_cqe_mpwrq_shampo(struct=
 mlx5e_rq *rq, struct mlx5_cq
>  	}
> =20
>  	if (*skb &&
> -	    !(match && mlx5e_hw_gro_skb_has_enough_space(*skb, data_bcnt,
> -							 page_size))) {
> +	    !(match &&
> +	      mlx5e_hw_gro_skb_has_enough_space(*skb, data_bcnt, page_size) &&
> +	      mlx5e_accel_shampo_can_merge(rq, cqe))) {

nit: we already have the skb from the line above, why go back to the rq
just to find the same skb again?

>  		match =3D false;
>  		mlx5e_shampo_flush_skb(rq, cqe, match);
>  	}
>
> base-commit: b6ef0d965fe8ce0ee4b4dcb58b3511f83003e42d

Makes sense to me:

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
