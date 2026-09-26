Received: from cp4.obambu.com (cp4.obambu.com [88.99.29.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2B3357CF1;
	Sat, 26 Sep 2026 19:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.29.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450873; cv=none; b=YoLnMAsYgET+dTKkVT5IA9GjfmE+15mX4Lhi3UJdVPjL2ZJwdyvvfqlYRz4oLgaiRkkMXRcoj7TYfmKLyRhJAbM74iJ2vhgf6M9SuZqWLghUHukbOfaSU1mvb29pZxONlZsD4Y4GeBX/czRvQTnewqxQrj+sV8ZDsoVr4PfN0Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450873; c=relaxed/simple;
	bh=s1pQdee0egWasIs8rPBVmBH205Mej2A6nJG88KN+NF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GfflktrQtekkA5uhfh0FZbXzxKk+JxteCCXlv0lJQPoUpeEDF9JeUPNbvF6lW7i+hcNnIPcKqhZCj9LCd/X9gyFWe0Pe8bAbwHyp65ygL7qsfTtmuzGRybBL05JZDcfHhAFz1jxxt+zCnMWHq4OvsP5AMdcpA/GCp0b01uG0Ejc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zago.net; spf=pass smtp.mailfrom=zago.net; dkim=pass (2048-bit key) header.d=zago.net header.i=@zago.net header.b=FYUpmA0r; arc=none smtp.client-ip=88.99.29.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zago.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zago.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zago.net header.i=@zago.net header.b="FYUpmA0r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=zago.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cJBNYHchFCet0xy1KgcgZQqbTbXE6FqwSfXVFtg6xpQ=; b=FYUpmA0rponHsl8JCs3K+Dfbos
	tXX1f63nROkpfYbWDnm2qYK9DRtyffQy7jov4sS+zOYE+ZwPfw9ojoeqOjDl6pcn6eGD02/PDv5Lk
	bfASAvcRVA4C1pA/RKUkAKhVyvXtMHhXN9nRCY7MaMst+WIePo2hoMG4AiW5nJ/mcN01AUwWeZCf3
	SWtmLtbBQqgvKO2Flhw3kzB42xmEvqkwsVa88WKUj365QAjlVTlzjQ5YftBouiGO/HZ+UuSeD7DVY
	L+ogEs76kF8d43YPYoun8UmY4JKXatlzcaOpxX5H+VjvFhHumrjc/lIImmWpeidKG9CX+8UFLJiV2
	zvZHShrA==;
Received: from [68.203.7.78] (port=52792 helo=[192.168.1.205])
	by cp4.obambu.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <frank@zago.net>)
	id 1xAXiH-00000001fHs-3nWm;
	Sat, 26 Sep 2026 21:05:34 +0200
Message-ID: <ff76905a-0cff-4834-b23c-9f9600cade34@zago.net>
Date: Sat, 26 Sep 2026 14:05:30 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: gspca: finepix: flush the worker before URBs are
 freed
To: Farhad Alemi <farhad.alemi@berkeley.edu>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CA+0ovCgK_Zt7kTmgqZWz-fOBx1J-rX+Cr8V65vMCEAD4pCnOyg@mail.gmail.com>
Content-Language: en-US
From: Frank Zago <frank@zago.net>
In-Reply-To: <CA+0ovCgK_Zt7kTmgqZWz-fOBx1J-rX+Cr8V65vMCEAD4pCnOyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp4.obambu.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - zago.net
X-Get-Message-Sender-Via: cp4.obambu.com: authenticated_id: frank@zago.net
X-Authenticated-Sender: cp4.obambu.com: frank@zago.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hello,

I used the reproducer on a working camera, and indeed the oops was present. After applying the patch, the kernel wouldn't crash anymore.

I see there's a pending patch to remove the whole gspca driver, but anyway, for this fix:

Acked-by frank zago <frank@zago.net>

Regards,
  Frank.

On 9/10/26 7:21 PM, Farhad Alemi wrote:
> dostream() dereferences gspca_dev->urb[0]->transfer_buffer on entry, but
> finepix flushes its worker only from .stop0, which gspca_stream_off() runs
> after destroy_urbs() has already killed, freed and cleared urb[0], while
> gspca_disconnect() frees the URBs without invoking any subdriver stop
> callback at all. A worker that starts running inside either window faults
> on a NULL urb. Flush the work from .stopN, which runs before
> destroy_urbs(), and add a finepix .disconnect handler that clears ->present
> and flushes the worker before handing over to gspca_disconnect().
> 
> Closes: https://lore.kernel.org/all/CA+0ovCiqm0MVi55RpNtbUQoOjiSxnbjHXGN9rq+P6aJJCqCguQ@mail.gmail.com/
> Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
> ---
> The device was emulated.
> 
> --- a/drivers/media/usb/gspca/finepix.c
> +++ b/drivers/media/usb/gspca/finepix.c
> @@ -217,9 +217,9 @@ static int sd_start(struct gspca_dev *gspca_dev)
>  	return 0;
>  }
> 
> -/* called on streamoff with alt==0 and on disconnect */
> +/* called before destroy_urbs(): the worker must not outlive urb[0] */
>  /* the usb_lock is held at entry - restore on exit */
> -static void sd_stop0(struct gspca_dev *gspca_dev)
> +static void sd_stopN(struct gspca_dev *gspca_dev)
>  {
>  	struct usb_fpix *dev = (struct usb_fpix *) gspca_dev;
> 
> @@ -229,6 +229,17 @@ static void sd_stop0(struct gspca_dev *gspca_dev)
>  	mutex_lock(&gspca_dev->usb_lock);
>  }
> 
> +/* gspca_disconnect() frees the URBs without calling any subdriver callback */
> +static void sd_disconnect(struct usb_interface *intf)
> +{
> +	struct usb_fpix *dev = usb_get_intfdata(intf);
> +
> +	/* let the worker see the device go away, then wait for it */
> +	dev->gspca_dev.present = false;
> +	flush_work(&dev->work_struct);
> +	gspca_disconnect(intf);
> +}
> +
>  /* Table of supported USB devices */
>  static const struct usb_device_id device_table[] = {
>  	{USB_DEVICE(0x04cb, 0x0104)},
> @@ -265,7 +276,7 @@ static const struct sd_desc sd_desc = {
>  	.config = sd_config,
>  	.init   = sd_init,
>  	.start  = sd_start,
> -	.stop0  = sd_stop0,
> +	.stopN  = sd_stopN,
>  };
> 
>  /* -- device connect -- */
> @@ -282,7 +293,7 @@ static struct usb_driver sd_driver = {
>  	.name       = MODULE_NAME,
>  	.id_table   = device_table,
>  	.probe      = sd_probe,
> -	.disconnect = gspca_disconnect,
> +	.disconnect = sd_disconnect,
>  #ifdef CONFIG_PM
>  	.suspend = gspca_suspend,
>  	.resume  = gspca_resume,

