Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35D0361DA7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143749; cv=none; b=oY8c3lKkeN2HIqmkswT2ifQfoaE+1o86QUUWrFGHv3Sy9Q8VpQncpZRtm3AJKBUTKxCcHwefJYfJs/PuOtOeUB3WlUthiHfl7/ACtmoaKlCTh8VRUA6DeDVWZ7II7cPBx57V53c71zNiEgAwUKeiQNEw0NPrY0WAS0P8RxBR4ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143749; c=relaxed/simple;
	bh=WlBnM1XpHKucSNs6HIkQmVuFkX/orSSmv7Mm2wkDJr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HzslpqZ0hG2zPvgOWAKeVMl6CXwmcfVF6Bq/du4ym6LwNybiRh6vbQuBigeywaFBteIr/cuwGqYG+p+U8WNcbup/J6F/XcUGoEW7SmY5WEdCPjTqDSRnXFL+4pzGf4CAwnrY2zXAkT+TI03JIHjSLWDCqZK1VxBL4BjRCSmpqpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVUR4nxQ; arc=none smtp.client-ip=74.125.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVUR4nxQ"
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e59607d38so194651eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790143747; x=1790748547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZnX5eIwfaA6j0Tso7Nhp1FLEmTXkRxG+sEAuBOsXc8=;
        b=BVUR4nxQ3RBJKk90dUbebWJX+DTcaMiJ7Pvs9u/dvRj5l59O5kJrYLvPwwnyaqTlHg
         RDAX91G8AAiWHq8nHFkE+lRWSviEY3vF95X5GFDhxlpen2yT6S4aJ1hFYxBfgOlruJWM
         1VB0tUQxna2T7f6pK7W5tkR0MSH17bLX6sV7RMKVI/GTdYyt3nMxqT2nmDh3LvVq2V/G
         JfejdQ1uggnh0905RPJj+y1lt7kW0N4O64JKw9WPahzimXqOay8LLC5ik2UjLSsk4wr1
         j3x9XaifpjSP0Zv6ta8pr/Qsm7p+K6Dtvf7XDVNc2199v0Z28iPs4+21sWcvdyeWqgFK
         95sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790143747; x=1790748547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZnX5eIwfaA6j0Tso7Nhp1FLEmTXkRxG+sEAuBOsXc8=;
        b=fN2o5RV/RwkYO53GSCTn/HAJupWqysqgnMpTtQywEoqY2MPBEHobToDvOSKSFEVf3O
         cRNWFP8x8Iec+9UlkOoSx3QPSbI7RzNJsmMXoUX9P5LIsm4jCqZyJcifrf+j3bE59JMe
         CI1MPMKwIpeIEGQxeBOhsHT/YoZpknS2yFBZMo5rc6qsEeB9GvAkb/8NKpO7FWl9t4ge
         Q4YQF7BWtcOf6C+Zegz0j+tscX8n1UoailDO96dzRJzTog1MRaJhcmcSjvdm7lVjRLSd
         SexPW+mpQCJ8ePeXgu9H/wuHW7529BUdkxR7kbZ5+OwwbmOHOQRFziEIdfxBt8qs+aI6
         6fjQ==
X-Gm-Message-State: AFuF++lnYssadGpRIHafjZFUQ++485nMAyXOQft3WhYghpIL5087l/hJ
	/KN/IAS05qDJ7Y0wkkuMzT0G0Z6JtcFdElkE0RUJknmihy2CBxstKv8B
