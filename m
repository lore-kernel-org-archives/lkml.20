Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433586;
	b=pnv5IGJeyXVf0RVwzLSVNd1FdcZjUhyKeMsccetFYEIcxGt1t4ci2chKubezXh0/HENt
	 D2O0EUEnjhp/LmYy2lGdUaZ53b6oFPOTaqfA+/WyRk/tIeGMHaC9Zy2gDcEqZYyHrQhy3
	 oZySkJ0DjllhK7Qf86goIHSNQKdxhTI9rbAn4+bOeQoOO0mRmFs2kL1gakEV9jEjKNu7I
	 x8a+qAVN+gi/vzFCi7BMr0+TJcdL4cFqQRiN9lnHzjYXL1lipXxx7h3PxctcfqxFHLAp2
	 ibz+O8z6kh3OjAWEkqxOqzeb3L+NWvXngqFq+J+LYhw5TcCeSMzWGqL7XRQHDTw1opw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Bn/IuH8puJguqpDa5kmTTntls8rnsQ/IRNg4aGISG5k=;
	b=BT7r1lq4zeiiktUTF1ZzIilU+RWpn/GEQqPxd25Kcwomp8lJiblpSrEtVgPzx3zp9pxZ
	 2AYxVrfAgejir1VCi7vf1ULCjQL9rldUF7vGFnFDryuPGeSF151HudvknMDIFlQRAp5lp
	 1/JToxoehP96pzQtiERtJjknOTVvCdJbD1B+3LZirI0fMAOJrnFx8WsoKIDPuWt+8OuzA
	 d3bklMPVhcETkxgyRlMn6HEEnGEnpG0ceuy22F738nJ1IMH2XoyZnXivXtwGYAtMVuGmU
	 YqUwqcg46M20WCMYvr8EbNZEcz+FRwPIvrT9mNk3s7Bk2eyXBwBtTzZdQvAylth6HZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFi1bM75;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EC3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60EC3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFi1bM75
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso2226794eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433584; x=1795038384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bn/IuH8puJguqpDa5kmTTntls8rnsQ/IRNg4aGISG5k=;
        b=jFi1bM75O8kdx8AOApDpXo4TIMOuvEQfJRet5WygZXfXP5PmCqTzGg2c41ne34+aW2
         4q5ELFq+Thob7N6LqY8n5NCbIO/rVT4cyHu3OyEFjdgMD8UxuMV1eRc1sWkkNsBffeVo
         UmjfhDQyqrrZ7S6JTr6o/MkllBl+R5O5oIZ2/MNDweQdsAtK8ijlylfHKW9cDZzg80u+
         mQGKEfbCj+8sho1K+5iRyGswRqAYqOX4aRD9WkKk1GXE+OGV50vqooJCqzpNMxbxx0Sf
         SuHoUuDv4zYZM5WuDB0NXzJjkTRkrCqwgXYcwyRk4D+Iz7am7moHfSgFDINggUfImQIO
         qi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433584; x=1795038384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bn/IuH8puJguqpDa5kmTTntls8rnsQ/IRNg4aGISG5k=;
        b=elDy+zCQfXKu7EpkuN/74bfG2wg4f3kvg+QNCTADMENzz37GoBx8uDXBTRM1mwbywG
         S0mtQp706bq10KL/U//A/opwNcA2zti87TDyhYhZA3jP+BkR+owX0lQ9n28GO7eeN3AG
         J0z8Cl1DWSBDL0gVDk5jeS7VihbhJn5BTvi0iMuMCM9E5GHjyVMVyS+9CSoQOYjoZe+C
         Wno3aj4ZO6P5j1bGZSELcFyYXql8LJiAq+03blCI+jsR5GsBrGu2yql1bsojH5tfOmo0
         +Di5/GH/EHvD6kMrWak2GFPydtiAtpcri0Rev42/Ueu4cftd9arnnslSC6zRRqbbjoc2
         Jagw==
