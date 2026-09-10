Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FB13D47B5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028667; cv=none; b=dJtJEvha+YjGrdJm/3Ak3jUvIc4k/p0HuZw2mWhFm6ZEX8Nbx/e0Iio3TdQ275Pt6aUWVYBNS1kqMRY9IqC6THaFZR1vwU1Ss9JSg0JBDO3dyELbKpNb8lxDwRNY+WlGOB6v8mR9jYe3RegEyMQoqM7DNjxtHq6cNmn1mHkl44g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028667; c=relaxed/simple;
	bh=ZW3duJfxQSY6n/4tTFfE4O2f7VKyGu1T0Jx2uVEQotg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s2eydzL7Yu/0vz0xAsc+vJdx1sk+Q/JzFpjNt6/r9Oss3JSX8d8qTKicPthJbRb89aJcHJ8GDY2obeDK9KcTSmKxMfi55A3+A7DZmmzJDclFLNf1cCUleRg7Z/9GPDt8Om9nRXaYCp4Yk7BRdSACT73BEK7fUOvjYVxxymfAPCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tompkel.net; spf=pass smtp.mailfrom=tompkel.net; dkim=pass (2048-bit key) header.d=tompkel.net header.i=@tompkel.net header.b=kwX4fiod; arc=none smtp.client-ip=185.70.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tompkel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tompkel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tompkel.net header.i=@tompkel.net header.b="kwX4fiod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tompkel.net;
	s=protonmail3; t=1789028648; x=1789287848;
	bh=yMkuOGGKo3nEpCFUwiaI2mJXa7BffzLtA4FCAPqFA+g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kwX4fiodu+L9hoekC1g+Sm+LCR2xVCEidkrk5WFx7DTZkHRHtnllEAmMqnbGNBYTd
	 qsYkIUHql29XFed9IEbRqXxb5vbUxHsxzxi715na59bIPiMg5OPiCJvS4U3UrhRSTX
	 3y11JBKjXCtNB9Z+by5rw+JMRbx0ejO3oDvM0+n1T09DoJk3KHvSitAYnpxvdlgcU0
	 woIoItS4AFoqms6K2GnNPzPZYIU+angAW/VC28w+DyepbtJlsRvzpffZ5XDxhl6+B5
	 4iiGQzNFM0OUU9B5CrMdSL3Gsmh6D03cUeQP3SmnhE8WSqpIpnJpSUdpOEeCoByHBV
	 GcbHCm4enh26g==
Date: Thu, 10 Sep 2026 08:24:03 +0000
To: dpenkler@gmail.com
From: Tom Keller <tom@tompkel.net>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Tom Keller <tom@tompkel.net>
Subject: [PATCH v3] gpib: agilent_82357a: Support some 82357B clones
Message-ID: <20260910082341.631958-1-tom@tompkel.net>
In-Reply-To: <apmJY5LLAh-CKDzt@egonzo>
References: <20260902224109.2130225-1-tom@tompkel.net> <apmJY5LLAh-CKDzt@egonzo>
Feedback-ID: 45376537:user:proton
X-Pm-Message-ID: 28116d337d5220efb9c98aa058d39faf11a539cf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some adapters marked as Agilent/Keysight 82357B are clones that contain
their own firmware. They do not support XFER_STATUS and need slightly
relaxed timing. Detect clone adapters that fail a firmware load and work
around their quirks.

Signed-off-by: Tom Keller <tom@tompkel.net>
---
Changes since v2:
- Use 819 ns as the default FAST_TALKER_T1 for all adapters and drop
  the clone-specific initialization.
- Reword the clone detection message.
Changes since v1:
- Keep the existing init sequence, add a small increase to FAST_TALKER_T1
  on clones.
- Clear AWF_NO_FAST_TALKER_FIRST_BYTE on command writes for all
  adapters.
v2: https://lore.kernel.org/all/20260902224109.2130225-1-tom@tompkel.net/
v1: https://lore.kernel.org/all/20260901233621.1823280-1-tom@tompkel.net/
 drivers/gpib/agilent_82357a/agilent_82357a.c | 41 +++++++++++++++++++-
 drivers/gpib/agilent_82357a/agilent_82357a.h |  2 +
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.c b/drivers/gpib/ag=
ilent_82357a/agilent_82357a.c
index 2468a471d1755..5b34fe7e13662 100644
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
@@ -652,6 +652,16 @@ static ssize_t agilent_82357a_generic_write(struct gpi=
b_board *board,
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
@@ -1114,6 +1124,12 @@ static void agilent_82357a_interrupt_complete(struct=
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
@@ -1213,6 +1229,26 @@ static void agilent_82357a_free_private(struct gpib_=
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
+=09=09dev_info(&usb_dev->dev, "82357B clone with firmware detected (CPUCS =
read returned %i)\n",
+=09=09=09 retval);
+=09}
+}
+
 #define INIT_NUM_REG_WRITES 18
 static int agilent_82357a_init(struct gpib_board *board)
 {
@@ -1346,6 +1382,7 @@ static int agilent_82357a_attach(struct gpib_board *b=
oard, const struct gpib_boa
 =09case USB_DEVICE_ID_AGILENT_82357B:
 =09=09a_priv->bulk_out_endpoint =3D AGILENT_82357B_BULK_OUT_ENDPOINT;
 =09=09a_priv->interrupt_in_endpoint =3D AGILENT_82357B_INTERRUPT_IN_ENDPOI=
NT;
+=09=09agilent_82357a_detect_clone(a_priv);
 =09=09break;
 =09default:
 =09=09dev_err(&usb_dev->dev, "bug, unhandled product_id in switch?\n");
@@ -1359,7 +1396,7 @@ static int agilent_82357a_attach(struct gpib_board *b=
oard, const struct gpib_boa
=20
 =09timer_setup(&a_priv->bulk_timer, agilent_82357a_timeout_handler, 0);
=20
-=09board->t1_nano_sec =3D 800;
+=09board->t1_nano_sec =3D 819;
=20
 =09retval =3D agilent_82357a_init(board);
=20
diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.h b/drivers/gpib/ag=
ilent_82357a/agilent_82357a.h
index 33ac558e55528..2013163446965 100644
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


