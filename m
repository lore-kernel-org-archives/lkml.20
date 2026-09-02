Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC1E415F2E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388899; cv=none; b=UhmBVM3W+elNXfacOdiMkBBXOw/DGws8ALnjdT6fBDkwzxuZ2l4l2Nw00NfIiv9XKwZyhvOxjTwnngJlPVCk+09lie7A62s6KKBAEN8NwOTqc2lsNwCbrFJegvoMY+bPJv/eNR2Y/vw2t8hUGQiI68LifH+Ty1Yv+aQZp5zL3bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388899; c=relaxed/simple;
	bh=ZBjS7woQMYfEmBSdI7dLzg2h3qKaxjdogln4g+cMSkI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pPq5o+afdT9KiyfFTT3SjovGgOAj3h5qcfTSTy7rGNPzz1lvxdhAVTKFerStkksdvmetUO+Voho9e9MT5WL1Pe2g5sHG2H8dMdFAf/SsMY/blphuU8k6QHKV8v8UVfFhsrRJSWBxuYURvH3LR97D8N7kma4Nv3SMjhWkOJotNns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tompkel.net; spf=pass smtp.mailfrom=tompkel.net; dkim=pass (2048-bit key) header.d=tompkel.net header.i=@tompkel.net header.b=fz1eXo8I; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tompkel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tompkel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tompkel.net header.i=@tompkel.net header.b="fz1eXo8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tompkel.net;
	s=protonmail3; t=1788388881; x=1788648081;
	bh=/2QlD36tAAWBD9PwThNBcfNafTFi76VnTnfzwdBDHAU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fz1eXo8IXLzaO+01KQXXD+j77vnEu+gD0ivQMbBSIzw99fjONun4F1IPPvOtUPhKi
	 bUP+9HlVR512uTuG+f0HCHV2rkqt2QEtLX5DIBVvvRf3m/qQyNS0uIK7VC9CsrWszF
	 yZ5OnfRVnMsmQunY5iXy2t0yMxUz2L9uE+TvqmLqNlHL1PLvkbv6znt1rik6KznLpC
	 IZf9BtWZoCzLKYnoFUccmB0zFLaQNZNXa2W8M+FOC3VBd40256RtZRHwVCi2qptLOA
	 Kb+ADoRu2bpWtu5fSEOI59t8Ks6Ym7pRF/IrlYn47BGmzE4h7C/02R4JzaUPkyaqff
	 zBdv9Slq58rDQ==
Date: Wed, 02 Sep 2026 22:41:16 +0000
To: Dave Penkler <dpenkler@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Tom Keller <tom@tompkel.net>
Cc: linux-kernel@vger.kernel.org, Tom Keller <tom@tompkel.net>
Subject: [PATCH v2] gpib: agilent_82357a: Support some 82357B clones
Message-ID: <20260902224109.2130225-1-tom@tompkel.net>
Feedback-ID: 45376537:user:proton
X-Pm-Message-ID: 06417f4c68dfc86161054b518716ee7ec07a0775
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some adapters marked as Agilent/Keysight 82357B are clones that
contain their own firmware. They do not support XFER_STATUS and need
slightly different initialization. Detect clone adapters that fail a
firmware load and work around their quirks.

Signed-off-by: Tom Keller <tom@tompkel.net>
---
Changes since v1:
- Keep the exiting init sequence, add a small increase to FAST_TALKER_T1
  on clones.
- Clear AWF_NO_FAST_TALKER_FIRST_BYTE on command writes for all
  adapters.
 drivers/gpib/agilent_82357a/agilent_82357a.c | 43 +++++++++++++++++++-
 drivers/gpib/agilent_82357a/agilent_82357a.h |  2 +
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.c b/drivers/gpib/ag=
ilent_82357a/agilent_82357a.c
index 2468a471d..a165f40ac 100644
--- a/drivers/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/gpib/agilent_82357a/agilent_82357a.c
@@ -567,7 +567,7 @@ static ssize_t agilent_82357a_generic_write(struct gpib=
_board *board,
 =09out_data[i++] =3D 0; // secondary address when AWF_NO_ADDRESS is not se=
t
 =09out_data[i] =3D AWF_NO_ADDRESS | AWF_NO_FAST_TALKER_FIRST_BYTE;
 =09if (send_commands)
-=09=09out_data[i] |=3D AWF_ATN | AWF_NO_FAST_TALKER;
+=09=09out_data[i] =3D AWF_ATN | AWF_NO_ADDRESS | AWF_NO_FAST_TALKER;
 =09if (send_eoi)
 =09=09out_data[i] |=3D AWF_SEND_EOI;
 =09++i;
@@ -648,10 +648,19 @@ static ssize_t agilent_82357a_generic_write(struct gp=
ib_board *board,
 =09=09=09=09return -ECOMM;
 =09=09=09}
 =09=09}
-
 =09=09return -ETIMEDOUT;
 =09}
