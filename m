Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E0949EC65
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355256; cv=none; b=eJ0UQs0tvfcQMevmBt2WY5yXU76jYak0+3gp+sMA14x3BsznmbBoGd0UomvKEQB5Ob5jmoZMsZWv4EqNoSoi5WwNYiIQ2zv+rjr731xurZU0/+KBfVb/wMpOftB5GS1bXbP/q7OhzykQYq8Nl+3qSnrLjm3/kCQRARadJmG9InE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355256; c=relaxed/simple;
	bh=kgQ75c7WfB3Oz9uZ7+i048ZhK3fG9bHkpLAnlXTs6O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQp4tieZNcuVuz04SX0pIiA064/Eef8sH7SkzY8hr+FLkFR1bFE6mFx2VtTEdzdB82gXdAuOqPkNZB7lyMYFy5rS/BGbHTNHZeWl2rxDiGNoMGXgUjiHg7AkwiXuBXizloH8YXHKWeyjw/ZRfcpeln7pNa+bHTX+Qr+1J/yegSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bahi4E2L; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bahi4E2L"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-484415c8cb1so800780f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355252; x=1788960052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=14+jzd2xZ11KJlEwt0Wo40g8tOZrJ0al72JnGfHAHcs=;
        b=Bahi4E2LnVGbr1H+aSJQApDCaX7C3HDtDyNRAMYrtuUSH+lK5/LwxCJit5J8VzvBr7
         GrLu5BeB0zjSWtzRRGOK8Yxtj7y4IjE+jYjB9MkCkBSyUXuMiIE4G47PdYotTWpkNL6f
         mnWp4QI1kDyDsPK8w0HePJc+Z72B2a6A0TWQ7t4LIVif/UzXZj/+JCjGtE19Z6jMOgiI
         fP+fGwFer7b9qmxrfMT1MmBJVrVk/oLb0I5tbRXVl5j0ithnXwuTw/Xmpf9Cq93zM0OD
         ZK2o4AW7nDw0QiqOMQMv4SNQAvKhbvcK2lNgvAbws/NTIHKQMdywk/+r9B8L+FMBwyA4
         qaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355252; x=1788960052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14+jzd2xZ11KJlEwt0Wo40g8tOZrJ0al72JnGfHAHcs=;
        b=hp7Fj208PXChywMihqCfOgHayy10RRMiN/qVBmY10CmX78jeANs8OvHhY1CBS2cgMd
         rz52IzDHiStl2fXF2KHdaanZyQGz6Qg7wRecrx+059zmfUYj+QxVhoqS3B/M0dB7f8vw
         227HQU+N7NahhjwNxkzj7DA4iJDojqbn8As54CNboykVA644C8p+kg0KzqfDgkqd36SB
         W0ohkT0Kdcy6XvgpNmHdWx8zkTDSONDoXZkRXwYy09TT5qX1ZMxcfiIfLCmvgQ//VC15
         gpDuUsSTtW2MoEaeal8Vyk1TgY3CZwTJj+akXGcZRtvImjZXqZ2MNx1vP3cWyLypsOmF
         eW9w==
X-Forwarded-Encrypted: i=1; AHgh+Rqkr1D377UAW2HHHIx2FnMbC71UVzRS76v6EkTWQEgCa7pqG/rGs6kBYex+KzZPGHDUBbJhfPODsVG/fbI=@vger.kernel.org
X-Gm-Message-State: AFuF++lUZyjkXd+hmiospZjdIN1jQIxIP9j0XUGMG38txN3axhJ+ZYtP
	gLH8EDVvcZJXunXjASMXrrx57o77Hggh6URplK2042g9tV6QtgyJYreC
X-Gm-Gg: AR+sD12/1ow6LfuNImtBjY93vR4ecLORqOXUIGTUOdlFhFyWGOEYaNO2294tNqj0TXw
	kaGbfOWCZJoNHHwhlxVXvpLsx52eIXR8d5qeAbHHBhQkbmBJw5qW4q8mNmGTTHIyOvxf0R6hsLJ
	3WeWTAcSzt3Shk/4Kb55uevNN/vhE0T/7/RefPfgVrETwh+wcJtsdQZ7X5eTTjPckv7xE92x+Wn
	s3UpDyPGDsAMWBR5yKJ4NxjUUY2Il4+OrfXGmyBdQHPGl/pphuk2cQ2p+DC3gttEir3jIaERC0f
	D5pDHmNMlc5L3jwl0QhiUk17ghw+g6n3o/V5dNKMVXTRJu5/0HRvVzn+EmzysFxctnkVXpc8NwZ
	zDZ8VjmKQQIdhHvz2MBj5XlBQW1XylBlvm8GlFCA2wHa0UtveX2GT+HGWCUSJf/5j7xy10fxESs
	wkuWkn3N57fFRTLck4El2D5Qun6RzndLcZoFJrhg5MSL+ECkEwzfFU9IUSlGMX0avQRTFT2O1Wl
	Gk=
