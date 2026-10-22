Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693200;
	b=NVMpCcx3H85LWLqp4kbj1/TPh44rxHevTf3HLP9DjBJetiHb3z+DisRZ1qQf65AdvIc4
	 kPLdfJgER6iarT4H7c9aP8AAunn9Bt1AgSIMm5WiTihnvJbosggtu3ro/7/i2v6q8b9H4
	 tAbqM7rFKtiKW+a5xzdpELJZnEvzxGaC1kv9oLcVZOoBMUKQANPhhrsEk57g9mVNHbwv+
	 GQnJyN2//gS4QRX7ADP2cBVHbhtdOqIVKIhfiIsqGos1OZE3/bCRpbzQp0dQdTJXMWJGS
	 B9BuyvifPpAdUmphMbHKAFiikIkENC/QDnLvHr3fXsCB8hLyW7yN6hmBbvGy6MBpQYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=r+V1Idwl+aSjqZlw0qd3dClsdTnzm1HC3otnF7o8zy8=;
	b=iK5+dd7zLoFmXGjlMryTYb3K1SR6GN643f5Op0HyYVeaJH8MhLBjUjz/ocXRJEY31E68
	 wn9zt/k/nh3+weud4ip4TwDU4d/vwbFCLyQ2V5ikomgVSUx9XD9LwqrxwyiepdeqrvbOJ
	 V9C3Ze13ggKGQIkyFZf6EI3MzFQfo2RXKuBr3/lBOHx2q+EvhIImiZHJRSWBW37pVb50p
	 wvHwXROZ6+2d4uK9UMje/gueK6bkFhNvtOVld1ZGIgFEwDUtImGbYHuK6g3qolqdMKrN8
	 cs3Tl2T67Y0IXgQXtaOwkSsM36JpbYiDsJYWwRnwpn/Jai3nZrnAzLC0OEy7MYMGhWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=artiphishell.com;
	spf=pass smtp.mailfrom=artiphishell.com;
	dkim=pass header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b="mNh6R/uL";
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b=mNh6R/uL
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-846566246e8so22441a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=artiphishell.com; s=google; t=1792693198; x=1793297998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+V1Idwl+aSjqZlw0qd3dClsdTnzm1HC3otnF7o8zy8=;
        b=mNh6R/uLSYvBy/4Nu8eptq49pOJXnWGhKWxWjwN6YqZ1dam06H+sNKGw83i4YGXW7g
         hxj6AclUS7aW/kTmjdu2c5fDC/ZmAgpUltUnYYhmYfimKFRTV0/yrfTpld9CYe9pmUr8
         oAvPcPIl0rUMKfhJ4H+jLb/TCxrtlywvySImbvmMcxAV+wtU2LY2FX2yN8uWoPjBqREi
         FlccbvYrf2/rq4uF2UfvCiZQdj8UtOe7Y665gGNu8rjSXu4s/rfi0HvR3JsluFLD1ytV
         lGrOQg2LqXRTRO7ftqejhseWL4B7hhOy4ElK0ajWmRtke3+sOOJBtVgdS0EVcj8wIXaV
         qL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693198; x=1793297998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+V1Idwl+aSjqZlw0qd3dClsdTnzm1HC3otnF7o8zy8=;
        b=McgGptxdRr7tDGqUYlzRdpUiZrI+eq+SAFotxZ1Eep6ewBaGtphOkjqA2p498ht+aX
         T/8z8Fr6Kx1jqhG4+dlQnV4qsYWBTeZ1Svq3ZKUJZiVJAaDYLPBOeKv0tfKg10Vslb0t
         kDnNWB+6Ij0zWh0XQvwjkwfjhnWBS0OiTB0ieo89j2Me8gyMK1tr9xv2cey1B+naD9ax
         XcF65uPeZnAcqK8vnH9l00puTLpBW8+t9pUI0Xcu5Noll+EYbUM5bXiElZ2/rMHduJM0
         vIbz9nLneb/4PJkZM/IplOSQ/RtMWVTDYz0FLti/7QRzRnYMN1rCHmp9qjpCoSHO3840
         r+WQ==
X-Gm-Message-State: AFq9FYKTiQ6oN+7qoUaDPO3qTd281LBlBuOzbcBpMXW/duODs5Cjj7Dg
	f7/NteX7d/HpMb+m9UNS3TzGGGE9rNbSL5F68w4KCDIroehfCj58Ofg9w7464Kd+tF/6
