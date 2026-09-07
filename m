Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0B539A079;
	Mon,  7 Sep 2026 19:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809699; cv=pass; b=HOcnTnqMKcQ0pkKBiEu6alrANCfoAicIKazjNljlBxKYx0F82LHAckj8mvk+2Xp0M4HydmMErN0JtwI7R43Lnue1dgYTtFA7LNEA74L8zYL9HylgqN5LTInZZSUZd+G+3LE+P+ScApA54NBZGXP1FnEd9XepYnr83is2/9GgaxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809699; c=relaxed/simple;
	bh=c+hOWorUBnKmPyDnXxILchG1lRF/nzLtcxnTP8ghlqM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uBY/lxtK+TiVriZKNqWuMY0cCo1C/Dy8XnzpSWM7y8gbvJTiPXe0/CCyfaDrWLN8nla9OX6oEqjXoJGYIK0Wl6JAwHEbWDU7bHdc5mrYSN8BDXktL0IXhDwAp4BfXSaoIfoeaw+huW4eoF4pp+h6KL+UaJZN6IFSI2dspYxZOEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=qf99WxMO; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="qf99WxMO"
ARC-Seal: i=1; a=rsa-sha256; t=1788809694; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DytA/dUg2QjKCVlM2tVYME71fjSOiN8DaWIgrsVKBoA/pR5NtHjhf7+pnoEfbLaR2m8YdM0rHHqMySwvDkN7dglSR9slijTOUh2sz+s6UBvQiEEbl2Jh4mOnzDQ0SFrFQZ+KAy2ik/tvd4nv+kgPs7HIMHP4ZDyw1rw90tSH/uw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788809694; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i+D0vcKKwbN1XgiTByp7BXFM0NG02KTrbEnLhn+7BW4=; 
	b=n7kiq7pDxj99iIkn4FrrXup/55ghqIzp5KT0CZGZZpJASZ30HZj4G7AACS9TYDH5z3wmlxh/sxXw8sK83xIzYOEQzTwvcLZYGEpMhCWrAAF3xSqha2CkisWWZBvedGKlm4iL1ixZKQv1ftfp1rzYJerLaL11e6Wf+zbGumLEwYI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788809694;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=i+D0vcKKwbN1XgiTByp7BXFM0NG02KTrbEnLhn+7BW4=;
	b=qf99WxMOFp9VxQcRAMQ8yww5FdhRLaicIgkNrm4MHq0L+ZcdaTlOGOn0nzIui31m
	XOWSz3YWup33HfbYhfnjlau0RrzvbdcVX4CUwnNgvmzoyZkQzV7vcqC8RAu3ThvjZ07
	lMHQnU8oZcWVb2CXd2OrJ3tHoHeIrR/BZkPcnRthzZhmui5w5fe5QQovBvNDgzxiRwt
	P9LsP6bNhKYPARol6QbBWFSicUBiKmOCG+LUBCEdUlXBXtX51iYlwLTguVwcxkED37+
	qSFSlhwwXDem7ydJA+xrAmr0EJ3YUwicQcaKbmjEioC8m9ciKOSHSHM9honQlKAhBhd
	5P1zq+m+5Q==
Received: by mx.zohomail.com with SMTPS id 1788809691320810.9730316643594;
	Mon, 7 Sep 2026 12:34:51 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH 0/2] ALSA: usb-audio: Add quirks for HP Elite x3 Lap Dock
Date: Tue, 08 Sep 2026 03:34:38 +0800
Message-Id: <20260908-uac-hp-elite-x3-lap-dock-v1-0-e226cfe4038e@rong.moe>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMPQ6DMAxA4asgz3gIPyrpVRBDcJziFkGUBISEu
 DtpO37DeydEDsIRnsUJgXeJsi4ZqiyAJrO8GMVmQ/OwSnedxc0QTh55lsR41Dgbj3alD7baUVO
 NTiuqIOc+sJPjt+6Hv+M2vpnS9wfXdQMb3crKfAAAAA==
X-Change-ID: 47d1988d-uac-hp-elite-x3-lap-dock-59fc42bf91c2
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

