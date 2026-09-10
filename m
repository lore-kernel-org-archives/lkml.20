Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC6C5616BF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060687; cv=none; b=cTSCMANSi7hhJWUvOXvPZbF5UR6wAY7SFoJCI7RzeCDw1EWxEw45GO7EcWZ6OJXc/GgkclFLh99qTQTOtmJwtbKwuyQXoWfpw87EX/cRi35aCF7jdNYze8E9V4jMMGFkBGA498EC9mE6uhK4Bnl4Z0nr9weKSi2dgMKN6UaEBdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060687; c=relaxed/simple;
	bh=idPGcfhxISdVa8++a8xGdW4Wkv20BERY0Fo88R7AT/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0S0V/yHp5zM0mKWPdYv1Oq+EBDeZ3cv4uJakbaeh94e1YiykL+KhkzCE127ZiCFxrUe5ZT7K50NYTZEH+ts8tCCOBpuocNCGcSQGu2o8wbvLFjb+CBmR9BZFTzB81jAuLpi0/mAUCqm/yk09vwGS3GC7UGH8Snywx81VavNasI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYskT0x/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYskT0x/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso512015e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060676; x=1789665476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qB9skJuWN+eMPRv2+zeGwEnEY+hrpnQvNsJwsNUlyTI=;
        b=EYskT0x/Q6FCYqGwJR9F+6SmlkK+YMv9gNVCgAR08NvXkWzRSjR7M8UWbep8UT5Ie8
         UQst74SA+ZZgsyA2ZA1toV0frz+2u7sd5UPQ6Smpym3lwmqnbl6H2NMMGOGO2fIdZ5j1
         7MixIA1aSTnFHh2/1tcDxK9QvTFwcTIit1TRY2ruMjm6K+gzKEqyou+FPhKCn3MQXBqu
         Zy2n4t8FKDma+0YnZSl/F5VLl5H2JZCTXqfghDx54vc+HJKMuSQ8K4Rc+yZbJgTjzpk5
         ro+D25LcJd6NpXyFlabmz21XIYK6F2fhG+Jb5JmnKA/P1aEAa++l6nkD6ztaTK3CrafY
         SYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060676; x=1789665476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qB9skJuWN+eMPRv2+zeGwEnEY+hrpnQvNsJwsNUlyTI=;
        b=c6oxPxhKYi87AhKyMASHrAxMa9n42y3a2DIxQuINBRXdb1F5iicdPo5qH3lswTz1Nj
         fbDmwLwIQcYf0V6EHECj9B6wIKgkVzZ5lGDX5jZo+SDtUlX6nb6E+wONyIH3+99VntIN
         r0ZP+vj86V6U+Zgvuh/90fL4n79RN0pq7GgwMsyAy1YnADLR+DYsHteArRy54s4nnAMu
         9WotUydYxhoxP7z137JBt4FljNc0JKFf3KOOAOXNWKApuu1bsmNGSkL0Lq7zLTRTQT/T
         PgN4rTUnoIvjIDxN+Vpytu25q3WVt4uHTbjAGVEkdc7eSyzqqb2nJ50Znbnr8USSh98I
         FhEQ==
X-Forwarded-Encrypted: i=1; AKwUvByaLxrGDnyxwUzDGqN0t0ldHjaoH5RA0cvfGs/UDEl9TpL4WR38g19c4YpwmJIYx8/wVR9K+knqlLoCPk8=@vger.kernel.org
X-Gm-Message-State: AFuF++nHWHD3xRZtgYu/0h29n7/aJHEB1cjNU/qoNBne9aLOj/RKKcjF
	1Rlye/YnFjBhZSZ3JEFbDfke82SNMVZcCQhTNG67tizPxBNQ/mGOmWvv
X-Gm-Gg: AYBFou3Ghd0u5hGm6KjXpGPt2fUNPawd/LKTC/NNTdwPRdoZKUymkCsGOYM+KcRjrp8
	yOhZFO6M29zMksgjySiqx/2peN/YqLSFrdO2UV55uvCdpgH4Cv7g4YKMyNpY5Y4VkrVJHh+DNeb
	sLRjKPMvFb3z7y+O+vT48pmcNQYxrC0hCI/DVt8T/cqdYoAlauUONn72znWnMDgSG/l2uDVcUnv
	eCptekuGPgwVbAp89RzpgP6Q4kUtNP3bEk91Vk3n0bWxz3yYlmoC4IEkU8/6KvBAYeG2ttV4+BF
	cJIweFpICePf0zo+BR9ICJn6qfZtC7oKMPdY/NMfOwEetOl0QWROvGGQAmXGcKfK2KbUJvLG0Z9
	PmrDNqnlQhtrg91r/+lSR8eho9bvHE9rDCylN9b4BTGhQjDirym7UPeWOMRpBUnpCewDQdYIpZG
	E/+F/C2eOGyLbo8tjvpedQTQ0GCa6Nldj9be9OFvge/fT5NrjA/BE+zOvBuRZon8cJaQ8++j5If
	tS3obtIVNBPFt8=
