Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039103;
	b=e+Zn+vJ+vBqsS9BK64nR6+e/TYLg3euAyaxJeWExmuL11LPdsKNol/KHcCDDqP/uHVT9
	 PV63X0MmoRGNwqYOvD30Ra5oD3hFt42kQnyHdCBWL3DvLWmdHDbI0DOdv0iF01PfL9dvK
	 Igmzc3wda7OKQiT0b+/TkzHgBC8r/jgCYm92lURCua/MVN+uq7ejeyDpSraTa56be3cFb
	 mP3A4iuO5xg5ELFCQQwEqUqrStPPoasoR0v5YbC6RzssgkxqoiGonfCK6l+8VSTS1zORw
	 rddQZMWukff8BlUm7s/Qlss+IWO/If+P1RtFN8A4kymrQ0CFRCSgqxXt9ubuXBHUwlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ldW6tZ8xBpJBMNj1dRoOXwyCb4wkPg2+QnJ0KDwYhwI=;
	b=lZBkXofD52mfsgiRkdrYm8fK8DiSmUq5zVOX6g8HZfLGrGx6jEGmtm8pYL5iQijM84yk
	 Gfxded/NBAYe3WSoL74HpDhDzxbB9eSEMvoFROWjRztHAgZPT46WaP3DKbEjyeME04xWR
	 d90wveB/o+pxP1ql17qk+qFiYGEk47st6Iq1BVa4QLvy3IjWBQo018uIN8Cm0ddvm7xKl
	 ORG28HzKbhsYJP7Xf9UKm85Dx17pMoHsor78s/+UrnqA8Ga0+0FsJoxp6HPzSuE7EZ5jO
	 DWEYYimHFk4/RYiO38kU/XdfnIkgksdKzGfV2xPuFxn3QSHwp6jAjYTOLAAcl6jVEdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZLS4k9Vg;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA163606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA163606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZLS4k9Vg
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a7a5bcd929so586905e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039101; x=1793643901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldW6tZ8xBpJBMNj1dRoOXwyCb4wkPg2+QnJ0KDwYhwI=;
        b=ZLS4k9VgrtTglxmBEljcUMl5SSyzVAOm1lx0OqPSZ/DTur8sa5dCc0lketaA7W2KqN
         4wHhEXiDgH3soei8xsk6cfZhAasafmJGP4qla2SqGp0Wy3Y8HUelU6/+eVoVXKtcUVeN
         QDGdyOYMsMJ04FfIXiH5tXb0SmGUY0Xwx1lumXGy/nZCrIBDuSatoKMlzhrK7nzLuC2t
         Xn32akFfuCfohOzn4UVc8OCkSeCP8g3anah3heNhD441Ii53kRo5W4uMgD5JLVtijC4Z
         md2KFISxbGwLzWXI0DJEcHuYddVoBlToe9GNdIAB/a3lB5PHUK9r5SaUq7tEekE0mUSr
         kMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039101; x=1793643901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldW6tZ8xBpJBMNj1dRoOXwyCb4wkPg2+QnJ0KDwYhwI=;
        b=xp8DQ/2vtf0DPcdTa8br9He+2Jjoh+ElFYKn/nuXywALZMYFiLt7X4g1ogphbGz96e
         fCRDdvNcLT6Jy/tLlZDl1Um2F5Z3Gj2bdd8Jxrt23+MkUf1IumEWEDs/df1Z40V5/vAR
         ODFzQCxNUFf6yQZ5lG2Y5vU6rXRo9+9pnX/PO42TO4D3XY/7cNGyi91z8WqP3e3yHP0w
         MgDIrJs2T+tJQDEI3FBo3by4vOqixzd1I2MU1ptxYEZbf3zjVO9yYp4rvkjzWLgcKmxT
         lkBu050QUiMBn77rCYHmdTI3QI237hF87nJ886qN6//UjhECs4r1wRttRJ7Mf0rCixCW
         MXMA==
X-Forwarded-Encrypted: i=1; AKwUvBxaTW03NgnbcAFTBbHF90qLzDUZLZ2Oh7YZjehd85wv6/xQYlQTchTZc+jx77wW3/MPyNFREyYnm3v9bos=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy4Tgq9OsaWL4I7AdBG3T30nCDCxW0fsCIin1ZPTIxq43uuY0X
	+4HkKYqo0fiISpMcuTQDNWjTP7LWe4PDX+SbHOA/KQ7brMfdoMXVu13s
