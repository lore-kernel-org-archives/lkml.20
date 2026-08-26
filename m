Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C886B3E2AB0
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751191; cv=none; b=suGDG0zqCT10L0ET0ia8B6Qu8iQIOURtbhqHZGRRDzJGFcWEQkAdSzIQi2EQvtHPNC5KsfBARwFtQ3yAaKlZDgirfXYGovfS45vzgEETv3URfoeu/vYTeyTSxSXOZRTySLvKhK++Oz6Gjkg5c6fDVNo2IsbxL/HsEYIqcjXZsAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751191; c=relaxed/simple;
	bh=R3ZW9RKaxN32BXpYAccI9N8Gs4e741jgbe/d2ODVKek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+gunr2KO/1MuhiQmRAd2wNHgaY2+G4ifFVgM/2GldtDJv3HLI4F8pPMSOWxjg5ErF8VQB6QSMNagqLQ/sprMAn7X4dEZu7ff6xt3RfuBEg9DLAv6zsRQRWGj2VVf/S6VmMqLEf65cbC1/MaYDnil+Lx+Uz7qt83mceBZfCuNzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVjJ+Y1s; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVjJ+Y1s"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1066457a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787751189; x=1788355989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RCIJ4IpVFGf9htX8nU3ZaMuw45e1XQFWPLoYH1UrhR0=;
        b=iVjJ+Y1sirEltSmlo+HwD+uapQcQw/ZDbCPG22Hk11QFrk+XtKvLNUJ9WpRxJzaUpD
         PDyMoLs/OIPZuf2a92vb3u9Rrs6Xy18HPlbLvJISPSN2t61yVAcZtEO+4Q6k47aj1q9X
         /HSb1wYBLcHfXb5v15i+zwKGSS0pgOHVQmtenkyzBJxT8nxoj8piQ4xCSjBQbyFXHaYM
         BxLBpY/gWiZR4icH9DrgljnlEpKTxpScCeUbPAGJpOuuTJfK2Hbj8NUkQk3WcPOfmR7e
         FGsoHLWFcwhLe+mRGcDeNQ3dM1pYkiw6bxgKAkJJcnmvjg1o1XXvGvWkNn89EsPA3rOA
         tZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751189; x=1788355989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCIJ4IpVFGf9htX8nU3ZaMuw45e1XQFWPLoYH1UrhR0=;
        b=LEHDfoM75FSounNJDsBvfZCjCA7m7BKZe/lLPLWeP0VrfyqHTLHnxS5JmbJtTPhTzG
         LE5SQkEyTI5nGgDMzrGDiOtGmcROjPM7+As9ONBO0M2ovFe9N4iRPWnaBC/Mc2J436Hc
         jOxr0Ucv/3tLLnsmF2mcKvlTbQ5ArBLrEFj9CPtWTS6ketgmSwy8rueWPQQLh0CiD3Yd
         3C5F0eUG8t2tbjnedX/SvDa7VWIGv6GcLidakG9CR7NQrdhhdAnkfZIARSR4ieDzqMB0
         RHgzXUKOfei+s0MWPRdyV78stY5VcjYb5seYV4PJUZeXhQ1WTz4qAA9CfE0P/pRWHz9D
         a2LA==
X-Forwarded-Encrypted: i=1; AHgh+RqELNdkNw8Lad+FsHm23PvDYuy3pNKH4rv1tysyxXLwg8R6uVbFLeho43pKrM3Mve7OWQAp+h7TyI/WedA=@vger.kernel.org
X-Gm-Message-State: AFuF++k5Z/eMJ3EkUwod6RHfoZEVnfZ8xkRxdHHdIgrCKnjSPYG86mH8
	t3aoQJCq+ExUaRvhrq9SDd4ZTKYyRs1tBfEobjqiYEGqozX/jilaBM+P
X-Gm-Gg: AR+sD10Sy6h+ec1w4Xk5SWyEypgwELsVjIGx1oVQEn4UqE0BulMfUkhvzhltXfb1Tkc
	DHD/xUKn5bKBA+Fv0QF76Yswz4KDgRjIO0qTPKeAV4QelV+4K7v8/6nwCdj96Ur6a/KCc/P9GXS
	W9GcnwhSoGwGwlpnjbwicb1/xewDFupemDAWOcb6q9LO/u5Jrc+H3IGdpDYPI8uDAxFcqiLDka5
	tJWLZBplRC5AHijZUUMxYaidx5uBly0ke7q1b8dTya2onF6Ob1gy4DeBSZDHb521g7ijka1U33h
	D3Vni1+jfDA3KgykZhs3HP05v4JfdeEIRze5lHzvJas8GykcUUh97YETFli9ybjbv9LkILx4Nyz
	4WQEcZnK8GpfOMtAN51564sIG4DoJrCVyUi2aIPMz/Ir85R27REuA/tbVJXhfPv4mmEAqe4SmhV
	4vxC4Bj115zf94R+U2zqZJKKAUA/RvJQZiNuFkMsgbvThVMf8xW7Ox/luCW5E34QmpPVcv/JqV2
	VEtkpUecNcAcfCWrMZRBcNzRpzeyOukl8u0cF+cYesuF2oyIiEW7w==
X-Received: by 2002:a17:90b:268b:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-3966d003f46mr8563959a91.0.1787751188921;
        Wed, 26 Aug 2026 06:33:08 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:7cfc:5106:a5b2:c99c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396708ba872sm959764a91.1.2026.08.26.06.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:33:08 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: duncan.sands@free.fr,
	3chas3@gmail.com,
	gregkh@linuxfoundation.org,
	edumazet@google.com,
	horms@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+6665d3db5fef15914802@syzkaller.appspotmail.com
Subject: [PATCH v2] usb: atm: usbatm: fix invalid ci_range initialization
Date: Wed, 26 Aug 2026 19:02:58 +0530
Message-ID: <20260826133258.8306-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Reported-by: syzbot+6665d3db5fef15914802@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6665d3db5fef15914802
Suggested-by: Eric Dumazet <edumazet@google.com>
Link: https://lore.kernel.org/all/20260824024620.23485-1-kartikey406@gmail.com/T/ [v1]
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

