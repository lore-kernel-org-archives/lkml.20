Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794887053;
	b=IPVsvu/KinwjwVb4VMz+i6kfo4aBckjUoOmCAd3xSVjNGnBANjdNtY5JjKNOgtW0EkN8
	 LzF6tmBY2YpEyOUOb0/JfbBDsBsy3VHmYJUGMQ01indgQudja/tiE4qY9IaDtEhoMvwgb
	 UeZj8+uXij02WF9wo60z7gRlxMFGK8dU0OP61YGWHPZENhcoNOKrbPCsqBpf7kADEqDms
	 JK9TtDgFK1NhM6UeTt2TmQ7GEjY72U8uFilAs2xrf+LUemCqNa4nx9qt8vxm8/eAZsbQM
	 U7u7iiV6WgMSb+BHmQPc8V6OTMOFHx41cWEvCTDWFGeViu0hAuOMrzBJQfg1XOYpNBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=C4WE6lvbRm2tg6GIEGvDJsmiQH5bZTXE6oQATuM1VIM=;
	b=ffQ3MJXRVOdTDcDPKVubnPK0UwOnMboFbadC5tGYlcNGawpyyTEKBGNM3iz0OrYs4F54
	 LIPueVt5WNGIVTklrCa0ELtThwlBXAw7Wl1JbKJeHq/q3IllV+I1CRWi+r8r7RH+hdMGb
	 5ocH+8Sw2CYDmMDCeDis5mJFRiECFBRxLKPDKksuGFpAXdOAFAjOcGZes2bpUhe9HJefo
	 kRKYMMx9GrH9aGpuiyXplhmHLnBCXbux1+cC/OVKETAd1QKc9qdQjM63rjBW1CkaSQrso
	 vYRaIoWqHu4slx6HTh5Q4SitUY0Txib7AZtTj3vIFmqrbw7dS0ZJZLlkFLG9vtsuc4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EC51+VkK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.73
Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672F3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EC51+VkK
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3ad31c004d8so21329271fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:44:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794887051; cv=none;
        d=google.com; s=arc-20260327;
        b=NMoM0WPHNTLfwM64lmQlNgEJeWfbhdCpJyA+P3wGdXojtX7u5I080Hm7iu66pMmwdB
         YvZCArXQ/klsZjmNQaG4q3sIIC84u7P9/dxfyfv1+VyG2XldHhtXvVMBv8dqBKsNbn/o
         8OnRE2M6uYRLD5JwGPBIEri7+/sDt1SSsj9mjWUcAeGqb/nKGnLrgStEe0cACy/LxjXs
         CwkCRBtMpe+fznjqLyLAyqmo8zOy2sEXrsPJ7w1qJZ+l5FK8VnWAwi/8Pu63pUosxBde
         iPPfOXaCtfQ2wz/d7efC91UFuGZDwRdGiObFM8HHnQyKeWCGtf2ipRd2EdOi9qzDaigw
         I2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=C4WE6lvbRm2tg6GIEGvDJsmiQH5bZTXE6oQATuM1VIM=;
        fh=QSlCqJUgPGsTm2qyDLGCD+Hae0XYzik3YgjFEaUzVdY=;
        b=i+IwpJIPfuFolVM/fIGr6vNdUynSbFOL+dsNchrj99SnLbGYQMJAIpfEGhwAztaM5D
         TP5A3uvczJr+97bYhOQ5pfM/kDX8R9/tafJC0p/V/JULAIwWmhqgNAwwVD4e99QJGCcR
         rDHSFFXDcQoscU88kAuhZVmgkB9tFf5mHwv5kFk8/BOug9ntl6TmZowzdCiqGOlabD25
         7kB3eKJPwAhGxw1dbKKBmxzWDABII3AuBrlZtXAVjFgzd7aqeyvR3wqMzTz9WrTJoZYk
         jCGWYBTdpeoEKbvD1IQ9q8SVMZ/fjWnfQyxxN/wZ4ak2CjldwgPZhXzUhTLoGf5Kgx2N
         s//A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887051; x=1795491851; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4WE6lvbRm2tg6GIEGvDJsmiQH5bZTXE6oQATuM1VIM=;
        b=EC51+VkKhcCEziOH6+Eqj1/0rMDeYpe0mcMeXO3WRqZmITLC7vWVzx/i3SPL1bVJug
         /jbNoGjgKWYVLeC5vURKfC9x+kdRODRTcZ/NqwWHxFeDgfyy2B+Ovu5QFzoUR4h43Atm
         sey4P+LZw7kV5Tqz70q5Xww+QkyY+fY/v1uEBddEmrBhCHBs0WAtK8IQZlSJ3TJ4zAXa
         uwBj5T+ytIXcWj11QwcLt6mqebQtvsnNqbDH9paXG+79ENmbEqA/R81r8RJ4UFpB8eJH
         NTbf8JS79xbjW4las8/zq8hoGpC39St22sl2H7jnWW2Qu8u6Poa0fCw14oS7vQIi93Yp
         Xghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887051; x=1795491851;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C4WE6lvbRm2tg6GIEGvDJsmiQH5bZTXE6oQATuM1VIM=;
        b=JIwWv4+ppZvVdBYhZnaCrn8w7tk6nFsFS60Ni0nMFwf523Z5i0il8RTsUzwA+UcagG
         REFg/Nsnp4wpKMKNC6hcwMnmDZYu9gst23xZUolMqaWZiCuuG+IuZjbbQZQiE/lAEt9l
         tTkG47ONtLWR04Q/rXYbxX26Xt271CQ4UlOsNON7OyKwslFe6+8ENTzoovN+/1ARlPl1
         L0+MK2ZFtI+tndwzKZe7nyvQyJOZt7lQd3uujBMwvsz9VEx6ffrSkj4jtrurxB2DjJuM
         zhfRcy9zNsOALNN0JyNHnL9gZ/52s70vGd9zZhD4SomamSh1eSWpzcg+FwW9uozgjQ5W
         UT3g==