X-Forwarded-Encrypted: i=1; AL+hErEDeU+wUyTyLe4DcbEdi1YL2iGkC/iwipUhcYLCjnaAPR5H1jAMuR5HCz3Hka3GZCkJ2Di5g7AE8/G090I=@vger.kernel.org
X-Gm-Message-State: APuU4Z98GgjcUOfymQL4mf825ubdTCOiMNr1R2nE1vwpCSU0uAc/1xo1
	j0bjnuELbRNpk4dS4oshbDbePTJO3P7ZcAgqkZzdN2K4KM351ZVn+ly0
X-Gm-Gg: AYBFou3jcJWo57cLzN4VcJM2leTJ1t/U3ZtAIU+FJTUSYKlEYkmdxideVnI5u2VxUgt
	jsM5zenOuTdK4pMOi7bWifMWx/wL5G5uAV4kSD0BdF+6On/gpjb7aEyEYJkr4lFb0ygYMyuhXiv
	DVSEOKRMvRm9FN8+n/W6hpap59BM7F93j9EcjSEoqb9QqVKaX8uGLwZh7IQCDIIbEjUBZvAbv+j
	pQhVRhuyF7YuXAEqi2Y9xjj5qMajZo9/lpUDQMpZu0+/wz8lp244q+15qmpO+RnxnNb/r+7jrSc
	AknrK1n7VsKQhtLTFrctKFTDEyG4NfrTGFaHCD1ERypl88D27R1dXfI4lOY6nIoj1xvyhTSjA6W
	lH8fUp5sHoL9dFiB1nnLfI0z7VeuB1gD0lqwphdtYcE6/7XBGmdOw4S/COghNyxCsfKk9iHDruB
	rq6IU7BWqO6hBhkolNm30hwcujqcer99WvEi1fNfAUO7JSVi/ie4kG7ohSmVNa2t+LZzNt0eZvE
	29cQdmXbAjPwB1Xlmtb0zyesZLSFNwFBhRPa0XSViLVh3Le/v4Dqer+aiv3yAiSGvXirK5n9Qo3
	hzV59gvkY/X14PzKwlClDcMSRzuKlvqwPwtFgCbro7sL
X-Received: by 2002:a05:7022:3b84:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-1b3c031b07bmr3568513c88.24.1794433584029;
        Wed, 11 Nov 2026 13:46:24 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b1003fsm17414257c88.6.2026.11.11.13.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:46:23 -0800 (PST)
Date: Wed, 11 Nov 2026 13:46:19 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Carolina Jubran <cjubran@nvidia.com>, 
	Cosmin Ratiu <cratiu@nvidia.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	David Wei <dw@davidwei.uk>, Dragos Tatulea <dtatulea@nvidia.com>, 
	Erfan Sharafzadeh <erfansh@meta.com>, Gal Pressman <gal@nvidia.com>, 
	Jacob Keller <Jacob.e.keller@intel.com>, Kaifeng Wang <kaifengw@google.com>, 
	Leon Romanovsky <leon@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>, 
	Matt Fleming <mfleming@cloudflare.com>, Mina Almasry <almasrymina@google.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	William Tu <witu@nvidia.com>, Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [PATCH net-next V2 10/13] net: devmem: add
 netdev_has_dmabuf_binding() helper
Message-ID: <avTdfAaW9tlBRM34@devvm16445.scu0.facebook.com>
References: <20261110183826.2927274-1-tariqt@nvidia.com>
 <20261110183826.2927274-11-tariqt@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110183826.2927274-11-tariqt@nvidia.com>

