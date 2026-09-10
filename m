Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575DD457E71
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075779; cv=none; b=pT6X65W6IkTZi8x0NhkOzuQgQ1jUoG+fLFxjPMfa5XEPzgPGFIXBoPB01irZ7WP24ZBmZRaahmcXrEIaKK+RyYBRY87bZ3Qf1wE4HULfq9Tu/T6FIxLlXtBhCsgMoy7NHbHb4xiQnHXBOCXT8DwpFYaRars5Z7DPOTtG9rJGvoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075779; c=relaxed/simple;
	bh=V4el3Jm4Fy12C3VHx2cyNOhfEJBrFKGaqDS6We+SaY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgyZgiTIjaF0zR7YQi8LNqbXCfRZ1OHgLAazPVcErzuQ7KNTLiy2Hlj1nq35/35/GS0SAqsXfHoPPa99bvzAo2XHj2UwCuCIumUcDGuk7nuyH8Llgh61dUNqzeutZg3quRNmSFw3cKjxZEt5sJqEcNbrAMuvcxBNC3wEnRi2hLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aknOyBqR; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aknOyBqR"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6f230d1easo79355ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789075778; x=1789680578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0S3tNmvBteswAeCEF3ymS+OPQG0/5Nl0T5NGA6mNJQM=;
        b=aknOyBqR03xMvZQQi7t24g1jE1Q0UAEBPbAoy9grFaeJ37CdvSCbq3HiMY2S6bhKuc
         6C8exzJObI/aRgwxruKMfJ4CaN3YdgnuG8swdkuCyA8o2hffPGjhdbOzv5lqvJRNLdvz
         Y/qcqWlWfFcitAM2Gf4+N94oyCaAXXlBqD+wo2YSSl2HFl3hVS4FB33odniqYaVkGUqX
         AwvtSV+YqdQ0HGL/f37TYyN/mrbVLoI/fccaTKClR32UH6tNaW2oEXnpTNVdgNrA8sUP
         SESCHpxD0bXL+9NZarcq1tTEJxoiNohDBsZ63UPmRjoNlH3d2J/n1FbwcmcSt3B5qZLX
         aESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075778; x=1789680578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0S3tNmvBteswAeCEF3ymS+OPQG0/5Nl0T5NGA6mNJQM=;
        b=JOF/4hyB5z1d+KxB6qnXjeZDjdvvbHB1OCyFaQ7BT8sffQ/MHDNxOs0Wnhc/czS9X+
         YqBj+y7CmpeVmU8Ueg8/+bYmjsm0ckEnfaKLPE1Al6SdKcj+uKeYX5nfquldyWEF0BQr
         hQqmJzIFTEYzWQ0V1kueUGhqRmQFiITrXMNtSF3Hhzd13jJLjJ31G5QeulxzGqsqgpab
         E54SvgwJTSv0fu6eqZY3IXWLwWpArQ3tjof6kW3fyWcJ8Gt/JF3E8mIReN77OETVOQXK
         fSYvtNGaLwHdlzem7LICv9/ris8i3msNdhiqjPk0aKMq4AdodwZimb3vPd52ycLMX5+y
         QUXQ==
X-Forwarded-Encrypted: i=1; AKwUvByVdf1V8XsfanWRyjwOKan+1EBMbPpNjtElzOMxouAP3Q/3KlRIm/iqA6O7fZAVpXEntt8X04Ku4nqX7yE=@vger.kernel.org
X-Gm-Message-State: AFuF++nSJXJ3cZY6KmZ+K0C2OlxPbTuGohEOsAYPnk4WKu2SmT8T0Lhf
	tYe783NJH3dHhLYhQta5wrAacODI/ye7D9MRAAIxU2yEbQO6D435Y2fdM/Cap+Gj
X-Gm-Gg: AYBFou0B75IHoW7yBkJ/Fh9DQcZoarjPUDc0wL3joJaPIVYGBEKa9qFodP9gZ3HTCJM
	zCcxs5T/x9AdNGtWXyeD02QEKXplEgIKbTz3aCInTqc2Ac88RdHRMI9PQ/4ExJwuOQRHVb84kIT
	wJpGEIVix8gClcctKsPPblq668b1pqZPLFWLmeM7wSrWXsJa7+7VnQZ6l+YyXZ4yZATZZHVGnz9
	LJ59vvc59xT1KpkPb697oLzSOew/vQPJZEfMvkH0hGf29HTgmXYJdr2w5xChZjeKpsnfhi99Abw
	l1t9u1H79LH96f2SNieCoR2EhOMmRkCRtPdRTEQNbZ70gr2mauhW1SngGEDhLZWmXwWLlu3L1OE
	uoOLq0bQxDsgveECKdZYFjKGqaePH8KXjPbcenk9s2M6eTdIR1EEniunEnaBoa8+omfz2Z4xHP9
	XxutDvS7IvU1hcBbn9MmUI6IC4sFUpU4PkwQCVlgBM7cEb1TDmVb1n1TDchI5Uq+I3PVJeYDyZN
	bc=
X-Received: by 2002:a05:6a20:258c:b0:3d3:ad6e:9ce0 with SMTP id adf61e73a8af0-3daeafd93a4mr1443173637.14.1789075777570;
        Thu, 10 Sep 2026 14:29:37 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:40::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65b1a63sm221241a12.31.2026.09.10.14.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:29:37 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:29:29 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Felix Hoffmann <f3lix.dev@gmx.de>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: devmem: fix TX binding UAF on netdevice
 unregister
Message-ID: <aqMg5ISC_H2dEXwJ@devvm7509.cco0.facebook.com>
References: <20260910143652.166683-1-f3lix.dev@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910143652.166683-1-f3lix.dev@gmx.de>

On 09/10, Felix Hoffmann wrote:
> RX dma-buf bindings are invalidated by their memory provider when a
> netdevice is unregistered. TX bindings have no bound RX queues and no
> equivalent uninstall callback, so their physical and virtual netdevice
> pointers remain live after the devices are freed.
> 
> Closing the owning netlink socket after device removal then makes
> netdev_nl_sock_priv_destroy() dereference the freed physical netdevice to
> hold and lock it. KASAN reports a slab-use-after-free and the kernel can
> panic.
> 
> The binding can also outlive the device used for its dma-buf attachment.
> Since dma_buf_attach() does not hold a reference to that device, deferred
> binding cleanup can pass a freed device to dma_buf_unmap_attachment().
> 
> Invalidate TX bindings that refer to either the physical or virtual
> netdevice during unregister. Keep a reference on the exact DMA device
> until the attachment is unmapped. The netlink socket destructor then uses
> the existing device-gone path, while delayed dma-buf cleanup retains a
> valid DMA device.
> 
> NETDEV_CMD_BIND_TX does not require GENL_ADMIN_PERM. The failure was
> reproduced with the binding owned by UID 65534 across module removal.
> 
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5
> Signed-off-by: Felix Hoffmann <f3lix.dev@gmx.de>
> ---
> The reproducer is available privately on request.

As I mentioned on https://lore.kernel.org/netdev/aqC4XSt7JrrTv4sG@devvm7509.cco0.facebook.com/
I'd like us to have an in-tree selftest for that. 
And Dragos also had a suggestion to use a new helper for checking if
there are any outstanding tx dmabufs attached...