X-Forwarded-Encrypted: i=1; AL+hErFxBgzbfh42DI0H09twFNAv7j8AHAdZs7ti24E6VaavKp70JpGY8Wh/BTgLbY7QzFVg4rxIvLAw5n7sF08=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ftcZ7IishWRfcAOxYdI0YZKspm9Fh9jR/2SfCB6KbunFzK+Ho
	/JJvP7psXQid2PEM2sDlPtHi1ib1oxvvWT/f0wlraiEZg/x5i5vwPAHeRtRDMVJvAieFWHwhmLc
	WKBA/sqbVL7XYVkrxWDRc9/fZnglzWqg=
X-Gm-Gg: AYBFou2uT21ntFTvAKLy+FCuFmHIhMnniZBd+LnKIl8FDiANPhoawUpkVOtsQ/ETp4+
	13icVIIfET31yHaCpGcsVBJYNhpcXMOvhXNrPllXb/7o0gqojMgLQmf7Sa6eR7PMv+TaUD6Izuy
	xX+2c/lqwW5T/LSHT+Z/wK7y8GLs/E9Xyb/EPgu2+o2v3Q6ltwDNeEFNHKwFTysXelLIXeScDMR
	7tjirEFrLnmtb9D/sn8j4c+/wOqDntI1nWtTmJAsJInvwRsTOgSrCr99jcG2vPTT1LkruLHHtE/
	QmdL2CHEF3M6PawhGgxoJf1N/DYESUnhpxs6OZxmy5R56H7ENfzA8LHvhdonIQlDskg71zmFxFB
	yVtGQ9ZulstKEYRCWZQH71Lm2pi1zoSdp/kHpH/XHqShZv0gnPazKk3f1M42mptfbbs7YqeRrhK
	jYGtw75f38miwmmQ==
X-Received: by 2002:a05:651c:502:b0:3a6:6f81:1027 with SMTP id
 38308e7fff4ca-3ae2b531493mr38348591fa.24.1794887051332; Mon, 16 Nov 2026
 19:44:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Zheng Zheng <fengaojigui88@gmail.com>
Date: Tue, 17 Nov 2026 11:43:57 +0800
X-Gm-Features: AclHuK841NQw71Pm0HHoozBnMA4yabK9zjfXO_9miNQ1BHUNWG1VHD5_WFWcnW4
Message-ID: <CAO-4RZ0262Z+oTx05f8_mD9eJu7wYE4UNZgHe79dR9m7pHvvCA@mail.gmail.com>
Subject: [BUG] WARNING: ODEBUG bug in corsair_remove (drivers/hid/hid-corsair.c,
 v7.4-rc3)
To: jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Jiri, Benjamin,

We found a reproducible debugobjects warning in the Corsair HID driver on
v7.4-rc3 with syzkaller. We reproduced this warning on an unmodified
v7.4-rc3 kernel.

Key log excerpt from the rc3 external run
(logs/external-verification/run1-serial.log, hit at 93.23 s):

  [   93.233905][   T11] ODEBUG: free active (active state 0) object:
ff1100017cebb2c8 object type: work_struct hint:
k90_record_led_work+0x0/0x210
  [   93.233944][   T11] WARNING: lib/debugobjects.c:629 at
