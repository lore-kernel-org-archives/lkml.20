Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2F249481D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467326; cv=none; b=g45hvfIzhj5aG1TPVGiUZsmdfZK39N/edi72hniiXImThAFKLn9mY7yrHYlmVjaB9oV8KomgMxVxBZi/0k/NXvgYPwaJ//IW/6x6yMR0SNcuLk/1TI77nqkrYaUgojKkxPw4kG3MAihj4nekyAXXNzTx7o7VWGjxFKr1F9BQmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467326; c=relaxed/simple;
	bh=2UxpNr/2pP0DWDqhC1pdLYFFL3Tj9yhNw46ZAN7ArFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U33H14nP34txybsMmVqsC1Hb7Tn8NwTU4ltM3l6Cv8vaNPS20dB8hLKwUVBT0sRSyJIE6vXOzZDLn/0BBLCavaj5ErcNmd09+26eeV/kwEiU/5mXJ/uFMHiTQI9cW1KkC11y49MzSvVeUEnGIPBqhYEkFzFo8z7PUHEmHc5oiH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuGSMazc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuGSMazc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so4425775e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467313; x=1789072113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOg+jzCmqHA0fYoQjs1lTnbgd5UBpBc094boHLbKxSc=;
        b=RuGSMazcAycZDZqrADzXBkq7diUMb9UVgnMwg5pUcBuDnwtc6wUzQXhfCmX8vKBByK
         Q5iAQg2P52qjzaZjBZSVZ+dOsQ2EZbfr3az3WXZ6P/1Q/NwXOrW8GZCV8b7oQCBM1kl7
         r1TkXYf/G34sBD4yK4wzjuvcLsFachm95ohZxBQMVcmRilAoXSEf3E9LcDwtZSKyWjCJ
         ALkGHLOP0dtZmDRTdtc3lkSSTEwEvhpeDPT7MYu3/zIlDYf4QDPJpo80E1dupBvuLBkh
         XOu/xmWA3AYHEfw+DZXfnQ6Qkg1Qxqozfv6vsv5F+VnRS6I0sFN8C5lYSGRFp9M8MJgN
         Ms+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467313; x=1789072113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOg+jzCmqHA0fYoQjs1lTnbgd5UBpBc094boHLbKxSc=;
        b=km0HNWypKF29OcRamp06UznMRJg7fnz8+p6wC3YW5ci+W71e1wU/SJ+MD15AKB1Jlq
         qnxM1lBKTtoL68EGTx5k0/k/UpEKrUNANq6An3GTo9NVu8Y5zlhiQqFJGhg+ED2yZE27
         GFF1GuipfsMvqAn0vHceUpDS2l5eWEA+hi0m/iwEbyC81eXDB5E80pmjKaszAacpJWwg
         ba1nV9Jmbx/JryZISPZQLP75vx8QPszSUbEhiRaS+aZSIIqNXwEGR+hhwHQqbqcfzuSi
         +xGO3qndY0CojQV2+I8yH1NnWdgMjNOcIlFALLtkfj3iodi5fV1MnWBwgh15DuE31CN6
         u8EA==
X-Forwarded-Encrypted: i=1; AKwUvBwfPZyaiInu83knAvJb79BinVoimhhPDaKap5Gkv3zVUuFpdHzRfTbljIUCrc61cf3o8hBsXvF1zzdYbsg=@vger.kernel.org
X-Gm-Message-State: AFuF++nzVb4FbtkwDXUT80nIe/MGJsYJthNgn1aH7vF4gCHWXlVF5uiF
	m/uQYf5XZpV0yqUXNPMEflWIXRmPy9WfPBIOkHEUm1uVzAhhNpPcyn7x
X-Gm-Gg: AYBFou1y44tYBDrtrRL/J4MtIcGL9JxyLXUDpOEdKWicjt5GLL1d0a4MVkT+tvTsuzw
	4zls+ac2LcetYmGffAVINjyMY7LbcbajsgS3j+bjX2/djWKodWBMAgpiwe9QPOAQiG6SIV2qDwq
	gd/5RKwzmg7VmG8FiLwQMMKdd1DXjqDVod1Tj9t/ZwuIabAexFGacB6lR7SPElsabteixJtk4xi
	eNqEaG8aKLujuptnFhq/LGdi6Fv4LYmTp7lON4FHOuZx8S7Y0uPrHpXRLmkUupORPcoWYC4l1wB
	7G1ZBfOKi1BPzFztBOSau6Xnc8A1hfunU60Tjm4QWdw/h6UYpebSoE2byQ8A4d0yP1WLvy+axWa
	Rih9NSqwxKSUBtf6kEhakSzJHwEyxKKuGteBuiaimDt+iflSnF4iC2CCG4bkyEptLrPcXHgOXC4
	cXjBufch0f5/TUB0/awtgJaLsXJQcuOHPkIqdVjI5np/fbjKJVjEsbsiTDTdO9MFThH/8ClkKTg
	N3jLQTOBeVpiW+GeLo3OSVJDNWWfL71a9N3blFkzljk+8r9Km8OHfqIkZfMSE3iiXnhYw6vrDw3
	uqTGMHQ6qer8z4MbEy0FTgaVXHhmOUWl1B4Feww8fZR/DUXoRq1K7GQpuDJanxiJni1T2g6X+UC
	NoT0FaJdPgErrrgjkVuJFBlj9xtCVA2q/Yh8TsTR5
