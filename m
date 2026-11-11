Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437155;
	b=pmaErpiWBlGlZuML7UifYCY4of+ZpkE48IPCVzdzZSqXgLkOkp/blICvCVvyEwnTLlZk
	 BOy6jsl230SfjL21CL1Wgx6/i3enYtQQJjwVNjv/+zsN+kOQS8Fv7dclGK7hWIDtQIymU
	 A/K0Lb5Qp0ZRFy7OWAKZ1KpPWWaLVtZ5X6lirhtTi8COwM8SftL4uKjBVn+sAGfsCVLb0
	 FwveV/9EKFr39aQh1r1NFzOdS8MhOKYq0RXh6LI5Jg17EFkNwQXIGQjN2Aaomea/q2366
	 Y/cK0yw6+gYqctL1uIHo0BbdScD5nZewZIhM/Zb+k2rziZDlmK8qF+71HKyfqsh++Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WitYjrC6pZlf7QVVMfH2IwuU0F1LKOyxz0cqBqWonmY=;
	b=mbRKLBcxEGT6WZPxm5z57bwhFdS4zmJwPYM+3GN6nTbC40kRfn1dRFYGRwE+czoso6Bu
	 sR5KAit+f7VoGQ4PLavMsmZSaq8cJIo/rWBWW2wRyY2GyibVdLKtBEUB5a11bHY/KIT5N
	 v9YNAzEfzwd9M19j2l2eW4MND66y/pXw93a3295hxKcu9Xa8XRnLC4oxZJ9NBrdaApB6F
	 6qCENH6sz2R55DZFhI6fR/YPloYYzV+dqX3sUcMx7LI5Dmn/vUYeXTI8CzNicVc3MCId6
	 ptNt4rhJdkOWKLPshwjLrxY88RZBIrklKh/4EAO/6lOWqLls4FDWRc16hLDwpt28TXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=artiphishell.com;
	spf=pass smtp.mailfrom=artiphishell.com;
	dkim=pass header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b=SkqiQq56;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F49A606C106
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F49A606C106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b=SkqiQq56
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2761c69fbso6315540c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=artiphishell.com; s=google; t=1794437154; x=1795041954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WitYjrC6pZlf7QVVMfH2IwuU0F1LKOyxz0cqBqWonmY=;
        b=SkqiQq561Kqzm7LGU4jlC17wzk73YT9iO5l7j5EchsXG5fTXNYa81SH2qEkR8HiMln
         +gWhyc+L3+UEy5McTWurHjh89pN7hkuGz/mqGS4VBKSV2yUsN83m+n6UT4u0k/7Z/IDG
         77hZJCwDXETrgc5pk/UZjIAkSXWi9z5WVBBeqKOdgUS81/tzzm7/B80VlXIxjBRXTHZg
         OPpRl4/dXKA0ivjDS+JL3tXFqz59b/Z5IxnP64V5fyvW0vNNh1do6U8pBsprOQ1gP79i
         /jpfKetl9EZd9TrsL9dw9sgSOt82PRUa37r/YJWHvpi3MchTwt3czMJ6VWcfchwgcWGU
         67zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437154; x=1795041954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WitYjrC6pZlf7QVVMfH2IwuU0F1LKOyxz0cqBqWonmY=;
        b=Ons7R3MHBHd8zNK2dnC0D81fWyRYJv64unmZWSv9ovi2iv0udgZZaKReWYZw5udJfU
         nin40NEiqCp65Ba735VKWY6tAd06NTMNSNuaReffj5nbyMUEudigVbG3F5o0n4PUYzY/
         c6rSsThSdyECOgB7z5Pd5EkRolhSh31hxP1iUF9wX1eyDOLQQZN0TjJMUOLiCaGFS+Jv
         abvfiYlO95iUoujyriIsEgDLQSFzoSR5e2sc+Z+1wsU2X4QkpeCRKQB5Gm9jtjs93zEj
         5PLeYnqSZAGy0plS49gtlY5IJjMfeavajm9MxH917gWO4rIDF2abYwiKYtLHE1bYoFdX
         dAfQ==
X-Gm-Message-State: APuU4Z9daQtacwtQ+pUS7NP90O8dsmCit5cb1ynCAeaWMjWGiPKoeVFh
	KvABUlW+TxxhJthpfeNYl9+f6BT8La1y7/794o1Y866GiBbuVB3PH3PK6s7GmCKkN0SwzEoNY/5
	PMylIqhjct8I=
X-Gm-Gg: AYBFou0E9yq/4A5mc1NSX0lt9lAN4K33Db+cyyWgwxQPd63ryaPMbe7KLa2q0F4j6gK
	wuIS856BtFlID1fKY5szLzgY1QF/aOdVEiL1W3viRpEand8uu4UiueyYzGWXQ4lwU9CfL/t1Dwe
	lPk0Pa8qTba0hzCctieD81o17VNwjMIYoSH5NKnGoF0z69jy0VFOrtnsuBDSXCUaJ6rUx0XW2qw
	TX01qn3SIeFHOJhPttuYqAvWnaR75ceFdaXZetMyzDZ88dTGZyzt2kMl1qPK/HdD2tB5nmtYYR4
	yqAh4lhOExVZsHiTJg6F8EG3/Oc6yJRw1+hwMutB0lI8xcw1fz7HAtxnv4pwH+g4ET6Msiu+taY
	TO8pOPOaiVsRx+Xd9H2ashU6j1sjXUR5HMA2GwAZfp87zwHNlH1RXud9zmvttXxF5BzHgjwd2N+
	f1OjGufJpKlAyZ/2lBXxwC7Ja6ECI4ekXRehxcvV9ekwdvs5Q4TjgQMSRk/okt3pfj9gvlkIN1/
	oow94lv4/3W0lKJenJiy8WYzsbR1QSA0SRiP3gLMM0XaIfkKLBIKtAvmApdrysGFp/1c2ilVk6K
	z28usjAuk6mP1soj4M+r
X-Received: by 2002:a05:701b:42c9:10b0:194:3a84:e67d with SMTP id a92af1059eb24-1b3c0360b4cmr3676343c88.44.1794437153373;
        Wed, 11 Nov 2026 14:45:53 -0800 (PST)
Received: from nixos ([2001:579:62a8:b6:264d:d83a:ef43:6daa])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm22681485c88.7.2026.11.11.14.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:45:52 -0800 (PST)
From: Jay Vadayath <jay@artiphishell.com>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: linux-kernel@vger.kernel.org,
	Jay Vadayath <jay@artiphishell.com>
Subject: [PATCH v2] cdrom: bound the device-supplied offset in cdrom_mrw_set_lba_space
Date: Wed, 11 Nov 2026 15:45:41 -0700
Message-ID: <20261111224541.56371-1-jay@artiphishell.com>
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

A userspace reproducer using an emulated USB CD-ROM is available on
request. The fix was developed with LLM assistance.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Jay Vadayath <jay@artiphishell.com>
---
Changes since v1: Updated commit message

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