On 11/10, Tariq Toukan wrote:
> From: Dragos Tatulea <dtatulea@nvidia.com>
> 
> Currently there is no way to check whether a dmabuf is bound on a TX
> queue. RX side has netif_rxq_has_unreadable_mp() which gives a hint
> of it.
> 
> To help with that, add a helper to check whether a devmem dmabuf
> binding may still be in use on a given netdev, optionally filtered by
> the DMA device the dmabuf was mapped against.
> 
> A binding can outlive the user's unbind: it can still be referenced by
> in-flight TX skbs, whose DMA mappings are only valid for the device the
> dmabuf was attached to. Reporting such a binding as gone would let a
> driver swap the DMA device out from under those skbs. Bindings stay in
> the bindings xarray until they are freed, so walk it and report every
> binding of the netdev that is still mapped. Bindings that were already
> unmapped are not reported.
> 
> This API is necessary for the upcoming support of data direct in mlx5e.
> 
> Signed-off-by: Dragos Tatulea <dtatulea@nvidia.com>
> Cc: Bobby Eshleman <bobbyeshleman@gmail.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
>  include/net/netmem.h | 24 ++++++++++++++++++++++++
>  net/core/devmem.c    | 43 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index fb693bc1702a..35bb6fa0f719 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -397,16 +397,40 @@ static inline unsigned long netmem_get_dma_addr(netmem_ref netmem)
>  	return netmem_to_nmdesc(netmem)->dma_addr;
>  }
>  
> +struct net_device;
> +
>  #if defined(CONFIG_NET_DEVMEM)
>  static inline bool net_is_devmem_iov(const struct net_iov *niov)
>  {
>  	return niov->type == NET_IOV_DMABUF;
>  }
> +
> +/**
> + * netdev_has_dmabuf_binding - is there a dmabuf binding for a
> + * given @dev and @dma_dev
> + *
> + * @dev: netdev to check bindings
> + * @dma_dev: dma device to check, when NULL it will not be checked
> + *
> + * A binding is reported for as long as it is mapped, which can be long
> + * after the user unbound it: net_iovs of a TX binding can still be queued
> + * in flight, with DMA mappings that are only valid for the device the dmabuf
> + * was attached to.
> + *
> + * Return: true if a binding is found under @dev and possibly @dma_dev
> + */
> +bool netdev_has_dmabuf_binding(struct net_device *dev, struct device *dma_dev);
>  #else
>  static inline bool net_is_devmem_iov(const struct net_iov *niov)
>  {
>  	return false;
>  }
> +
> +static inline bool netdev_has_dmabuf_binding(struct net_device *dev,
> +					     struct device *dma_dev)
> +{
> +	return false;
> +}
>  #endif
>  
>  void net_iov_inc_ref(struct net_iov *niov);
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 5c7d9640e9d1..dd3987bbd9f6 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -513,6 +513,49 @@ struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id)
>  	return binding;
>  }
>  
> +/* The attachment is cleared once the binding has been unmapped. */
> +static bool
> +net_devmem_binding_mapped_to(struct net_devmem_dmabuf_binding *binding,
> +			     struct device *dma_dev)
> +{
> +	lockdep_assert_held(&binding->lock);
> +
> +	return binding->attachment &&
> +	       (!dma_dev || binding->attachment->dev == dma_dev);
> +}
> +
> +bool netdev_has_dmabuf_binding(struct net_device *dev, struct device *dma_dev)
> +{
> +	struct net_devmem_dmabuf_binding *binding;
> +	unsigned long xa_idx;
> +	bool found = false;
> +
> +	netdev_assert_locked(dev);
> +
> +	/* A binding stays in the xarray until it is freed. binding->dev is
> +	 * only cleared under the instance lock of that netdev, and the free
> +	 * takes it before erasing the binding, so a binding found under @dev
> +	 * stays alive while the xarray lock is dropped.
> +	 */
> +	xa_lock(&net_devmem_dmabuf_bindings);
> +	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> +		if (READ_ONCE(binding->dev) != dev)
> +			continue;
> +
> +		xa_unlock(&net_devmem_dmabuf_bindings);
> +		mutex_lock(&binding->lock);
> +		found = net_devmem_binding_mapped_to(binding, dma_dev);
> +		mutex_unlock(&binding->lock);
> +		xa_lock(&net_devmem_dmabuf_bindings);

Sorry, my cache is already empty after c4466d2c3e77.. I wonder if it would
be easier to change kfree(binding) to kfree_rcu(binding, ...) and then
we can rcu_lock/xa_for_each here without xa_lock/mutex? All we care is our
netdev bindings, and these are not being changed as long as we
hold the instance lock (but the other ones are now concurrently freed,
hence rcu so we can safely do READ_ONCE on the binding)..

And then the same applies to path 11?

(trying to keep all the complexity in net_devmem_dev_unregister)
