Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9F44AD7F3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387629; cv=none; b=OCyJ9OT7lR5ojmCEDJ2swRUPHaP50ssyEPQvTlzWyz7QT8NyIv27ustw77Ep0RHvKMLHZaeE2qaBQ2rSce1nwcWSrxdUH7mamlqHfWzvVjYYj6DFhUejUKUgwqMf08YbOirMxOGSHyImzPI3B5xvC/2opuFv3uUp+7UR+eXcxcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387629; c=relaxed/simple;
	bh=k9LjOwsnyq0jMgludWjjpPV5mr7MJpJwWE6e0/3jKrs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fzqpBorjdHmeYziCMe6eqIgI0ObIT+UoGTEsZ8+iygFFv8QzrbXXOLvpyWm54TDA3ygQhTmqnKGJirw6xsUNNZjKWXizxkZ8K9umSx5JA3VWzwrbBPB3sfJh5ye3Exc50nx7PPUKwYIGjKEj3UBmCULIr+8ZIUL5uePw5TpMUA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tompkel.net; spf=pass smtp.mailfrom=tompkel.net; dkim=pass (2048-bit key) header.d=tompkel.net header.i=@tompkel.net header.b=TnjQ9oC+; arc=none smtp.client-ip=79.135.106.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tompkel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tompkel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tompkel.net header.i=@tompkel.net header.b="TnjQ9oC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tompkel.net;
	s=protonmail3; t=1788387614; x=1788646814;
	bh=cBAyef/e1ZDeRV29Q5+c+YULLdHJEP+0R37KR7lc7Ao=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TnjQ9oC+5UlqiOWTaufetg4PuerF6Q+pxwZYNAeRMjZmcxsBly4r12MYuYzT2seBL
	 8g46h6DZI0ihpI2NEDbtTQQ8tXXCOCTox8y2d0dxA45/AB2YpHj6yBtwFPW5T6Nc7Q
	 xmoIUBXZRoo+rj+vVbTOMymdhuPMl40KEKQACC3FGTHy/hJNKJwCmCr3dC+O/C8B+L
	 zBeNrFvWUzen7la5rIV5gV0so5ypuhFhnJ/jtTijnKCL1aDs0AY3F0z+r7G0l3c4kq
	 X5V5Rc6teiT3d3T95Fdrcblph3IufvDP36jq6ROkiXGYeo5pY7yHsuX6cPjsm2T6iT
	 m4SiU7aM8okng==
Date: Wed, 02 Sep 2026 22:20:09 +0000
To: Dave Penkler <dpenkler@gmail.com>
From: Tom Keller <tom@tompkel.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpib: agilent_82357a: Support some 82357b clones
Message-ID: <c4k0-MIDO0ZNTW8_9eRMN7AvyXn_yJl4xp7N81uBsd9hYcK7DIjsBQXX2pptPRT5fBDJ_YWn2aJWBiziXu9NzNpqxboZuIkbhczRvnlIHAk=@tompkel.net>
In-Reply-To: <apgich2wFcoG8Imb@egonzo>
References: <20260901233621.1823280-1-tom@tompkel.net> <apgich2wFcoG8Imb@egonzo>
Feedback-ID: 45376537:user:proton
X-Pm-Message-ID: 8422ee3d5069104132176ecd8ed61b92c6cba621
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------f8b34694d2914af58a881fbd57ccf2c9dba1b4dc3ee4f9ce150144d8dcedef51"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------f8b34694d2914af58a881fbd57ccf2c9dba1b4dc3ee4f9ce150144d8dcedef51
Content-Type: multipart/mixed;boundary=---------------------4b32ea39074854c119fc02b6f2116296

-----------------------4b32ea39074854c119fc02b6f2116296
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi,
Thanks for taking a look. I was overcomplicating this, after some more tes=
ting I can =


pare this down quite a bit. I'll send a v2 soon.

On Wednesday, September 2nd, 2026 at 6:20 AM, Dave Penkler <dpenkler@gmail=
.com> wrote:

