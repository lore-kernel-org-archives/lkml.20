Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842357;
	b=h8mif8PRiY8P5lQqx2YjnJfAKAtDYNyaj5e2vLoEjdN/PdfxA2+0OjYQ6Nspqwrptfv9
	 O1N4qso/erUaaHl/ykG5ldQmU8fIHwCF/phpmw8D14AcAkWXgA3eiIVb4Y8eQqS599yhA
	 aDQri8XPmfJkVahOtfTsdDxOmz424dcl+RJTVLSx6TXuJqWJ46UTXpIvIpgLe1stenBIX
	 yhTwXi+/W+R51S1kSh/3hOTh/9WosizkNFykzZ7E/vwhRHJC9OUvRSYkCKyecqZROFzAS
	 3jd921ouTtLOuh9ine4N3ZHVpUsQQlC1D0naomK7QrlpxZccDqmLDgJ8JerurmR0bgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842357;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WpDyRQQ/o4JcS3pbFPcHgoiQLFsDUgGVfvITSk+G9ac=;
	b=bki9a+VMLVOHIctFSqVvJBVcbaqbeT8EC0Xu566Q0MkuBA0+9/In+Crm1r/ia2fPaByG
	 pyTImIt8FZklbOqduacwkrL1w9wFAxCCyQun9eAy+D7TRqqxFChQ14+JFtHju79X/6nIh
	 H3oXjx+6JPc05qJXtXYFfVambXJ0R8eob3HCjUuMabjvz+CzTw+8qKdGuRSAE1VfEYeKe
	 mv8HmlfBr1omVYF08jX7Ykdnf1XsWIDzkhtzPmjzuhy5zmvbQ8EvxSmayoDKEXQeZxIHE
	 QKBPaiamb3Ne0tP57Hwb9hqJvROm5eazHFpcoMzYGqhNTtZ3siTG8G3a78XtZnHtbmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gTVaxNwq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC51606A322;
	Mon, 16 Nov 2026 15:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AC51606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gTVaxNwq
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5d79:c700:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E7CB0200668;
	Mon, 16 Nov 2026 16:19:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WpDyRQQ/o4JcS3pbFPcHgoiQLFsDUgGVfvITSk+G9ac=;
	b=gTVaxNwqfNC9NUE2EXApkF/kZ3crKhPcnWXoqUPYMX+QidXUrYJrhd2pw8VIFFniv3lABk
	D2gWXrDxgf4QIXISFN2F0f0h4vtJ1SGElQ+cb4rzP4TREBdvk/yRsaxQH8mPdzBsNREsMh
	voW+QWdn4ckSk9u8lV94ShuYXOM8UFX6g9jj6754NfSVDts2w9gxhoArB8S0aTp2+q1wCA
	toc/NXOAoP/Vefv6a+IbrV4EXB3ieI7IAFlZ8Cq/ysLcWBU7xZAuK1yfeBMab4W9QKN3KR
	NKNyQk3zehh8+RkNF9Pf1+uRXneSkRRnGy4YF37lKyJIH9tWYgUK4X3siraPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WpDyRQQ/o4JcS3pbFPcHgoiQLFsDUgGVfvITSk+G9ac=;
	b=XAEsdXhSrdkO9vpnSIEW1K2LlC0DzGISZ0DG1/Y+9RJDIzewa1OM4hRaNw+bYyo04Za3hM
	ParZ8rR9QOiyLZDpsf7No/tTpHBzBQmtwtZ9l3WPd2hbGscvcPjDzBPLa8YCfFKV1XLDyn
	6peFbwfPvzIcAEbGCupYa5ZP0rUY41G6xzlj6UAtPfJYQt9xc/EJ2/b5qlH2nb427xc3SE
	VET9UrUkyqE4Op4LX1Wc4iE4lbuVX69oq0lF4T43kEU0BoaDu/jBfPco2izSWGcu4pC2+y
	mYLxVHxRJoXBi1Ca4ikoLvLPrXJ863ssAcuLpDwwyaPkdU2s+bOyaNTw6hJdnA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794842350; a=rsa-sha256;
	cv=none;
	b=Pe3DgY7/BsVsQ2tegTd6EPbC31YWBfyU/EZmS+SOBUCPyI0uzZJ0+jZotMp+0XrR4vc1XJ
	qKMY2kHV5NylmsipWkspHnHjU80hTFtOSLU4QRnSeOujhuw5zBWDYxbFejM3bDFqM+P3zm
	kzEvt9qc1K31Q8fFkC71IjHEqZwlttsNk3P6f0idiV7uU8vzBvD5ntm/kUcKB2Gj1ywsUq
	jRAlKUQV+a5Vj8y0IPl0WdvYzSBqKztXnZd7XBka8AboU4z8+7a55JdVwmVjn8hccTkolr
	Jk+gLePEFrf9RfTP51IrefdcG9YwwbJVv/olU59q465DwEedQkq0OH/xaLFi+Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v4 0/9] media: synopsys: hdmirx: support an HDMI bridge in
 front of the receiver
