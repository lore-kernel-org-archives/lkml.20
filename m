Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [31.44.14.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC86292B2E
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.44.14.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791032498; cv=none; b=CK8flq0887qDMiccTummfbhegJ9DUwZqgS4fTZlTr8YHJReREeEroh/l3pl2I2L+8fZllF+sKHlYISxgw0ODt53H3FN8OSsKxcSUaa6kEu6cjDMAtXJYh4MGNrFFJT3YFRwXmXKYWlYWQvaDxwfBIhJV2lbl5MERK0pbuPpPF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791032498; c=relaxed/simple;
	bh=acfIME/WCQaBJcWezp2A8qiC4GR39pmIcxnqiqaZkDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rNzeL0yajpNR7ldN4GM7oA+Yc5kqEWqAc++pegw6AE56CpLQNk6T8nrh1q6UAWn4CoroQXz9LpmzDkWaGZ5KyOpZTxwmEuxRgLLNcyCsP0VksBEHNwNYcLQJgNT78cjB5rDMRumiK7MocQ+lFsEPHekEruyAE9JNYmqXoGljXH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=fail (0-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=I1QRgEGC reason="key not found in DNS"; arc=none smtp.client-ip=31.44.14.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="I1QRgEGC"
Received: from mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:d44d:0:640:ae2:0])
	by forward501d.mail.yandex.net (postfix) with ESMTPS id 8C7FD8604B;
	Sat, 03 Oct 2026 15:53:31 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net (smtp) with ESMTPSA id TrlcYBkdveA0-LVn8RURK;
	Sat, 03 Oct 2026 15:53:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1791032011;
	bh=RrhwjfnZiNbJAUR8+oIfhLcJXc907syXWsR3aOUDD4M=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=I1QRgEGCx581Nq4nuZT0TCS4FBe76fNGBDeohGJqWZs9OKXyH9XljeLY3NdFiqnpJ
	 5+5MZIAN49FF8XwS+AYtd1FBD2DqfKynoyYQDu1XqsUX8nmWQAHhMSHzLjWG26Huje
	 Mjh8gkfeNo59pmJmvqqcENP9iLlO2Qn/pIipDo+Y=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <0dc4e390-5632-4033-9f83-1b428549d119@sezginduran.net>
Date: Sat, 3 Oct 2026 15:53:28 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: sm750fb: fix resource leaks on probe error
To: Tymofiy Zakharchuk <timgooffical@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
References: <20261003114758.1427-1-timofey.zakharchuk.research@gmail.com>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20261003114758.1427-1-timofey.zakharchuk.research@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/26 2:47 PM, Tymofiy Zakharchuk wrote:
> If sm750fb_framebuffer_alloc() fails during lynxfb_pci_probe(), only
> the framebuffer structures are released. The write-combining MTRR,
> the MMIO and VRAM mappings, and PCI region 1 remain allocated.
> 
> Call arch_phys_wc_del(), iounmap(), and pci_release_region() on the
> release_fb error exit path to prevent leaking resources.
> 
> Signed-off-by: Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
> ---
>   drivers/staging/sm750fb/sm750.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 8b93bfeb2..456b3da86 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -1023,6 +1023,10 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
>   
>   release_fb:
>   	sm750fb_framebuffer_release(sm750_dev);
> +	arch_phys_wc_del(sm750_dev->mtrr.vram);
> +	iounmap(sm750_dev->vmem);
> +	iounmap(sm750_dev->mmio);
> +	pci_release_region(pdev, 1);
>   	return err;
>   }
>   
Any reason for From/Signed-off-by email mismatch? checkpatch generates a 
warning about that.

Regards,
Ahmet Sezgin Duran
