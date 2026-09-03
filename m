Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDC729DB8F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447081; cv=none; b=mhv9o6+V1DwNFgJBsEqXXx+ASi7qPb4EyBwmwpF2ic1ND40Nk/0KycY5vXCljfy8ANmvelwf18FJGaRMBmpVEa+PhQ9yVLZWdOWV4076KhlpunJkJqIKzXHPn5wHo0uc+drVC41au5jXFi3FHNffeOIYQt4WHUAEUBWWV9AbPYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447081; c=relaxed/simple;
	bh=Bldc2NVkCA5SEf5GNpeuimo6iTp7wbrZ+UPwBndSiFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNqYo4D6ORFtNjiihIlQvapEUOPjS6DEAKxNV7g+LDwxPEAFbPq9g2zLk4BxKA2nsmZQ8k36lHlDleg4v9tLfGV1hB1f3vwmhqzs8T/sT1ikGPbsKFpNuxZhVr36hOg8qEGfNTerpMY341fAEP/5bfwmamCbaljLZZPFizt1nsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TO2FGhl2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TO2FGhl2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48442ea8f59so831990f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788447078; x=1789051878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zO5N95eCEeCKSg3NfGdufit3iuqrP2Sknho+BSlmOog=;
        b=TO2FGhl2jwP5BnJqGs6lL5xr+3VAoubnHtX+gPzHKdObknYqIIwGgZPTrafX/qoEnb
         mUnsVZU8OzT4pv75C7qoxx1p65NBOJv+hENKJ/UXLvRK/PfdD8ofTr3yXyXo/Q4jdxQI
         WAFtFnJt7mgK1Mjbe9sV16rovrpGjQniEq0tB6iue+VB+sfUSO2QiPIc7siu00hpg0Up
         ElpGkcqbknlVLuVoQiF1UlC6yWGb4qggnOnq3+msjdZb3q7q6sIic/545ZKjRu/WZAIt
         B/LAY5jvxJyzuTAGndfBFIs/Zi9aZU8Yko/bTZz99Y1j2yi5gkBztmpES3Dg5Jfd1NaD
         YR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447078; x=1789051878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zO5N95eCEeCKSg3NfGdufit3iuqrP2Sknho+BSlmOog=;
        b=ekuoXWtQ+NHIoYODBz/XiUB5mcRf2g3IXt3s6IIsAkNokslIS/CoGbXiiEomTFHhUb
         Av1ANsqyWsuQL7oSbJJpFwHZx94UDR5fOQjykz86hJIyVj5U32x5I44v4SrCgB7v3aLC
         4d2j9OOnET42hiKQu8VDQ+gT5tl7Sm+2f5il40+z/yyaxlRneOnvdbpsNw9BvhYkaKGu
         k40wbhyXxGeP+ReO1Nr1MTulkJ2F/VT1h8tppG1Qxo9UxMX9n26FKARwnQb/gLwO0HY5
         V+X/xr6R9WwtjE+K7NkVVVe3aaNUv3e/ONGERRQlFwqJQIvaWobaPdnvbpP8vxtJv84X
         4ZeA==
X-Forwarded-Encrypted: i=1; AKwUvBws2y54IEsFHBr6HlvxwNEC/qERHJKd8olXq7MNd6KfXBhDuTVEB59k+hcyVReq6JpGNCpx1QeNv3L8zwA=@vger.kernel.org
X-Gm-Message-State: AFuF++mlefBw6KYQavpY1O8Ytf2qkx1XChR8pvxKJKeFVDwMxr1edTZc
	jCLRWN6uUEZr0IxRGItVq3fJwjurzV92ekUB9QpUme41NC0gl2y1nTO/
X-Gm-Gg: AYBFou2T81ng+juAZY0s6eybY+6lxdfZX2fRxM56WjkUCOp28//H2MeUpgIfYrg8w8B
	87p+YPev1oMHnwXNUYFd85nw7ttpLzvoeH40TkSfF/hra9C8NKANVsFE7xtWY1gCk+iqSV6MG/K
	Vo2FV5znM6PiiM17DFSnWUDK7YI18kgRB7h8vMnB8/ag5OBvduqTIn1K5LbO2DVodUypsYLmcaP
	Z7njipICgRv+rn13EDzI2ZCW1mTqPgvQlijGFuRtbA6erxmwNWWHtKvsFO9tYDVqC3Qk96mz46j
	kH6SOKLUZi+lYZFlD0FS2kRqeTZi9rA6euZRUv0kIlmmbmMgNeOiaoiBYK9Recwb14xyrJeOzgD
	SfroQpNSIZIlRM6o0wiHYQM3qsX5i59fZlI9dj5G5aAA+YZKYRGaERnvZuynnPMSP/BP4djELl4
	yYWgckdt24bM84pu6KvDEZ1CSyKhqcNKhkVA1upyIZ1Sf0wF3QEvcrWgtMXBENyETh0jrfr6fEi
	dk=
