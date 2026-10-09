Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3044C4ED1BC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564181; cv=pass; b=EYmqO4j9fHaFFwQt8jKx890+bw54lWxF6sxga5U/QG27WcqJVuORubzqOl95gwI8wPer7L6TIman3a3h7OWYdm2s6LLA3J/9V6QE63i1PSsERuOQNmy5uw0uEL78rpCLlDYbjSesxUACAdiu9LIN4W7kjex1fV2b2zG6wBpDt7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564181; c=relaxed/simple;
	bh=8yVafqw/tymMZHiBDDTV1POQxrFPmsVlSQFwXIA6JgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dgghro1UCeq07mECLq73Raj1ejBlgbklh6oBQgFA1gVx3zb5XaVsJ6VOuMByCGeT6Vvgh/Wl/UMN9mnuwpkKLKDwWfebmidy4uA/uMYyNH9dLNx5bggjYS00K+gRPPZnlZJy+vtx4AXq4DbpUSYwxT0JbxoTzlJtkLPXVwyUj+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CYy98r9I; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CYy98r9I"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso12968a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791564178; cv=none;
        d=google.com; s=arc-20260327;
        b=IwJLgS1A1IbJzul+IbJ0uTXJ25F1bMhNEdGfZEE52o++wFnJmPT+vYkxn9ll8JVbZg
         sdgnBTVQg8XKjjwIn9Y2HpxD+N5yUf7r2dJxJVh/omvcIo8ValDoWVF0xk+LLWnNE0dz
         KsvDGmyofAY2YVpLUrFwc7zH+fvG+jbM7+th7Feqd41PUxY5O4x/lX1NDoToXgLCEhlD
         jtGj6Zv2JoFsV7CTlZxDrrixN7m9Ihh/N8172zhbpzl+cdsOBPFpuKHNWC99rbGcuHMH
         s3MofL/4JMoylqRVSvTxLfYAJeSafTeSRvpoUHGNprjm/c52qqU9Eyr85bO6WhIGSR77
         ablQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8yVafqw/tymMZHiBDDTV1POQxrFPmsVlSQFwXIA6JgY=;
        fh=qO4bkfZ2aNxSn/Ink7sBS1AOBt5UUic/4FBe/2NvTuI=;
        b=iTDgEd+h5d+lrwyW7dOesDHHxB33E0bKnwKSNAp59o0wKwBleOZBQcNhQ7+hS5ub4/
         FZhqjxatwGylPRXOAEgGLf/R4bBcaTXw1uBL0EvJl08FuXCql5w7IWogTY+NdmPcyUUr
         mW299u3xqSrphFG65mQ7zi1keTO84TJFSgJXmuMYJyPLUQb9piePXugsaQvGFUcTqM8I
         EJ/a7h+/8RrSZEvbjynC+FFWN1NB3yJLx5+Z3pT5D7FGsUXWMsc/7Sp27FJ8gd1zspPB
         S4OtA3EmZTEO1PK9gzXjvWLt5q7LHvcnl3f/e5MbV0H0xcybe0azJUpEUIF/pkuIfOhI
         HonA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791564178; x=1792168978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8yVafqw/tymMZHiBDDTV1POQxrFPmsVlSQFwXIA6JgY=;
        b=CYy98r9IJfEnurNzNStEF1xcp4Z2bhfU5tIS/5Qkj1YvCO5RwuY3PzCnEkisRbTpsw
         P9qoUg8wkhoUkSi3ugQHHUvIsgiurnNAIueYz/HwXLM4EBd2sthNhi7p9Ro7tFAVIu35
         57WdtKULZkCZDP0ZtlX4p3rGTIgudWfh/VeS423w84ibFdLCRbQgX5s+YzDxD6k4rgSL
         Mj8g68bRZNysAUn8vQNr+qF2WbNAC8PVsvRYm5PoTD/kwXFDd9QPFY5vb17ksWm7z7m8
         DIJH6+bSPKp9YXu6k/J4z7aSQjD70oFJl3fLHjlRUxNvOwqwQiv/neliemiVzJYOO1GI
         +uPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791564178; x=1792168978;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yVafqw/tymMZHiBDDTV1POQxrFPmsVlSQFwXIA6JgY=;
        b=fg3FY//iBpjNZb3kBi29bSdPaJW528hedPPPFsye9oyMrxQt0aGYFcqfMTWoJKtmgX
         iixlAoZp5P56Yc94AekjOsKe7izUUnzRIPrQDgqApgcFi3WchMshlIXPciVgQ6Q8+9Li
         8m8Ae0me7wfkyzRnRvNhvN6RPgrTvXWlvOS7N3X546Hx7nUBBHAVMJRgDn5AaoSIDOLF
         asrRrk6+NXSV8nPwSVcDSJMjLg3gIfb66+kWpLiprSyomazE9Wdrw87clwcUpv3eN1AX
         cNy9zacTDnLC4ulz2wjLutNMvVy6x+YXAbSq0/s6tGNyx1HuizaSjRK1uFhidyGjkKYW
         LQzA==
