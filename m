Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A364F36A341
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791399085; cv=none; b=Mwrv0w5bfpEgV7eKjAOC8RS98YmHv4QYlS+ScfbbBivXAOiWAuaSlW0X1dsppWuTLRXpCP1mQHGfGmlMIsEJhAFWnRNTOKLB9HyehxXk8n2gdUPVka2mFXiW++NLGr9D/GpWZcovYb5ywn+EJEmVLRFFxgoXE2YfT17BWN3rPfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791399085; c=relaxed/simple;
	bh=ooFE7wgNH86QzW50A74Hxs0eR/QZYfgdmjGkzqzYeSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fh5Bq63mjt328D+5bjgpAcEFlYe7BKvoERmYvfTCYLOAE8D0VyNLOYwy4OoRJqn+dOmlNj+q0SF9lwlxq2nfZ+39Hwt1pqpI+RxQtMjtANo2l4eXv2EhlC2wYmv+ewqgqyRUYPc1CAMkeOgOOYlzYitXT0Cz4Q/oUrNWMSN0sJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYU9wJxU; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYU9wJxU"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1544661a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791399084; x=1792003884; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X71f5KGOL/rbhedaUKsgXlp/Wmx4B13NNF0vqiORCgc=;
        b=UYU9wJxUW8RQY34jHuYGL+FPkvRW3Y1QTJlT6kUlCrIKZ33cSWo37k3aZJPIEtPbcS
         iw31KIb2d+7FQI6Q+ZziZA55y7RM/YrMwHbRxH8BqMBoyUcShZ4ZfkMWHVbQ+XZpRnO7
         M/0YLM/npZ2WdSIoKh+PS2kUsACPPJ2gqrCKu2b9ItB+d5Z9UiM2tk/t5feiZX86VWDJ
         /29KL+C4+nsdKLD4pRCtndiKyMRN0640JoEA2+ShJ992wRIaEvV5kw2v2J/Vh2uDfxq5
         REn95bUX+yA8WeYzTuZseAyGP+ynjCnUpz61kzeLC+LQ2odxjZQXnB/6ug7iF0uI0VUG
         j1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791399084; x=1792003884;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X71f5KGOL/rbhedaUKsgXlp/Wmx4B13NNF0vqiORCgc=;
        b=HOMCJrSaDNjNg11nfYzSQt4J29YMvQvspe4cPEXIrk/tYftKlolS26ggf2lZbz0JB5
         qWA2fZBkcuh6OLmBge18/KJdORwRk5xQF0jxQjOGgQF1lPesUue+7PxkaoKY10EjZN2B
         xvNyc/zOJOgwcGdKLg2IfN6bLB/ztkwKFU7Pdi4dwN6BTzeLmMrbAH2z7Avxk4PXWmBJ
         9p/mnltbkfy1M4Mnrn5+uWXRMqB+4jziCxHFTut8jXANTPXxYaqq10xJhSmG990fn8fp
         UO6E2kCUn3eQgH1vMwGUV740VVxPRc9JFYGfbxQaalcMkN+VI3/YCs6oJ61wYRKYJpSZ
         DOvA==
X-Forwarded-Encrypted: i=1; AKwUvBxgZW/X4mnG9GiZHaTyJYt+nnQyz7p6kMlk/Vaa+8Uwrqth0j+xvhNtknUiF4Rg9VPza2lgyAuB1lKsHSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGIEgb0KbWwcY9LfqUVWy9YOpUIosqE+BqLc2R4rGV0yFpW27+
	MTnOV8ijRmljHSMs+w3Qv2H0jTnMF4SCc6pqX3xwv2pWj43lxkCEBlYi
X-Gm-Gg: AYBFou24rWk0KIbh2VKNXQ5kU1b9YTgNL3lPlmct6y5+3lIjEydB9cnhHcWPV0f2i+D
	Xqu/qwVN0wOxviMsqZLfb1Cmt7bwqe3OlthOsdMCiXB+u1+bokbI/bw8ARDKogYJ2RPJbJWpCTi
	jV7p9L0j2ubyc+FV5b3oFB6oaaqAbJ7YcV0hRcQvjXP6GQtbYkpcE2w1R5Dkj2DuC0gaSy0tqId
	vlv2dUNPkfz6DAUrxnEf2UNSTUwaUftoOheVVeVBEn61xdx48MXM29SbZBegnPyPwKoj0w3pwjD
	h9vAiJuGCoHucGohk7nfqgT0JMVntMwIs0hc8CZIvqsTodCPoIP4xfA2hGTNyXdL6FBLfWXRbHn
	GlaW+PEGNmeZ0nZ5CJFOyQ9zK9RliGwfZMlx7/mBKWcJp9mwNHHVGiLZuMyMDSn+l6Y3l2FwQ35
	0z+1yKm9N5V/+ZNR7Mo5eMnVkJnrGcdaukXhdNX2vgdxn134lB1g+e7rWQYxy/4PiZ
