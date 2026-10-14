Received: from smtp96.iad3b.emailsrvr.com (smtp96.iad3b.emailsrvr.com [146.20.161.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E688C4FD270
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973245; cv=none; b=PjPC5vqfuvBH9Ug4ekLDssJMUQRWQGNnILIX3aDpMdpC4X0Faw5CIbhLT89HSnXoF2BXkkV9C3lNUyCbxiOhhAhvS06XD+AvH1a/68eWt3PnqxTZgSEnfjDaovKOdCZ+3VdJr09ITYGNh2nittwdPB9FSlXrq5QSZ1kSntDT1wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973245; c=relaxed/simple;
	bh=HNEsaUBFS00X3a/MxTTcR9IZYr0KaYY4g0kUbNXobac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtJ+9hk8p3ydfkNs0OFmyQF5hIAFjhoiR6u/pq/gEB/kqVYClEWfLho2ZUm3F3uqoh6Q7f2ig7VlAlJVLRU0w77ouIjHe4B+sUPk2onR9/NWt6iJeus+t4zFxGjqOq0iFTRqWWyWJE1ifqu9FSYfQquNW0fEpNceBmvzowZz7tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=LGkcYf96; arc=none smtp.client-ip=146.20.161.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="LGkcYf96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1791973229;
	bh=HNEsaUBFS00X3a/MxTTcR9IZYr0KaYY4g0kUbNXobac=;
	h=Date:Subject:To:From:From;
	b=LGkcYf96iEyQOyTuPvBkHQVc8PjGgzkuJkUZXckzwYnk41TiiLisi1STRx246a7HK
	 TXZ1Yi1Hw7BCnlVFx9pdtGXEyeNh1oMfg1XwIdGzgjwyz8HZW7Bbq8acuwS4TX1wTJ
	 5JuSKBibP4n477ITy8dFOumYb/McoR375Qmq8ezs=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp5.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 8AA8340191;
	Wed, 14 Oct 2026 06:20:28 -0400 (EDT)
Message-ID: <fba986e3-317a-4c20-aca1-e32a1bfc1dc8@mev.co.uk>
Date: Wed, 14 Oct 2026 11:20:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] comedi: addi_apci_3xxx: fix subdevice count
 underallocation
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 H Hartley Sweeten <hsweeten@visionengravers.com>, Yang Zi
 <2959243019@qq.com>, u.kleine-koenig@baylibre.com
References: <tencent_BC89ED84AE795F9D75CCF0A65E679B78490A@qq.com>
 <20261014101803.11036-1-abbotti@mev.co.uk>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <20261014101803.11036-1-abbotti@mev.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Classification-ID: 771a3ff8-abf2-4aa6-b725-7ee6d04e3d77-1-1

On 14/10/2026 11:11, Ian Abbott wrote:
> From: Yang Zi <2959243019@qq.com>
> 
> In apci3xxx_auto_attach(), the number of subdevices is computed with
> 
>      n_subdevices = (board->ai_n_chan ? 0 : 1) + board->has_ao + ...
> 
> The ternary is inverted: when the board has analog input channels
> (ai_n_chan != 0), it counts 0 instead of 1, so the AI subdevice that is
> actually created is not accounted for. As a result
> comedi_alloc_subdevices() allocates one entry too few, and the later
> subdevice initialization (notably the TTL Digital I/O subdevice, which
> is populated last) writes past the end of the allocated array, causing a
> slab out-of-bounds write.
> 
> Flip the ternary to count 1 when ai_n_chan is non-zero and 0 otherwise,
> matching the subdevice creation order in the function.
> 
> Signed-off-by: Yang Zi <2959243019@qq.com>
> ---
>   drivers/comedi/drivers/addi_apci_3xxx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> ---
> v2: Decorrupted patch in original email and appended my "Reviewed-by"
> line. -- Ian Abbott

Except that I forgot to add my "Reviewed-by" line!

> 
> diff --git a/drivers/comedi/drivers/addi_apci_3xxx.c b/drivers/comedi/drivers/addi_apci_3xxx.c
> index 695cce1031779..1dcda82d95032 100644
> --- a/drivers/comedi/drivers/addi_apci_3xxx.c
> +++ b/drivers/comedi/drivers/addi_apci_3xxx.c
> @@ -787,7 +787,7 @@ static int apci3xxx_auto_attach(struct comedi_device *dev,
>   			dev->irq = pcidev->irq;
>   	}
>   
> -	n_subdevices = (board->ai_n_chan ? 0 : 1) + board->has_ao +
> +	n_subdevices = (board->ai_n_chan ? 1 : 0) + board->has_ao +
>   		       board->has_dig_in + board->has_dig_out +
>   		       board->has_ttl_io;
>   	ret = comedi_alloc_subdevices(dev, n_subdevices);

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