X-Received: by 2002:a05:600c:c162:b0:49c:f13e:e52 with SMTP id 5b1f17b1804b1-49cf15c92damr44615735e9.15.1788447077516;
        Thu, 03 Sep 2026 07:51:17 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e6115sm80976615e9.14.2026.09.03.07.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:51:17 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:51:15 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Tom Keller <tom@tompkel.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpib: agilent_82357a: Support some 82357B clones
Message-ID: <apmJY5LLAh-CKDzt@egonzo>
References: <20260902224109.2130225-1-tom@tompkel.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902224109.2130225-1-tom@tompkel.net>

On Wed, Sep 02, 2026 at 10:41:16PM +0000, Tom Keller wrote:
> Some adapters marked as Agilent/Keysight 82357B are clones that
> contain their own firmware. They do not support XFER_STATUS and need
> slightly different initialization. Detect clone adapters that fail a
> firmware load and work around their quirks.
> 
> Signed-off-by: Tom Keller <tom@tompkel.net>
> ---
> Changes since v1:
> - Keep the exiting init sequence, add a small increase to FAST_TALKER_T1
>   on clones.
> - Clear AWF_NO_FAST_TALKER_FIRST_BYTE on command writes for all
>   adapters.

Great, I tested this patch with my 2 82357B compatible
adaptors, one which needs a firmware download and the other not and it
worked fine. The Beiming adaptor, which does not need a firmware
download, is not detected as a "clone" so the shipped code is still
being used for it. I also tested systematically setting the
FAST_TALKER_T1 to 819 and that works too. So we can drop the clone
specific initialisation and just change the 800 ns value to 819. There
is no visible change in userspace and the extra 21 ns should not have
any noticeable impact. Detecting the "clone" as you propose is
preferable to a module option since from the outside and userspace we
can't really distinguish your clone from a genuine or other clone
adaptor.

