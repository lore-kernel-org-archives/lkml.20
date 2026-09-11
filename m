Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91AE1E7C2E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789086923; cv=pass; b=sbyiIEz9+90hY3fLcOuczPQHNAiuaNYXIsFAc4fydr3BtmXdbkerx+lGszl2yqyUqaJq6ZyMqdrDRLjL/NLCdzi53b0pKPA7lTAiUxClisgoBy0iEzeLMxlpJTkWH36Rj9uB7f6GivnPdmlx/rUgS4KNckpdxmBvaJ9ruVBy0cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789086923; c=relaxed/simple;
	bh=FHYTJHUgBiPQVHaf8x8CtMmGOcvkZhnS8C1S+a+P8UA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=U9fPMgUpzpfHuG9i0CwksAaruACXlBBjNtOXlgACGktMg9YabtxdBdRbZ2TDqy77zRPpHzqnMzgKhTKMCn3+ud45L76szqWMPBNrMR1uFaTWJxfyDeen00idDKJXs1m5Gx0yMWKgFq4GTxDmbVu/YyzlyawFFCGI4AkqlVXX5VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=IqQhbijx; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="IqQhbijx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso322531a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:35:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789086919; cv=none;
        d=google.com; s=arc-20260327;
        b=F2ZrXvqvQv4myE35tq18H3pv1PhWFcnUplbTQTZLlmN/g80AlZtXa2eB8nuo1RzceU
         aTTZUL71pU0WyhaTlHxJi3MgLN0iUgjXwHaPew5eBsiaeVj8/AKmK+/Ilq74cY09iz9E
         GUleLB0Db9+PVotBt1NoTNf4qkWDTjId8p8i1YMN7HduYs87UKYoW5n2j7/hHgPCOJT9
         7W5DCDpwQVQ8/MYTtOf9wljvNzITLFHAWNvtfyqDKmU3fKly+3qZgWHjIqFiFXYt6ei0
         YhD7oiSKCXcXADaVvfXrHmBxwfi6vE9busSkecXywvUowELw/JBGCU09xnkxX0d2aplg
         yoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=35/cuQcCMNuVLsR/QLPhnICajmIks1g+J+Wf9VasODQ=;
        fh=gu4RDM6rOvYoKET5VdXZ3tyZwFzuwoWqS1pZooawD7I=;
        b=IhevPfZ2cwj6kQE5fLO6xebNPJG9NwlYaFLnpvtPsebpKkv1VdYrmnwRgUMIKwdjap
         YBAzQ1ACNpRh6bbevUhjgFwzHUglSd+khdKNKl40XJj7ybYJw0mEjZ15f9enKRZyWPKx
         gdFVcPAKTRIicRs4JPdqIdxSL8Rwn+sP8i8bh/XFXos4NGguEjdk0SxhYFpwPWpnAG2x
         Sd9NPJ5vP6srFbQUoWSyCZUwKC5NQSBTRv/T3esKpLKIKC67f9JeDosoUczHE54EeAOm
         DATci81oVry4/taCLE/wlUV9EyxV9MlhFMC0fq0d39pbGusUGq0btiH2BMIa8NrOnIZg
         DU7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789086919; x=1789691719; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=35/cuQcCMNuVLsR/QLPhnICajmIks1g+J+Wf9VasODQ=;
        b=IqQhbijxQUa75np3ChPUz1b9yirMfGcWnO6wVBrAt7vfiDpeMt+V9BU9YqhJelTPOt
         GY11xGISTNe38wchWds4/ezC/25m/GKxgfknRJhYPYnd26uHzSUcWJ5a7jzMrUA9DkAS
         xIFbnj993c7j0RQmd40a4f2dUthncpWXUpttkE4i6y9QWb06Wd8kEWSmBuePhjhChBOU
         d0CI8XvhuVOBq+TYueiLOb7goa+U2KJ2JyVN7KIMfYVIfkT6wztd/E/KdUcYwcG2WWEg
         pmBIoB9D/ncuBb28RZRSLK0BtCgFjRLYUfQlrfQ8NgBWCGnT5eZSLLQA1fcxrQcpc1g9
         01sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789086919; x=1789691719;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=35/cuQcCMNuVLsR/QLPhnICajmIks1g+J+Wf9VasODQ=;
        b=MHnepsef1tMpgC/0/VSmgshFcFgvQ3z6Z0bx6oVhLEE5ONWEjFJylIt01saId0/d0V
         dj7jM1Bjh02mLbuL1yphIWawsUSm4fEp+VPn4FqLTG/I8lS+9p3sbon4LnS+zYg/afW4
         cpWGK0VgWxvRXsZy5x0xv3vW2AEtNPjvgXS5ahuPmgmGjF6KjQ+45WejMFkcCp5KMDym
         OaIhAuFwPAmNckUTgYOEVwHtah0jTUynDUswDFzosGNakBSSzeI8TcrtlGDGyOK58NtJ
         j6JT0XhRUsqL23ubbnLGPx5IJttWZ3Ablyu8QsZRqCH2pFHeks9s2tEqX7zeesXBedpB
         bcHg==
X-Forwarded-Encrypted: i=1; AKwUvBzTazfQBuxPsXVf/jJtSzaMuWaOFaoqN7pUKdpLAFEUGlF/vmdLtuJvW+xmaeRyUtr8ylO7oobE4PHny64=@vger.kernel.org
X-Gm-Message-State: AFuF++nWYsgx013EiTpMPh+kur9a3P7LkWQY/v4ZE4+6R3nbpKHeO72s
	FlM516JGnEAf80U6iWsaF7n7ASxD3IPTGE6+h+NUWfSlxoJ2vdOgChc8sCaXk8Na4pmVNWBevRQ
	PkH7DnWCJ3LXe/PuLjCSgV962anRKbfEHQEXTaLeD
X-Gm-Gg: AYBFou2mi0I5P96nFFurljNAf1v1Jn6H50RsoREbYeuMk15ebhG72llxy3+XCGcaSzI
	hmV30PQSR1KuY1tCuX2C1a5VKd4Jf2UhiWbD0zsB3SrI+bp1eJ3IZA61p/l+7+7RqSK0brCttgm
	A2MePeFAEM6/i8QF0e9DqaUm5+F7LH+9CuqhJGu3/vPyEsIXNov0ze0PC7cN+AFMCu2GoHOqAYK
	2I+NOUHaCh/x35r+Wol19ktNN8lkiHu55geeHILvjoGjF5JR+mYlJofW3PNV/WcSnrELaYwfdue
	2YcAQopZhX8+3vK/z0rVK++sSaZuk210Mo2HbrrfGEbAumpzC5k8+P25N+D5RdBDNx9aNsvQ/Hn
	LagUxWKNstovQS5iNcDD8gfgjhCIyPJ8zQXVR4Pckzw==
X-Received: by 2002:a17:90b:1d45:b0:398:9be9:ab8f with SMTP id
 98e67ed59e1d1-39d9c21cf40mr2194092a91.20.1789086918364; Thu, 10 Sep 2026
 17:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Thu, 10 Sep 2026 17:35:07 -0700
X-Gm-Features: AcwNN1WndxPZb6WcY6gLGztxaGQvdpvjTbxm_Lz_Mnk8fDdEdK5qucfYzxSTBUo
Message-ID: <CA+0ovCgwFKs6GQcMtygG6LV+Raag6MdpqJK2UA-C2UTLhc=qug@mail.gmail.com>
Subject: [BUG] KASAN: slab-use-after-free Write in media_devnode_remove
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Farhad Alemi <falemi@asu.edu>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000003ea7ca065b2a429c"

