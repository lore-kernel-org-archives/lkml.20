Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287849;
	b=e+BwTWevsjTUMV+Cm9UeZq0Rj8jeRfMttu1FkY3wAaEZn15kNHk1/hwTiAfAIymSZj2J
	 HP6uVo86lwWchgoNsV3OWwCXQqjj6whooWBQOmbPmSDxAihMPFSyCQOv5+I5LL1kJJPl4
	 em7UZrZxJGEEIw8XzhnSGWu+HACyA7KrB1HTU6Qvm32ytAhMEbQpfqm+8rRBqSq2W2TwS
	 pv8E6EK4xnqkzYmgeyu0VIfrMvCUzOpkg/t3tAxqWSEU7o6HFXzLb09lSA8+onDresFQM
	 iRwAxbM5maok6UJqQ9s7AAC1JR7L6C4tgVFaNh7Xb+emUie+TY/eU10CMbNqCsiorew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KLid8ajVU7Atvb8Bv6XY+HkfVfubFrtEdENMe6QoNwQ=;
	b=j6Wx0rpCU00nzhE0rNUbAGPPmS6uqhPES/fJaM7j1867A2gVbL+0RzPXEe1/WQB3OVLW
	 8BUaXf2a3nxRhMqbPOE48QsddDOjSBL0sw79uxUKlf9JnjdrHtLmepjv1NVZu4djKdkSi
	 0FBkKOi2SJhmVeX4bB3GaTy4NCatfqI+mTX7MgUzY6nU3HQz/uieHO7vlq6XjfN/sumEs
	 ydT6lgu0EOf4piZR7xrJXmNi3+sWMu/u7g6F6sAtGTP/I9zM/U+N/yTdZyZY7jO2t6dRE
	 YPV+rQlL3OkTneXw2VpqMlVHhyYXeJyu9eaoh1COfWuN+2mFWZPNt5vpRJGMCOPK0TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oEMAqgcx;
	arc=none smtp.remote-ip=209.85.160.197
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE545606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE545606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oEMAqgcx
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5383d650f2dso45376041cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793287847; x=1793892647; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KLid8ajVU7Atvb8Bv6XY+HkfVfubFrtEdENMe6QoNwQ=;
        b=oEMAqgcxZ5JRwMUiP7BcMh4K4+McZO5TuoZ4RG84BuF4P21RipSkEN8MA4KHx8oqLS
         lDNQPEaBa4nhmGTzOHJ5dq6Q8m4SYQlSnYHeHoOzigSRatLgGzHVtAfNdc/LlpF3MHVL
         sqV7ghXoWeESprkFN21H02nXNLBmNey08ODBE64wjNtdKIe04xMJU/ceF64jb5MhUBkQ
         gtrsfyMbZQFPH40pGpzrLT5mGDhAi9LMZr9PbyfnZqqFAlXcL9ba4hdwgEnmcXoEnapE
         3xcOnGU7/Yd5sidEAvfjZwlD4R54aoyYc8Nm07k5pd4hIN3M9BNwH7NWD0uDspKJNJ+i
         7Tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287847; x=1793892647;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLid8ajVU7Atvb8Bv6XY+HkfVfubFrtEdENMe6QoNwQ=;
        b=vIHtSil7ld1q80EFoPPkco1J5II674AfxKcBlljsQ3BSWjNBOVrjkGPvdw75oM1Yx+
         HgVfRF4+9vn60lbL6zzto6sqbYk1ekSFR1xg+LbwnKkYFUtVqfj0D75AJafgQZEjoWGQ
         l3Ii0VyHJaEtZUtsASa4jRc3xZWL8Kbx7nmWSJwl0S5ht7o59T4LqGC+rSMpB5ek3H2s
         owKsfvArVwuJiKTq8atwlFtjaRGIVngKwSj1LcVjoe+ZmKr33x84KK0Rx+qUdTmoOECm
         undgyRtAUEUgyLHETkLzwXuM+R0J/U6ptDCm7YxQ2Wd8YKbwVsrbBep4lXwgNVkZiiXB
         HikA==
X-Forwarded-Encrypted: i=1; AKwUvBy7WEg8r9qUXpoSgaWONIfqvFL50kSrrHSR80KGPPNA0yMPGLqCRJF5q2fWGStkgkkk30uCMVxIq9SPnsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHEF/X+LscjUJ9vjQIVHO6GfvmsdpZgTcwMul7Y2E9pnkVZvym
	2yhzNT4gK5x9cBVCa3uYTKKHkrlpZQbzt5SQRyQ6ue6+YhaUKXAHWLc3ORaII7xpouCLIbduEZD
	//JN0I+kqc1qMM3ceZaLMtJwNXhr9
X-Received: from qtbe10-n2.prod.google.com ([2002:a05:622a:e14a:20b0:536:68db:4c9f])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:138f:b0:536:5a78:6b13 with SMTP id d75a77b69052e-53fcc7ca8d7mr99374971cf.57.1793287846430;
 Thu, 29 Oct 2026 08:30:46 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:30:33 -0400
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029153038.3800747-1-briandaniels@google.com>
Subject: [PATCH v10 0/5] media: add virtio-media driver
From: Brian Daniels <briandaniels@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: adelva@google.com, aesteve@redhat.com, changyeon@google.com, 
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	dbassey@redhat.com, laurent.pinchart@ideasonboard.com, 
	Brian Daniels <briandaniels@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexandre Courbot <gnurou@gmail.com>

Add the first version of the virtio-media driver.

This driver acts roughly as a V4L2 relay between user-space and the
virtio virtual device on the host, so it is relatively simple, yet
unconventional. It doesn't use VB2 or other frameworks typically used in
a V4L2 driver, and most of its complexity resides in correctly and
efficiently building the virtio descriptor chain to pass to the host,
avoiding copies whenever possible. This is done by
scatterlist_builder.[ch].

This version supports MMAP buffers. DMABUF support is still pending.
---
Guest Setup

Tests were ran on a Debian 12 guest running with crosvm. The guest image
was created with:

$ virt-builder debian-12 --root-password password:""

Build crosvm and launch the guest starting at the "Crosvm" section on
this page: https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md#crosvm