> On Tue, Sep 01, 2026 at 11:36:40PM +0000, Tom Keller wrote:
> > Some adapters marked as genuine Agilent/Keysight 82357B devices are in
> > fact fake. These clones have their own EEPROM instead of loading
> > firmware on power up, and only respond to the initialization sequence
> > sent by the vendor drivers. Detect clone adapters that don't respond t=
o
> > the 0xA0 firmware load request and run the alternate init sequence
> > against them.
> >
> > Signed-off-by: Tom Keller <tom@tompkel.net>
> > ---
> > Because I do not have a genuine 82357B, I can't test whether or not th=
is
> > patch breaks working adapters, but I did confirm that the clone adapte=
r
> > doesn't respond to a firmware load 0xA0 request, and the adapter
> > enumerates as 0957:0718 without loading firmware. A CPUCS read would b=
e
> > answered by real hardware, but it isn't by the clone.
> =


> Hi,
> There are a bunch of different clones out there which all work with
> the current driver. Some require a firmware load, others don't. Those
> that don't, enumerate directly as 0957:0718 and those that do as
> 0957:0518. For the latter the userspace udev scripts load the firmware
> with fxload after which they also enumerate as 0957:0718. =



This one is one of the former:

[824254.649210] usbcore: registered new interface driver agilent_82357a
[824349.695361] usb 3-1.4.2.3: new high-speed USB device number 45 using x=
hci_hcd
[824349.795733] usb 3-1.4.2.3: New USB device found, idVendor=3D0957, idPr=
oduct=3D0718, bcdDevice=3D 0.00
[824349.795751] usb 3-1.4.2.3: New USB device strings: Mfr=3D1, Product=3D=
2, SerialNumber=3D5
[824349.795756] usb 3-1.4.2.3: Product: 82357B ()
[824349.795760] usb 3-1.4.2.3: Manufacturer: Agilent Technologies, Inc.
[824349.795763] usb 3-1.4.2.3: SerialNumber: MY63484018
[824349.800917] usb 3-1.4.2.3: agilent_82357a: probe succeeded for path: u=
sb-0000:00:14.0-1.4.2.3
[824354.929026] usb 3-1.4.2.3: agilent_82357a: bus 3 dev num 45 attached t=
o gpib0, interface 0

It doesn't enumerate as 0957:0518 at all. As you'd expect, the firmware lo=
ad
doesn't work in this state. The CPUCS write is accepted but the RAM downlo=
ad
times out.

# fxload -v -D /dev/bus/usb/003/045 -t fx2 -I /usr/lib/firmware/agilent_82=
357a/measat_releaseX1.8.hex =


microcontroller type: fx2
single stage:  load on-chip memory
open RAM hexfile image /usr/lib/firmware/agilent_82357a/measat_releaseX1.8=
.hex
stop CPU
write on-chip, addr 0x0ffa len  210 (0x00d2)
write on-chip: Connection timed out

[824752.858176] usb 3-1.4.2.3: usbfs: USBDEVFS_CONTROL failed cmd fxload r=
qt 64 rq 160 len 210 ret -110

The device itself shows all three LEDs on when you plug it in, as if it we=
re
awaiting firmware. I'm fairly sure it's one of these:
https://sourceforge.net/p/linux-gpib/mailman/linux-gpib-general/thread/CAL=
ruTQfJp2-gu2yY-O3fjhSXRM-NduoYJyO1qZV8Y4G9yL9znw%40mail.gmail.com/#msg5921=
8823
Here's a some images of the insides:
https://files.tompkel.net/pic/IMG_3884.JPG
https://files.tompkel.net/pic/IMG_3885.JPG


> I am
> reticent to introduce clone specific code. What are the failure
> symptoms of your clone with the current driver ? What would be the
> minimal changes needed to get it to work ? For the initialisation
> sequence, do the register writes have to be in the exact order as in
> the pcap trace ? Try removing the undocumented writes. Functionally
> they are not needed unless indeed your clone is fingerprinting the
> sequence.

Same initial symptoms as that thread. All three LEDs lit on power up, and =
any
writes to the bus just time out. I did another test without those undocume=
nted
writes, and the adapter does still work, so after another round of testing=
 =


I was able to keep most of the currently shipped init sequence as is. The =
one
remaining change is only needed to clear the adapter's FAIL LED. It wants =
the
fast talker bits at 0x27 instead of 0x26 to clear that, which might also b=
e
acceptable for all adapters. Data transfers under the shipped init work if=
 you