X-Received: by 2002:a05:600c:3588:b0:49c:fc6c:be1a with SMTP id 5b1f17b1804b1-49e619d530emr213775e9.32.1789060675493;
        Thu, 10 Sep 2026 10:17:55 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60abab54sm8994995e9.5.2026.09.10.10.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:17:54 -0700 (PDT)
Date: Thu, 10 Sep 2026 19:17:52 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Tom Keller <tom@tompkel.net>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpib: agilent_82357a: Support some 82357B clones
Message-ID: <aqLmQJvQvKyH9ZPc@egonzo>
References: <20260902224109.2130225-1-tom@tompkel.net>
 <apmJY5LLAh-CKDzt@egonzo>
 <20260910082341.631958-1-tom@tompkel.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910082341.631958-1-tom@tompkel.net>

On Thu, Sep 10, 2026 at 08:24:03AM +0000, Tom Keller wrote:
> Some adapters marked as Agilent/Keysight 82357B are clones that contain
> their own firmware. They do not support XFER_STATUS and need slightly
> relaxed timing. Detect clone adapters that fail a firmware load and work
> around their quirks.
> 
> Signed-off-by: Tom Keller <tom@tompkel.net>

Acked-by: Dave Penkler <dpenkler@gmail.com>
Tested-by: Dave Penkler <dpenkler@gmail.com>

> ---
> Changes since v2:
> - Use 819 ns as the default FAST_TALKER_T1 for all adapters and drop
>   the clone-specific initialization.
> - Reword the clone detection message.
> Changes since v1:
> - Keep the existing init sequence, add a small increase to FAST_TALKER_T1
>   on clones.
> - Clear AWF_NO_FAST_TALKER_FIRST_BYTE on command writes for all
>   adapters.
> v2: https://lore.kernel.org/all/20260902224109.2130225-1-tom@tompkel.net/
> v1: https://lore.kernel.org/all/20260901233621.1823280-1-tom@tompkel.net/
>  drivers/gpib/agilent_82357a/agilent_82357a.c | 41 +++++++++++++++++++-
>  drivers/gpib/agilent_82357a/agilent_82357a.h |  2 +
>  2 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.c b/drivers/gpib/agilent_82357a/agilent_82357a.c
> index 2468a471d1755..5b34fe7e13662 100644
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
> @@ -652,6 +652,16 @@ static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
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
> @@ -1114,6 +1124,12 @@ static void agilent_82357a_interrupt_complete(struct urb *urb)
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
> @@ -1213,6 +1229,26 @@ static void agilent_82357a_free_private(struct gpib_board *board)
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
> +		dev_info(&usb_dev->dev, "82357B clone with firmware detected (CPUCS read returned %i)\n",
> +			 retval);
> +	}
> +}
> +
>  #define INIT_NUM_REG_WRITES 18
>  static int agilent_82357a_init(struct gpib_board *board)
>  {
> @@ -1346,6 +1382,7 @@ static int agilent_82357a_attach(struct gpib_board *board, const struct gpib_boa
>  	case USB_DEVICE_ID_AGILENT_82357B:
>  		a_priv->bulk_out_endpoint = AGILENT_82357B_BULK_OUT_ENDPOINT;
>  		a_priv->interrupt_in_endpoint = AGILENT_82357B_INTERRUPT_IN_ENDPOINT;
> +		agilent_82357a_detect_clone(a_priv);
>  		break;
>  	default:
>  		dev_err(&usb_dev->dev, "bug, unhandled product_id in switch?\n");
> @@ -1359,7 +1396,7 @@ static int agilent_82357a_attach(struct gpib_board *board, const struct gpib_boa
>  
>  	timer_setup(&a_priv->bulk_timer, agilent_82357a_timeout_handler, 0);
>  
> -	board->t1_nano_sec = 800;
> +	board->t1_nano_sec = 819;
>  
>  	retval = agilent_82357a_init(board);
>  
> diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.h b/drivers/gpib/agilent_82357a/agilent_82357a.h
> index 33ac558e55528..2013163446965 100644
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