NOTE: Before running v4l2-compliance in the guest, you need to install
v4l-utils and ffmpeg:

$ apt update && apt install v4l-utils ffmpeg

---
Compliance Testing

This was tested using v4l2-compliance. Since virtio-media serves as
a proxy to host devices for the guest VMs, we expect the guest
compliance test to essentially match the host compliance test for the
same device.

NOTE: v4l2-compliance changes its test behavior depending on the driver
name. In the guest, the driver name for virtio-media proxied-devices is
always "virtio-media", even if the actual host device has a driver name
of e.g. "uvcvideo". To ensure the test is consistent between the host
and the guest, I created a patch for the v4l2-compliance tool that
allows you to override the driver name. All test results that follow use
this patch:
https://lore.kernel.org/all/20261029152030.3764241-1-briandaniels@google.com/

All tests used a Logitech USB Webcam C925e.

As tested on the host:

$ v4l2-compliance -d1 -s

v4l2-compliance 1.33.0-5471, 64 bits, 64-bit time_t
v4l2-compliance SHA: 9f2d3ea879ff 2026-05-28 14:45:11

Compliance test for uvcvideo device /dev/video1:

Driver Info:
	Driver name      : uvcvideo
	Card type        : Logitech Webcam C925e
	Bus info         : usb-0000:04:00.1-3
	Driver version   : 6.18.14
	Capabilities     : 0x84a00001
		Video Capture
		Metadata Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04200001
		Video Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : uvcvideo
	Model            : Logitech Webcam C925e
	Serial           : 686F371F
	Bus info         : usb-0000:04:00.1-3
	Media version    : 6.18.14
	Hardware revision: 0x00000016 (22)
	Driver version   : 6.18.14
