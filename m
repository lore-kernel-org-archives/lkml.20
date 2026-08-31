Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB513D648F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166964; cv=pass; b=XWQuUoa9cH99hv9yyVnypOEDJYtF3SrocmlUCD6PvvC86Sm1Oe1ZLEpY2fUv2mujA2K1xWVIDI7feJZi4mQYgY3SmMrKNNfqeMaJhb6NGAKDHuCXW3sPBGN+XIW4Z+2UeGSietLGrJ9iuTujEpnzYiZZUlUNVlHmB7p86BC71ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166964; c=relaxed/simple;
	bh=3ExR3fMMoBIjoHcxh1zhm4q4KVLaLv8xDMILL6sUfL8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GhablJrpa2jD9p63VkbuXZNIk3nOV5Ty0257Mf8iCKeq/kDl6CW26YkQ1qgNBs42YTBASGp+o23D76E0fUR1eyj16nGqAJpeGs90IxnIT22fYoAGvhJBQoq/4TI8suzwWA/FtuavQzbyCkc39R8vIF7hHLPTwzpyWUNpMFZR0uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdYV/mjV; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdYV/mjV"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso1219287e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788166961; cv=none;
        d=google.com; s=arc-20260327;
        b=ajbIwYJDET+ClwE3wdpca1xMl7hWw3SZqPpf3iqjIXr7ozkmojaE8tcnlTwiquTpTH
         vYmWt7Mr4vfR/B6EpSAAczw82RlUs03Qh2fwdTixYkK1EUjcHHoHKmuvlM6OtSGjhBEA
         MiTSeR/6jTfgBgLE3JEn5O32T2IFmeJjDq8HsZHb+drHLy4jC2O7KLuMfzrSy484fmDP
         ICHw6IWHOmwTu7bxQnsohqj8Ysodf7Wl/x4UZUh+g0YaY/eROdWbN1vI+hQzWQ5v0auP
         c2TsnLO6G1vYeQo66KyEGe0rjAOUhhyMkLlX3IPSl1dGHPDGMZilhK+6AFNgXG2zCXRF
         JA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3ExR3fMMoBIjoHcxh1zhm4q4KVLaLv8xDMILL6sUfL8=;
        fh=OI45rNzA597SzKTL9ce+UTBflpcsQM34lUrLpF+8WIM=;
        b=rfLatiS9HNZztgomMcSVYabW0N+czf+1rto6CA0QIjZFTO+6nn0hs6lGBzUbKOlk8L
         S0x/8I660UfMpLnRF9w0fr4JXE0CAxhnQFCfdSdfPDheP9FJmeLVCt0dW5NHrQM/v5yF
         f6lO0JwMLQ9BNvi0HfdE1gJPCoRJreR8HojF8i9GzVVKPmizB8sKhFGzxkxcUE0FDBzy
         SzMsGt3J/MXAOPTkw631NjE+icZ3zRCdENKuda5kiqyZw1qCM8vpDvdGXq3hH0+uf4jM
         3ncuD4oiYv29SzJbBTgkzCSSn1vfssrWvta/qtTrJpzSijZjXZsTvLRZ5Ko9GUWeMqZA
         MApw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788166961; x=1788771761; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ExR3fMMoBIjoHcxh1zhm4q4KVLaLv8xDMILL6sUfL8=;
        b=LdYV/mjVLjXZ8vdGM+ItZsPuWqgtLfGp9u1DactcSvsfa+rZsmh2DgriMrhpk+1lln
         VnotjlfsUtWdU7kqWhfMZSQVkSeP7WYJ9GdZhz/kgHlQ++DGbRHXrJobmKfdMEn9k8gx
         y1d6HsCTM6ziSZ2hdEwYHGY34QZjYVfaGvDLS/4K5kzaXVC7VQ1DLc1t4Wv6grpxIRV6
         N6qT1BJBp+yhG1HIfOfL/t15bM3PmjSJnhBxeBQwN7/bZYtdsKve2WieWnySkRg3mO6q
         cPQ09JzOI4G5vn9jE14I5N4VI/6gQiw7dkmhojXojbv/WDzmKq3iClQM6CqDvl/ZAY01
         xR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166961; x=1788771761;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ExR3fMMoBIjoHcxh1zhm4q4KVLaLv8xDMILL6sUfL8=;
        b=e65yM51G3DZRVgIbVqwufWBgs/7MnlZVj/tGHKJgXyt0WdArMiqmEv+pDtv7rJtFCF
         pxBFlm9ShUvTOECw7QZVyU89HGc7snOVNQRDZsDR2R1jryn2xutj+Gj29jMXmP5JpmSi
         eb4WPYLKGWkXv1MvQKxKFFo4Ugsd76nziWje4fH8LVAV5+3mMOTdvUDZCI9rrjdQPsTk
         aE+1K7uQQh55e0EvGjYnrtoR3Gqn4zogV2skE/YY50hEO34zQZs3gngZAoXpuFGGOk+9
         WxhXojxwxlhPN5NNFh36u/mxqHxy0W+X53acgcTXOWKBoFKI9b4KtyGqLzb2PwEaZk6Y
         MSaA==
X-Gm-Message-State: AFuF++lzzwC7+FKQwRpEV1B0PP9/HujlYgzKUhdD6DuMQ7wZN1hQRvj9
	mwnC0BUdPp8bOMCX6Mm4RnvhVgVDHIawP7P8cudWbP5vBL0HqLq9gvTpfOQdqkv+/w8YtUgfcRS
	XOu1910zgMUTR4l0NkmQLQSHufv5Epd+Z7p7OORbqYA==
