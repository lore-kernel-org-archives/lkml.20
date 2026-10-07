Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2883DAABD
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791398026; cv=none; b=YFv2IiEHqrYgye7Q4Z8ShMm6ErH5N4SVqxcxjTyfTSXzRz6C0EJGsV2NIqov6NUDIu+nLhnW1fJot7aU/XSGu7/QkhpezLkMAsVF8sAVNlXXhRgh6MDWo42BWV1rh/ytI8mQTJkHaX9Xc7CYa44K4u6xHnc8HJBt7PLJ/OiWD9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791398026; c=relaxed/simple;
	bh=VZb+WC/Fd3ofksGUyrfR6oLxX0zLZ9X6xa68XA5pzDY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=stTvbwIw2RamQE4i2jyAj34LxOrjfu/sCNqEUuQ/6u64lR/L5AM+7E/IRQQ+4EawXmNJbLM2s7ohM1nVmXU5eXjKjcONw4AVk1ElmEvN/ir9f7yWDpfyKdqAp2fFMVTxhYSmKs6c9SKFB+jJQ6XUbjFwSYZfB8cyuWMe1u81GxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=fs/gdLJQ; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="fs/gdLJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1791398021; x=1791657221;
	bh=VZb+WC/Fd3ofksGUyrfR6oLxX0zLZ9X6xa68XA5pzDY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fs/gdLJQ5SuO8ISCgDbLbBTPtN1IhOp5mzz4ieW5AjC5vBHDcEu6YbJ/urR8QwSK9
	 2qwuBXlhVPVV1mzH1YQTv4vffD7iAGza52FhRmsx9r8/XJJOpFfnFARtMxjwynWZ2K
	 UJ/FUC8rGew2LRondIAbj+xkJdnXNIbbN9b62HAJBGni5k6hyiAbx95as8ev42Czf7
	 isrWWOGs5G+yP5eZQjwtcmUc9VfvTcETc0OnHKzxn+feXl3Nkub8/hrJzQ3I1+OQ3G
	 GHPoAL324uNfgRHZphqKD+gvJmKm+Zw/tMUeK+IM+WI1a1UdkDXEJTwkYZmNSc9JBu
	 Hjdw7wxL30HWA==
Date: Wed, 07 Oct 2026 18:33:34 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Bingbu Cao <bingbu.cao@amd.com>, Antti Laakso <antti.laakso@linux.intel.com>, German Pablo Lindo <germanpapulindez@gmail.com>, Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging/ipu7: snoop ISYS writes to capture buffers
Message-ID: <20261007183311.24637-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: b6d0aae312015e538990f4e9a1e3a888ecc16031
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The driver sets is_snoop =3D 0 on the ISYS output pin, so the ISYS writes
capture buffers without snooping the CPU caches. vb2 syncs each buffer
for the CPU, but on x86 the DMA API takes the device to be coherent and
that sync does nothing. A CPU that read a buffer before then reads cache
lines of that buffer's earlier frame, which show as horizontal streaks
wherever the scene moves.

Set is_snoop on the capture pin, not only for metadata as the TODO had
it: the CPU reads pixel data too. IPU6 sets snoopable on its pins.

Tested on a Surface Pro 11 (Lunar Lake IPU7), reading every frame with
the CPU. With a VD55G0 at 644x604 and 320x240 in 8-bit mono, frames
holding rows of the buffer's previous fill went from 301 of 698 and 684
of 697 to none. With an OV13858 in raw at 4224x3136, about 790 MB/s, 300
frames came at 29.95 fps without a gap either way.

Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device dri=
ver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
Tested with the bit as a module parameter, both values in one boot, on
this driver plus Ruslan Koreev's monochrome formats [1], which the
VD55G0 needs. No row ever equalled the same row of the frame before it.
A clflush of each buffer before reading, later than any buf_finish could
run, still left 61 and 24 such rows of 101352 and 46389 (another boot);
with is_snoop set, none. At 4224x3136 no row was stale even without
snoop: four 26 MB buffers do not stay in the cache. Not tested on IPU 7.5.

The ipu6 driver's IPU7 path, drivers/media/pci/intel/ipu6/ipu7-fw-isys.c,
also used for IPU8, memsets the pin and leaves is_snoop at 0 too.
Released kernels drive IPU7 only with this driver, hence the stable tag.
I can send the same change for the ipu6 path, untested here.

[1] https://lore.kernel.org/linux-media/20260924171820.1179823-5-koreev.r@g=
mail.com/

 drivers/staging/media/ipu7/ipu7-isys-video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging=
/media/ipu7/ipu7-isys-video.c
index 8c6730833f2..13968caf64d 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -407,8 +407,7 @@ static int ipu7_isys_fw_pin_cfg(struct ipu7_isys_video =
*av,
 =09output_pin->link.pbk_slot_id =3D IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE;
 =09output_pin->link.dest =3D IPU_INSYS_OUTPUT_LINK_DEST_MEM;
 =09output_pin->link.use_sw_managed =3D 1;
-=09/* TODO: set the snoop bit for metadata capture */
-=09output_pin->link.is_snoop =3D 0;
+=09output_pin->link.is_snoop =3D 1;
=20
 =09/* output pin crop */
 =09output_pin->crop.line_top =3D 0;
--=20
2.54.0


