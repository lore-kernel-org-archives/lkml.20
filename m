Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FDA355803;
	Mon, 12 Oct 2026 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823806; cv=none; b=js59U/HY/ybyVBb8c+6jowxR+xqn0u4iFX8TrKtX8yg1HvQmEait+A6cp8n3nnbbA0Vio+/pvHqi0EoppwFhOYPofHirj3yovZuQR+Ybrqc0mPfhhG/stl8q0YBQfOzYKOKYg1UJWrVv+f3Z8IkZ6tJyje5SmXqjNq3TOewRdH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823806; c=relaxed/simple;
	bh=4GAt8QOv6SsYOK2QPNGu7DZPTigK5EA05O/FYXEnm44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zz7XYYoShuqpk+sGujUmME9ZAqdP8jRbINfRrxszqPQVnYtsa5GjzaXgejbSnpPQfTUdQ2tLbPzoMyXu9ELecXt5VAroabdN8Yttr4lWD1QouilTmej8hah5KnFZywKxg0E1AXx35gdtiwUX22WlT7hGGaVe1RrhhtNiwRe0Wcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXXtSUYF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXXtSUYF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FFF1F0089B;
	Mon, 12 Oct 2026 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791823805;
	bh=ZWHwH53qLYHyGwQl/WgcY9OlVO1xoLFJaSkAbmCw43M=;
	h=Date:From:To:Cc:Subject;
	b=JXXtSUYF8fzxhnmy8cqVIuEHzHeIhZ6+kWn+l2ejvSDEx6cQK5f+HURQu2xU5duyv
	 qrKfAS+64wKBh0d7BnG1H2hizRJkIFyKrPP5b2nWDvYLxFFnX3V7Kx0J6Uuhhuc6MO
	 Rv06lXpQqkdqibyXDSuqy9Qplo+wv9rCd+zWRd2aXQfU5ApuivJdnE4cO6QzTdvAGe
	 JH+DF0C9TIn3snDuHS6oiHzJWNBFPaGnn04EcA4xqzS3gMafR6N7Q06rPm02Tri0cC
	 ND9e/jugJRuqcsasb4U0n4/LEnNeVYxg+cuSwB2K50NTSHKJXs0hwAIfAB00qFnmTb
	 DB4Jik3twwD7w==
Date: Mon, 12 Oct 2026 17:50:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <as0PubB3ZdlPKmvM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wrOCqjPkB3acowie"
Content-Disposition: inline


--wrOCqjPkB3acowie
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c

between commit:

  f0a4447789ef2 ("drm/xe/sysctrl: Fix mailbox header handling")

=66rom the origin tree and commits:

  5137b39159957 ("drm/xe/sysctrl: Fix mailbox header handling")
  10b59a4c3196c ("drm/xe/sysctrl: Replace FIELD_GET() with REG_FIELD_GET()")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 7701348f0676a,f1a231dfec1e9..0000000000000
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@@ -7,10 -7,12 +7,12 @@@
  #include <linux/cleanup.h>
  #include <linux/minmax.h>
  #include <linux/slab.h>
+ #include <linux/sprintf.h>
  #include <linux/string.h>
 =20
  #include "regs/xe_sysctrl_regs.h"
  #include "xe_device.h"
+ #include "xe_log.h"
  #include "xe_mmio.h"
  #include "xe_pm.h"
  #include "xe_printk.h"
@@@ -23,41 -25,43 +25,43 @@@ struct xe_sysctrl_mailbox_msg_hdr=20
  };
 =20
  #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
- 	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, (hdr)->data)
+ 	REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, (hdr)->data)
 =20
  #define XE_SYSCTRL_HDR_COMMAND(hdr) \
- 	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, (hdr)->data)
+ 	REG_FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, (hdr)->data)
 =20
  #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
- 	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, (hdr)->data)
+ 	REG_FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, (hdr)->data)
 =20
  #define XE_SYSCTRL_HDR_RESULT(hdr) \
- 	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
+ 	REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
 =20
- static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
- 				   unsigned int timeout_ms)
+ static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
+ 				  unsigned int timeout_ms, u32 *out_val)
  {
- 	int ret;
-=20
- 	ret =3D xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
- 				 timeout_ms * 1000, NULL, false);
-=20
- 	return ret =3D=3D 0;
+ 	return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
+ 				  timeout_ms * 1000, out_val, false);
  }
 =20
- static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
- 				 unsigned int timeout_ms)
+ static int sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
+ 				unsigned int timeout_ms, u32 *out_val)
  {
- 	int ret;
-=20
- 	ret =3D xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
- 			     timeout_ms * 1000, NULL, false);
-=20
- 	return ret =3D=3D 0;
+ 	return xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
+ 			      timeout_ms * 1000, out_val, false);
  }
 =20
