Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253985;
	b=JBGzr0Qx7ajdaS9JZNxaFGWVkNuGjoGUtZGjmz/tmVFuaUwrbVCmQD6iTbaeyJGKvpKa
	 /J6uABfOOLhExD+MhgRl5wu/DhlWQRRcmnUptcJ0kyLNZs5e5qBpn2rfjYY+O8gC81++p
	 3VeXkqOxoQXdNUWfq5PFsw0aYuOJ01zibTddTTS7lkNcA7kbL72Ry/6mTPsKBv21TbYPT
	 P971stU5Cyjpd+mefQsyiZsBg6Nd5Yav4rPMkPLb+nFEwOAgNg0WjxEXtRPkdn3t1uMSJ
	 zc2op349w0wRYIC3GUWQ7u9viL1XMgVowF+tKBO4LNOdTKuXL9xXbjPViFIKnaoH3ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FMtzZSTePsqyAZZxCGo8MwfwBr67cppzq+ZS1S4y9wI=;
	b=MaLA/O2uJuKczb0aKGCiY2U7sVgJwJ6tu4NGorB7OphPC/qCznRI8wd6C4CZS90D47y5
	 wEYWp45zRNavwOUCcrAETB/ynM23agWYI1Not+lCg21ODPVlZF9wciWTR/0wQHGMa7cST
	 M7/Ob6lFM5OoK5uyzt1GZeHBWD0kYyUfgMLMll8q6MxlrqNx+losYWIrtoBMwc3enE6VD
	 LuvsSRBuEC86qCW3FeYKpz3X92Pf7z6TBLjit4hzePHiqRRz5uQ+5BnO/Cv+g3WuaWxcQ
	 /l1dIu8QUTfJUzgoE8icJg4w5TClV+UtxoyJVX67UkiLGLSual/evE0+UiiBBbDM5KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNCWuayX;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A777606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A777606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNCWuayX
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so582179eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253983; x=1794858783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FMtzZSTePsqyAZZxCGo8MwfwBr67cppzq+ZS1S4y9wI=;
        b=PNCWuayXaw6cdsnihksxBFStS1vdDbWuT5N2TsQ7QXhUAMyQtRbJLKqVNoaOEG1Vs8
         QoXGYdLae7VvZIScE77VdhcODq5NFWR1ZA0LkVPG1k8npy6YIHYEyQGUTP3MwnYbZ67P
         SgvwBWSrWuh2CsR3GK6Ez9wvx22SokHJMaVrDKnWoMPan36LxuxrrtWX2G0mCD8BmmPS
         XXpcbQAudBOVxiB82PHK9SxAV9eypHgAC+4YBGaCP/JiJyZZ6hwlZU4f/XZr5Ms1+HLR
         StnrhupHc2YUYWtj5ZEuU8xIe0LunAUh7CTt4rhkHvORHsC7hxyT/NVmsZC9tM7rA8qg
         eOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253983; x=1794858783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMtzZSTePsqyAZZxCGo8MwfwBr67cppzq+ZS1S4y9wI=;
        b=q359sn4242gUKXR7bIy0smqzn/S+RDwfa4eR2X/mFtKtRNZH9MHE0a/OW4UC8U41Yf
         kG363Yo9gXV6p4afEa4vLFmum4fWUXS4pE/cjcfGKuaPUiEP/msL2h5QBhiul/dElDis
         W2P9MIwL4VkMYdKcqyA3YciVW+RoMbaMe2MRcSW3Ktzy1aJWZXm8uM2fdFsI98j4tu3c
         yL3fKHTS3KRiSV9ZWY8pa3Z+knfXXZ2VwqY0Vu0xyTbjTyk70YdEMl1XSNWYz/LWZXkW
         0thQsRcXNrL3rCQD5ufHGturMnP67+Gl25A3iPhmYI8YCXOefaMP1vzfFGdg+aACKbU/
         4/5A==
X-Forwarded-Encrypted: i=1; AL+hErEuojlf6mnUz37RHyZfFtjzw8W4qCCXbMLfMNYUUPglD+L0fM9n/qghfMTLwHVTECrUUrub5ZATIN1fwCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ejbdvdXeFVrfxmYqm1Oa5FgYUnQ+PXhSX5/FgxHzhJn0zjdtX
	x/64AG8i+0F2B77HR5rOzCsyDCSeja7Zg0a9betPyzSpGJUr9tGBytW5
