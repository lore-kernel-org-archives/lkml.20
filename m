Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814115;
	b=ecQKZecCoZ/patvDS1vdDaXrlPqKyqxYsIDJdgogbfuova2Hdea7JLxnjCPlB0+MuoiW
	 LElSIE/tZJb/7jxlgMiWiJXTuSdDyhflL3u3giQb4QXs3iRpA/1c3g/gW9gVmdYPLnF/X
	 OPo7i8e9I7amrHlRnTCOJmtcriOFdBI1jBhLTpBPsMxUXE6gUiay3eecQ6NATpKxxMfCk
	 M0Wd/ft/3O7M9iAD5NqkLjoOsBNOX2pKclRsl0j67DoywmrfgAnZq9lGs6O77pqUYEyaS
	 mJ+TJvweB8qrw9/c+Qi2s/ZxclyZoOlKzfo3Dg6U2faZkiUps2KWDj4KabRJbCHoQtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814115;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=xOu/sgCdG8GJBVBdqmibrQhOxMTtv5+ZKSbTCSJow3s=;
	b=M8Ro4g9uTLYK+qER5HXXbP6pFrVQPE3GK8AtOvhC8JUbQfY+tX1+U6LIiJ8VZ2hG6zrH
	 mVOOtadF8aPmA6mUdlwlk7Ot4uFFi93zvtS9aK6/S1vPwApAdOirU56bwTTNSEQUpOypY
	 IdlmmVD30/8UmD2U4Tr4qtddMCYsjT4ZNAarEi7YKjv+ya6aq6uIqSqHAPfCJFA2hW+3q
	 JdXFs9ZE/X+edlo4xISY9nECJjHL2jpMmDaRvXJ8mMg0B8//SICdb6aaq+h3gkcSklmws
	 uF+GyRzmhntJ4+/lDETiMyBj+osC9Kl+KYp8HMSw8zhOgQkyUi2CjsiU1+69kXxbASw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b="T4ljeoz/";
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6376A606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6376A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T4ljeoz/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xOu/sgCdG8GJBVBdqmibrQhOxMTtv5+ZKSbTCSJow3s=; b=T4ljeoz/vbynY1KNTJMhGtVIZ5
	gVX22skzq0HsqK1L8qH47K1ch1kCXb9n1REqGhGypW4ndngkMYobFUOrMiWzK8bTQ0UdEbaTDYgvl
	r3BumxWs8aKmz1IXTHzJUsuD2hCz22HIX+pgvDMMKlkGksS1dME4OvqhYNgKMwdmQDP48H9tmN0qk
	liUP2cUcm9NJPCg+P+KS11FKnkiMAfM7iAUPqg5A/QNf4Ucst2S8tdowoMEPysKmNybi58bqUWasw
	v/dX4Ru5g8mrr1k1JrlJ7xv8j/FY1Nv6zHR4KiwFGcxGU+nARPZjbxKJ8RdCQqVZatrv8dOb8t28+
	qNaqavpw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOezh-00000006FxM-2y8y;
	Wed, 04 Nov 2026 17:41:53 +0000
Message-ID: <07bd7095-b8de-472a-9ffb-2c3f62c51080@infradead.org>
Date: Wed, 4 Nov 2026 09:41:52 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/sysdev/tsi108: Remove redundant 0x prefix in
 tsi108_setup_pci()
To: Thorsten Blum <blum@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261104165857.174285-2-blum@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261104165857.174285-2-blum@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/4/26 8:58 AM, Thorsten Blum wrote:
> The %pa format specifier already includes the 0x prefix. Remove the
> redundant prefix to avoid printing 0x0x.
> 
> Fixes: 55d8bd02cc1b ("powerpc/sysdev/tsi108: fix resource printk format warnings")
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  arch/powerpc/sysdev/tsi108_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/sysdev/tsi108_pci.c b/arch/powerpc/sysdev/tsi108_pci.c
> index 07d0f6a83879..dcc5e3e85dbd 100644
> --- a/arch/powerpc/sysdev/tsi108_pci.c
> +++ b/arch/powerpc/sysdev/tsi108_pci.c
> @@ -217,7 +217,7 @@ int __init tsi108_setup_pci(struct device_node *dev, u32 cfg_phys, int primary)
>  
>  	(hose)->ops = &tsi108_direct_pci_ops;
>  
> -	pr_info("Found tsi108 PCI host bridge at 0x%pa. Firmware bus number: %d->%d\n",
> +	pr_info("Found tsi108 PCI host bridge at %pa. Firmware bus number: %d->%d\n",
>  		&rsrc.start, hose->first_busno, hose->last_busno);
>  
>  	/* Interpret the "ranges" property */

-- 
~Randy