ignore the LED, and the ordering doesn't seem to particularly matter eithe=
r.

The two other changes to work around XFER_STATUS and to clear
AWF_NO_FAST_TALKER_FIRST_BYTE are still needed.

As for detection, I might be trying to be a bit too clever about detecting
whether or not a nonfunctional clone is being plugged in. My clone respond=
s to a
CPUCS read with a USB STALL, so that's what I went with. If you'd rather
ship a quirks mode behind a module option I could go with that approach in=
stead.

> =


> =


> >
> > Vendor init sequences were obtained by running the latest vendor contr=
ol
> > bundle (21.3.293) on a Windows 11 VM and capturing the USB packets wit=
h
> > pcap. I confirmed that this change does make my clone function, and as
> > far as I can tell th
> > e clone is fingerprinting the specific sequences. The
> > clone has poor error handling in hardware and can freeze on a failed o=
r
> > aborted transaction; in that case, power-cycling the adapter is requir=
ed.
> >
> >  drivers/gpib/agilent_82357a/agilent_82357a.c | 151 ++++++++++++++++++=
-
> >  drivers/gpib/agilent_82357a/agilent_82357a.h |   2 +
> >  2 files changed, 152 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.c b/drivers/gp=
ib/agilent_82357a/agilent_82357a.c
> > index 2468a471d..b5c0d34f0 100644
> > --- a/drivers/gpib/agilent_82357a/agilent_82357a.c
> > +++ b/drivers/gpib/agilent_82357a/agilent_82357a.c
> > @@ -566,8 +566,11 @@ static ssize_t agilent_82357a_generic_write(struc=
t gpib_board *board,
> >     out_data[i++] =3D 0; // primary address when AWF_NO_ADDRESS is not=
 set
> >     out_data[i++] =3D 0; // secondary address when AWF_NO_ADDRESS is n=
ot set
> >     out_data[i] =3D AWF_NO_ADDRESS | AWF_NO_FAST_TALKER_FIRST_BYTE;
> > -   if (send_commands)
> > +   if (send_commands) {
> >             out_data[i] |=3D A
> > WF_ATN | AWF_NO_FAST_TALKER;
> > +           if (a_priv->is_clone_82357b)
> > +                   out_data[i] &=3D ~AWF_NO_FAST_TALKER_FIRST_BYTE;
> =


> Is this really necessary? AWF_NO_FAST_TALKER is already set so
> clearing the AWF_NO_FAST_TALKER_FIRST_BYTE bit should not be needed,
> although having it set is redundant. I checked that clearing the
> AWF_NO_FAST_TALKER_FIRST_BYTE bit on commands also works with my adaptor=
s.
> If setting the bit on your clone does not work I'm OK with not setting i=
t
> for all adaptors when sending commands.

This one is definitely required, even though it shouldn't matter. The clon=
e just
hangs on any command writes with AWF_NO_FAST_TALKER_FIRST_BYTE set. Next v=
ersion
I'll clear this for all adapters.

> =


> > +   }
> >     if (send_eoi)
> >             out_data[i] |=3D AWF_SEND_EOI;
> >     ++i;
> > @@ -652,6 +655,15 @@ static ssize_t agilent_82357a_generic_write(struc=
t gpib_board *board,
> >             return -ETIMEDOUT;
> >     }
> >
> > +   /*
> > +    * The write-complete interrupt carries the number of bytes transf=
erred
> > +    * in bytes 2..5. Clone adapters do not properly answer XFER_STATU=
S
> > +    */
> > +   if (a_priv->is_clone_82357b) {
> > +           mutex_unlock(&a_priv->bulk_transfer_lock);
> > +           *bytes_written =3D a_priv->write_complete_count;
> > +           return 0;
> > +   }
> >     status_data =3D kmalloc(STATUS_DATA_LEN, GFP_KERNEL);
> >     if (!status_data) {
> >             mutex_unlock(&a_priv->bulk_transfer_lock);
> > @@ -1114,6 +1126,10 @@ static void agilent_82357a_interrupt_complete(s=
truct urb *urb)
> >     }
> >
> >     interrupt_flags =3D transfer_buffer[0];
> > +   if (urb->actual_length >=3D 6 && test_bit(AIF_WRITE_COMPLETE_BN, &=
interrupt_flags))
> > +           a_priv->write_complete_count =3D transfer_
> > buffer[2] |
> > +                   (transfer_buffer[3] << 8) | (transfer_buffer[4] <<=
 16) |
> > +                   ((u32)transfer_buffer[5] << 24);
> >     if (test_bit(AIF_READ_COMPLETE_BN, &interrupt_flags))
> >             set_bit(AIF_READ_COMPLETE_BN, &a_priv->interrupt_flags);
> >     if (test_bit(AIF_WRITE_COMPLETE_BN, &interrupt_flags))
> > @@ -1214,6 +1230,135 @@ static void agilent_82357a_free_private(struct=
 gpib_board *board)
> >  }
> >
> >  #define INIT_NUM_REG_WRITES 18
> > +/* Some clone adapters contain firmware already. Genuine adapters onl=
y
> > + * enumerate as 0x0718 after firmware load; clone adapters enumerate =
as 0x0718
> > + * right away and refuse a firmware load request.
> > + */
> > +static void agilent_82357a_detect_clone(struct agilent_82357a_priv *a=
_priv)
> > +{
> > +   struct usb_device *usb_dev =3D interface_to_usbdev(a_priv->bus_int=
erface);
> > +   u8 *data;
> > +   int retval;
> > +
> > +   data =3D kmalloc(1, GFP_KERNEL);
> > +   if (!data)
> > +           return;
> > +   retval =3D usb_control_msg(usb_dev, usb_rcvctrlpipe(usb_dev, 0), 0=
xa0,
> > +                            USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_
> > DEVICE,
> > +                   0xe600, 0, data, 1, 100);
> > +   kfree(data);
> > +   if (retval < 0) {
> > +           a_priv->is_clone_82357b =3D 1;
> > +           dev_info(&usb_dev->dev, "Clone 82357B detected (firmware l=
oad request returned %i), using vendor quirks\n",
> > +                    retval);
> > +   }
> > +}
> > +
> > +/*
> > + * From usb captures of vendor software. Clone adapters require this =
specific
> > + * sequence to function.
> > + */
> > +static int agilent_82357a_init_82357b_clone(struct gpib_board *board)
> > +{
> > +   struct agilent_82357a_priv *a_priv =3D board->private_data;
> > +   struct usb_device *usb_dev =3D interface_to_usbdev(a_priv->bus_int=
erface);
> > +   struct agilent_82357a_register_pairlet hw_control;
> > +   struct agilent_82357a_register_pairlet writes[19];
> > +   int retval;
> > +
> > +   writes[0].address =3D RESET_TO_POWERUP;
> > +   writes[0].value =3D RESET_SPACEBALL;
> > +   retval =3D agilent_82357a_write_registers(a_priv, writes, 1);
> > +   if (retval) {
> > +           dev_err(&usb_dev->dev, "write_registers() returned error\n=
");
> > +           return -EIO;
> > +   }
> > +   // Write init sequence
> > +   set_current_state(T
> > ASK_INTERRUPTIBLE);
> > +   if (schedule_timeout(usec_to_jiffies(2000)))
> > +           return -ERESTARTSYS;
> > +   writes[0].address =3D HW_CONTROL;
> > +   writes[0].value =3D NOT_TI_RESET | SYSTEM_CONTROLLER | NOT_PARALLE=
L_POLL;
> > +   writes[1].address =3D LED_CONTROL;
> > +   writes[1].value =3D FIRMWARE_LED_CONTROL;
> > +   writes[2].address =3D AUXCR;
> > +   writes[2].value =3D AUX_CS | AUX_CHIP_RESET;
> > +   writes[3].address =3D IMR0;
> > +   writes[3].value =3D HR_BOIE;
> > +   writes[4].address =3D IMR1;
> > +   writes[4].value =3D HR_SRQIE;
> > +   writes[5].address =3D AUXCR;
> > +   writes[5].value =3D AUX_NBAF;
> > +   writes[6].address =3D AUXCR;
> > +   writes[6].value =3D AUX_HLDE;
> > +   writes[7].address =3D ADR;
> > +   writes[7].value =3D board->pad & ADDRESS_MASK;
> > +   writes[8].address =3D PPR;
> > +   writes[8].value =3D 0;
> > +   writes[9].address =3D AUXCR;
> > +   writes[9].value =3D AUX_CS | AUX_STDL;
> > +   writes[10].address =3D AUXCR;
> > +   writes[10].value =3D AUX_LON;
> > +   writes[11].address =3D AUXCR;
> > +   writes[11].value =3D AUX_TON;
> > +   writes[12].address =3D SPMR;
> > +   writes[12].value =3D 0;
> > +   writes[13].address =3D
> > AUXCR;
> > +   writes[13].value =3D AUX_RSV2;
> > +   writes[14].address =3D AUXCR;
> > +   writes[14].value =3D 0x20; // undocumented, sent by the vendor dri=
ver
> > +   writes[15].address =3D AUXCR;
> > +   writes[15].value =3D AUX_INVAL;
> > +   writes[16].address =3D AUXCR;
> > +   writes[16].value =3D AUX_CHIP_RESET;
> > +   writes[17].address =3D AUXCR;
> > +   writes[17].value =3D AUX_TCA;
> > +   writes[18].address =3D AUXCR;
> > +   writes[18].value =3D AUX_CS | AUX_SIC;
> > +   retval =3D agilent_82357a_write_registers(a_priv, writes, 19);
> > +   if (retval) {
> > +           dev_err(&usb_dev->dev, "write_registers() returned error\n=
");
> > +           return -EIO;
> > +   }
> > +
> > +   set_current_state(TASK_INTERRUPTIBLE);
> > +   if (schedule_timeout(usec_to_jiffies(15000)))
> > +           return -ERESTARTSYS;
> > +   writes[0].address =3D AUXCR;
> > +   writes[0].value =3D AUX_CS | AUX_SRE;
> > +   writes[1].address =3D AUXCR;
> > +   writes[1].value =3D AUX_RPP;
> > +   writes[2].address =3D AUXCR;
> > +   writes[2].value =3D AUX_SIC;
> > +   writes[3].address =3D 9;  // undocumented, sent by the vendor driv=
er
> > +   writes[3].value =3D 3;
> > +   writes[4].address =3D
> >  PROTOCOL_CONTROL;
> > +   writes[4].value =3D WRITE_COMPLETE_INTERRUPT_EN;
> > +   retval =3D agilent_82357a_write_registers(a_priv, writes, 5);
> > +   if (retval) {
> > +           dev_err(&usb_dev->dev, "write_registers() returned error\n=
");
> > +           return -EIO;
> > +   }
> > +
> > +   writes[0].address =3D FAST_TALKER_T1;
> > +   writes[0].value =3D 0x27;
> > +   board->t1_nano_sec =3D 0x27 * 21;
> > +   retval =3D agilent_82357a_write_registers(a_priv, writes, 1);
> > +   if (retval) {
> > +           dev_err(&usb_dev->dev, "write_registers() returned error\n=
");
> > +           return -EIO;
> > +   }
> > +   hw_control.address =3D HW_CONTROL;
> > +   retval =3D agilent_82357a_read_registers(a_priv, &hw_control, 1, 1=
);
> > +   if (retval) {
> > +           dev_err(&usb_dev->dev, "read_registers() returned error\n"=
);
> > +           return -EIO;
> > +   }
> > +   a_priv->hw_control_bits =3D (hw_control.value & ~0x7) | NOT_TI_RES=
ET | NOT_PARALLEL_POLL;
> > +
> > +   return 0;
> > +}
> > +
> >  static int agilent_82357a_init(struct gpib_board *board)
> >  {
> >     struct agilent_82357a_priv *a_priv =3D board->private_data;
> > @@ -1223,6 +1368,9 @@ static int agilent_8
> > 2357a_init(struct gpib_board *board)
> >     int retval;
> >     unsigned int nanosec;
> >
> > +   if (a_priv->is_clone_82357b)
> > +           return agilent_82357a_init_82357b_clone(board);
> > +
> >     writes[0].address =3D LED_CONTROL;
> >     writes[0].value =3D FAIL_LED_ON;
> >     writes[1].address =3D RESET_TO_POWERUP;
> > @@ -1346,6 +1494,7 @@ static int agilent_82357a_attach(struct gpib_boa=
rd *board, const struct gpib_boa
> >     case USB_DEVICE_ID_AGILENT_82357B:
> >             a_priv->bulk_out_endpoint =3D AGILENT_82357B_BULK_OUT_ENDP=
OINT;
> >             a_priv->interrupt_in_endpoint =3D AGILENT_82357B_INTERRUPT=
_IN_ENDPOINT;
> > +           agilent_82357a_detect_clone(a_priv);
> >             break;
> >     default:
> >             dev_err(&usb_dev->dev, "bug, unhandled product_id in switc=
h?\n");
> > diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.h b/drivers/gp=
ib/agilent_82357a/agilent_82357a.h
> > index 33ac558e5..950d8d4ce 100644
> > --- a/drivers/gpib/agilent_82357a/agilent_82357a.h
> > +++ b/drivers/gpib/agilent_82357a/agilent_82357a.h
> > @@ -126,6 +126,7 @@ struct agilent_82357a_priv {
> >     unsigned
> >  short eos_mode;
> >     unsigned short hw_control_bits;
> >     unsigned long interrupt_flags;
> > +   u32 write_complete_count;               // bytes transferred
> >     struct urb *bulk_urb;
> >     struct urb *interrupt_urb;
> >     u8 *interrupt_buffer;
> > @@ -139,6 +140,7 @@ struct agilent_82357a_priv {
> >     unsigned int interrupt_in_endpoint;
> >     unsigned is_cic : 1;
> >     unsigned ren_state : 1;
> > +   unsigned is_clone_82357b : 1;
> >  };
> >
> >  struct agilent_82357a_register_pairlet {
> > --
> > 2.55.0
> >
> =


> =


> =


> =


>
-----------------------4b32ea39074854c119fc02b6f2116296--

--------f8b34694d2914af58a881fbd57ccf2c9dba1b4dc3ee4f9ce150144d8dcedef51
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsG5BAEBCgBtBYJqmKELCRAvYw0nhB5cBkUUAAAAAAAcACBzYWx0QG5vdGF0
aW9ucy5vcGVucGdwanMub3JnjHwAgyMWBupS0I90c2ZM/qT2Jn67BejK6LeI
aO7K3hMWIQRaQ7UZ+S4EyYlQZXcvYw0nhB5cBgAArWsP/1Br9Km3/o2rwdP1
nYphKoYoLNFuoD0D8TwAK3qGfIVnQZLZgF1atGLZAp1a3b8PpN2TWHA2rVRr
E9CDZn92/hXs0voHLfiR0ckJqR3VAhOnAwjXj4WNi3QE5D3q89Vt/rrHODsV
A0myUZNC/Iqqg3HVKe4qtdWDBBX5K3JZrC0JSuZu1aZ3sXqYYXt/XGmSNFkO
UnVIHd/+/jdFjfhRRESl5nsYDyc0A25gaTkhzuJIDrjkU1bNKSLPQuSxzGLK
FFAQjeqH9+6ZL+3xT0xF9Xu1wqvj2Y5zy7ZK6d78MMHVZLJrEH/pNg3NMWDr
JA3DscyEQMFCl90pw7S1jAQCMCUdniryNrxBvFJuonwbrEOjsxw6Lxks9F7z
v1CrIHygV6MBQhrbAsbmQKVJdGVWeVlJkw5yR+OAQfUwl5eLIPseCpk/Rph8
of4L+ZKvf1KjY5ssgUuYsPvvhHg4nGQVY/ctlQcoEtn8osohObQ++RTC8KBL
I+4j22r2/Odp70sHtuqz60JgAyHgAGXbYitSucOptGhSbH9W6KPX2gtw8qCE
1gMkxtcm3TBflm9cZlTinlPlsA4CTDCKQJuB2rz+zHSZq3+vOoEIPv2j2qUf
tHx5MpoNoZrYkPkQeiN9+qqGeRxkFqHp9Hcc57AhCKdolm/Tm/Z5++wHZ582
eVol5hHn
=Zak4
-----END PGP SIGNATURE-----


--------f8b34694d2914af58a881fbd57ccf2c9dba1b4dc3ee4f9ce150144d8dcedef51--

