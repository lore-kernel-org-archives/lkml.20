Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7833CB542
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898471; cv=none; b=j5AxY3gMRQ2YWC0Ri/BCWuSU9/JFqGbaggfwr5NrEggMKXUES/7iNy1MSMIVWvh83jia2dfvrakKK5PBc5AXvBhLAGgECCiVHxHAHmXVKZwAwMTpbvpq2gmm1q6wgS5hCf4kZNOFAS1td3xpTKDe7FukB9+0EzQlFpDVSYn3AQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898471; c=relaxed/simple;
	bh=SVSInWPRJyBjwoQ0QTfupcQECHuuS8iDMP18hwd5XcE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uw8KT6SOVxt75jd8QIE40EN+S9RGUbmeGixu+r+x5Rf0xv/d2v0y7pcS2Mf2uP8rWlSFpfFB2THWIoXr7EHKtlSlUkIZXmnB2pFydmkQeEZvydMon0KzLne6W8r8UR4E3wM2dqjyqN0EEeE0eC8MWIS81lCSoIag4fUe8MbF32g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LCLnJ7PZ; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LCLnJ7PZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=eb
	sN0gdc01l5iMhk7MDAVgzpXml5i9uBEL/4fYLyJlE=; b=LCLnJ7PZBmhDgHhbZl
	iqAmzipowmZQO2/pamFnQcXn/QJAcf4w00JHUjD2qmJhaKORA/tyTYSAipOIz1lr
	ja6l6PyU0uLp4mPy2ca6JUp5q9mVKwlqHzkmOVWdXjdS4mLGgy4iyq10ztg2E9XR
	DTTYSq4J1MYfmMCvbC4hEeYV4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDnawA4KpFqESiYNQ--.2037S2;
	Fri, 28 Aug 2026 14:27:05 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: markgross@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Li Youhong <liyouhong@kylinos.cn>
Subject: [PATCH] char: tlclk: clear useflags when request_irq() fails
Date: Fri, 28 Aug 2026 14:27:02 +0800
Message-Id: <20260828062702.42981-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDnawA4KpFqESiYNQ--.2037S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF43tFWUtFyUJF1rWrWrGrg_yoWxKrX_Cr
	yrWws7Wr98Gr10kr10kr1S9ryYyFn8uF4kZan0q3yrZ342ya9xGrWj9r1SqF48CrWDKry5
	J397Cr1ayrn7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8aNt7UUUUU==
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC3RmXRmqRKjlALgAA3T

From: Li Youhong <liyouhong@kylinos.cn>

If request_irq() fails after the exclusive open bit is set, clear the
bit so a subsequent open() is not permanently rejected with -EBUSY.

Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
---
 drivers/char/tlclk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/char/tlclk.c b/drivers/char/tlclk.c
index 255f69123af5..355f68d7bf4d 100644
--- a/drivers/char/tlclk.c
+++ b/drivers/char/tlclk.c
@@ -228,6 +228,9 @@ static int tlclk_open(struct inode *inode, struct file *filp)
 	else
 		inb(TLCLK_REG6);	/* Clear interrupt events */
 
+	if (result)
+		clear_bit(0, &useflags);
+
 out:
 	mutex_unlock(&tlclk_mutex);
 	return result;
-- 
2.25.1