X-Forwarded-Encrypted: i=1; AKwUvBzbToj+IvTcK1tg/5FDIbrocPC1BjqbO1AyGiby+RANdGFnvcPx3MGc7RkyB+94AoLDhojR3blAkdwNGa0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZSYw2qqTKaqGEbXhRy9FyEYGN1so6Ob2YExnFFcJDJhyN8pV3
	at4tpsYOd2EG6kRJ1QcLioqKeW5A6ua84rVS4yiHZ7kBAhyzFIFSwv5Pykm26dvORpDo9pKvSrJ
	xy2tsRRKqZ52B6DozCnARGRZidECA5MKyCQ+31Vgg
X-Gm-Gg: AYBFou11oChWXZ3bSPj5MZVGGAFj7gQogYlhQbiTH4CbTARPTNC8JlGrSfiwrhP1TOQ
	hR3b2/17yMDesk9hXOJWhDYZ75rnEcWjdhLUUfOAqJq5cd0lf4xBK6aSKBvzVgne2vpLNa+MtAl
	om0n8oUKaDsCVe2k8ioHM480UvwrONyK9R0fI8wadFC7BM75o9p3CNJnltfEEV0u6Xf9mXbfjqm
	l24CxClwFJhaLQYarUYvK2M39VcX7BpBkeqXXkY5ZqtyiGKxhP29rOUZe4kbMzboATbZsf5zAxG
	MfRBDT4dNaQehsWx+iF3HDBpFkhuO1UOhCpj1dwLZsrJOym7kMSORQ==
X-Received: by 2002:a05:6402:c553:20b0:6aa:b72b:d762 with SMTP id
 4fb4d7f45d1cf-6b1776e1bf1mr53790a12.1.1791564177860; Fri, 09 Oct 2026
 09:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008132815.654147-1-tariqt@nvidia.com>
In-Reply-To: <20261008132815.654147-1-tariqt@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 9 Oct 2026 09:42:46 -0700
X-Gm-Features: AclHuK9YIcoqyRx7ZdV1TYGtJevv7ew5G8vshJKEoIcRV7Km280vcnLyswG0lkU
Message-ID: <CAHS8izNSo4YzXxD3C6c2HohdOfH2GK1M=51biuevLUk3vz5k4g@mail.gmail.com>
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

On Thu, Oct 8, 2026 at 6:28=E2=80=AFAM Tariq Toukan <tariqt@nvidia.com> wro=
te:
>
> Hi,
>
> This patch series by Dragos adds data direct support for netdev devices,
> allowing a mlx5 netdev to issue DMA commands through multiple paths.
> This feature is critical for improving performance and reaching line
> rate in certain environments where issuing PCI transactions over one
> path may be significantly faster than over another. These differences
> can arise from various PCI generations in the system or the specific
> system topology.
>
> Data direct for netdev will work with devmem by returning the data
> direct DMA device instead of the DMA device of the NIC. Each PF netdev
> registers its own data direct device and support for RX and TX datapath
> is added. The feature is selected through a new data direct priv flag.
>
> The feature is enabled though a ethtool private flag. When this flag
> is enabled, the driver will return the data direct device in the
> ndo_queue_get_dma_dev op.
>
> During data_direct device unbind, a re-creation of the channels is
> triggered.
>
> A note about the unbind: it does not does not tear down dmabuf bindings
> attached to the data direct device; the recreated channels will still
> pick up the binding via rxq->mp_params and post DMA addresses from the
> data direct IOMMU domain to the PF, causing IOMMU faults. A devmem
> revoke hook is needed to close those bindings before the switch. This is
> out of scope for this series.
>

Elaborate on this please. Are you referring to the fact that on
page_pool_scrub we unmap the netmems dma-mapped by the page-pool, but
we don't unmap the netmems dma-mapped by the memory provider?

What's the impact of leaving this unfixed? Is the machine going to
crash if the device goes away but we don't unmap the dmabuf?
--=20
Thanks,
Mina