Interface Info:
	ID               : 0x03000002
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : Logitech Webcam C925e
	Function         : V4L2 I/O
	Flags            : default
	Pad 0x01000007   : 0: Sink
	  Link 0x0200001f: from remote pad 0x100000a of entity 'Processing 3' (Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

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
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
		fail: v4l2-test-controls.cpp(983): ret != EINVAL (got 13)
	test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 19 Private Controls: 0

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

	Video Capture: Frame #000
	Video Capture: Frame #001
	Video Capture: Frame #002
	Video Capture: Frame #003
	Video Capture: Frame #004
	Video Capture: Frame #005
	Video Capture: Frame #006
	Video Capture: Frame #007
	Video Capture: Frame #008
	Video Capture: Frame #009
	Video Capture: Frame #010
	Video Capture: Frame #011
	Video Capture: Frame #012
	Video Capture: Frame #013
	Video Capture: Frame #014
	Video Capture: Frame #015
	Video Capture: Frame #016
	Video Capture: Frame #017
	Video Capture: Frame #018
	Video Capture: Frame #019
	Video Capture: Frame #020
	Video Capture: Frame #021
	Video Capture: Frame #022
	Video Capture: Frame #023
	Video Capture: Frame #024
	Video Capture: Frame #025
	Video Capture: Frame #026
	Video Capture: Frame #027
	Video Capture: Frame #028
	Video Capture: Frame #029
	Video Capture: Frame #030
	Video Capture: Frame #031
	Video Capture: Frame #032
	Video Capture: Frame #033
	Video Capture: Frame #034
	Video Capture: Frame #035
	Video Capture: Frame #036
	Video Capture: Frame #037
	Video Capture: Frame #038
	Video Capture: Frame #039
	Video Capture: Frame #040
	Video Capture: Frame #041
	Video Capture: Frame #042
	Video Capture: Frame #043
	Video Capture: Frame #044
	Video Capture: Frame #045
	Video Capture: Frame #046
	Video Capture: Frame #047
	Video Capture: Frame #048
	Video Capture: Frame #049
	Video Capture: Frame #050
	Video Capture: Frame #051
	Video Capture: Frame #052
	Video Capture: Frame #053
	Video Capture: Frame #054
	Video Capture: Frame #055
	Video Capture: Frame #056
	Video Capture: Frame #057
	Video Capture: Frame #058
	Video Capture: Frame #059

	test MMAP (no poll, REQBUFS): OK

	Video Capture: Frame #000 (select)
	Video Capture: Frame #001 (select)
	Video Capture: Frame #002 (select)
	Video Capture: Frame #003 (select)
	Video Capture: Frame #004 (select)
	Video Capture: Frame #005 (select)
	Video Capture: Frame #006 (select)
	Video Capture: Frame #007 (select)
	Video Capture: Frame #008 (select)
	Video Capture: Frame #009 (select)
	Video Capture: Frame #010 (select)
	Video Capture: Frame #011 (select)
	Video Capture: Frame #012 (select)
	Video Capture: Frame #013 (select)
	Video Capture: Frame #014 (select)
	Video Capture: Frame #015 (select)
	Video Capture: Frame #016 (select)
	Video Capture: Frame #017 (select)
	Video Capture: Frame #018 (select)
	Video Capture: Frame #019 (select)
	Video Capture: Frame #020 (select)
	Video Capture: Frame #021 (select)
	Video Capture: Frame #022 (select)
	Video Capture: Frame #023 (select)
	Video Capture: Frame #024 (select)
	Video Capture: Frame #025 (select)
	Video Capture: Frame #026 (select)
	Video Capture: Frame #027 (select)
	Video Capture: Frame #028 (select)
	Video Capture: Frame #029 (select)
	Video Capture: Frame #030 (select)
	Video Capture: Frame #031 (select)
	Video Capture: Frame #032 (select)
	Video Capture: Frame #033 (select)
	Video Capture: Frame #034 (select)
	Video Capture: Frame #035 (select)
	Video Capture: Frame #036 (select)
	Video Capture: Frame #037 (select)
	Video Capture: Frame #038 (select)
	Video Capture: Frame #039 (select)
	Video Capture: Frame #040 (select)
	Video Capture: Frame #041 (select)
	Video Capture: Frame #042 (select)
	Video Capture: Frame #043 (select)
	Video Capture: Frame #044 (select)
	Video Capture: Frame #045 (select)
	Video Capture: Frame #046 (select)
	Video Capture: Frame #047 (select)
	Video Capture: Frame #048 (select)
	Video Capture: Frame #049 (select)
	Video Capture: Frame #050 (select)
	Video Capture: Frame #051 (select)
	Video Capture: Frame #052 (select)
	Video Capture: Frame #053 (select)
	Video Capture: Frame #054 (select)
	Video Capture: Frame #055 (select)
	Video Capture: Frame #056 (select)
	Video Capture: Frame #057 (select)
	Video Capture: Frame #058 (select)
	Video Capture: Frame #059 (select)

	test MMAP (select, REQBUFS): OK

	Video Capture: Frame #000 (epoll)
	Video Capture: Frame #001 (epoll)
	Video Capture: Frame #002 (epoll)
	Video Capture: Frame #003 (epoll)
	Video Capture: Frame #004 (epoll)
	Video Capture: Frame #005 (epoll)
	Video Capture: Frame #006 (epoll)
	Video Capture: Frame #007 (epoll)
	Video Capture: Frame #008 (epoll)
	Video Capture: Frame #009 (epoll)
	Video Capture: Frame #010 (epoll)
	Video Capture: Frame #011 (epoll)
	Video Capture: Frame #012 (epoll)
	Video Capture: Frame #013 (epoll)
	Video Capture: Frame #014 (epoll)
	Video Capture: Frame #015 (epoll)
	Video Capture: Frame #016 (epoll)
	Video Capture: Frame #017 (epoll)
	Video Capture: Frame #018 (epoll)
	Video Capture: Frame #019 (epoll)
	Video Capture: Frame #020 (epoll)
	Video Capture: Frame #021 (epoll)
	Video Capture: Frame #022 (epoll)
	Video Capture: Frame #023 (epoll)
	Video Capture: Frame #024 (epoll)
	Video Capture: Frame #025 (epoll)
	Video Capture: Frame #026 (epoll)
	Video Capture: Frame #027 (epoll)
	Video Capture: Frame #028 (epoll)
	Video Capture: Frame #029 (epoll)
	Video Capture: Frame #030 (epoll)
	Video Capture: Frame #031 (epoll)
	Video Capture: Frame #032 (epoll)
	Video Capture: Frame #033 (epoll)
	Video Capture: Frame #034 (epoll)
	Video Capture: Frame #035 (epoll)
	Video Capture: Frame #036 (epoll)
	Video Capture: Frame #037 (epoll)
	Video Capture: Frame #038 (epoll)
	Video Capture: Frame #039 (epoll)
	Video Capture: Frame #040 (epoll)
	Video Capture: Frame #041 (epoll)
	Video Capture: Frame #042 (epoll)
	Video Capture: Frame #043 (epoll)
	Video Capture: Frame #044 (epoll)
	Video Capture: Frame #045 (epoll)
	Video Capture: Frame #046 (epoll)
	Video Capture: Frame #047 (epoll)
	Video Capture: Frame #048 (epoll)
	Video Capture: Frame #049 (epoll)
	Video Capture: Frame #050 (epoll)
	Video Capture: Frame #051 (epoll)
	Video Capture: Frame #052 (epoll)
	Video Capture: Frame #053 (epoll)
	Video Capture: Frame #054 (epoll)
	Video Capture: Frame #055 (epoll)
	Video Capture: Frame #056 (epoll)
	Video Capture: Frame #057 (epoll)
	Video Capture: Frame #058 (epoll)
	Video Capture: Frame #059 (epoll)

	test MMAP (epoll, REQBUFS): OK

	Video Capture: Frame #000
	Video Capture: Frame #001
	Video Capture: Frame #002
	Video Capture: Frame #003
	Video Capture: Frame #004
	Video Capture: Frame #005
	Video Capture: Frame #006
	Video Capture: Frame #007
	Video Capture: Frame #008
	Video Capture: Frame #009
	Video Capture: Frame #010
	Video Capture: Frame #011
	Video Capture: Frame #012
	Video Capture: Frame #013
	Video Capture: Frame #014
	Video Capture: Frame #015
	Video Capture: Frame #016
	Video Capture: Frame #017
	Video Capture: Frame #018
	Video Capture: Frame #019
	Video Capture: Frame #020
	Video Capture: Frame #021
	Video Capture: Frame #022
	Video Capture: Frame #023
	Video Capture: Frame #024
	Video Capture: Frame #025
	Video Capture: Frame #026
	Video Capture: Frame #027
	Video Capture: Frame #028
	Video Capture: Frame #029
	Video Capture: Frame #030
	Video Capture: Frame #031
	Video Capture: Frame #032
	Video Capture: Frame #033
	Video Capture: Frame #034
	Video Capture: Frame #035
	Video Capture: Frame #036
	Video Capture: Frame #037
	Video Capture: Frame #038
	Video Capture: Frame #039
	Video Capture: Frame #040
	Video Capture: Frame #041
	Video Capture: Frame #042
	Video Capture: Frame #043
	Video Capture: Frame #044
	Video Capture: Frame #045
	Video Capture: Frame #046
	Video Capture: Frame #047
	Video Capture: Frame #048
	Video Capture: Frame #049
	Video Capture: Frame #050
	Video Capture: Frame #051
	Video Capture: Frame #052
	Video Capture: Frame #053
	Video Capture: Frame #054
	Video Capture: Frame #055
	Video Capture: Frame #056
	Video Capture: Frame #057
	Video Capture: Frame #058
	Video Capture: Frame #059

	test MMAP (no poll, CREATE_BUFS): OK

	Video Capture: Frame #000 (select)
	Video Capture: Frame #001 (select)
	Video Capture: Frame #002 (select)
	Video Capture: Frame #003 (select)
	Video Capture: Frame #004 (select)
	Video Capture: Frame #005 (select)
	Video Capture: Frame #006 (select)
	Video Capture: Frame #007 (select)
	Video Capture: Frame #008 (select)
	Video Capture: Frame #009 (select)
	Video Capture: Frame #010 (select)
	Video Capture: Frame #011 (select)
	Video Capture: Frame #012 (select)
	Video Capture: Frame #013 (select)
	Video Capture: Frame #014 (select)
	Video Capture: Frame #015 (select)
	Video Capture: Frame #016 (select)
	Video Capture: Frame #017 (select)
	Video Capture: Frame #018 (select)
	Video Capture: Frame #019 (select)
	Video Capture: Frame #020 (select)
	Video Capture: Frame #021 (select)
	Video Capture: Frame #022 (select)
	Video Capture: Frame #023 (select)
	Video Capture: Frame #024 (select)
	Video Capture: Frame #025 (select)
	Video Capture: Frame #026 (select)
	Video Capture: Frame #027 (select)
	Video Capture: Frame #028 (select)
	Video Capture: Frame #029 (select)
	Video Capture: Frame #030 (select)
	Video Capture: Frame #031 (select)
	Video Capture: Frame #032 (select)
	Video Capture: Frame #033 (select)
	Video Capture: Frame #034 (select)
	Video Capture: Frame #035 (select)
	Video Capture: Frame #036 (select)
	Video Capture: Frame #037 (select)
	Video Capture: Frame #038 (select)
	Video Capture: Frame #039 (select)
	Video Capture: Frame #040 (select)
	Video Capture: Frame #041 (select)
	Video Capture: Frame #042 (select)
	Video Capture: Frame #043 (select)
	Video Capture: Frame #044 (select)
	Video Capture: Frame #045 (select)
	Video Capture: Frame #046 (select)
	Video Capture: Frame #047 (select)
	Video Capture: Frame #048 (select)
	Video Capture: Frame #049 (select)
	Video Capture: Frame #050 (select)
	Video Capture: Frame #051 (select)
	Video Capture: Frame #052 (select)
	Video Capture: Frame #053 (select)
	Video Capture: Frame #054 (select)
	Video Capture: Frame #055 (select)
	Video Capture: Frame #056 (select)
	Video Capture: Frame #057 (select)
	Video Capture: Frame #058 (select)
	Video Capture: Frame #059 (select)

	test MMAP (select, CREATE_BUFS): OK

	Video Capture: Frame #000 (epoll)
	Video Capture: Frame #001 (epoll)
	Video Capture: Frame #002 (epoll)
	Video Capture: Frame #003 (epoll)
	Video Capture: Frame #004 (epoll)
	Video Capture: Frame #005 (epoll)
	Video Capture: Frame #006 (epoll)
	Video Capture: Frame #007 (epoll)
	Video Capture: Frame #008 (epoll)
	Video Capture: Frame #009 (epoll)
	Video Capture: Frame #010 (epoll)
	Video Capture: Frame #011 (epoll)
	Video Capture: Frame #012 (epoll)
	Video Capture: Frame #013 (epoll)
	Video Capture: Frame #014 (epoll)
	Video Capture: Frame #015 (epoll)
	Video Capture: Frame #016 (epoll)
	Video Capture: Frame #017 (epoll)
	Video Capture: Frame #018 (epoll)
	Video Capture: Frame #019 (epoll)
	Video Capture: Frame #020 (epoll)
	Video Capture: Frame #021 (epoll)
	Video Capture: Frame #022 (epoll)
	Video Capture: Frame #023 (epoll)
	Video Capture: Frame #024 (epoll)
	Video Capture: Frame #025 (epoll)
	Video Capture: Frame #026 (epoll)
	Video Capture: Frame #027 (epoll)
	Video Capture: Frame #028 (epoll)
	Video Capture: Frame #029 (epoll)
	Video Capture: Frame #030 (epoll)
	Video Capture: Frame #031 (epoll)
	Video Capture: Frame #032 (epoll)
	Video Capture: Frame #033 (epoll)
	Video Capture: Frame #034 (epoll)
	Video Capture: Frame #035 (epoll)
	Video Capture: Frame #036 (epoll)
	Video Capture: Frame #037 (epoll)
	Video Capture: Frame #038 (epoll)
	Video Capture: Frame #039 (epoll)
	Video Capture: Frame #040 (epoll)
	Video Capture: Frame #041 (epoll)
	Video Capture: Frame #042 (epoll)
	Video Capture: Frame #043 (epoll)
	Video Capture: Frame #044 (epoll)
	Video Capture: Frame #045 (epoll)
	Video Capture: Frame #046 (epoll)
	Video Capture: Frame #047 (epoll)
	Video Capture: Frame #048 (epoll)
	Video Capture: Frame #049 (epoll)
	Video Capture: Frame #050 (epoll)
	Video Capture: Frame #051 (epoll)
	Video Capture: Frame #052 (epoll)
	Video Capture: Frame #053 (epoll)
	Video Capture: Frame #054 (epoll)
	Video Capture: Frame #055 (epoll)
	Video Capture: Frame #056 (epoll)
	Video Capture: Frame #057 (epoll)
	Video Capture: Frame #058 (epoll)
	Video Capture: Frame #059 (epoll)

	test MMAP (epoll, CREATE_BUFS): OK

	Video Capture: Frame #000
	Video Capture: Frame #001
	Video Capture: Frame #002
	Video Capture: Frame #003
	Video Capture: Frame #004
	Video Capture: Frame #005
	Video Capture: Frame #006
	Video Capture: Frame #007
	Video Capture: Frame #008
	Video Capture: Frame #009
	Video Capture: Frame #010
	Video Capture: Frame #011
	Video Capture: Frame #012
	Video Capture: Frame #013
	Video Capture: Frame #014
	Video Capture: Frame #015
	Video Capture: Frame #016
	Video Capture: Frame #017
	Video Capture: Frame #018
	Video Capture: Frame #019
	Video Capture: Frame #020
	Video Capture: Frame #021
	Video Capture: Frame #022
	Video Capture: Frame #023
	Video Capture: Frame #024
	Video Capture: Frame #025
	Video Capture: Frame #026
	Video Capture: Frame #027
	Video Capture: Frame #028
	Video Capture: Frame #029
	Video Capture: Frame #030
	Video Capture: Frame #031
	Video Capture: Frame #032
	Video Capture: Frame #033
	Video Capture: Frame #034
	Video Capture: Frame #035
	Video Capture: Frame #036
	Video Capture: Frame #037
	Video Capture: Frame #038
	Video Capture: Frame #039
	Video Capture: Frame #040
	Video Capture: Frame #041
	Video Capture: Frame #042
	Video Capture: Frame #043
	Video Capture: Frame #044
	Video Capture: Frame #045
	Video Capture: Frame #046
	Video Capture: Frame #047
	Video Capture: Frame #048
	Video Capture: Frame #049
	Video Capture: Frame #050
	Video Capture: Frame #051
	Video Capture: Frame #052
	Video Capture: Frame #053
	Video Capture: Frame #054
	Video Capture: Frame #055
	Video Capture: Frame #056
	Video Capture: Frame #057
	Video Capture: Frame #058
	Video Capture: Frame #059

	test USERPTR (no poll): OK

	Video Capture: Frame #000 (select)
	Video Capture: Frame #001 (select)
	Video Capture: Frame #002 (select)
	Video Capture: Frame #003 (select)
	Video Capture: Frame #004 (select)
	Video Capture: Frame #005 (select)
	Video Capture: Frame #006 (select)
	Video Capture: Frame #007 (select)
	Video Capture: Frame #008 (select)
	Video Capture: Frame #009 (select)
	Video Capture: Frame #010 (select)
	Video Capture: Frame #011 (select)
	Video Capture: Frame #012 (select)
	Video Capture: Frame #013 (select)
	Video Capture: Frame #014 (select)
	Video Capture: Frame #015 (select)
	Video Capture: Frame #016 (select)
	Video Capture: Frame #017 (select)
	Video Capture: Frame #018 (select)
	Video Capture: Frame #019 (select)
	Video Capture: Frame #020 (select)
	Video Capture: Frame #021 (select)
	Video Capture: Frame #022 (select)
	Video Capture: Frame #023 (select)
	Video Capture: Frame #024 (select)
	Video Capture: Frame #025 (select)
	Video Capture: Frame #026 (select)
	Video Capture: Frame #027 (select)
	Video Capture: Frame #028 (select)
	Video Capture: Frame #029 (select)
	Video Capture: Frame #030 (select)
	Video Capture: Frame #031 (select)
	Video Capture: Frame #032 (select)
	Video Capture: Frame #033 (select)
	Video Capture: Frame #034 (select)
	Video Capture: Frame #035 (select)
	Video Capture: Frame #036 (select)
	Video Capture: Frame #037 (select)
	Video Capture: Frame #038 (select)
	Video Capture: Frame #039 (select)
	Video Capture: Frame #040 (select)
	Video Capture: Frame #041 (select)
	Video Capture: Frame #042 (select)
	Video Capture: Frame #043 (select)
	Video Capture: Frame #044 (select)
	Video Capture: Frame #045 (select)
	Video Capture: Frame #046 (select)
	Video Capture: Frame #047 (select)
	Video Capture: Frame #048 (select)
	Video Capture: Frame #049 (select)
	Video Capture: Frame #050 (select)
	Video Capture: Frame #051 (select)
	Video Capture: Frame #052 (select)
	Video Capture: Frame #053 (select)
	Video Capture: Frame #054 (select)
	Video Capture: Frame #055 (select)
	Video Capture: Frame #056 (select)
	Video Capture: Frame #057 (select)
	Video Capture: Frame #058 (select)
	Video Capture: Frame #059 (select)

	test USERPTR (select): OK
	test DMABUF: Cannot test, specify --expbuf-device

Total for uvcvideo device /dev/video1: 58, Succeeded: 57, Failed: 1, Warnings: 0

As tested on the guest:

$ v4l2-compliance -d0 -s --driver-name uvcvideo

v4l2-compliance 1.33.0-5457, 64 bits, 64-bit time_t
v4l2-compliance SHA: e7e240f546f3 2026-05-28 17:06:12

Compliance test for uvcvideo device (overridden from virtio-media) /dev/video0:

Driver Info:
	Driver name      : uvcvideo
	Card type        : Logitech Webcam C925e
	Bus info         : platform:virtio-media
	Driver version   : 7.1.0
	Capabilities     : 0x84200001
		Video Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04200001
		Video Capture
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK
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
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
		fail: v4l2-test-controls.cpp(981): ret (got 22)
	test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 19 Private Controls: 0

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
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)

	Video Capture: Frame #000
	Video Capture: Frame #001
	Video Capture: Frame #002
	Video Capture: Frame #003
	Video Capture: Frame #004
	Video Capture: Frame #005
	Video Capture: Frame #006
	Video Capture: Frame #007
	Video Capture: Frame #008
	Video Capture: Frame #009
	Video Capture: Frame #010
	Video Capture: Frame #011
	Video Capture: Frame #012
	Video Capture: Frame #013
	Video Capture: Frame #014
	Video Capture: Frame #015
	Video Capture: Frame #016
	Video Capture: Frame #017
	Video Capture: Frame #018
	Video Capture: Frame #019
	Video Capture: Frame #020
	Video Capture: Frame #021
	Video Capture: Frame #022
	Video Capture: Frame #023
	Video Capture: Frame #024
	Video Capture: Frame #025
	Video Capture: Frame #026
	Video Capture: Frame #027
	Video Capture: Frame #028
	Video Capture: Frame #029
	Video Capture: Frame #030
	Video Capture: Frame #031
	Video Capture: Frame #032
	Video Capture: Frame #033
	Video Capture: Frame #034
	Video Capture: Frame #035
	Video Capture: Frame #036
	Video Capture: Frame #037
	Video Capture: Frame #038
	Video Capture: Frame #039
	Video Capture: Frame #040
	Video Capture: Frame #041
	Video Capture: Frame #042
	Video Capture: Frame #043
	Video Capture: Frame #044
	Video Capture: Frame #045
	Video Capture: Frame #046
	Video Capture: Frame #047
	Video Capture: Frame #048
	Video Capture: Frame #049
	Video Capture: Frame #050
	Video Capture: Frame #051
	Video Capture: Frame #052
	Video Capture: Frame #053
	Video Capture: Frame #054
	Video Capture: Frame #055
	Video Capture: Frame #056
	Video Capture: Frame #057
	Video Capture: Frame #058
	Video Capture: Frame #059

	test MMAP (no poll, REQBUFS): OK

	Video Capture: Frame #000 (select)
	Video Capture: Frame #001 (select)
	Video Capture: Frame #002 (select)
	Video Capture: Frame #003 (select)
	Video Capture: Frame #004 (select)
	Video Capture: Frame #005 (select)
	Video Capture: Frame #006 (select)
	Video Capture: Frame #007 (select)
	Video Capture: Frame #008 (select)
	Video Capture: Frame #009 (select)
	Video Capture: Frame #010 (select)
	Video Capture: Frame #011 (select)
	Video Capture: Frame #012 (select)
	Video Capture: Frame #013 (select)
	Video Capture: Frame #014 (select)
	Video Capture: Frame #015 (select)
	Video Capture: Frame #016 (select)
	Video Capture: Frame #017 (select)
	Video Capture: Frame #018 (select)
	Video Capture: Frame #019 (select)
	Video Capture: Frame #020 (select)
	Video Capture: Frame #021 (select)
	Video Capture: Frame #022 (select)
	Video Capture: Frame #023 (select)
	Video Capture: Frame #024 (select)
	Video Capture: Frame #025 (select)
	Video Capture: Frame #026 (select)
	Video Capture: Frame #027 (select)
	Video Capture: Frame #028 (select)
	Video Capture: Frame #029 (select)
	Video Capture: Frame #030 (select)
	Video Capture: Frame #031 (select)
	Video Capture: Frame #032 (select)
	Video Capture: Frame #033 (select)
	Video Capture: Frame #034 (select)
	Video Capture: Frame #035 (select)
	Video Capture: Frame #036 (select)
	Video Capture: Frame #037 (select)
	Video Capture: Frame #038 (select)
	Video Capture: Frame #039 (select)
	Video Capture: Frame #040 (select)
	Video Capture: Frame #041 (select)
	Video Capture: Frame #042 (select)
	Video Capture: Frame #043 (select)
	Video Capture: Frame #044 (select)
	Video Capture: Frame #045 (select)
	Video Capture: Frame #046 (select)
	Video Capture: Frame #047 (select)
	Video Capture: Frame #048 (select)
	Video Capture: Frame #049 (select)
	Video Capture: Frame #050 (select)
	Video Capture: Frame #051 (select)
	Video Capture: Frame #052 (select)
	Video Capture: Frame #053 (select)
	Video Capture: Frame #054 (select)
	Video Capture: Frame #055 (select)
	Video Capture: Frame #056 (select)
	Video Capture: Frame #057 (select)
	Video Capture: Frame #058 (select)
	Video Capture: Frame #059 (select)

	test MMAP (select, REQBUFS): OK

	Video Capture: Frame #000 (epoll)
	Video Capture: Frame #001 (epoll)
	Video Capture: Frame #002 (epoll)
	Video Capture: Frame #003 (epoll)
	Video Capture: Frame #004 (epoll)
	Video Capture: Frame #005 (epoll)
	Video Capture: Frame #006 (epoll)
	Video Capture: Frame #007 (epoll)
	Video Capture: Frame #008 (epoll)
	Video Capture: Frame #009 (epoll)
	Video Capture: Frame #010 (epoll)
	Video Capture: Frame #011 (epoll)
	Video Capture: Frame #012 (epoll)
	Video Capture: Frame #013 (epoll)
	Video Capture: Frame #014 (epoll)
	Video Capture: Frame #015 (epoll)
	Video Capture: Frame #016 (epoll)
	Video Capture: Frame #017 (epoll)
	Video Capture: Frame #018 (epoll)
	Video Capture: Frame #019 (epoll)
	Video Capture: Frame #020 (epoll)
	Video Capture: Frame #021 (epoll)
	Video Capture: Frame #022 (epoll)
	Video Capture: Frame #023 (epoll)
	Video Capture: Frame #024 (epoll)
	Video Capture: Frame #025 (epoll)
	Video Capture: Frame #026 (epoll)
	Video Capture: Frame #027 (epoll)
	Video Capture: Frame #028 (epoll)
	Video Capture: Frame #029 (epoll)
	Video Capture: Frame #030 (epoll)
	Video Capture: Frame #031 (epoll)
	Video Capture: Frame #032 (epoll)
	Video Capture: Frame #033 (epoll)
	Video Capture: Frame #034 (epoll)
	Video Capture: Frame #035 (epoll)
	Video Capture: Frame #036 (epoll)
	Video Capture: Frame #037 (epoll)
	Video Capture: Frame #038 (epoll)
	Video Capture: Frame #039 (epoll)
	Video Capture: Frame #040 (epoll)
	Video Capture: Frame #041 (epoll)
	Video Capture: Frame #042 (epoll)
	Video Capture: Frame #043 (epoll)
	Video Capture: Frame #044 (epoll)
	Video Capture: Frame #045 (epoll)
	Video Capture: Frame #046 (epoll)
	Video Capture: Frame #047 (epoll)
	Video Capture: Frame #048 (epoll)
	Video Capture: Frame #049 (epoll)
	Video Capture: Frame #050 (epoll)
	Video Capture: Frame #051 (epoll)
	Video Capture: Frame #052 (epoll)
	Video Capture: Frame #053 (epoll)
	Video Capture: Frame #054 (epoll)
	Video Capture: Frame #055 (epoll)
	Video Capture: Frame #056 (epoll)
	Video Capture: Frame #057 (epoll)
	Video Capture: Frame #058 (epoll)
	Video Capture: Frame #059 (epoll)

	test MMAP (epoll, REQBUFS): OK

	Video Capture: Frame #000
	Video Capture: Frame #001
	Video Capture: Frame #002
	Video Capture: Frame #003
	Video Capture: Frame #004
	Video Capture: Frame #005
	Video Capture: Frame #006
	Video Capture: Frame #007
	Video Capture: Frame #008
	Video Capture: Frame #009
	Video Capture: Frame #010
	Video Capture: Frame #011
	Video Capture: Frame #012
	Video Capture: Frame #013
	Video Capture: Frame #014
	Video Capture: Frame #015
	Video Capture: Frame #016
	Video Capture: Frame #017
	Video Capture: Frame #018
	Video Capture: Frame #019
	Video Capture: Frame #020
	Video Capture: Frame #021
	Video Capture: Frame #022
	Video Capture: Frame #023
	Video Capture: Frame #024
	Video Capture: Frame #025
	Video Capture: Frame #026
	Video Capture: Frame #027
	Video Capture: Frame #028
	Video Capture: Frame #029
	Video Capture: Frame #030
	Video Capture: Frame #031
	Video Capture: Frame #032
	Video Capture: Frame #033
	Video Capture: Frame #034
	Video Capture: Frame #035
	Video Capture: Frame #036
	Video Capture: Frame #037
	Video Capture: Frame #038
	Video Capture: Frame #039
	Video Capture: Frame #040
	Video Capture: Frame #041
	Video Capture: Frame #042
	Video Capture: Frame #043
	Video Capture: Frame #044
	Video Capture: Frame #045
	Video Capture: Frame #046
	Video Capture: Frame #047
	Video Capture: Frame #048
	Video Capture: Frame #049
	Video Capture: Frame #050
	Video Capture: Frame #051
	Video Capture: Frame #052
	Video Capture: Frame #053
	Video Capture: Frame #054
	Video Capture: Frame #055
	Video Capture: Frame #056
	Video Capture: Frame #057
	Video Capture: Frame #058
	Video Capture: Frame #059

	test MMAP (no poll, CREATE_BUFS): OK

	Video Capture: Frame #000 (select)
	Video Capture: Frame #001 (select)
	Video Capture: Frame #002 (select)
	Video Capture: Frame #003 (select)
	Video Capture: Frame #004 (select)
	Video Capture: Frame #005 (select)
	Video Capture: Frame #006 (select)
	Video Capture: Frame #007 (select)
	Video Capture: Frame #008 (select)
	Video Capture: Frame #009 (select)
	Video Capture: Frame #010 (select)
	Video Capture: Frame #011 (select)
	Video Capture: Frame #012 (select)
	Video Capture: Frame #013 (select)
	Video Capture: Frame #014 (select)
	Video Capture: Frame #015 (select)
	Video Capture: Frame #016 (select)
	Video Capture: Frame #017 (select)
	Video Capture: Frame #018 (select)
	Video Capture: Frame #019 (select)
	Video Capture: Frame #020 (select)
	Video Capture: Frame #021 (select)
	Video Capture: Frame #022 (select)
	Video Capture: Frame #023 (select)
	Video Capture: Frame #024 (select)
	Video Capture: Frame #025 (select)
	Video Capture: Frame #026 (select)
	Video Capture: Frame #027 (select)
	Video Capture: Frame #028 (select)
	Video Capture: Frame #029 (select)
	Video Capture: Frame #030 (select)
	Video Capture: Frame #031 (select)
	Video Capture: Frame #032 (select)
	Video Capture: Frame #033 (select)
	Video Capture: Frame #034 (select)
	Video Capture: Frame #035 (select)
	Video Capture: Frame #036 (select)
	Video Capture: Frame #037 (select)
	Video Capture: Frame #038 (select)
	Video Capture: Frame #039 (select)
	Video Capture: Frame #040 (select)
	Video Capture: Frame #041 (select)
	Video Capture: Frame #042 (select)
	Video Capture: Frame #043 (select)
	Video Capture: Frame #044 (select)
	Video Capture: Frame #045 (select)
	Video Capture: Frame #046 (select)
	Video Capture: Frame #047 (select)
	Video Capture: Frame #048 (select)
	Video Capture: Frame #049 (select)
	Video Capture: Frame #050 (select)
	Video Capture: Frame #051 (select)
	Video Capture: Frame #052 (select)
	Video Capture: Frame #053 (select)
	Video Capture: Frame #054 (select)
	Video Capture: Frame #055 (select)
	Video Capture: Frame #056 (select)
	Video Capture: Frame #057 (select)
	Video Capture: Frame #058 (select)
	Video Capture: Frame #059 (select)

	test MMAP (select, CREATE_BUFS): OK

	Video Capture: Frame #000 (epoll)
	Video Capture: Frame #001 (epoll)
	Video Capture: Frame #002 (epoll)
	Video Capture: Frame #003 (epoll)
	Video Capture: Frame #004 (epoll)
	Video Capture: Frame #005 (epoll)
	Video Capture: Frame #006 (epoll)
	Video Capture: Frame #007 (epoll)
	Video Capture: Frame #008 (epoll)
	Video Capture: Frame #009 (epoll)
	Video Capture: Frame #010 (epoll)
	Video Capture: Frame #011 (epoll)
	Video Capture: Frame #012 (epoll)
	Video Capture: Frame #013 (epoll)
	Video Capture: Frame #014 (epoll)
	Video Capture: Frame #015 (epoll)
	Video Capture: Frame #016 (epoll)
	Video Capture: Frame #017 (epoll)
	Video Capture: Frame #018 (epoll)
	Video Capture: Frame #019 (epoll)
	Video Capture: Frame #020 (epoll)
	Video Capture: Frame #021 (epoll)
	Video Capture: Frame #022 (epoll)
	Video Capture: Frame #023 (epoll)
	Video Capture: Frame #024 (epoll)
	Video Capture: Frame #025 (epoll)
	Video Capture: Frame #026 (epoll)
	Video Capture: Frame #027 (epoll)
	Video Capture: Frame #028 (epoll)
	Video Capture: Frame #029 (epoll)
	Video Capture: Frame #030 (epoll)
	Video Capture: Frame #031 (epoll)
	Video Capture: Frame #032 (epoll)
	Video Capture: Frame #033 (epoll)
	Video Capture: Frame #034 (epoll)
	Video Capture: Frame #035 (epoll)
	Video Capture: Frame #036 (epoll)
	Video Capture: Frame #037 (epoll)
	Video Capture: Frame #038 (epoll)
	Video Capture: Frame #039 (epoll)
	Video Capture: Frame #040 (epoll)
	Video Capture: Frame #041 (epoll)
	Video Capture: Frame #042 (epoll)
	Video Capture: Frame #043 (epoll)
	Video Capture: Frame #044 (epoll)
	Video Capture: Frame #045 (epoll)
	Video Capture: Frame #046 (epoll)
	Video Capture: Frame #047 (epoll)
	Video Capture: Frame #048 (epoll)
	Video Capture: Frame #049 (epoll)
	Video Capture: Frame #050 (epoll)
	Video Capture: Frame #051 (epoll)
	Video Capture: Frame #052 (epoll)
	Video Capture: Frame #053 (epoll)
	Video Capture: Frame #054 (epoll)
	Video Capture: Frame #055 (epoll)
	Video Capture: Frame #056 (epoll)
	Video Capture: Frame #057 (epoll)
	Video Capture: Frame #058 (epoll)
	Video Capture: Frame #059 (epoll)

	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Total for uvcvideo device /dev/video0: 59, Succeeded: 58, Failed: 1, Warnings: 0

