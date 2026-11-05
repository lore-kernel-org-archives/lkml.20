Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866170;
	b=HO1doPNY+DRn1X4N3rGi3dKW4uXs3rQl0/cL0gDpZsOd1JZ7alzR+3X8Hwkb/7l7MKtU
	 7KM3lHCdH24hJJlOgwiaB4BpFwV0+QQMOua9DLO/Emuugs82PCGxOlWAq+KW/EZZ6nSll
	 dYeYdqeZtdufLnbw7BOTxAUKdSZWxSCT3uWRLFxqp2VycqmRgHh//MXreQ4KZjzs/MN0b
	 ZMEou6NysFHiK1p06bP7L5RQUzY25F1XhXHuVlewb/D+/GMTro6bIcrLc/G4yhXtk4Ft3
	 fANB0KrwBXRjfFCE+iO/SLCHQVGztyHTvkZ/pkJwlR/hy55Z8E4gQTkF4JlTt+9iskg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866170;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OU8JGvzxBnbV05ggLnCmMcYCO6Z2MxDyZV8tzsNxJBg=;
	b=RTcc9Lb50aBfS6M7TtEyLmh2Qv+AiN6kfKVyK6PiSTrgTbBa/XELHn7vvY1vIskCY5rV
	 9d8IpanUAFZiaZ3uh0KSz0sNIA9t5/XLTrWOS0GDfKBCMwUlaZNspGZ1X2GJwydHlRZ7z
	 ph88bVhwQ0B3L5GRxrGcD5Sbu0RcpR/3+uCOiREDCMo5dYUpIMDiNBYeaLxlP+GrVEc8Q
	 O1om+NZFD8wuV6MURWX6Dg6huySijz9441ADYiG/hqAhqor8ULarDCleVD0uu3aKUI5CK
	 c+pEW24yfsB+Da+NUsOI9+G6uo15N9xpd5/na6BaLlTXBaUZA0IQ3N3j3YYeccndUHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=KiaXIk8N;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5005606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5005606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=KiaXIk8N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=KiaXIk8Ni5aA0gpLPgmURgHMdIBa4XKucxtM6DItM6DUFPylkM5MYBYOEAElrSKAA0oZtXkqsDiRd
	 9QxQ20RjIiKQToyJwCx07yYKp1w5xu+rKVMTcLu9BVtQdn5fIVVU/Nlvj1ha/Dpm7FeC3S7pF4basc
	 t2klJKXAaBUr/2NM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56aec39b4834-a2ae0;
	Thu, 05 Nov 2026 16:09:26 +0800 (CST)
X-RM-TRANSID:2ee56aec39b4834-a2ae0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHB-W5100250 (unknown[36.137.216.21])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86aec39afd88-413ea;
	Thu, 05 Nov 2026 16:09:26 +0800 (CST)
X-RM-TRANSID:2ee86aec39afd88-413ea
From: Gu Bin <gubin@cmss.chinamobile.com>
To: gregkh@suse.de,
	m.nazarewicz@samsung.com
Cc: linux-kernel@vger.kernel.org,
	gubin@cmss.chinamobile.com
Subject: [PATCH] tools/usb/testusb: reject bLength == 0 before computing read size
Date: Thu,  5 Nov 2026 16:09:16 +0800
Message-ID: <20261105080918.2198-1-gubin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

testdev_ffs_ifnum() reads a USB interface descriptor from a file: one byte
for bLength, then bLength-1 more bytes into u.buf (a 255-byte stack
buffer). When bLength == 0, (unsigned char)u.buf[0] - 1 is integer-promoted
to the size_t SIZE_MAX, so fread(u.buf + 1, SIZE_MAX, 1, fd) writes as
many bytes as the stream supplies past the end of u.buf, overflowing
the stack. A corrupted or crafted descriptor file triggers this.

Reject bLength < 2 (the smallest valid descriptor length) before the
second fread. Cast to unsigned char so descriptor lengths of 128-255 are
not misread as negative by the signed char comparison.

Fixes: 5bc9661cba04 ("USB: testusb: testusb compatibility with FunctionFS gadget")
Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>
---
 tools/usb/testusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/usb/testusb.c b/tools/usb/testusb.c
index cbaa1b9fdeac..7014c04fa73e 100644
--- a/tools/usb/testusb.c
+++ b/tools/usb/testusb.c
@@ -141,6 +141,8 @@ static int testdev_ffs_ifnum(FILE *fd)
 	for (;;) {
 		if (fread(u.buf, 1, 1, fd) != 1)
 			return -1;
+		if ((unsigned char)u.buf[0] < 2)
+			return -1;
 		if (fread(u.buf + 1, (unsigned char)u.buf[0] - 1, 1, fd) != 1)
 			return -1;
 
-- 
2.55.0.windows.3



