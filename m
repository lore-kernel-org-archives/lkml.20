Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837286;
	b=fjWYqgqFQsJhI+vzOJWI1O/S7J5eqjns2/x0LFJF0KEv8V74SE5VZoBHGdmpZwtfqbNZ
	 tSKI0fj3YXfWp5v6/eTp2oBsvvbaiYxPgePzHKaHh/CBWnACU9DUz0JMZz3t+Z6ay9BAZ
	 9Zz6XbsnKhWuo/0xWUYtwykFXQw22f+mHQeNIeYn+nBzEzA2Vp5qkKM2J8O1UZD8WqM3i
	 Lc+kS8iqvxAwth9yjoUXKRp/OD8IS5ka2PQGgWFEPN6SlPgMxWvIL6bqxXfFcOKVTpIIe
	 ZSTxgq3mDeWs4mrnH97Oibk3I553qvGb7QCxWqODd0D23t4m7R3xP9A7wbdYmgaJo9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837286;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0ymcIH4/zeaoSFfHc+RTS5YHw90qatTHdiwsb0U8zEM=;
	b=kLSezkbA0PqfNqhUm8cY709GruhZAYRqBHPI5uROWG5ciBoZBayCwqYHoFscFmYqMYJ6
	 mbt0x8EKQXnPG9Nh6wvbjIfOdxL1b4Vs6XY2jxvo9F8SYefjrLVPdp7sDd/Kwkt6X8MFy
	 bGbRgKr/Jq5TanHPVR82zYgEobZayDeBARfW7j/jwrERhkgpPsaY2mw+GMPjiQ1oHIkxY
	 +pSRRVZAha1vUvUaMIHAyO+DtiKnE7H084Qw/ju6qJvRqqisC29fwzbmT0nlxuQEqcix/
	 +GGPXVZufWCwXoOtYJQ4PiFgiqSF/XK0wJ9C8PIlgLOos9D3QH+Gmd03QtUZnVaQzvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHUG3ZvB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1C606A335;
	Mon, 16 Nov 2026 13:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHUG3ZvB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A414F1F000C7;
	Mon, 16 Nov 2026 13:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837286;
	bh=0ymcIH4/zeaoSFfHc+RTS5YHw90qatTHdiwsb0U8zEM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QHUG3ZvBIrERejZfaQGJXaoty2jY0Ifn8nvHPJVzHsG/6RqqsQfNWImz/YuwD0mRy
	 0vuDOTFGTkHfA3dwJhQSvcj27XJVGwEi09oXONYu12WgkhZAUf7tPrABa8relrXgvn
	 T6iqpAj5klZjW889QN7bK/wbAm/nY/x44vjHhUp11r492t9/U1lQbI/NWDVJ+OARsm
	 bpRkiyqVTZChrtP8bICJqEuPDk5YfsLENE1mN7gsfT2hA4gZjn/+NQo1w7wv5rpX94
	 m2VuFu8FeP9n6fzFzkyW9LK66R+WGct5J+dsrV6v2zV/wGokrczNNGSEMzaArgjqiu
	 jSW81ha783W0Q==
Subject: Re: [PATCH v34 net-next 5/8] net/nebula-matrix: dispatch: add
 control-level routing core infrastructure
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 13:54:45 +0000
Message-ID: <179483728519.3136.7292669814858371820@kernel.org>
In-Reply-To: <20261112094925.6098-6-illusion.wang@nebula-matrix.com>
References: <20261112094925.6098-6-illusion.wang@nebula-matrix.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The -EOPNOTSUPP fallback in nbl_disp_init_module() can never run,
  and the kernel-doc describes it as if it could.

--

net/nebula-matrix: dispatch: add control-level routing core infrastructure

This patch adds the dispatch layer. It allocates the dispatch management
state and the ops table, and it wires the init_module and deinit_module
wrappers to the resource ops. It also adds a ctrl_lvl bitmap, with only
the MGT level defined, which is set only on the control PF.

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c
> new file mode 100644
> index 0000000000000..966fee2dec8b0
> --- /dev/null
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c
> @@ -0,0 +1,117 @@

[ ... ]

> +static void nbl_disp_deinit_module(struct nbl_dispatch_mgt *disp_mgt)
> +{
> +	struct nbl_resource_ops *res_ops = disp_mgt->res_ops_tbl->ops;
> +	struct nbl_resource_mgt *p = disp_mgt->res_ops_tbl->priv;
> +
> +	if (res_ops->deinit_module)
> +		res_ops->deinit_module(p);
> +}
> +
> +static int nbl_disp_init_module(struct nbl_dispatch_mgt *disp_mgt)
> +{
> +	struct nbl_resource_ops *res_ops = disp_mgt->res_ops_tbl->ops;
> +	struct nbl_resource_mgt *p = disp_mgt->res_ops_tbl->priv;
> +
> +	if (res_ops->init_module)
> +		return res_ops->init_module(p);
> +	return -EOPNOTSUPP;
> +}

[Severity: Low]
This isn't a bug, but can the -EOPNOTSUPP fallback in
nbl_disp_init_module() ever run? The same question applies to the NULL
check in nbl_disp_deinit_module().

nbl_res_setup_ops() in nbl_resource_leonis.c will not publish the
resource ops table if either op is missing:

nbl_res_setup_ops() {
    ...
	if (!res_ops.get_vsi_id || !res_ops.get_eth_id ||
	    !res_ops.cfg_msix_map || !res_ops.destroy_msix_map ||
	    !res_ops.set_mailbox_irq || !res_ops.init_module ||
	    !res_ops.deinit_module)
		return ERR_PTR(-EINVAL);
    ...
}

nbl_core_init() calls nbl_res_init_leonis() before nbl_disp_init(), so a
missing op fails probe before the dispatch wrappers are installed. The
static res_ops table also always sets nbl_res_chip_init_module and
nbl_res_chip_deinit_module.

Could these NULL branches be dropped? The kernel-doc below would then
need updating too.

[ ... ]

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_dispatch.h b/drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_dispatch.h
> new file mode 100644
> index 0000000000000..f52d8bd57cd2b
> --- /dev/null
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_dispatch.h
> @@ -0,0 +1,54 @@

[ ... ]

> +/**
> + * struct nbl_dispatch_ops - dispatch control plane operation callbacks
> + * @init_module: chip-wide datapath init, forwarded to the resource layer
> + *               (res_ops->init_module() and then hw_ops->init_module());
> + *               on leonis it programs the chip-wide datapath registers and
> + *               sets driver_status=true.  Returns -EOPNOTSUPP if the
> + *               resource layer installs no init_module op.  Control-PF

This sentence documents an error return that no caller can get. It also
suggests the resource op is optional, while nbl_res_setup_ops() requires
it. This text is still unchanged at the end of the series.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112094925.6098-1-illusion.wang%40nebula-matrix.com
