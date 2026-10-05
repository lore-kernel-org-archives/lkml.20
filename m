Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1863EE1C5
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791235712; cv=none; b=qbJmm4OcpkIJ/UIDZ+Mw4M16TFN/0N6X4/lTB8SpCnDoLd5PR2vq7DXZjNJFIIoSQHTP815ePnUrv9mfvgtENXdxYw/chPqCckqIF5T50EOVkzygQ7x6NohsZDDmMRXpWVtkYaTMlX1VBhUNB62vricBRkx4HiI0IZ3Ge9X8q8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791235712; c=relaxed/simple;
	bh=ouHV/+Hp31owgYgLps/TUZoGlx095gw73t3hUXyE/2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mxC1hr15frHASUiU5qOd+Fdd2NKnduG4QzKoPxlbpKMjdy61XNLvyg6/aJqeJqgbz9vdJecVI6S2OJv8tSrslYZ+aeUqZ/v1ZJp6rgbMn15Pgm1ffVHudbFUVN4Wr+lxtIHNIzIcKG++DXXaXmEIT3eDipdHMHZkYI7CgQPox80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oiImM/+m; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oiImM/+m"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b03eb33b2so887458f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791235709; x=1791840509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OU/WYqJh0qLKM4UCOwNjeVXwsxO3AjzoVQDnExjaeWk=;
        b=oiImM/+mEcb6t35UyZAYx4NMCivI3bC2VF6cPwuWxjA9UjPpZHGRWAfTKXZ25nin2/
         haudFxokN3xOGP28OuZ4VT58v0iaYlxBD49aemOFjG01USr6RR7Ec/Sk+puOJJ0LrUg+
         /uRSd3wCGknSabB35Q9VO/D4U/gUQ9uroAItmUK703nH6SsRJdkGDNIUWNSERGIhmyCL
         igiV0bmIXAWYnJHm2+ffVm3L/Gt5/dip4ZNrKomWo/IdPcxRVZryOJ5iL7gJoSMyc0Vn
         29LNWOA6kpDMleVCRWKbMOkyxKbiLXeNu3iztliWP77xug+jkJULOOEw0c3OIISEc7bZ
         42hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791235709; x=1791840509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OU/WYqJh0qLKM4UCOwNjeVXwsxO3AjzoVQDnExjaeWk=;
        b=JWD2VCBd68DP44FsN87BpNrPjfP5f0YdoovMaxhb5/lkI3i++GoWZgjQZFLIBsafT6
         7AvBzTrvQlxWlpML6CljY3HIh/vLg1YV1y4tGiwl09ka8ygdjlzNO2OWyB7hR5whAB8c
         +VtaroCAdJ1jexA2VmWZALzDmHqz6d0cRP9rIENzLJmunU/7Kz21QzPXoTWdmpG1T63+
         Y23IenmqCPncpDcAhx1jaLaG0ec4I/fxzp1796yOKffsK+T0DU60zfFg0GOepRlixrid
         pcvFS//8BxfVU5zf/ZZjkAVP5aCsfIDPfI2JR4XYpPK0Gs9VxcDmCPvAZAh+kcWtFKhm
         mItQ==
X-Forwarded-Encrypted: i=1; AKwUvBzb4xkiBp9CjHrDpr/TSYTAJ68XTRcQF6BiLP3j5EZ1Y1fA42JbooOa1pT4IrJVabb72kApl3ZLkGZPynI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7chgspWEFdTkPhdRTWxDWzAwqpU5Q1X5neRLkQIflj5bp/xJT
	TSxEuCFQ5MzuLpfelV/YwADIuOcsCEzhZzt5/h+gqf+gb3hods210c4T
X-Gm-Gg: AYBFou1Wye4aukaG20nhTADhUaaHnZjwv1uJOBPJJ9TftGtFhB0QULxLtd8cWwtK703
	JwgxieTDUy7vN87N5QBwwASw49NjgPF1PasW9jHDQhwo0o24/CSpReI1aMeBtQP47A7zIhVIY/J
	IpnUjTAdETgwojrc+SAzU+7m44uG0KPW4p9BekEXLuGQPm2dtPfR9B3PztPW0LTVhpcEBwEXE2k
	KMp03tkYB/wewcpBlgP5San/BSt94/CaAMpQJZ0d/95Bsx4ps8oOdL0s4aRd4LWaXEVCuYOWL4m
	dTwEYLYEuUcJOtUZ4kUG5KgekwbLibwxfQr/yoP/62iQYxUjMgDHfS3FqfseypVcWwau83C60JQ
	/oAtdUrTiImbhB6r4TS0uzH0foU3qCOtVxz+NApj5SLkuMgPpYUTOhXHQLTTXnkdQTWrrLnXpac
	4wegt4h5htWzHWsPs9PLkuv86TOwigVfy/HbCqwowymF7BH9dxUYhDHKlqVZqy+quQZQ1/1/3//
	DUSNZkso7Ui3g96eoh07FLi5u3f4NccPlCEapw7diNLYe89FVM/PxsuVEnCgMzXTx6AcVU8SGsr
	8u5mtk87EUqLRsFTTOFfUlxcvlRZT2lg4D/lwZlnidkwqxNsZI/4HhhZk8kSRHA4qdhouKxwaAE
	rBsOusA==