X-Received: by 2002:a17:90b:1812:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3a8a072a80dmr2823533a91.15.1791399083918;
        Wed, 07 Oct 2026 11:51:23 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a23c82sm754330a91.1.2026.10.07.11.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:51:23 -0700 (PDT)
Date: Wed, 7 Oct 2026 11:51:19 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>
Subject: Re: [PATCH net v2] xsk: freeze deferred pool teardown without
 blocking unregister
Message-ID: <asaTvPO05EpmUEgN@devvm7509.cco0.facebook.com>
References: <20261005-xsk-suspend-teardown-v2-1-2d87228f4329@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261005-xsk-suspend-teardown-v2-1-2d87228f4329@gmail.com>

On 10/05, James Hilliard wrote:
> Deferred pool destruction calls ndo_bpf() under RTNL. system_wq is
> not frozen during system sleep, so that callback can run after a
> device has suspended and gated its clocks. Use system_freezable_wq
> so running destruction finishes before device suspend and new work
> waits until process thaw.
> 
> Keep assigned pools visible to NETDEV_UNREGISTER independently of
> the socket list. A released socket has already left that list, but
> its final pool put can queue destruction after workqueues freeze.
> A resume-time unregister would then wait for a device reference
> whose release cannot run until the resume completes.
> 
> Track assigned pools per netdev under RTNL and detach remaining pools
> after the notifier socket walk, including copy-mode pools. This also
> covers leased queues without scanning pools from unrelated devices or
> network namespaces. Remove the entry on assignment failure and normal
> teardown. The deferred worker still owns the pool and later observes
> the cleared device pointer, avoiding a second driver detach or put.
> 
> The lifetime problem was identified by code inspection of the deferred
> release and system-sleep paths.
> 
> Fixes: 1c1efc2af158 ("xsk: Create and free buffer pool independently from umem")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes in v2:
> - Track assigned pools per netdev instead of scanning a global pool list.
> - Keep deferred releases visible across queue changes and queue leases.
> - Rebase onto current net.
> - Link to v1: https://patch.msgid.link/20260930-xsk-suspend-teardown-v1-1-a6cac8c030be@gmail.com
> 
> To: "David S. Miller" <davem@davemloft.net>
> To: Eric Dumazet <edumazet@kernel.org>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Simon Horman <horms@kernel.org>
> To: Andrew Lunn <andrew+netdev@lunn.ch>
> To: Magnus Karlsson <magnus.karlsson@intel.com>
> To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
> To: Stanislav Fomichev <sdf@fomichev.me>
> To: Alexei Starovoitov <ast@kernel.org>
> To: Daniel Borkmann <daniel@iogearbox.net>
> To: Jesper Dangaard Brouer <hawk@kernel.org>
> To: John Fastabend <john.fastabend@gmail.com>
> To: Björn Töpel <bjorn@kernel.org>
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: bpf@vger.kernel.org
> ---
>  include/linux/netdevice.h   |  5 +++++
>  include/net/xsk_buff_pool.h |  3 +++
>  net/xdp/xsk.c               |  5 +++++
>  net/xdp/xsk_buff_pool.c     | 25 ++++++++++++++++++++++++-
>  4 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index 3cff2174dc03..72091938f6e6 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -2545,6 +2545,11 @@ struct net_device {
>  	/* protected by rtnl_lock */
>  	struct bpf_xdp_entity	xdp_state[__MAX_XDP_MODE];
>  
> +#ifdef CONFIG_XDP_SOCKETS
> +	/** @xsk_pools: assigned AF_XDP pools, protected by rtnl_lock */


Can we mark this as being ops protected (net_device::lock) ?
xp_clear_dev calls netdev_lock_ops, but xp_assign_dev
has netdev_assert_locked_ops_compat, so maybe there needs to be a bit more
care. We don't want to add new ASSERT_RTNL if possible (and extend new
netdev lock semantics).

The rest looks good.
