Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870952;
	b=pidQLPsel/yg6LBZ2lJq+4aHKA6jfWEnkWPgReUwRjISHKRfpjzwx6RaerRnk/1v0HOC
	 2Og0dKT/XDD9B7xcMSK2X4NDbymy9UmoIeUooT/Jk+xiMV4uK9gpK6u5odIN04dbIkJUF
	 I7XiujrxKSvXivNFyn8YAHgQ11rS8RYhu69e+7JSvGFyYoMhfJdDGz14yJz6jCuqGbUyI
	 93EElqbDJN7S+rSbiOjnG1YNYbSALkDYT/r+md8CvWF/WAZz/2giUKAXn/dRiOquOmL7T
	 pzgXTAAQXYkhHKk4eRvIYhz+q5bqC7btZj+c48qvmrw98wqkwGYiPp4mPZwEs8UNDjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=N1KYrZlzN0bCdzLdzfTT07ZbXMOqRZTyKYyxdsW29i4=;
	b=Goa4POAdphKuMWJkNoBE9ZU8+0t5XNugqBxivvUeIc+/343bjeFLe/FpoMJMQirp4Q/O
	 ykukreSjUA3CNaP3niFA0goRMqh9wpHSuoOskTnLmXOU4NRaM9oloDraBB0V4874KlRRL
	 K9IZSQDWr68KGfl3mjkVzCFVAgGKy9GiTdtsJmK+g5DnVUA61ggu540R0iqe6i1XtTrYi
	 C9CKr4SZw+PdiSrMdOj0NDA70kIkdTQAkTC1QySPxe8eIkaXbEmozfsmjMFvNJBhcU4AZ
	 hMLtGI6y34FOVsG3TOn/JG+Ac0JFIlAxQcv1RaSCUkbC7wi1J4KOXPa3mxiRnRqGw2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HxZxHRu2;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E48606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19E48606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HxZxHRu2
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-71ac9e15640so2046150eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794870950; x=1795475750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1KYrZlzN0bCdzLdzfTT07ZbXMOqRZTyKYyxdsW29i4=;
        b=HxZxHRu2eZug3ZeVTiePuc9h39eBvtkwh/XbMJCRhL/VIGZcmD7GJtwHHPR/YdaSwp
         utYDu8i/dCiU72RGr7L2UlaNy+4HeC2zngGggWSe7JTXV2VrbXqoqqRWKnti/NwV6/qi
         zxglDQAt6f7oFyleJF3d521suvURW/u89J8xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870950; x=1795475750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1KYrZlzN0bCdzLdzfTT07ZbXMOqRZTyKYyxdsW29i4=;
        b=n7yhcdjGyP1s7PFRYwwqbyLweIN9dLrSVuh/q2CnVr+fmcnKwUtY/ObU22M9mNA9MV
         3fm7ibCEIZuzzQpY4DFSImd4yM50DQrLYtobSfGuc4xHQftWCgXxc77auLbrTExWzWC1
         xgJeUEGSFyda6Z9j96IvLw16uERo/s44jRr2wOb1u5DnZRnZy7hWwxE8sOcadx2dgAPR
         1hAom91HhQ4ko9AmwUeBYXyzTUA2I+FszjeDgXDAecSDHXUQpC5GWZ6xIznYVs14K+zN
         8tKf0UHfkPliTV2UIamDBSLO2gMpGHU270Vlzw4WcPlCtVqSDAJ1SibONDHHfPKjp9TX
         dWsg==
X-Forwarded-Encrypted: i=1; AL+hErFh6GXQeClk4RvZurG0O82cW/s6FcEF0mVINGEwbdnmogYg5nSjw+XuHea/5O3cN4CQrusMg21Zh00KdDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sDoBfVYAEuTot09jgneBm3jWaDuE+dkncpSl9qcbDcgruim4V
	KSCR/CVOnd+yLDfAVe/UKf32sZmEnDfY/2hnJDLz8sNQivw8YIntsFCjDn6k8jdgNGaTtjkreuR
	3ydAWAxM=