--0000000000003ea7ca065b2a429c
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached and a
proposed patch forthcoming):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   50.855615][ T2232] usb 3-1: new high-speed USB device number 2
using dummy_hcd
[   51.026953][ T2232] usb 3-1: New USB device found, idVendor=1d19,
idProduct=6108, bcdDevice= 1.00
[   51.029344][ T2232] usb 3-1: New USB device strings: Mfr=0,
Product=0, SerialNumber=0
[   51.051658][ T2232] cx231xx 3-1:1.1: New device   @ 480 Mbps
(1d19:6108) with 2 interfaces
[   51.055021][ T2232] cx231xx 3-1:1.1: Identified as Pixelview
Xcapture USB (card=11)
[   51.081696][ T2232] i2c i2c-3: Added multiplexed i2c bus 5
[   51.089372][ T2232] i2c i2c-3: Added multiplexed i2c bus 6
[   51.264419][ T2232] cx231xx 3-1:1.1: can't change interface 3 alt
no. to 0 (err=-22)
[   51.264437][ T2232] cx231xx 3-1:1.1: can't change interface 5 alt
no. to 0 (err=-22)
[   51.287448][ T2232] cx25840 2-0044: Unable to detect h/w, assuming cx23887
[   51.287927][ T2232] cx25840 2-0044: cx23887 A/V decoder found @
0x88 (cx231xx #0-0)
[   51.329008][ T9335] cx25840 2-0044: Direct firmware load for
v4l-cx23885-avcore-01.fw failed with error -2
[   51.329023][ T9335] cx25840 2-0044: Falling back to sysfs fallback
for: v4l-cx23885-avcore-01.fw
[   51.333195][ T9335] cx25840 2-0044: unable to open firmware
v4l-cx23885-avcore-01.fw
[   51.375824][ T2232] cx231xx 3-1:1.1: v4l2 driver version 0.0.3
[   51.476296][ T2232] cx231xx 3-1:1.1: Registered video device video103 [v4l2]
[   51.476315][ T2232] videodev: could not get a free minor
[   51.476319][ T2232] cx231xx 3-1:1.1: unable to register vbi device
[   51.476350][ T2232] cx231xx 3-1:1.1: V4L2 device video103 deregistered
[   51.479869][ T2232]
==================================================================
[   51.479875][ T2232] BUG: KASAN: slab-use-after-free in
__mutex_lock+0x156/0x1580
[   51.479899][ T2232] Read of size 8 at addr ffff888027dbb1b0 by task
kworker/0:3/2232
[   51.479905][ T2232]
[   51.479915][ T2232] CPU: 0 UID: 0 PID: 2232 Comm: kworker/0:3 Not
tainted 7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   51.479924][ T2232] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   51.479929][ T2232] Workqueue: usb_hub_wq hub_event
[   51.479949][ T2232] Call Trace:
[   51.479954][ T2232]  <TASK>
[   51.479959][ T2232]  dump_stack_lvl+0xe8/0x150
[   51.479969][ T2232]  print_address_description+0x55/0x1e0
[   51.479978][ T2232]  ? __mutex_lock+0x156/0x1580
[   51.479984][ T2232]  print_report+0x58/0x70
[   51.479990][ T2232]  kasan_report+0x117/0x150
[   51.480002][ T2232]  ? __mutex_lock+0x156/0x1580
[   51.480009][ T2232]  __mutex_lock+0x156/0x1580
[   51.480017][ T2232]  ? media_devnode_remove+0x55/0x1e0
[   51.480028][ T2232]  ? v4l2_device_release+0x1f2/0x470
[   51.480039][ T2232]  ? __pfx___mutex_lock+0x10/0x10
[   51.480045][ T2232]  ? __mutex_unlock_slowpath+0x731/0x900
[   51.480056][ T2232]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
[   51.480066][ T2232]  ? cdev_dynamic_release+0x1a5/0x1c0
[   51.480077][ T2232]  media_devnode_remove+0x55/0x1e0
[   51.480088][ T2232]  v4l2_device_release+0x271/0x470
[   51.480098][ T2232]  ? __pfx_v4l2_device_release+0x10/0x10
[   51.480108][ T2232]  device_release+0xc4/0x1f0
[   51.480126][ T2232]  kobject_put+0x228/0x560
[   51.480135][ T2232]  cx231xx_release_analog_resources+0x290/0x2b0
[   51.480145][ T2232]  cx231xx_usb_probe+0x113b/0x2100
[   51.480157][ T2232]  usb_probe_interface+0x71f/0xe00
[   51.480179][ T2232]  ? __pfx_usb_probe_interface+0x10/0x10
[   51.480190][ T2232]  ? driver_sysfs_add+0x1fe/0x210
[   51.480198][ T2232]  ? __pfx_usb_probe_interface+0x10/0x10
[   51.480206][ T2232]  really_probe+0x267/0xaf0
[   51.480215][ T2232]  __driver_probe_device+0x1e2/0x350
[   51.480223][ T2232]  driver_probe_device+0x4f/0x240
[   51.480231][ T2232]  __device_attach_driver+0x270/0x410
[   51.480239][ T2232]  bus_for_each_drv+0x258/0x2f0
[   51.480248][ T2232]  ? __pfx___device_attach_driver+0x10/0x10
[   51.480256][ T2232]  ? __pfx_bus_for_each_drv+0x10/0x10
[   51.480265][ T2232]  ? _raw_spin_unlock_irqrestore+0x4c/0x80
[   51.480275][ T2232]  __device_attach+0x2c5/0x450
[   51.480283][ T2232]  ? __pfx___device_attach+0x10/0x10
[   51.480291][ T2232]  ? _raw_spin_unlock+0x28/0x50
[   51.480299][ T2232]  device_initial_probe+0xa1/0xd0
[   51.480307][ T2232]  bus_probe_device+0x12a/0x220
[   51.480316][ T2232]  device_add+0x7ec/0xb90
[   51.480323][ T2232]  usb_set_configuration+0x1a87/0x2110
[   51.480336][ T2232]  usb_generic_driver_probe+0x8d/0x150
[   51.480345][ T2232]  usb_probe_device+0x1c4/0x3b0
[   51.480354][ T2232]  ? __pfx_usb_probe_device+0x10/0x10
[   51.480363][ T2232]  really_probe+0x267/0xaf0
[   51.480371][ T2232]  __driver_probe_device+0x1e2/0x350
[   51.480379][ T2232]  driver_probe_device+0x4f/0x240
[   51.480386][ T2232]  __device_attach_driver+0x270/0x410
[   51.480395][ T2232]  bus_for_each_drv+0x258/0x2f0
[   51.480404][ T2232]  ? __pfx___device_attach_driver+0x10/0x10
[   51.480411][ T2232]  ? __pfx_bus_for_each_drv+0x10/0x10
[   51.480421][ T2232]  ? _raw_spin_unlock_irqrestore+0x4c/0x80
[   51.480430][ T2232]  __device_attach+0x2c5/0x450
[   51.480437][ T2232]  ? __pfx___device_attach+0x10/0x10
[   51.480445][ T2232]  ? _raw_spin_unlock+0x28/0x50
[   51.480453][ T2232]  device_initial_probe+0xa1/0xd0
[   51.480461][ T2232]  bus_probe_device+0x12a/0x220
[   51.480470][ T2232]  device_add+0x7ec/0xb90
[   51.480477][ T2232]  usb_new_device+0xa14/0x1720
[   51.480486][ T2232]  ? __pfx_usb_new_device+0x10/0x10
[   51.480493][ T2232]  ? _raw_spin_unlock_irq+0x23/0x50
[   51.480502][ T2232]  hub_event+0x2a1c/0x4f30
[   51.480510][ T2232]  ? do_raw_spin_unlock+0xf5/0x200
[   51.480524][ T2232]  ? __pfx_hub_event+0x10/0x10
[   51.480533][ T2232]  ? process_scheduled_works+0x94e/0x1900
[   51.480544][ T2232]  ? process_scheduled_works+0x94e/0x1900
[   51.480554][ T2232]  ? process_scheduled_works+0x94e/0x1900
[   51.480564][ T2232]  process_scheduled_works+0xc99/0x1900
[   51.480578][ T2232]  ? __pfx_process_scheduled_works+0x10/0x10
[   51.480588][ T2232]  ? assign_work+0x3d5/0x5e0
[   51.480599][ T2232]  worker_thread+0xa53/0xfc0
[   51.480609][ T2232]  kthread+0x38b/0x480
[   51.480617][ T2232]  ? __pfx_worker_thread+0x10/0x10
[   51.480623][ T2232]  ? __pfx_kthread+0x10/0x10
[   51.480631][ T2232]  ret_from_fork+0x514/0xb70
[   51.480639][ T2232]  ? __pfx_ret_from_fork+0x10/0x10
[   51.480647][ T2232]  ? __switch_to+0xc79/0x1410
[   51.480654][ T2232]  ? __pfx_kthread+0x10/0x10
[   51.480661][ T2232]  ret_from_fork_asm+0x1a/0x30
[   51.480671][ T2232]  </TASK>
[   51.480674][ T2232]
[   51.480678][ T2232] Allocated by task 2232:
[   51.480681][ T2232]  kasan_save_track+0x3e/0x80
[   51.480689][ T2232]  __kasan_kmalloc+0x93/0xb0
[   51.480697][ T2232]  __kmalloc_cache_noprof+0x325/0x610
[   51.480705][ T2232]  cx231xx_usb_probe+0x7de/0x2100
[   51.480713][ T2232]  usb_probe_interface+0x71f/0xe00
[   51.480721][ T2232]  really_probe+0x267/0xaf0
[   51.480727][ T2232]  __driver_probe_device+0x1e2/0x350
[   51.480734][ T2232]  driver_probe_device+0x4f/0x240
[   51.480740][ T2232]  __device_attach_driver+0x270/0x410
[   51.480747][ T2232]  bus_for_each_drv+0x258/0x2f0
[   51.480755][ T2232]  __device_attach+0x2c5/0x450
[   51.480761][ T2232]  device_initial_probe+0xa1/0xd0
[   51.480769][ T2232]  bus_probe_device+0x12a/0x220
[   51.480777][ T2232]  device_add+0x7ec/0xb90
[   51.480782][ T2232]  usb_set_configuration+0x1a87/0x2110
[   51.480790][ T2232]  usb_generic_driver_probe+0x8d/0x150
[   51.480797][ T2232]  usb_probe_device+0x1c4/0x3b0
[   51.480805][ T2232]  really_probe+0x267/0xaf0
[   51.480812][ T2232]  __driver_probe_device+0x1e2/0x350
[   51.480818][ T2232]  driver_probe_device+0x4f/0x240
[   51.480825][ T2232]  __device_attach_driver+0x270/0x410
[   51.480831][ T2232]  bus_for_each_drv+0x258/0x2f0
[   51.480839][ T2232]  __device_attach+0x2c5/0x450
[   51.480845][ T2232]  device_initial_probe+0xa1/0xd0
[   51.480851][ T2232]  bus_probe_device+0x12a/0x220
[   51.480859][ T2232]  device_add+0x7ec/0xb90
[   51.480865][ T2232]  usb_new_device+0xa14/0x1720
[   51.480870][ T2232]  hub_event+0x2a1c/0x4f30
[   51.480877][ T2232]  process_scheduled_works+0xc99/0x1900
[   51.480887][ T2232]  worker_thread+0xa53/0xfc0
[   51.480892][ T2232]  kthread+0x38b/0x480
[   51.480899][ T2232]  ret_from_fork+0x514/0xb70
[   51.480906][ T2232]  ret_from_fork_asm+0x1a/0x30
[   51.480912][ T2232]
[   51.480914][ T2232] Freed by task 2232:
[   51.480917][ T2232]  kasan_save_track+0x3e/0x80
[   51.480924][ T2232]  kasan_save_free_info+0x46/0x50
[   51.480931][ T2232]  __kasan_slab_free+0x5c/0x80
[   51.480938][ T2232]  kfree+0x1c5/0x650
[   51.480944][ T2232]  cx231xx_usb_probe+0x10cb/0x2100
[   51.480953][ T2232]  usb_probe_interface+0x71f/0xe00
[   51.480961][ T2232]  really_probe+0x267/0xaf0
[   51.480967][ T2232]  __driver_probe_device+0x1e2/0x350
[   51.480974][ T2232]  driver_probe_device+0x4f/0x240
[   51.480980][ T2232]  __device_attach_driver+0x270/0x410
[   51.480987][ T2232]  bus_for_each_drv+0x258/0x2f0
[   51.480995][ T2232]  __device_attach+0x2c5/0x450
[   51.481001][ T2232]  device_initial_probe+0xa1/0xd0
[   51.481007][ T2232]  bus_probe_device+0x12a/0x220
[   51.481015][ T2232]  device_add+0x7ec/0xb90
[   51.481021][ T2232]  usb_set_configuration+0x1a87/0x2110
[   51.481028][ T2232]  usb_generic_driver_probe+0x8d/0x150
[   51.481035][ T2232]  usb_probe_device+0x1c4/0x3b0
[   51.481043][ T2232]  really_probe+0x267/0xaf0
[   51.481050][ T2232]  __driver_probe_device+0x1e2/0x350
[   51.481056][ T2232]  driver_probe_device+0x4f/0x240
[   51.481063][ T2232]  __device_attach_driver+0x270/0x410
[   51.481070][ T2232]  bus_for_each_drv+0x258/0x2f0
[   51.481078][ T2232]  __device_attach+0x2c5/0x450
[   51.481083][ T2232]  device_initial_probe+0xa1/0xd0
[   51.481090][ T2232]  bus_probe_device+0x12a/0x220
[   51.481098][ T2232]  device_add+0x7ec/0xb90
[   51.481103][ T2232]  usb_new_device+0xa14/0x1720
[   51.481109][ T2232]  hub_event+0x2a1c/0x4f30
[   51.481120][ T2232]  process_scheduled_works+0xc99/0x1900
[   51.481129][ T2232]  worker_thread+0xa53/0xfc0
[   51.481135][ T2232]  kthread+0x38b/0x480
[   51.481141][ T2232]  ret_from_fork+0x514/0xb70
[   51.481148][ T2232]  ret_from_fork_asm+0x1a/0x30
[   51.481155][ T2232]
[   51.481157][ T2232] The buggy address belongs to the object at
ffff888027dbb000
[   51.481157][ T2232]  which belongs to the cache kmalloc-1k of size 1024
[   51.481165][ T2232] The buggy address is located 432 bytes inside of
[   51.481165][ T2232]  freed 1024-byte region [ffff888027dbb000,
ffff888027dbb400)
[   51.481172][ T2232]
[   51.481174][ T2232] The buggy address belongs to the physical page:
[   51.481181][ T2232] page: refcount:0 mapcount:0
mapping:0000000000000000 index:0xffff888027db8800 pfn:0x27db8
[   51.481189][ T2232] head: order:3 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[   51.481194][ T2232] flags:
0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
[   51.481205][ T2232] page_type: f5(slab)
[   51.481214][ T2232] raw: 00fff00000000240 ffff88801b041dc0
ffffea0000953210 ffffea00009fd610
[   51.481220][ T2232] raw: ffff888027db8800 000000000010000f
00000000f5000000 0000000000000000
[   51.481226][ T2232] head: 00fff00000000240 ffff88801b041dc0
ffffea0000953210 ffffea00009fd610
[   51.481232][ T2232] head: ffff888027db8800 000000000010000f
00000000f5000000 0000000000000000
[   51.481237][ T2232] head: 00fff00000000003 fffffffffffffe01
00000000ffffffff 00000000ffffffff
[   51.481243][ T2232] head: ffffffffffffffff 0000000000000000
00000000ffffffff 0000000000000008
[   51.481246][ T2232] page dumped because: kasan: bad access detected
[   51.481252][ T2232] page_owner tracks the page as allocated
[   51.481255][ T2232] page last allocated via order 3, migratetype
Unmovable, gfp_mask
0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC),
pid 9116, tgid 9116 ((spawn)), ts 30296335129
[   51.481266][ T2232]  post_alloc_hook+0x1f9/0x250
[   51.481273][ T2232]  get_page_from_freelist+0x235a/0x23e0
[   51.481281][ T2232]  __alloc_frozen_pages_noprof+0x217/0x5a0
[   51.481289][ T2232]  allocate_slab+0x7d/0x610
[   51.481295][ T2232]  refill_objects+0x2d6/0x350
[   51.481300][ T2232]  __pcs_replace_empty_main+0x2c9/0x6c0
[   51.481309][ T2232]  __kmalloc_noprof+0x48b/0x720
[   51.481316][ T2232]  load_elf_binary+0x2c4/0x2870
[   51.481326][ T2232]  bprm_execve+0x953/0x15c0
[   51.481333][ T2232]  do_execveat_common+0x510/0x690
[   51.481340][ T2232]  __x64_sys_execve+0x97/0xc0
[   51.481347][ T2232]  do_syscall_64+0x155/0x510
[   51.481357][ T2232]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   51.481363][ T2232] page last free pid 5218 tgid 5218 ts
26687208013 stack trace:
[   51.481368][ T2232]  __free_frozen_pages+0xc9f/0xd90
[   51.481374][ T2232]  __slab_free+0x274/0x2c0
[   51.481381][ T2232]  qlist_free_all+0x99/0x100
[   51.481389][ T2232]  kasan_quarantine_reduce+0x148/0x160
[   51.481397][ T2232]  __kasan_slab_alloc+0x22/0x80
[   51.481404][ T2232]  kmem_cache_alloc_noprof+0x2bd/0x610
[   51.481411][ T2232]  do_getname+0x2e/0x250
[   51.481419][ T2232]  do_sys_openat2+0xcc/0x200
[   51.481429][ T2232]  __x64_sys_openat+0x138/0x170
[   51.481438][ T2232]  do_syscall_64+0x155/0x510
[   51.481446][ T2232]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   51.481453][ T2232]
[   51.481454][ T2232] Memory state around the buggy address:
[   51.481458][ T2232]  ffff888027dbb080: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   51.481462][ T2232]  ffff888027dbb100: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   51.481466][ T2232] >ffff888027dbb180: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   51.481470][ T2232]                                      ^
[   51.481473][ T2232]  ffff888027dbb200: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   51.481477][ T2232]  ffff888027dbb280: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   51.481481][ T2232]
==================================================================
[   51.483364][ T2232] Kernel panic - not syncing: KASAN: panic_on_warn set ...
[   51.599792][ T2232] CPU: 0 UID: 0 PID: 2232 Comm: kworker/0:3 Not
tainted 7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   51.600868][ T2232] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   51.601909][ T2232] Workqueue: usb_hub_wq hub_event
[   51.602476][ T2232] Call Trace:
[   51.602810][ T2232]  <TASK>
[   51.603106][ T2232]  vpanic+0x56d/0xa60
[   51.603522][ T2232]  ? __pfx_vpanic+0x10/0x10
[   51.603982][ T2232]  panic+0xc5/0xd0
[   51.604365][ T2232]  ? __pfx_panic+0x10/0x10
[   51.604807][ T2232]  ? preempt_schedule_thunk+0x16/0x40
[   51.605350][ T2232]  ? __mutex_lock+0x156/0x1580
[   51.605826][ T2232]  ? preempt_schedule_thunk+0x16/0x40
[   51.606361][ T2232]  ? __mutex_lock+0x156/0x1580
[   51.606833][ T2232]  check_panic_on_warn+0x89/0xb0
[   51.607331][ T2232]  ? __mutex_lock+0x156/0x1580
[   51.607803][ T2232]  end_report+0x73/0x170
[   51.608232][ T2232]  ? __mutex_lock+0x156/0x1580
[   51.608705][ T2232]  kasan_report+0x128/0x150
[   51.609162][ T2232]  ? __mutex_lock+0x156/0x1580
[   51.609663][ T2232]  __mutex_lock+0x156/0x1580
[   51.610126][ T2232]  ? media_devnode_remove+0x55/0x1e0
[   51.610651][ T2232]  ? v4l2_device_release+0x1f2/0x470
[   51.611178][ T2232]  ? __pfx___mutex_lock+0x10/0x10
[   51.611699][ T2232]  ? __mutex_unlock_slowpath+0x731/0x900
[   51.612328][ T2232]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
[   51.612918][ T2232]  ? cdev_dynamic_release+0x1a5/0x1c0
[   51.613455][ T2232]  media_devnode_remove+0x55/0x1e0
[   51.613964][ T2232]  v4l2_device_release+0x271/0x470
[   51.614499][ T2232]  ? __pfx_v4l2_device_release+0x10/0x10
[   51.615057][ T2232]  device_release+0xc4/0x1f0
[   51.615525][ T2232]  kobject_put+0x228/0x560
[   51.615977][ T2232]  cx231xx_release_analog_resources+0x290/0x2b0
[   51.616580][ T2232]  cx231xx_usb_probe+0x113b/0x2100
[   51.617078][ T2232]  usb_probe_interface+0x71f/0xe00
[   51.617578][ T2232]  ? __pfx_usb_probe_interface+0x10/0x10
[   51.618122][ T2232]  ? driver_sysfs_add+0x1fe/0x210
[   51.618636][ T2232]  ? __pfx_usb_probe_interface+0x10/0x10
[   51.619198][ T2232]  really_probe+0x267/0xaf0
[   51.619650][ T2232]  __driver_probe_device+0x1e2/0x350
[   51.620177][ T2232]  driver_probe_device+0x4f/0x240
[   51.620678][ T2232]  __device_attach_driver+0x270/0x410
[   51.621213][ T2232]  bus_for_each_drv+0x258/0x2f0
[   51.621697][ T2232]  ? __pfx___device_attach_driver+0x10/0x10
[   51.622379][ T2232]  ? __pfx_bus_for_each_drv+0x10/0x10
[   51.622915][ T2232]  ? _raw_spin_unlock_irqrestore+0x4c/0x80
[   51.623499][ T2232]  __device_attach+0x2c5/0x450
[   51.623975][ T2232]  ? __pfx___device_attach+0x10/0x10
[   51.624543][ T2232]  ? _raw_spin_unlock+0x28/0x50
[   51.625053][ T2232]  device_initial_probe+0xa1/0xd0
[   51.625583][ T2232]  bus_probe_device+0x12a/0x220
[   51.626068][ T2232]  device_add+0x7ec/0xb90
[   51.626503][ T2232]  usb_set_configuration+0x1a87/0x2110
[   51.627047][ T2232]  usb_generic_driver_probe+0x8d/0x150
[   51.627589][ T2232]  usb_probe_device+0x1c4/0x3b0
[   51.628074][ T2232]  ? __pfx_usb_probe_device+0x10/0x10
[   51.628619][ T2232]  really_probe+0x267/0xaf0
[   51.629092][ T2232]  __driver_probe_device+0x1e2/0x350
[   51.629643][ T2232]  driver_probe_device+0x4f/0x240
[   51.630146][ T2232]  __device_attach_driver+0x270/0x410
[   51.630679][ T2232]  bus_for_each_drv+0x258/0x2f0
[   51.631193][ T2232]  ? __pfx___device_attach_driver+0x10/0x10
[   51.631773][ T2232]  ? __pfx_bus_for_each_drv+0x10/0x10
[   51.632366][ T2232]  ? _raw_spin_unlock_irqrestore+0x4c/0x80
[   51.632939][ T2232]  __device_attach+0x2c5/0x450
[   51.633418][ T2232]  ? __pfx___device_attach+0x10/0x10
[   51.633937][ T2232]  ? _raw_spin_unlock+0x28/0x50
[   51.634424][ T2232]  device_initial_probe+0xa1/0xd0
[   51.634929][ T2232]  bus_probe_device+0x12a/0x220
[   51.635447][ T2232]  device_add+0x7ec/0xb90
[   51.635875][ T2232]  usb_new_device+0xa14/0x1720
[   51.636361][ T2232]  ? __pfx_usb_new_device+0x10/0x10
[   51.636877][ T2232]  ? _raw_spin_unlock_irq+0x23/0x50
[   51.637402][ T2232]  hub_event+0x2a1c/0x4f30
[   51.637845][ T2232]  ? do_raw_spin_unlock+0xf5/0x200
[   51.638365][ T2232]  ? __pfx_hub_event+0x10/0x10
[   51.638840][ T2232]  ? process_scheduled_works+0x94e/0x1900
[   51.639405][ T2232]  ? process_scheduled_works+0x94e/0x1900
[   51.639966][ T2232]  ? process_scheduled_works+0x94e/0x1900
[   51.640536][ T2232]  process_scheduled_works+0xc99/0x1900
[   51.641094][ T2232]  ? __pfx_process_scheduled_works+0x10/0x10
[   51.641691][ T2232]  ? assign_work+0x3d5/0x5e0
[   51.642233][ T2232]  worker_thread+0xa53/0xfc0
[   51.642696][ T2232]  kthread+0x38b/0x480
[   51.643106][ T2232]  ? __pfx_worker_thread+0x10/0x10
[   51.643614][ T2232]  ? __pfx_kthread+0x10/0x10
[   51.644077][ T2232]  ret_from_fork+0x514/0xb70
[   51.644559][ T2232]  ? __pfx_ret_from_fork+0x10/0x10
[   51.645066][ T2232]  ? __switch_to+0xc79/0x1410
[   51.645539][ T2232]  ? __pfx_kthread+0x10/0x10
[   51.645999][ T2232]  ret_from_fork_asm+0x1a/0x30
[   51.646499][ T2232]  </TASK>
[   51.647104][ T2232] Kernel Offset: disabled
[   51.647657][ T2232] Rebooting in 86400 seconds..