X-Received: by 2002:a05:600c:6089:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-49ce580d7d1mr85053985e9.1.1788355230754;
        Wed, 02 Sep 2026 06:20:30 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm41529155e9.3.2026.09.02.06.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:20:30 -0700 (PDT)
Date: Wed, 2 Sep 2026 15:20:28 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Tom Keller <tom@tompkel.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpib: agilent_82357a: Support some 82357b clones
Message-ID: <apgich2wFcoG8Imb@egonzo>
References: <20260901233621.1823280-1-tom@tompkel.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901233621.1823280-1-tom@tompkel.net>

On Tue, Sep 01, 2026 at 11:36:40PM +0000, Tom Keller wrote:
> Some adapters marked as genuine Agilent/Keysight 82357B devices are in
> fact fake. These clones have their own EEPROM instead of loading
> firmware on power up, and only respond to the initialization sequence
> sent by the vendor drivers. Detect clone adapters that don't respond to
> the 0xA0 firmware load request and run the alternate init sequence
> against them.
> 
> Signed-off-by: Tom Keller <tom@tompkel.net>
> ---
> Because I do not have a genuine 82357B, I can't test whether or not this
> patch breaks working adapters, but I did confirm that the clone adapter
> doesn't respond to a firmware load 0xA0 request, and the adapter
> enumerates as 0957:0718 without loading firmware. A CPUCS read would be
> answered by real hardware, but it isn't by the clone.

Hi,
There are a bunch of different clones out there which all work with
the current driver. Some require a firmware load, others don't. Those
that don't, enumerate directly as 0957:0718 and those that do as
0957:0518. For the latter the userspace udev scripts load the firmware
with fxload after which they also enumerate as 0957:0718. I am
reticent to introduce clone specific code. What are the failure
symptoms of your clone with the current driver ? What would be the
minimal changes needed to get it to work ? For the initialisation
sequence, do the register writes have to be in the exact order as in
the pcap trace ? Try removing the undocumented writes. Functionally
they are not needed unless indeed your clone is fingerprinting the
sequence.


