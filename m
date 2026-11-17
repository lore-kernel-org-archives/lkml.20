Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916548;
	b=DDjiuDN/g5rOAgz8B3sSViKIsjS7zyuiROrCQlXi5O5qGzfeB6x0wyQcM1WAXH3sckRn
	 YjEWc2Sjc1bxJG3FEqooD8wJ/knr68qogy0mzo9anc4bi2Mm3JBAdH9tHVS/KCBykSW4E
	 txOd0TZZAoO8Qt5/xmCZXpBgKyPxKCIQPtsVHPO31qJYFnSgcJBS2jkfUaoghX+erEKGK
	 6IB6ux0m7jL/3w3OsZLBPWyDbiUanuaeZgwNOERvpe+Oj9S0LKOGhntzV0ZLAw/cYLOsB
	 x6sM7fuFdoOpgifbaxgDPmWuTWnLPEkEsCYQpQPYF1LD0BxY8tFqc1whRbme5p9iipA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916548;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=DE8/F+wBjTL/BQZaUWiqSF2zBZLyi7q0Mm5qE8iXDys=;
	b=EokoWG5GmV4NejlwwYcp2EzeYW7jojYoZZ+hFM+q3ZF6Xd8BHRqS8xVc4XjhZ/KqJzsF
	 WHj8f4uThKzTzSg/gr0Dii2Oa0hMk3Q34GKlERsEP3qW2fzZys+v1BtOgu3oLODhqD2oA
	 qH3xj1UTRB0tXEzzb8SaBi552Oyfadc4jBgG2qANlw0CptEcSxKmvh9tH0huuUELJhjM6
	 yxv9SuusDMUF1IFkksFW2B3GgjEaM4/KAqvehsXvXI2Lbl+4LsWfqw01/90yrF/z1n7+9
	 GI73sJHHir9FZ0FzO7weMQAlGRXsmTZsRKl+dxHc3YrXsQYYDT5COwHSNQzvOnakkPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=gIQQHYNl;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DB5606A31C;
	Tue, 17 Nov 2026 11:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DB5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=gIQQHYNl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794916547; x=1826452547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/DNG5Z7CMyYk5ax40lE7KRH6yBtBHm7t1nOISF9YDZE=;
  b=gIQQHYNlXskeqxl2+RzIZxUMHPsIwuqISnMnM7tenOoRSMYO5LGulmfM
   FDp0vlkevU8phcj3ofW/Idsjh38hhNWD9nBFpul704/m2q0nxmnAG2RPM
   4TRs5RNwbeWbcz+nmv10AnQeRA2ssR8GcHATjA7AiQukSTQlrwx2CR4vQ
   iFRcmmYKHBJbqcBXMzWtLMKFI5UuMaCY/iaG2/j/vS5o4PFaNFnT99sKa
   1TmKiTG5lsQb1/45VDcQKP52+VPFZE4iiLqF51rZhFsevULUugyQ8+D7N
   we0gce9N73vaWaZgfTb+wvwa3tFewQilc9XdQ9VBE/o5RrJ15u6anRXcs
   Q==;
X-CSE-ConnectionGUID: vG2d/qaKS8C3a9MMCJo5dw==
X-CSE-MsgGUID: 1Lzw9BY9QfGV3JGCm1MVVg==
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="77351922"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Nov 2026 04:55:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 17 Nov 2026 04:55:46 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 17 Nov 2026 04:55:43 -0700
Date: Tue, 17 Nov 2026 12:55:43 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
CC: Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
	<manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] bnx2x: Fix potential IRO array leak on removal
Message-ID: <20261117115543.tixplr7xfub54z7i@DEN-DL-M70577.microsemi.net>
References: <20261112-88a3a7ff32-net-bnx2x@mail.sdu.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261112-88a3a7ff32-net-bnx2x@mail.sdu.edu.cn>

> Firmware initialization allocates a separate IRO array, but
> bnx2x_release_firmware() only frees the other parsed tables. Removing
> the device loses the array pointer with the netdev.
> 
> Free the IRO array with the remaining firmware tables.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: 523224a3b3cd ("bnx2x, cnic, bnx2i: use new FW/HSI")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
> index 277c7bd9c6e7..c6afde9466be 100644
> --- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
> +++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
> @@ -13489,6 +13489,7 @@ static int bnx2x_init_firmware(struct bnx2x *bp)
>  
>  static void bnx2x_release_firmware(struct bnx2x *bp)
>  {
> +	kfree(bp->iro_arr);
>  	kfree(bp->init_ops_offsets);
>  	kfree(bp->init_ops);
>  	kfree(bp->init_data);
> 
> base-commit: 2e54b3e187300893688c2c7517894f5d96732e05

Looks right, however bnx2x_release_firmware() is only ever called from the
remove path. So seems like net-next material.

For the fix:

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
