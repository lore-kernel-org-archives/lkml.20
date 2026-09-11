Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A39E30C14A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168976; cv=pass; b=toRTeCrgEuiTAk0SYHMEiKI2ATHxXMywDWm/Su6cb8lAbrbfsdS+62RZS/sq4oTa+JrwYWFupcZ07m7mItCVw3sSC7q54F3VpCU7cszC2vKeE2eGXD/0KBB7i7aDec5scSVYCtrs+aVaW8tzBA7a5SkzJ5bH+uw2VRFETzoOtgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168976; c=relaxed/simple;
	bh=48DJbsN6QKzIWrYorPaIKvWl+K3z9cQiw6BQ06X3i+I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=C1QtaqA7xVGmU3RgXK2pHdXD/BzJ3oPwnWLgxjVHf07PZNMHndbYkFdC6DirCdoDjwmJL14XBjmW3h3rW2fnMCtU4opjFCdXUh1/D82IR4vZPl1rCmUitS0YPVVsUdED02hPoUzz5muRHPwS8lgIJ4t1XXFGWYf017fmB3RTH4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=b74loriU; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="b74loriU"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a3490bso84361b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789168974; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+vqs1tH2j98mpGuZbP2M5563yry3tQOYFBCR41Ei6xQQjuxLPHlY51VtqRnw/yXnf
         G7uarg3fMKK6OJ2IU7j58wlwBYH6KOW2evdmRGZNh3tmb/O3JWrQn6RT5AbADOaUwDsh
         hZpTHq0Hf+93uScwAZgaIWvEQN0/dySve4d7ud6jcKtCs++pLNCJ6DKMxE5EZlYrpWIy
         QAIEdfnBIt0DZY+vW9INvB2KcLkrFcYPxaVFtUprzsJYwI9mG/JLYISO3QB0HZ6uv21n
         0mnkS20oMRfYNrVWsKpg90Vxirm0qdrz7LvQC1buYI4VivdD4hV+Sx4fA6wHw0fIrisN
         enRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3oxJC41/vLJKZnxZ0J5tCjcVcYa8wZhU8e2/VsfgMzQ=;
        fh=JZBd7R7FlLjppdil+amG0cdTY36hdcTQw1DUAivi8UQ=;
        b=sIeZSap3AW8Ir4Wmdb7elfrSXxOxkQIwSzTJg8IaKlx4me3RssT64K+FwC+O+B+yf5
         3RZyV8LC4nIBXsrYw2s4sBqnjLBRKejHpCDgRGAPHlN9pZUT37J7mifk0pnkAnJDtVOA
         9wBWsDqDq8k5UTzE3rAD4SLrAsSJ4XXW8X47/d107IrCeHnd9yZN2U2N20qcxexDm26C
         ljaiKxwpB0M8T7gyQgAMmyjttAuGNIlJVRIG1wOKpWUrufJ4+pfPkod65zi1bj23TDg6
         wBd1QzjWhUn3ln69vEzee59pXIUzUG7mYjkBloRePrXavvVS8dQy6iTKFJocmkykIMOb
         yqxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789168974; x=1789773774; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oxJC41/vLJKZnxZ0J5tCjcVcYa8wZhU8e2/VsfgMzQ=;
        b=b74loriUGwg3scugsjZXRgzZq3rRr+LEcHeeHkUNE+AIVnMZy7I+fOSti6BOvQtIU7
         OEVrpKQIwunOzJA/vUuJphUF85I0vdDazq0vy0opLMbr3hCWmMLtprAIBk/qnE+k3dTy
         RAkZkJUcRt7q0KS0C4zWYqt4OY6nX70nLxhRopWuVZ4dw5sfB946SdWXAsWwyLVK2rRA
         DqqLLd0STZLRLhWnIxG+WrJIlqBKBKyIEDauoRcNZ/wAvPCMBx8R06MkGC+Sw3w5YO9E
         L99bFyHnYv80mdQjWcsNYKvKaNZQTENKjsls6ISa+HX7k0qsNSBwcFMDrojOonxDgW6m
         2k/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789168974; x=1789773774;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3oxJC41/vLJKZnxZ0J5tCjcVcYa8wZhU8e2/VsfgMzQ=;
        b=eD0websbUmtEYt4trEz71C5h0Y2OfUDgvVT8RMsVLHBTpwSzw5DPXBeVYFlyR3D2Io
         v22Qq1g+VXI2K/4X65F1RdiVSh5fwO9ZLFwbolwJ2c7H8JX7LBjXuXnhgCnsy8utRpgt
         XD1vVXUOMZz+ZSd66QYbhFc66IqkmaXBWNd26gW5Aek1JDLJXpJu+aiiVl6fnvZHs/YN
         x2InJq0ycT99wCl4eazaRVP9pv7OjDpOtFA5S9M/zHw9VURHsMjgJeIYQ3yuM5PQVSFU
         7r/7zuP+JIm0uW4fbid8UPvwrtho4auBPrTuIp4nqOvax38YsXL7CdQ47zpXYelMuSL7
         4Vtw==
X-Forwarded-Encrypted: i=1; AKwUvByLC5snbU2ubc4VQQ4+puKIIgq3YaqDEKMXSP8YCttZMeTVQj/gXuBDOGtEj5UpBZEzRw81kGjgNbSpK7k=@vger.kernel.org
X-Gm-Message-State: AFuF++kXJ7gegbCepCBs+mKUz1OeHS/++o0yMN/4xadcEiQGIU63Hj7y
	4iGmHC0fruZWxkNy7650pG+hk/1BseSiF8RPCk0b1mEYgpzthn0FBmkooCYU3syv63Zu0l/fnRZ
	/O3qEjv9nM5KyACPAboV1tNou7G1p86T/x1avcAyqWg5IQ7x7PjYbnQwUXmADCA==
X-Gm-Gg: AYBFou0mSYNFRyKpcOKss8CmjiWdlu71iwIaW/xMNL1/1nZxUK18wXKQ/wL1zW2ISfs
	5ODYvJSzqiXBfQq1KVWY3PKiTjJIlE//pHofKBBjRKGgYGJ8vR2gbcBG92fXeANBrT3JvJc7jtT
	9Wkeueo3Adkj4kywa/tey39Imp1ixgebqFfhCIMBf0VH8CrJ9KJzi2U+bE579GhXHm3V2GGikw6
	rtCQ+xiJIpodOtXdaGYbLJTUoIcUalzv9yVW01GO2EF6gexNNR3a+/YJQENMqF+DYLbgMwh/fmQ
	9fSgg/g9eH2S0/puc5kpPtKFhmGaEh1Tt0fL3cTOqNsR+OhssCs2QnPM/r770zyh+/V4Po05BMB
	juwafjn7ivTeiQE74MnvIQsSU8SDjVu6NJ+5LYTqa
X-Received: by 2002:a05:6a21:1309:b0:3d3:ae0f:5269 with SMTP id
 adf61e73a8af0-3db0e45b55dmr715598637.21.1789168973502; Fri, 11 Sep 2026
 16:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 16:22:42 -0700
X-Gm-Features: AcwNN1WtMWE0mIfMxaD-wDYjZIQJoqKiDzDJKPwmvRQJZqbFYdYj15BtqPEFhTQ
Message-ID: <CA+0ovCiKOju+0GKZU3v+ZFZkHxMKKSdthtAZN1K+tthNc=iy5g@mail.gmail.com>
Subject: [BUG] WARNING in cxusb_medion_v_stop_streaming
To: Michael Krufky <mkrufky@linuxtv.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000001c85d4065b3d5d82"