=20
+=09/*
+=09 * Clone adapters do not answer to XFER_STATUS, so use the
+=09 * bytes_written from the write complete interrupt.
+=09 */
+=09if (a_priv->is_clone_82357b) {
+=09=09mutex_unlock(&a_priv->bulk_transfer_lock);
+=09=09*bytes_written =3D a_priv->write_complete_count;
+=09=09return 0;
+=09}
+
 =09status_data =3D kmalloc(STATUS_DATA_LEN, GFP_KERNEL);
 =09if (!status_data) {
 =09=09mutex_unlock(&a_priv->bulk_transfer_lock);
@@ -1114,6 +1123,12 @@ static void agilent_82357a_interrupt_complete(struct=
 urb *urb)
 =09}
=20
 =09interrupt_flags =3D transfer_buffer[0];
+=09if (urb->actual_length >=3D 6 && test_bit(AIF_WRITE_COMPLETE_BN, &inter=
rupt_flags)) {
+=09=09a_priv->write_complete_count  =3D (u32)transfer_buffer[2];
+=09=09a_priv->write_complete_count |=3D (u32)transfer_buffer[3] << 8;
+=09=09a_priv->write_complete_count |=3D (u32)transfer_buffer[4] << 16;
+=09=09a_priv->write_complete_count |=3D (u32)transfer_buffer[5] << 24;
+=09}
 =09if (test_bit(AIF_READ_COMPLETE_BN, &interrupt_flags))
 =09=09set_bit(AIF_READ_COMPLETE_BN, &a_priv->interrupt_flags);
 =09if (test_bit(AIF_WRITE_COMPLETE_BN, &interrupt_flags))
@@ -1213,6 +1228,26 @@ static void agilent_82357a_free_private(struct gpib_=
board *board)
 =09board->private_data =3D NULL;
 }
=20
+static void agilent_82357a_detect_clone(struct agilent_82357a_priv *a_priv=
)
+{
+=09struct usb_device *usb_dev =3D interface_to_usbdev(a_priv->bus_interfac=
e);
+=09u8 *ret_data;
+=09int retval;
+
+=09ret_data =3D kmalloc(1, GFP_KERNEL);
+=09if (!ret_data)
+=09=09return;
+=09retval =3D usb_control_msg(usb_dev, usb_rcvctrlpipe(usb_dev, 0), 0xA0,
+=09=09=09=09 USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+=09=09=09=09 0xE600, 0, ret_data, 1, 100);
+=09kfree(ret_data);
+=09if (retval < 0) {
+=09=09a_priv->is_clone_82357b =3D 1;
+=09=09dev_info(&usb_dev->dev, "Clone 82357B detected (firmware load return=
ed %i), using vendor quirks\n",
+=09=09=09 retval);
+=09}
+}
+
 #define INIT_NUM_REG_WRITES 18
 static int agilent_82357a_init(struct gpib_board *board)
 {
@@ -1223,6 +1258,9 @@ static int agilent_82357a_init(struct gpib_board *boa=
rd)
 =09int retval;
 =09unsigned int nanosec;
=20
+=09if (a_priv->is_clone_82357b)
+=09=09board->t1_nano_sec =3D 819;
+
 =09writes[0].address =3D LED_CONTROL;
 =09writes[0].value =3D FAIL_LED_ON;
 =09writes[1].address =3D RESET_TO_POWERUP;
@@ -1346,6 +1384,7 @@ static int agilent_82357a_attach(struct gpib_board *b=
oard, const struct gpib_boa
 =09case USB_DEVICE_ID_AGILENT_82357B:
 =09=09a_priv->bulk_out_endpoint =3D AGILENT_82357B_BULK_OUT_ENDPOINT;
 =09=09a_priv->interrupt_in_endpoint =3D AGILENT_82357B_INTERRUPT_IN_ENDPOI=
NT;
+=09=09agilent_82357a_detect_clone(a_priv);
 =09=09break;
 =09default:
 =09=09dev_err(&usb_dev->dev, "bug, unhandled product_id in switch?\n");
diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.h b/drivers/gpib/ag=
ilent_82357a/agilent_82357a.h
index 33ac558e5..201316344 100644
--- a/drivers/gpib/agilent_82357a/agilent_82357a.h
+++ b/drivers/gpib/agilent_82357a/agilent_82357a.h
@@ -133,12 +133,14 @@ struct agilent_82357a_priv {
 =09struct mutex bulk_alloc_lock;=09=09// bulk transfer allocation lock
 =09struct mutex interrupt_alloc_lock;=09// interrupt allocation lock
 =09struct mutex control_alloc_lock;=09// control message allocation lock
+=09u32 write_complete_count;               // bytes transferred in last wr=
ite
 =09struct timer_list bulk_timer;
 =09struct agilent_82357a_urb_ctx context;
 =09unsigned int bulk_out_endpoint;
 =09unsigned int interrupt_in_endpoint;
 =09unsigned is_cic : 1;
 =09unsigned ren_state : 1;
+=09unsigned is_clone_82357b : 1;
 };
=20
 struct agilent_82357a_register_pairlet {
--=20
2.55.0


