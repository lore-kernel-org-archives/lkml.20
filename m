Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF14F3CF698
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791590070; cv=pass; b=YherogrEaXxu0DdW+t38rrNTKrvhENILP8V3OHD9ouxejxMklspxItU6MYTSGPqXDE024OFGY7dgi4wi+aVdpyKIfV0OYp9X2vic3q4GUZMHfP6BI3LZGNCl6wZ3bfi3U7AuoxBTkN5Okui1KX5mnt8I1ntgDyvUIavZaGCRUvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791590070; c=relaxed/simple;
	bh=6BbAOFR5ozv9YI2gjZqVkZoLPCjlp6tmsusKEhB3G6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0s9hFmDDEb+ZZlzrWliXSvRhl2M+QTpdMxNuiOhITnFSI4qTj0C9oKJzLu/5h+GU9/6Y8H0QkM29nmkyNHQd6l54QfCOW1eBJH3Cg6/WKnQeF5LGtAb9B4/14P6EIP0D2+tPmrJoQ8xZPbgHYX56+ijyHObi4XGB331r7Io+Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qXmx/vWV; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qXmx/vWV"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso1290a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791590067; cv=none;
        d=google.com; s=arc-20260327;
        b=ZtM5WhTpo8JifWEBWhhfK2m3TEKvCxlVD8p3T+1S3Fw65RJN2Bws3W2bKzSJasgnRo
         2Pyys5ikBTsEl0UUxsnHok/iRsap5ltqUX1I39xhnozC5/cwFTmbAtPyl+dXMdIL7tQ8
         9+huwiQBNKmUUYJfB/BYWPvSkwcTy/nI0XZSsuMUcIMFMRbK3gt0qjpPcssWXacjLGqL
         ZAMgOKO5bf7SgX9y8kzMej4b8btCyqr3EI5q95dDoTb6SVSVx8lkn3+juXQP4gNNQSyb
         nH6TbjnxcBRBvlYbVFKcDdYl7bfUUu9RVcbuSeDhQPSyGg1/yAukLPKx1rkhhy8DOQMN
         20GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6BbAOFR5ozv9YI2gjZqVkZoLPCjlp6tmsusKEhB3G6Y=;
        fh=nVv1W8ATDBKUJEJnY6h0uOrsavhbhZxppDUYaUnf05s=;
        b=KLh5jJNgRJ41ArFwgwFyMoTHnxUkhqNw8eHtKih3gp+6vEI3KZXSTr5V5i5k/x3nmA
         CR6h+ox6Avwm5ZrCgnndlRduzLo7ESIxzlM53qCN14lRSsZjkqNnPs7DyT1SSg1CGMrv
         9Wgf7Udz1E4GIe9vYessis4trvoAAVcr2UXhngm+fMmBsn9P0ItJQye7cdlnfPYedIVz
         SWXrwGA5HqOBUivEgjE+FAz3Pa7NxXPDXLtDFpU5LTSybbS50DiXw+25wsSwS2+/c/Jl
         Jaa8TBft8lK0NW4fTa0gYnxD68Xp94PZZtVWyw92XQbyNpLUYxH1H/q0u1Ub31RWSFQi
         9CtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791590067; x=1792194867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6BbAOFR5ozv9YI2gjZqVkZoLPCjlp6tmsusKEhB3G6Y=;
        b=qXmx/vWV0JJ5vLM3ox63kUAd6fadJkJAAwe2nPT3Rf5U0A4Q4Jw4YeABgEL5+euiOd
         dZs6rFvAd1+S4vPSdl28nKc+wMCqCvaImodHgr636n7a3UuA33QuqdcldgvGp2wCWbIf
         zBB8MviyksypDmJV1C+6V76SBNby1CcBvTY47GPFJb6jSkEGm0iTcCyB7JKaR/u3W0e1
         S+39FEuvIImesddZZPBVOjLGub96lPi5LDNYRxYHFnytz5woC81bc5P1QeJY7gsHR/ts
         orDd7Vh/eE7SIxPzqpvy4YU7xGpvqBIUJWFQFlL80SqDsmqYULnVZsPVPCm3X5EUrg6M
         FYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791590067; x=1792194867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6BbAOFR5ozv9YI2gjZqVkZoLPCjlp6tmsusKEhB3G6Y=;
        b=x/0LdU52YfL0l9rKsmfUWkfBNGLdryvAT8l3vheplaE4L6Me0081NNk/isLsBlIO07
         UhhxMO/FD9JSWDCCWVGnexVcDt+YFvDS+S5BY46EK8/NJKjSq6vbH6/KxEIFukYbP4QK
         MD72Idbcw7blpVgkxF1xy9tyUIB8BvNKla5wj8yokSE2frxgXTK7ga9ZxAp6EAudlAyJ
         bWqPzT/Gp12Vno/+NL80SNy3/RfCv7Q+zaN7ADyu9mDJKWikGz7HP1WNhpvDwmxBeEXQ
         h1gHdM477vLOx79ya8Z4tkhb56ICelcRqjdfObDNiQhNSJTsGEV2r3jULB2hcjnsXVCu
         r06g==