>  drivers/gpib/agilent_82357a/agilent_82357a.c | 43 +++++++++++++++++++-
>  drivers/gpib/agilent_82357a/agilent_82357a.h |  2 +
>  2 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.c b/drivers/gpib/agilent_82357a/agilent_82357a.c
> index 2468a471d..a165f40ac 100644
> --- a/drivers/gpib/agilent_82357a/agilent_82357a.c
> +++ b/drivers/gpib/agilent_82357a/agilent_82357a.c
> @@ -567,7 +567,7 @@ static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
>  	out_data[i++] = 0; // secondary address when AWF_NO_ADDRESS is not set
>  	out_data[i] = AWF_NO_ADDRESS | AWF_NO_FAST_TALKER_FIRST_BYTE;
>  	if (send_commands)
> -		out_data[i] |= AWF_ATN | AWF_NO_FAST_TALKER;
> +		out_data[i] = AWF_ATN | AWF_NO_ADDRESS | AWF_NO_FAST_TALKER;
>  	if (send_eoi)
>  		out_data[i] |= AWF_SEND_EOI;
>  	++i;
> @@ -648,10 +648,19 @@ static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
>  				return -ECOMM;
>  			}
>  		}
> -
>  		return -ETIMEDOUT;
>  	}
>  
> +	/*
> +	 * Clone adapters do not answer to XFER_STATUS, so use the
> +	 * bytes_written from the write complete interrupt.
> +	 */
> +	if (a_priv->is_clone_82357b) {
> +		mutex_unlock(&a_priv->bulk_transfer_lock);
> +		*bytes_written = a_priv->write_complete_count;
> +		return 0;
> +	}
> +
>  	status_data = kmalloc(STATUS_DATA_LEN, GFP_KERNEL);
>  	if (!status_data) {
>  		mutex_unlock(&a_priv->bulk_transfer_lock);
> @@ -1114,6 +1123,12 @@ static void agilent_82357a_interrupt_complete(struct urb *urb)
>  	}
>  
>  	interrupt_flags = transfer_buffer[0];
> +	if (urb->actual_length >= 6 && test_bit(AIF_WRITE_COMPLETE_BN, &interrupt_flags)) {
> +		a_priv->write_complete_count  = (u32)transfer_buffer[2];
> +		a_priv->write_complete_count |= (u32)transfer_buffer[3] << 8;
> +		a_priv->write_complete_count |= (u32)transfer_buffer[4] << 16;
> +		a_priv->write_complete_count |= (u32)transfer_buffer[5] << 24;
> +	}
>  	if (test_bit(AIF_READ_COMPLETE_BN, &interrupt_flags))
>  		set_bit(AIF_READ_COMPLETE_BN, &a_priv->interrupt_flags);
>  	if (test_bit(AIF_WRITE_COMPLETE_BN, &interrupt_flags))
> @@ -1213,6 +1228,26 @@ static void agilent_82357a_free_private(struct gpib_board *board)
>  	board->private_data = NULL;
>  }
>  
> +static void agilent_82357a_detect_clone(struct agilent_82357a_priv *a_priv)
> +{
> +	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
> +	u8 *ret_data;
> +	int retval;
> +
> +	ret_data = kmalloc(1, GFP_KERNEL);
> +	if (!ret_data)
> +		return;
> +	retval = usb_control_msg(usb_dev, usb_rcvctrlpipe(usb_dev, 0), 0xA0,
> +				 USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
> +				 0xE600, 0, ret_data, 1, 100);
> +	kfree(ret_data);
> +	if (retval < 0) {
> +		a_priv->is_clone_82357b = 1;
> +		dev_info(&usb_dev->dev, "Clone 82357B detected (firmware load returned %i), using vendor quirks\n",
> +			 retval);
> +	}
> +}
> +
>  #define INIT_NUM_REG_WRITES 18
>  static int agilent_82357a_init(struct gpib_board *board)
>  {
> @@ -1223,6 +1258,9 @@ static int agilent_82357a_init(struct gpib_board *board)
>  	int retval;
>  	unsigned int nanosec;
>  
> +	if (a_priv->is_clone_82357b)
> +		board->t1_nano_sec = 819;
> +

We can drop this and just use 819 in the initial setting.

>  	writes[0].address = LED_CONTROL;
>  	writes[0].value = FAIL_LED_ON;
>  	writes[1].address = RESET_TO_POWERUP;
> @@ -1346,6 +1384,7 @@ static int agilent_82357a_attach(struct gpib_board *board, const struct gpib_boa
>  	case USB_DEVICE_ID_AGILENT_82357B:
>  		a_priv->bulk_out_endpoint = AGILENT_82357B_BULK_OUT_ENDPOINT;
>  		a_priv->interrupt_in_endpoint = AGILENT_82357B_INTERRUPT_IN_ENDPOINT;
> +		agilent_82357a_detect_clone(a_priv);
>  		break;
>  	default:
>  		dev_err(&usb_dev->dev, "bug, unhandled product_id in switch?\n");
> diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.h b/drivers/gpib/agilent_82357a/agilent_82357a.h
> index 33ac558e5..201316344 100644
> --- a/drivers/gpib/agilent_82357a/agilent_82357a.h
> +++ b/drivers/gpib/agilent_82357a/agilent_82357a.h
> @@ -133,12 +133,14 @@ struct agilent_82357a_priv {
>  	struct mutex bulk_alloc_lock;		// bulk transfer allocation lock
>  	struct mutex interrupt_alloc_lock;	// interrupt allocation lock
>  	struct mutex control_alloc_lock;	// control message allocation lock
> +	u32 write_complete_count;               // bytes transferred in last write
>  	struct timer_list bulk_timer;
>  	struct agilent_82357a_urb_ctx context;
>  	unsigned int bulk_out_endpoint;
>  	unsigned int interrupt_in_endpoint;
>  	unsigned is_cic : 1;
>  	unsigned ren_state : 1;
> +	unsigned is_clone_82357b : 1;
>  };
>  
>  struct agilent_82357a_register_pairlet {
> -- 
> 2.55.0
> 
> 
