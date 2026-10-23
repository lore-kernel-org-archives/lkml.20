Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792724149;
	b=r712CcZDu1LPSyuoNLUseSV8vVkFIax+ouv4J3Ejjap6XOAlHPLGGkg6fPysnpZZ0iKh
	 6wVxZOWWo4l/Gn1JWL6ucgGTdg1yihfuAkDPyUrBtnZAtMDqrD+8WqOJkNkX9kUWBrmJH
	 FVDDiw57/sgsXW2oZjiYIJ63EWrFzrmWjAA/hVE3l4iF0b4Xdfvsjjmv8GFa/8QikYb3f
	 bG8Q3uIuq1TaCsNXqwQJvdOK5BOoOIIzHZ+UGwthNBxXRu5RXcUNNU2etILhvuvK09r+G
	 bL+RqrbAWYZx8i+l4MNgdRCTUyxYa14FKNBY7qeQXxHgkwNZuhXlZQEYHJ78EhiPOwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792724149;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SS6LSQu+7ZEQ10XZwp/2Uy+ApLbTP3Wa2XF8th9Yq4g=;
	b=NVB78YhP1cO4u0o1wd258SHJh4FwrdfHLf6B01v9LKf954FmmJL3hM/xgQ0RlFZWKOD3
	 mvOGx26V2uax5/AvbayEcMJZbkUMTsqM6InRFVheQXYKSmVxJnTaDtiV78ObjStGjOxdc
	 qtZIUgZ69NpelBxM/pqzx/s2WOXr6BmiZZpfkdnuxpaJbEAE2L/8JX0yu/6CmNJ+RWSjQ
	 DQ35WhHQihyg2EPenBjuf9oDU0ArRRqMb9i/xwhJGD6oajmxR5jJgXrGtnxiaN7GrxnoB
	 SFUemds70JkQ7IklFhMS/C1vX4aW+6FxHSS83kSAREOmswplocRk++dPwOTUfHeAbPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=N+Bz00Tc;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBE6606A31A;
	Fri, 23 Oct 2026 02:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BBE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=N+Bz00Tc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=N+Bz00TcuZdRJ0TMKdPj2gcqdlBlrgOap2tWvjTfIeDF1VAsTi0bBhUv0Q4iZWKavS3Vqb104vgfd
	 JEl+8WXeLAVmFzcR9Vi4AHiyqnSLS13o3SqKM5W7Hhefjh2fR/XtKqp0uFHGt7kr5IIj61Kw+/628M
	 De5HNzWa5JfJbgJc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36adacca9eb4-008f2;
	Fri, 23 Oct 2026 10:55:39 +0800 (CST)
X-RM-TRANSID:2ee36adacca9eb4-008f2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96adacca755a-30b50;
	Fri, 23 Oct 2026 10:55:39 +0800 (CST)
X-RM-TRANSID:2ee96adacca755a-30b50
From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
To: linux-media@vger.kernel.org
Cc: crope@iki.fi,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+ed3ada41c4eb1c4ab78e@syzkaller.appspotmail.com,
	Zhao Feng <zhaofeng2@cmss.chinamobile.com>
Subject: [PATCH] media: dvb-usb-v2: ec168: reject zero-length I2C reads
Date: Fri, 23 Oct 2026 10:55:35 +0800
Message-ID: <20261023025535.90-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

ec168_i2c_xfer() validates the length of the write-phase message of a
combined write-then-read transaction, but not the length of the
read-phase message.  A userspace I2C_RDWR ioctl on the adapter's
/dev/i2c node can therefore pass a zero-length read message, which
makes ec168_ctrl_msg() issue an IN-direction control transfer with
wLength == 0.

The USB core treats a zero-length control transfer as OUT-direction,
so it detects the pipe direction mismatch and emits the "BOGUS control
dir" dev_WARN_ONCE() in usb_submit_urb(), which panics on systems
running with panic_on_warn.

Reject zero-length reads the same way the driver already rejects
zero-length writes.

Reported-by: syzbot+ed3ada41c4eb1c4ab78e@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=ed3ada41c4eb1c4ab78e
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
 drivers/media/usb/dvb-usb-v2/ec168.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb-usb-v2/ec168.c
index 0e4773fc02..c45bebe5af 100644
--- a/drivers/media/usb/dvb-usb-v2/ec168.c
+++ b/drivers/media/usb/dvb-usb-v2/ec168.c
@@ -115,7 +115,7 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 	while (i < num) {
 		if (num > i + 1 && (msg[i+1].flags & I2C_M_RD)) {
 			if (msg[i].addr == ec168_ec100_config.demod_address) {
-				if (msg[i].len < 1) {
+				if (msg[i].len < 1 || msg[i+1].len < 1) {
 					i = -EOPNOTSUPP;
 					break;
 				}
-- 
2.39.2