- static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
- 			       size_t len)
+ static void sysctrl_mb_ctrl_desc(u32 ctrl_reg, char *buf, size_t size)
+ {
+ 	scnprintf(buf, size, "frame=3D%u/%u busy=3D%d resp=3D%d ctrl=3D%#010x",
+ 		  REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg),
+ 		  REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg),
+ 		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY),
+ 		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY_OUT),
+ 		  ctrl_reg);
+ }
+=20
+ static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
+ 				size_t len)
  {
  	static const struct xe_reg regs[] =3D {
  		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
@@@ -73,12 -77,10 +77,10 @@@
 =20
  	for (i =3D 0; i < dw; i++)
  		xe_mmio_write32(sc->mmio, regs[i], val[i]);
-=20
- 	return 0;
  }
 =20
- static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
- 			      size_t len)
+ static void sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
+ 			       size_t len)
  {
  	static const struct xe_reg regs[] =3D {
  		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
@@@ -94,8 -96,6 +96,6 @@@
  		val[i] =3D xe_mmio_read32(sc->mmio, regs[i]);
 =20
  	memcpy(frame, val, len);
-=20
- 	return 0;
  }
 =20
  static void sysctrl_clear_response(struct xe_sysctrl *sc)
@@@ -114,10 -114,7 +114,7 @@@ static int sysctrl_prepare_command(stru
 =20
  	xe_assert(xe, command <=3D SYSCTRL_HDR_COMMAND_MAX);
 =20
- 	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {
- 		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
- 		return -EINVAL;
- 	}
+ 	xe_assert(xe, data_in_len <=3D XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*=
hdr));
 =20
  	size =3D sizeof(*hdr) + data_in_len;
 =20
@@@ -126,8 -123,8 +123,8 @@@
  		return -ENOMEM;
 =20
  	hdr =3D (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
- 	hdr->data =3D FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
- 		    FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
+ 	hdr->data =3D REG_FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
+ 		    REG_FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
 =20
  	if (data_in && data_in_len)
  		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
@@@ -142,16 -139,24 +139,24 @@@ static int sysctrl_send_frames(struct x
  			       const u8 *mbox_cmd,
  			       size_t cmd_size, unsigned int timeout_ms)
  {
+ 	const struct xe_sysctrl_mailbox_msg_hdr *hdr =3D
+ 		(const struct xe_sysctrl_mailbox_msg_hdr *)mbox_cmd;
  	struct xe_device *xe =3D sc_to_xe(sc);
  	u32 ctrl_reg, total_frames, frame;
  	size_t bytes_sent, frame_size;
+ 	char ctrl_desc[48];
  	bool phase;
+ 	int ret;
 =20
  	total_frames =3D DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
 =20
- 	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
- 		xe_err(xe, "sysctrl: Mailbox busy\n");
- 		return -EBUSY;
+ 	ret =3D sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms,=
 &ctrl_reg);
+ 	if (ret) {
+ 		sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
+ 		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy %#x.%#x %s\n",
+ 			   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
+ 			   ctrl_desc);
+ 		return ret;
  	}
 =20
  	ctrl_reg =3D xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
@@@ -161,10 -166,7 +166,7 @@@
  	for (frame =3D 0; frame < total_frames; frame++) {
  		frame_size =3D min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME=
_SIZE);
 =20
- 		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
- 			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
- 			return -EIO;
- 		}
+ 		sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size);
 =20
  		ctrl_reg =3D SYSCTRL_MB_CTRL_RUN_BUSY |
  			   REG_FIELD_PREP(SYSCTRL_FRAME_CURRENT_MASK, frame) |
@@@ -174,9 -176,13 +176,13 @@@
 =20
  		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
 =20
- 		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
- 			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
- 			return -ETIMEDOUT;
+ 		ret =3D sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms=
, &ctrl_reg);
+ 		if (ret) {
+ 			sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
+ 			xe_log_err(xe, SYSCTRL, ret, "Frame acknowledgment timeout %#x.%#x %s\=
n",
+ 				   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
+ 				   ctrl_desc);
+ 			return ret;
  		}
 =20
  		bytes_sent +=3D frame_size;
@@@ -185,27 -191,30 +191,30 @@@
  	return 0;
  }
 =20
