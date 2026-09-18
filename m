Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D0B43499F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725513; cv=none; b=tYI2SG+w1h/6AM7DJr4wXjZia5UZWpMdHn1ZxKL4ou0x/bqZkiwSuoRbUntVNS01BV0eOfjDnY5UNM8xcAvOTsGN0uf3JwSGj7VmHa3fAyv/N/B6F/KZhRTY7pDcQGQ67mmat+X9HCd5wafkPw6c0nJBVpD0urRLx9XMrrt0x1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725513; c=relaxed/simple;
	bh=WU6NM8wroOJIrsIpnzjpcTgYrVBEM+WJz3vung4Fs/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aP8acMZqOw3l8IKy8Ygozm/nH6QQLpmDC5bhweAXY+jm9lt2ikXy9VJY2idkbvcbCYn8Z+Lz6qpvxF1Cm9ozcVPtjGN5L/YjCYbpP2uHqCL8VlQu/nLkmVJ3Ysxe1oxJQRmD+RxoUgqgYf/4eNXp7pNxGEPtAnmWrs6AT+c0YvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5OTakIU; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5OTakIU"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so7380435e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789725509; x=1790330309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Th6fKAxOCUzA+clN5Rhs3GDQzw7PKXL/ripfjQjtVQY=;
        b=A5OTakIUeuIZiGEjAz9+PqGmhQXOCObXlWewiWmtKWDPqdA7msA8O6xN4q5lLXio0y
         /U8dyNPCnGlTIP49q4+4FdXJgmi4r5REifuompZ+TVe029nXN2IdTgj2eRLTvMchsiyk
         gZz83j1a3ckAn2jPN3BvnR89RJ57Dto4Ae+pd66nGAwOQRomt09VhaHOs931bztfAgjt
         csXfyq/x05wdV/+/eMBm1k7fBaglNGSHlZlAvxtqfOn9Gj5ZQOR2B1vxjIlF/V1jv95d
         EGoAdX3OG1RiGGRK1A2xiHhQdfKdaEXKq2SLCUHL98QG7KvkyeDLKUK5zzW3A4yrJ7Wz
         uK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725509; x=1790330309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th6fKAxOCUzA+clN5Rhs3GDQzw7PKXL/ripfjQjtVQY=;
        b=VLd1ckeaid3VLQLOZchDx0uncEk8G03PSquXdmMBt4+m7TWTiGdOheyn3/1kY8yHNF
         KceWaNQ/hjqacvcXF8cP0jCUSzVZ+qfVa4L5QHMuxspacMoXRpZuK87qsgC5A101xMbS
         TB5dgcyCStwsvcVpjfNPM2W4UsJFtikbCWFMnrlDSl1YhKPaVpUqH+l1TEe230xBnX1m
         ioelUXuW8if7H2go8uSc47oOizSHaAPMaxKs0HYxDfGsxwPD8Yn8GPCiiHu2NmzYyqqs
         /ENGIFzT5fBFBw+njeO9+WGXq6RCABBvRoIQaJcyQhegLmFFsNbFbe77/kPtKdBBovYI
         JdHw==
X-Forwarded-Encrypted: i=1; AKwUvBz3EgTMbw10NnAslLystpzGYVPlL9xflMKn1XJ4UwbLJ1ZJWozEq65qR8GYsvU3h4ysDHOyTLYuEJ/2yj0=@vger.kernel.org
X-Gm-Message-State: AFuF++kgdF0EuGITaaRqJ2YYArySClD2K2ruHG7PeHSsROZZRef7bsbo
	9XSL33xj0X9bkqJ0MfB4Y5c3M+9fBEQerKlweFd/rseJ39IMnevYVg0u
X-Gm-Gg: AYBFou1km6k61KFzuHkz0Nvc56EPdZJcpEdQPmnCKo81eT7VLtJYOpBnEJSu4CKhA20
	Kr6MZPHVbD1d3oUMDdazkSvC/OC6up03poPZRYLjDkY2WBCyiVERQXPZAzhGVUq9zTbe19kPkYq
	bRFIi1Lf/x3KGVRQa48v9ZOiUpWNG4xFbP21UXfdrt9NRtD14AyaDuBUUtzBQGAYj1kWAw1YKe9
	SiVtYE/NoHyseCbPu390aeRNE1AFxreQ1kQDlSJg20dTgss7/pui94xPI4Q54dbEiuPNPSVbWQh
	HouKe2uFimkA2nuAvmR52qoqQeLKLk0RUlXSZ7oHyFnM+rzVYlM2I/03zug37yX8uCxvd44EqwU
	ts6vrQzp/B6OWy5UrqTvfLMsaWXEYalBOcOcGpgfzZeKRY+HvnR+LyPWxSyPezIPRXKbVlrg4gX
	o/tgIZnmcl3ufCE1pwRSGt0j2vG/6LXIgdc37yuswpF1l4KBu7PDdgTMdkHxWx4L98tmxxpKjqy
	qbt7QT5NzgNR/4=
X-Received: by 2002:a05:600c:468c:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49fc56811dcmr25712105e9.4.1789725508897;
        Fri, 18 Sep 2026 02:58:28 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1d0978sm141705625e9.2.2026.09.18.02.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:58:28 -0700 (PDT)
Date: Fri, 18 Sep 2026 11:58:27 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] gpib: tnt4882: Fix device reference leak in mite_init()
Message-ID: <aq0LQw2mrEYJ-jNx@egonzo>
References: <20260916094558.2007240-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916094558.2007240-1-vulab@iscas.ac.cn>

On Wed, Sep 16, 2026 at 09:45:58AM +0000, Wentao Liang wrote:
> In mite_init(), each pci_get_device() iteration returns a new
> reference to a National Instruments PCI device, which is consumed by
> the next iteration.  If kzalloc_obj() fails, the function returns
> without consuming or putting that reference, leaking it.
> 
> Put the device reference before returning when the allocation fails.
> 
> Fixes: 0cd5b05551e0 ("staging: gpib: Add TNT4882 chip based GPIB driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpib/tnt4882/mite.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpib/tnt4882/mite.c b/drivers/gpib/tnt4882/mite.c
> index c75c45cdf03f..3e411653ffc7 100644
> --- a/drivers/gpib/tnt4882/mite.c
> +++ b/drivers/gpib/tnt4882/mite.c
> @@ -58,8 +58,10 @@ void mite_init(void)
>  		pcidev;
>  		pcidev = pci_get_device(PCI_VENDOR_ID_NATINST, PCI_ANY_ID, pcidev)) {
>  		mite = kzalloc_obj(*mite);
> -		if (!mite)
> +		if (!mite) {
> +			pci_dev_put(pcidev);
>  			return;
> +		}
>  
>  		mite->pcidev = pcidev;
>  		pci_dev_get(mite->pcidev);

Acked-by: Dave Penkler <dpenkler@gmail.com>
thanks
> -- 
> 2.34.1
> 