---
Changes in v10:
- Rebased on top of v7.3-rc1
- Add missing padding in ``struct virtio_media_cmd_mmap``
- Add ``virtio_media_config`` to uapi header and use proper ``cread`` during init
- Remove redundant assignment of ``vfl_type``
- Fix tear down order of the video device and resources in
  ``virtio_media_remove()``
- Call ``virtio_device_ready()`` before starting device
- Move from ``devm`` to manual memory management to prevent potential use after
  free
- Detach unused buffers from the virtqueues during device remove
- Remove wait timeout during kick command
- Fix use after free in case of transport-level error
- Add additional validity check for scatterlist data buffer
- Ensure PFNs are not truncated
- Use dynamic ``shadow_buffer_size`` in ``scatterlist_builder`` instead of the
  ``VIRTIO_SHADOW_BUF_SIZE`` constant to guard against future modifications
- Fix case where exact fit into a shadow buffer was wrongly rejected
- Fail early if ``virtio_get_shm_region()`` fails
- Move guest allocation before host call in ``reqbufs`` and ``createbufs``
- Clean up host-side mmap if ``io_remap_pfn_range()`` fails
- Ensure command failure returns in ``ext_controls`` ioctls
- Replace array ``vmalloc`` allocations with ``vcalloc`` for overflow protection
- Add check in ``dqbuf`` ioctl if no buffer is in the queue in case multiple
  threads call ``VIDIOC_DQBUF``