- static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
- 				 size_t frame_size, unsigned int timeout_ms,
+ static int sysctrl_process_frame(struct xe_sysctrl *sc,
+ 				 const struct xe_sysctrl_mailbox_msg_hdr *req,
+ 				 void *out, size_t frame_size, unsigned int timeout_ms,
  				 bool *done)
  {
  	u32 curr_frame, total_frames, ctrl_reg;
  	struct xe_device *xe =3D sc_to_xe(sc);
+ 	char ctrl_desc[48];
  	int ret;
 =20
- 	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms))=
 {
- 		xe_err(xe, "sysctrl: Response frame timeout\n");
- 		return -ETIMEDOUT;
+ 	ret =3D sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_m=
s, &ctrl_reg);
+ 	if (ret) {
+ 		sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
+ 		xe_log_err(xe, SYSCTRL, ret, "Response frame timeout %#x.%#x %s\n",
+ 			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req),
+ 			   ctrl_desc);
+ 		return ret;
  	}
 =20
  	ctrl_reg =3D xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
- 	total_frames =3D FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
- 	curr_frame =3D FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
-=20
- 	ret =3D sysctrl_read_frame(sc, out, frame_size);
- 	if (ret)
- 		return ret;
+ 	total_frames =3D REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
+ 	curr_frame =3D REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
 =20
+ 	sysctrl_read_frame(sc, out, frame_size);
  	sysctrl_clear_response(sc);
 =20
  	if (curr_frame =3D=3D total_frames)
@@@ -235,7 -244,7 +244,7 @@@ static int sysctrl_receive_frames(struc
  	while (!done && remain) {
  		frame_size =3D min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);
 =20
- 		ret =3D sysctrl_process_frame(sc, out, frame_size, timeout_ms,
+ 		ret =3D sysctrl_process_frame(sc, req, out, frame_size, timeout_ms,
  					    &done);
  		if (ret)
  			return ret;
@@@ -249,13 -258,16 +258,16 @@@
  	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
  	    XE_SYSCTRL_HDR_GROUP_ID(hdr) !=3D XE_SYSCTRL_HDR_GROUP_ID(req) ||
  	    XE_SYSCTRL_HDR_COMMAND(hdr) !=3D XE_SYSCTRL_HDR_COMMAND(req)) {
- 		xe_err(xe, "sysctrl: Response header mismatch\n");
+ 		xe_log_err(xe, SYSCTRL, -EPROTO,
+ 			   "Response header mismatch: %#x !=3D %#x\n",
+ 			   hdr->data, req->data);
  		return -EPROTO;
  	}
 =20
  	if (XE_SYSCTRL_HDR_RESULT(hdr) !=3D 0) {
- 		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
- 		       XE_SYSCTRL_HDR_RESULT(hdr));
+ 		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x %#x.%#x\n",
+ 			   XE_SYSCTRL_HDR_RESULT(hdr),
+ 			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req));
  		return -EIO;
  	}
 =20
@@@ -311,8 -323,8 +323,8 @@@ void xe_sysctrl_create_command(struct x
  {
  	struct xe_sysctrl_app_msg_hdr header =3D {0};
 =20
- 	header.data =3D FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
- 		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
+ 	header.data =3D REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
+ 		      REG_FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
 =20
  	command->header =3D header;
  	command->data_in =3D request;
@@@ -372,7 -384,8 +384,8 @@@ int xe_sysctrl_send_command(struct xe_s
  				      cmd->data_in, cmd->data_in_len,
  				      &mbox_cmd, &cmd_size);
  	if (ret) {
- 		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
+ 		xe_log_err(xe, SYSCTRL, ret, "Failed to prepare command %#x.%#x\n",
+ 			   group_id, command_code);
  		return ret;
  	}
 =20
@@@ -382,7 -395,8 +395,8 @@@
  				   cmd->data_out, cmd->data_out_len, rdata_len,
  				   timeout_ms);
  	if (ret)
- 		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
+ 		xe_log_err(xe, SYSCTRL, ret, "Mailbox command failed to send %#x.%#x\n",
+ 			   group_id, command_code);
 =20
  	kfree(mbox_cmd);
 =20

--wrOCqjPkB3acowie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrND7gACgkQJNaLcl1U
h9BJQQf/ZPOmctviete1k6bqOsSw5dfjIj94SjLLh8y9jaoqgt2X/aevxHAIrKTS
df3Zs5FoL/1MG0GHj0U2sG0ZnwVTwCF5EN6zC0Q3WxmVGVzyhGoY0j8KIh24CPur
4EA2SYrfAyz3qkKP7L5f/fMiBdrPl+JJjKCKfDaBz2Le8P6ukX5U1vik4fbMxviZ
pBMUFC/c/Ym1fT8sfjgMTCYsazpnw5YpjiubSZTvI6LwjN+LvnY4D0Czikd2Lv5r
mkeK8Dr/57HRDiPnRRN+jHFO6z4AXSGDZcikJqOHfNlcb2uwKwmWKKRzv/lWupiS
33TZ2Aru4yOZSjj0PyaBT7w61UBznQ==
=Q1R8
-----END PGP SIGNATURE-----

--wrOCqjPkB3acowie--