X-Gm-Gg: AYBFou0bvrRsWd50ar5z3xxjsCiBhqWlNmaUFXXHHVNchYyh9+9WErHRqA68Rl+8krd
	85VZT1T9oJQHcKwpdDqUiuLJDk3WTrBKvjAuNlW5sD+SBlT7m2Bet//e8SXTUJJmW8Ts85kUbJI
	0ie1vpQmOZ9L3kIGTuomzJQWhN25vzOoVDhCQ67gotDYFgRl/UhwjuIXSzU/SUvUt6FoiyIAddh
	o7vBdvb7W/NQRWBSyu7REQmpuFFdKZa1ttLgIjXlaf30Yrl1kjod3edO4Z0D7V7/MnNhKxZZ9PX
	6nlqyZNuUkABvnCQwdUbggpauLAeuT+w2SNmRm2WJAvqmo8PnfYKiyo5sEPAWSAE/Ro+a/9Zra2
	26o9L53e8EJ956vtBWugw6IlZAgxMuEArOPXwtFSuaoDsEWw9g3Tm7rgO/PJO97IgbooY8EuWvz
	hGpYcBUmkBMiWYkLGAOsJqWV+mTGKoSDOfyokyd3RTbWT01UHgwPFPYEWfQjH9SZqnKxzTY9naU
	TjTUjrPibu30ayzgqSqI72spQTpJDLmwHqWbtgOD09qPXCFnnR85YtdruKKuqZbtNAd9mKfRbOz
	JwUqCT0uPCJhQG7E3bksABxVGFIei7bHOGkXew==
X-Received: by 2002:a05:6820:83cc:10b0:71a:e389:925d with SMTP id 006d021491bc7-71ae3899360mr3397082eaf.74.1794870949935;
        Mon, 16 Nov 2026 15:15:49 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm5191550eaf.8.2026.11.16.15.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:15:48 -0800 (PST)
Message-ID: <24cb7bb7-100b-45ad-b1ea-afbb6bf41976@linuxfoundation.org>
Date: Mon, 16 Nov 2026 16:15:45 -0700
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
Subject: Re: [PATCH 1/2] usbip: stub: reference count struct stub_device
To: Michael Grzeschik <grzeschik@puzzle.ch>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
 <20261111-usbip-v1-1-da5217ac71d7@puzzle.ch>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261111-usbip-v1-1-da5217ac71d7@puzzle.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 04:34, Michael Grzeschik wrote:
> A stub_device is freed by stub_disconnect() right after usbip_stop_eh()
> reported that the event handler is done with it. The rx and tx threads
> and the event handler can still use it at that point:
> 
>   - The event handler clears an event bit after it ran the handler for
>     it. A SHUTDOWN requested while a previous shutdown is running is lost,
>     so threads started after that shutdown are not stopped before the
>     stub_device is freed.
>   - An event queued for the device while another one is handled leaves an
>     entry in the event list. Once the event bits are clear,
>     usbip_stop_eh() returns, the stub_device is freed, and the handler
>     then locks the sysfs_lock of the freed device.
>   - The stub_device no longer holds a reference to the usb_device, so a
>     thread outliving the disconnect touches a freed usb_device too.
> 
> This was seen exporting the serial port of an ST-Link from an
> STM32MP1-DK2 on a Kirkwood (ARMv5) host. After repeated "endpoint 5 is
> stalled" / usb_clear_halt cycles while a client opened and closed the
> port, stub_rx crashed in dev_err() with the device pointer computed from
> a NULL sdev->udev of freed memory:
> 
>    Unable to handle kernel NULL pointer dereference at virtual address 000000b8 when read
>    PC is at dev_driver_string+0x0/0x38
>    LR is at __dev_printk+0x20/0x6c
>    Call trace:
>     dev_driver_string from __dev_printk+0x20/0x6c
>     __dev_printk from _dev_err+0x40/0x74
>     _dev_err from stub_rx_loop+0x5d8/0xd68 [usbip_host]
>     stub_rx_loop [usbip_host] from kthread+0x100/0x120
> 
> Reference count the stub_device instead of relying on the event handler
> for its lifetime:
> 
>   - the binding (probe until disconnect) holds the initial reference,
>     stub_disconnect() drops it instead of freeing the device
>   - the rx and tx thread hold one each while they run, taken before they
>     are woken and dropped when they end. If kthread_stop() reports that a
>     thread never ran, stub_shutdown_connection() drops it for the thread.
>   - the event handler holds one per queued event until it is completely
>     done with the device, through new optional get/put event handler
>     operations, which vhci and vudc do not set
>   - the stub_device holds a reference to its usb_device again, dropped
>     with the last reference
> 
> Threads that miss their shutdown now end when the connection goes away
> instead of using freed memory.

I really need a simpler change log that explains the problem and the fix.