- Change ``copy_from_user()``/``copy_to_user()`` failure return value from
  ``EINVAL`` to ``EFAULT``
- Ensure reserved fields are initialized to zero
- Ensure ``device_type`` from config area is valid
- Set ``done`` flag after ``resp_len`` to address a race in the condition check
  fast path
- Do not leave host session open if guest allocations fail
- Rename ``errno`` to ``error`` in ``virtio_media`` UAPI to prevent
  compilation errors in userspaces apps that include ``errno.h``
- Keep user pages pinned during ``ext_ctrls`` request

Changes in v9:
- Removed note from cover letter about the dependency on the VIRTIO_ID_MEDIA
  patch since this was merged.

Changes in v8:
- Fix usage of integer types in uapi
- Add uapi header test exemption due to depenency on currently exempt videodev2.h

Changes in v7:
- Removed USERPTR feature
- Updated Kconfig dependency to include little endian and 64bit platforms (not
  only ARM and x86)
- Fixed incorrect constant in vfl_dir detection
- Clarified that error codes returned by the host are positive integers

Changes in v6:
- Added missing "WITH Linux-syscall-note" for SPDX-License-Identifier in
  ``include/uapi/linux/virtio_media.h``
- Rebased on top of v7.2-rc1

Changes in v5:
- Add DMA buffer alignment and padding for commands, responses, and the event
  buffer
