Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C32414EC73
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751303; cv=none; b=LCs0XVb7JeGjkyWFQ7JXcbZCr5gfaHf9Q8beyEEPX8wmfMH01UwWrb2pbd2ni7bNLwIcwAG3rR9dQVu2ADbk5L2hHvgPd1+bcCY5R9LOcXI46oHvlgVVxlG5PwrnRaKT80Gfw/ycVOM6cRPMKIcbLhk+WNWgp0Vb8j6Th6G05QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751303; c=relaxed/simple;
	bh=Dwh5UyaC80dmJ8HJpIDxJnBsgVpPoZJg6thidCMAApM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NA0eGAVJxft46+iR+9yzjL5lYfBPCR9tcxCSndjgHfzSbQpdVpQ57iV35vheH+sX/pkKBvjohAS5TvK20wsRtfe9M6xRjiQpswyQug3HAwzCyz/C8tAxMeUN/EI+d2aNVZ7x/pBfGaWU07SOsmX9pBMkNhCo19sLU4GGE/dlkx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b37620eb73so396659b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751301; x=1788356101;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cOHhTjDPoA3JM/dhmdbGRFpW0EURGFdwbJ4eWHKwlvE=;
        b=T9eytqR0z4Wwezwa5CIc9wLaFTLUaQYPnuo2tSSDNq5BSnY0dJEMvrRGk+OpVJfrsu
         Rgg4Ll/mDi314L4F8u1Qhi8zG6fAxppC5yFOqaPvLaG6zHgV5ClCgFyuc1hpfr4dXJUD
         d6AGj9o5QRRuoUb0rE6+4j3I2vu/23aVzVxSUMk8ET2hMpU3KI32uB0IVbSxllVmtO9A
         /oWG15u58k3oDqxUrYR1szeJsUMcbg2OhP6jlJxXofqNq+hN5i66T4suvpC8E77+gkBZ
         pebOVkk5NzQD6glze6mD+1YuyeJeoJjn4a9b7+p8XG/6V2h+9yKJW7czbYMAu65ovqHG
         k3eg==
X-Gm-Message-State: AFuF++kglglKoZx97DHfOiH5XZM8bpsUq+P1Hcg+KnF/J9OMd0Clbk0t
	MbBFYr4b1YOphxr6OF1EQw9uqN1nN3TL24V0DxZmJ5uac+PJ5Bu2sO0DMngu85QKyrLje6gXDOz
	BHcizoKYQ5F0SA5YoP97lpIfBx8IaKheEyWlJUgcUaFH2nyMYiodz58HXAmc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:a5cb:20b0:4b3:6967:a503 with SMTP id
 5614622812f47-4b36967b0bamr4651214b6e.8.1787751300765; Wed, 26 Aug 2026
 06:35:00 -0700 (PDT)
Date: Wed, 26 Aug 2026 06:35:00 -0700
In-Reply-To: <6a8ed99b.1d9ded08.62e62.00ab.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8eeb84.1d9ded08.62e62.00af.GAE@google.com>
Subject: Forwarded: [PATCH v2] usb: atm: usbatm: fix invalid ci_range initialization
From: syzbot <syzbot+f6ac161ee9699270b8dd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v2] usb: atm: usbatm: fix invalid ci_range initialization
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


syzbot reported a shift-out-of-bounds in __vcc_connect():

  UBSAN: shift-out-of-bounds in net/atm/common.c:382:32
  shift exponent -1 is negative
  CPU: 0 UID: 0 PID: 5987 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT(full)
  Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
  Call Trace:
   <TASK>
   dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
   ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
   __ubsan_handle_shift_out_of_bounds+0x36d/0x400 lib/ubsan.c:494
   __vcc_connect+0x14b4/0x19c0 net/atm/common.c:382
   vcc_connect+0x328/0x8f0 net/atm/common.c:498
   pvc_bind+0x272/0x380 net/atm/pvc.c:52
   __sys_bind+0x2e3/0x410 net/socket.c:1976
   __x64_sys_bind+0x7a/0x90 net/socket.c:1979
   ...

ATM device ci_range fields (vpi_bits and vci_bits) represent the
number of bits supported for VPI and VCI addressing on the device.
net/atm/common.c directly uses these fields as bit shift counts:
  vpi >> dev->ci_range.vpi_bits
  vci >> dev->ci_range.vci_bits
  1 << vcc->dev->ci_range.vpi_bits
  1 << vcc->dev->ci_range.vci_bits

usbatm_atm_init() sets ci_range.vpi_bits and ci_range.vci_bits to
ATM_CI_MAX (-1), which is defined in <uapi/linux/atmdev.h> as a
sentinel value for userspace ATM_SETCIRANGE requests, not a valid bit
count. Shifting by -1 is undefined behavior and triggers UBSAN
warnings.

ATM UNI cell headers allow up to 8 bits for VPI (0..255) and 16 bits
for VCI (0..65535). Initialize vpi_bits to 8 and vci_bits to 16, as
done by solos-pci.

Fixes: c59bba75fa50 ("[PATCH] USB ATM: new usbatm core")
Reported-by: syzbot+f6ac161ee9699270b8dd@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f6ac161ee9699270b8dd
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/usb/atm/usbatm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index 9600e1ec0993..7b0c791399ea 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -917,8 +917,8 @@ static int usbatm_atm_init(struct usbatm_data *instance)
 
 	instance->atm_dev = atm_dev;
 
-	atm_dev->ci_range.vpi_bits = ATM_CI_MAX;
-	atm_dev->ci_range.vci_bits = ATM_CI_MAX;
+	atm_dev->ci_range.vpi_bits = 8;
+	atm_dev->ci_range.vci_bits = 16;
 	atm_dev->signal = ATM_PHY_SIG_UNKNOWN;
 
 	/* temp init ATM device, set to 128kbit */
-- 
2.43.0