X-Received: by 2002:adf:f7c7:0:b0:48c:511a:1f31 with SMTP id ffacd0b85a97d-48c6864fce8mr1113114f8f.8.1791235708840;
        Mon, 05 Oct 2026 14:28:28 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622bb172sm13037665f8f.42.2026.10.05.14.28.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 14:28:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-usb@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: r8a66597-hcd: fix buffer overflow on odd-length FIFO reads
Date: Mon,  5 Oct 2026 23:28:23 +0200
Message-Id: <20261005212823.55737-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An external R8A66597 (pdata->on_chip is not set) is read through a 16-bit
FIFO port. r8a66597_read_fifo() rounds the byte count up to whole words
and passes that word count to ioread16_rep(), which stores two bytes for
every word. For an odd byte count the last word puts one byte more into
the buffer than packet_read() asked for. When the data ends at the end of
the URB's transfer buffer, that byte is written behind the buffer.

Enumerating a device is enough to trigger it. The USB core reads the
configuration descriptor header into a 9-byte kmalloc() buffer and the
driver stores 10 bytes. An SH7785LCR board booted with slub_debug=FZPU
reports:

  [kmalloc Redzone overwritten] 0x820c4229-0x820c4229 @offset=553. First byte 0x9 instead of 0xcc
  BUG kmalloc-32 (Not tainted): Object corrupt
  Allocated in usb_get_configuration+0x12c/0x11d8 age=51 cpu=0 pid=10
  Object   820c4220: 09 02 20 00 01 01 00 80 fa 09 cc cc cc cc cc cc

Odd-sized HID report descriptors are overrun in the same way. Without
slab debugging the byte ends up in the unused tail of a kmalloc() object.
A transfer buffer that is embedded in a larger object has the byte after
it overwritten.

Section 2.8.5 of the R8A66597 datasheet tells software to discard the
excess byte of the last 16-bit FIFO read when DTLN is odd. Read only the
whole words into the buffer. Read the last word into a temporary and
store only its first byte. Use ioread16_rep() for that word as well, so
that the byte is taken in the same byte order as the words before it.

Fixes: 5d3043586db4 ("USB: r8a66597-hcd: host controller driver for R8A66597")
Cc: stable@vger.kernel.org
Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Closes: https://lore.kernel.org/linux-sh/3bd32eaf159db61ed1d423e1d52a869b3689c682.camel@physik.fu-berlin.de/
Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

v2:
- Simplify the handling of the last byte as suggested by Geert: no count
  variable, len & 1, and a plain byte store instead of a 1-byte memcpy().
- Reword the commit message and add the SLUB report from Adrian's board.
- Add Adrian's Tested-by. It was given for v1. The FIFO accesses are the
  same in v2, only the copy of the last byte changed.

v1: https://lore.kernel.org/r/20261002213225.27834-1-kmehltretter@gmail.com/

Adrian tested v1 on an SH7785LCR board. I tested v2 on a custom QEMU
model of the board with 32-bit and 29-bit kernels and slub_debug=FZPU.
Both report the overflow without the patch and not with it.

 drivers/usb/host/r8a66597.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/r8a66597.h b/drivers/usb/host/r8a66597.h
--- a/drivers/usb/host/r8a66597.h
+++ b/drivers/usb/host/r8a66597.h
@@ -179,8 +179,15 @@ static inline void r8a66597_read_fifo(struct r8a66597 *r8a66597,
 			       len & 0x03);
 		}
 	} else {
-		len = (len + 1) / 2;
-		ioread16_rep(fifoaddr, buf, len);
+		ioread16_rep(fifoaddr, buf, len / 2);
+
+		if (len & 1) {
+			u16 tmp;
+
+			/* Keep the byte order of the string read above. */
+			ioread16_rep(fifoaddr, &tmp, 1);
+			((u8 *)buf)[len - 1] = *(u8 *)&tmp;
+		}
 	}
 }
 
-- 
2.53.0