X-Gm-Gg: AYBFou3W2hEBd2T7vJFgySeGFgsAtFhKRGYt0S5iruYUoV+MObZP/D2dCIttKaMD230
	R7ctgNeGMRQc72YnrSdFKkm0e9RKl8e4gu0AZm+PAb47VhraRTulo7yI/fNIsjfsgSQNrkgv8LY
	gE3/QHs8/R/GVdZ6FibIHYWw+YMkfRhM7EhWoabrVMvNcAsxom92320kL6/G6eXHNHNM7H5Gzre
	Ap80n4ryvB4A2XJREOYHEu3xlvje2vKrZubfB3EL4LL3ElkEhUvt/bO7aGctiJQ8U4D1I0RAYoG
	RW+KA28DWhnK/CP2UrdHDgaH7KfRplr2d+auA4hBp50QjLCIfNbEhw0OvIDBGgfum++xOpNv4w0
	IQE4NnFMcilXw6mDlI4+il+9Ww96zi0Sf10tFqeqGQwM0+ZeheQitnMijpsww7HCY7bKwv8C0LT
	Fx0OtHspbR8OCV+jcXtWedxeaLol6jH4pxd18dsKJbTyaATjmVOj2NAQTorlyyQt5Upny6N3eoo
	P4xzkzYOlaf2VLaEEHjGZaizBNE/7cboEk8qwe+M4/Jn2SvatI7cP+Ah7BhAS8=
X-Received: by 2002:a05:7301:700d:b0:33b:fc00:976a with SMTP id 5a478bee46e88-33e8ddc27e8mr1754492eec.35.1790143746603;
        Tue, 22 Sep 2026 23:09:06 -0700 (PDT)
Received: from Raccoon ([113.30.177.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258978sm3275139eec.14.2026.09.22.23.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:09:06 -0700 (PDT)
From: Rohinthan P <rokinthanp03@gmail.com>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: linux-kernel@vger.kernel.org,
	syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com,
	Rohinthan P <rokinthanp03@gmail.com>
Subject: [PATCH] comedi: dt2811: fix shift-out-of-bounds in dt2811_attach()
Date: Wed, 23 Sep 2026 11:38:59 +0530
Message-ID: <20260923060859.15694-1-rokinthanp03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In dt2811_attach(), the driver checks whether the user-supplied IRQ in
it->options[1] is valid for async command support using:

    if (it->options[1] <= 7 && (BIT(it->options[1]) & 0xac))

Because it->options[1] is a signed integer, passing a negative value
(such as -251) satisfies it->options[1] <= 7 and causes the BIT()
macro to evaluate a negative shift exponent (1UL << -251), resulting in
undefined behavior and triggering a UBSAN shift-out-of-bounds warning:

    UBSAN: shift-out-of-bounds in drivers/comedi/drivers/dt2811.c
    shift exponent -251 is negative
    CPU: 0 UID: 0 PID: 5925 Comm: syz.0.17 Not tainted
    Call Trace:
     dt2811_attach.cold+0x19/0x1e drivers/comedi/drivers/dt2811.c:570
     comedi_device_attach+0x40e/0x6b0 drivers/comedi/drivers.c:1101
     do_devconfig_ioctl+0x1b3/0x6d0 drivers/comedi/comedi_fops.c:930

Only IRQs 2, 3, 5, and 7 are valid on the DT2811. Add a check that
it->options[1] >= 2 before evaluating BIT(it->options[1]) to avoid
negative shift values.

Fixes: 8ffdff6a8cfb ("staging: comedi: move out of staging directory")
Reported-by: syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a4cedab706d0a8a3f988
Signed-off-by: Rohinthan P <rokinthanp03@gmail.com>
---
 drivers/comedi/drivers/dt2811.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/dt2811.c b/drivers/comedi/drivers/dt2811.c
index bcc4b5e..813b1aa 100644
--- a/drivers/comedi/drivers/dt2811.c
+++ b/drivers/comedi/drivers/dt2811.c
@@ -564,7 +564,8 @@ static int dt2811_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 	dt2811_reset(dev);
 
 	/* IRQ's 2,3,5,7 are valid for async command support */
-	if (it->options[1] <= 7  && (BIT(it->options[1]) & 0xac)) {
+	if (it->options[1] >= 2 && it->options[1] <= 7 &&
+	    (BIT(it->options[1]) & 0xac)) {
 		ret = request_irq(it->options[1], dt2811_interrupt, 0,
 				  dev->board_name, dev);
 		if (ret == 0)
-- 
2.53.0