X-Gm-Gg: AYBFou08ZWIiA9g7dpaJx48xYGvLXq/VhGlPEKU1X5AGWjCXgnPMd3EZqpPFHFsi+J6
	Bua4WCv5cOibdgG/K6BU/i3N4kTkwUXOpGgbrKKA8DfWkDQXBjRqLtQnqkoUmuKm/SYCTCAZ9vY
	aW1ysSF9+/q2xxU3oQ9QSxvDczdNOGbMOcPZrYfXFYq7r7dz6kTa2l1siLOcFLTwLjhfjeIuf7c
	2u/SlJ3EaKA72bCuFPNqx1MvSOpbU5KT30MXIteSzq3Ql4aSFES+MZBVYLkX/MPmFTSxjTLNHLq
	oe/wLLdZIFHRgjR1NDFqJxeP0NPt5L+/+Ci3LaR13dwCv6puHuV3gos9Insq88kF1LQhCAokb6m
	GG8RBRpXG30yr/6anfRFsJWxFhRNCbX6RNXtu8Ai68Y9d5TcEXO4AXtZzR4YTeoRV+iIjgd63Kv
	EtF5u9y2Qr/bF8p8zW93vW5IDG7HnLRx8xkMwBPQGZzsy3L6Lp6Ezuh462/oumX3sRZDXuy+zGz
	UmIyEWFmwF+IdGgdPkEvmcaB/lXr9hrSQDWnmFMsaFlUHLpPoY=
X-Received: by 2002:a05:6830:3d96:b0:845:8a98:3f1b with SMTP id 46e09a7af769-84e349e91e4mr1204647a34.35.1792693198200;
        Thu, 22 Oct 2026 11:19:58 -0700 (PDT)
Received: from nixos ([2601:280:4a87:2c8d:3b7b:2fa6:c84c:64a7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f7703d05bsm414646a34.6.2026.10.22.11.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:19:57 -0700 (PDT)
From: Jay Vadayath <jay@artiphishell.com>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: linux-kernel@vger.kernel.org,
	Jay Vadayath <jay@artiphishell.com>
Subject: [PATCH] cdrom: bound the device-supplied offset in cdrom_mrw_set_lba_space
Date: Thu, 22 Oct 2026 11:19:55 -0700
Message-ID: <20261022181955.35758-1-jay@artiphishell.com>
X-Mailer: git-send-email 2.51.2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cdrom_mrw_set_lba_space() issues a MODE SENSE(10) into a 16-byte stack
buffer (char buffer[16]), then takes offset = be16_to_cpu(mph->desc_length)
straight from reply bytes 6..7 and does buffer[offset + 3] = space. The
desc_length field is fully device-controlled (0..65535) and nothing
checks that offset + 3 lies within the buffer, nor that size (derived
from mode_data_length) fits. A drive that returns desc_length = 24 turns
the assignment into buffer[27] = space, a one-byte write 12 bytes past
the end of the stack buffer.

This runs when an MRW-writable CD-ROM is opened O_RDWR, so a malicious or
buggy USB/ATAPI drive (or an emulated one) is enough: no privilege beyond
being able to open /dev/sr0 for writing on an attacker-supplied device.
The sink lives in the CD-ROM core, so it affects every cdrom driver
(sr, ide-cd, pcd, gdrom).

  BUG: KASAN: stack-out-of-bounds in cdrom_mrw_set_lba_space.constprop.0+0x25c/0x260
  Write of size 1 at addr ffff88800639f6db by task poc/133
  Call Trace:
   dump_stack_lvl+0x64/0x80
   print_report+0xd0/0x630
   kasan_report+0xe5/0x120
   cdrom_mrw_set_lba_space.constprop.0+0x25c/0x260
   cdrom_open+0x1169/0x2080
   sr_block_open+0x9e/0x140
   blkdev_get_whole+0x8c/0x200
   bdev_open+0x214/0xc40
   blkdev_open+0x1f8/0x370
   do_dentry_open+0x408/0x1290
   path_openat+0xb2f/0x2210
   do_sys_openat2+0x126/0x170
   ...

Both desc_length (offset) and mode_data_length (size) come straight from
the device reply, so reject anything that would not fit in buffer:
offset + 3 >= sizeof(buffer) or size > sizeof(buffer) returns -EIO before
the write. The sibling cdrom_mode_select consumer of size is covered by
the same guard.

This bug was discovered by Artiphishell's vTriage pipeline, which
generated an emulated raw-gadget USB BOT CD-ROM (INQUIRY TYPE_ROM
advertising MRW-write) plus an open(/dev/sr0, O_RDWR) client that drives
the capability-probe chain (page 0x2a -> GET CONFIGURATION CDF_MRW ->
MODE SENSE page 0x03 with desc_length = 24) and reliably triggers the
KASAN report on an unpatched kernel. The fix below was drafted with the
Claude coding assistant; a userspace reproducer is available on request.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Jay Vadayath <jay@artiphishell.com>
---
 drivers/cdrom/cdrom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
index 4f1fd389260f..5e910d79045f 100644
--- a/drivers/cdrom/cdrom.c
+++ b/drivers/cdrom/cdrom.c
@@ -571,6 +571,10 @@ static int cdrom_mrw_set_lba_space(struct cdrom_device_info *cdi, int space)
 	offset = be16_to_cpu(mph->desc_length);
 	size = be16_to_cpu(mph->mode_data_length) + 2;
 
+	/* Both fields are device-supplied; reject values that overflow buffer[]. */
+	if (offset + 3 >= (int)sizeof(buffer) || size > (int)sizeof(buffer))
+		return -EIO;
+
 	buffer[offset + 3] = space;
 	cgc.buflen = size;
 
-- 
2.51.2