debug_print_object+0x1a0/0x2e0, CPU#0: kworker/0:1/11
  [   93.237255][   T11] Modules linked in: dm_multipath(E)
  [   93.238355][   T11] CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1
Tainted: G            E       7.4.0-rc3-kernsight-kasan #1
PREEMPT(full)
  [   93.242242][   T11] Workqueue: usb_hub_wq hub_event
  [   93.242850][   T11] RIP: 0010:debug_print_object+0x1a5/0x2e0
  [   93.258269][   T11] Call Trace:
  [   93.258659][   T11]  <TASK>
  [   93.259006][   T11]  ? __pfx_k90_record_led_work+0x10/0x10
  [   93.259685][   T11]  debug_check_no_obj_freed+0x3d7/0x520
  [   93.262901][   T11]  kfree+0x3ff/0x660
  [   93.263373][   T11]  ? corsair_remove+0xff/0x2f0
  [   93.263953][   T11]  corsair_remove+0xff/0x2f0
  [   93.265130][   T11]  hid_device_remove+0xd6/0x200
  [   93.266372][   T11]  device_remove+0xd0/0x170
  [   93.266925][   T11]  device_release_driver_internal+0x45f/0x630
  [   93.268915][   T11]  bus_remove_device+0x2bf/0x570
  [   93.270799][   T11]  device_del+0x39b/0x9e0
  [   93.273129][   T11]  hid_destroy_device+0x1a9/0x240
  [   93.273736][   T11]  usbhid_disconnect+0xa8/0xe0
  [   93.274289][   T11]  usb_unbind_interface+0x1ea/0x9a0
  [   93.275595][   T11]  device_remove+0x12a/0x170
  [   93.276150][   T11]  device_release_driver_internal+0x45f/0x630
  [   93.278564][   T11]  bus_remove_device+0x2bf/0x570
  [   93.279884][   T11]  device_del+0x39b/0x9e0
  [   93.281551][   T11]  usb_disable_device+0x35e/0x800
  [   93.282146][   T11]  usb_disconnect+0x2e4/0xa10
  [   93.282725][   T11]  hub_event+0x1ea9/0x5010
  [   93.294782][   T11] Kernel panic - not syncing: kernel:
panic_on_warn set ...

Critical call chain:

  debug_check_no_obj_freed
   kfree
    corsair_remove+0xff/0x2f0
     hid_device_remove
      device_remove
       device_release_driver_internal
        bus_remove_device
         device_del
          hid_destroy_device
           usbhid_disconnect
            usb_unbind_interface
             usb_disable_device
              usb_disconnect
               hub_event

The ODEBUG hint is `k90_record_led_work`.

How to reproduce:

1. Build vanilla v7.4-rc3 with:
     CONFIG_KASAN=y
     CONFIG_DEBUG_OBJECTS=y
     CONFIG_DEBUG_OBJECTS_WORK=y
     CONFIG_HID_CORSAIR=y
     CONFIG_DEBUG_INFO=y
   The bzImage used here has sha256
   0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a1882.

2. Boot a Debian trixie x86_64 guest (6 GiB RAM, 4 vCPU, KVM) with at least:
     root=/dev/sda console=ttyS0 oops=panic panic_on_warn=1
   The full QEMU command line is in environment.txt.

3. Copy syz-execprog and syz-executor built from syzkaller commit
   853b104bb454141a5b0fc0e4218ec78e9f34ffb1, plus
   reproducer/repro.kernsight.prog, into the guest.

4. In the guest, as root, run:

     syz-execprog -procs=8 -threaded -repeat=1 \
         -executor ./syz-executor repro.kernsight.prog

Expected result: ODEBUG `free active` warning in dmesg/serial after roughly
90-100 seconds, with the call chain above; panic_on_warn=1 then panics the
guest. We observed the hit 2/2 on fresh VMs:

  Run 1: 93.23 s after boot
  Run 2: 94.27 s after boot

Analysis:

The Corsair LED work items are queued by k90_brightness_set() via
schedule_work(). During removal, both cleanup paths do:

  cancel_work_sync(&...->work);
  led_classdev_unregister(&...->cdev);
  kfree(...);

led_classdev_unregister() turns the LED off, which can queue the work item
again after the first cancel_work_sync(). The containing structure is then
freed while the work_struct is still active, so debugobjects reports
"free active" in corsair_remove().

A reproducer repository is available at:

  https://github.com/Zheng-zheng-codes/corsair-remove-odebug-warning

It contains the syzkaller program, kernel config, guest/run details and the
full rc3 serial logs.

Best regards,
Zheng Zheng