> 
> Vendor init sequences were obtained by running the latest vendor control
> bundle (21.3.293) on a Windows 11 VM and capturing the USB packets with
> pcap. I confirmed that this change does make my clone function, and as 
> far as I can tell th
> e clone is fingerprinting the specific sequences. The
> clone has poor error handling in hardware and can freeze on a failed or
> aborted transaction; in that case, power-cycling the adapter is required.
> 
>  drivers/gpib/agilent_82357a/agilent_82357a.c | 151 ++++++++++++++++++-
>  drivers/gpib/agilent_82357a/agilent_82357a.h |   2 +
>  2 files changed, 152 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.c b/drivers/gpib/agilent_82357a/agilent_82357a.c
> index 2468a471d..b5c0d34f0 100644
> --- a/drivers/gpib/agilent_82357a/agilent_82357a.c
> +++ b/drivers/gpib/agilent_82357a/agilent_82357a.c
> @@ -566,8 +566,11 @@ static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
>  	out_data[i++] = 0; // primary address when AWF_NO_ADDRESS is not set
>  	out_data[i++] = 0; // secondary address when AWF_NO_ADDRESS is not set
>  	out_data[i] = AWF_NO_ADDRESS | AWF_NO_FAST_TALKER_FIRST_BYTE;
> -	if (send_commands)
> +	if (send_commands) {
>  		out_data[i] |= A
> WF_ATN | AWF_NO_FAST_TALKER;
> +		if (a_priv->is_clone_82357b)
> +			out_data[i] &= ~AWF_NO_FAST_TALKER_FIRST_BYTE;

Is this really necessary? AWF_NO_FAST_TALKER is already set so
clearing the AWF_NO_FAST_TALKER_FIRST_BYTE bit should not be needed,
although having it set is redundant. I checked that clearing the
AWF_NO_FAST_TALKER_FIRST_BYTE bit on commands also works with my adaptors.
If setting the bit on your clone does not work I'm OK with not setting it
for all adaptors when sending commands.

> +	}
>  	if (send_eoi)
>  		out_data[i] |= AWF_SEND_EOI;
>  	++i;
> @@ -652,6 +655,15 @@ static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
>  		return -ETIMEDOUT;
>  	}
>  
> +	/*
> +	 * The write-complete interrupt carries the number of bytes transferred
> +	 * in bytes 2..5. Clone adapters do not properly answer XFER_STATUS
> +	 */
> +	if (a_priv->is_clone_82357b) {
> +		mutex_unlock(&a_priv->bulk_transfer_lock);
> +		*bytes_written = a_priv->write_complete_count;
> +		return 0;
> +	}
>  	status_data = kmalloc(STATUS_DATA_LEN, GFP_KERNEL);
>  	if (!status_data) {
>  		mutex_unlock(&a_priv->bulk_transfer_lock);
> @@ -1114,6 +1126,10 @@ static void agilent_82357a_interrupt_complete(struct urb *urb)
>  	}
>  
>  	interrupt_flags = transfer_buffer[0];
> +	if (urb->actual_length >= 6 && test_bit(AIF_WRITE_COMPLETE_BN, &interrupt_flags))
> +		a_priv->write_complete_count = transfer_
> buffer[2] |
> +			(transfer_buffer[3] << 8) | (transfer_buffer[4] << 16) |
> +			((u32)transfer_buffer[5] << 24);
>  	if (test_bit(AIF_READ_COMPLETE_BN, &interrupt_flags))
>  		set_bit(AIF_READ_COMPLETE_BN, &a_priv->interrupt_flags);
>  	if (test_bit(AIF_WRITE_COMPLETE_BN, &interrupt_flags))
> @@ -1214,6 +1230,135 @@ static void agilent_82357a_free_private(struct gpib_board *board)
>  }
>  
>  #define INIT_NUM_REG_WRITES 18
> +/* Some clone adapters contain firmware already. Genuine adapters only
> + * enumerate as 0x0718 after firmware load; clone adapters enumerate as 0x0718
> + * right away and refuse a firmware load request.
> + */
> +static void agilent_82357a_detect_clone(struct agilent_82357a_priv *a_priv)
> +{
> +	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
> +	u8 *data;
> +	int retval;
> +
> +	data = kmalloc(1, GFP_KERNEL);
> +	if (!data)
> +		return;
> +	retval = usb_control_msg(usb_dev, usb_rcvctrlpipe(usb_dev, 0), 0xa0,
> +				 USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_
> DEVICE,
> +			0xe600, 0, data, 1, 100);
> +	kfree(data);
> +	if (retval < 0) {
> +		a_priv->is_clone_82357b = 1;
> +		dev_info(&usb_dev->dev, "Clone 82357B detected (firmware load request returned %i), using vendor quirks\n",
> +			 retval);
> +	}
> +}
> +
> +/*
> + * From usb captures of vendor software. Clone adapters require this specific
> + * sequence to function.
> + */
> +static int agilent_82357a_init_82357b_clone(struct gpib_board *board)
> +{
> +	struct agilent_82357a_priv *a_priv = board->private_data;
> +	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
> +	struct agilent_82357a_register_pairlet hw_control;
> +	struct agilent_82357a_register_pairlet writes[19];
> +	int retval;
> +
> +	writes[0].address = RESET_TO_POWERUP;
> +	writes[0].value = RESET_SPACEBALL;
> +	retval = agilent_82357a_write_registers(a_priv, writes, 1);
> +	if (retval) {
> +		dev_err(&usb_dev->dev, "write_registers() returned error\n");
> +		return -EIO;
> +	}
> +	// Write init sequence
> +	set_current_state(T
> ASK_INTERRUPTIBLE);
> +	if (schedule_timeout(usec_to_jiffies(2000)))
> +		return -ERESTARTSYS;
> +	writes[0].address = HW_CONTROL;
> +	writes[0].value = NOT_TI_RESET | SYSTEM_CONTROLLER | NOT_PARALLEL_POLL;
> +	writes[1].address = LED_CONTROL;
> +	writes[1].value = FIRMWARE_LED_CONTROL;
> +	writes[2].address = AUXCR;
> +	writes[2].value = AUX_CS | AUX_CHIP_RESET;
> +	writes[3].address = IMR0;
> +	writes[3].value = HR_BOIE;
> +	writes[4].address = IMR1;
> +	writes[4].value = HR_SRQIE;
> +	writes[5].address = AUXCR;
> +	writes[5].value = AUX_NBAF;
> +	writes[6].address = AUXCR;
> +	writes[6].value = AUX_HLDE;
> +	writes[7].address = ADR;
> +	writes[7].value = board->pad & ADDRESS_MASK;
> +	writes[8].address = PPR;
> +	writes[8].value = 0;
> +	writes[9].address = AUXCR;
> +	writes[9].value = AUX_CS | AUX_STDL;
> +	writes[10].address = AUXCR;
> +	writes[10].value = AUX_LON;
> +	writes[11].address = AUXCR;
> +	writes[11].value = AUX_TON;
> +	writes[12].address = SPMR;
> +	writes[12].value = 0;
> +	writes[13].address = 
> AUXCR;
> +	writes[13].value = AUX_RSV2;
> +	writes[14].address = AUXCR;
> +	writes[14].value = 0x20; // undocumented, sent by the vendor driver
> +	writes[15].address = AUXCR;
> +	writes[15].value = AUX_INVAL;
> +	writes[16].address = AUXCR;
> +	writes[16].value = AUX_CHIP_RESET;
> +	writes[17].address = AUXCR;
> +	writes[17].value = AUX_TCA;
> +	writes[18].address = AUXCR;
> +	writes[18].value = AUX_CS | AUX_SIC;
> +	retval = agilent_82357a_write_registers(a_priv, writes, 19);
> +	if (retval) {
> +		dev_err(&usb_dev->dev, "write_registers() returned error\n");
> +		return -EIO;
> +	}
> +
> +	set_current_state(TASK_INTERRUPTIBLE);
> +	if (schedule_timeout(usec_to_jiffies(15000)))
> +		return -ERESTARTSYS;
> +	writes[0].address = AUXCR;
> +	writes[0].value = AUX_CS | AUX_SRE;
> +	writes[1].address = AUXCR;
> +	writes[1].value = AUX_RPP;
> +	writes[2].address = AUXCR;
> +	writes[2].value = AUX_SIC;
> +	writes[3].address = 9;  // undocumented, sent by the vendor driver
> +	writes[3].value = 3;
> +	writes[4].address =
>  PROTOCOL_CONTROL;
> +	writes[4].value = WRITE_COMPLETE_INTERRUPT_EN;
> +	retval = agilent_82357a_write_registers(a_priv, writes, 5);
> +	if (retval) {
> +		dev_err(&usb_dev->dev, "write_registers() returned error\n");
> +		return -EIO;
> +	}
> +
> +	writes[0].address = FAST_TALKER_T1;
> +	writes[0].value = 0x27;
> +	board->t1_nano_sec = 0x27 * 21;
> +	retval = agilent_82357a_write_registers(a_priv, writes, 1);
> +	if (retval) {
> +		dev_err(&usb_dev->dev, "write_registers() returned error\n");
> +		return -EIO;
> +	}
> +	hw_control.address = HW_CONTROL;
> +	retval = agilent_82357a_read_registers(a_priv, &hw_control, 1, 1);
> +	if (retval) {
> +		dev_err(&usb_dev->dev, "read_registers() returned error\n");
> +		return -EIO;
> +	}
> +	a_priv->hw_control_bits = (hw_control.value & ~0x7) | NOT_TI_RESET | NOT_PARALLEL_POLL;
> +
> +	return 0;
> +}
> +
>  static int agilent_82357a_init(struct gpib_board *board)
>  {
>  	struct agilent_82357a_priv *a_priv = board->private_data;
> @@ -1223,6 +1368,9 @@ static int agilent_8
> 2357a_init(struct gpib_board *board)
>  	int retval;
>  	unsigned int nanosec;
>  
> +	if (a_priv->is_clone_82357b)
> +		return agilent_82357a_init_82357b_clone(board);
> +
>  	writes[0].address = LED_CONTROL;
>  	writes[0].value = FAIL_LED_ON;
>  	writes[1].address = RESET_TO_POWERUP;
> @@ -1346,6 +1494,7 @@ static int agilent_82357a_attach(struct gpib_board *board, const struct gpib_boa
>  	case USB_DEVICE_ID_AGILENT_82357B:
>  		a_priv->bulk_out_endpoint = AGILENT_82357B_BULK_OUT_ENDPOINT;
>  		a_priv->interrupt_in_endpoint = AGILENT_82357B_INTERRUPT_IN_ENDPOINT;
> +		agilent_82357a_detect_clone(a_priv);
>  		break;
>  	default:
>  		dev_err(&usb_dev->dev, "bug, unhandled product_id in switch?\n");
> diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.h b/drivers/gpib/agilent_82357a/agilent_82357a.h
> index 33ac558e5..950d8d4ce 100644
> --- a/drivers/gpib/agilent_82357a/agilent_82357a.h
> +++ b/drivers/gpib/agilent_82357a/agilent_82357a.h
> @@ -126,6 +126,7 @@ struct agilent_82357a_priv {
>  	unsigned
>  short eos_mode;
>  	unsigned short hw_control_bits;
>  	unsigned long interrupt_flags;
> +	u32 write_complete_count;               // bytes transferred
>  	struct urb *bulk_urb;
>  	struct urb *interrupt_urb;
>  	u8 *interrupt_buffer;
> @@ -139,6 +140,7 @@ struct agilent_82357a_priv {
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