> 
> Signed-off-by: Michael Grzeschik <grzeschik@puzzle.ch>
> ---
>   drivers/usb/usbip/stub.h         |  3 ++
>   drivers/usb/usbip/stub_dev.c     | 69 ++++++++++++++++++++++++++++++++--------
>   drivers/usb/usbip/stub_rx.c      |  3 ++
>   drivers/usb/usbip/stub_tx.c      |  3 ++
>   drivers/usb/usbip/usbip_common.h |  6 ++++
>   drivers/usb/usbip/usbip_event.c  |  6 ++++
>   6 files changed, 77 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/usbip/stub.h b/drivers/usb/usbip/stub.h
> index d11270560c24..fa40f349d640 100644
> --- a/drivers/usb/usbip/stub.h
> +++ b/drivers/usb/usbip/stub.h
> @@ -6,6 +6,7 @@
>   #ifndef __USBIP_STUB_H
>   #define __USBIP_STUB_H
>   
> +#include <linux/kref.h>
>   #include <linux/list.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
> @@ -20,6 +21,7 @@
>   
>   struct stub_device {
>   	struct usb_device *udev;
> +	struct kref kref;
>   
>   	struct usbip_device ud;
>   	__u32 devid;
> @@ -85,6 +87,7 @@ extern struct kmem_cache *stub_priv_cache;
>   
>   /* stub_dev.c */
>   extern struct usb_device_driver stub_driver;
> +void stub_device_put(struct stub_device *sdev);
>   
>   /* stub_main.c */
>   struct bus_id_priv *get_busid_priv(const char *busid);
> diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
> index abfa11d6bde7..27d1e9c8db17 100644
> --- a/drivers/usb/usbip/stub_dev.c
> +++ b/drivers/usb/usbip/stub_dev.c
> @@ -11,6 +11,42 @@
>   #include "usbip_common.h"
>   #include "stub.h"
>   
> +/*
> + * A stub_device is referenced by its binding to the USB device (from probe
> + * until disconnect), by the rx and tx threads while they run, and by the
> + * event handler while an event for it is queued or being handled. It must
> + * not be freed before all of them are done with it: stopping the threads
> + * relies on the event handler, which can miss a shutdown request or still
> + * have an event queued when disconnect wants to free the device.
> + */
> +static void stub_device_release(struct kref *kref)
> +{
> +	struct stub_device *sdev = container_of(kref, struct stub_device, kref);
> +
> +	usb_put_dev(sdev->udev);
> +	kfree(sdev);
> +}
> +
> +static void stub_device_get(struct stub_device *sdev)
> +{
> +	kref_get(&sdev->kref);
> +}
> +
> +void stub_device_put(struct stub_device *sdev)
> +{
> +	kref_put(&sdev->kref, stub_device_release);
> +}
> +
> +static void stub_eh_get(struct usbip_device *ud)
> +{
> +	stub_device_get(container_of(ud, struct stub_device, ud));
> +}
> +
> +static void stub_eh_put(struct usbip_device *ud)
> +{
> +	stub_device_put(container_of(ud, struct stub_device, ud));
> +}

I don't see a reason for all these new routines that do nothing
but call kref_* - just use kref_* directly

> +
>   /*
>    * usbip_status shows the status of usbip-host as long as this driver is bound
>    * to the target device.
> @@ -101,6 +137,10 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
>   		get_task_struct(tcp_rx);
>   		get_task_struct(tcp_tx);
>   
> +		/* one reference per thread, dropped when the thread ends */
> +		stub_device_get(sdev);
> +		stub_device_get(sdev);

Why not add the hold to stub_tx_loop() and stub_rx_loop() - I don't
thinks this correct.

> +
>   		/* lock and update sdev->ud state */
>   		spin_lock_irq(&sdev->ud.lock);
>   		sdev->ud.tcp_socket = socket;
> @@ -165,13 +205,18 @@ static void stub_shutdown_connection(struct usbip_device *ud)
>   		kernel_sock_shutdown(ud->tcp_socket, SHUT_RDWR);
>   	}
>   
> -	/* 1. stop threads */
> +	/*
> +	 * 1. stop threads. A thread that was stopped before it ran
> +	 * (-EINTR) did not drop its reference itself.
> +	 */
>   	if (ud->tcp_rx) {
> -		kthread_stop_put(ud->tcp_rx);
> +		if (kthread_stop_put(ud->tcp_rx) == -EINTR)
> +			stub_device_put(sdev);
>   		ud->tcp_rx = NULL;
>   	}
>   	if (ud->tcp_tx) {
> -		kthread_stop_put(ud->tcp_tx);
> +		if (kthread_stop_put(ud->tcp_tx) == -EINTR)
> +			stub_device_put(sdev);
>   		ud->tcp_tx = NULL;
>   	}
>   
> @@ -267,7 +312,8 @@ static struct stub_device *stub_device_alloc(struct usb_device *udev)
>   	if (!sdev)
>   		return NULL;
>   
> -	sdev->udev = udev;
> +	kref_init(&sdev->kref);
> +	sdev->udev = usb_get_dev(udev);
>   
>   	/*
>   	 * devid is defined with devnum when this driver is first allocated.
> @@ -294,6 +340,8 @@ static struct stub_device *stub_device_alloc(struct usb_device *udev)
>   	sdev->ud.eh_ops.shutdown = stub_shutdown_connection;
>   	sdev->ud.eh_ops.reset    = stub_device_reset;
>   	sdev->ud.eh_ops.unusable = stub_device_unusable;
> +	sdev->ud.eh_ops.get      = stub_eh_get;
> +	sdev->ud.eh_ops.put      = stub_eh_put;
>   
>   	usbip_start_eh(&sdev->ud);
>   
> @@ -302,11 +350,6 @@ static struct stub_device *stub_device_alloc(struct usb_device *udev)
>   	return sdev;
>   }
>   
> -static void stub_device_free(struct stub_device *sdev)
> -{
> -	kfree(sdev);
> -}
> -
>   static int stub_probe(struct usb_device *udev)
>   {
>   	struct stub_device *sdev = NULL;
> @@ -409,7 +452,7 @@ static int stub_probe(struct usb_device *udev)
>   	put_busid_priv(busid_priv);
>   
>   sdev_free:
> -	stub_device_free(sdev);
> +	stub_device_put(sdev);
>   
>   	return rc;
>   }
> @@ -489,15 +532,15 @@ static void stub_disconnect(struct usb_device *udev)
>   
>   	/* we already have busid_priv, just lock busid_lock */
>   	spin_lock(&busid_priv->busid_lock);
> -	/* free sdev */
>   	busid_priv->sdev = NULL;
> -	stub_device_free(sdev);
>   
>   	if (busid_priv->status == STUB_BUSID_ALLOC)
>   		busid_priv->status = STUB_BUSID_ADDED;
>   	/* release busid_lock */
>   	spin_unlock(&busid_priv->busid_lock);
> -	return;
> +
> +	/* drop the reference of the binding, threads may still hold theirs */
> +	stub_device_put(sdev);
>   }
>   
>   #ifdef CONFIG_PM
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 1e9ae578810d..63571b690f14 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -707,5 +707,8 @@ int stub_rx_loop(void *data)
>   		stub_rx_pdu(ud);
>   	}
>   
> +	/* drop the reference taken in usbip_sockfd_store() */
> +	stub_device_put(container_of(ud, struct stub_device, ud));
> +
>   	return 0;
>   }
> diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
> index 4ffd342250b5..44b3e870456c 100644
> --- a/drivers/usb/usbip/stub_tx.c
> +++ b/drivers/usb/usbip/stub_tx.c
> @@ -446,5 +446,8 @@ int stub_tx_loop(void *data)
>   					  kthread_should_stop()));
>   	}
>   
> +	/* drop the reference taken in usbip_sockfd_store() */
> +	stub_device_put(sdev);
> +
>   	return 0;
>   }
> diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
> index be4c5e65a7f8..dfacd8530db8 100644
> --- a/drivers/usb/usbip/usbip_common.h
> +++ b/drivers/usb/usbip/usbip_common.h
> @@ -280,6 +280,12 @@ struct usbip_device {
>   		void (*shutdown)(struct usbip_device *);
>   		void (*reset)(struct usbip_device *);
>   		void (*unusable)(struct usbip_device *);
> +		/*
> +		 * Optional: hold a reference while an event for this device is
> +		 * queued for or being handled by the event handler.
> +		 */
> +		void (*get)(struct usbip_device *ud);
> +		void (*put)(struct usbip_device *ud);
>   	} eh_ops;
>   
>   	struct kcov_common_handle_id kcov_handle;
> diff --git a/drivers/usb/usbip/usbip_event.c b/drivers/usb/usbip/usbip_event.c
> index 0e00c2d000f8..eea9a71f0eac 100644
> --- a/drivers/usb/usbip/usbip_event.c
> +++ b/drivers/usb/usbip/usbip_event.c
> @@ -94,6 +94,10 @@ static void event_handler(struct work_struct *work)
>   		mutex_unlock(&ud->sysfs_lock);
>   
>   		wake_up(&ud->eh_waitq);
> +
> +		/* drop the reference taken by usbip_event_add() */
> +		if (ud->eh_ops.put)
> +			ud->eh_ops.put(ud);
>   	}
>   }
>   
> @@ -163,6 +167,8 @@ void usbip_event_add(struct usbip_device *ud, unsigned long event)
>   		goto out;
>   
>   	ue->ud = ud;
> +	if (ud->eh_ops.get)
> +		ud->eh_ops.get(ud);
>   
>   	list_add_tail(&ue->node, &event_list);
>   	queue_work(usbip_queue, &usbip_work);
> 

thanks,
-- Shuah