Regards,
SEFCOM Lab @ ASU

--0000000000003ea7ca065b2a429c
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtw859p20>
X-Attachment-Id: f_mtw859p20

LyoKICogMjI3LWthc2FuLXNsYWItdXNlLWFmdGVyLWZyZWUtd3JpdGUtaW4tbWVkaWEtZGV2bm9k
ZS1yZW1vdmUKICovCiNkZWZpbmUgX0dOVV9TT1VSQ0UKI2luY2x1ZGUgPGRpcmVudC5oPgojaW5j
bHVkZSA8ZXJybm8uaD4KI2luY2x1ZGUgPGZjbnRsLmg+CiNpbmNsdWRlIDxwdGhyZWFkLmg+CiNp
bmNsdWRlIDxzdGRpbnQuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4K
I2luY2x1ZGUgPHN5cy9pb2N0bC5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CgojaW5jbHVkZSA8bGlu
dXgvdXNiL2NoOS5oPgojaW5jbHVkZSA8bGludXgvdXNiL3Jhd19nYWRnZXQuaD4KCiNkZWZpbmUg
RVAwX01BWF9QQUNLRVRfQlVGRkVSIDQwOTYKI2RlZmluZSBMRTE2KHYpICgodikgJiAweGZmKSwg
KCgodikgPj4gOCkgJiAweGZmKQoKLyogVG90YWwgdmlkZW9kZXYgbWlub3JzOyBjeDIzMXh4IG11
c3QgZ2V0IHRoZSBsYXN0IGZyZWUgb25lIGZvciBpdHMgdmlkZW8KICogbm9kZSBhbmQgdGhlbiBm
aW5kIG5vbmUgbGVmdCBmb3IgaXRzIFZCSSBub2RlIC0tIHNlZSBtYWluKCkuICovCiNkZWZpbmUg
VjRMMl9UT1RBTF9NSU5PUlMgMjU2CgpzdGF0aWMgaW50IHJhd19nYWRnZXRfZmQgPSAtMTsKCi8q
CiAqIGN4MjMxeHhfdXNiX3Byb2JlKCkgcmVqZWN0cyBhbnl0aGluZyB3aG9zZSBiSW50ZXJmYWNl
TnVtYmVyICE9IDEgYW5kIHRoZW4KICogZGVtYW5kcyB1ZGV2LT5hY3Rjb25maWctPmludGZfYXNz
b2NbMF0tPmJGaXJzdEludGVyZmFjZSA9PSAxLCBzbyB0aGUgY29uZmlnCiAqIG5lZWRzIGEgZHVt
bXkgaW50ZXJmYWNlIDAgcGx1cyBhbiBJQUQgaW4gZnJvbnQgb2YgaW50ZXJmYWNlIDEuCiAqLwpz
dGF0aWMgY29uc3QgdWludDhfdCBjb25maWdfZGVzY3JpcHRvcltdID0gewoJLyogY29uZmlndXJh
dGlvbjogMiBpbnRlcmZhY2VzICovCgk5LCBVU0JfRFRfQ09ORklHLCBMRTE2KDkgKyA5ICsgOCAr
IDkgKyA3ICsgNyksIDIsIDEsIDAsIDB4YTAsIDB4ZmEsCgkvKiBpbnRlcmZhY2UgMCAtLSB0aGUg
IklSIiBpbnRlcmZhY2UgY3gyMzF4eCBza2lwcyAqLwoJOSwgVVNCX0RUX0lOVEVSRkFDRSwgMCwg
MCwgMCwgMHhmZiwgMHhmZiwgMHhmZiwgMCwKCS8qIGludGVyZmFjZSBhc3NvY2lhdGlvbjogYkZp
cnN0SW50ZXJmYWNlID0gMSwgY291bnQgMSAqLwoJOCwgVVNCX0RUX0lOVEVSRkFDRV9BU1NPQ0lB
VElPTiwgMSwgMSwgMHhmZiwgMHhmZiwgMHhmZiwgMCwKCS8qIGludGVyZmFjZSAxIC0tIHRoZSBB
ViBpbnRlcmZhY2UgY3gyMzF4eCBiaW5kcyB0byAqLwoJOSwgVVNCX0RUX0lOVEVSRkFDRSwgMSwg
MCwgMiwgMHhmZiwgMHhmZiwgMHhmZiwgMCwKCTcsIFVTQl9EVF9FTkRQT0lOVCwgMHg4MSwgVVNC
X0VORFBPSU5UX1hGRVJfQlVMSywgTEUxNig1MTIpLCAwLAoJNywgVVNCX0RUX0VORFBPSU5ULCAw
eDAyLCBVU0JfRU5EUE9JTlRfWEZFUl9CVUxLLCBMRTE2KDUxMiksIDAsCn07CgpzdGF0aWMgc3Ry
dWN0IHVzYl9kZXZpY2VfZGVzY3JpcHRvciBkZXZpY2VfZGVzY3JpcHRvciA9IHsKCS5iTGVuZ3Ro
ID0gc2l6ZW9mKHN0cnVjdCB1c2JfZGV2aWNlX2Rlc2NyaXB0b3IpLAoJLmJEZXNjcmlwdG9yVHlw
ZSA9IFVTQl9EVF9ERVZJQ0UsCgkuYmNkVVNCID0gMHgwMjAwLAoJLmJEZXZpY2VDbGFzcyA9IDB4
ZWYsCQkvKiBtaXNjZWxsYW5lb3VzIC8gSUFEICovCgkuYkRldmljZVN1YkNsYXNzID0gMHgwMiwK
CS5iRGV2aWNlUHJvdG9jb2wgPSAweDAxLAoJLmJNYXhQYWNrZXRTaXplMCA9IDY0LAoJLmlkVmVu
ZG9yID0gMHgxZDE5LAkJLyogUGl4ZWx2aWV3IFhjYXB0dXJlIFVTQiwgY2FyZD0xMSAqLwoJLmlk
UHJvZHVjdCA9IDB4NjEwOCwKCS5iY2REZXZpY2UgPSAweDAxMDAsCgkuYk51bUNvbmZpZ3VyYXRp
b25zID0gMSwKfTsKCnN0YXRpYyBpbnQgZXAwX3dyaXRlKGNvbnN0IHZvaWQgKmRhdGEsIHVpbnQz
Ml90IGxlbmd0aCkKewoJdWludDhfdCBidWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2VwX2lv
KSArIEVQMF9NQVhfUEFDS0VUX0JVRkZFUl07CglzdHJ1Y3QgdXNiX3Jhd19lcF9pbyAqaW8gPSAo
dm9pZCAqKWJ1ZmZlcjsKCglpZiAobGVuZ3RoID4gRVAwX01BWF9QQUNLRVRfQlVGRkVSKQoJCWxl
bmd0aCA9IEVQMF9NQVhfUEFDS0VUX0JVRkZFUjsKCWlvLT5lcCA9IDA7Cglpby0+ZmxhZ3MgPSAw
OwoJaW8tPmxlbmd0aCA9IGxlbmd0aDsKCWlmIChsZW5ndGgpCgkJbWVtY3B5KGlvLT5kYXRhLCBk
YXRhLCBsZW5ndGgpOwoJcmV0dXJuIGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExf
RVAwX1dSSVRFLCBpbyk7Cn0KCi8qCiAqIGN4MjMxeHggdGFsa3MgdG8gaXRzIEFGRS9BViBjb3Jl
IG92ZXIgYW4gaTJjIG1hc3RlciBpbXBsZW1lbnRlZCBhcyB2ZW5kb3IKICogY29udHJvbCByZXF1
ZXN0czogYlJlcXVlc3QgMC4uMiB3cml0ZSBvbiBpMmMgYnVzIE4sIGJSZXF1ZXN0IDQuLjYgcmVh
ZC4KICogU2V2ZXJhbCBvZiBpdHMgaW5pdCBsb29wcyBhcmUgIndyaXRlIFIsIHJlYWQgUiBiYWNr
LCByZXBlYXQgdW50aWwgaXQgcmVhZHMKICogd2hhdCBJIHdyb3RlIiAoY3gyMzF4eC1hdmNvcmUu
YzoxNDMsIDozNTIsIDozODUsIDo0MDksIDo0NDIpLiAgQW5zd2VyaW5nCiAqIHJlYWRzIHdpdGgg
emVyb2VzIG1ha2VzIHRob3NlIHNwaW4sIHNvIHByb2JlIG5ldmVyIGdldHMgbmVhciB0aGUgdmlk
ZW8KICogZGV2aWNlLiAgTW9kZWwgdGhlIGRldmljZSBhcyBwbGFpbiBtZW1vcnkgaW5zdGVhZDog
cmVtZW1iZXIgd2hhdCB3YXMKICogd3JpdHRlbiBhbmQgaGFuZCBpdCBiYWNrLgogKi8Kc3RydWN0
IHJlZ2lzdGVyX2NlbGwgewoJaW50IHVzZWQ7Cgl1aW50MzJfdCBrZXk7Cgl1aW50OF90IGxlbmd0
aDsKCXVpbnQ4X3QgdmFsdWVbMTZdOwp9OwpzdGF0aWMgc3RydWN0IHJlZ2lzdGVyX2NlbGwgcmVn
aXN0ZXJfZmlsZVsxMDI0XTsKCnN0YXRpYyBzdHJ1Y3QgcmVnaXN0ZXJfY2VsbCAqcmVnaXN0ZXJf
bG9va3VwKHVpbnQzMl90IGtleSwgaW50IGNyZWF0ZSkKewoJdW5zaWduZWQgaW50IHNsb3QgPSAo
a2V5ICogMjY1NDQzNTc2MXUpICUgMTAyNCwgaTsKCglmb3IgKGkgPSAwOyBpIDwgMTAyNDsgaSsr
KSB7CgkJc3RydWN0IHJlZ2lzdGVyX2NlbGwgKmNlbGwgPSAmcmVnaXN0ZXJfZmlsZVsoc2xvdCAr
IGkpICUgMTAyNF07CgoJCWlmIChjZWxsLT51c2VkICYmIGNlbGwtPmtleSA9PSBrZXkpCgkJCXJl
dHVybiBjZWxsOwoJCWlmICghY2VsbC0+dXNlZCkgewoJCQlpZiAoIWNyZWF0ZSkKCQkJCXJldHVy
biBOVUxMOwoJCQljZWxsLT51c2VkID0gMTsKCQkJY2VsbC0+a2V5ID0ga2V5OwoJCQlyZXR1cm4g
Y2VsbDsKCQl9Cgl9CglyZXR1cm4gTlVMTDsKfQoKc3RhdGljIGludCByZXF1ZXN0X2lzX2kyYyhj
b25zdCBzdHJ1Y3QgdXNiX2N0cmxyZXF1ZXN0ICpjdHJsKQp7CglyZXR1cm4gY3RybC0+YlJlcXVl
c3QgPD0gNiAmJiAoY3RybC0+YlJlcXVlc3QgJiAzKSA8PSAyOwp9CgovKiBpMmMgcmVxdWVzdHMg
Y2FycnkgdGhlIGRldmljZSBhZGRyZXNzIGluIHRoZSB0b3AgYml0cyBvZiB3VmFsdWUuICovCnN0
YXRpYyB1aW50MzJfdCByZWdpc3Rlcl9rZXkoY29uc3Qgc3RydWN0IHVzYl9jdHJscmVxdWVzdCAq
Y3RybCkKewoJaWYgKHJlcXVlc3RfaXNfaTJjKGN0cmwpKQoJCXJldHVybiAoKHVpbnQzMl90KShj
dHJsLT53VmFsdWUgPj4gOSkgPDwgMTcpIHwgY3RybC0+d0luZGV4OwoJcmV0dXJuIDB4ODAwMDAw
MDB1IHwgY3RybC0+d0luZGV4OwkvKiBpbnRlcm5hbCByZWdpc3RlciAqLwp9CgpzdGF0aWMgdm9p
ZCBoYW5kbGVfY29udHJvbF9yZXF1ZXN0KGNvbnN0IHN0cnVjdCB1c2JfY3RybHJlcXVlc3QgKmN0
cmwpCnsKCXVpbnQ4X3QgZGF0YVtFUDBfTUFYX1BBQ0tFVF9CVUZGRVJdOwoJaW50IGxlbmd0aCA9
IC0xOwoJdWludDE2X3Qgd0xlbmd0aCA9IGN0cmwtPndMZW5ndGg7CgoJaWYgKChjdHJsLT5iUmVx
dWVzdFR5cGUgJiBVU0JfVFlQRV9NQVNLKSA9PSBVU0JfVFlQRV9TVEFOREFSRCkgewoJCXN3aXRj
aCAoY3RybC0+YlJlcXVlc3QpIHsKCQljYXNlIFVTQl9SRVFfR0VUX0RFU0NSSVBUT1I6CgkJCXN3
aXRjaCAoY3RybC0+d1ZhbHVlID4+IDgpIHsKCQkJY2FzZSBVU0JfRFRfREVWSUNFOgoJCQkJbGVu
Z3RoID0gc2l6ZW9mKGRldmljZV9kZXNjcmlwdG9yKTsKCQkJCW1lbWNweShkYXRhLCAmZGV2aWNl
X2Rlc2NyaXB0b3IsIGxlbmd0aCk7CgkJCQlicmVhazsKCQkJY2FzZSBVU0JfRFRfQ09ORklHOgoJ
CQkJbGVuZ3RoID0gc2l6ZW9mKGNvbmZpZ19kZXNjcmlwdG9yKTsKCQkJCW1lbWNweShkYXRhLCBj
b25maWdfZGVzY3JpcHRvciwgbGVuZ3RoKTsKCQkJCWJyZWFrOwoJCQl9CgkJCWJyZWFrOwoJCWNh
c2UgVVNCX1JFUV9TRVRfQ09ORklHVVJBVElPTjoKCQkJaW9jdGwocmF3X2dhZGdldF9mZCwgVVNC
X1JBV19JT0NUTF9DT05GSUdVUkUsIDApOwoJCQlsZW5ndGggPSAwOwoJCQlicmVhazsKCQl9Cgl9
CgoJLyogUmVwbGF5IHdoYXRldmVyIHRoZSBkcml2ZXIgbGFzdCB3cm90ZSB0byB0aGlzIHJlZ2lz
dGVyLiAqLwoJaWYgKGxlbmd0aCA8IDAgJiYgKGN0cmwtPmJSZXF1ZXN0VHlwZSAmIFVTQl9ESVJf
SU4pICYmIHdMZW5ndGggJiYKCSAgICAocmVxdWVzdF9pc19pMmMoY3RybCkgfHwgY3RybC0+YlJl
cXVlc3QgPT0gMHgwZCkpIHsKCQlzdHJ1Y3QgcmVnaXN0ZXJfY2VsbCAqY2VsbCA9IHJlZ2lzdGVy
X2xvb2t1cChyZWdpc3Rlcl9rZXkoY3RybCksIDApOwoKCQlpZiAoY2VsbCkgewoJCQlsZW5ndGgg
PSBjZWxsLT5sZW5ndGggPCB3TGVuZ3RoID8gY2VsbC0+bGVuZ3RoIDogd0xlbmd0aDsKCQkJbWVt
Y3B5KGRhdGEsIGNlbGwtPnZhbHVlLCBsZW5ndGgpOwoJCQlpZiAobGVuZ3RoIDwgd0xlbmd0aCkg
ewoJCQkJbWVtc2V0KGRhdGEgKyBsZW5ndGgsIDAsIHdMZW5ndGggLSBsZW5ndGgpOwoJCQkJbGVu
Z3RoID0gd0xlbmd0aDsKCQkJfQoJCX0KCX0KCgkvKgoJICogaW5pdGlhbGl6ZV9jeDIzMXh4KCkg
cmVhZHMgQk9BUkRfQ0ZHX1NUQVQgKHJlZ2lzdGVyIDApIHdpdGggdGhlIHZlbmRvcgoJICogcmVx
dWVzdCBWUlRfR0VUX1JFR0lTVEVSPTB4MGQuICBBIHplcm8gdGhlcmUgaXMgImJhZCBzY2VuYXJp
byEhISEhIgoJICogYW5kIHByb2JlIGFib3J0cyB3aXRoIC1FTk9ERVYgYmVmb3JlIGFueSB2aWRl
byBkZXZpY2UgaXMgcmVnaXN0ZXJlZC4KCSAqIEFWREVDX0VOQUJMRXxTRUxGX1BPV0VSID09IDB4
ODAgc2VsZWN0cyB0aGUgYW5hbG9nLW9ubHkgc2NlbmFyaW8sCgkgKiB3aGljaCBpcyB0aGUgb25l
IHRoYXQgcmVhY2hlcyBjeDIzMXh4X3JlZ2lzdGVyX2FuYWxvZ19kZXZpY2VzKCkuCgkgKi8KCWlm
IChsZW5ndGggPCAwICYmIChjdHJsLT5iUmVxdWVzdFR5cGUgJiBVU0JfRElSX0lOKSAmJgoJICAg
IGN0cmwtPmJSZXF1ZXN0ID09IDB4MGQgJiYgY3RybC0+d0luZGV4ID09IDAgJiYgd0xlbmd0aCA9
PSA0KSB7CgkJZGF0YVswXSA9IDB4ODA7IGRhdGFbMV0gPSAwOyBkYXRhWzJdID0gMDsgZGF0YVsz
XSA9IDA7CgkJbGVuZ3RoID0gNDsKCX0KCglpZiAobGVuZ3RoIDwgMCkgewoJCWlmIChjdHJsLT5i
UmVxdWVzdFR5cGUgJiBVU0JfRElSX0lOKSB7CgkJCWxlbmd0aCA9IHdMZW5ndGggPiBFUDBfTUFY
X1BBQ0tFVF9CVUZGRVIgPwoJCQkJIEVQMF9NQVhfUEFDS0VUX0JVRkZFUiA6IHdMZW5ndGg7CgkJ
CW1lbXNldChkYXRhLCAwLCBsZW5ndGgpOwoJCX0gZWxzZSB7CgkJCWxlbmd0aCA9IDA7CgkJfQoJ
fQoKCS8qCgkgKiByYXdfZ2FkZ2V0IG1hcmtzIGEgcmVxdWVzdCBlcDBfaW5fcGVuZGluZyBvbmx5
IGZvciAoRElSX0lOICYmIHdMZW5ndGgpOwoJICogZXZlcnl0aGluZyBlbHNlIC0tIGluY2x1ZGlu
ZyBhIHplcm8tbGVuZ3RoIElOIGFuZCBldmVyeSBPVVQgLS0gaXMKCSAqIGVwMF9vdXRfcGVuZGlu
ZyBhbmQgbXVzdCBiZSBjb21wbGV0ZWQgd2l0aCBFUDBfUkVBRCwgb3IgdGhlIGlvY3RsCgkgKiBy
ZXR1cm5zIC1FQlVTWSBhbmQgdGhlIGhvc3QgdGltZXMgb3V0IHdpdGggLTExMC4KCSAqLwoJaWYg
KChjdHJsLT5iUmVxdWVzdFR5cGUgJiBVU0JfRElSX0lOKSAmJiB3TGVuZ3RoKSB7CgkJaWYgKGxl
bmd0aCA+IHdMZW5ndGgpCgkJCWxlbmd0aCA9IHdMZW5ndGg7CgkJZXAwX3dyaXRlKGRhdGEsIGxl
bmd0aCk7Cgl9IGVsc2UgewoJCXVpbnQ4X3QgYnVmZmVyW3NpemVvZihzdHJ1Y3QgdXNiX3Jhd19l
cF9pbykgKyBFUDBfTUFYX1BBQ0tFVF9CVUZGRVJdOwoJCXN0cnVjdCB1c2JfcmF3X2VwX2lvICpp
byA9ICh2b2lkICopYnVmZmVyOwoJCWludCByZWNlaXZlZDsKCgkJaW8tPmVwID0gMDsKCQlpby0+
ZmxhZ3MgPSAwOwoJCWlvLT5sZW5ndGggPSB3TGVuZ3RoID4gRVAwX01BWF9QQUNLRVRfQlVGRkVS
ID8KCQkJICAgICBFUDBfTUFYX1BBQ0tFVF9CVUZGRVIgOiB3TGVuZ3RoOwoJCXJlY2VpdmVkID0g
aW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FUDBfUkVBRCwgaW8pOwoJCWlmIChy
ZWNlaXZlZCA+IDAgJiYgd0xlbmd0aCAmJgoJCSAgICAocmVxdWVzdF9pc19pMmMoY3RybCkgfHwg
Y3RybC0+YlJlcXVlc3QgPT0gMHgwYykpIHsKCQkJc3RydWN0IHJlZ2lzdGVyX2NlbGwgKmNlbGwg
PQoJCQkJcmVnaXN0ZXJfbG9va3VwKHJlZ2lzdGVyX2tleShjdHJsKSwgMSk7CgoJCQlpZiAoY2Vs
bCkgewoJCQkJY2VsbC0+bGVuZ3RoID0gcmVjZWl2ZWQgPiAxNiA/IDE2IDogcmVjZWl2ZWQ7CgkJ
CQltZW1jcHkoY2VsbC0+dmFsdWUsIGlvLT5kYXRhLCBjZWxsLT5sZW5ndGgpOwoJCQl9CgkJfQoJ
fQp9CgpzdGF0aWMgdm9pZCAqZ2FkZ2V0X2V2ZW50X3RocmVhZCh2b2lkICp1bnVzZWQpCnsKCXVp
bnQ4X3QgYnVmZmVyW3NpemVvZihzdHJ1Y3QgdXNiX3Jhd19ldmVudCkgKyBFUDBfTUFYX1BBQ0tF
VF9CVUZGRVJdOwoJc3RydWN0IHVzYl9yYXdfZXZlbnQgKmV2ZW50ID0gKHZvaWQgKilidWZmZXI7
CgoJZm9yICg7OykgewoJCWV2ZW50LT50eXBlID0gMDsKCQlldmVudC0+bGVuZ3RoID0gRVAwX01B
WF9QQUNLRVRfQlVGRkVSOwoJCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RM
X0VWRU5UX0ZFVENILCBldmVudCkgPCAwKSB7CgkJCXVzbGVlcCgxMDAwKTsKCQkJY29udGludWU7
CgkJfQoJCWlmIChldmVudC0+dHlwZSA9PSBVU0JfUkFXX0VWRU5UX0NPTlRST0wpCgkJCWhhbmRs
ZV9jb250cm9sX3JlcXVlc3QoKHN0cnVjdCB1c2JfY3RybHJlcXVlc3QgKilldmVudC0+ZGF0YSk7
Cgl9CglyZXR1cm4gTlVMTDsKfQoKc3RhdGljIGludCBmaW5kX3VkYyhjaGFyICp1ZGNfZHJpdmVy
X25hbWUsIGNoYXIgKnVkY19kZXZpY2VfbmFtZSkKewoJRElSICp1ZGNfZGlyID0gb3BlbmRpcigi
L3N5cy9jbGFzcy91ZGMiKTsKCXN0cnVjdCBkaXJlbnQgKnVkY19lbnRyeTsKCglpZiAoIXVkY19k
aXIpCgkJcmV0dXJuIC0xOwoJd2hpbGUgKCh1ZGNfZW50cnkgPSByZWFkZGlyKHVkY19kaXIpKSkg
ewoJCWNoYXIgKmxhc3RfZG90OwoKCQlpZiAodWRjX2VudHJ5LT5kX25hbWVbMF0gPT0gJy4nKQoJ
CQljb250aW51ZTsKCQlzdHJjcHkodWRjX2RldmljZV9uYW1lLCB1ZGNfZW50cnktPmRfbmFtZSk7
CgkJc3RyY3B5KHVkY19kcml2ZXJfbmFtZSwgdWRjX2VudHJ5LT5kX25hbWUpOwoJCWxhc3RfZG90
ID0gc3RycmNocih1ZGNfZHJpdmVyX25hbWUsICcuJyk7CgkJaWYgKGxhc3RfZG90KQoJCQkqbGFz
dF9kb3QgPSAwOwoJCWNsb3NlZGlyKHVkY19kaXIpOwoJCXJldHVybiAwOwoJfQoJY2xvc2VkaXIo
dWRjX2Rpcik7CglyZXR1cm4gLTE7Cn0KCnN0YXRpYyBpbnQgY291bnRfcmVnaXN0ZXJlZF92NGwy
X25vZGVzKHZvaWQpCnsKCURJUiAqdjRsMl9jbGFzc19kaXIgPSBvcGVuZGlyKCIvc3lzL2NsYXNz
L3ZpZGVvNGxpbnV4Iik7CglzdHJ1Y3QgZGlyZW50ICp2NGwyX2VudHJ5OwoJaW50IG5vZGVzID0g
MDsKCglpZiAoIXY0bDJfY2xhc3NfZGlyKQoJCXJldHVybiAtMTsKCXdoaWxlICgodjRsMl9lbnRy
eSA9IHJlYWRkaXIodjRsMl9jbGFzc19kaXIpKSkKCQlpZiAodjRsMl9lbnRyeS0+ZF9uYW1lWzBd
ICE9ICcuJykKCQkJbm9kZXMrKzsKCWNsb3NlZGlyKHY0bDJfY2xhc3NfZGlyKTsKCXJldHVybiBu
b2RlczsKfQoKaW50IG1haW4odm9pZCkKewoJcHRocmVhZF90IGdhZGdldF90aHJlYWQ7CglzdHJ1
Y3QgdXNiX3Jhd19pbml0IGluaXQ7CgljaGFyIHVkY19kcml2ZXJfbmFtZVsxMjhdLCB1ZGNfZGV2
aWNlX25hbWVbMTI4XTsKCWludCBmcmVlX21pbm9yczsKCglzZXR2YnVmKHN0ZG91dCwgTlVMTCwg
X0lPTkJGLCAwKTsKCgkvKgoJICogVGhlIGJ1ZyBuZWVkcyBjeDIzMXh4X3JlZ2lzdGVyX2FuYWxv
Z19kZXZpY2VzKCkgdG8gZmFpbCAqYWZ0ZXIqCgkgKiBkZXYtPnZkZXYgd2FzIHJlZ2lzdGVyZWQs
IHNvIHRoYXQgY3gyMzF4eF9pbml0X2RldigpIHRha2VzIGVycl9hbmFsb2c6CgkgKgoJICoJY3gy
MzF4eF91bnJlZ2lzdGVyX21lZGlhX2RldmljZShkZXYpOyAgIDwtIGtmcmVlKGRldi0+bWVkaWFf
ZGV2KQoJICoJY3gyMzF4eF9yZWxlYXNlX2FuYWxvZ19yZXNvdXJjZXMoZGV2KTsgIDwtIHZpZGVv
X3VucmVnaXN0ZXJfZGV2aWNlKCkKCSAqCgkgKiBUaGUgZnJlZWQgbWVkaWFfZGV2IHN0YXlzIGFs
aWFzZWQgYXMgZGV2LT52NGwyX2Rldi5tZGV2LCBzbyB0aGUgZmluYWwKCSAqIGtvYmplY3RfcHV0
KCkgb2YgdGhlIHN0aWxsLXJlZ2lzdGVyZWQgL2Rldi92aWRlb04gcnVucwoJICogdjRsMl9kZXZp
Y2VfcmVsZWFzZSgpIC0+IG1lZGlhX2Rldm5vZGVfcmVtb3ZlKCkgLT4KCSAqIG1lZGlhX3JlbW92
ZV9pbnRmX2xpbmtzKCkgLT4gbXV0ZXhfbG9jaygpIG9uIGZyZWVkIG1lbW9yeS4KCSAqCgkgKiBF
eGFjdGx5IG9uZSBmcmVlIHZpZGVvZGV2IG1pbm9yIHByb2R1Y2VzIHRoYXQgc3RhdGU6IGRldi0+
dmRldiBnZXRzCgkgKiBpdCwgdGhlbiBkZXYtPnZiaV9kZXYgZ2V0cyAtRU5GSUxFICgidW5hYmxl
IHRvIHJlZ2lzdGVyIHZiaSBkZXZpY2UiKS4KCSAqIFRoaXMga2VybmVsIGJvb3RzIHdpdGggMjU1
IG9mIHRoZSAyNTYgbWlub3JzIGFscmVhZHkgdGFrZW4gYnkgdml2aWQuCgkgKi8KCWZyZWVfbWlu
b3JzID0gVjRMMl9UT1RBTF9NSU5PUlMgLSBjb3VudF9yZWdpc3RlcmVkX3Y0bDJfbm9kZXMoKTsK
CXByaW50ZigiZnJlZSB2aWRlb2RldiBtaW5vcnM6ICVkICh0aGUgYnVnIG5lZWRzIGV4YWN0bHkg
MSlcbiIsIGZyZWVfbWlub3JzKTsKCglpZiAoZmluZF91ZGModWRjX2RyaXZlcl9uYW1lLCB1ZGNf
ZGV2aWNlX25hbWUpIDwgMCkgewoJCXByaW50Zigibm8gVURDIChuZWVkIGR1bW15X2hjZClcbiIp
OwoJCXJldHVybiAxOwoJfQoJcmF3X2dhZGdldF9mZCA9IG9wZW4oIi9kZXYvcmF3LWdhZGdldCIs
IE9fUkRXUik7CglpZiAocmF3X2dhZGdldF9mZCA8IDApIHsKCQlwcmludGYoIm9wZW4gL2Rldi9y
YXctZ2FkZ2V0OiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKCQlyZXR1cm4gMTsKCX0KCW1lbXNl
dCgmaW5pdCwgMCwgc2l6ZW9mKGluaXQpKTsKCXN0cm5jcHkoKGNoYXIgKilpbml0LmRyaXZlcl9u
YW1lLCB1ZGNfZHJpdmVyX25hbWUsCgkJc2l6ZW9mKGluaXQuZHJpdmVyX25hbWUpIC0gMSk7Cglz
dHJuY3B5KChjaGFyICopaW5pdC5kZXZpY2VfbmFtZSwgdWRjX2RldmljZV9uYW1lLAoJCXNpemVv
Zihpbml0LmRldmljZV9uYW1lKSAtIDEpOwoJaW5pdC5zcGVlZCA9IFVTQl9TUEVFRF9ISUdIOwoJ
aWYgKGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfSU5JVCwgJmluaXQpIDwgMCkg
ewoJCXByaW50ZigiUkFXX0lOSVQ6ICVzXG4iLCBzdHJlcnJvcihlcnJubykpOwoJCXJldHVybiAx
OwoJfQoJLyogUlVOIG11c3QgY29tZSBiZWZvcmUgdGhlIGZpcnN0IEVWRU5UX0ZFVENILCBvciB0
aGUgZmV0Y2ggZXJyb3JzIG91dC4gKi8KCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFX
X0lPQ1RMX1JVTiwgMCkgPCAwKSB7CgkJcHJpbnRmKCJSQVdfUlVOOiAlc1xuIiwgc3RyZXJyb3Io
ZXJybm8pKTsKCQlyZXR1cm4gMTsKCX0KCXB0aHJlYWRfY3JlYXRlKCZnYWRnZXRfdGhyZWFkLCBO
VUxMLCBnYWRnZXRfZXZlbnRfdGhyZWFkLCBOVUxMKTsKCgkvKiBodWJfZXZlbnQgcHJvYmVzIHRo
ZSBlbXVsYXRlZCBkZXZpY2UgYW5kIHBhbmljcyBpbiB0aGF0IGNvbnRleHQuICovCglzbGVlcCg2
MCk7CglwcmludGYoIm5vIHNwbGF0XG4iKTsKCXJldHVybiAwOwp9Cg==
--0000000000003ea7ca065b2a429c--