X-Gm-Gg: AR+sD13nYmOTm540uM/ZMUEygJfmM4oJ/fBGmG6n+i0jdBsU9+QPyJdn1qWxa5NHYjZ
	V6qeAYwIlHLb/t0ImjFHp5qRT8annzjPIrbEvA1MkHCbEZ3LToLSCt7DRKvitoy7iRTTP9AJCwJ
	b2fl1bNTvJKa05WvDyIjRo6f6tswoTMpDgkT0ouG+1HEEIRlm7O1pri7VjYEyZZPZccdfe7PCic
	PucPC2J4s5PndaG0c6KCPcs+TRw4bFwzqLJT4+oEdqxW7m4bNlQeA7UH0ORVUAJOOv8SLD8Bftf
	4iLg75Fva4mg35MHJwdAiVR9KwhXyKHQSGghwlkEh9jabDJwZzHCaPz3vx2t5pQ6kGTOVGXJ2jo
	y
X-Received: by 2002:a05:6102:6b02:b0:786:7a59:a313 with SMTP id
 ada2fe7eead31-7867a59b4admr5270861137.13.1788166960753; Mon, 31 Aug 2026
 02:02:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Xianying Wang <wangxianying546@gmail.com>
Date: Mon, 31 Aug 2026 17:02:28 +0800
X-Gm-Features: AcwNN1UYUKNXvyzXxNd3uzBU6aOxy9y0vnIIBO47B42osXy7lz1NmALa8IU2wEk
Message-ID: <CAOU40uBQG6_o+wU7UbWgRzZq4865QmLfJBdK0RP+iqLNy7Q8ew@mail.gmail.com>
Subject: [BUG] usb: gadget: dummy_hcd: general protection fault in
 dummy_set_selfpowered after unbinding dummy_hcd.0
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, kees@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I would like to report that a previously observed
syzkaller-triggerable crash is still reproducible on Linux 7.2-rc3.

The reproducer first unbinds `dummy_hcd.0` through sysfs, after which
the kernel logs show that the dummy HCD/UDC instance is removed and
the emulated USB bus is deregistered. It then writes `dummy_udc.0` to
the gadget's `UDC` attribute through configfs, which triggers gadget
binding.

During the bind path, `configfs_composite_bind()` calls into
`composite_dev_prepare()`, which in turn invokes
`usb_gadget_set_selfpowered()`. This reaches `dummy_set_selfpowered()`
in `drivers/usb/gadget/udc/dummy_hcd.c`, where the driver obtains the
backing dummy HCD from `gadget_to_dummy_hcd(_gadget)` and dereferences
it. At that point, the associated HCD pointer appears to be NULL or no
longer valid after the earlier unbind/remove sequence, leading to the
reported KASAN null-ptr-deref / general protection fault.

Based on the call trace and the reproducer flow, this seems to be a
lifetime/state validation issue in the dummy UDC path: after
`dummy_hcd.0` has been removed, binding `dummy_udc.0` is still able to
proceed far enough to call gadget operations that assume a live
associated HCD.

This appears to match the previously reported `general protection
fault in dummy_set_selfpowered` issue, and I am sending this report
because it is still reproducible on 7.2-rc3.

Thank you for your time and review.

Kernel:

HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809
git tree: torvalds/linux
kernel version: 7.2.0-rc3 #1 PREEMPT(full) (QEMU Ubuntu 24.10)

report: https://pastebin.com/raw/ncMhmiK0
console output :https://pastebin.com/raw/1TSvPDWW
kernel config : https://pastebin.com/raw/fBXuYyvu

Relevant log:
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 PID: 5928 Comm: syz.0.17 Not tainted syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine,
BIOS Google 07/24/2026
RIP: 0010:dummy_set_selfpowered+0xbb/0x150
drivers/usb/gadget/udc/dummy_hcd.c:905

Call Trace:
 <TASK>
 usb_gadget_set_selfpowered+0x6e/0x230 drivers/usb/gadget/udc/core.c:578
 composite_dev_prepare+0x2fa/0x320 drivers/usb/gadget/composite.c:2464
 configfs_composite_bind+0xa1/0x13f0 drivers/usb/gadget/configfs.c:1699
 gadget_bind_driver+0x2b3/0x770 drivers/usb/gadget/udc/core.c:1651
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x247/0xae0 drivers/base/dd.c:717
 __driver_probe_device+0x1f5/0x390 drivers/base/dd.c:879
 driver_probe_device+0x4f/0x420 drivers/base/dd.c:909
 __driver_attach+0x444/0x6d0 drivers/base/dd.c:1295
 bus_for_each_dev+0x235/0x2b0 drivers/base/bus.c:370
 bus_add_driver+0x340/0x630 drivers/base/bus.c:723
 driver_register+0x23a/0x310 drivers/base/driver.c:246
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1730
 gadget_dev_desc_UDC_store+0x1c7/0x2e0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x312/0x400 fs/configfs/file.c:229
 call_write_iter include/linux/fs.h:2018 [inline]
 new_sync_write fs/read_write.c:491 [inline]
 vfs_write+0x474/0x9a0 fs/read_write.c:584
 ksys_write+0x151/0x260 fs/read_write.c:637
 do_syscall_x64 arch/x86/entry/common.c:46 [inline]
 do_syscall_64+0x55/0xb0 arch/x86/entry/common.c:76
 entry_SYSCALL_64_after_hwframe+0x68/0xd2