X-Gm-Gg: AYBFou0OJDlFKicAvCdl5GZp7VcKio6rKbVMvzKacjRF9Yy8qOPb5Nkz2QTXEdY1EE+
	Sj2KAiZcLhsPkM0hBS3YHIHil4n8sTMsiwpIZZbrwPnRO3AuY5t+0C1J1fS5/Vgi2GbrEYHjY1Z
	5f4O2TX8RHdsx+ptDFAHyGkwoFPxm0EUe/bcaiz/T48TbZG7Hq1IKxSDrthjM1Z0xd7o7Ue9F+F
	0fDQ1W3C0SPW2rrP2ajjgxUd+6ahhPaUo+Qp6exaqBsi/rHd4kbxoYBNdUYOmw+FaAf54GnbgXw
	QZBbeDp5DCY/KI1YexCRcKLRsh7KsyortdssX8UXWIsk+vlFMSC41pBsItY4Q52Bz8QPUAuspmq
	FFKb7oMvUp1MsUlAn6PVMXg5CCoAgpULfieBYbSATEjIGaH98Ky9X80ZSXv5CtqW37xOqfZhtSH
	U6BEsxGG/DOXqVY444uXPpU/kmkFgr13rEsMEKwfynXezTOnqybjvmDdIb5RYmq37fPLsuqHKbt
	ojrjkWF7PUudTjCLSAw+Er5zsjeNELJ4KHjF1ZVVjSiI4EoArOtdbgHhPhbzw==
X-Received: by 2002:a05:600d:b:b0:4a1:e774:370d with SMTP id 5b1f17b1804b1-4a35ac759b3mr126869795e9.1.1793039101022;
        Mon, 26 Oct 2026 11:25:01 -0700 (PDT)
Received: from Termis-ROG-FLOW-Z13 ([2a09:bac5:521a:254b::3b7:76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm211673245e9.2.2026.10.26.11.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:25:00 -0700 (PDT)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [PATCH 0/2] media: amd: isp4: two fixes found on the ROG Flow Z13
Date: Mon, 26 Oct 2026 21:24:40 +0300
Message-ID: <20261026182442.229869-1-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are two small fixes for the AMD ISP4 capture driver. I found
them while bringing up the OV13B10 rear camera of the ASUS ROG Flow Z13
(GZ302EA, ACPI ID OMNI13B1), which is discussed in [1]. Both fixes are
independent of that sensor and apply to the driver as merged.

Patch 1 holds buf_list_lock while start_streaming hands the queued
buffers to the firmware. The firmware response thread can remove
completed buffers from the same list during that walk; I hit the
resulting list corruption as an oops.

Patch 2 makes completed buffers report V4L2_FIELD_NONE instead of
V4L2_FIELD_ANY, which v4l2-compliance rejects.

The two patches are independent of each other and apply in any order.

Testing: the GZ302 camera is not supported upstream, so I applied the
patches to an out-of-tree build of this driver that streams on that
machine (NV12 1920x1080, about 30 fps). The stock linux-firmware image
does not start this sensor; on my machine the camera runs with ISP
firmware and sensor setup data from my own Windows driver
installation, read from the Windows partition of that machine. I do
not redistribute any of it.
- 6 stream starts with patch 1 alone and 6 with both patches (each
  time 5 captures of 90 frames plus the v4l2-compliance run); no oops,
  hung task or WARN.
- With both patches, s2idle suspend and hibernation with the camera
  idle: capture works before and after.
- v4l2-compliance -s: 52 of 58 without the patches, the same 52 with
  patch 1, 53 with both.
- W=1 build (clang) on media-committers next. Not run: lockdep,
  sparse, smatch.

Known issues, not addressed by this series:
- The remaining 5 v4l2-compliance failures all stop at
  v4l2-test-buffers.cpp:1651: CREATE_BUFS with half the sizeimage after
  REQBUFS is expected to fail with EINVAL and does not. A likely cause,
  not yet confirmed: isp4vid_qops_queue_setup() writes the requested
  size back into isp_vdev->format.sizeimage, so a larger CREATE_BUFS
  earlier in the test raises the size that later requests are checked
  against.
- A stream does not survive system sleep. Start a stream, then
  "rtcwake -m mem -s 20": after resume no further frame arrives, and
  stopping the stream logs "fail to disable stream" and "fail to stop
  stream". The same happens without these patches; the driver has no
  system-sleep callbacks. On the GZ302 the command timeouts return; the
  stop-path hang reported in [1] may be related. This should be
  reproducible on the HP ZBook Ultra G1a, and I can test a fix on the
  GZ302.
- Hibernating while a stream is running hung the GZ302 once, during
  hibernation, and needed a forced power-off. That run used both
  patches and I did not repeat it without them, so I cannot say yet
  whether it predates them; neither patch touches the sleep path.

AI use: Claude (Claude Code) helped me analyse the code, write the
changes and the changelogs, and run the checks. I reviewed the patches
and ran the hardware tests.

[1] https://lore.kernel.org/all/lWYl1YJwDSh-q2Ew2f8b0BweQ4V-SUnPMSMurU5gT1LkqVdrmWFunj0sSgjC7m66bORBAD_jRCFTt1_ZOkotOMukY46rI4ayYbIfPQq4E9U=@proton.me/

Seifelden Abdelmonem (2):
  media: amd: isp4: hold buf_list_lock while sending buffers at stream
    start
  media: amd: isp4: return capture buffers with V4L2_FIELD_NONE

 drivers/media/platform/amd/isp4/isp4_video.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.56.0

