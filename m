Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792442243;
	b=FZzCskwEWxjzLNr4t0UbB6jzK1dmXsVNIxLUp7lodSNiEkPJ30CC+x6nu8SGz1X1h9ot
	 OGNFhEUNdtI0CFvLR8DxAHjxQfZS4YrVY9lWh4hZX20+M2Jq8/O2Sx2FqsQA8FOTgOVDL
	 aZVqqjB/xiq/joFqrlq06p1P3oPhdX2LY8sRSC1g+JRGrqQPQyL4Z427CzUmceUFvosaR
	 ImedCRdbbCh54xPu7v2cV+tVNwaflYNbgrYFIpU4545rzKBkdOJ+NNjKRC7rp8mE0rVLO
	 5FgZxrIgWarsLXdNm/tX8ktNgZ/xDDXpRoPjRvuVeFnXxM/uyXdUdol1d1pYfgQFKFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OlQWf86SXokSuh4SBBMFiqlQD7tg29+MR0deKhyYBLU=;
	b=PX6wmx5vxWWgv3WuMm0jpDblIlur33kCj9aY00NZJREgguaxG/qIsYe5xo7Yc0awye4f
	 kpfGtmHklU5do4nC1E2/EokeB+0QNbuZPhe8KIujx4lzsrO8qpWjZfyrVe5+Fm7687D1A
	 JhHeVeFkTinmgmysI0aChhGgDyyxs+KYs9WsON4Zk+uXWd/rjzVwVzPfsNmrafgDMnvia
	 XORFd/4Uv3AnEvlzxCNoVeo3AJn50z+hoeNXosdSnyvVAa6ERsTB8iCBzyhLQL2PsjmKE
	 lfFs+jOZX8smi/q7XimeimIQYraT+PhLgEs4psqJTVYwpuKjRGzxM6UF2OWk0S4jzSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TbdVKbnQ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F685606A324
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F685606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TbdVKbnQ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso28676475e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792442241; x=1793047041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OlQWf86SXokSuh4SBBMFiqlQD7tg29+MR0deKhyYBLU=;
        b=TbdVKbnQRRp9vEsLOXaAXOe8RCtxTDKUbwKg9QY2mqDPSPar/3P4WhNaodDxDY+BkL
         z5fhNg+9YEHPJPYwu73YuJ24D3oaA7K6HDZKf5aH+c1Pe/B7GdlWJdKoI7eTwRUs+eNR
         XWTT2Bvx1AyIFnoplHVTcghLleDAmLt5NYnTajZ7eY321BIDTd3dT989KlGwDKD9NDGP
         cr4C9uSJVWcYwgvwncn6c7MjZTP1GInixxG1DDJuJeIPCWhUwBxCX3CPl8BcL+65FzdA
         UkvSpS6m+3pS+D/8aBkplRzK1r/Qv+7uSg5JACP5SEL+A+he8lOE68px7ghnG77sVgpW
         fEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792442241; x=1793047041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OlQWf86SXokSuh4SBBMFiqlQD7tg29+MR0deKhyYBLU=;
        b=qxWobm6H1zgcu5YDaEO9RFtXh+BGzYEKO/2FJl8QSybZh84/jOOxz+mL2DjaWY7u6O
         /WcOS3o34aE8ZPWORR5dLHIYjkVdE4NCqCjDJc5bH5/kZACbyJ3cL/v/3uPAkHDBAHH7
         /m67z58EOUjHCMIEDRBSFqth1HNDdy1PhVhJyOOU81DHKKthnp2+T06hLlh487SRjqgr
         q3z/NZqM/G7wV0ypZwyt/4t6xMo5EFl4Fr6b7DpBRubXTA+IxJS7O33KULQjXmPhDlRF
         FCZAKQt9W+EMMVlAIMpljMdkhQOcM/rRXE81TrrWNGzXlngunXDRDu93R6e5Vt8iuks7
         /CRg==
