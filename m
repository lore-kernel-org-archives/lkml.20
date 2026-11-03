Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726324;
	b=wBKtQSng3bibs6qs5++v83Xs1tuDR7es2WLFCbNUi8JCbXqQ+En7loIixKq715SrzR2n
	 HtY7N2hBQFw+oGyDJpszHquNqvCIi6w4ZYmP8EoDnzAVxXsCC12xBTkui3Rr4VXBUCl10
	 4w3FPnCpSe2+eysTf4JClU8YU0MWCthJWIE/KG/zQVY+KOHomQpOpIJiZ2ON8d6QwU3nj
	 +urgyxVdj5+0gtZlpUQkRuWNpseojfLwAsGDB+YAVWS+cMjCK59HQGQLGrVJ0fyUna1ma
	 oYTMXaMaTHnpnhwoykYZFVp+tKZEQrJ9IFLkROZeouuNqfm2TuBEB0YKHmV/VcHh14A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726324;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=TeA352CE/Q6hbfepH2zVQnAzyCdZWYcC8v7Bk29Y9r4=;
	b=pRjf72hPxv7h07uGSwNOwWCXbdHOANM2JIh4+7mHekjFIlHOE9Ce/aP3icsnNCIAPk0g
	 ZC+OnnR4jX9NQEVsERNZPUidAUVbQFvRt7AnXX86Y51Fw2dX+5/i3QdAITVOKjCBdt+mu
	 6xo7eUcNoI6a9LLFLLz94mEpiKGoF828sXV/NIs9Go35mWtA7Tpy6gx2A24jQFfqUbLJH
	 fJxMOkA6viMvOAO9oyUoTlx18708b8Z7PSSr9KEcPv3U+/ormUK61aHWmibnkHyN3RKqK
	 jQQIHQxGFJ0qlx922G2ZADraLbudAocbTeNEBaOGpaZ4DIIGQ+gzFONbLbUhuIjCFug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stu.shzu.edu.cn;
	spf=none smtp.mailfrom=stu.shzu.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBA1606A32D;
	Tue,  3 Nov 2026 17:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DBA1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.shzu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.shzu.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.shzu.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=TeA352CE/Q6hbfepH2zVQnAzyCdZWYcC8v
	7Bk29Y9r4=; b=bJaC1QJn5q0/V0DOZF1qVenAP9xYvFS5D8CK0v3Norkq+RF3ij
	9M2jZV6XK32v50NsFkGaUUp6O62nEifj6li/PDvO3Ff8woqOzXFBXpCla0+Jn2vy
	H50b8rRkBmtRp+iv3vXfsF8H70nl0CcLpT481BVbDSV13dG1QiMyToIrU=
Received: from kernel-build.. (unknown [124.119.50.14])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkD2+fxpF+pqV5MfAQ--.29090S3;
	Wed, 04 Nov 2026 01:18:39 +0800 (CST)
From: Wang Xiong <20221010117@stu.shzu.edu.cn>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: gspca: konica: skip button release after input disconnect
Date: Tue,  3 Nov 2026 17:18:31 +0000
Message-ID: <20261103171833.6136-2-20221010117@stu.shzu.edu.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103171833.6136-1-20221010117@stu.shzu.edu.cn>
References: <20261103171833.6136-1-20221010117@stu.shzu.edu.cn>
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
X-CM-TRANSID:BbQMCkD2+fxpF+pqV5MfAQ--.29090S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr43ury5KF4fCw1fArWUArb_yoW8AF1rpa
	93Aay8J34fKF1DCa1qvFyUW3W5Ka93Z3y5Jry3K34fZF13uFyDAFZ5ta4jgrW7J393Aw4I
	vr4DXFZ8CF4qvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPjb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Jrv_JF4l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY
	1x0267AKxVWUJVW8JwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv04
	87Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwV
	AFwVW8MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUxGQDUUUU
	U
X-CM-SenderInfo: qsqsjiyqrqiiux6v33wovk63oohg3hdfq/1tbiAQUGCWrp+NUZaQAAsV

gspca_disconnect() clears input_dev and unregisters the input device
after killing the transfer URBs.  An open video file can outlive that
disconnect, and its final close can still call sd_stopN().

If the snapshot button was pressed when the device was disconnected,
sd_stopN() passes the cleared pointer to input_report_key().  An
archived KASAN report shows a NULL read in input_event() from this
Konica stop callback.

Report the release only while an input device is registered.  Clear
snapshot_pressed in either case so the state does not survive the
stopped stream.  This addresses the input event access; the separate
USB parent lifetime problem is not changed here.

Tool disclosure: OpenAI Codex assisted with static analysis, the code
change and this message.  It was asked to check archived Konica USB
disconnect reports and prepare a minimal lifecycle fix.

Signed-off-by: Wang Xiong <20221010117@stu.shzu.edu.cn>
---
 drivers/media/usb/gspca/konica.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/konica.c b/drivers/media/usb/gspca/konica.c
index 53db9a289..017266d73 100644
--- a/drivers/media/usb/gspca/konica.c
+++ b/drivers/media/usb/gspca/konica.c
@@ -242,11 +242,11 @@ static void sd_stopN(struct gspca_dev *gspca_dev)
 #if IS_ENABLED(CONFIG_INPUT)
 	/* Don't keep the button in the pressed state "forever" if it was
 	   pressed when streaming is stopped */
-	if (sd->snapshot_pressed) {
+	if (sd->snapshot_pressed && gspca_dev->input_dev) {
 		input_report_key(gspca_dev->input_dev, KEY_CAMERA, 0);
 		input_sync(gspca_dev->input_dev);
-		sd->snapshot_pressed = 0;
 	}
+	sd->snapshot_pressed = 0;
 #endif
 }
 
-- 
2.47.3