Date: Mon, 16 Nov 2026 16:19:00 +0100
Message-Id: <20261116-hdmirx-media-v4-0-7aee4a0a273e@pengutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOQe+2oC/23QTW7DIBAF4KtErEvFADbYq96j6mKAIWFhOwXbc
 hXl7iVJf9MuHxKf3rwTK5QTFdbvTizTmkqaxhr0w475A4574inUzKSQreiE5ocwpLzxgUJCHsm
 Q6xrppCNWvxwzxbRdueeXmg+pzFN+u+orXF4/IKl+QytwwQlVMCZobKJ6OtK4X+Y8jWl7DMQu2
 ip/CndVVlkFDzK2GoJ1Iv4rqC8BhGjuBFUFAwiAkhSZ9o9wvp2Y6XWpQ823O7936ndXGKD9hDM
 VmgtfMPLQmk6CgK7Rrq9bVMphIe6nYUhzXdxGatBYpb2v3SxYa4JxPnQxCtQeg1cRra8tzu91F
 FMztgEAAA==
X-Change-ID: 20260904-hdmirx-media-fe7eb952b2be
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>, 
 Shreeya Patel <shreeya.patel@collabora.com>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842349; l=18611;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=kxfjdOXnQxJQEzRMLlTU40cvUoPuWNEWuRejKE1ubJE=;
 b=8H+xdV2ET655f7oxZ9+XENVfiNElPtOK6lcwPuJqedXj1D6+TOakikJodmLzEI6OsVTDsA9jd
 kMZlzxoTufrAUj3QUCrJQga7Mp65KHYQcEEy9Vjtxbmbb+Q5ANHoP9M
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

The Synopsys HDMI receiver driver assumes the HDMI connector belongs to
it: the connector's +5V line arrives on hpd-gpios, and there is nothing
between the source and the receiver. On the board this series comes from
that is not the case. An HDMI bridge owns the connector, the receiver
sits behind it, and the two are described by an OF graph endpoint.

Three things follow from that, and the series is arranged in that order.

Patches 1-2 give the driver a media device and register the video device
as an entity with a sink pad. On their own they add a graph with one node
in it; they exist so that there is somewhere for the bridge to appear.

Patches 3-4 add the endpoint to the binding and bind the remote subdev
through a v4l2 async notifier, linking its source pad to the receiver's
sink pad. Such a board cannot provide hpd-gpios, so the binding requires
either hpd-gpios or the port. Without an endpoint in the device tree the
driver keeps working exactly as before, so boards wired straight to the
connector are unaffected.

Patch 5 is fallout from the wait for signal lock, which was bounded by an
iteration count whose duration came from the 5V debounce it called
each time round. That debounce goes away on a board with no hpd-gpios
later in the series, so the wait gets a real timeout first.

Patches 6-9 are the 5V state itself. Patch 6 stops probe requiring an
interrupt for hpd-gpios. Patch 7 makes v4l2_device_unregister_subdev()
wait for notifications already in flight. Nothing kept a subdev from
notifying a v4l2_device that was unbinding it; that is not new with this
series, as asynchronously bound subdevs sending V4L2_EVENT_SOURCE_CHANGE
race the same way today. Patch 8 adds V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT,
and patch 9 has the receiver set v4l2_dev.notify and take the state from
whatever is bound in front of it. The notification is only an edge, as
the 5V interrupt is with hpd-gpios: the hotplug worker then asks the
subdev through g_input_status(), so nothing is cached that could go
stale against bind or unbind. Without a det_irq there is nothing to
disable across suspend and remove either, so patch 9 disables the
hotplug work items themselves instead of cancelling them. Patch 7 is
what lets the notify callback read sd->v4l2_dev while the subdev is
being unbound.