X-Forwarded-Encrypted: i=1; AKwUvBxFU7YwUB6uFKI1N19bSb8KvibmkoUI7XPpQWLv15+Wcp99OGEyJ8fIcBMtJLhc6lmLBpLfJGtBYvypXuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG7eESB+RGdcECKNP5UNaSEX2Ru6XIIhIGcEaxjtHr/dJT2xrt
	9i/4AIZ9n31Kr/mUiOnVoicUGCochy6HZsLV5iHAdg2Jjk7RoBWvl+VO3YlcZJ5TeaFDBM+lLw5
	YHVtGBQoZDTcXT9mkDLjZJ2HlgiADOWHwD8vV39GW
X-Gm-Gg: AYBFou2HRfnyRKMcMbA/V6/qaxoJg8O4np38eusZdA0ib4vEcmpKRXXKa5/HjIGdB4a
	lceXb/FCxW5oU7tByAO2jnBv5qi+9g6EtP61Tslcfl2C/Zbve91Zx+8II1nBtJ54lM8G/4LNQJS
	7oHV+yuYDnp7gg0lOLEY02DEOHj8CnIoSfw3joTepMhGblo3zubNwNGJUU1AIv51+g9h/SYxCmh
	8qDuEPUGEvxRkmnpnmMV0ZGBYUzD22v5LT+dQ3R/C3M8JoaHX/mfjemrvLGrA7U7NEE7WyU7T1/
	RCqEdMZtih20O0w5Rx/SU+Pt47pgK5rOV8ArJXhrx7t9WHvxrHW1n/yStdzaBwrH
X-Received: by 2002:a05:6402:1492:b0:6af:afce:184f with SMTP id
 4fb4d7f45d1cf-6b1988f1271mr5875a12.3.1791590066657; Fri, 09 Oct 2026 16:54:26
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008132815.654147-1-tariqt@nvidia.com> <CAHS8izNSo4YzXxD3C6c2HohdOfH2GK1M=51biuevLUk3vz5k4g@mail.gmail.com>
In-Reply-To: <CAHS8izNSo4YzXxD3C6c2HohdOfH2GK1M=51biuevLUk3vz5k4g@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 9 Oct 2026 16:54:15 -0700
X-Gm-Features: AclHuK_ZzbZd-uX5EqoDdsPJuuPhovZF16107otVMYSWFJ0lAZEAV_UPEgtn00I
Message-ID: <CAHS8izMKNeEmJM0wOgtoz9_3WRLUOqP0PEDMn5SZ+hXTKTwSyw@mail.gmail.com>
Subject: Re: [PATCH net-next 00/10] net/mlx5e: Add netdev support for data direct
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Byungchul Park <byungchul@sk.com>, Carolina Jubran <cjubran@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Gal Pressman <gal@nvidia.com>, 
	Jacob Keller <Jacob.e.keller@intel.com>, Kees Cook <kees@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>, 
	Matt Fleming <mfleming@cloudflare.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shivaji Kant <shivajikant@google.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, William Tu <witu@nvidia.com>, 
	Yue Haibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 9:42=E2=80=AFAM Mina Almasry <almasrymina@google.com=
> wrote:
>
> On Thu, Oct 8, 2026 at 6:28=E2=80=AFAM Tariq Toukan <tariqt@nvidia.com> w=
rote:
> >
> > Hi,
> >
> > This patch series by Dragos adds data direct support for netdev devices=
,
> > allowing a mlx5 netdev to issue DMA commands through multiple paths.
> > This feature is critical for improving performance and reaching line
> > rate in certain environments where issuing PCI transactions over one
> > path may be significantly faster than over another. These differences
> > can arise from various PCI generations in the system or the specific
> > system topology.
> >
> > Data direct for netdev will work with devmem by returning the data
> > direct DMA device instead of the DMA device of the NIC. Each PF netdev
> > registers its own data direct device and support for RX and TX datapath
> > is added. The feature is selected through a new data direct priv flag.
> >
> > The feature is enabled though a ethtool private flag. When this flag
> > is enabled, the driver will return the data direct device in the
> > ndo_queue_get_dma_dev op.
> >
> > During data_direct device unbind, a re-creation of the channels is
> > triggered.
> >
> > A note about the unbind: it does not does not tear down dmabuf bindings
> > attached to the data direct device; the recreated channels will still
> > pick up the binding via rxq->mp_params and post DMA addresses from the
> > data direct IOMMU domain to the PF, causing IOMMU faults. A devmem
> > revoke hook is needed to close those bindings before the switch. This i=
s
> > out of scope for this series.
> >
>
> Elaborate on this please. Are you referring to the fact that on
> page_pool_scrub we unmap the netmems dma-mapped by the page-pool, but
> we don't unmap the netmems dma-mapped by the memory provider?
>
> What's the impact of leaving this unfixed? Is the machine going to
> crash if the device goes away but we don't unmap the dmabuf?

Oh, you're referring to an even different bug than the one I had in
mind. (I'll see if I can submit a fix for the bug I had in mind).

But in general I think not addressing the issue you're referring to is
way too messy. I think we do indeed need to unbind the dma-buf if the
dma-dev is going away. The invariant should be that the
binding->attachment->dev should not change at all during the entire
lifetime of the binding. We already 'revoke' the dma-buf binding if
the netdev is going away, sorta (there is a bug there I need to fix.
The uninstall function in the provider doesn't actually unmap the
dma-buf :sad face:).

I've worked with my LLM to suggest some changes that (we think) make
this work, but you may disagree. I'll post the suggestions. But please
I think this should be handled one way or another.

--=20
Thanks,
Mina