--0000000000001c85d4065b3d5d82
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   80.023095][ T2288] WARNING:
drivers/media/usb/dvb-usb/cxusb-analog.c:907 at
cxusb_medion_v_stop_streaming+0x68a/0x710, CPU#1: kworker/1:3/2288
[   80.027698][ T2288] Modules linked in:
[   80.028089][ T2288] CPU: 1 UID: 0 PID: 2288 Comm: kworker/1:3 Not
tainted 7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   80.029118][ T2288] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   80.030204][ T2288] Workqueue: usb_hub_wq hub_event
[   80.030698][ T2288] RIP: 0010:cxusb_medion_v_stop_streaming+0x68a/0x710
[   80.031348][ T2288] Code: 84 c0 0f 85 81 00 00 00 48 8b 44 24 08 c6
00 00 48 83 c4 28 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc cc e8
07 96 b2 f9 90 <0f> 0b 90 eb e1 48 c7 c1 e0 62 ac 9a 80 e1 07 80 c1 03
38 c1 0f 8c
[   80.033125][ T2288] RSP: 0000:ffffc90007e0f230 EFLAGS: 00010293
[   80.033702][ T2288] RAX: ffffffff88150679 RBX: 1ffff11021de20a8
RCX: ffff88810fc08000
[   80.034554][ T2288] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000000
[   80.035306][ T2288] RBP: ffff88810ef10544 R08: ffffffff90563d7f
R09: 1ffffffff20ac7af
[   80.036051][ T2288] R10: dffffc0000000000 R11: ffffffff8814fff0
R12: dffffc0000000000
[   80.036809][ T2288] R13: 1ffff11021de20a1 R14: dffffc0000000000
R15: ffff888109ba8000
[   80.037564][ T2288] FS:  0000000000000000(0000)
GS:ffff8881da588000(0000) knlGS:0000000000000000
[   80.038396][ T2288] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   80.039011][ T2288] CR2: 00007f248c0dbfe0 CR3: 000000002454b000
CR4: 0000000000752ef0
[   80.039789][ T2288] PKRU: 55555554
[   80.040139][ T2288] Call Trace:
[   80.040467][ T2288]  <TASK>
[   80.040757][ T2288]  ? __pfx_cxusb_medion_v_stop_streaming+0x10/0x10
[   80.041387][ T2288]  __vb2_queue_cancel+0xba/0xdb0
[   80.041864][ T2288]  ? __pfx___mutex_lock+0x10/0x10
[   80.042352][ T2288]  __vb2_cleanup_fileio+0x4e/0x1f0
[   80.042842][ T2288]  vb2_core_queue_release+0x27/0x150
[   80.043350][ T2288]  vb2_video_unregister_device+0x15b/0x200
[   80.043971][ T2288]  cxusb_medion_unregister_analog+0xc2/0x1c0
[   80.044546][ T2288]  cxusb_disconnect+0x9b/0x1a0
[   80.045008][ T2288]  usb_unbind_interface+0x26e/0x910
[   80.045513][ T2288]  ? kernfs_remove_by_name_ns+0x101/0x140
[   80.046059][ T2288]  ? __pfx_usb_unbind_interface+0x10/0x10
[   80.046604][ T2288]  device_release_driver_internal+0x4d9/0x870
[   80.047189][ T2288]  bus_remove_device+0x455/0x570
[   80.047658][ T2288]  ? __pfx_bus_remove_device+0x10/0x10
[   80.048181][ T2288]  ? kernfs_remove_by_name_ns+0x101/0x140
[   80.048725][ T2288]  device_del+0x527/0x8f0
[   80.049148][ T2288]  ? __pfx_device_del+0x10/0x10
[   80.049630][ T2288]  ? kobject_put+0x51d/0x560
[   80.050077][ T2288]  usb_disable_device+0x3d4/0x8d0
[   80.050563][ T2288]  usb_disconnect+0x32f/0x990
[   80.051018][ T2288]  hub_event+0x1cc9/0x4f30
[   80.051472][ T2288]  ? __pfx_hub_event+0x10/0x10
[   80.051911][ T2288]  ? process_scheduled_works+0x94e/0x1900
[   80.052467][ T2288]  ? process_scheduled_works+0x94e/0x1900
[   80.053019][ T2288]  ? process_scheduled_works+0x94e/0x1900
[   80.053567][ T2288]  process_scheduled_works+0xc99/0x1900
[   80.054188][ T2288]  ? __pfx_process_scheduled_works+0x10/0x10
[   80.054761][ T2288]  ? assign_work+0x3d5/0x5e0
[   80.055212][ T2288]  worker_thread+0xa53/0xfc0
[   80.055657][ T2288]  kthread+0x38b/0x480
[   80.056037][ T2288]  ? __pfx_worker_thread+0x10/0x10
[   80.056539][ T2288]  ? __pfx_kthread+0x10/0x10
[   80.056985][ T2288]  ret_from_fork+0x514/0xb70
[   80.057442][ T2288]  ? __pfx_ret_from_fork+0x10/0x10
[   80.057907][ T2288]  ? __switch_to+0xc79/0x1410
[   80.058371][ T2288]  ? __pfx_kthread+0x10/0x10
[   80.058834][ T2288]  ret_from_fork_asm+0x1a/0x30
[   80.059343][ T2288]  </TASK>
[   80.059655][ T2288] Kernel panic - not syncing: kernel: panic_on_warn set ...
[   80.060362][ T2288] CPU: 1 UID: 0 PID: 2288 Comm: kworker/1:3 Not
tainted 7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   80.061408][ T2288] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   80.062387][ T2288] Workqueue: usb_hub_wq hub_event
[   80.062872][ T2288] Call Trace:
[   80.063196][ T2288]  <TASK>
[   80.063483][ T2288]  vpanic+0x56d/0xa60
[   80.063936][ T2288]  ? __pfx__printk+0x10/0x10
[   80.064385][ T2288]  ? __pfx_vpanic+0x10/0x10
[   80.064820][ T2288]  ? is_bpf_text_address+0x292/0x2b0
[   80.065331][ T2288]  ? is_bpf_text_address+0x26/0x2b0
[   80.065820][ T2288]  panic+0xc5/0xd0
[   80.066190][ T2288]  ? __pfx_panic+0x10/0x10
[   80.066622][ T2288]  ? ret_from_fork_asm+0x1a/0x30
[   80.067102][ T2288]  __warn+0x315/0x4c0
[   80.067487][ T2288]  ? cxusb_medion_v_stop_streaming+0x68a/0x710
[   80.068091][ T2288]  ? cxusb_medion_v_stop_streaming+0x68a/0x710
[   80.068676][ T2288]  __report_bug+0x273/0x580
[   80.069119][ T2288]  ? cxusb_medion_v_stop_streaming+0x68a/0x710
[   80.069698][ T2288]  ? __pfx___report_bug+0x10/0x10
[   80.070185][ T2288]  ? do_raw_spin_lock+0x12b/0x2f0
[   80.070667][ T2288]  ? cxusb_medion_v_stop_streaming+0x68a/0x710
[   80.071255][ T2288]  report_bug+0x16b/0x220
[   80.071665][ T2288]  ? cxusb_medion_v_stop_streaming+0x68a/0x710
[   80.072249][ T2288]  ? cxusb_medion_v_stop_streaming+0x68c/0x710
[   80.072833][ T2288]  handle_bug+0x9c/0x200
[   80.073245][ T2288]  exc_invalid_op+0x1a/0x50
[   80.073676][ T2288]  asm_exc_invalid_op+0x1a/0x20
[   80.074219][ T2288] RIP: 0010:cxusb_medion_v_stop_streaming+0x68a/0x710
[   80.074855][ T2288] Code: 84 c0 0f 85 81 00 00 00 48 8b 44 24 08 c6
00 00 48 83 c4 28 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc cc e8
07 96 b2 f9 90 <0f> 0b 90 eb e1 48 c7 c1 e0 62 ac 9a 80 e1 07 80 c1 03
38 c1 0f 8c
[   80.076640][ T2288] RSP: 0000:ffffc90007e0f230 EFLAGS: 00010293
[   80.077216][ T2288] RAX: ffffffff88150679 RBX: 1ffff11021de20a8
RCX: ffff88810fc08000
[   80.077947][ T2288] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000000
[   80.078701][ T2288] RBP: ffff88810ef10544 R08: ffffffff90563d7f
R09: 1ffffffff20ac7af
[   80.079476][ T2288] R10: dffffc0000000000 R11: ffffffff8814fff0
R12: dffffc0000000000
[   80.080242][ T2288] R13: 1ffff11021de20a1 R14: dffffc0000000000
R15: ffff888109ba8000
[   80.081002][ T2288]  ? __pfx_cxusb_medion_v_stop_streaming+0x10/0x10
[   80.081619][ T2288]  ? cxusb_medion_v_stop_streaming+0x689/0x710
[   80.082236][ T2288]  ? __pfx_cxusb_medion_v_stop_streaming+0x10/0x10
[   80.082851][ T2288]  __vb2_queue_cancel+0xba/0xdb0
[   80.083338][ T2288]  ? __pfx___mutex_lock+0x10/0x10
[   80.083881][ T2288]  __vb2_cleanup_fileio+0x4e/0x1f0
[   80.084375][ T2288]  vb2_core_queue_release+0x27/0x150
[   80.084883][ T2288]  vb2_video_unregister_device+0x15b/0x200
[   80.085448][ T2288]  cxusb_medion_unregister_analog+0xc2/0x1c0
[   80.085989][ T2288]  cxusb_disconnect+0x9b/0x1a0
[   80.086470][ T2288]  usb_unbind_interface+0x26e/0x910
[   80.086971][ T2288]  ? kernfs_remove_by_name_ns+0x101/0x140
[   80.087518][ T2288]  ? __pfx_usb_unbind_interface+0x10/0x10
[   80.088069][ T2288]  device_release_driver_internal+0x4d9/0x870
[   80.088648][ T2288]  bus_remove_device+0x455/0x570
[   80.089130][ T2288]  ? __pfx_bus_remove_device+0x10/0x10
[   80.089645][ T2288]  ? kernfs_remove_by_name_ns+0x101/0x140
[   80.090187][ T2288]  device_del+0x527/0x8f0
[   80.090606][ T2288]  ? __pfx_device_del+0x10/0x10
[   80.091074][ T2288]  ? kobject_put+0x51d/0x560
[   80.091520][ T2288]  usb_disable_device+0x3d4/0x8d0
[   80.091981][ T2288]  usb_disconnect+0x32f/0x990
[   80.092450][ T2288]  hub_event+0x1cc9/0x4f30
[   80.092898][ T2288]  ? __pfx_hub_event+0x10/0x10
[   80.093373][ T2288]  ? process_scheduled_works+0x94e/0x1900
[   80.093970][ T2288]  ? process_scheduled_works+0x94e/0x1900
[   80.094517][ T2288]  ? process_scheduled_works+0x94e/0x1900
[   80.095066][ T2288]  process_scheduled_works+0xc99/0x1900
[   80.095601][ T2288]  ? __pfx_process_scheduled_works+0x10/0x10
[   80.096173][ T2288]  ? assign_work+0x3d5/0x5e0
[   80.096621][ T2288]  worker_thread+0xa53/0xfc0
[   80.097079][ T2288]  kthread+0x38b/0x480
[   80.097479][ T2288]  ? __pfx_worker_thread+0x10/0x10
[   80.097942][ T2288]  ? __pfx_kthread+0x10/0x10
[   80.098399][ T2288]  ret_from_fork+0x514/0xb70
[   80.098846][ T2288]  ? __pfx_ret_from_fork+0x10/0x10
[   80.099338][ T2288]  ? __switch_to+0xc79/0x1410
[   80.099789][ T2288]  ? __pfx_kthread+0x10/0x10
[   80.100236][ T2288]  ret_from_fork_asm+0x1a/0x30
[   80.100700][ T2288]  </TASK>
[   80.101280][ T2288] Kernel Offset: disabled
[   80.101825][ T2288] Rebooting in 86400 seconds..

