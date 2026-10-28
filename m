Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213025;
	b=a4Xc4LkxQz8i4XzLriWwdd/ocE5L2f+c4KOF3NCjg/JzlZ2z/NXupENIBe6+nHcYWJfT
	 mlUV0+MXSAzc7wFWnADO9LC5NOjkws9+qE/mJt21XSYEhVnNN4M7wVopJ21JAJnD8hVxg
	 JeMVAzu8outASDG2WA9CGwqZm65X5hn7g5+lN0UGsC9Km6zOteQdpLA3NzLQs7Sn7b2Qv
	 Obr4pnX70v38BjYu7qD+A1gnRbLFidYyn2x46Y8G/a5BYDKU34YbMA5QN8z3ajqHkAfa3
	 MHFvT9SLUKA/NCEZ/bZxkdoVaAF+W/AnJdb6xFH0H6ALPXYbfBbNMphOFOeWwbVDtEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Date:From:To:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=LxeaRpJalAK9o9y/rJrI1nvI5x98N5L6JBdMxfFP0kQ=;
	b=xqofhcYUzgF9M7ImU8oiB4Awj0zo3I69Izrv+rLHBVa4CH/dxu5kaGzcMT8DQEnRC48x
	 FOEm2nm39/en2PNgqAchIua5pCbbp4YvjlhDTDiuHdYw63U+XrZ2DDIpsv/8WK21V8rv4
	 anMaIm2e8q8rm+FCzW78XcjgO1JTXFtFGKSubO5cT8IZ6lBJFyrFiVx2H/cJg8fRauHl1
	 gJ26uo6nhGj6+gUNGo0FnRoi6KiG5gPgBcYLdU2Nq2SlzIuXp0SQoEgq/gCXMS9x/whBx
	 AbxtSUap+HXp38T48Wrj4m/8DEdrxFEFkY91agRTvQB1kGR26QQJ3CIIbF0Zl1cU26g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=VlIGBOFy;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F44606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F44606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=VlIGBOFy
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2F6253FBFC
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793213022;
	bh=LxeaRpJalAK9o9y/rJrI1nvI5x98N5L6JBdMxfFP0kQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=VlIGBOFykncVCSyJtOfLAWFAp6xldEvVWK34W1i51N3suULHkPxJLaLALWCKb0p2p
	 dhXekjN8I0x3bk9bLz0tXo0QE5jW5jIyXQUY4bT4KfLPznOSijYexOrztF8CUewcRV
	 DGQpz3XXnMZhrxcoIPD2IBObyc6ihUhhGY/vg0JMwQPv1pG2ZD4OLTqDe1qBJLPO0+
	 XEgq7qEUpfj4o8/tsjmzUHmEthm55JFcF1qZMdlY7eNvoti5aVLtSkHqX74DBRbAgn
	 zWQbZm+jurHHNRG2fI1E/ja9iqGxn5NE0+XY6X0ABmfqYTE1F3JasCZ0qgufRxBftU
	 GBOnsqt0iKSFqLLkeqgKDDmseuCTITsRk9DXOpUSrQ5hcS4cAqah10cw5U3oqlCmef
	 vZ31I1nePm8yR8IIalwe9JAsNXkJzxmPDFqYYglJUpxtBUzPu1UAQrxN+hvAMS9GqO
	 DcL5mEDx+MuDJjso9Y7kBkhlvJhvwQvlJ5R3Y71bYrSu8zRGKlGIFkqywZVcy2fKGg
	 5Y7cdd4t8D2HFc+vYJCRDShpx+7rh+Wico4QMEBY/DoBvvioo694xgAEOb/s2Xa613
	 78/bkmUfOfiEwFY39ngg4zQviklIgId9OLkv8TM00IoirJEcqJwdiLmtMV1PI6hGJL
	 tIXGpjLD0rKm0pvZp16/uqcM=
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abdbb640b2so290493a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213020; x=1793817820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxeaRpJalAK9o9y/rJrI1nvI5x98N5L6JBdMxfFP0kQ=;
        b=rGKp3O6ohtbMEJGqRQcdtVsVOv26ia0bERawQKUfPQQnR+bMOAGtVLexiI3ZBxJ/xv
         zrDMOZg0O1jHMG1I2YCkcgtkbnz3zKrtL9UT/DRnGqvF+2MfdpBNbZ95bjVICl25/Rf7
         ygBEWQydRKL7ue3UxmkuiL3LJJ0RzBu28o0dtbi+tEaAQv7S5XGLN0YZYUOLeuGnfMem
         hy3cgPiFXHLaoayX4GbUvzsjMVxIblEYlnpJZgbriFB097+DV07Ll5y+OvftHCRzwtiS
         J6FcO8jqkx1XHlfM5PjEEERG+NWqditO7eatcj5T7addkZUSzVLW9UZ6DCLzfJzsBFxi
         Xkhw==