X-Received: by 2002:a05:600c:4515:b0:49a:252d:52f5 with SMTP id 5b1f17b1804b1-49cf8241ab8mr8359085e9.11.1788467313321;
        Thu, 03 Sep 2026 13:28:33 -0700 (PDT)
Received: from localhost.localdomain (host-213-45-168-79.retail.telecomitalia.it. [213.45.168.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm10317825e9.6.2026.09.03.13.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:28:32 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: Nicola Fiorillo <nicfio@gmail.com>,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: Two oopses and a hang when unbinding a streaming sensor
Date: Thu,  3 Sep 2026 22:28:10 +0200
Message-ID: <20260903202820.8401-1-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812105305.32447-1-nicfio@gmail.com>
References: <20260812105305.32447-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A note on how this series meets the IPU7 work, since the two touch the
same lines.

The series still applies to v7.3-rc1 unchanged: none of the three files it
touches has changed in mainline since it was posted.

It does not apply to the ipu6 branch of the media tree. "media: ipu6:
Split ipu6 csi2 stream enable/disable" reworks both
ipu6_isys_csi2_enable_streams() and ipu6_isys_csi2_disable_streams(),
which is what patch 1/3 changes. The rework is a refactor and leaves the
bug in place: in the new code remote_pad is still dereferenced without
being checked in both functions, so unbinding a sensor mid capture oopses
there as well.

Patch 1/3 rewritten on top of 6f6d9729301f is below, in case that is the
more convenient base. I am happy to resend the series against whichever
tree you prefer -- please just say which. Patches 2/3 and 3/3 are not
affected either way: subdev_open() is unchanged in mainline, and
isys_async_ops still has no .unbind() in the ipu6 branch either.

Thanks,
Nicola

-- >8 --
From: Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH] media: ipu6: Check the remote pad before dereferencing it

Unbinding a sensor driver while a capture is running oopses the kernel:

  BUG: kernel NULL pointer dereference, address: 0000000000000020
  RIP: 0010:ipu6_isys_csi2_disable_streams+0x3c/0x70 [intel_ipu6_isys]
  Call Trace:
   v4l2_subdev_disable_streams+0x1b7/0x370 [videodev]
   ipu6_isys_video_set_streaming+0x20f/0x930 [intel_ipu6_isys]
   stop_streaming+0x102/0x110 [intel_ipu6_isys]
   __vb2_queue_cancel+0x2a/0x2d0 [videobuf2_common]
   vb2_core_queue_release+0x22/0x80 [videobuf2_common]
   _vb2_fop_release+0x58/0xb0 [videobuf2_v4l2]
   v4l2_release+0xbd/0xd0 [videodev]
   __fput+0xde/0x2a0

media_pad_remote_pad_first() returns NULL once the sensor is gone and the
link with it, but both the enable and the disable path dereference the
result unconditionally. The faulting address is the offset of the entity
member in struct media_pad.

Check it. On enable there is nothing to stream from, so refuse with
-ENOLINK. On disable the receiver still has to be stopped, so stop it and
skip only the call towards the sensor that is no longer there.

Reproduced on a CHUWI Hi10 X1 (Alder Lake-N, IPU6) running 6.12.86, with
the CSI-2 port of a sensor being unbound mid capture.

Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
Based on 6f6d9729301f ("media: ipu6: Enable support for IPU 7 and IPU 7.5").
Not build tested: the machine that reproduced the oops has no kernel tree
available at the moment, and the IPU7 paths cannot be exercised here in any
case. The change adds no new identifiers and no new call sites; it is the
same fix already tested on IPU6 with the mainline version of the patch.

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 160eace..1ad0a6a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -447,6 +447,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	int ret;
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	if (!remote_pad)
+		return -ENOLINK;
+
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
 	sink_streams =
@@ -486,14 +489,21 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
 
-	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-
 	if IS_IPU7(isp)
 		ipu7_isys_csi2_stream_disable(csi2);
 	else
 		ipu6_isys_csi2_stream_disable(csi2);
 
+	/*
+	 * The link is gone if the sensor driver was unbound while streaming.
+	 * Stop the receiver anyway, there is just no one left to tell.
+	 */
+	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	if (!remote_pad)
+		return 0;
+
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
 	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
 
 	return 0;
-- 
2.47.3