Regards,

--0000000000001c85d4065b3d5d82
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtxkxv5v0>
X-Attachment-Id: f_mtxkxv5v0

LyoKICogMjg4LXdhcm5pbmctaW4tY3h1c2ItbWVkaW9uLXYtc3RvcC1zdHJlYW1pbmcKICovCiNk
ZWZpbmUgX0dOVV9TT1VSQ0UKI2luY2x1ZGUgPGRpcmVudC5oPgojaW5jbHVkZSA8ZXJybm8uaD4K
I2luY2x1ZGUgPGZjbnRsLmg+CiNpbmNsdWRlIDxwdGhyZWFkLmg+CiNpbmNsdWRlIDxzY2hlZC5o
PgojaW5jbHVkZSA8c2lnbmFsLmg+CiNpbmNsdWRlIDxzdGRhcmcuaD4KI2luY2x1ZGUgPHN0ZGlu
dC5oPgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8c3Ry
aW5nLmg+CiNpbmNsdWRlIDxzeXMvaW9jdGwuaD4KI2luY2x1ZGUgPHN5cy9tbWFuLmg+CiNpbmNs
dWRlIDxzeXMvc3lzY2FsbC5oPgojaW5jbHVkZSA8c3lzL3dhaXQuaD4KI2luY2x1ZGUgPHRpbWUu
aD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgoKI2luY2x1ZGUgPGxpbnV4L3VzYi9jaDkuaD4KI2luY2x1
ZGUgPGxpbnV4L3VzYi9yYXdfZ2FkZ2V0Lmg+CiNpbmNsdWRlIDxsaW51eC92aWRlb2RldjIuaD4K
CiNkZWZpbmUgRVAwX01BWCA0MDk2CiNkZWZpbmUgTEUxNih2KSAoKHYpICYgMHhmZiksICgoKHYp
ID4+IDgpICYgMHhmZikKCiNkZWZpbmUgQ1BVX0JVUk5FUl9USFJFQURTIDQKI2RlZmluZSBUT1RB
TF9CVURHRVRfU0VDT05EUyAzMDAuMAojZGVmaW5lIEhVQl9ESVNDT05ORUNUX0JVREdFVF9TRUNP
TkRTIDE3MC4wCgpzdHJ1Y3Qgc2hhcmVkX3N0YXRlIHsKCXZvbGF0aWxlIGludCBnYWRnZXRfY29u
ZmlndXJlZDsKCXZvbGF0aWxlIGludCBzdGFsbF9idWxrX3JlcGxpZXM7Cn07CnN0YXRpYyBzdHJ1
Y3Qgc2hhcmVkX3N0YXRlICpzaGFyZWQ7CgpzdGF0aWMgaW50IHJhd19nYWRnZXRfZmQgPSAtMTsK
c3RhdGljIHZvbGF0aWxlIGludCBzdG9wX2FsbF90aHJlYWRzOwpzdGF0aWMgaW50IGJ1bGtfaW5f
ZXBfaGFuZGxlID0gLTEsIGJ1bGtfb3V0X2VwX2hhbmRsZSA9IC0xOwoKc3RhdGljIGludCBrbXNn
X2ZkID0gLTE7CnN0YXRpYyB2b2xhdGlsZSBwaWRfdCBjbG9zaW5nX3RocmVhZF90aWQ7CnN0YXRp
YyB2b2xhdGlsZSBpbnQgYnVybmVyc19ydW5uaW5nOwpzdGF0aWMgY2hhciB1c2JfaW50ZXJmYWNl
X25hbWVbNjRdOwoKc3RhdGljIHN0cnVjdCB1c2JfZGV2aWNlX2Rlc2NyaXB0b3IgZGV2aWNlX2Rl
c2NyaXB0b3IgPSB7CgkuYkxlbmd0aCA9IHNpemVvZihzdHJ1Y3QgdXNiX2RldmljZV9kZXNjcmlw
dG9yKSwKCS5iRGVzY3JpcHRvclR5cGUgPSBVU0JfRFRfREVWSUNFLAoJLmJjZFVTQiA9IDB4MDIw
MCwKCS5iTWF4UGFja2V0U2l6ZTAgPSA2NCwKCS5pZFZlbmRvciA9IDB4MTY2MCwKCS5pZFByb2R1
Y3QgPSAweDA5MzIsCgkuYmNkRGV2aWNlID0gMHgwMTAwLAoJLmJOdW1Db25maWd1cmF0aW9ucyA9
IDEsCn07CgojZGVmaW5lIElOVEVSRkFDRV9ERVNDKGFsdCwgbmVwcykgOSwgVVNCX0RUX0lOVEVS
RkFDRSwgMCwgKGFsdCksIChuZXBzKSwgMHhmZiwgMHhmZiwgMHhmZiwgMAojZGVmaW5lIEJVTEtf
SU5fRVAxX0RFU0MgICA3LCBVU0JfRFRfRU5EUE9JTlQsIDB4ODEsIFVTQl9FTkRQT0lOVF9YRkVS
X0JVTEssIExFMTYoNTEyKSwgMAojZGVmaW5lIEJVTEtfT1VUX0VQMV9ERVNDICA3LCBVU0JfRFRf
RU5EUE9JTlQsIDB4MDEsIFVTQl9FTkRQT0lOVF9YRkVSX0JVTEssIExFMTYoNTEyKSwgMAojZGVm
aW5lIElTT0NfSU5fRVAyX0RFU0MgICA3LCBVU0JfRFRfRU5EUE9JTlQsIDB4ODIsIFVTQl9FTkRQ
T0lOVF9YRkVSX0lTT0MsIExFMTYoMTAyNCksIDEKI2RlZmluZSBCVUxLX0lOX0VQMl9ERVNDICAg
NywgVVNCX0RUX0VORFBPSU5ULCAweDgyLCBVU0JfRU5EUE9JTlRfWEZFUl9CVUxLLCBMRTE2KDUx
MiksIDAKCnN0YXRpYyBjb25zdCB1aW50OF90IGNvbmZpZ3VyYXRpb25fZGVzY3JpcHRvcltdID0g
ewoJOSwgVVNCX0RUX0NPTkZJRywgTEUxNig5ICsgMjMgKyAzMCArIDMwKSwgMSwgMSwgMCwgMHhh
MCwgMHhmYSwKCUlOVEVSRkFDRV9ERVNDKDAsIDIpLCBCVUxLX0lOX0VQMV9ERVNDLCBCVUxLX09V
VF9FUDFfREVTQywKCUlOVEVSRkFDRV9ERVNDKDEsIDMpLCBCVUxLX0lOX0VQMV9ERVNDLCBCVUxL
X09VVF9FUDFfREVTQywgSVNPQ19JTl9FUDJfREVTQywKCUlOVEVSRkFDRV9ERVNDKDYsIDMpLCBC
VUxLX0lOX0VQMV9ERVNDLCBCVUxLX09VVF9FUDFfREVTQywgQlVMS19JTl9FUDJfREVTQywKfTsK
CnN0YXRpYyBzdHJ1Y3QgdXNiX2VuZHBvaW50X2Rlc2NyaXB0b3IgYnVsa19lbmRwb2ludF9kZXNj
cmlwdG9yID0gewoJLmJMZW5ndGggPSBVU0JfRFRfRU5EUE9JTlRfU0laRSwgLmJEZXNjcmlwdG9y
VHlwZSA9IFVTQl9EVF9FTkRQT0lOVCwKCS5ibUF0dHJpYnV0ZXMgPSBVU0JfRU5EUE9JTlRfWEZF
Ul9CVUxLLCAud01heFBhY2tldFNpemUgPSA1MTIsCn07CgpzdGF0aWMgZG91YmxlIG1vbm90b25p
Y19zZWNvbmRzKHZvaWQpCnsKCXN0cnVjdCB0aW1lc3BlYyBub3c7CgoJY2xvY2tfZ2V0dGltZShD
TE9DS19NT05PVE9OSUMsICZub3cpOwoJcmV0dXJuIG5vdy50dl9zZWMgKyBub3cudHZfbnNlYyAv
IDFlOTsKfQoKc3RhdGljIHZvaWQga21zZyhjb25zdCBjaGFyICpmb3JtYXQsIC4uLikKewoJY2hh
ciBsaW5lWzI1Nl07CglpbnQgbGVuZ3RoOwoJdmFfbGlzdCBhcmd1bWVudHM7CgoJaWYgKGttc2df
ZmQgPCAwKQoJCXJldHVybjsKCWxlbmd0aCA9IHNucHJpbnRmKGxpbmUsIHNpemVvZihsaW5lKSwg
InJlcHJvMjg4OiAiKTsKCXZhX3N0YXJ0KGFyZ3VtZW50cywgZm9ybWF0KTsKCWxlbmd0aCArPSB2
c25wcmludGYobGluZSArIGxlbmd0aCwgc2l6ZW9mKGxpbmUpIC0gbGVuZ3RoLCBmb3JtYXQsCgkJ
CSAgICBhcmd1bWVudHMpOwoJdmFfZW5kKGFyZ3VtZW50cyk7CglpZiAobGVuZ3RoID4gKGludClz
aXplb2YobGluZSkgLSAyKQoJCWxlbmd0aCA9IHNpemVvZihsaW5lKSAtIDI7CglsaW5lW2xlbmd0
aCsrXSA9ICdcbic7Cgl3cml0ZShrbXNnX2ZkLCBsaW5lLCBsZW5ndGgpOwp9CgpzdGF0aWMgaW50
IHdyaXRlX3N5c2ZzX3ZhbHVlKGNvbnN0IGNoYXIgKnBhdGgsIGNvbnN0IGNoYXIgKnZhbHVlKQp7
CglpbnQgZmQgPSBvcGVuKHBhdGgsIE9fV1JPTkxZKTsKCWludCByZXQ7CgoJaWYgKGZkIDwgMCkK
CQlyZXR1cm4gLTE7CglyZXQgPSB3cml0ZShmZCwgdmFsdWUsIHN0cmxlbih2YWx1ZSkpOwoJY2xv
c2UoZmQpOwoJcmV0dXJuIHJldCA8IDAgPyAtMSA6IDA7Cn0KCnN0YXRpYyBpbnQgZmluZF9maXJz
dF91ZGMoY2hhciAqZHJpdmVyX25hbWUsIHNpemVfdCBkcml2ZXJfbmFtZV9zaXplLAoJCQkgIGNo
YXIgKmRldmljZV9uYW1lLCBzaXplX3QgZGV2aWNlX25hbWVfc2l6ZSkKewoJRElSICp1ZGNfZGly
ID0gb3BlbmRpcigiL3N5cy9jbGFzcy91ZGMiKTsKCXN0cnVjdCBkaXJlbnQgKnVkY19lbnRyeTsK
CglpZiAoIXVkY19kaXIpCgkJcmV0dXJuIC0xOwoJd2hpbGUgKCh1ZGNfZW50cnkgPSByZWFkZGly
KHVkY19kaXIpKSkgewoJCWNoYXIgKmxhc3RfZG90OwoKCQlpZiAodWRjX2VudHJ5LT5kX25hbWVb
MF0gPT0gJy4nKQoJCQljb250aW51ZTsKCQlzbnByaW50ZihkZXZpY2VfbmFtZSwgZGV2aWNlX25h
bWVfc2l6ZSwgIiVzIiwgdWRjX2VudHJ5LT5kX25hbWUpOwoJCXNucHJpbnRmKGRyaXZlcl9uYW1l
LCBkcml2ZXJfbmFtZV9zaXplLCAiJXMiLCB1ZGNfZW50cnktPmRfbmFtZSk7CgoJCWxhc3RfZG90
ID0gc3RycmNocihkcml2ZXJfbmFtZSwgJy4nKTsKCQlpZiAobGFzdF9kb3QpCgkJCSpsYXN0X2Rv
dCA9IDA7CgkJY2xvc2VkaXIodWRjX2Rpcik7CgkJcmV0dXJuIDA7Cgl9CgljbG9zZWRpcih1ZGNf
ZGlyKTsKCXJldHVybiAtMTsKfQoKc3RhdGljIGludCBlcDBfdHJhbnNmZXIoaW50IGRpcmVjdGlv
bl9pc19pbiwgY29uc3Qgdm9pZCAqZGF0YSwgdWludDMyX3QgbGVuZ3RoKQp7Cgl1aW50OF90IGJ1
ZmZlcltzaXplb2Yoc3RydWN0IHVzYl9yYXdfZXBfaW8pICsgRVAwX01BWF07CglzdHJ1Y3QgdXNi
X3Jhd19lcF9pbyAqZXAwX2lvID0gKHZvaWQgKilidWZmZXI7CgoJaWYgKGxlbmd0aCA+IEVQMF9N
QVgpCgkJbGVuZ3RoID0gRVAwX01BWDsKCWVwMF9pby0+ZXAgPSAwOwoJZXAwX2lvLT5mbGFncyA9
IDA7CgllcDBfaW8tPmxlbmd0aCA9IGxlbmd0aDsKCWlmIChkaXJlY3Rpb25faXNfaW4gJiYgbGVu
Z3RoKQoJCW1lbWNweShlcDBfaW8tPmRhdGEsIGRhdGEsIGxlbmd0aCk7CglyZXR1cm4gaW9jdGwo
cmF3X2dhZGdldF9mZCwgZGlyZWN0aW9uX2lzX2luID8gVVNCX1JBV19JT0NUTF9FUDBfV1JJVEUg
OgoJCQkJCQkgICAgICBVU0JfUkFXX0lPQ1RMX0VQMF9SRUFELCBlcDBfaW8pOwp9CgpzdGF0aWMg
aW50IGJ1aWxkX2N4dXNiX2J1bGtfcmVwbHkoY29uc3QgdWludDhfdCAqcmVxdWVzdCwgaW50IHJl
cXVlc3RfbGVuZ3RoLAoJCQkJICB1aW50OF90ICpyZXBseSkKewoJdWludDhfdCBjb21tYW5kID0g
cmVxdWVzdF9sZW5ndGggPiAwID8gcmVxdWVzdFswXSA6IDA7CglpbnQgcmVwbHlfbGVuZ3RoLCBp
LCBpMmNfYWRkcmVzczsKCglzd2l0Y2ggKGNvbW1hbmQpIHsKCWNhc2UgMHgwOToKCQlpZiAocmVx
dWVzdF9sZW5ndGggPCA0KQoJCQlyZXR1cm4gMDsKCQlyZXBseV9sZW5ndGggPSAxICsgcmVxdWVz
dFsyXTsKCQlpMmNfYWRkcmVzcyA9IHJlcXVlc3RbM107CgkJcmVwbHlbMF0gPSAweDA4OwoJCWZv
ciAoaSA9IDE7IGkgPCByZXBseV9sZW5ndGg7IGkrKykKCQkJcmVwbHlbaV0gPSAweDAwOwoJCWlm
IChpMmNfYWRkcmVzcyA9PSAweDQ0ICYmIHJlcXVlc3RbMV0gPT0gMiAmJiByZXF1ZXN0X2xlbmd0
aCA+PSA2KSB7CgoJCQlpbnQgY3gyNTg0MF9yZWdpc3RlciA9IChyZXF1ZXN0WzRdIDw8IDgpIHwg
cmVxdWVzdFs1XTsKCgkJCWlmIChjeDI1ODQwX3JlZ2lzdGVyID09IDB4MTAxKQoJCQkJcmVwbHlb
MV0gPSAweDg0OwoJCX0gZWxzZSBpZiAoaTJjX2FkZHJlc3MgPT0gMHg2MykgewoJCQlmb3IgKGkg
PSAxOyBpIDwgcmVwbHlfbGVuZ3RoOyBpKyspCgkJCQlyZXBseVtpXSA9IDB4MDM7CgkJfQoJCXJl
dHVybiByZXBseV9sZW5ndGg7CgljYXNlIDB4MDg6CgkJcmVwbHlbMF0gPSAweDA4OwoJCXJldHVy
biAxOwoJY2FzZSAweDUwOgoJY2FzZSAweDUxOgoJCXJlcGx5WzBdID0gMHgwMDsKCQlyZXR1cm4g
MTsKCWRlZmF1bHQ6CgkJcmV0dXJuIDA7Cgl9Cn0KCnN0YXRpYyB2b2lkICpjeHVzYl9idWxrX3By
b3RvY29sX3RocmVhZCh2b2lkICp1bnVzZWQpCnsKCXVpbnQ4X3Qgb3V0X2J1ZmZlcltzaXplb2Yo
c3RydWN0IHVzYl9yYXdfZXBfaW8pICsgMjU2XTsKCXVpbnQ4X3QgaW5fYnVmZmVyW3NpemVvZihz
dHJ1Y3QgdXNiX3Jhd19lcF9pbykgKyAyNTZdOwoJc3RydWN0IHVzYl9yYXdfZXBfaW8gKmJ1bGtf
b3V0X2lvID0gKHZvaWQgKilvdXRfYnVmZmVyOwoJc3RydWN0IHVzYl9yYXdfZXBfaW8gKmJ1bGtf
aW5faW8gPSAodm9pZCAqKWluX2J1ZmZlcjsKCXVpbnQ4X3QgcmVwbHlbMTI4XTsKCgl3aGlsZSAo
IXN0b3BfYWxsX3RocmVhZHMpIHsKCQlpbnQgcmVxdWVzdF9sZW5ndGgsIHJlcGx5X2xlbmd0aDsK
CgkJaWYgKHNoYXJlZC0+c3RhbGxfYnVsa19yZXBsaWVzKSB7CgkJCXVzbGVlcCgyMDAwKTsKCQkJ
Y29udGludWU7CgkJfQoJCWJ1bGtfb3V0X2lvLT5lcCA9IGJ1bGtfb3V0X2VwX2hhbmRsZTsKCQli
dWxrX291dF9pby0+ZmxhZ3MgPSAwOwoJCWJ1bGtfb3V0X2lvLT5sZW5ndGggPSAxMjg7CgkJcmVx
dWVzdF9sZW5ndGggPSBpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VQX1JFQUQs
IGJ1bGtfb3V0X2lvKTsKCQlpZiAocmVxdWVzdF9sZW5ndGggPCAwKSB7CgkJCXVzbGVlcCgxMDAw
KTsKCQkJY29udGludWU7CgkJfQoJCXJlcGx5X2xlbmd0aCA9IGJ1aWxkX2N4dXNiX2J1bGtfcmVw
bHkoYnVsa19vdXRfaW8tPmRhdGEsCgkJCQkJCSAgICAgIHJlcXVlc3RfbGVuZ3RoLCByZXBseSk7
CgkJaWYgKHJlcGx5X2xlbmd0aCA+IDApIHsKCQkJYnVsa19pbl9pby0+ZXAgPSBidWxrX2luX2Vw
X2hhbmRsZTsKCQkJYnVsa19pbl9pby0+ZmxhZ3MgPSAwOwoJCQlidWxrX2luX2lvLT5sZW5ndGgg
PSByZXBseV9sZW5ndGg7CgkJCW1lbWNweShidWxrX2luX2lvLT5kYXRhLCByZXBseSwgcmVwbHlf
bGVuZ3RoKTsKCQkJaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FUF9XUklURSwg
YnVsa19pbl9pbyk7CgkJfQoJfQoJcmV0dXJuIE5VTEw7Cn0KCnN0YXRpYyB2b2lkIGhhbmRsZV9l
cDBfY29udHJvbF9yZXF1ZXN0KGNvbnN0IHN0cnVjdCB1c2JfY3RybHJlcXVlc3QgKmN0cmwpCnsK
CXVpbnQ4X3QgZGF0YVtFUDBfTUFYXTsKCWludCBsZW5ndGggPSAtMTsKCglpZiAoKGN0cmwtPmJS
ZXF1ZXN0VHlwZSAmIFVTQl9UWVBFX01BU0spID09IFVTQl9UWVBFX1NUQU5EQVJEKSB7CgkJc3dp
dGNoIChjdHJsLT5iUmVxdWVzdCkgewoJCWNhc2UgVVNCX1JFUV9HRVRfREVTQ1JJUFRPUjoKCQkJ
aWYgKChjdHJsLT53VmFsdWUgPj4gOCkgPT0gVVNCX0RUX0RFVklDRSkgewoJCQkJbGVuZ3RoID0g
c2l6ZW9mKGRldmljZV9kZXNjcmlwdG9yKTsKCQkJCW1lbWNweShkYXRhLCAmZGV2aWNlX2Rlc2Ny
aXB0b3IsIGxlbmd0aCk7CgkJCX0gZWxzZSBpZiAoKGN0cmwtPndWYWx1ZSA+PiA4KSA9PSBVU0Jf
RFRfQ09ORklHKSB7CgkJCQlsZW5ndGggPSBzaXplb2YoY29uZmlndXJhdGlvbl9kZXNjcmlwdG9y
KTsKCQkJCW1lbWNweShkYXRhLCBjb25maWd1cmF0aW9uX2Rlc2NyaXB0b3IsIGxlbmd0aCk7CgkJ
CX0KCQkJYnJlYWs7CgkJY2FzZSBVU0JfUkVRX1NFVF9DT05GSUdVUkFUSU9OOgoJCQlpb2N0bChy
YXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0NPTkZJR1VSRSwgMCk7CgkJCWJ1bGtfZW5kcG9p
bnRfZGVzY3JpcHRvci5iRW5kcG9pbnRBZGRyZXNzID0gMHg4MTsKCQkJYnVsa19pbl9lcF9oYW5k
bGUgPSBpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VQX0VOQUJMRSwKCQkJCQkJ
ICAmYnVsa19lbmRwb2ludF9kZXNjcmlwdG9yKTsKCQkJYnVsa19lbmRwb2ludF9kZXNjcmlwdG9y
LmJFbmRwb2ludEFkZHJlc3MgPSAweDAxOwoJCQlidWxrX291dF9lcF9oYW5kbGUgPSBpb2N0bChy
YXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VQX0VOQUJMRSwKCQkJCQkJICAgJmJ1bGtfZW5k
cG9pbnRfZGVzY3JpcHRvcik7CgkJCWlmIChidWxrX2luX2VwX2hhbmRsZSA+PSAwICYmIGJ1bGtf
b3V0X2VwX2hhbmRsZSA+PSAwKSB7CgkJCQlwdGhyZWFkX3QgYnVsa190aHJlYWQ7CgoJCQkJcHRo
cmVhZF9jcmVhdGUoJmJ1bGtfdGhyZWFkLCBOVUxMLAoJCQkJCSAgICAgICBjeHVzYl9idWxrX3By
b3RvY29sX3RocmVhZCwgTlVMTCk7CgkJCQlwdGhyZWFkX2RldGFjaChidWxrX3RocmVhZCk7CgkJ
CX0KCQkJc2hhcmVkLT5nYWRnZXRfY29uZmlndXJlZCA9IDE7CgkJCWxlbmd0aCA9IDA7CgkJCWJy
ZWFrOwoJCWRlZmF1bHQ6CgkJCWJyZWFrOwoJCX0KCX0KCglpZiAobGVuZ3RoIDwgMCkgewoKCQlp
ZiAoY3RybC0+YlJlcXVlc3RUeXBlICYgVVNCX0RJUl9JTikgewoJCQlsZW5ndGggPSBjdHJsLT53
TGVuZ3RoID4gRVAwX01BWCA/IEVQMF9NQVggOiBjdHJsLT53TGVuZ3RoOwoJCQltZW1zZXQoZGF0
YSwgMCwgbGVuZ3RoKTsKCQl9IGVsc2UgewoJCQlsZW5ndGggPSAwOwoJCX0KCX0KCglpZiAoKGN0
cmwtPmJSZXF1ZXN0VHlwZSAmIFVTQl9ESVJfSU4pICYmIGN0cmwtPndMZW5ndGgpIHsKCQlpZiAo
bGVuZ3RoID4gY3RybC0+d0xlbmd0aCkKCQkJbGVuZ3RoID0gY3RybC0+d0xlbmd0aDsKCQllcDBf
dHJhbnNmZXIoMSwgZGF0YSwgbGVuZ3RoKTsKCX0gZWxzZSB7CgkJZXAwX3RyYW5zZmVyKDAsIE5V
TEwsIGN0cmwtPndMZW5ndGgpOwoJfQp9CgpzdGF0aWMgdm9pZCAqZXAwX2NvbnRyb2xfdGhyZWFk
KHZvaWQgKnVudXNlZCkKewoJdWludDhfdCBidWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2V2
ZW50KSArIEVQMF9NQVhdOwoJc3RydWN0IHVzYl9yYXdfZXZlbnQgKmV2ZW50ID0gKHZvaWQgKili
dWZmZXI7CgoJd2hpbGUgKCFzdG9wX2FsbF90aHJlYWRzKSB7CgkJZXZlbnQtPnR5cGUgPSAwOwoJ
CWV2ZW50LT5sZW5ndGggPSBFUDBfTUFYOwoJCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0Jf
UkFXX0lPQ1RMX0VWRU5UX0ZFVENILCBldmVudCkgPCAwKSB7CgkJCWlmIChlcnJubyA9PSBFSU5U
UiB8fCBlcnJubyA9PSBFQlVTWSB8fCBlcnJubyA9PSBFSU5WQUwpIHsKCQkJCXVzbGVlcCgxMDAw
KTsKCQkJCWNvbnRpbnVlOwoJCQl9CgkJCWJyZWFrOwoJCX0KCQlpZiAoZXZlbnQtPnR5cGUgPT0g
VVNCX1JBV19FVkVOVF9DT05UUk9MKQoJCQloYW5kbGVfZXAwX2NvbnRyb2xfcmVxdWVzdCgoc3Ry
dWN0IHVzYl9jdHJscmVxdWVzdCAqKWV2ZW50LT5kYXRhKTsKCX0KCXJldHVybiBOVUxMOwp9Cgpz
dGF0aWMgdm9pZCBnYWRnZXRfY2hpbGQodm9pZCkKewoJY2hhciB1ZGNfZHJpdmVyX25hbWVbMTI4
XSwgdWRjX2RldmljZV9uYW1lWzEyOF07CglzdHJ1Y3QgdXNiX3Jhd19pbml0IHJhd19pbml0OwoJ
cHRocmVhZF90IGVwMF90aHJlYWQ7CgoJaWYgKGZpbmRfZmlyc3RfdWRjKHVkY19kcml2ZXJfbmFt
ZSwgc2l6ZW9mKHVkY19kcml2ZXJfbmFtZSksCgkJCSAgIHVkY19kZXZpY2VfbmFtZSwgc2l6ZW9m
KHVkY19kZXZpY2VfbmFtZSkpIDwgMCkKCQlfZXhpdCgxKTsKCXJhd19nYWRnZXRfZmQgPSBvcGVu
KCIvZGV2L3Jhdy1nYWRnZXQiLCBPX1JEV1IpOwoJaWYgKHJhd19nYWRnZXRfZmQgPCAwKQoJCV9l
eGl0KDEpOwoJbWVtc2V0KCZyYXdfaW5pdCwgMCwgc2l6ZW9mKHJhd19pbml0KSk7CglzdHJuY3B5
KChjaGFyICopcmF3X2luaXQuZHJpdmVyX25hbWUsIHVkY19kcml2ZXJfbmFtZSwKCQlzaXplb2Yo
cmF3X2luaXQuZHJpdmVyX25hbWUpIC0gMSk7CglzdHJuY3B5KChjaGFyICopcmF3X2luaXQuZGV2
aWNlX25hbWUsIHVkY19kZXZpY2VfbmFtZSwKCQlzaXplb2YocmF3X2luaXQuZGV2aWNlX25hbWUp
IC0gMSk7CglyYXdfaW5pdC5zcGVlZCA9IFVTQl9TUEVFRF9ISUdIOwoJaWYgKGlvY3RsKHJhd19n
YWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfSU5JVCwgJnJhd19pbml0KSA8IDApCgkJX2V4aXQoMSk7
CglpZiAoaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9SVU4sIDApIDwgMCkKCQlf
ZXhpdCgxKTsKCXB0aHJlYWRfY3JlYXRlKCZlcDBfdGhyZWFkLCBOVUxMLCBlcDBfY29udHJvbF90
aHJlYWQsIE5VTEwpOwoJZm9yICg7OykKCQlwYXVzZSgpOwp9CgpzdGF0aWMgaW50IGZpbmRfY3h1
c2JfdmlkZW9fbm9kZShjaGFyICpwYXRoLCBzaXplX3QgcGF0aF9zaXplKQp7CglpbnQgbWlub3I7
CgoJZm9yIChtaW5vciA9IDA7IG1pbm9yIDwgMjU2OyBtaW5vcisrKSB7CgkJY2hhciBzeXNmc19u
YW1lX3BhdGhbOTZdLCBkcml2ZXJfbmFtZVs2NF07CgkJaW50IG5hbWVfZmQsIG5hbWVfbGVuZ3Ro
OwoKCQlzbnByaW50ZihzeXNmc19uYW1lX3BhdGgsIHNpemVvZihzeXNmc19uYW1lX3BhdGgpLAoJ
CQkgIi9zeXMvY2xhc3MvdmlkZW80bGludXgvdmlkZW8lZC9uYW1lIiwgbWlub3IpOwoJCW5hbWVf
ZmQgPSBvcGVuKHN5c2ZzX25hbWVfcGF0aCwgT19SRE9OTFkpOwoJCWlmIChuYW1lX2ZkIDwgMCkK
CQkJY29udGludWU7CgkJbmFtZV9sZW5ndGggPSByZWFkKG5hbWVfZmQsIGRyaXZlcl9uYW1lLCBz
aXplb2YoZHJpdmVyX25hbWUpIC0gMSk7CgkJY2xvc2UobmFtZV9mZCk7CgkJaWYgKG5hbWVfbGVu
Z3RoIDw9IDApCgkJCWNvbnRpbnVlOwoJCWRyaXZlcl9uYW1lW25hbWVfbGVuZ3RoXSA9IDA7CgkJ
aWYgKHN0cnN0cihkcml2ZXJfbmFtZSwgImN4dXNiIikpIHsKCQkJc25wcmludGYocGF0aCwgcGF0
aF9zaXplLCAiL2Rldi92aWRlbyVkIiwgbWlub3IpOwoJCQlyZXR1cm4gMDsKCQl9Cgl9CglyZXR1
cm4gLTE7Cn0KCnN0YXRpYyB2b2lkIHVuYmluZF92aXZpZF90b19mcmVlX3Y0bDJfbWlub3JzKHZv
aWQpCnsKCWludCB1bmJpbmRfZmQgPSBvcGVuKCIvc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL3Zp
dmlkL3VuYmluZCIsIE9fV1JPTkxZKTsKCWludCB2aXZpZF9pbmRleDsKCglpZiAodW5iaW5kX2Zk
IDwgMCkKCQlyZXR1cm47Cglmb3IgKHZpdmlkX2luZGV4ID0gMDsgdml2aWRfaW5kZXggPCA2NDsg
dml2aWRfaW5kZXgrKykgewoJCWNoYXIgdml2aWRfZGV2aWNlX25hbWVbMzJdOwoJCWludCBuYW1l
X2xlbmd0aCA9IHNucHJpbnRmKHZpdmlkX2RldmljZV9uYW1lLAoJCQkJCSAgIHNpemVvZih2aXZp
ZF9kZXZpY2VfbmFtZSksCgkJCQkJICAgInZpdmlkLiVkIiwgdml2aWRfaW5kZXgpOwoKCQl3cml0
ZSh1bmJpbmRfZmQsIHZpdmlkX2RldmljZV9uYW1lLCBuYW1lX2xlbmd0aCk7Cgl9CgljbG9zZSh1
bmJpbmRfZmQpOwp9CgpzdGF0aWMgdm9pZCAqY2xvc2luZ190aHJlYWQodm9pZCAqYXJndW1lbnQp
CnsKCWludCBmZCA9IChpbnQpKGludHB0cl90KWFyZ3VtZW50OwoKCWNsb3NpbmdfdGhyZWFkX3Rp
ZCA9IHN5c2NhbGwoU1lTX2dldHRpZCk7CgljbG9zZShmZCk7CglyZXR1cm4gTlVMTDsKfQoKc3Rh
dGljIHZvaWQgKmNwdV9idXJuZXJfdGhyZWFkKHZvaWQgKnVudXNlZCkKewoJd2hpbGUgKGJ1cm5l
cnNfcnVubmluZykKCQlfX2FzbV9fIF9fdm9sYXRpbGVfXygiIiA6OjogIm1lbW9yeSIpOwoJcmV0
dXJuIE5VTEw7Cn0KCnN0YXRpYyB2b2lkIHN0YXJ2ZV9jbG9zaW5nX3RocmVhZCh2b2lkKQp7Cglz
dHJ1Y3Qgc2NoZWRfcGFyYW0gaWRsZV9wYXJhbTsKCWludCBpOwoKCW1lbXNldCgmaWRsZV9wYXJh
bSwgMCwgc2l6ZW9mKGlkbGVfcGFyYW0pKTsKCWlmIChjbG9zaW5nX3RocmVhZF90aWQpCgkJc2No
ZWRfc2V0c2NoZWR1bGVyKGNsb3NpbmdfdGhyZWFkX3RpZCwgU0NIRURfSURMRSwgJmlkbGVfcGFy
YW0pOwoKCWJ1cm5lcnNfcnVubmluZyA9IDE7Cglmb3IgKGkgPSAwOyBpIDwgQ1BVX0JVUk5FUl9U
SFJFQURTOyBpKyspIHsKCQlwdGhyZWFkX3QgYnVybmVyOwoKCQlpZiAocHRocmVhZF9jcmVhdGUo
JmJ1cm5lciwgTlVMTCwgY3B1X2J1cm5lcl90aHJlYWQsIE5VTEwpID09IDApCgkJCXB0aHJlYWRf
ZGV0YWNoKGJ1cm5lcik7Cgl9Cn0KCnN0YXRpYyB2b2lkIHN0b3BfYnVybmVycyh2b2lkKQp7Cgli
dXJuZXJzX3J1bm5pbmcgPSAwOwoJdXNsZWVwKDUwMDAwKTsKfQoKc3RhdGljIGludCBmaW5kX2N4
dXNiX3VzYl9pbnRlcmZhY2UoY2hhciAqbmFtZSwgc2l6ZV90IG5hbWVfc2l6ZSkKewoJRElSICpk
cml2ZXJfZGlyID0gb3BlbmRpcigiL3N5cy9idXMvdXNiL2RyaXZlcnMvZHZiX3VzYl9jeHVzYiIp
OwoJc3RydWN0IGRpcmVudCAqZW50cnk7CgoJaWYgKCFkcml2ZXJfZGlyKQoJCXJldHVybiAtMTsK
CXdoaWxlICgoZW50cnkgPSByZWFkZGlyKGRyaXZlcl9kaXIpKSkgewoJCWlmICghc3RyY2hyKGVu
dHJ5LT5kX25hbWUsICc6JykpCgkJCWNvbnRpbnVlOwoJCXNucHJpbnRmKG5hbWUsIG5hbWVfc2l6
ZSwgIiVzIiwgZW50cnktPmRfbmFtZSk7CgkJY2xvc2VkaXIoZHJpdmVyX2Rpcik7CgkJcmV0dXJu
IDA7Cgl9CgljbG9zZWRpcihkcml2ZXJfZGlyKTsKCXJldHVybiAtMTsKfQoKc3RhdGljIHZvaWQg
KnVuYmluZF90aHJlYWQodm9pZCAqdW51c2VkKQp7CglpbnQgdW5iaW5kX2ZkID0gb3BlbigiL3N5
cy9idXMvdXNiL2RyaXZlcnMvZHZiX3VzYl9jeHVzYi91bmJpbmQiLCBPX1dST05MWSk7CgoJaWYg
KHVuYmluZF9mZCA8IDApCgkJcmV0dXJuIE5VTEw7Cgl3cml0ZSh1bmJpbmRfZmQsIHVzYl9pbnRl
cmZhY2VfbmFtZSwgc3RybGVuKHVzYl9pbnRlcmZhY2VfbmFtZSkpOwoJY2xvc2UodW5iaW5kX2Zk
KTsKCXJldHVybiBOVUxMOwp9CgpzdGF0aWMgdm9pZCBydW5fb25lX2F0dGVtcHQoaW50IGl0ZXJh
dGlvbiwgaW50IHVzZV9odWJfZGlzY29ubmVjdCkKewoJY2hhciB2aWRlb19ub2RlX3BhdGhbNjRd
OwoJcHRocmVhZF90IGNsb3NlcjsKCXBpZF90IGdhZGdldF9waWQ7CglpbnQgdmlkZW9fZmQgPSAt
MTsKCWludCBidWZmZXJfdHlwZSA9IFY0TDJfQlVGX1RZUEVfVklERU9fQ0FQVFVSRTsKCWludCBp
LCBzdHJlYW1vZmZfcmV0OwoJY2hhciBvbmVfYnl0ZTsKCglzaGFyZWQtPmdhZGdldF9jb25maWd1
cmVkID0gMDsKCXNoYXJlZC0+c3RhbGxfYnVsa19yZXBsaWVzID0gMDsKCWNsb3NpbmdfdGhyZWFk
X3RpZCA9IDA7CgoJZ2FkZ2V0X3BpZCA9IGZvcmsoKTsKCWlmIChnYWRnZXRfcGlkIDwgMCkKCQly
ZXR1cm47CglpZiAoZ2FkZ2V0X3BpZCA9PSAwKSB7CgkJZ2FkZ2V0X2NoaWxkKCk7CgkJX2V4aXQo
MSk7Cgl9CgoJZm9yIChpID0gMDsgaSA8IDIwMCAmJiAhc2hhcmVkLT5nYWRnZXRfY29uZmlndXJl
ZDsgaSsrKQoJCXVzbGVlcCgyNTAwMCk7CglpZiAoIXNoYXJlZC0+Z2FkZ2V0X2NvbmZpZ3VyZWQp
IHsKCQlrbXNnKCJpdGVyICVkOiBnYWRnZXQgbmV2ZXIgY29uZmlndXJlZCIsIGl0ZXJhdGlvbik7
CgkJZ290byBvdXQ7Cgl9CgoJZm9yIChpID0gMDsgaSA8IDMwMDsgaSsrKSB7CgkJaWYgKGZpbmRf
Y3h1c2JfdmlkZW9fbm9kZSh2aWRlb19ub2RlX3BhdGgsCgkJCQkJICBzaXplb2YodmlkZW9fbm9k
ZV9wYXRoKSkgPT0gMCkKCQkJYnJlYWs7CgkJdXNsZWVwKDEwMDAwMCk7Cgl9CglpZiAoaSA9PSAz
MDApIHsKCQlrbXNnKCJpdGVyICVkOiBubyBjeHVzYiB2aWRlbyBub2RlIiwgaXRlcmF0aW9uKTsK
CQlnb3RvIG91dDsKCX0KCglmb3IgKGkgPSAwOyBpIDwgMTUwOyBpKyspIHsKCQl2aWRlb19mZCA9
IG9wZW4odmlkZW9fbm9kZV9wYXRoLCBPX1JEV1IgfCBPX05PTkJMT0NLKTsKCQlpZiAodmlkZW9f
ZmQgPj0gMCkKCQkJYnJlYWs7CgkJdXNsZWVwKDEwMDAwMCk7Cgl9CglpZiAodmlkZW9fZmQgPCAw
KSB7CgkJa21zZygiaXRlciAlZDogY2Fubm90IG9wZW4gJXMiLCBpdGVyYXRpb24sIHZpZGVvX25v
ZGVfcGF0aCk7CgkJZ290byBvdXQ7Cgl9CgoJcmVhZCh2aWRlb19mZCwgJm9uZV9ieXRlLCAxKTsK
CglzdHJlYW1vZmZfcmV0ID0gaW9jdGwodmlkZW9fZmQsIFZJRElPQ19TVFJFQU1PRkYsICZidWZm
ZXJfdHlwZSk7CglpZiAoIShzdHJlYW1vZmZfcmV0IDwgMCAmJiBlcnJubyA9PSBFQlVTWSkpIHsK
CQlrbXNnKCJpdGVyICVkOiBmaWxlaW8gTk9UIGFybWVkIChzdHJlYW1vZmYgJWQvJWQpIiwgaXRl
cmF0aW9uLAoJCSAgICAgc3RyZWFtb2ZmX3JldCwgZXJybm8pOwoJCWdvdG8gb3V0X2Nsb3NlOwoJ
fQoJa21zZygiaXRlciAlZDogZmlsZWlvIGFybWVkIG9uICVzLCBtb2RlPSVzIiwgaXRlcmF0aW9u
LCB2aWRlb19ub2RlX3BhdGgsCgkgICAgIHVzZV9odWJfZGlzY29ubmVjdCA/ICJodWItZGlzY29u
bmVjdCIgOiAic3lzZnMtdW5iaW5kIik7CgoJaWYgKCF1c2VfaHViX2Rpc2Nvbm5lY3QgJiYKCSAg
ICBmaW5kX2N4dXNiX3VzYl9pbnRlcmZhY2UodXNiX2ludGVyZmFjZV9uYW1lLAoJCQkJICAgICBz
aXplb2YodXNiX2ludGVyZmFjZV9uYW1lKSkgPCAwKSB7CgkJa21zZygiaXRlciAlZDogbm8gY3h1
c2IgdXNiIGludGVyZmFjZSIsIGl0ZXJhdGlvbik7CgkJZ290byBvdXRfY2xvc2U7Cgl9CgoJc2hh
cmVkLT5zdGFsbF9idWxrX3JlcGxpZXMgPSAxOwoJaWYgKHB0aHJlYWRfY3JlYXRlKCZjbG9zZXIs
IE5VTEwsIGNsb3NpbmdfdGhyZWFkLAoJCQkgICAodm9pZCAqKShpbnRwdHJfdCl2aWRlb19mZCkg
IT0gMCkKCQlnb3RvIG91dF9jbG9zZTsKCXB0aHJlYWRfZGV0YWNoKGNsb3Nlcik7Cgl2aWRlb19m
ZCA9IC0xOwoJdXNsZWVwKDIwMDAwMCk7CgoJaWYgKHVzZV9odWJfZGlzY29ubmVjdCkgewoJCXN0
YXJ2ZV9jbG9zaW5nX3RocmVhZCgpOwoJCXVzbGVlcCgxMDAwMDApOwoJCWttc2coIml0ZXIgJWQ6
IHVucGx1Z2dpbmcgZ2FkZ2V0IiwgaXRlcmF0aW9uKTsKCQlraWxsKGdhZGdldF9waWQsIFNJR0tJ
TEwpOwoJCXVzbGVlcCgzMDAwMDAwKTsKCQlzdG9wX2J1cm5lcnMoKTsKCX0gZWxzZSB7CgkJcHRo
cmVhZF90IHVuYmluZGVyOwoKCQlrbXNnKCJpdGVyICVkOiB1bmJpbmRpbmcgJXMiLCBpdGVyYXRp
b24sIHVzYl9pbnRlcmZhY2VfbmFtZSk7CgkJaWYgKHB0aHJlYWRfY3JlYXRlKCZ1bmJpbmRlciwg
TlVMTCwgdW5iaW5kX3RocmVhZCwgTlVMTCkgIT0gMCkKCQkJZ290byBvdXRfY2xvc2U7CgkJcHRo
cmVhZF9kZXRhY2godW5iaW5kZXIpOwoKCQl1c2xlZXAoNjAwMDAwKTsKCQlzaGFyZWQtPnN0YWxs
X2J1bGtfcmVwbGllcyA9IDA7CgkJdXNsZWVwKDMwMDAwMDApOwoJfQoKb3V0X2Nsb3NlOgoJaWYg
KHZpZGVvX2ZkID49IDApCgkJY2xvc2UodmlkZW9fZmQpOwpvdXQ6CglzdG9wX2J1cm5lcnMoKTsK
CXNoYXJlZC0+c3RhbGxfYnVsa19yZXBsaWVzID0gMDsKCWtpbGwoZ2FkZ2V0X3BpZCwgU0lHS0lM
TCk7Cgl3YWl0cGlkKGdhZGdldF9waWQsIE5VTEwsIDApOwoJdXNsZWVwKDMwMDAwMCk7Cn0KCmlu
dCBtYWluKHZvaWQpCnsKCWRvdWJsZSBzdGFydF90aW1lOwoJaW50IGl0ZXJhdGlvbjsKCglrbXNn
X2ZkID0gb3BlbigiL2Rldi9rbXNnIiwgT19XUk9OTFkpOwoKCWlmICh3cml0ZV9zeXNmc192YWx1
ZSgiL3N5cy9jbGFzcy9maXJtd2FyZS90aW1lb3V0IiwgIjEiKSA8IDApCgkJa21zZygiY2Fubm90
IHNob3J0ZW4gdGhlIGZpcm13YXJlIHRpbWVvdXQiKTsKCgl1bmJpbmRfdml2aWRfdG9fZnJlZV92
NGwyX21pbm9ycygpOwoKCXNoYXJlZCA9IG1tYXAoTlVMTCwgc2l6ZW9mKCpzaGFyZWQpLCBQUk9U
X1JFQUQgfCBQUk9UX1dSSVRFLAoJCSAgICAgIE1BUF9TSEFSRUQgfCBNQVBfQU5PTllNT1VTLCAt
MSwgMCk7CglpZiAoc2hhcmVkID09IE1BUF9GQUlMRUQpCgkJcmV0dXJuIDE7CgoJc2lnbmFsKFNJ
R0NITEQsIFNJR19ERkwpOwoKCXN0YXJ0X3RpbWUgPSBtb25vdG9uaWNfc2Vjb25kcygpOwoJZm9y
IChpdGVyYXRpb24gPSAwOzsgaXRlcmF0aW9uKyspIHsKCQlkb3VibGUgZWxhcHNlZCA9IG1vbm90
b25pY19zZWNvbmRzKCkgLSBzdGFydF90aW1lOwoKCQlpZiAoZWxhcHNlZCA+IFRPVEFMX0JVREdF
VF9TRUNPTkRTKQoJCQlicmVhazsKCQlydW5fb25lX2F0dGVtcHQoaXRlcmF0aW9uLAoJCQkJZWxh
cHNlZCA8IEhVQl9ESVNDT05ORUNUX0JVREdFVF9TRUNPTkRTKTsKCX0KCXJldHVybiAwOwp9Cg==
--0000000000001c85d4065b3d5d82--
