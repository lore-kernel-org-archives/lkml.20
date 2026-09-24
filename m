Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCC832B100;
	Thu, 24 Sep 2026 02:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790218464; cv=none; b=Si1GHckN5CregT1LDdpOQ4jnb4bSoK00u2hlsuF218EYpUwxgWn7c0QQi4SsK2hwJeHrgX3d08FwSOTUBZZ/Mfyy1ew46cJqoArgzAlD26k4WwgVtvgl0i1nE1d1NthnrQkqsfG1sgb8Ua2Uo1z28+HJToHY0n7kKnzhewrIi4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790218464; c=relaxed/simple;
	bh=swMwtI8gH8EgjwuEcF1sy72NTC3OXXgRL2HkPLUFXsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XOtsS7nBCF2Bh9ux6FSLRtXtlUi3byDWrOxqj+dlwW/oxm+A4A7Sac2rYndyHSEBD8Qe5xEV6BrTR2z13fcwww5vNBL0fCxjiZYw4s86Dlm9fi1cj0zsxvzDIcUusmwXXAPf0vcEiGGICTwRPltNOXol7zRwjq9cRc1m70OXtHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn; spf=pass smtp.mailfrom=stu.xidian.edu.cn; dkim=fail (0-bit key) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b=n5/AiB6A reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b="n5/AiB6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=wZ4+kdaA/Y
	WVdl3l5y1iU8LyTcAZ2HxItKYaDT6A2oY=; b=n5/AiB6AO5bGndyoqOJezZyXAA
	Z9ffT7LcqX5S+Tcx1SJOaK606kNKNknno8OkEGixvvMVSNIg2LHh/Oz+ol8dOSi7
	6v4JPRpJA2aheIAAscD5fI+miQqBzuD86Xmprs1YbZUES92pC+91atIeH7yW/7oK
	e+WyCRi0NC49Dnb+U=
Received: from localhost.localdomain (unknown [113.200.174.5])
	by hzbj-edu-front-3.icoremail.net (Coremail) with SMTP id BbQMCkB2WTjPkLRqQVM1AA--.5783S2;
	Thu, 24 Sep 2026 10:54:08 +0800 (CST)
From: Yuanzhe Liu <25031212351@stu.xidian.edu.cn>
To: sean@mess.org
Cc: mchehab@kernel.org,
	oneukum@suse.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuanzhe Liu <25031212351@stu.xidian.edu.cn>
Subject: [PATCH 0/1] media: rc: fix igorplugusb disconnect UAF
Date: Thu, 24 Sep 2026 10:53:50 +0800
Message-ID: <20260924025351.122-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BbQMCkB2WTjPkLRqQVM1AA--.5783S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW3AF15KF4xJFW3GFyfZwb_yoW5Ar48pa
	yagrySyryUKr4xXr48JF1UCas8Cw4fXFW7Wr92gw1ru3WYkay5tFy8ta4F9as8Cry8Zry2
	yrn8J3y3uF4DAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	WUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUnWlvUUUUU
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUGD2qz71dk3gAAsW

Hi,

this single-patch series fixes a task_struct use-after-free in the
igorplugusb disconnect path. The crash was observed during USB reset
stress testing of an emulated IgorPlug-USB receiver (03eb:0002) behind
xHCI on a KASAN-enabled 7.1.2 kernel. Real hardware has not been tested.

Root-cause walkthrough
----------------------

1. A control URB completion enters igorplugusb_callback().
2. USBDEVFS_RESET concurrently unbinds the interface and enters
   igorplugusb_disconnect().
3. The disconnect path calls rc_unregister_device() first, which stops
   the raw-IR kthread through ir_raw_event_unregister().
4. The pending callback reaches ir_raw_event_handle() and passes the
   stale raw->thread pointer to wake_up_process(). try_to_wake_up() then
   accesses the freed task_struct while acquiring p->pi_lock.

Patch summary
-------------

Patch 1 poisons and drains the URB, then synchronously deletes the timer,
before unregistering the rc device. This removes both URB producers while
the raw-IR thread is still alive.

Crash report addressed
----------------------

  Report 1: KASAN slab-use-after-free write in try_to_wake_up(), reached
            from igorplugusb_callback() through ir_raw_event_handle().
            A condensed splat is appended below the diffstat.

Test status
-----------

The patch passes git's whitespace check. It has not been build-tested or
runtime-tested, and no Tested-by tag is claimed.

Yuanzhe Liu (1):
  media: rc: igorplugusb: quiesce callbacks before unregister

 drivers/media/rc/igorplugusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--
Crash excerpt:

  BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave+0x63/0xb0
  Write of size 4 at addr ffff888004b0732c by task ksoftirqd/0/14

  Call Trace:
   try_to_wake_up+0x80/0x1030 kernel/sched/core.c:4190
   ir_raw_event_handle+0x6a/0x80 drivers/media/rc/rc-ir-raw.c:232
   igorplugusb_irdata drivers/media/rc/igorplugusb.c:70 [inline]
   igorplugusb_callback+0x7c4/0x920 drivers/media/rc/igorplugusb.c:105
   __usb_hcd_giveback_urb+0x236/0x540 drivers/usb/core/hcd.c:1655
   usb_giveback_urb_bh+0x20b/0x530 drivers/usb/core/hcd.c:1689

  Second to last potentially related work creation:
   kthread_stop+0x120/0x240 kernel/kthread.c:760
   ir_raw_event_unregister+0x85/0x2f0 drivers/media/rc/rc-ir-raw.c:662
   rc_unregister_device+0x2e5/0x380 drivers/media/rc/rc-main.c:2022
   igorplugusb_disconnect+0x5e/0x1d0 drivers/media/rc/igorplugusb.c:244
   usb_unbind_interface+0x188/0x770 drivers/usb/core/driver.c:458
   usb_forced_unbind_intf+0xf1/0x1a0 drivers/usb/core/driver.c:1133
   usb_reset_device+0x4c4/0x1db0 drivers/usb/core/hub.c:6404

  The buggy address belongs to the cache task_struct of size 3328.
  It is located 1836 bytes inside a freed 3328-byte region.

