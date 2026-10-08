Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E80471255;
	Thu,  8 Oct 2026 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451681; cv=none; b=TjjNB+IEH+0cuJOsVHH7dwbJJtn7BvWq7wkk7adc7TL4QtHiDx9gIrnyceB3/YApc25/YWrBEKgGQh9M76yVEcUgt1MiIFxFZojEvly2STSlw40zUIyfT/cDNgqNiTslVP8HBTZeSEOKN94dgTHvjHmmJ66M37or81dRlB6kaE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451681; c=relaxed/simple;
	bh=llXJUdyKmxtWSXVEgFD3/p0gjXfUkKwFP7tiNOLfOdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBDj5ec02qyBnsOCldXPNtRcpt/QFmWmjQELNSoSoe3dpqaGXwRmgGKvrlfMhD+LNC4zoQF70H9ZeT4VaEJJ1/kIE+S3Xb464XlgPzbyEeGlRdwywvElciKwKLIGqHIHcuKfuK9Kyl3bz0RIjI59/zcqevlbjn5XL8HyeTq7Phs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pfB7wU7K; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pfB7wU7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Bw
	/K2GqAqHkqjEAU2Ucc1Vj4qfMCmg2/XVjJ9N+9DSo=; b=pfB7wU7KpcDDb13U99
	DCboJuYPuZrtSq5mJoOk3oqVU8J1PvCfcC2rpDUzKwMCm4JMQTjXlglNOISQIPc/
	PPmpsE/ZRzeTHzYiF23ho/UcNrrMFIcwFZJH6OWPYsbTuI8BLuLwNtoFQiFMTEcq
	cj5S4PfS+2m+4A0bOKSV1jxvk=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wC3logRYsdq_G0DDQ--.50376S2;
	Thu, 08 Oct 2026 17:27:46 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: cx231xx: drop runt bulk packets to fix heap overflow
Date: Thu,  8 Oct 2026 17:27:45 +0800
Message-ID: <20261008092745.20-1-shxzhaosr@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005072652.17-1-shxzhaosr@163.com>
References: <20261005072652.17-1-shxzhaosr@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3logRYsdq_G0DDQ--.50376S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1DWFWrur18Cr15Kr13twb_yoW8WFyUpa
	nIkr4UCrW7Gry7Wr1UJ3WfXFy5ua4kGas5GFWfX3WYvrn8XF1rWayfKF12gay5uFn7tasF
	yws0qr9rKw1kA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U9BM_UUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbCxRIpZ2rHYhLP4QAA3q

cx231xx_bulk_copy() trusts urb->actual_length and immediately uses it
in three 3-byte operations. A runt packet (actual_length < 3, which a
malicious or faulty device can report, for example as a runt or
zero-length bulk packet) causes a heap out-of-bounds write
(memcpy of 3 bytes into a smaller buffer) and a u32 underflow
(buffer_size - 3 wraps to ~4 billion), turning the following memcpys
into wild reads/writes.

The bulk completion callback invokes this function for every
successful URB without any length check, and ignores the return
value. The sibling isoc path already skips empty packets
(cx231xx_isoc_copy checks buffer_size > 0); the bulk path simply
missed its guard.

Drop packets shorter than the 3-byte header/tail unit before
allocating. Lengths >= 3 keep all three memcpy ranges in bounds,
so 3 is the exact threshold, not a heuristic.

Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
---
v2: Rebased onto media-committers next (ee2e9bf41) per the Media CI
valid-ancestor check. Verified there: applies cleanly, checkpatch
strict clean, cx231xx-417.o builds with and without the patch.
 drivers/media/usb/cx231xx/cx231xx-417.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1347,6 +1347,9 @@
 	p_buffer = urb->transfer_buffer;
 	buffer_size = urb->actual_length;
 
+	if (buffer_size < 3)
+		return 0;
+
 	buffer = kmalloc(buffer_size, GFP_ATOMIC);
 	if (!buffer)
 		return -ENOMEM;

