Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793774939;
	b=LxyyMnwBf8NggzcJYpcLCY/W8mfAo/INzvQwn/67Z3KDjHSwp/Zox1GW1HVQSJ0ryxvP
	 Pb+EvaDuP+9sRBuUw9KALAPrBEmIurgtQQg2CjK12+TNOygJkWlrSlSCDVdv2SaIwTfuB
	 lfyWjOd16trjUCUoMcww1wf1sGD9fRV8ENzdkhhU/+8QaNzj0TgAyaTXAppMJ4N2DOdwH
	 lfqWrEAh+emWAoDoD5mDbxf6R04lajomA78MB/idie3SDztIfgizo/blAQDCguBgM7tdx
	 n2QMir5bdVrS8cgMW96h1SiRfuHvCpSRF7iIn5bQcx44X8FrpvsSSWfnyb6KK2auBgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793774939;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=24zQcFdEV5Vf7IY9wBeW1IUaHFEEcbAqaRZgHi7I9fI=;
	b=whYuRI4ng9SBpt//ysbEAK0NdLaqdIqiydu34x/PziWaFHn0jU6pLWt2rQPUcR4acoLs
	 77mEK1Z18te2CBlGy7zs+pf+pCet1qKvTRa/NV4jVhE4fe/Sre5K8C9L68fg5aJlVHByV
	 syTEQqmbTHPdqTiDH1t30QIazF+sWj9iTPpIk8i+s+5hor1Y0dxID9M7Hs1ft+yimobLX
	 8JM963GsHvHh9jGoU7/otr7Yo9KxRQl70GNUlEQrD+xXVzaV0nET2pAGultB5mk2H+kYp
	 X1uu3b18LnoSw12Lyv19QAbYu/+t5bdBqW0sOeicVfeqszADkpNza/1jg6sZGnYrmbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=yGkFgkmY;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A299C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A299C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=yGkFgkmY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=yGkFgkmYGiN8NzMiVl8Psjw1dKDdQ/UsSeNk+OhTW6iuzOuc86m5WtyA5ow2BYEoWeO7yJpJ+Ljsw
	 fVGx+u7fGhERp9cKaQNPb8WL8rCc7Y6DQriv5D10tog+y6uGtc8CMwzHQ69Ijww/s3hA0R8ykalw5T
	 ID1P6pZNFPrMAq88=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66aead552a6f-67260;
	Wed, 04 Nov 2026 14:48:50 +0800 (CST)
X-RM-TRANSID:2ee66aead552a6f-67260
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHB-W5100250 (unknown[36.137.216.21])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6aead54a0f5-c31c9;
	Wed, 04 Nov 2026 14:48:50 +0800 (CST)
X-RM-TRANSID:2eea6aead54a0f5-c31c9
From: Gu Bin <gubin@cmss.chinamobile.com>
To: akpm@linux-foundation.org
Cc: rdunlap@infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/laptop/dslm: fix inverted open() error check
Date: Wed,  4 Nov 2026 14:48:37 +0800
Message-ID: <20261104064839.1790-1-gubin@cmss.chinamobile.com>
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

open() returns -1 on failure and a non-negative fd on success, but the
check

	if (!(fd = open(disk, O_RDONLY|O_NONBLOCK)))

treats only fd == 0 as an error, which is wrong in both directions:

  - on a real failure (fd == -1) the condition is false, so the
    program continues with fd = -1: measure() runs check_powermode()
    on the invalid fd, ioctl() fails with EBADF, and the tool reports
    the drive state as "unknown" instead of printing the intended
    "Can't open" message.
  - when open() succeeds and returns fd 0 (e.g. stdin was closed, so
    the lowest free descriptor is 0), the condition is true and the
    tool wrongly prints "Can't open" and exits.

Test with fd < 0 instead, which handles both cases correctly.

Fixes: d49129accc21 ("Documentation/laptop/: split txt and source files")
Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>
---
 tools/laptop/dslm/dslm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/laptop/dslm/dslm.c b/tools/laptop/dslm/dslm.c
index d5dd2d4b04d8..fe99565d384a 100644
--- a/tools/laptop/dslm/dslm.c
+++ b/tools/laptop/dslm/dslm.c
@@ -144,7 +144,8 @@ int main(int argc, char **argv)
     } else
 	usage();
 
-    if (!(fd = open(disk, O_RDONLY|O_NONBLOCK))) {
+    fd = open(disk, O_RDONLY|O_NONBLOCK);
+    if (fd < 0) {
 	printf("Can't open %s, because: %s\n", disk, strerror(errno));
 	exit(-1);
     }
-- 
2.55.0.windows.3