- Corrected styling of kernel-doc comments
- Removed the configurable ``driver_name`` module parameter
- Moved the protocol to ``include/uapi/linux/virtio_media.h``
- Link to v4: https://lore.kernel.org/all/20260622204343.1994418-1-briandaniels@google.com/

Changes in v4:
- Rebased on top of v7.1-rc1
- Replace usages of filep->private_data with file_to_v4l2_fh()
  throughout the driver
- Link to v3: https://lore.kernel.org/r/20250412-virtio-media-v3-1-97dc94c18398@gmail.com

Changes in v3:
- Rebased on top of v6.15-rc1 and removes obsolete control callbacks.
- Link to v2: https://lore.kernel.org/r/20250201-virtio-media-v2-1-ac840681452d@gmail.com

Changes in v2:
- Fixed kernel test robot and media CI warnings (ignored a few false
  positives).
- Changed in-driver email address to personal one since my Google one
  will soon become invalid.
- Link to v1: https://lore.kernel.org/r/20250123-virtio-media-v1-1-81e2549b86b9@gmail.com

Brian Daniels (5):
  media: virtio: Add core driver and session management
  media: virtio: Add V4L2 ioctl forwarding infrastructure
  media: virtio: Add extended controls support
  media: virtio: Add buffer streaming, event handling, and poll
  media: virtio: Add MMAP buffer mapping support

 MAINTAINERS                                |    8 +
 drivers/media/Kconfig                      |   13 +
 drivers/media/Makefile                     |    2 +
 drivers/media/virtio/Makefile              |    7 +
 drivers/media/virtio/scatterlist_builder.c |  538 ++++++++
 drivers/media/virtio/scatterlist_builder.h |  113 ++
 drivers/media/virtio/session.h             |  135 ++
 drivers/media/virtio/virtio_media.h        |   95 ++
 drivers/media/virtio/virtio_media_driver.c | 1045 +++++++++++++++
 drivers/media/virtio/virtio_media_ioctls.c | 1377 ++++++++++++++++++++
 include/uapi/linux/virtio_media.h          |  309 +++++
 usr/include/Makefile                       |    1 +
 12 files changed, 3643 insertions(+)
 create mode 100644 drivers/media/virtio/Makefile
 create mode 100644 drivers/media/virtio/scatterlist_builder.c
 create mode 100644 drivers/media/virtio/scatterlist_builder.h
 create mode 100644 drivers/media/virtio/session.h
 create mode 100644 drivers/media/virtio/virtio_media.h
 create mode 100644 drivers/media/virtio/virtio_media_driver.c
 create mode 100644 drivers/media/virtio/virtio_media_ioctls.c
 create mode 100644 include/uapi/linux/virtio_media.h


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.56.0.317.g454f8302e1-goog