X-Gm-Gg: AYBFou2iAaq829ElVK338E50B6Aujtd5pUWgVVQndrgbLs/3P3Y3QEN5lMrze6w+HZ5
	B6WwMK5WDMx5ytlmRO4I/Ipz/a0WHQL3r6PSjo7aomHBvEFbZFIRr0ynFBN8cEdRSl+XZMUWVnB
	SJelO/3MGpDV8iZ/X5MnwVf/BL03mbkI2cXRBbb+K1BgIkqUr+X93qekX0jt1X/+xmFDK7KTC4N
	K2MNflvMPPBYCDjgcL4ow19p9Kh92yw95SxN8R1+g0pj9RRh0+J8BW62ZTX/8dclRmcSFUA6k0e
	ruPOkMKXEean7dggKppQAvrKyoweMMbj0miCVBkjoKyPNZVSwGoBpBHNNDAmZyCTTPYj4EtLSmU
	mbi7gnYaqxLyVMhOHeSKlzBVAMuzLSXoITXJkryJn4R5fVVwZ9Ry0f/EAP3WDIpVbBhYPvbGmwL
	RIAlzujEAmVFUZn+l4JfWe4RL8u/662ypBGweNCprBeeVs8FNvsS+wZrv/69Dd7IjmE8LM3HDGm
	4WjD/gSA5KlXU0jbRkOwJGq+6LFT6zgnGreBSfKpB6P8EKp0MlAYNJPKlFCYdwKHe5LOd3NI5Oj
	eZeAoMwhp+jHBZYDVdRDPg==
X-Received: by 2002:a05:7300:a8d:b0:36a:75aa:33bc with SMTP id 5a478bee46e88-3751f56033dmr328827eec.24.1794253983392;
        Mon, 09 Nov 2026 11:53:03 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:66::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm839952eec.18.2026.11.09.11.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:53:02 -0800 (PST)
Date: Mon, 9 Nov 2026 11:50:48 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	David Wei <dw@davidwei.uk>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Subject: Re: [PATCH net-next v2 3/6] net: guard memory provider RX queue open
 and close on unregister
Message-ID: <avIbO71p_947-PIf@devvm16445.scu0.facebook.com>
References: <20261108055809.2122934-1-almasrymina@google.com>
 <20261108055809.2122934-4-almasrymina@google.com>
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
In-Reply-To: <20261108055809.2122934-4-almasrymina@google.com>

On 11/08, Mina Almasry wrote:
> When a memory provider RX queue is leased to a virtual netdev,
> netif_mp_open_rxq() and netif_mp_close_rxq() redirect through
> rxq->lease and lock the physical backing netdev directly rather than via
> netdev_get_by_index_lock(). This raises two issues during netdev
> unregistration:
> 
> 1. In __netif_mp_open_rxq(), the physical backing netdev may already be
>    in NETREG_UNREGISTERING (after dev_shutdown() and
>    dev_memory_provider_uninstall() have run on it, before cascaded
>    unregistration of the virtual leasee tears down the lease). Reject
>    opening an RX queue if dev->reg_state != NETREG_REGISTERED.
> 2. In __netif_mp_close_rxq(), when the physical backing netdev
>    unregisters before the virtual leasee, dev_memory_provider_uninstall()
>    on the physical netdev does not uninstall the virtual queues, so
>    phys_rxq->mp_params remains populated until the virtual leasee's
>    netif_rxq_cleanup_unlease() or socket teardown runs. At that point
>    the physical netdev has already gone through dev_shutdown() and must
>    not call netdev_rx_queue_reconfig(). When dev->reg_state >
>    NETREG_REGISTERED, clear rxq->mp_params and return 0.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  net/core/netdev_rx_queue.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
> index a7261fedd5e76..85ae5abf16b8e 100644
> --- a/net/core/netdev_rx_queue.c
> +++ b/net/core/netdev_rx_queue.c
> @@ -193,6 +193,14 @@ static int __netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
>  	struct netdev_rx_queue *rxq;
>  	int ret;
>  
> +	/* A leased physical dev is locked via rxq->lease rather than
> +	 * netdev_get_by_index_lock(), so check reg_state under its lock.
> +	 */
> +	if (dev->reg_state != NETREG_REGISTERED) {
> +		NL_SET_ERR_MSG(extack, "Device is being unregistered");
> +		return -ENODEV;
> +	}

nit: wonder if we should keep lease vs non-lease handling in the callers?
netif_mp_open_rxq/netif_mp_close_rxq already handle this, and __ variants
seem to be unaware of the leasing abstractions.

Maybe put them into some new lease-valid helper? So we can keep these
tricky details in a single place, similar to netdev_put_lock?

  netif_lease_valid() { return netif_is_alive && netif_device_present } ?