V4L2_CID_DV_RX_POWER_PRESENT is otherwise the only place this state is
published - adv7604, adv7842, tc358743 and tda1997x all set that control
from their cable detect interrupt and stop there - while a format change
already gets an in-kernel notification through v4l2_subdev_notify_event().
An earlier version of this series hooked the control with
v4l2_ctrl_notify() instead. That reaches into another device's control
handler, and the only thing it bought was working with those four
drivers unmodified, which turns out to be worth nothing: they are HDMI
sinks, so none of them could sit in front of an HDMI receiver anyway.

Nothing in tree sends the new notification yet. The driver for the device
on this board does, and the alternative was a mechanism that no in-tree
driver could have used either.

There is no in-tree device tree using the new port yet: the board is not
upstream, and the device in front of the receiver, a Lontium LT86102UXE
1:2 HDMI splitter, has no driver upstream either. I would rather send the
infrastructure for review now than sit on it until the board lands.

The series is based on media next with "media: synopsys: hdmirx: move
the reset bulk data out of the driver data" applied, a fix for the patch
that led v3 of this series and is in next now:

https://lore.kernel.org/all/20261116-hdmirx-resets-uaf-v1-1-1903146a3118@pengutronix.de/

Build tested for arm64 at each patch with W=1. Tested on that board on
v7.4-rc1 plus the board support, with the hdmirx driver, its binding and
v4l2-subdev.h identical to this series. v4l2-compliance from v4l-utils
git (d2e89246cefc), with the LT86102UXE in front of the receiver and a
source connected:

v4l2-compliance 1.33.0-5524, 64 bits, 64-bit time_t
v4l2-compliance SHA: d2e89246cefc 2026-10-30 13:45:36

Compliance test for snps_hdmirx device /dev/media2:

Media Driver Info:
        Driver name      : snps_hdmirx
        Model            : snps-hdmirx
        Serial           :
        Bus info         : platform:fdee0000.hdmi_receiver
        Media version    : 7.4.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 7.4.0

Required ioctls:
        test MEDIA_IOC_DEVICE_INFO: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/media2 open: OK
        test MEDIA_IOC_DEVICE_INFO: OK
        test for unlimited opens: OK

Media Controller ioctls:
        test MEDIA_IOC_G_TOPOLOGY: OK
        Entities: 2 Interfaces: 2 Pads: 3 Links: 3
        test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
        test MEDIA_IOC_SETUP_LINK: OK

Total for snps_hdmirx device /dev/media2: 8, Succeeded: 8, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for snps_hdmirx device /dev/video13:

Driver Info:
        Driver name      : snps_hdmirx
        Card type        : snps_hdmirx
        Bus info         : platform:fdee0000.hdmi_receiver
        Driver version   : 7.4.0
        Capabilities     : 0x84201000
                Video Capture Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04201000
                Video Capture Multiplanar
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : snps_hdmirx
        Model            : snps-hdmirx
        Serial           :
        Bus info         : platform:fdee0000.hdmi_receiver
        Media version    : 7.4.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 7.4.0
Interface Info:
        ID               : 0x03000003
        Type             : V4L Video
Entity Info:
        ID               : 0x00000001 (1)
        Name             : stream_hdmirx
        Function         : V4L2 I/O
        Pad 0x01000002   : 0: Sink
          Link 0x02000008: from remote pad 0x1000007 of entity 'lt86102uxe 7-0038' (Video Interface Bridge): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video13 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK
        test VIDIOC_LOG_STATUS: OK

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
        test VIDIOC_DV_TIMINGS_CAP: OK
        test VIDIOC_G/S_EDID: OK

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 5 Private Controls: 3

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test MMAP (no poll, REQBUFS): OK
        test MMAP (select, REQBUFS): OK
        test MMAP (epoll, REQBUFS): OK
        test MMAP (no poll, CREATE_BUFS): OK
        test MMAP (select, CREATE_BUFS): OK
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
                warn: v4l2-test-buffers.cpp(2223): Cannot test DMABUF, specify --expbuf-device
        test DMABUF (no poll): OK (Not Supported)
        test DMABUF (select): OK (Not Supported)

Total for snps_hdmirx device /dev/video13: 60, Succeeded: 60, Failed: 0, Warnings: 1
--------------------------------------------------------------------------------
Compliance test for snps_hdmirx device /dev/v4l-subdev0:

Driver Info:
        Driver version   : 7.4.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
        Driver name      : snps_hdmirx
        Model            : snps-hdmirx
        Serial           :
        Bus info         : platform:fdee0000.hdmi_receiver
        Media version    : 7.4.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 7.4.0
Interface Info:
        ID               : 0x0300000a
        Type             : V4L Sub-Device
Entity Info:
        ID               : 0x00000005 (5)
        Name             : lt86102uxe 7-0038
        Function         : Video Interface Bridge
        Pad 0x01000006   : 0: Sink
        Pad 0x01000007   : 1: Source
          Link 0x02000008: to remote pad 0x1000002 of entity 'stream_hdmirx' (V4L2 I/O): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev0 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Sink Pad 0):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 3 Private Controls: 3

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)
        test blocking wait: OK (Not Supported)

Total for snps_hdmirx device /dev/v4l-subdev0: 61, Succeeded: 61, Failed: 0, Warnings: 0

Grand Total for snps_hdmirx device /dev/media2: 129, Succeeded: 129, Failed: 0, Warnings: 1

The series was developed with the help of an AI coding assistant.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v4:
- drop "free the driver data when the last user is gone", Hans applied
  it from v3.
- rebase onto media next
- commit messages: the driver data is no longer devm allocated
- move the Assisted-by trailers into this cover letter
- add v4l2-compliance output (Hans)
- pick up Acked-by from Dmitry
- Link to v3: https://lore.kernel.org/r/20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de

Changes in v3:
- new patch 1: free the driver data from the v4l2_device release callback
  instead of devres, an open file descriptor keeps the video device alive
  past unbind. The media device cleanup Sashiko flagged on the old patch
  1 was the same problem, which predates the series (Sashiko on patch 1)
- v4l2-device: wait for the SRCU grace period on every subdev
  unregistration, not only when the v4l2_device has a notify callback,
  as the reader dereferences v4l2_dev either way (Sashiko on patch 7)
- Link to v2: https://lore.kernel.org/r/20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de

Changes in v2:
- dt-bindings: squash "add the source port" and "make hpd-gpios optional"
  into one patch and require exactly one of hpd-gpios and port (Conor)
- dt-bindings: drop the OS-specific sentence from the port description
  (Conor)
- hdmirx: take graph_mutex around media_create_pad_link() in the async
  bound callback, the media device is already registered (Sashiko)
- new patch 7: v4l2-device: wait for notifications when unregistering a
  subdev, so a notification cannot outlive the unbind of the receiver
  (Sashiko on patch 9)
- hdmirx: ask the subdev in front for the 5V state on every notification
  instead of caching what the notification carries, and disable the
  hotplug work items across probe, suspend and remove instead of gating
  the workers on a flag and cancelling once more after the notifier is
  unregistered
- Link to v1: https://lore.kernel.org/r/20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de

---
Gerald Loacker (6):
      media: synopsys: hdmirx: add media device infrastructure
      media: synopsys: hdmirx: add media entity for video capture device
      media: synopsys: hdmirx: add async subdevice support
      media: synopsys: hdmirx: give the signal lock wait a real timeout
      media: synopsys: hdmirx: skip the 5V detect interrupt without a GPIO
      media: synopsys: hdmirx: get the 5V state from the upstream subdev

Sascha Hauer (3):
      dt-bindings: media: snps,dw-hdmi-rx: add a port for a bridge in front
      media: v4l2-device: wait for notifications when unregistering a subdev
      media: v4l2-subdev: notify the bridge when the source power changes

 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml |  21 +-
 Documentation/driver-api/media/v4l2-subdev.rst     |   8 +-
 drivers/media/platform/synopsys/hdmirx/Kconfig     |   1 +
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 304 ++++++++++++++++++---
 drivers/media/v4l2-core/v4l2-device.c              |  42 +++
 include/media/v4l2-device.h                        |  15 +-
 include/media/v4l2-subdev.h                        |  12 +
 7 files changed, 355 insertions(+), 48 deletions(-)
---
base-commit: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
change-id: 20260904-hdmirx-media-fe7eb952b2be
prerequisite-change-id: 20261116-hdmirx-resets-uaf-d6792101954b:v1
prerequisite-patch-id: 72d3c6f730c052b1becdc7e253c8f75dda38fbea

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