The HP Elite x3 Lap Dock is a laptop-like external display device with a
FHD screen, a keyboard, and a MT touchpad. It can be connected via USB-C
or Miracast. As an e-waste collector, I recently brought one for 69 CNY
(10.2 USD). The price already indicates how broken the device's design
and compatibility are ;-P

When connecting via USB-C, the video source is, of course, DisplayPort
Alternate Mode. However, the audio source has nothing to do with the
DisplayPort signal and is actually from a builtin UAC device.

The builtin UAC device provides three Alternate Settings:

- 1:1 - Capture, S16_LE, 8000/32000/44100/48000Hz
- 2:1 - Playback, S16_LE, 48000Hz
- 2:2 - Playback, S24_3LE, 48000Hz

Unfortunately, the last one is broken because:

- it doesn't accept SET_CUR(SAMPLE_RATE). QUIRK_FLAG_FIXED_RATE works
  around it, however...
- it constantly produces severe harmonic distortion once the capture
  stream is also opened. The interface 2 must be closed and reopened to
  make it recover. IOW, simply closing the capture stream makes no
  difference.

Considering that S24_3LE offers no additional benefit on small speakers
compared to S16_LE, and 2:1 is always usable as an alternative, skip 2:2
to get rid of the trouble.

Setting chip->setup to any non-default value disables the fixup and
reenables 2:2 (in this case QUIRK_FLAG_FIXED_RATE is required).

Quirky device sample:

  usb 7-1.4: new full-speed USB device number 50 using xhci_hcd
  usb 7-1.4: New USB device found, idVendor=03f0, idProduct=0c56, bcdDevice= 0.00
  usb 7-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
  usb 7-1.4: Product: HP Elite x3 Lap Dock
  usb 7-1.4: Manufacturer: HP
  usb 7-1.4: Found last interface = 0
  usb 7-1.4: 1:1: add audio endpoint 0x81
  usb 7-1.4: Creating new data endpoint #81
  usb 7-1.4: 1:1 Set sample rate 48000, clock 0
  usb 7-1.4: 2:1: add audio endpoint 0x1
  usb 7-1.4: Creating new data endpoint #1
  usb 7-1.4: 2:1 Set sample rate 48000, clock 0
  usb 7-1.4: 2:2: add audio endpoint 0x1
  usb 7-1.4: 2:2 Set sample rate 48000, clock 0
  usb 7-1.4: 2:2: cannot set freq 48000 to ep 0x1
  usb 7-1.4: [9] FU [Sidetone Playback Switch] ch = 1, val = 0/1/1
  usb 7-1.4: cannot set ctl value: req = 0x4, wValue = 0x200, wIndex = 0x900, type = 4, data = 0x40/0x0
  usb 7-1.4: [9] FU [Sidetone Playback Volume] ch = 1, val = -17664/0/128
  usb 7-1.4: [2] FU [Headset Playback Switch] ch = 1, val = 0/1/1
  usb 7-1.4: [2] FU [Headset Playback Volume] ch = 2, val = -18944/0/1
  usb 7-1.4: [6] FU [Headset Capture Switch] ch = 1, val = 0/1/1
  usb 7-1.4: [6] FU [Headset Capture Volume] ch = 2, val = -18944/0/1
  input: HP HP Elite x3 Lap Dock Consumer Control as /devices/pci0000:00/0000:00:08.3/0000:c9:00.4/usb7/7-1/7-1.4/7-1.4:1.3/0003:03F0:0C56.0033/input/input129
  input: HP HP Elite x3 Lap Dock as /devices/pci0000:00/0000:00:08.3/0000:c9:00.4/usb7/7-1/7-1.4/7-1.4:1.3/0003:03F0:0C56.0033/input/input130
  hid-generic 0003:03F0:0C56.0033: input,hiddev100,hidraw8: USB HID v1.11 Device [HP HP Elite x3 Lap Dock] on usb-0000:c9:00.4-1.4/input3

Signed-off-by: Rong Zhang <i@rong.moe>
---
Rong Zhang (2):
      ALSA: usb-audio: Convert snd_usb_apply_interface_quirk() into a switch statement
      ALSA: usb-audio: Add quirks for HP Elite x3 Lap Dock

 sound/usb/quirks.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 6 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 47d1988d-uac-hp-elite-x3-lap-dock-59fc42bf91c2

Thanks,
Rong