X-Forwarded-Encrypted: i=1; AKwUvBxqvPwXaG9gkPRUbr/wtdZ0ILfX9bHHrJPU5y80dO/2gz4jK3s6A8BkGe6kwnzcP3kSUQOPF6TG9c78Rjk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5enInEfM5SNDtg3b7Dt32Rc6xrkRnsgQ32hhfcKmRQVQXJhoG
	jNVto8C5mRht4zr45VXxK6NlhXQRUBLu+fwRlVHrbak92hJgAfvR8M3g
X-Gm-Gg: AYBFou0gnkdeC4FjDC8DoeRYZJ07bHJGtG5gBjA8inmKaHq4uf5z7jr9Dhl6JWQKwx+
	/3LDDbLQ9wnXYEz4NI8CIN2PcZeBzqF1UnSoiTL/w3fcCV6+QTYklCoB0O0etT0uMEJEnKwIwy2
	HiFMrxiSghUl/OcyNu+FedCU/i7Zrhl2LmWjaaZWuUFsKlo/QRh7lIK1xkkLcVH8sW/x6TPMVDy
	YCDvxh/FK0jNZVsM2G/eitK/O8vqqCxXRM9Jzi6SzMaiUaCXLMT7I8mLbFIl3jL77HMg6Zv/i8W
	va6g+wdtGtCQ25PB7UNr60C4bnbS22CxyaKLgcgFI/jOMlvyrDDTPgdySq2ZyQPt6oyok1m2RVo
	8JzsiFv2ol8UhDTc0rjuCp5RyuNYCXBd17QOjpmC8wjXoolFVSCgx081pp5mKz/LFaKcSlLJ1CJ
	f9KxZE3Z8Ciu1N+VNOAosmzKggKrpOfpgxgRuckfuCopA6T5SbpugsmsFDvsHvAKTC+IolpAY7d
	t0XUC9C5jev3mhpV+96/DCkPtWDPjgve1AE2xtfPVY0X26t8rCU4DsZ0uxTQDTwVhzgWyDw4kLX
	nSyE5a26svwcuDdiuFxKcJtZ0my2lzokJV84n2Do3IPnDC5M0KBziOV0+4f7Ui9xHGOFUeaXjPa
	u1ZHA8Pd4
X-Received: by 2002:a05:600c:3e85:b0:4a1:d798:b08a with SMTP id 5b1f17b1804b1-4a1d798b0d4mr175531195e9.21.1792442241144;
        Mon, 19 Oct 2026 13:37:21 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4e0-4601-c43a-536a-04a3-af7d.310.pool.telefonica.de. [2a02:3100:a4e0:4601:c43a:536a:4a3:af7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c9e9c3sm15967405e9.3.2026.10.19.13.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:37:20 -0700 (PDT)
Date: Mon, 19 Oct 2026 22:37:17 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: netdev@vger.kernel.org, Roger Quadros <rogerq@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Keerthy <j-keerthy@ti.com>, Kevin Hao <haokexin@gmail.com>, 
	Alexander Sverdlin <alex@sverdlin.org>, Arnd Bergmann <arnd@arndb.de>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: cpsw: fix netdev cleanup on probe failure
Message-ID: <atZ8lCW0VVPzoHwb@gmail.com>
References: <20261019060430.33254-1-kmehltretter@gmail.com>
 <c20d708a-f4d6-4e66-a516-056d93264825@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c20d708a-f4d6-4e66-a516-056d93264825@ti.com>

On Mon, Oct 19, 2026 at 12:19:11PM +0100, Siddharth Vadapalli wrote:
> > +		unregister_netdev(ndev);
> > +		disable_work_sync(&priv->rx_mode_work);
> 
> Although the above code is a refactor, it appears to me that the correct
> sequence should be:
> 	disable_work_sync(&priv->rx_mode_work);
> 	unregister_netdev(ndev);
> RX Mode work (cpsw_ndo_set_rx_mode_work) does have a 'netif_running' check
> so it might still be fine if the sequence isn't followed.
> 
> Please correct me if I am mistaken regarding the above. Rest of the patch
> looks good to me.
> 

Both orders are safe here. The worker and unregister_netdev() serialize
on RTNL, so a worker running after unregister exits at !netif_running().

This matches cpsw_new, so I'd keep the current order.

Thanks,
Karl