X-Forwarded-Encrypted: i=1; AKwUvBxyfUF3jln0Qc8qL+uomP9YPBzP+1xpjb2+Ieft36Ax8AmXeOt7ShQgA47uocSsW99N+n1RRzpdgzeCimM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4bSonoX2SQCBd27Q1eo8ViseFYiHmLpAZdEdUAgcIb0x1WbXK
	HJe+eXESeoikUSkr8td/4P/7KZQ4kf9H1/cWRGRLoR/UHXEGQWvxihYj42iL4hFY4LU+08BSwhs
	rQFtOxKcLKi5CZDU9LazqFnw9HWh8XhtmHMQ4JU1xUjCfmdEGw4sRjqWzlhQVYN6KGzE+9eayRw
	Pecbbd8w==
X-Gm-Gg: AYBFou0SknhEofyswmtypuOnESRntjLS+fB8+LMO19XZlTWQPVhOpDlJUFuKceFCu61
	X6itfzg9xApJbwDEQt31LV41QbrSuGTvmS60aA3vWkYF1DzEUEKc6zHEZ4dxO4bnI8HKGlrp9VW
	siAFsRLXNb6eoQ2OoU6upqNlImFi8/n6kJDVaXFfUoWpwk7D5iEJVmEmxYjEv8ufj4wJAWUg02c
	6/APesMF5CdxYpjrcz4iiV2dbQRXXV7CK8454YkLM3ByMJqjlH9AgMaoZ6BILgrfELoAjskGMyU
	e8fhN7povsecIeAEA9VPqhfHuB+TYsoQXw4qEMjawe8OU9QhGRRI00c/tTQ0FprCRrgn4AL7Ivx
	s+noD/SfNZMMMuOzBuCAfTPAnlAiMZ/9gP3YtWZQI1xWAPolt7qF1EQwmqTdB+2bbBSqBKk1EPq
	b41oG4N9jxxfRUbjAzOaAWFnkqiILzrVgGH0s60vSvPpVv6dlbq/WMZpMrXZLh2GpFdsmT3xvwe
	ImShXei9uTslDlXbe+T0gVex+EwsnkR5aHiI5x5YVx55KP4Vo3PQGb3KxXoeC/disRBzonfwMfN
X-Received: by 2002:a17:90b:180f:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3ae57eae277mr4429456a91.2.1793213020308;
        Wed, 28 Oct 2026 11:43:40 -0700 (PDT)
X-Received: by 2002:a17:90b:180f:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3ae57eae277mr4429441a91.2.1793213019898;
        Wed, 28 Oct 2026 11:43:39 -0700 (PDT)
Received: from localhost (2001-b011-2008-445c-6e54-18f2-1df8-9655.dynamic-ip6.hinet.net. [2001:b011:2008:445c:6e54:18f2:1df8:9655])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9db612sm626696a91.17.2026.10.28.11.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:43:39 -0700 (PDT)
Date: Thu, 29 Oct 2026 02:43:37 +0800
From: ChunAn Wu <an.wu@canonical.com>
To: linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
	luiz.dentz@gmail.com, kiran.k@intel.com,
	chandrashekar.devegowda@intel.com, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] Bluetooth: btintel_pcie: guard debug dump before hdev
 setup
Message-ID: <auJAzRIrhM3x1WEW@an-XPS-15-9520>
References: <20261013125241.1230408-1-an.wu@canonical.com>
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
In-Reply-To: <20261013125241.1230408-1-an.wu@canonical.com>

On Tue, Oct 13, 2026 at 08:52:41PM +0800, ChunAn Wu wrote:
> An MSI-X interrupt can reach the debug-dump helper before
> btintel_pcie_setup_hdev() initializes data->hdev. The helper then
> passes NULL to hci_get_drvdata() and crashes the interrupt thread.
> 
> Return early when hdev is not available. This covers the GP1 and GP0
> error paths while leaving interrupt handling unchanged.
> 
> Fixes: 190377500fde ("Bluetooth: btintel_pcie: Dump debug registers on error")
> Cc: stable@vger.kernel.org
> Signed-off-by: ChunAn Wu <an.wu@canonical.com>
> ---
> Changes in v2:
> - Add the missing Fixes: tag required for the stable CC.
> 
> ---
>  drivers/bluetooth/btintel_pcie.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
> index ac7193400769..8d7927bd75b6 100644
> --- a/drivers/bluetooth/btintel_pcie.c
> +++ b/drivers/bluetooth/btintel_pcie.c
> @@ -297,12 +297,17 @@ static void btintel_pcie_prepare_tx(struct txq *txq, u16 tfd_index,
>  
>  static inline void btintel_pcie_dump_debug_registers(struct hci_dev *hdev)
>  {
> -	struct btintel_pcie_data *data = hci_get_drvdata(hdev);
> +	struct btintel_pcie_data *data;
>  	u16 cr_hia, cr_tia;
>  	u32 reg, mbox_reg;
>  	struct sk_buff *skb;
>  	u8 buf[80];
>  
> +	if (!hdev)
> +		return;
> +
> +	data = hci_get_drvdata(hdev);
> +
>  	skb = alloc_skb(1024, GFP_ATOMIC);
>  	if (!skb)
>  		return;
> 
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> -- 
> 2.34.1
Hi Maintainers,
Could you kindly help me to review the patch
Many thanks

BR
    An 
